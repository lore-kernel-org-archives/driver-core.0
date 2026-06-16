Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49CD1A9FBD
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 00:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570072; cv=pass; b=Tya9KOIDQmfS8/9Kk6XrQT5i0teHDlvReNoE+343IA0V4G2J8EVlP9yzv6wLn92DwVbKaVW+g37pX6UQpgnb+LUaA9N4RCDAFD+ceIAwfXIpRfQpTbcN3JUIY0iiYU4OxfhXmEP4p2y0LjKF6W0z8a8zAEB/krNMs0uxX0K1E9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570072; c=relaxed/simple;
	bh=+Y/EbmTroEIXOb8ZGWkBw+yCbLIdIXqj7d3eCXNZMxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6Ft4IBwFw8ydHD27bUGt26oZjkRInBDkC52UL9hFNR2rn3gKnoe7jNUBcOaP5AVHfC4xttPMm8oAIMrHNSc7qFlubZ+NGo5gG2wEQ+3f2M3f/0e0DYEfXH0AQjDwteW6b4AFuTYYQU4hxI2qSZnFQ0OmfBHwUvBWOUoLWhhnbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dr65TquL; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dr65TquL"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5175d339e8bso115891cf.0
        for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 17:34:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781570071; cv=none;
        d=google.com; s=arc-20240605;
        b=I1xbMDOkcRQ/eEQYhKWfb/Y3jfKd2wVauRS3LK4RzkQTgLVDtzdCDBo4pzmpoSxno7
         paTKixKJyCWdpwfQOxB5S2v2RSUZ6Ezw1z3Y3scNXRdQQXJNVsh/dmLJelps1JGs3cDi
         PdXoHAsGVGufaGQiZo1VDxPM2ongQ0QbBsn0AcrUcNKV7SRaDkRWa5wO23Kxj6KyZ2KH
         Q2g/Cf128LukU/MSqWZG87drfMOIC9V9ekeNwe5x0N44m8GnZFvZn1bSN3RQtTdZHq5g
         jeYZqd8OUj9bNib+D4KFQxXeFMVoVck1csKbqKC3WATSzqvBFw58FNPh4KBkXQucbFnu
         EMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/kMYwPART6TwqdV2FoTP7myUd2KBImzKngAy+xn3I78=;
        fh=aM8q4O9n5UQ8CmKqqqQvbealkO5ugm+JQgxAVGxqeFE=;
        b=ZNZ4dAStXrfJxxUqS7Nx3XseW8nYzDQ2xoc+vp9XPxoCyVVsrAehvvj5jWPcshJQKP
         Zlr25Poj7/9uetu8qG/eqc/QJUSXHgpFKzck+fM9uBphCU15+PvZIcoCiGbDn6dlv0vv
         GPhKfpbUD/4QR7EWK8Lju4vDOo4VErUvT2oQ7PGfUgZY7cL1EX3JfpGPtutFjt3xquRs
         ss7m0GdVKahjmosDqMrA3gGIdUL9c2zfpM91Y+reizvE/zFT5gjL602SIf7eQ+pHsgTA
         X7GwxQ7WVIQCXm1jeHwnypITYyV2Y/GHq8L5nZheGYLUgXAaRPfs1AelLOQzxOyCyrox
         ua7w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781570071; x=1782174871; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kMYwPART6TwqdV2FoTP7myUd2KBImzKngAy+xn3I78=;
        b=Dr65TquLIOuepdF+fRRk2FwEy8qtpBLGY/ukqavm57JVoDSayo9NadmnWfaoNhNhcY
         U5a3EW3q7LAivjcOX20Lv8holNq/f3TNupplxvp7Pv5SzcnLPwoexORiBYSwQwy5C951
         uxJ8winmkmtGVTLpakryKh7VqDNzeQ77G/XppUCE6N36p1BNP+2yMR6io6176REE97Rq
         kLYgSSBYC6R3ZHSGTJLQA6xa2/FkrFvgH7DJJJX/Ifix6GdnKARBN3SeWMuJvmeu2bhl
         Z7qsEh96C1JvxhROuertTk6liuNEjtsTSgzsfQ/II82XqEPNkuFVe6LgHg7jbwj43gxO
         3tgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781570071; x=1782174871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/kMYwPART6TwqdV2FoTP7myUd2KBImzKngAy+xn3I78=;
        b=OkVqyTrLJy4pzfiKMEFkoi3kxcR8ueKI96iSjpYutfqslh5K0hK8GwpfmVNY+4L8yj
         eXY3c+y9YSXgU5g/sD/hqHzuFyFWw5Fvr3HQL5zSCd0hODBPDw4tmwvXELJNfDPxBR9M
         grQOAjuvx51eksWbypY6U5POr0Iu3G5EEjvu/mInT/OLunQ7FhiMVe4YEWMloM03jXhE
         6h77uCD8NpgotiXyVe6op59TWs9QmdSen94cRWTt71P5nodvfxYWklQWEVeV4I1LMYA8
         4rLzZqqUulj13fknzEVZq8LYPpCZ2TwgxJ7OSGhOosySnKzTKxGlKSHp5Xf8fDgJsXiC
         3n0A==
