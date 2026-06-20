Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60281F7916;
	Sat, 20 Jun 2026 00:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781917168; cv=none; b=P6qC3YBVn12ZL1DV5ubBOfGj4OSIn9onIDF8J2IX/bh0H0b9PqLhNXboDWzP+8oHU346mOmvJILW0BjvGWddocRutpPSuHZRzqM9JRfjpA3d3k6QvslTpQEZdjmENTxcCFwbFZWknLrsWgaI04HkKZfa0fDJ5dDoNEo1J5DwyvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781917168; c=relaxed/simple;
	bh=g8MKRFwKMCc67a3jht5PEUuEoMM4Bg+VgwxCDZQCAEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJtkQLvROHssEpL9OWzKCwSRVDCAlfONXGLHVEqKk6GAgr96Pb+LgIet6MVGvuyACNGRGlzFjVxsFIEjY33SK8qR+CfJ7XWc3H2Ot96AXqfUxEqyu1mJgrA80vQgthuyWFe7cg8PCcl5TeM7QFUWkbSRxbHrrc7xzuE3xREIQxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lgfdry13; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lgfdry13"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24DE1F000E9;
	Sat, 20 Jun 2026 00:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781917167;
	bh=uwuuXgHO2JTFoJ0ewCiJOUWkff+XgtmumF2tliuV7sM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Lgfdry13o2Ce9SlwsEXZZZ1fcvvRDIvEWtAF19mS5aDw8mN30zA64hxFs+edTkoL9
	 EXq7o9PxLfsiqBjMF4tW+KWKjc510jzcEzBxgDeyDxrFB3s6zkWSIjVthkqJGPxTox
	 ScN0Uy3RNdu90I5Rwez6wYuJuJ62IpW/MC2YoUzA24MUq65WVOEEL48wsrIM6CprQX
	 9+TqVTCA/75n2QjG4H71DAwEGBe4E7yFnuSvVODcfuDwCp8kZHXLzb137gfdFTPT8u
	 OCHY6mo8LLH5Wth/U27yJUw4DcPEI0mgApNEN3r8QQoreP0yjxAXRCoT4MVU9hhi1K
	 NzxvyhTzO23DQ==
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
Subject: [PATCH v3 06/13] rust: drm: split Deref for Device context typestates
Date: Sat, 20 Jun 2026 02:51:18 +0200
Message-ID: <20260620005431.1562115-7-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620005431.1562115-1-dakr@kernel.org>
References: <20260620005431.1562115-1-dakr@kernel.org>
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

