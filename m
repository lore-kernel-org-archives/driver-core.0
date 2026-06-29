Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBF217745
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 01:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782695800; cv=none; b=dtwhWqUQCzE7SC0lQ1YOjvbSy4j5Udum/tyLhvklAbY+uHvkS7e6rOgDB0uaPyKMmwEzNFtVm9bstmwKFDNrd3l08CMVh8ITtKf+NECrDhHs2psFzli7Ek8X3XtzZWq6dkLREtUSlT8sQXp1MxnyHLHzAifd3y2XHDduTT8mWY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782695800; c=relaxed/simple;
	bh=1fzR3s944IhHUDa6cwqoZfiTKG5U56ZO2Qxutp8yGqw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AZzRHwoc22nGD3JKICgpE6KPZmyu99+BVohmqmsM/sxyVzVop+ICN6RS7fAwINVsS700/mn6RKdbeZNusLlrTZCj6br7yVOMnb3G6U52xau7tOiwdJ3C1rdoUIcz+DtyEkpSWMlWEW7hrrii8DellHUOWamT11RpzG8GsIzs+Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=RjZJFi2Y; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="RjZJFi2Y"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 337B3240028
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:16:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1782695796; bh=+fKljr5WfBuYwiJruO0g5dFKAbjQn05a/S12Fgwc/rk=;
	h=Message-ID:Subject:From:To:Cc:Date:Autocrypt:Content-Type:
	 MIME-Version:OpenPGP:From;
	b=RjZJFi2YaS5ZX/bBBkX3mdxpU5b70M8xEmYptP1T7DpCGI3RinicSV4C6J5gZYVL+
	 NLmg1jR780PY2s4B++6qQfJWlATt5oX4oORPqo1cfj6YkiIT0Mbj9S6csINndllhZu
	 ITMjNYMSAOK2MwNxDZKEHBq8RrFUL6sn+PiIJ0nzTJe1TTN6VMaKNDy2M0kHD42dSO
	 eQct5UNmQen0aSl5fQdZHGeqYH6adIRZ1hL5e8rh402Bs0oN0SsuPxSvryBoQVB7Sz
	 snmjYvUxCVy/FcbAOEyhlBCvqkmh3JyZaIjkfEE9JaIk5r6LzzTSrTT58QVIAik02g
	 KIhMfY+rr3lmQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gpSzQ4Mvgz6txY;
	Mon, 29 Jun 2026 03:16:34 +0200 (CEST)
Message-ID: <ce46b3d679b8b3421bb947d48900c0e735a6e910.camel@posteo.de>
Subject: Re: [PATCH 2/2] rust: device: move drvdata_borrow() to
 InternalBoundContext
From: Markus Probst <markus.probst@posteo.de>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, beata.michalska@arm.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Mon, 29 Jun 2026 01:16:35 +0000
In-Reply-To: <20260530132736.3298549-2-dakr@kernel.org>
References: <20260530132736.3298549-1-dakr@kernel.org>
	 <20260530132736.3298549-2-dakr@kernel.org>
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
 keydata=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
 jfGillcaQOqFZ3WwVqyzG1BUfTow==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lp+vbWZX6aabbL47S8y9"
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt


--=-lp+vbWZX6aabbL47S8y9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-05-30 at 15:27 +0200, Danilo Krummrich wrote:
> Move drvdata_borrow() from impl Device<CoreInternal<'a>> to
> impl<Ctx: InternalBoundContext> Device<Ctx>, making it available from
> both CoreInternal and BoundInternal contexts.
>=20
> Fold drvdata_unchecked() (previously on Device<Bound>) directly into
> drvdata_borrow(), since it was only called from there and the generic
> context cannot resolve methods through the deref chain.
>=20
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/device.rs | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
>=20

Reviewed-By: Markus Probst <markus.probst@posteo.de>

Thanks
- Markus Probst

--=-lp+vbWZX6aabbL47S8y9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEgnQYxPSsWOdyMMRzNHYf+OetQ9IFAmpBx3IbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJEDR2H/jnrUPSdWUP/RzqA+lSy9QQS3YUjG06
lE3vfJBwkegv1sTxnWzkBOpDtDFCowhzaZAF4xmwRy3a7a28Vm/qnP22bzkmEj6x
a5Cgqi6CVjqIupNynHI6nT3HmnwTMSXPObxW/nDi/z6pGDze8C7vcHhumuLS17pC
Ef3yvNVxfxtoyxmSUDUFwHR8Vom3LynTyFoKiklTEj6yRaGkUtqbd7d2SbCgQCSh
jujciJhnAascEKDen3ZjWmIN1cStiha/uuxHlXgWiVge4tJ3nYJ8vjhfzR5aX8tt
nuL8RdCrkxve9hmJviDNezWqc4r5fZKHV6/cR1jQVmJbKb09POunwHmaH6mLCsKc
LJECFhlLZh4e7WjlX/b/rFQsq2thUbFeGCwjsqZF1IgzSoeEY/UEwVWFZz0biqbZ
rR7BIb5BDrpaI7KhHMc/HfIXFIEe7ShyUR3aX77H0mBlN1HUnwUVziQHOiegJCb8
e+PhvICM4ej5fUHst03dnU9NVpcTWryK+6aflWmUL8JG0OR/we6IEoeZUxi1MDwX
FX7sf5sPvadIlSRELZvwRL7r1XJ/XZSW47JfYRqLJ8as/sJEmeyMGBdCTAMAR+WO
p6tjjaqVM30oy7mEMWYMBIxEDxy8UW346qKNDRbSmRrnzB26+ML4K9yEaFCQr6m8
QH5FZSTZMSkiq/EGQOKGE0bv
=nD23
-----END PGP SIGNATURE-----

--=-lp+vbWZX6aabbL47S8y9--
