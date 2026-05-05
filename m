Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F80291864;
	Tue,  5 May 2026 08:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970150; cv=none; b=O0XPKhswlpujXi+vdG+U1U2e0kiE+octZzvxSSBBv0//HjsFNWbIEgSQIlhTMnqljVAPmyPaoT9zqAEQ4Aw97jd6zy1llyrsE5mdjiICpBS+Ov2D6A/kwztDGp5MxSrxEeqeR7eKvgkrfJFUp9KE9ytLlacaQaEkbJ/r+Uf/Geo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970150; c=relaxed/simple;
	bh=Xts0Z1r60CKxZ8mbKfvZWnWacsXLctnn3iJWJlPEtLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s10p5zpI8x2kCEYxf+apsD6tabv5DHcKNTryrx/w8vXsvPTc/CmQyWlAv/8Pt7IJuz5DRygqU7WyINPnDjKjXAUOY+nbZwTXQ2z74sjViiK+JDUft+r6auEFVXrPsGw7qqZ/WtiTv+z/xLq/9YOIMCK+2GVI+4jXoukgs53KI2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TdWu/BDB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TdWu/BDB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C7DC2BCB4;
	Tue,  5 May 2026 08:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777970149;
	bh=Xts0Z1r60CKxZ8mbKfvZWnWacsXLctnn3iJWJlPEtLE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdWu/BDBHsuG7AeQkhX/ew4hzmRQJnioEP+OA3nJyJDeYl9h3bZvYjQt9L+f6DfLE
	 3/Aelt+cWFsLeq9tXolQlkc2QGE0b+PW7ZprFr7sMdly7233nXHAJbCgVzeZZpYVZt
	 hyUFnjC6mcWXQdHfO/7KO/kXUZgt1eYN+rgmG/5w=
Date: Tue, 5 May 2026 10:35:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: driver-core@lists.linux.dev, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cacheinfo: move cache_setup_acpi to header
Message-ID: <2026050528-outclass-shamrock-aad7@gregkh>
References: <20260505075936.183004-1-rosenp@gmail.com>
 <2026050538-commotion-rebuild-6616@gregkh>
 <CAKxU2N_Nd0JB_+5Qpg+oYT2i-s-tJy939xyt1esdvwKJprdUvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_Nd0JB_+5Qpg+oYT2i-s-tJy939xyt1esdvwKJprdUvQ@mail.gmail.com>

On Tue, May 05, 2026 at 01:08:04AM -0700, Rosen Penev wrote:
> On Tue, May 5, 2026 at 1:04 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, May 05, 2026 at 12:59:36AM -0700, Rosen Penev wrote:
> > > cacheinfo.h already has handling for acpi_get_cache_info to be a static
> > > inline ENOTSUPP function. Move it there as both functions are in the
> > > same boat.
> > >
> > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > ---
> > >  drivers/base/cacheinfo.c  | 5 -----
> > >  include/linux/cacheinfo.h | 8 +++++++-
> > >  2 files changed, 7 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> > > index 391ac5e3d2f5..ca7f266729d1 100644
> > > --- a/drivers/base/cacheinfo.c
> > > +++ b/drivers/base/cacheinfo.c
> > > @@ -366,11 +366,6 @@ static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
> > >  int init_of_cache_level(unsigned int cpu) { return 0; }
> > >  #endif
> > >
> > > -int __weak cache_setup_acpi(unsigned int cpu)
> > > -{
> > > -     return -ENOTSUPP;
> > > -}
> > > -
> > >  unsigned int coherency_max_size;
> > >
> > >  static int cache_setup_properties(unsigned int cpu)
> > > diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> > > index c8f4f0a0b874..73ab4a6e3551 100644
> > > --- a/include/linux/cacheinfo.h
> > > +++ b/include/linux/cacheinfo.h
> > > @@ -86,7 +86,6 @@ int early_cache_level(unsigned int cpu);
> > >  int init_cache_level(unsigned int cpu);
> > >  int init_of_cache_level(unsigned int cpu);
> > >  int populate_cache_leaves(unsigned int cpu);
> > > -int cache_setup_acpi(unsigned int cpu);
> > >  bool last_level_cache_is_valid(unsigned int cpu);
> > >  bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
> > >  int fetch_cache_info(unsigned int cpu);
> > > @@ -106,7 +105,14 @@ int acpi_get_cache_info(unsigned int cpu,
> > >  {
> > >       return -ENOENT;
> > >  }
> > > +
> > > +static inline
> > > +int cache_setup_acpi(unsigned int cpu) {
> > > +     return -ENOTSUPP;
> > > +};
> > > +
> > >  #else
> > > +int cache_setup_acpi(unsigned int cpu);
> > >  int acpi_get_cache_info(unsigned int cpu,
> > >                       unsigned int *levels, unsigned int *split_levels);
> > >  #endif
> > > --
> > > 2.54.0
> > >
> > >
> >
> > Didn't checkpatch complain about this change?
> Hrm looks like it. I just matched the style of surrounding code.

Nope, look at the style of the inline function just above the one you
added.  You used a totally different (i.e. not kernel) style.

> Not sure about this though:
> WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

That's not the issue here.

> > And why get rid of the weak symbol, this should break some arch builds,
> > right?
> The contrary. Fixes compilation with
> 
> make LLVM=1 ARCH=mips

So what commit caused this to break?  Is this a new issue or something
that has always been present?

thanks,

greg k-h
