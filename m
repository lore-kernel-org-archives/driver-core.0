Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872933DD87F
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 09:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083558; cv=none; b=coH6P05lLj8w72efzzHRbVYjJrYF24o6DgavpAysOlnBA2FbUV/Q9IHOUnVPr3+y+z6tLGKUCs9oanO3jjMcEgb2bhafZdM7G6ftuIwNwhTGxagEwR4XnBuZCGIyrZ2/HuC9kaezcufxsjJUAPFLt+UNTDPVSXrJN7Xsdys4fzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083558; c=relaxed/simple;
	bh=1vXzvFUOfc9XwAC8q5N/sOdpK4L0M5KL0CA4o+35Qi8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+utRPqRRSiABl0zAAJwHPGx1aih3/LWOEKN3SQyUwhMdIDqsnOg0fnxqf3xb/9suxR43EnzdMMwChjGcGCTto7ZXrTCRGIEpAdAAuntPsLSOvq/rjEJj8CEt7fiwnBpWxUxJ9MWmMpa4wGtD6y9m3BtgO6v+mj3ELjPItOMC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+WZI5mt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+WZI5mt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4905529b933so70240105e9.0
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 02:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781083552; x=1781688352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6m47JVDwNRIxN+tYRIL+SQbEWAt5ykAINiL7bz4tPVs=;
        b=X+WZI5mtW++Ffe5QVH8VdkI7lHwbgZHTpcvN7Rc1RCcVgeggIgllc0mnxrYQ7xl8Ps
         pXisf57SuRrrQXTZfbRIClBVfGen1FIeVg6lWN5iLnQ6XTJxh+XMvf8Xu7h3jWx2Doqp
         yand0cB9Hj3ndOh33O968lG+dJi42UepaadTNZXUdxHAj4jf8vCabyKHDPuTisLVU2BN
         Owxjqk9wPuuuJeefrUmids6RckzRrIRttuYz+AFCjaTE9cmbFDbFeNHvjw5YUwHIv8Cf
         XKXwYTgBoM4tpDFn0PFvYCYZCqyX5cODkRMawoprdrG8zOv5Hn7H4J/gtC6u7kWIaeUa
         /8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781083552; x=1781688352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6m47JVDwNRIxN+tYRIL+SQbEWAt5ykAINiL7bz4tPVs=;
        b=GbiyBV46rct0cZ4EExp5HLro2bjUaeVWk562P8596Ap7j2oxyY7bUxfxwC0VK8uV6V
         jO2IFTh5mKaxswLAeRkNkJPqQaUY0VS/UFT1My7kQezJwu6Cee5YskaqydClIzMBtcVG
         FEJdFdA9fc/twi/cqD3MWZ646wgzAQS1jq/GBd6jBcvn6u2PiLXS8S9ABusR1oO4c+u1
         aBryfJABau1XONt2H0dj49PfwfZp0MabdQgoTJZ6GZGhusjmm7jB8gMZfLb+twqCwfCs
         4iN94Kk2YLIvyZNAt2AjPKNBzDvcW3tjMd7Y/kUgeKM79lbzBIQ9l4TlD38u5zp7m43D
         jStg==
X-Forwarded-Encrypted: i=1; AFNElJ911wXkz+bMlS+Ba/oC/5e8Hki2V60XBIklHbs7uRfU9fzkLU0zSMI0ZMOyXpSLtxsQYDm0mDpde7we8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVoBpPT2XxA+SG9+o7mfX4diaYwm9a9d0WNg77/pqpLTqkfMON
	s5ZFpdJsjjOkbIAZxVh3iOKgrpAwvkC+bqqkqBqZwHJTShSxfITknT1UAr06fhy/
X-Gm-Gg: Acq92OGC99PIYeTOMWNIxY0EkEIccSkA51XqQ6FoRa/tW794VrFOWtYrDgr2NwJdVHN
	gS55FvioKLqr4a+2NwqlTvHlZc8UxqTEVRwAtjaQVLavLFAeRUP1+/ukEql0nu0nanWdt2wuU4g
	uXMYnYOByFjjgrnxy91V/OqQ58+UBRALsTF4dfot017GYtfuxcAYMW+bnyPu3lcVwFX31KzKyJ0
	ccQqkeZTe9EjMI6ALgcm/WeVWSLmDApAG3n5xLq47i7/pGWZ5+SnCUQqFd6AjHfm0JhLE+0DE1Q
	rATWTxxHVsgCnPwjnUZnXsNwG7BsxZTPTiIQDZLalPLyAs/d9KF5ioZZVT9njBD73tYaNECCmDQ
	WPQWXrdK91eDIiGmGF1SyIZ7h58OnEz9bDAw5O0S3/GOrdhwWQNDllK+WSQT//rhuzTTJjKaq8F
	7WOfc6QiIIrcqK7z3tzAxmYGXddQD3nMZGkey/ejrHvuv+j5Xr9GKSLT3lity0gdSdvFWP4Qo=
