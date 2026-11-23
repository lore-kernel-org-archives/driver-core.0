Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438564;
	b=ci3GfIolKqIDNBd1EVvnxaaE122a1QHNN7aPty0d6NIcIfXQCH5o9BooiNZ5zTkFLoY9
	 iO/EJEaePcRQtBBEt/Qs+epNQ+PBkGl1UREqpfdAlSaDcY9vjmfVEaAsh95o13efipdh5
	 zmbhdHdmiKd7yMGS6RlhzxUcadO9aPOlCAh/8AO5aQxWqVFnb7wDHC/rqg66tf6LHPpDU
	 k/7w3ZKuPNVTtP6rZK3g/caMTSC3k5qESUyy8Okbp5SlsAXAbTIjzrF9FakU3MWpRJy4s
	 8qcCxiXI5bTsJxZNKP3L+veo9IzhiK3JwCwj+0sz2lfqoYkSmM9D1kfdhcHuk8fpFqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438564;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SHzOyMLQ5WWuHRDRsZVSeMiTegWjsyCZr+4MBA/k9ac=;
	b=d11zNzVpUK6E46WeBM9VaMhalXSnoMVE00qafE+87wbQDG6nMmZMQ3tCQHlfkdsU/Zpx
	 YMFyzJr0+38tz+N+YBk3voI1/jnUX/V//hpx5xUhrcRrEW9FevvrD1o2NLwdfHCvdRB4f
	 jnmO8AciemWs3A8HtlC5+v6yEl5Pr0uI2qr/hvMiSqYO+sXPTm+MZih+0DO6L21Uwxf5/
	 dRJUXtcaCF/ax0j91j0XwJ+CgRvGhZezuCNvfKtz8jrbkxlBg2p7m+AkbTwd4PXh3Lk9k
	 jIM5zReEozi8mik93IhNTn8CgM7f38MjvXiH+N9idw5LI6oy1X/BkTdD+fuvDHqBcpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VLkrR6Am;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBFC606A31A;
	Mon, 23 Nov 2026 12:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VLkrR6Am
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032F91F000C0;
	Mon, 23 Nov 2026 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795438563;
	bh=SHzOyMLQ5WWuHRDRsZVSeMiTegWjsyCZr+4MBA/k9ac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VLkrR6AmuOdZ/O6gttp7K7b1zhVXcmZ2Z8zXZCdWLDI4KqzdkuG/d6/9+hSXufxbv
	 rsBjkMBkndtZRxlseReQJbCZ9C0RCVk8FdXzXttPMY9Im8Hdn3nFy2V1TL2yuYD1d7
	 IjyCwQybgtQbyRL8hbyhdfsF4A7qzHLXrSgL6ofM=
Date: Mon, 23 Nov 2026 13:56:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ren Wei <weir@nebusec.ai>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
	akpm@linux-foundation.org, kay.sievers@vrfy.org, vega@nebusec.ai,
	caoruide123@gmail.com
Subject: Re: [PATCH driver-core 0/1] kobject: reserve an envp slot for the
 terminator
Message-ID: <2026112353-mummy-knoll-cfa5@gregkh>
References: <cover.1795426787.git.caoruide123@gmail.com>
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
In-Reply-To: <cover.1795426787.git.caoruide123@gmail.com>

On Mon, Nov 23, 2026 at 08:16:36PM +0800, Ren Wei wrote:
> From: Ruide Cao <caoruide123@gmail.com>
> 
> Hi Linux kernel maintainers,
> 
> We found an issue in lib/kobject_uevent.c.
> 
> This bug is tracked at: https://bugtracker.nebusec.ai/f/16082
> 
> add_uevent_var() permits envp_idx to reach ARRAY_SIZE(env->envp), filling
> the final pointer slot without reserving a trailing NULL. With
> CONFIG_UEVENT_HELPER and a nonempty helper path, an event containing
> exactly 61 variables before SEQNUM causes SEQNUM, HOME, and PATH to fill
> all 64 slots. call_usermodehelper then asynchronously passes this
> unterminated array to kernel_execve(). count_strings_kernel() reads beyond
> envp into envp_idx and env->buf, interprets those bytes as pointers, and
> later dereferences invalid addresses while copying the environment.
> Synthetic arguments allow the environment count to be tuned, resulting in
> an out-of-bounds scan and kernel crash.
> 
> Privilege model: writing a synthetic uevent to /sys/module/kernel/uevent
> and setting /proc/sys/kernel/hotplug require CAP_SYS_ADMIN; the
> reproducer runs as root. The crash also depends on CONFIG_UEVENT_HELPER
> and a nonempty helper path.

This has come up many times in the past, nice to see your LLM has read
the mailing list archives :)

thanks,

greg k-h
