Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321937;
	b=l2VLMtXm3kN5UgrANbyIZ/12hsPoWRhKMwaHMTD9vpLmHsEhDYosuWLC12mR9Tm1hoSP
	 4j/4DcLI0U149rxZXMcrHtiaXZZHqWw5HXdSBadOTa4XLc+Z7gjp+O8g6yo095dq7LbDE
	 vhFbkUyMRoGP2knZOqgL+9E80GGr4oRqjxKkdquylYFZJMXaMR45r6xgula9UbRamvqjP
	 wtcg/vDbtesWF2IIocEyFxCIcv0MHKfpwMkaLWB2N5hdg4W2rylwrGfUuqhlOFAm5Xgjj
	 WHIhYZ4Xem099vshESqB3mlHyt+DzBtJSgd628ue+y3Dzo7We6ap35e+QuBwAn/pd7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321937;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XPqP3AioUFfQKztBBWV3IZAPOrIVFlq4HM+xiknXRb4=;
	b=SlL0ktTwH8DebTxFPY/pyjZhQDCFWubvC85E9/g9GjiX5FKSuV0X6kollDOLUpeMkGb4
	 HZ2j2kKJeQ3LGbMdbt66uLkuxpc2dOVBZAX26yRRAr4iq3jiDXNofDbXTe/MYSGEVRDGT
	 SIG8MRZGV+Jm3uItbIEzZVi3xTUjK3gw0w4FQLPL9sbnGiLn7BvfB5uEqSltpjpvKnNJ0
	 054ZeX0zwkuy+Of/DWruNfGkJjkjbQntVvkE90aHup5MyuTKcOtcbciaa7xl+qYlC1cdD
	 nioD4ljpK2h3hqAIaErkLK5NtZ/Dndi7RDOdxkBtNOWd2KhTJEr7PKOwXf7GAPn95Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d92FgsfQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DF606A336;
	Tue, 10 Nov 2026 14:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d92FgsfQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EE71F008A1;
	Tue, 10 Nov 2026 14:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794321937;
	bh=XPqP3AioUFfQKztBBWV3IZAPOrIVFlq4HM+xiknXRb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=d92FgsfQ06bGMIRNBBVMq++CZTOjMikIQlWl9oCUQKAZURpASTlq4Z6F+6Y55qQ53
	 TFDjAVtcmEcwCR/quqLIvgyzzlaVUNLseK8Cuzx0IP4uN9arM4rhYWQHBrwE70a0Xh
	 PJjE5M8TV/rEkU7o7JYVWRdWtzZkE6LNIbK9nAWFIdtt1/vR9XXihTbYFPItJGfzpl
	 C5vEYkGY6P5YWPbDhdB1yfbP4pHpOCIBWaQYrpiGlVDZaO5u1z8suH5gBcSdQzzAVk
	 6JhMMUhk5VarccDQ03OTalYm0gVddNWNfb204yQ3TwdLIjdKz7zk64+slhRAUeQQ1O
	 4mu+jhTQVo3Bg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 10 Nov 2026 15:44:21 +0100
Subject: [PATCH v5 3/4] rust: io: copy `SysMem` with
 `atomic_per_byte_memcpy`
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
Message-Id: <20261110-page-volatile-io-v5-3-a91ef252c24b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ZejpXXvNrU6pIH9Vpp03LpzkAZScISJJ50Lu4nFvg7c=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq8y38NrwaBIi3FYNgiPYhzvrryZVoOEERHn96/
 NBPqcWfqEuJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCavMt/AAKCRD6UCkIqsW9
 0EneD/4w6Y1oEGE5aD6xSAKHWCYv47PTVWmiGhedDPkieHTXGQBpadKBP2IHkYy6JdDJK6HibVl
 N9K8HYtNYMGe/vVcmrpiQPgO0H9cEIyPB58Fy07U34N5AiumBgwzQoNx976zBlAsoxniod7pB1I
 8GZ5YkoS/0cdYxrIM64zZ1Lx6/us5BN6t0c1HmNgj7DRtW4MC5zS+ZdIX5/2vLi+QWDpRvoaSrj
 w/7V6QbpRflEQQBTAvhsvZY1zabrOTXYAsfoYw0GOBidAtcJti2KJDY72f04aDGBNzFar5pcy3C
 29Cmh9dQ/x2IqVTFp7rPHJfM0AhEJrEIe8qR+YM1+RRA3RuFlJL/gBF7PRSLceMwy2Gwg1FZLkd
 olyWcGytdvG0zs/dxRLuS0fxGVkL1vvPUcVRbbm4VHwt44322BQvTTWGuk+uHKXoTTPHV4dCLDt
 vX8LwtlO7uCcWL76rbopVIAO0gnFQ5Lw61QFuIpqZEhq4xf65xDN77YfFYS7a6JwrFKrdWB25df
 c+8mE57hyPOspEYjZ4JN+jYJeyBIo4rshIaTdUtcut8xTzJBZ6kPwlpBHu1NXpmG7O64J9Jsa60
 sgBRnazS/th+CpJS3ENdS07gLYRiuFW7xmMEOVSd8ErSVbUFKn/DUfxcj80bTumOxwGYQ4VeBsF
 uWzR1608VBa1DEQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The `IoCopyable` implementation for `SysMemBackend` calls
