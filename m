Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C96390219;
	Thu, 14 May 2026 10:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753804; cv=none; b=BuslCaV+fPPkSDFm65WSBphx+GO0tdeGkq6UMkv49EVMcqRBCDe/itqHrCon48HFwpr/c1V9HYdukkN8ikxMszdvxelrPPI8xtGOGPExoO3zP1IGkFQdlaJQH9twQJNS0J6wVSh7K1AKqusNojhJvlSRccjZqsO97UPJcfx0IGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753804; c=relaxed/simple;
	bh=3xrLp236XQGoz49u8uCprVRlNKE6+kM1ULNPYfoql+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MpsHlAKlJbFVmZgitBhew00Fc3XPQ6fkIKn4hy3EjnhkCQpSrnPOq9VHAH+XnCNiLk9Z+GT9AfgckvpztcrRjxG0PXt0g2JmBqVgtmq86tVF57HHnqku1zhPgpjgDT2s+yXjSRSh1j6pGEgyk8wL1ozrpbrlD4r0fQ+sP9Zjc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lMYdSMym; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lMYdSMym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4515DC2BCB3;
	Thu, 14 May 2026 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778753803;
	bh=3xrLp236XQGoz49u8uCprVRlNKE6+kM1ULNPYfoql+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lMYdSMymthkPfomjmUqehGXi82PqxU0g4S9rSs7m/t/EQAblvxuep3lMks9m6nRdj
	 LRcbSgxfno0FsyYjmbwdh4AJSJ3/N64izDlpSPkQ2DkakbEKCMNvb3RrLCfQo0+Jv2
	 Rl9j1eYt2uffbhTXqTvZTXWEVctfhUa3JASfMBRw=
Date: Thu, 14 May 2026 12:16:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianlin Lv <iecedge@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org,
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
Message-ID: <2026051443-exuberant-important-534f@gregkh>
References: <20260514094955.76305-1-jianlv@ebay.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514094955.76305-1-jianlv@ebay.com>

On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> From: Jianlin Lv <iecedge@gmail.com>
> 
> Device drivers that use asynchronous probing can cause non-deterministic
> device ordering and naming across reboots. A typical example is storage
> drivers (like sd/nvme): asynchronous probing can lead to inconsistent disk
> logical names after reboot. In scenarios where disk naming consistency is
> critical, the probe type should be set to synchronous.
> 
> This patch introduces a driver_probe kernel parameter that overrides any
> driver's hard-coded probe type settings and allows runtime control without
> requiring kernel recompilation:
> 
>   driver_probe=PROBE_TYPE_SYNC,nvme,sd      # Force specific drivers sync
>   driver_probe=PROBE_TYPE_ASYNC,*,usb       # Force all async except usb
>   driver_probe=PROBE_TYPE_SYNC,*            # Force all drivers synchronous
> 
> The implementation replaces the limited driver_async_probe parameter with
> a more flexible interface that can force either synchronous or asynchronous
> probing as needed.
> 
> Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> ---
>  .../admin-guide/kernel-parameters.txt         | 27 +++++--
>  drivers/base/dd.c                             | 71 ++++++++++++++-----
>  2 files changed, 74 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 4d0f545fb3ec..b43a8bd20356 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1377,12 +1377,27 @@ Kernel parameters
>  			it becomes active and is searched during signature
>  			verification.
>  
> -	driver_async_probe=  [KNL]
> -			List of driver names to be probed asynchronously. *
> -			matches with all driver names. If * is specified, the
> -			rest of the listed driver names are those that will NOT
> -			match the *.
> -			Format: <driver_name1>,<driver_name2>...

You can not remove an existing user/kernel api, sorry, that is not
allowed as you just broke all systems that were relying on this :(

thanks,

greg k-h
