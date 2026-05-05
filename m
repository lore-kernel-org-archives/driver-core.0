Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391433D5642;
	Tue,  5 May 2026 08:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777968255; cv=none; b=PdQh0jzE8SrRn0GkOgyDw+KJp5ck/XbjEiH2zzp8HZIpRxja1AU1hotE38TwF3/5nzuy6hcpP2pnlCtMTtTpFarmx9uTdVftxH23nARd0KROqvbzxuTTqkF3/7wM8vImHLGq066cvuNa7qeIb1+nfAFL762RcfOGdajnhqxIMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777968255; c=relaxed/simple;
	bh=SksVGf36DFALgxX37sZV/mSD0edccXoLGL4mEaZvMWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIZ1SmFQtjw9HNyU4jrAfygOS9/pUDNBxc4XxKpSD/VmlGtjPJbo8QNpQAHjStfakmfh1uM91jcPhetj4YtLytAtfEJJUrB/hI9pkfg4A8Ict9wHQHz+W8yEO6t5qArreYAwV4FfvA2lLjK3ECER01DNoZO8PrRqyUAhOYR1mLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Gr3YFlmp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Gr3YFlmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B82BC2BCB4;
	Tue,  5 May 2026 08:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777968254;
	bh=SksVGf36DFALgxX37sZV/mSD0edccXoLGL4mEaZvMWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gr3YFlmpQFMJsN8e3jPq5/h4tYj2Jd6SDLQNXtF2k0h/gLjFm8YAl8YuyMUxNbzOB
	 dIzx+U/wNQY1tV5/T/Gu0oReqEHnRnCAqQTGCitJDFJokuHhGC3xcVGZeQxZqs8p1z
	 fkNZTwTfP2m35A6SFlIwFLUXZ167mCSg4NpOMTeo=
Date: Tue, 5 May 2026 10:04:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: driver-core@lists.linux.dev, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] cacheinfo: move cache_setup_acpi to header
Message-ID: <2026050538-commotion-rebuild-6616@gregkh>
References: <20260505075936.183004-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505075936.183004-1-rosenp@gmail.com>

On Tue, May 05, 2026 at 12:59:36AM -0700, Rosen Penev wrote:
> cacheinfo.h already has handling for acpi_get_cache_info to be a static
> inline ENOTSUPP function. Move it there as both functions are in the
> same boat.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/base/cacheinfo.c  | 5 -----
>  include/linux/cacheinfo.h | 8 +++++++-
>  2 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 391ac5e3d2f5..ca7f266729d1 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -366,11 +366,6 @@ static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
>  int init_of_cache_level(unsigned int cpu) { return 0; }
>  #endif
>  
> -int __weak cache_setup_acpi(unsigned int cpu)
> -{
> -	return -ENOTSUPP;
> -}
> -
>  unsigned int coherency_max_size;
>  
>  static int cache_setup_properties(unsigned int cpu)
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index c8f4f0a0b874..73ab4a6e3551 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -86,7 +86,6 @@ int early_cache_level(unsigned int cpu);
>  int init_cache_level(unsigned int cpu);
>  int init_of_cache_level(unsigned int cpu);
>  int populate_cache_leaves(unsigned int cpu);
> -int cache_setup_acpi(unsigned int cpu);
>  bool last_level_cache_is_valid(unsigned int cpu);
>  bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
>  int fetch_cache_info(unsigned int cpu);
> @@ -106,7 +105,14 @@ int acpi_get_cache_info(unsigned int cpu,
>  {
>  	return -ENOENT;
>  }
> +
> +static inline
> +int cache_setup_acpi(unsigned int cpu) {
> +	return -ENOTSUPP;
> +};
> +
>  #else
> +int cache_setup_acpi(unsigned int cpu);
>  int acpi_get_cache_info(unsigned int cpu,
>  			unsigned int *levels, unsigned int *split_levels);
>  #endif
> -- 
> 2.54.0
> 
> 

Didn't checkpatch complain about this change?

And why get rid of the weak symbol, this should break some arch builds,
right?

thanks,

greg k-h
