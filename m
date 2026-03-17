Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C31C27FB0E
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758631; cv=pass; b=Upfr5pkFo4OUZQHwgciGl1TlTnF6bChzfYazqk0toBlbQa/cxTinQQUxjAVT7aL56rpYa30/AqkhTfMZQPzTxYpXKCzQQrFKE66zS7iUcY95ar20KR9KvIBrwlfTAtqGZkSUVR65SMeb4TCQrhux95NUWiHAOHepeUqtzK3LD5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758631; c=relaxed/simple;
	bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u56ciRyGMUYfFsvdoNAQ///HZCDMU6i+0QOiRmFwP5WyRMbxvn7qNvHHAxENvcGzOhK0IV1fZ9W6FaSrFJ6vcJjekbk9VME7LMrGrNtveqGtwRcgtObD8F/i2ofOeA0pQAbqhY1p9PNMCA540ktDQFdEhinOUHg60a432KenS0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MnBhaclW; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MnBhaclW"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b9b190easo4207201f8f.2
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 07:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773758627; cv=none;
        d=google.com; s=arc-20240605;
        b=Rxhlpsu9MRZnixbMhoccQkl89Tx6YEAKgAdR7QFMZRwJnnTXLagDj08+mYiZmGi5/Z
         RrBjVo+AfhxpwnhjkUBeN/tpt3oyjvsX8xLTUIUBDsCefZn2zWSFx8po4OqDGSTtq6j3
         c/LGFvZXgAdExi4m6mYwLGP62bxWMEKcA1pZlih1lqKtS6xeQxJtSwKG+5PmZhd6PnWA
         DwWETvPtpg9y3S7/VOjs6qV1qoyd/XYS/5j3w75utJ0W+cNTMd2UA6EJjRM0lCpKZdX6
         EUhsD0iHqhgTPJneTyap3RX3qcCM96rWGM4lpuyp09GssnkrpGtp162fG0uG0xyMKKBT
         TpIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        fh=vp+kLwlVrW3j0AXe0IRrA5x1Lxs0YhU5Bo4c507dCmo=;
        b=VwujYsKCUOWwmiiPegLQvkcwgJ0bOtmsXMMIx1eUJtVhkT0lSqOKlC2oXSLGpMUbvr
         hXWh+kupR4jnnQGDdac+wYRnAZILnjGSbHE+3cPwRuUHjtQ5tGPciOWZvlGSCGN3izuX
         8Kp45tW3iPW1m0mHBV5u/Dg3WWxV033RU8zplVzlL76djY6iWAqJh2HrALkLup2Otb9X
         AjZAg0xVtbFeKnzctXsaeQAIrNMXpj8UIUw4DIZFGN3bEdav5zZDmbuI3P26yERbnD5F
         2SfoqbXRx4KdglJ7lV4Xq4JlJ6fVU1zhTGTul5KOH7EFOiXZ4UAysfwvXT21r3N1epZW
         c6Eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773758627; x=1774363427; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        b=MnBhaclWTWfslIsIsQgIz8LX0RF43P0ix32mQU2T8w/EW7GHMnbJQ/VwVQHmLbpDzN
         JY3awESpRTPJD+Vy94puMB+tuVE5xLaMitUHavq/PYi9MqUtw5Lu/8h1/1v39Scm3n5z
         2w/U3NX96rFVk6RJYM0ozNwbH9kSgVXKOV0P4rr5DoLR5FjStfnl6Mk0PeNc4OdhmttM
         Ha5LEK32RPnlfsbvSDXoNvsetrMijltjx2wtL6nOgr1SBOnTnmyFW5iqwkbJoOW3FL4u
         gMgRe0VxpJWUfPpodGFHQmnvAFqiDzG5pXUCnrRs4q5wPD1uxpGq7PBP87XXX+gaZBrV
         yDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758627; x=1774363427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAjDAgNxxOY8q2SKVtH3m76VLWJXframDsv7g4XZIBg=;
        b=aGbKIaXN9pgjXqt9h+DmcFhDt9ggIHtvofPnCBDVBu9Z73fqNLxEcL4zjuyWoZ4dMh
         RJFjM7FgWZQaDpj30dcBW+d2bE8/tQ5WmZTeRGV5Z7m38XwuRxN36UcnEJl1z2qxulkY
         SdpJ6wolA57Km2Cp9o0UNpsqPFkZl5ehiw3kaSUyhUSziW51k/7QFsZtLLauVO5r+jy+
         QzEm4wgmEoB7/K+z05eQlSJQeAlY6Otd8xP3fsxT7ah9Vy/t7VuO0N8uwYoxKtCDNRZV
         u9yeZpKLgtmdVm5u/LF8T747IJUNgL61auRbxXgnmovKoWmBG3riUqOhY5WgFYrApszt
         2eJg==
