Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB94A25B08E;
	Mon,  5 Oct 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201795; cv=none; b=UwT8+5dHVsPhCgjKrVRqjrTuX/PeQ1zO0Vu+j9vJLfm8HtIT3AWtw5pli8Cyyl5TPZemD4orhm80f74/oa3kzZs3pjDKvjm6d4aTI4tpmS43J0YAIP0Xe1YMIqdoJ5JDOF9pD/sTNZhXM/KO5OIzIEiqjENVdWkGdO++3t2UPB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201795; c=relaxed/simple;
	bh=RX07QNDI5QhhlnhG8e/m3mlqTvkzSyuwwbOZThDqoSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNVwd3+gB9hly5J+gy7Qpo3E939JTR30SpberqIoav+Al3Sjdn4vasiKZZqEBiYUJ5vDxIsGjpqzGZHQyDBJNWDD5+UpHInZDrPe5IHq/X/mTevxCwIfwxlJnETcX8mjfrvgHZt3xlFAOxBHHrh0zYZCIVMIkCYIUZlW3UcipOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN9HVINB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN9HVINB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD4D1F000FF;
	Mon,  5 Oct 2026 12:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791201794;
	bh=kD4+uzw7bhovQE/d/0mn0fYUS7lXjKnjKcbPTc8WVK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nN9HVINB+ZC7FQUj2kczJFE3oEIw/ooD3qD2guVDS6DTuTV8v096dOTvBAOyRxqWy
	 R3I210N+Bu2Braa/np6DXGVxHG6mYMmwboM7O4bajwrSlX0wN8AXjyirzzo4YWz+mp
	 9SuRWRpp51E6nJl2LlCcxBhNK9tImqtnPwzftT98lLSRzwaZv0fYGNElZeqfUeAbn/
	 yWzcq4TBAxayFPxXMzg8lCupsPjwOGlZYWsmSutuughAt6+uSU6M2YJg5E9ND1NUrN
	 RJubjJxXuxLXVrIIuxL+f3FLP/5in3isOJKXFOwIjVhdmhAMA67DpFN+Hnb6vMIcZ3
	 1pcuQovZG9N3w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id E1E261AC57CE; Mon, 05 Oct 2026 13:03:10 +0100 (BST)
Date: Mon, 5 Oct 2026 14:03:10 +0200
From: Mark Brown <broonie@kernel.org>
To: michael.reeves077@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	maple-tree@lists.infradead.org, asahi@lists.linux.dev
Subject: Re: [PATCH v2 2/2] regmap: Drop map lock during cache init and exit
Message-ID: <asOR_mP6pc2Dy3OA@sirena.co.uk>
References: <20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com>
 <20261004-regcache-lifecycle-submit-v2-2-976d405e89a7@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AiTCInaMmJm64Z9z"
Content-Disposition: inline
In-Reply-To: <20261004-regcache-lifecycle-submit-v2-2-976d405e89a7@gmail.com>
X-Cookie: You will forget that you ever knew me.


--AiTCInaMmJm64Z9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 04, 2026 at 11:38:43PM +1100, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
>=20
> On systems with CONFIG_PROVE_RAW_LOCK_NESTING enabled, Apple GPIO probe
> triggers an "Invalid wait context" lockdep warning.

> -	mas_lock(&mas);
> +	spin_lock_irqsave(&mt->ma_lock, flags);

I think this needs at least a comment explaining why we're not using
mas_lock(), otherwise people will try to change to using mas_lock()
since there's no obvious reason we need to exclude interrupts and we're
peering inside the maple tree internals.

--AiTCInaMmJm64Z9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOR6QAKCRAv73Ows9A4
iTMoAP4o0zrTEfz/KK1WqqxX/lOzdx2SwIkQtzyY0HTAhAlCzwD/Rgigj//3JoGr
LajYpbwuwOeLuZ2alcDAf//8Rpb47AE=
=q+EZ
-----END PGP SIGNATURE-----

--AiTCInaMmJm64Z9z--
