Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540076;
	b=muonHAWZ1hbcaWsLHanR+IoC87yVxw0sKh9BHwClHQRKPQMyz8QCh9DuihY9xi+iJVug
	 8lr2GpVEd4olVRUPcuCrr/3UVvKO8rtFO5S65RyZHq1ipm47B2TDzY+QXF/2Z6aw//tMr
	 M+1UmLatX6pZ94IRHmBEPfWTyf2WFCYzdhDx6SUt7eInR7jD+K+oetooIcdCdB+LNcU5D
	 ihR5oPOCYaXGyL77M1cHVJuMU6d1Bq2xcUDNafNynGQIAbD4fQvheUbUIgmdyKtgN92BC
	 SbdQ6k+Fic0S58svlWvt1qCREBGG7//n3NcdClJyxyxc6zd+362CLNeJfspFqNADn+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u9RNgucBnI08qUwk1iWfTQpaGbeV2FiwOEeQoPQxy0A=;
	b=MXzHGq3PVPYM7XIKjOZDy8C8UX5tqV8OES1TI+/XTn7EMzj2nGakTBXX9wBcVMyR0QbT
	 gO+IXRoXoX2eKr4CBy/MoSHU1MOVcqfOWilTQTx1a2BbcXtksTQsVt9hOJDnAvoUK58Hc
	 M4sG0+rXIDbGYe+7DNui7PneReUVGNezpYJHjLkMCXDQxlAZeODkS95hhAZ+5l/wop8jd
	 A+GCTfTfxMxhx7GJOIxadKzuUt4zjJnAdGtrJMGTy47/apLMozbatx3SrC90/8uPesnQ9
	 VOtnKuwOK8zR7YTUr7pxSjC7Z3p9wijzqxkYKHmQw6Qsc1pjxL/wJTZGkqAwa7k/5Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=a7uxdXId;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A3E606A326
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 17:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50A3E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=a7uxdXId
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7d2ca055399so1398416137.3
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 09:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795540075; x=1796144875; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u9RNgucBnI08qUwk1iWfTQpaGbeV2FiwOEeQoPQxy0A=;
        b=a7uxdXIdscfFP6MO7kegi9TO0eRGMDCqklhQrwLvdboZ5LuIN8fiGRsiJYuaJC2zEM
         flASYZ1eyha8gk14nzPwKSJYQwyyP0WJ7BY3JrzJ60taGXCf5oD7blz1DWhT9ywSbXM+
         FUDM9E5OC906ySVup+NEHB92Hr+giMTpoDcD9L3FGQGrLHlPU4iXnuxdASeVbWpQDWJj
         rVD1639CuvBybqSHg9MgO8/LlbbsLVqVuAhmWHMGiwaFHM+GGaYcycI2dB1xNJoOqu4w
         D94hPVb/rnL3vTdBG2LGKCisIkUkz6TfWkCL0trNWiqGgUplmNviSCBN/TpXJSw/WFGP
         UxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540075; x=1796144875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9RNgucBnI08qUwk1iWfTQpaGbeV2FiwOEeQoPQxy0A=;
        b=f56WkbecMmQyTxK1nq1PIQyJWlH8dSAauYzlIAqRC/W1EDSyct6RBehFc2788rDB+Q
         27VLoAxED+fGEkDK6Thnse9dawXwCTWOeBe+ZNVe17ZcVsYD9E56xqvYM6BLOzDQujhK
         ymt8ptmy2NrSd7Ru3dQiaD0ow2Hb0Ua64pL7XL3JIsY9ZnCeEgpHk5hsV7xiXw79elmX
         ZbineRhofRuFtThcg2mTrpLQmHgNOu07FD5lqchQiI+z8M8fR21DgtdCnlkcHoyshLZQ
         dOFtGcNxQtKnm9jt508EbbF3/KaPnYfXve81spfOSMnSeYxScz3wzhmGmMsxndydLVwE
         0CXw==
X-Forwarded-Encrypted: i=1; AL+hErEJXTM6/U84fj/Ny/DQx5R9BHc7otMsTjvqoys4WhxynDIWsHMJtZThapHmP33XPTjK8Gvvh4RcfxHuVg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/tOkAIxDlGRxxoS8n8ODsVj6R7iWE9RydHV4zlK9f/bLhB+T3G
	3EYWqsf2MadIuT1vRCLJkq98lhH4Mw5S6ulIGn0pDF6TkKEAJPkpLvvQ0yezX5Hdn3A=
X-Gm-Gg: AZFdTZfKOIgYvfGu4QbZA4iSm5+58zsFtDD+ZQ3J0k1YyleiYiHUphBLbz0cXaXKpJb
	4ASTw634KKjfwRMCKzxK469jJVKs5v7DTxriDg90tTkRzDy6TQl0FG7xuaXL4DLru4SkDKoHvON
	zba6CQrTveNWx0K1ouKnGfvKxQPGNA3Z/mXrahytICH5Dx+4oCmqzlX0DZM8CR9rJc4fQtSUG4R
	58g3QL9A9nqvJqfn4TfgjXy/EtCPu/DYivY6SBt10W90q7zEYUZ2LA1E8HwuiTooay2gSMQ7FsO
	noN1A2SDlI9aw6CuuuJae27dSwwVPVdKZt57suPYsBEgFQxhFcLskbCRuVKFwydMIawqGll9E6K
	+3K0obelEl8CJDQsWs+EF8XO8HhTEKIMJkf+rhntLbD9wLqMMCcAnZtZkThUsQjhzsUHOMWI5lP
	lZkR9IYpZ6mkDHnfh69bWcSywPsH0cEyc+Rt8mUs9pF8Kn3vv3fyhq68LgrxVKpP4QtIAhBNisM
	eWzjGbDzYJghSuR2OTQ0s+OV49Tx3K5/Q5Zdg2wwk+QElwQNjV0+zkbjYUj4spCV0ClJfVR2p9o
	38TzLQ==
X-Received: by 2002:a05:6102:688c:b0:7ce:a69d:b020 with SMTP id ada2fe7eead31-7d72b36164amr6731183137.5.1795540075186;
        Tue, 24 Nov 2026 09:07:55 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921366d853esm132634586d6.27.2026.11.24.09.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:07:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVtzm-00000000uyF-0Lng;
	Tue, 24 Nov 2026 13:07:54 -0400
Date: Tue, 24 Nov 2026 13:07:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 02/10] coco: tsm: Register the TSM class before device
 drivers
Message-ID: <20261124170754.GB114530@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
 <20261123152903.GG179082@ziepe.ca>
 <9f92f7ed-5198-45aa-9cef-515ccbf98398@amd.com>
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
In-Reply-To: <9f92f7ed-5198-45aa-9cef-515ccbf98398@amd.com>

On Tue, Nov 24, 2026 at 11:40:16AM +1100, Alexey Kardashevskiy wrote:
> On 24/11/26 02:29, Jason Gunthorpe wrote:
> > On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> > > Register the built-in TSM class with subsys_initcall() so it exists
> > > before a platform TSM driver probes, independently of object link order.
> > > CONFIG_TSM is boolean; remove the unused module exit path.
> > 
> > Why isn't it modular? This is going to force alot of stuff to be
> > non-modular.
> 
> The TSM core registers a class. The platform TSM drivers register
> TSM devices of that class. If a platform module loads before the TSM
> code - the class is not registered yet so it fails. We could either
> teach modprobe or have dependencies in the module or do this:

I understand that and Aneesh's patch is fine to solve that problem.

I'm asking why it isn't modular. They don't conflict, using
subsys_initcall works just fine as a module.

Jason
