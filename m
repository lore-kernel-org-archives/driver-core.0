Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38D23B61B;
	Thu, 21 May 2026 06:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779344405; cv=none; b=RZxYc1KPQbAqSPAVoN/SVTUa6e7HHV/cLqd55JiNrTVPLxC4dCg9fjovWrHV3xs5hZF/Yh2rfdmnt2eCZHa5R0AXGs5D1ZZZaZWLji7YthbPaJvgEE9lISnekUA2srhlPuPkoLHijOA0L5rcQLEF5y9Mg8SjznWcIECemjGtwjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779344405; c=relaxed/simple;
	bh=C92Ki6moJA1GoP0fPJ7tjlj/ONoSwdjiUA6DI2OzEcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqdrd3aMB6bp/UDI5VNRYtPboc0kZFHBtw9nM6glaMU0vAhXb7WvJ1+juxcjDSHBWOKM3SVGM57WGlGDfhzTIE+6VBEnPEQ95Rf+lgPk8YFLTbnX4F/ONsKBDSbe86c1AhSkQ211B9e8IGVE2/L7YP0LFA0gkGPYbfkFcTwXLrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RJKXIfpc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RJKXIfpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D468C1F000E9;
	Thu, 21 May 2026 06:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779344404;
	bh=jLV++bA1eY0lEOQVpc2ubRzNM1s6bCiLY+n10xLmhLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RJKXIfpc1Cenw4P9i0n/7TZOO3f7Oaz32YLMgbq6a7VmI1BOprY9hl12rp7tuDvBN
	 758edgkZxrpRsQdSQ+pCjOWA2GrTGPOsZtT+SCLWnC2upjEltMLXRPjnpKXQnW5yPq
	 wZ5EEZ2GMENEkGXBIPHgxh6sveC46ZLQa2BGPch8=
Date: Thu, 21 May 2026 08:19:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, NeilBrown <neil@brown.name>,
	Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Message-ID: <2026052148-glamorous-hassle-2cc8@gregkh>
References: <2026052000-drove-unicycle-d61b@gregkh>
 <20260520231158.407ebf0b@pumpkin>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520231158.407ebf0b@pumpkin>

On Wed, May 20, 2026 at 11:11:58PM +0100, David Laight wrote:
> On Wed, 20 May 2026 15:07:01 +0200
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > sysfs_kf_seq_show() defends against buggy show() callbacks that return
> > larger than PAGE_SIZE by clamping the value and printing a warning.
> > sysfs_kf_read(), the prealloc variant, has no such defense.
> > 
> > The only current in-tree user of __ATTR_PREALLOC is drivers/md/md.c,
> > whose show() callbacks are well-behaved, so this is hardening against
> > future drivers doing foolish things and out-of-tree code doing even more
> > foolish things.
> 
> What is the rational for it using PREALLOC?

No idea, you might want to dig to find the commit that did this.

thanks,

greg k-h
