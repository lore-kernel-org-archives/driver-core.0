Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610564;
	b=SEWkyPt7U+yLM0+I551akRyL2wjbxgVU+OKKE0gdW8VjhL+xEwNOUldWTGkrZr1fjtHI
	 o+fKsvFe1xhf//lVqP1cg5pGu7ZLbFW4KDCZLJ8sudW17LKUt3ZFz5Hu19M52yxwgP3G6
	 cxA4xpXZv5PxUtPK8XlsEb3Yh095O5u3qKggsaHgYAAFXem2oADrYuJuN5OVF5C8koqaQ
	 hGvJPsKSxvc5DYdgWoTntGbZmDt46l3HBNTgnJ3anlvqqZwphmbQKw3HObW9b3SAMF1Rk
	 pydGXT+Ze501QClAty+fIkroSRw0zqcZQ8WmdHkA8dSjnb10TvqR0zMxaeQKb4gcSKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610564;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type;
	bh=IYFW2lTOpyKjEnXh2uR1HGY+0FKkCifbwuEO2xZ7rNE=;
	b=ybMhWEoZ2zMBOCLZA/ifo07eni442GTAGOZayzN/XSBlPDWTVxF2T4vM4FeSOQt8qY8X
	 3y17ZvXknZy1lov091m/fdTWFgcy4731gu3qgYMObHjvFwq35FdEhgbkJU/nnSzoAMcDR
	 40teidSK7nUeAMMjjBJQLj5KuFA4czS1x8/O6hdEbJQqA1uua8/r8PN/a+AyzqEJCLfDL
	 MAKIaQVkEjpmkMPMiAyoBk019CwsQVKyBtBCZBZIg+4Q7K7mIfQtVXzXl1dieIqXKHTNR
	 naMPy7gSiUf4wsBhLjjbL1+rF/VCVqnSoL769YLnZq6XjK2DxN0TpaQLHADS7gfTHzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=FPh82kbK;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F106606A327
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 09:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F106606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=FPh82kbK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IYFW2lTOpyKjEnXh2uR1HGY+0FKkCifbwuEO2xZ7rNE=;
  b=FPh82kbKRC2x5AkT1pgqQkRaqXaiNAPTtradhtnUKi9jhKCDRh9HKsss
   X+1bIhliA6vK7Mqhjn/6L8tmF4odm+tXew/myyGZS51TK/NHhXY+V3bGj
   HAGtSubjH+jl+hYaptg06R5lZ17K3mO9YbUjS1TDyPMGIbZp8eg+3KG0L
   E=;
X-CSE-ConnectionGUID: ozxKcFvfTKausaSb0UebIw==
X-CSE-MsgGUID: SEgQBXdrT0O1xls2NlHySQ==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,191,1787004000"; 
   d="scan'208";a="303298693"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:09:21 +0100
Date: Mon, 2 Nov 2026 10:09:21 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kees Cook <kees@kernel.org>
cc: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>, 
    linux-kernel@vger.kernel.org, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    driver-core@lists.linux.dev, Nicolas Palix <nicolas.palix@imag.fr>, 
    cocci@inria.fr
Subject: Re: [resend PATCH] coccinelle: Add devm_kmalloc_objs conversion
 script
In-Reply-To: <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
Message-ID: <c47392bc-e522-19b6-a653-1e85b44cefba@inria.fr>
References: <9b55b3e3269ef43ede64fff34f42121f7aa47979.camel@perches.com> <1a6026c4-3e19-a1a9-e637-f1842172482b@inria.fr> <E7A57F75-AB90-4B41-B942-55D65F2B65D8@kernel.org>
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

>
>
> On November 1, 2026 3:51:53 PM PST, Julia Lawall <julia.lawall@inria.fr> wrote:
> >
> >
> >On Sun, 1 Nov 2026, Joe Perches wrote:
> >
> >> Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
> >> with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")
> >>
> >> Finds and converts sized devm_kmalloc-family of allocations into the typed
> >> devm_kmalloc_obj-family of allocations.
> >
> >Applied
>
> Please don't send this. I already did this. See the PR I sent for rc1:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-linus/v7.4-rc1/devm_kmalloc_obj

Too late.

julia

>
>
> --
> Kees Cook
>
