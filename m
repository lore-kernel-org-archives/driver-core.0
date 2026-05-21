Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B1037189B
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 09:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779355045; cv=none; b=VoDDyG9UPdXukqIVgM7dTzsVl814uEVlaM8caAFTS25oIEDj9rfX6G1kxzMcX/mGFfI+fB+vVdGzKAqqS9unZWkqF4mEeVlFOtSt1Rnaa0DoWQpqsCpBSHLSr0uW8GTyufDVE9iULaUKlLSW4rsHPO8BVlamn3PJeQsZt8BlV8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779355045; c=relaxed/simple;
	bh=cTV6KZ/1JoTdkUE4/yXHzPrvXTvrzpKHCSCuJvrjN/g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XHfOlp3GX5DfQ+6ofSYcRlqYe8fb+mHTXcOBjpyzyphdDFvLeQV13JS5qVzupuNLWdVcai8LFDd9Au5YqZ+XpCpYjn5lMSbh9VI5UQu/pyQjn5+bl9ZuGbuuOKP1Fl7iHURfiieKfRMtRdeYPLA3Z8g5TUqlcZx57ZAnCM2L14c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVnB5lk4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVnB5lk4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso43596125e9.2
        for <driver-core@lists.linux.dev>; Thu, 21 May 2026 02:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779355039; x=1779959839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLFRyz/pQr7d26L5ScuODNohLQeaWaPTqLQEGYdho9w=;
        b=BVnB5lk4tV2PLR9eU6Lo8AOBp13H5F77WiONrh1zXuQYXvuIKHDXKToa3MoU0cqfVS
         Fnc35JIQnglmlLwJRt2QcbMTj6w2oud0CSyM97cP3+xdpSyCR+S+vOMeFOLHwARHG6tf
         xB6lcC2h9+smfF3rS46bNIRVEvmpxDtyxUJU1ATIITO33HrpFgT57Enaas4iF7O0I10z
         1nDLW8jqRjmZV7qBSlbQ96P53yGmEf4Y4gguLbBIGav6EHpe/MfkAiZ/3ulvFwoUmwWk
         6TMufO0UCfpq42FYp7CIOGlhUVXGIYr4BmR8sPwI1GRbDEySKPswiKoD6BXaUd5HM2aI
         kjOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779355039; x=1779959839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WLFRyz/pQr7d26L5ScuODNohLQeaWaPTqLQEGYdho9w=;
        b=HlfC/gcX/LTYwe6B8oYJCABqoKkGrLshqm9z8w4D1ZqDT+A9uOc8fVcVTH6fZmviRl
         +tbIAutO9Y8d8XZ6JCG7HqjZc9brkwOSabYbtd/LlCvZPADDcmz/fPI5WyxWY5lpBce2
         h26ZW/srOQGbHc0YHSLizQ7mQgvuj8TZvlMBEiju2y7Yi6PfvcytKCIZUgQ8oYvprZDU
         3dLyB7U+5UaIrxQWZMWGfCU3Wt2TnpgLTXfYL1bd9BnGZfxinS1BEkR9WSdDZBZ8MECC
         /9+6Ks8OjNkZd5aMJvLI7+QsN01GGxnqrgQnEYO1Oi9/ntaeQ2TNaxQCKj/oaiCrbRQq
         S4yw==
X-Gm-Message-State: AOJu0YzNwbnMNX7ZB13iBodmjMfjmZB5R15tX063NQh2j/sI4PnFpkDV
	+6DKYbzFpbaqA487eyuy7G6DaZ86dF9iDLYRhZeW37+ga9dZGJ6QkJ1LGOLVhh5p
X-Gm-Gg: Acq92OGtAr/eZdWkjSO04sz/E9wQklRsJCox/SR3uQPdLX93WKAIqyatePa7BDy8W9g
	7LYmR7P+Ywa3PAm8e6qf/M9wvR4NUtXqKoMZI/TGU5KsHH3rewWdSYbkC11qrcuAYY9o+ntjKmx
	RnOEiLqUub17D23qLc547XNOMoQSK/NGkkpHM1VxGg5EuAbUobfEtpnp9zroOP3xu1knJV2QS2G
	+wR8PGRbGzf5MenSpweWQNUHX32fw6oKlcsnfY6nswbCro4XU/aD71c9M4CcM8e5/NwBX9aqITd
	XeDmr+k+X6xvfQscQit5wuYpSJVPO1QKugrqcFY8rrwNAP/o8RZnSd3yU6V4lV+xI8rurcXUjBG
	WmXbY4zFbyTeTZptG5jKqsuFe/huQeojUl/MaMNygpp9mNnMjdcERU8J4MxeiqbMHVgxQjq8l+e
	VhkQWmizY3ulGAH0PpV0jHz51Oarqu4sb2tmVV/NHJ0qRod2q0mJqfNZ2/uWpZwcuwJLsKkCS0M
	1A=
X-Received: by 2002:a05:600c:37c4:b0:489:1f08:91b with SMTP id 5b1f17b1804b1-490360a87a0mr30144575e9.16.1779355038541;
        Thu, 21 May 2026 02:17:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa9366besm1539255f8f.31.2026.05.21.02.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:17:18 -0700 (PDT)
Date: Thu, 21 May 2026 10:17:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, NeilBrown
 <neil@brown.name>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Message-ID: <20260521101716.6e460242@pumpkin>
In-Reply-To: <2026052148-glamorous-hassle-2cc8@gregkh>
References: <2026052000-drove-unicycle-d61b@gregkh>
	<20260520231158.407ebf0b@pumpkin>
	<2026052148-glamorous-hassle-2cc8@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 May 2026 08:19:16 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, May 20, 2026 at 11:11:58PM +0100, David Laight wrote:
> > On Wed, 20 May 2026 15:07:01 +0200
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >   
> > > sysfs_kf_seq_show() defends against buggy show() callbacks that return
> > > larger than PAGE_SIZE by clamping the value and printing a warning.
> > > sysfs_kf_read(), the prealloc variant, has no such defense.
> > > 
> > > The only current in-tree user of __ATTR_PREALLOC is drivers/md/md.c,
> > > whose show() callbacks are well-behaved, so this is hardening against
> > > future drivers doing foolish things and out-of-tree code doing even more
> > > foolish things.  
> > 
> > What is the rational for it using PREALLOC?  
> 
> No idea, you might want to dig to find the commit that did this.

This one:
commit 750f199ee8b578062341e6ddfe36c59ac8ff2dcb
Author: NeilBrown <neil@brown.name>
Date:   Tue Sep 30 08:53:05 2014 +1000

    md: mark some attributes as pre-alloc
    
    Since __ATTR_PREALLOC was introduced in v3.19-rc1~78^2~18
    it can now be used by md.
    
    This ensure that writing to these sysfs attributes will never
    block due to a memory allocation.
    Such blocking could become a deadlock if mdmon is trying to
    reconfigure an array after a failure prior to re-enabling writes.

That might be better handled with a flag that changes the kmalloc()
to NOIO and falls back onto a global preallocated page in the
normal path.
It would certainly let a lot of code be deleted (always good).

The atomic_write_len would then just be a max_write_len
(and maybe renamed).
The only real use is the 'cgroup' code that wants to support writes
that are larger than 4k.

Currently, if atomic_write_len is zero writes are truncated to PAGE_SIZE,
if non-zero overlong writes are rejected.

AFAICT the file offset is never checked - so all writes are (sort of) appends.
I'm not at all sure that makes sense.
Possibly all overlong writes should be rejected.

-- David

> 
> thanks,
> 
> greg k-h

