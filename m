Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321943;
	b=ruwSshGClfjhGgHfC14GKWulOrhVlrlAv4uAkQ5x0KUNC53PJcpa2mo/rgv5rRTucw07
	 M9xdnDqd/p0wjvxWJpMfDhv9Jhb3V8wXWh7Z8alIpzQh1vrIEWII9XJQZuECrP/s6q2ph
	 pAyhn3iK8BTWPJFQExzKQBM7GzoOuJB6ZESKLGxSC8wadbpQuH7n4rD39zLo8Tf5yCddh
	 XXlgcsszpu8J8JztXUPVcheKU/NEzNFjhwPBErpJSHGM149lQGgEfnp2uY+bS2Cf4dqf2
	 a/SuWKBkvQ3rbwh3tvLFQbUPat9GY7lrRlUgEYmUF+VNshKGsji7NgrCAZ6Elsf8WoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321943;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=An+UoRcLcybFqNhUI1VVYZuVSsp+y+lorKmzt3et7Ns=;
	b=2oosL7k+k1IWKogGfO180V/gceVNIXH2pIj1Em3zjYt2nOSDgNNReAGZkfj9CEcXpWF1
	 ExHUHfw2/cRsvsY2hKlCNBNSXH8MPLCsFL0WHrfV+oMbKM4QzJBG+07x5MhpyfRNUPLt5
	 GrT5uQ5TmryMah6D898eFJoBqSiNqm61CUodMez52V6YkJBBgNjLYvQ39UcrCqvI1+tDn
	 uVO+q2335LAJySw0dWb8lM7owIg9dzeGZftHX1pqEZEC4c/2qC/KH0ZjQrKLl4Cg+1CCJ
	 1HDs8xqSaXDrDaUGIFg4ecjrnq5jKB/pleLDCjNCzma3B2biG/zNMj5wCSERKGui/Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGMx1MEc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846C360A2628;
	Tue, 10 Nov 2026 14:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGMx1MEc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B861F008A1;
	Tue, 10 Nov 2026 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321942;
	bh=An+UoRcLcybFqNhUI1VVYZuVSsp+y+lorKmzt3et7Ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=MGMx1MEcAJ02/s0uZKDaJPBGmlNnl7Xe5abC+V05BkKzNvOlPRaRgXr/qjLtzKBic
	 6+lQFkBXjcHNgbXJ55Js6Gl5KeqEAJbz57XF0OKtxX/Of7+BXdkT+CMBrP10Mj5/L9
	 RIIhJne3dh1syLZu3Lhpe6Olsuf6AGFnvz4rrTA/wWNPApf4d0FwLlXJ140fnTqmyk
	 36V3TbugSZ1WAtGIVOHN84kX5e8qHyofRilwd8pjC7/PtqiZ5E4j1gCJhCj6ARPSpn
	 9I9sp0028Ed7JDHwSvsz6wknf6RP1Sclsh0pK+50bN6Vc8ScwO/ydC+zaMs9oBFV0z
	 5ZrdWHshIRH/A==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 10 Nov 2026 15:44:20 +0100
