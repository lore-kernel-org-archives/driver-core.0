Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABFA224FA;
	Mon, 13 Jul 2026 13:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783950226; cv=none; b=cT/9jwget4aWILR89AepYv2f1kJAdTBqORbnWwT1YzPbQmbtUSGpE2s0rGorrc3m2SnluFDT6JTdIHMh8dmlQCfN/61Q0tS3Wx5I+XGtOKGrOZyLmEqKXnnZY0+Jk/rKHlCboeCKbKPhoxEypB0/U9NiMn9rMPHY5aEgwZ+7ARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783950226; c=relaxed/simple;
	bh=UEFAIy46sIf2Rdy49C0EI0t9VH378YKWerqo8Qgv/9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPciRk5QjmgTj3073hlYkJUie+rsGUH/z87vHh0MqcXe1FpRprmGoOba7D3Qf5C9U2Nu47/DB0o18BLBoj0KKWnBWGqH85lYo1Mad9JwVKuNZco0QbDiQXJ73XvtMFyn45s5a9i6e+HDu9XBexdxs0cb587hr4v1+MgcSm7DOIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4YVnXu2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4YVnXu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7990B1F000E9;
	Mon, 13 Jul 2026 13:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783950224;
	bh=UEFAIy46sIf2Rdy49C0EI0t9VH378YKWerqo8Qgv/9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F4YVnXu2vsjwmrpzsJOmjHSYKl7loN0+/JgWf0MIUJMIxgwo+ejP+E1iobZ/AkUu9
	 4IPVDG7y5MOigK/hk1g5+RFIS+G8o9BUqvr96Dw8Ja+fI/2WE1YZ3I8xD3yxNefppE
	 3duWLeE7Au65dC/i6UItvkRzcmjXr8ZYeWIg1KJvgAH7xc6ZoKk8fr6p7mJAFKvD4S
	 m3/cUs7SllYIVaVa/9fxIjdRhnMy83WUfT9sWSqYaDJ9MNGbKV5VNSybWHOWc7wWdz
	 TSbY9xMRcPpbLL93x/kNny0kXNDJL/D4yMEbXsKWmaKkd9pbnEyfR631r8UW256aJ+
	 SvVf8N1wrT2iA==
Date: Mon, 13 Jul 2026 14:43:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: disable cache_only before rewriting paging
 registers
Message-ID: <687d81be-566c-481a-9ece-08526c33ff91@sirena.org.uk>
References: <20260713073059.47914-1-phucduc.bui@gmail.com>
 <24ce60c7-5539-4fba-8bf3-3a10875c3b75@sirena.org.uk>
 <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z4k7zcP5r6KQxe4m"
Content-Disposition: inline
In-Reply-To: <CAABR9nHfThjz99fVyoAZcSdOh09-n0_WfM2OWL4zkSZG5Pm7Dg@mail.gmail.com>
X-Cookie: Courage is grace under pressure.


--Z4k7zcP5r6KQxe4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 13, 2026 at 08:07:13PM +0700, Bui Duc Phuc wrote:

> Just to clarify for my understanding: does this mean regcache_sync()
> is strictly
> expected to be called only after cache_only has been set to false?

Yes, calling regcache_sync() with the cache enabled is not particularly
sensible - it basically exists to put all the changes made while a
device was in cache only mode (including due to suspend which is the
main case for that) onto the device.

--Z4k7zcP5r6KQxe4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU64wACgkQJNaLcl1U
h9DRywf/aMLO+qiSaeDacx9yMppI+CRzXAmLqYE+QJ6UP0MbTUVD0J9qrP9lyhEf
qGn1yvbAVOcg5cstk1FvVoWxrzlLl6vRvdHfEI6wpgqyn/MkjjhffNOWTmDm0RLV
+TpHhpF0zCdBjZAxMhdQf7T5g2vfm39rrESv+s2ZodAqFSsy0ZxKUiEExDtnR/iI
wG04Lug57j/IEyUGiTnkMVmfdQNek7fsIbVLi+hbbiW5yyRfrpkQXnvo8elq4jPy
ZpPrHmfn7dJLVgYgwLkRv/rWkjK3lfEGqUAaebDPNfT15AYrtLaYvcwGiLN/1nfn
wkyOupVYvr1nJuovRLM7RWgxEGvbKg==
=U8Qo
-----END PGP SIGNATURE-----

--Z4k7zcP5r6KQxe4m--
