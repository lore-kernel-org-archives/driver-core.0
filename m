Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A93446074;
	Thu, 17 Sep 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789630603; cv=none; b=F5FkSCsFVMlrbbYbyK46MYCd8iWHVamDCYGVyJnDSQi7XkTfH9o9DxcR1IjJP/w9OKMcDaZ1a9mcWm9/BaIUF3GICbCsxqGZeVDri3nGr21vgTzyLDZsi8LHzfpeg39PsIJm5+lDjOsw8w+soaMJTPm/SJWiA6zhQHuXMZEZYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789630603; c=relaxed/simple;
	bh=DCpAQMR4BLt1zTHJ7DrVLbO73EHP4NL7Dat1uR6hHKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lu/YR/uUImrSxFCQ12HG+RStRzacNNBKwRTbhVdV8Nt5g9WtBjQAr5xa8/7y/awPB2evGCMzeGex3om5Wjk+LnGGcsIAQe46ZEMVaw5iYZ36nUgMwf8WTgh0GZbp+XF/s0Z+jfHFaMIxaBE/5tL9wxldfAnO7pbA5+a8BPlwL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IJ6EKohI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IJ6EKohI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E61C1F000FF;
	Thu, 17 Sep 2026 07:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789630602;
	bh=G8p5TUPtrcyvdaqQDVyEvpqNQiAo0dHTkeVAeY0ywFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJ6EKohISSnaWc7wIoUUJEtelV8CB8RNs+9MIBn49LIB9Q1cmPf4rDZT/h6jclreJ
	 1w4VrSTppIzYlV676LiWEu2WHj6E0ZfgkX09na8PS9hWwr6xTbyk2qbYgTE9dS1K7C
	 DpFbnWOrvM9N5e8xbHfTU+DtMqz07Rq+WBFKk088=
Date: Thu, 17 Sep 2026 08:34:46 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@sina.com>
Cc: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com, dakr@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] sysfs: prevent writing excessively large files
Message-ID: <2026091700-baritone-clapping-685d@gregkh>
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
> Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
> Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
>  fs/sysfs/file.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index cd5bb0f9fee6..a63130d18680 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -228,10 +228,12 @@ static const struct kernfs_ops sysfs_file_kfops_ro = {
>  };
>  
>  static const struct kernfs_ops sysfs_file_kfops_wo = {
> +	.atomic_write_len	= PAGE_SIZE,
>  	.write		= sysfs_kf_write,
>  };
>  
>  static const struct kernfs_ops sysfs_file_kfops_rw = {
> +	.atomic_write_len	= PAGE_SIZE,
>  	.seq_show	= sysfs_kf_seq_show,
>  	.write		= sysfs_kf_write,
>  };
> -- 
> 2.43.0
> 

Are you sure this will not break those sysfs files that want larger page
sizes?  Given the age of this "issue" it's really worrying to me to
change it now...

thanks,

greg k-h
