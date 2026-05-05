Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE283B38A1
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 08:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968499; cv=pass; b=DNXTuj9gP9xLMjPivCfMh75uG9i5TaljDsXh31dnKz0SaekyUbxeq+z1/3VIUx6252L0xXqRLayS9WQWh34y5O2JvqRIRJ0ijCVSdEVqAyPFRiwTo3CBAAT6blpnVrKkfqqogLYt+TDqOpqZSggR3EfxxQs5gBuXeIkNd6dkz+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968499; c=relaxed/simple;
	bh=PSathLH5BIDvufaCGAkFK486qq9K0LEMc1yrWIYH/cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G91vICwkhToHZj/AIUohigQtfEfA8vuu8BAnIuCFa+TL4R1E/bSMbB64I1Tp9kQ8VlJYdOUPWzk6dkxDdiMIwx9JWnJcfTTJLNCtZLrFthip1vyEIHx6vi1QsDlFuPQ2/9y5qyTsv/EsqubrOtHauANE+bvjjUePzdZ9JetQJcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phxeTz2/; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phxeTz2/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a1307438ddso5132417e87.1
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 01:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777968496; cv=none;
        d=google.com; s=arc-20240605;
        b=PnYxLTqCI5CXgp8ILPn433ohUPnm3uTU4UsyBIIOJcub5gzG1XXiBrsGGdct19z9dI
         oC6PvdFFZHE5zP2IL+Gqz9LMavQRZIrmgL7OUqB8ocmpnyUnZnMJ9135LeF0VdC/xjeO
         zhLtQGfPJMLk9NYzoJdobAXEpNu/dpJC7ZIuZnasYAMjU7oYTS955gDvxaR1I0HEE6KG
         5mU+9BMjslbG0MI5Z+JIgRwBtbc9aMrQmVsWUAaReyLtIA6dDrV6f5KfkqGM9enHNtIQ
         SWIkUUNduhiv++5I6nkzmgYwaBxt9lAB5hJSaffCvfE3IVGbtYXCO2vY5RMr842Ghelc
         lKaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XVVGDnJSSkRy14F9milyXphIQ1tXCwoyXeZ9eE+GHPM=;
        fh=3AehU/kH0571MmYmocM6QCgiXH9PYDiO9loM/OF33Os=;
        b=joOoARynpPbGbGrROHYzg97NGXpxFFldHiUSJX7tOPz0+fublI8Lr03fIXxXQIDOXw
         rbuvw88KX9EIoox0UhbmVqzO5ayIHFb1QZeMhb96btnQT8I4kD8/6zjNe01GKq/nEBKh
         xoSVcP47LS+VMzExvsQxVRglZykXd0JoA13UddaL7GxYwjtaTIfvKR29wQFzsMH500CG
         MDC/zH3y3ZntUtfBday6pWr8QvQQRgmIeMUZwJwi+awmVBSn+JoZj6Td8dXVogyXjwV+
         AzeDvu4FiePNukInx4K4fYfru5NbIg/9Q7fhJSs7SehAgx22A7rW9EqnzQxDO1AihDhx
         xOQA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777968496; x=1778573296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVVGDnJSSkRy14F9milyXphIQ1tXCwoyXeZ9eE+GHPM=;
        b=phxeTz2/AjQgODybDPC4pHHSM2/cD1XoEZNn0vPoImfIEPbi8J6hjEOdp5Ddvqofbe
         Ucdlle7Y37vLfCPJ/33EIBeeX2L8rWRDVqLRv1nK0hQmEnxV1HzWaoSO9a1c9YBKfPF0
         pm3CFzRFG2Pwwf9tpHKwwv4dTWM9CzWRAJwngKWfqwn93MF/MEVmwXGqM7gU5JK0JBuf
         ptJE1/lTv614fcdub4ied0vBCDgwaV81UZx432oJNLO+m9gNRwDwHLXL66d/7yONQz93
         8c3dlpL9j0xKkFQMHuZs66F9H+bGx2i/ChlRbKco+QsSnj2dOg6lkYlyoLiYOBBR4o9a
         3eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777968496; x=1778573296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVVGDnJSSkRy14F9milyXphIQ1tXCwoyXeZ9eE+GHPM=;
        b=aNfw6mY4A62ln7Gi+/eoitg2jZ90sBb+gxTGys0W7I4hgkWAZA4+0ewKrHNbP2oZ2n
         mCyOCOpKbw1ACGN8p6Ry6SjLh6cy7eTDGogtzG4IEsozAaNX9Cwd8d0xjIM31m2Pf9Ua
         5QttF8xxmVuyEJgL4X13gyO6RVJcuvS9owU073HQltL0rUMWYpwUWxGudbBpcd2ZZOlu
         oDGKpx36exLxdadyB1qrZTuxvRhdtJgrKDU/04HekOPGX+3b3enNLCmxLzxU0S3lq6/r
         +lBaiBZg5VE93FEBlk5Lcn5SghslMGdDyZ8hi7cxFNuFl6rBWfxr3R2QfVMV14KfukpP
         7W8Q==
