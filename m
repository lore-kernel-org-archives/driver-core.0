Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451988;
	b=PrN3N9XUS9njzVR7AQFVcOCz975dvAfT4SKvuBhUtdErYi+aglA9qgwLO9ZGrmcYfeMw
	 xz6rbyZ1ZQZTaB05ShcpLeN5a1uEVaMbqx8fIz9z9IlJ0YWVEw/EWbRcE6WYISSTd9QeK
	 rs50UWYCpvLkKWmYZZd6USajJ1NLae89zS26RHo87za0dLm7Vc/juvNsNlbvwBlI2kzfe
	 keg1qeI6N5E52stL+tFA3kuNmUsDiNEXdNRIRjVj24F1NmVw5RJGmzf0yBR/yWJWzPdiv
	 rIxZIHTaGeqX9b3ZLVXhNYRxccJEiB+v+naLnlQrKwV9CK7u/bYa91PvnvRenYrhBrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=drjpTP74JsK51H7vM836NsoylzVlZy0Ll0P6+YE0Z3w=;
	b=CAxA/pJXn7lD5biHeWOoH6ddD18tBgLxzRDvmyBGdHjB2cgSt8bCtCaQ0P9AnA3OjpCV
	 +W7VPV3Q8X3YyKzxJv+k48qutpsqDX1lxp/ZrYEhKnxJld3DJEGAEma4SpOifkx+cHCAm
	 9s2z7vFbK8tC8Ypq4j1NwiTIL5NJJnLDVaJB6/E8s1IX+dX72vwrW1cosnNTAcbXgTiV2
	 jmqcoHtADGzJwblZEtw8NoditocnBxsQara8G9WFowcvWLGWkeb1dZBJLKPwO4pYV3ioL
	 YBTBQrgDfFIN8LCYHIVV7K+VWPxtOl9y9Zzr07KoElXKwxSUY0hOs95A8heULplvKKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JHijAuKO;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B466606A327
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 16:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B466606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=JHijAuKO
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-949b0d32315so304419385a.1
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795451986; x=1796056786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=drjpTP74JsK51H7vM836NsoylzVlZy0Ll0P6+YE0Z3w=;
        b=JHijAuKOjY72eOsyCLK5bQSXHi3v7+L9T5QvMEidcai+av6NrQwrzxbskBngKgBjpZ
         2iJL7Hn5XS23RvpznVhq2a2Qf75izZ+xldFOU3cs+P1rzHDtbP/F35TRlIB1BXuJVQhb
         9reXgji0m8Hw+l8ST4g+WExqnEVYnq7GvSi0zE2zSc4GOAlt8PCn8dWGg5mWPtUF4p25
         qp4e6AwW1uSwVJ+DmXdqMvc+HM8EjUCM5FFoXj9pPNqQ2OPxj6+2+bdONHesfW/ggHJT
         1xyrejXJs6U256UTj215Bbna9M/5WqPUBRxPLBgRyjcYXIFHr/uGYFlWDqbdhOQWX5Iu
         +Hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451986; x=1796056786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=drjpTP74JsK51H7vM836NsoylzVlZy0Ll0P6+YE0Z3w=;
        b=hpIx2mmjnSHAYIkgrz7q15SRdW2xz1qEy7TrbEmCBtoBIYcDjUVqm6JtE7/uul7P6H
         GGjVWgJvpNR3UeYM5z/hEsNDD+qDcK2wJONKejk5Ke6aLaG6tkgdClC4kgOElOhHXH/3
         m0+udR6TEBSsUm1+BF0YGTFaK1k3G5G4a19ejjOXpMrio4qjFkciDrfHFCjGV1+SWjxt
         33uiXQEzvCKdcDOWpUeKaPk4l2YGtbSJ4RqyIUGpBpKyB+FDBOQ3XnYrJ7hPJ2q6fQPR
         eWDvKJf+1Enylvmx5aJGDEw7pnuP04TIQmBI5EcAqJXoGa0WOs2fnvp2Myd1gYHHbtzs
         Lmyw==
X-Forwarded-Encrypted: i=1; AL+hErESzePOMHONcmTBkMk29L/3p0ydJCnXL+7eX6h9oD+bi3I2BMQ93LT+JcVqkSRoHspz7+h0sjX8eLcNPw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9VCuKcXLBFKu3OUD3V0Ju7Nl/Su29yrVves1FR9lsfb3p52s9u
	DDZrI6oqXhqJzUKohSyio+9qcQgyQKGw66gS+hliFhPOPrSqqI0ujGc2AS3F1Cikdic=
