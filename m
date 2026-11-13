Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565074;
	b=GqtLprPsU6EgHBpfkxA/IyHMWPzIY7YmPB7D0akbPfDQbfElHORbk7BytWdSVCnQ1Unk
	 7CK8R6esrd0eSZ1uG1XxbCtDYn6tPqzdcG/oTBOnBt8LgTKjyhLfRX4G8vG2I9i6HexzJ
	 T71uLFekr5tb7CQF3xKcsCmWvYP85SSwE1GtICS+kp19XYIk+cNRGZvfIekaee8dfe5nx
	 GAAnBaYYmWxYjHmcWr0B5Qk+j/Rv3h6d8yKrCu83zX/VFTtAmPCvib8bJJNHRjGmzOCJ1
	 NLrFLTrGHRN/CuTX3IZhst2JrkkQOMMWeWog4ZHyRiPaNNjSWLi4SA6uUcLoquW7Ehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
	b=JT6DJFsfUtkNSnYE9ydNn773Ue8NY8w8TTWPZpsnM2yoxms7wPitbMBfi+sPu2DaOs8O
	 9f6FaApfe7Vgq5BoPsFQZK2UBV64Xov/vdNi/cME2bT4o8MuvFnhAaWcyOg9EranjnK3x
	 Vul+fsYjP5mOW/cq+q4f4Ex4c4gKwfADLUnf94gRCsue0l93dUWA/M8WMJe44N2cXT+8h
	 5QegBEj/kgUwOPWwT/hi28u2RkWQ9+6DXERB+uczFE/i7H0vc+ycFpfZycj5x29RCJ77Q
	 S+IGPKRqp3sTMPpuFY0nMNhcDLqghAzxMHtDR5bulOiPJUtQ9rQhWJxHcTfgH/TB/WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMxZ3N7T;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716F0606A88B
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 716F0606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qMxZ3N7T
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so13807545e9.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794565072; x=1795169872; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=qMxZ3N7TISx7XpMNQRK1jnKLlhEpRTonGMRKIMPpHSGe/Juw2H3Cq4zhDtNAfATL4V
         w19mDU3JyzruRSwgm2fXw9kyP7148iS7PY1cAMcPpKKxK60KknSMnY3RDU5QNjIiiHpS
         S3mJb7gOnfWqCVox1oe+DUcxJ5kLan/9cKAH5aiNVFkZhLJCN6DpJ45uiXymbzqKGV02
         8NbXN3D+pizy9ARwTjDgH0I23olfUuG4UNSZghjRrsSECyHAnOzY1Frc50SMSUXy+7+A
         4qp3u38Ca9MfquRtxlFK6sunOEBbaq/EJAr4iLwy8WwOC2MbMrGIJ0WKrrIYWcY5JRxH
         PVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565072; x=1795169872;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqPqkCGOaO5RL/5NE1UeXRxAO7AqEHmUDDsiHSGxDsA=;
        b=tkClWDkG+4RLvzRuwop9ttr4i7wQeFbKMfKKNPy3Sm0iP50y0dksZ1ljCunA/XV4Kp
         FhcR7e6Y7JWcoGLb/N7GPHSBgDD+C63tNu13adrazELO1vJMuF+zg2t0+RAkMP7DLmj0
         3Y+d8GXpmR0RPpuxKkua3fHAiCflQTeETvIL1Hxo0NiVy2BoDSxFmaJMOFCLFOEfTwrq
         FrpgIZDef5wUEuAwBuSg6OxOWJZcNA+m7MKvvkQYtNH0oDJ0360NOKlNoFxwGWl83RiB
         L8ABd44VkTp+MWSL7etsFbw+q3KsW0oSDoc3ucvIvj4vO8M6WnHugdZYxdmvTYxPvfMF
         JLcA==
X-Forwarded-Encrypted: i=1; AL+hErFucSgBYYOHWl3mrFCXl42kLC4qwPCMzuI1bjPJBhshfhSb8pun79HkthQEihKSys+zS+V47SfmJ+itqg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9U8QKniEDD+5PQchjep0rk628fX+nG3wvr8fVj0+S3LpfXLFFv
	sPFgNOcftiEIheXhoHLu0ozcDsWbtKdKrs/oMQsQrJQag7W0IVvg1wyxRBJPKxdaH8ZE
X-Gm-Gg: AYBFou0Kp3k1A0tnsdjHdaz4FaX3ggWOrmnKEiLD4h5lSFOUgbUsmZrHQltDcPQGCVS
	3HWT35w0Owl2xLK/clgJS1mTFdm5+xkFDTJrbUtL+GUm/2utYsyWcxeiLTTD/4OhxZNCSgtjRDY
	G4tnm7k3QHl+pW+SU2XsX0CWj2xICJ2Jd6+1+E/7SnWhd11KP2pLw/nyFu+yw5AmG3NIkvWBTzQ
	HIdPmD2IkmAiEsWY2X7Ddkp/mD5h6r7lbi0V9Dx/JL1A8zRQdJgYenbVa81oWZXXFyZBQV6F6oE
	1Pz1Bj1dUfVRQsUffw11HMWtbR/KDuBxA4uPgmzcjLEzK4JSQp7uvbF9EW0JZtJiroflVctn/hC
	z6rcj1UzxLkeDiFscSGYHIXV8qxDJ23Y/6oDgSyLKIXC4mq5eDkVdUZ4Fh2vxxJrHaS6TGBI5I1
	iAlXWiS455lp96qyCCKfNeBKihO5x8MyWNNsQvSQvZNP4mDYYs1Ic/U1JlBIZOtNh/gU/0Vj+/v
	3bHSfY0uFu+p1gg4+e/yVBLBPiOetj84EDYnPClX2ImtzkRO7u9LZwwW0TbLyCFUQ+Lc8Mu4wAe
	Ftz9J8F2MJi8bJx4cJ/ITN0SJERIPw/aXPUOCBH28aUVwYupw4xkV5BeQ9DdXfA=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr43851425e9.2.1794565071804;
        Fri, 13 Nov 2026 02:17:51 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm3937770f8f.5.2026.11.13.02.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:17:51 -0800 (PST)
Message-ID: <7cde6f3091f9d90593e4a6441723b6b889cc4024.camel@amutable.com>
Subject: Re: [PATCH RFC 35/41] zloop: refuse zone files on pseudo filesystems
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
Date: Fri, 13 Nov 2026 11:17:48 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-35-4c998976c6c7@kernel.org>
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
> zloop opens its zone files by name below the base directory but a
> bind
> mount can put any file there, including a procfs or sysfs file.
> Refuse
> files on pseudo filesystems as zone files just like loop does.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0drivers/block/zloop.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/block/zloop.c b/drivers/block/zloop.c
> index 65634a39b0bf..dcc06dd47b04 100644
> --- a/drivers/block/zloop.c
> +++ b/drivers/block/zloop.c
> @@ -1137,6 +1137,11 @@ static int zloop_init_zone(struct zloop_device
> *zlo, struct zloop_options *opts,
> =C2=A0		goto out_fput;
> =C2=A0	}
> =C2=A0
> +	if (file_is_pseudo(zone->file)) {
> +		ret =3D -EINVAL;
> +		goto out_fput;
> +	}
> +
> =C2=A0	if (zlo->block_size) {
> =C2=A0		ret =3D zloop_get_block_size(zlo, zone);
> =C2=A0		if (ret)
