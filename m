Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802F554280F
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 11:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953264; cv=none; b=qeUbMxAH9m2iVYyEue42+kYcrUhOEDjATXDkmGHlAE6rxwdSZW5SPeCurZMiqp2XywvjNNYSqiXXdDztgE6a/BF7jrvZKELfSkRzizZtEhIuxE7LuyRzQbVCLo7UiukfAFIlKMqfyCIOoyr4EMnIbqNK52oNzldAJsTz57wuMnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953264; c=relaxed/simple;
	bh=MDBBmeOGt1jJA2QyqYyZpKdJgVhokM9Hyvk+N6kJG7Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U3Mgl8fLt0ntpf8IJcMWSPPPt0x3T+PfyRkbqsbNyF5WS6WvrtsjCMgCCJ/sfy1TSY64kGST5XthRcqkL5fMZZAm4rHsl88sEQzluNcdEMgI+HWY1SKY1eI6b5P2S8TAXaZL/M7vy1uYoTAwB2I2BBknD3zLj6lv0mkLuodd5VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvHeT9q0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvHeT9q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F2751F01559
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788953261;
	bh=osuKNlWwkgDC1U1icT/Qoh45Es9k9O509Xjy31GoFe8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=AvHeT9q07mrFnfse9Uk24EO6Q7CoZSkye46/Qh9mTWfJvOWnqvVf7lYngpEegQB9y
	 EdiUuvDcNjOpdNjIhpfDyH3EbYl72xEYC/KodcKIhy+VXn4+w3w+yNKW617QB4UN5f
	 +ssctnHV/S77+GUG1XCV3l5QqNYcDGdiG/abO5nXFdjV81JXtadk47JN9Wxy8t5Tbm
	 nDEcChLlhf4tarqU1tebaiv81VSTCfDJOeCkJyL+n8/IoTbnThWdqQyRhNVJs/LQzI
	 XRS855GH9ZzK3iI99kw2kTFL1gkpAKmx8ZrI1HFRYXTCvQv7ZgIPcUrodgaK+GCJ05
	 +0L9xdnhwhaEw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b754cc3b6aso3110825e87.2
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 04:27:41 -0700 (PDT)
X-Gm-Message-State: AFuF++lIjnRssK++IRiq7dHsd2yt06SeyZqgZwBaQViYy9J9Gw/eRWGU
	IIE4djpJzEV3o7Ki8VM7hN2gZqjtyKcu/35HE+b1nO684qLqV1h3B7ysbUCNkg+dyi1pmXBpZ3I
	9tgS4UCibclhG470cqhat1Fvq7J8/uUiuYMiLS3NKqA==
X-Received: by 2002:a05:6512:234a:b0:5b6:1a7c:aa0d with SMTP id
 2adb3069b0e04-5b61a7cac20mr5414087e87.37.1788953259475; Wed, 09 Sep 2026
 04:27:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 04:27:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 9 Sep 2026 04:27:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260909080114.591938-6-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909080114.591938-1-herve.codina@bootlin.com> <20260909080114.591938-6-herve.codina@bootlin.com>
Date: Wed, 9 Sep 2026 04:27:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf8Hp1k+s0A3+T0XCWbm0mzV3rGDOd0=gkM0x+arqf2fw@mail.gmail.com>
X-Gm-Features: AcwNN1UF2eAGvBL-3uNx_wKL96_0i716IzDQOeLpWlE0LgzqTry7SnN7eIT7jms
Message-ID: <CAMRc=Mf8Hp1k+s0A3+T0XCWbm0mzV3rGDOd0=gkM0x+arqf2fw@mail.gmail.com>
Subject: Re: [PATCH v11 05/10] cxl/test: Use fw_devlink_set_device()
To: Herve Codina <herve.codina@bootlin.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, Steen Hegelund <steen.hegelund@microchip.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Richard Cheng <icheng@nvidia.com>, 
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Len Brown <lenb@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>, 
	Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>, Lizhi Hou <lizhi.hou@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sep 2026 10:01:04 +0200, Herve Codina <herve.codina@bootlin.com> said:
> The code set directly fwnode.dev field.
>
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Richard Cheng <icheng@nvidia.com>
> ---
>  tools/testing/cxl/test/cxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
> index 547ebc97bf59..e21e45fe1572 100644
> --- a/tools/testing/cxl/test/cxl.c
> +++ b/tools/testing/cxl/test/cxl.c
> @@ -1678,7 +1678,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
>  	device_initialize(&adev->dev);
>  	fwnode_init(&adev->fwnode, NULL);
>  	device_set_node(dev, &adev->fwnode);
> -	adev->fwnode.dev = dev;
> +	fw_devlink_set_device(&adev->fwnode, dev);
>  }
>
>  #ifndef SZ_64G
> --
> 2.55.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
