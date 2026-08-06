Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12739376A04
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002416; cv=none; b=Ct2bWSSoiejbGW/BhVA1L7z+B8v9gVi/H7dE93ssRqNqEMpq1/Ta4lZpUfqiVZaYr3sK/r9KWZ9V9UsEOe3sOs6uydLoR8ovuTsuZDmcB8DTvLjZknaZJdTQBxssvf4TlF3hiN3WU9b1pkTE2Cmid5B9YSHWYWxXZs2rd9bZXrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002416; c=relaxed/simple;
	bh=6HAzSHpgsk4thzZV85s9gSOIZZSMVAZ44XXT3FDiRL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ItjYIOJN0eDI97ZzIm4KsU3PMjrZrDnIq8N0yv6usOtpkAH8GShSSXZdph0vcXuUqXeDeA7u/VKuc7hAh+C8gbEU6BoWq7+EdKUA2IzeaFyWSXbQeucJB24KW/nPPNt9wefTX4CCIs5IUryaN3niNdiJgSCX20VJQA+1RiU3034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tte7WJKh; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tte7WJKh"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1116349f8f.2
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 00:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786002411; x=1786607211; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lE6JyKTSI6vd0outqfFXmkTwfpKlomoTyCU2FFqTLwM=;
        b=Tte7WJKh85eMe91qbjy5vi8OhMKd3BVaAGZFV17yXPoue/3O7hERkl3wtDvKNJcIol
         mAtXcxEU9isGvGuoJuaF7ahGroCbegkga0/4s7dAEcdhVbfPp9LT3ySGDFuqUFFFSeEi
         fk3VGU1fDr4Gyh2ZbEX7a1/5W5gEDd67wzy2m+cm1/0Uvy6pceWNX+BgW4AzqkcWFDpK
         7hkD0bO++q3p+2AyAZIiSGP2P7b344T0OLgkPJ29AY9vSOpcRaBYkaSTXqI4OEZpKKjH
         xvsrh8A7wtkqLU1bk6EyfDAxqlSsnZfR79WGbIw1M7ZnjGknQqfN1ZNCGfOtXsF32ghX
         EchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786002411; x=1786607211;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lE6JyKTSI6vd0outqfFXmkTwfpKlomoTyCU2FFqTLwM=;
        b=bYww9infc2WgO8W5cY4VHjXy+7jbNN959nXymKGC0egn65azQnQ1nbLrGu9lpse0dT
         fSVDZSeq93dGDwJIH/yxLOcjqfMHlwJvL0kVkxa6N0iQshPSbiJuUnen3C2f04fU3NPC
         YqF6kIo+wR6nJ1Xo+exQ1qhG9ZYANU3rIoc9Ne5/nYJUXHGnl+JrYlWWCOWMtl3JmB+V
         wqKc59ZjgmFuc9RMjRa6MatzXoj5VruOnZf9hmQhivfcUFi7fLr4YFGu5rtiinCW2RT4
         5LDwgjNfHzzFTEoVR+c5MRLRgr39wenQtmkH1+DH0RfGxr5uXim2fy13DIRlN2z8ZP09
         E/wA==
X-Gm-Message-State: AOJu0YwiGJajJn5Fzn/QgP+P5R2udv1IJHfYVvK3wtUQOqQbCAP39oPa
	sERUmSblV9uvpmz0NohGrSwkw8VgMq0mT/agGk4MS61SkQyEV/p1AxBF
X-Gm-Gg: AR+sD10H3CGgDl8Kshd+hMJIbL25Z+sAgt9YKvQFjtWL6XlB5EunwvEJZHeKvcj8Ei0
	huL/Uk37d+mLmjkxl7gK4CfM1xbDWC7XctHxHK2jN0bYZ0dAYI1P2HI4jhc/0aMDi/DzfqDv81F
	Di+sfBzFYKrFEhq+ncvTcvXj7MEe5cIycVYiXV+5hwYZg5ywxdT7gdVTg5mdTHIlUSk0QRjVAB9
	i0b+OAcnRUOmnyp/Ytg6uI2cm7QPni8TvSwBy3GxUxeXabIDEE0MYoIzfdJ9B2B+YoJwyGKxDwZ
	o1ZugQjt8hWXF3NPWpTI/0+8ItmceU52BLKamEpkvFxAuOqVCzLWvkwlYioVDZ8UTVs5ELvWus7
	K8XO3wyMm6UTv2K2oX9BcXaKcvQa0qnDjyB5VbWw1PBziPH+k2KKe1l39oFE0ySE33b2HRf+c0+
	brnFNnFXMqy+eprwZ5Tn/dTYqqSOmiMY2n0hI7yj7Ep7NQscmrZf1Tf9oFEzd0lAu9z5E6+oifc
	Vd75cZzN0++CvjjpTjiSVS+FCoJNr7MVi7wKg6K1OLb53cM/VMmGSA+
