Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170499;
	b=HHZbOCnNv7WL37If6KnN6h4QD658kysvg0gdlCj6brcq6QRwTzms1nnpBtptPpKBeXmG
	 58t6sfZEzoUICMhZxwMj9Ut693MU2Helowo455eKPouSa6alMthtwfeiGEdd7R32auoOL
	 mTABuBvao+b6l6+sKmshvrqptg4UWae/dVG0xOHTDHQHGMXC9bX8iloSoRwiwLwKd8exy
	 y21AXuTaYlNDBS7ASoYRYeSF+kxWonYw8ht7exyrq3Q4p3wKVcuu7aq8BazZw2CmsxESK
	 axFF0gnhYwSseyDTnAovoZh4dwAsM95WOu2nxEe/cPcviWGjVkseJR87RsBQyJxrnFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170499;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cHveAKTEDN4NYdhUSH387fDwb3sUmTakUTnrExxlxOU=;
	b=GSZmcSj18jGhFE64/MEi39Ubiojo1ViMwDHow/ISCSMDLajeMmdB10V6+f4PNpOH9Uh9
	 KQFhtfbi2Ef8dKxMsBsn0NpPpfs7O/K100DwZ0A9B/h7ZBz55CTP8s3jcGIdfJQIc7eoU
	 GRxFOcs1qEN12MxsaJl5QX/6EkRMvpA2T96uaCRBUgiWWgxOxsSFeuWLyTTrRU8QnWPj6
	 c/XyWixwHXb6mbFqBMa0lJyuh5/4JpB5Vhfa/aWGGJX0DwbxI09fbKV3+hHOVdqI0aFou
	 THhPsmIRJ4idsnW2ZuaxTsGM+rzeKlAGOkEE68qCNkQ2FDona/T7WrPIwvZchQysR6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bV3LASHj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA65D606A332;
	Fri, 20 Nov 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bV3LASHj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A934F1F000C0;
	Fri, 20 Nov 2026 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795170499;
	bh=cHveAKTEDN4NYdhUSH387fDwb3sUmTakUTnrExxlxOU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bV3LASHj59/nbCQaNlM2I/rYH3SC3+IM9mHeTzxpbKK6ugAXrOSSKYaMhl302lMzr
	 pgEQ6hWmn3H8ASXBM1f63fSRTnHr0He5lkk8/de+opK3Z1ChTI9g1WrnLrKH4hz1JD
	 o0CrqBdUPZUA3nR366hVL4d+i5gM/nlIOLlh1F+EPPBaUC3nudPhT6r9T3NZNMK+CN
	 C30I8XbhipA3esRH/s/zFAfqSOrxkG/RamrWT/ue0g2gIYU3KgvhQN+NIu244kePPF
	 n5YXwJhrs5ez/w9sYXmChEfii0HPFe0ZNnep39xvcSRBwK9CDtfPof3KXSB28LPPjd
	 X4gDCMbBOXZgw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 20 Nov 2026 11:27:01 +0100
Subject: [PATCH 02/11] rust: sync: atomic: add memset
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
Message-Id: <20261120-page-shared-v1-2-66f8c4c62822@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=yMzl9aHIm/fpa0K63eozFcBZNRxJnn4Ax+IoHBwntAo=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBrACCDCWnbNdCWH2u+lRuEr6lnssP2hxSh+2uYU
 QQ/LE9Jmy+JAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCawAggwAKCRD6UCkIqsW9
 0JCLD/wOhxCyQLejQqbVhExA4vV2s6iiCH7eR0E8w91k8BeojNAz/PCrUJLLs/9gArQG4rLH+cJ
 tRAJz+eVW126g7aLZB4wGqB4T2q85V9agT0VVCt2X2cPWDLuzX/zfOnLE090Sfz4ICcgOJKbmOg
 lLbx2hzWsGrG227sNHvTuK/Ks9JAxtMfApGARqwcNsaiIeoRKAACvP1KK36ZsqyJrpUq83Ndsmc
 jKwrmh3tyLX/cVERQar3WWfaiangmyixb5LJjv2bTdIpUzYag1W8nVKpcZyDy6EmaLp+l4NZHic
 PLR1WF3OqvUAaNGizlEFvub8vtfk29cGjG7+Ukp0abmtCSsB9OsKWKl7w3vMcOKxoIQTxw20APx
 O/QrjxHzmppaBCIZZgfQgjVeasBAKzWVOOHAEYjVS2MOZVdmHZhmcgsxahztJ47AdGabgFaNGXL
 jXkBeuRO1PLah8tbGtrPZ+YHiy2BedYUeKT17iB2vYFB5CM1l36k4NQDuP724VzsHdxKFs5CupH
 HvZxjsltABJPEgfx8oio1vUGIaPM/tT3tA+TAV1OXaD389CAT1N9rMapKdWzDUGeRP1oAJFMFHi
 oLj+bG+EOzHwP1YAHkCyCtS4fp14OqWi39B+vP+Z8NlU4/Xm/RPFs5hVm6MH5BkmyrAXwMCtbBJ
 5l8h1mvSnX30zxQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add `atomic::memset()`, the byte-wise atomic counterpart of
`core::ptr::write_bytes()`. Just as `atomic::memcpy()` is implemented in
terms of the C `memcpy()` function, `atomic::memset()` is implemented in
terms of the C `memset()` function.

This is used to zero the data of a page that is subject to concurrent
accesses.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/sync/atomic.rs | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index d25627fa6557..ca4ea8cadae1 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -884,3 +884,28 @@ pub unsafe fn memcpy(src: *const u8, dst: *mut u8, len: usize) {
         )
     };
 }
+
+/// Set `len` bytes at `dst` to `value` using byte-wise atomic operations.
+///
+/// This is the concurrent-safe counterpart of `core::ptr::write_bytes()`. Because of the atomicity
+/// at byte level, when racing with another concurrent atomic access, or with an external access
+/// (from DMA or userspace), the behavior of this function is defined: the memory is written at (at
+/// least) byte granularity.
+///
+/// Implementation note: this is currently implemented by the kernel's `memset()`, which is
+/// implemented in a way such that byte-wise atomic memory store instructions are used.
+///
+/// # Safety
+///
+/// Callers must ensure that `dst` is valid for atomic writes for `len` bytes for the duration of
+/// the call.
+#[inline]
+pub unsafe fn memset(dst: *mut u8, value: u8, len: usize) {
+    // SAFETY: By the safety requirements of this function, the following operation will not:
+    //  - Trap.
+    //  - Invalidate any reference invariants.
+    //  - Race with any operation by the Rust AM, as `bindings::memset` is a byte-wise atomic
+    //    operation and all operations by the Rust AM to the involved memory area use byte-wise
+    //    atomic semantics.
+    unsafe { bindings::memset(dst.cast::<kernel::ffi::c_void>(), value.into(), len) };
+}

-- 
2.54.0


