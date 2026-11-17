Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903967;
	b=PW1iOSmFyhME7BuDJachUgksmrud7rfzCtZcvZi8LQYbVf+CK9KP7LlDTbGWvLs/PVEK
	 7GbnfNYmUIGHRi9Eb6t/gxrcRAEM3i+xOpEPbMgD0TtoaMCwGcDcHnPaTFq84LDqtO+B+
	 PupVdG8Psmvl7qLM3XIWmTuBZHVX2fe+K2K7nYDn5kydn88cu/xm1RyNBJHx25L/+v54Y
	 sjq7KvMFdOSb+Xq0ta4/WD+XmTUdJ8oHdPt5fBrjV4vDAgmSEkMKZLoAceNudxlfHNSu4
	 4dpeTYkvS/CSXo9KFT30LzoblDlDI8Xz3GNv0wjuDgKR5L2eZfKztGGsMzK6YeU5xxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
	b=w1OeS2+f8FbyyLedJQym9NX7/0j4FU32FoSBi89vMoPKnhBPBpL1wdfJQqmDqnr2e69N
	 6nhOGtUeN+oEO5ip+40YvdQFc3G1dW8HmBVuWbStsPHIsUuZ8C+6vQezKFTZjuKgAF9my
	 mgDRZ2/jVkI8a4L2B65u/+zoQn68qHJ1BJ/7bjHcc9BhgKEW1gUr6HOUEIp0xsMeJRBZf
	 DHUjQ5a3pcLrqeahIVC9P0FTkS0ZnyZ2CO1X6ViuTwlkmdiSpTHoWa4sADUUBPCnr5Rry
	 lKoiH4FBu5claP+EJpXfZ7AN5MS/gOXF3tf/LigkNxsfp8Mc9KZQ/33ENPEJojXqzaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UEAOLX7l;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE83606A335
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE83606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=UEAOLX7l
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so62296f8f.0
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794903965; x=1795508765; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=UEAOLX7l7cnwnMylb65LK6lGxPXBNYSXhSi4g6VCjlx3u15dXuKJJ17At6S/HsGzXq
         ggqexs6vn/jsiAFSygZEpK/eXu24zeYNDhEt3eX+bIqdQOU7krrH2uAVW4/S6/t7I20m
         xvY6muKC3w7G9OX5wyTrLSj7WIOoFyO8SSNi4wORThA+GQ3ofkoQdeDoOiC93e9UPPMj
         fel92QVVW9w3x0dVC4d1EB3bSzt+Og1bIVxFNuUtg0G0ZUJe79TGR6f/N8bjCEDR2jLY
         BW+lkEDOBfsWAAPxjL3tQbgpzXJiSp1d6PQh3Fy3m5rUsE7Igyx4gJps6nl/+v7iwZHY
         Iq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903965; x=1795508765;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z/NZRmC5bENRF/WsK1hUt6gARTy1xozW3x04wBCWbAk=;
        b=03JEft0TG1Xm8E8TOayeAbLh9nGOp0BZ+Xhe16Cwyna8B064AjXmn9ldQ6HFsiJ81G
         torlqxN++fbgqJYdBSEel6SmLHXnAMQiUDN3ieW/VEAAe4/F+uYq0RsEvJsYew1go6xg
         dOx6Bn7l/irRXehf+071PPM92vtuAMkAiAfxtJUX0EdL+bYMrRNGpTR+cCXPwQVLApg4
         1qSAHp1a8Ry4Lw3uDfRV5sgShjqzi9P5DlRNdEcKJQTlFLJXiiuwrdwW/hA8DlwtTT1y
         HsZg4Yk4S9FJdgmkz+ZJ7FvTwUwHlzubCVtqQD49mi0sJgRhUXgPZPMqxoocfwIHNmxA
         abFw==
X-Forwarded-Encrypted: i=1; AL+hErFn1s6WrCwyK2LmttaN7GqhL7YsaXg4TnyQddDndJ3aamcvVcvr3st4EEma/tcoXvESoyRchh58WBCvjg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9mzhacIGcWCAwWrFzlIbA8wL/zzxoakZwdqBs2CLJsTFKIusDM
	LxVs6YKMfc6sbWsqvkB9S0wSJnPRCCKgO12tkyazz94RitQ08F9quzG923m33hUiSqQz
