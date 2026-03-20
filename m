Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF6A28A3F2;
	Fri, 20 Mar 2026 14:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774018317; cv=none; b=jwIZy2LOJDMFC7gce3K+b85Mo5rTgay3YP1THBrqjJ0o4d4EOBu9Gc1AijWP0MjywM9U/XPC5WVyFwulpBe1YRVKeV7ZQ5aJvC1493QgmoTKvi0UAcLF6BezNRyVhweVL+p/wRGeEPnIfpLlITFpJzFrd2OuJ12FMSBeW+4SlVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774018317; c=relaxed/simple;
	bh=c4iKsXS9FObY8UukAwlggqveq7EGRVJUILeikf6snDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h/eS4hRW2Rsw85QO/X+lRyaKjSfAFg0Z6lG5cLQcUH6afRXeRzICBkCMw3BbSjOZY+gAs4pAXylnbC7LshnRrsQfgNbRAI+VTf3yZK+JXj/L5leNgEWy2NlaMcr35iMJBXwde0wYSshGdEy+BUnoo/Urfj3XHuf1tZZKXVgqtD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHD40AJH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHD40AJH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB9EC4CEF7;
	Fri, 20 Mar 2026 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774018317;
	bh=c4iKsXS9FObY8UukAwlggqveq7EGRVJUILeikf6snDI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NHD40AJHDT02+DvH/U1AsJXl9mQNxpthbOfOD+j7zwpJXm63hipCalLLf5sapIWrX
	 Xp3wwneQs9BXKqya3aLcaa7SgnGQedPzxvQrrke5GlT3E/glOW6X4wZqZ0A7P9KRqZ
	 mykBOZeIl8huNcxg0UhMcDXwv8zl5eYXp6BSKOFmNKVTEeSqjcqwxXHkCtXBvD+2PR
	 +37G9unuMj4jT1glUwytlEDQyI+bGy8bquPV+dNkv7nNnbXb3+boSwr/WOgYU59Mzs
	 vaHTLzxjik+gcdVAmfnZC/lSbhrRMGfZxbwni4605oz24xg6W0jabK4Uw7V8gz+P8e
	 Xsj9Q8jUdmseQ==
Message-ID: <480059c8-33e7-4f8e-bf03-b0d7ca3fd074@kernel.org>
Date: Fri, 20 Mar 2026 14:51:52 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: aliceryhl@google.com, ojeda@kernel.org, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-5-dakr@kernel.org>
 <DH7OO4961WUH.1MM3MW1SVWI3I@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <DH7OO4961WUH.1MM3MW1SVWI3I@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/20/2026 3:35 PM, Alexandre Courbot wrote:
> On Wed Mar 4, 2026 at 1:22 AM JST, Danilo Krummrich wrote:
>> +/// # fn test(dev: &Device<Bound>) -> Result {
>> +/// let mut dmem: CoherentInit<u64> =
>> +///     CoherentInit::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
> 
> Since this is an example, shall we use the simpler
> `CoherentInit::zeroed`?

Sure.

>> +    /// Initializes the element at `i` using the given initializer.
>> +    ///
>> +    /// Returns `EINVAL` if `i` is out of bounds.
>> +    pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Result
> 
> Should this method be introduced in the next patch, or even in its own
> patch? It feels a bit out of place at this stage since the non-array
> `CoherentInit` doesn't have an equivalent.

The non-slice variant doesn't need it.

I don't see an advantage creating a separate patch for this.

> I was also wondering whether we could have an `init` method that
> initializes all the elements without having to zero the whole array
> first, but I guess it might be a bit difficult to implement in a
> flexible enough way.

You have this in the next patch, Coherent::init() works with arrays.
