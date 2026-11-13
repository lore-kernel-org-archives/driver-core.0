Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564840;
	b=f+oJSr/DTbJlMKOV7xmcXiauAKQtUKjhCqemyWxY7RAG5jGk0apmsz2rcBGnR20d/96R
	 w7rGVDD3Ushr6SthWYfyRCaS31ZGXGbI3QXUP4uL3cJ8HT2DjtsuQrH6Z9biGqWHy2rDv
	 c9wX/QaF3qr+Fju/OC7or91T7+MUY9adsW2DeTl3NK6o7JCxHH/Ur9+t/mTjPd0eag8vX
	 wzw3z+gwC9DPHbpMac8w8Mg7H3nOIkTMRnDChHwVcvcoicOPuHo41e5Qw1utWH9ulTbYw
	 mUmqz2Kn7srPOIsLt9iVyM1ngxS54f3gtzy1LZaXYVYHw1O/32Mk7/Pe6fsWPRvyLeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
	b=q61V9cHGl2EGZse+xw+SnnKOdNfs3ys53aKU1TE7Ocqfrb+sTgavF1MSMGa8T+dsVgaq
	 k9jLF02tSmudTWgOmEAzsZo6PQAEdz2xNnSZgpLVhGlnFOM+biWcNLxSdpjU32iW9qOEy
	 F9T5H0uGGUXKIgR/kmaeHnGxLnc8cpmLK8MeuFXk0MAKeDE92vtytS3OP22Jm18rwmh+e
	 FDfVijZ4zpYhDBhWp+RL3rllGZS3pKUaC2YF+Zt3rSKDadlMOEMHWG+dky9YAt3LguvoP
	 SFZf0T59JGwJFK0+ciwCdnk5B0TaaOLvXjaKFBavgLjeUX3UT3wQRlg0FyJF5rvOBJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkmPFwxl;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5681F606A8B6
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5681F606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VkmPFwxl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-491d1f66968so207278f8f.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564839; x=1795169639; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=VkmPFwxlBt1DKCLk7Md5fLX4sExE7Go0YTW2KyJ3Ob+xcELI51Gh5kBlyEza3uk2CW
         2/BltvRAiDBCN1EanEp0V5TXUOPBojZ/0AmskP7ksgrYEBLZINv3oPPLN6dBk0PQHKvO
         eNO6bnwI73kRLHO5IgQoWQTWfDMrsisQOaOhi7paYOrkWbd1IvwmpIBJ5cWsUqt65JU4
         +yEvymNmPLliHA69w7R1xHWzwpXdNq8OK+bAuYJRQewpZfkioB1HnG4LEz7Dt0dLX/Ru
         ePSIMvsdbHb7sRM/LmdWTqC+di/we1OoAsFHrXsXAr3EK6Wu+aCaZYLtG8/7MLDF25fG
         kKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564839; x=1795169639;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LWRhkHq/o14g3eGvU8PB/2eVsiZ8AcgjQiitoPu4Uko=;
        b=h7Bnq3y8u+YLaZtZfuRMB350uddVPSrI2IC5OhPhJWiH5xIPz2VpJdg1yOVGmyZqm8
         eI4LuHATG+y4B1xCHRKC1IEJIH3NYoO1E3n80TcG6Hk/d3hib6MschBG6NAo/VZ/mhKR
         WHXrSsyqAoUc5aET+7gZQEU18sm37gbwVlpod052nfvRINw/cgxJpGKHUDgfReQPHLNd
         6EVrZFQNXZRUaIgOBoteR6GPUswWDzVwy8gRyFlLUOvDdnxjYc0aKv7YzujNnznynRI+
         s1w4DkiQRe0HpyIT/afXgQi885ex6S0rC08ygebhSmVsKoeHTIcCPZA886IXbSMfNCsF
         S/IQ==
X-Forwarded-Encrypted: i=1; AL+hErHD9AwqdgV5YwtNBAFPPwZGa7dJYs1QpWg84w1pRHwyCmQ3DoVuSpHkqcwkYtIHtFHupkXwG4fspT61Ug==@lists.linux.dev
X-Gm-Message-State: APuU4Z8zO/o1fbALdA246ct6UoOuSs0jjck/I4l14kwfLM2DEyPDKCZz
	CF6EeSxtkFmSYfP7Ke9qfvXN54bMa4kpPSXgJ0boCyUb9DNHI80zJlyY920EkLSu7pm/
X-Gm-Gg: AYBFou0dSVOeqYDfRSKSZzdLRjJ69AfKJOwtuEtTXw0zXiWHaknqJP38EdTzYmGV03d
	UIXX5T+/2AaMpa40J+wf4Hacmrt2zaJ5mnry8RjOzJ0Wmw5dyXWAS9fVcq18V4sIcKEiKomPtGV
	4jvJBmYe85gwW8MzkHrhe7wOT8n5++5IVZZNB1MbTpF6H2Zp3U/MBZoSykAEkHdBW5U3A7LIZps
	NTUh+wGO24J7h+9L1aoxQjifxZJjhlrhhsxAbmWuur63lWGHP+G/8TOrfB6P4HDnv9RuqOk09Ke
	guAPg5NpfHbvJccyHdMzEgs/iMcoxx+N7rX1YcjoUUTC4d9+/wB3yhUD69hc3bs5uGvNPSwxz0d
	0aCSTMn9ZXocDpHDhrYoZ5l+xb6gkQ7dZcG1ZH0dkjks0NZrUfA0MukoTWTdPzbMJ87PqGrpscq
	TKYgXjpXwLVU3EPNY3bcWgGLLbnM5tIxEOcZmIdIZg7higptt63vrIdKZ5ESFO4Ed7UNBucEh4r
	hNhMS5p/qn8Bdibuu1AN7fIKxVz7qdvIBtJNjc/oLhzg8uLJ9to7Hs35/MaYz1ggPfi/xLSYX8Q
	pgNJaTEP5uAauztBK2fEVjj95bLf0cLxSrMDOchONmXhBdLZPnqowgXB+B7v+HQ=
X-Received: by 2002:a05:6000:993:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-49c6fd932f0mr4358101f8f.12.1794564838578;
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d673ce75fsm190118f8f.55.2026.11.13.02.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:58 -0800 (PST)
Message-ID: <77855be3fb9f0e1888c6dddc56d73a1683c820f0.camel@amutable.com>
Subject: Re: [PATCH RFC 25/41] pstore: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:13:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-25-4c998976c6c7@kernel.org>
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
> Initialize pstore as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. pstore never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/pstore/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/pstore/inode.c b/fs/pstore/inode.c
> index cf499ba72702..4658561cf90b 100644
> --- a/fs/pstore/inode.c
> +++ b/fs/pstore/inode.c
> @@ -18,6 +18,7 @@
> =C2=A0#include <linux/ramfs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/pstore.h>
> @@ -491,6 +492,7 @@ static int pstore_init_fs_context(struct
> fs_context *fc)
> =C2=A0	ctx->kmsg_bytes =3D kmsg_bytes;
> =C2=A0
> =C2=A0	fc->fs_private =3D ctx;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &pstore_context_ops;
> =C2=A0
> =C2=A0	return 0;
