Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C2A4CC28B;
	Mon,  5 Oct 2026 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215389; cv=none; b=iIVLBSKr3WWX+rQJKxUOyOLEMGlhlGABeR/dZMrzH5EjzMJTjG0g5GnJeREo0FfmoLM1n3Fjf2M5+pSZWcER7uyFnqSj3lD9D7ex3Qp98QDmf5ElXrM4CXYlfNhA068s6w/ImxLkWY26baTuCuG2RA9kc/PksRNW4SAPzHV1olU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215389; c=relaxed/simple;
	bh=mkeJJi3F5dOfXoKFI6wH4e7xLmTzH2yJXcZAE0qmPSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxJtcQJp2mdgne2bcUowXvS42BrHYDYeog5uZIF//DZVEaW0q+/sktDgBoD0R+g/TPHRJDRO+xCof5k5mrA8wxQSJNfFbNj+Ad1PW+kpSVGaSV5p6GjGwMyaTTzqZtqHDz+6J6IITC8Pclg6w2DpHNLfffEK7PW3/4jUgnN0EFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=f2DySDr8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="f2DySDr8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oKJ0ggyvKoBY4zYat4h17hr+pWO3ckgn/QlJxQ65oeQ=; b=f2DySDr85wu+wsfo47Gx5iTVN6
	pUTLXk8xhGln0lwbyDV5cgBCOzoEzRNate8hU7wRQELBa453DMX/RE2vvqVXtu/PCLX0dU+5MokU2
	SJKcuk3J90BGnalImefc7NDrqPqSpC13gL+eFqqfabzryMYqyQq8byciDPjqE5M7fwW4AnLdNaeq5
	6FyrMJHw+a9d6osFlTVOP/JnyIDs/rXMkKpHYlnziXNy6gh1/CnDUP4olre7ddqgScYt85QNAw42m
	OdDVS5fAmqka6eJygerXv7JTgFT8t0W3CHkgZzaGyZjHd7Av+co2rTYOgFNohs/pZ5/T3LWtajlpe
	GpMAd6ug==;
Received: from 90-182-211-1.rcp.o2.cz ([90.182.211.1] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDkwf-0000000GnJy-11h6;
	Mon, 05 Oct 2026 15:49:42 +0000
Date: Mon, 5 Oct 2026 11:49:35 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Mark Brown <broonie@kernel.org>
Cc: michael.reeves077@gmail.com, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	maple-tree@lists.infradead.org, asahi@lists.linux.dev
Subject: Re: [PATCH v2 2/2] regmap: Drop map lock during cache init and exit
Message-ID: <isz6cg5wluhdjyq2lfh4t5ar7mx6q2ekesxelffkojjshomucr@q2ybag6pzxrp>
References: <20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com>
 <20261004-regcache-lifecycle-submit-v2-2-976d405e89a7@gmail.com>
 <asOR_mP6pc2Dy3OA@sirena.co.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asOR_mP6pc2Dy3OA@sirena.co.uk>

On 26/10/05 02:03PM, Mark Brown wrote:
> On Sun, Oct 04, 2026 at 11:38:43PM +1100, Michael Reeves via B4 Relay wrote:
> > From: Michael Reeves <michael.reeves077@gmail.com>
> > 
> > On systems with CONFIG_PROVE_RAW_LOCK_NESTING enabled, Apple GPIO probe
> > triggers an "Invalid wait context" lockdep warning.
> 
> > -	mas_lock(&mas);
> > +	spin_lock_irqsave(&mt->ma_lock, flags);
> 
> I think this needs at least a comment explaining why we're not using
> mas_lock(), otherwise people will try to change to using mas_lock()
> since there's no obvious reason we need to exclude interrupts and we're
> peering inside the maple tree internals.

An irqsave mas_lock() should be added to the maple_tree.h for others to
use.  We probably still need the comment Mark suggested as well.

Michael, can you please add the irqsave variant to the header and Cc me
on the change?

Thanks,
Liam


