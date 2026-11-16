Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794859450;
	b=pDbPoJCvMRAfh/NsJm7esax80NNBLn5R3xtopwOcxWFuyD6T5bKjxs5DbCSvi7uDmpiY
	 +3YTdsNCFVgph2IntKn2tg0cxZDsByJejqV0cnKG8WLjcFgTottiF/zMLz5vtRdW2k/q5
	 Xur/aQ+rouau5/p1Doa43wqHM4ojnABOrPalgrOZlnRgaw5mfXE8fQXdsk60JQeWJoOTB
	 0Ofeeas5jpiRlXLkOzeLARPI/k6QLvlhcuuZvnSUODUtcxu7fZna0UTieFqC99bP1RFnz
	 X3PHHynbR5SOfE79zVeDDm5OJB9EpzjQ/2I2A0w33A20JTG0aelOwKfep9qloBHdwYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
	b=nC2GBylw7pVPMZ/Bf1GYoPwq3z67STCVkWmN5u2Z1i2P9wJO1GxowWIY0Zzf6AeN+N0/
	 uHbjofIMJRHqCKMam8+TQ7M8GOckuWrSx7tGGxN0SC+QqeaXNOhrKL3sbUBUlvXgcSqwT
	 gSOhpii7cZvik41/IRNIXy0fsTLmY9sbChcKWK9S/uRUEYUoIRt5F+nd5M6bh3JxP+Odx
	 A3de+K9OXa74evyGgqsgByIm4k+pMhas/JBJFjFwJcq3o8eEolodzAhoXtBjlfcCGKYN+
	 KXL6wjpctQUcH79v/AlY2ZiaYMamiIQBsNy54ilVAMWawQz7z8MQRcMZIF39fBLAeBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHbfv6zw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBBC606A32C
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 20:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBBC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHbfv6zw
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1736451f8f.2
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 12:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794859448; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7aPQSkJQDe9Agor9Y/t9CjdcXD2RS4b8M5aVZ1C+6BFHxZNSM91KZDvLuHbvzGRh2
         SKyiCsGkCbb3g+83oRUMjlJgVgv9nSPhJqi9SLb+PS4gkk1LrbP0aLcoEJ8rtpZiBxGP
         rZ7H6BZBahw5p/HghJHktf781wyRIUE7c0BLTkStZAiDxL40NEBqwTZXlfxyD4weTw4l
         ZS6Lv5QVIXGMmadaWLnR7GiqLbZ3vPbjOj/qAtQb9LYPtO6w6b5/t1Rr5QNaypoOkFXU
         UFGgwR6BWUWGLZALPtL2roUileFrcBabtSKmwSUlUZZkMGbsS1jBQfMyWL1XeMLhwBba
         XULw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        fh=HKTwHT82Ni37IstOcbZKfD5Gw4XKDAkooo76ZNH2fFY=;
        b=Rsf40wzHeoI0pYNGMjeYcMvcGhSxgxmztS0FcwBFD/rJhlqn7RcMIEEWyzORW7bCOy
         T1bm0FGEUDU/JV3KO0UAtrXASev8BIDvgbNwW90k6gVOq6wFcQuKg7H0wPhgnG6Sv/59
         17yPhGZVBjJjqo8GEQ3uZIfdbAwucVLxpe5to18+SNVwpFrEenCBBpoKwVOgw5XgPKJu
         ZyytWazsG8Z4kaHaRuNbn02+8+THBA7g0lz+tzR0sPbaRs8bbgqSax8EO52/32CF728V
         8YbJ8B4S2rrZ8bCqzCtQZycfMV9P1x8yv3Kra4GY4jWIXHtDTdNHKzGqpUKVNeNGVCJh
         azvA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794859448; x=1795464248; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=uHbfv6zwy1lrNLaaDDbEkVO8ssYj/qyFKtfSbCf6dCSR34pFTLKtssc0BSUTVKDnMu
         mUY/++Qcz1KX8Ogb2sP0/Jz1g/BWEGgoFm5oS+25+X2no/pwBQ3/X78Kepr/irGJMSNE
         3gT/frU4pMxR7n1+ps02VbwjRh4tMLWxLxyNLP8keSVXnpjBVZPYnTT+c5wZ+iecIZv2
         7S2V/VFSlcgm0o5RvV16ycxlulKRs40excOeL7ZbwOsDzxUCMlYvUBzfGE+BrYAVAPFl
         i5boq8/bHOyLGWd4pfpgYpy2FKsVJAt6V8aPFCGg5KeRIJDFvIDXcerxrzKv91ysSK+Q
         s1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859448; x=1795464248;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEtpE65JhLGyAYaL/FOW2ebUIws2WwBZ/4Zy8VNXUuw=;
        b=2GLCZ7WPKbvSCE2H0Fi+1WBWRlD+loDJekfqh/dKByQ1QNvwwgLMLaithqpFsLn50a
         VCDdVeLMEs7vbbAwhcCWR5L5T5WEkUvBBB1cbp2D+zcJ08Q3JOG4tX28PrOS9VGKgy4I
         ELpg7fYU/c+1eHnCnzZUBijFsCystPOuETvK0SAuINl3yntqEbSCtXuth5R4uV5CtynJ
         H/yc+3uffKrGGRnXK14ddsfaxKB7a78XXdGlCscWFOU5m+SJxT9UY3YJY6q7C01xjRXz
         ZftPm2aijSQfHQHB3QX58zOj7T7VqRzcLmifxVZkhttbk/c9sOKLWXy25VT3NHz5v+9P
         HjhQ==
