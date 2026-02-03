Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85623BFE4B
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133602; cv=none; b=XzlUsnWOl1Kvuj8f62UjB8ccZC50phby6PBcqWxmkJ2iNdvl40yHuA2Rr3V5uJb8RbgLOGJf07YTVPHdHUXRxNlLS2fwDgRvLF6W0nAOT7Xyfs+iL6nIltzSF1f7l9z2UKPGf/qWjtSvy3pGmVr8MnRqLUci2CE7LdN5m22llyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133602; c=relaxed/simple;
	bh=B6pUx1j5pFgygp5i69R4pVf7HKotofgGAbGCOoefnlg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DuMOloxTfB0m15KmEdM3vozNCebvIAjcEtryP1Hgv+UY1BGzBinf+U6z/G+uI7O3wgZ/WTUm/tcBnACaeq765xknL7uP+zsP7190qq9vw9n2xHLbIF9FKGNb6Z4CEW0IFqSbDOmfyx7IktOwQE9oLsPUGLrkbwtuhguJ1wIlntI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zl6/5gyS; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zl6/5gyS"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b74aff34efso10550085eec.1
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 07:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133599; x=1770738399; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3QkppxUftz38QVidHBNdTmT2F8VCX5EZWUQmqLBEfqQ=;
        b=Zl6/5gySeePTy29KyglH4IAVLZFiok17TFsD0P9lYY1Oy387pauxG6DDBjB/UxIegy
         G6dV62Yc4i2WmaLvfZvLEBN28ksYpXhqdYFUBsRN4IHG7zROcMzeqdAy25Td4w51TF7M
         1pdlHNxRKZgtt0yMcmY2HFSS6zmK20OK9c4Fn1skMndrhcAVrsPnK+K2pes8T/kG3Ut6
         dv0yP/TmZ+Wp/1Eu+V83urmPATEnNJVd9h57TCOX91JrTtw3NTiudcAVIMPoWdGrckf/
         Zc66dyjIHuFGiyGsDNBoXnGxSQd70QpGjnnmgGvSupMAMFU3nwI2UzUCb9xHytPMk5v0
         X0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133599; x=1770738399;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QkppxUftz38QVidHBNdTmT2F8VCX5EZWUQmqLBEfqQ=;
        b=rdAndJrhz9+IoRGw3xZZ2kjh0Mi5WCE+sQWJyYM5Wv6xjYqa/3wQCZISN8hJ26O5oe
         YfU+uu/JxN7r7s/ayfxrYZ0lUPyCGqoSA26oGQqC2HVblhIcPN2Nn5Y2BNjnTGbjQmAA
         B4OJhJ+CtIY7i7qxQJzlNR+OrimvE1pFwF6xylTGOIJs6loim+wR91rsYZPzpU8fDJ7a
         3mef2ETfUfeEeeIPl0SmCGLlnEp10ea/CDIgWsZx/CzoPY3grrD5XwVS+vadk9fs5Qwu
         kywcZK6haQO8xYB//cErVPawsRyz0xxXczRqE0NA5xoDgmuIBjwbzlXiqUPXeB/0HQgL
         HXxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4gXFmg27NpvY438Ykwen8F4/kxPxD93q4rYDmToz4O9CXkXXD61feiRb9WsrRB/muEygPofMoVSKYOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBsuuKdaSC6CfioQpKAzePWzBfotP7PsQXCmMogBRvBh69+RzR
	YF6Kf5v4oCInqfniu/LRDdlSlMPzsqxXuEkO8So7LOdKemRtnjg/96hzN8AyWsPj+QoWxp12Pjt
	RPJjWoDOeXA==
