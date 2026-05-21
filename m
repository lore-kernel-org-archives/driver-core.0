Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8227039A047
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779399725; cv=none; b=GlV1bFPazllOf08I/+RLHNO6qDrVx9BhhjkOSX4lTQNE8xgCxfTOldj3yER7WkbuCsmRsC/w/0oeWFNviJoM+Hf0+PMyu4AJlNEjSGbMFI/IO6sKBE9/p8HcQRxHXeQT7IoX4JVHQ+TulaBX/qcwrB7ZoK/RitF4mhMyvyTdBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779399725; c=relaxed/simple;
	bh=D/mGd45lIxOmoA+3CLxznMCipzEdkpoXc+Nyoc+yLW8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=buXSGQzCvodyPBq5oLUiOIR19Bq4WahwTifIaKcL7/uJqpv+go9eTtLYrWuhD+WwFjPHExewaLV/oUe4n5HTN68YBfzoE01ryoGLUSPcQXj7OFlVsCQdjV6ejjwlzMtihI67AAZOatjySk/jIJghL3hvUHi4wQagU3rA2hyu5rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkPhxdj1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkPhxdj1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so32257275e9.1
        for <driver-core@lists.linux.dev>; Thu, 21 May 2026 14:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779399723; x=1780004523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5Z8Y+t9J8Wa71S6tIY8eYY/uTfey2i9ekOe1cFWFGs=;
        b=XkPhxdj1wFezLzWz8aeU3cIMlTBkVn0hc1uliz0kTMtwmGuEfNViRBEItfLFLfyGJM
         cZZiH7o+IXYdJSN/pmpmxHG2SIeeKle7MyhkiobTo7Z/M1iM4IqBM0syleghi0b0p+lE
         wqrUxo1GiUDIqAwd0WE7U0Z1Gi+OeQ9i/OSrOXa72i9wtRYcJLYJjOscwadfkRuofaVK
         /jLs2Cqo+9pIMtv0sHYYAKy2HqvSaqLi+l1+DssafG/KtgkSEnN5wOYQjWq5bcBbIQsq
         KXfvTQUbvQr+Dqt/7ekJix4fitRsRl/oMkUqqBAGjHF66nBPEn9T3Tgj0StqXT/8Ewqf
         ikrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779399723; x=1780004523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p5Z8Y+t9J8Wa71S6tIY8eYY/uTfey2i9ekOe1cFWFGs=;
        b=cm3GDX2awkaJnwwig/zUEELRF2xUMqrk6VykHGUFZsABNhpemJLAXGhyYJauwnwkVZ
         uvsRb4VHhJz+Ep9H1XMlDNFP7vYBYpYXFFquYUNc6Cj7x+8WCmWSO287IVDvFfr95vY4
         685LN4ptwHNqatmgr5q5/N11cdN7Eh9J78R4eiT45Uqft0d10ttv/AThDyvZVaEExWAZ
         uXhDbivDyt86XUp25+7GAbBy+2QP/egFtdAK+kmARog9KNCZQjkoUU8rVC41C17Qb8y/
         QkfQy0mk3bMpnsxp2n+rsPxkV7+YFaf/esTnU3OEqt4WamXD45HeNPfGjyJzr4xuvN2c
         h6iA==
X-Forwarded-Encrypted: i=1; AFNElJ9bCLVO0waBnAoRYUXqxUiajXZtIfFcgYCjG+AMM7y5JiHhaWzYtCBy6sssqlhSIpVSEIaYHn2zPo+QKg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6lvIrB/cW96LSf3ENTQm3A5K8Pcki3pgxqf28tCNuvipdg9wH
	ld5oNh/5DPGuP10tS/6WkgUpBM0aDLsGYUz1Ut4RiwQvySv3dXdFR2XcqGONRJtR
