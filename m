Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465630C175;
	Mon, 25 May 2026 06:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688940; cv=none; b=JkZ1xHdh0RZp7c+d/eQ36bg0GRde0oTm0hJIwEe4ml62uTxPM7uOf0S07tU9W/5Io8p7yb2tlTUm1nbLwpy/EhSX3yFejio5JaY3jRvu2ICGMHv93ccrwoOGoFezoFraqKhvPTqhGSxrWKjNwxNddi+61yyFWiXP774iA9XDixk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688940; c=relaxed/simple;
	bh=wid5o9Agf7SPtzW8WUXAUYOEOWZ14oK7pJR4i9aJWi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/PJJ9/FBb0ev4yHTL+hwmTjtugEgESDQRzDUiIiJ006xYUGwPxl/f+XLOz98f+esQ6c+njBgBemQsINk5yyq/v17wFV07dk7lpfffx/BxnByHX6Er2PNti5857ss9ZQoDs519rA041mOTnwN7Yrzd9G2lmYGKzkUTHybGlNijc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=rSgy/B6O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rSgy/B6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583EF1F000E9;
	Mon, 25 May 2026 06:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779688939;
	bh=S+qMOPZLTlJlCfd4eK3DD1VD5WjJ6xRiRaF7MnDAJs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rSgy/B6OESy1Q/VEt86NHgqYhFQ4wGZuwukutZ9ODDcuqpfwVOgovz/xwv99i2+nK
	 vRgRHanxXdJ/2y1st5ambVwlwUHcuPEbSWjskaKgQOAPAUMfs2Kg0Zg1c17uhoVF+f
	 lY8YsInKm1HL9OmDF57f632DMzLiPYBPc03Grhx4=
Date: Mon, 25 May 2026 08:01:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: Fix missing jiffies conversion in
 deferred_probe_extend_timeout()
Message-ID: <2026052517-sandstorm-provider-640d@gregkh>
References: <20260525012340.3860581-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525012340.3860581-1-dakr@kernel.org>

On Mon, May 25, 2026 at 03:23:21AM +0200, Danilo Krummrich wrote:
> mod_delayed_work() takes jiffies, not seconds. Thus, restore the dropped
> conversion.
> 
> While at it, fix incorrect indentation.
> 
> Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost deferred probe work")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/base/dd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 172a02a438a2..bebb43acc132 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -324,7 +324,7 @@ void deferred_probe_extend_timeout(void)
>  	 * start a new one.
>  	 */
>  	if (mod_delayed_work(system_wq, &deferred_probe_timeout_work,
> -						 driver_deferred_probe_timeout))
> +			     secs_to_jiffies(driver_deferred_probe_timeout)))
>  		pr_debug("Extended deferred probe timeout by %d secs\n",
>  					driver_deferred_probe_timeout);
>  }
> 
> base-commit: 56785dcb2ef6d3cff82ac33f2e34db94377416a3
> -- 
> 2.54.0
> 
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
