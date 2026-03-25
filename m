Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2433E5ED0
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774455904; cv=none; b=kvntDdqYoIoF6ESSGwXwwGdNuPZMslYJlz4qjqOsQAXq8HppSL4KiyQAlX4cnAYyunwObwWNigFBUI6OOg24oBbWg3P9yQTrYx4xL8ab9saQrcsc3T6t+9n1CNzJmniSyqEYvbSw17qW+IqVBwOP7H7nsqhNhfgmQwboUnMot9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774455904; c=relaxed/simple;
	bh=TvBCl61A8pRGQ3wbNXv1tUUeRTzRACn9JMKDEnQXM4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIZ0m6ZA0QUlvx2fqk6LdZOmCbFxTJ86NQk7EBBQBmUeatcX+0v4uMw7FfNW1wZwgHm3fRq9Nv/v7Z0ZyVD4hBZN+dc+qVRbnsC1YlZf86qJ5QXDc3Wx7Vm9tqTAjAEzrD9K9KlI57FINFGon2FwKCl4i0A14QlrFv2SS6AkSZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n13PwmUE; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n13PwmUE"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12a71ade78cso26245c88.0
        for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774455903; x=1775060703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8WN/loHYeE0vx80ep9YSWX3QJwZgwmdiEcu1I3Zr1o=;
        b=n13PwmUEYvXx5mrQ08oMLeDAJPiHPMIlwhDI/vPdl5PQhDMj0AWKW8fcg5usNkcJdQ
         UAGXz0W8GFzybMfqTwBHsSt3E//2+t0/PlZp63AfWdS0phBtacy14yzHvz7jfvOO5Wfi
         08vjj6iBmtZdK+hCWDhiAQKJzHg1A70m6KkBO6D0ijbveE/NbmDjGMRHk7LmRkoHL6Pa
         dO/VSqO1d7xcYSPeU6jV2CLt4uBo6ukuYC+ivm4svffxD5olPHpWIezpC/MT/7Fd5Qaf
         RSOGevm5Uq6cLU1+QgW/54gYZQEgfRYM0lpc6INd89/NiyxLxEVJNqgvmrY5tUCEu3kY
         ZsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774455903; x=1775060703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8WN/loHYeE0vx80ep9YSWX3QJwZgwmdiEcu1I3Zr1o=;
        b=olq99VT5mPjVQYg3CBau+GMWwQweUb9BVFiiEIMHxi4dE6UKHrw+PioOU3xG9oqd7A
         WKNEcYWquJ77xOzxx50JoyXYTuxxwi+L2gjrMjBvdqbrTVL2T68jWtqPimMnbbBctblN
         VZJ4GqXaSnnrZb51PJGdf0YD2D4ZeNfdEmp1ThULgvPGePRrp1HyYEHguvkUMHR3ndyJ
         mAYOQdIydkvM5yCtJiewQAVFPagM7bh954K0uKCRRUtagRrHksHPcPMa9iU9PwSSsEXg
         uM3Cws0bCANaBFb7Qb17/O28Cf6d/5kdIlhAjwmN47p7QLm7wYvxCJb38ZMD8MqDdx5S
         fCjA==
X-Forwarded-Encrypted: i=1; AJvYcCVcz5hYoyuW55DAbihwD3LoYKd5fzaGR+EUTd8PTFBkG7kSdEwYyF8r5Ql1M8Edm/NPRMz8/xo1PrtMJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmQwCKt8LaBxJrWsH+Hlb0n06zmXn7oWbQfPsZMLEr1Rt91m7x
	DnRrrP00HXAMDQPtf9oNF2KD4Pd2loW0KMIfIe8Ekob1+QQtP2UwjSCY
