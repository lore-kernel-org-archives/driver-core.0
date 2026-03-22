Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06582BE644;
	Sun, 22 Mar 2026 15:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774192868; cv=none; b=XJasA3bbj/TSBPlrNZXNj7B/C93vrdKleyZiNU6iqxEIQNhTbXQ2JJpw+UxhuA297RHkl042kB5VxYWu78LOt2h+GJ86T5xyRGDBPM8sYwkpzsQ9BtwedMoPqdlCB5C1hgKvCYAcCa3YABWYrBp+TOyC1aVetwpWpZVaFApL/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774192868; c=relaxed/simple;
	bh=jxtgOMjJccjKykyJnIFUV15820XcVgiBCzreT1bUyvE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=kCG2aF2DiC43wohi8BDBxO9Y9dY9Y/PjZGaSlSZtcJPJAmwamiJKsYyR55T9czhCRtSQSE5MAjwgWoFRKd2FFexyDEb/Jea/vh1Pc0xyFf9J0UZTCZWm6bx3bQlxx2XyGzdOsVflP/YqvRKtRh6T/+edDTC7DTGK4wNB08XqLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ0TWEjN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ0TWEjN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4ADC19424;
	Sun, 22 Mar 2026 15:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774192867;
	bh=jxtgOMjJccjKykyJnIFUV15820XcVgiBCzreT1bUyvE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BQ0TWEjNSqdh4ab4Bi5aBZMNRaOPhhsI6v6JC0VmI3E+gfDjSnX9VGRj1UOwQ0Gry
	 KQjDa4ELn5Q+ae4LBGidl3veih768hk5t/lDAP6X7VHuMFKle8D5QmVGJBIu/sEY0+
	 JgSoxLAcxnR8Q7043j/vstPWudUHnQujnPYQEjCOyP9Bo8Ld1hNq6KNbisikqyrnH3
	 5FzpEwdi86o02tPLVvWyz7OV0+Gn+naBQobhUJVV/VCfHDaCRGtqJJe46ybaY8SsP4
	 lBSiyKW8WkZvNUYqfGgGCMvGaDMA/qctQMADVgEAPsSUyVzcv33SdMlEvpH6JslyOZ
	 9daJpOONjR8vg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Mar 2026 16:21:03 +0100
Message-Id: <DH9EVPDDINAI.W8KANTJ2OGCU@kernel.org>
Subject: Re: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations
 without kernel mapping
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260321172749.592387-1-dakr@kernel.org>
 <20260321172749.592387-2-dakr@kernel.org>
 <DH9EA6773QO6.W3EDFZPEL8K@nvidia.com>
In-Reply-To: <DH9EA6773QO6.W3EDFZPEL8K@nvidia.com>

On Sun Mar 22, 2026 at 3:52 PM CET, Alexandre Courbot wrote:
> On Sun Mar 22, 2026 at 2:27 AM JST, Danilo Krummrich wrote:
>> Add CoherentHandle, an opaque DMA allocation type for buffers that are
>> only ever accessed by hardware. Unlike Coherent<T>, it does not provide
>> CPU access to the allocated memory.
>>
>> CoherentHandle implicitly sets DMA_ATTR_NO_KERNEL_MAPPING and stores the
>> value returned by dma_alloc_attrs() as an opaque handle
>> (NonNull<c_void>) rather than a typed pointer, since with this flag the
>> C API returns an opaque cookie (e.g. struct page *), not a CPU pointer
>> to the allocated memory.
>>
>> Only the DMA bus address is exposed to drivers; the opaque handle is
>> used solely to free the allocation on drop.
>>
>> This commit is for reference only; there is currently no in-tree user.
>
> nova-core's sysmem flush memory page would be a prime candidate to use
> this, I'll add this patch as a dependency to [1] and use it.

Sure, please do.

> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>
> (one question below)
>
> [1] https://lore.kernel.org/all/20260321-b4-nova-dma-removal-v1-0-5cf18a7=
5ff64@nvidia.com/
>
>>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>>  rust/kernel/dma.rs | 119 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 9e0c9ff91cba..fa30793c798d 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -1011,6 +1011,125 @@ fn drop(&mut self) {
>>  // can be sent to another thread.
>>  unsafe impl<T: KnownSize + Send + ?Sized> Send for Coherent<T> {}
>> =20
>> +/// An opaque DMA allocation without a kernel virtual mapping.
>> +///
>> +/// Unlike [`Coherent`], a `CoherentHandle` does not provide CPU access=
 to the allocated memory.
>> +/// The allocation is always performed with `DMA_ATTR_NO_KERNEL_MAPPING=
`, meaning no kernel
>> +/// virtual mapping is created for the buffer. The value returned by th=
e C API as the CPU
>> +/// address is an opaque handle used only to free the allocation.
>> +///
>> +/// This is useful for buffers that are only ever accessed by hardware.
>> +///
>> +/// # Invariants
>> +///
>> +/// - `cpu_handle` holds the opaque handle returned by `dma_alloc_attrs=
` with
>> +///   `DMA_ATTR_NO_KERNEL_MAPPING` set, and is only valid for passing b=
ack to `dma_free_attrs`.
>> +/// - `dma_handle` is the corresponding bus address for device DMA.
>> +/// - `size` is the allocation size in bytes as passed to `dma_alloc_at=
trs`.
>> +/// - `dma_attrs` contains the attributes used for the allocation, alwa=
ys including
>> +///   `DMA_ATTR_NO_KERNEL_MAPPING`.
>
> Quick question for my erudition: I understand all the invariants are
> referred to by `drop`, but some of them (`size` notably) really read
> more like doccomments. Do we need to be that exhaustive every time we
> call a C API?

We have the same on dma::Coherent / dma::CoherentAllocation, as the destruc=
tor
relies on all those to be invariant.

I don't think we have to do this for every C API call, but in this case the
question is what the safety justification in the destructor would look like=
 if
we'd drop those invariants.
