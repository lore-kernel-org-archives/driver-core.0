Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.235.229.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095474;
	b=MlUP63p+bDow23WbxBqrsa+GUYDCTC+X6vpub5vOTFck24R/Kg/IJe5gymBfsuiU1QKB
	 y3NOKMbZ2mhOUJOGcZJrPGbRcMvA3TPpr2cJMZXgkuW8m41XCaXvAEZa1soVEmU0ZDUNF
	 PzzVcOJGq96hTYbxFvh1ahW+BRIpaUUeLP4UbjTHvImno3HOvU7q79HGTI3r5wFAsFW+i
	 JlnXlwkgDYOgKGHaHpi/N/lgIANYl7Flu4F8kB6V26+Tf+rjuIpzWWE+CUtJa3H3jUci1
	 8HsVbL7PqyMywdBCf/tq6ybswj2JMrzEIf9ou3frhYz27AxBLDXPjQFLQdMgZ6Ppepw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095474;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Chocolate:X-Operating-System:X-Uptime:User-Agent;
	bh=PvHb4BMFz+BfyBgTQmp1wGbaq5LzX9lJwo4XV2wURNk=;
	b=zcVIL9yaxfRIzQjUm00VQgU+uRSlDoIt0o3UzX3rMy/8yYXWn46G+tdZXakBSrnTd5PD
	 C9yBUBiMsLrHavDYUgJ9rrZcZiiTzLIIHoUlROuX5X/iBXmH/GNy4L4fowt+HMZuRBudE
	 jytqsHcSIJqHBi5dm6DNb21Xd7EBth5Ka6A694GHHZLhf8su8iaGv6W2tlW3sBTl4aqXG
	 rR+mDY6IX+7qMtsPdfsB4bouJiUAHzWi5mfwPxgzVJ3lliqJ1ao5hEF5xFBLLvgvAEPY9
	 mrNteQ5q1giq/Iw/TSc0JmNbpRcf+DX7cgM/2qFYBLxxI9oyI/MaLcy3oqnRfz7T4Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=treblig.org;
	spf=pass smtp.mailfrom=treblig.org;
	dkim=pass header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=VbJ4X1gv;
	arc=none smtp.remote-ip=46.235.229.95
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB58B606A320
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 13:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB58B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=VbJ4X1gv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=PvHb4BMFz+BfyBgTQmp1wGbaq5LzX9lJwo4XV2wURNk=; b=VbJ4X1gvq6ChdoYe
	gMNBL9UcXIhHKEero+upzkxoBBieQikOdHHTRmQ2sANb4cfZOcXd/DyLKJLComOmf/1xTPJ48oT/i
	BRIpDJBY94Zh14ko+6zoThf0v85MLA/+hsW1jUiyAR8li3OsgtSkPuhRqZOphU6sj+zbVb2+IJqbW
	DtoezmVa0g56er/mTSIPv2umJGArFvrfFgkeGnNByE7e1uov2kiiCgQODCJ3B38fuUHnBg/JAePsn
	sQ0wodY8qOXbu4ogHzD7EoLzoG96v4NDMXWYelLeEEeprJeWKa1imOr07ygIlGoNobIV4ymQ9BVaf
	/Gp5AYNOa/Nto/lpjA==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1xU2Kl-000000026Rq-3zZ9;
	Thu, 19 Nov 2026 13:37:51 +0000
Date: Thu, 19 Nov 2026 13:37:51 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: platform: Check for NULL name in
 platform_get_resource_byname
Message-ID: <av77r-cfY9p1KOAa@gallifrey>
References: <20261119001820.168018-1-linux@treblig.org>
 <2026111930-swagger-emit-3a58@gregkh>
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
In-Reply-To: <2026111930-swagger-emit-3a58@gregkh>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.117+deb13-amd64 (x86_64)
X-Uptime: 13:28:58 up 5 days, 15:37,  2 users,  load average: 0.06, 0.06, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Greg KH (gregkh@linuxfoundation.org) wrote:
> On Thu, Nov 19, 2026 at 12:18:20AM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > Drivers are calling platform_get_resource_byname() with a name string
> > derived from a DT.  If that's a DT that's broken without the field
> > that should land in the name field, a NULL is passed and it OOPSs
> > in the strcmp.  Check for a NULL name and return NULL; turning
> > a crash into one broken device.
> 
> Nope, this is as-intended, fix the DT :)

This makes the difference between a machine
   a) that panics and was leaving me at a black screen and
having to rely on pstore to figure out what happened (then
later once I knew the device I could then load the module later
after boot, but still then it made the module un-removable)

and
   b) something where I get reasonable errors, I can unload
the module and reload it with function tracing on and figure
out which bit of the DT to fix easily.

which given that it's just the webcam is one hell of a difference.

If your worry is that it'll just leave people shipping even more broken
DTs then perhaps a WARN would help.

It would be good to have a kernel we can actually debug.

> Also:
> 
> > @@ -464,6 +464,9 @@ struct resource *platform_get_resource_byname(struct platform_device *dev,
> >  {
> >  	u32 i;
> >  
> > +	if (unlikely(!name))
> > +		return NULL;
> 
> Only ever use unlikely/likely if you can measure the difference with it
> not being there.  For a call like this, you can't :)

OK, I was just being consistent with the check directly below it.

Dave

> thanks,
> 
> greg k-h
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
