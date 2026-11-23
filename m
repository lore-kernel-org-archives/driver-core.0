Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477763;
	b=MtKRS2SE12FpP6yE3YZUoYI5z4xYFkfbnDJax/CbLcZUtrNgqft3MgbOUrC7Ah5gXweT
	 9ay2lK3joyHIH9cQc8vIcdjaLi6KuAhDA8XWs7ONqQIbO2ufZ53IGgse/ROVBON3HpUEo
	 OwiDhKP8sClQb2y9vt5bGL4s902P5K6MqZZ4PrGzrDA7SGXIT51KbhdgrJfNx5S0QwaTE
	 RLHpZzGIv1lmyE8CLuCOPysTNbTotQTsAV0Vg+mHyXSwvOkHxESGz3ZC0bCb6ejW1dmax
	 IYKm/tLN68DfmNycjP/Oj2QcSBYCG+kJ7yysLmtN3rBSvvb/0Ekk4M53dbwyiLJOmKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477763;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=sAXNrWbDbP7ysg441+6RZE6+jFTIZd3JkPpVhxHYPgs=;
	b=IZNd0AN0dObamRGyWAYuhkT9CqzNur1vXWID2oCGjqo62Ho3eqVaTWKM8VWn7g1pte+U
	 Q7LUkdbTPwcAn559jPou6YGIkeXlwvWvIgqzHcZAa3MmcDv1OzQsuH0VATEVqbW6Pp2Tm
	 g9xbqUq+tMIoigQtKnZmKgpidxHsTz9KWo5reRANN3ooMIB/iAux1F2I59Odv6rs+jUVB
	 lVfKnYO7VPapDY691+48+8adoTaWK4kePYdLg4cpO2uZmep4f4ITQrWb4HGnNcppSLv4f
	 yCdbnVbgMhZyhcn8GDTwhyDFt1C59Q+6PZcfXMuDE2Cqltj8MJ9Y+VV2NmVkM82o54A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6gtS408;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADFA606A31E;
	Mon, 23 Nov 2026 23:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f6gtS408
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 318A01F000C6;
	Mon, 23 Nov 2026 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477762;
	bh=sAXNrWbDbP7ysg441+6RZE6+jFTIZd3JkPpVhxHYPgs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=f6gtS408v2vNyAEMKpsOCu+0RDvmsVoB3kxhsZNNVWzBL0NfRDnzliSks/xqdXzwv
	 XJiXA5TcMEdf7BDqF0QnQD235fvkGFLsyebML2Rmhmg5kdUfXAODOSeNRhUEBrlCfh
	 tyv+1Wz61EYtrfOc7Ix2nfI5o36w8w8EyULCiN0BCqEchf7r0+30CyJLPD9ak0tLRo
	 C1H+u3fxoeNIyLza93rnczJtxgcO/0ebfxysluULlEkV8W7eZGvOT4kYwj85pE32kZ
	 DPLwGIcLqjISiPx5Lkvcc9asLsbT/HI4csQgv4UYZSxjXle9Kv5oeGRqwBuCIKSTNR
	 Mf0gvM14dPPZA==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 00:49:17 +0100
Message-Id: <DN2ZQV0NPYW5.2D6Z4TNR45UAF@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
 "Robin Murphy" <robin.murphy@arm.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Helgaas" <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Matteo Kloiber" <kernel@matt3o12.de>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 0/3] rust: dma: require device configuration before
 DMA
References: <20261123203926.1787169-1-kernel@matt3o12.de>
In-Reply-To: <20261123203926.1787169-1-kernel@matt3o12.de>

Hi Matteo,


On Mon Nov 23, 2026 at 9:39 PM CET, Matteo Kloiber wrote:
> Matteo Kloiber (3):

Thanks for working on this!

A few notes below, ahead of a proper review.

>   rust: pci, platform: pass InitTokens to probe()
>   gpu: nova-core: build Gpu inside pin_init_scope

I want to avoid wrapping everything in pin_init_scope(). Now that we have
pin-init self-ref, we can just store dma::Handle in Gpu itself and then bor=
row
it from GspResources.

>   rust: dma: require device configuration before DMA

I think this should be broken down in multiple patches, e.g.

  1. Introduce Setup, Params, and Handle.
  2. Convert drivers to configure DMA and retain/pass the handle.
  3. Change each DMA API to require a handle, converting all callers.
  4. Remove the obsolete setters.

Thanks,
Danilo
