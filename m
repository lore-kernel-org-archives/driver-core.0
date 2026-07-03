Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A223CFF61
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 12:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080777; cv=none; b=hC1R/yV0D8ikWlnXaJI/n5VNSWhD+UHLSvLcWimF2DpXdZ4iiBKYwGpgWzVBGOVTn3O2yP1x9Hv3lEQRpfEcrysG/pxJonP/l3vISzh/RnWQ+LCPY1DkW0OvAohpeWA7ozThE242wyoIEcUhn76rxbvh7JUuG54U97BW9kCOcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080777; c=relaxed/simple;
	bh=ZW1+Rwj2Zkkg4xFxLw7inao2NDBuiKLZLReMOE1kdHk=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1Ef/YP3PpQ8CGzvbIcVVlq4+yghaA3fnyBaIjKtJiG37NW+m33aMbZOcn0oKquiTLYl/J0qzI84uWwqXnyGEsQeOFF4OvmCg7/bNPXE7ACktXIsjPnq2/UawA7CMenJCMVbU3BJ8saMAAkPQgyx5Wzkh2eFA6oAq7dQHkwjioQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V13+C1TO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V13+C1TO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114111F000E9
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080775;
	bh=ZW1+Rwj2Zkkg4xFxLw7inao2NDBuiKLZLReMOE1kdHk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=V13+C1TO7e0BLup6/ZXRFCVqSB8pr91oUvp+sZqGgDu6dy35z5ppYNo0lSuhKJf1f
	 vWZ5VzzvMkh6hoWyk1wdjkd//bAC1zhiP0ugdLwRvhYzJAIbRnGx1D76pMjOdo1k09
	 1ZUqjXfwW0JozzdJ4gTapT02eIULAj+Q0nw4EIDW+B5+ZavUQA7EZwi3FFbE8D5gOz
	 D3D8CInjn2ciHTHbs6DLk5Zl+AWG5YXG4gR3X2WSFDVsNqohzwWXIqSer0SUApbXqU
	 zlj2Ddp1yY39dCBH8RwqN4GhbP9u5/BPm7Xdp6VcIqfcI6DZaRLauZombNCO7ssslT
	 hMOavJL5+escg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb77b3afbso527999e87.1
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 05:12:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RovQs5P7KlUv0k/f5cdjh5vET1J7Sgq3F3AMjyNP7NwuKAJGRhz2gyo5z51mVVr5DkuzckNY1QQVS14Pw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW5K+06jWq02rIp8ukwdiii4C4K1jJnF5/rRiXIhSJgEtLsaLq
	rLgnbjECi8dlp8IUwtnDEYTrNWTo1q1sV/+zwjGaP0aWrLryxu7kbCn14l0cSvnilq3hdn/Mna8
	DQENJ8o7PtSNiPLu9cjgV109+2Nx5iYbgJzVfzWbAag==
X-Received: by 2002:a05:6512:6383:b0:5ae:a702:6528 with SMTP id
 2adb3069b0e04-5aec67ac494mr2230940e87.26.1783080773854; Fri, 03 Jul 2026
 05:12:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:12:52 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 07:12:52 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260703110317.1283411-8-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-8-wenst@chromium.org>
Date: Fri, 3 Jul 2026 07:12:52 -0500
X-Gmail-Original-Message-ID: <CAMRc=McpxD325uVPO5NNZ=47DQgCBrD+uTOKUzoHTgbkPhqtiA@mail.gmail.com>
X-Gm-Features: AVVi8CftwarX-Z8K0VV5KkzRZ0nUoORfEc2vkRQt3p7UOG6R8Lwo7yu86B3HXFw
Message-ID: <CAMRc=McpxD325uVPO5NNZ=47DQgCBrD+uTOKUzoHTgbkPhqtiA@mail.gmail.com>
Subject: Re: [PATCH v3 07/13] usb: hub: Use usb_hub_set_port_power() to
 control port power everywhere
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2026 13:03:08 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> There are still some instances in the USB hub driver where port power is
> directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.
>
> Switch these instances over to usb_hub_set_port_power() so that only one
> unified function to do this exists. This makes adding external power
> control with the power sequencing API easier and consistently applied.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
