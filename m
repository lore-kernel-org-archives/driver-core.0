Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564728;
	b=HY6GvmcMtrhgTXH8eexN5OqgPsJIIhq9oh4EGOu9Th3dI9zkdjYAXbc7vAqdrnc7n8mc
	 WOHFtDdwuv/raPEFnbfdlIDnGcQ3tWB5ZzsEgZd9wySVPOV50ovIxCIaKA6KNDZs6DpMz
	 sVyrucBRJrX2NpDYerwoX41XwinJb1BhNkYbLWPo1Tys1HCfwpkwy7bfWm9ceuIHmDRSu
	 E+n4/EntspENBQikc9M/jaZVtL6ZvNOx1rbU7GrNORmj8E+sbzNWQS4jA36AzPad8QWr0
	 6uHIHa6V60dLadk1s1W4EhOHjN08jkI+zYrt1DeHutKdPPKlbKSQNbXmZ/XmRxDP64A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
	b=LHfb+jsiuEW3yDhUEcYOunc7pRU7oD209WwP9j57uY6MelwcZGdUVOA56bqD9JMGQ/1U
	 rpn+vBvQPhMxcmfEApVc8myeFLc1F92sj/mI3lXiivdEVJHoiQG4RUOoHOS7LJh/igSOK
	 2cG+S3QJLGImi/5TkAqD1wP2hL9eGUNzTmU1hG8iTXJxM4f+9rP3UfvfqtP4rXRToqRet
	 a3yyQ+I/teqQZ+aSQr7Uli7Ve2025Mg4ksaTWbeVMhAQabwCBLquZ8aQgDEh5GJTtkBeU
	 i+6wMGx1IlDN5kJfiBW6joE/EhIeKlwuj7eVOoDMeHbL0Rmm/p8sbMn4uJR2kOsx8pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuHcZF3W;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F1606A882
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81F1606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GuHcZF3W
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so10660825e9.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564726; x=1795169526; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=GuHcZF3WORQRAgl1wCIyYPjHEqJzEGqhdMDJqRWcH729UKaWDHPpLvdqOoFkOCdSO+
         Lf6ZuxfCjMgvrTLtn8B37dazIcs7g/DZ935m8uj4NKqLuB8Lhl7kpxFr7lWMZ2qnWa+W
         gO6l1Y4DxQEe5pLUBrRUkzHcc/L4LYnEiSsC+wPSW1i3qMnSYRND5ELJSBT3716oE6yt
         aZQTbF550d7rR3ktdrXrHvBjVRLcFMqF83UrKK93kYG/kXhuOPk+F2RukH+AXiyPcPHz
         0vUSodZrzLEtelSLK/Cs+R20Ora+Oy+f0k1xQ18u97PKVmxgljaWz+GafSz/sbi83utd
         IGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564726; x=1795169526;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C9TZKYRayQVC7UyXoancZRI4bPIYIHY06/n7s/4tB9k=;
        b=L+33dS7cNU+XmvgyaRqfX/2CVknnwi++WoyFSMd36Za9H3iU4uIDuYxXHimGYFkLCj
         3EJ/GYwRse3weH46TAITsGlwSpwHoIhMn+XUiKmkuG0g8xptapahKYgyQ989p7H0mRlr
         MaVjFrdujDkjwlmwcCy8c1o7NDYQyPI8dDfbmx+1oZrh/38h+TWjLk/26Mm6Q43dp5Xb
         AFisJY3rlRRR9TxzXnyL1IISx4n2xKEsmOqw+di5qTKj+I6pYN0WNHmLVCPPzviTFZ7M
         wUNRh87GqdcWfRk+EvDObFy198cvYc5U1u/Ov2sXUR8xnWqrCVV53NCfYXjwetJw4smA
         16HA==
X-Forwarded-Encrypted: i=1; AL+hErF1uuqNFPpTdLPzXXqTEEqyOmQvAHwrJmdu21WmS/u8K/W8lsIP30un/dH2akhRRFIxQjBCqK8O/3PNEg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+kGiBhYCIoNbHQsInV2y/81k3QEXVPjPZcpJ4vPW9GxDvmopfY
	UIRuA5MsHFOdN6sNwL8JHw5en0OFLwVm1qbWjzGMKTcalamTtgpML+F9rLUpYjeuj6oz
X-Gm-Gg: AYBFou3f5AWf7hvYTUd8i18hKc0vCuAOhLXMJKceqMQa1VquVuZaZJoFIMUXp1HwpRk
	Dx1Hec4/sji0hYeHfCAIXCxm61tzQ12Hz+qJLLOCsbqUcP0ib+o0y1KeUDekMeDaLvdfs3WERvG
	NegHYMfWvzHKSzTHBXmTtyqNxl3knbxN34gDI78l2mFGmASVQoVPFVxyStiskTuGzoI88yhtQow
	PbJxv98EPCpG/NzIKtOElMx2xbWvpGQJMwhBV6j751/WE/UzSryUzS5Ab5raBhm2ZRGfeVDDngZ
	+RtAlQbIn/DpsAxnXag9bQrBBj+oJDjs5Wag/M5LWRCWARMML6W9uv3Ls4snmfbHoqQxOicmRbG
	Gl8UN5h3+4UE8n8UG4zZv3YwIa2Zpz0VuRwhHk3NcMKsNDowfiHvlGdCcO/Z8HErRwZqA4XZHLE
	RqKfjrPn3iDtokZJktRGAEdL7Ih02wGe+TJSbHQb5ZARrye8SPW9Y3QcIxwRLkfHzHJgEwvz83c
	KOvCh0zdRdcaEmY81y8/UI/PQ3tV5jL/8tDlMXppT3WpXe3l03w/Gc5iJGfGrN1UuOdpSHAsZ3x
	isnQE18jUwZexThzVuDISjQp+Izni6azV1BycCZLm1z8EOPLHGQsIyQ2g8KPFeYzB1+KTOO4Aaz
	yvfSpDkVx
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr40317635e9.1.1794564726124;
        Fri, 13 Nov 2026 02:12:06 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2842e6sm142085915e9.4.2026.11.13.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:12:05 -0800 (PST)
Message-ID: <82d691d2db7579d9630bf89f73132e36124bf74e.camel@amutable.com>
Subject: Re: [PATCH RFC 19/41] smack: use fc_init_pseudo() for smackfs
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
Date: Fri, 13 Nov 2026 11:12:03 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-19-4c998976c6c7@kernel.org>
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
> Initialize smackfs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. smackfs never holds executables or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0security/smack/smackfs.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index a72bc7fabea9..4a56bbeaeca3 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -25,6 +25,7 @@
> =C2=A0#include <linux/magic.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include "smack.h"
> =C2=A0
> =C2=A0#define BEBITS	(sizeof(__be32) * 8)
> @@ -2880,6 +2881,7 @@ static const struct fs_context_operations
> smk_context_ops =3D {
> =C2=A0 */
> =C2=A0static int smk_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &smk_context_ops;
> =C2=A0	return 0;
> =C2=A0}
