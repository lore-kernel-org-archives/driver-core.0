Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394833A6B7A
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 21:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907212; cv=none; b=JYUNVK65fl0XeLwVgrV0uHQF4J7LEPNfFZygaxRp1fS1oRYWnTLtxPmEnXjtB9gBoblgCtOueDZBKfs7MwDFOXOhrBWz7d7If9j1XwmvYz2Xc488ca7jRZog2yfdKoJDoowgCxdxMzP3M3HwMhXDG+zUrpgV5/NswBtXlhSpjDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907212; c=relaxed/simple;
	bh=H6TjEPdSZGIipXDhaHlw3GjgyD8b6HCnTcEmbY8Pw/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUWy2o159m4dHCxc22C7f4uqOZnahvUQzQqjEKK5yDC5iNZfcSJnMQgIm0LBkJBE9i6B32UU61drndM5V2VKiHFw7CdDfwpqpCy1ljDRLCa8Q0fJBfN6wRneGWfUuUMLMFldEJE9O/xp1Y8JTtuACtli588rS/D+9zv1fa1ZmFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnUQdJG+; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnUQdJG+"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c17446ba8dso3085814eec.1
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 14:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774907210; x=1775512010; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/4gRi5RHE4lEQNk8r3GZP5jsAjQXbbb0ZHPhMUySrM=;
        b=NnUQdJG+H6TONuXx5eMTstuv8OPX71ysPQMMkFHYn7bZmbkvwzFnZ/p+pgbRDJgkzr
         3TTFeRwKjf5AlG3lRcfzaP5OErhr1ltm03oyt43oa9BuvzyncjRaZYr/l2Efk+Q1xpvg
         FXcl1O8swOVP/I/H8Jy73MaPlkqfMxjvra2h7rZe1SSuBE7iHp6ldUIPdt3zbEJZ5re3
         /Q/WgBj1wPhx3JamnUGG+VOOUEoApGuhC7zeP0X5ZckJya9Hy8iUjiBylaryeQNh9vfL
         5Sm3iuLL51rEXzg2sgZMctoNSBHxnATGPxtJjk516TZ0PfR11TKz6GlDHVLeGy5H/SFk
         /uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907210; x=1775512010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/4gRi5RHE4lEQNk8r3GZP5jsAjQXbbb0ZHPhMUySrM=;
        b=BGR37V66qagPVfIkqH1g72DchXPVGSIAAZkMLBJphVQn0DiP3FmfWlztV4g1g/mYeQ
         5pxqd6HzZ0gpUhcVFFYiCM97Qvtn5LIsmnBGJmBkztDGZWHB1WZT1JLv9YDz5Sl+QtoD
         Wn4r8eseMUqnNy5a87v6W2u8qcUonSbVyp8g5RlFEV0cqOcka//daG8KgyuZ7/sivWZP
         uMR0MtsfH3PWNGua9C6usaBHt1Xok7m/YmlG3AG7IkaXDLSnW6YTb/Q9PPyuQ+nhZTU8
         xZODPFJVGuQ+300HliQnR1lWxGrq3mfVAzloh68oMl02XIbrjJrTJac3DFzGA9RgTvrF
         xhRA==
X-Forwarded-Encrypted: i=1; AJvYcCV9m3RJNzg3daS6TBMRWyJDZ7zZx2PmVruCSJI4wOm9aZvX83C6NhH2w/DYxB0YVD46BO4qEOC9pxmQUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXbE9EousHbv/GkHA68auuzUmC5scobg8nPsdVvaxC2dXlDybO
	AhdyWX0/2VOUff0dQvTWbfOTONLLD90qMNPWpRrlvfZYxnLr5c+Sa5hW
X-Gm-Gg: ATEYQzwvWp9tM9r5EfSvIIdQDLW/j0O9HOZBjgdwl/XKWOSQYPyK7glrGE/M79Pqaas
	mNfCdxlgv0qg3M67il6K/EsYr6Bw3AAa17X2eID3Q6YgyKYOmtJbyWTqBw6B8M77tRYeiNyfxqY
	1/8/MbU2NZjYAxd8iJym+k9Q1zBmZWlVdEcEPl466jPqrlXA9PF0T6WuwJ/rlxbSlxD8hB2M5Aq
	Sd9QnUqRbsUoaFSvRIBn8riejtQYcG5MTflNcAPobhonw02N5T2omceV2rAPxM6z8ZncUSpmW/5
	7detqcB2xWvZUWAvHmggLPAqiCnkEkGwAWr/qSVbnTCBVZrOf/wzzYv9W+BaSM0Sr1waNNUFZBq
	HZHAM0hXooLq+VnZIzvDNDrZR5iaMUoYpNkbiLpI112TrwO/Eod32lN9GFfMzkcs2pbsM3gLIu2
	XcIj/q6nvZ+U/L8c/ssh/YeMqi7aqM38UhzUTs7Sc1goNjzq9JwXmdHwgTeeLxrQCN
X-Received: by 2002:a05:7301:1f17:b0:2c5:d833:a507 with SMTP id 5a478bee46e88-2c7bc35b062mr700637eec.12.1774907210198;
        Mon, 30 Mar 2026 14:46:50 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7f4e:2749:b37a:e9d5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b2721sm7751610eec.14.2026.03.30.14.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:46:49 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:46:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 2/3] driver core: make software nodes available earlier
Message-ID: <acruxMNdnUlyRHiy@google.com>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
 <20260330-nokia770-gpio-swnodes-v4-2-b68592e977d0@oss.qualcomm.com>
 <acrcDTPpXZ_5A4D8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acrcDTPpXZ_5A4D8@ashevche-desk.local>

On Mon, Mar 30, 2026 at 11:24:45PM +0300, Andy Shevchenko wrote:
> On Mon, Mar 30, 2026 at 02:40:47PM +0200, Bartosz Golaszewski wrote:
> > Software nodes are currently initialized in a function registered as
> > a postcore_initcall(). However, some devices may want to register
> > software nodes earlier than that (or also in a postcore_initcall() where
> > they're at the merci of the link order). Move the initialization to
> > driver_init() making swnode available much earlier as well as making
> > their initialization time deterministic.
> 
> ...
> 
> > -static void __exit software_node_exit(void)
> > -{
> > -	ida_destroy(&swnode_root_ids);
> > -	kset_unregister(swnode_kset);
> >  }
> > -__exitcall(software_node_exit);
> 
> 
> Why? What's wrong with the __exitcall?
> 

It's dead code. Always was, always will be.

Maybe split in a separate patch, but I sometimes feel the idea of "one
change" is taken to extreme and adds to both developer's and maintainers
burden by needing to keep track of extra patches.

Thanks.

-- 
Dmitry
