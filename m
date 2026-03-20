Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF0E3AA503;
	Fri, 20 Mar 2026 15:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022395; cv=none; b=i1BRTBM6w7TZf+WaqKh6k7iJX6Qogw/nd7tWlXeUTGQUJ0aKFehUHliMZJHDeud4bFfNoC9YimDUETca7UiPDIivts47UdAm8RCXFX3SGo+vUXgNTXFW3ukO8c+keHR/LDtLkTdeTSbNou30jJWnB4zqidK/fzdbndprlID6Zik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022395; c=relaxed/simple;
	bh=1asyGFrmRz/KHe+AZl8nzb30BiMfy/e4iQtqX8k/2Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIr0M4o80tug390nSPvlsnARyufHQ2QzOsyKhDxxFTv5CU9GAzG05w3QQQPWjP+X10xjOoK1lAwcYueM9arobx1O78OcGPuE/yejVLzRyugTeenIEl2tEh4nsXFfRMnBHKaIL80NmvVDQo6ywjApImrnND/llFaF4S96wm0hIJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0U+qp+Sc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0U+qp+Sc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E81C4CEF7;
	Fri, 20 Mar 2026 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774022394;
	bh=1asyGFrmRz/KHe+AZl8nzb30BiMfy/e4iQtqX8k/2Z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0U+qp+ScT6oIbWeKfHf6N/BZRhewHx09AyoQz5lxMRNEyzNCKyVBmhFbqhzIzi3xW
	 GR2y3CAEgh6SE8v/8s4gacwsPNkSh/WJyRPXkoREzq2q3/vIHfmjYE8m7kILhvDJcH
	 C87iHKwYhUWx5S2Kw2J5rX/WORdG9Tgk7idisXtI=
Date: Fri, 20 Mar 2026 16:59:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] firmware_loader: add search= module option for
 multi-path firmware lookup
Message-ID: <2026032019-reckless-grain-4eaa@gregkh>
References: <20260320-fw-path-v4-1-7547e2f0dc64@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-fw-path-v4-1-7547e2f0dc64@kernel.org>