X-Gm-Gg: ATEYQzxrnO106RLb5BmUNiwJVmcTsMi1X2DDTjTcxI1M4oG5uCECRH2QF1j5uiIPj9F
	X1iMDOFGwMIqNl8+mfPC1q3pK47HXJQ9VCXBVnJtRtnjgUgHySnXWFLnF+U9xYSkErmHwcDh485
	3W5Azsusw9M9jCagTErtUcviv8lSXfB0c/ecgPXG7Xmxfa8NkCToAM12MuPuuTmLKV3hTSTDIgv
	x1pyafaC/QCGbDg8f/EprZ87CdTiVN0NOtMlPAJlyIFO2lu8BiMHIyO2tc4gVDMRHiWw2zk6u0i
	XALoJJbtOK14CZSbe84nGQUMCQi8wcZa5y/0PWrcMfH3tGV+EEhIqR9KmTnB2PaATC/72VrOda0
	B+eqiHawjVIxdaeU4odYSv34Oqhmk4XmbIY7YvLMUarMZAGAunyjkzJh0h0p0LWSHAjVLjGDDSS
	J21a9ZluAs9odmXKsGo0YU4PEpfp90SFCvuaeBiBZLYZIY2Ew6UuCLoaU9zmcv0qcH
X-Received: by 2002:a05:7022:7a5:b0:119:e55a:9c03 with SMTP id a92af1059eb24-12a96ee755amr2084867c88.31.1774455902462;
        Wed, 25 Mar 2026 09:25:02 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa6e5b38csm302268c88.2.2026.03.25.09.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:25:01 -0700 (PDT)
Date: Wed, 25 Mar 2026 09:24:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev
Subject: Re: [PATCH 3/4] software node: verify that property data is not on
 stack
Message-ID: <acQJiEAtM3LKxDBS@google.com>
References: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
 <20260323-property-gpio-fix-v1-3-9cb46e5fe7df@gmail.com>
 <acKEm4EiZBqJ67nM@ashevche-desk.local>
 <acK34X9vBmvgHhLU@google.com>
 <acPMJiZHmxvVYYte@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acPMJiZHmxvVYYte@ashevche-desk.local>

On Wed, Mar 25, 2026 at 01:51:02PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 24, 2026 at 09:17:18AM -0700, Dmitry Torokhov wrote:
> > On Tue, Mar 24, 2026 at 02:33:31PM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 23, 2026 at 05:39:39PM -0700, Dmitry Torokhov wrote:
> > > > When registering a software node, ensure that the property data is not
> > > > located on the stack, as it is expected to persist for the lifetime of
> > > > the node.
> 
> ...
> 
> > > > +#include <linux/sched/task_stack.h>
> > > 
> > > Looking at this name the use of it here doesn't sound right...
> > 
> > Because ... ? object_is_on_stack() is defined there.
> 
> Because it's defined there. The key word here I see is 'task' in the name of
> the header, without Ack from sched folks, I am not convinced we can use that at
> any point in the kernel.

It is fine to be used in drivers, and it is used in USB
(drivers/usb/core/hcd.c), SPI (drivers/spi/spi-mem.c) and others.

"task" is not magical, it simply refers to a process or a thread (user
or kernel). This particular macro just checks if the object is within
limits of stack area of currently executing thread.

> 
> ...
> 
> > > > +	for (prop = node->properties; prop && prop->name; prop++) {
> > > > +		if (!prop->is_inline && object_is_on_stack(prop->pointer)) {
> > > > +			pr_err("%s: property data can't be on stack\n", __func__);
> > > > +			return -EINVAL;
> > > > +		}
> > > > +	}
> > > 
> > > And again same question, why we can't simply dup them as we do for (string)
> > > arrays?
> > 
> > Because majority of users of software_node_register() deal with static
> > const properties so duping them is waste of memory.
> 
> So, then why can't we do that for the references? Just then copy and free at
> software unregistration if required.

We do not want to copy and free because that would be waste of memory in
majority of cases where software_node_register() is used.

When dealing with other kinds of properties it is pretty obvious where
the objectr itself lives, but when using PROPERTY_ENTRY_REF() and
PROPERTY_ENTYR_GPIO() it is very easy to miss (I did! and I made them)
that the reference args object is on stack as it is hidden behind a
macro.

So it is just a safeguard warning us ahead of time instead of needing to
figure out why a driver can't find GPIO even through the reference looks
right.

Thanks.

-- 
Dmitry
