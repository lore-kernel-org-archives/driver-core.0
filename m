Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B28434407
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 23:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786404229; cv=none; b=BE2ydm7xplkCed4SoFxsgkx33L9HUqKY9c1uHH7zBOgeTsGeTltqP2vHjAVe4XdLFAs1S4wNG8t+hFU2ptJqNXFPe/LzlhXKPCcsk6sPL6WhBi21uXKekRlNsLsk6f7oR9+7P8IeZGXmmWhwr33zUdsPHfOjTD8O1Hclam+vCdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786404229; c=relaxed/simple;
	bh=qumYJBErYHBnlknTR2S5jtbwLJj7iWgwgq6ztFcjW+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YAyalVqQL/HM+t2uZw1p5SakTvSzU2PEA4iLXoRPi+OKVntNbf3G7IsYDLA6cIZlRp4tymmWdsecuTjLxg7/tYzJy47XV/7vgerICohwLF5WApJq8dX0F+rbzojZxWH5/0rb6d2Mw3mJ2UKpl4fLW4wGLl/ODhYJMXtGWx9lOzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QTHL1Uiq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QTHL1Uiq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786404227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dvXcdVrrcYWC7Qoe02Nyc3BrgNoZ7f3QNoGWtGrCDEM=;
	b=QTHL1Uiq20jasy56QEReGD4sL4hbRUdvev83s1VGfrWAFHqVKPEPJxEfEhRhdtLBky2WY0
	2XH9rrooimKbd6LIElM7UwDuHFcdmqdXaHEQJaYnrYS321qjhmq0HEMEXCUw8JTB8jGyYk
	eA5XFMw6vAYMkKsivT6ZS5pOvPX30zc=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-uCjoDNJDOtSLrCIcQT_dtg-1; Mon, 10 Aug 2026 19:23:40 -0400
X-MC-Unique: uCjoDNJDOtSLrCIcQT_dtg-1
X-Mimecast-MFC-AGG-ID: uCjoDNJDOtSLrCIcQT_dtg_1786404219
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448bb8bd2efso3649458fac.0
        for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 16:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786404219; x=1787009019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvXcdVrrcYWC7Qoe02Nyc3BrgNoZ7f3QNoGWtGrCDEM=;
        b=jYbdK9LV/MfBGIGz6HzzAtXtGrRRvyCW7mjoMA9LN/U4uL5Bhhvtp1nV2QJr4vpOCb
         dIrrUkQB6FtELfA9zoB+GWdXEKMFGydNe4E9skRpbarry3NRuecJLIOj0yQBbN8RIUJx
         GRjR/md4MKFKv91w5DREmbKDQPSfhBPscSvmiQFoD44Zs3bjq+1nM8FKSGYsg81O3fU8
         RjY/9aI2h19BjBfDJhzQjUixidU7vufsn/kf8Ghd1k/0F9Itb2gduZDSzzmrZ+FGK+Ho
         kD0F/5fIzCXEEpLksBmk/q4kNmrBRhHmZc9Gm9pPpAUBQxeIM/cXZnUKlYBD2fFLYn8W
         Q07w==
X-Forwarded-Encrypted: i=1; AHgh+RrI3iRuwOMPZxSpVeyE2dXA9RDHi06R+2c/y2O9hVq3DSEb9Q1Get4f3JMyjSPZN4LXrvhXs/XuAWriHw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5kVmPyLyHyh82N+2/n/kvQ/C0ZYGkM7D53M2veg4Jg2iBSMp+
	PWwX001EulN2hhVmWYRBjqZ56dsyuQYlNFjqM2h1mTMr+FlojPfOZCQLG1moaOpSmuE5S/CfsIs
	UDeXeja29yehWcGuG58So/6tpE6VJaC1j/RIn0nnI9PFV/q8L8Dkz45X6xMwIloIwD31EwN3mdC
	c=
X-Gm-Gg: AR+sD12UK54GgJYecaJjbNDnvt48Dou+45But8FyiqGvfl8b//xdq5QQCi25Vqs22tn
	Qvo+yd3tQXQRFJQW2zuzYmOLXBo6EtU8ZVoFgD61PhNy7Q2xOaInzvA62MrK+bVI2/Ddp7s/ZyL
	AOv3E6vuUBlCt9y83CeUIRZaAUNsuZvQ0QHJxwAAOsGR1RWtofU0zrRrcZLGR0dMNSDmNxUNb0B
	e+B/lilBHsAoD4GsPTUUCGCT1LOs6ZUogxy2VtmlrUTebU+uNYzn7+PaOL1Do3x9ms3LmvlJopa
	Il3qVrgIubKGWgtjAMSThBhTRG7l/AGRac0K3/VdwEOxFlQiJjwB29ZHYNqLpWSIYZfi1FcqJvE
	2zfoLtv4Bx899zS3dDJnc8gnLFmA92imD15OWT49v
