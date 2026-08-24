Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA31625B2F4
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787531393; cv=none; b=OVo+E9qBisKJDnPZ/RHQrHBCWdv4b9zxei5pVe76r08rDNatQ55Wt4CoOjJKYgQaE+VHr+bGulHj2seEICleEpmzJ8b3cmN+Bl5+djx/nnZjep+WknDCTtyg3sWLgS+TgDi1qY43SV46Mbtduf8bT4d9iZVmOCuVXushFYS6rd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787531393; c=relaxed/simple;
	bh=S2VVXIm9NXC1/7S/os++vXO4y8V6rLx/oQUPCR5sBQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1ZaDBIPI36DXGLP472TtVa6Tu1ERD/nPVk2qKWgVHASwPm4yO6fGXzJZ02SNW1AStnXOlwyfpeHSr6eXU3EbeyFKdkSYFhWu/U77472aVYnmYinbSKdpEv+XGSmhXNkVRZ9ar7JHy1hPC7hyv5fd6wNJlVpyY1vE/pAdYmwZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dHAdRGIG; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dHAdRGIG"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-527e352a167so18079391cf.1
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 17:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787531389; x=1788136189; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u0oyaTfgHNj82lNrvA/IiuK50TaUKsX5aQhkbMM0CdQ=;
        b=dHAdRGIG6O5TGqy6fgTl6DAs7IP/v8bubDP6ADgpYX8gto2fUbTDxUR+c0SKheDXW7
         jj7AbfNcDzJzEbcg5iUr6t0eiK5mGkaqdnMLhkr6nE/nOV6OoJZsTVHWogD8OWeCQPMM
         1ffvc/GCXyK2PsnKbpVvY7qEUGosqDWYr6glF5VUukAiuyHvO7gjnoXCatfhBrurYk7u
         N+q81QmatzWE0Wu1TvbZu54X5Zn7Oik3jxckc8ZevCQ4a9vODkACtdaz76qhibAnRhHg
         +NJUgB3S0gNfMAnJEg0PYRCUAHgw5Bx5AmrafxRiVI5vPL1aS1DmE4b7f/1qgibF3tqV
         f8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787531389; x=1788136189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u0oyaTfgHNj82lNrvA/IiuK50TaUKsX5aQhkbMM0CdQ=;
        b=OIn1TH8MGxYNPTPayo4NdO7l2w9RGnp+HITSC9nUvBHIXeXR82ZODJcDZjmLFUGgUo
         7zd/uY83lFdaP8YPqkkr7NnJak5X8875gzGsr74QgM44IwrVQW5+gerlSQbaAViOs0B/
         9afZiZMJIFSqsgz5Fck3gIJQ3AxjBQyqzeYlawwmG5zdAkTU1ektKXE1wlYrLNR2E52H
         Vb96MD8glm6MUW7WdPPGC193khSyUFDfyW/UDE3EV7/AIgtUZ19xB2zAQjd4LAgFjr3E
         Ss4CWskMpqa7MSpdKZKT93006twxG3m7QYfZN/NDd9tUtWaqaBkEW9JcKxjKJOyM/Jkd
         +aNw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+F/EwqxOM2veA8kFbpH8zazH8TD9Kdtg4cSiRKFg+WkHg9giyIb/7xnEWQoQE5VvOUVKnvWUzfyQXUA==@lists.linux.dev
X-Gm-Message-State: AFuF++myn9i0U2NNtSB8TQ6hkrVN78XBFkMma19UoStzTssAoQBzWEwP
	gtnr1902NruFoYwZSU/xdzXZ3jx8iMztkfR1J7VC5E9wJcvV7wriCNdyT/EgKy6iew==
X-Gm-Gg: AR+sD10RAB7+Mja+yRNYtWUp77xVeIad3X/6zu72YG4Iu21hkxJhLh9h6O12UbDdxjL
	DVnq3QGSjBq6rF3stdGhSQUmwZTO6KLxPxU0nVWbCA7ztsrrLdE+ObPZWEvveK7Z/itVWxQOrdI
	5ncmc2upzN3meO1NVV/9I4EDgXJHvMKL06P9Pe1iVKACHObNiPOawjvpl2uXUwr1x5lzZ81CV4e
	fc4tj/P5f1oaUxWd191PIBJqp2pCvlMl3G062HfSc1VyHzC6uFOEkRIDVx0+Pg8WISwTcLOkAN7
	0TLZd/KTa/Q5i2uojwm0E6TUFVlzCaNl5OnKUuq/wWmv6bH+J2vEVW4713gdtF2Osat6+bjU02o
	FhNMFg+Yhvj4BeOPVuhe04/mZw65B9/uL5A8OcMfzhL36a6yZ2SMp4Zu8X2fZngookzy14pHkdI
	cUspNbj6kngED9AM8tksz8IIhySKaaPJZgnnlRQ8JawyvitHCJwQnSzJm0WnJ2udfRwYEMXdFG
X-Received: by 2002:a05:622a:4083:b0:52b:6543:d8b with SMTP id d75a77b69052e-52df573954amr253830641cf.12.1787531388897;
        Sun, 23 Aug 2026 17:29:48 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09ae7211sm36723671cf.26.2026.08.23.17.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 17:29:47 -0700 (PDT)
Date: Sun, 23 Aug 2026 20:29:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <190b86c3-5332-4d77-920c-a845f8a01b2c@rowland.harvard.edu>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
 <2026082307-negligent-lusty-750a@gregkh>
 <2ce6496d-6166-4470-b424-2b187908f2ba@rowland.harvard.edu>
 <2026082333-persuader-overturn-8205@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082333-persuader-overturn-8205@gregkh>

On Sun, Aug 23, 2026 at 07:28:10PM +0200, Greg KH wrote:
> On Sun, Aug 23, 2026 at 10:40:03AM -0400, Alan Stern wrote:
> > On Sun, Aug 23, 2026 at 01:46:43PM +0200, Greg KH wrote:
> > > Ok, I'm going to add a new TAINT flag for when unbind is written to as
> > > that is obviously not a normal operation and is only for debugging
> > > things by kernel developers.  Adding loads of work-arounds in the kernel
> > > for this not-real-workload-path is just not required.
> > > 
> > > If syzbot could stop hitting this path, that would be great, as it's a
> > > root-only thing for debugging and not something "real".
> > 
> > Actually, I could imagine people wanting to use unbind for a real 
> > purpose -- you could consider it to be a more specific form of modprobe 
> > blacklisting.
> 
> If you want to do that, just don't load the module :)

No, because unbinding is more precise.  You can unbind a driver from one 
particular device.  Not loading the module affects all the devices the 
driver might bind to.

> > The bind attribute is the one which really should taint the kernel, 
> > because it bypasses the normal matching checks.  Also, all the numerous 
> > syzbot bug reports coming out lately have involved weird bind 
> > operations, not unbind.  Unbind should pretty much always work.
> 
> "always work" is tough due to the races that can, and will, happen for
> many non-hotplugged bus devices, as syzbot is finding now.  We shouldn't
> require this, as again, it's a debugging thing.

If a driver does not support hotplugging, shouldn't it disable the bind 
and unbind attributes?  (Is that possible?  If not, it should be.)

But if a driver does support hotplugging, unbinding it should definitely 
work every time.

Alan Stern
