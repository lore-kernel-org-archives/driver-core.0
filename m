Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603C5429CED;
	Fri, 17 Jul 2026 14:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298104; cv=none; b=a6MXACTU6YhvBG3xOTY//6rtsiFPf70lu3QE+Hwi8Qi4LNwUzwmnoaIYk08GGYJGVMIzqXipnGEkbnPxTKxMkfPTm+tNfezeQSErydICY96CqfwTsPb01UhnTWZccdcn/fBLfOFxRXwYzn9rFf87jWmZBCBry0qPQRkyBCLn51U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298104; c=relaxed/simple;
	bh=4z3c8JbkCuCvYvwvyzFaFKP9887BsFDU3BfRJc0TnkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlzCqdVvP4HyV5UajEnHl8M6d2CX9nx1Ph6WCisWsI1+h3X5c+od+PQmqcyCNwlTaSF7fmPIDDuaDM6WEeNxHu8Q1AjrWU3XFVVVK+jS9DHSCzk2nVt4JZtpx54//G8oYBbYYF51AeH3OG8jjZm/vnz9LbxC6B9VFW+VXCZMIW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BlfyP/cR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BlfyP/cR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4C31F000E9;
	Fri, 17 Jul 2026 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784298103;
	bh=upV5V8B8JBZrCDKtCe/V1DhunBW+vPRYCxXvJ0ez/Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BlfyP/cRtLPMN9QONKagBg6Y+orjsevtHXsIPElLs1nxYdk8zJxuhjPKh6ljmVEVd
	 8D/UkN+z8uwwlsYSLk/NEccKSiyxHjZHdMTjxvHzU6IeDv0ddukSKumac+q25KVOly
	 dlZCJ9+JR369woyw94vkMVux6UvopGUb6324PeTs=
Date: Fri, 17 Jul 2026 16:21:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sainath Manda <sainathmanda777@gmail.com>
Cc: tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+f83fa2cf571bd7650422@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] kernfs: fix deadlock in epoll_ctl by waking pollfree
Message-ID: <2026071721-preseason-bagginess-055e@gregkh>
References: <20260621104310.18486-1-sainathmanda777@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621104310.18486-1-sainathmanda777@gmail.com>

On Sun, Jun 21, 2026 at 04:13:10PM +0530, Sainath Manda wrote:
> Syzbot reported a task hung in do_epoll_ctl_file(). This is caused by an
> AB-BA lock inversion between epoll's ep->mtx and kernfs node teardown.
> 
> Thread A (epoll_ctl) acquires ep->mtx, then attempts to acquire the
> kernfs active reference during vfs_poll().
> Thread B (kernfs_remove) deactivates the node and attempts to unhook
> active epoll monitors, which requires ep->mtx.
> 
> This patch fixes the deadlock by utilizing the existing epoll POLLFREE
> path. By calling wake_up_pollfree(&on->poll) before the waitqueue is
> freed, epoll users are notified to detach their wait entries without
> requiring kernfs teardown to acquire ep->mtx.
> 
> Reported-by: syzbot+f83fa2cf571bd7650422@syzkaller.appspotmail.com
> Signed-off-by: Sainath Manda <sainathmanda777@gmail.com>
> ---
>  fs/kernfs/file.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

What commit id does this fix?  And why isn't it for stable kernels too?

thanks,

greg k-h
