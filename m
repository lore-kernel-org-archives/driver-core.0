Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564190;
	b=oAsx8IJrvJA+r1+9oIzSn3KHshxl7lnES3ciyBfFItyqaZP6s3frOy3fGGOJ/q6R/bPZ
	 nUZZgaDntneiPfKUU+jTTBifmstisyxfH7p5Q7RJzvz7Y3bcOp5LFnS/pKOw4HNugIStK
	 RaQ0bPJm4FjS0R2zjCQNpjc8nkcku3XuH3f762esQQaMurHy9Y5FJzuCJ+4ovhCEhyTzA
	 SFo17JFIRtMIqx7urr9pjqy+1xV7behBIYBfUTnP8+hyUQAiEKZD12hb4k5Ff3FF1Uph1
	 fBTVJXCVyXK1cjSay0TrCzzKBdeVO8zWmwZdu78/rbSV7+/IQIW6TT72Xma2s+9eJVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
	b=qCatEVDtFHj1w4S9pRrBYRw0Riv9unt+Ucw6hXA16om+4hbeMds5o84oH1b4y5CZiloy
	 J6B5IcJkgpo1iWDNaRQ2osUIK+EbA9Qlp9LhI3KOhlIWgxaDAsUvGS3J9MQBSamBpkTa6
	 tzX1jxWpCHuxLXem8xEmUA3BbsMn2pLy/LFERMTa/4jSYVa+p6gv4QL9faBv+oQqg4RjW
	 hMXVaKKvKKYdcaKCX3VU1O8/uYfQDb7hEei8aAlZWZbTkMzHE+pY/EAj0OPDvyEBjUN1q
	 I3/OO38XY6WqTrf1Z4SfD7NboItt7IhZV95RXGWu/gGiaZiI7pV0Pct0yMWEWvC49oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A5AXmBug;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E5606A8AE
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A1E5606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=A5AXmBug
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50a4a2132cso50319666b.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564188; x=1795168988; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=A5AXmBugVWQHGj7zCfxDZY7ex0LnXQpTthb7C7xEqYHZEtqxyq4pM1iyNZVnvB8O3z
         U+yOzodWK4Mj9EaaHXpMVKTCwYXWzpf+NLKvmzWEVwG0chg51TFVB7t4VZBLaeedN30K
         e2dpZDs7ZLY7mIYQM+KBAXVFjt9iMEALB4qeGXDVJAFVERTqqT3XNB1CAZVYamfSusZK
         tcPvxsyK1ZKzkpsqy8RltsGYx9+kjExuGAWkfh91lIO7fwQJzFrH93g2lW0N0aCZK5Gc
         aKKM5k7XdIF0EfPiBLp1YcBXT7vT/neoCHrjc971xHu0wQGBDCepBMk7ymmm5FEydAnR
         QJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564188; x=1795168988;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoW/gPie2WRRtXdhiV6ow6HDYwH4jtR4w1oiMzBwW74=;
        b=kW8YxRv5/xum/abrYaxNoZs4Au10mCzovfCZpdLaJo3Hi0YtMLzjORWog4gtaqLbP+
         +MCsF/Rl5+BMXgcn9Fzh8wVzdBrppWGSB/WI66oXvu2PLIHv6z604CI4U8n+Zc3UHTI+
         qEAi1ztTrSPN3mYNIPpD0/xHMU+BogASjc0UmurTlgBb2am1fKKXNmGTMkT5IU1WX++o
         Bn114e6V5/b/6hcMbvyMBX+Oex+f506JVw7IcYxulaGpsDCZxV+tszXQ7E4FdS7StZR4
         xfkV1bgZDBrA9tFIa4ovUTUTmbBXvasLPg2Qik+crF+VEyiaRpDUJbmaYTkzehvzJBbj
         2v1w==
X-Forwarded-Encrypted: i=1; AL+hErHQJuFV3o+rImcATWjz2dhE3AsjqIBfr4r9xpOGI5XasdeE2f3WL6i5cnCUOTg5UnF/B4bv60jnhkSoEw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9fYGUhxCB0tit+r8bydgT5XrfthjN68idByeru9gB+EVLUkbUV
	XndfTVajsPdkbo/C1fwW9lB5RP86qKF9ybDIhffFD+myhiRnbYGvNPC7xHyCQdYxckV9
X-Gm-Gg: AYBFou2pOUb0vXoC/frehHPTrLTAH9PIoNW/Tg7L715SDEnLVGb8inPRZOm3G3/3Lnz
	yWjVF/iLonXpu5Kc3mhG4ld+mWPHvlDLM5zUPoD19i/qiiMYSTKX+DedymhMwMY0h+0XFiKy1Zf
	m9hJn30nu0ps9jOshXUXvrZGnsq70E6Y+zo6R4y73raXxAQHWrSK2yMv0XOQ3W86bUGUFF8QNxt
	nsrI5+oUcFzp3XPQTaaoY1gNgaGtCwJ/mf/febmAZl3eaVpZLoHUxASxk6LUpLbYObzZt2q3k1O
	aJcGF/lESDbydU0fqYI61ED2L5XgXEPzvK8L3662Mq9NRyD6K5J8NKQ500XzqA00SWXG3A28IWE
	YyGJbnXfniVR/BtnRBOu27haWn239lxXpOhpAzfK5e7SZFqzQJGyHa/zLVOjYd2MUMVi9XbE78A
	rBI22rZSGiXvvBApC8jPFkL4n/FvvP64lXf0OxZT2cQJQRDndwIK2vSyVM03KIuv9cghzcrGaZ4
	iDwSBBi0+t3XWtAcM8loQKOmMIaiN2zRqoYOOV6jfotybKl9moQNrEuvS3FRPVxn9zZVisv/lGN
	8RzitMbpVer6ctWsh5CMY63sHYBgopzXKRyMl3ly5PlyMTME
X-Received: by 2002:a17:907:d12:b0:c4c:b4fe:c9e8 with SMTP id a640c23a62f3a-c50963dbee5mr161853166b.38.1794564187801;
        Fri, 13 Nov 2026 02:03:07 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b3dbaesm74933966b.32.2026.11.13.02.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:07 -0800 (PST)
Message-ID: <fffc4f7f87fd5f03d1ef409df76f71ddad552213.camel@amutable.com>
Subject: Re: [PATCH RFC 07/41] binfmt_misc: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:05 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-7-4c998976c6c7@kernel.org>
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
> Initialize binfmt_misc as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/binfmt_misc.c | 5 +++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
> index d945b4f6e158..7dc233becd98 100644
> --- a/fs/binfmt_misc.c
> +++ b/fs/binfmt_misc.c
> @@ -22,6 +22,7 @@
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/kstrtox.h>
> =C2=A0#include <linux/limits.h>
> @@ -1575,8 +1576,7 @@ static int bm_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	if (user_ns !=3D current_user_ns())
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* Never exec off this instance and never let anything stack
> on it. */
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> +	/* Never let anything stack on this instance. */
> =C2=A0	sb->s_stack_depth =3D FILESYSTEM_MAX_STACK_DEPTH;
> =C2=A0
> =C2=A0	/*
> @@ -1660,6 +1660,7 @@ static void bm_kill_sb(struct super_block *sb)
> =C2=A0
> =C2=A0static int bm_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &bm_context_ops;
> =C2=A0	return 0;
> =C2=A0}
