Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9C23DA7D0;
	Thu, 11 Jun 2026 11:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175953; cv=none; b=hukS5ZkjUp5PbN8jsGoKrCs3xRVT6pHYxryXhD0H29lZyRCWpnSVOcemdAke9nzyEJ7a7w4ZaCm+aws+/KqqoB2T6UCPc9HUz8bR96lUChpGO6WtAgkLwXstp56F1aodToz4xULwmnwD+a+3Np1sZw3ztLQzYcOwftxawmoMmkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175953; c=relaxed/simple;
	bh=bDWefIedIxuHaxIeLnGzSzCCLnLYYiEcsU9JpeSLM14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqneKjvbR+D6oRyJxkpYKXQWGzAAZiWBD++eOqsaWg/5dHuD6obUJjlqHy+jYZNIjKnQUJSz0qV+G951TvO36urUfuH9jWu9bnbUA5cUKaBa1+gDTgpVZ5OxIf+jU4eA+P1sGkS6ywt+o03KKIbYqBPfy4BcT5Cxp2BgxZ+rtVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=a4wA0amM; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="a4wA0amM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g4jmeeohNafaxl9wPTGacPsV5XMVCMDW6SmjV7TbWbo=; b=a4wA0amMXnzg5RMDx1g4Z8jyEY
	/syC8Utg21+HwBSU8gy2m7QtX2lldoFl7mZ80jt0tL2vhyDGlB5oPTSgTPXyZPKPQEu2DFnYoqP8g
	HjDXlEAbuGI3aB4v71Pch5bP28KP1PanhRWtqqB0WIk6b5GNAV2VPD4GvqteNKTE6viJCNar1kIB0
	837XxDP9MWDVvxb07WAsVRMkBrFomKNbg/a7ot16+DMDnoYvA79NQRgRgYiYPIwqkQz9aIVru6kLz
	Y2ocpvzGh1VHw7CZV5PEJzSEsHpj/Bc64Cy1ZBj+XyGexkx+CiCV8vEKxIS9xKgachuTNPFqFaHA+
	o2JQI21w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wXdEG-009um9-26;
	Thu, 11 Jun 2026 11:05:44 +0000
Date: Thu, 11 Jun 2026 04:05:39 -0700
From: Breno Leitao <leitao@debian.org>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] cacheinfo: don't propagate DT/ACPI error when arch
 supplies info (arm64)
Message-ID: <aiqWXqoBdPED7N6y@gmail.com>
References: <20260609-cacheinfo-v1-1-35864c9a8f0c@debian.org>
 <437997dc-7ad1-43dd-9626-6cad37c5258d@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <437997dc-7ad1-43dd-9626-6cad37c5258d@arm.com>
X-Debian-User: leitao

Hello Pierre,

On Thu, Jun 11, 2026 at 12:30:24PM +0200, Pierre Gondois wrote:
> On 6/9/26 18:23, Breno Leitao wrote:
> > cache_setup_properties() sets use_arch_info = true when DT/ACPI
> > provide no cache nodes and the arch can derive the topology from
> > CPU registers (e.g. arm64 reading CLIDR_EL1), but still returns the
> > original -ENOENT. cache_shared_cpu_map_setup() bails on that error
> > before the new flag can take effect, so the first CPU brought online
> > always trips a misleading warning:
> > 
> >    cacheinfo: Unable to detect cache hierarchy for CPU 0
> > 
> > Subsequent CPUs skip cache_setup_properties() entirely because
> > use_arch_info is now true, which is why only CPU0 hits it. This is
> > reproducible on arm64 with the QEMU 'virt' machine, whose default DT
> > has no cache nodes.
> > 
> > Clear ret after setting use_arch_info so the caller proceeds and
> > populates the shared cpu map via the arch-supplied leaves.
> > 
> > Fixes: ef9f643a9f8b ("cacheinfo: Add use_arch[|_cache]_info field/function")
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> > Cc; hruben@meta.com
> > ---
> >   drivers/base/cacheinfo.c | 13 +++++++++++--
> >   1 file changed, 11 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index 70701d3bc81c..4e11d36f127e 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -401,9 +401,18 @@ static int cache_setup_properties(unsigned int cpu)
> >   	else if (!acpi_disabled)
> >   		ret = cache_setup_acpi(cpu);
> > -	// Assume there is no cache information available in DT/ACPI from now.
> > -	if (ret && use_arch_cache_info())
> > +	/*
> > +	 * If DT/ACPI lacks cache nodes but the arch can derive the topology
> > +	 * from CPU registers (e.g. arm64 reading CLIDR_EL1), fall back to
> > +	 * that path instead of propagating the error.  Otherwise the very
> > +	 * first CPU processed trips a misleading "Unable to detect cache
> > +	 * hierarchy" warning, because use_arch_info is only set after the
> > +	 * first failure.
> > +	 */
> 
> NIT: Maybe the comment is a bit long/verbose,
> but maybe also not worth a v2
> 
> Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>

Thanks for the review, let me shirnk the comment above and send a v2. It
will be painless.

--breno
