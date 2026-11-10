Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321954;
	b=YBidINoJeGJJ4DRnHIlIVz0mdE7BzU5R7HDes1w9N3hrJ4KVX65swYHotlYOvsX2MFH8
	 +S1ilVbGheynEhQwp1b7VNQOz4eiSAoh+tleKn0nES0YYkq4JCfqI8rIcngb3y855MrLX
	 0bSPhHz+SX2zA1+TalM4RUjJftXMvA8DsiVoJlMxY4RF+rVWsQm4j2eJ6utNPbIrDkuLx
	 ugmClQhPW++UV9uwcCMfV7R6yR+tMfYZtt52UdS1R5WjhvxVx9oATB2GgFCBj15DY+O3h
	 CA0Bnr5y/R708nzOtAzLsjv2kt8C6Tnw+RQA4vlp1tV4QHVbwTbNxxPuW+B7CDCUylQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321954;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=qB8QIbiIHt/Gn3tRmcosaPIBr7WjlDser9SvjhxhbVg=;
	b=RAg9qSUhAPsyqny30o1BXllDWplMigBHa1NegoL4R/Vwka0aS4M4qAADehnANHOwQX1H
	 asl/zrAVm+ZHb7BLlsV+PRk77HDnJSQSBzUvCEXxFo9DgOXw6vyem/BvvrTGHEt021dYJ
	 Y+CGxOjFuFM6Sx+hLPlm4tYYwPpIzkOQ+Ce3Zi3KkQ430eywvu5QhCy41o7EoeuZ8+ifA
	 GWfXR8v/S8B1/+wrPH6mzazEZUyAYknDjCIBx9yW/dMfmvBGsznUzKjb8gfbENtoan1Wf
	 JgwupfSXfDvstfDwvOoCuZ2KS+QllBRB6EbLJ7FQRuY+KbaZfSpIKDFo29cgYn+X4yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+7JbBMV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA460A3820;
	Tue, 10 Nov 2026 14:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+7JbBMV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7731F1F008A7;
	Tue, 10 Nov 2026 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321953;
	bh=qB8QIbiIHt/Gn3tRmcosaPIBr7WjlDser9SvjhxhbVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N+7JbBMV8sLscENyAhJtuedyeQjMmFFgfeEAk1r0Z8wp78yUAcB/2gdxwhNetgCDD
	 XdMN910RlK8ALS+je/3pQI7Rd8g9fhNeurI5F/+7etvJpx/+w8JMpb/xU4riKLQZ19
	 bRgDr2AXCSFIOMXO7odQz5NjfuLDD1NsvKH25IVXQ/VJbwUCmLAJk0cjrrxeXI5Xrm
	 14BsxL0q7oUwwIyOPEQC4Dc494C/P7R4Y8pMC+armK2CeJ/dWMmicLYp6WZ/r8/Bec
	 2LPUVba54ndaOrmMuMl1L+/VlL+Edxnt5/oP3HQ/6WSSHWwzNlZt1J+8M3Q5h/B9Xk
	 w0q9Z6JFwfcEg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 10 Nov 2026 15:44:19 +0100
Subject: [PATCH v5 1/4] rust: io: require freedom from plain accesses for
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
Message-Id: <20261110-page-volatile-io-v5-1-a91ef252c24b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6848; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Siw5eLJqotabo4QOvIdp7fN0xbzQlulA+dafqnLBH/o=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq8y37OtARtVww4XjAv40L0m0Z45DXmMaiHLLq+
 6x2gsjXQ8eJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavMt+wAKCRD6UCkIqsW9
 0ELBD/4vzQEimedxgnipj9APetdRFUKT1mPz+0I53BswuoS3vhHh4XYpYLYqD9nWpB91P6x5jEm
 8qi1sefXrG4rQGcZGa8rZtKQv51YZqaPCkMOJV9eY2YAiMC3eezINvJT/rVQkN2cF+baPbo2X8P
 IGUEVJ+zDm90SKEhwZDzlZ8QHfgFJRiTEjmmnFAIH1mTyHYI4pm97yaYg/Fa3x8dzwBAFrndfog
 AZFVhOgpAYKH/EX39TvY/kyOE3zCGLL3ONIvGHXW3wfygI6e9U1sUDz7uhqSQsKCPmmDvWd5vtT
 50tdcZ+2CVK7QrcorDCImPosf7ktSXEvP25xojplnoaQrO7dWwU4mrK/9yamfKBk3ZKDDZE5GfP
 AnH2DkMkISGYGwSKn/mPPTZAmWZg8npHEz2vV9mVouWLm6ztSn+XIejErfEbdcceQ5fG4yauvNT
 2ngsviLQdUWeG4bZefLYF7GUVOZGOcEbQbSG+988U3Ih5dU7Ay6xUcS9uaVl9XFujbbH4OCwtnX
 jp5TU1XojDBfelG1pBcmhJ8O4BmF/DnzrGIEWjxF56kec/DL0+YkqJlqlBM0DqHQigSloqNZeiL
 Jj+TK97k7XFQR835HgG7wrYHGwRJDFouP0LRW8DNab6XqpwOAaPXVJCgjTdUqDWstmbzEosUQ+d
 jJtu07lzK1qRSmg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`SysMem` accesses memory with volatile loads and stores and with the
kernel's `memcpy()`. Both are well-defined when racing with hardware or
user space, and when racing with atomic or volatile accesses from other
kernel code. However, if they race with plain, non-atomic accesses from
kernel code, they are considered a data race, and therefore undefined
behavior.

The invariants of `SysMem` only require the region to be valid and
aligned kernel accessible memory. Nothing stops a caller from creating
a `SysMem` over memory that other kernel code accesses with plain loads
and stores at the same time.

