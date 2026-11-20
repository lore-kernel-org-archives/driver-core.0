Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170459;
	b=nbJDJ0SOz9RxMuUjyRtINugZIarGnYLhZBZ0KI1nP0ysxl7ncxBz1x5/wvymd2gt6cGZ
	 Fv4hRhh9L/L825KeG4DB2xTKasGjKnXDCXoRW0xxBZsJBI0Rcik4uC+WYssRt8WcSUK54
	 UFXwUbxkmVjJQZPwzoOGvzRFYNdI2NA4R6HjCpfCcAGDbKfJ8BvcSep8arDdD786eA1Rs
	 cq/Sv3QprUAU9xZk0kltx1AdQgj4zBIEFPOQ0HIAzSZg1hVvsiPh9p0Z9rXDg+DiItXsG
	 tN0lMaPVDfQXLRmA7vQV41nNdYR+4zBwJId5VsySkmXONZmOjs3l2qIkNjhiaa7z/0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170459;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=g59A01+nT81rmoGrrt0KAwfxYB65M8vKSb7GrPuEl1M=;
	b=jPJrrXmgjyKVe1pScAx/dy3eueGnOUkNuwsdbVXYcHvx1vPmqNVweh74lCRna7ulLqRb
	 iVy2UD/Z7RP67vb301sUEvYtk3x6AUnGi8MOQI525yn2fKN23Aw2myB7sa3BJUeRIrM11
	 hypbA2OvVm8y93rTvFtvm600sCDld4H3x+Y4S6Do1dWrai5U459dNj3bK3YrmxiY728M7
	 ahr3k6FAoaJj7jeu8IFUeQau5WcTA/E4dcy7zgDNJ9joTrghJpUGqj8j7M/eN/GS4oVSF
	 JsB5lip1d3/gfjgREBms0kKP5PjYbpAEe1F0anRpnsgIUhnynqOzxBigE7if9aP2KkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRvzZSzs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2781B606A320;
	Fri, 20 Nov 2026 10:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GRvzZSzs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2D51F000C0;
	Fri, 20 Nov 2026 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170458;
	bh=g59A01+nT81rmoGrrt0KAwfxYB65M8vKSb7GrPuEl1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GRvzZSzsZBC5z/3rmX5sZ0B/X9qJ7qZ0gmGYh0a1Pk0dM89zQ5qB/qXZTWeKQ/PtX
	 L3vyhOOPonnpMY/+zKPoCQ+4wk0ljq98rAYQnPO2TWeKlduN8KuEDHzK5XxwgYaDB1
	 U5k/auXMn5LQLnQvxmHghyG9P/YdLXtZUbXIk4wFG9fTDLeod5Y177R39JcWH4QqU2
	 VSHiW5xSsg1riyBLUm8GKkdhJSPuzyHSCArVLv8S87wQgT4F7AN+/siGIgqp/jHGBZ
	 eYGmMkyTn22vpB2bLTe94qQz+3x1AFb8oyEjGioJwVSV1EPP1tHidV9lX86HFS53S4
	 gSytm1/obJ5OA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:04 +0100
