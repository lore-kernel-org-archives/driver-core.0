Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA972036E9;
	Wed,  6 May 2026 22:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778105438; cv=none; b=f82+B6Y5MQMHaDwE0XGYwUWI3q4Y/EUn6NWanr6fmejoIUhT1D6zoXziNdNCmP41kcZo5OT4VynH38t8RmQ5THX0Di5Ikp7igdo+g0LZqt2dnAYawCen63yUC8QfGHKNPS/G/Xwkv9ff6CvMR0PMAgFzybbBROwVYfZZr8XmZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778105438; c=relaxed/simple;
	bh=wIb27fgE7wEMQLxtUmbxgRPah5fDXVsjpjKKLmGMqOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OHN1/ystgmLzQsSynDFcxa81R/GdRuLHhm29isiikEkj1SAZVtcSpOY2xGsBnR3h/FrIQjB7NMecp0zTdxsY79rB6n/ptGKh8HnRR99foJmN+uGKyOM1/pU/EXqR8PLejqvBGSYAcZllui1jrCoW4eTOeEFIWdUFqQ454BdMwyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TvgerBoz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TvgerBoz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67F7C2BCB0;
	Wed,  6 May 2026 22:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778105438;
	bh=wIb27fgE7wEMQLxtUmbxgRPah5fDXVsjpjKKLmGMqOo=;
	h=From:To:Cc:Subject:Date:From;
	b=TvgerBozD9svzBlBATfugEciTLNBnvdM2jOeDSDwhSIRI24OxD7l7sraw4fy8C3Az
	 LUgwrzoyWvpyKQMgcRgFAJ1uf33s3bDM36/jqheezxe5IT+6jUFtkWXultQpdquPMq
	 SPaWgJCslnrh8bCYwB3cjPOLw/iEusZJ8w/KbnpNkhbh/kVjOa8WGK+Sk8TuuqLcdG
	 Wo8GkuEwzfjNf7TvuWgkPWN5uTUGIDvKZdbrjamLvindP7JpbX89VS4MNm+5YoYrl7
	 QIWkuLX0/hNLSYJSyatT5aEGjyWRjAqKDog0RUKYeE1QcaEgOpEJKFGgq5/2VAYX+/
	 dgGwGtWXnbvGw==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	apopple@nvidia.com,
	ecourtney@nvidia.com,
	deborah.brouwer@collabora.com,
	lyude@redhat.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
Date: Thu,  7 May 2026 00:05:58 +0200
Message-ID: <20260506221027.858481-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRM ioctls run in process context without any guarantee that the parent
bus device is still bound. This series solves the problem by introducing
UnbindGuard -- a guard representing a drm_dev_enter/exit SRCU critical
section that proves the parent bus device is bound for the lifetime of
the guard.

On top of that, add RegistrationData as a ForLt associated type on
drm::Driver, allowing drivers to store data whose lifetime is tied to
the parent bus device binding scope. The data is allocated in
Registration::new(), lifetime-erased to 'static for storage, and made
accessible through UnbindGuard::registration_data() with the lifetime
shortened back via ForLt::cast_ref.

Also update the ioctl dispatch macro to wrap every handler in an
UnbindGuard, returning ENODEV if the device has been unplugged, and
pass both the bound parent bus device and the registration data as
arguments to handlers.

This series is based on [1], as well as Lyudes drm::DeviceContext work;
a branch with all patches can be found in [2].

[1] https://lore.kernel.org/driver-core/20260506220012.855173-1-dakr@kernel.org/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=drm-lifetime

Danilo Krummrich (6):
  rust: drm: Add Driver::ParentDevice associated type
  rust: drm: Add UnbindGuard for drm_dev_enter/exit critical sections
  rust: drm: Add RegistrationData to drm::Driver
  rust: drm: Wrap ioctl dispatch in UnbindGuard
  rust: drm: Pass registration data to ioctl handlers
  rust: drm: Pass bound parent device to ioctl handlers

 drivers/gpu/drm/nova/driver.rs |  14 +++-
 drivers/gpu/drm/nova/file.rs   |   8 ++
 drivers/gpu/drm/tyr/driver.rs  |  12 ++-
 drivers/gpu/drm/tyr/file.rs    |   4 +
 rust/kernel/drm/device.rs      | 134 ++++++++++++++++++++++++++++++++-
 rust/kernel/drm/driver.rs      | 100 +++++++++++++++++++-----
 rust/kernel/drm/ioctl.rs       |  17 ++++-
 rust/kernel/drm/mod.rs         |   1 +
 8 files changed, 258 insertions(+), 32 deletions(-)

-- 
2.54.0

