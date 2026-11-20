Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170527;
	b=zlmcKrC0qnbz8uqnCObzstkkGdHTxRGw+egw1KpPCoqZCouoh0qH4gAXxtyEwB10c7y0
	 EUWuWC6oLvjrbgbkM+AQb1Ni1KemVJHOcfLKe3nxxrEQs54u9Z8zcib2O4ypC1I/an8mC
	 4xUDjHbegICgUo+DQWkiAJj8r4PkTRBMdGb9aXWWZqc5xM1g9Tn4dVTA4dKkoAwfwPo+f
	 v0bFHS4EWBsEKDe+CfqfUm05BFbWOxKQ1C3YjpLearHs0amEtm6sWOQIJLJc8cJbuhbTW
	 KPLuWEbOHiWkFhqv+4PcaI8DSbTIo+a+uItS3VCJ47NzKh5+WW6QFdEEdOTOhzx8vGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170527;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5ZQM0iSlIxsidYD3H8Z/IU2JU/hIKwWZ9ucju8JfOBg=;
	b=K8cP5QCiqSpwTJJjpHK/JgCECaUar7T75IUAeLcLdzcNv/V1Ceo8SYVhIvDjd7L857kG
	 ggYkrc1WFcAmJnOpuxqQ+FgZDHanImOwJTlz04TvJDE88LVTQN1mP+mJ72cT3U2FzRG8K
	 l/JPDW11ZTflVI2xjDX7FbaGBP2n0SPkQEk9tNXKEPpyeWr9C1lUFMK5qznCmBgtZ4fPJ
	 xDiaQaM+K9aByz2HXSKHDYanHnEL4Ne2wSCW9W0al0M76zFTFrxqDHKCo1k/7E6h6HEBC
	 vA/cXHk1WafT/6Uvrv2piDZ3YUsuL5i3id4Crv3ZkoGx5lxbawZDhP97lfn8K2XHs6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RoMd+8ZH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B548606A337;
	Fri, 20 Nov 2026 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RoMd+8ZH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 198451F01573;
	Fri, 20 Nov 2026 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170526;
	bh=5ZQM0iSlIxsidYD3H8Z/IU2JU/hIKwWZ9ucju8JfOBg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RoMd+8ZH3/J/Xtvft7++A1c6QdngHDk1A86GwkjsTsJdZ72QsooE7SuHwkZd/nlVP
	 w3CEam6GOM7EchFEbRrYCeQYJyCubp72PjZTb4VSqFGb8EFhQ89Mbsh9kVEryaYxQ4
	 1C1C+cJxy2SdqVCm6GKFrjiKyyh5WyIz+ezBVp8zltzWdH/Kst/TGYNy+ftemVhzuJ
	 DAW3MrkaFsETjgz4Ul5dBjO1wGLWEkIogzDQyimd5bqlGsbweq1aZmzyc4kHGiuC/H
	 ylN+7cBNvcsX3AIL3T1Dm9p/AGFjqqirE+QX9RoEPhrTUY5JDgMmthf7Ipz8EKgCEy
	 7KqOdcCREReEw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:03 +0100
