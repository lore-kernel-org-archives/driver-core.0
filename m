Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094426;
	b=DbG0f30YF15fHJWZ/9mUUQifxW8YgwDAVXvn1NqMO6X7tb8NDbQcz/PJHp6yqYUU3qjG
	 e0M6x9N2Xl6ZLe2lxzTSINdZCcOOi1CIw90O9n/+QSoziIkm+uT4CNYE/jkEFvz4HmK5E
	 7SL9g2rf4cX0WQpMHoNxVj6q3Fzc1/Hd6kynQb/twBZoTRzr9nNIzXtXsvz+lBXHNPiUf
	 PazcNIG7mfdRNHZ0HNEqvolKqW+LTeuAnzvBtFkPfKFnS/Y+XjTAFM1QAl3OKE+Xc/ba1
	 6SJo7yZZ7rQ4FT9L7bC3CxDVtm55ehpu+Qcw1HIWVBHOWJOTumg6M1oDh/7e/XO2xFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094426;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=l9HC4ZDKGXY9KIguSxeR/bbhOQUk+DGkimrh56h/sU8=;
	b=Lig/ZR6hul0kDZQVbGomhqBQBaCTBVUTtemPiPlopR678ngMS3j/6/3sFLTcttdtV23U
	 1dLRUlW0kao79YP1y1K7iC2nRGx/MEe/DsPJmj8E2Et5Ott/552Le6CRU4pSR745ZOozA
	 U1QZ84UaIGBh2Ia66eNX3tokxrAZ1vygv/VnM21C5DlpJ0hoCYq/5/H7srvVegomiN4zH
	 1vMyVy08qkADwJlWduJyi4kDu9UiOmtFaRk1fMBig+B0Px2wgg2o3AP+6ysydHidN6aSu
	 fCUGFa6EGxjOp5JDTNe12reI5pf0EDj5+KdAi+ex2ZDYmj0UBRNyj60osGr5S3ADuRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m8jrsfF7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB4606A320
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 13:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=m8jrsfF7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472331F000C5;
	Thu, 19 Nov 2026 13:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795094426;
	bh=l9HC4ZDKGXY9KIguSxeR/bbhOQUk+DGkimrh56h/sU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m8jrsfF7jrrD6VPGQtwBcgcTKKhvGX0UmYf3gYLUMJukAs0wl6GCdKm9TAXstQxSZ
	 o5+ywV5peNRBotTXb0S9SsqMWlv4U6x1169Ff/fdiQ/yFaJYZKEbR3AYCTuX/23llR
	 d205pqOszuEiBH/Kv1utrIqzPxSJaj2klc/DDUyc=
Date: Thu, 19 Nov 2026 14:20:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: linux@treblig.org
Cc: dave@treblig.org, rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: platform: Check for NULL name in
 platform_get_resource_byname
Message-ID: <2026111930-swagger-emit-3a58@gregkh>
References: <20261119001820.168018-1-linux@treblig.org>
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
In-Reply-To: <20261119001820.168018-1-linux@treblig.org>

On Thu, Nov 19, 2026 at 12:18:20AM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Drivers are calling platform_get_resource_byname() with a name string
> derived from a DT.  If that's a DT that's broken without the field
> that should land in the name field, a NULL is passed and it OOPSs
> in the strcmp.  Check for a NULL name and return NULL; turning
> a crash into one broken device.

Nope, this is as-intended, fix the DT :)

Also:

> @@ -464,6 +464,9 @@ struct resource *platform_get_resource_byname(struct platform_device *dev,
>  {
>  	u32 i;
>  
> +	if (unlikely(!name))
> +		return NULL;

Only ever use unlikely/likely if you can measure the difference with it
not being there.  For a call like this, you can't :)

thanks,

greg k-h
