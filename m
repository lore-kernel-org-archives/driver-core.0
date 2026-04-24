Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A239A3ACA4B;
	Fri, 24 Apr 2026 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777030935; cv=none; b=L1m1wcBd6i3afJqthFprMxOHKj/zLchVZPLQ4I/ZKlVPja9d0WKcC3FT2QIW0NLXRW9OIAfJf/EbCI8qrw9j2Hj+XgD1WnZeVzX0Jlzooo4vxEltNt4uJvhvJxa5PyoCOlSJZwLS0qEhFrlHoFg7gnDLxk/JoT/CnMHR1u9KOaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777030935; c=relaxed/simple;
	bh=4W6W28oQ9tYxBvQu92r59YpXTkIqDtFU5bKJl2RfmB4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=OjcF+12HLxJ4//s//7h0OhBNmD4taRtEi2bpIqLCB0d/NyR4K0uTbpk24TJK+cUHW3tpxFOSLkfJKIVIQCS9p8uYWWsBb5ZW0KbNLjaa+tisuMYlzp7AMnz1abZHaLU/XOywZ6NK0rHj1YBjdjikS7pduQh/ybd8PF8G0ZO2cOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpFXVTpw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpFXVTpw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283B9C19425;
	Fri, 24 Apr 2026 11:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777030935;
	bh=4W6W28oQ9tYxBvQu92r59YpXTkIqDtFU5bKJl2RfmB4=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=WpFXVTpwYsAilpyRKcB2OkVSf3DerhzvCj9yDZIgXGtVye6lKjhyDQy3FdRT23OJw
	 lxatoqec78Y0gYvbmaOHS7D7sBep9TnJvQkMQQ2Mkt70+UpWrUtEOD1EM1WcjY6TjB
	 XS281/sZ63iVaVKiGPJKc7njUBqtueH5rf/FG3Cl7UEZVfqiB1xwlG7GglRPzyW4ru
	 vYSN0vyaidYANRP7FzWSiHMkaebS7tIzpo2LFToWlRlYnKqwbQ1F4dtx+GxoBDunHP
	 em1qYoELYpKOkCmuGbEnmglfg47fanVaxBpgE34rFnRVWZD3xCHNvgParchSYThJAh
	 INwIaDkvOxdyg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 13:42:12 +0200
Message-Id: <DI1CW4GWGUD6.2K7VZG165WJP8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: faux: fix root device registration
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
To: "Johan Hovold" <johan@kernel.org>
References: <20260424102231.2615557-1-johan@kernel.org>
In-Reply-To: <20260424102231.2615557-1-johan@kernel.org>

On Fri Apr 24, 2026 at 12:22 PM CEST, Johan Hovold wrote:
> diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> index fb3e42f21362..402ed119dfdf 100644
> --- a/drivers/base/faux.c
> +++ b/drivers/base/faux.c
> @@ -133,6 +133,9 @@ struct faux_device *faux_device_create_with_groups(co=
nst char *name,
>  	struct device *dev;
>  	int ret;
> =20
> +	if (IS_ERR_OR_NULL(faux_bus_root))
> +		return NULL;

As Greg mentioned, if this happens we already have a much bigger fundamenta=
l
problem earlier in the boot process.

Anyway, I think this check only catches when root_device_register() fails, =
but
everything that comes after root_device_register() in faux_bus_init() still
leaves us with a dangling pointer.

> +
>  	faux_obj =3D kzalloc_obj(*faux_obj);
>  	if (!faux_obj)
>  		return NULL;
> @@ -234,17 +237,9 @@ int __init faux_bus_init(void)
>  {
>  	int ret;
> =20
> -	faux_bus_root =3D kzalloc_obj(*faux_bus_root);
> -	if (!faux_bus_root)
> -		return -ENOMEM;
> -
> -	dev_set_name(faux_bus_root, "faux");
> -
> -	ret =3D device_register(faux_bus_root);
> -	if (ret) {
> -		put_device(faux_bus_root);
> -		return ret;
> -	}
> +	faux_bus_root =3D root_device_register("faux");
> +	if (IS_ERR(faux_bus_root))
> +		return PTR_ERR(faux_bus_root);
> =20
>  	ret =3D bus_register(&faux_bus_type);
>  	if (ret)
> @@ -260,6 +255,6 @@ int __init faux_bus_init(void)
>  	bus_unregister(&faux_bus_type);
> =20
>  error_bus:
> -	device_unregister(faux_bus_root);
> +	root_device_unregister(faux_bus_root);
>  	return ret;
>  }
> --=20
> 2.53.0

