Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C136554529B
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967197; cv=none; b=NOXKFlSGPIUd17+0Y6RGHYGnD8U8u8/DiXn5id4NTxb3E5dNCy++i5eYfyazefeZtT3r+MkYJxXgnloM1GoJ+ZGdqHO2FrEmUWmVOWKImjxfG2oafKYHzNTymEJgi6xn7Y5IdVliRrd1+RwlUIYxFUR6Fg4cEJUWRnTX8UGOPO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967197; c=relaxed/simple;
	bh=mQVTvUE5EMefp3N9PRRXFy1qIjow9eV0PSCua1TgAD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQYsRIs3sARsiMAC+qGUmi503bJVBhPeLXLI1wnmX6/gCo0lwms8aEFc15GEAqzD9fmdyZr2LHX6icQrTXYzcW2emVsresU4Hb9aeUkphqjlImyrkqsm0KaBl3xCHVLwD0xogSgWoLdwhVNQ3i/yn02BuYY6gLjtPA4TMYTlaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso3397806241.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 08:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967194; x=1789571994;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ck7KwbjNu626e6RdS1sR80rNpHN5osHYGNVSLeBH+E4=;
        b=YVGjDTirpoOpZDZXNq3p0RrsdpGBSS5BoOpXRqhJT1xxxDNKIuQlt5fB3O86h2w03c
         a/Vc7sS1s+CWiNCfWxBdjRFYayyZB5isNhn14WC/yc+Zcy3Bgp+Llm+xG66uJr0D0XXm
         o1JyyqF53U3WyAKXwjaDcHty49YvM00QEBqJR+I5VjwLqqeGrgOmnfuWmM67Q3uWd5mP
         CiaYWa3VeDR3KwN2CeZJwD8cp0no1VuHNZaR1UMmFwJhkRZypMemaD43UaygwU5DQ4iT
         nyGF2aRhLSFK2DOiS+6jBI6+AD2dnXKP3I2v6xjYfYbSoEQKjkxTu6V5Qbl9/HhARowb
         682Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYIUPRuuAqWlL/rgnv+pu6UpBDcompZZJtkjQsgZ7/MbvNGmy7r4JFFpaM2MMUq+QTbQCXTPlT1Lx2hw==@lists.linux.dev
X-Gm-Message-State: AFuF++nAje9TlFyjwR/wrDkSlVWRkCA/aNLK9xAIm2s00+1uVM7nloaq
	U9+W4FNJwvZ+XrKCj6z43bEnz/saluwTjfK+Bo5WDvByD/dz+7bdbxKzIawTa7lrmkk=
X-Gm-Gg: AYBFou1GMNgXgaOWcsoTb7KT6EeDBpGJ9LUX6gepb5WyZCwQfJ33Ll2cBAjKtTL9knB
	KjV63jSeedJPxb91XTkIDadWnUtFCL/x8CK5UFJZOtCs/3DM8pqQ0kU+5kFbnvrTP/FQ10sW/FT
	XEvR1iIAgl+hMHNNYdIbOYqX0QgydGTod6/2iozYxotEAZ+Tu2Rbfvi0pHNhdsqzKTENqh80cDI
	Nsse6Km3DZM/4kDCnR4NS63RNk7BHToCT8WI0Ms0vip3qkVjycEXfP4KNFAnO/Hr9lkLScxvbiC
	hviDrSvXee5WMl0BvmSr5B74gZF+LFsvTOubOT6cnRrqXTRHrqXjVICsNPJrHpxh/GvqplbwMNn
	tp3nXvvx40zzjl9tMCatTPkYfkI2XQ7GZcOjVvkw5Sj51rpCSU7b03xNPZGVWvV1zlJQ6DiCYZW
	qyb7ZaujzfytIiCDcKFvB9k4M1YkgETggywxF6S2ibtjU8sKRMxcC6rQxfCdZuc5ELnwYviV5ll
	CMDRzctu2nq4YxP+vKdMxDE0w4ql3hZaWpu
X-Received: by 2002:a05:6102:b02:b0:786:c86c:4f5e with SMTP id ada2fe7eead31-78a4a6e7023mr18453345137.3.1788967194445;
        Wed, 09 Sep 2026 08:19:54 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a4764e321sm11532488137.0.2026.09.09.08.19.54
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:19:54 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-783fffcfb96so4593883137.0
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 08:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1Qk/Xrn/0WztOUnLcShbuNr2f5LXlrHPcChO9icffgXgDv4kMXp2xDhD3acRhRBA/c45zKnv3L5jNlg==@lists.linux.dev
X-Received: by 2002:a05:6102:6b09:b0:77b:28c1:210e with SMTP id
 ada2fe7eead31-78f67ba56cbmr4525156137.1.1788967188938; Wed, 09 Sep 2026
 08:19:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com> <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-4-cbccf4cd4288@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:19:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
X-Gm-Features: AcwNN1WrudhTWyzE-dMx-744iV6jE5_0S03_iG05gjwf1BiOXXU0ML55Tupw88U
Message-ID: <CAMuHMdVhEuiukgHN3_KjQbOmeJo_+i6exDtJeidfm42S8sEx9g@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: convert drivers over to use subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Tue, 8 Sept 2026 at 19:47, Brian Masney <bmasney@redhat.com> wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Nice, thanks!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Works fine, and no change in generated code (besides renaming a few
functions), so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As conflicts with renesas-clk are unlikely:
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