`bindings::memcpy()` directly. The comments say that this is done "for
volatile", but the requirements of the call are not stated anywhere. The
reason the call is sound is that the kernel's `memcpy()` is byte-wise
atomic, and that neither side of the copy is subject to plain accesses.

Call `atomic_per_byte_memcpy()` instead, so that the requirements are
spelled out at the call site and checked against the invariants of `SysMem`
and the safety requirements of `IoCopyable`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/io.rs | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 3bc4be35e355..b51cfc04e3ca 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -21,7 +21,8 @@
     ptr::{
         Alignment,
         KnownSize, //
-    }, //
+    },
+    sync::atomic::atomic_per_byte_memcpy, //
 };
 
 #[cfg(CONFIG_HAS_IOMEM)]
@@ -1500,20 +1501,27 @@ fn io_write(view: SysMem<'_, $ty>, value: $ty) {
 impl IoCopyable for SysMemBackend {
     #[inline]
     unsafe fn copy_from_io(view: Self::View<'_, [u8]>, buffer: *mut u8) {
-        // Use `bindings::memcpy` instead of `copy_nonoverlapping` for volatile.
         // SAFETY:
-        // - `view.ptr` is in CPU address space and valid for read.
-        // - `buffer` is valid for write for `view.size()` bytes which is equal to `view.ptr.len()`.
-        unsafe { bindings::memcpy(buffer.cast(), view.ptr.cast(), view.ptr.len()) };
+        // - Per type invariant, `view.ptr` is a valid kernel accessible memory region of
+        //   `view.ptr.len()` bytes that is free of plain accesses, so it is valid for atomic reads.
+        // - Per the safety requirements of this function, `buffer` is valid for volatile writes for
+        //   `view.size()` bytes, which is equal to `view.ptr.len()`, so it is valid for atomic
+        //   writes.
+        // - Per the safety requirements of this function, `buffer` does not overlap with `view`.
+        unsafe { atomic_per_byte_memcpy(view.ptr.cast(), buffer, view.ptr.len()) };
     }
 
     #[inline]
     unsafe fn copy_to_io(view: Self::View<'_, [u8]>, buffer: *const u8) {
-        // Use `bindings::memcpy` instead of `copy_nonoverlapping` for volatile.
         // SAFETY:
-        // - `view.ptr` is in CPU address space and valid for write.
-        // - `buffer` is valid for read for `view.size()` bytes which is equal to `view.ptr.len()`.
-        unsafe { bindings::memcpy(view.ptr.cast(), buffer.cast(), view.ptr.len()) };
+        // - Per the safety requirements of this function, `buffer` is valid for volatile reads for
+        //   `view.size()` bytes, which is equal to `view.ptr.len()`, so it is valid for atomic
+        //   reads.
+        // - Per type invariant, `view.ptr` is a valid kernel accessible memory region of
+        //   `view.ptr.len()` bytes that is free of plain accesses, so it is valid for atomic
+        //   writes.
+        // - Per the safety requirements of this function, `buffer` does not overlap with `view`.
+        unsafe { atomic_per_byte_memcpy(buffer, view.ptr.cast(), view.ptr.len()) };
     }
 
     #[inline]

-- 
2.54.0


