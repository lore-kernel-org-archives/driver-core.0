Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42EF34040A
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322025; cv=none; b=e2aAmfVXte9/kRRfpbZox8JikRmx9QX3QCcnuoa3+BlKU12iO6cSK//haG9M+gtppadJmsLSb1VtQV0u4LOyK239fpQL1GB60VJ5EmqzIXNAkC6XO8XQNLjg+WSjMIhrJ/IV7cRWA5o4jOIg+DJmV7XwPKgDOTVGn2rjr9G1skA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322025; c=relaxed/simple;
	bh=qZJcxGigDUOPGbBTLkuze4EzK6jpwi+WxK0gp/RJ8Q8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=a2FRWjwN6VBGY4GvxlvHAOcdNSIu/gWrzgv/Oj/uw5LBF7JQhbyC1aHtbfq8APTf5//1PU4KhnizskyTBqYBIJ7DRax07zCQdsnYuO6ByXXE/4VjyU9/qdhSjLKmgjkWePU80g/4e3bDopZ+3rKPtAV5jIorlPr9MaHB/JS80xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=m2EWMnRT; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="m2EWMnRT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jRYcjXWetLM2iI5Bj0lMnHKhPtsWHztUHyuM98LC3DE=;
  b=m2EWMnRTnELbmoMM4Rz+jamrC7VJ3dPeYiLJLxz+9cxe5ioJoZ7o5VAS
   LK3kMfAY7Z23hRAswKOw/hzBuL6YMg714oyOWlCJBS82ieLge0GHPrezV
   Cb/qs686Sojmr7CHq8dRIMUpdXwq2uVwaPsojzKa6CxNJ7JzIdGHL9U93
   U=;
X-CSE-ConnectionGUID: wfoyA//uRqOVzVv3S49qRg==
X-CSE-MsgGUID: 4KNeUs82SdOyxJQf12Zqdg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.24,222,1774306800"; 
   d="scan'208";a="283248040"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 19:25:51 +0200
Date: Wed, 24 Jun 2026 19:25:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Joe Perches <joe@perches.com>
cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
    Kees Cook <kees@kernel.org>, driver-core@lists.linux.dev, 
    Nicolas Palix <nicolas.palix@imag.fr>, cocci@inria.fr
Subject: Re: [PATCH] coccinelle: Add devm_kmalloc_objs conversion script
In-Reply-To: <50755b746bb30bea3989db9c1f262d5257e8ee1e.camel@perches.com>
Message-ID: <dc6cfcc-4ec4-8b87-19c3-974818448b8c@inria.fr>
References: <eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com> <50755b746bb30bea3989db9c1f262d5257e8ee1e.camel@perches.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 24 Jun 2026, Joe Perches wrote:

> On Mon, 2026-06-15 at 19:10 -0700, Joe Perches wrote:
> > Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion script")
> > with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GFP_KERNEL arg")
> >
> > Finds and converts sized devm_kmalloc-family of allocations into the typed
> > devm_kmalloc_obj-family of allocations.
>
> Its been a bit.
> Any comments or negatives about using or running this script?
>
> This script would change more than 8000 instances in more than
> 5000 files in Linus' current master.

I was going to try it this evening.  Are you concerned that it is too
much?

julia

>
> $ spatch -D patch --very-quiet --cocci-file ./scripts/coccinelle/api/devm_kmalloc_objs.cocci \
>     --include-headers-for-types --all-includes --include-headers --keep-comments \
>     -I ./arch/x86/include -I ./arch/x86/include/generated -I ./include \
>     -I ./arch/x86/include/uapi -I ./arch/x86/include/generated/uapi -I ./include/uapi \
>     -I ./include/generated/uapi --include ./include/linux/compiler-version.h \
>     --include ./include/linux/kconfig.h .
>
