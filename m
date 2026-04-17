Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D163CB;
	Fri, 17 Apr 2026 00:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776385694; cv=none; b=Tx/NimyNWdcOIKtawdkMDVsa0UwkMtwMJx/EE4LMewelVWRpJfFNAZ+D8UFeSZvuI4rHV1C3Cb1AmNMYw4bv2Y9CYFpQP7YjrL6AJtRI2ilTEdv7FGObSkq7q/IM5QbDGD0UR151yVbzUCvxqA0vwK+3ESXMkW61s92xwZNZIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776385694; c=relaxed/simple;
	bh=tpd51Uawvc1dycIiNzLXN+Rk0nobFJzagJFU4vqlRVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHegPbuXagXzo9mat+3v5gT4Fe7zSt7BOjRpqTQItRU9rOUHW84jOdhRvx+Z+OiA4hOyNiDOxxC6cHdg7n7ZG3f3bf9eRDqnc7KRL85G2eBQAiiJ6Q5d+aOtEx6i5CRMErFoLNlj8bU/jKlBOERwXgm9kBizg6SCYlSmOO1ZdlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFMpNx7M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFMpNx7M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA23AC2BCAF;
	Fri, 17 Apr 2026 00:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776385693;
	bh=tpd51Uawvc1dycIiNzLXN+Rk0nobFJzagJFU4vqlRVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFMpNx7MYimSOrqS3rVxs88zYSpHP6mAZ7ige0bEr+mrSI0z37s4/qpgXn7kYQeTr
	 A+WgwonCWOIsmM95eoqVxRvzXV3056Jlu7dBHWRqdXR12gDijFbBDNNDUAqDY72taM
	 AuCvCtVCFpGTKld0v85eJU9ZSnKIAViwAYu3ovkppLKoO0MSkhhOBy6sauHOGlnWSL
	 kZc6rOzDGpW0OsmQAWV7b3Moutpbx217ZnWIf6qQuNZm6NrWXN6xe/5tNiC2eS2oMR
	 1XBr1UdYSlX2Jx2lNF9Gw5C5XiMcJxYrg7QUGKAK6GmIPrKhiZjQLg4vyGIjyLUbO2
	 MKd/Ly8FBAIPw==
Date: Thu, 16 Apr 2026 14:28:12 -1000
From: Tejun Heo <tj@kernel.org>
To: Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	syzbot+0dfe499ea713e0a15bec@syzkaller.appspotmail.com
Subject: Re: [PATCH] kernfs: fix suspicious RCU usage in kernfs_put()
Message-ID: <aeF-nFRCkT8BQBrt@slm.duckdns.org>
References: <20260416134315.1474726-1-conorkotwasinski2024@u.northwestern.edu>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416134315.1474726-1-conorkotwasinski2024@u.northwestern.edu>

On Thu, Apr 16, 2026 at 09:43:15AM -0400, Conor Kotwasinski wrote:
> Commit 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> converted the WARN_ONCE() in kernfs_put() to read kn->name and
> parent->name via rcu_dereference(), but kernfs_put() has callers that
> hold neither kernfs_rwsem nor the RCU read lock. The inode eviction
> path driven by memory reclaim is one such case:
> 
>   kernfs_put+0x53/0x60 fs/kernfs/dir.c:602
>   evict+0x3c2/0xad0 fs/inode.c:846
>   iput_final fs/inode.c:1966 [inline]
>   iput.part.0+0x605/0xf50 fs/inode.c:2015
>   iput+0x35/0x40 fs/inode.c:1981
>   dentry_unlink_inode+0x2a1/0x490 fs/dcache.c:467
>   __dentry_kill+0x1d0/0x600 fs/dcache.c:670
>   shrink_dentry_list+0x180/0x5e0 fs/dcache.c:1174
>   prune_dcache_sb+0xea/0x150 fs/dcache.c:1256
>   super_cache_scan+0x328/0x550 fs/super.c:223
>   ...
>   kswapd+0x556/0xba0 mm/vmscan.c:7343
> 
> lockdep complains with "suspicious RCU usage" whenever the WARN
> fires from such a context.
> 
> Wrap the rcu_dereference() calls in an RCU read-side critical section.
> Gate on the active-ref check so the lock is only taken when the WARN
> is about to fire.
> 
> Note that this does not address the underlying imbalance in
> kn->active that triggers the WARN.
> 
> Fixes: 741c10b096bc ("kernfs: Use RCU to access kernfs_node::name.")
> Reported-by: syzbot+0dfe499ea713e0a15bec@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=0dfe499ea713e0a15bec
> 
> Signed-off-by: Conor Kotwasinski <conorkotwasinski2024@u.northwestern.edu>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
