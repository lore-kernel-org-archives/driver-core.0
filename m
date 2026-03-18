Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0233DEDD
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 08:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823622; cv=none; b=aS3UH5xk/G7KR5LEr51BSDNbnjMRYjvlGZz+hQjpXwkSiOc0o9i+5i19GlCA/YekMbzPnZaAEseHyxS6DERgIle5iW/Y7nRlFUzc5fb4HM6Ed44+Bo3i4NYWdWgIVc0MTMlTR5v0XNdmJpTxsUjo7v1dbgbiSGYuEgM8pdJcFjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823622; c=relaxed/simple;
	bh=1Q3Co6bxbshrYxrPl4jn/U2T1xBX3gjFWpDnRI8lYDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agHaxZ4K8S4GvDv41BRjuCuF/Ly0LnXklObara1a346oHZkTEoqFPZweaF3QFW2/HNeUiss5MDzWW9n+sILniXFCsihUuful7HjwO+OMyrjVIhnZbxgL62iVz5bV7eQzXWS+Hd5LEUfIavorSN7w7GpxKObJT8JqE7D3Lsmz4yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cd8d97aa2eso861126085a.3
        for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 01:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823620; x=1774428420;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqPUDw6RZ7tI/8SbuWaBeZ31o+A7cvn/glmx6dclWwI=;
        b=P5HxIpD/5v8ex+YJqZMYIa+9IQVObpJY37BJ9UwnuKYuxX4Gsa7nqsnRJ4fz17DUKY
         1TVNZlkTN3Lad9mZNiDN6T2h72MIOvUCCjy9LcwjIpMj8bDQrudOre0z/TJgQCasMmS3
         AKj9vI1VJcWPcAsnRt+gbyjcAoBLDt0JOplxaiTLoalfC1indX4EZuT6SJcu7TbXixZk
         CnD/TDIudqgXccKW7uQVJqEyvdpJUc3GteiA51zENrSGzsHJt2KMiEPTZD1J4ikAQMNt
         SsMHdUSwVA8NAiwSspz4i3EdGSTmmFEB8/BBWB03/SVlJZHKMxdD//zv2uZ3DQ3kR5in
         VDrw==
X-Forwarded-Encrypted: i=1; AJvYcCVsrcSthhG/qHfg/kdzJVA6g5GV6v+GAsXBpMHkyVa5SqnHa9WXXHiUHqjVeSl/dcsYuY0Htwz0ZyUEUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv4Bw2gmlgB+udkJAIm8Nz0vcaRdgG22BpDOasUAJtoTtGJvCW
	ZGlc3iLoVox0Jx9dXOafObuyE4yyDDUX8/EfUZYLpU6n04USkVTSgy7IFJox1ItUsBQ=
X-Gm-Gg: ATEYQzyF2c9yow4mjttOhZbMOrtc86uj0IbhSn/ZHSuMDrEWuYUDBCfUUKDVbf5ZJAN
	PcWxQXD2FVQlqajOTyjhwZNCknyuMRI0shkGCemkAZsFpldELPJ4GI/MTe4DzCHG246IPzZgBPw
	Qo39f0v5hlEK9I3aewR9nGzG317TsrGTNr4lAHCgXuq4m/ZT14A8f2jDtpeCiznetVwZorpIIDG
	kroCO0HPueV3/z+4DBLnoYKkYOo8cCGCkxtXO/+A/mltGRmKoG4MyUuokYHxQKVjfUnr980Flyf
	OOedPx5IcbF3XIA88HTJMXiiz32VYVennXPjbKY0fHgsFaEHU0Eku/fGF6TYcxd4VvL6WC+JCDU
	8ZzMzzcGCRRLRnBe42nXPu5CHd7W3ZEfbH0bd+UpbfH1nJRg811zeaisxgEEgpymLky2ZkhWJWX
	rE5++39sZRJpxSHDdB30sPZg9eqahPfrZLKLwlIQcLtw4fb8TRWNiSIoCKKTB1u4qT
X-Received: by 2002:a05:620a:4807:b0:8cb:4059:a908 with SMTP id af79cd13be357-8cfad20cf5fmr369946885a.22.1773823620447;
        Wed, 18 Mar 2026 01:47:00 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfad161f70sm198626885a.27.2026.03.18.01.47.00
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:47:00 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509046c5c7fso82077631cf.1
        for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 01:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeD9vHSEVOegTgCfREhfiGK3CK3WmWjroKXarw4jTc9qT31b8lC7Kjy4z23cCnczm+5R1lfoHa8O+GUw==@lists.linux.dev
X-Received: by 2002:a05:6102:5087:b0:5ff:e39d:9f9b with SMTP id
 ada2fe7eead31-6027d159e7fmr1126209137.16.1773823315107; Wed, 18 Mar 2026
 01:41:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260316154159.1.I0a4d03104ecd5103df3d76f66c8d21b1d15a2e38@changeid>
 <abkCPU3rxHI49N4_@shikoro> <abkD-VLprcbbEbB1@ashevche-desk.local>
In-Reply-To: <abkD-VLprcbbEbB1@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 09:41:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
X-Gm-Features: AaiRm52_MgNfiAr79FL-62Ac0xXnTx-AfzVYThIE_IN0tF6AadQcPRzCkdJNUOc
Message-ID: <CAMuHMdVX4tfko8iv-EdwO-bBcwCd+cPkb9aP8qJbcM1F4zdz4g@mail.gmail.com>
Subject: Re: [PATCH] device property: Make modifications of fwnode "flags"
 thread safe
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Douglas Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, stable@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Daniel Scally <djrscally@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Len Brown <lenb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Saravana Kannan <saravanak@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	devicetree@vger.kernel.org, driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Tue, 17 Mar 2026 at 08:34, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Mar 17, 2026 at 08:26:53AM +0100, Wolfram Sang wrote:
>
> ...
>
> > Thanks for tackling this issue! I agree it should be fixed, just
> > wondered about one thing:
> >
> > > While flags are often modified while under the "fwnode_link_lock",
> > > this is not universally true.
> >
> > Is it a possibility to use the lock in all code paths instead?
> > Because...
> >
> > >     struct list_head consumers;
> > > -   u8 flags;
> > > +   unsigned long flags;
> >
> > ... this change costs some memory on every system. Maybe it can be
> > avoided?
>
> How much memory does it cost? On most 64-bit architectures is +4 bytes,
> rarely +0 bytes, on m68k it might be +2bytes. On 32-bit it most likely
> +0 bytes. I expect that 64-bit machines will cope with this bump.

On all architectures with natural alignment of pointers and longs,
it won't cost a thing: struct list_head contains pointers, so the
struct must be padded to a multiple of 4 or 8 bytes anyway.
On m68k[*],  it will cost 2 bytes, as the existing padding is just a
single byte.

[*] Iff m68k ever switches to 32-bit alignment, there won't be an
    additional cost due to the change of flags here, but of course
    there would be a cost all over the place.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