Subject: [PATCH 04/11] rust: page: use byte-wise atomic operations in raw
 accessors
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
Message-Id: <20261120-page-shared-v1-4-66f8c4c62822@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16831;
 i=a.hindborg@kernel.org; h=from:subject:message-id;
 bh=+saz2pIcMWoUznANU/SqKeZHrhc55d/T5RtE2muYx0g=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCFfQwjV/qfKjV2NhXVGHmqVZ2GI664G9/Rw
 ub6zMkGNEeJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAghQAKCRD6UCkIqsW9
 0GSAEAC298ZHO1Mn9Vl//CX8hI5wCHFQ9mTd+7e5FBHxKdyk/qD7x9Q4k1TwFDvCvIN0copAH4m
 9b7opdKu7j6I+q9kefxa3hClLfWDP8qVXZ64dz29IbCeFvplySaJYDO8GD+MBS3V5Cn8lJ1BCOR
 jCGvMMntkkxdDK/UvzVuHbl44RJ5zkZXbJ//xBxDp0+fxR5LByPNd0bQwi64S3f0MYI12UZy3j8
 1GULbN8Ue7uIe+aWnATrriON34iT/k1evDqNx0KlrAbusB+RbOTIeQjiiHx34jfTvPSRmH+2cm3
 yIpxeB+RRCSuFxrbgd464W569kOCNCXRiKHHhgc4GovcauTB8QvmCTZtUpiOlEqzXXoXONt9mde
 tuvdwB8lFK6gieFOx7aALxKKg0E3jK8QqzAVdYJXmvr05icl4eI7x2dyJHna4YPs6ThTuf7p2AO
 1rksirpoOKe/L+MfsQhMELQTk27sdtp984dmCnYhKbRIEpa1cDRh4ixKDoZvfNZRDunEKXZItCJ
 f5Bymhcz0AqQ0NJttOJQUhy1PO8I4k8TMATEehF5nejgdCpO2SNLyCotZlT/+YTJ4Fxna639JIb
 0rDTbc19thlO33zfwOS1TtuD5rahgK9a1QcE9Iq5J/FKaRqRgJ2GwXv5Q+AwYJTAiTLyZiDf5CF
 mqyy6D/bb6arxVQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The raw accessors of `Page` are used to access pages that may be mapped to
user space or shared with devices. A plain access to such a page is a data
race when the other party writes to the page.

Add the private method `Page::with_page_as_sysmem()`, which maps a range
of a page and passes it to a closure as a `SysMem` view. Access the data
of the page through this view in `Page::read_raw()`, `Page::write_raw()`
and `Page::fill_zero_raw()`, so that all accesses are byte-wise atomic.
Zero the data with `SysMem::fill_zero()`.

Narrow the safety requirements of these methods, and of
`Page::read_sysmem()` and `Page::write_sysmem()`, accordingly: a call must
not race with a plain access to the same data, but it is allowed to race
with other non-plain accesses.

`Page::copy_from_user_slice_raw()` still writes to the page with plain
accesses. State that in the safety requirements.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 153 ++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 107 insertions(+), 46 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 3c48ecde4d14..ff191bfcd3f9 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -334,28 +334,74 @@ fn with_pointer_into_page<T>(
         }
     }
 
