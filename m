Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904111;
	b=Vuamo+Q9P5fUXVpkc7WLQ5JkgVm/IvqI2Oc1RJQT3ZNtuc96BqLsbMX3bwTUEzhyvfF5
	 P02xUadNKrGsMoYb8OFZNdox0tDUg3yH1cyCRkfWVEyQ4xPhyqv0tKRh5cNKBNjPk1Wgs
	 j0DCR72t5PEfz7n2Mac1HTl4izCEVWICVA+vdXWp+Cwfm5f1n79Pt8xfkpBH9tvnHM74E
	 3fIcEb+BE4lDsD+zQ8b4ut9IleC8PMC/YEA4MUvaVakrMdUq3xAcgVv4jPn7nGOB4YcPs
	 J/sJ3WmTh61TWcy+x5IaDXBPHfzE+QtmDazKEGoBSUC+YXm0IMdk8RGbAmbmLpe7CQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
	b=t/81Zf9rRKHvO/6s8nOeCUBz5z+iVvIDu8LmVOhq9DYY/wAJAuIBHMEElhdHINnZdnwq
	 CsBvAU9W9YTTxf2DoD12JhGPGwodagJLoNUIPhkIRv3aXR+HduYLhQBeRs0zwjFtkSiRT
	 xxZ0jpLnFwEOcSaUKYK2hFluM6ikmzPL5AF5nmsWb95RAs8P+5oWaf9QKYgBCOw8g79TX
	 okGs2F1BdyOA0d2YFp/R+t8W7L/wOOhd/323VhzV98hm9CbOTYbCEWRyoT1FcI2uyW8ll
	 t2U1aEb1fIFaOu+lfzwpeLvde8iIOXNfRRUstAe7/xOcKBDTpmYfssF5fAtLWARJm8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uXanWzS6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1132606A8BE
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1132606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uXanWzS6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso36240005e9.1
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904108; x=1795508908; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=uXanWzS6KLBuYv3bFiuy7p2Z1+227mW1xrHWoFvaDbJ4eIR86cdI1UfJ1Vl6WUjJqL
         IJaho440FIf8b9IVU7Kam+OSXnIH1jz33WHTujYT1BQfo0B6SnXDwYqbWw0t0qlqzaok
         kNRlJO6ubpwmwkK9bKsbnA8CCcxZtujXfM4mSBx1ucI+Gj/wfMgQKSvTWN80MqHAe4Q4
         K0wutzKwO2Mf+59qNoIzXTOiwGbG/+A4azNJdDQMNWt+RQ7wzSKmF6jTS0qaKJWAuNDN
         YKdae80DaM2Rsb1thTTj773gVDHc6h/SXbfPEUrMNYox1t+BGiLn0VpO0U/ZIX8mo8As
         cNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904108; x=1795508908;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80nJ9mfJsz3UGKSZAnLQ0A7kD85nyx4H/r5vYSV/3QM=;
        b=MJvGNcu6Xhn/Di+ghqigR8hmxmXlD8wj5Uo+rKQmPtyzQASli3k5pKJdfzaZCTsCh+
         HTy6V2aDVnZtVquo8NzlJHzJ1JfdpmlDOjs5I8CMYYA+y48rNkLMmpzb4wUPwC8Zugu/
         E8WWwxFK7yl3E6aHDg/CoAmZUrcAQ3PVtNFafjb0x63bkzvq3ZRtwhOS7el0/9ioBref
         j+P0cdtuJySpFfIbYxKx5VXmkWNqPBLtKb8J7tO6jDhW+N6w0zmwbvwYBswF6I9RDN9x
         fBJKJQouK0jAW1JMEl8aQYNVm8DjO9YoKnmE2FMn1Lq96KsAY+tPEIz3oSe20d4UFSAC
         2xZA==
