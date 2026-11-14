Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794698411;
	b=30fWqAYH56YaGbN58ixx4kGye2wg36KdGEhKUSb6Dwwg+iXePpWc2h3qzgyN+qTp9xWk
	 Zmeji9br/n0Fryn4WEQ7dN5Ae+SP4J/EjJ8Jezig01KGjjcauTUptrNhmAgUkP0QYLUKN
	 XZv4JjxOUtXvqZVV4hDBDldbNWQRVLWruarFrmQ2aUFyP31r/MC3nTHktjRcqtqdObr3/
	 f5CEQfHESuzAGpHv+ZUpcfOlP2ZfA59eZIgYt1DXron0jFaEDS6Phr2E12aVjfja4MwYB
	 FjoAU7uI64RND4n/ZKYDWhlj75Jcc82VtcDGQlvzBoErSJ7FEEResfex3VKUKzX/uNw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794698411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
	b=DGDSKQwxqvyXGwUuf9WdTTEPjX5Sk2SY7SM0qxrIgYl6okJCQ5EvMwPNSiLDn+ddMLl/
	 giyAq4ktHaCfkZsU1o7MdhoQw44jm8cOlc4EdLLwmC97URl2aJh5u4ZJhcXMsVhIRer0d
	 zTF22wAnWjWv0Jzjv7zdf5ZED0kAMVD+ENNU7gViyMskVb6lQp42gQs6Z69zmMqcvk4y/
	 fRyA64ROkW2GT3juiUuRqsa9WpFvh0HMD4uX4Bzz6odilO+CKpipkjweStL0puBq1P1uf
	 zqcJf5fkibp4Uamow4Y8dLuDEGJAFF7JkFNM293Xf0sj64ErhM7KS71vvVQdmvyZvPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eq8MMJ7E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FE0606A33A
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 23:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FE0606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eq8MMJ7E
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b596569640so4611868a12.1
        for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 15:20:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794698409; cv=none;
        d=google.com; s=arc-20260327;
        b=nE8GH9vsdGvcKZ3WyXII/3Faj3CKguXodbN0Vw6P8N/r9KGUzUCzzjVt+NV6bhv3at
         TiPpqDwtkryt4G2B3XLClKEPT+adPsmqD8laM7UqavDfRpRPzpRX7mtA480DiNGYbZCU
         MZFxX//RrTaByITULrMltBMEMLX2hnE3Een2bmo7Gp3g7OpTocg7eVjXWkTHFT6SitiV
         3K1+yfqGXSfY7vpi2ZFO+X9uFBSG5wiIXtR/1VSX03XmWfL3xuxKvCRePVG4ScbLp5T9
         7b/+wo6L/Zz8FV9gvUCh1RoQzEP0gJYhMlpx3pN7sT7GwxYZjmoTbhCUnCKnT2B+HS2L
         e8Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        fh=FchcDyhh+m2skpcBDF2dVGqbtYXG6Ixq/sBbKEcAeCA=;
        b=HIfCqv/3gKt++kmONSXj9J9YQ/Q6Cr4r1CxhO3k8aIDGfTP5TCEKWEinfwnpfAWBTZ
         /zp1gWPIOiZqfFIHAfgD6ybjwsRWPqDGd34+TYxA2syeV6lBl0kkBTNLHRRqp/8kW8uK
         zlGkIIk2/8mm3q1g4N0I33ZpOc1k9jk3rFKSsBN2s9Ikf0ob5kEWUAyujG47vIQGWCGw
         iLUYr4r2znyJFcQWuKsGEgmlBTtOGDwd+tos2RMFAIQXjH7bgceeMVp5oXxnb5E7dFQw
         enio7jb51OlJmF/ZdmalewkjWBAGneJPt1cmxs1PJs3YEDtGkuPNsfJoCm1iERuzDwr1
         PjWA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794698409; x=1795303209; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=Eq8MMJ7EAUM8qhA7gIHpM+wwYLHiJOgQoJ+ONSWGg9YHnntBzB0rQQGaylRPUsVkRp
         wHWgynTCQOm0MDmeIoQHf0/GJxQxpL2+t18UktoVBxzTX6+pLGCxHfi6exFM4TMo1v7/
         ucVawa7jay7kzullFaC44kYAYmggjlQ1b7EX7VyTldo4iEKLWOwtPaPStmEJPoarXtHJ
         DxIIs/swFDQJvrYj2AQ7EecdRorpLL9B16mlALFDZVI81KWhfeKfpN8YID3V6YyOGC4M
         00lkv/2pwqzdaN6edGSCJjyAg93JDetC7d8/w6ObdHXV5W4D21PA4T5132kQFdfc2TcQ
         xaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794698409; x=1795303209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98mXXJR5XCg4Z4S2yqrizowpYg4fQiN0pgPOU/BiUFY=;
        b=U5H6OZ9UYKrk+kA2w0aPWw8lh7RZIvblDietOA2ObkmisphjaDIQb17gtqC7xTcGtL
         Cb7hRxyWX+g4yzzacYmlWZVVbH4yrtCRrpTfCd000290Vtm7SflgQmBTmtJjoMf714UD
         N2Him6Pa84Kyn1BcPLCstP7e4Zq/F/x+Z6ENI0I9ppsrfjifKBCjMd2PvS/foe71xNfc
         G8ZAIzBaHI9guXTwHf1ZOe/E/JbFqVDwZ4SCfNbp+V54TGBP4YIA68yK2FeGTkf5zpHo
         1c1eGLYkr1ApL9RyTaDHi2hk4mckNwtfdu0JuBqj4XF0o4A+P+JHKFTjgFW//IU+i/nO
         jJfg==
