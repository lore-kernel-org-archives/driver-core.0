Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170520;
	b=2e4+/2VVnX+tk41C5QFavuQFnawG/qlnLlPPlSBEqHrCObqrvlKucvctvgKtvr8uh9I9
	 W/qR10bkAapbylBWdTQDdp2Grdp6K4PMOjTlrm/h2PECDTwcE4Cov6qzJg+I6CdIp8Rcz
	 mO9boyzQ3QsKA9Pq1/t66rEMX4D/kVKjwsYbil73Ok6U+cinZBLkG4Cx8xGydwN44iGxT
	 X+VVYqO0sZkukRUYh+d4IIFk8dTpEr2XJARlTwPAvT7UKY1yrp3YTwgRXz/6aULKJqp5M
	 Aw/zfzFSQQTtapuRIfJdMiAAxVs2iR9Og13lGQhQOZFwSvQTfiz8mBqdd/NcN5Yforg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170520;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4CgRzJqEpozYdtfooGGK8vO5/mhcOc1oY2ASDM+A4Y8=;
	b=0d7yjhIAXBw1vAe+1mw8gXI+IRgJJT3KIhVeiJu9NBnGoetvGG2m5RrlWDAAdwzowfaQ
	 KEb0azGrEnNtQoJRQrWNHXBSIZ4cByNyRAq9VQ+9/SbA0BBRAkfcqHFUL6F755eMajym6
	 vgMvT2kUTvnnQd4BMkd0MxehbERLKDP/vkptMHAJ0cE7/kb1i1F/7KzQcbodW6qnIoRrF
	 U/+w0pXWbpwOZIrj0MI758575aHmcwtoFIfd5aVGwWlyJrEZ0LvtkkcDSusu+M8O0E6Qw
	 X4QeiCmVr7al3xvaUmkUZRusOolXBl38QtUqNxi3AqFCIA3bbp77pZCuGAt1pPMonrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TE3DoABs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AEE60A2615;
	Fri, 20 Nov 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TE3DoABs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669361F00ADE;
	Fri, 20 Nov 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170520;
	bh=4CgRzJqEpozYdtfooGGK8vO5/mhcOc1oY2ASDM+A4Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=TE3DoABsetFmiGLQRbnkFNlVMuhNO43XVPdNZWmKh3FKhdpH+hhGnf2Q/hqQitH13
	 978n1hhvAk+HdkiJFeT+T9svsUZnwIqPR9d/6z0FNhP3ctJz3oMKPl9lCWqVx7OgkS
	 azo0JE4vfqnaQ+Ga0s0q8mtyu63ZQPo85RevTmLkAgjvkLAoFLDS4l7wVBAJJpasUm
	 gROZQg/nA0+kcJCb++Od9KI0O/jua8h501RXmrJnQVLnbTm7wKPe8GMUxrSIYs+o76
	 /KWvlEgEJAsgQGGRSRALIlAxusEvsRUkSPu5sKsya8ctgMYoJ+Uw4RkqTODz0oBI6E
	 N7QLGUBPrOFRQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:00 +0100
Subject: [PATCH 01/11] rust: page: tighten safety requirements of `SysMem`
 copy methods
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
Message-Id: <20261120-page-shared-v1-1-66f8c4c62822@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3044; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=SEmUKaWSirshMZNhFKAa6XD1FMrLGE2pgSxpI+8ilKM=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCCvNGTm5okCaeQwkmLXdu/rlqIT+sC5ohTS
 kzAeoYXjYOJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAgggAKCRD6UCkIqsW9
 0LBnEAC3BwBnfGcNsqqgePf0LBDFq5c9O1unwZ/ZKtEH4IY22gEgrLiQVbxyq0tD4/4fD+WKJid
 X8CcsZCdr09obivkErnkRLd9CQCIFopCjlhd5no9MgOAYHmQNhy8xDZeCEDqsG6/I9jcv5wmkQ8
 OTL6sD9/3+hdv1CP44TyYVxUd5cJsuk6CG06ttDtHfg7fh14fo07IWQ3rEJNV/5Roo8kAjr7mVy
 BVGbGeZvk9Bsrd5x/4mULz+5ZE5x7Ny+04atr4VjWaXfEx55nL3GML2D1zDraiiyc65OQufh5H5
 ceDkLDUXU77PSUEZ6a+bscAQmYgfXWGSnIC6q7YK00I4uf4T9216sb88cCVg6YRY/WRhW7udoU/
 VLgd+meakaYxWCA3liBK72qyFi2E3bFJMv9Yh3kEX1F0xgTd6AIT/FTGp9OGB2wPPhG0MCnxaRA
 RigFx0HUH9BcFcEOD4KuNam4jiPtEF+2px8DFVnCfJI9Z/G+5semJQB75CiIR7eflO761DJNtCJ
 rmPUUUirheB7jZQvmat0C922Ib0E1ec8sR5YmMIv1LrhGuY1mrVYwcg5/OghrxQxEdOX8+QCkvC
 L8tRWakO1j0yaE5qxJaNMPnmSZslF6Qg0M8caU61RrlC0eSyjFDhjzLgA96k+bx6TtBFdm2I+OQ
 BrncguZsQuvLWIw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`Page::read_sysmem` and `Page::write_sysmem` are available for all page
kinds, so they can be called on a `Page<Exclusive>`, whose data can be
referenced as a slice. Add the requirements that the raw accessors of
`Page` have for this case: no mutable reference to the data that is read
may exist, no reference to the data that is written may exist, and data
written to a `Page<Exclusive>` must be initialized.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/page.rs | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 4ea7368b4699..3c48ecde4d14 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -374,6 +374,8 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
     /// Callers must ensure that:
     ///
     /// - This call does not race with a write to the source page that overlaps with this read.
+    /// - No mutable reference to the data of the page that overlaps with this read exists during
+    ///   this call.
     /// - The memory region of `dst` does not overlap with the memory of the page.
     ///
     /// # Examples
@@ -391,7 +393,8 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
     /// // way while `dst` is alive.
     /// let dst = unsafe { SysMem::new(&raw mut buf as *mut [u8]) };
     ///
-    /// // SAFETY: `page` is not written to during this call, and `buf` is not part of the page.
+    /// // SAFETY: `page` is not written to during this call, no reference to the data of `page`
+    /// // exists, and `buf` is not part of the page.
     /// unsafe { page.read_sysmem(dst, 0)? };
     /// assert_eq!(buf, [0u8; 16]);
     /// # Ok::<(), Error>(())
@@ -453,6 +456,10 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
     ///
     /// - This call does not race with a read or write to the destination page that overlaps with
     ///   this write.
+    /// - No reference to the data of the page that overlaps with this write exists during this
+    ///   call. Such references can be obtained from a [`Page<Exclusive>`], see
+    ///   [`Page::as_slice`].
+    /// - If the page is a [`Page<Exclusive>`], the bytes of `src` are initialized.
     /// - The memory region of `src` does not overlap with the memory of the page.
     ///
     /// # Examples
@@ -476,8 +483,8 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
     ///     )
     /// };
     ///
-    /// // SAFETY: `page` is not accessed in any other way during these calls, and neither `data`
-    /// // nor `buf` is part of the page.
+    /// // SAFETY: `page` is not accessed in any other way during these calls, no reference to the
+    /// // data of `page` exists, and neither `data` nor `buf` is part of the page.
     /// unsafe {
     ///     page.write_sysmem(src, 0)?;
     ///     page.read_sysmem(dst, 0)?;

-- 
2.54.0


