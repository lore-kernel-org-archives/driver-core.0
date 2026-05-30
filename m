Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A5367291
	for <driver-core@lists.linux.dev>; Sat, 30 May 2026 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780137443; cv=none; b=rZHil2aka+x9LHW+lOXvW1THuLkDRLboX1RkBcPNbAB1qbFH4KG5/UyFoQ9Lbs9aO/iuw/9f/Zan9eN6tu4GCisPkHVGFpW6CHej8aIgtSlpvWU+wAdcqU3gIic5Q/VLIu8O3FRqLUQzchSSjVjkdFgRTcReB5su8KYQWJCgrQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780137443; c=relaxed/simple;
	bh=0Xpciau1W/HqXY2MC7yWtwKk3ao8i8XXWvKjl+zHZ70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n18XLstlA0spMSuvD8+mqvsgPplWv7w6Qqg43FBtRdt3DEFvOCJ5k3eZNVA/LggqZw5nuE4gglYYFnNVnyx/2ShMniqmZRnI3Fvd9nNfeYzmZFjzuhGCkufkER27BzHai1diwYlInZmaD9l8ZSlVVLI52aWebiW4G7ADZBmpYso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ixhIm9tY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ixhIm9tY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780137435;
	bh=0Xpciau1W/HqXY2MC7yWtwKk3ao8i8XXWvKjl+zHZ70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixhIm9tY3BbgrfwxByTviWNpEtwBFydNAELi3axVHYSg+vV2ebt+7NlCfr8gQie2q
	 IF/wIf4jtgcjCmgQQRKFS/W0U4B7blkNC1lJ0hVJuP1HSB7kbccwMcFo05NShlCt2D
	 iJ0qNbPSHXAP4dX7+HMQGW6l34mpxmcFyokodMew=
Date: Sat, 30 May 2026 12:37:15 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] kobject: Provide macros to initialize 'struct
 kobj_attribute'
Message-ID: <7f8b5679-5f5b-477f-a611-f8f99926f195@t-8ch.de>
References: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
 <20260529-sysfs-const-attr-kobj-attr-prep-v1-1-7e667ba3bb85@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529-sysfs-const-attr-kobj-attr-prep-v1-1-7e667ba3bb85@weissschuh.net>

On 2026-05-29 18:43:22+0200, Thomas Weißschuh wrote:
(...)

> diff --git a/include/linux/kobject.h b/include/linux/kobject.h
> index bcb5d4e32001..975a5361fb60 100644
> --- a/include/linux/kobject.h
> +++ b/include/linux/kobject.h
> @@ -144,6 +144,28 @@ struct kobj_attribute {
>  			 const char *buf, size_t count);
>  };
>  
> +#define __KOBJ_ATTR(_name, _mode, _show, _store) {			\
> +	.attr	= { .name = __stringify(_name),				\
> +		    .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
> +	.show	= _show,						\
> +	.store	= _store,						\
> +}
> +
> +#define __KOBJ_ATTR_RO_MODE(_name, _mode) {				\
> +	__KOBJ_ATTR(_name, _mode, _name##_show, NULL)

Sashiko correctly noticed the spurious '{' above.
Could you fix this when applying? Otherwise I'll fix it up for the next
revision, pending on your further feedback.


Thomas
