Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534B52F0661
	for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785267028; cv=pass; b=ZpXOeaxPHDWwQVYVFV2xUpFKw7/lc44BITt24uPstPic6DurB1rUg7YATbI+a2JjvFcaTAl39VNqAYWjIFQcPeErxnxCXVfqJ42bCNDMeecmzzn0BBUVaazF6rNsaNk05BSmXfExl49GPA46nDjU98y64MxMd8aT/3UIC9BzRI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785267028; c=relaxed/simple;
	bh=OuZdxdtD2MuuyArmy960J2u4SzK0kRJyCn9E2H22tnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U2b7J9VT9vRfHVj0RoaEAOYK6wMN5VR1gE5XBWg5aEmZepaG7ZtiyE7U5CbZWEwt8nr1TXLo+lQ5NDyDuD+Sw3LBevWtxGw+D8gtETDkKNs3J3ZqhFnuaQPXNmgYoTguuNRFHb25ORY6oN2JIcJ7E8vW9Kri8bXq3IcGLxIV/9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvEbomJt; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvEbomJt"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceeee8c46bso373945ad.2
        for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 12:30:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785267027; cv=none;
        d=google.com; s=arc-20260327;
        b=FYnDl5roH5RsiJvPWXZUvVvLyMFfFaJTQ4aWEPnaIEL2pEVDNv9c7Ggu3/bEJ+AJY0
         vNmBGjP5FGWIaTrIgFIwQTlfzQorLo0v9d/+NRPn8DTsbDqfxOetSOPFUdTu251bp/UL
         EKSun89qHHDs7dy1bAMpSbUt6jAYnPl0dBbNX48iYAZhwmHmBWkScfoSiRem9TmiIHQc
         FiVH1M1Ur6PA+LWRG5dDfYKfqaEBzvo+VmE3ka5lOl82KmUJbGljSLWL25bWJFZTEWIX
         z55i1rMOgoflFYCODCmzgJqULUdvbE0IR+BAEseGrN6L3Xa+a4qt3a8RH6oLws8v8rwK
         fUUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        fh=5S3x0DUJiI53Lv+mCz/jmmlrGr09gk3gTlnpv5lW7Rk=;
        b=Vbk+7Gd7yMI8jZIkw2PFRwltvmWWnfuBy6tdywc90PdkGCTIdu8qfAGCNnTHWroPVH
         UdyUcEw+nFfCPn5J5ibtDIfgPgvuWLxV/hHsQLgkD25GBqHEL7cotdnkHp61UNZalP0C
         k5O18SYMgVVo4WNUCUzLCGcPzfFFv2o7VzyTo2JuIQojFQHN1MTNwKBP8HielIQ1Av0q
         /IFMOxJ41AhouYT7Q1CseNHLmvqT+COZ4ex9GRisECtF47w2DcXav1plEYshNz30IfnL
         zTS+cH9lySHdQyThw95F4HLwXK+X981IhknGOYwaJj5p/c1oXvyboADA3J9sPueQbMDH
         WxnA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785267027; x=1785871827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        b=dvEbomJtsEFobSvoadMqGkawZNDz7xZZjDhGZ1S+rUWLMaOrFc81MdOBn6RtWi9H1D
         M6ReQ4RnznPZ79ZSBKgZcO6NSnjjYoBo5N4ScPi19KoNMpML0ZvviybFQvc4cJRRexYb
         7Lr6tdzSauey2F2JE/1BuIt2MEeTqjhI9bufJzJPTNqyax4bZT9mPTUOl9idnmR7HF8c
         W3aNEvbZcJXzDqJeMyIpanAw0dD5+/Lzuflze02em0RWZTApWuasBxd8rR7kFOQEbfZD
         JtXi/LtcFOb2lXBt+s5ZhroSEt76OzxgFiTUQMNJae7gb+lcTZEr+OzHvUSnMQ0yu7Lr
         +OLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267027; x=1785871827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOlnY10tnr4QkKaIlxFYxTs9Lp19ftPVrjCjqbroCWQ=;
        b=q0njn0KVaRFLYQzncC8aje3CvOVZIMQ+VV2eA6vTCl9a+5h8IluEBKJ+FLGLhTs4Az
         tr8yMEn6HMIjXB8zy0QZvBJEAMfL5cxEPa0wiRtMofZa4sLMFNw51mI/kNO2AZKImKd8
         AuBl238L0tuYZgpfao/UdcR9m6eCpc/N9BCuNsvT7Jg65gwcvUGmvwAfh2Op3CnLN/kI
         MGMIuP6Gfc9+i3ZKzWjF8WpdxlHNHMKtMJq/8sdtLXsZPB259Ne/EzvjRRscUoAhrhGj
         zF4C5kYDW2TBDKjrYn2sZxc5MkYumTn6uENGeVm5Gwa4/7pDovf5oXNJnauDMDj/ENtz
         rVCg==