X-Received: from dydb13.prod.google.com ([2002:a05:7300:80cd:b0:2b6:b139:8515])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:c8d:b0:2b7:f415:53da
 with SMTP id 5a478bee46e88-2b7f41562demr4507487eec.39.1770133598871; Tue, 03
 Feb 2026 07:46:38 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:31 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=4973;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=B6pUx1j5pFgygp5i69R4pVf7HKotofgGAbGCOoefnlg=; b=fxAPn9jEKutvpJgCWN9uhdCYYPvpNSAPYUiC58vFHXa9srmJAEVvTYAI4ltyhlDhosBAKf3Rg
 E9oiUBNs6ZcCvvrOXXHz6bHCDz2FOMAAS2YvT7aTHhFBqLoubFyOfDq
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-2-d6719db85637@google.com>
Subject: [PATCH v2 2/6] rust: io: Support copying arrays and slices
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Adds support for doing array copies of data in and out of IO regions.
Fixed size arrays allow for compile-time bound checking, while slice
arguments allow for dynamically checked copies.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/io.rs | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 71 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 056a3ec71647b866a9a4b4c9abe9a0844f126930..6e74245eced2c267ba3b5b744eab3bc2db670e71 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -266,8 +266,9 @@ macro_rules! define_write {
 #[inline]
 const fn offset_valid<U>(offset: usize, size: usize) -> bool {
     let type_size = core::mem::size_of::<U>();
+    let type_align = core::mem::align_of::<U>();
     if let Some(end) = offset.checked_add(type_size) {
-        end <= size && offset % type_size == 0
+        end <= size && offset % type_align == 0
     } else {
         false
     }
@@ -323,6 +324,25 @@ fn io_addr<U>(&self, offset: usize) -> Result<usize> {
         self.addr().checked_add(offset).ok_or(EINVAL)
     }
 
+    /// Returns the absolute I/O address for a given `offset`, performing runtime bounds checks
+    /// to ensure the entire range is available.
+    #[inline]
+    fn io_addr_range<U>(&self, offset: usize, count: usize) -> Result<usize> {
+        if count != 0 {
+            // These ranges are contiguous, so we can just check the first and last elements.
+            let bytes = (count - 1)
+                .checked_mul(core::mem::size_of::<U>())
+                .ok_or(EINVAL)?;
+            let end = offset.checked_add(bytes).ok_or(EINVAL)?;
+            if !offset_valid::<U>(offset, self.maxsize()) || !offset_valid::<U>(end, self.maxsize())
+            {
+                return Err(EINVAL);
+            }
+        }
+
+        self.addr().checked_add(offset).ok_or(EINVAL)
+    }
+
     /// Returns the absolute I/O address for a given `offset`,
     /// performing compile-time bound checks.
     // Always inline to optimize out error path of `build_assert`.
@@ -605,4 +625,54 @@ pub unsafe fn from_raw(raw: &MmioRaw<SIZE>) -> &Self {
         pub try_write64_relaxed,
         call_mmio_write(writeq_relaxed) <- u64
     );
+
+    /// Write a known size buffer to an offset known at compile time.
+    ///
+    /// Bound checks are performed at compile time, hence if the offset is not known at compile
+    /// time, the build will fail, and the buffer size must be statically known.
+    #[inline]
+    pub fn copy_from<const N: usize>(&self, src: &[u8; N], offset: usize) {
+        let addr = self.io_addr_assert::<[u8; N]>(offset);
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // assertion it's valid for `N` bytes.
+        unsafe { bindings::memcpy_toio(addr as *mut c_void, src.as_ptr().cast(), N) }
+    }
+
+    /// Write the contents of a slice to an offset.
+    ///
+    /// Bound checks are performed at runtime and will fail if the offset (plus the slice size) is
+    /// out of bounds.
+    #[inline]
+    pub fn try_copy_from(&self, src: &[u8], offset: usize) -> Result<()> {
+        let addr = self.io_addr_range::<u8>(offset, src.len())?;
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // range check it's valid for `src.len()` bytes.
+        unsafe { bindings::memcpy_toio(addr as *mut c_void, src.as_ptr().cast(), src.len()) };
+        Ok(())
+    }
+
+    /// Read a known size buffer from an offset known at compile time.
+    ///
+    /// Bound checks are performed at compile time, hence if the offset is not known at compile
+    /// time, the build will fail, and the buffer size must be statically known.
+    #[inline]
+    pub fn copy_to<const N: usize>(&self, dst: &mut [u8; N], offset: usize) {
+        let addr = self.io_addr_assert::<[u8; N]>(offset);
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // assertion it's valid for `N` bytes.
+        unsafe { bindings::memcpy_fromio(dst.as_mut_ptr().cast(), addr as *mut c_void, N) }
+    }
+
+    /// Read into a slice from an offset.
+    ///
+    /// Bound checks are performed at runtime and will fail if the offset (plus the slice size) is
+    /// out of bounds.
+    #[inline]
+    pub fn try_copy_to(&self, dst: &mut [u8], offset: usize) -> Result<()> {
+        let addr = self.io_addr_range::<u8>(offset, dst.len())?;
+        // SAFETY: By the type invariant `addr` is a valid address for MMIO operations, and by the
+        // range check, it's valid for `dst.len()` bytes.
+        unsafe { bindings::memcpy_fromio(dst.as_mut_ptr().cast(), addr as *mut c_void, dst.len()) }
+        Ok(())
+    }
 }

-- 
2.53.0.rc2.204.g2597b5adb4-goog