X-Gm-Gg: AYBFou2E/ia43NDqUdUSKkAdq7+pRSl9c/OKr7er/SWzQgN0f3kMZs2iwIF8rNQxbbR
	h+0chqbxPjB+d5Upkvy9DxuqjZMQFCJDmaQZfulv9gOTEN54biD1tLqRcAOYNfJfxttkcVuO/om
	0fPb/ObZjzfgUmEeUryGPvQ4V0ybK3ZYFURagZA4T8t/879a12AoNjvMq4b3ArY/oc9iTcSEdsx
	/ztTOxkjCV2FHyeFq+gb6j6ywUDaCxjTBxxHjo4+ptUl/IUdid1TBjxNISG1zjuUxd04jpPkEZ3
	CQccs0EUU43NxRhppGGW1aMzm7Hff4b8+65Iuc797tu+si+qmXBm+DRLZyVcaraf9REA3VBAQrd
	vn4Uw/ciZilL7pOAGjUJbj5hsfLlHVsGfxCAdYlZq/LS3ImXG21NHN40MUH1rde6rVEn4jRYysw
	AXnpPZ5k+fYiyVAXdHITMGAuOrJ7QiOskb7Bxu6d5gX2VCIpUhYiE6E/4nKAvmJKcAR7AkJZ5Zl
	lvUGV+Jn0abS9OgvXLvwLegWayqtuzuSnS0E2TxRUo6YyuUmenyVjrVdWI2OSrgYq0FY/OyvorI
	KeFv9BQf05qsaLjf4rm66OHkJxTqc31Pp54zzS9ri6TldXUMPwSXfrSxx3wgYhdamQiiFkTpqve
	ZerOVgnTINTg4w4jkxg1HSMoinBlX4Dz9DN5QhWLX0dcIGj4OozIs2AH2
X-Received: by 2002:a05:600c:5493:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb783813a7mr42606245e9.10.1794903965400;
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm12629125e9.15.2026.11.17.00.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:26:05 -0800 (PST)
Message-ID: <88041240268f70b218de7dfd58c41977d03a60d3.camel@amutable.com>
Subject: Re: [PATCH RFC v3 03/44] target: fileio: check that the backing
 file supports ->{read,write}_iter
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
Date: Tue, 17 Nov 2026 09:26:03 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-3-8cbbea1cf34f@kernel.org>
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
> With fd_async_io=3D1 the fileio backend calls ->read_iter() and
> ->write_iter() of the backing file directly. The synchronous path
> goes
> through vfs_iter_read() and vfs_iter_write() which check for them but
> the aio path doesn't. So a backing file without them calls a NULL
> pointer on its first I/O.
>=20
> Refuse such files when configuring the device. On the synchronous
> path
> every read or write that needed the missing method failed with EINVAL
> anyway.
>=20
> Fixes: 769031c92c8b ("scsi: target: target/file: Add support of
> direct and async I/O")
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0drivers/target/target_core_file.c | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/target/target_core_file.c
> b/drivers/target/target_core_file.c
> index ab9824a4852f1..a5391e57e9aa5 100644
> --- a/drivers/target/target_core_file.c
> +++ b/drivers/target/target_core_file.c
> @@ -144,6 +144,14 @@ static int fd_configure_device(struct se_device
> *dev)
> =C2=A0		goto fail;
> =C2=A0	}
> =C2=A0	fd_dev->fd_file =3D file;
> +
> +	if (!file->f_op->read_iter || !file->f_op->write_iter) {
> +		pr_err("FILEIO: %s lacks ->read_iter or -
> >write_iter\n",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fd_dev->fd_dev_name);
> +		ret =3D -EINVAL;
> +		goto fail;
> +	}
> +
> =C2=A0	/*
> =C2=A0	 * If using a block backend with this struct file, we
> extract
> =C2=A0	 * fd_dev->fd_[block,dev]_size from struct block_device.