X-Gm-Gg: Acq92OGRPLYBPXYqqmruT8ME0bS7zBMEfO92ByzZsci8Fd4rYFP7ZjIOviGjW4MYnBC
	tpL0Ve1/p38LcE4izydFCMf3oiwaoSAgo1wuxyzA7aMr6mnuly7LF22iJyOzbzSLBryqSN9bb4P
	vjpJSDZqPYQas9P25jOnowjBRxSVcQJfxMSdRYunPRkqMOpp3qmcAKV5Y5G1m5H9hm7iuicR8Vb
	nVQiaNEJtiE9rw+btYQSn89Zof0gybg0hq/xAAE5pS6l2FX/ThTohrEl28/OVAJ9/ZoeDCbE/xj
	yCAc60974IlZa/XfFbcv8v6FtJ3Iyd/iybERcWVL8LbsK4jk4gSAt9bptgK0A/HKlvWkmM+NAio
	iJIsXSvJYDEzizZacPHJi/JY/6uZTvE2S3h4mcCWyOWvCmFEiU4LlDkr6SS2uO0aoPLib04xC1R
	7teBH5nVVV4CdzsKIo0XGokl090woCqRH1K/vJRQa6Gw0Ectnicd3Z6iHjtmXfzN9U
X-Received: by 2002:a05:600c:3547:b0:48f:e230:8cab with SMTP id 5b1f17b1804b1-49042adfb3fmr6064695e9.31.1779399722784;
        Thu, 21 May 2026 14:42:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb496e098sm172859f8f.8.2026.05.21.14.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 14:42:02 -0700 (PDT)
Date: Thu, 21 May 2026 22:42:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, NeilBrown
 <neil@brown.name>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Message-ID: <20260521224200.4996ba7e@pumpkin>
In-Reply-To: <ag8wQfilndx2CtX-@slm.duckdns.org>
References: <2026052000-drove-unicycle-d61b@gregkh>
	<3fb84b4c71fce994cfe1e06a5fe3970f@kernel.org>
	<2026052129-mustard-sepia-5cd6@gregkh>
	<ag8wQfilndx2CtX-@slm.duckdns.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 May 2026 06:18:09 -1000
Tejun Heo <tj@kernel.org> wrote:

> Hello,
> 
> On Thu, May 21, 2026 at 08:18:32AM +0200, Greg Kroah-Hartman wrote:
> > On Wed, May 20, 2026 at 08:19:34AM -1000, Tejun Heo wrote:  
> > > Hello,
> > > 
> > > Two nits:
> > > 
> > > - Buffer is atomic_write_len ?: PAGE_SIZE, so probably better to clamp
> > >   to that than hardcode PAGE_SIZE.  
> > 
> > Where is that check at?  And sysfs_kf_seq_show() doesn't check it this
> > way, should that change?  
> 
> In kernfs_fop_open(), if ops->prealloc, we allocate of->prealloc_buf to the
> size of of->atomic_write_len ?: PAGE_SIZE. Maybe we should just update
> of->atomic_write_len. I think the intention was to allow >PAGE_SIZE atomic
> content. seq_file now does dynamic buffer resizing, so this may not be
> necessary. There's no clean interface to preemptly set the minimum buffer
> size right now but that probably is the better direction. Then, we can just
> always go through seq_file.

Except that the buffer size is always PAGE_SIZE in the prealloc paths.
A larger size is used by the cgroup code - but that is really for writes.

There seems to have been a lot of rework to all this code around 3.13.
I can't quite see what it looked like before.

But I think the write code should reject writes longer than
of->atomic_write_len ?: PAGE_SIZE because all writes are treated as
having 'offset zero'.
If op->atomic_write_len is non-zero overlong writes are rejected.
If op->atomic_write_len is zero then writes are truncated and userspace
is likely to do a second write for the remainder - which won't DTRT.
The naming suggests that loop existed in the kernel at some point,
but I can't find that version.

The 'prealloc' code was added later and reused 'atomic_write_len' for
the buffer size. But the only users leave it as default - allowing
PAGE_SIZE requests which require a kmalloc(PAGE_SIZE + 1) (aka 2 pages)
because of the trailing '\0' added to writes.

The 'prealloc' code is all about trying to avoid a kmalloc() that might
fail and cause a deadlock.
But I suspect the daemon doing the system call wont actually get to that
kmalloc() if memory to so short it fails to allocate the IO buffer.
Even if that were a problem an option to make that path 'try harder'
to kmalloc() the buffer would be better than preallocating pairs of pages
for each of the six? cgroup 'files'.
(It could even fall back to a single preallocated buffer for all users
that deem it important.)

Reading this code is hard because of the tangled mess between kernfs/file.c
and sysfs/file.c.

-- David

> 
> Thanks.
> 

