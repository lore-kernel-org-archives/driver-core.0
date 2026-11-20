Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170513;
	b=I1n+z/sEqFp0rPrqMQyql+mRMFOOuAgFEQXH9jeL+n36KhguAavcpuZGwn1ixQTtVhMc
	 L+u42rE7KM7pJ3vvDo0ow2I8+yEAJXvjZ6RZcB4ZeeKdcAtM9NSCbss7ywNa62HwAIuuU
	 Nb9iFu56mgRt2Jcew7LilU2JxBVrLIwotlA11zidf/4TKvzGGvvg0PN8qfi5e6Ngwkv3g
	 CiB9rvRjeI2EsEiF5X3bb00Y1CetlzN+N/uV7X5WvD+UDHYzDKCwMKOuYUlIXjT8TgBTH
	 0O3uDyyswFKf7Gt0DciuGrKsagySG9mjyVMsABopZPTMZ8c6ueaGgLrHKwK3elm8WqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170513;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rBLyy8yIWs7igApO2EIce+czdiY6vYX188Cradx6Qoc=;
	b=5Mq3XzW+dbUyaq1fZSoDIzuwQ0G/oDQ8kbp567SFGUrSSeWOBtD69i/oX0YBhqpYR0a2
	 GNfaRHwIRJKH4pCnR+V3W/K3k5B7BWK/tNg1NCbCqsPif6VcQ+F/MqFsIiySD3CsBztva
	 LG1oRg1BgxdyGe6j9N06zPjcVQM4dZg+8zDXS4ytwnqjAA63CUhAQ+0Bm1iov9Eb3Ap0g
	 gh/4CjtRZl8wd6Jz5zaY8Cwc2dNRDcI4LIb5fLSDDBlGmwmhDRbasKU19hTB9PbHxJvhe
	 Mdu6jiAbjcKBNnkCMNaHx5Qg0K1bk0KSWg9gvy1hjADvHRiuAplLm9YIeuk5Qvu+l0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdzf7kP1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CA860A263A;
	Fri, 20 Nov 2026 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdzf7kP1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 517F81F00ADE;
	Fri, 20 Nov 2026 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170512;
	bh=rBLyy8yIWs7igApO2EIce+czdiY6vYX188Cradx6Qoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jdzf7kP18P89AhI5FqPZU2Eu+JFmD6PUkUTX4HzGAiP0a868cfL/NsNzeb0PotnA5
	 +h/mGa/sADisw9xNoTkrsH3ISbgmlL8tqeG8T/wmb+LJNwejmrOk2BTjYVM2R8rQ2V
	 OsVOi2Z3THNYNjHeBMDIxRzcBLGGVnPKOkr+DNvCr6Jlwv08fMMv+lw38PlmrVXPCi
	 lJ3WwH8DKzN0mkIWfR/vJZANbEAcp7qGrDxjbIb1EqBFQgLdl2F2mQ7/UWi5PpgMW4
	 BsF5L0GmCvdFZZzuIi3NvvPoxrASAP01g7QmH1tkA2EPS+g+/uGY/rdUyGxSe8kXMY
	 Ml0zOMPfm2zcg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:08 +0100
Subject: [PATCH 09/11] rust: page: add `Page::with_page_as_sysmem_local`
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
Message-Id: <20261120-page-shared-v1-9-66f8c4c62822@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6313; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Pp912Hpst4UEXsVK2CKEGwo1oxgZi8R2rnnTjQvDyoA=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCJ7AdUaY6xLJpeqXzITlzXG3r0yvC2GtUG1
 xtiZOi/m3mJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAgiQAKCRD6UCkIqsW9
 0HLDEACjH6w0dhSioz0cwNL8k77aa9fTdw3uSbiJWfLc50rRLz9V4uIMtbybohoSr2dJMRTclM8
 Ejkjlluk3t3nuKcTZ9sHXt7NnflUas4if0fngSbKZsKbxVoLc43EB60uplIICy59PttPPQ00ujX
 2AH3xClkXxiJGlTwhvtsqEik2+zuKJT27DhNTlolHIXlpXsklkwQqBPavEZd6VQNVXEvf9e/Cul
 IGV6FCs7mjax1vhhjMg+TvbcvnohIQvCVtr7SJuwfu8kfIf8DHRDA1r4WAUVPUTI+5B/UXKNiYL
 7JeNlICW5p7AVCVI99nmrr4dg7npPbwaku6M9YIhq4L+DsYASMepqDsqlwpfBjF/Jn1seaGuypk
 i4GEDa4WsQ88HXldXHIeVXIm3uixQcgnkAmO6zoHknRUEfiAVo14UiM9MhdMsPAfeuOf4jopTBj
 uyKBN0cQO2qBH1BVF4QKvnw3ZA0rJO15h5osD+I1Q76dy3+gbw7pViYPs6nIXthHR5nEHYiV7Tz
 mtE3oVQUZL3ApX7zc+HFXvnpvDL0IVi+vBCRTx3cFOacdFAsa8VjKStFni21qjILLcjY6AcE6dz
 AAYeKnV1fXLiIu/CY0yS9d6VtsoSud3vlVC5g94mRJDvTf+s6IDbFJYsHutEmV5+6p3cEkDNWJU
 2xrtgBlHAnA+99Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The data of a `Page<Shared>` is initialized and is not referenced by Rust
references, so it can be accessed safely with byte-wise atomic operations.
The existing accessors of `Page` are available for all page kinds and are
thus unsafe: a write can alias a slice obtained from a `Page<Exclusive>`.

Add the safe method `Page::with_page_as_sysmem_local()` for
`Page<Shared>`. It maps a range of the page and passes it to a closure as
a `SysMemLocal` view. The view is not `Send`, since the mapping that backs
it can be local to the current task.