Subject: [PATCH v5 2/4] rust: sync: atomic: add atomic_per_byte_memcpy
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
Message-Id: <20261110-page-volatile-io-v5-2-a91ef252c24b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3203; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=tp52aAy+Z9rAYPQRdCxlgmWEe36E+phNN7n1uPpdvBk=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq8y37IKKLgvx5fqPNBPuoiU4OEBMG4lqThQRZP
 lvpw/uEHfqJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavMt+wAKCRD6UCkIqsW9
 0BOdD/9VeKOwu5P6ufuouj286hXDgR1+enxQQwIIjBFPmpdiJ59HrJFYd7YHhHlJW00gFgfzb8U
 6m1K7p4or46AkJqBHSJwJ+3KvowOvVzsrG7ZJKY3Z3U3ecjUFRzOwZQj6jVBddVNXjLdepxPQK6
 2mHh3aAaEJ5/GFg3LeSIKJrYjg2DO52aD6Lsj6v16mYdBYZttxJUWZ4GV4FZ7Jlj6qCBhFkZDzs
 XDti1gKrv0rpkVRKzK1bNgFX9K5JzG1dv/gTcf2GPyp54QAsz9h7IdQM60Iwj9cxVgYEy6w0RxH
 Ij/zQ8YT2Ls0qSnBVldf43gOoNRRqDAnM4jwd0OESLXa9C59q1WMANNAIHMXxEF/x+63VYvKxR5
 59uI/VQ8Xe9C67YeZ8pWZnO2XqKq3YzUk2/utI54CkV4gTpysYHSqluH8+nHQMRXxpOLCP+0JA/
 thyhckgKTGWKOvsLVY8jJkIXbbbGXGBJ+JtkGgDe7V1NglzyrjAY59xsHop4ZBKGZSS43jvJCtn
 NOKTt++5YkVvI9PBK6O6kM9iQvKIAgwFF+Yky8fgB6ntVlp+L1CmXLa/TkQ3DFoN/mqvLITwLx0
 uJGH7tK8lSv7qbrt8xeh21vsd3R6An4Bi8JCVTJ5d2zTo3UiJILb3VZqs/qWmPKnlz8paxcbOfv
 KwskIu09jtvi77Q==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a helper to copy `len` bytes from `src` to `dst` using byte-wise atomic
memory operations. This is the concurrent-safe counterpart of
`core::ptr::copy()` (the equivalent of standard C's `memcpy()`). Because of
the atomicity at byte level, when the copy races with another concurrent
atomic access (or when a normal read races with an atomic read), or with an
external access (from DMA or userspace), the behavior of this function is
defined: the memory is copied at (at least) byte granularity.

The helper is the building block for higher-level copy operations that need
to remain defined under racing accesses, such as the `SysMem` I/O backend,
which copies to and from memory that may be shared with hardware or user
space.

The implementation forwards to the kernel's `memcpy()`, which is
implemented in a way that byte-wise atomic memory load/store instructions
are used.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 6d27898add42..cbcb081d8674 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -848,3 +848,38 @@ pub unsafe fn cmpxchg<T: AtomicType, Ordering: ordering::Ordering>(
     // per LKMM.
     unsafe { Atomic::from_ptr(ptr) }.cmpxchg(old, new, o)
 }
+
+/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
+///
+/// This is the concurrent-safe counterpart of `core::ptr::copy()` (the equivalent of standard
+/// C's `memcpy()`). Because of the atomicity at byte level, when racing with another concurrent
+/// atomic access (or when a normal read races with an atomic read), or with an external access
+/// (from DMA or userspace), the behavior of this function is defined: the memory is copied at
+/// (at least) byte granularity.
+///
+/// Implementation note: this is currently implemented by the kernel's `memcpy()`, which is
+/// implemented in a way such that byte-wise atomic memory load/store instructions are used.
+///
+/// # Safety
+///
+/// Callers must ensure that:
+///
+/// - `src` is valid for atomic reads for `len` bytes for the duration of the call.
+/// - `dst` is valid for atomic writes for `len` bytes for the duration of the call.
+/// - The memory regions `src .. src + len` and `dst .. dst + len` do not overlap.
+pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
+    // SAFETY: By the safety requirements of this function, the following operation will not:
+    //  - Trap.
+    //  - Invalidate any reference invariants.
+    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
+    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
+    //    atomic semantics.
+    //  - Copy between overlapping regions, which `memcpy()` does not support.
+    unsafe {
+        bindings::memcpy(
+            dst.cast::<kernel::ffi::c_void>(),
+            src.cast::<kernel::ffi::c_void>(),
+            len,
+        )
+    };
+}

-- 
2.54.0