+    /// Runs a piece of code with a range of this page mapped as a [`SysMem`] view.
+    ///
+    /// If `f` is called, then it is called with a view of the `len` bytes of the page that start
+    /// at `offset`. Accesses through the view are volatile or byte-wise atomic, so the view is
+    /// suitable for a page whose data is subject to concurrent writes by hardware or user space.
+    /// The view is valid for the duration of the call to `f`.
+    ///
+    /// If `offset` and `len` refer to a region outside of this page, then this method returns
+    /// [`EINVAL`] and does not call `f`.
+    ///
+    /// # Safety
+    ///
+    /// * Callers must ensure that no plain access to the mapped range races with an access
+    ///   performed through the view, see [`SysMem`].
+    /// * Callers must ensure that no mutable reference to the data of the page that overlaps with
+    ///   the mapped range exists during this call. If `f` writes through the view, no reference to
+    ///   that data may exist during this call. Such references can be obtained from a
+    ///   [`Page<Exclusive>`], see [`Page::as_slice`].
+    /// * If the page is a [`Page<Exclusive>`], `f` must only write initialized bytes through the
+    ///   view.
+    /// * Callers must ensure that the view is only used on the current task, as this method may
+    ///   use a local mapping.
+    unsafe fn with_page_as_sysmem<T>(
+        &self,
+        offset: usize,
+        len: usize,
+        f: impl FnOnce(SysMem<'_, [u8]>) -> Result<T>,
+    ) -> Result<T> {
+        self.with_pointer_into_page(offset, len, move |ptr| {
+            // SAFETY:
+            // - If `with_pointer_into_page` calls into this closure, then it has performed a
+            //   bounds check and guarantees that `ptr` is valid for `len` bytes for the duration
+            //   of the closure. A byte slice has an alignment of 1.
+            // - By the safety requirements of this function, no plain access to the range races
+            //   with an access through the view.
+            f(unsafe { SysMem::new(ptr::slice_from_raw_parts_mut(ptr, len)) })
+        })
+    }
+
     /// Maps the page and reads from it into the given buffer.
     ///
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
     /// outside of the page, then this call returns [`EINVAL`].
     ///
+    /// The copy is byte-wise atomic, so it is well-defined even if the data of the page is
+    /// concurrently written by hardware, by user space, or by other kernel code using atomic or
+    /// volatile accesses. In that case, the data that is read may be arbitrary.
+    ///
     /// # Safety
     ///
-    /// * Callers must ensure that `dst` is valid for writing `len` bytes.
-    /// * Callers must ensure that this call does not race with a write to the same page that
-    ///   overlaps with this read.
+    /// * Callers must ensure that `dst` is valid for writing `len` bytes, and that this memory
+    ///   does not overlap with the data of the page.
+    /// * Callers must ensure that this call does not race with a plain write to the same page that
+    ///   overlaps with this read, see [`SysMem`].
     /// * Callers must ensure that no mutable reference to the data of the page that overlaps with
     ///   this read exists during this call.
     pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
-        self.with_pointer_into_page(offset, len, move |src| {
-            // SAFETY: If `with_pointer_into_page` calls into this closure, then
-            // it has performed a bounds check and guarantees that `src` is
-            // valid for `len` bytes.
-            //
-            // There caller guarantees that there is no data race.
-            unsafe { ptr::copy_nonoverlapping(src, dst, len) };
+        let copy = |src: SysMem<'_, [u8]>| {
+            // SAFETY: By the safety requirements of this function, `dst` is valid for writing
+            // `len` bytes, which is equal to `src.size()`, and it does not overlap with `src`.
+            unsafe { SysMemBackend::copy_from_io(src, dst) };
             Ok(())
-        })
+        };
+
+        // SAFETY: By the safety requirements of this function, no plain write races with the read
+        // through the view, and no mutable reference to the data that is read exists. `copy` does
+        // not write through the view, and it only uses the view on the current task.
+        unsafe { self.with_page_as_sysmem(offset, len, copy) }
     }
 
     /// Maps the page and reads from it into the given system memory region using byte-wise atomic
@@ -366,14 +412,14 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
     ///
     /// The writes to `dst` are byte-wise atomic, so they are well-defined even if `dst` is
     /// concurrently accessed by hardware, by user space, or by other kernel code using atomic or
-    /// volatile accesses. The reads from the page are plain accesses, so the page must not be
-    /// written to concurrently.
+    /// volatile accesses. The reads from the page are byte-wise atomic as well.
     ///
     /// # Safety
     ///
     /// Callers must ensure that:
     ///
-    /// - This call does not race with a write to the source page that overlaps with this read.
+    /// - This call does not race with a plain write to the source page that overlaps with this
+    ///   read, see [`SysMem`].
     /// - No mutable reference to the data of the page that overlaps with this read exists during
     ///   this call.
     /// - The memory region of `dst` does not overlap with the memory of the page.
@@ -393,8 +439,8 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
     /// // way while `dst` is alive.
     /// let dst = unsafe { SysMem::new(&raw mut buf as *mut [u8]) };
     ///
-    /// // SAFETY: `page` is not written to during this call, no reference to the data of `page`
-    /// // exists, and `buf` is not part of the page.
+    /// // SAFETY: No plain write to `page` happens during this call, no reference to the data of
+    /// // `page` exists, and `buf` is not part of the page.
     /// unsafe { page.read_sysmem(dst, 0)? };
     /// assert_eq!(buf, [0u8; 16]);
     /// # Ok::<(), Error>(())
