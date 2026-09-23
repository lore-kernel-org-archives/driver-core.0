Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF00519E02;
	Wed, 23 Sep 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165168; cv=none; b=QMVHeN6c2HZ7set2a/+Wviq6egGdEsutV9iLyTWjC+wYgHgZ9t48hc2Z6hIcg90QiKAWYQzJgt/uW4dOOdrDoaA7oFf/Zkc4Tj1vmASknR1GVVdLhyFGZgcaZZhPFpIJATjypQooT5T//o9c6rEfZbUlx9RtpXkc3DEa493g/HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165168; c=relaxed/simple;
	bh=ANa3KUuk8p+uDvEN46/goxQBg8Ih7jBzmpzwd3Ms0OY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEO1jzek2RAtcxcC0j2B9KLLuDbRGwmx3WYdNQ+sJLGNzgvLyV7Qt4qmSTbd34EIBU/my1W1INXbHs+lohVa0enxy8I0PQyAlE7W1JX8AdhisqpKlHf/VloW++vVNKNN9+XLi8/rAgf69g7u7W5sgypOXwZL/mAbY9+g2phuK4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DDbXR956; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DDbXR956"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCB41F000FF;
	Wed, 23 Sep 2026 12:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790165165;
	bh=LrZ5TRaE/9++BmCHHogZ++HfWVTS52D1WbB8W/6Fpic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DDbXR956PegLSdfynST50/XHM1c+uL0QRLf8k66nBd/FEpWJ+c/uhCpslOhdRdYH5
	 ghgob07OOu+nKv6z1o7ttgWIW5wK38MKslvyDy1CY4I2vR0Nmre/lp3O69JXj6Rwgk
	 EHDZpT3BqMUIjc1L59Nzi19gINCDb2nzWO/kTS2c=
Date: Wed, 23 Sep 2026 14:05:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@sina.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, rafael@kernel.org,
	kay.sievers@vrfy.org,
	syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] kobject: optimize count first value
Message-ID: <2026092357-egotism-mango-c378@gregkh>
References: <20260917075615.999497-1-eadavis@sina.com>
 <20260923105522.43514-1-eadavis@sina.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923105522.43514-1-eadavis@sina.com>

On Wed, Sep 23, 2026 at 06:55:22PM +0800, Edward Adam Davis wrote:
> The user writes to the regular sysfs file "/sys/bus/acpi/uevent\000" is
> as follows:
> 
> write(r0, &(0x7f0000000280)='add\x00', 0xff0a);

You mean a "root user", right?  So don't do that :)

> >From the parameters of write, we can know that: buffer is 'add\x00', and
> buffer count is 0xff0a.
> 
> Since atomic_write_len was 0, kernfs_fop_write_iter() would silently truncate
> the buffer count 0xff0a to PAGE_SIZE.
> 
> In kobject_action_type(), the strncmp() successfully stops at the null
> terminator for "add". Then the code directly attempts to access index 4095
> of the 4-byte string literal "add" via kobject_actions[action][count_first],
> potentially hitting:
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
> When the buffer does not contain parameters, we take the smaller of the
> buffer string's actual length and the buffer count provided by the user
> as count_first.
> 
> Fixes: 5c5daf657cb5 ("Driver core: exclude kobject_uevent.c for !CONFIG_HOTPLUG")
> Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
> Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
> v1 -> v2: change to optimize kobject

Hasn't this been submitted before from others?  Have you seen this
thread:
	https://lore.kernel.org/r/200d27f7.1471a.1a0138c92da.Coremail.stitch@zju.edu.cn
?

Your "fix" is different from the above, which is correct?

thanks,

greg k-h
