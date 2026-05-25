Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916333E347;
	Mon, 25 May 2026 06:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688952; cv=none; b=OasZJANcAog1kHqQozJtGgLGvI00aqLECJzJZ+u+3gcOizmWzQSb4wmvBj18ljXz+qu7VCTG+GzhlwDT4DjBfIXM1ZSd9UBaQSOARSPzvo8a232idUDVF/b6Zs6meq12zYg0m94ywwGn5HSz5KU9fGYMwPxsfFfyvtshfm2Lrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688952; c=relaxed/simple;
	bh=3FrVPj1IEoA5ontWcN/gBOE1UEV1TAhE0A5nZP0l820=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFfWgiqNEWsum/dyPxMJz4TYGTGPRGzeKGSLKRmhkY3Sus3n7YNLBsuugMVWJdVfnbgnjjP7cQ861RL680TsB2dThxV50Fz282zKyYWk95camED+8PGwNtKqwuNgLlxaAyh/lF86sTxAPUaPQCE993NlchaxvwLo+4U8AguVaY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BsHxkcyx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BsHxkcyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B581F000E9;
	Mon, 25 May 2026 06:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779688951;
	bh=NlGSmNVzCxkSj6tIFbkDP44c6P8s9mb2vrwfMgDdkHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BsHxkcyxAAUQcYvsK7V1YdMWmWV+yauv931d9u05SClwSnhdT/Rsrcu4Z+Yw3+GUP
	 gWseOsOEXulwJ6Yy0X5CRJaKWRmodvYXSanPdSt0hGN6MUAnf8T2G1caCZeg8p8/oB
	 XGFhPg058EuS2oI7bOnxd9hlrqQDD2TqXNWOonlM=
Date: Mon, 25 May 2026 08:01:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] driver core: Guard deferred probe timeout extension
 with delayed_work_pending()
Message-ID: <2026052529-snowboard-deforest-8f79@gregkh>
References: <20260525012340.3860581-1-dakr@kernel.org>
 <20260525012340.3860581-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525012340.3860581-2-dakr@kernel.org>

On Mon, May 25, 2026 at 03:23:22AM +0200, Danilo Krummrich wrote:
> mod_delayed_work() unconditionally queues the work even when it wasn't
> previously pending, which can fire the timeout prematurely or restart it
> after it already fired. Add a delayed_work_pending() guard to restore
> the originally intended semantics.
> 
> Premature firing calls fw_devlink_drivers_done() before all built-in
> drivers have registered, causing fw_devlink to prematurely relax device
> links for suppliers whose drivers haven't loaded yet.
> 
> Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost deferred probe work")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/base/dd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index bebb43acc132..905269ecef9b 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -323,7 +323,8 @@ void deferred_probe_extend_timeout(void)
>  	 * If the work hasn't been queued yet or if the work expired, don't
>  	 * start a new one.
>  	 */
> -	if (mod_delayed_work(system_wq, &deferred_probe_timeout_work,
> +	if (delayed_work_pending(&deferred_probe_timeout_work) &&
> +	    mod_delayed_work(system_wq, &deferred_probe_timeout_work,
>  			     secs_to_jiffies(driver_deferred_probe_timeout)))
>  		pr_debug("Extended deferred probe timeout by %d secs\n",
>  					driver_deferred_probe_timeout);
> -- 
> 2.54.0
> 
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

