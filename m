Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB5025A642;
	Mon, 24 Aug 2026 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555589; cv=none; b=l/byJ8EvXcbfx2dmHvXyAngPswvt/K8VGMU/BrgKckOMUXqYR3sckoU7eWGib8u2N/Cu/Wx+J0yE5M8tJ9wNVMlNte49WoJTQCU/fKEVVMOucnO2gxD9+V9f3VD59xhDRpy1ygKSCjxVM9gb+yKA8lyrCjZmYK7xMC2d4CpPB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555589; c=relaxed/simple;
	bh=bF4GcQmUeHJe82xTcvV55m7+BX/sEKeg2gIyZEOzcok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7aG78ASdNuIFglIDQEj7F0iKs77b3F1DAH3boGQkzyMPGt/LNGAQGBVlnk7zOmrWlPiftvVQKQz0qjD16Dh9JaVgtxUttQZOYapY4wrqWkDFvCbpOX4Wp5kZRbJ0/gBRXdQD6TUnOrzXZSQZvXx5j37zx960SNc6TvbyOAESeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NW6bYhk+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NW6bYhk+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC581F00A3D;
	Mon, 24 Aug 2026 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787555587;
	bh=72mptp+G+FabkKOsBWjzxhDJ/39gz7qSlVsu59SnSN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NW6bYhk+7xiWQOQt4Hr96J07R7zEqJzz2X4mmHvstqU2KzLiXG+vMrGz09K82hoa1
	 j/Ag0trspJoadZEMSl9eAe1KRUrL2DbU6SEpH2PQntoOtXoUWXyRwhYFok7AUGZL1G
	 H2WbmwAfW0WpcwPs+eUd+T3SoaC48kF8m+afk0lg=
Date: Mon, 24 Aug 2026 09:11:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeffin Philip <jeffinphilip14@gmail.com>
Cc: syzbot+d164947c037324221043@syzkaller.appspotmail.com, dakr@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in
 uevent_store
Message-ID: <2026082417-pesky-motto-835d@gregkh>
References: <6a8bd82a.dbb3a75c.13dd47.0060.GAE@google.com>
 <20260824070748.96585-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824070748.96585-1-jeffinphilip14@gmail.com>

On Mon, Aug 24, 2026 at 12:37:48PM +0530, Jeffin Philip wrote:
> #syz test upstream
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index ddbc4d7482d2..b03562301bfe 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -83,7 +83,7 @@ static int kobject_action_type(const char *buf, size_t count,
>  	for (action = 0; action < ARRAY_SIZE(kobject_actions); action++) {
>  		if (strncmp(kobject_actions[action], buf, count_first) != 0)
>  			continue;
> -		if (kobject_actions[action][count_first] != '\0')
> +		if (strlen(kobject_actions[action]) != count_first)
>  			continue;
>  		if (args)
>  			*args = args_start;
> 

Why not look at this patch:
	https://lore.kernel.org/r/200d27f7.1471a.1a0138c92da.Coremail.stitch@zju.edu.cn