X-Received: by 2002:a05:6820:168f:b0:6ae:9b39:68d1 with SMTP id 006d021491bc7-6b0420d5753mr12437001eaf.23.1786404219425;
        Mon, 10 Aug 2026 16:23:39 -0700 (PDT)
X-Received: by 2002:a05:6820:168f:b0:6ae:9b39:68d1 with SMTP id 006d021491bc7-6b0420d5753mr12436982eaf.23.1786404219028;
        Mon, 10 Aug 2026 16:23:39 -0700 (PDT)
Received: from [10.0.0.187] (97-127-68-83.mpls.qwest.net. [97.127.68.83])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f19fd31csm9718793fac.1.2026.08.10.16.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 16:23:38 -0700 (PDT)
Message-ID: <8fba77ff-8b67-45fa-969e-4009cfe59928@redhat.com>
Date: Mon, 10 Aug 2026 18:23:36 -0500
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] devtmpfs: restore mount option reconfiguration on
 get_tree
To: Simon Liebold <simonlie@amazon.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, Christian Brauner <brauner@kernel.org>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Cc: stable@vger.kernel.org
References: <20260810083438.764684-1-simonlie@amazon.de>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <20260810083438.764684-1-simonlie@amazon.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iPR8IYOM3C4uPrOZe89k5IgcohFK96jBXI0c_E4B1HE_1786404219
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/10/26 3:34 AM, Simon Liebold wrote:
> Commit cb0e0a8bf4e1 ("devtmpfs: replace ->mount with ->get_tree in
> public instance") converted devtmpfs to the new mount API but dropped
> the reconfigure_single() call that reapplied mount options.
> 
> This causes userspace-requested mount options to be silently ignored.

hohum, I'm not sure how I managed to re-break that - I had cc'd neilb
precisely because I knew he had fixed a regression here before, so
it must have been on my mind.

Looking back to an IRC conversation with viro I think I diverged from
his recommendation though I'm not sure why.

I had credited viro in my changelog, but looking back I don't think I
faithfully implemented what he had suggested. I'd like to revisit that
and maybe propose a different solution to fixing this.

(One concern is approach is that I think it is now passing an fc which
was not "for_reconfigure" to reconfigure, for starters, but that's on
me I think for setting it up this way ...)

Give me a day or so to try to page all this back in again? And sorry
for breaking it. :(

Thanks,
-Eric

> To reproduce, boot a system where systemd mounts /dev with a size
> option (e.g. size=4m), then check the actual size:
> 
>     findmnt -n -o SIZE --bytes /dev
> 
> On an affected kernel this returns ~50% of RAM instead of the
> requested size.
> 
> Fix by calling fc->ops->reconfigure() after obtaining the superblock
> reference in devtmpfs_get_tree().
> 
> Fixes: cb0e0a8bf4e1 ("devtmpfs: replace ->mount with ->get_tree in public instance")
> Cc: stable@vger.kernel.org
> Signed-off-by: Simon Liebold <simonlie@amazon.de>
> ---
>  drivers/base/devtmpfs.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/devtmpfs.c b/drivers/base/devtmpfs.c
> index b1c4ceb65026e..44683dde04377 100644
> --- a/drivers/base/devtmpfs.c
> +++ b/drivers/base/devtmpfs.c
> @@ -72,14 +72,25 @@ static struct file_system_type internal_fs_type = {
>  	.kill_sb = kill_anon_super,
>  };
>  
> -/* Simply take a ref on the existing mount */
> +/* Take a ref on the existing mount and reconfigure to apply mount options. */
>  static int devtmpfs_get_tree(struct fs_context *fc)
>  {
>  	struct super_block *sb = mnt->mnt_sb;
> +	int err;
>  
>  	atomic_inc(&sb->s_active);
>  	down_write(&sb->s_umount);
>  	fc->root = dget(sb->s_root);
> +
> +	if (fc->ops->reconfigure) {
> +		err = fc->ops->reconfigure(fc);
> +		if (err) {
> +			dput(fc->root);
> +			fc->root = NULL;
> +			deactivate_locked_super(sb);
> +			return err;
> +		}
> +	}
>  	return 0;
>  }
>  
> 
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff

