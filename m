Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170492;
	b=JuR/0dLnAGDO7fClkJLw0SISHK1rSJjouHIzc+IOQG+iQE4zEUI5OKckWCgYh3xx3ba1
	 Le7dU46aMEobptOLS3iZa/WPbJFz7ZpKgOcosMcGI7mqDHl4LT9QO10jyNAswTR0BZ0+a
	 Ami/petrNYe2sYP76vxv/w+VXh7MneGmivPIkrN3IcXk048pf8po4pmK1K8S9KJKOWVjc
	 OIhZp93dh/8LjCIgXc7BgDLOm8AmuRR77S1SbW62FJ2Chw7lk9NPnvKgHEGhtmP8tCIvy
	 ZRUqGuh2le/qN6sYQ7ZIytGEz+Sw2bBcD+6lQzQp4ez43XLHxPiTfhUF5nLOzXGIsIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170492;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tr/kc6UGkV2CwaZkbx3GCvGJbNycglgiy4h7oaLu2ic=;
	b=OGJOur9ae6TlbVUp4d2ouxxKy7n0o5v08j0IIvQF/9y7Ykmr4uqmmhyoWVSrzPUQ0vyR
	 zq2oWwagUMIFyOWG2QINHXMaqhAZTgYurqSuaconLpdzICEXNmjzkIDLIkX5oZMa1BHee
	 IFBYInviEwPDDMVYZ5PBpsVVf6Obw9FO9VBYpw5amzgBEO30RVYzDG+QRIndQt9bhlZEe
	 htKbSMl0iyTdgwYOcNH4G5PIACr9IcTm+BWBu4UN0dU7/eNXhvS4OK7uH2F3EbjGRtUv3
	 GYKfD49XdvQTI0IJ7vR5KdlcL3FSK/DdqgB8KOknhlVAqvFAkmTiJD3U66360MRvmjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jk6jRpDK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE716606A320;
	Fri, 20 Nov 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jk6jRpDK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21951F000E1;
	Fri, 20 Nov 2026 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170492;
	bh=tr/kc6UGkV2CwaZkbx3GCvGJbNycglgiy4h7oaLu2ic=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jk6jRpDKelDNctWq/slWA2pXbw708YRxXVuoiNwkFJJSN7GyvQRj9/vgJYA00D+aY
	 CE5oDyGxtg0d/GddeBr5ZOQkkDcuXdpeDt/jXdFdpMifRbuHA+83CB8VTb2tUy5CZp
	 699wycxU+oL9UM6/q5UGeKaDhYsNVrTsnQ/GDaWKfcifkAPfN3VvMDyaWnfTbEB5VB
	 mJJALRDe98IboCjWDiP1DD518VqYkxnlodd3BLMO9jf+Q9/b72cbckpQppCA8IRIJY
	 uKW6leVRYwtLUYAgt4VfVtwRc8BzLogaPAe+lp6rqMzqkhkcT0+HHt+AugKVrTrXpF
	 q9qfea0jc2Y2g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:02 +0100
Subject: [PATCH 03/11] rust: io: add `SysMem::fill_zero`
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
Message-Id: <20261120-page-shared-v1-3-66f8c4c62822@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=7gZAcIHVpEUXSg+oYUBAk7+IRLdZOswlHSQd1XL1yCE=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCE7idfVWKq5Y/yQuJM04kp96BOHWPAgz9Wb
 kVX7WvAopKJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAghAAKCRD6UCkIqsW9
 0IqvD/4hfhwc3O9l7bqpLf3rswIqamrc1fmvhTqvxiRf+A3GjUyOU54DY18uzztZ0Yc3pVsZ44A
 lky+feEjgINFLSlbm5Wwk+tVevvmA4G0+rrNAtNO9C9kuUi4i4LXp/rFt9Crfr+qsTXhBKePwsq
 bB9RBuaSg1GRziBzCUnqpRN2rQFsEq7IYajcSxF8uE2sPaa3cdvdyS4CJZ+pUdLU1ZTf2uEWw7g
 30V4RG8siYT7+vnJYcc3WmULsw4COn2pRGjtVEPHHcRBlXa4XrleF2hH8H2hVbn8dklC0grAtCr
 2oLBLxiL2elCfN7fkVH3tuUhoJY67Q9zyRnQHRaMiPPjkNevGz6g0u30cI9EgL6RI1Nm0Gxf3OV
 B73QxpmqZJoHHYOOR2JHZypU7XPTYD4I04xChFzQ+Dzz7kLtrgThQ8pH/eEejBSXBgGHkiltn2v
 NDENGuWw1UW3ya9FcmkR7SUINGX3+OptjjvnBGVn436OUcOZ272F99JKRTPK5rh38xqBkaij1wZ
 byHKR2twMgcvNuiCYfL5NOLp8KsNSGcdOuhiOdAtbZkiK3cb0dc+HpXSZ4BeTa11v6q+MVlu6jB
 un6NSiKyk/UEWlvDgRP4zpLDA1qG4pW/1ryxL8ZGGpmtdQY+kw5Bt6E6IVzlvbMZLLjjniaFnEc
 nmd4PtTgYWSJN9g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add a method for zeroing the memory of a `SysMem` byte view. The method
uses `atomic::memset()`, so the memory can be subject to concurrent
accesses.

This is used to zero the data of a page that is mapped to user space or
shared with a device.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/io.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 76904c63eb0a..33cb5a9fb3a8 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -1586,6 +1586,17 @@ unsafe impl<T: ?Sized + Sync> Send for SysMem<'_, T> {}
 // SAFETY: `SysMem<'_, T>` is conceptually `&T`.
 unsafe impl<T: ?Sized + Sync> Sync for SysMem<'_, T> {}
 
+impl SysMem<'_, [u8]> {
+    /// Writes zeroes to all bytes of the view using byte-wise atomic operations.
+    #[inline]
+    pub fn fill_zero(self) {
+        // SAFETY: Per type invariant, `self.ptr` is a valid kernel accessible memory region of
+        // `self.ptr.len()` bytes, and no plain access races with this write, so it is valid for
+        // atomic writes.
+        unsafe { atomic::memset(self.ptr.cast(), 0, self.ptr.len()) };
+    }
+}
+
 impl<'a, T: ?Sized> SysMem<'a, T> {
     /// Create a `SysMem` from a raw pointer.
     ///

-- 
2.54.0


