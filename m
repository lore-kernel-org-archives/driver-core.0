Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAA936894D;
	Sat, 20 Jun 2026 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781981409; cv=none; b=OLlFfj/BPj7xcXAwfvEBTB8aSuVrXpE7MQGBhbpi1D3YX6jRmCVvLAHCLKjTbgOz54Z9debnCI1DcfcmaiKaRTYurv+MZHFmmEVDTPB07nGxppC9rgw4wWjrqWTzuO1tNuZSAXnp7/qTjzY+Rs1HVjavbFjBbomw/U+ZrEiSlFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781981409; c=relaxed/simple;
	bh=g8MKRFwKMCc67a3jht5PEUuEoMM4Bg+VgwxCDZQCAEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HGU4cG7gaBhde32wTwvrTZb6I/YOLcihQ5ChqHT6U6qtcio2/o3ZMRZzr5YuXIrm9bb9TKq1W/MnngLmILxBIPZUcAKldLywcSoJOhpxq52vjlPVHIvxo5IvCkF1EmbA0/SO957b8RQrThyOJTraubtZiWq6EKTYh/ZgCKFFtXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtJsC2Dq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtJsC2Dq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42A11F00A3A;
	Sat, 20 Jun 2026 18:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781981408;
	bh=uwuuXgHO2JTFoJ0ewCiJOUWkff+XgtmumF2tliuV7sM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NtJsC2DqPF6hE6KJTTIQCPqpx/kWHoFVFfINdCUQDHlDCBRVyeKgJVYBtHmxN4sSg
	 OnluEEVdFWMfga4KJnl2iHE64BnHd2ikFIVKuun1CSlpjH7QISKsQla7t3MVLmgc2u
	 dhfC8Knd/1HiAJQT/xLUIo0+dl3xebaVKbqwnMhnB6a9dSEQUdWpCaZKyCfAxWgZMI
	 jOiCNj+h2up/9RYfSMLDojLaYx+WRIbtlQkvYSpqhgYASf6K0+NrOKMASYxEgEDxa1
	 K9SdUBuEymVWaYtLMPb4Fj503KIeTLkIpINdaXUP8InVadGfpS8GR4SvVEnvQIVxDn
	 R1h02pPRIRQ9Q==
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
Subject: [PATCH v4 07/16] rust: drm: split Deref for Device context typestates
Date: Sat, 20 Jun 2026 20:48:00 +0200
Message-ID: <20260620184924.2247517-8-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620184924.2247517-1-dakr@kernel.org>
References: <20260620184924.2247517-1-dakr@kernel.org>
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