X-Gm-Message-State: AOJu0YxWMnNFZeq6lWUHkUMlv+x2y7DDe6/ngatjwFzMC/wn/8cjscDB
	yyPmeZ3HDp4E9HfR04P8jEN+ize5PUlobsMrGgIVsU/kQGsYWSAqL9aLkjaNaW02dtMjfDBXxZ3
	D2dFHuf7S7NzEKP9bQijCopzooCyq61A=
X-Gm-Gg: AeBDies4v7gL4EHPfQAXEh4n5EvXwSviRJEfAIien9lvjuqccuil/CsblzW/Kpr5n2E
	R1g7KYUEq4tnUOfvKsuWLYvGQD92e8XQ6dukYnoOWLXTlZ9/FsBHDBBG+dNdXbZ3Px3cWxpkIH8
	xpA48a/4NY67s3ukxy1D5i6Dcgl9OMP36tm2suIwcWo/bUULDqDKYTzbqo/IWQZzk8mpfYBxyFy
	yfkvCAUa19L3ZvphzAmwQ7mK12NyXmpHOMPoSIbTxuiv5FBfzAGDNDHKt8AMvTna4NqF6PF/36V
	0C8uTvpJx/7ksjN53lD7i/6ivLIrLdrdMjohBoajbO95xdjt1Qv050iNyL14ApSR/MDRCABB4Mk
	aPfJYIQuaHxFFUle5OsioSTqjEwg9JpHWcHvV48NRwdStGh2qKrU6ULZvn0h7UoKpRslwjMW+/k
	D3JCc=
X-Received: by 2002:a05:6512:110d:b0:5a8:6e50:b16a with SMTP id
 2adb3069b0e04-5a87f1f6a8cmr819808e87.34.1777968495953; Tue, 05 May 2026
 01:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260505075936.183004-1-rosenp@gmail.com> <2026050538-commotion-rebuild-6616@gregkh>
In-Reply-To: <2026050538-commotion-rebuild-6616@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 5 May 2026 01:08:04 -0700
X-Gm-Features: AVHnY4KjhMI3Uf1xD54jJl0GNZd8JKqVKLljrwQklM3N-Fhj2hPpfRDodtwvp3c
Message-ID: <CAKxU2N_Nd0JB_+5Qpg+oYT2i-s-tJy939xyt1esdvwKJprdUvQ@mail.gmail.com>
Subject: Re: [PATCH] cacheinfo: move cache_setup_acpi to header
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 1:04=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, May 05, 2026 at 12:59:36AM -0700, Rosen Penev wrote:
> > cacheinfo.h already has handling for acpi_get_cache_info to be a static
> > inline ENOTSUPP function. Move it there as both functions are in the
> > same boat.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/base/cacheinfo.c  | 5 -----
> >  include/linux/cacheinfo.h | 8 +++++++-
> >  2 files changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > index 391ac5e3d2f5..ca7f266729d1 100644
> > --- a/drivers/base/cacheinfo.c
> > +++ b/drivers/base/cacheinfo.c
> > @@ -366,11 +366,6 @@ static inline int cache_setup_of_node(unsigned int=
 cpu) { return 0; }
> >  int init_of_cache_level(unsigned int cpu) { return 0; }
> >  #endif
> >
> > -int __weak cache_setup_acpi(unsigned int cpu)
> > -{
> > -     return -ENOTSUPP;
> > -}
> > -
> >  unsigned int coherency_max_size;
> >
> >  static int cache_setup_properties(unsigned int cpu)
> > diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> > index c8f4f0a0b874..73ab4a6e3551 100644
> > --- a/include/linux/cacheinfo.h
> > +++ b/include/linux/cacheinfo.h
> > @@ -86,7 +86,6 @@ int early_cache_level(unsigned int cpu);
> >  int init_cache_level(unsigned int cpu);
> >  int init_of_cache_level(unsigned int cpu);
> >  int populate_cache_leaves(unsigned int cpu);
> > -int cache_setup_acpi(unsigned int cpu);
> >  bool last_level_cache_is_valid(unsigned int cpu);
> >  bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y=
);
> >  int fetch_cache_info(unsigned int cpu);
> > @@ -106,7 +105,14 @@ int acpi_get_cache_info(unsigned int cpu,
> >  {
> >       return -ENOENT;
> >  }
> > +
> > +static inline
> > +int cache_setup_acpi(unsigned int cpu) {
> > +     return -ENOTSUPP;
> > +};
> > +
> >  #else
> > +int cache_setup_acpi(unsigned int cpu);
> >  int acpi_get_cache_info(unsigned int cpu,
> >                       unsigned int *levels, unsigned int *split_levels)=
;
> >  #endif
> > --
> > 2.54.0
> >
> >
>
> Didn't checkpatch complain about this change?
Hrm looks like it. I just matched the style of surrounding code.

Not sure about this though:
WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP
>
> And why get rid of the weak symbol, this should break some arch builds,
> right?
The contrary. Fixes compilation with

make LLVM=3D1 ARCH=3Dmips
>
> thanks,
>
> greg k-h
