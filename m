Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D23DB304;
	Tue, 16 Jun 2026 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611686; cv=none; b=NEi+2aN2TPTFTkrhAyNx/m0oCLcSjviJBWLecrWj3o12Gs+x9+aFjUcktg/XqDU9Xb0tsMbbMt3ZruUq/ydi9B2zK7IU2Jau76TMWbOnOwovsz9bdYCXA2kZTzP3pKH2o7uhjE6hx8EicMWRkARgl9Dy14vEWL4Ym7uWYzZMHI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611686; c=relaxed/simple;
	bh=t3WZ4yLWTBPKazi5rRXD9y+mnoPva/e+VA/JA9QuZ+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cA3KSq1Vsyz1FduWcQAkAVG05vyMwAw557AWRSE7Y6BTZVqyTmS2oP9qpxjjlqYprzSxYv7lDR/DipAOLM/I+03HvF+0AFIGiVPSBe69BQposwFxuWN2htBDAVdPo60uU4ksk5ONU3VzeFE968LhjGH9M+igUyDAK1Gy3W7NlIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TVjRrdF+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TVjRrdF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939B71F000E9;
	Tue, 16 Jun 2026 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781611685;
	bh=6GlysBgGFSNtEMCp2cyt+VjnH/psDqA/RniYg9je53Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TVjRrdF+cNoOMX74vTim59pMObD7RFmjPRJIuQs8jxkwFEe8S1yLUaefL6ojoWfBG
	 ula22CereOqhCtjSettVBsbn+NFlajq4rQ8ubdUJI2pyl7GlN5x0N8vpB+owfSvl4A
	 zZitR4MFWLyk4LNt7u+iDp4cRMD0oATGDOx5diNI=
Date: Tue, 16 Jun 2026 17:24:19 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Francesco Lavra <flavra@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] regcache: Do not overwrite error code when finalizing
 cache after error
Message-ID: <2026061611-backspace-freeware-8fcf@gregkh>
References: <20260616114429.1852456-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616114429.1852456-1-flavra@baylibre.com>

On Tue, Jun 16, 2026 at 01:44:29PM +0200, Francesco Lavra wrote:
> During regcache initialization, if an error occurs in the
> cache_ops->populate callback, and if cache operations include an exit
> callback, the error code from populate() is overwritten with the return
> value from exit(). This hides the error condition from the caller of
> regcache_init(), and can cause NULL pointer dereferences when the regcache
> is later accessed.
> 
> Fixes: 94a3a95f0315 ("regcache: Add ->populate() callback to separate from ->init()")
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
>  drivers/base/regmap/regcache.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
> index 27616b05111c..aa8f2efed779 100644
> --- a/drivers/base/regmap/regcache.c
> +++ b/drivers/base/regmap/regcache.c
> @@ -245,7 +245,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
>  	if (map->cache_ops->exit) {
>  		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
>  		map->lock(map->lock_arg);
> -		ret = map->cache_ops->exit(map);
> +		map->cache_ops->exit(map);
>  		map->unlock(map->lock_arg);
>  	}
>  err_free_reg_defaults:
> -- 
> 2.39.5
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
