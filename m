Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8FC21257F;
	Wed, 25 Feb 2026 19:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772046922; cv=none; b=Dcv+LMH+u3c1tBeIIRWAJ3opO0crYlv5lDgqzVWsSLzh2VhXcgThwyaZ/hYQ6BJQuV3cDX2SePjMkt/poxUPuOMf4pkwvmEbGS5Apk8+AFNc+FCAgqFN8yYt+6OCKaigC1IPqmHXGA/3SF99Dk7KHe6kyTDgdNSayGnC5vTxXLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772046922; c=relaxed/simple;
	bh=regoUCoDhvY3xcr+eRdpR/Fk6Qj/cGKH9p9REkSMmsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ei1Kg4M3yFrEI5Zm+DSZ3DnDQmH1kWLI6knGBSHVuK/fmWaiNQy4sqLg0xTdStOcE8geI+hOEUWSS/itSoFGyd5FSINk7Ia/r4AyHRnUMIJ2O0Kh/m+5sjsTwGKV7oJoc/cuSO84lzPdu9uBsj2oKPyyVjU3gQ+idz7B8yY6BSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kBT7ulMq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kBT7ulMq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85FEC116D0;
	Wed, 25 Feb 2026 19:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772046922;
	bh=regoUCoDhvY3xcr+eRdpR/Fk6Qj/cGKH9p9REkSMmsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kBT7ulMq5detbrjYPnVyFTAl4rHkjz8uC45oA8a7hK2lqkhWxGVswCePOL904JXrd
	 VKwAn98dUe2+pLqMJFzVYTwo1otlEvMGiyIx5eVmgpdXTbClv6CXGGSmIWQshr6dco
	 nwy8clJ8SVwM1CXsDWfnVSOppdZYP+vRbW1EJvNlqs9I38lHgew3/IwMPY1YeHrjqw
	 0OLshHRsQjpmkKQH8z21VRLHExQqArDbV2t9Ug2NSJ2dbAuH5zGn0wlKUAqSyNwld5
	 PDpH5db7+pU/mCiHYIwcwbZs9461MHHpwVDT4PFUBPImjb5/vhcmFEuia1K7RmrnZd
	 AZ06sZyNmJdAA==
Date: Wed, 25 Feb 2026 19:15:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 5/5] regcache: Amend printf() specifiers when printing
 registers
Message-ID: <a2e1dc8d-584c-4c72-8e9c-558a220ab5d4@sirena.org.uk>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
 <20260225161659.3811671-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YTu20LK8GRwhJ7v/"
Content-Disposition: inline
In-Reply-To: <20260225161659.3811671-6-andriy.shevchenko@linux.intel.com>
X-Cookie: From concentrate.


--YTu20LK8GRwhJ7v/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2026 at 05:15:59PM +0100, Andy Shevchenko wrote:

> -	dev_dbg(map->dev, "Writing %zu bytes for %d registers from 0x%x-0x%x\n",
> +	dev_dbg(map->dev, "Writing %zu bytes for %d registers from %#x-%#x\n",
>  		count * val_bytes, count, base, cur - map->reg_stride);

I'm really not convinced this is helping legibility.

--YTu20LK8GRwhJ7v/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmfSkUACgkQJNaLcl1U
h9DqnQf9GUCgJStmY4ZZEaTClRRbt8fmOHBPuyXT3sBN7/ltXfFU3vcpox7LrvjA
mpxxMhqvtNZf8Iaw/zfWaJJScNLwdh6u8CdzvdScJx+gFEcJwdLRFRbUfVmX65zY
kO/bkxOnBvwANgeXgsgNaAlBF2jsdaCZah5ecgLEuPE3hgcZWAHIFtzzw0IOp5ha
gVn2iJO9Kta0wu6c46c9CYYp0GL7sh1eBFsWrFLZrEE47M3hJq4KX/+Nv/yEwaLT
4THZpc7GONIPq+FKIjxs0YOjIbRgTZhVWjrjBHJJSXhqnBTkIUL3tIVr68WM+Cla
kYsFQVypJIphN3MHtdmRidFL7o9EEw==
=eXAp
-----END PGP SIGNATURE-----

--YTu20LK8GRwhJ7v/--
