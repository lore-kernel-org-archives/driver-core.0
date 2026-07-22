Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76BC34BA5B;
	Wed, 22 Jul 2026 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728758; cv=none; b=K/NzFP7jK/Qbf/I8qgQ/OS6Txmd7o3kddcMmXO8RmKIyxIBLEUqOzUoMHeOj8JbcqkhaA26ALgEswjJqDoOxn/rrkqpglBTIQpQFYi+NXo1N8RGa2D/sWaANlv6LOJeBaoKxJaEiYd6/Tf4v007vBO6m63iPvKm0pk2tD9lCV/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728758; c=relaxed/simple;
	bh=ZZ0/5d+6zvPvmk7k5VKoAKANcjzAqFt7l8gQTAMH6ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJyO+La8L9cl03KUymDgs0RRwwIxUg2EBu3NQ9mBP892/YeYsCSxALmD+vc+Udbs9b7+JddVBlIoupCckbgYxYFspiUVKqjMqrT/xVpCWUpW6NijEpgNAIJV5lAlaU2A/TqbBj3xlJn/nmyKjBbU/X19vmqIZSwJ2BGGEsbJcE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igxovuDB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igxovuDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF621F000E9;
	Wed, 22 Jul 2026 13:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784728757;
	bh=djFumKZmLPhTKFBUkypeYj9o0RSbnHYax0oZu4ZoNwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=igxovuDBKqYtBTLYTaey6oWDcn3z9NTxLnF2JZULg+9bAm5oR0mkqBOy30nPHtG6U
	 zRAt92q93qQma0YM9dLBC3eCxDe4p4K8o4D/GzFHRX0ahIAbsojNccVlV+CMy4d9O7
	 NXVrUEpo9Px1wwTXDF2NUiMAjz97e2Cg3PCjCSVlRI6a9KUD0PsQNnYC9/YgbcjMQo
	 XPXvrnNti0wlwJR2ZWf/MIQknKHjKwof8EQ0ERwkZVo6p8Mg9B041pDSPq/EphBfYR
	 /2qXwJ6e2dEOw90NRTYYz8hUZBmTnb7jHYRexixgKk+jBWhE0tU6jhehuaPecH/X8Z
	 c6AnQNso76OEQ==
Date: Wed, 22 Jul 2026 14:59:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH RFC 1/2] dt-bindings: regmap: add common schema for
 no-sequential-read
Message-ID: <cdd3b988-72cd-4143-9a17-ee0c57625e94@sirena.org.uk>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
 <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zMcc9TStrEJfLAr+"
Content-Disposition: inline
In-Reply-To: <20260722-regmap-single-read-v1-1-aaaf31591669@linux.dev>
X-Cookie: Life is like an analogy.


--zMcc9TStrEJfLAr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 22, 2026 at 10:42:46AM +0200, Richard Leitner wrote:
> Introduce a common regmap dt-binding schema with an optional boolean
> property no-sequential-read to describe hardware integrations where
> reading multiple consecutive registers in a single operation is not
> reliable and registers must be read individually.

> A typical case are imaging sensors used on vendor-provided camera
> modules whose bus integration does not support reads that advance across
> consecutive register addresses. In such cases, single-register reads
> work, but bulk reads do not. This restriction is a property of the
> concrete hardware integration, not of the chip itself. It therefore
> cannot be identified from the device driver and duplicating firmware
> parsing in each affected driver does not scale.

No, this should not be a DT property.  We should discover this through
the bus, just like we do currently for the various I2C quirks that are
advertied by the I2C subsystem.

--zMcc9TStrEJfLAr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpgzK8ACgkQJNaLcl1U
h9Aa7Qf/R5JpFVgprbbnuaU3XoAX/nBI95XkID3JxvqORE9n/z5u85hthFQ4rORJ
psjAZKMHJuNy3xEey4PtxjzaAgf8VQ9DLNopBdQP4oLkLjdPN4hRBlGIJP3UTc6M
zSL/CLqmBCFlAhopF/iGMWHcpsXpu9rSGbC8Ws8C8v9Geh7cWoQeYc2w3Vxzb2jg
Y5mKW8IKTgmqC8dSDSunXE8rGl5DCdbGp7eZ+iCdrnsqhu5cqO1O5r5K9K49Hrxq
TvGaM2B4Qo803WKhnliVDgkNlla/dJOKYQT/kS0s7BrB00d0/B+ERa9m0TScVXo6
DF/wSp7g3WMZ0NF1ThRx9SSC/NrbNw==
=h6WK
-----END PGP SIGNATURE-----

--zMcc9TStrEJfLAr+--
