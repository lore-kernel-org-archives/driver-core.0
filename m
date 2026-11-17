Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904345;
	b=VoyV89Dx1k/d08sSopUlITFy2cLf3rpm5i/DLtMPDbSFcJVNGoUl3F5OZ2YYuFpBAMCb
	 2vsjCzs979sadgJIle+NGG7Ti7y0Wfjjf6qn/Cu4p4dHGlZq7HTrCzf2etsX8ykGChghl
	 OHM+TP/ipJFdHbQ/qPZ3jQx7/Et2d71IUIYUl5S8bH0d87fEKDATopGMeSXNfuZPaD13u
	 MRu6TjjQIda1av114+6itvFTBa3F+knWpWqNmisREhrUEi+beLQVmN18V0auuJf4D5qM1
	 zCTP4qP9SIHNeV0SIPghA01Mh1HfQ6kAhaX+FjUEu3FtnlLrjN+HI0XCK3KjTUInR9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
	b=cyc0DtCP5qjcuO6/3GXILVQkq8v8XfTQzMRI5hzBwws9/i72FHN4EGKvqRyX8UpBJgNy
	 JcOcIXkdt18MQCmzLL/WtpUNnjI3AMAqzTBo5pzYEgFrSzVTV+zs9S4t0MSGcbFaYkSFB
	 o6/ZA11kOfM7o6v7Ad27gkMbPAnU3gLpfWQOqT1lGQA6E3Osq/T43Hl9EOebCetMHdlgs
	 w/Ha9JTOTZdtK1ahjErI1cAHvXJYjpLBceSlnlHoFJm/GuSxygaI6vdOc9EbaHS50KJZJ
	 8lH5k+CJ4H6GFm4Z9uR5OJNfCbjN+OuHU1Gf43Y3treOHRvZ7zV9+oL2jcd3pbDX8Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jPfu0DYs;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CD5606A8A1
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8CD5606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jPfu0DYs
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso178008f8f.2
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904343; x=1795509143; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=jPfu0DYsnhQtr/mqX/UMkNCVP5/36h6J+OzgxseJXEKFg2OSvwC6DciwjVf8p6kVZk
         SYcOS6EtexiH85saG11Xzuyvcim3gsYZwLTKGUumi2TT1qWkxrcCpGY0jQUY8x///OXU
         EVYmlDEHqjmiBc9KhnXU57dwEnlwoyvy7D0MytltmsqUm7UGakcMA43tRGtj1OpGzvYY
         2BLFZns4KvnUVMkKQ6+cjLD9zn9J2bumSnbI3MQAD6IKY/VIH2b71H7xZ0nQNdYpdgAi
         3lmiG0z7sp8azGKk5UvTpMQwuUp9uqSFTU5ElbSr/7K2IZVRAMpHv8IfEUdM/eBYHdd3
         b3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904343; x=1795509143;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGZ2JImQ8AaSp09QdDpLN1PoylGc+Kk+7WphF44IQ4E=;
        b=McaKRa4X0I6SOPLiI+tX7StE4vtN+zaVo9muV5L8eG1SmZiSmjJhymklRK+lSLQuEK
         37WeFxS9GxE3JerUtOrDu0OY/2K90fT6W0lJttOkh5oPTUqWcEY1beKfX+pO4O+4v2mJ
         vTL/66uwcbsbIhKTsnrs4NpqXyg+Yh93ochxeQ4azl0Napb70fcrBBlYmtANn/x2+2H3
         JCljDBqrVb+b8lkJmj8k1PVYPZu7s9R0bJDnGrqpG6sck7yixv2i+nSVYvFzE1W2Svk+
         qY0FzZd2prFrRyirBvYG9tQQrbf3oR7HLQVjtlIi5hTD76vlcla0WNdhGPDhLKUuAaS/
         skCQ==
X-Forwarded-Encrypted: i=1; AL+hErG8mlYza6dtL4/CxsKobSBRI7hl7kC4j16E6G6poDJJaKc3pWpWDACOwW0/+tBd1lbJkka8h/lO9PleDg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9GV+0wJFjoM7h0zhxzm+E2fdzPwtdg0qZUBNIMAq3evaDP2lzv
	0wiP16r4CY5l9G1FVDzKVdnCZt3U41olsFFzcEcVtrdsLUTXjji3hJYmzbP6T6CBtv8E
X-Gm-Gg: AZFdTZfrvH0FSUpdtlrm9nXKjoWGg3Sgpyu33MnjoMjqye3ewdq7SqFmmHOY1yM6TUk
	L3uiuf/L7I7964BNKOVnmvTxeoj8aeQ3COlNpXeewGVyUjq/YduwERB7/bwU+0K7DKmW/7JhCFu
	KIpt5soUKxoWmJ2EZNbm0qGff7SLH28gGx1j6tWd/PGyADmOisKuog02OlZzh9hXhsYJc4REypR
	ZIS9QoAQIDUVqBuF/5EMs8n9wuGklFJmxR5tiVx/wWW3RUbpR9fgFg2eOHt1S+NvJ2RYnDYatRP
	Y09I0AV41gvO3btXhSp4vCEi/rJ6ote4jvD81//bv2Lri6SqIKIn23q94Q9gnanozYnfodErAqj
	/30v6RuGLIQ5mWbpuNriAULdkD7gzAQLa7GnejQhMxZytcvHwoBcWP+TSaJIqB/cIEmMlw7bfVR
	fU3cMtBVENAkdwDRpffrDN5snxs1bbzUymUTv7EOcEry5orIDBO53Bxj2o93lJEV0/S9XdSUP0I
	w/HHFxJTqNLx3H+LBbG9E5p0A5ffCCk6r3B8IlCZLx9iWwM2UtbGEZ5B/M6Ep3T1dfLGYc7cABS
	UmpK0TSqy/tyzpQxXpWwnS/UhsUQoHajOPO/sCJwYw8Kdmg5tCl6JBH4NfRqqN1TSkZ8tdSOLrZ
	1cNB6KHnmWPQLdCXyXVH2JBhgWaHBMCojynFz8ruDGcoYPmMrTtUYT2oW
X-Received: by 2002:a05:6000:3108:b0:48d:f9dd:e3de with SMTP id ffacd0b85a97d-49c7353c415mr27089117f8f.45.1794904343236;
        Tue, 17 Nov 2026 00:32:23 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm43646659f8f.44.2026.11.17.00.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:32:22 -0800 (PST)
Message-ID: <fd39200976086130cc82d59699a988fc3e0689cf.camel@amutable.com>
Subject: Re: [PATCH RFC v3 27/44] openpromfs: use fc_init_pseudo()
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
Date: Tue, 17 Nov 2026 09:32:20 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-27-8cbbea1cf34f@kernel.org>
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
> Initialize openpromfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. openpromfs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/openpromfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/openpromfs/inode.c b/fs/openpromfs/inode.c
> index fb8d84bdedfb2..6cd02d456bac9 100644
> --- a/fs/openpromfs/inode.c
> +++ b/fs/openpromfs/inode.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/string.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> =C2=A0#include <linux/seq_file.h>
> @@ -419,6 +420,7 @@ static const struct fs_context_operations
> openpromfs_context_ops =3D {
> =C2=A0
> =C2=A0static int openpromfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &openpromfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
