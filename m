Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B82338C2D0;
	Tue, 24 Mar 2026 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366827; cv=none; b=Vcg3NKbaLaJfeaSME8AxR9GljyeXr3ZRK8oTHwxzX5C0Z7Z7ac5KLkJU53CBCNbROfZjXLspruXWAfvGPCzuHYra779AkxM89hRy1hg9xcABcGpTdFphdA8JzZt5g7y4cecvJYgpjYd9GzK3da/tTUfwr9lu7+HlclFev9hn8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366827; c=relaxed/simple;
	bh=8SAT0NvMEzHHIA4fOre9p3OATPKWmFRFNQE2+grgJZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PXWnwCVyOfaE7ylzzOwvsqJxc7MsIUc/TiSOrwaWB5eHqcgeN1iMqEf1IuL4WN9eDWKR4GmH2nnx2snDY0Nb77rH4clZ8Y2uqk0nT26d763wy6971W90fkMFMoh8s+Iu/adbIWmp1Rk04W+lBOibA3xUw+ACAxu3VP8zKCQUvCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MzoGbJg8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MzoGbJg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC6DC19424;
	Tue, 24 Mar 2026 15:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774366827;
	bh=8SAT0NvMEzHHIA4fOre9p3OATPKWmFRFNQE2+grgJZg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MzoGbJg8KgNkLqGgI+++0nf6vChXqSbwuF+mwriQl/VGMEfE1yC3TxQ4JZAAuwdtt
	 5Okt+PZKAkuuU0gjHZRzDI0ehEzNdJI2XTQ6azuvLnTkJprKKK+baC/dTqPLcniaPV
	 5bU9A4l/O7VhV2iwYiWQCxX0szABBlxE/7iefSYSKUaO+hr2UxYw4JbrlbTKpV5izi
	 umR4+Fgery2D9palYiL1UCDMCfJqQW48m4nvdG+zT2UkjN3rYbVddqvIpLC1okTjYq
	 LFnNH+ATJDU9OAS6oH9mXi1F33tZ5rs+RJ3zCDN965+Nk/oY785hXP6rj22WioQoG5
	 o/vRbMR7xLXSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] rust: dma: add Coherent:init() and
 Coherent::init_with_attrs()
In-Reply-To: <DHB3RDNDS08U.A75EZUOMO311@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <4yknLBbwY93Ty2ltbpxjHgto-m99xkoTgDlKv8cJTK2tbFL0_V6eQDjwbbXI70M6uMKT6RLRxBoYR_XeymmnHA==@protonmail.internalid>
 <20260320194626.36263-6-dakr@kernel.org> <87y0jhpbsp.fsf@kernel.org>
 <7YsbXJIBKj4Er4WkL5X4lsu18tY1b05zm-TzJP7Xt6YGuOsxmCQ7Ew_TFafHcFnLhCy4ptG2mC0vDesRyI7cAw==@protonmail.internalid>
 <DHB3RDNDS08U.A75EZUOMO311@kernel.org>
Date: Tue, 24 Mar 2026 16:40:16 +0100
Message-ID: <87zf3xxmlb.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> On Tue Mar 24, 2026 at 3:00 PM CET, Andreas Hindborg wrote:
>>> +    /// Same as [`Coherent::zeroed`], but instead of a zero-initialization the memory is initialized
>>> +    /// with `init`.
>>> +    #[inline]
>>> +    pub fn init<E>(
>>> +        dev: &device::Device<Bound>,
>>> +        gfp_flags: kernel::alloc::Flags,
>>> +        init: impl Init<T, E>,
>>> +    ) -> Result<Self>
>>> +    where
>>> +        Error: From<E>,
>>> +    {
>>> +        Self::init_with_attrs(dev, gfp_flags, Attrs(0), init)
>>> +    }
>>> +
>>
>> I think we are missing an array initializer for `Coherent<[T]>`.
>
> This method is already compatible with arrays, T can be an array type itself,
> e.g. T = [MyStruct; 5].
>
> For instance, the diff in [1] should work.

Cool!

>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> Thanks! The patch series has been applied yesterday, and the branch it has been
> applied to is immutable, so I can't add additional tags.

You guys move fast!

> However, the Link: included in the patch still points to this conversation.
>
> Also note that subsequent review is still valued; we can always send follow-up
> patches if required.

At any rate I can send the changes I suggested if they are deemed valid.


Best regards,
Andreas Hindborg