@@ -405,8 +451,8 @@ pub unsafe fn read_sysmem(&self, dst: SysMem<'_, [u8]>, offset: usize) -> Result
             // - If `with_pointer_into_page` calls into this closure, then it has performed a
             //   bounds check and guarantees that `src` is valid for `dst.len()` bytes, which is
             //   equal to `dst.size()`.
-            // - By the safety requirements of this function, the page is not written to during
-            //   this call, so `src` is valid for volatile reads.
+            // - By the safety requirements of this function, no plain write to the page races
+            //   with this call, so `src` is valid for volatile reads.
             // - By the safety requirements of this function, `src` does not overlap with `dst`.
             unsafe { SysMemBackend::copy_to_io(dst, src) };
             Ok(())
@@ -418,25 +464,34 @@ pub unsafe fn read_sysmem(&self, dst: SysMem<'_, [u8]>, offset: usize) -> Result
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
     /// outside of the page, then this call returns [`EINVAL`].
     ///
+    /// The copy is byte-wise atomic, so it is well-defined even if the data of the page is
+    /// concurrently accessed by hardware, by user space, or by other kernel code using atomic or
+    /// volatile accesses.
+    ///
     /// # Safety
     ///
-    /// * Callers must ensure that `src` is valid for reading `len` bytes.
-    /// * Callers must ensure that this call does not race with a read or write to the same page
-    ///   that overlaps with this write.
+    /// * Callers must ensure that `src` is valid for reading `len` bytes, and that this memory
+    ///   does not overlap with the data of the page.
+    /// * Callers must ensure that this call does not race with a plain read or write to the same
+    ///   page that overlaps with this write, see [`SysMem`].
     /// * Callers must ensure that no reference to the data of the page that overlaps with this
     ///   write exists during this call. Such references can be obtained from a
     ///   [`Page<Exclusive>`], see [`Page::as_slice`].
     /// * If the page is a [`Page<Exclusive>`], callers must ensure that the `len` bytes at `src`
     ///   are initialized.
     pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Result {
-        self.with_pointer_into_page(offset, len, move |dst| {
-            // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
-            // bounds check and guarantees that `dst` is valid for `len` bytes.
-            //
-            // There caller guarantees that there is no data race.
-            unsafe { ptr::copy_nonoverlapping(src, dst, len) };
+        let copy = |dst: SysMem<'_, [u8]>| {
+            // SAFETY: By the safety requirements of this function, `src` is valid for reading
+            // `len` bytes, which is equal to `dst.size()`, and it does not overlap with `dst`.
+            unsafe { SysMemBackend::copy_to_io(dst, src) };
             Ok(())
-        })
+        };
+
+        // SAFETY: By the safety requirements of this function, no plain access races with the
+        // write through the view, no reference to the data that is written exists, and the bytes
+        // written are initialized if the page requires it. `copy` only uses the view on the
+        // current task.
+        unsafe { self.with_page_as_sysmem(offset, len, copy) }
     }
 
     /// Maps the page and writes into it from the given system memory region using byte-wise atomic
@@ -447,15 +502,14 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
     ///
     /// The reads from `src` are byte-wise atomic, so they are well-defined even if `src` is
     /// concurrently accessed by hardware, by user space, or by other kernel code using atomic or
-    /// volatile accesses. The writes to the page are plain accesses, so the page must not be read
-    /// from or written to concurrently.
+    /// volatile accesses. The writes to the page are byte-wise atomic as well.
     ///
     /// # Safety
     ///
     /// Callers must ensure that:
     ///
-    /// - This call does not race with a read or write to the destination page that overlaps with
-    ///   this write.
+    /// - This call does not race with a plain read or write to the destination page that overlaps
+    ///   with this write, see [`SysMem`].
     /// - No reference to the data of the page that overlaps with this write exists during this
     ///   call. Such references can be obtained from a [`Page<Exclusive>`], see
     ///   [`Page::as_slice`].
@@ -483,8 +537,9 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
     ///     )
     /// };
     ///
-    /// // SAFETY: `page` is not accessed in any other way during these calls, no reference to the
-    /// // data of `page` exists, and neither `data` nor `buf` is part of the page.
+    /// // SAFETY: No plain access to `page` happens during these calls, no reference to the data
+    /// // of `page` exists, `data` is initialized, and neither `data` nor `buf` is part of the
+    /// // page.
     /// unsafe {
     ///     page.write_sysmem(src, 0)?;
     ///     page.read_sysmem(dst, 0)?;
@@ -498,8 +553,8 @@ pub unsafe fn write_sysmem(&self, src: SysMem<'_, [u8]>, offset: usize) -> Resul
             // - If `with_pointer_into_page` calls into this closure, then it has performed a
             //   bounds check and guarantees that `dst` is valid for `src.len()` bytes, which is
             //   equal to `src.size()`.
-            // - By the safety requirements of this function, the page is not read from or written
-            //   to during this call, so `dst` is valid for volatile writes.
+            // - By the safety requirements of this function, no plain access to the page races
+            //   with this call, so `dst` is valid for volatile writes.
             // - By the safety requirements of this function, `dst` does not overlap with `src`.
             unsafe { SysMemBackend::copy_from_io(src, dst) };
             Ok(())
@@ -511,22 +566,27 @@ pub unsafe fn write_sysmem(&self, src: SysMem<'_, [u8]>, offset: usize) -> Resul
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
     /// outside of the page, then this call returns [`EINVAL`].
     ///
+    /// The writes are byte-wise atomic, so they are well-defined even if the data of the page is
+    /// concurrently accessed by hardware, by user space, or by other kernel code using atomic or
+    /// volatile accesses.
+    ///
     /// # Safety
     ///
-    /// * Callers must ensure that this call does not race with a read or write to the same page
-    ///   that overlaps with this write.
+    /// * Callers must ensure that this call does not race with a plain read or write to the same
+    ///   page that overlaps with this write, see [`SysMem`].
     /// * Callers must ensure that no reference to the data of the page that overlaps with this
     ///   write exists during this call. Such references can be obtained from a
     ///   [`Page<Exclusive>`], see [`Page::as_slice`].
     pub unsafe fn fill_zero_raw(&self, offset: usize, len: usize) -> Result {
-        self.with_pointer_into_page(offset, len, move |dst| {
-            // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
-            // bounds check and guarantees that `dst` is valid for `len` bytes.
-            //
-            // There caller guarantees that there is no data race.
-            unsafe { ptr::write_bytes(dst, 0u8, len) };
+        let fill = |dst: SysMem<'_, [u8]>| {
+            dst.fill_zero();
             Ok(())
-        })
+        };
+
+        // SAFETY: By the safety requirements of this function, no plain access races with the
+        // write through the view, and no reference to the data that is written exists. The bytes
+        // written are initialized. `fill` only uses the view on the current task.
+        unsafe { self.with_page_as_sysmem(offset, len, fill) }
     }
 
     /// Copies data from userspace into this page.
@@ -540,7 +600,8 @@ pub unsafe fn fill_zero_raw(&self, offset: usize, len: usize) -> Result {
     /// # Safety
     ///
     /// * Callers must ensure that this call does not race with a read or write to the same page
-    ///   that overlaps with this write.
+    ///   that overlaps with this write. This includes byte-wise atomic accesses, as this method
+    ///   writes to the page with plain accesses.
     /// * Callers must ensure that no reference to the data of the page that overlaps with this
     ///   write exists during this call. Such references can be obtained from a
     ///   [`Page<Exclusive>`], see [`Page::as_slice`].

-- 
2.54.0


