Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F133E2759;
	Wed, 20 May 2026 13:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282751; cv=none; b=GAyQkni9VSqsxkifKvB+iysyy07Q6cBjGXOhOvQBpkcVYdYNHnXmjcQZwPjIGfRC8gSEG0hF6qFzh+H0ToBN+ULWjDlPfRgOnS75RmOxj54Hw+qAo0rbsLfh9jGm/AVbKNJ/sWsix1504ZuUMFvw9x+bhp7WE8uDPEOmkhFen1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282751; c=relaxed/simple;
	bh=hPqKnT51uKXRp9pD1596/dw304pNoX8v0odEUgxhDrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYOqLcRAAW7usiSVYTGEBQhNAbqTK41RTmK03wd+F4w9cof7vUy7fOZexsGrDxYFVKLPOh6yJrgYtrBYGaCELfAbBFp77hCNF0lWTNdeC1KgarJW3TxSMzE0KD1ifrkz1LftiP/ez3kSw4qHY6OmjBj+WXyrFMChF/R9nx3kir0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YDYmW9Kj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YDYmW9Kj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F59F1F000E9;
	Wed, 20 May 2026 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779282745;
	bh=pZ+WctWvor/yPkCTrLq56BadNQ894/Y2YdwmNdo4P0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YDYmW9KjpJVc8WePayC7l+mWSYt+pl+0BIMPAG5gcnM79urWv2WcUhZnTmqRiHPsn
	 1FG5mtsCccO8UYF1Y9Zs7biwPMHLZgbe2+jozlBn8E5zr4AYMYVPTemLRdKtq7yZQ/
	 E3H9aV6UH0pgaDr0Rl7EUUy9skchCwuIEx9epbjY=
Date: Wed, 20 May 2026 15:12:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rajat Jain <rajatja@google.com>,
	stable <stable@kernel.org>
Subject: Re: [PATCH] sysfs: don't remove existing directory on update failure
Message-ID: <2026052018-caption-abdomen-b541@gregkh>
References: <2026052002-overexert-control-f130@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026052002-overexert-control-f130@gregkh>

On Wed, May 20, 2026 at 03:06:03PM +0200, Greg Kroah-Hartman wrote:
> When sysfs_update_group() is called for a named group and create_files()
> fails (e.g. -ENOMEM), internal_create_group() calls kernfs_remove(kn) on
> the group directory.  In the update path, kn was obtained via
> kernfs_find_and_get() and refers to a directory that already existed
> before this call.  Removing it silently destroys a sysfs group that the
> caller did not create.
> 
> Only remove the directory if we created it ourselves.  On update failure
> the directory remains as it is left empty by remove_files() inside
> create_files(), but can be repopulated by a retry.
> 
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Rajat Jain <rajatja@google.com>
> Fixes: c855cf2759d2 ("sysfs: Fix internal_create_group() for named group updates")
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  fs/sysfs/group.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index 182e54e575ee..4e1e4f18a166 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -188,7 +188,7 @@ static int internal_create_group(struct kobject *kobj, int update,
>  	kernfs_get(kn);
>  	error = create_files(kn, kobj, uid, gid, grp, update);
>  	if (error) {
> -		if (grp->name)
> +		if (grp->name && !update)
>  			kernfs_remove(kn);
>  	}
>  	kernfs_put(kn);
> -- 
> 2.54.0
> 

Ugh, sent this twice, sorry for the noise, only one matters :)
