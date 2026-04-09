Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35F5221F39;
	Thu,  9 Apr 2026 05:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775713194; cv=none; b=m49VxQl4WGCaTBbBVYTlw0kPt4V4GGwrTRgsGnMyiXKSxsOxo90dg7tWK+f50Q99EbzqAkgQTYXN962KDkQDaTGHG1cKPEvl5ydxOffvZcXUOV8qtsQWS213cmzX/HSndsTFedn5ydHnbhwohvvIuAKbiosz6moqSR0w/MLyPCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775713194; c=relaxed/simple;
	bh=15k1mY1CdMYt0Snf9eN9zSLTq5/iOC4gIpH3L2tMMDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qomFEAl0pSgywDemiRPkRJ6NLzbyxLp0iTY79yEr6YRIsicyMQjZL1M5pw4yifqoU0bV9rtOvNtzitucxe+YoS23Uxw4VPoQTKH0raTJyVmi83k/7V/FeAYXxtf7rN0w3mm1DkNrXZAOeMrRY7jwTNMLtEXqbp/Jq+araeAJhZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ik6vV2cW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ik6vV2cW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C45FC2BC9E;
	Thu,  9 Apr 2026 05:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775713193;
	bh=15k1mY1CdMYt0Snf9eN9zSLTq5/iOC4gIpH3L2tMMDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ik6vV2cWROJ7Q9mjwoLbw7WkhFKWDBVHMBcRNvcy7veQNN1wmqZeP4a6fl2QxFH/u
	 D7IgeC6ePalbvLjJT2jm4jD+YW0DTDFT4+3/KGfZtKQTR5m/0bWwTD2pmHA4zm3fvV
	 rOVt9zI28xcYZpIDLOiCfjphtNBxoyhyIlSNPpN8=
Date: Thu, 9 Apr 2026 07:39:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zxyan Zhu <zxyan0222@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2] regmap: debugfs: fix race condition in dummy name
 allocation
Message-ID: <2026040913-myth-skimming-3df2@gregkh>
References: <2026040834-runaround-glass-8ea6@gregkh>
 <20260409035015.950764-1-zxyan0222@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409035015.950764-1-zxyan0222@gmail.com>

On Thu, Apr 09, 2026 at 11:50:15AM +0800, Zxyan Zhu wrote:
> Use IDA instead of a simple counter for generating unique dummy names.
> The previous implementation used dummy_index++ which is not atomic,
> leading to potential duplicate names when multiple threads call
> regmap_debugfs_init() concurrently with name="dummy".
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> ---
>  drivers/base/regmap/internal.h       |  1 +
>  drivers/base/regmap/regmap-debugfs.c | 21 ++++++++++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
> index 5bf993165438..e067890866c1 100644
> --- a/drivers/base/regmap/internal.h
> +++ b/drivers/base/regmap/internal.h
> @@ -84,6 +84,7 @@ struct regmap {
>  	bool debugfs_disable;
>  	struct dentry *debugfs;
>  	const char *debugfs_name;
> +	int debugfs_dummy_id;
>  
>  	unsigned int debugfs_reg_len;
>  	unsigned int debugfs_val_len;
> diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
> index 5a46ce5fee72..18f1c60749fe 100644
> --- a/drivers/base/regmap/regmap-debugfs.c
> +++ b/drivers/base/regmap/regmap-debugfs.c
> @@ -12,6 +12,7 @@
>  #include <linux/uaccess.h>
>  #include <linux/device.h>
>  #include <linux/list.h>
> +#include <linux/idr.h>
>  
>  #include "internal.h"
>  
> @@ -20,7 +21,7 @@ struct regmap_debugfs_node {
>  	struct list_head link;
>  };
>  
> -static unsigned int dummy_index;
> +static DEFINE_IDA(dummy_ida);
>  static struct dentry *regmap_debugfs_root;
>  static LIST_HEAD(regmap_debugfs_early_list);
>  static DEFINE_MUTEX(regmap_debugfs_early_lock);
> @@ -539,6 +540,7 @@ void regmap_debugfs_init(struct regmap *map)
>  	struct regmap_range_node *range_node;
>  	const char *devname = "dummy";
>  	const char *name = map->name;
> +	int id;
>  
>  	/*
>  	 * Userspace can initiate reads from the hardware over debugfs.
> @@ -567,6 +569,7 @@ void regmap_debugfs_init(struct regmap *map)
>  
>  	INIT_LIST_HEAD(&map->debugfs_off_cache);
>  	mutex_init(&map->cache_lock);
> +	map->debugfs_dummy_id = -1;
>  
>  	if (map->dev)
>  		devname = dev_name(map->dev);
> @@ -585,12 +588,16 @@ void regmap_debugfs_init(struct regmap *map)
>  
>  	if (!strcmp(name, "dummy")) {
>  		kfree(map->debugfs_name);
> -		map->debugfs_name = kasprintf(GFP_KERNEL, "dummy%d",
> -						dummy_index);
> -		if (!map->debugfs_name)
> +		id = ida_alloc(&dummy_ida, GFP_KERNEL);
> +		if (id < 0)
>  			return;
> +		map->debugfs_name = kasprintf(GFP_KERNEL, "dummy%d", id);
> +		if (!map->debugfs_name) {
> +			ida_free(&dummy_ida, id);
> +			return;
> +		}
> +		map->debugfs_dummy_id = id;
>  		name = map->debugfs_name;
> -		dummy_index++;
>  	}
>  
>  	map->debugfs = debugfs_create_dir(name, regmap_debugfs_root);
> @@ -660,6 +667,10 @@ void regmap_debugfs_exit(struct regmap *map)
>  		mutex_lock(&map->cache_lock);
>  		regmap_debugfs_free_dump_cache(map);
>  		mutex_unlock(&map->cache_lock);
> +		if (map->debugfs_dummy_id >= 0) {
> +			ida_free(&dummy_ida, map->debugfs_dummy_id);
> +			map->debugfs_dummy_id = -1;
> +		}
>  		kfree(map->debugfs_name);
>  		map->debugfs_name = NULL;
>  	} else {
> -- 
> 2.34.1
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

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
