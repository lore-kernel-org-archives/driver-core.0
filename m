Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090B330F938
	for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 11:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774177639; cv=pass; b=Uxb64HaKYjHPAWhZZd8pIbXjv5bxWvlyqQ/aZisq7naItpMEkSee80ZSz5Gp+wE567YkkKqqnnmSw3Oqb0LVH93ruKENtoP2QdDItIE2l0FD2BrUliwkLPGvHp+qf91aBCUf40b7Q5new0WUKureu3URtVdOWqW6YqE2opRdWJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774177639; c=relaxed/simple;
	bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCFXuOvFKNoXSujtJw5rIzDx0ix2rWklJ3k1OCmOV/qvtFlaht6uVreYKSP7NPMbrr53Rd28plakKycEd57kN/mGriVBLcLNUMMeH71jZCOjbvNq3AWQhakEmNLKU5ZOC+EvexVfY+MzCJUbqnpbXkw/lOr7iKJsrVdjappTdgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PE4barW/; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PE4barW/"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439af7d77f0so2378709f8f.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 04:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774177636; cv=none;
        d=google.com; s=arc-20240605;
        b=Vf0Myf8qGtLr+IRHKII8HQdmAwihZjXIZsF1MXE5epY5uXGagJxU7cF2NdBu7cSZ1H
         M2mkzJN6P5CiCOPiK+Gu0rfFbrnb7jtxGTVngsyNufsXdQLlmYO5FrlXUkzskiiTu/0K
         iGVm5nZyrtxov553IjvTxPhgNSr/bI4Jcx/iYLKNYHoEA4ihbAmA+M4HDCnF8C32dGgc
         pTSZkoajPJzrJqcoKuWmivac8czd+LPUCGstzWENubWc/cdOcnjjOsQePpzC68/rkQLA
         iJ/dDb9pGZxLAnuBioioi/B+JVkNjhuusVDebZR8gqG/eRmd24y2BTErlMqkBkIWaCC1
         l15Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
        fh=1R7bpTMJMyy21VHB0D3M4ljpf8F1Jy7Z53RMRRK9tMY=;
        b=BFu7anaTSCuzRdkA2JSK6ycFHZUfiAtVPYpejuR7o+CIuNnmDuFIc/K5UREp6NIXUN
         2RDsrPtAdIMhRHCScYf3D6VMYotukvNGg87i9wYkjtGAyKORWfbMKBMQYD6yQEnm9CU2
         j1IzcyQid2HjCqAQ+CsRgnjSu/c7wwO1zGHgxYm0RG2tC9tZ9HOLWtnX1qCW8fuxwQTH
         KeswMIcK1eDhjAN73ouMsTwlb5EtryAfRDPLrnNvF49qoKb/MO4U8lik1K6VJ5fi8ckw
         bBEEriRcErixCBQXBWGQU4vwAsVXjBIBRQnITtEZPoZGod25X2XllZs1Bop8GLpiiRcI
         YKEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774177636; x=1774782436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
        b=PE4barW/fuxkaoPwaAxGVQnYx5ghZEMqAI5dAHhJngW9gF3HDKhfcxIdS8wAL8Equs
         y6WdI62nsNi7rPHrB635HEir2vnneZuu82Ned8j7rqfhdyiV6AXbRN/chc0JgYv98+bE
         BIqRfhOC6tJysHyQu23E7rppoZIh7aJH/mQlpWj8pP8/zs1gwvVLcRrrJ+DMbDrPbukV
         frC4U+WrBaCYkLCkk7stwB7CpIvX1G0mzUbc3kbpdDnL99OCeW4dGJ/Vzvo4TLHhGUST
         PW08JOvG7bghXbSbg0gnTYDkgOUA4xX5OTaBXlOeMOexRuWLj6dUaMy88J0bwT/jD3J2
         +O7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774177636; x=1774782436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gvtTpkQne7LV/j8cKiXI+qrmKSSfF7shyrzLqW2IuWI=;
        b=B5XYGF9n/0gg8i24w4ZS0x5HV2y61W2j8DIuuhEhSQS4tKHjBZawNFa+4EggYTTKWE
         hmOLxNBmcBoZXia6wPyUYCCa2hd+muDEGrrWVRswllG0ei2usavskjFk9CoQeSOq9IDo
         EcNmZNCgr0mPDWajtZlbdMn4oySMR79oETga/udsbIryGpqk+aPL863hYnCMBvNc6XtB
         7N+Zjg6EPPn9aUrxw3GHYwwq4N/+2zkjExs54Hobmv8UDrsZN4np6OP1HXsUvu7Nlgc0
         6xIqE8AvD8xlQixdkBMYscetlQxBULhkVLyzhhIkhfWem8rxc+pM/JDSya+RtxoKnNG5
         VoBw==