X-Received: by 2002:a05:6000:40c9:b0:47f:93b4:2def with SMTP id ffacd0b85a97d-47fec63ebcdmr20292429f8f.28.1786002411036;
        Thu, 06 Aug 2026 00:46:51 -0700 (PDT)
Received: from valmpani.valmpani (cgn-195-14-217-60.nc.de. [195.14.217.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79a71a2sm3841321f8f.6.2026.08.06.00.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 00:46:50 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Date: Thu, 06 Aug 2026 09:46:14 +0200
Subject: [PATCH] rust: dma: add `Range` type
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-dma-v1-1-e8a39327c7f5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMU7dGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNT3ZTcRF3zZFNjY4OkxMSUJDMloMqCotS0zAqwKdGxtbUAaipBpVU
 AAAA=
X-Change-ID: 20260805-dma-7c5330baadb6
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vasileios Almpanis <vasilisalmpanis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786002409; l=9021;
 i=vasilisalmpanis@gmail.com; s=20260731; h=from:subject:message-id;
 bh=6HAzSHpgsk4thzZV85s9gSOIZZSMVAZ44XXT3FDiRL4=;
 b=Ih/f4+tFcg6Fj+sGhKoKUu6yS0WPAKdTe7R5cAmOE5hru18JzsavPJX+POJvKb3f5fAMT38gH
 d0xC0C/tNcjBA+WXMXhDsuOrNpfyNdnL7nf+Zd0y8ZM+UUoExSS4KIP
X-Developer-Key: i=vasilisalmpanis@gmail.com; a=ed25519;
 pk=gn5Uo6yL8Tlpq5uATxA3nqoq+U8eWLRbjD+bOk0qSpU=

The base dma address of `Coherent` and `CoherentHandle` is a bare
`DmaAddress` integer so any arithmetic, a driver does on it is unchecked
and can potentially go past the end of the allocation or overflow.

Add a `dma::Range` type that couples a base `DmaAddress` with a length
and only hands out addresses and sub-ranges within `[start, start + len)`
with all arithmetics checked against both the length and the overflow of
of the underlying `dma_addr_t`. Let `Coherent` and `CoherentHandle`
provide the `Range` covering their allocation.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1248
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
This is one of my first rust-for-linux patches, so any suggestions are
extremely welcome. Some words about the decisions taken:

- I chose lengths offsets to be `DmaAddress` instead of usize since the
  bus space can be 64-bit on 32-bit CPUS.

- The constructor returns EOVERFLOW for `dma_addr_t` overflow, while
  out-of-bounds requests return EINVAL; happy to use a single error
  code if preferred.

- `dma_range()` is added to both `Coherent` and `CoherentHandle` so the
  type has users from the start. I could split it into a follow-up if
  that is preferred.

Tested with `make rustdoc`, `make rustfmtcheck`, `CLIPPY=1`, and the
KUnit doctests `rust_doctests_kernel`.
---
 rust/kernel/dma.rs | 174 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 200def84fb69e006bca0b1c578bac9f1dc8da708..e65e99ae4d915ac2e385df8b72fc518c07e4c82d 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -41,6 +41,142 @@
 /// Note that this may be `u64` even on 32-bit architectures.
 pub type DmaAddress = bindings::dma_addr_t;
 
+/// A range of DMA addresses.
+///
+/// Couples a base [`DmaAddress`] with the length in bytes of the region it belongs to,
+/// representing the half-open range `[start, start + len)` of DMA addresses.
+///
+/// Unlike a bare [`DmaAddress`], a [`Range`] only hands out addresses and sub-ranges that are
+/// guaranteed to lie within `[start, start + len)`; all arithmetic is checked against both the
+/// length of the range and overflow of the underlying [`DmaAddress`].
+///
+/// # Invariants
+///
+/// `start + len` does not overflow [`DmaAddress`].
+#[derive(Clone, Copy, Debug, PartialEq, Eq)]
+pub struct Range {
+    start: DmaAddress,
+    len: DmaAddress,
+}
+
+impl Range {
+    /// Creates a new [`Range`] of `len` bytes, starting at `start`.
+    ///
+    /// Returns [`EOVERFLOW`] if `start + len` overflows [`DmaAddress`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::dma::{DmaAddress, Range};
+    ///
+    /// let range = Range::new(0x1000, 0x200)?;
+    /// assert_eq!(range.start(), 0x1000);
+    /// assert_eq!(range.end(), 0x1200);
+    /// assert_eq!(range.len(), 0x200);
+    ///
+    /// assert!(Range::new(DmaAddress::MAX, 1).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub const fn new(start: DmaAddress, len: DmaAddress) -> Result<Self> {
+        if start.checked_add(len).is_none() {
+            return Err(EOVERFLOW);
+        }
+
+        // INVARIANT: We just checked that `start + len` does not overflow `DmaAddress`.
+        Ok(Self { start, len })
+    }
+
+    /// Returns the first address of the range.
+    #[inline]
+    pub const fn start(&self) -> DmaAddress {
+        self.start
+    }
+
+    /// Returns the first address after the end of the range.
+    #[inline]
+    pub const fn end(&self) -> DmaAddress {
+        // By the type invariant, `start + len` does not overflow `DmaAddress`.
+        self.start + self.len
+    }
+
+    /// Returns the length of the range in bytes.
+    #[inline]
+    pub const fn len(&self) -> DmaAddress {
+        self.len
+    }
+
+    /// Returns `true` if the range is empty.
+    #[inline]
+    pub const fn is_empty(&self) -> bool {
+        self.len == 0
+    }
+
+    /// Returns the address at `offset` bytes into the range.
+    ///
+    /// The returned address is guaranteed to lie within the range; returns [`EINVAL`] if `offset`
+    /// is not smaller than the length of the range.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::dma::Range;
+    ///
+    /// let range = Range::new(0x1000, 0x200)?;
+    ///
+    /// assert_eq!(range.address(0)?, 0x1000);
+    /// assert_eq!(range.address(0x1ff)?, 0x11ff);
+    /// assert!(range.address(0x200).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub const fn address(&self, offset: DmaAddress) -> Result<DmaAddress> {
+        if offset >= self.len {
+            return Err(EINVAL);
+        }
+
+        // By the type invariant, `start + offset < start + len` does not overflow `DmaAddress`.
+        Ok(self.start + offset)
+    }
+
+    /// Returns the sub-range of `len` bytes, starting `offset` bytes into the range.
+    ///
+    /// The returned range is guaranteed to lie within the range; returns [`EINVAL`] if
+    /// `offset + len` overflows [`DmaAddress`] or exceeds the length of the range.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::dma::Range;
+    ///
+    /// let range = Range::new(0x1000, 0x200)?;
+    ///
+    /// let sub = range.subrange(0x100, 0x80)?;
+    /// assert_eq!(sub.start(), 0x1100);
+    /// assert_eq!(sub.end(), 0x1180);
+    ///
+    /// assert!(range.subrange(0x100, 0x101).is_err());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub const fn subrange(&self, offset: DmaAddress, len: DmaAddress) -> Result<Self> {
+        let Some(end) = offset.checked_add(len) else {
+            return Err(EINVAL);
+        };
+
+        if end > self.len {
+            return Err(EINVAL);
+        }
+
+        // INVARIANT: `start + offset + len <= start + self.len`, which by the type invariant of
+        // `self` does not overflow `DmaAddress`.
+        Ok(Self {
+            start: self.start + offset,
+            len,
+        })
+    }
+}
+
 /// Trait to be implemented by DMA capable bus devices.
 ///
 /// The [`dma::Device`](Device) trait should be implemented by bus specific device representations,