X-Forwarded-Encrypted: i=1; AFNElJ9I3DRwo6C5vFnZGGjxUDTEjFOOIaImjN+UXuzcuUREwrKogBrBSxLWCLUBQIw+u4ddWgA5lBvinnASLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzJmXC2ytnbRDAlIH8KUsEb2pYSddNRp2/k+U6PLmtA+FMsMyi
	JNcbBZdQgFtHLlsj1HSpiwWWMsrUpzTw6dSFdWOIskwSA+PhYb3NoUvcs/oNl4TZIwMIYK/MwZW
	Jd9D7rPcTxpH47MJ8ZKB3R/tBzBJToj5YM9Ojtj2C
X-Gm-Gg: Acq92OENyXbcN9QhSa+qTrgy+jraf8p/Ln8HlkgEbcODpjt4+Vx2xznapXm7AQTlTv8
	3uF2LeG/4QhWXrU138aWlBcsz90TUNnMjsUlNnNQvfPW49Q6G12+fiuLP6drVKce6yYs5PT7TuJ
	mVKkaLSxtr/sdyUK8bUC70/Y7X8sK5DtoYbXFN5lCYfIJ7BEdDcs5643SKJ+A2Zi4rgrpGQuS0U
	HAKBGfvKTgof35PYnLRwmdEn8FUZ9bEsBygZncDvPC6fi0OpTwrwzW6YLLk7GhwAk1RKuUThtPO
	77tWjOiVpxVAwgStZuE=
X-Received: by 2002:a05:622a:34d:b0:517:5d71:84e5 with SMTP id
 d75a77b69052e-51993a1cd68mr2473791cf.5.1781570070183; Mon, 15 Jun 2026
 17:34:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615234220.3946885-1-lrizzo@google.com> <20260615172535.080cf94f@kernel.org>
In-Reply-To: <20260615172535.080cf94f@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Tue, 16 Jun 2026 02:33:52 +0200
X-Gm-Features: AVVi8CeOrOUpK1NsgldXN4SuTTNLIo0M4rqMqBljDIv29mZJLe4IeoAAQGnLuGg
Message-ID: <CAMOZA0KAHKsvA9yRcdrjG13S+=rJhw-Cvnw2WdLjGGY0azG0kw@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: avoid double copy with swiotlb on tx socket
To: Jakub Kicinski <kuba@kernel.org>
Cc: rizzo.unipi@gmail.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	willemb@google.com, kuniyu@google.com, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, gregkh@linuxfoundation.org, 
	rafael@kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	netdev@vger.kernel.org, linux-mm@kvack.org, iommu@lists.linux.dev, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 2:25=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 15 Jun 2026 23:42:20 +0000 Luigi Rizzo wrote:
> > The use of swiotlb causes an extra data copy on I/O.  For tx sockets,
> > especially with greedy senders, this has a high chance of happening in
> > the softirq handler for tx network interrupts, creating a significant
> > performance bottleneck.
>
> What's the use case? I associate swiotlb with debug / testing mostly,
> so it'd be useful for people like me to explain why you care.

Ah sorry, I forgot to mention.
swiotlb is used in guest kernels for confidential computing VMs.
Ordinary memory pages are encrypted and the host or devices
have no way to decrypt them, so the kernel must use
unencrypted bounce buffers to exchange data with I/O devices.

cheers
luigi
