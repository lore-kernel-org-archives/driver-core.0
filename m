Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0416E37F744
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 21:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302603; cv=none; b=CGlteCgUAq4gR0gkVV7eq+jdwO1jW1z5GX3n2O8oaynwhcioCtBm0cGd8zum3laK2ujzatoOMuYuU4Pnz0avVOPJcxyDMtD4MKU9ug2AZ09zlT0kAALzMb7dm0YrM85X24jB3LGx8Dqq2yeFclZGc2gDfGuxdCi86VtmeCvlK6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302603; c=relaxed/simple;
	bh=y+Gt1L0qys08x2UG0gqY30qV3m6tEiIOwvQdKXqzRZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rag4GA8cXD181NVtXUrD4MtuIG1RMffIvLVVn6T6EXhLHz1FuhKSbUXZ2lCO37DDnCmbn4keAG7DFS1CQ8tvR42aJs+MmUrWFFdFKwkKHt7u8r3NodG7X35DHpmIJZRSPHsd046cE6XhN5+FlC9DtP09viV/H+cMkzqm0Ex+kWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD7Rkt6C; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD7Rkt6C"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c107ef474fso1408716eec.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 14:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774302601; x=1774907401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m0/AdxnnWyHs/Fd93ISLCpoYSuqRajs8ccdfR5letY=;
        b=WD7Rkt6CU6uICQ8x0RJkIRsL3HFR/h7dBa53Tb3nxySmLr9pr1TTis/bgUFSrjfR74
         9SVN3AF6jK1fWdNoMy3hGdUJLozM7T+PM7YVajrICFqoBAkqBYpt2MXrSRYPpPwzm2Ui
         9Si5eyZ4ekNPxAwbS+RINwRwBA8ZDIxt+Zj9EOF/K2KARu3hBOvtYCR64UeNtfZoN8LL
         5/gBQULC5Ks4n08lT0LcRfpKGv/kc/cfa7FQPNIF3IqKiFfNrR4ztqbSMl5IQE/1vwyg
         zXSEFkn98Z7xhxsSfxBoVHt3QOZPGwEze33xnR01hp3bvCWrdA7Bi4JNq9+uf6CTj+mQ
         r2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302601; x=1774907401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+m0/AdxnnWyHs/Fd93ISLCpoYSuqRajs8ccdfR5letY=;
        b=ZGYbfaSe4wsPkofR7XuRy/z4x90x+Dosn7lKqYks6y0guM4Xwv2TzHqOTJpw1J6h/y
         Wx9CWbx2MPsOX8HvjI82QxBy46avJDaCvmonBrRU38i7ABgTVhc7dS+f7ILdhMfLm7nN
         syw1D4DMV+9ycjo2yZiIstayDF07yvJ6BtwUh8YZ48+6G79A5sUfAqMm040UzieBhYrR
         70RoqxAhQ1elHRoyAVxC+bv5MyWDz5uwTbmVo4/sR+65914iS5sXgJZBj+OcdT8uWBDo
         3ZD3z/Au/9ufFEAl4PFsAp2A8R07kIHeRezauC1qIAWUztS+Ycs0lX25gx0Oj/t9JU+7
         5cQA==
X-Forwarded-Encrypted: i=1; AJvYcCW2iBeLpt42QwMpC9QxF+UuV5mRL2sdGu/kvgzKY88aOo/4lrYEQycP9Dpq/g0fbpxlD03vbf/w3ti4Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJF7dGgYlXGqtgzkS0nXDPYFvzszBUiW9rqRa0FC86pz2JiMdY
	Dp7s5c4gApru4wXkvpZi2n3Z3H8CeRnfB8T3CO81edOwsrfza4O2EAD7
X-Gm-Gg: ATEYQzxSE8F5kS9b9h8hsO3d38cYwiMIAMR4zYh3OfwzOYscRQkspFg1FmT7YNX83/n
	Bg2CiuF5XcjkkWUz+joI9S8RFcHDxs1SeLHagAK1MGf0DrnJCUABdBYRFFpr7BiPFi/J33aRoUf
	cT3CHBE5h0TPFQk72IJQD81dOOtoRaWvk+5IVL692F0dJxz/bmFZlolGMCf8iVe7QoLpKff/99Q
	tP3fhF9os1+V6DqTwTxYB2sP05ZXITrBqClo3gTOBXvilVjTAZs+CATaMlp4sXxN5z2lSpY+Lsq
	qGacIGqL1X3hH7kN+mdlX0gWuYPNZnC+XlZnC0jZNdNZTtagrXDaqqc9NjqaorpyAhMGUup0ABb
	T2QtgGswenC0DAa5RnWG9lBj18aK7MKUzQguh4pdLBZULxKax/4vUnurohPBYHdILgUqsm4o03n
	TRxJ7eDxQ86zKKYaLr5EHV8He0jeK3mI6kBwxizMFcxqSVXknzXUe6ciRf2fW5t5Lu
X-Received: by 2002:a05:7300:72c7:b0:2b7:1e86:3604 with SMTP id 5a478bee46e88-2c1095e6a9fmr7621666eec.6.1774302601091;
        Mon, 23 Mar 2026 14:50:01 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b31ebd5sm13412438eec.27.2026.03.23.14.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:50:00 -0700 (PDT)
Date: Mon, 23 Mar 2026 14:49:56 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Message-ID: <acG1JNGVBJ2Mf7jC@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
 <acGGWTmSMuc5h3Od@google.com>
 <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
 <f37684ff-57af-425a-bb18-bd5e8de3bba3@lunn.ch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f37684ff-57af-425a-bb18-bd5e8de3bba3@lunn.ch>

On Mon, Mar 23, 2026 at 09:15:11PM +0100, Andrew Lunn wrote:
> > This is not "foreign territory" - ACPI in general doesn't want to
> > describe e.g. the individual components of a network card, unlike
> > DT.
> 
> It has also been suggested that the MDIO bus should be added to the
> ACPI specification as a first class bus, similar to I2C, SPI,
> etc. This would make it different to the DT. So we don't want to
> encourage developers to use the networking DT concepts in ACPI, it
> will just cause problems if the ACPI spec every actually covers the
> use cases of networking.

BTW, why would not we want to push for the unified binding? They are the
same pieces of hardware...

-- 
Dmitry