On Fri, Mar 20, 2026 at 11:32:29AM -0400, Jeff Layton wrote:
> Refactor fw_get_filesystem_firmware() by extracting the per-path
> firmware loading logic into a new fw_try_firmware_path() helper.
> 
> Add a new firmware_class.search= module option that accepts a
> ':'-separated list of firmware search directories. The firmware
> lookup order is:
> 
>   1. firmware_class.path= (single legacy path)
>   2. firmware_class.search= (colon-separated paths)
>   3. Built-in default paths (/lib/firmware/updates/..., /lib/firmware)
> 
> A backslash can be used as an escape character, allowing a literal
> ':' ('\:') or literal '\' ('\\') to be embedded in a pathname.
> 
> Example:
> 
>   firmware_class.search=/custom/path1:/custom/path2
> 
> Suggested-by: Michal Grzedzicki <mge@meta.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> This version adds a new module option called "search=" to specify an
> (escapable) search path. The search= path is tried after the original
> (unescaped) path= string, but before the hardcoded search path.
> ---
> Changes in v4:
> - Move search path to new search= option that is tried after path=
> - Link to v3: https://lore.kernel.org/r/20260318-fw-path-v3-1-a701a08bc025@kernel.org
> 
> Changes in v3:
> - Allow '\' to escape a literal ':' or '\' in the string
> - Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91eb4@kernel.org
> 
> Changes in v2:
> - switch to using ':' as path delimiter
> - Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org
> ---
>  drivers/base/firmware_loader/main.c | 224 ++++++++++++++++++++++++------------
>  1 file changed, 150 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
> index a11b30dda23be563bd55f25474ceff2153ddd667..0f58d996d3807a1f57dc924adbe657360fdfac1e 100644
> --- a/drivers/base/firmware_loader/main.c
> +++ b/drivers/base/firmware_loader/main.c
> @@ -469,8 +469,8 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
>  
>  /* direct firmware loading support */
>  static char fw_path_para[256];
> +static char fw_search_para[256];
>  static const char * const fw_path[] = {
> -	fw_path_para,
>  	"/lib/firmware/updates/" UTS_RELEASE,
>  	"/lib/firmware/updates",
>  	"/lib/firmware/" UTS_RELEASE,
> @@ -485,6 +485,82 @@ static const char * const fw_path[] = {
>  module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
>  MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path");

Change this to say "single directory location" or something like that?

>  
> +module_param_string(search, fw_search_para, sizeof(fw_search_para), 0644);

"search_path"?

Or "path_search"?

Naming is hard :(

> +MODULE_PARM_DESC(search, "colon-separated list of firmware search paths, tried after path= (use '\\:' for literal ':', '\\\\' for literal '\\')");
> +
> +static int
> +fw_try_firmware_path(struct device *device, struct fw_priv *fw_priv,
> +		     const char *suffix,
> +		     int (*decompress)(struct device *dev,
> +				       struct fw_priv *fw_priv,
> +				       size_t in_size,
> +				       const void *in_buffer),
> +		     const char *dir, int dirlen,
> +		     char *path, void **bufp, size_t msize)
> +{
> +	size_t file_size = 0;
> +	size_t *file_size_ptr = NULL;
> +	size_t size;
> +	int len, rc;
> +
> +	len = snprintf(path, PATH_MAX, "%.*s/%s%s",
> +		       dirlen, dir, fw_priv->fw_name, suffix);
> +	if (len >= PATH_MAX)
> +		return -ENAMETOOLONG;
> +
> +	fw_priv->size = 0;
> +
> +	/*
> +	 * The total file size is only examined when doing a partial
> +	 * read; the "full read" case needs to fail if the whole
> +	 * firmware was not completely loaded.
> +	 */
> +	if ((fw_priv->opt_flags & FW_OPT_PARTIAL) && *bufp)
> +		file_size_ptr = &file_size;
> +
> +	/* load firmware files from the mount namespace of init */
> +	rc = kernel_read_file_from_path_initns(path, fw_priv->offset,
> +					       bufp, msize,
> +					       file_size_ptr,
> +					       READING_FIRMWARE);
> +	if (rc < 0) {
> +		if (!(fw_priv->opt_flags & FW_OPT_NO_WARN)) {
> +			if (rc != -ENOENT)
> +				dev_warn(device,
> +					 "loading %s failed with error %d\n",
> +					 path, rc);
> +			else
> +				dev_dbg(device,
> +					"loading %s failed for no such file or directory.\n",
> +					path);
> +		}
> +		return rc;
> +	}
> +	size = rc;
> +
> +	dev_dbg(device, "Loading firmware from %s\n", path);
> +	if (decompress) {
> +		dev_dbg(device, "f/w decompressing %s\n",
> +			fw_priv->fw_name);
> +		rc = decompress(device, fw_priv, size, *bufp);
> +		/* discard the superfluous original content */
> +		vfree(*bufp);
> +		*bufp = NULL;
> +		if (rc) {
> +			fw_free_paged_buf(fw_priv);
> +			return rc;
> +		}
> +	} else {
> +		dev_dbg(device, "direct-loading %s\n",
> +			fw_priv->fw_name);
> +		if (!fw_priv->data)
> +			fw_priv->data = *bufp;
> +		fw_priv->size = size;
> +	}
> +	fw_state_done(fw_priv);
> +	return 0;
> +}
> +
>  static int
>  fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
>  			   const char *suffix,
> @@ -493,10 +569,9 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
>  					     size_t in_size,
>  					     const void *in_buffer))
>  {
> -	size_t size;
> -	int i, len, maxlen = 0;
> +	int i;
>  	int rc = -ENOENT;
> -	char *path, *nt = NULL;
> +	char *path;
>  	size_t msize = INT_MAX;
>  	void *buffer = NULL;
>  
> @@ -511,83 +586,84 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
>  		return -ENOMEM;
>  
>  	wait_for_initramfs();
> -	for (i = 0; i < ARRAY_SIZE(fw_path); i++) {
> -		size_t file_size = 0;
> -		size_t *file_size_ptr = NULL;
> -
> -		/* skip the unset customized path */
> -		if (!fw_path[i][0])
> -			continue;
> -
> -		/* strip off \n from customized path */
> -		maxlen = strlen(fw_path[i]);
> -		if (i == 0) {
> -			nt = strchr(fw_path[i], '\n');
> -			if (nt)
> -				maxlen = nt - fw_path[i];
> -		}
>  
> -		len = snprintf(path, PATH_MAX, "%.*s/%s%s",
> -			       maxlen, fw_path[i],
> -			       fw_priv->fw_name, suffix);
> -		if (len >= PATH_MAX) {
> -			rc = -ENAMETOOLONG;
> -			break;
> -		}
> +	/* Try the single customized path first */
> +	if (fw_path_para[0]) {
> +		int dirlen = strlen(fw_path_para);
>  
> -		fw_priv->size = 0;
> +		/* strip trailing newline */
> +		if (fw_path_para[dirlen - 1] == '\n')
> +			dirlen--;

Why don't we just do all the "parsing" and stripping at startup (and
when a new option is written), so we don't have to do it each and every
time we search for a firmware image?  That would put all of the
"cleanup" logic in one place and reduce the churn a bit.

Yes, it would require another local variable, but that should be fine.

thanks,

greg k-h