X-Forwarded-Encrypted: i=1; AL+hErG8FHVAQpJQ5vdUZPiPUVuaLitRbUf6fCeLbVWm6Q/Todm/bjN9IyTlm2Ttdxm1f1fc2jcG+Isbktzx/w==@lists.linux.dev
X-Gm-Message-State: APuU4Z91iBSod6zFW5bSODbZD1h7jycwRRZo+UyWTy98/bPZna/5cgU4
	ingLWMhR2q5Ho53k0WetU6J+eU511rT0sWcq5zfhgc58Xuz6Xz0kyiuVydmrBNqJGlko
X-Gm-Gg: AYBFou069RNKAUfXibwBacLZed2EfMuqRGX8fnUuQoG2OM3ybQJu9IldT57xsHmVrP3
	QHaLpgVEejJLkVgmyYcno+aFoA8lV0gyLLDjRnVWt2yQ9llRr3zQBVIf6/SHGwkHLDK9rry+wpH
	Vs6LBMgCELpIK5JcSJ+3ESyp9/QuvY434FWOn1e+aBi/qEC7i+C78zHdj/khqDQmxeHxToZ6SPc
	WtDEQJ/tGeLxVQqhp6pBChaV+sS/q0ZP4StiKbX2q+yJDzwoN5UY1yfexkkd6uV5uYY6O3x3s+D
	1bhJBqUss39dc4Vc90R9RZ1qucchgsMStiQ0aR/sVYe6iZEi2+V5yt253GIgvyILGhnyitI2fAH
	j8HpALN+PfAI19nGgebA8521+hwLJgkVHXb1+hBbjXYxQhTnYU1ElJJs23QtQCoYa1W5l7fQdtp
	xtHN4Im6aUuNvoAsRbu2V5LOLWqVRtvkVsoUrkLMn57SvMDQQoXoTE7iDbpGyWYESTxLFILQOhj
	Logc48Bs3WXbyJCKFJE6tRDocf+YxCxR23RQrufi2BhIBDRvUId+D/JT5bsigooR2wI5dPQDlss
	q+EV/QPb96Vq9M4OpIO4KF1yF9zooVjjUWfc20ddFUf+TOq4qsQjY7ayBDM8cN/YyQH1be/18Om
	ZYyBQ3vADwCrvTENGwAWu6wMH1MIuufWZiqqZjE9GBom4I8cFR100+jkw
X-Received: by 2002:a05:600c:6286:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb55a5d634mr255399085e9.5.1794904108278;
        Tue, 17 Nov 2026 00:28:28 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78422d2dsm75197335e9.10.2026.11.17.00.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:27 -0800 (PST)
Message-ID: <afc070a816e3ae5eb3c9e2d62d4f25c59ee61df2.camel@amutable.com>
Subject: Re: [PATCH RFC v3 26/44] xenfs: use fc_init_pseudo()
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
 linux-kselftest@vger.kernel.org, Chris Down	 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:26 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-26-8cbbea1cf34f@kernel.org>
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

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize xenfs as a pseudo filesystem. This raises SB_I_PSEUDO and
> also SB_I_NOEXEC and SB_I_NODEV. xenfs never holds executables or
> device nodes.
>=20
> SB_I_NOEXEC also refuses PROT_EXEC mappings. xenfs maps the xenstore
> page and guest memory through privcmd, both data.
>=20
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/xen/xenfs/super.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/xen/xenfs/super.c b/drivers/xen/xenfs/super.c
> index 37ea7c5c03469..aba7d038ed735 100644
> --- a/drivers/xen/xenfs/super.c
> +++ b/drivers/xen/xenfs/super.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/magic.h>
> =C2=A0
> =C2=A0#include <xen/xen.h>
> @@ -80,6 +81,7 @@ static const struct fs_context_operations
> xenfs_context_ops =3D {
> =C2=A0
> =C2=A0static int xenfs_init_fs_context(struct fs_context *fc)
> =C2=A0{
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &xenfs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
