Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B7236C9EC;
	Wed,  1 Jul 2026 13:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782913360; cv=none; b=H7MjDZVZ9YV7JT/a3AtMy81jFHHf5heyxwgfYBUohea1GugNff4KGvzjZ8TNqmLbGm32ksObl0gkM7W+CZdBEl5Bl2V067sTEuB+TqNH4bL6SeF897Hv/aLy28LJcY27xFeT3k5dmTgeQatkpCrcmAFU3s45WM+RSBdYqIDpbW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782913360; c=relaxed/simple;
	bh=SPCZKYM2dygfhvVphs8D8w5xRDsShg4GHkZGTUWrEWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jmBZHXKW3bjBQlXnD5HlK1qbnrowqeHkDA4UZoXr5wXgvJqwplY0g0KLYBCOemypXJ96TxLhAOtDzv6S5ijhP1g7LPll39qGCIhexuKsTkBda/p2Fmz6R3PfpSgb1jX00k5QpWoXeEAdY4LMbFFuY0TvlWZ+gXVQyMeV0A26z5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Z/2AmDyk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Z/2AmDyk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB6E1F000E9;
	Wed,  1 Jul 2026 13:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782913358;
	bh=sFD8am4yXjNukkdRy1tHPDA8eXl2tzoLX6RobfqlXc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z/2AmDykos61X2Pu/nZRl1rsEP/ZaVfKgOYvCstKTWnWDZhML5G30lWvDIjjvKoYZ
	 o/kQYmV8hIQ6vog1AyI3s8G/T9t3UCPL3iSYQ8vE6jYkx+KD+OX50+PkUddRv7QH52
	 WiGi+etgrr+Z78j26SF+mb06YLvQLnLTqZ+KE2Ao=
Date: Wed, 1 Jul 2026 15:42:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: l1za0.sec@gmail.com
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sysfs: fix use-after-free in sysfs_create_dir_ns
Message-ID: <2026070131-bonus-garbage-7487@gregkh>
References: <20260701131658.11369-1-l1za0.sec@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701131658.11369-1-l1za0.sec@gmail.com>

On Wed, Jul 01, 2026 at 09:16:58PM +0800, l1za0.sec@gmail.com wrote:
> From: Haocheng Yu <l1za0.sec@gmail.com>
> 
> A KASAN: slab-use-after-free Read in kernfs_next_descendant_post is
> reported by a modified Syzkaller-based kernel fuzzing tool we
> developed.
> 
> This problem is caused by a race condition between sysfs directory
> creation for a child kobject and removal of the parent kobject. In this
> case, the ueagle-atm driver starts an async firmware request for a
> pre-firmware USB device. The firmware work falls back to the sysfs
> firmware loader and tries to add a firmware class device under the USB
> device while usb_disconnect() is removing the USB device from sysfs.

And that is the problem, that root issue needs to be fixed, and I think
we have patches in the queue to do so.  Can you test them instead?


> 
> sysfs_create_dir_ns() reads kobj->parent->sd without taking a reference
> to the parent kernfs_node. sysfs_remove_dir() may concurrently detach the
> same parent from sysfs and drop the last kernfs reference. The following
> kernfs_create_dir_ns() then uses a freed parent kernfs_node and
> kernfs_activate() can dereference it, triggering a use-after-free.
> 
> To fix this vulnerability, take a kernfs reference to the parent while
> holding sysfs_symlink_target_lock, the same lock that serializes
> sysfs_remove_dir() against kobj->sd detachment. If the parent has already
> been detached, fail the creation with -ENOENT. Drop the temporary
> reference after the child directory creation attempt completes.

This is not a "vulnerability" it is a bug in the callers to "do not do
that!" so let's fix the real issue here instead of papering over it in
sysfs.

Given just how old this USB driver is, and the fact that no one has this
hardware, it's not like this is a new issue :)

thanks,

greg k-h
