Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794761178;
	b=JFLLZRhtNCB74VVM2Dq/TSV8+JCavJwSW2Ju0cfpIe3zPUrr7uaJy9IISw3z/LsO5C7l
	 qXlOeLXc1dNY0ev+HDuBJR/uvW4jk0xI1Jf1bIQCutBJZ4XcagstFHhPSFzkhhX1n+EQi
	 6T8OxX0ChaoNoEsgUTnXqLpKDqZOMeaHY/LXfFXOIN54VZHuGXsGeTaGHq9hOaE+iVKTR
	 reD/Ke6i5ErLepj/p2oRPVldMKCtVcucF5jd2ZMaQI4yJcraCzwdR883P89XMMhidfdVe
	 HNZqqBcO6tNx/F53zxB/XkkeWpxyUWua166GQxxsVL2VdL6UvKtV7V3qnqAKaYdJ5Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794761178;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=2MoJWMn6VKWDyiGwzxkMuLU3J26ndCbXCcakP40CUSg=;
	b=XnRCbNFRrzzLGSYq98r+HTTrHT+jmrJO9FoEKXB0qIGkN1bz23fYVVDuI4Cv3KrZ/wY5
	 sEhR7S8kFhrYJDQTtegliCsKnPemynLzrnfftwXzi2MlVb36a1W7SOmT6ayLmLM/njytj
	 M4jhED8aBuM0nu03av4TJCDCnr3uZ6sH/PJZ04ukMV7oV4DDjFgd1+VgC/5vafiyl47yj
	 x8XzeM6HheYX7rhtUUIY3/L5zXhfOhqNWJEudpPQIPKN41Fk87rJyslV4QJSuC/EJVoDT
	 A4tEp8HPKBLnfVMyF3TLq/Z4t5IpiBNKuNg4IKc7JbadpmENr89UOsOOMugRZHsIgZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8M3unOV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFBF606A31F;
	Sun, 15 Nov 2026 16:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i8M3unOV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778A71F000C4;
	Sun, 15 Nov 2026 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794761178;
	bh=2MoJWMn6VKWDyiGwzxkMuLU3J26ndCbXCcakP40CUSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i8M3unOVKP3MMaTm1zNOl+FhccH7hwIqyzLm9BEBvlpqbA7abZZFNDwkwy60HSHW9
	 AC2u2s5Tue1wBbrb++sAoycH7lWwZSjqesXovS4smNt+M0XNdnTf9BFjDZ07mX2dGl
	 xKNzZc8M08G0Bnf/shL+OOUR0wE9VoEV67R79ElS98dxdHbhfcJe3rxGyvYFpK6kw5
	 IniYJ7SgZPGKfvw+YheRL2CWc4gh+y6Pqzn4GsLmgvbzBqTCjIWoFC1gQZr/fm7NPp
	 jA+P5NNP+f2GLtYkFVXnbIY9xWt1u4YbZdeEWESnWFEb9YR44X/lqt+aHpGcRnySry
	 Tpkhcl8/92H8A==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id BD4EF336CEF7; Sun, 15 Nov 2026 16:46:06 +0000 (GMT)
Date: Sun, 15 Nov 2026 16:46:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Peng Fan <peng.fan@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2 00/10] regmap: clean up and improve __regmap_init()
Message-ID: <8a0bea1d-868f-48ba-a5ca-9101ec84503d@sirena.org.uk>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
 <avhbxfOZqN048N-Y@fedora>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RTzgXl3Fqqzsuwj0"
Content-Disposition: inline
In-Reply-To: <avhbxfOZqN048N-Y@fedora>
X-Cookie: A watched clock never boils.


--RTzgXl3Fqqzsuwj0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 14, 2026 at 09:01:57PM +0800, Peng Fan wrote:

> I am thinking to drop patch 1(which seems not a correct fix) from the series
> and use a separate patch to avoid sending a large patchset again, and the
> other nine patches are orthogonal with patch 1.

That's fine.

--RTzgXl3Fqqzsuwj0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCavnhygAKCRAv73Ows9A4
iXYaAQC+TIecl8vXIYYTbuJjWoEf/G40FVaD8VmRym9z8wklQwD/aFcuEuhH3A0l
k2lGLH87LAYatOZdjZp1SSKYHwYNLwU=
=FyVT
-----END PGP SIGNATURE-----

--RTzgXl3Fqqzsuwj0--
