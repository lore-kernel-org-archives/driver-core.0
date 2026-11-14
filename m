Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657339;
	b=5cAheFUOguo0T8cbV0nJu0Upd/J8z7egsAYOK//FwqWtsVeeGjijS2dqpBoR6SWZssJK
	 gpKzUg/0gA+VtZrDWI3mkcnAsi6mlLORLKuTO+as8EjNIzVJmjW6rIWzoZGmqVn4Vh+68
	 QJuaU3rqDWNXURkVda/rBnX8vOfMy9zScIqJLvZ9ttdkpviISe05j7KUabd7DUyXuZitu
	 sPRhuE31E664o5jA6V8eGpQnc9412h5uEyFwaq1NywVT4KjAgUKq27A43Xh1oy1DF8VHb
	 SYz+ZDPLeP+hc5yyvS0VM39Cx0WP8Xzlo97xjDIfmSLtrwUregdxL2KK6OGWzQsHvmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
	b=vSGGEbUadpqLXTn/MobbHGjwmlC2Fqi3J+lR8tX4SPcOcIMEp8qMuCegQx837Ob7QPhL
	 d/LxWHAH6GuIrLb/pInCgZ/Tfa+ybVhJr++nEEDZoM7pJFRrcF4rjkh5n9c2vGeGK2hbB
	 T/HypTBPjF5XhjiV1hvl1OP8DPXE3FkZFRgYKISqruWF4WDjbE6Ea1etmL7+Co1GUoX2p
	 5f9YS8QjYto5NPlO7jon7e8K/ycvJswBvMh/VBkb3FBUt85RIAboZThe0gR/KXDRAqfl8
	 YXD1dzPCjhTJu47Cct4HrPoWJBAU9giLPJWn6ekxvLHCCx4crKcNDwuXt+NXT84yLgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzHg5wFX;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2A606A336
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 11:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC2A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EzHg5wFX
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3070678a12.2
        for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 03:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794657337; x=1795262137; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=EzHg5wFXockY2Q2XbmZ0Rn0jHLk3CY0hLNC7OoS3RrleaUIl+J6GzGG7YZ4Icf05w5
         Axum0xWvjOs2h25bZpH5InnJW178gL+Av/YpTMptaGuviJDc18kLohTeepllKubM/g1s
         hIoB4iPE0dyT4S1xGaue+1k589ir2w8yCC/z4kMhzDm+IEk4CVlTGK+Lmmgwehsg1x5H
         urnxdrpRqz8y6cwBmGE3tIJKXXERFmoWvaFl1y+yBe0LIcvbb+7WaxvBVDlYbbAPum/J
         9CX9jRbt1BONCtPVPJYOtRpHrgmVf76t3E/KYoYLfkA4ED5xiSUspf2abgm6uyvLdCIe
         GBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657337; x=1795262137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nJvs09p7QWIuuw8YOzj5TR133+2IJ5+yRajckn/hsO0=;
        b=0fyt5yHzG8vIARYyXVhiUXv2vMb2lrRtBslgy36TsTa86vko8Qm6/Y2kA963DjIY24
         zKAttxLM+jvDugGl613zTUwHPVXy2Mg8I+7UuDwCGLZ3V0SH05mUssUZ6QwmAPpAnnBO
         NM3v4ZSJydLNsg618wybu8/PCiDRZOPh+7bRGlQ+AhzzPW6hMtvmIK/1481fVl+fPwE6
         LVk84ND/QQgZHp0uup+RGA4uHL+AeDm2tapWF2scSUEsyzg27Z/9ZvOjRFnMDU6drt9J
         yJv0U3oJTOShkL2y+HftICqWGKXva2LHq6n7eVEoletVScA3mZ7rkofC9eJE+s0xvmRH
         GBjQ==
