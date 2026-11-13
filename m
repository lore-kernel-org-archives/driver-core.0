Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564206;
	b=Lfr9I/iFhvq4lgl3bjWtVb51GeboN4mnXHCjg+ZhbT5fIu9iPcVS88Ss2ly15xsrgjYx
	 9pT3vPuyY66kGC7xx+uWtXjEa1s8kQX0mG/Xq95Hd4fV09BC504wvtyvfHT4E4JX4BfwM
	 +61iZ8XS00EPh8oL7ORSCE9uq1l+6YnjhSdWgLptQn36qqDdZcD8c2g84hi82ub+hFHDq
	 SWg/XrkqY64j5QtLitZBdbrVuip/+ptMrxa7DpSgNL3cRZNwvYEPX8nU3m7ODzm88maue
	 R1lEuIOaDnWVf46qtBKlP+OJPK7ZhIRiElKntqYCMTLEx29uYeLriQQeaMdYK1jN4Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
	b=J4JoO4ZYcFxebvJjm712dhnqX4D4rAUWMdoyFWoyBKKgYhpm+Og/Ft2mVud4JW2FSCmE
	 H9gk9a7qKqbAC6u8QRhAf6U8SIy/qE15MA9FdOoxmncumGarCYMpgz2wYnqUsEM0O/xcm
	 /qw3ViQIA/pruM63Av+VhuIrKu75/j9sQM/aZM6KHSanTKFME4mjM/W0XGPvsDDPcvsrx
	 Rsgp5J5i/Klqmtn4IsHUoIwn9dTKiKZXipm40iul35RN4NobQcIflEiqYepkGG0B1RnrS
	 IJa718Rs5IH9lIENJVhZL/ObPnl15CSp1IWGNdKaDImZN6HcayliasuPOBQ3KocdNZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jxmjOD1a;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108060A2610
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B108060A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jxmjOD1a
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so1193798a12.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564204; x=1795169004; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
        b=jxmjOD1aHRA2R1Hi3ZWl3j0ZOodJPFK2qm9WAbCdp+JzmUT3mpZDWfxLLNYa4wWF37
         QpPbYxRrQ8E3XpPP9fn0qWFw/aER/GznbEaktvuMsdS+Mm+8yeaaXQHQ2EgSxBq2PrGr
         8Yaksqquc/U2YHZKyRnIlZ2k68SfzsGeWZXZzzCenlb5+nwamArR6ajrY1KAoS4FGRH8
         fJ2pADZxBllItxcAaQFN2ZB6i73jQHr9OcuqrB0pCowy3Ssf8EJw6wlrvgYO6dqyTBjF
         J2l8uwa5br7QPuZNTDnMB5LRlagizf5aj7GkdPUkSQMNrroKmr44ACmyxZtPNrGNFKTM
         qEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564204; x=1795169004;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yP9dZgkD4P/bNBFnmHOgKVBIpz9VJZUP73dl9853V04=;
        b=t92ELUn0Hg7ssu5etHn/FVVv6xJLRyvqyo0I5GLy2ASwpZBYxapgJMs6F0hc7bDlWO
         6IxhvKX5KswsxHSU26WONqBVhtvliDodV6qcfKOtAvhXMMzCrU0AEtPogDgzhZWCjlLW
         IOx9e9WbtQxFSGlIqgtFitv8kyJ7xTjGKOZf5cFdVXIaW9ggcF5WWbLpov2hTrO+h7UH
         BRL5wXjOW3LcrKwGDFyk58LSNMtsddL4G4F1HDESpHnShwYtk08erlvtPHfz4gHEpq4b
         UaFvd1/8L2WuW4rZ+qp9FyucMPkrPJbEXg88G1pHRzCwv/WVI/EARKkGfVgKw+F1nMtm
         +DIQ==
X-Forwarded-Encrypted: i=1; AL+hErGtUmhNxVxLY4MvVkbl2DiTmgyx3Gf0JVCSR3xrc1tGEWlWZtS4lIXJYcrirX2oiqAuq5VeRfkIxj5b/Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8oajq6xMIG+wimGl11VyGLq185AE3Panjnn/douOmolIzYWjrz
	zo9PALjm3jwyTDSu8P+hLmwjigGcopVGoFH5/wk2APTSkdYnlnnkpQ6A89f5f3OH5hWo
X-Gm-Gg: AYBFou22a/060L3BSFcDp32sH/SOEWOy9aD40dIsbBhLxJWHJqAvJLyrqgYye94CUDM
	E1JT5mBtDsAiYpKc7He2wEBKsLDZMtSy4CiQN4HrH5fLWw5lcl7LXU1wrTrsvHM8HE6JtKNlgXX
	koB+gRFtYys+O93oOm+GTkijTZh2yCYqgoJrkM6ojfVgSF+4EHRFG19ZM7hcUMWynprIR6WirC2
	+fwhavhQssxdN+2RcHsU1w0hdJeLESyo9hmy7mfkiu088mBlgb85y285bRjCzYOOIqH0uNyxou/
	iUGEZnNOmyT38PWDf7F9GwShtQTrLRSYnRDvQU0hB4ygWu39Ig4f/fWXIX5mtx6tMagtjoeWBpe
	KlpKHZZw3XEPSXC7R8e3u2E/4FBjBjpgrR3qoZYlJ/B/O1SkzCOOmdrG3IRDKsBGAwqRvGLOKUo
	XoH0jlZH/irrX7sG9lDYngJJYA/y8AKJWYi1GyPQiUkOQPxUXltNAVOqC6NBdewi8IEGQWLIfSl
	KwPFcbCCCFqgc/Ru8MkUgkSb3xLqT5/aOC7k2tnqaanFYMMnx1ffww0MsDm4t/8q0jGleuFnmVR
	m5xT+42WcMrTo+VxjeGVgPb43dFRIm5lTKUL/Y/Ikf+uv3KwpFxauKwrfqxQhEQ=
X-Received: by 2002:a05:6402:270d:b0:6b7:d479:654a with SMTP id 4fb4d7f45d1cf-6b7d47965e6mr298323a12.36.1794564203570;
        Fri, 13 Nov 2026 02:03:23 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c236124esm752333a12.6.2026.11.13.02.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:22 -0800 (PST)
Message-ID: <e5f36cc53b733383ac1d1f1e8c03f73091595edf.camel@amutable.com>
Subject: Re: [PATCH RFC 08/41] mqueue: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:20 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-8-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-8-4c998976c6c7@kernel.org>
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
> Initialize mqueue as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0ipc/mqueue.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/ipc/mqueue.c b/ipc/mqueue.c
> index 322c3dd98c44..8bbe32d0881f 100644
> --- a/ipc/mqueue.c
> +++ b/ipc/mqueue.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/file.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/sysctl.h>
> =C2=A0#include <linux/poll.h>
> @@ -405,7 +406,6 @@ static int mqueue_fill_super(struct super_block
> *sb, struct fs_context *fc)
> =C2=A0	struct inode *inode;
> =C2=A0	struct ipc_namespace *ns =3D sb->s_fs_info;
> =C2=A0
> -	sb->s_iflags |=3D SB_I_NOEXEC | SB_I_NODEV;
> =C2=A0	sb->s_blocksize =3D PAGE_SIZE;
> =C2=A0	sb->s_blocksize_bits =3D PAGE_SHIFT;
> =C2=A0	sb->s_magic =3D MQUEUE_MAGIC;
> @@ -457,6 +457,7 @@ static int mqueue_init_fs_context(struct
> fs_context *fc)
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(ctx->ipc_ns->user_ns);
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &mqueue_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