X-Forwarded-Encrypted: i=1; AJvYcCUljsd4yugcSfrYYurEpOT+sC97fgWuvjI39DJiJ5931qB9+6CfGK95d9wXAlHO1fzUNbSfRa5plGyolQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzPLC94tKRgPfB4xOxMQkM7Y7VKrZTAK2j2vaq1ZGfH68Uad82
	iX9o9NwVeXM41Ux72msP7YbOkrL/Kz4epQAxexl8jrs8Tc4/0lIaKe13Xg2tpUdeSN9giYjtb0w
	LEtRdgZw93yumF2VLCnBKmJo9wY0O6q8QtphXk+jk
X-Gm-Gg: ATEYQzzalhPTrFEhvvWYAi+NIG02oLB5J11qOBN6UwFilrppo1hZ6GkvOMzxbZ3/r8u
	29lJrA7R/RvPGdnt0ty8v9hSCk6c2jAfZSA/4BYtnERbV1Ipfb1yB4KFeHkjyHWCiESJXBlHVpv
	OxokaC7TWpfK5WCrVMQMlXt5MlfkwzPUaNPfFnqWWx0fgwh8gDxbPaWF9nGuDXZJIwxVtlVGaYh
	OEY/iIjfBWYq4iRQsrCQc9qhU1AH8aLo7NCoGCIL1tXD2acgpljCt+NSLCVxW16eQHga6bbjWpe
	uWVfQ8/YgH1Chx94NYtGv7devjwePDXRZ/MDycBcCYcmV5Zs
X-Received: by 2002:a05:6000:420a:b0:43b:498f:dcec with SMTP id
 ffacd0b85a97d-43b6423287dmr13588528f8f.3.1774177636049; Sun, 22 Mar 2026
 04:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260321172749.592387-1-dakr@kernel.org>
In-Reply-To: <20260321172749.592387-1-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 22 Mar 2026 12:07:03 +0100
X-Gm-Features: AQROBzBApyQfE-ScLGU2x2ibUvgga-dh4itt4h7qwXjWFehs-qG5x3_XOAmIH2U
Message-ID: <CAH5fLghK2q4Du+74ctWftbDXrS4E4uPsuOrsOwxbs=HGm5CX6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: dma: remove DMA_ATTR_NO_KERNEL_MAPPING from
 public attrs
To: Danilo Krummrich <dakr@kernel.org>
Cc: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 6:27=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> When DMA_ATTR_NO_KERNEL_MAPPING is passed to dma_alloc_attrs(), the
> returned CPU address is not a pointer to the allocated memory but an
> opaque handle (e.g. struct page *).
>
> Coherent<T> (or CoherentAllocation<T> respectively) stores this value as
> NonNull<T> and exposes methods that dereference it and even modify its
> contents.
>
> Remove the flag from the public attrs module such that drivers cannot
> pass it to Coherent<T> (or CoherentAllocation<T> respectively) in the
> first place.
>
> Instead DMA_ATTR_NO_KERNEL_MAPPING can be supported with an additional
> opaque type (e.g. CoherentHandle) which does not provide access to the
> allocated memory.
>
> Cc: stable@vger.kernel.org
> Fixes: ad2907b4e308 ("rust: add dma coherent allocator abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
