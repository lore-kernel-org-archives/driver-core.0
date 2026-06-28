Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19113B1EC6;
	Sun, 28 Jun 2026 14:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658492; cv=none; b=VJp9W7/Uq1LjbC3u/vq9p9FqB2atxWPOxUoZ5Tx+QqtGWxtErYeaU22WjNKub2v8TdqemLSDOgJ9IXYSEKDSKATrMyfj/E6nJFv0kS5VZMDc3LGbPLjyuwKgIPpnLuNhWXwRKSqeha7Lt68PH4mwxX0MS/4TpBrPSPqaWwU29Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658492; c=relaxed/simple;
	bh=pHZTQPDKzUcOu4kPoQIL3MokirRLwTIKSuaFvwtB3Bw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAaXFUADpU8/55p1TQZH6JRjyNtr7UXRCYPlNJa6hTCz4XIt5sN+nu3jYKw/CX2YwOwaKSXbQIX4rjVt/lM65lkB05qgc0bydV/goJK/h8J+SuzSb/mLXrdMjiBHeG5gE6Zi5jAATCYSXMiIsXzupBy0QnDHImYcI/Utpbq1jBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhC6S3ZE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhC6S3ZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75071F000E9;
	Sun, 28 Jun 2026 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658491;
	bh=0nDjy07ax4ZT73XGf3sgGXI/MEYdniVyQ98WeLPrXdA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jhC6S3ZE031SbkjxsWhDdNkHIX3Nv+Nn9YWFgyt6UWONhUtLpQc7Z0FebZ4zAapcZ
	 Q/SyO9mxZ03X2/JqsGlr3qSaJAff3VBAecHC0tvbBY6Yf53l2l7BzdhsuWtCIOAC3W
	 grsUO5Z6yK4dArxoHYErMydO6Py9mEKnAM0Xk2cYkMn81wEkxbCppf8E2lNGXvyA6t
	 Bjpl6WZqxjh20kP/OUp3Uduyhq5Mw1fTSJ9kruI9mu2aZUrJ7/QyZe9sb1UiHuOC1F
	 h/Fm24PkWL58W4lNkYio0Ln6NuwK4SC0rBDd/cM7hUd/SR6C2Y/lHOH5a0d6tKYZBr
	 nwy4pjoC9o2Mw==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ecourtney@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	deborah.brouwer@collabora.com,
	boris.brezillon@collabora.com,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v5 09/19] rust: drm: split Deref for Device context typestates
Date: Sun, 28 Jun 2026 16:53:29 +0200
Message-ID: <20260628145406.2107056-10-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628145406.2107056-1-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the Deref implementation for drm::Device by context:

  - Device<T> (Normal) dereferences to T::Data.
  - Device<T, Registered> dereferences to Device<T> (Normal).

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 6f3af46ff647..86a7fca1d33f 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -79,6 +79,9 @@ macro_rules! drm_legacy_fields {
 /// - [`Normal`]: The general-purpose, reference-counted context. A [`Device`] in this context may
 ///   or may not be registered with userspace.
 /// - [`Registered`]: The device has been registered with userspace at some point.
+///
+/// `Device<T, Registered>` dereferences to `Device<T>` ([`Normal`]), so any method available on a
+/// [`Normal`] device is also available on a [`Registered`] one.
 pub trait DeviceContext: Sealed + Send + Sync {}
 
 /// The general-purpose, reference-counted [`DeviceContext`].
@@ -320,7 +323,7 @@ pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewC
     }
 }
 
-impl<T: drm::Driver, C: DeviceContext> Deref for Device<T, C> {
+impl<T: drm::Driver> Deref for Device<T> {
     type Target = T::Data;
 
     fn deref(&self) -> &Self::Target {
@@ -328,6 +331,17 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl<T: drm::Driver> Deref for Device<T, Registered> {
+    type Target = Device<T>;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The caller holds a `Device<T, Registered>`, which guarantees all invariants
+        // of the weaker `Normal` context.
+        unsafe { self.assume_ctx() }
+    }
+}
+
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
 unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
-- 
2.54.0

