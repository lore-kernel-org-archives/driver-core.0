Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D5542D77B
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212139; cv=pass; b=HqfH3iQnpJlaNWkm8SLzDwvUEJNF4la3VJF6ERUP+H93gfI3zJi9f6oWiJ18VDMaQA5aymyhNifFyBPS6/cTPSB4nZ9VGLfWjGfrLIQb/f8xE78kuj1icrIcDuTffUkrUEuzNPE6Bhjo62ZRrn3JS9jeEcwA6nzAaLdf3IZGalk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212139; c=relaxed/simple;
	bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kxoPYOaBfglOv1RWC0uOK1MdHJT3JPPX3Iwt//LwcCkfRI5LZ5g4SgpQUOcFuzvQlBn0Yf2gDqStuYUhkhoiYaohR9NAgtMVZ1SHZiaHrKh9a8SrMRo4VWouXlA3ds2KIRgVYWihMmTOIaQ05BYbBQnrRzmcbElsPQHg8dRyG3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TG2szALw; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TG2szALw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so960247a91.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 07:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784212138; cv=none;
        d=google.com; s=arc-20260327;
        b=NV7TbIEwUpgcAQ4yDURIbo87fL59iwN9gI0H6gpPM/LlYPGBSin5DVCuMn7Gpd0cGj
         c7Hhj1u7jOZ4H0qivS8qbT0EQdjAnzbP02cy/fVG5IL4NEMAGCw7WcBtLJ659wf6JGIt
         Qp/rtHcc5Opgv1faMWoOGM3Ww+Ywcn/pWNLiYO7G0r8DnEYcmkGh0+i5+q+1+MkaY+7K
         HsPTdQHIuIePsNoAlvi87r2xYVZJjHAAVMcO6FG7OaZLdS3tQhsJeYO6W7iIcqRo+R2h
         qoi7esrZbbjgWJPN2oZ4CfxrYB3WVSFr1W2S1aXtv0r4yTieyCec9St4B6Yacu/iX3nT
         H5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
        fh=KJVAjgYl6Qanupgp3hArbry2xMMgo3i3R47PT8jn11A=;
        b=CI2VlsnDIxks69J9mUBwCpEtQC2IueC3MG8hkT3b5vRPRF7MNHxrOVF1UAFbVIJcOR
         a2kwZxQVQ7Y9h4er8LPM9XfVaGieXelNx5BK1D4rLkSnBBXgFYmtxWzE+5Qc0p1D5dqt
         nQj+ph8XdSTfrt7aH+rpuEemFVmTu0zAr5LM03zU0+9waJJvOqITLy1t+21+8pKKWtal
         QqxTiIi9h0FdJ9EKCf3emWG2K8OJsY5MsadcHBYNaKGTVkrYPMT1nVv9su6igsCgM52V
         r6D8Z8Gk0Pq40wEVD124hwryzvUaaZg2hDQOWtbscaca95GxOOO9sRa1j9rdnEz58I+r
         9w3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784212138; x=1784816938; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
        b=TG2szALwfFGifX9n/eGntjl7cfJKPP3lAu6kiUIEYAm3otmn7cEqrx1dumx6hkv1h1
         RI0fOi1RmRHxCXQVWwPRizpOE5galHr+MLzgI4h4hZrGS8C3FIPyytptSFSnaFyhkfVh
         fM2fU7mDPBtzaXuekWh4uPOZhvKqtq5qJorrQdv3K+RkzmhcDP5/cYp/S8Pm9X82u79G
         23LAsNvwBWKe6Ln+sneO3Zkpy/MY2kigDjxSONeowTADW7bLjOacGHfOUyCTSABTrLC/
         Y9aXQSo7a9nzJ4hSvodFOMcusnfy0nSM4GHDFXYJLJZPqfC3lsoDBgImGhs//8PRqjLN
         k9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212138; x=1784816938;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfB9IWtbQ2i7/mFdpOyOosw8wiYRxIP7HFdFKYZuz6w=;
        b=RxjS9C8kr7YYo3wmUQEKcE6DxF7fcqwCLie4yJkGJGnprEa6bZEmkdbzw6OEReeelD
         u7h8ClwsBttEFDlkj4JbGNEpdEj+w7fE1Qk1SMyHKkqYKJPY4uI9FzgPYiZjGPozzMl2
         CqI5/yvTRsgRZQS/nRIHdyjWjM2vX9zhr9ZRneeiflNx6udb4NF1MOOYFchag4k/U50y
         uSwiAoFb5HthOiAbBI/n/FlCIK7nC8oXiBL9lQ5zNeGku+AdWSV7nQ56pWTuvKf1KQWR
         iwZKwkDL7ta+UstFhuFDuZNb+Bwr+8oZqS4DrN2b+GiOVxuiQVuDGe7yQxjxA7v5vSuv
         Fj6A==