X-Gm-Gg: AZFdTZcnYC6shXWNBGRgE7zdz+Hsl5w4l8rlZIK4oLOtxHe2QN6yxwP+W+aTdTF0NDs
	Phdc3xa+vts0Cc+OjdwozD9tmyN2LpTPUTmx/2b8Yx6s7wCo9EQ4yXwm9DPYbbVd1hXhlLK6X4U
	hQ8Gose03JfRkgPNBI84qa0CId3BIvAQ2NyGLw5+JzTLgMlscrPvKSB3QY4l/UliJexYmCGsMfH
	1mO+kZBajzDpIFY+l6g00BrnumBRRszyxxnfmyVjubqSSZmZIA72tJKjLhqVJETRuAgPduJVGhL
	0eKnEgIJOsq/5LZB16ZQnhgWUapT7JqsFjUTBqOOO8a93XbXrPGMXTyk4qMgSBk/GjVWH8n9mvO
	orjzS1i5dw5zymcSxw51mjeyoZ38mCwYhdKtLIpx0o3SdNSSRNXjp9N5ffmXkw6Ogagzi8r89wP
	T9wk7sNa9WX4QlkbXXoZFTqpTgkqVwjqJ0DZrBDsG2MnZrQ3faVjRgLNipBBbOimDEuLy2KM/c7
	yR0LafqufRzf3vnSzqlt9KqGq5J/ltMCsDVqCYc1Mb7Zng/CyDHkTcRQPrGsM1ejEUSjcbFJxjv
	cECCZILgkA5WwB8WFp18PZ0WvnNXgK5COvILJ5D5bcs9A+JvwjQffw5j42rHaigyXCniDuHU1us
	1uVJP9EhB/KXF0qlHkTTuJp2j
X-Received: by 2002:a05:620a:4403:b0:947:7f9b:f839 with SMTP id af79cd13be357-949ba9bf10emr2106812185a.47.1795451986121;
        Mon, 23 Nov 2026 08:39:46 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb424fa6sm828689585a.40.2026.11.23.08.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:39:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVX4y-00000000vk5-44Yr;
	Mon, 23 Nov 2026 12:39:44 -0400
Date: Mon, 23 Nov 2026 12:39:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 00/10] PCI/TSM: Support guest TSM drivers
Message-ID: <20261123163944.GK179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <yq5aik1n4iz3.fsf@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aik1n4iz3.fsf@kernel.org>

On Mon, Nov 23, 2026 at 09:51:04PM +0530, Aneesh Kumar K.V wrote:
> index 429e39f647cf9..01d7877d0b571 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -604,6 +604,8 @@ struct device_physical_location {
>   *		ancestor device.
>   * @DEV_FLAG_OFFLINE_DISABLED: If set, the device is permanently online.
>   * @DEV_FLAG_OFFLINE: Set after successful invocation of bus type's .offline().
> + * @DEV_FLAG_DMA_CC_PRIVATE: The device is able to access private (encrypted)
> + *		memory, no shared memory bouncing is required from the DMA API.
>   * @DEV_FLAG_COUNT: Number of defined struct_device_flags.
>   */
>  enum struct_device_flags {
> @@ -617,6 +619,7 @@ enum struct_device_flags {
>  	DEV_FLAG_OF_NODE_REUSED = 7,
>  	DEV_FLAG_OFFLINE_DISABLED = 8,
>  	DEV_FLAG_OFFLINE = 9,
> +	DEV_FLAG_DMA_CC_PRIVATE = 10,
>  
>  	DEV_FLAG_COUNT
>  };
> 
> ...
> 
> +void dma_set_cc_private(struct device *dev, bool private)
> +{
> +	dev_assign_dma_cc_private(dev, private);
> +}
> 
> This could easily replace device_cc_accept()/device_cc_accepted() used
> in this series. I can switch to it if that's the direction we want to
> take.

I would prefer to settle this with Nicolin's series that is part of
the point of it since it brings a real user and a justification..

So if you can confirm there than it does enough of what PCI needs that
the PCI additional is incremental then great.

Jason
