Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1528E3F823B
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723972; cv=none; b=uK6MuufwKUzVM4gE+dnJnfc2yQObb0SCdRY2+Q3gLTGMQtSMoNzRpJaZGBM9IaKjMk7fjQdiYV2zAOZ+bMeG84kKU3D7BbJWfd4lKSc0OHwh3rVZodncZD7WVhsQVqNcS8TL6+MRNQVqB12CCxhoVb+D/a8clnc1bVcKb4cPyUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723972; c=relaxed/simple;
	bh=qB4tJg2aYLg8hehpYin2dptPRoadEzGzbBpoppNMyKk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHPqbDk4qjmtp/O52xN34mYp/Xo+Sw0f7vVGmWAYypPcgpWH5OsBrNoWzD1ey6ZMFy11DJ5/MDzzdVcjX1wDE/xRjYSvQAFs72L+eft3v9IAAguymPkuVqJ521ewdlWZ7GjYveWA4R34dDQouG4CuiSJzml7HNZ4hdbiizqSsR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W9y4sWfb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W9y4sWfb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15C91F00A3F
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782723970;
	bh=qB4tJg2aYLg8hehpYin2dptPRoadEzGzbBpoppNMyKk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=W9y4sWfbopngosFq17on/GGHNIJYD36rZ/vsq+rpBX9di44uMCcaSwaXapJeYmJJ0
	 hpjxZkCIIBTqzNqE/6Z06DjCrHPTHtHYBGijzFYrvOXxpDVDJ/gC8FuiPjNin3WSP1
	 goaVHc1yDi2KjablGU6uoNZt67ISmy/K72NzFIqvLYVqSfoQ4IM0TkcKtMxNzwYR9L
	 A3abQM6PJVE6oY5bWLE4rzLTrjN0QjUTITJe7EfwW+PjAqy0EXDsiGuqHw9oP0L0Ns
	 EkmKvqP1VVeWsA17Xu+jtLM9JE41Osm1VsBYUjzJCJKeQC2kLRMvDKnTV3XFZPpR++
	 6yXVZ+Pcxl7uQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39af6402933so14210101fa.2
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 02:06:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpv/q5OrinvPbW+4x40wflsUvCMrcxSBRqrVFH7BzLiM4fxCcRPe0Ua4MC0CfrsaU2R+bSM107rySbagA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ9kmP6TD/9/CwqA+g7baJf00wd+Nmlx38uMxOeFVaXXcXily3
	w1dsPSzzzIuCm45C/UJgb3RETUang3uf84XgMx0+5UEDlz42drH+oxPtPwSuY8WXsHcf6F87W/C
	2fGzy3r9N0pS5/k7KVq1HiP+S+mBO6WW23cCHKrNc3w==
X-Received: by 2002:a05:651c:1587:b0:39a:e3c7:6644 with SMTP id
 38308e7fff4ca-39ae3c76ecdmr17150311fa.12.1782723969253; Mon, 29 Jun 2026
 02:06:09 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 09:06:07 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 29 Jun 2026 09:06:07 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ah9QPgco9BxEix7T@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
 <20260521-pdev-fwnode-ref-v1-21-88c324a1b8d2@oss.qualcomm.com> <ah9QPgco9BxEix7T@ashevche-desk.local>
Date: Mon, 29 Jun 2026 09:06:07 +0000
X-Gmail-Original-Message-ID: <CAMRc=McSDNdBMc_MAbBiOgeWusQXPEvivxniX5dJq+X6rp3UZw@mail.gmail.com>
X-Gm-Features: AVVi8Cem7nS_T_r8P1YOw4p48wRJJJKggepy3MNLXmsKDTbaRpH5jyNSSJ0YwZw
Message-ID: <CAMRc=McSDNdBMc_MAbBiOgeWusQXPEvivxniX5dJq+X6rp3UZw@mail.gmail.com>
Subject: Re: [PATCH 21/23] usb: musb: use platform_device_set_of_node_from_dev()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, 
	Thierry Reding <thierry.reding@avionic-design.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ulf Hansson <ulfh@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Peter Chen <peter.chen@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 23:50:54 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, May 21, 2026 at 10:36:44AM +0200, Bartosz Golaszewski wrote:
>> Ahead of reworking the reference counting logic for platform devices,
>> encapsulate the assignment of the OF node from another device for
>> dynamically allocated platform devices with the provided helper.
>
> Same Q as per chipidea. Do they provide a pin control facility at the same time?
>
> Otherwise simple device_set_node() or whatever platform analogue should suffice.
>

Hi!

I don't know and I can't test it so let me respin the series as is. This can
always be amended separately later.

Bart
