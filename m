Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68D3C3F0A92
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749957; cv=none; b=bArwoXnopZQETYSLM3g7CgItC4kCEzPJlCcbGD4CfSIIADtuPjYovEuZh9C/6wfwLfl0XecOhB3GSup45h8EvenC4ff4+QkiJjHNQeqwlsNsTkGQIFg+kOrFxxNBqaoI8eesbXzoJOOwuscJ6awXi5KfzRS6DQpRDA7fe8NTs4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749957; c=relaxed/simple;
	bh=ivvuNl1kIvjfNLJisWIJ37xnmxyBhBZ5jrVN3aFoMqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T2QbOqolic64Ep0ucaZTvhvAgqc7otG+X0uv/awPwwiajhd3sWgrUqS7qs/zvpwEXLmDOSrDI3M6oBaKG6lfOgBwcz2AEN+iU0XU3d1TEoDsMlffSWR7KAa7BcFnkUE3fDTk5gD3IKpOlDd4xzEzNEuyGtaOwzGEkX3+RX1sBb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=nPwE1PZj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="nPwE1PZj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF74F1684;
	Wed, 26 Aug 2026 06:12:25 -0700 (PDT)
Received: from e143943.arm.com (unknown [10.57.1.236])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F21C3F66F;
	Wed, 26 Aug 2026 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787749949; bh=ivvuNl1kIvjfNLJisWIJ37xnmxyBhBZ5jrVN3aFoMqM=;
	h=From:To:Cc:Subject:Date:From;
	b=nPwE1PZj/o2dhKHiiG5SsQ9UX5fpzcHLOh6jLD1t3JpRU5sdp28XTm/aRzWbif8h4
	 sfnQr1KTuxyvssPmM8bOck9lOyuNsFUrRkS7I3STkv3qPfYyAVFjkn07FLGrGGc1fw
	 qwBsvE8iN8Qya0Gm4nUHxtkzz9bJQaynM/IxCZQE=
From: Beata Michalska <beata.michalska@arm.com>
To: ojeda@kernel.org,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	boris.brezillon@collabora.com,
	work@onurozkan.dev,
	samitolvanen@google.com,
	acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 0/3] Rust: add runtime PM support
Date: Wed, 26 Aug 2026 15:10:54 +0200
Message-ID: <20260826131213.1820408-1-beata.michalska@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial Rust support for Linux runtime PM.

The concept for Rust abstraction gets introduced in the first patch.
It provides callback registration, PM callback dispatch through PMOps trait,
scoped request helpers for common runtime PM operations and configuration
helpers.

The abstraction intends to keep the request semantics aligned with
the C runtime PM core.

Second patch integrates dev_pm_ops into the Rust platform driver abstraction,
enabling drivers to register PM callbacks with the core.

The last in the series is provided for demonstrative purposes
(not intended to be an actual merge material).

This has been lightly tested with the Tyr driver.

It is based on Danilo's drm/file branch [1]

---
v3:
- Dropped macros in favour of plain encoding of the PM callbacks
- Moved Mode to use kernel::impl_flags
- Generated PM callbacks, the stored payload, and the device cast
  are all monomorphized for the same (Adapter<T>, T) pair,
  with the registration sealing the contract by validating installed dev_pm_ops
- Platform PM wiring should be type-safe now
- Tracking runtime enable/disable state
- Few fixes for issues pointed out by Sami Tolvanen (samitolvanen@google.com),
  like making the registration teardown respecting the CONFIG_PM settings or
  fixing AwakeScope for async/no wait calls; Sami is also the person behind
  adding get_if_active variant (much appreciated)
- Changed base branch
v2:
- Moving away from the old PMContext<T, Dormant/Active> type-state design
- Introducing an explicit Registration<'a, T> object.
- PMContext now carries a lifetime and is derived from the registration
- Callback data is no longer recovered through driver data
- Simplified PMOps
- Runtime payload handling change
- Request helpers slightly extended

---
[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=drm/file

Beata Michalska (3):
  rust: add runtime PM support
  rust: platform: wire runtime PM callbacks
  drm/tyr: enable runtime PM

 drivers/base/base.h             |    3 +
 drivers/gpu/drm/tyr/driver.rs   |  123 +++-
 drivers/gpu/drm/tyr/file.rs     |    3 +
 rust/bindings/bindings_helper.h |    1 +
 rust/helpers/helpers.c          |    1 +
 rust/helpers/pm_runtime.c       |   44 ++
 rust/kernel/error.rs            |    1 +
 rust/kernel/lib.rs              |    1 +
 rust/kernel/platform.rs         |   30 +
 rust/kernel/pm.rs               | 1079 +++++++++++++++++++++++++++++++
 10 files changed, 1262 insertions(+), 24 deletions(-)
 create mode 100644 rust/helpers/pm_runtime.c
 create mode 100644 rust/kernel/pm.rs

-- 
2.43.0

