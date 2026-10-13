Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4B153C3DF
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791918713; cv=none; b=BNiN/+2OrxpP21Va1rT504fkQvhnUmkpKgCLFddCYdaiSIWrEjHvyqjDh2gUSzLsv2KJPvlH9YI5ivPt0hovf5zWk5WYIe5XFP70H2wusBYlnGbQdjypaWByJSgG9ksGW41nruCwiSZuiUOR2ltE0bACmeZfH5ko/RRC/lShkLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791918713; c=relaxed/simple;
	bh=3HuQAdiPdsh0jwsZb5sHsgSWrdEkCX/qTBEkBhJKRIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHV7JWuZVV3PWHcNPM850+VCgMaRd6Gqz7wRSacvX+ohzBJKhz24iQLj91FAYGkPwVyOdLdHvfrOsS44yV29Df+YtCIhPhQ4ILahiASddkHup8wPGF7fVJaUuJ+HRqZ1MLedhshQ5e/Bxi8KaazYKJ3IAh8sq3FrRE5wL7+2Qa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XWh/seND; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XWh/seND"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533861a59b8so39796111cf.1
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791918710; x=1792523510; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EUvFEr9KZQAlEL8z8vQRJTx2wZ9st4nMmUN/wIzO9UQ=;
        b=XWh/seNDNGPxN5LcE69rRw6KnMENtBS8s2loIiG92tdUohVC7aFn5DJ3rXi8B+jlEj
         AjhjybNK2s9SmwguaaFLPb68weLlOeg6aJZhRhUEQr5YfGEiPRGk31DEH6CUbhIG4OJN
         OV+AVAZsVLeq04B4L5E8LJdMyfHA/su12ynLsYNVYjUyYoyoWAac8PqfR4BXVsS4dScV
         eGy+S6Wj/DArWPTS3em63heyH8qQujAmwvDm5Fy/XYAE9PBtdEZ9hNkjrUIVMQj/21tx
         4N6B0dpRGEfcpmOuhvVtgwl/JeKHRSjLN83NNpXFrjYKRu92Ift7t9AaEWWLYpgB0GfO
         Vwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791918710; x=1792523510;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUvFEr9KZQAlEL8z8vQRJTx2wZ9st4nMmUN/wIzO9UQ=;
        b=HRYLcxsCeFYA1/uPvMOP1bGlmcOkXWaemAdYz7iEaoRi3pvnKY+/udg/ABuTONnT5h
         HwmEj4j98ciVsP9+g50rNjUyPa+z0yacj9Mx25DN6O0/CXyQnrT60kj0yY+Ljo3Ex0O1
         PDA8KjWTalw2eWZa0b6dbnFoBJUgRaWES1/wsPo6WOZwTPT9ZWgBEoORROS8NMycr6Wo
         k/vHy7JOTH1L08Hhyw2K+NDb1y131myYkVuQdQPY85eJ7B/VhRZe/RTfdUGOzZi6C6bz
         oUJq/4KGXrxv57YK7uVPbQcSk7Gy11IzO9lhr+6Lyj8tjvEjtCwUJHnZRY6FvvEUrJZK
         ptEA==
X-Forwarded-Encrypted: i=1; AKwUvBySbYPH8f44kBUKOx+6xHHqkmI4zn1B6eNJpeX1fbVmKDqslrrLQCMRoJe58VGEEqCqo1HiNgQd6XWtwA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI7ZbJIFtluEspxATLioayw9iUxkFKD12p5yUE6Sf33uypOIAY+
	vc3AwMkn2Pg6K+nSdhmA8fJOIEhVkXvUEJx4nNSziePuvbpB+DtuufiTf8vZ3xTGqw==
X-Gm-Gg: AYBFou20MB2B0XMWEmTSFI2rox2Nm6A4zGabrN1mAKb3tkLFFw/ED7DlFcPWOtpFRDk
	GkSVub1PZjyhvLDXriOmJEOJ0SOj1TLSBxPLp1m6O9cKItS0b0LvJYeDAB4fJk6de/8DRoo576J
	KumyNGZOqG3FXrk0BBOx9F7LwQjQmxkuddEmbnsSBnnQknPu0QBEs/XJKs8DNd7whCaULM1m5OE
	+0awacpcEBpCcdmUQkJhInOUJiqTv8+Q7zjr27NHcJXkayYStzE9PT8DtJsrF1RL68rPDYrAY3O
	ovls/E26envkJnyOqGcxxJo5Tz0fpFrVbzCgfEOxslOA/by3dvIsl4MUBdgL47ldeAnA0ytjWnB
	bL6yo1kf46kQRIklwiLpgdoC6BJD2oOGJthZhW+w+dtg39eaipa0m/QJNAKO/rxWhuCBXhnq7HF
	dgNJuJqxbeqZucWscL9BUIvDRZ7308nBERW/HO7OZr2od1wuDy5xOLsxZMnHikcuMBNhgWnCCG3
	irJCf25HAjbiBmouw7JKCczSZzdkCRLUdkTx4CTug==
X-Received: by 2002:a05:622a:48e:b0:535:a5fb:67fa with SMTP id d75a77b69052e-535a5fb84aamr206754931cf.70.1791918710428;
        Tue, 13 Oct 2026 12:11:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ad30csm109382571cf.23.2026.10.13.12.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:11:49 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:11:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] driver core: take parent lock on deferred probe
Message-ID: <ba24846a-7403-4bb1-a0cb-869cf1d44e05@rowland.harvard.edu>
References: <20261013140615.1226992-1-johan@kernel.org>
 <DM3WA69YX6WE.2Q4DY9MIU7A0L@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3WA69YX6WE.2Q4DY9MIU7A0L@kernel.org>

On Tue, Oct 13, 2026 at 07:43:08PM +0200, Danilo Krummrich wrote:
> On Tue Oct 13, 2026 at 4:06 PM CEST, Johan Hovold wrote:
> > +void bus_probe_device_deferred(struct device *dev)
> > +{
> > +	if (dev->parent && dev->bus->need_parent_lock)
> > +		device_lock(dev->parent);
> 
> This looks like it has the same potential UAF as the other patch.  It's quite
> unfortunate we need the whole need_parent_lock thing just for USB.  IIUC the
> main reason USB needs this is because interface devices share resources of USB
> devices and we need to keep the locking order to avoid inversions, right?  Is
> there more to this from the USB side of things?

That's pretty much it.

> I think we can probably do something like this
> 
> 	struct device *parent = NULL;
> 
> 	scoped_guard(device, dev) {
> 		if (dev->p->dead)
> 			return;
> 	
> 		if (dev->bus->need_parent_lock)
> 			parent = get_device(dev->parent);
> 	}
> 
> to avoid the problem, but it's still a bit ugly.
> 
> > +	__bus_probe_device(dev);
> > +	if (dev->parent && dev->bus->need_parent_lock)
> > +		device_unlock(dev->parent);
> > +}

Wouldn't it be simpler just to make each USB interface take a reference 
to its parent device?  And likewise for USB devices, if needed?

Alan Stern
