Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2EA377034;
	Thu, 20 Aug 2026 08:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214247; cv=none; b=qx/DsQPMAGEYvAu6AMGCLIdN8otgiXxtX09ASczbyhnSx+Bk8X1G7RB6aqoYpTP66ds3wHXJ/Npxf+c2861ryBc8kmZyQOUE4lj+IgbqrXWe06S/9wXiVLzitgMBRdQ1blVhSD8a1PRa+jEt5f/xgZMRed0SSZ0TDj9uoEcuxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214247; c=relaxed/simple;
	bh=HtuDbXY9zm4tiSp1pl1PBdqt0dGcWJl19dZV31ruapc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gttoxRWIN9qPw0dRizw0vj+g2BnSZNMyCXzXguq5HQbrSZvWh3I4fxCZuTdqyFusSOb22SFayP1oqCvV4tauMckjZi4bQ32CNOEIIpZSm1EzhYW7grsmjaxeIwomr4mSuDWPlwz4ZdfuqR0spcWXYQVGgLQOrcmtXd6Tj3ZpOy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jnir5OxF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jnir5OxF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A3801F000E9;
	Thu, 20 Aug 2026 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787214244;
	bh=Ae7FgWs+j8SAzSDeKSigvG+udrS3yDaUX/gACy84res=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jnir5OxFYMaqA2VJARstglAcmfdK/xfe/Js9wcTaxRaUjTXv4UQlWnPJjEptRMGEI
	 30vdQBCc+8i34nwdT2I5od+hcGDl7VzgzHr6GjU/Yjb3FiNlbzw51y/T6U9baPi7lp
	 DlwqohAbVM5WqRh8PJWTMHBLncyI1dz4c5vUA/Tg=
Date: Thu, 20 Aug 2026 10:22:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: KrisPoint <krispointcsgo@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform: unify the platform_pm_* suspend/resume dispatch
Message-ID: <2026082049-subplot-stipend-0c00@gregkh>
References: <20260820080735.691297-1-KrisPointCSGO@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820080735.691297-1-KrisPointCSGO@gmail.com>

On Thu, Aug 20, 2026 at 04:07:35PM +0800, KrisPoint wrote:
> The six platform_pm_suspend()/platform_pm_resume()/platform_pm_freeze()/
> platform_pm_thaw()/platform_pm_poweroff()/platform_pm_restore() callbacks
> all follow the same pattern: return early when the device has no driver,
> call the matching dev_pm_ops callback when one is present, and otherwise
> fall back to the legacy platform suspend/resume callbacks. This skeleton
> is currently open-coded in each of the six functions, leaving about 110
> lines of near-identical logic that must be kept in sync by hand.
> 
> Add a common platform_pm_dispatch() helper that implements the shared
> logic, driven by the dev_pm_ops callback, the legacy callback and the
> pm message to pass, and turn the six callbacks into thin wrappers around
> it. A platform_legacy_resume_state() adapter is added so the legacy
> callbacks share a single signature.
> 
> No functional change intended.
> 
> Signed-off-by: KrisPoint <KrisPointCSGO@gmail.com>

Real name please.

While I appreciate the goal of making code smaller, you have to admit,
these lines:

> +	return platform_pm_dispatch(dev,
> +				    drv && drv->pm ? drv->pm->suspend : NULL,
> +				    platform_legacy_suspend, PMSG_SUSPEND);

Are pretty unreadable.

Now we need to go look up the platform_pm_dispatch parameters each time
and try to figure out the suspend vs. NULL mess.

We write code for people first, compilers second.  And this feels to me,
like making it harder for people to understand.

thanks,

greg k-h
