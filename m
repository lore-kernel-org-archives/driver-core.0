Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1978F3B893B
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865175; cv=pass; b=r6F3gXRgI735lW9l9fYkwlhxIGWWvMTP83TBVjGG+md+SScPnh6w/wei/cOfkMivMFzmLuHZkNR6MHJggIb9kjodIPP2otcfnehptipzdT0qRvVZzCahzCgcyuxy+wEIuohAnAC98FZClvBc5YCFCSglL4oHHZW6BNw7exU9H04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865175; c=relaxed/simple;
	bh=Ywd3pp+a7x13fcHT11JUD4Jp/5rqd4sY6rHeKcAM4zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kaE8wEJiCa6HjLAVDv/XcAh/TO87MQQZ6v91znmWKeFJP15IImM+sVDw/0F7Q0fEPkeUgtniQuSVcoZqDmhyLibbUamQfPRhjsKuD1IBfkc1cdmukxjDibrS64ym24g5M0Az/fNeVqtCnxRdWAbynF8wkb7lsFD0Q6ctL0Ej2Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJXghJbJ; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJXghJbJ"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1277863a912so488578c88.0
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 03:06:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774865173; cv=none;
        d=google.com; s=arc-20240605;
        b=SpepoPUPTUzVQRH7XUTgQrqQnTSp8/8PO8ZTeuRTwmDWGh4PtEMYsDL6wioVWBaStw
         riyik4txSEDzm9Ih46ioS9Rsk1p1McqeTJI1++69mIRZ1hzz5IdZ1lwso1GClVZETAgl
         jCMS5r5WxtmDTovFaE62yj9Jgb4ehsw3k6UfigWc+Nu8iflyktDdy9wv0nWbOhjLE1po
         UiXc3DK//RRjQSGdnCpCW4jSbhHEZ1pDeZ38+DvdvuQq+UVmcejzqTDjxwmK5KvCSRvd
         uf/54Z05HYz/7M6WXz8WzVrMeuLxzikI2b6LUdmhyM6DvSr7U0GAGh9WV1bwBF+Qmog7
         hIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eY4qIAfl6MiOyTCo7+liQfaObknXsV5FGDvEx8EzJgg=;
        fh=modx5WxbGaL7Xyh9W4q7AH6GcsYdb+qBnXonOsSPMwE=;
        b=MMCVtVvBIeMLT/VDIDYRjAfyeWKrLkKOtfUWDJNBd2xCt+wUOCTT6nDqPvg+KOqsPF
         DIPTRE6UdsiGZciZAUqJNGGvUmP0YAqjQMZB/Yn3mExHSHkjvITmkUR9f1uUy8NWTXEQ
         TA5YcfXQKjqdDrbPQIgd3RxEdCmsRTeiEmne1FxA31V+e1JI0hrMF9SuD+oK9iIg2QO1
         FcVM9jsQasGFGfbAq/sTDR7u+mNBd4zb/LUqz9zRlGIi7x1ucBiH9q60j8yWI8QrVIfJ
         hg3y7fMd5utErwfapCAy145K7EBSv9M7hURM7npWxKMuuo9S6RkVwc8V1UdQVNSweM+x
         sIaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774865173; x=1775469973; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eY4qIAfl6MiOyTCo7+liQfaObknXsV5FGDvEx8EzJgg=;
        b=BJXghJbJOx1ovgr2ce1ktousGzcUR7bvsLa01nJy1jKn3mSV4pRDF0ze7hUDWiC/64
         TgB07UiRigzFhW+CRmK47ut8PVS6uLkB0qf4wr1eNFman6baom66wl1lgIulmfOjkoJv
         A4XFPPP5cE0PL4McqspCcRwgipX88nFmcWhlncekW2DoMM67ddCvqjJBdzR0KSJruJW8
         AOV7p2PSVxtAf6JnppaKyC6DRDy9Awn7tkJwf/WVjAOTGD7t5LxX3WWrDEwU8X+rRbXL
         6XdHxlp7SgHi718/2R+eWscKhmwohp8o3AksmIUB3DoeMHrnuxFwBkXRKADGIakImzkg
         ph+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774865173; x=1775469973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eY4qIAfl6MiOyTCo7+liQfaObknXsV5FGDvEx8EzJgg=;
        b=I3nsBCQr+1/ksy52x/uEDpmnOJyhddeiNmC9RWrFt5eVcjoRwmQ2G36RJk5pQRWexh
         6fg1q3qZPovXT/WdUypb/RF3uFNS+qeuSGBTzdtbTblysy723xmcqMa4F1pkDOL2JoGu
         o6rjoI7eBoscY2qyaclMDSbLp8mznH5biRgEGV6q2SaLOf1T4ZY+sic04Q7s9/idEMF3
         3o4e6X6dUqQOKWgan8qGfyJWFdzN8WEvf+qF08gIeB/6QGyFzOk4LEtivCPvrEXCyIei
         lzqEMqk1NCwUpqlN+MfQcIaqROTqO9YXJZB7/DeEorw30BD4HyPzIWvcLSyYzYlM5Syl
         FjDg==
