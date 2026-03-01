Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A1D231836
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772351810; cv=none; b=PWj7MTCJ5nGzZCotRGi2qXwHmMWwOvWAybA82/gSaqQRshn1bATB/u85Pn3Q5JdXqTCqG8EbVwowwsC36QutPRuQu127sbLkJV5xZJ2ZXRJjOAD0F1g8x0mXEEu7Th7zzZX+YOqHQcai1cRrqGkx2Vdx0CYF+eMw1M77wR2lmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772351810; c=relaxed/simple;
	bh=fHPJXMlciHnObqoUj2uJ4M6Qdtd38LNuqyUK0JBiZh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HtHDVjZWW/Xt1SnPnzu5axw9cQVaQVWa3j3CJfuJpWw0kFcDi5gaZvjZI/4DCvww/2PLEyCwGTPcUMocSDXlB3kJY+kVEiGj4ITArmiGpLZC36Pci040XyEIlKQ8ZVpFdJtlo44fuiRaZJYjt7Z/lAfGF2lbSr3VPHS7Y3VVm/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KpHQJLK3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KpHQJLK3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f992167dcso363911266b.1
        for <driver-core@lists.linux.dev>; Sat, 28 Feb 2026 23:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1772351806; x=1772956606; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UAkqncwaBSQm61ty4+VcxJqmyotEfziP+tLQOjI6vHM=;
        b=KpHQJLK338TT0LTeD4BsDuPSaZU+LI1C+IuOXlp3UF3OtcrvfTG80hyUYR+5IorRQY
         rlfzLSDs8EBLa/brgyU21XnCmiGW9hE93/Us0Ccwjfzwn7IYkfkfc7QXjY5wzUS/F51O
         aOolbsYbiNJqSCaQjs3DuUxB6q/960IIv12BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772351806; x=1772956606;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAkqncwaBSQm61ty4+VcxJqmyotEfziP+tLQOjI6vHM=;
        b=pPzCaIWuuUyGQ52UnlgoGEZUSui7bpYRRVYZrTdWWcxENMpraqRpozoqmTvlcAo51L
         k+yKh3gTvkyFr0g9K3w8jKrBEMIb4emws4Vf6q3aDuAnmx5ooYcTkZsHN8ClA2uRgrtY
         wWT9YYAQl6GFHp+Bsrak6BT9siQu5G2KW1zGKPEwXrxVpg7nHcwf297V/Rl6XqKUoKMG
         57pWszv3U9uxEeUgPE9mxfXm1l8U59SVHRFeZlSMPrXJf4JXXBMQcJJ6kXa/v3wyPlJT
         rxW/fsUhS2mYEwMaAx1guQDnw8za5zQMKAvBVuRWCzEXPjLJ1M9ApkkILoHFPwSJs3NN
         +jYw==
X-Forwarded-Encrypted: i=1; AJvYcCV8nm4yErXxkRFG2heTkJ+vALEWEO7LJHG8P0nQ68BUYRowvDyR5QrRNWbC1OIEmVbhAUAz5Wh/G7pkfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhzR8cE5wdwERnTEnsh4AnvBBgmYBlT/O7xyjFnHToUy/hIgzl
	OW5lGVuVEPMCwGI0NpnHAU75QLOMDn0cdZL+og43EobBNExczdZcRYREsuhDvmY1QWtDkDiXQsq
	ENzJmPUQ=
X-Gm-Gg: ATEYQzyD/nPS4z1qP0u2xgyZO4S8kt11Tp/zG/jQgJ7DQg6H86z4vQ7+iZ6+rBlQR3D
	7wyPL39U07JBPLxhwYRa1p5Qei0/O1Cl904vHL9F+H+ciLNecfqIUht5RNBEDTt/aQ+6KaJj4fh
	c4UKxxDLxRw1zbwsuxT8nVodutoxr1dk18Tu2gzpKu3ioHAtc8X5ulF2iuhbwDj2TWtDKOOl5f3
	+K/bHEiH2WmwZbAuv52nEupXGfIsfkoK/YY9moAdPuT4Gpy80tMPh6i8ubKaKS6z1QZk56Be6GB
	qoOaXpGnnEmltE4s19IrZmcty135z1xbvdZj1NishwWqo/IYT3O5VDGC1jwBi/zTKxDTwxw+9Fo
	4WyjTSmVGMJgeIFRtkqVvr4LG3kL6zpxLC4jELQKxPbEIjOz8z+EOpGCtRmb5DmerRN6aAH9X+b
	uFio64dmjdxnHta2K7Y3y2oHIsMR83BQqm1BPJ6tipRpYNsjk8CDU/048DV4TB+khz1mNo7byZ
X-Received: by 2002:a17:907:3e9c:b0:b87:39d:2b9b with SMTP id a640c23a62f3a-b9376510a71mr614039166b.28.1772351806455;
        Sat, 28 Feb 2026 23:56:46 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm337436166b.41.2026.02.28.23.56.45
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 23:56:46 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65f980cea07so4939674a12.0
        for <driver-core@lists.linux.dev>; Sat, 28 Feb 2026 23:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzhCZk3KNb82oiP08P6t/vBd7+IckSgw1PElORMoA+OFNdCF+K2sWPPJ63ks0PUEomBhd/9W1fa9+lIw==@lists.linux.dev
X-Received: by 2002:a17:907:7f8f:b0:b83:95ca:23e7 with SMTP id
 a640c23a62f3a-b937636cee5mr554496966b.4.1772351805687; Sat, 28 Feb 2026
 23:56:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org> <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
In-Reply-To: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 Feb 2026 23:56:29 -0800
X-Gmail-Original-Message-ID: <CAHk-=whLdS-5DhAfJVOp_fXJcM2sx-V0DAocuwA20s3JcA-d6g@mail.gmail.com>
X-Gm-Features: AaiRm53QeH4tfXx0plcR1AZBTlH4cv4p0UAXb6D3niDubjG28DjQBxzo-g0ywYg
Message-ID: <CAHk-=whLdS-5DhAfJVOp_fXJcM2sx-V0DAocuwA20s3JcA-d6g@mail.gmail.com>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Feb 2026 at 23:44, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> In other words, it makes fragile drivers go from "you get an oops" to
> something much worse. The oops becomes unrecoverable - with typically
> a black screen at boot - because the probe is holding a lock that then
> makes everything else come to a grinding halt when the driver fails.

See this message:

    https://lore.kernel.org/all/67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net/

on the interaction with the driver core merge with the firewire oops bug.

In this case we were actually somewhat lucky, in that the hardware is
fairly common, but seldom actually used - a combination that meant tht
wer had several people who caught it fairly quickly and were willing
and able to bisect it. I had the first report the day after -rc1 was
released.

IOW, it could have been *so* much worse. Imagine some random driver
bug on hardware that isn't common and just causes inexplicable boot
failures for the people who see it and are likely using distro
kernels.

              Linus
