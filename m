Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8FD3B8D4B
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290316; cv=none; b=N/VlXna7KmG8ce8WkKgIfTmxItJe3upmc6QmaVjCzZBf42AlNjSgd26yfXy0IMw8lV+fPD0dVZvI5SvpLvevE4QWSCI8dcebTq0mT5puMIFpQojAVeLxYVv7ePBEjUU838rYvdqT3PEwX2PRshbExreaZBafk/7OGngdR9EiuMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290316; c=relaxed/simple;
	bh=n2Px9KvrBSca+8wbbFZSgIYdPNKBUj7GDb8kCwrntFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hnq7ZQ9Unuh2PCT82Q3MC+44JBzyrR79GyH+1AnWWHaNfbm5DK63MD6A+M+8MMzIcCm4bhRDXdVd7TAeIdQfNQcIg40po3TiN68OqP7q41b9p0Q6gavdsz7MAXj2JOP2Wtm1hIksLxEPI2PWMz7MGItUXa6vkjsq+JESrA1YYpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CpKLkY5s; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CpKLkY5s"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12776bebe9fso705958c88.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774290311; x=1774895111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+l2i6CJ0UesVmQ48tC67wDfEsqc0p6X8zxC51ds3A4=;
        b=CpKLkY5sVaGH4g/3nlbjv2f1b50YdMZKaU5w8bjpPSEq2UZA/ZcseQqG4CGt0DzaK/
         dwLdYqdccnwxBwyzHWczvdoh2ryFel3B5mmHMHo7omzjK7qraOrhd/p4nZ+QIcs9vt4I
         C+CPxSYHp3dkRdHiL+jJBwEvQMuHdXJG2cgY5LDRnlfgJ+GGleGtC2IUptjXPhKXbiuJ
         qSZtxqf4uexASs0S84HOljjvLpBlqr2BwJbMiyAYJhpy3phuz5p90dbFj76ffbc9V0Q2
         wLprgK2hZTDpd6RfHFPBEBdxXmgDiis3HPz7HIEBhLMJR/lWUPnFK0xBNj59zDGRj2NN
         VfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290311; x=1774895111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+l2i6CJ0UesVmQ48tC67wDfEsqc0p6X8zxC51ds3A4=;
        b=PqfHVWZBTFp4p5oiQbIZIkNw9OKiRbMsp8s8u2zeKpM4FbaR/YVIN1uLHmuYEySzNW
         ccCJBktB5mzA+88+UmckA1eva4Ul/bRXf3zOtZK742TNxP1Uv+M09umLWczJrm5BkCFw
         8zfO8XUT9jI82zGMq8QtXMdDoS6deIom9xb/Y+ydqzhaEalPverq0EKGMK1owCZxGbFE
         H6N28OoxvDXXZ6Epw/CZE7l28ml3YK3WJalrmeveEcLirFqV7Xh1MwpK6kISBSEk1X3d
         rAkJO88By2ttTODVeaIP+SPHFCzHjdUpUXe1CXJuZn/7Hi+8N9X+OrhhfMgp+8VBuInx
         rYiw==
X-Forwarded-Encrypted: i=1; AJvYcCVfaQ0L/oCea8u7SWIS2BGvMnezr7rvqHihcX6kix/Rzr5O7LuAmhj0sECOlAuyQOqu0JU5xHVWMZMZ+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMhwVZjCQkNk9kDAbB8LX6kWhpBAfwUUmC2shNCZBTHnopeQM+
	VWPIbZnW++KUe3hMmElivGHNyLdSbKuoKdctkeQ0QOzW13QKTSHI/48g
X-Gm-Gg: ATEYQzz9/GPxh29YyNiBxPtOujFpQio8sLBFYf1w34kB4qR4VS/qOIc1jCcSUBPffGv
	lH5vsJcjRBy8kkjy8TqilRnfXznDwxTGUKZx0jIqDwaHTurQ1mQmLLpNIlHcEVHrSz7hFwgAGK9
	+sEZ48YwitSdRHIcllqTwbH6c2Gxj5eGSEv7ZEC4pEPGjAJ3/CrvLF22y2zdJrR01mHIAWgDduO
	nQL9E2bBKv8ou91jPc0paXB1HhsHDj8q2dITI5saeSQ9RyhWwq/QlrJE5tGUKkvZyVXgPKxlpsd
	yPIQz0v8bHBaeq/cTebiPEr83dXfHkYzxEZL/3ziNsFF/8217TKkXDVWyltxGQDDTRPzMpTZbiG
	hu1+IZoX/D3+ZLTiHW9smznwoLP0ryIQZa9VXk5jBrHlOMFwAhvWC5Sg9QiuWLlvWkl0DhLC+Bz
	Iq3PpFw7SYHlDV2V1sYzDLRhn5Z8+AbRaqiOiSOw4tyndBeT0NWd1gG9cnRWDd218XKT7FdaFgi
	xs=
X-Received: by 2002:a05:7023:b14:b0:128:e2a9:d97b with SMTP id a92af1059eb24-12a726dd9b5mr6179340c88.42.1774290310889;
        Mon, 23 Mar 2026 11:25:10 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31bef1sm16253302eec.26.2026.03.23.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:25:10 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:25:06 -0700
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
Subject: Re: [PATCH 03/10] spi: switch to using class_find_device_by_fwnode()
Message-ID: <acGEk-63oVK_fBeh@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-3-b72eb22a1215@gmail.com>
 <098e1856-feee-4f4b-8059-85a53967f6b3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <098e1856-feee-4f4b-8059-85a53967f6b3@sirena.org.uk>

On Mon, Mar 23, 2026 at 05:16:04PM +0000, Mark Brown wrote:
> On Sun, Mar 22, 2026 at 06:54:21PM -0700, Dmitry Torokhov wrote:
> > In preparation to class_find_device_by_of_node() going away switch to
> > using class_find_device_by_fwnode().
> 
> >  struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
> >  {
> > +	struct fwnode_handle *fwnode = of_fwnode_handle(node);
> >  	struct device *dev;
> >  
> > -	dev = class_find_device_by_of_node(&spi_controller_class, node);
> > +	dev = class_find_device_by_fwnode(&spi_controller_class, fwnode);
> >  	if (!dev && IS_ENABLED(CONFIG_SPI_SLAVE))
> > -		dev = class_find_device_by_of_node(&spi_target_class, node);
> > +		dev = class_find_device_by_fwnode(&spi_target_class, fwnode);
> >  	if (!dev)
> >  		return NULL;
> 
> Actually, no - this just looks weird.  We're in the middle of an OF
> specific function but we're having to jump up to fwnode for no apparent
> reason.  If we actually decide to get rid of the OF specific function
> then I guess but I'm really not convinced this is an improvement in
> isolation.

Yes, I want to remove OF-specific APIs from the driver core. I also have
drafts for bus_find_device_by_fwnode and others.

I can make a followup series introducing spi_find_controller_by_fwnode()
and removing this OF-specific variant.

Thanks.

-- 
Dmitry
