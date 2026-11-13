Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564338;
	b=ksIEaNQoZA7J7ONW+EYFMMogSACsdJJx1tl5e5GQJ/uZYIUuAZFCRZKJ6E9hcRYd5Qv2
	 0ete6oHrCp+OfMR3KmmxTe6ear2XlzktM6Gnhqrk5IYL0H3ZgwpiLZr/4xceZN645mp0b
	 9G4A9SKcCFwDNpc/wKHarL4Lkt3zLllvZxE8mQzG+6Pv+yxcxVId1E9Y9nq19oXfjC96H
	 LrwPPYWYAIHJwEOvwX0zoUktbkgYbamr2Waxgw4O57ro9Att2cB86Q/AswWRuwes1hK7G
	 hvX/1OXh608toJ1oXmv9IWozEfyXN2vApvJR1uzqu6rqkPq7seGtsDBmDYubVCy4RXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
	b=RVQrYfxqr1cZgmzYssCjQWggAFa1IgQ7chI/TJSIB1+MtqgyEZT3EtAddubbwIudUnaN
	 /MCF6+QAI/V8uMsn8teTUyyLi7RArdbJVB5LMiX2XAOY2FCFz5xMgXvcypzDbBN+Cgrtb
	 NuEpnGAOdL5M+4UcqY+jFhFPldwLaM+HIEqynlbaqjce6uzqZEwrKAIGG1HdCR3Jw0ZRg
	 UWixBiUX481e+dzAiTPpYZkqKLOwbe07mX6pyak9YN73gP9r4dnIfQ7RgXhderGLLobvn
	 MVsLjzE8brWrCOV/PI1jEXZQmfshKDg0ueEpXfrawePfSBFfPMHxf1v4Y5WagEyN9ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AoGia1ij;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AFE606B134
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AFE606B134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=AoGia1ij
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c5080ef9b31so142137766b.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564336; x=1795169136; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=AoGia1ijUoi5POLg+3kM2/Pe+o1QdHrsano3zTnVFrn0BdN0JWGlda2M1PK/eIT3W0
         BN3m/MP6RYCvYVBOGo/SZ8S3Q2i0XokzNrc84sPvoRmJYPY8v5S5a1Fih+cvceIUQKGz
         pjAFVEhotD15D9Ac2eXZsnnm8Ota4W1xN7GlPLzqg6f2KfLNrKFAVi1ulVefSZWtszUq
         Mc0eaQX6XMN5uRyMlhpufNDowzvRtSAxhE8fiESA2SnQJfgFX77r2aLRpQUu6eGsN6fa
         H/q9Thit2w59GDa0Y7C7UeVw0t+0EzECj4+kv+4diuCGRzpFKDcUZ2ilQna79OhC/X8Q
         VmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564336; x=1795169136;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ZNAGjGCHSUHK/hbpNrctHFuArQcFUaSPHFuYTd8W2k=;
        b=a1h6PTeNiocRSXib1dXOezNCbrOYiH+3tEdcOpwpWUYIz3zf/EFt795q1R2MaQ6ITg
         kvl3g4Hq+xqzzPQE/Xqs7CKW2/6NtOnCA7KEVxRxFwX6fyebIQA5O0WVmxqi1gbUldH8
         +Mj3eqx2tD5k8rBJ5iZcDhthIGKTL5+aTkymfBhYDNRSDwld568CbFnhBjEAYbbUZCop
         n/N0jjgRjmtbENeNjZ0ruTgoWw1PNkuyfkyc30AQaveed27Bn2Km+54IRqCbQGFwC5mL
         ZAaPsMSEBHUuBAWdX564YuS6fmTEDc4M/gdkZeopj9HyirLMkPgT7sWu9PkvjEWe0Stx
         jWSw==
X-Forwarded-Encrypted: i=1; AL+hErHD8C2awuYAfiFXYhocckFHQjRfRhEvHXjVjylOotARVZh+0gGqRkqR+IpaSU15tBTDjuR9gpuT/eWfzg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+XW4QGrRjzRzf1pIUZv6dPQALpYB/NqeMEJYprXT4uoWZWl6G8
	jkElKOzqfYxmMpE4qA/WxRmWfCXlxcwMPWMnIR3skmMa+uE1qxJcO0SWKpob1jp6QYVQ
X-Gm-Gg: AYBFou2RNTSpAm2LNV4YRANmbbXCObiqg3WDanGje6TmXQJZluo4rM69m29YribbR/x
	QvRi0rWm8iv7j7vfqIQhUNDVGWmczlSA0ovBrEdJbIKg07rU8LafbfbouEOYhO1JBNydDQpfwv+
	mMQlS5vyhfSNiGn104e2tM9ZdhbPjBck507hnaZWFRZd30NljWq5IXUZ5JUqIJ1AX/gMSefOkyl
	6ICjJkiArsxz+wK+prghjdWfZtSNHgW/PfytTwC9Rj7Y2wae2atYroYXiZCflhe88NwjEi/HeYw
	2WvRuNj0VOn1Fo5MPFc1+P7poPQI2Pt5V/vbFMFt4Ob38c/yqgMJmIE5nnaDWdGg4fZgkRexiBr
	FjfXZrmoe4PPZYHLfNdEf4MKuOp1zu0k2/hSWdZk6NAW1/s8E39CtpXcvm7AkM2eeO/Q+AgtSeQ
	xlyj/R7obhkACqp/QcIzlMePL8n1PzE2ByYAXWAq6YOK1T/B4jJpsGSMKZvjR4twZBeDOzUu5ic
	+7gTIaCyKGzEOk0xxk6F7FJVi41mbzkyGqkCEU1Jtnpn7vH71XzlnM8o77B0S45XaBQB3EE3uwX
	/c2eC62xBLYaSGSrfwH60bPSMltVAmzDC7HPUqMWj5byyubc1bx/hujg1D6iqNc=
X-Received: by 2002:a17:907:94cb:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c5096389759mr162937766b.41.1794564336347;
        Fri, 13 Nov 2026 02:05:36 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm75365566b.5.2026.11.13.02.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:35 -0800 (PST)
Message-ID: <8f532a01f6cc2eb73582864343e25be4ec990919.camel@amutable.com>
Subject: Re: [PATCH RFC 14/41] debugfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:34 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-14-4c998976c6c7@kernel.org>
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
> Initialize debugfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. debugfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. The debugfs files that
> can be mapped, kcov, relay channels and powernv's memtrace, map data.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/debugfs/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index b4915551ad31..f163f0bc5703 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/init.h>
> @@ -317,6 +318,7 @@ static int debugfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0	fsi->mode =3D DEBUGFS_DEFAULT_MODE;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &debugfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
