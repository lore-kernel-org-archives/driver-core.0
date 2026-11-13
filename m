Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564336;
	b=LzZawOjCQTqS56S4gWMjftdmqEc98jOV2rAM6qG5JKV4hiqPbyiN3DlVqKUWLpIwZG+m
	 ZIFRJWIHb5J1l9ePp/A+/Zm5D354b9PEQqXNvXpTWxgeBPap+jVfBqxAkSMO/c4YK6BoV
	 A8AimLDo/U4baOEWDQoHDEoDHZC/VolU3DeI5NLorZFLT1D79RP510ngih8eNPSbtqUmp
	 LFsERdKGYq6HBv58kB/HrkEUdGpP+OL0jNNJX+L+lUi969w5kT5sWxv8LQd5vuiCuqp4y
	 qsyNPAV+kZafgh/ne+g75VVa6S9d/0ruxbxXGvmD2/gU5guc592e1vleXtlPx2iER7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
	b=YX7Z2sANCESPQbgWF++M3sW0UM+4cG0JAfm+Kjx/HmytOEhCBFWORlFNxYa5ZZapuMju
	 kEDhBaOFK3l1ullq2h+AB3x/yVaJgjI9kNCcv9SsaOGPsv0y1eMyE+J514v+VKlpdmtFh
	 L0TP8HgQupyddKyEAZE4zGEpiaREgTR/x0cYvZpIAMsStfN9pY+O4hmT1w489/J0w7Ifc
	 G9RRTi1z+W4KlNMAleFFPR1nwF4TcQeWS8Ek8F9NnI6E7qasX+0w3RNk97P/lEQzSMpDR
	 KDA63Rtxe/l2WWpqn2HWRiZEzr5komtQ6KOjPmBtInTGj5YbXqBUJyEpmpuf4DPTAeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kxWc1B15;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBA3606A8A5
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FBA3606A8A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kxWc1B15
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7bfefba55so1543264a12.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564334; x=1795169134; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=kxWc1B15PIz1YyYJnH3FyUpz0weVkmBcKyqVWFsX5qWhi6ST8C20OaZ261XYPbHYcZ
         M+xurd3LGS0Iu3xYE3EiH0X0Ms4gaAGOXR2EZRXMkBc+rBBG4c70uDf878kXz+Aib4zR
         /yls+MozPLnJLka3BcSxB6V55soR5JSf0VRsNUGb1Tbm/R9soZxCBv2MxxTj9NuoTNKh
         /+g/dfVGLreSOCD2c1uVqS0rNC29SFPflzRALQzGlNZRunwZCVUGaFUdkYRLJHU5bMgI
         HZmbtUuJGSoJRw5KW/AcM5nu/uhaGfP6xcpWd2C30g1b8fb0LnId/34aC1K4cOBeN/NZ
         nLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564334; x=1795169134;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fNM18G1T3F0ezY9f7dMoEwC6d3kOVWk14Z1vuqkOGWM=;
        b=cYEr1pke59jWneewKs+7IDiek+dpkrR3lKdATsfO13ZVmEQprJqifnLhluplzCSr3k
         6U4M1SI0Nl+yJQtAzltaByTNP4OmtuK3q9plUG4mLRh7KSgEwKvtOg4bLzu7cOYUQyIU
         a5yr2X/t/BnOflG1oDVKLYmCcXQQZMlaYn0z0gi3wQMhGPmt0SkAkVi6zBX3KJkNk97H
         PMoS9uEiFTzfipyQCEOrhCt5W5Jr96BzpxQAvOCy2I8HMAz9ARmca/kgpjAfcz67tDiA
         6QXjN4QNtm42H9KqFoRkca6y/GlC9FpPwNtjLU5vlIpApGdAj1CBZispV7reLl4J5hVR
         4yQw==
X-Forwarded-Encrypted: i=1; AL+hErFZ5gaeFkCnjgOoIAK6xa98P8wGNYYWPtunzyxEGS9rI2Q6/8U5dvw1mX2zoITb1xJPJIzTpsEGYxbZkQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/XWvxyddr3xgkT/pxIriqy/QnwBT2nirwFlZbIs4TLMF1KU38t
	SncYwEaFuDncI79ibHtN4ykB/sdjkwoRzWZX8TmlrbX0uH/qCXPTBNarMO+epuGDa8CmnQ+R1De
	p/9EnhAXurSk=
X-Gm-Gg: AYBFou1eCdUQhpLo/1OpT7tEq8oJl0pqrUXa76EUkdjDnLscay5X+bxld/pTsbZrXeg
	yeKCIP+n9pnTSmsjuwAYC3XSYwpBVIJb10lQDioEkTo3+OjvUVagZzq3PtItpewbNlkah0hMuP6
	LwgDLfXGW+5svti5upMvkcDoNskjEhj+EIp5e9NrXGP2LuoZLd5GCDrVNZRMiwvUWVXmsaj5FkL
	gtGFjJTtqdFGUInV89ggwwhsCNCP4n5nPxgpiomnhdhpF3asd7JtjB4gDTVg/sZGZjiDqiOW0s8
	LldP24GBpQXWaotIbWXymx/RkzTvvWBh5lDoa9siDWA4HsqymNz0gO3kZQgHcsMKv1CTbX+csKi
	hPdNPV+KpLamEMUBjKm9Ael+i6flZB5ne03BWM+iv9BYHXhvZ0/g1aqrtpj78FdjfYBsZ1zvS+y
	/Vvuc78zuZsbbozQDfUq3yBblGno77bl6XSzn6YkllTubDwGO1ifgLrj37A1zIw16T78dEfiW1S
	vxAdol1eWMa+IErsukiPr/cWSVu3rFOyd+zOLGcOMT4fngTrWBjN2IdTmusjby+7IXJRHZpm+zY
	+lSU4ZJOvee4Z0wazf36r8pzAVOKuks9WoTBBaVF0BbHRk+ceMucZmeddA4hTxg=
X-Received: by 2002:a17:907:608f:b0:c43:eae5:ee80 with SMTP id a640c23a62f3a-c5096398b03mr148720566b.17.1794564321873;
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7b2c9sm75811766b.73.2026.11.13.02.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:05:21 -0800 (PST)
Message-ID: <08fa1be263cf4a3db6b3e5ec2847107fba7acfba.camel@amutable.com>
Subject: Re: [PATCH RFC 13/41] devpts: use fc_init_pseudo()
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
Date: Fri, 13 Nov 2026 11:05:19 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-13-4c998976c6c7@kernel.org>
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
> Initialize devpts as a pseudo filesystem. This raises SB_I_PSEUDO and
> SB_I_NOEXEC. devpts never holds executables. devpts_fill_super()
> keeps
> clearing SB_I_NODEV for the pty device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0fs/devpts/inode.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/devpts/inode.c b/fs/devpts/inode.c
> index bd1e8eb26edb..47ef12241d92 100644
> --- a/fs/devpts/inode.c
> +++ b/fs/devpts/inode.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/fs.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/fs_parser.h>
> =C2=A0#include <linux/sched.h>
> =C2=A0#include <linux/namei.h>
> @@ -438,6 +439,7 @@ static int devpts_init_fs_context(struct
> fs_context *fc)
> =C2=A0		fsi->mount_opts.reserve =3D true;
> =C2=A0
> =C2=A0	fc->s_fs_info =3D fsi;
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &devpts_context_ops;
> =C2=A0	return 0;
> =C2=A0}
