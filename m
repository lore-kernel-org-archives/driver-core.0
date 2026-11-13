Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563701;
	b=KJLe0UYkSg06QXQEaPEocrnXT013aFK3iqAM+cb+uyoHpi4QNpVNJ+CJayR91d2IN8nr
	 sS7IZyapdnHTa1To7xDjKEPvQQYZXYMYoLKvbtlCs/zAxUaTuBfiSrIMT6g20F4wnMK3f
	 E4XiEJDcxGrNK1ju2DqZw2FZ6aL8oAirQLovTZzsct4a8L/75t1noYIBFloIfWxEg4r78
	 P88M4fkceuKkjcg1ypdKBmciqe+lRNCtv0rM7VkEl7Ly8io9SisvNlrey3RXK1VDT2PWb
	 OIgVtlKrKQNmgnytVC8nBS2jBNkqH4bCr2UYKEFeyK9nXKbOUNPcqi48dudTGvvxTEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
	b=mI/znB0jxi0jcCaDS9lb37rowOAGUu+eE5lLtBG3IyyL6/9I1JYUvE/fMYc9XjeD7FU5
	 VPcqTd/biwtQxpT9AG8nJwy3YLKoQAKr9hHhQWjkGZoG87la/KbALo1pUU2XfMbB7cfnP
	 iB7LUmcZDceOXmH5sfA7EWnCQ6q62Yd3zmtuDXTmpjK0x/sTr6i/Hq1SK/XObWDAw9Ew4
	 JOPPyhtETaC34sazrhEuZneR5Y3hTOT5rkwOF3lkzr4ZXGmHpxme4p1xgO3LD13wAN9YV
	 FVvBQ38Fh/Z5eec6gAgcOExFhNTsouQatKi1pVHnmZ9C60L/CUIxsnH3gVeJZCc5REA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Pp/iLDW+";
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B860A2602
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 09:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8B860A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pp/iLDW+
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c5083bc0e28so142296966b.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 01:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794563698; x=1795168498; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=Pp/iLDW+KULLKBMDnLmVBWDK+QDaUtq+Niif6l1EqKwNsNYtPcwvnQTLzN0LEJUP6L
         PGJDotaWKmardus4LLZNBqKDLeC5C760DHoSHYCBjeu9GOQ9nu0DUeM1r3TgFlXbdPcy
         2b4QgvYrhndUcOdRAv48ft5UlYrCX20BkFPnU8mdn/J4gpAqRelBDEhKm+G47Wdc21Um
         dB60lx8fBejOlfSgstrd6pVmDWmsrtkJd4EP1M/XlEbkcm3/IPBAsBPnQ62VuwbnBfxQ
         oxHGU4ZPSKpSsjROdfa5xGV+prmKLZ0Q3cGRMHeCeMEfFndorbVIsFzp5VGEsLT7vky3
         ANiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563698; x=1795168498;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8DmFU4pJwAPCJlqHBF8SKasEEThxtJNlC1sg/CSkLw=;
        b=jfkA+2SCWr4AaXC8mgoL2WNFebzmt7PjtYfA7moGKNy9HK/+DbZp8UsRI819i7WQlQ
         YUEw0R7RndqnDid5MplsBcPrIAKFr4ANzJJ2W0226dXnir7VN917osM/NiRMCI0BVmrM
         y+dE9OyhncBZnpDyTwJVnG2o5QXqqr0BzKdN79kB1fOJNbG+TCk3lgPUmvr8rWVjjgIN
         ed6Zr++27XDr4w7Z5tnr6ecRYaasbFzCYRQhjoV7ret6+1wEPe3o0dytqpU4rEEt3K1g
         tfuvBuI2raTmlo5OOVQLCqArEcchYjRIpIx4rVaQDViplgg98jd3eRF6tZlwTj4/3KtG
         Uy2Q==
X-Forwarded-Encrypted: i=1; AL+hErGyJlsbBxKqaK0aW848uwF8CfM1W9w53b9tAO5Z+ImeIl9mtEy4NPhWz2pEtFo3t85aJo+eIoTIzxj4eg==@lists.linux.dev
X-Gm-Message-State: APuU4Z81Y9bmu2TiVXYo5XEHO6Nfkk7nTAqw6NPeR2zTb+kutpjqSctd
	3zPsjdTpjZ9H/9V7JuJA0t8KfbAwaqcBfqw8Gk4PUy0rogXMSwkYl8veJvIAVPSJwKSU
