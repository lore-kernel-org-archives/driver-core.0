Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BC1372067;
	Tue, 26 May 2026 15:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809903; cv=none; b=hEkGzKDyOdzs4JSo4TdIYQHjcEZBmvaBWz5QNBURxuFEBzRKFZWEqAx8QlWLfoRJFjJ9q3JRmM5lC4DTN/ftPNrzV6ukGN9TqignqRCoQCbmiBjYMepUCuIPBZswQ+4j6RlZMZOCe5OVWpuYfgIS/bZFfs6zYonajfkvdecSRoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809903; c=relaxed/simple;
	bh=6zgSjF4usEpKULuq9WnRFz9I4iwWEoEy8U5vX5aWfRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsAG3OSW8us0WYRkVz4WdPvPxnrxz5qplvLywPtoiMVB3gTIJoxKTwEV7jFYEKDPvmAmqOoBbzRnNvFhyqMhHuJjVURVExTaPy7rgSukouw4s3DApAg91B7UH24pBM4SVKsCFK9PburWDRbprouhrvDRCS3UT4k9gO6w9hrXc1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwXMVTS+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwXMVTS+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCEED1F000E9;
	Tue, 26 May 2026 15:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809901;
	bh=6zgSjF4usEpKULuq9WnRFz9I4iwWEoEy8U5vX5aWfRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UwXMVTS+t4JsCYUiiFNNZ9t7rzmdS21zTuBkvpTNhxR/Lu6RU5wqc2XzI9/vkD3y+
	 1RpSgClLy74tFCQHWXPBQRQg08diKoqVWz/yb+QwJpQNMIw7O3nyuG6XK8QQeAfRdm
	 y5FIe3Eh3Tq23Cf8z/3xo9Zj7vMMnLjSPMWzj2XKcMvCLR8ePb87l3fcRAe8q4qzxA
	 RlZzEU+BEVf/AsOohjzyNmwhxLonCVlO1d/bmtJCi7z1l3SID8Zwb+DMF7fr3YwAEO
	 nUbv8wnvy5ookoCuaNd9qwX2/iQ94Ii8tp+8WRlSrCQJZ0AZmJ5Lp2s71OD1NYjISL
	 OgywQ3BKzT08Q==
Date: Tue, 26 May 2026 16:38:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	Zhang Yuwei <zhangyuwei20@huawei.com>
Subject: Re: [PATCH v3 4/5] driver core: Allow the constification of device
 attributes
Message-ID: <1e4f4f4a-2e0c-481a-b3eb-92705de3b7e0@sirena.org.uk>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
 <20260512-sysfs-const-attr-device_attr-prep-v3-4-cb7c17b34d52@weissschuh.net>
 <42a1555b-5d98-4601-8699-eab86aeb115a@sirena.org.uk>
 <874d9889-1a2c-49b9-8d7c-f963fc21dae4@sirena.org.uk>
 <DISPTSBBTHC8.2TJ91B1731ZS7@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QiAzgQV0Xg/QOo9N"
Content-Disposition: inline
In-Reply-To: <DISPTSBBTHC8.2TJ91B1731ZS7@kernel.org>
X-Cookie: You are fairminded, just and loving.


--QiAzgQV0Xg/QOo9N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 05:32:22PM +0200, Danilo Krummrich wrote:
> On Tue May 26, 2026 at 5:25 PM CEST, Mark Brown wrote:

> > I've now got another bisect which comes out to another driver core
> > commit 1137838865bf (driver core: Use mod_delayed_work to prevent lost
> > deferred probe work), I don't know that that is an accurate result
> > either but it does look like there's something fishy in this area.

> When I saw your first mail I did already suspect that it might be this one, as
> it is a race that might or might not trigger.

> I applied [1] to driver-core-next today, so it should hopefully be fixed for
> tomorrow's linux-next release.

Ah, that does look plausible.

--QiAzgQV0Xg/QOo9N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVvmgACgkQJNaLcl1U
h9APGwf8CUlxbaEDlyiOTtk0UVt2BkKYYnWFze2INhM1ITwLXH/4599c2pTPEOIB
DqVdhGDO5mZD264U5c9kNxDplvPyo5l4QUNW9W6FadJx7rG9HG8vFJ+Ic07TxYBF
4XCSUMd8ABwJcYl+9XOC5cVznHbiqFrM7tM320glFRF0RyDMhKWbkVB/a5g8k3Pe
npxiqvoSN3UyKEaocAoN9j8cIeyH/3Oj1ChHelVyASUGxBasC6ujG/+o5LdHTtfX
+jqiG70H4IpkKIoLVLjobYf79nR8E+/DGQOt9sKrgQcm8BERNrDG5Ajhtsu/u4+M
uckUgSNxYNzLvuK/HPnNN3soX59iTw==
=UUqq
-----END PGP SIGNATURE-----

--QiAzgQV0Xg/QOo9N--
