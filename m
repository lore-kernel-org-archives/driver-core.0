Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564173;
	b=oSJrlFMkuYouGYrzMLl8aPnxJP/siQoCobyWgENYrbi75nUq1jjwQgyulDvRDPD1R5MR
	 5AVyWHFVyLCfDQ5qnwpsdIq+6N1suarHW/uv8JPAdtCKe2BawGHxCYccpfn4DRsFCEP/2
	 H24awO/68IrhgKjB9oNT1doPbJ+9rabF9BEHNUx5+MywyR3iYCdeFew+H1CztUWQw8db0
	 4XRNm4xAtLQlcFV+ZquHgWeei6sNTpcqFpTXLrQyXZPx7wczbrfQe6MRxIbNyLZakDWjC
	 wwbrj8EuCp+RDfFcqHsWGIK0eOm6wNCWJAAp2MjicIPLgEenyc230ZGh8V4sdPXQ5Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
	b=bOEqwyZWcW9Jl0+MUztvyGed5/VxyISSuDyzpuemJL4EZA+8Vk4ah7X92SnKtWsIBtNn
	 tRi891M7YiFEtKiBDV/Rx0PU97hMnxqDQoCldGyXtIlMcO+L/k1mepcD/WgKBCEe0w5Qi
	 87QEuocGNOfijwjC8fzo0VcNGdvDlise+4iqxtMCR2WKhnF+iUCsxUJzD4csVL4prUw9L
	 vYYfrC6H598cq+VzwIU7IRANlv9HhQQoiU0n8dkAnVdoG4etnuo2b0f089qU6vAMjN1Sn
	 SB3Hu3Cr3E+mb/I5FHNv+bZmpWkiLQdTycoWqLuOBRZGtDrvLhZ1G2aXiK9Nh3ofcXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="CE/Let5C";
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65BB606A31C
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B65BB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CE/Let5C
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so1098388a12.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564171; x=1795168971; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
        b=CE/Let5CxzzBdQGOWfMewQl8H196xi0GSnvrBplcNDnNV+1kYp4PkVMyr+d2SZM08b
         ztpyC8ZUmRyXY/lC8PleWDcqZ9ozuUHcpA5SgwiL0uPF4nV/74u27b91cdI+qyFmwpUx
         J8bpGjpUEp+zxGj5Tn6SK6c6q8Mt6RA0nDgMzrqL7jndZzEkbsZqxddyoVf3BBSaewVA
         08RlDFLoYOfSqLw1R5h3qhfpuggtkAFzk5ZbwpZjvsgpZl8xCz1GAJtGTIa2JpgRfY5H
         48C7QzoCjaJcwqa9p0VYZNO86bahrR7/FQxlXM0qNKyYcrKLG6oN0KhylCMb3fIB3P4W
         gTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564171; x=1795168971;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QOKRfXbntKilXKCbQIPuMXmISRmnU6cXIBUGi5zYMoA=;
        b=aHu1jHx6WaDNCXg/LKbS/jk9qpNcsgr7IBzo4f60tEZY2jNPTLPaqEAhWDffMBl9Ir
         AaH4jMl/MA2xC59szFZX6Wck9n2UL3I+CmIXjbE/E0AWmD5WcpuOFgcJxn2qi46gphBQ
         y8YkAzdvPay92a+djqmaopBLUU/N+V63EkdUJVfRP3l+77oFTtmtmA58+kiNczT7e7MR
         2b9sYCZjkyLRNiz7gyIs3p/2m06ebtboKhZ6hnkRQRBi46zOoZW2dr+Z/aHLVRPIOGTM
         bQQOUw3cmd/+hWtfoMuftbcnmw8coPr/6od9TaMQ4FMxdfBFE9ZSdOdb9e9HKFgRPWFR
         xj3A==
X-Forwarded-Encrypted: i=1; AL+hErHr3M9zNxTW/SVTHkxZQXoq2gWKuw9kDwOovRk7Jl6yhGlpOkfU96Zbvo1E1g6VvqSea12xs3vMfzPlXQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z++EVBR0xyvMy/PhCRnZpDki0Ci+MnidTHO019+K68yOs6mFlM7
	SF7KC4A93DQR/K3arY+tJpzIPFIqHTJl28NWRXzbcsjxpLjIOQQ0t5luETlF/mY+M0Yv
X-Gm-Gg: AYBFou3A1lmvnykEpnLbZMyQ47Ub28xYBrgPp59lWA1IJ27hEBhGDiY6OCBxLDJlxYr
	aVFzUTTYgOG3pHclD0ZK9dLCYwvO/C1PTA+qdGo2YqcsM9i1NeYGAa5aN914yFMPPdxdixJ+9JB
	cAtZs6aOA1HN2h6Slzt6FOqidEmAyCqDw8KvoqV2unrT6S9fAXj+KvoX6TXVWBgXby+l8ch51nZ
	znx6+4Y1amnNlvcWI7Yz2VzJg19PhBBrFg1Rq0X8Q+SY+X3QCGwBTuC5JkrD407M67DzUEKhGW7
	qmi5qD2FfDgGAuvPgFStO3aLwIqVSEXcNqeNzhss94SGMB2ma7nWesb8mMh6pzNxj3f2Va60Z8Y
	XkeGcl96OoEs8mlU9PtW+6O5wL8wZCF9N3qURGi+arg27qoEOddRpqVr11hjhaxtFq7OvQK57Jd
	4ZIJeNiLIBWyY5QZ8zgkpa9+MFwSZ4b/QbAo5qYq8ciXClmBNZyMPzs2flFY+xBvqLxgYYp1/iD
	EyqkwdKaF/SBgSngScpYJKy3MD/jvANS5KVvm4K95pptIU57K2SkiVmp21YP9bTtw7AKUzWOeLp
	Tz73p4QtohxglgMbZ3HN/6LFcfflumZCy0TDdTbmxMhjvAKKAYDcj1pGW3WkCLM=
X-Received: by 2002:aa7:c842:0:b0:6b7:82cf:f69f with SMTP id 4fb4d7f45d1cf-6b7c0ceaefemr1298014a12.41.1794564171137;
        Fri, 13 Nov 2026 02:02:51 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c262338csm739270a12.33.2026.11.13.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:02:50 -0800 (PST)
Message-ID: <06b194053de4f4b65895248d1f2ba29d42a21b17.camel@amutable.com>
Subject: Re: [PATCH RFC 06/41] proc: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:02:49 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-6-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-6-4c998976c6c7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize procfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> =C2=A0fs/proc/root.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/proc/root.c b/fs/proc/root.c
> index 7fbbe92bf73a..ca0e75081934 100644
> --- a/fs/proc/root.c
> +++ b/fs/proc/root.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/bitops.h>
> =C2=A0#include <linux/user_namespace.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/pid_namespace.h>
> =C2=A0#include <linux/fs_parser.h>
> @@ -265,8 +266,6 @@ static int proc_fill_super(struct super_block *s,
> struct fs_context *fc)
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	/* User space would break if executables or devices appear
> on proc */
> -	s->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	s->s_flags |=3D SB_NODIRATIME | SB_NOSUID | SB_NOEXEC;
> =C2=A0	s->s_blocksize =3D 1024;
> =C2=A0	s->s_blocksize_bits =3D 10;
> @@ -350,6 +349,7 @@ static int proc_init_fs_context(struct fs_context
> *fc)
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(ctx->pid_ns->user_ns);
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &proc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
