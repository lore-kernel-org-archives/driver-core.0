Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9342D272E56;
	Sun, 19 Apr 2026 14:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776609639; cv=none; b=BsT/bBecoI7g6F2bjMzuYO/bg7KNrA3pkIZnHxl90Fa3oMU+F882Zx5za0AZ5GFGvt+JA6CeAk9864dWJuxbx24VgNPGIJ3B+WvOgC/1/8AwSmHAWG4ifK+18nzL4h69N9sytk0cWTNUPG6wxx/9BPYXc0zH8dmdvrybvMIvQ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776609639; c=relaxed/simple;
	bh=WEpLdFHZM1W42OrHbEBmve2xno7jxX9Bw++wSJcO1YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtvofEzZcZ2b8WslaLmQn/oN04Dq4RHF7cKHQ9mccPVoKEJdlx9dQoN/bEheSrP7STPauJ8kllgRmwVDxpW0HmpMwVEqheYSgO3yThhC+LvwIqYH8gvdkg+aLCwGd875wuYk5tGSlGYgUuvhfCUUkM5RXgWhU9lpL3x6++bg6gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DyHjLIWX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DyHjLIWX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18F14C2BCAF;
	Sun, 19 Apr 2026 14:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776609639;
	bh=WEpLdFHZM1W42OrHbEBmve2xno7jxX9Bw++wSJcO1YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyHjLIWXIlGh5aZI0v1PeGayWW6ezw63n68pXJMjhZ6Q1rx9nfyjErLT9QWqPR5Wu
	 WO+wO07eOiYIsY/i62ICgZ3vrH+aDTmENcmRXiCSt7jWsrE+c5vn5l8UkNCZci3kuM
	 C53CqoRlHlGuPCknRISKZwidPJkRVjPWSAjTIFbw=
Date: Sun, 19 Apr 2026 16:40:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, saravanak@kernel.org, ulf.hansson@linaro.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in
 dev_has_sync_state()
Message-ID: <2026041930-evade-mockup-b243@gregkh>
References: <20260418162221.1121873-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260418162221.1121873-1-dakr@kernel.org>

On Sat, Apr 18, 2026 at 06:22:18PM +0200, Danilo Krummrich wrote:
> dev_has_sync_state() reads dev->driver twice without holding
> device_lock() -- once for the NULL check and once to dereference
> ->sync_state. Some callers only hold device_links_write_lock, which
> doesn't prevent a concurrent unbind from clearing dev->driver via
> device_unbind_cleanup().
> 
> Fix it by reading dev->driver exactly once with READ_ONCE(), pairing
> with the WRITE_ONCE() in device_set_driver().
> 
> Link: https://lore.kernel.org/driver-core/DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org/
> Fixes: ac338acf514e ("driver core: Add dev_has_sync_state()")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  include/linux/device.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index ac972e7bead4..4c1c9cb8570a 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1018,9 +1018,12 @@ static inline void device_lock_assert(struct device *dev)
>  
>  static inline bool dev_has_sync_state(struct device *dev)
>  {
> +	struct device_driver *drv;
> +
>  	if (!dev)
>  		return false;
> -	if (dev->driver && dev->driver->sync_state)
> +	drv = READ_ONCE(dev->driver);
> +	if (drv && drv->sync_state)
>  		return true;
>  	if (dev->bus && dev->bus->sync_state)
>  		return true;
> 
> base-commit: 5b484311507b5d403c1f7a45f6aa3778549e268b
> -- 
> 2.53.0
> 
> 

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