X-Forwarded-Encrypted: i=1; AL+hErGU0aAGNKj+ZoWb780ofSBvJu8kbQXpySy7fbqCwqiRUKwK1bWWJPCOGJL//nwsFyzFiZT/GjPCsIrllA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9I4a0/WBqMajrL2X/q4WKDdb0UKeB7FHzJKtV7f+ctmiJbwCvf
	Oi07pgHINB6MKBKAaEMyHee8/2lFh8CXXzJa2lkvmsOYaYuSLX6UUv25
X-Gm-Gg: AYBFou2aAl6OWKmz2ccjo1QvIk1LsUCCwc1Vzq56IlZuAZK82NHm5sZdlfRj9sVe8hI
	9RG9biH/TsdlVEaJNyhuXI1BkFLjGUQ2ElbFCePRUenlU/TnZWDtq8NhnaapsgTVy3dIqtVrFHC
	REFObMna4n+O7r30GgmBTqDXH88jAxpZGaMuq6yZMKID25PjJ4pL0M0AlhuOrCpgUFZD3tfwthb
	MKzjyZ1OJ5+D2AuleqXsmbwsWulCHLEUy7nK42ohpjgFQrmlpUkvwhhuCnFJOxnIaS3TEBpsxF1
	/iUHhm26HfbwiTMCbO80HzVXbrlT2togTQXRYUBzQaPhH0zsHtYuJYSO5JD4Vk9CV4MKqAcP04V
	oSTnxFYemY2sKglaFqWSP0Uo4Qz52XNK5iXQ5jpeNrTCDSCsyTFSegpAXQLu9BcuAA0mD/vaCYM
	mXyBbaut9EN6ICQSW3erC6caV4FPJFjPswlSR3t+TAqRVa7dMYlalJ7rDXW94rvQbnhVe1Rab66
	rOoazHdrrE+w4TTlxLcW0+vVDS2zIN/cSHe1DBSd7FTejS5+M6de3YQ18Z8xkWwPTcDuTxRjMHL
	OcZW6g985Fh69YwD+G+Fih6pmsknlNb58R6Cqke4J1CJB5P+x635OEKY+JWjO2VZjEzvqDP2VMD
	Z5XzwViOKjas=
X-Received: by 2002:a17:907:3e10:b0:c40:231:6eab with SMTP id a640c23a62f3a-c5096370c31mr441592966b.16.1794657336589;
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b41f44sm206223866b.31.2026.11.14.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:55:36 -0800 (PST)
Date: Sat, 14 Nov 2026 12:55:35 +0100
From: Amir Goldstein <amir73il@gmail.com>
To: Alexander Mikhalitsyn <alex@amutable.com>
Cc: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>,
	linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org,
	bpf@vger.kernel.org, linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC 38/41] fuse: refuse files on pseudo filesystems as
 passthrough backing files
Message-ID: <avhMN39TECaur0sS@amir-ThinkPad-T480>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
 <20261110-work-loop-pseudo-v1-38-4c998976c6c7@kernel.org>
 <20261111151202.GA11391@lst.de>
 <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb1d72cf25d10a960da627f6d93a3e041820ed3a.camel@amutable.com>

On Fri, Nov 13, 2026 at 11:25:57AM +0100, Alexander Mikhalitsyn wrote:
> Hi Christoph,
> 
> On Wed, 2026-11-11 at 16:12 +0100, Christoph Hellwig wrote:
> > I've seen setups where people use fuse to mediate access to sysfs
> > sysfs in odd ways.  No idea if that's still around, but if so, this
> > patch will break it.
> 
> 
> Oh, that's painful. Do they use backing files for that?
> It's a relatively new feature in FUSE...
> 

Very unlikely that they use FUSE passthrough and if they did
very unlikely that it would break their filesystem.

The API for fuse passthrough is that the server requests to setup a
backing file before open via ioctl and if ioctl fails (as this patch
does) then server falls back to non-passthrough open.

The ioctl can already fail for many reasons such as MAX_STACK_DEPTH on
procfs as the commit message says, so server needs to cope with the
fall back.

Thanks,
Amir.
