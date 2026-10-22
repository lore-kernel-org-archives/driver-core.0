Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656841;
	b=B2sy/ZtWaZZTPIH+969vDFzbb2N3F30Uq9bshw6I0IJweSoOnjMZHtK+SErue+NE5NW9
	 VrS/Bb3m3Z7Sph4Lhyl9bF6E5NWwTHvEEmQG/akp3WCu3fxBC0n+vhmE1MQ8gw+KLBUgY
	 PI4qNwlEL0EVZ+Y5tHPBZALkxCyiUZKbjJ+wEO5lkHNW70LD6mQVyQ5FlO6esJylF9H7G
	 NTbXZIP/V+Oecfz3JWJfk7V+LmVFhwybwX7xNJX4QbwSGH3/mjORph7UNX2rrENU9A9Za
	 IhdIo+Ij1ZlFaZ/F2Yr6aCCVNHHkmBkO2SslVeC/VhJB20H0p+Jq6IASFx/6Z6oDQrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656841;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BLHP+/kHJwO99BwaYwfCCDH6HJ9jY/45oh1myP2ZCYM=;
	b=kedn65Rur4SUIKd3tZfHD6trUZrXy9A99JmvT1dsY+J32UvFZQNbDnT/4aD5yyKrIBtT
	 w30AOUtU8hY56dPBsyXJ1rkwJ21t0OpfJVclrCvbEMsFig6X61AORfGwBF93HXh1UoKOT
	 LZ0/2rR33b/EYmn31U4WfiM+FbwCj8Yap8JSkUzEcJYNq/75b8qBUYH0swqCH/XfgiCst
	 93htrQT1dBHqRplp9b0ua8LWW2ImLxrFOTTJJg5/18NReFlpJFFzwkUQBiQMkIUXuGpb3
	 lBwperzRG87/w4N8OMlLp979+Lw6Gx1bQWpgml+uHTAq6o6FRhH3hGTShJ0ao9A29Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifzOuXkI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A14606A319;
	Thu, 22 Oct 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifzOuXkI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E29F1F000C1;
	Thu, 22 Oct 2026 08:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792656840;
	bh=BLHP+/kHJwO99BwaYwfCCDH6HJ9jY/45oh1myP2ZCYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ifzOuXkIsSakZ7IAtpndh+vE1IhJ6sgXnbMho9rtU+GaWdUEp8QGHvZmbtDYrbr6Y
	 QuQUcyazos4jLbPMkM38TrM0jwdPvihg4DPuNhzfj3YCWsQjvqsi1ARIweRInyT4f9
	 LbGf5e2fZPiXDFEpy3Xf1e2bu656Em5g2r3GfTTG9Y2+39b6KcqahYoLopDc+PtPJD
	 kfwzlFRGeoUfryHBW3jtWOrmFDJuccg9uouQ9HgPUGjM/u1ucGKSwRXfsGJ5/i9DVo
	 4KXpMvYYC4QgOBmcODfTc4fjOdBkiCwy01OjYwQYOlfeM01igQNj8iZG7EMpAxmlQA
	 b8RyowLkFRGkw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJnvx-000000002Xv-480a;
	Thu, 22 Oct 2026 10:13:57 +0200
Date: Thu, 22 Oct 2026 10:13:57 +0200
From: Johan Hovold <johan@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v1 1/1] regmap: irq: Get rid of duplicate check in
 regmap_del_irq_chip()
Message-ID: <atnFxRi4DSKL2TWr@hovoldconsulting.com>
References: <20261021205036.1013622-1-andriy.shevchenko@linux.intel.com>
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
In-Reply-To: <20261021205036.1013622-1-andriy.shevchenko@linux.intel.com>

On Wed, Oct 21, 2026 at 10:50:35PM +0200, Andy Shevchenko wrote:
> irq_dispose_mapping() already 0-aware, so there is no need to
> perform the same test outside of the call. Get rid of duplicate
> check in regmap_del_irq_chip().
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> @@ -1039,9 +1038,7 @@ void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
>  		 * Find the virtual irq of hwirq on chip and if it is
>  		 * there then dispose it
>  		 */
> -		virq = irq_find_mapping(d->domain, hwirq);
> -		if (virq)
> -			irq_dispose_mapping(virq);
> +		irq_dispose_mapping(irq_find_mapping(d->domain, hwirq));

This just makes the code less readable, and for no good reason.

Johan
