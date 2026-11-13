Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564378;
	b=G9QfhFoKY5O7duiOU2N9K+AjeMFAAxdAx5P4yowPKtm1Ay0ThZOIAdADKwVCPWT0OiQ/
	 nc34gOeH4X72x/wpHwT7YCGe0VFmlx0a+BBektTDR96gtIiEoKqR/2fewuG4+AELzDTyn
	 ZK1x/erX2T0b6zeQgzzd0R0irxoLjoBE9apScY038qHZ29SRsgkOK8MuLri7ARbnchlTu
	 dR0JSnyWanL5TPD8kGcwFud9BLslaYgZCNPiajkAv6KeShYFBgS9ru4y92ZjvDViR+YQe
	 W7Kx3SthKmNlUCp5jgfjL4hxJx22hLyEhw+H7zmiAz7PkAy071OsUK4k0cP9hSmlcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
	b=NQdqQ7yBhaK1P2vVd1E9VEUV8OM600rKJOwo6oFWCX6gZUYifU73jfF4241y45ex7mjV
	 KFGzn2lakKvVe0iIC3RE6DY8Ezt2eY1vL7iHmu9mx0k1NV5XWzWYlm03X+SDFeBUbgcqP
	 nzmzQzhSUTFJYNgYguRrgJVmg7dkUsrww1CjJ8dnaVnnsoOZOaPoXkTS69C2w4OHHZspK
	 H19cS7EUtYCeQVNbft42AWUILWYwksPyMs2/Sk5TMlq9l5edNpUuIn+cNgLhkygbYnaIU
	 Qh8nyRoCwYhckyftlcD33RQdXVXMv4bNowDWtQxIrPZbHk6fsoAaQu92655VPRG8H6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GgjqTCm7;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAB7606A337
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAAB7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GgjqTCm7
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b785ca42ebso1499717a12.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564376; x=1795169176; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=GgjqTCm7Kj5MQFDKFqubD1FnGJCHeJvNTYTUuQ2gPiceCfH1RyQMlmD5DRF+oa/BoR
         BCdYuYqjNoInmO5e+o68ivjTe6m5iMAF+wWKmuQ5qo5ZTedHmBnbD97mBHzXq9tl5zyL
         6HzB7kynfUXQ1gQICGGSwSbb164cboI66lYa0zrHE5fZSQXzsu2i63guruX+a12jWTAB
         MmLnokqXzngoDK0e7I+hhbAD9ncEFvoN1/2P2Ha1Ev2o2Bpv5Jla3GWUmPGWvPfDMkI1
         UOCMEwjyYDO+RfZT3UJXeqjNblrjJ9zs1h6n0v05XtnFSpD18LDuYEzyI2Pt05y7bwS6
         HL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564376; x=1795169176;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBVCWZMOabVq55k67Q8GIm9NBAOJHOxllLRlvncSbis=;
        b=mirIFZJ0OmzmwbbUAPMhh6au9EQ7w7yHgvIzUJyyfgx78qZI4jB1m8xDSVwSsGFUpm
         lFbHUg/zLZPepb1Jge3itimfxadtkmeWJO1hJ3Nit4duZqfBJto3yQonWcYejg1oDGRV
         sjtCF713odXOjV2N7rac6XCGefS2o62555jarHbKpUKupTHl/x3sIpwn4ljzt3PIEBHs
         OrSPuUjwUWnqv1p7p1K3XgqBir+fpNtjGV6OMAdyWsISsJdfRyhBFRUNba1JS6GBf043
         xRRvIafST9nNyUGO7SKl+NPBXnH1G45ne1uzFoRMFU4/uv+ZUuOBQB0r96g/Fa93QS/9
         CSCA==
X-Forwarded-Encrypted: i=1; AL+hErEiFg1aJMKBM3/Mipz52n6r6RDyG/sIbTj/0zFjsFdnN+7IYR99TUtO8rcMn20CtPJTaY8OsejB9WQmmQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+r+adRhkYOUk92Ynopgd71c+596OaBUcoS20T5dgwJXbr2N0/O
	07TGl1+C72xgR4kDx8pWlo6VydJxM1TxupgBpz8nZNhguxJV5Fpwr09xDuaPpoQAiSW+
X-Gm-Gg: AYBFou1nhWNdcaZQ55USM38jT0HSbqeFFF4g9KrpOPLJvjj9NcYsdweyKEbVMTccF8v
	+YBfdel5Dh2E3S29eP+ZxN8T4vWLcU9OWS/YwXJ2FFahBH9pwmReYY2mxdVhveJiZMY5ugFKVNv
	h72crAxsDVhjQ+Q6a4T8i2/te4OxHfMxQZcwQff2oUoInYjSuMHASyyAoqQN7w9TOY0bwtpm8Kt
	QotLvwCh61lOKaWkYYRiRgxjy0omC3NIQGBQ75zGdJKozgYUqtv0voBTwWpY7X03XT+3kp3VLe8
	9LWsWvxfNtcnxEt1cI9zlu0Kz/d/RJdgjoaDKkYxliORJ9BzxGVzXJJEU2y6de3xHmqxag9BTbu
	O+E+6EtcRuWlCKDtgnzbRWO3A76LfUmsDDlGaZa5gyvrpdU8UpDKCA6fg2cmVz9T2lnuUiFm8YC
	vJ9takbj79EYgqLM96tR+/P2i8JUsflGFX0pvUMJ4bNSv5626NvtpNinGnH8nhYIMUTPn/pka0g
	DHQv63+XxoRtuPOUXwu37LqZ+MEOkXNSgrZnmxEfROTY3iU7f9+5vBRKmA+RjTaw1h6P4ZNHQYU
	Yhx8YlMXT00sBnzbTN+ZqF2Ku6oCC9wbGVjgC841OLVrpd0ENVIFV6w0ck8/kvY=
X-Received: by 2002:a05:6402:280d:b0:6b6:4dcd:967e with SMTP id 4fb4d7f45d1cf-6b7c0bbc394mr1685420a12.20.1794564376161;
        Fri, 13 Nov 2026 02:06:16 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm706711a12.4.2026.11.13.02.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:15 -0800 (PST)
Message-ID: <4dfa19dd41ec1a202182284d9617926a259288a7.camel@amutable.com>
Subject: Re: [PATCH RFC 16/41] configfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:06:14 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-16-4c998976c6c7@kernel.org>
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
> Initialize configfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. configfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/configfs/mount.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/configfs/mount.c b/fs/configfs/mount.c
> index d8cac1cbf3bd..60ba24e7ae2b 100644
> --- a/fs/configfs/mount.c
> +++ b/fs/configfs/mount.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/slab.h>
> @@ -106,6 +107,7 @@ static const struct fs_context_operations
> configfs_context_ops =3D {
> =C2=A0
> =C2=A0static int configfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &configfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
