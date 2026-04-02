Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803051F936
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775151144; cv=none; b=hq93hS0alEeaIGl42FQW+55UDzVuai2KwXwkRL6v1UeMFWULnrgTlcUGw36bW/3iBNLqmmm2XliTFUXucdSuHwT3Gj5adKfi/58bK0csKMnvbsbGPbbA9GTAYhEi0DvkNJM/G3s0PgnTO5fBiiV2jac1UmnlxMaVorMqgJfn/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775151144; c=relaxed/simple;
	bh=zdBBr15vHbzzK+y/RTD6lEdsU2YY966kOlrvNECGXvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNobhOXmEwh7Q5kcGwj8/n+H6dZ1bNi1v6uvx9chnddwVDTkrsA4BfeRDzeV+nRkvlrPDCA1JYKyA2mrbr4IKGHXhm4PET8VyKCrvV2o5EMY+r5DuZ8EYGaDzsYHltZ86dGLVrizPiM6BouNEfiz6wa2lGurZNxx4BTJ1KiIc6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKyu6Q06; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKyu6Q06"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1393167eec.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 10:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775151143; x=1775755943; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zz8YcwWkdWOvxMK3RVth/0rCZCw77MdxTEXEAAB58s4=;
        b=HKyu6Q06SeOmatVW7VKloFc5fuatxhzvaEtiINuZzmxkSHCCRlHmS0oKDi1UQI5swv
         8RLlIHW8hhtLP9/L25/grqRe07BTr3keaE6j+LhqKrdWDESDBd0KA7R8wJ10KxLoa4iP
         SmIomw8sK2Dg1d2pSPvki/XCEX/mU7kL1BoA36eOxUrdAoM9KrO4h1HsRMupCxrTg2c1
         azn+siskSUhToVbW/pRBCuKdWNZdL2N55hvBfBFQomES2LFUBRQ82XYaleBv7jS69BiR
         3vu96kgnWIAY9sq1ENGtH5ZlmqzwF5oNN9evaIATrY+jXHql21RqL6gr+0ODHOIfyHOy
         oGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775151143; x=1775755943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz8YcwWkdWOvxMK3RVth/0rCZCw77MdxTEXEAAB58s4=;
        b=b1QUBzh5FGX73cLuu6e9zFAwcI3mF1AzE8vBiL0CE61yVMfv5CIxHEY4PtulSXumR+
         XMvNax/7CKkbqljuTv7iTK6Rzb7UTYt8J0GZp365i0pEoxMeOGOWd15iV1zcmlJilSHW
         yMLXoqgp+SS1d5HTKy+qCw9RAK2AFc7NoW9lKCB3yPB7/00x6FCs+SvgBpmwPNdwNko7
         Oj5YNqAkgjfS1GkxySf+iy/kmOh2DXINoMp5X3HIUfFiHUeIBPJCBznOHSil3LUKHvIc
         bN6LyGYZjM5QAK2ZRO87eoSOlCcXDgNx2p+5yvr1b9T7jKXBT8pdonmE5T/3kG8b5TGA
         9h0g==
X-Forwarded-Encrypted: i=1; AJvYcCU5IUrjoaLfsUiuwzHsRNmQu6H/Cw6dQGBPzbOdV6QmJOgaD6TEfinQTB6pO+5q7F6K622VSPd9q+Ry2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJxhiipNOudb2bdZGWCtNQ+CNkPUwYNIRjaRZH56c3lbVQVVyc
	gX29zEnIna/n2J1PIoJKmHWLSVcK80Y0XtIgBKYJMk0oHs9If3appQ4e
X-Gm-Gg: AeBDiescVXyrpEc8fIUKl2gm/Yzv1eYJOfwS5v2kB8cwKnlB/YK+SpNRv1+GRERN/Od
	8XUMJAGNIzdk33SXXEYknq9vn3mu0Ex137/JQpjBBa350RaLd4uhsJJGb6l+74b5X3fP2ENbTXF
	QmPUrxrPsmwFDP5sCsezCstyc8tf7Z9r+Pyu7c+MlhavBEtxjLecCePDaGAqgMV1qGTGr4nftHu
	rPjCtv6fQ8xloFJb6a+OhqpV3R+m4KRSeRvP44/jHYtUXkPwtrNREdAYkc9IVNjkA6L5tcB3h6x
	9fkNgyCP364zGOHCskvlzMVe5xSFK9Lr276a6A+mK1NpYHNyO7CkLbIdJUj/vknygEsW+B5qwgi
	d2wqL1DRupIg66CZ2+cp96t07gWoS/IQqYBYASuNzBc9llvUPCajaT+Oh/SgchwAoHwDp51EeNc
	Fb0M8WxWiws0bRVHZIZoX4GIGOfJKK+b0WyZCMRZyxzoASMGDPHUcnfYOIwsmTHfsP
X-Received: by 2002:a05:7300:6da8:b0:2c0:ba91:48b6 with SMTP id 5a478bee46e88-2cbfc073927mr1038eec.26.1775151142569;
        Thu, 02 Apr 2026 10:32:22 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm3001257eec.0.2026.04.02.10.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:32:21 -0700 (PDT)
Date: Thu, 2 Apr 2026 10:32:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 4/4] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <ac6n1p3eLVFzumbt@google.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>

On Thu, Apr 02, 2026 at 04:15:05PM +0200, Bartosz Golaszewski wrote:
> @@ -244,6 +263,13 @@ static int __init omap16xx_gpio_init(void)
>  		iounmap(base);
>  
>  		platform_device_register(omap16xx_gpio_dev[i]);
> +
> +		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
> +					       omap16xx_gpio_swnodes[i]);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to add software node.\n");
> +			return ret;
> +		}

I think the best and safest way is to convert to using
platform_driver_register_full() and set swnode in the relevant "info"
instance.

Thanks.

-- 
Dmitry
