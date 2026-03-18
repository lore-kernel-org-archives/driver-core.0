Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6346E1A9F91;
	Wed, 18 Mar 2026 12:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837605; cv=none; b=jHnB/xd+2n7OT984Wf+UrTvjmiUShnE6hVCWXpEcpiSWa1cN9WGIMyhhR3q1wjBM4yN114PE/SulSX5DMH+h7atV8lYWg6EGL035kFTEtAtTKILi8yajC0sJ2knmirkHAtC7Lq8cIa7I64NPzPUZAlk08MO5iyjlXb2iaAQBZ0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837605; c=relaxed/simple;
	bh=SVWln7Ip8WQuBSeaerS5VOIFLHleT0I6ZrXC5Wtc370=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bT0+Hx09N/GhL9W4WShxv+lE5aU8ctAM9C55e2RNz5nVru1Mq3O8Bskjy5jsuWpJ+HEBYN2EL80FteNNVJiY8Uz3uyXjqUPqDlgWdzJRRHy1zx5RDikot5eGT8/EDK2pP+XXhBqSKB3WvCfb5RcZ31+R1opjCJRIlsM915xMM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XOgCCuWu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XOgCCuWu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B34C19421;
	Wed, 18 Mar 2026 12:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773837605;
	bh=SVWln7Ip8WQuBSeaerS5VOIFLHleT0I6ZrXC5Wtc370=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOgCCuWudAgimqrVNl9nkC6bhZONJKrJza1civaL9kTXSEdJ7fbMy+11zJzY/UFoi
	 2DbuPLrFA75PH9OPcUIDuO0jsH4zWQlCqCXCiGtiv+FbRtvTEBf14xwExu1/f+MP51
	 FdyywQwkE7YR5rwmCIZG/d/PoPEPCAYlS4jsqn8c=
Date: Wed, 18 Mar 2026 13:40:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: allow firmware_class.path to take
 multiple paths
Message-ID: <2026031838-wieldable-enlisted-5398@gregkh>
References: <20260318-fw-path-v1-1-7884d9bf618f@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-fw-path-v1-1-7884d9bf618f@kernel.org>

On Wed, Mar 18, 2026 at 08:25:54AM -0400, Jeff Layton wrote:
> Refactor fw_get_filesystem_firmware() by extracting the per-path
> firmware loading logic into a new fw_try_firmware_path() helper.
> 
> Use this helper to parse fw_path_para for ';'-separated paths,
> trying each one before falling through to the default firmware
> search paths. This allows users to specify multiple custom firmware
> directories via firmware_class.path, e.g.:
> 
>   firmware_class.path=/custom/path1;/custom/path2
> 
> Suggested-by: Michal Grzedzicki <mge@meta.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
> This is something Michal had asked for last year, and I just got around
> to implementing. Tested with a dummy module that calls
> request_firmware().
> ---
>  drivers/base/firmware_loader/main.c | 197 +++++++++++++++++++++---------------
>  1 file changed, 118 insertions(+), 79 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
> index a11b30dda23be563bd55f25474ceff2153ddd667..5328d28a2141e85265e1bcc20e995ce4c5517c36 100644
> --- a/drivers/base/firmware_loader/main.c
> +++ b/drivers/base/firmware_loader/main.c
> @@ -470,7 +470,6 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
>  /* direct firmware loading support */
>  static char fw_path_para[256];
>  static const char * const fw_path[] = {
> -	fw_path_para,
>  	"/lib/firmware/updates/" UTS_RELEASE,
>  	"/lib/firmware/updates",
>  	"/lib/firmware/" UTS_RELEASE,
> @@ -480,10 +479,83 @@ static const char * const fw_path[] = {
>  /*
>   * Typical usage is that passing 'firmware_class.path=$CUSTOMIZED_PATH'
>   * from kernel command line because firmware_class is generally built in
> - * kernel instead of module.
> + * kernel instead of module. Multiple paths can be separated by ';'.
>   */
>  module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
> -MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path");
> +MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path, multiple paths can be separated by ';'");

Ah, you documented it here, sorry, I missed that.

But still, why ';'?

greg k-h
