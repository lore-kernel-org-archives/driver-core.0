Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321932;
	b=GgE1CjmpjJy1CIhjKCALZ56/rhVghaZWe0z9sMTr4ig3/LBZg70ZWcKv3euQDFo6XoEY
	 GcbvQFz5cUcwwepjRmZg7C/uYJpLyk43B1lcy2uFa6Scaamlo3RryuxocUFRjjQFwCAo8
	 PA6QsjsIukE8g5/ANp6QqHWoDMGKOD94Lg1ncb/LoZPrY0+1muP823+8cSKVt2iwZXqr5
	 8Tw08LwViMagCKkl269NuV8xPCzp02C4HrCHR3DxW4VYG48mXK4vaU/uaofyhx/FiV2iB
	 fdpHbZZjQjANjNCWV4HJsvXLIUeq5kWALG4lcxOwZ2h4AvySumXafJXgDK/KuXSDdjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321932;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Nxsf4aqPpWbByTWy4qgF4wCWfY6HdQuZno5SuvcTfA4=;
	b=jiyu2n0Mk4gaXNkf8AAE5wBFeHDHcb6L42AZMd97JPjFvZl4DPpaCT2lzmBmH+SX+Byg
	 qibjH5wQ6jFCcyTbZYAM9GOM86QCY80oNb/lXWm8QfPo3uUW1aZsH0jgdsK4JmmO9yBed
	 e/19QyvD/rik5J8RcP+xAdtO7p/kmdzVfxIvjPApI9wEXl8I/3bKbcUMA31Dz9vi2Zpax
	 Tze1ua/nYkRMfN0rsfS38HqXxofGcFula0c/1It7wlhoZ9wU4lLIFFhp4eKqhRHNjxwSf
	 1so37i0e729genD6Bt/TOocx06x49t3E2uNfkAzdhBkwDd+XZdr8KxnG7TjUCg82Z3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMq0XiiY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABB5606A333;
	Tue, 10 Nov 2026 14:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gMq0XiiY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A886D1F0089F;
	Tue, 10 Nov 2026 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321931;
	bh=Nxsf4aqPpWbByTWy4qgF4wCWfY6HdQuZno5SuvcTfA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=gMq0XiiYjFsCGAfnWkgRhZOskIKpU2I9gUCk9jukF20AmtPKoEGlRgbUUPgizde06
	 oD2E3939NbrV1tjsIbmos++atRL1kj+O4dUDN6mIbrolTOIfBjS1XGmbLAb5A/Xy5B
	 u3gCJTZxcA5jLgMDCWWhuFAkWrkl1oAutbtBFzylE3KCHeKc6Rdqlfo3bckuvOKE11
	 g93sXoJzxZtBvRPlRHsmY/jO6+AoVWv7o7xdnHduN1zEvfIu3ALLuHvSGdbrd0KPV7
	 5yO0U6TxqWiUEISMWTLHc/+4Of6Rkkyonyy1GbOXbiDUgTWnz/HhlRARgPDMEwFDUO
	 DNr1G8aAoNFXQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 10 Nov 2026 15:44:22 +0100
Subject: [PATCH v5 4/4] rust: page: add byte-wise atomic copy methods for
 `SysMem`
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
Message-Id: <20261110-page-volatile-io-v5-4-a91ef252c24b@kernel.org>
References: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>
In-Reply-To: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lyude Paul <lyude@redhat.com>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7130; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=0Yld6Xn1ZAuuVlcl8F4kf0vlZbzxXdxmJTVFWA2EiHY=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq8y39HfY8eyoOIJboqBscbDsAohXqHM82iKpnX
 AT2dCkacSqJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavMt/QAKCRD6UCkIqsW9
 0GXPEACS4z32suEL1KhuaK+bOQTuHnPxNwc7zKFUr2QC1tUwUt9Os76/aTEhR4E+HkbAK2/q6CK
 CWTYxmYdxxEL0yWgDnA72JBZopYvVfS9pMmePful3IHftfnuV3aueV7Uov6vraNfySJiaGRXTNe
 bWJePVAucXTMdvTrq2Htk//gRQuR/H9oRgp+nHh8ooeKlZgvnxzQOWMloDINhXURtvBRKC7vM+4
 svH10lFQLEKrc2wQn2dOw5nTJ1Hf8Jxr6UlvVB/7IGsyIvayUEUnVBGv6D0yIeIwTnpP0O+RK5B
 7E8jlK1OSJkxSt9etuBUbIsS4X+kP7EKMNMOt8o4J6WAKNxMEnc1MFdgYnjguCMYPLPC3blIiJ+
 RNZy7aqU8lB1GSLv36nLej6Yw1j5lYEeu8mjP5M84C6ydTODxo0S/qIWiE/YyRFdhxMCaK6lH5g
 C8yDHLsNoITMq+Sn4VNffVHMHaM57BENV2JJJMxBiqVphxK4kM7jOxegIUExXRjYhlPdDZQAntW
 FS8XHpbRH4M77BfnA9b8i0gsW8/lsb9nkkwI3E1624uPAVUkNdR7+cou0SXdIto5TD9eo8T1tcd
 XJRxG2A7YKoEYY6+ohS6jlhmrnG06fLlrKokMcufdvO180Xf9IZKY/4QkjKU1qQhkuSVmew7meY
 mJOSPyylnea/PEA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When copying data between a `Page` and a buffer that is mapped to user
space, or otherwise shared outside the kernel, it is impossible to
guarantee absence of concurrent memory operations on that buffer. Copying
with `Page::{read,write}_raw` would be a data race in that case.

