Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F9C23E33D
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 13:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786023645; cv=none; b=Ykapo/OIqwcd87t5e5X30Y7DJixMDiVSEwYt6pg/rtJCAT+RuHaq7nvFI2pqwiJMizldn6uV/e3mecQ5JvL47bGZmQ8UIt6De8H44mqxKn3DtAwCoykcPgoFE4ouGCD4yVuprUvPsDzTpQeah4E+lH56tU0prn+8VdjR6ghzpkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786023645; c=relaxed/simple;
	bh=atl+7JaQujijO9EtMUZ+oQauuZoH9YVDK1c19juByA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u77LRKHy7UOjsSov2XH9XssFCN35FDeSUANXlh7Ai0SwncbGPJ7Zi7oLGbIs0QOop1mSX0HqhnCVkR8bEAf468PareVu1yFmTjT5i+CKb1EKiUH+eyytUd8jwdDOld3UmH8rMA9HC0EK/Wk5B9JUYIotS8GVf0jaXy8bsfMRI2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5mpZuLC; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5mpZuLC"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1669964f8f.2
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786023641; x=1786628441; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nVE1tGI3b1eDP27FaFkRE5oU82jTamtU/h7G5cFqm3o=;
        b=j5mpZuLCE4gjxjGhPf+Myz4P9wRBlHdbjIK2SqbrNcxmTDN5F9DygxhoDrSSwxYwAM
         6lqUYE4KwonB8CxHY/bT/Ua3oVtOkqiYFuCWaBHWzyTY3n66BFQsXerCwerVhTPwakdv
         tNIipMY4Lsv/03lvYow2hOoV1ehvvxvpMkVZj0yf0I9vz12jK7yO5eJqlb/oEsw2LkUf
         hsJ328K6USvlLB6ci3Uax7U0335Rw+cULT5dBRbCkNy5Y43j3cDllQs+dhGKagJN0QNx
         FpxZsPvIE1iRe/4SiH3eGhBcypldMj0yeKw5ClnzoCkYEIveXa+h/T5iVv25vLH9B+r1
         FPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786023641; x=1786628441;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nVE1tGI3b1eDP27FaFkRE5oU82jTamtU/h7G5cFqm3o=;
        b=hJ5MJb0YS0P0oSAE7jN41LcUqxlBIkpweenulDAL1YNId6pIH/WlO6+uzoDoN8ByK6
         TZLS4m2UzDMcgLpI46+1A08G3GS87ERb8gniAHa9g9/of0SFUG517csPjTSDHAnfJ8xF
         +E1JCV4QywuTDX0baepsLIkqRFfFMIvnD8GzFtTgYMN51XsEdvfVB7GIgfjac31chbaq
         Dbgp5b6LeCrlon5i9dIULtF+3G57lOFuZ6xXEQwDypOwUxCpmcyfGWlWKxZiaNi4B24d
         CuWzNTImE2yO362cBm/XMa32TGV+E9onIlTaoEuqFBPASMD0sKJaQZ8wxWxsjKXomyyz
         EMmw==
X-Gm-Message-State: AOJu0Yy3ok9MGUggJCdkz+qCxmZVARRBWivSiopc+eME5E/Ym2i3TGhI
	uEvK1BiHUImKp3W6AM5bFSZebRoTNxqkiUpk2czG2BRdSucM8j9GJPU+
X-Gm-Gg: AR+sD11Lvkxy+/4liDq+Y4lXjyLdijTkn6YUmJ+bC+CZcqKcL8f5vVbS+ZU//MOG6YK
	x5oM+sfMbqkALIckgKWSWk6u+UoZnIMKT2roB4b+OIbdDbYHYyD7TLFMdZhtjseUVaq1JE7mGRB
	rlTshWMKDDDIQELJSb0m2NGsZuHrD/VNd+Gd6OA3ukigzyIf7CRTmM5z8l/bygf5iHa/TAYY0OC
	P033Olz/6acgIOjSVYvfQfgqP3n0TGVj1rVEv7OgStEe5wGaYeKJxXkw3MxqdoDrNg4pB/oxqh+
	WJ5Y11aImlc6vIzO0pE7jFcSxe4jiWH9Lauy8B4ygee+yqrUR9qqFC07zON9k78OKowOjaplCYX
	AZXS+y/Zvmcuw2Q1VCcHNj9i6ApVabQ7U6yAgu9il9O+qQWfCx2Di+2ESbCCz1KlUNwaXAweIQ3
	BswI+4CIwztGvYFOW4PjNt/ztDuoAdK4OTYkfYxrhfe0GzcWv/iV/NQtDiBcj4yWbouysqa39Z2
	9bWcug2HkJEqrZ2tYj26TWll7svnyF2xQUY7CmMZWTTtaAW0X4Cm/o=