Make the requirement explicit. Require that no plain access to the
region is performed for the lifetime of the view, define what a plain
access is, and update the safety comments on the backend implementation
to rely on the new invariant.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/io.rs | 46 ++++++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index a877df11a03e..3bc4be35e355 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -1452,7 +1452,7 @@ unsafe fn project_view<'a, T: ?Sized + KnownSize, U: ?Sized + KnownSize>(
         ptr: *mut U,
     ) -> Self::View<'a, U> {
         // INVARIANT: Per safety requirement, `ptr` is projection from `view`, so it is also a valid
-        // kernel accessible memory region.
+        // kernel accessible memory region that is free of plain accesses.
         SysMem {
             ptr,
             phantom: PhantomData,
@@ -1470,8 +1470,9 @@ fn io_read(view: SysMem<'_, $ty>) -> $ty {
                 // SAFETY:
                 // - Per type invariant, `ptr` is valid and aligned.
                 // - Using read_volatile() here so that race with hardware is well-defined.
-                // - Using read_volatile() here is not sound if it races with other CPU per Rust
-                //   rules, but this is allowed per LKMM.
+                // - Per type invariant, no plain access races with this read. Racing with atomic
+                //   or volatile accesses from other CPUs is not sound per Rust rules, but this is
+                //   allowed per LKMM.
                 // - The macro is only used on primitives so all bit patterns are valid.
                 unsafe { view.ptr.read_volatile() }
             }
@@ -1481,8 +1482,9 @@ fn io_write(view: SysMem<'_, $ty>, value: $ty) {
                 // SAFETY:
                 // - Per type invariant, `ptr` is valid and aligned.
                 // - Using write_volatile() here so that race with hardware is well-defined.
-                // - Using write_volatile() here is not sound if it races with other CPU per Rust
-                //   rules, but this is allowed per LKMM.
+                // - Per type invariant, no plain access races with this write. Racing with atomic
+                //   or volatile accesses from other CPUs is not sound per Rust rules, but this is
+                //   allowed per LKMM.
                 unsafe { view.ptr.write_volatile(value) }
             }
         }
@@ -1519,8 +1521,9 @@ fn copy_read<T: FromBytes>(view: Self::View<'_, T>) -> T {
         // SAFETY:
         // - Per type invariant, `ptr` is valid and aligned.
         // - Using read_volatile() here so that race with hardware is well-defined.
-        // - Using read_volatile() here is not sound if it races with other CPU per Rust
-        //   rules, but this is allowed per LKMM.
+        // - Per type invariant, no plain access races with this read. Racing with atomic or
+        //   volatile accesses from other CPUs is not sound per Rust rules, but this is allowed
+        //   per LKMM.
         // - `T: FromBytes` so all bit patterns are valid.
         unsafe { view.ptr.read_volatile() }
     }
@@ -1530,22 +1533,31 @@ fn copy_write<T: IntoBytes>(view: Self::View<'_, T>, value: T) {
         // SAFETY:
         // - Per type invariant, `ptr` is valid and aligned.
         // - Using write_volatile() here so that race with hardware is well-defined.
-        // - Using write_volatile() here is not sound if it races with other CPU per Rust
-        //   rules, but this is allowed per LKMM.
+        // - Per type invariant, no plain access races with this write. Racing with atomic or
+        //   volatile accesses from other CPUs is not sound per Rust rules, but this is allowed
+        //   per LKMM.
         unsafe { view.ptr.write_volatile(value) }
     }
 }
 
 /// A view of a system memory region.
 ///
-/// Provides `Io` trait implementation for kernel virtual address ranges,
-/// using volatile read/write to safely access shared memory that may be
-/// concurrently accessed by external hardware.
+/// Provides `Io` trait implementation for kernel virtual address ranges, using volatile or
+/// byte-wise atomic accesses to safely access shared memory that may be concurrently accessed by
+/// external actors, such as hardware or user space threads, or by other kernel code using atomic or
+/// volatile accesses.
+///
+/// Accesses through a `SysMem` are never plain accesses. A plain access is a non-atomic,
+/// non-volatile access performed by kernel code, whether in C or in Rust. A plain access that
+/// races with any other access to the same memory is a data race, and therefore undefined
+/// behavior. Accesses performed by hardware or by user space are not plain accesses in this sense.
+/// Racing with them is well-defined, but the data observed may be arbitrary.
 ///
 /// # Invariants
 ///
-/// `self.ptr.addr() .. self.ptr.addr() + KnownSize::size(self.ptr)` is valid and aligned kernel
-/// accessible memory region for the lifetime `'a`.
+/// - `self.ptr.addr() .. self.ptr.addr() + KnownSize::size(self.ptr)` is valid and aligned kernel
+///   accessible memory region for the lifetime `'a`.
+/// - No plain access to that memory region is performed for the lifetime `'a`.
 pub struct SysMem<'a, T: ?Sized> {
     ptr: *mut T,
     phantom: PhantomData<&'a ()>,
@@ -1570,8 +1582,10 @@ impl<'a, T: ?Sized> SysMem<'a, T> {
     ///
     /// # Safety
     ///
-    /// `ptr.addr() .. ptr.addr() + KnownSize::size(ptr)` must be valid and aligned kernel
-    /// accessible memory region for the lifetime `'a`.
+    /// - `ptr.addr() .. ptr.addr() + KnownSize::size(ptr)` must be valid and aligned kernel
+    ///   accessible memory region for the lifetime `'a`.
+    /// - No plain access (see [`SysMem`]) to that memory region may be performed for the lifetime
+    ///   `'a`.
     #[inline]
     pub unsafe fn new(ptr: *mut T) -> Self {
         // INVARIANT: Per safety requirement.

-- 
2.54.0


