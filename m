Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827841DF261
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469631; cv=none; b=eeSnCTk1D/lbwhiW3HH1bvl94Y139XlylTeStuT7yPyLKfbeNFqBtFvdvD+mR+r5kLRBmAsCCB+Ma/rlA9CVi5GUaohfMRlcLBVws4hN1c5z9SRKhrpICZ5d32Fs5HiMWaKjPW3K1LDiyWt1u9sTcub60R5kid3fLmBlMXeIjys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469631; c=relaxed/simple;
	bh=ZN7ZYA3vRUNHHbGnPhwCvGjNZJR0JyldjOBVcI9neHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIPV/BDg0nrD2iGZ1f2yzDRYuX5CuHidjgaVE0RWf26ScTi97N/KpssDCu74cEtfVtuL+OOJrkIQoGcqvyjRHbDPHsQbwteGV2gD93JkT08Qevq7uvxkla41ncq0pJl9hj4c8UwHOTGZqiGYVG67kB8aS5qslkl3xt8aZqjXopw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb3fb47559so562848385a.1
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 08:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772469629; x=1773074429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32KLibA2LnxuiBPJQhexbcq4h5vz7CZtFSoqgdy1YZE=;
        b=rkQyzUFwzXCGrF8J7QuAhwmysSIAv00rKujre5himwRBLnCfaM5C3+TTsQA9bNB2R+
         1UzDMYSVmhKquCiEX8RnHUwOpeiqsoxvE6FoubA6cIoSqmoeVWv7hPQ8AWfPcjoHe1KB
         M9dkuSCX7E79o4OCHFSGl72MbY2GBCTIIQXJf4t6TANAapxtZ/JTGqOJQLnRIML5UikK
         h0C3flYT/bd6+ob9gXxHO3hWrxuarER6Fs0DEjzzfABIRuDRnMPFlY9v5Y9cemL1q6uH
         LTYlUlVL/JoHYev83Ho6cupUgNxzzmfoNW7SYxuYcC2EXdzxDfH07/PhhVMtrJDLvkEv
         x7XA==
X-Forwarded-Encrypted: i=1; AJvYcCUbPOFDrG3t8+tYdV3plpWXgXvgDBKCUFAhwWat0KFoizCEhZP3rtM22yTw/S9y8luD6/JCuxf0vIjVWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxugaA9EWiw3fJ/e+l8SoObVw0aWYzGeGbetj0EBmPmlc8tYQt7
	pe8gm6oAKO+P501+4JacHMypBuQg551jdxQET3nAkRpKlcbXcuve32Z98PRgJz7v
X-Gm-Gg: ATEYQzxXQR7zJIRkeojr/fIKrq7CRVHANvCVYxfvS+nSAmSkqFgd3j80Hh6cxz8h6/Z
	JUL3KVnj18JStQF2gDEWrUuxlm5GQMZM+5E8MSMTqCNqGuMy9SAbVEYRbaX53uGJzESgGekvxDA
	FCmF0QpFevxZE317TEqnNR8tiQL8T1OHg+flRGX4UkKUy7J5nWB3/FOKu0mN8UaJdfVjhxEyI2M
	MStSxExpqxKBYpVscSoPN2OLWK7vlMBBZfteF72MMJK1WPPz0H8ZeTLhaDoKasP3evExTAmNOSV
	edM58fL3OJ7dsCCxYS2/EBpFp7GYx80J9YzMQy61JdYodrsEjTH7wNkLoqwr3fQhimJgpchB8UF
	UmnKMOL4JwTmzvE7tNkDnPQfjexy/2JwSS2XG9JbY/TOqc/J8CN2MOq/DcPmJUNXIcta9C5DZyy
	PH9YVNatRf1DvmjWm8Ds7efWqbzSjFAY59fEyAbhKFGcOTK0oeZIJMV2jpBoTjWJat
X-Received: by 2002:a05:620a:254b:b0:8a2:3be9:1d79 with SMTP id af79cd13be357-8cbc8d7a9camr1686597685a.18.1772469629359;
        Mon, 02 Mar 2026 08:40:29 -0800 (PST)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899eb243176sm48893756d6.43.2026.03.02.08.40.29
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:40:29 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506bad34f51so39804481cf.2
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 08:40:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUCaNr+49epwvSIIfrr6KHlNaOPiMtttT87muX2qbGOT+Jg5efKK1LRatlKxv/0FWmU/jnYjEVVfwhMog==@lists.linux.dev
X-Received: by 2002:a05:6102:a4c:b0:5ee:a1e5:6504 with SMTP id
 ada2fe7eead31-5ff3257ef76mr5247593137.36.1772469141709; Mon, 02 Mar 2026
 08:32:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com> <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 2 Mar 2026 17:32:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
X-Gm-Features: AaiRm53oB2X0Qg0vbG2fw10FsfcqVt_uYNXkS-NKRd6s-Lft2nvlJyc42VLB5T0
Message-ID: <CAMuHMdX-rdzLhOFEJYBXzCYX5jH2E1=ydGWKgNkD0Nqx-tGr4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] soc: renesas: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Mon, 23 Feb 2026 at 14:38, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> to retrieve the relevant information.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c

> @@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
>         const char *soc_id;
>         int ret;
>
> -       match = of_match_node(renesas_socs, of_root);
> +       struct device_node *root __free(device_node) = of_find_node_by_path("/");
> +       if (!root)
> +               return -ENOENT;
> +
> +       match = of_match_node(renesas_socs, root);
>         if (!match)
>                 return -ENODEV;
>

I still find it silly to add a call to of_find_node_by_path().
In your reply to my comment on v1, you said you don't want to add
another helper.

Currently we have two helpers in this area:
  1. of_machine_device_match(), which returns bool, and tells if a
     match is available,
  2. of_machine_get_match_data(), which returns the match data, if a
     match is available.
But there is no helper to return the actual match?
of_machine_device_match() would be fine, if it wouldn't cast the result
to bool...

As there is no cost (binary size-wise) in having the helper that returns
the match, too, I have sent a series[1] to do that. The last patch[2]
is an alternative to this patch, avoiding the need to add a call to
of_find_node_by_path().

[1] "[PATCH 0/7] of: Add and use of_machine_get_match() helper"
    https://lore.kernel.org/cover.1772468323.git.geert+renesas@glider.be
[2] "[PATCH 7/7] soc: renesas: Convert to of_machine_get_match()"
    https://lore.kernel.org/10876b30a8bdb7d1cfcc2f23fb859f2ffea335fe.1772468323.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
