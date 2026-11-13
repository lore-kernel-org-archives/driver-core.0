Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564363;
	b=qwNiShMsUNmQ14IKi707fB4NEp1uqK4THA/FCJdEBLr4E/r/SaWa0cogekDKVJNM3ZXA
	 /R8ZyHG7FHn71c1fzej+6s5aIbG5JO8pMRVnWpVvDrJNUh3JiXrTyJmdbEmWk1nGkBvLn
	 zMR7gNMjvaXsfAmwu4lKstZTL4yg6VnJuou+EcITS8Pe6MXziFr5i+cE0kjlfqPSme9ZB
	 itH2Ir6DUFnC9SJNYfy9rdUV0KxJAgkhFT+biKdOmOFOtuSsj0zSrkN9LeqhDuDhHnWY6
	 TVfxJVQuzOnwnEPGQf0plHOlO/xCr+hgAHXjeF84yylqqyC1jij0qqFLShxOz6Aav+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
	b=BGoE5Y1fWy5C224DLw2xmympr03a/ycSwVQQjv8Axv8cfSL8FN2t9vMMeuphHhtSr2ms
	 k0EXkR2tKaZuHUzrqWbcGmjE+c2S1EqTYqcHpRoRz/vfUri+8j8AA9pcgOndqiW19pr2X
	 8nA9ePlqTlEiMB/Jte5VuimYnROIkjuwtkmKYf7H/dTgaZGaZ6I5R+tMpY247A33gdrJn
	 csXe4zVxCCGdYmodZl8GOJ0KsMexWYssf1YONGIKpl0SS4RiYKDICgTnQ13JL5cC0U2JD
	 Juoy9zJu5vlgdEyaJb7VAFKnpOEPsPuaFP2c0tZzzQKkDoedy9nBgPIt3luu+XZu4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XkasCFgR;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB74606A32D
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB74606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XkasCFgR
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d581da0aaso117997766b.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564361; x=1795169161; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=XkasCFgRcW2n/QtIYXNSvlZBXNIBBsqMLGJuJmkERtFMR5+6z0hqHlKgD/xMArveUW
         J2VXj8PiVwQ563gSQKA8C7zD1fnQ6Z35WpYPA65ISHAeJr7NugcLhnhIpruuH2y5fXWE
         GCouy1L2EhCfo93wX0075MjqQecCEYGUhFZPMB+ht3XYgLTPxWRv5+/LxJIMNRojVtnb
         n+dz5X7qgHwxsAu7bmUE+fDNj7BJNQ2r/uCX9NDMfa6/4v6bkGqxnd/26Ch3aJiF7soK
         OlD2oi7cJ4f8SSw4zxIykCl7xjg4Aorga6OmCWorwRAb3B1KEikWq4Ep0Qnx4WWbTfoM
         Qu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564361; x=1795169161;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TjkCmA8zoLhZK8u7U4HhR7QcElVzore/o+jClE5BdRs=;
        b=DUHbqrIzGbuTqlOAH3KFhyqqNZex99fFDG0K9w0kPIoRgLpYRXTZIia/n5qwXm3E1e
         BRyBOhe0rqhbggIRxcqkwjwExMWQlUZUpzK3HgpCMlTIH/nbKI7e9Go9PimuSJfrSBo7
         OdOrCdwB6qwuapnN7wmFnbd+4HClJnS/fbDHmb1blBXhrfWaJr6mZ6Ew23aNjlgYu4C0
         X1sZ1hwYvFa6ntWAiJv1NlQ0ar+DOQV+0e3/D30ujwsQf5ctNNoRqIcchNzXvg9OANNi
         /4dBLHY4oA2vql3315S05XzEwoBCfU6IREopdWH/6kF6jVG9m82dTfu04YXbvoyGO47I
         QkNw==
X-Forwarded-Encrypted: i=1; AL+hErHbaFr858AV1SuwBrsQicnHmOHArCP2Wuz94azKHnWZY6gLcE7Gs0pjetZXjwQ376H7USt8uY6p/sF2RA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Ps8kl4y82/Vwv+h6NArm3F1MPLKOMr69G1eWdpTJIpSag6MMO
	QOJDhSSixVYLL65em/ALGpZI6f67ODJywYvbJeVUAXodx8etS8LWc/AHatYtwLWpjyxh
X-Gm-Gg: AYBFou2d0mZ55Fj3472WZ7nbs4WCloeNubBO8CHLaMOA98z8Gpd+LZ5iYTHzwbG+chB
	OqH1+4tfXa2bQe3ibBThBqj7T6CHMEsm4hYvsBAwLYx3sdCVvkMaZ5hUecMjQO/aKpRIt8ZdTmG
	Nf/2gIfypTAm6Ib+BFjLSPHExhnZ0aswhP74Tr5M693F5/Lo7DuKrr8VUAzTgs+ngBOl1qPjIp0
	ww/WMFmbGYnAZ3EgxTtEmhjpOXCWO4wRigQ9fkBddvwIG2q48/zhCbJWb0GXm6IQWevRM2cg2NZ
	mm507a2p8hjTPdIIh2AFsOy3G5R9SJqMYGEQrJSYd4PfuQrQKMjbWjHdhLG4fnZu4AHcC+Cqi13
	xtQwkV2+g6swHxd0K7RUFBFAe+2/bcKqjTk5k0MsX62vipZd+GDcF7pJTriuRNkpdgws/yhkFXx
	d4DB4IHVdfMAGOKp3lIvSkTfh2Bp0zJ2YDneVeJal91tQoCaqNuJ9gABq7p70I46PinhEekIu6k
	PPBn+oMCTqbc30uACgAenmNr3Yh/QqZiRFE9twlPvPZORue4vhG01n3AN8NVbVcLrq18xZTIEkS
	Tdy/9qM8UEYx4KIRoQlxToswDe9BduUE1z1RaSzHry1bQnVqSqNsMRHlAdOmc/c=
X-Received: by 2002:a17:906:ef07:b0:c4d:5820:325a with SMTP id a640c23a62f3a-c50963dc627mr169588066b.39.1794564361325;
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8651bsm73693366b.78.2026.11.13.02.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:06:01 -0800 (PST)
Message-ID: <e8b71a2778d7d7797d433e7bac1a37ee64aaa30c.camel@amutable.com>
Subject: Re: [PATCH RFC 15/41] tracefs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:59 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-15-4c998976c6c7@kernel.org>
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
> Initialize tracefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. tracefs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The only tracefs files
> that can be mapped are the ring buffers and __rb_map_vma() refuses
> VM_EXEC already.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/tracefs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> index 5020365ca704..e04febd868eb 100644
> --- a/fs/tracefs/inode.c
> +++ b/fs/tracefs/inode.c
> @@ -12,6 +12,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/kobject.h>
> =C2=A0#include <linux/namei.h>
> @@ -510,6 +511,7 @@ static int tracefs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D TRACEFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &tracefs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
