Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0092E7BB6
	for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524084; cv=none; b=Ukjdz/RGeYVtzLgGXk6CMr2C/ryB29V4cLPBQWSY4glP98KXmBCvH4zeDNiR2jmTjF9y7lyb/4APz2BFje6RuNhOlnsCYkC3fEhDy6/WwXuZBFdH7SZjQD5jD0DqhHZQjU9f3V+685rrQyPRqmgD6Vf4zqJ6mBzrHmp8q9ef13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524084; c=relaxed/simple;
	bh=12IVH6GZwjr+ram5Y3M6uAHGBy258/8hj2tQln82xIE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvmfQnLg7od3vhRE8FoVK9onRk3RAfnhbWWgbAmAcKRBut/W9MsfI1AuNdax1Nkpys/Xc1RtI7LfDy62QsiNYLkAluCt/gHJl7LnARo1uiJ/WIuisWx5hMfvEOAQMhZmrmoWayS8nUyGFtAHu4DkyLRpX+ShPhwk/p1nljHgVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=fail smtp.mailfrom=lht.dlh.de; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=lht.dlh.de
Received: from OMT-CWNXR4TFW5-LHT (unknown [IPv6:2001:9e8:6317:ed00:1ce7:1d94:d979:e57a])
	(Authenticated sender: albeu@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id B045E2003EE;
	Mon, 15 Jun 2026 13:47:52 +0200 (CEST)
Date: Mon, 15 Jun 2026 13:47:47 +0200
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Saravana
 Kannan <saravanak@kernel.org>, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org, Tommaso Merciai
 <tommaso.merciai.xr@bp.renesas.com>, Alban Bedel <alban.bedel@lht.dlh.de>
Subject: Re: [PATCH] of: property: Fix of_fwnode_get_reference_args() with
 negative index
Message-ID: <20260615134747.3cdb9599@OMT-CWNXR4TFW5-LHT>
In-Reply-To: <f21486ea-db76-4b71-9b68-86c861b0be53@kernel.org>
References: <20260611102806.2643869-1-alban.bedel@lht.dlh.de>
	<20260615-obedient-axolotl-of-argument-fb55ef@quoll>
	<20260615113330.11406fbd@OMT-CWNXR4TFW5-LHT>
	<f21486ea-db76-4b71-9b68-86c861b0be53@kernel.org>
Organization: Lufthansa Technik AG
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; aarch64-apple-darwin25.4.0)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jun 2026 11:54:01 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 15/06/2026 11:33, Alban Bedel wrote:
> > On Mon, 15 Jun 2026 08:33:32 +0200
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >   
> >> On Thu, Jun 11, 2026 at 12:28:06PM +0200, Alban Bedel wrote:  
> >>> fwnode_property_get_reference_args() should return -ENOENT when an out
> >>> of bound index is passed. An issue arised with the OF backend because
> >>> the OF API use signed indexes while the fwnode API use unsigned ones.
> >>> When an index value greater the INT_MAX was passed to the OF backend
> >>> it got casted to a negative value and it returned -EINVAL instead of    
> >>
> >> INT_MAX is not out of bound for this function. It is invalid value,
> >> because OF code expects signed.  
> > 
> > But this is fwnode code, it use the OF API but it should implement the
> > fwnode API which, unlike the OF API, use unsigned index.  
> >>> -ENOENT. This patch add a check to of_fwnode_get_reference_args() to
> >>> catch negative index before they are passed to the OF API and return
> >>> -ENOENT right away.    
> >>
> >> I do not understand why are you fixing this issue that way. For this
> >> API, the INT_MAX is correct value, but you claim that it is wrong and
> >> should be ENOENT (even if there is entry).
> >>
> >> Fine, if this is not a correct value, then EINVAL.  
> > 
> > Indices larger than INT_MAX are valid in the fwnode API, so returning
> > -EINVAL is not appropriate here.
> >   
> 
> Then neither ENOENT are.
>
> But really, EINVAL is correct here. This is OF implementation, so this
> implementation decides what is EINVAL and what is right. Not fwnode API.

I think there is a missunderstanding here. The function we are talking
about, of_fwnode_get_reference_args(), is the OF backed implementation
of fwnode_property_get_reference_args(). As such it must follow the API
documented by fwnode_property_get_reference_args() which list the
following return values:

 * Return: %0 on success
 *	    %-ENOENT when the index is out of bounds, the index has an empty
 *		     reference or the property was not found
 *	    %-EINVAL on parse error
 *	    %-ENOTCONN when the remote firmware node exists but has not been
 *		       registered yet

It is not explicitly documented what should be returned if the index is
not representable in the backend, but considering it out of bound seems
to be the most sensible thing to do.

Alban
