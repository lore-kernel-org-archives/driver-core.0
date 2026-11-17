Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904597;
	b=WuJEopj4/UCq93ZOa0CNehY1veC1gUDXr8eRiJ08mN1uVrnhcHHhCuhTmj4FniM8KEXX
	 fGE/DPcN8h16nW3ioeDgHqMoZUdgChpGT2/IaD+2bTqFZFNHOy9+eSN9yPORjKeOoB5+c
	 /DoHae9WUvArMhqgiLNiIMElpIPkvk08W8mLIsHIpmDiMcQUR9Mg+yGMi0gLXasI+iEX9
	 K1UYr1fXiqPprQPfJMQDhBsbDsEhceYHgcLkRbHk8V7sgAxxkLs0m9DkMuaTFBFjEY9/7
	 TPslnoND0TBc0+tTf7mEb3vHqGRzoMSz7ZsbpGCYlazoswWXn1hUrksn8lz1ilX2i5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
	b=TRFLOXa0oL1RHyEzp2uosQOsFa8tm+oDoy6Da7yBbVufsmEHr0fyp4BDVEk6GRDYfu/g
	 55B3y920xvLEipVOhnbiP04u3LfzDbT1swbTxnSYwGBDm4jRPYNRojLTyvNpw9srvGORm
	 Vl6SLFRuGnSyPwznii4k/iNd5UoXur47jcCDKLsa2F/5O147bv3wNsXkcfBM8AdKulJhf
	 /VCvQnBHHb9C7cciZSkGRMmk3jr6NeG3f1vDUgEqNxSVfjZTJ4ZsIp5SqlTDaxhDOkGIv
	 n6rwFi2ZaQ0d/dMkvKaWrrULoI+DyHW1Z+eQpMombYjKm6q4pLXWEcCVvyKdfxVdaXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="aYmM/GlQ";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F79606A88E
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8F79606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aYmM/GlQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so35813465e9.2
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904592; x=1795509392; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=aYmM/GlQram29k41kbBU3ySezqx9KNWUNuYe3i1xKxJ0y1xgZQ+LJM/FIr9UDBi5wt
         EUIqGzXn8CbeolIR7DvOKSNeYuIBqIeeNK8F0MQKLJ7qwm11En3qO26JhPNvGk2paD69
         U7N7xncp/GRVRFDNcIuifTpVuVJNG8jU4Q3wXsQNed/0Tg0YFTxAIww71hMFw+5lkdi2
         GSwBoD8x4+l2SuhioCbR6ytEgNPnEziI9cNFaAKiGxS/sGp7TnJ3m82dxZoPJmTczkS5
         Bb33DDhE3GKslfQDvo7yH7Tf+R7T4kSPBZf67kZ/+WH9Lydj4/+1e7HD0vsiAQN2GjGO
         iL/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904592; x=1795509392;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/hxpfxH2Ygjpkkpn+gEQ4NFMpeA+YPAHTw9d0qdSc4=;
        b=Suh4rkIeRzVeB7nprfEjWXsXsd5fjira5D1yYomB+dPSKP+UpDBUGklAqdt9QvWRK5
         o7uqQqDsvMwB4dS+wgmh0lSLJfGr/zL16bWPkRuScYhEC/dkX+EXtcJ3Cy52pWbOd/9O
         GJ0CO8XHR/WNnNx3L2k7G5GTrz7DyDaARTPea4IZ5bkMkLL348TDNRv7oTvUpuPCkz1y
         rmKjMpkDh1MHOrklqhAYR/2x+ZNw2P2ycqpaOExB4lDgw4ArViXBlKR/9sUyHWqh+WXk
         vwirQpq6h1qGJhrFcDEqkWjsuqoSdaLJJYUvjA4oj25ArIVpq7QSKP7pnOs6Mcg8bZUd
         tLEA==
X-Forwarded-Encrypted: i=1; AL+hErH96pjKiBGUcGJlZMZoDpGlQQj3Eu+PB8fn8ixUN8zBYLv4q91OMqaEQJhe5UrS//3622BtszQ5ek5Uyg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9qDik8pNACn1eTY/OVnum7nEFzlEMy9pNvDfup5+gwZ4+BX1TU
	Tq6OJrEER8jp2Kx2GL6hh7XmtLisp3lkOUiUQXEgxBEet6lkoYpSFgGIXpF8b3lFCr//
X-Gm-Gg: AYBFou22nam5K74zV+F4IjQyXpyNfopDmxzJ5UTC0eoH8BXnjEYQ6UcwF9Bl8J2nrCI
	+UlDOvIn52zeG1mXhRR8Uj3OxoWmWV59cI1ha2KCCNp6dDJ6tl7d3CN5EPsKXSs2SN2jwCCO7tX
	55ldDmDK7rtPkD1QlDCn4E3Ado+UwUSQvbdOwArxdki7PeMIagbhJ0odAyWQtxZdusuSlPPzROf
	DroZueS4DNLdRGK7O1MUFstKVmlU9ryIZO0T34ShNbsCUuCRETlQ4co12paNGkocPBBYThCDmgA
	eEGbHueTLm5CI1KvboO2nSIwvLuoWNDNd5tGE9ostME2dEKoIqyx6XtV1swrmxB42Ex0Vy23uHI
	SzGhKa8TwawpTzFxsDExs8ygneQATpWPEQbX2JTSdOp8c4cxhUE7rhBrbKURwGOpMfy0837K1zp
	l6zMtPb8wd0y6IZBB+jHbtr/Ko9kK28hcs05oQseAVZxk7yVc0NFC+7eBujIg15XmyVdldp6JsV
	iYjA485dz0ZQOsJSvlMV+BlTJ6XatPElCaQrDUACjztUVO6xeYFPx1uKWkWxVjqcVFWML/RP3N7
	aYE6Mbl/gd6egku5mF+oj3VMNTk0rumnLSwmSbgT3cGVi+GeWBXnXxThPdVvwg+NXgo5HiQWEm4
	zvZQwalxbkOQ7TWj34hyuX+83Wf8U4VM6CgnzZiRonyhSJMq1dUQ2dNcn
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr266345525e9.21.1794904592167;
        Tue, 17 Nov 2026 00:36:32 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm52548565e9.12.2026.11.17.00.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:36:31 -0800 (PST)
Message-ID: <411502f9a4f940c223b2b88d7e19fafdce63172e.camel@amutable.com>
Subject: Re: [PATCH RFC v3 29/44] s390/hypfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:36:30 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-29-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:05 +0100, Christian Brauner wrote:
> Initialize hypfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. hypfs never holds executables or
> device nodes.
>=20

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0arch/s390/hypfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/s390/hypfs/inode.c b/arch/s390/hypfs/inode.c
> index 559b011e68800..8662169de477a 100644
> --- a/arch/s390/hypfs/inode.c
> +++ b/arch/s390/hypfs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/errno.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/vfs.h>
> @@ -301,6 +302,7 @@ static int hypfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	sbi->gid =3D current_gid();
> =C2=A0
> =C2=A0	fc->s_fs_info =3D sbi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &hypfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