X-Forwarded-Encrypted: i=1; AHgh+RpXAK0S+V/V7Txjdon2F7mhEiuLoymCYOraMgE8UKqo3AYdYj4pALGNsF86GUX3uN0gtMs07lsukNnsRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YznSGH4P2jtkAXKtxtgq7HLlr1PDP9sA+m0sOqX36ry2Y6AnXqO
	WHHdmccxzCjqUgDbyaiK1VQ36NEz+koIb1Bb9841/+J/sDI6Q5X6EDijPixObzsRxPaXM3CY2y7
	/XU4lQVP0lP5TKXOl7FO5Jv9+QUl1Ze4=
X-Gm-Gg: AfdE7cnOq532/fdUSZg8CZG00/NQcfRu/4ni6WYaweqTP7NYMh+k8yYy9UksPBBnOCV
	KdpklKeIQR8ppy2RNE6aEx+EVc9VaIu0T4D3+bpKT9cEUeSvEs0bSeivhDhM/GhsJwcxMHi6pD/
	LFqrSxjILcaWOHHH/rNKHX9Wr7hervjCJOl1sQHolntaWSKDUO/t9QoeXC3P8Ap/F8lT68XD0B9
	8b2S8GraTJD8ohEVCz/ueRQyPgCfEIEtvUNGAowmtUQTJGKuKahLLMWQUc4Mw9SBQ4nGR+wPvIr
	2Z8vuak8cY3Nk7t5MzgTmDsAJyDHvy8q9pHdp4tkLkzd8VqpioTbe3PhdlIpT/Vhi5kDkRIBZNT
	5CA==
X-Received: by 2002:a17:90b:48cf:b0:381:2788:a437 with SMTP id
 98e67ed59e1d1-38dc7a978edmr14844482a91.1.1784212137665; Thu, 16 Jul 2026
 07:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
 <CANiq72n3BYGfB9VvLk4-bBQzGy9YhDxFvCrjkjJqBbcJa5YRYw@mail.gmail.com> <DK01JT88NEI6.1TTJR16A61780@kernel.org>
In-Reply-To: <DK01JT88NEI6.1TTJR16A61780@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 16:28:41 +0200
X-Gm-Features: AUfX_mxEo7Na8S_Zfjwk-IJFfG8hfJYcWvQK3HRVF7C8IC1nwjWKc-JhNNi9_Vw
Message-ID: <CANiq72=OKHJo0Shzb_h1OuzmTVLqn6qPJsA_AhJAWOfQATbYDQ@mail.gmail.com>
Subject: Re: [PATCH] rust: device: avoid trailing ; in printing macros
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 3:48=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> I can also take it through driver-core-fixes, I have another minor fix to=
 send
> anyway.

Thanks, no worries, I will take it -- this kind of fix makes more
sense in `rust-fixes` since they are treewide, i.e. it could have
triggered in more places at the same time since they changer the
compiler, and I have other few in the branch accumulated for Rust
1.99.0.

(An Acked-by is always nice of course!)

Cheers,
Miguel