X-Forwarded-Encrypted: i=1; AL+hErExjfbqOfPx75Oe9rsZamFfIERroWgWis9xPPgkXsOwS1GSluNo3fJ6UhyTOOart7fviwu1lOx2/OGo/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/o+kEMWkcP/LKJkAaskcsK5p80zX1t5/JEFjShWCQ5f/oPJsug
	UxlYygHesWDHVld07uLaSoyTEV/H7bGkAv9Z7tKuWRMV6zNygln8YLieROzAP8I9bVivvDgxq/F
	0vLlGEeJvwbUXCF5BQ+CXCESkns9KARQ=
X-Gm-Gg: AZFdTZe/SoYmARD/ToNwz0ZKkcUAKEPTWFEVuRAUjnXHT8bTftHgar+1wnhaocQrTPJ
	GyMcXDq4W1+zSqbTQbK3e/YM72dOnuZEGYv/QfHX1YIEuiXwwNIEVRXS7ljQz95oXwVABJVTtQF
	6KP1TB/QMOguELHaFIaBYhui3uaoFXs2Bv9zpcerlMJ9i8zjpMpWU9G6V+C6mZzU95HVednWN+7
	SpgDNRNR0DVKXSFwDwPuuAl62xCPgTMleFMyjPN/ab7W0nIjUp8NlmLEF/LdyQ0rkoMahr5E4YP
	Dqmb/J94pgV3OW87YhWwVV5tWhe9azc/gZK6B51JU0engtAZ1FSeQvPzUxfvSvkNREF7dkgdicN
	KjWGqbpbb3XWnd3fsRU4GwePIvXCSKZJAUef5WK4tksOZYh/zXflS6C05sFY8lcpfcmLY1quEHM
	eblSyE6sz7lOsETlPexvk=
X-Received: by 2002:a05:6000:4692:b0:491:3fdd:af34 with SMTP id
 ffacd0b85a97d-49d61c80db3mr13343868f8f.36.1794859448335; Mon, 16 Nov 2026
 12:04:08 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org> <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
In-Reply-To: <20261116-work-loop-pseudo-v3-9-8cbbea1cf34f@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 16 Nov 2026 12:03:57 -0800
X-Gm-Features: Aa3M54q6P4M0RFDCKQ8HHGNCWJafItTSPdWR1qNwVGtToDAv2VOv8vDfWHzYR6A
Message-ID: <CAEf4BzbLFVawibuX0wk=8uzy0WZSYHbkgK55d7rqLab2qAM1Fg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 09/44] bpf: use fc_init_pseudo() for bpffs
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>, 
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org, 
	Alexander Mikhalitsyn <alex@amutable.com>, Chris Down <chris@chrisdown.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 3:21=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Initialize bpffs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
>  kernel/bpf/inode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Acked-by: Andrii Nakryiko <andrii@kernel.org>

> diff --git a/kernel/bpf/inode.c b/kernel/bpf/inode.c
> index c6f328e4752e1..57cf3775c0766 100644
> --- a/kernel/bpf/inode.c
> +++ b/kernel/bpf/inode.c
> @@ -15,6 +15,7 @@
>  #include <linux/namei.h>
>  #include <linux/fs.h>
>  #include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
>  #include <linux/fs_parser.h>
>  #include <linux/kdev_t.h>
>  #include <linux/filter.h>
> @@ -1197,8 +1198,6 @@ static int bpf_fill_super(struct super_block *sb, s=
truct fs_context *fc)
>         sb->s_magic =3D BPF_FS_MAGIC;
>         sb->s_op =3D &bpf_super_ops;
>         sb->s_xattr =3D bpf_fs_xattr_handlers;
> -       sb->s_iflags |=3D SB_I_NOEXEC;
> -       sb->s_iflags |=3D SB_I_NODEV;
>         sb->s_time_gran =3D 1;
>
>         inode =3D bpf_get_inode(sb, NULL, S_IFDIR | 0777);
> @@ -1261,6 +1260,7 @@ static int bpf_init_fs_context(struct fs_context *f=
c)
>         opts->delegate_attachs =3D 0;
>
>         fc->s_fs_info =3D opts;
> +       fc_init_pseudo(fc);
>         fc->ops =3D &bpf_context_ops;
>         return 0;
>  }
>
> --
> 2.53.0
>
>
