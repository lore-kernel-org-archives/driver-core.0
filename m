Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575739;
	b=psWVl4sF/fsTYEemX367FdQZdKnxO9c7PXjz06zv0mpyTmnJ6LAlXYnsksyE5HkZ+OLC
	 tPbf4ib2GzrIbszQ0Jaw4bosLBqZrWHSLodme+v5pZD3gbP/9DAfaTFITJlnahsKA7D+O
	 2TGwiVTQOidYgUs1owvRGXgWKyDr9L1VZNgI3DZLwhlRock5RN5mYJPXI48rvhmt5+V9B
	 /VEb4J55SLWtq3LPLLvWX2ppBQ+QILbWl4YPA4X5jjsIvRUtrarwcFgUzRZrnz6AoTvGY
	 atL3EsyZ0MMyXr/CwSNxKfL0Ox4pka3INrjd9MMfs7q6fubwhIE8LQf5wVv0CHcsiCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575739;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=yvhlxOGFoi+F89HZb81WEWWCtAriKN/yesL9fE1W0bc=;
	b=WXHbKcbSGoo1R64P8vFikbmdNexyhoAq6MBBDz6RbZbqaaDg+UST64q94hkz+01LQ7KR
	 +scL9LC7zgAGssHHxOV0/05QuHrqIBCO6vSqS6mdr+onuVinPiY/w3zCE8FPrhZkCcfLH
	 cNoKQrCbWzOAVkuUvcUORsN5Xw5aorpBf2+Fzr7gb9vcDpsxJYzNF6tumieve6gvRTZkh
	 JIHgWWBxV+cjjW7wa4OV+snu2oUZe0az5SGyEjOr0ShJmxFRQR/XMYXJm10YFoXJcJb1A
	 MNwH9Ego1g3FJTuNHB1Yvmkucobe7Islk1ZVsBBYG7TUoIrTCN6l10SO3wVCmvYFrqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJ29nQ6W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA6606A32E;
	Fri, 13 Nov 2026 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GJ29nQ6W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB7B11F000C4;
	Fri, 13 Nov 2026 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794575739;
	bh=yvhlxOGFoi+F89HZb81WEWWCtAriKN/yesL9fE1W0bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GJ29nQ6WIGvF8JVYs2JZMcTsWEkzImBzzGDFzX8r0fDxClOuANRbRSPcpsJ99LUjo
	 UXzWh61HO+AoMseZGTUTag/cgVVqxw/kGh+g3Nv0nGedjCIgCBFB1f6m4zO/S40x0g
	 Ckg72tcAKRCalaWOcq6C7K/iQ/jX4FJnWe7rG8OUCKVVh9l4ACdiX/i35YYIHDbL7V
	 iD7q8lZsOnah1LvHLWuZcTJJGXaBUQhrpWqu830Vl4OFpqRkJec4/l1fqdjJKiVgOF
	 m+9EXEcjx0Sboo3hWL34Is64MFZjMuHKaYnaCGuew195N2wJqP8pmDYqsjidUSx8S3
	 fxCcWZbFpwEAQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 13 Nov 2026 14:15:11 +0100
Subject: [PATCH v6 4/4] rust: page: add byte-wise atomic copy methods for
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
Message-Id: <20261113-page-volatile-io-v6-4-5603e527c919@kernel.org>
References: <20261113-page-volatile-io-v6-0-5603e527c919@kernel.org>
In-Reply-To: <20261113-page-volatile-io-v6-0-5603e527c919@kernel.org>
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
 Lyude Paul <lyude@redhat.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Robin Murphy <robin.murphy@arm.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7076; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=KOumkcBKKQnKcYp/427flD2XnfNuZuXlo0hy9wCqDLs=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq9w1ixJUlB47IAs5cIvFmX7PsOHf0fQsjlvpao
 08Z8uXo/1eJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavcNYgAKCRD6UCkIqsW9
 0KsxD/0UwZ+rTNEFCanJl5VjcEZ5cUWxEBI/aCZZuuadlZDob7YoQq4L5tqhvyKdRHCclshmn1I
 +ADU3PoBbQvkLS5OyCMiznxR9+FrxF5/ruOao1+HkU7WPXVBFEZ8BTJta6jHFHWdnfxfZMIbtUw
 jOQkbSXZ6g5GT7W+LOcozBKBcg5Gc6cWii49/1hNUdJIqZD9o+9OFqa4F/DUQo3gpSLB//yF6m5
 rB7+UGO6EpeEoxj/S8296z2u8Zo8LWuHDuQgEcU3IGcSAk888mXgA20/CTTTK3Pv44sRy4q11oY
 PFAbrvxo9JDMvzSozJrIb0NF4qOgwN403X6DR7z0F7Dnu30huERQuQ79DEkRyX+oWmHB90FYfRc
 PiXB3jBeL0SaoNcjzbtDm5DLGrUSwXQJ37V9xvlaB6/I+p/A/9B/+/BoH2KdrmqV+3/KnaP2VJQ
 8oy+JpB8VuGmHVWaebupbTxt4tVQbLCQks2W5zUp3dy0no5EH5yYWxSH0b/luHqQwLKzB0obA0s
 EKoit2r43/A3ovHRDqyPJKLV3NcNS4pDdKL85HfH2IixMNYiIm6Quv1iT9shzPqHSyvGQKlKoqF
 NZP6KHs4vN62kmbizXw9u8KvtFEuBUAiGEx9J2Ho47KeM9hb1rqBId96dYpTVgl4cDgIds9fWXU
 nFN9KL8VSCw5IVA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When copying data between a `Page` and a buffer that is mapped to user
space, or otherwise shared outside the kernel, it is impossible to
guarantee absence of concurrent memory operations on that buffer. Copying
with `Page::{read,write}_raw` would be a data race in that case.

Add `Page::{read,write}_sysmem`, which take a `SysMem` view of the shared
buffer. The accesses to the buffer go through `SysMemBackend`, which uses
byte-wise atomic operations, so they are well-defined when racing with
external actors or with atomic accesses from other kernel code. The page
side of the copy uses plain accesses, so the page itself must not be
accessed concurrently, as is the case for `Page::{read,write}_raw`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 121 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 1c0796ea229f..e96e95182406 100644
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
+    /// unsafe { page.read_sysmem(dst, 0)? };
+    /// assert_eq!(buf, [0u8; 16]);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub unsafe fn read_sysmem(&self, dst: SysMem<'_, [u8]>, offset: usize) -> Result {
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
+    ///     page.write_sysmem(src, 0)?;
+    ///     page.read_sysmem(dst, 0)?;
+    /// }
+    /// assert_eq!(buf, data);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub unsafe fn write_sysmem(&self, src: SysMem<'_, [u8]>, offset: usize) -> Result {
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


