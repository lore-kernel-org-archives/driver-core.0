Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438624;
	b=XQANfWEC3xCMSZsrRob0HqZaJTj8wtvEwhat1vlydQ7EGqi4U9bqymzkIr6pLynsIB7n
	 8uihSDIFctfs2pvl2QnxaOIQ/mBqQF0gk4T/UWn/8HwQtOUw66PZv4fK5bskBrSoeLsht
	 2x6vYnbAmhUKfIEvV9avkZosTgJkz47EPufnqnoTxsCKQTq7i1OS4FJ17DRFd+9O2zulg
	 yLBr3zFYhQLKYJreHFZEf9xuK7IPuXyQL3uN/8Drut7JGSZ6mCABRzUCRlnNwc6MU39Ow
	 Jtz0NkZ8GD0EDET5+Bqzw/zDzRNp3YRttxL5LkCvnX31Go7ZkzeNZLPoBlLDGGAbbMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438624;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7KhFRGOGWNgz2SmM6coaV7ZmtXwELyPDD+JotHp5BbU=;
	b=P+QcccJnt5Cd32j8a01nVEldxqtsEoqfPe9OsHWmgW7F1a75s6/3uItbaq5nYWodx/BI
	 kW2ZqQXzUaLZzg3CXqPWNKyvPYcKg2xxDjoY/e4732U2xMKdTogl8BX+SsoAjPMepeLCO
	 YZsybGXy7jUQgZ3ruGMmmNCCna+nJcv1QRldv0Ye8R8TmjpgqEckhjvpqGc04Lm5M4jSL
	 B2an4IweYAG4tTGJq4ghnWxvX6E6KRqQ9mV1In+LSqwfuxgLz1LQrCCHsu6zF5BnSNrhv
	 rbOk2mLiZrYI6oS/SH7+5Is72C67Alx7cdjWFllFkdhQRYOANMoUdCyZpANDLNBZ6/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NPaT0MV+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1A6606A31F;
	Mon, 23 Nov 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=NPaT0MV+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D9A1F000C4;
	Mon, 23 Nov 2026 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795438623;
	bh=7KhFRGOGWNgz2SmM6coaV7ZmtXwELyPDD+JotHp5BbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NPaT0MV+BdIvrNfUCbT4c3xYEQSk+094MgQUb4RwX57A9l9JSaoeMiwtiOOuEIfqH
	 niy80zPiBA4Z0xJxQRrZ4/NtVsGY4tMaiMNrQ0v7dS0/8MC0XtmYL0qrkezquJ6rC6
	 V+k5WWI+lp2A9XhGn7Sb4A/RNBwWqZ90yBZdM7JY=
Date: Mon, 23 Nov 2026 13:57:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ren Wei <weir@nebusec.ai>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
	akpm@linux-foundation.org, kay.sievers@vrfy.org, vega@nebusec.ai,
	caoruide123@gmail.com
Subject: Re: [PATCH driver-core 1/1] kobject: reserve an envp slot for the
 terminator
Message-ID: <2026112301-jingle-multiply-c72d@gregkh>
References: <cover.1795426787.git.caoruide123@gmail.com>
 <cd35c5682ebe0f5a58fa6beed90bb7d0e7d5e9a2.1795426787.git.caoruide123@gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd35c5682ebe0f5a58fa6beed90bb7d0e7d5e9a2.1795426787.git.caoruide123@gmail.com>

On Mon, Nov 23, 2026 at 08:16:37PM +0800, Ren Wei wrote:
> From: Ruide Cao <caoruide123@gmail.com>
> 
> add_uevent_var() currently allows envp_idx to reach ARRAY_SIZE(envp).
> This fills the final pointer slot without leaving room for the NULL
> terminator expected by usermode helper consumers.
> 
> A synthetic uevent can supply enough variables to make this happen.
> When CONFIG_UEVENT_HELPER is enabled, kernel_execve() then scans beyond
> the array while counting the environment and may dereference arbitrary
> data as a string pointer.
> 
> Reserve the final slot so an environment is always terminated.
> 
> Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struct")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Ruide Cao <caoruide123@gmail.com>
> Signed-off-by: Ren Wei <weir@nebusec.ai>
> ---
>  lib/kobject_uevent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index 1d29378d4f55..f7aa67d6ee54 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -673,7 +673,7 @@ int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...)
>  	va_list args;
>  	int len;
>  
> -	if (env->envp_idx >= ARRAY_SIZE(env->envp)) {
> +	if (env->envp_idx >= ARRAY_SIZE(env->envp) - 1) {
>  		WARN(1, KERN_ERR "add_uevent_var: too many keys\n");
>  		return -ENOMEM;
>  	}

As "simple" as this looks, I think there's been problems with it in the
past.  Have you tested this?

thanks,

greg k-h