A `Page<Exclusive>` does not dereference to a `Page<Shared>`, so the
method is not available for it.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 85c710fa3dfd..7fa037f5938b 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -20,7 +20,8 @@
         Io,
         IoCopyable,
         SysMem,
-        SysMemBackend, //
+        SysMemBackend,
+        SysMemLocal, //
     },
     sync::aref::{
         self,
@@ -132,6 +133,8 @@ impl PageKind for Base {}
 ///
 /// The data of a [`Page<Shared>`] can be accessed concurrently by other parties, such as user
 /// space, devices or other kernel code. Thus, no Rust reference to the data of the page exists.
+/// The data is accessed with volatile or byte-wise atomic operations through a [`SysMemLocal`],
+/// see [`Page::with_page_as_sysmem_local`].
 ///
 /// A [`Page<RefCounted>`] and a [`Page<Frozen>`] dereference to a [`Page<Shared>`]. A page that
 /// is managed by other means can be referenced as a [`Page<Shared>`] with [`Page::from_raw`].
@@ -374,13 +377,14 @@ fn with_pointer_into_page<T>(
     /// Runs a piece of code with a range of this page mapped as a [`SysMem`] view.
     ///
     /// If `f` is called, then it is called with a view of the `len` bytes of the page that start
-    /// at `offset`. Accesses through the view are volatile or byte-wise atomic, so the view is
-    /// suitable for a page whose data is subject to concurrent writes by hardware or user space.
-    /// The view is valid for the duration of the call to `f`.
+    /// at `offset`. The view is valid for the duration of the call to `f`.
     ///
     /// If `offset` and `len` refer to a region outside of this page, then this method returns
     /// [`EINVAL`] and does not call `f`.
     ///
+    /// This is the building block for the accessors of [`Page`]. Use
+    /// [`Page::with_page_as_sysmem_local`] for safe access to the data of a [`Page<Shared>`].
+    ///
     /// # Safety
     ///
     /// * Callers must ensure that no plain access to the mapped range races with an access
@@ -658,6 +662,83 @@ pub unsafe fn copy_from_user_slice_raw(
     }
 }
 
+impl Page<Shared> {
+    /// Runs a piece of code with a range of this page mapped as a [`SysMemLocal`] view.
+    ///
+    /// If `f` is called, then it is called with a view of the `len` bytes of the page that start
+    /// at `offset`. Accesses through the view are volatile or byte-wise atomic, so the view is
+    /// suitable for a page whose data is subject to concurrent accesses by hardware, by user space
+    /// or by other kernel code. When an access races with a write, the data observed may be
+    /// arbitrary. The view is valid for the duration of the call to `f`.
+    ///
+    /// The view is not [`Send`], as it can be backed by a mapping that is local to the current
+    /// task.
+    ///
+    /// If `offset` and `len` refer to a region outside of this page, then this method returns
+    /// [`EINVAL`] and does not call `f`.
+    ///
+    /// This method is not available for a [`Page<Exclusive>`], as writing through the view would
+    /// violate the aliasing rules for the slices returned by [`Page::as_slice`] and
+    /// [`Page::as_mut_slice`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::{
+    ///     io::Io,
+    ///     page::Page, //
+    /// };
+    ///
+    /// let page = Page::alloc_page(GFP_KERNEL)?;
+    /// let mut buf = [0xffu8; 4];
+    ///
+    /// page.with_page_as_sysmem_local(8, 4, |view| {
+    ///     view.copy_to_slice(&mut buf);
+    ///     assert_eq!(buf, [0u8; 4]);
+    ///
+    ///     view.copy_from_slice(&[1, 2, 3, 4]);
+    ///     view.copy_to_slice(&mut buf);
+    ///     assert_eq!(buf, [1, 2, 3, 4]);
+    ///
+    ///     view.fill_zero();
+    ///     view.copy_to_slice(&mut buf);
+    ///     assert_eq!(buf, [0u8; 4]);
+    ///     Ok(())
+    /// })?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    ///
+    /// Copy data from user space to a page:
+    ///
+    /// ```
+    /// use kernel::{
+    ///     page::Page,
+    ///     uaccess::UserSliceReader, //
+    /// };
+    ///
+    /// fn copy_to_page(page: &Page, reader: &mut UserSliceReader, len: usize) -> Result {
+    ///     page.with_page_as_sysmem_local(0, len, |view| reader.read_sysmem(view))
+    /// }
+    /// ```
+    pub fn with_page_as_sysmem_local<T>(
+        &self,
+        offset: usize,
+        len: usize,
+        f: impl FnOnce(SysMemLocal<'_, [u8]>) -> Result<T>,
+    ) -> Result<T> {
+        let f = move |mem: SysMem<'_, [u8]>| f(SysMemLocal::from(mem));
+
+        // SAFETY:
+        // - By the type invariant of `Page<Shared>`, no plain access to the data of the page races
+        //   with another access, and no Rust reference to the data of the page exists.
+        // - Safe code can only write initialized bytes through a `SysMemLocal`.
+        // - `f` converts the view to a `SysMemLocal` before it is used. A `SysMemLocal` is not
+        //   `Send` and it cannot outlive the call to `f`, so the view is only used on the current
+        //   task.
+        unsafe { self.with_page_as_sysmem(offset, len, f) }
+    }
+}
+
 // SAFETY: By the type invariant, a `Page<RefCounted>` is managed by the page reference count.
 // Incrementing it via `get_page()` keeps the page alive at least until a matching `put_page()`,
 // which frees the page when the count reaches zero.

-- 
2.54.0


