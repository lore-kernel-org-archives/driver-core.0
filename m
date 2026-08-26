Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EB738944E;
	Wed, 26 Aug 2026 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729441; cv=none; b=er906mg2St2b8G3+rnbYwa9z68TS/6cGWo3ND7wl4Pv0MUGwKdhUGbLW0SpiVJkXaOt/QLyY7E8DsTzsscc4H6Q0qjQzGdtiMaJAUcIqHGgWq2+OuORYDyY0S5bNaCzcZ21MANPiUvzrAHKPfeIwXmW7uX1UIeOmKSgzcppXPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729441; c=relaxed/simple;
	bh=SywQy3pTt1jAZBF9ue9/Kw1B4QnhE30EuxIiTIbN7sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jaz2n+w8MS8HWT2KZjwWRlMDul4v3U5Fh3OOERZetF7XT25yR2YTp5GCspnuOzmtDeJ3cViY/BpTOmF/7tKTt/FK98H4C8YlG5dg6Ua/ubDkYl9aIV/da9HgZYv4+cWl/6hUSNCjZ2Xmxs6yN6fO3MBceED5Rsm2P+5cL2+ATvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uepy8XPE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uepy8XPE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73681F000E9;
	Wed, 26 Aug 2026 07:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787729439;
	bh=elZlUTD81DMa7imHMdlHDeB1n0sil//+YudoB8u2/yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uepy8XPEXpmnhkP+HOEAYSIvpzpbWNWmqBY92z7gwuR09JQdNlG+EMwSDdpZjbNi+
	 RjO3CEGi1UAKHEmrBAS0I6vC2v+GCMCl3vCwicwv2ocohqrFehDEvBU7Bu9pk3EOLI
	 VswduNpo/6wdkHWG0s1fzevwqeX7YFVFLCnSbrpY=
Date: Wed, 26 Aug 2026 09:28:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tao Yu <tao1.yu@intel.com>
Cc: akpm@linux-foundation.org, dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, rafael@kernel.org,
	syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com
Subject: Re: [PATCH] kobject: avoid blocking allocation while holding
 uevent_sock_mutex
Message-ID: <2026082640-dormitory-spore-a2b3@gregkh>
References: <20260826064633.589258-1-tao1.yu@intel.com>
 <2026082632-sports-cattail-a5b0@gregkh>
 <reply-20260826-kobject-uevent-v1@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <reply-20260826-kobject-uevent-v1@intel.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Wed, Aug 26, 2026 at 03:17:58PM +0800, Tao Yu wrote:
> Hi Greg,
> 
> Thanks for the review.
> 
> Nothing changed in USB enumeration itself. What syzbot appears to be
> hitting is a long-standing latency problem in the untagged uevent path,
> not a recent USB-specific regression.
> 
> The blocked task is in:
> 
>   usb_set_configuration()
>     -> device_add()
>     -> kobject_uevent_env()
>     -> uevent_net_broadcast_untagged()
> 
> so the contention point is the global untagged-uevent broadcast path in
> lib/kobject_uevent.c.
> 
> Looking at the history, the locked allocation/broadcast pattern appears
> to date back to 16dff336b33d ("kobject: add kobject_uevent_net_broadcast()").
> Because of that, I did not add a Fixes tag or cc stable in v1. I do not
> have evidence that this is a recent regression, so I would rather not
> add those tags without a stronger justification.

But if this is something that userspace can trigger, as syzbot is
showing, then it should be backported to resolve the problem for people
hitting it like yourself.

> You are also right about the race in my listener pre-check. A listener
> can appear after the first unlock, so that part of v1 is not correct.
> I will drop that approach in the next revision.
> 
> I also should have included the syzbot link and testing details. The
> report is here:
> https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
> 
> syzbot has now tested the proposed patch and reported that the
> reproducer did not trigger the issue:
> https://groups.google.com/g/syzkaller-bugs/c/q6wmyA-hG6E/m/rLDsbLC-AQAJ
> 
> So the patch now has:
> Tested-by: syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com
> 
> I also compile-tested it with:
>   make lib/kobject_uevent.o

But that doesn't actually test things locally.  Please do so on your own
machine as obviously this is a path you can validate yourself.

thanks,

greg k-hh