X-Forwarded-Encrypted: i=1; AJvYcCUkqpvjm46LQOJogToS3R9RaqZfTluds0klQN/Uy3UUHPNbXbnOiJgWQ3zk5GA3YUmqvC1I+POcqjIL3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKabYyTjCuegzBTOeu0BsbQ7V2cMYkSuDMbKAiShaGlVv71lgX
	ugGhgaPaxaC0yBMK5Rd90d4VI8xYQ2LV7SekZM2e/OySIr0rus7wD/dkW7p/wR6G5ZfnEGbM7lc
	ybHqYhIz4OR4l8zCjaWNvUuC7MWzaOyc=
X-Gm-Gg: ATEYQzz+HuGhhqOdTjLHSgzLAsYo69mLMTAhTKiA0z262ooBesnZK+M6Ol47GC1ThWX
	PQZcUHipVUmfBvPNTRAIe2lX9BhAK95oyyR7VqDFtsTf8VuSYte/xMxivef1nAuy8wL4BLi4GOq
	iDxwmFR+dObBfgDTbHOX9LnGJu/FEB2ODtQRavS8R4xx3KGcwWzE2AqGqXBNNsVH+aC8EjJmDXC
	WsaV9DTGUBVwhLc6QsmI5LBKFsvOS05TpM7G/Nb4iaTbhDAIGqfptO05MHeSsa1xV8H6vXykgxl
	pMTco+KHuuz3IZ2zDypwRvDPWi0vAQ7MfhrUNDcnMxOR0XvQsGGOwolSwXycL2OKs6gjRLk1wzX
	BDnpH2FwF5jnFkr7VtxASuI8=
X-Received: by 2002:a05:7300:fb96:b0:2c4:ec89:bdb with SMTP id
 5a478bee46e88-2c4ec8915ecmr1400436eec.2.1774865173005; Mon, 30 Mar 2026
 03:06:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330020234.16893-1-mo@sdhn.cc>
In-Reply-To: <20260330020234.16893-1-mo@sdhn.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 30 Mar 2026 12:06:00 +0200
X-Gm-Features: AQROBzC3g4qfuwBhqsw85VSnp5GtlVYW2IgAIlbbBR5stdHYL4rKhoQojmHetT4
Message-ID: <CANiq72=JT_3Fz68YGmxF5V22g_QCd0k6kDqhKumSdf1n9-ZzrQ@mail.gmail.com>
Subject: Re: [PATCH] rust: replace `build_assert!` with `const_assert!`
To: Mohamad Alsadhan <mo@sdhn.cc>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	driver-core@lists.linux.dev, Igor Korotin <igor.korotin.linux@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 4:03=E2=80=AFAM Mohamad Alsadhan <mo@sdhn.cc> wrote=
:
>
> Several Rust assertions currently use the `build_assert!` macro
> despite their conditions only depending on type parameters or const
> generics, not runtime values.
>
> Replace these with the more appropriate `const_assert!` macro which
> should trigger earlier in the compilation pipeline. This is possible
> since commit 560a7a9b9 ("rust: add `const_assert!` macro").
>
> No functional change intended.
>
> Signed-off-by: Mohamad Alsadhan <mo@sdhn.cc>

These are the ones identified by your Klint PR, right?

It would be nice to mention that and link to it, so I can do that on apply:

Link: https://github.com/Rust-for-Linux/klint/pull/13

...especially considering the recently added guidelines, i.e. things
like Coccinelle would apply:

  https://docs.kernel.org/process/generated-content.html

But it is also good publicity for Klint, it may get others to run it ;)

>  rust/kernel/dma.rs            | 4 ++--
>  rust/kernel/i2c.rs            | 2 +-
>  rust/kernel/sync/locked_by.rs | 8 ++++----
>  rust/kernel/xarray.rs         | 4 ++--

Let's see if we get Acked-bys; otherwise, the patch could also be
split and sent individually to subsystems.

Cc'ing the maintainers as well (`scripts/get_maintainer.pl` is used to
get the names and email of who to Cc in most cases -- please use it
when sending future patches).

Thanks!

Cheers,
Miguel