Add `Page::{read,write}_bytewise_atomic`, which take a `SysMem` view of the
shared buffer. The accesses to the buffer go through `SysMemBackend`, which
uses byte-wise atomic operations, so they are well-defined when racing with
external actors or with atomic accesses from other kernel code. The page
side of the copy uses plain accesses, so the page itself must not be
accessed concurrently, as is the case for `Page::{read,write}_raw`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 1c0796ea229f..92486d312b0c 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -12,6 +12,12 @@
         code::*,
         Result, //
     },
+    io::{
+        Io,
+        IoCopyable,
+        SysMem,
+        SysMemBackend, //
+    },
     uaccess::UserSliceReader, //
 };
 use core::{
@@ -305,6 +311,58 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
         })
     }
 
+    /// Maps the page and reads from it into the given system memory region using byte-wise atomic
+    /// memory operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+dst.len()`
+    /// goes outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// The writes to `dst` are byte-wise atomic, so they are well-defined even if `dst` is
+    /// concurrently accessed by hardware, by user space, or by other kernel code using atomic or
+    /// volatile accesses. The reads from the page are plain accesses, so the page must not be
+    /// written to concurrently.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    ///
+    /// - This call does not race with a write to the source page that overlaps with this read.
+    /// - The memory region of `dst` does not overlap with the memory of the page.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::{
+    ///     io::SysMem,
+    ///     page::Page,
+    /// };
+    ///
+    /// let page = Page::alloc_page(GFP_KERNEL | __GFP_ZERO)?;
+    /// let mut buf = [0xffu8; 16];
+    ///
+    /// // SAFETY: `buf` is a local array that outlives `dst`, and it is not accessed in any other
+    /// // way while `dst` is alive.
+    /// let dst = unsafe { SysMem::new(&raw mut buf as *mut [u8]) };
+    ///
+    /// // SAFETY: `page` is not written to during this call, and `buf` is not part of the page.
+    /// unsafe { page.read_bytewise_atomic(dst, 0)? };
+    /// assert_eq!(buf, [0u8; 16]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub unsafe fn read_bytewise_atomic(&self, dst: SysMem<'_, [u8]>, offset: usize) -> Result {
+        self.with_pointer_into_page(offset, dst.len(), move |src| {
+            // SAFETY:
+            // - If `with_pointer_into_page` calls into this closure, then it has performed a
+            //   bounds check and guarantees that `src` is valid for `dst.len()` bytes, which is
+            //   equal to `dst.size()`.
+            // - By the safety requirements of this function, the page is not written to during
+            //   this call, so `src` is valid for volatile reads.
+            // - By the safety requirements of this function, `src` does not overlap with `dst`.
+            unsafe { SysMemBackend::copy_to_io(dst, src) };
+            Ok(())
+        })
+    }
+
     /// Maps the page and writes into it from the given buffer.
     ///
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
@@ -326,6 +384,69 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
         })
     }
 
+    /// Maps the page and writes into it from the given system memory region using byte-wise atomic
+    /// memory operations.
+    ///
+    /// This method will perform bounds checks on the page offset. If `offset .. offset+src.len()`
+    /// goes outside of the page, then this call returns [`EINVAL`].
+    ///
+    /// The reads from `src` are byte-wise atomic, so they are well-defined even if `src` is
+    /// concurrently accessed by hardware, by user space, or by other kernel code using atomic or
+    /// volatile accesses. The writes to the page are plain accesses, so the page must not be read
+    /// from or written to concurrently.
+    ///
+    /// # Safety
+    ///
+    /// Callers must ensure that:
+    ///
+    /// - This call does not race with a read or write to the destination page that overlaps with
+    ///   this write.
+    /// - The memory region of `src` does not overlap with the memory of the page.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::{
+    ///     io::SysMem,
+    ///     page::Page,
+    /// };
+    ///
+    /// let page = Page::alloc_page(GFP_KERNEL)?;
+    /// let mut data = [0xabu8; 16];
+    /// let mut buf = [0u8; 16];
+    ///
+    /// // SAFETY: `data` and `buf` are local arrays that outlive the views, and they are not
+    /// // accessed in any other way while the views are alive.
+    /// let (src, dst) = unsafe {
+    ///     (
+    ///         SysMem::new(&raw mut data as *mut [u8]),
+    ///         SysMem::new(&raw mut buf as *mut [u8]),
+    ///     )
+    /// };
+    ///
+    /// // SAFETY: `page` is not accessed in any other way during these calls, and neither `data`
+    /// // nor `buf` is part of the page.
+    /// unsafe {
+    ///     page.write_bytewise_atomic(src, 0)?;
+    ///     page.read_bytewise_atomic(dst, 0)?;
+    /// }
+    /// assert_eq!(buf, data);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub unsafe fn write_bytewise_atomic(&self, src: SysMem<'_, [u8]>, offset: usize) -> Result {
+        self.with_pointer_into_page(offset, src.len(), move |dst| {
+            // SAFETY:
+            // - If `with_pointer_into_page` calls into this closure, then it has performed a
+            //   bounds check and guarantees that `dst` is valid for `src.len()` bytes, which is
+            //   equal to `src.size()`.
+            // - By the safety requirements of this function, the page is not read from or written
+            //   to during this call, so `dst` is valid for volatile writes.
+            // - By the safety requirements of this function, `dst` does not overlap with `src`.
+            unsafe { SysMemBackend::copy_from_io(src, dst) };
+            Ok(())
+        })
+    }
+
     /// Maps the page and zeroes the given slice.
     ///
     /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes

-- 
2.54.0