X-Received: by 2002:a05:600c:8183:b0:488:a882:c7 with SMTP id 5b1f17b1804b1-490c25c6625mr340667165e9.25.1781083551620;
        Wed, 10 Jun 2026 02:25:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm552542965e9.6.2026.06.10.02.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 02:25:51 -0700 (PDT)
Date: Wed, 10 Jun 2026 10:25:50 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, <linux-hardening@vger.kernel.org>, "Arnd
 Bergmann" <arnd@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH next] driver core: Replace strcpy() with memcpy()
Message-ID: <20260610102550.723c4cc1@pumpkin>
In-Reply-To: <DJ4VVUTU8GK2.22DI9BDCKGEUW@kernel.org>
References: <20260606202633.5018-1-david.laight.linux@gmail.com>
	<DJ4KTIFM6YN7.3E07VW7CCJ19U@kernel.org>
	<20260609162258.5228eda2@pumpkin>
	<DJ4VVUTU8GK2.22DI9BDCKGEUW@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Jun 2026 00:49:10 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Tue Jun 9, 2026 at 5:22 PM CEST, David Laight wrote:
> > On Tue, 09 Jun 2026 16:08:55 +0200
> > "Danilo Krummrich" <dakr@kernel.org> wrote:
> >  
> >> On Sat Jun 6, 2026 at 10:25 PM CEST, david.laight.linux wrote:  
> >> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> >> > index 75b4698d0e58..63fdfffe1a8c 100644
> >> > --- a/drivers/base/platform.c
> >> > +++ b/drivers/base/platform.c
> >> > @@ -617,10 +617,11 @@ static void platform_device_release(struct device *dev)
> >> >  struct platform_device *platform_device_alloc(const char *name, int id)
> >> >  {
> >> >  	struct platform_object *pa;
> >> > +	size_t len = strlen(name);    
> >> 
> >> This could be strlen(name) + 1 right away, which would also avoid the memcpy()
> >> to implicitly rely on kzalloc() zeroing the memory, where strcpy() was
> >> self-contained before.  
> >
> > I tried not to do that 'optimisation'.
> > Here the kzalloc() is almost certainly needed for other reasons.  
> 
> This is true, it is needed for other reasons anyway. My point is that currently
> it is self-contained and it doesn't matter if the preconditions ever change, so
> I'd rather we have strlen(name) + 1 right away.
> 
> > There is also the issue that, in principle (but probably not in practise),
> > the input string might change between the strlen() and the copy.  
> 
> This is not a concern for this function, but let's assume it was, then your
> proposed patch wouldn't prevent anything bad either.
> 
> For instance, if the string would change to be shorter than what strlen()
> measured, the memcpy() becomes invalid either way.

Becoming shorter doesn't matter.
The problem is if is becomes longer (in some fixed length buffer).
Then the copied string isn't terminated.
This does happen for updates of current->comm so can be a real problem.

> 
> Also, in that case the strcpy() would be more robust and vice versa with a
> longer one. But again, this is not a realistic scenario anyway.
> 
> > So it is probably best practise to not rely on the '\0' still being
> > there when the copy is done.
> >  
> >>   
> >> >  
> >> > -	pa = kzalloc(sizeof(*pa) + strlen(name) + 1, GFP_KERNEL);
> >> > +	pa = kzalloc(sizeof(*pa) + len + 1, GFP_KERNEL);
> >> >  	if (pa) {
> >> > -		strcpy(pa->name, name);
> >> > +		memcpy(pa->name, name, len);    
> >> 
> >> But in general, what's the improvement? strlen() still operates on a potentially
> >> unbounded string?
> >> 
> >> It removes the redundant strlen() calculation that is implied by the current
> >> code, though this may be eliminated by CSE optimization.  
> >
> > CSE won't eliminate it.  
> 
> Ok, but in the context of platform_device_alloc() not a huge benefit either.
> 
> Is there any other reason for this change? Am I missing something?

I'm sure there is an overall plan to remove all calls to strcpy() and strcat()
because of their potential to overrun the destination buffer.

-- David
