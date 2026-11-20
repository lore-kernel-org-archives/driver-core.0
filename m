Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170465;
	b=IM5Tba9vB5qIaFsUzVadQmCWPYK9WT9P0iFwF5pqOzpvg398FcpfBEyrTWprh4MyGRED
	 rqA2NNTQHBS65FIS7mKfwOqSJmmAzBR9qio/O9SDP4NXKVQ/IY+1fgPcsoAsRdgnOYQfH
	 KL+32C20fiKLobhFPAxtBrW4FGogsP4/2OKH1K72ewf67Dd5me/Ank+0/6u1SeE7O1SfG
	 Eq/+xfVtkw1fqBQvkjqwzBvthPPoaAYB4bJ4tmXUDB56WicK9d3o8PHpXJCggLV8zCJVi
	 RpSgtq1M9PkaWftlTMm331GL0prG5RcEHzJ6mzkonAXcX8YUe26QIv+1gYzwBx3klFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170465;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=7KYA+Wpno+xuUNw/akK40o3lUtGmWfphuhg/Z0TTQEU=;
	b=Yf7SAme0xkDQLIIJMDZH4vQVWELiLlQHSC0q7IqjubaV55TxCHl3f2JKWhgkzQQX/f8P
	 m12Q+Hv7MVhIgPxZuIvY8aZSSx3DjUdN6vjsAsomg+tAWcvxcX9UOUG8VBOmLOmBR6gJ2
	 Sdl4wjFxYbMmQDW56l0xfo1Y4XYOFSJTjKOyTT3Zs2/pnR/Y/X0aUz4zjs3e6E3BqqAji
	 Y7LFfNIBmup2z/OSM4cFBDUkK0uiFgfQGv0Psoda2a7T75PyedQuUDnY5GylyHzy9PMy2
	 NmRgFUdmFDwgOJd5zJM/1ow+wr92nX+HG2DhjKwayMcfSFBte92c7e/YuAn/r06WDsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTr+KOep;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BC3606A320;
	Fri, 20 Nov 2026 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OTr+KOep
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CE01F000C4;
	Fri, 20 Nov 2026 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170465;
	bh=7KYA+Wpno+xuUNw/akK40o3lUtGmWfphuhg/Z0TTQEU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=OTr+KOep8g60MLBAKQCrEshBEPchmuOMXSSzNiDfYDzaJXqu3HxRZAVq4UpYUvfrp
	 BNEWDZppGHEYx3KsdFTiuOAupbVB7yhzegpneLPjiZa8LebnXShTZjUv/RC0wiMJqe
	 HhUTKJTEVXitq5/jU5VbeXW+ATBPZRzmigXNw7XcGdqDaiMA/jTm1NzgzyYccgo2Bj
	 ugd37PTPuQbQ3xWv88POKnwSektKKfK7p3gayOFgEIrEG/ZEnFsUWfE15xgZq2bPc7
	 +V370vwF4XpjnyCan5Imfr7uq9vRzd9E3jvEXc715B4PouGmDhMLRXnusdTr2ikE2U
	 ahE5THF+NfdMw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:05 +0100
Subject: [PATCH 06/11] rust: uaccess: add `UserSliceReader::read_sysmem`
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
Message-Id: <20261120-page-shared-v1-6-66f8c4c62822@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2452; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=b1mLSMDHWh0RGqI8T/vhs/+oAuod9tIIBQMnZx+FI0o=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCHctLDXQh/2A0OKD/teF/RQ7jo9N+QogxBc
 wj1N5Sy+GaJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAghwAKCRD6UCkIqsW9
 0AraEACwrqzkBN6VbzQE/bna+s/lAmsmvCkw068qGULDg0rL0SrfI8L2dJEM+QIrkqGV/67c8dg
 CDwxid9i/mGZHPcHm/hmNj1CvWjjWD32/WrqKDUPjiowbbXVel2TsHoz25a/wdIG9hvmyy/wdc2
 BbYIu6Bs4rGNrKAYF7Ubbgjf4rCBvP/4XuRsNnOOypJbUqJ7mU2VxEAAcJX8RvYBWcxZUNSdXw/
 0rNMkMtWTXF8188m9RP3X2UaaWpEhtbNSpzqiw8pIyd7Nlwl3ZszRwTWCQjLvVWQFAAtNT67CeA
 PaDzqJrC/jKrzKGAVgG+C4WLNKRig5N8sh1MzTXCbdzQzc8srTu7CezF0z6tzwka2fpL6/12gd3
 OS30Uxmblw2V8904LwlB/rszDV5S95GsvDqpVQ/0hrDElGUcQ7FeChIJdSsOWbx8b1j4+tGTjvj
 moqZWHug+GJMHGDNvcLB8d5ve1/IJ7ooZdqvMC5B/MGHrr6m2qVb6WsfBs17pho6eOuxdHTiwMN
 1+kGeRqCqOcdfDJPeZOPf6iRJts9Ivyvz5oxOQaLPTxQaYwWDazQxvhvs6GPPzSAlsq+l7+ZnXe
 5rwQUWoV2sx5w1W/jHR2rOveusbcQ3GIfnLWgpfA3MRiU7azXz6sVY2mg0oICEK0qN3EfLXtOUT
 tZz6+S8H8oBIB8g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a safe method for copying data from user space to a system memory
region that is represented by a `SysMem` view. The copy is byte-wise
atomic, so the destination can be subject to concurrent accesses, such as
the data of a page that is mapped to user space.

The method builds on `UserSliceReader::read_raw()`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/uaccess.rs | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index b1df79500b98..313479d80834 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -11,6 +11,7 @@
     error::Result,
     ffi::{c_char, c_void},
     fs::file,
+    io::SysMem,
     prelude::*,
     ptr::KnownSize,
     transmute::{AsBytes, FromBytes},
@@ -292,6 +293,37 @@ pub unsafe fn read_raw(&mut self, out: *mut u8, len: usize) -> Result {
         Ok(())
     }
 
+    /// Reads raw data from the user slice into the system memory region `out`.
+    ///
+    /// Reads `out.len()` bytes. The writes to `out` are byte-wise atomic, so they are well-defined
+    /// even if the memory of `out` is concurrently accessed by hardware, by user space, or by
+    /// other kernel code using atomic or volatile accesses.
+    ///
+    /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
+    /// bounds of this [`UserSliceReader`]. This call may modify the memory of `out` even if it
+    /// returns an error.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::{
+    ///     io::SysMem,
+    ///     uaccess::UserSliceReader, //
+    /// };
+    ///
+    /// fn fill_from_user(reader: &mut UserSliceReader, mem: SysMem<'_, [u8]>) -> Result {
+    ///     reader.read_sysmem(mem)
+    /// }
+    /// ```
+    pub fn read_sysmem(&mut self, out: SysMem<'_, [u8]>) -> Result {
+        let out = out.as_ptr();
+
+        // SAFETY: By the type invariant of `SysMem`, the memory of `out` is valid for writing
+        // `out.len()` bytes, and no plain access races with this write, so it is valid for atomic
+        // writes.
+        unsafe { self.read_raw(out.cast(), out.len()) }
+    }
+
     /// Reads raw data from the user slice into a kernel buffer.
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of

-- 
2.54.0


