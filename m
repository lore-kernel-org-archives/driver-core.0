Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C13F39184E
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 21:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775163887; cv=none; b=MIk1dZiYJw/HY0RvLw9PCQrWBP5QskFTlMU08zyZM/tzZZS38cVQcq0GvPZ2Dqm/xygTRDNU+SlyEUP6APFVW2m6GQ7nHUmeJmGtEQyiTHO9jqb+JUIqFPz65yGkWLr0YogsBqT83aYeQxBi1b5y9YK8d6rITLxTi+vqRHuLxe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775163887; c=relaxed/simple;
	bh=9niybiFB5IVgmN0LDSpn+N1s08D0u5vGDHQCV7xvlbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJntciK5GI3DK4WXRmLgJMju1tuN3X5TDMN99/1Iy7TxFXu7YrIG5zK6pUPmMyrZ0a6OQm+nneIW4MMIzU1xs6otfa4Nmf6BOVLPDSFGz+r3bD4+YS8BeMYXCCzcpBk7OoHYZDpTPj+GeZkRIr2pxEllrojcPyxAWQjZVzBpnUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+sYyLp8; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+sYyLp8"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12776bebe9fso3216015c88.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 14:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775163882; x=1775768682; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YkigmJHvp4GgElx409CeKFIXm/H3rAfVDHZAfLtsfrs=;
        b=d+sYyLp8AlQHrapxRzLgTwR3JxaASDBoxBDKLU/gXMD7PStLIvwRsuhxCbhFmTQcz/
         w5rgop9QeNcmxFgsPg1Z/AhHxCE11Fmy2IABmVZ0rGve/ojNTv4ihdf85GS113SgVpjX
         sFM19gHt/UJf2Cga4rsN6Q4jcUtrQHLbieA4Z0j+AdS6I39TvLJ3CssTu7XaXgapVqP4
         AL1+MwHmfc7yy7dFmRV0Vywe883rEfQ6Yz2i0V16YAAblhTM6S8hOEhciSTLyC2oS3D5
         1rCxoFQbez+Y7NuS1DV8T7gwumXaakqb18KfFPueIaPF7pBBArUptq6yLYh3HfW2la80
         3QBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775163882; x=1775768682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkigmJHvp4GgElx409CeKFIXm/H3rAfVDHZAfLtsfrs=;
        b=MEiW1J1rx4Ocxo0ze1GPdf7XBjDZloqi1aO2Dy/lr2D4gsDGhZnorwpmFDH+1XPs9K
         EJTrwXulpVZTuoWXI9agGqIAD1xsMFTtUreiYGgE+HtmYiCtByO8UU+uRJeANr2VrslS
         VYodnUMLmSPNlLJatW87yIdvsyvjbRnQ8FBuWMRh3a88/hXQONe1QpxQ5+AowH+I5dP6
         DwypdBImRkpAI34kqYSqtAKuawilmpd3DUOOasoP6cu+a0JuMiGYd08xWpswH2COkF5Q
         XCFfjUZ5gGn/6fL6cHnjpJB7cEZvsrmQqy7D89eybLx0nmueJOv33YijQVXjuVnPfDfq
         B/UA==
X-Forwarded-Encrypted: i=1; AJvYcCWspdfUXbgsK+k4srQsxNQnfecMyvuOtPUkWm5kZGpfYAdP6vZ+kcju34sX98yGZJGAk1z7FBVnk0lI7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNZFggf3G4HQFaUlTRd//xZLQcbJlmNwxIlUfeTRnIE16AJKu/
	zAI1f34Z601yU1zDqgujFWgGuXd5qafhf/0b9g7PBv2p7qVa41pEt0Au
X-Gm-Gg: ATEYQzwbDveRMO0mX2A2Tu1aWIG4I0oyawwbvxkY+esyVZH81MuV2ZMJHbj7ZoDkBFJ
	zn8zmJmk+jcqFsJwwf9YtEf0U99U481CfpngFwuJHNq7466Wpbu4K5tDefhgNRcLdACcg0LltQM
	/57peIpvoENeyUdN97fWhVad3ICRmoszfoVIQ5t7sDN37EcFShIBWO1GPFxgdqnxJvFQJ0jVqly
	8n9CELam00UaTbIJLgwOfhtIxco+4rAiaOpKNZkr1/T44S6a4VSzaPDkEKXjtQeerYFjGlissgT
	6EhFvvSgynwEZJyz/InWOxXOmIk1SYABjWU22hwQ2UT8ky/EuTV730Qo7aht3aAFMbYYgvGKDv1
	e4fOUX7+LrSOJswTbof70pGOLLAjbXCu1gP/r2QqwqghuScQbZpmpCZXwj44knei+9YxUreNz/7
	vi00Rko8JsToK/bShvW2WoPalGuTjRU6B53mGtquEgm44rfeTB8/OGR98Jy1kqXLnM
X-Received: by 2002:a05:7022:1603:b0:12b:ec96:c936 with SMTP id a92af1059eb24-12bfb70bfe6mr322111c88.14.1775163881666;
        Thu, 02 Apr 2026 14:04:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bede545e8sm2818277c88.11.2026.04.02.14.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 14:04:41 -0700 (PDT)
Date: Thu, 2 Apr 2026 14:04:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2 2/4] gpio: swnode: defer probe on references to
 unregistered software nodes
Message-ID: <ac7ZA6HJFBhyCROM@google.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
 <20260402-baytrail-real-swnode-v2-2-6f5054a4cc07@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-baytrail-real-swnode-v2-2-6f5054a4cc07@oss.qualcomm.com>

On Thu, Apr 02, 2026 at 02:54:27PM +0200, Bartosz Golaszewski wrote:
> fwnode_property_get_reference_args() now returns -ENXIO when called on a
> software node referencing another software node which has not yet been
> registered as a firmware node. It makes sense to defer probe in this
> situation as the node will most likely be registered later on and we'll
> be able to resolve the reference eventually. Change the behavior of
> swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
> resolution returns -ENXIO.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/gpio/gpiolib-swnode.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
> index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..06d74e9e199de0b91a019e5e15d4b83d330291e7 100644
> --- a/drivers/gpio/gpiolib-swnode.c
> +++ b/drivers/gpio/gpiolib-swnode.c
> @@ -95,6 +95,15 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
>  			break;
>  	}
>  	if (ret) {
> +		if (ret == -ENXIO)


I'll be just sitting here and quoting sashiko all day long ;)

"
If swnode_gpio_get_reference() returns -ENXIO during the first iteration
(for example, when checking the con_id-gpios suffix), won't the loop continue
since the return value is not 0?

Looking at the loop just above this block:

        for_each_gpio_property_name(propname, con_id) {
                ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
                if (ret == 0)
                        break;
        }

If the initial property check returns -ENXIO, but the subsequent fallback
check for the con_id-gpio suffix returns -ENOENT, the ret variable gets
overwritten. 

When the loop terminates, ret would be -ENOENT instead of -ENXIO. Could this
cause the probe deferral check to evaluate to false and fail the probe
entirely instead of deferring it as intended? 

Should the loop also break early if -ENXIO is encountered?

"

You need to change that to

	if (ret == 0 || ret == -ENXIO)
		break;

because if we get -ENXIO that means the GPIO must be there (the property
exists) but not ready yet and we do not want to fall back to another
suffix. 

Thanks.

-- 
Dmitry