Subject: [PATCH 05/11] rust: uaccess: take a raw pointer in
 `UserSliceReader::read_raw`
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-page-shared-v1-5-66f8c4c62822@kernel.org>
References: <20261120-page-shared-v1-0-66f8c4c62822@kernel.org>
In-Reply-To: <20261120-page-shared-v1-0-66f8c4c62822@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Lyude Paul <lyude@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>, Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7215; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=7Usj2yHs1j7uEe8QYeazPmySsi+qcWhq4l4WxUVPh7c=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCGQ2GsusZYa/SRpvegY1XKVuTb+D2T5c2Ud
 My4dWTvY1uJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAghgAKCRD6UCkIqsW9
 0JL8D/47AJiHUud8qB957cvnHaQWcJk0uz+HIWg4nbLoy9COaTTPo9e6lgCeWuLXT6Je+Qf6Z19
 v3vt04QUIDCCZqDw/9lncvwC8FRV2goO5KSwEnb4Rz9iVfkG9WcRCdzcqa0zM+w0pNKki6AymeM
 MDJ/40GjYOh84FsHZAKkeSDZnA6tq9/rf3pXT/MXLPqhMMz2Ex5z4b+3yPDRwln+EdZqdFGp1Y4
 SH+81N/i190qkwhDCKCTbAooEjLfWKZ13Nri35/04tKpIgeVBlhVoFRGn0sqaRaYWDZ6MDe9v4D
 3G4XWpdNa1hMx4ne9FdjmbfX+R1LeFSuoRYIJhTJG2F3GceVpr62TXzE95B4DlE7DdJRigkcOpt
 x/X7Umf2FGSRC6qz4pHmPtSNxim3t1t7Iei+U2t4sKFmBjqhyCnaLtfZHL+Zd7WFISaWhKqdr9h
 JHWAVKPyTmmSjrmqHSquNgCjagOVEIc71vTUI/HuFdgBJItvSGcAe7Sqmjt38Ya4qziXC1GCn3w
 ubZzZWx1KFmDQP50sCZ8It4A/vtE3Mm4qA7Sz/+0Qfrl7YgA82Ar3eGGxyY6+6XwNWtAtlemp5Y
 tUFTL6oKDO4DjYkXeGUqTdQCmedvTWH15n649pziTEgUHBgijyzF8UBz5dzX6iNYlPbHQJftpaZ
 MfDSyq5Hz1aWb3Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`UserSliceReader::read_raw()` takes the destination as a mutable slice.
Thus, it cannot be used to copy into memory that is subject to concurrent
accesses, such as a page that is mapped to user space, since a mutable
reference to such memory must not exist.

Change `UserSliceReader::read_raw()` to take the destination as a raw
pointer and a length, and make it unsafe. The copy is done by
`copy_from_user()`, which uses byte-wise atomic store instructions for the
kernel memory, so the destination only has to be valid for atomic writes.

Update the callers. `UserSliceReader::read_slice()` remains as the safe
method for copying into a slice.

`Page::copy_from_user_slice_raw()` no longer creates a mutable slice of
the data of the page, and thus no longer writes to the page with plain
accesses. Remove the remark about this from its safety requirements.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs    |  9 ++++-----
 rust/kernel/uaccess.rs | 47 ++++++++++++++++++++++++++++++++---------------
 2 files changed, 36 insertions(+), 20 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index ff191bfcd3f9..643af7cfbef4 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -600,8 +600,7 @@ pub unsafe fn fill_zero_raw(&self, offset: usize, len: usize) -> Result {
     /// # Safety
     ///
     /// * Callers must ensure that this call does not race with a read or write to the same page
-    ///   that overlaps with this write. This includes byte-wise atomic accesses, as this method
-    ///   writes to the page with plain accesses.
+    ///   that overlaps with this write.
     /// * Callers must ensure that no reference to the data of the page that overlaps with this
     ///   write exists during this call. Such references can be obtained from a
     ///   [`Page<Exclusive>`], see [`Page::as_slice`].
@@ -613,9 +612,9 @@ pub unsafe fn copy_from_user_slice_raw(
     ) -> Result {
         self.with_pointer_into_page(offset, len, move |dst| {
             // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
-            // bounds check and guarantees that `dst` is valid for `len` bytes. Furthermore, we have
-            // exclusive access to the slice since the caller guarantees that there are no races.
-            reader.read_raw(unsafe { core::slice::from_raw_parts_mut(dst.cast(), len) })
+            // bounds check and guarantees that `dst` is valid for `len` bytes. The caller
+            // guarantees that there are no races, so `dst` is valid for atomic writes.
+            unsafe { reader.read_raw(dst, len) }
         })
     }
 }
diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index f1aecda7a90c..b1df79500b98 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -252,25 +252,38 @@ pub fn is_empty(&self) -> bool {
         self.length == 0
     }
 
