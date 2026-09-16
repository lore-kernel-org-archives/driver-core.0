Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C2442391;
	Wed, 16 Sep 2026 07:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543206; cv=none; b=bYqccekfMud65sGVqwRNfyN3VNndfwGKu3RL12tQStH6J8e0y2+7KKqdltGjiuUrmO/O5UsTnIfc96tOpmB0tQLJMBTYmC6Cv0Regu62+ood7Pl7TP7W94xPEkiTH3KY4VF/ktCupAx0TKa5f02zrV8U6rZkb+qlpG08zaaIcjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543206; c=relaxed/simple;
	bh=zGM8ZCcP3Acho7+JM2u1ii3ZSIKedEt6lL3TRE34ojs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMqvXH84c8AQYeRlFyha+8e0ypAHI2zCKb0WeqQJEV2K3Q8ID1RvVAulJ31yx72vZuMfcXk6VLiZXBhW/K4g9hih/t48611jHxHVRInJ4McEYG5JP83AqFdKBVkYlrJI3hihlQR3WUAt/Tv0GdoPlaC92cHpPwamAdcjwCz/fNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RbljfB8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RbljfB8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F481F000FF;
	Wed, 16 Sep 2026 07:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789543190;
	bh=BFoii1ddLuBVcJYRFvrflpsVl/SkK1vywh54KUGgxo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RbljfB8DR1Zj8Bk5t6ISTgWbYzb/WDilsrJp1QPWw+u8bLRNHnHihNrl2MzqT++1k
	 4f+j1AxExamAnit4jojLXNprEgvkL/e86iKxWbc7KeIf1OomsvCPgxAOO2jvxMAGh+
	 cMT+kKfj0mxtFcKU3SGkJqndzADixUwu7t0yEvZE=
Date: Wed, 16 Sep 2026 09:17:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@sina.com>
Cc: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com, dakr@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] sysfs: prevent writing excessively large files
Message-ID: <2026091606-distant-paltry-a3f1@gregkh>
References: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
 <20260915122018.924041-1-eadavis@sina.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915122018.924041-1-eadavis@sina.com>

On Tue, Sep 15, 2026 at 08:20:17PM +0800, Edward Adam Davis wrote:
> Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
> file write via sysfs_kf_write() may result in an out-of-bounds read when
> checking for the null terminator of a string element in the kobject_actions
> array within kobject_action_type(), potentially hitting:

What sysfs file are you hitting this on?

> 
> BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
> BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
> Call Trace:
>  kobject_action_type lib/kobject_uevent.c:86 [inline]
>  kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
>  bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
>  bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
>  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
>  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6af/0x1050 fs/read_write.c:687
> 
> Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
> properly.
> 
> Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")

What changed to suddenly cause this to show up now if this has been
present for decades?

thanks,

greg k-h