X-Gm-Gg: AYBFou0NWxzdYEa+Kw1sz5wMi3DbE8pNsqMOCfRXG5Rzin1STcWBB1omMsu7fxJH8ZG
	I/jPbL4H5Fil4XGIcgTOZmc4/zRVdpd669K3/zqvRL/nhX/zlwCZcXGYPzpgjJprFPuyWWbXg9C
	7uQqNQMos1AXiMTynk7URssIbAHliEIfpIafN2uITHW3vL3XkIb2bFcXNpIiABpqBHDwaZZNcjc
	8m9LvQGka07Vrd+QFJxAoVlxcq1G3Zo2VKH/rq3LVnI8BOTeFmYGyTvYOha1TsEbZBDrWoXW7in
	5Aj39r0RKqBDamXOY/T5XIVUdXTRFreSDOeu4tICNcgw+wYvyBfBh5LfcYsTwhoYvYjl8zgVbu+
	xQqiBMQi4zVmTp+/vGQGB8ujPWdv00+TvwZJGaETTrQPH17jcdQgoZHCyCrOLN6xqAIgnS9XjSJ
	sr2wH1rXFV3QTwFk93PefgSPm783H1NMp50bS/WcqAwPiEylql5uCkh4kYeRzWDWKj98eVOSng4
	f3/+il1SEmnnEU8HelHR1QbK0ULV9ehRf6gesWq2nUdVlBFoyEdOxWaxcpndpHOPVGlmS4P32An
	DXckrWt7IwrcgEiWUyibLGFqMH1MIT6P1/g9DSXiLei9fCzrtKNxvdklIjYRwEM=
X-Received: by 2002:a17:907:ea93:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c50963bdb9bmr198299566b.44.1794563698514;
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50957c6c1fsm75151566b.0.2026.11.13.01.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:54:58 -0800 (PST)
Message-ID: <b42c9f4d29a9cbea66929c95cc8f736f12703c72.camel@amutable.com>
Subject: Re: [PATCH RFC 01/41] loop: refuse backing files that aren't open
 for reading
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
 linux-kselftest@vger.kernel.org, 	stable@vger.kernel.org
Date: Fri, 13 Nov 2026 10:54:56 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-1-4c998976c6c7@kernel.org>
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
> loop_configure() takes any file as long as it implements -
> >read_iter().
> Loop itself never checked whether the file was actually opened for
> reading. Buffered I/O went through vfs_iter_read() which refuses
> files
> without FMODE_READ. Direct I/O has called ->read_iter() of the
> backing
> file directly ever since loop grew support for it.
>=20
> Since commit f2fed441c69b ("loop: stop using vfs_iter_{read,write}
> for
> buffered I/O") buffered I/O calls ->read_iter() directly as well.
> That
> commit was about O_DIRECT handling and the FMODE_READ check went away
> as a side effect.
>=20
> So whoever can set up a loop device can read a file it was only
> allowed
> to open for writing. Open the file O_WRONLY, configure a loop device
> with it and read the contents through the loop device.
>=20
> Refuse backing files that aren't open for reading. Loop always reads
> from its backing file so a write-only backing file never made sense
> in
> the first place.
>=20
> Fixes: bc07c10a3603 ("block: loop: support DIO & AIO")
> Fixes: f2fed441c69b ("loop: stop using vfs_iter_{read,write} for
> buffered I/O")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/loop.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index a3325ceab484..c96e35c3ef42 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -528,6 +528,9 @@ static void loop_assign_backing_file(struct
> loop_device *lo, struct file *file)
> =C2=A0
> =C2=A0static int loop_check_backing_file(struct file *file)
> =C2=A0{
> +	if (!(file->f_mode & FMODE_READ))
> +		return -EBADF;
> +
> =C2=A0	if (!file->f_op->read_iter)
> =C2=A0		return -EINVAL;
> =C2=A0
