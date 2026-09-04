Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5E94FECD3
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 16:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788540266; cv=none; b=TxY2ORr0hGz3ckEtTVTrnSO0JyrDaDlgvmwg5SKGH+9UCRVyPqG/aFBV1GAEG3vgXQbx9i3Y0d6/CntXpk8Y1aI1lJq6ot5+sTiST6ryWIBqamuFk1O/2x9VxjZIYyPRBAhe/YmV96iwybouKeVIJqEgmWK7CpjH4FC9+BA80dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788540266; c=relaxed/simple;
	bh=zuOhkEhl9/3hyPjwkXOeT9Ut7Y3NkxiWsPCsZKsgbNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+A0Xf8IgHE5sqkH/uUpOGcGy6Vtkpog2E3Gw6pmRiMXixLVrKKfJ46STdwqzKTnDaynAInhIhNw5vI49paAxVENZHy/V6/EbkDUrANOStEFE54BebfW5n5y+2+BGqk5UYCjFYpf1mjQ7ld02udZUZ07iz3wzLUat599xDcgm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ffXRhPJY; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ffXRhPJY"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cd43bd740so13603636d6.1
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540263; x=1789145063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=ffXRhPJYUnLCHheJIsbGdUnlS6TrCU/xzOj/gyZ671e/0UvKSKwLjj29R9AjPY47+j
         TZIGFwl/IGk8NaeEO2Ov96vLxzQsUNmUEFwR7pededmPeNKpQCrfFx5QRTW3qtI9RWyF
         Gk8Mt8q/t34mcFJHHLYszJS/AuSR7S43K9MmDlm/SXORLLmBDOHoPPDfH+YNKng95uhR
         mltv/1dQNLtUHKNxTsXtOuf5mPDk7BdMYaERHpbcUUmexr8l4VzuHS+ULocT1jw1C5Ks
         Rcj2iKJe0A75Rd7kJVpTYwfMgJNgIvQUVWEtep3BuBEAWdfPW62eFH2YZPJfas0MEmst
         nU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540263; x=1789145063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=jXMUXqloZ4s/bNnpZ9xfufm5GV0hg5hIB+4Grl6sBp3FdJBl+jYrE07mzc7sD8EPhA
         kDhCU9C5UbxWPPgILGECGSZmmgzBdE9WlcONjVhQL5oq1Y1T+cteVW8DiPM4Bfbt38zU
         l6v8GxGxxwQMBQrtmzPTdNQYe8ieawRm2t/RnIGPOCaj9R7VNt4w6Gh98rF1qzFc6dIi
         ROYzz/1B3tM/NekcbTCYo57X2Q8CodD7AEJZvue6qQ+LxikMHYef5pFPUyoYcG8GfKuq
         YjrTVzMtHJl5D5NoOwLU1AUWAQ7hb2ydQRe14y0QL4vVP/olioyLUfoc9tmlaM1rDDRW
         IBkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNsSkaDzNv6nte6BnxrreAzNQErD2LmAm/HKLiglANHDUk8raAOBdAP3UeMURMAjCV92E45t1asq+v3A==@lists.linux.dev
X-Gm-Message-State: AFuF++kqpQRnLxCBDC9TSIF8w0KCRpPo+QrklkXThzGmpoTjqPVw3WjJ
	0SBGGFxHta3Rq/GwVlrWFacU5dHoudTNbXhAX4GMRG8BgG+idseSLS2itzrivz2oP0w9hzR156I
	GaaKruDDo
X-Gm-Gg: AYBFou0xalf5Qh2qEd6HVtHMfqq89X4efJXSvcG/PsD3P2PeLTAcsMwuBIAZwLnGsuj
	14jlve81cmxOVc+nknhol1PmmxR2FQLzuSFYdyhA+wK5uM5iu6Y8LC49Cepwda7yDEB8+1y64FX
	Aois9nvhvw93So4FQ/Hbf0CAxtRGDu6/STQkpg0tK9bG+z9PXh+YScRiTmI0WaklS5Z9J/H4dza
	u4w5z3FKtzYNgjiWNM3x+XUlpoddVcLn9bd3jb/yjXnO5m3tKnaq5T0WaAYGg6v/tSsW5hs0MPO
	udOIndov0KYPd3HurRaoHvNLiqLS8FoQ4HI0dohc1w86sORDkQ5Gjj0uFU7ouHEYaAExNZ7Ykhb
	bcscRO5g/GWYSW2Vv6MmWWRG701vLJvlsFaMpDQ/OtiDRq0zszlj9wMZEvfmwzHZP0ebrzsxBw0
	OMEjALA3t1ZeGeKD/o/td9ibDR3bzGdrqNjMyQZLJXTdx03PNvsVLSPRxxdlThbQ==
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr78478096d6.31.1788540263010;
        Fri, 04 Sep 2026 09:44:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm24672736d6.14.2026.09.04.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:44:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:44:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <c3740c4f-6ae8-4c6e-8f80-105f1607ef55@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-9-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-9-wenst@chromium.org>

On Fri, Sep 04, 2026 at 04:41:47PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Minor complaint (not referring to anything you're doing here): 
port->is_superspeed really should have a better name, more like

	port->is_superspeed_capable

or

	port->is_usb3.

As it stands, the name is ambiguous.  It might refer to the speed of 
devices that the port could connect to, or it might refer to the speed 
of the device the port is currently connected to.

Alan Stern