-    /// Reads raw data from the user slice into a kernel buffer.
+    /// Reads raw data from the user slice into the kernel memory at `out`.
     ///
-    /// For a version that uses `&mut [u8]`, please see [`UserSliceReader::read_slice`].
+    /// The writes to `out` are byte-wise atomic, so they are well-defined even if the memory at
+    /// `out` is concurrently accessed by hardware, by user space, or by other kernel code using
+    /// atomic or volatile accesses. For a safe version that uses `&mut [u8]`, please see
+    /// [`UserSliceReader::read_slice`].
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
-    /// bounds of this [`UserSliceReader`]. This call may modify `out` even if it returns an error.
+    /// bounds of this [`UserSliceReader`]. This call may modify the memory at `out` even if it
+    /// returns an error.
+    ///
+    /// Implementation note: this is implemented by the kernel's `copy_from_user()`, which is
+    /// implemented in a way such that byte-wise atomic memory store instructions are used.
     ///
     /// # Guarantees
     ///
-    /// After a successful call to this method, all bytes in `out` are initialized.
-    pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
-        let len = out.len();
-        let out_ptr = out.as_mut_ptr().cast::<c_void>();
+    /// This method only writes initialized bytes to `out`. After a successful call to this method,
+    /// all `len` bytes at `out` are initialized.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that `out` is valid for atomic writes for `len` bytes for the duration
+    /// of the call.
+    pub unsafe fn read_raw(&mut self, out: *mut u8, len: usize) -> Result {
         if len > self.length {
             return Err(EFAULT);
         }
-        // SAFETY: `out_ptr` points into a mutable slice of length `len`, so we may write
-        // that many bytes to it.
-        let res = unsafe { bindings::copy_from_user(out_ptr, self.ptr.as_const_ptr(), len) };
+        // SAFETY: By the safety requirements of this function, `out` is valid for atomic writes
+        // for `len` bytes. `copy_from_user()` is a byte-wise atomic operation on the kernel
+        // memory.
+        let res =
+            unsafe { bindings::copy_from_user(out.cast::<c_void>(), self.ptr.as_const_ptr(), len) };
         if res != 0 {
             return Err(EFAULT);
         }
@@ -284,10 +297,10 @@ pub fn read_raw(&mut self, out: &mut [MaybeUninit<u8>]) -> Result {
     /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
     /// bounds of this [`UserSliceReader`]. This call may modify `out` even if it returns an error.
     pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
-        // SAFETY: The types are compatible and `read_raw` doesn't write uninitialized bytes to
-        // `out`.
-        let out = unsafe { &mut *(core::ptr::from_mut(out) as *mut [MaybeUninit<u8>]) };
-        self.read_raw(out)
+        // SAFETY: `out` is a mutable slice, so it is valid for writing `out.len()` bytes, and
+        // nothing else accesses it during this call. `read_raw` doesn't write uninitialized bytes
+        // to `out`.
+        unsafe { self.read_raw(out.as_mut_ptr(), out.len()) }
     }
 
     /// Reads raw data from the user slice into a kernel buffer partially.
@@ -372,7 +385,11 @@ pub fn read_all<A: Allocator>(mut self, buf: &mut Vec<u8, A>, flags: Flags) -> R
         buf.reserve(len, flags)?;
 
         // The call to `reserve` was successful, so the spare capacity is at least `len` bytes long.
-        self.read_raw(&mut buf.spare_capacity_mut()[..len])?;
+        let spare = &mut buf.spare_capacity_mut()[..len];
+
+        // SAFETY: `spare` is a mutable slice, so it is valid for writing `spare.len()` bytes, and
+        // nothing else accesses it during this call.
+        unsafe { self.read_raw(spare.as_mut_ptr().cast(), spare.len()) }?;
 
         // SAFETY: Since the call to `read_raw` was successful, so the next `len` bytes of the
         // vector have been initialized.

-- 
2.54.0