X-Forwarded-Encrypted: i=1; AL+hErFYO6sM33+F34Uv0c5qhjPwEao3FjYtvcRl+mt0Yv3XNApoA3c3rO5ccMno7QkJ7WQJsTl4sYWLSMXMCw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+6gpbayVwyZ5GjCSqvaGmjalIm6C90zJZegrZNUIO0NuROlVK+
	w7E5z0mg1F3ye2kg/rkCONi6fZs/5MqftFGIGPSbWySq9jCd1pJaXTNPOyDVu+TxDz6OzI0NCC4
	FFDD7efWFzjOx953F5rsQJWtbDfYP4II=
X-Gm-Gg: AYBFou2znuy5s2FTvKhrg3lhVtoKcz8tQms5OfTeZ7SOL+hkk0iZqBf+ZGORyE6RkOb
	dBX61Q8I2Pzka+fwwJ2G2LQSiNEVZf/JTyKicaq26leHgoNYUX8Vtiz02CBL/tlOh+ZnRaJLZ3l
	RhiuV7SIsj3KUIlIdRrD6iCW9ZteL+C4rqLBeqy2Tg+gWa+UUQwz0BeNn05vW5obpUr/eN09I96
	yN9D3rqQsdMRaUQGSO2WgegV0fbIHFFaQN8wnFk0NK0LR8I+vE8O4tSRxd8ZYlU57LsIBE9uTzu
	wnEuYYlxHOn2e85Dxeg12QMY0CSsSa1uGaDpFKacgE5J0dR2kA4LE4WbkPGy6dvFOtfDK62KV98
	CNDNSsrGMQQ+uKs4PxXN57HuE7auYbg/9bUvAhDADEjqW6AR4HhvprHSHod4G4DtzJswbsg==
X-Received: by 2002:a05:6402:e10:b0:6b7:f00e:5e56 with SMTP id
 4fb4d7f45d1cf-6b7f00e5f37mr1542816a12.1.1794698409123; Sat, 14 Nov 2026
 15:20:09 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
 <20261114-work-loop-pseudo-v2-33-98639a2286fb@kernel.org> <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
In-Reply-To: <20261114120557.4bc1eb6e57218cdc@chrisdown.name>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 15 Nov 2026 00:19:57 +0100
X-Gm-Features: AclHuK_YVxhIpv6JLzeNAX5mX5IHGfu05WS6uQ-TCKewxE3JKeci2PyA-UDMCbo
Message-ID: <CAOQ4uxhGxpBtMZ5kfuzR1tQAewiecoX7UjXQRo91QjJHH9T_Yw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 33/42] fs: add file_check_backing()
To: Chris Down <chris@chrisdown.name>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>, 
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, 
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 9:06=E2=80=AFPM Chris Down <chris@chrisdown.name> w=
rote:
>
> Hi Christian,
>
> Christian Brauner writes:
> >+      /* Look through stacking filesystems at the inode with the data. =
*/
> >+      if (d_real_inode(file->f_path.dentry)->i_sb->s_iflags & SB_I_PSEU=
DO)
> >+              return -EINVAL;
>
> This looks good in general, but what the bots said about O_PATH files
> here is real. With FMODE_PATH this is reached for a file that was never
> opened, so on overlayfs nothing has been through ovl_open() to look up
> the lowerdata of a metacopy file yet. ovl_d_real() then does the lookup
> itself, and when that fails it hits the WARN(1) at its end and returns
> the overlayfs dentry, so the check passes as well.
>
> Only fuse passes FMODE_PATH, so it takes CAP_SYS_ADMIN to get there, but
> it's easy to trigger with that. From a quick test with a metacopy file
> whose redirect into a data-only layer points at nothing, registering an
> O_PATH fd of it with FUSE_DEV_IOC_BACKING_OPEN gives
>
>      ovl_d_real(/f, 0): real dentry not found
>      WARNING: fs/overlayfs/super.c:79 at ovl_d_real+0xc9/0x210
>      [...]
>       file_check_backing+0x308/0x5e0
>       fuse_backing_new+0x219/0x4a0
>       fuse_backing_open+0xe8/0x390
>       fuse_dev_ioctl+0x53a/0x7d0
>
> and the ioctl still succeeds. A normal open of that file fails with
> ENOENT, so nothing could have used it as a backing file anyway, but with
> panic_on_warn this is now a panic.
>
> Maybe ovl_d_real() should just stop warning when the lookup fails, now
> that it has a caller that isn't trace_uprobe?

Yeh I guess that this needs to be a Fixes for lazy data lookup.

The correct fix would be to teach all the callers to deal with an error.

> The check would still pass
> for an O_PATH file whose lowerdata couldn't be looked up at that point,
> though.

One observation relevant to this patch set is that a datadir layer has no
business being a pseudo fs and that can and should be blocked explicitly
at overlayfs mount time.

The other observation is that fuse_passthrough_open() should probably
check the backing_file that was opened for io in addition to checking
in fuse_backing_open(), which could have different FMODE and specifically
could be FMODE_PATH.

Thanks,
Amir.