X-Forwarded-Encrypted: i=1; AJvYcCUP4li2LPdROSr0VUAAsSxp4Mc3pPOf0VpGaXJGX2uLjs+R+VrfHyeS6NySqcOBwXBhlMi5kVvOPR2MDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyR+GXd5aQDf5MVNXEwNPJzEFrm6cBHBz3IlLo05g4k0KdNqCG
	psoagaRQDDXLU+kj0k7Y8yjnR/bMU7v6MK98vG2F+nJhqG6MnTLLfUph+hRWStzKta7cbA37ec6
	5KTg64WA6fRLM4TTCy+OoMsuffLRbFa19bnT1RzO1
X-Gm-Gg: ATEYQzwkLi0pvQo427087DWmAUM9fxwxkfNksQADdFPcowcVkF4LwjbBSWvrrDmtaq1
	yyMgGiaAtTbRd/yy5LRkvEoPOR1ZmNBtRhNCXXkq3hoYl20FlrObgeJN7oQ7NRVx/GfbqMEC3yU
	0yICguATKt+xdv7P+UaRSNo6ZgeXjY6fGlxK9N4nY5fLSCAQLbNQT9Bu96zyk/BSrcxMJQt8V9b
	u+7XIQQ+RafcI3FpKj204ek31bnCtU7JTRss6RcnJqJnAwNXZctpfhaSyayT6So5fRGLpBEPRj4
	29VOYciGyyA4Ejil6rA+UFH08pp4aMcYZRzbj9pW8V2iglsZ+tgb7QRXkB1tWMy/kEEL4Q==
X-Received: by 2002:a05:6000:2089:b0:43b:498f:dcfb with SMTP id
 ffacd0b85a97d-43b498fdd7dmr7040022f8f.8.1773758625958; Tue, 17 Mar 2026
 07:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-5-dakr@kernel.org>
 <abj6I9c_2IR0cKJ6@google.com> <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
In-Reply-To: <DH54VWW1RXMQ.34MLWMQ1ZE0I1@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 17 Mar 2026 15:43:34 +0100
X-Gm-Features: AaiRm52v56DZ-OgaA6yqn_n9aUY-kVhP1nzCEQDyDgheJLFTSiIY2bIqeepmrHw
Message-ID: <CAH5fLghYV+k5=dYwxB7uRjfSMsE9_=JaOWeBZd_EdoeSQh4C1Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory initialization
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 3:40=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Tue Mar 17, 2026 at 7:52 AM CET, Alice Ryhl wrote:
> > On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
> >> Currently, dma::Coherent cannot safely provide (mutable) access to its
> >> underlying memory because the memory might be concurrently accessed by=
 a
> >> DMA device. This makes it difficult to safely initialize the memory
> >> before handing it over to the hardware.
> >>
> >> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
> >> before its DMA address is exposed to the device. dma::CoherentInit can
> >> guarantee exclusive access to the inner dma::Coherent and implement
> >> Deref and DerefMut.
> >>
> >> Once the memory is properly initialized, dma::CoherentInit can be
> >> converted into a regular dma::Coherent.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >
> > overall LGTM
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>
> Gary and me concluded that dma::CoherentBox would probably be a better na=
me for
> what this structure represents. I.e. you can carry it around and use it s=
imilar
> to a "real" Box until it is converted to dma::Coherent in order to make i=
t
> available to the device.
>
> Is your RB still valid with this rename?

Yes.
