Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598308;
	b=rcj+cNAAaeD2HxdLwvEkagE5aiX2fW1x1CoLYeIbBJ8Zacm+pgPmzCogCJa7K939OF8M
	 u9iVXnoMwIviuHEW06rp/76bwuNWak62BvjOs+u5aOtTur0LxKpXr6J4iEtHHUN6/R6wI
	 H8+7w0+uTt+4va1Qd5dgOeeTXYWT4GcipM4uNJzAgMm8Zfx1s8L6EV6gFhNK1MXppDIOv
	 0/6x/XpiSshS72Xz8I5/1HWGtulgtoZL10f03L5KvXyFqBdFCitAj7eQ9xR7wJGz71AfL
	 wE80NSj9aKZerGqDALrvZvR6YwcfZ/wVzjdqrvUf4UlL/qOoork6jhM2VEKCBsHB9cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598308;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Oqn9SmXHIslwuMH06EIys2Giysc7tULBH+k/OfvkddA=;
	b=vBiy0zK+wrXm8d8djfSgcd8OZLh9fYo5Xd91zKNdll0NIpgZDJJ4nb2LCX/jmqggPg2n
	 ZVPmWkdTRvGSANiF5gDO3b5MPhwd+Dd8hEJCqDTXDnhaTVd+qKYdpqIbXvYUV5z2xWPd6
	 hN4uppe6t0Tlq+BUABLhW0vgOIlXZtFvA8Ab5iGw5g+7BbLsZNPUS83OgQX4A2psF1CJ3
	 3N9LjolKyvBMqToFEfY5YmKLzf6qFCEanHWpNELdJV6RIfqvPqy3iBQsyKhITvcbR4iQZ
	 gRJC1nRxb4bmCS/3CLaAh0wD7tkp1JqUz6VLkQOcHAAFSXR4SAverUNYWB8PCNIWluw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t1vj9qT1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F126606A68B;
	Wed, 25 Nov 2026 09:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=t1vj9qT1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B44E1F000C0;
	Wed, 25 Nov 2026 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795598307;
	bh=Oqn9SmXHIslwuMH06EIys2Giysc7tULBH+k/OfvkddA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t1vj9qT1iWN3VNHebj6sQdrQxOYD8nuL0v0MoOjoexgAqzkbTVFW83QbrZovDAweF
	 fugqL/+RnSZIYrJsIBPF/8UDVe0JaCsZUEM7j+ZVITKsHBv/sekt86yekzV3qhH4b2
	 FGrAdUjT4vXWtL5MYrtAyDF1XAQpMaPrLBmwDEuA=
Date: Wed, 25 Nov 2026 10:14:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ren Wei <weir@nebusec.ai>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
	akpm@linux-foundation.org, kay.sievers@vrfy.org, vega@nebusec.ai,
	caoruide123@gmail.com
Subject: Re: [PATCH driver-core v2] kobject: terminate the uevent helper
 environment
Message-ID: <2026112516-germicide-viewing-3a9f@gregkh>
References: <39d1eae0d7c8b235f5d4b68d94205b70832ab786.1795506878.git.caoruide123@gmail.com>
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
In-Reply-To: <39d1eae0d7c8b235f5d4b68d94205b70832ab786.1795506878.git.caoruide123@gmail.com>

On Wed, Nov 25, 2026 at 04:51:00PM +0800, Ren Wei wrote:
> From: Ruide Cao <caoruide123@gmail.com>
> 
> struct kobj_uevent_env has room for UEVENT_NUM_ENVP (64) environment
> pointers and add_uevent_var() lets all of them be used. Once the last
> slot is filled there is no room left for a NULL terminator.
> 
> The usermode helper path passes env->envp straight to
> call_usermodehelper_setup(), and kernel_execve() expects a NULL
> terminated array. A synthetic uevent written to a sysfs uevent file can
> supply enough variables to fill all 64 slots. With CONFIG_UEVENT_HELPER
> enabled and a helper configured, kernel_execve() then walks past the
> array into envp_idx and buf, and dereferences that data as string
> pointers.
> 
> Lowering the limit to 63 would avoid the overrun, but it would also
> reduce the capacity available to every uevent, including the netlink
> path that does not need a terminator, and could make existing callers
> with many variables start failing.
> 
> Add a dedicated sentinel slot instead, keep the limit at
> UEVENT_NUM_ENVP, and keep the array NULL terminated after a variable is
> added and after zap_modalias_env() removes one.
> 
> Fixes: 7eff2e7a8b65 ("Driver core: change add_uevent_var to use a struct")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Signed-off-by: Ruide Cao <caoruide123@gmail.com>
> Signed-off-by: Ren Wei <weir@nebusec.ai>
> ---
> Changes in v2:
> - Keep the capacity at 64 variables by adding a sentinel slot instead of
>   lowering the add_uevent_var() limit, which would regress callers that
>   emit many variables.
> - Compare against UEVENT_NUM_ENVP explicitly.
> - Keep envp[] NULL terminated after zap_modalias_env() removes MODALIAS.
> 
> v1: https://lore.kernel.org/all/cover.1795426787.git.caoruide123@gmail.com/

Why did you not actually reply to my previous email?

Why did your previous patch not work?  What testing was done differently
between the previous patch and this one to require this patch?

Without an actual discussion, just throwing random patches at us does
nothing to make us want to accept the change at all, for obvious reasons
(i.e. what would you want to see if you were in my position here?)

thanks,

greg k-h
