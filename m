Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702444;
	b=Kwl5VJ8CNQFSoxzr8VKqxwJuf0JpL1mJ2L4h0lEwCqur/8w8ORMSvAJIrfTabwRIUxNz
	 A/UKftDCRYe7WCemGca2Mqu8GQSvka7qB3Lb4I6Hel8cTke0qwOK8XwYTJqsAC+slmc/M
	 /IqT5bHcraPPZKjFFoM2cb7e3EbfTEfTOCeSLsKToZKnT7KmGXANnJIGWES9qkJJ3ZL/Z
	 1q+/KtVwFI97FTG6rvHrNFG5diL6jhBp0xLDIFVGGtyR8/MUFzOWqktj+pI/Z8UdWbdvw
	 ky5eHI+SPg6IzNojkRB1j7ezW48JtZHYsVr7yMOdEtZfjSnyJEf+eKib57EbzA6IGaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702444;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=e4BowQ+amK38o//s4NxPBalFr8cpFlq9Zh+O3SwU0ZI=;
	b=gq4er9ZGh/0URvY+S1rD3FbuvvraTkMpSwwBByweG9WUIelz57ZntgS32cO9pwYFQ3T9
	 kO34zjkeYTd+eGJYYqZUg1uSeJR68LqY55rZlQboHfRQcLty9674OEUwhWk3fdBBs2VOj
	 udzUXH0ONn36ifnIbZSoFFg/pj+5ETiQmrNjv6p1cFsk6wI9sLkS6hLBZpCAnO7BHivUn
	 vtoXWFOQXmYdgpTub8v7w/5CCajFzGAqmIlE+4FEJvbOW4jwRJPozOvRyQTMEhunx4yMS
	 AbtkNZaftMpvVKyKFRDUHagqzuLvLPNjh53mHUyizBBdp8+wSwSTlhIlioRapKcUTGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=AYbZAvnm;
	arc=none smtp.remote-ip=192.134.164.104
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF8606B108
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 10:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AF8606B108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=AYbZAvnm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=e4BowQ+amK38o//s4NxPBalFr8cpFlq9Zh+O3SwU0ZI=;
  b=AYbZAvnmPPrmjN2nm54y/XOOtk2qFGxS5Fq1etWVg/eQQ3zGiKrhEThd
   bEk6tD1niW5tnYsTPn68Vcrb8AZQIaZ1qaLQGInUY6GwBQTcV3J2Tq/zm
   OtP8RH2VZrdBOSsmBWxz4tGfim3fnhunsoyaSHc0bh2Q/Q+AVitJzxSG5
   U=;
X-CSE-ConnectionGUID: SC95fYGpQZWvGPBNN6q0gw==
X-CSE-MsgGUID: N6K//vBCRaiQC+RyUl3sHg==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,193,1787004000"; 
   d="scan'208";a="161600837"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 11:40:34 +0100
Date: Tue, 3 Nov 2026 11:40:33 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kees Cook <kees@kernel.org>
cc: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    driver-core@lists.linux.dev, Nicolas Palix <nicolas.palix@imag.fr>, 
    cocci@inria.fr
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
In-Reply-To: <202611021747.3BD1EB4D@keescook>
Message-ID: <491ec0d4-f85-e8c6-e59a-6c9ccc84e0@inria.fr>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com> <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr> <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org> <c47392bc-e522-19b6-a653-1e85b44cefba@inria.fr> <202611021747.3BD1EB4D@keescook>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 2 Nov 2026, Kees Cook wrote:

> On Mon, Nov 02, 2026 at 10:09:21AM +0100, Julia Lawall wrote:
> > On Mon, 2 Nov 2026, Kees Cook wrote:
> > > On November 1, 2026 3:51:53 PM PST, Julia Lawall <julia.lawall@inria.fr> wrote:
> > > >
> > > >
> > > >On Sun, 1 Nov 2026, Joe Perches wrote:
> > > >
> > > >> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
> > > >> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")
> > > >>
> > > >> Finds and converts sized devm_kmalloc-family of allocations into the typed
> > > >> devm_kmalloc_obj-family of allocations.
> > > >
> > > >Applied
> > >
> > > Please don't send this. I already did this. See the PR I sent for rc1:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-linus/v7.4-rc1/devm_kmalloc_obj
> >
> > Too late.
>
> I don't want the rules duplicated, though. It should be a single set...

I guess I can send another pull request to remove the rule I added?

julia

>
> --
> Kees Cook
>
