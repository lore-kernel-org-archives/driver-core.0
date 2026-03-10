Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2E199D8
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773155404; cv=none; b=sINAWDFnE57CcVLjrgX20yZ1YyaO7Yuw3b/BbUgfRye5h1Wrm2EfYFzZhnVMhAeHPM/4cLRtZNMKRRGN/ZlkmktMR7OBtrGsTvNGY13SfxleeGoS+8sOBDww09guG8KznFr5LFE+A4Q2FIHdyyvn+TJqVIGifFlMSpdQ/5/p5Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773155404; c=relaxed/simple;
	bh=QEW3lhhJANPdrCVBmAIqH1dXUDPD23689ylzZ5dnJco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZDM7zPXDVncZ8maxoeMBjbr8LQT8ZFLPzfZwH60nR2+17qg9S2AAIZv2p0M1Uxa7999xHyagmS1mGYt3rcbCa2Lspix7NNjtSs3+XKU0xU/PH0zRjNyuwEb5HxhRrvc6MmyrsZIndSwML2MrN5uqXWYHYDwA1hvS8pRVgNcVG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cd80f56b27so285519885a.1
        for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 08:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773155403; x=1773760203;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ru18n38/qbgrYN5XhGLEd0K3IukQ/mw6D37X8x0z/qo=;
        b=FfJSyhmgVgAwpM+Pm3nUU7lmXfvNqBupKdvJY7t2aOJHaDuoyHkTd0gCxEThP9F/QV
         lpusqF5Lr4wZYu9KRXBdByJ0pA80N0pBkZzJ81m3ZXtZVSrMx1TrrIveHy1vfzwIoWJ8
         L55YzqfrV2DOKL8WLa6op4L6vfT7IwXacyJWW8HdRDeKx38C/F5RcEheElCnnHzulD0e
         RLDfa3ycGZLvCX5yk103GKftrqqhu1Vthptpf9J4UpCJe72xUBJ99ym2Y67uNTh3qd9w
         abxO6Q2QHrb9wSqhV+PN4UPfZ65nSHQALqTF6siPakJuU6JvjM5/xiK4krLmp0BZMpL7
         5cfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXHO980YPaJQyc5GBBkeNl/RqiSl59WnEazYj1wFFkiJpCHhBTTqpoVPzZOKTZUuAoZxdGCC+5VNhumA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxkk6pCDzILkwXx1yiZByeYkP89ne5zSugotbdwC1tpRhtfTLys
	dVody9/OSfIEMeV2f+IxFdf+vbUIeqXHrwLaTjZPuBh2HPNidZ05uzh9g5E3q9TV
X-Gm-Gg: ATEYQzzSp9lf3Bwve5C7WW5Uxt9z0xHfT66bnNjuIdjQvbzL6+PA7dvIZao4rDQI8FU
	s0v6CeOK9bbjIxWLfhfkFLeJO/ujlaFmUDsxmjR3dZ94Au4ArwFTsHsDqDsmRksaLBQJGSRmkm0
	vZQ/oZOJJDm2FWhtCmScR0aKXl7KNhcYQhLaZ9CGVn8CaRqy1PhAGr2NE28Pbh2gW1/dJA4V9sx
	LcWi1GpBTIL9FSLmKRs4lFWsCfopOBd6D9sBVZoMkHUql9Tj1R1F9LUgjpWQi9aRBNYaoxbUzWf
	5NGPi9xaOKEqJEs1fBKpt2S0Ymt9cYaZ7SmGaF5cDGlAybdtsV+53v1zm9SkUPypPsBMTdx8TGm
	1Jb2fVys9gubKSMizPky6/Xi5ulqXiiSJY+zK+Slk5TJvXBeTNrW+0zzuE9QQeWMs2SfRaMBoVJ
	FxAJD6ZPnkjUTJF3bcUsc1LPzKxuLpcb/JsQHpqjOX7wswcSNMptPD0UYx3E0+MCCb
X-Received: by 2002:a05:620a:468d:b0:8cd:926f:6474 with SMTP id af79cd13be357-8cd926f6747mr579599685a.25.1773155402305;
        Tue, 10 Mar 2026 08:10:02 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd7ea02664sm580729685a.5.2026.03.10.08.10.02
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 08:10:02 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506251815a3so116517321cf.0
        for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 08:10:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXoQm4bQLE5/SgVW/tKD9uSs+PgTl9H9TnH0ZB2AULBKcwjQxsIo5F2f78GKOdKxaXEyA0yUO1QZft/tw==@lists.linux.dev
X-Received: by 2002:a05:6102:c8f:b0:5f1:70fe:3027 with SMTP id
 ada2fe7eead31-5ffe6121c90mr5181206137.24.1773155033187; Tue, 10 Mar 2026
 08:03:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com> <20260227135428.783983-3-herve.codina@bootlin.com>
In-Reply-To: <20260227135428.783983-3-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Mar 2026 16:03:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
X-Gm-Features: AaiRm53b7liJL7XJhyMA-JPl81LkjhC0Orfn04kAcG7__Cf3-wDY5cIOlphhcC4
Message-ID: <CAMuHMdVVsEB-xb8Jz4ujBam2NxtxAOb7byYa3VR_eHsbTD5rXw@mail.gmail.com>
Subject: Re: [PATCH v5 02/28] driver core: Rename get_dev_from_fwnode()
 wrapper to get_device_from_fwnode()
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 27 Feb 2026 at 14:55, Herve Codina <herve.codina@bootlin.com> wrote=
:
> get_dev_from_fwnode() calls get_device() and so it acquires a reference
> on the device returned.
>
> In order to be more obvious that this wrapper is a get_device() variant,
> rename it to get_device_from_fwnode().
>
> Suggested-by: Mark Brown <broonie@kernel.org>
> Link: https://lore.kernel.org/lkml/CAGETcx97QjnjVR8Z5g0ndLHpK96hLd4aYSV=
=3DiEkKPNbNOccYmA@mail.gmail.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Saravana Kannan <saravanak@google.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

FTR, one more user of get_dev_from_fwnode() appeared in commit
9035073d0ef1de81 ("reset: convert reset core to using firmware nodes")
in reset/next.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
