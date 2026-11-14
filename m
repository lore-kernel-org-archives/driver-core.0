Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686762;
	b=Jv6PrJbodJZ2j7+SRZqGH5EN5Qb5ynaXbFZER+My9/lfgyWgGx88FvY7MtfNM/Fgz+rQ
	 9s/ncfT0Tkkm3Hq8T9QL4eUQc/an8i5V9F4nNtxmzJmOcd0DWyKA7b3c7snUiUdyOIJ4J
	 LNql8i2B5RGy8NiuEH2HZdEudfMqxg4MHxcw2R7pao4Y9YnPuVtwGwzBjyMPwTE5p3qNp
	 Ztt1k/qhi54BND3jNy5Y6EXvAoZUffrI1uLMpNoTIsiU1o3ABNHQQoU9jhxByZWe+a2/V
	 GgeFoVPcI3QUMA3NpuzFIuLvbccU0ppgMntqOZ8uGx3TaNInJge/GDugb/Zy0ML9N9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
	b=HUkYtm0c5V1jhkOKv6dMvhAdIJFCcdoFKOVUZqh0umZltc7/R37TIWAhfwNeSqW4wwOS
	 ZVJgQDigdOYaAsV0bBFpHfgl80dDIpmjRP04ULFaKXTyZ4d2n6KBKKnTBv3d9I7h6ASvX
	 RQyKLQC5lXVYmhIaXB+p2c09MGhyYWIo4n09Ebp4nfebw1r+3LbdTm0LwNwhih8fItjoo
	 HWoAVlK8f41iwF4QixnJw+FEjxY/tEWZBMS5kd/nersF16MeHLn6iTd5NgGyM6nS/X8mK
	 p0Scfa2GiqSp1H4hzA+iyJnwz3/kvHqy8GJEuFe4HYodIk30fm0Vy2o5b/4w1xI+tLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=v3HMjNq4;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B1A60A3808
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 20:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B1A60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=v3HMjNq4
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso2097063a12.1
        for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686761; x=1795291561; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=v3HMjNq41lVlbWtdzT4CFv6Psnqz6lFlawzd7ghXSUumwPeClYtDKOCE3eFYGT711w
         EZj0Mi6AOVw9gsDLJdAA9rn13sFYTyS3MvMJv/SqZgPd005e5C58KKdUcd56yaBOwxkM
         /4qjObAe1Sg78iPdnUBsPKDNFGLU+MaOOo47M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686761; x=1795291561;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9fh6nGpkdQ3PKE1Pv6VuACg3WWhS00/MicQv00SggM=;
        b=bcJUzktNo5PDBckccO7OWW70FIGtP99ZPi6wg5CjERMgmP1+X/DTBGrKSXd3R5RnHU
         NV16NLww6f5oGojMkbnOF3Of+YdQ18nQZep5gnuw0BEoLDP92Npck58T1HnbHL7QjMb6
         v/5bqncxE84GkK6/OFbXe8T+RicmeCkFI4Vp4NXQnyj/uzZTdWYcOGO287plGt2pk1lw
         b/Q0jz7LhLqS/ogREYMTh7BHVtfO7zcQAUVgJ0kljldPRUyLOMC2ou6FtydqIqKQOZof
         VItpE84V9ngqv3IZ7Yrs+tk0R656s7xkZZqmQuM6d1ZFpyUIQrL2+uo3q1ONPK00iY5D
         Z2Yg==
X-Forwarded-Encrypted: i=1; AL+hErFqWf5kADWrcK9nwjPVGSEONlpHn8Pl/wF9uJ25+4RigDip7YzAxa/hIFcpvZm47Kvv0vhNbH4yf4n+gg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8dvRLqRLFOad5hEb4c32EOXoT0NhQbwv3VfGMYLUd/64Mi9KNf
	LIWdc/785i8DoankZJvKHPEwK3H0CF5czZqq1+mYhAD4oAbxqMvqRHO1RbbsgACazT0=
X-Gm-Gg: AYBFou1QzkTYXO+GFIVpwj9ybETPz1lnNrgmOjMQxTiBMu8h26z0VHROJJDUZf/SP+N
	aeT7OuNABjYCDxFXO7gsh0J5kF9ZegoY4hPoMCSi7uqJcZmgdhI6O7JDl45K7yCN6J6CPzPSBI/
	4z2Pdu/IpR/kdveXfsoLVfFjUUSWiZcE5ZZsJZOAqwWsXx9V0xL96YAepYqLuWCXBUvOMD8VCtq
	ZWeeaLt0CfjlujzHm27B0ngGA9F2ohWHxSi/x4/urOfcTqyEyllEqvWlKIjgE4mmIrAtOOd/qNz
	Q60mMBHlD5I0Tc7Pu9OWP6jQChjBkTYEBIZ+gkgKLqTAQSJwnBUv/fz6lClsi/PFJDTR8tWJMsk
	BsrgV8O2zMR75hNdX0VMq36+DuhdyNDuC2x3FGje1c8FuZ8WrlJlG7Lh3VaTHnC2g+0+zTRUud5
	KcsvHMg2c9LvPqwcwP8mWfq8CCCV13q78yLT3pDYwUJAV6dlf3MrLyOxKdMIp7Daba/NXccLXRz
	NMXoz0BZ1uRxiPObyOKTnJ4r8fIdBmuWGeEGxlkbGfvqC0eD23kPY2wMYzE8+EYnruanBJFfpBJ
	JXOwcDJnH9auXVSVLDdVhJvCHgiwsUix43pYMATmidpRm20aKxKiut6DovIZS10Vbii9Yy93ytl
	WvoYsPc2EzyUv06m64FNFqLaboX/BFK3/giovu6nMQhh18+I5dSI71Al7uAG45b9Y48fD4BCfeO
	7ZP2OBTotTqRH8i+Ark7+jEqoymkyUAgL470WxnTPxezClMw91gpvw9s3H
X-Received: by 2002:a17:90b:2584:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b1b0ba61famr5629200a91.33.1794686761104;
        Sat, 14 Nov 2026 12:06:01 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b1e9ef15sm5258887a91.0.2026.11.14.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:06:00 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:57 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
In-Reply-To: <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>+	/* Look through stacking filesystems at the inode with the data. */
>+	if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEUDO)
>+		return -EINVAL;

This looks good in general, but what the bots said about O_PATH files
here is real. With FMODE_PATH this is reached for a file that was never
opened, so on overlayfs nothing has been through ovl_open() to look up
the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
itself, and when that fails it hits the WARN(1) at its end and returns
the overlayfs dentry, so the check passes as well.

Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
it's easy to trigger with that. From a quick test with a metacopy file
whose redirect into a data-only layer points at nothing, registering an
O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives

     ovl_d_real(/f, 0): real dentry not found
     WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
     [...]
      file_check_backing+0x308/0x5e0
      fuse_backing_new+0x219/0x4a0
      fuse_backing_open+0xe8/0x390
      fuse_dev_ioctl+0x53a/0x7d0

and the ioctl still succeeds. A normal open of that file fails with
ENOENT, so nothing could have used it as a backing file anyway, but with
panic_on_warn this is now a panic.

Maybe ovl_d_real() should just stop warning when the lookup fails, now
that it has a caller that isn't trace_uprobe? The check would still pass
for an O_PATH file whose lowerdata couldn't be looked up at that point,
though.

Thanks!

Chris
