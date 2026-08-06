Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C6842589F;
	Thu,  6 Aug 2026 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786051000; cv=none; b=ujjCDQiaLZO4L5US8N6nozj7GtjtdBaxzHDnAwHqKGIO/EGfW8OjpFzar42yO6HI/ncghknf+QA5egQwvVZmPZWm3Qs96pFGfQVkYwhzJD2qBI4cvr6k2cYu0PzbaAczzkyNkhePHxH4655tHbz4zubKBb23c1EXDehsvdTkFko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786051000; c=relaxed/simple;
	bh=1oThhN1mNT5lt8nyA4w3RzQVLzWMC59n5LtjNXwzfLM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=RVlJrA6NmuHuuDAEA30a3UiEwqqLQ9JuBAqDCW7z7gAX29AWgS+cxotnLJQ4hP+nQf+Vg1CBcYEQ4RKCociGovYXiLPJovryj/mw0M5mV6l76uUoU8yK3TxCqdl/+180375zoyBEpF9ctq0gWZ17nwat41UH4RZ9whszeawiFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e18id2u2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e18id2u2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCCDF1F00A3A;
	Thu,  6 Aug 2026 21:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786050997;
	bh=vQ4BsTUOjjAJ2KFnaTXudlvATM5LJfG/Sgh0poMm/Wg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=e18id2u2gOmqCrXuKo0nVzosOwKYE6wCXAeVIiLeQSRHeSvdds8ZSJ/kAmyMY4gNq
	 V7eGOAKSA158AHXvQupxJHpG1PhunP9HYrcBVEcW9fsbFmJsxzwzh1f/71i/+p9N9L
	 95m2CtTn2V1Ewa0Xw24BMWu40/1KM6vUgqcpO6HAAXfhL495VfUB3J/3lnlszizf2F
	 H7DclGoJuEctQbx0UGAVz5vpsCc2lECi0G5irMOV6aWveRNhyK43/cMq4s7CZdopnc
	 IDRC2RcKZVOmssLsD82Klmd1BCEVKuZMy7jrtR3vaC1BWGUM6uyQtrszYmSp7quCdq
	 /EV288g+nMLlg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 23:16:31 +0200
Message-Id: <DKI68ICIKGL5.2QX6KFG4QO96Q@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/3] rust: dma: rename dma_handle to dma_address
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
References: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com>
 <20260805-falcon-dma-projections-v2-2-4cc9f3f13ee9@nvidia.com>
In-Reply-To: <20260805-falcon-dma-projections-v2-2-4cc9f3f13ee9@nvidia.com>

On Wed Aug 5, 2026 at 7:01 AM CEST, Alexandre Courbot wrote:
>  pub struct Coherent<T: KnownSize + ?Sized> {
>      dev: ARef<device::Device>,
> -    dma_handle: DmaAddress,
> +    dma_addr: DmaAddress,
>      cpu_addr: NonNull<T>,
>      dma_attrs: Attrs,
>  }

From the perspective of the DMA API the value actually serves as a handle f=
or
the C API, so we could have also renamed the accessor only. But I think it =
is
fine either way.
