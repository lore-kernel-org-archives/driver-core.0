Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564237;
	b=uJ6gZmF6jXzQ5ejgC6ZTiqizVz+YUsh8vc/mLkqjfxByp+eltrjJCf9fT5tb/gZ6LrC8
	 OE3WMKr3GKuKBt6+1XgNFQT4SOCmJG1j58Hzx16MARABI7A0dAtrUFgx3E97wLAC0PtUf
	 5P+RBM6vB40H5esVLXysYSHjyMZpNB8NlHNYOnBqoKSh45+a/MGMWcX2lWXQIcfPa4jP7
	 Et4iIb1M/GFt8fwCpzGUmgnIedFvXWm2wAfn3k9BCkKhWgWoI1099NyiHKq2cE6KSrQw0
	 QvfzNY77Wji9qzH9KkL88GZ2qmq8U2/P93h0GTJLRzM2qRz+wF/oyUganuq8r9VxOsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
	b=HgHgkEPNzCsTpMR5Qw//+O1u/6CB6ZhEV+/ye2Tg7C+J0OydJjtjsMaKDYgpYHplo4dv
	 f6Keerb95g1Y7578pIxzcaWZVqT4+j2z70OwxxbVJESSBIV5Rx4jpziBw1LuVW5G7OGbP
	 yGKwhwsd8qa7hKNlJzv3Vzpl8IeZsMB5Q/qABVLU5ClCeq4SfsFP/HgcqZaAr3WnrdceE
	 Ui1W2wEr3BL8FNFIjbmjxcZIktsMXCW1Bg2lIPM+cY/9hsM4sQhl3RSaWjV4dsi/mB1JQ
	 laigdBHfYGCQPBU1NTR5ks60qSozrbK0vOncP1auNaJFbiPLQBPmzsWvgzXEpsN/DdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q+lMz2fH;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7B606A339
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF7B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q+lMz2fH
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1441615a12.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564235; x=1795169035; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=q+lMz2fHJ9i3ZjybyY+NkVQU7sgwYRyTXlZ+WjMrlNv4qgDUeJ96f51YP5y4KWISsh
         INTW6Ddk59Cg6VNJ2rQRM+UJkEGZREJB1MfKeuCFhrhe5QemJ8KX9wYR9KTdHnxBZxcu
         5xRH0/pVkHe2NjnKa1l/PLhbaWmORZqnS6b4gf1sYNMhN9v0ZQHV+AZvO5/iI9qh74Ja
         x71nDvqD7/9wpgWbzemm94G38fMdL694mQq3QVtHsF5wiqE0FowPDdLLgfMUx63JpXXs
         3vHJZaXJatqwPAiTGDTWQohO2KfvIc8UHDBj8IA/aa+A/wb35COZDzmIU3FIjU4TVIE9
         iRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564235; x=1795169035;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=isfwHOSFEU1THdAtyjNR/BymwB+TGu4CpGjFt5oul8o=;
        b=xmpPDoOLwT8rhoHwzYjscMOvcFRBJyp3tQ9Q5NQE5e5MweiGFC4IuHD4DM6XRu4+s7
         wnwY0XU2yYeYknJQWBZD9sX0Vimn72U70XHrbX2EUeeFl1lzTYeyW4Vzjo//QTew7uvo
         YD/YmxylH31BnZ2An2rV0j75LFcQ4Nag3tF6AxoafXmzIpVpBA7OyEfP8I/wDDcoH9jD
         JybkUVQFbqoobEirYW7rOvX1KYecjHUt3UGIb2Je1S6un0JVAt77yVxu1Qi+qs5sqyEu
         Hp6KsidG8eMmo5Xn9T9h6tLAqwuMR2CwI65TPEQdtWH5pHXt3TC/J2fiFXvMWkIu+Gx6
         tVcw==
X-Forwarded-Encrypted: i=1; AL+hErGZa8gdbzx16540MgIuuujI0AkKMo+o3HQ5pVCcGqa8JGz+Xs4y854n++9qk/QHMeWcU8q8CfS6dF8J+w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/DJd04JU5FxkToCHoGg8CWYh0+cXDY/CSwR3GmysI8pBQjMnwC
	NmEsE0uI8SfgDZisscIaSmCjIvTMPg8mBYkDVw6zqFAvbZe9VluQRzdfnQcQhCF7lZ78
X-Gm-Gg: AYBFou0TLnLpdWbzGUBpeRidNPw+Kx2qwHdOsHmcf3jRbQqxQmvfZsIHTFLm0CWx+fo
	+znlrxbd9IZXrm4TnY6tOXdi5KTTA4/1D9DFil5JGmO5UgVyprGjp35oBF5C7pFa0LVwz7Z/tXt
	DTIM878d4MnXkUUAGhxGCqe9a3bDOWOte68GNeLOUQYOGacoTzKRxP4QizqOI+usDwGmcloWeEM
	WAwm06SAe9VVfKtj7Yh9259UXKnCClAbg8s0bAMQ06cIx6HW5u0pajHHUsfVreUjo2wrNjBeMBb
	n/oKJuzmRuQKP6cVwTx1D3Aq5jTrBCIbc6m8VBWzTBDI9Ck9+NNNsQZ1jEZO+mYPJrnRcz18lPI
	AAiuMgk3yTPM8GG978ultfB6u5c6+dgQr+BXR2XrBLvhGSNG9/nEU4PplMmKfWrZQ861Wf5FDJL
	VhlKt9bom1etwlhW+nqyqH6vLu77ZoK29mKH9ThcECoXY3nf/f5Qi8ELOp6S1+VNPw47pB8yOhS
	j1P/5eu8l78vz7sFeu9sVNJqOXWJDX8ViPIm5vw7iAC8vNVtmOTSB8yPUd41daiFtHmEET282v+
	lS9zB4Wp1Tlp4iIQhLZ7l6Awpd4laTR0K0Q0QeCZ6mYBwNeE/hYPK6MjcXGcBqw=
X-Received: by 2002:aa7:d556:0:b0:6b5:96e9:ae97 with SMTP id 4fb4d7f45d1cf-6b7c0ccaafdmr1234919a12.34.1794564235160;
        Fri, 13 Nov 2026 02:03:55 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm766458a12.9.2026.11.13.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:03:54 -0800 (PST)
Message-ID: <16dbddeb5cbb9613dc806b43fc681eb26aa3b0dd.camel@amutable.com>
Subject: Re: [PATCH RFC 10/41] nullfs: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:03:52 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-10-4c998976c6c7@kernel.org>
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
> Initialize nullfs as a pseudo filesystem instead of raising
> SB_I_NOEXEC and SB_I_NODEV by hand. This adds SB_I_PSEUDO.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/nullfs.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/nullfs.c b/fs/nullfs.c
> index 319c2f5c5a67..2fe24cb97160 100644
> --- a/fs/nullfs.c
> +++ b/fs/nullfs.c
> @@ -2,6 +2,7 @@
> =C2=A0/* Copyright (c) 2026 Christian Brauner <brauner@kernel.org> */
> =C2=A0#include <linux/fs/super_types.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/splice.h>
> =C2=A0#include <linux/uio.h>
> @@ -174,7 +175,7 @@ static int nullfs_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	fc->ops		=3D &nullfs_fs_context_ops;
> =C2=A0	fc->sb_flags	|=3D SB_NOUSER;
> -	fc->s_iflags	|=3D SB_I_NOEXEC | SB_I_NODEV;
> +	fc_init_pseudo(fc);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
