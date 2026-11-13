Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564808;
	b=Tj1W+p7dHbYW1v1vIRxbmPSmDhBcC0Sa8RkolNLzfaeUrx/r7H8XgZfWjRq9C/SB8Uko
	 Ode7AdQ/cBk1D8Zd2L0syS5AwKxAuasrrs8m29QxCOGjsQalQmN/EjOl1xgg1BV2mCjoW
	 EU24xJm8O+xdCeb2zpMF9sODPyZSskXwlF68LATjCGJjw6Zdar11FEECtXJqjidCE1hTN
	 eTAtnOUQQMPEl3Mp33Z7oT2EGlAgxl8ZwlC14X/kH/ci4U/TZecXRxJ9dzDvC7j/xpKaB
	 zyKKk/czqqOR5j9bf6Y3XeOFkJO0pVqpRcpPXusd6F+ha1bptGBHCruiNEq9jIp/GxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
	b=oWuwiDWeWfIWiIMiwxYgZ0O+1Us8HgTl5hAY1xT2Ml3+zZyspK5lelGcRVouHJYtjirY
	 CTovAy18hrUl1ph0lfDGrIgfa7TuLSvLc+Ko1nsVcJca7Iv22WTQFQYs8fglADJPZxQ8A
	 BNBn6W/O0keG1lniVC+mEIzL+8S7PvxMRJNBiEU8Ug2aFpJwAOq9F0uBNUbfii6Xk42vp
	 pSPwFZrfir0vqeYfafgh0RiuPbIK26sM6D70O0ooy/Qls7347CF2wdmF40s9AdkzZTRJj
	 e1hVZTVDIovRkasst+nVjuLSBCOGsTbe+CeW+SNssqx1hT1M1mA3eaS0mvwE8eLWSLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bPteaYF0;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2931606A331
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2931606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bPteaYF0
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7001955e9.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564806; x=1795169606; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=bPteaYF0LDLBhb4MMDrCQcGeBSYdEW8BR1KwVfhIGgPljNrsneiCwDwCEK9a5QlXNc
         tB/NVenooRESnkhjGXly3Q1Et6fehkL1U8U2E2ukOdtymki7dwsktQWlFRxZ11a7bzSe
         hji1GHW2DiXcv3Cnt80tThLj7kjseVPyDyN3t/EE9cQpMSvp7wgFveomObVqSHV5KJbA
         xTiwHsGIqBNzj/OOrSUqXhclJHqjr0Y/e6nO5oN0JD2f0DO4pN2kZpwlf48BmDKyAfJs
         BuAeimIkBNjxJq96KRmplvgcCfOOwtkZ68xFMnVL6czkbH5SzDP2Bq5leyi+KXzlgjwR
         7Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564806; x=1795169606;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX3uQO58FXw3i2m3kzI3o8uINYIcsljrdUAfEKBly4o=;
        b=Mkrd8q7bQHyQmU56QNEPUiCEtwFlEBWR1aSNu8bHr5MDFnPSMOEo3ugb8XJCdX5x5W
         PzK8hSwcVmx7KZnl0zYRWAXT5E2JF8pwfJCIC/B5PaLCsi/f2rGQ5UKtb6wuwZ5x8BO3
         K0WSnm3P7VmXOFWrQYBXqfpbCNgDiqRZiTLyREiia723fjFgv5U4V8FzRqcdXGj84qE2
         2ZlH0KoiWs6gxlwFIGqrQbOhTZ15KugBbZ2O4Kehc/V0yx+2K43DaezMJWg4kDEClEW5
         TW4AzJvydQ4fo7sJnHd0Dp4fVPGmM4XVvk2gCvMg1HDnw3r0lEKLgiBuOyuDzXAmg0sN
         i+Tg==
X-Forwarded-Encrypted: i=1; AL+hErHY0o0iw+BN8sbGQ7uuG/bMAa613+up2wDtlbS4bGHpJInq4gNFoN7mv7+3tUKJ5vtOt31QR5LURycRFw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+4OumsNxufrAu79epIBlZHy4S//8rfWZhXMJPlb35ATUWys1Qa
	QeGtdechK04cV2J4YJSs8vd/YYQBOe1ACpE9dZ5huoQThpFZekNp26MbQgvTh2lAj3uF
X-Gm-Gg: AYBFou1qLaNI5t4P/7AGqYQfHopL71hmHfE4wA4dGW3A8FLH0g7BD/bLGP2JJI4LZZ5
	Rm12vVrfJ+KrHhpgq7Oxq4OHnRhI8n8tnNet4Zu6Y2WORWPbd+FbYHoMZHXAaYuZ8fE2/AvO3rh
	bGCz2sFKkK65Y0g3hAWLPcHdQqbY0zzrszILO/foSTYHzcZQZ6KGbvEZlVPP6hEDolFlVqfKukQ
	0CVFNrYGlCGSxvmh4tk6c1omGZwgh2BdQm55X1CfvadW7zU3y9Hbfe/7XVJGlWzc9QTPw86P2Gy
	EWpuCT46wWeStY7e3FsBn91G+QnwqYGVnCtQja8kpWQpOlYNv+rKBsP0wRSh7X2OuvpD0aY08/6
	udPmZ9hYt3d4n0fEh/rDcPC69k/DKCUtdjSpOC0g9c4ucFCK1KU1/bQ2Ae8v8w1OsDGKR1NKICP
	rzGdGUMWbDnOAWTpvWcS9nKL32gnMiKef+rAc79UWIVTlaW61dOgULjdhDsJW4Wg3r0rE+NF6Yi
	2614bs/qS/iqbfpCFLagzqeseG8LbfWyOURSARYFcmd4Kn1v6P24qIDYQaHdLxvxUwc+YBjC2Ng
	4vLL4cj/PNLTjUROUxnP+upgTE2F2L9U5FqGqR/Eei2BAdc45G6UoJ8UiGtu2Xc=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43583035e9.2.1794564806374;
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm4362275f8f.49.2026.11.13.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:26 -0800 (PST)
Message-ID: <23edc29c421f5d4c1103004f79e104e9f94d42c2.camel@amutable.com>
Subject: Re: [PATCH RFC 23/41] fuse: use fc_init_pseudo() for fusectl
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
Date: Fri, 13 Nov 2026 11:13:24 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-23-4c998976c6c7@kernel.org>
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
> Initialize fusectl as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. fusectl never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/fuse/control.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 21ffde596d61..4497362e7df0 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -10,6 +10,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0
> =C2=A0#define FUSE_CTL_SUPER_MAGIC 0x65735543
> @@ -334,6 +335,7 @@ static const struct fs_context_operations
> fuse_ctl_context_ops =3D {
> =C2=A0
> =C2=A0static int fuse_ctl_init_fs_context(struct fs_context *fsc)
> =C2=A0{
> +	fc_init_pseudo(fsc);
> =C2=A0	fsc->ops =3D &fuse_ctl_context_ops;
> =C2=A0	return 0;
> =C2=A0}