@@ -626,6 +762,25 @@ pub fn dma_handle(&self) -> DmaAddress {
         self.dma_handle
     }
 
+    /// Returns the [`Range`] of DMA addresses covering this allocation.
+    ///
+    /// Unlike [`Self::dma_handle`], which hands out the base address as a bare integer, the
+    /// returned [`Range`] couples the base address with the size of the allocation, such that
+    /// any offset arithmetic performed on it is checked.
+    #[inline]
+    pub fn dma_range(&self) -> Range {
+        // INVARIANT: By the type invariants of `Self`, `dma_handle` is the DMA address base of an
+        // allocated region of `self.size()` bytes; the DMA API guarantees that a mapped region
+        // never wraps the DMA address space, hence `dma_handle + size` does not overflow
+        // `DmaAddress`.
+        Range {
+            start: self.dma_handle,
+            // CAST: `usize` always fits in `DmaAddress`, which is at least 32 bits wide and
+            // always 64 bits wide on 64-bit architectures.
+            len: self.size() as DmaAddress,
+        }
+    }
+
     /// Returns a reference to the data in the region.
     ///
     /// # Safety
@@ -1101,6 +1256,25 @@ pub fn dma_handle(&self) -> DmaAddress {
         self.dma_handle
     }
 
+    /// Returns the [`Range`] of DMA addresses covering this allocation.
+    ///
+    /// Unlike [`Self::dma_handle`], which hands out the base address as a bare integer, the
+    /// returned [`Range`] couples the base address with the size of the allocation, such that
+    /// any offset arithmetic performed on it is checked.
+    #[inline]
+    pub fn dma_range(&self) -> Range {
+        // INVARIANT: By the type invariants of `Self`, `dma_handle` is the DMA address base of an
+        // allocated region of `self.size` bytes; the DMA API guarantees that a mapped region
+        // never wraps the DMA address space, hence `dma_handle + size` does not overflow
+        // `DmaAddress`.
+        Range {
+            start: self.dma_handle,
+            // CAST: `usize` always fits in `DmaAddress`, which is at least 32 bits wide and
+            // always 64 bits wide on 64-bit architectures.
+            len: self.size as DmaAddress,
+        }
+    }
+
     /// Returns the size in bytes of this allocation.
     #[inline]
     pub fn size(&self) -> usize {

---
base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
change-id: 20260805-dma-7c5330baadb6

Best regards,
-- 
Vasileios Almpanis <vasilisalmpanis@gmail.com>

