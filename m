Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6346DFF1;
	Tue, 21 Jul 2026 16:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650704; cv=none; b=cgVZhDeeA3SqWp+RCtVPpjJA+pjFZmgSFsOn5VWL6lbMU4GjnYC329TTydVVVA4f54rSIlpBcnOsuOzcYxqMUDe4EjrBoqBHuEKBjry5wl9ccQenmccvjQjW0XPjBxynEFQY8BpF2V6o2m+nW9JS7vZCuIrPP8IDgAq55NfJMig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650704; c=relaxed/simple;
	bh=PwcBXE7BEJMobfNkl2D2pQiKH6i3dxFrpREw1HlDCss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t6BLUgazCrLSHnNmLNxp4Yzp+vM362hMXlbpjSwuKsB8kQQVUhZqbGk4Fs9ifDUbZs67Kbdh5GJzqZsMqja190hi0b2I6ZZcnHqPpg++s1g32r+b3uCcTfInBdWCredqQ677vTtPYAcmW/bgyFx4xQqT5zkFdbkcQE3QtEsHASs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ypw3EWG9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ypw3EWG9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B151F000E9;
	Tue, 21 Jul 2026 16:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784650702;
	bh=PwcBXE7BEJMobfNkl2D2pQiKH6i3dxFrpREw1HlDCss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ypw3EWG9Kmaplw0Fm5ejBs1MciGsIsXWHBlvlUxd/RUatvM5IrzBsMjO9T0tseHYF
	 v8Qon+BbCf6N8x8MvJzV/vza5Dxr7tPpcnRZ0B4eh/tplET1JUQVEm1Ma+STIuPLj1
	 pwpunoK8zTMQgXTR8eHd7wfSeqWw9DYWzdKtnAETR5Nl7U9unkUPSxunc1+8VkePL2
	 yzdMUnekFHJCreF7nxo9xuFmu3q1uaRtyhF87c6hzn0pqc9S0TZzTZ4jqeTz2c1Bgj
	 o1Zy+qB1xESj6R0eHZHyRo0FJhBarBG/1amUJgG7Zu6Uj0loG8Na7Z8OgQMkxyy/zY
	 Mt2zNc0r/tTBw==
Date: Tue, 21 Jul 2026 17:18:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2] regmap: Clarify regmap_update_bits_base() 'async'
 kernel-doc
Message-ID: <6411cd9a-43ee-41d7-a9fc-65664b0eb9cd@sirena.org.uk>
References: <20260721154902.566531-1-bhelgaas@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IFJ16I3OV3XR/GnY"
Content-Disposition: inline
In-Reply-To: <20260721154902.566531-1-bhelgaas@google.com>
X-Cookie: Love America -- or give it back.


--IFJ16I3OV3XR/GnY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2026 at 10:49:02AM -0500, Bjorn Helgaas wrote:

> The kernel-doc for the regmap_update_bits_base() 'async' parameter didn't
> actually say what it does.

It does?

> Reword it to clarify the read-modify-write mechanics: when 'async' is true,
> the write is queued asynchronously, but the read will still be synchronous
> unless the device uses a register cache.

The API here is that we'll use async as much as is supported, there are
actually some buses that have a read/modify/write operation in the
protocol so if one of them supported async I/O we could use it here
(we'd need to plumb that through, but the users shouldn't care).

--IFJ16I3OV3XR/GnY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfm8kACgkQJNaLcl1U
h9Dg7Qf/TRbrLiq1kk0yMpLXm4Nf1A07iNFC0fnLzqPyA31d7LGISAlDq/7Rk9vD
u9Gw+V1y6BjH11Ba22nP9ui2gqo+jsvtIVYSCE1yr+1n0VeANdLldN3inmGqwwR6
5szTevsycTlLSkEoDE2qjBjXQx4JpgPnGQpfwguls2V+EExtLcNVtXcU/9Wqx8yC
HAtQxYqowxqJ6Sd0w7NhTS97D2dFdVYXR2cajTyiQgnXBFhvaA+wysh9A9IiNEI3
6Gr7TnexQRVYNLD+t+8RJ7rRTmiwZ85mdTkjwLD/YLM5vQb63YKTmpZJMyZdwvew
+yR+6jBQX6AoVNmyUsj/ktUq9HAQPg==
=UYIg
-----END PGP SIGNATURE-----

--IFJ16I3OV3XR/GnY--