X-Forwarded-Encrypted: i=1; AHgh+RrezZFEgmf8fYoJY2nA/BUnM+Jc7HO2grEeZY4WaEIwSyWv0u+Bg1IECh+qcY+86zlN1nMf6CCnVVCJsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YymcgQhOUQsyvff8/jxDGPbwUp2L0MCoNAdu3wC4rtYoVBnWqUE
	45KCITix5uGw0POREobJoBus7vAmO/jFppC4PDYurpLpASYyPagPBkeOibjAIJFQ/rxQTSHmrcL
	Ep2lqDu1lRpMctA/VZnzX2B1o4MFTNAA=
X-Gm-Gg: AR+sD10eT2U6eKfzt+fkN9mgj8vOYTOj/S172ScfMUv65sfNcFnxKypr1x+oMUzJg/y
	cG1aHJf8ag7HCOoA2+dOKpftbb8udMXdFxYSAqUKDq5j6oiakgT6p37nifiVVMqT2t6YIKcBSdh
	dtpCT1W6ATgJcykUT8+zABVXUHRecXKP4Yy+HlxgT6GiIvIIEqQGudrPe4kVC+9bIUyK2aF5rgr
	jwx2anJEloKsPqDkudS5kcl5maBRM5DGMP3I4whZUPB4YsE2MJfdLwjoDHEsMCdB0tyRoMLFxwy
	XnBg7rK7djb1Wd0Zm8C5pDe9Pz3tOrc+qeFSxvadzuPe2cGIo9K1K1FlWTRuR7Iz8XsxNZ0R21e
	eKvTJrcVZymtTUvCzEekCk0yxgX1dBNRNj+NTJlnPogR7RkxZCMbTvDzJ4/mv
X-Received: by 2002:a17:902:e88c:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d0157877cfmr34510465ad.0.1785267026639; Tue, 28 Jul 2026
 12:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721-typed_register-v1-0-452d72b60262@garyguo.net>
 <20260721-typed_register-v1-8-452d72b60262@garyguo.net> <DKA02Y5RE1YJ.2FGI97Z60X96R@nvidia.com>
 <DKA4Q5QUBUXM.1K6QS2QPXT12H@garyguo.net> <DKAASRCK3M06.G9XODK0T5AAK@nvidia.com>
 <DKAD64Q7CEQD.Z15OS6MRHEKE@kernel.org> <DKAEZ4LDA10F.1RFA9JKBGY2CF@garyguo.net>
 <DKAFMD8X5LFP.UPKPHK5FYZPH@kernel.org> <DKAFRETW93IW.SXUWFVB47V3B@garyguo.net>
In-Reply-To: <DKAFRETW93IW.SXUWFVB47V3B@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 28 Jul 2026 21:30:14 +0200
X-Gm-Features: AUfX_my7ge7MYUh2zUi3Gt3zgCDTbiWd0Gi_L5P50g4KhlbsBg8SdJA5xeWd3II
Message-ID: <CANiq72kqRh=ucvE8ibPmesyrWdLnwbOwcsmTx2A0iD34DdUsVA@mail.gmail.com>
Subject: Re: [PATCH 08/10] gpu: nova-core: use projection for PFALCON and
 PFALCON2 registers
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 9:03=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> It'd be a compiler bug if const folding is expected to happen, the whole
> BUILD_BUG_ON depends on it working.
>
> `build_assert!` is a useful tool that I'm not giving up. If there is a ne=
ed to
> use it, then I'd use it compared to having two variants to do the same th=
ing
> with different syntax.

Yeah, and on this topic, the overall concept is being discussed in the
C standard committee due to paper:

  N3846 2026/03/10 Grant, compile_assert =E2=80=93 optimization-enforced
conditions at compile time
  https://www.open-std.org/jtc1/sc22/WG14/www/docs/n3846.pdf

I gave the author some feedback on the prior art in Linux (at least
since 2002, originally using the linker approach) and GCC (adding the
compiler attribute in 2007 from what I could see), including our Rust
macro too, starting in 2022.

Hopefully the discussion will continue -- the thread was active up to
a few days ago.

Cheers,
Miguel
