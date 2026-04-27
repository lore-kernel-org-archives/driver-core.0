Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF826F2BE;
	Mon, 27 Apr 2026 22:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327810; cv=none; b=uTZ4xf9jKLCcUh+GwINF/g6oldQcQ6lxy3520+9U8j7cO4DgUTpZCRgi0eF0luZM6wBWoViq2tOLHZvopbEhsCm5yo5RSpg8k8N5GO5bAzhrcBJPPMKzpZvJkH7GA0ZZFtnw8wXR6VBa4ZfvjT7RZ6N8t7NTT2N0XvmEMbZpw0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327810; c=relaxed/simple;
	bh=RhmjGyyC7zIoDOwBCTiwM6xx+/W2gzJoXMpyzbXHsLE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c8oXkXOcDwi1o9A9mfYyIp59ozuC9lYaDIwFx8tg+bKqzhn8L4edsbnHqMex/p6kFyqp750LGXMcRxPMZypgmrmzNOMwhUWo6tds/9NTRqjQXzFv/A30W/feXyUjAvaF1lsDsiUhC5UUTVMTTu6lLhYZ8XuMsyg5kqh2iN/NGKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEl5bVKN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEl5bVKN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89BFC19425;
	Mon, 27 Apr 2026 22:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777327809;
	bh=RhmjGyyC7zIoDOwBCTiwM6xx+/W2gzJoXMpyzbXHsLE=;
	h=From:To:Cc:Subject:Date:From;
	b=hEl5bVKN4WCrK3inmbbdsojOPaPGka3q3/12uffAJq7M2Pj+MmebOoqXkcL/apLEQ
	 wHyY/d1q951HKJB+NzvBZ9sgoj50gtGZbpdm2mLeAvyFILb03mPXDZaOP2K8kACRA3
	 Hdm93IQdoi0lTExG6kBbd2CVa2wGZleTFe++y5RqxGZ70zCdO+uqmdfMAbvmzVt4SL
	 eWHCHD4LM4IX8htp8lCaFmm0WCBOHvCKbdBeryZW3xd36LTn+iwQ9Ew2O0KJzh0qBl
	 WwBt4G0dEasoMgdHDDzuxMKzt6C7nP5CkF/2VP5ctScmfFl1QRc0ENvizO0S7Re+Dx
	 CrggkhI3g0VLQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/2] rust: auxiliary: replace drvdata() with registration data
Date: Tue, 28 Apr 2026 00:09:39 +0200
Message-ID: <20260427221002.2143861-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When drvdata() was introduced in commit 6f61a2637abe ("rust: device: introduce
Device::drvdata()"), its commit message already noted that a direct accessor to
the driver's bus device private data is not commonly required -- bus callbacks
provide access through &self, and other entry points (IRQs, workqueues, IOCTLs,
etc.) carry their own private data.

The sole motivation for drvdata() was inter-driver interaction, e.g. a parent
driver deriving its bus device private data from the child driver via the
auxiliary bus.

However, drvdata() exposes the driver's bus device private data beyond the
driver's own scope. This creates ordering constraints -- drvdata may not be set
yet when the first caller of drvdata() can appear -- and forces the driver's bus
device private data to outlive all registrations that access it; a requirement
that causes unnecessary complications.

Private data should be private to the entity that issues it; bus device private
data belongs to bus callbacks, class device private data to class callbacks, IRQ
private data to the IRQ handler, etc.

This series replaces drvdata() with a dedicated registration_data pointer on
struct auxiliary_device. The parent stores its private data explicitly during
registration; the data is private to the registration and lives as long as the
Registration object.

On teardown, Registration::drop() first triggers auxiliary_device_delete()
(unbinding the child), then frees the registration data. Ordering constraints
are structural -- the child's lifecycle is scoped to the registration by
construction, not by convention.

With no remaining use case for drvdata(), drvdata(), match_type_id(),
set_type_id() and struct driver_type are removed.

This is a prerequisite for [1], which builds on the removal of drvdata() to
enable Higher-Ranked Lifetime Types (HRT) for Rust device drivers.

[1] Posted as a reply to this series.

Danilo Krummrich (2):
  rust: auxiliary: add registration data to auxiliary devices
  rust: driver core: remove drvdata() and driver_type

 drivers/base/base.h                   |  16 --
 drivers/gpu/nova-core/driver.rs       |  10 +-
 include/linux/auxiliary_bus.h         |   4 +
 rust/kernel/auxiliary.rs              | 208 ++++++++++++++++++--------
 rust/kernel/device.rs                 |  60 --------
 samples/rust/rust_driver_auxiliary.rs |  40 +++--
 6 files changed, 180 insertions(+), 158 deletions(-)


base-commit: a7cc262a11354ab104b8e55c21200d099d141bc7
-- 
2.54.0