X-Received: by 2002:a5d:5e86:0:b0:47f:ebe3:ca31 with SMTP id ffacd0b85a97d-47fec62e00bmr25749584f8f.28.1786023641101;
        Thu, 06 Aug 2026 06:40:41 -0700 (PDT)
Received: from [192.168.178.24] (cgn-195-14-217-60.nc.de. [195.14.217.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79b4bcbsm6691311f8f.11.2026.08.06.06.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 06:40:39 -0700 (PDT)
Message-ID: <48ac19b9-0779-491b-b415-014610350a3d@gmail.com>
Date: Thu, 6 Aug 2026 15:40:38 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: dma: add `Range` type
To: Robin Murphy <robin.murphy@arm.com>, Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260806-dma-v1-1-e8a39327c7f5@gmail.com>
 <cc71c517-8097-48c4-80b3-77ad9f6d4759@arm.com>
Content-Language: en-US
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
In-Reply-To: <cc71c517-8097-48c4-80b3-77ad9f6d4759@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/6/26 1:23 PM, Robin Murphy wrote:
> On 2026-08-06 8:46 am, Vasileios Almpanis wrote:
>> The base dma address of `Coherent` and `CoherentHandle` is a bare
>> `DmaAddress` integer so any arithmetic, a driver does on it is unchecked
>> and can potentially go past the end of the allocation or overflow.
>>
>> Add a `dma::Range` type that couples a base `DmaAddress` with a length
>> and only hands out addresses and sub-ranges within `[start, start + 
>> len)`
>> with all arithmetics checked against both the length and the overflow of
>> of the underlying `dma_addr_t`. Let `Coherent` and `CoherentHandle`
>> provide the `Range` covering their allocation.
>>
>> Suggested-by: Danilo Krummrich <dakr@kernel.org>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1248
>> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
>> ---
>> This is one of my first rust-for-linux patches, so any suggestions are
>> extremely welcome. Some words about the decisions taken:
>>
>> - I chose lengths offsets to be `DmaAddress` instead of usize since the
>>    bus space can be 64-bit on 32-bit CPUS.
>
> The base address may be 64-bit, but the underlying 
> dma_alloc_*/dma_map_* APIs all express lengths in size_t, so we 
> shouldn't need to accommodate anything larger in Rust either. 
> Sizes-as-address-types always seem a bit weird and clunky (lookin' at 
> you, resource_size_t...), so probably better avoided if not absolutely 
> necessary, IMO.
>
> Thanks,
> Robin.
You are right, lengths come from size_t taking APIs anyway, so usize is 
the right type. Will change len and offset together with some things 
sashiko found in v2
>
>> - The constructor returns EOVERFLOW for `dma_addr_t` overflow, while
>>    out-of-bounds requests return EINVAL; happy to use a single error
>>    code if preferred.
>>
>> - `dma_range()` is added to both `Coherent` and `CoherentHandle` so the
>>    type has users from the start. I could split it into a follow-up if
>>    that is preferred.
>>
>> Tested with `make rustdoc`, `make rustfmtcheck`, `CLIPPY=1`, and the
>> KUnit doctests `rust_doctests_kernel`.
>> ---
>>   rust/kernel/dma.rs | 174 
>> +++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 174 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 
>> 200def84fb69e006bca0b1c578bac9f1dc8da708..e65e99ae4d915ac2e385df8b72fc518c07e4c82d 
>> 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -41,6 +41,142 @@
>>   /// Note that this may be `u64` even on 32-bit architectures.
>>   pub type DmaAddress = bindings::dma_addr_t;
>>   +/// A range of DMA addresses.
>> +///
>> +/// Couples a base [`DmaAddress`] with the length in bytes of the 
>> region it belongs to,
>> +/// representing the half-open range `[start, start + len)` of DMA 
>> addresses.
>> +///
>> +/// Unlike a bare [`DmaAddress`], a [`Range`] only hands out 
>> addresses and sub-ranges that are
>> +/// guaranteed to lie within `[start, start + len)`; all arithmetic 
>> is checked against both the
>> +/// length of the range and overflow of the underlying [`DmaAddress`].
>> +///
>> +/// # Invariants
>> +///
>> +/// `start + len` does not overflow [`DmaAddress`].
>> +#[derive(Clone, Copy, Debug, PartialEq, Eq)]
>> +pub struct Range {
>> +    start: DmaAddress,
>> +    len: DmaAddress,
>> +}
>> +
>> +impl Range {
>> +    /// Creates a new [`Range`] of `len` bytes, starting at `start`.
>> +    ///
>> +    /// Returns [`EOVERFLOW`] if `start + len` overflows 
>> [`DmaAddress`].
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::dma::{DmaAddress, Range};
>> +    ///
>> +    /// let range = Range::new(0x1000, 0x200)?;
>> +    /// assert_eq!(range.start(), 0x1000);
>> +    /// assert_eq!(range.end(), 0x1200);
>> +    /// assert_eq!(range.len(), 0x200);
>> +    ///
>> +    /// assert!(Range::new(DmaAddress::MAX, 1).is_err());
>> +    /// # Ok::<(), Error>(())
>> +    /// ```
>> +    #[inline]
>> +    pub const fn new(start: DmaAddress, len: DmaAddress) -> 
>> Result<Self> {
>> +        if start.checked_add(len).is_none() {
>> +            return Err(EOVERFLOW);
>> +        }
>> +
>> +        // INVARIANT: We just checked that `start + len` does not 
>> overflow `DmaAddress`.
>> +        Ok(Self { start, len })
>> +    }
>> +
>> +    /// Returns the first address of the range.
>> +    #[inline]
>> +    pub const fn start(&self) -> DmaAddress {
>> +        self.start
>> +    }
>> +
>> +    /// Returns the first address after the end of the range.
>> +    #[inline]
>> +    pub const fn end(&self) -> DmaAddress {
>> +        // By the type invariant, `start + len` does not overflow 
>> `DmaAddress`.
>> +        self.start + self.len
>> +    }
>> +
>> +    /// Returns the length of the range in bytes.
>> +    #[inline]
>> +    pub const fn len(&self) -> DmaAddress {
>> +        self.len
>> +    }
>> +
>> +    /// Returns `true` if the range is empty.
>> +    #[inline]
>> +    pub const fn is_empty(&self) -> bool {
>> +        self.len == 0
>> +    }
>> +
>> +    /// Returns the address at `offset` bytes into the range.
>> +    ///
>> +    /// The returned address is guaranteed to lie within the range; 
>> returns [`EINVAL`] if `offset`
>> +    /// is not smaller than the length of the range.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::dma::Range;
>> +    ///
>> +    /// let range = Range::new(0x1000, 0x200)?;
>> +    ///
>> +    /// assert_eq!(range.address(0)?, 0x1000);
>> +    /// assert_eq!(range.address(0x1ff)?, 0x11ff);
>> +    /// assert!(range.address(0x200).is_err());
>> +    /// # Ok::<(), Error>(())
>> +    /// ```
>> +    #[inline]
>> +    pub const fn address(&self, offset: DmaAddress) -> 
>> Result<DmaAddress> {
>> +        if offset >= self.len {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // By the type invariant, `start + offset < start + len` 
>> does not overflow `DmaAddress`.
>> +        Ok(self.start + offset)
>> +    }
>> +
>> +    /// Returns the sub-range of `len` bytes, starting `offset` 
>> bytes into the range.
>> +    ///
>> +    /// The returned range is guaranteed to lie within the range; 
>> returns [`EINVAL`] if
>> +    /// `offset + len` overflows [`DmaAddress`] or exceeds the 
>> length of the range.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::dma::Range;
>> +    ///
>> +    /// let range = Range::new(0x1000, 0x200)?;
>> +    ///
>> +    /// let sub = range.subrange(0x100, 0x80)?;
>> +    /// assert_eq!(sub.start(), 0x1100);
>> +    /// assert_eq!(sub.end(), 0x1180);
>> +    ///
>> +    /// assert!(range.subrange(0x100, 0x101).is_err());
>> +    /// # Ok::<(), Error>(())
>> +    /// ```
>> +    #[inline]
>> +    pub const fn subrange(&self, offset: DmaAddress, len: 
>> DmaAddress) -> Result<Self> {
>> +        let Some(end) = offset.checked_add(len) else {
>> +            return Err(EINVAL);
>> +        };
>> +
>> +        if end > self.len {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // INVARIANT: `start + offset + len <= start + self.len`, 
>> which by the type invariant of
>> +        // `self` does not overflow `DmaAddress`.
>> +        Ok(Self {
>> +            start: self.start + offset,
>> +            len,
>> +        })
>> +    }
>> +}
>> +
>>   /// Trait to be implemented by DMA capable bus devices.
>>   ///
>>   /// The [`dma::Device`](Device) trait should be implemented by bus 
>> specific device representations,
>> @@ -626,6 +762,25 @@ pub fn dma_handle(&self) -> DmaAddress {
>>           self.dma_handle
>>       }
>>   +    /// Returns the [`Range`] of DMA addresses covering this 
>> allocation.
>> +    ///
>> +    /// Unlike [`Self::dma_handle`], which hands out the base 
>> address as a bare integer, the
>> +    /// returned [`Range`] couples the base address with the size of 
>> the allocation, such that
>> +    /// any offset arithmetic performed on it is checked.
>> +    #[inline]
>> +    pub fn dma_range(&self) -> Range {
>> +        // INVARIANT: By the type invariants of `Self`, `dma_handle` 
>> is the DMA address base of an
>> +        // allocated region of `self.size()` bytes; the DMA API 
>> guarantees that a mapped region
>> +        // never wraps the DMA address space, hence `dma_handle + 
>> size` does not overflow
>> +        // `DmaAddress`.
>> +        Range {
>> +            start: self.dma_handle,
>> +            // CAST: `usize` always fits in `DmaAddress`, which is 
>> at least 32 bits wide and
>> +            // always 64 bits wide on 64-bit architectures.
>> +            len: self.size() as DmaAddress,
>> +        }
>> +    }
>> +
>>       /// Returns a reference to the data in the region.
>>       ///
>>       /// # Safety
>> @@ -1101,6 +1256,25 @@ pub fn dma_handle(&self) -> DmaAddress {
>>           self.dma_handle
>>       }
>>   +    /// Returns the [`Range`] of DMA addresses covering this 
>> allocation.
>> +    ///
>> +    /// Unlike [`Self::dma_handle`], which hands out the base 
>> address as a bare integer, the
>> +    /// returned [`Range`] couples the base address with the size of 
>> the allocation, such that
>> +    /// any offset arithmetic performed on it is checked.
>> +    #[inline]
>> +    pub fn dma_range(&self) -> Range {
>> +        // INVARIANT: By the type invariants of `Self`, `dma_handle` 
>> is the DMA address base of an
>> +        // allocated region of `self.size` bytes; the DMA API 
>> guarantees that a mapped region
>> +        // never wraps the DMA address space, hence `dma_handle + 
>> size` does not overflow
>> +        // `DmaAddress`.
>> +        Range {
>> +            start: self.dma_handle,
>> +            // CAST: `usize` always fits in `DmaAddress`, which is 
>> at least 32 bits wide and
>> +            // always 64 bits wide on 64-bit architectures.
>> +            len: self.size as DmaAddress,
>> +        }
>> +    }
>> +
>>       /// Returns the size in bytes of this allocation.
>>       #[inline]
>>       pub fn size(&self) -> usize {
>>
>> ---
>> base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
>> change-id: 20260805-dma-7c5330baadb6
>>
>> Best regards,
>
