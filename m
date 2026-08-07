Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A033938E;
	Fri,  7 Aug 2026 16:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121580; cv=none; b=V45Epn1kddNRgUw6CthLrL9cYRngZCvat6zj93pesopNg7emFVjZgbOXtp5bbFAyGPpyVnoaXeEOQSDE1BCTJuVzye8+KAvBfuKCLdB3h6Nyp49DDJOGkRgqE2hyZNCRKaR5ZxophLXTbDAYGlLUQTJB7Ghxnaad2h1SkYY0ZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121580; c=relaxed/simple;
	bh=Qv04C6ct5VrQ6eJI8/ymEsIuunUr2fZ/vxqBX/Gg1bo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rVJdXVPGGe6L69C70ACuFZq7Ew9tAy/Gfxa017S9idvnkoAbTiRe7Zua/WHQpIosg0LpooylgCb9eBrf7jF4ny09W5Tkzn9psebK5ZYT54uE3n/Anri2pd85UzwdYzACSfUnyIV5NGMzm1i768VIQiRrcPKdD5mgdXs/GCJhhNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kcf2dGFB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kcf2dGFB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772B61F000E9;
	Fri,  7 Aug 2026 16:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786121579;
	bh=DREDuwvVGBE+IWhTLNytmzucz0eD0PiRR2H2nTuH9Yw=;
	h=From:To:Cc:Subject:Date;
	b=Kcf2dGFB5VEIugLtsZwZgXIFRM2IiNjiGxBLAWIvv/tQTVyGrqavZy7yuuymfRxpl
	 Qg2oEF+O2hzH+yFejDDXZi+BIv0WJDN8oYxV8chXTTWpPG+zTDa2snEBmcVOk1Ppbg
	 9DN2L3f5XB5u3oLHzlC2O6mv+YMs3osPXeDtbyipoCGCbZxLcjBcELl8YQZx+V0z4a
	 8gmNzDrK5GLPhtc7uLNRj0A7YYXcjqvcmXduLdaIHT3m1zKae9RjsbN8sj2N9Th+ES
	 6KCUWJJdZkLiViT9gSbsieyQW065Ym6iU3lrriL7n/tky0yk3m+HWe2RY980p3hUvp
	 UwQTTmFKVCnmQ==
From: Danilo Krummrich <dakr@kernel.org>
To: tj@kernel.org,
	jiangshanlai@gmail.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/6] workqueue: OwnedQueue, ScopedQueue and ScopedWork
Date: Fri,  7 Aug 2026 18:52:43 +0200
Message-ID: <20260807165252.3849875-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series extends the Rust workqueue bindings with the ability to create
custom workqueues, enqueue non-'static work items on scoped queues, and
introduces ScopedWork, a work item type that cancels synchronously on drop,
allowing drivers to use workqueues with lifetime-bound data.

This picks up and extends prior work from Alice [1] and Onur [2]; changes I
subsequently applied, if any, are documented in the corresponding patch.

I also added a patch to replace the deprecated system_wq with
system_{percpu,dfl}_wq, which I originally sent with the WaitQueue series [3],
as it makes a bit more sense in this context.

[1] https://lore.kernel.org/all/20260312-create-workqueue-v4-0-ea39c351c38f@google.com
[2] https://lore.kernel.org/all/20260617144645.253444-1-work@onurozkan.dev
[3] https://lore.kernel.org/all/20260726223613.1242940-3-dakr@kernel.org

Changes in v2:
  - Merge scoped_work.rs and scoped_queue.rs into scoped.rs
  - Introduce ScopedWorkRef<T> and wrap it in Opaque inside ScopedWork to avoid
    &mut aliasing in drop
  - Pass &ScopedWorkRef<Self> to ScopedWorkItem::run to enable self-re-enqueue
  - Add Deref<Target = Queue> for ScopedQueue; remove duplicate enqueue_scoped()
  - Add Send + Sync for OwnedQueue
  - Fix stale workqueue::system() references in docs
  - Drop Work::cancel_work_sync()
  - Make sysfs() available on ordered workqueues
  - Add #[inline] annotations throughout

Alice Ryhl (3):
  rust: workqueue: restrict delayed work to global wqs
  rust: workqueue: create workqueue subdirectory
  rust: workqueue: add creation of workqueues

Danilo Krummrich (2):
  rust: workqueue: replace deprecated system_wq with
    system_{percpu,dfl}_wq
  rust: workqueue: add ScopedWork for non-'static work items

Onur Özkan (1):
  rust: workqueue: add ScopedQueue for lifetime bound items

 Documentation/rust/testing.rst                |   2 +-
 .../translations/zh_CN/rust/testing.rst       |   2 +-
 MAINTAINERS                                   |   1 +
 drivers/android/binder/process.rs             |   4 +-
 rust/helpers/workqueue.c                      |   7 +
 rust/kernel/sync/completion.rs                |   2 +-
 rust/kernel/workqueue/builder.rs              | 389 ++++++++++++
 .../kernel/{workqueue.rs => workqueue/mod.rs} | 149 ++++-
 rust/kernel/workqueue/scoped.rs               | 568 ++++++++++++++++++
 9 files changed, 1089 insertions(+), 35 deletions(-)
 create mode 100644 rust/kernel/workqueue/builder.rs
 rename rust/kernel/{workqueue.rs => workqueue/mod.rs} (90%)
 create mode 100644 rust/kernel/workqueue/scoped.rs


base-commit: b48373c901951fad1a26bd7c33ad91172b3945b5
-- 
2.55.0

