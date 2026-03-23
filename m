Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AB33CF693
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 18:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290517; cv=none; b=XGXj5JeXqpnf/YxjQ5M5YzOkdyI54Y4yZ9hUg0wzkAnarbZJP8OmCveUeMqya7lnrqFWZoQ+wlfBafA5gajs2wLh8ywOptADGiFvtFkrUZ2PF7A7I+prNT0mATV15XyUbaAIN+jAk6BAfmXyjQlMN2BRVBCor2NoDSXrqUYyEKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290517; c=relaxed/simple;
	bh=t8uGoOmn69GTvslBxUEc5eTMB7ZiO+nrKn47M9Cp8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVADsOtcr6gzl25FlhEsb7VEMXh+jxfYe6EBpxNdjEZhLUynN9QIsqk8iePwH0k/1CaaQu6GdqjGcACjMxoVVG0Rj32cPoqM5RNnvuVJBdo62vUxsE1sEUjf7hVlrCgEzSeokyITEh+L3pBBcicn1sb3olWAO8/AIOADU0M/nCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhuGGrEL; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhuGGrEL"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c10a2e2cd1so3065603eec.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 11:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774290512; x=1774895312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDXVXDlTyWriMoHabs2g4jaDjhygWMksayJaNvHtSE8=;
        b=IhuGGrELssZEoKbDR/f4M2pVhBeLfEbFwGeIROWwn+TXnnGzgAsk2AysU1iThOm+mK
         367MSV0QCbVfd2PQxHMZ+2oMz6N5M9FbfOwreGVIsPvxk6hcV42NGUc0UY6pwgfRm9Ip
         yo9OhDgNX2kN7Lt1UfuaeTFDJfRLcf5Q+KHVw20oik58d+6ZIOhPF3e5zEGyM0Uzv2qE
         3+MDighmvUpoZELDJMy2nCUIpYWkHfik142E5S4jrXa4yIUahWJA7HzyDU/n3rEnQu9k
         ZfshoSyz59yvGkF7nMY/i9tMTM65q9nmRNpFJkW3a+J11kfFlja0Ne2hdjr2enZHF02B
         VRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290512; x=1774895312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDXVXDlTyWriMoHabs2g4jaDjhygWMksayJaNvHtSE8=;
        b=A4cyIUJ1uqjdiqFhpiFgEss2TC4mG8YQ1EDA5dn5ejPqstZKyWPOhI9fC/UZjknB0T
         gK+lMIxaac+Jf37gxSDKYtIWpTeirxPdepNznWY8E/Rcv8d+DXs632591jHtr9M0fTtB
         UQKjoRPkiyO4JWNyoHM+VjYCUwjR+PSzbspqUPA29ZlgtJjCxvMob6GlHxFx3yqq9A3P
         930HtFVJUTqi+lwsKayllcex0UwetZlRHTcwdeoAcxZohcTDYHLWqCVA0gpNkK097yqg
         HrU84wTg2q4PWIV/rTW/ZLd0OG/yOi2FmLu+z4MgNngTaEP1zO+I8Kjp9nRmhVkJjOd5
         RhVw==
X-Forwarded-Encrypted: i=1; AJvYcCVdfpw/OWfKWGE3TBzcxb+RziM8/5U3Rp1AlzvCvfD3t2rUP1RVieg4zfLaxyYP8NBMH8q6KjwCDv9n1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuMyy98+PPjvYuui8+uFrmhFmMxExn4ZW9Z7o3ux7TlPkofszb
	XYuHsF4simiRINqGt2UaTzKTasUGhzOPix1A9qIK2nlTquSuyo7D6pDU
X-Gm-Gg: ATEYQzybsv3+jxuBesOtlX/NKhNybFEWGbvjZmSFCK4tFo9g2vQf4Lpn4/VGqDklyad
	434Lxx8K0yT49oX/mxKW1tYFl64+6ih9Us/Tv3qTRUCkRwoK0FxLVu/rdyvMjm5xT6aJQbfK2E8
	Sm7F2AfFmFtXgvhzcW3J4LU/bbxh6I09lODVEBictmHOvxRTcMUiJeVdjucgwblvm0PicKhj5kQ
	54OvGIBiUFz9AvzlaNXIYjaGp+0W/vnn158huD8jOJraSl21w4mFqY5unnlnZSXu36plU0JpKV9
	7EjcUUGg7U7v74Ss8jqT7DlP4Plj+ODYprKjefaBhtEQ6FQCZQYsdpZ31hmyjhphb66LYgZAfh6
	3yc3Lxal8FAkRuIdLf0kgu6b3zPohraeROuOH+8Y/kZXA3WT7QskUIYfEl8jW2EvwLPnBQL6i73
	wm5azQ400Mde+2gnafrzTqxVM1Fdr/5hz38JykIXVQ014El2+LQbWgV2/4kWKFXZej
X-Received: by 2002:a05:693c:2b06:b0:2c0:ad52:e657 with SMTP id 5a478bee46e88-2c109712cedmr6434030eec.21.1774290511733;
        Mon, 23 Mar 2026 11:28:31 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b8f2sm17872306eec.9.2026.03.23.11.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:28:31 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:28:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Peter Rosin <peda@axentia.se>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 04/10] regulator: of: switch to using
 class_find_device_by_fwnode()
Message-ID: <acGFksyx3SA0kJ5b@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
 <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <360a8b4a-6507-417a-9fc1-c53b14868657@sirena.org.uk>

On Mon, Mar 23, 2026 at 02:00:43PM +0000, Mark Brown wrote:
> On Sun, Mar 22, 2026 at 06:54:22PM -0700, Dmitry Torokhov wrote:
> > In preparation to class_find_device_by_of_node() going away switch to
> > using class_find_device_by_fwnode().
> 
> >  	struct device *dev;
> >  
> > -	dev = class_find_device_by_of_node(&regulator_class, np);
> > +	dev = class_find_device_by_fwnode(&regulator_class, of_fwnode_handle(np));
> 
> The regulator API is very deliberately specifically using the OF APIs,
> not the ACPI APIs, since ACPI really doesn't want to model regulators.

For now? We also have software nodes and maybe we come up with something
else in the future...

I think we should use firmware-agnostic APIs as much as possible, and
only use OF- or ACPI-specific ones when there is no generic equivalent.
This makes the code most flexible.

Anyway, I am not proposing to change all of the regulator code, just
clean up driver core APIs.

Thanks.

-- 
Dmitry
