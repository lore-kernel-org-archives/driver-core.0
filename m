Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C7352021
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 15:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018583; cv=none; b=UJJCBRPZnf43+utzaNp7uja+ZxmPFl5blrIXxUVVqcxLPdGB/TK53Rjhq0XOD+nZr/0zwUSJoFEUmQ8oe9l0H1SOWzrKGU8RrN2C3jr6lZvqjHmc8dKsWIIQ9V7IzhQDI1bxCDpkNl0a9eLRhb8S7s8Poq18GvDlF8g9a2zl/Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018583; c=relaxed/simple;
	bh=kuIHPRKQTH2/4GUOzUX9fYHsOqljjnSwteHizxDZwoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=skeIfvsJNlkr4UJptuU0lpJJqD+sTbpzs70XMp4XxItTWhFq0ddeEVmvaQyKsR+u/AludKAQObWe/2hjpVMUJSbWb5l1Z84fReK2HfQz9W2o7P1XOvGoy72xTZriNT054/Nddl+h/ZzZou0rWYqAKSTfHNWEnaCwlykDF7bbYrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvJ6VqpA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvJ6VqpA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so61484425e9.0
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 08:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018580; x=1781623380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9e8wekR8dwGp203+UO+bawrLa7V5VSovtR0ieIMnb0=;
        b=UvJ6VqpAtQNkLcGpnPMplZOk4TnWGNImpOqEwtAMd4yc09LXgPSJHhRl5DKu3A2I7l
         kO8SqFj8/kn/ygtx+z6TaS2EyVKK6E1phMPKEtwR+sJ6cgh1q35lbxZ3TVLqBS7dDoFN
         KqcBfOZkmwL6/QbWa44HiAmcpc6qxJTRjBontEX0gt6gZC/497PC55GULHh+3eGFwzps
         XgIs+IViVazrPZD0Nk02o09wxqmjhpdnNt6V4mIHj5MunuiqBgWWRJHj6unmabC2Sa+M
         4LYxnFb/KX+NdG1WrJJMb2jhJmyso0jwmvp47jLCPPTlBSAY2vkJ9H5jcVZGYtNWoc4b
         G6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018580; x=1781623380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y9e8wekR8dwGp203+UO+bawrLa7V5VSovtR0ieIMnb0=;
        b=i2zwGJD2TkUWL/M94nMYr/OSCZub8vl9UJFicATGKX2DL7tKB/0AQ25KdbDD56qS4u
         2d2dc0bffkztMVAYxR8aPc4+3lDlo5/2p0yBCzI8R8Sm5AKlW/Uw0kZox22sIxPAmpXs
         Exu92ntD0qlAvWZwwXR8Md+7ANj980I5ICbIjraKFHaqLjvM5YGACbGBggLM2ahx8y9X
         GdFw080slKB20UkrXIPHGArTkNm5KwgPBdlDhZGzmW7E6vRrUFmhnhEkIw+culZWykR7
         62vZpNcRltNu7cqHtZl3H7e0tUjgRetKnOGH28OTBfeqllhCaaN6E8KCY0tHLa+7wjzd
         RHpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+P/VWV9G2wN33HCWNMky/4CkHF8NxyZjFevhNb3ulzBeP8Q4nddq/OdmAUMaS5xGrYiq/iTpjrVSbRjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc/fM3Q8zpMe4EgkTlt6CTVwU8s1YBV+zd4wmDhSGdidd/mWZ8
	ZWJgY2Jkzhnkp3pSIRsYcdtpX2NfyXggI5Ea54n8Ls3bgQP+pVN/d4bExtI77zPE
X-Gm-Gg: Acq92OFyGlKi/y6hF2U77q/f4QQAlqIxqqEWu5jv8DEjUWtX5hv7QEf82tJqMJmppqd
	zznDxR+IcLl2xPPxYUa9HtqMqfKN098UykWgp7DC62zx8xEWPtyb7pJikS1Qa4mon2vtdhsXFLg
	gXbEMMZ7WVUnXYjPWPcbFAIbuRvNVOt/wiyi3O1GhaZEJqcmQJaHqJ0UxnBZgx32K3nXzcwLX3g
	iuFbxxSexWPNQ0VpeYRfaPb0tVj7Ensv6qGOr3rWSH+dIaJCcgsha6zoNoPu23knUVFtql15q83
	edcsYVKYmSYVV1RRsHQkg7LYNc9BpM4gVQszELWjgg5rproS6TwjLY68cdjuzf33lCBfxgZ0H4X
	FsRLNoKd5jNkr0VDCm5eI67Jk412CgysULzENM1hJULfJZVC69WFjTgo/SdR3ZWGKDqRy+2MBQn
	g4SWEe32foYwjLZ8AOXFGxXDuOfGjWo8ySNFOFcjRAv8ZhQyYyCnbXibA5taxvDP8yWXf/Xqs=
X-Received: by 2002:a05:600c:3e87:b0:490:bcf6:469f with SMTP id 5b1f17b1804b1-490c251d8e4mr357536025e9.0.1781018580077;
        Tue, 09 Jun 2026 08:23:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3e5a00sm484287205e9.15.2026.06.09.08.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:22:59 -0700 (PDT)
Date: Tue, 9 Jun 2026 16:22:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, <linux-hardening@vger.kernel.org>, "Arnd
 Bergmann" <arnd@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH next] driver core: Replace strcpy() with memcpy()
Message-ID: <20260609162258.5228eda2@pumpkin>
In-Reply-To: <DJ4KTIFM6YN7.3E07VW7CCJ19U@kernel.org>
References: <20260606202633.5018-1-david.laight.linux@gmail.com>
	<DJ4KTIFM6YN7.3E07VW7CCJ19U@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 09 Jun 2026 16:08:55 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Sat Jun 6, 2026 at 10:25 PM CEST, david.laight.linux wrote:
> > diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> > index 75b4698d0e58..63fdfffe1a8c 100644
> > --- a/drivers/base/platform.c
> > +++ b/drivers/base/platform.c
> > @@ -617,10 +617,11 @@ static void platform_device_release(struct device *dev)
> >  struct platform_device *platform_device_alloc(const char *name, int id)
> >  {
> >  	struct platform_object *pa;
> > +	size_t len = strlen(name);  
> 
> This could be strlen(name) + 1 right away, which would also avoid the memcpy()
> to implicitly rely on kzalloc() zeroing the memory, where strcpy() was
> self-contained before.

I tried not to do that 'optimisation'.
Here the kzalloc() is almost certainly needed for other reasons.
There is also the issue that, in principle (but probably not in practise),
the input string might change between the strlen() and the copy.
So it is probably best practise to not rely on the '\0' still being
there when the copy is done.

> 
> >  
> > -	pa = kzalloc(sizeof(*pa) + strlen(name) + 1, GFP_KERNEL);
> > +	pa = kzalloc(sizeof(*pa) + len + 1, GFP_KERNEL);
> >  	if (pa) {
> > -		strcpy(pa->name, name);
> > +		memcpy(pa->name, name, len);  
> 
> But in general, what's the improvement? strlen() still operates on a potentially
> unbounded string?
> 
> It removes the redundant strlen() calculation that is implied by the current
> code, though this may be eliminated by CSE optimization.

CSE won't eliminate it.
It probably wouldn't eliminate a second strlen(name) either.

I'm not trying to remove strlen(), just strcpy().

But not just changing them all the strscpy().

	David
