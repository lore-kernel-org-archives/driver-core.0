Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5DF48124F
	for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784057132; cv=none; b=figIps6EWOvp538pz+BFed2P+1DL05Tr//ceehOGu7HlcrsQV/AETzmH4lapXIlKqIYkKntMS0xctBMSAAAND4NgL6Fy3iXA9qSMUiMfaAfO8Z5lVWobEOAdtmHtjXPb0S0Q59B2WFSiWEkNIKerFoRv/F8humbNdhp/Or8I1QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784057132; c=relaxed/simple;
	bh=QWcvV6fVT9UEcqdWIGyKil73iXH+THrW/6k3NvPhvvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7BOAjjRvKMwn5RlQCEc61R1ob6ITvVevxLPm7wW520LLL1/oZBjO7KIjsSI6aO0zKljxwljNKQs+5evRQC8DgrQ4Qg58EfF/B+bkNJMtP8FNdO+UuibvoBw9xDg4oUF7tDA1muwmqvw3rxNwbhDn0D1iWQTiqebBWgRR65Hxv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=u6TM18zG; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="u6TM18zG"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9061a795d76so12632106d6.3
        for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 12:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1784057129; x=1784661929; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DeJjtlrM066xLR7BVtiJMoEVf129H/GMCvG48B6bMZE=;
        b=u6TM18zGd3Oqa0AbB6NtCbZHiO1uSxyOqA28jUtqqsXPgRX7HT8qHFXeYg5bsmExAv
         nF/cSI2jYPKS0eKsdZoUoohEeFNHfrtn+n+HAOW1el0Ft7yWDd5U4SLlWC6L/Pdu1tJ/
         1HV5Mxm5Z7Jozl5SrV1wdYGqsg3qn5nNdKBUc3CUKrcgIQIlLKt/5eyF/0/96QDUi0Rh
         Wh7H/keb1tV4UZmAjV5wdtsJxhq3sNyx/zBS/oQL7y1L0OGueC/h5mKSFZdsI/1zfw6Y
         9cNLgq8Sp98Dk5uD3WAYqKxxzAKftAEZ8QcyZORK3qTYzc0ElA/buwnBy3JmbwhtdH4j
         WY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057129; x=1784661929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeJjtlrM066xLR7BVtiJMoEVf129H/GMCvG48B6bMZE=;
        b=V9t3ar4U3wLfBl6O/KWQnhu5gLyFCBI3U27TMnXdiUoqv7xPkbr2PJRSJcerUfntxz
         494XzIRQ1OF0gwpHJ7XPodTcKYWPVIZIFSNXJmWqwmEtv6+s/do61EI7wEXvYfgSZmLj
         KqeZQNpfhnPerIQKiwppMhPrk0edzlCYijYF6PL9fbnCmXs7WdJ4UJ7hDNMLRHOVPcuA
         xdM8gd+BQzQBNocSClf19grnbhPocd0Sj37IpApxvWS1MPaqVtCwUFtBGTv/tOuv7RWL
         1eddP0pHfQPDHDhsq6FXvmNV0Q8IxadVMeAiDWYu5KBB+6sm9mrRsJsshYx6nLWKrL5J
         qtPA==
X-Forwarded-Encrypted: i=1; AHgh+RrIvzeGcIxljR1BbGySOoVVc7q9y2RFEAEt3a+ZpIDHe4fFPxiyJ2NV+kA30D64/N8MQaZfWRFvGPBPgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwclqILtwHk5GnDFPYJO7A0lU7qJjvnayPHEaxsiMPlj+QjZzwj
	dBQkeoWtKxKt7Pdr5H7VR2Je8pnx+AV5eKJrzKWQZD89qcMemhNxem2rEYHralZ5cQ==
X-Gm-Gg: AfdE7cmM0Ea3/aydOSWMox9Z09ewrBdzZIKF2xv2qaLh9Nx9oDXrSe+3KpbYnkXycnl
	leYKhpT6drUWlTCwxiFoWuBbASAvvJrzz3at5Ma8GxAvK0yl/U/fPgyiljJlPdvjnGHqatT26il
	RZeN1QrdLU0aHKdP8QZNuE3mmj4E5qQ2E3j2uoX5jszwkkbMGMM+FTMVbMnKYMcgBIM2vSRFaDm
	x9EUtoHrnbhQGp16Q9CfSQyvq1ZVaX4//ktpH5vO93oOYLXyy4lb38yhM9CYQYdgjkxIiP9CuYp
	6WX7rcSijulOWkRxLOeEaILkZq8HWkddqZik3ju/62Rkv69/wacUOV7SEOfKAF5RnzKDrcmE+dA
	wIWT9ZjoHrt3JfaKHSJoXml6H1n8mIfcL3MpJttbZ1yLMyJzJQo5E0Gw+itKzIhH6XZGjjlYxUA
	EcIQF00EO8+jmKwnDqIn5utgRp
X-Received: by 2002:a05:6214:1303:b0:8ef:7fd6:11db with SMTP id 6a1803df08f44-90403d5658bmr171597896d6.51.1784057115041;
        Tue, 14 Jul 2026 12:25:15 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd248e666sm174996326d6.0.2026.07.14.12.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:14 -0700 (PDT)
Date: Tue, 14 Jul 2026 15:25:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Colin Braun <colinbrauncl@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	Colin Braun <colin.braun.cl@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint
 abstractions
Message-ID: <a6809829-b7f8-4181-9965-0668fe95d133@rowland.harvard.edu>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com>
 <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon>
 <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com>
 <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
 <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJYHI6W0VJ73.NP4QFGU57J50@kernel.org>

On Tue, Jul 14, 2026 at 07:53:03PM +0200, Danilo Krummrich wrote:
> (Cc: driver-core)
> 
> On Tue Jul 14, 2026 at 6:26 PM CEST, Alan Stern wrote:
> > I don't see why Rust needs to distinguish between a USB device that is 
> > bound and one that is unbound.  There isn't much you can do with one 
> > that can't be done with the other.
> 
> It has nothing to do with Rust, those driver lifecycle rules exist regardless
> and they are present universally, including in C.
> 
> The only difference is that in C all the responsibility to enforce them is
> usually on the driver -- e.g. by creating, destroying and calling things in the
> correct order in probe() and remove() -- and a lot of drivers have bugs in this
> regard as a consequence.
> 
> With Rust we can enforce those rules with the help of the type system at compile
> time; device context states are a part of that.

I don't really understand how that would work.  For example, suppose you 
have an object whose type represents an unbound USB interface (I forget 
what you are calling this).  Then a driver is probed and binds to the 
interface.  What happens to the object?  Is it somehow destroyed and 
replaced by a new object of a different type, representing a bound 
interface?  Or does the object remain unchanged but you create a new 
reference to it, of the new type?

Also, what happens while the binding or unbinding procedure is underway, 
so the interface is, so to speak, partially bound?  The USB stack does 
actually take notice of this; see the definition of enum 
usb_interface_condition in include/linux/usb.h.

> > Similarly, I don't see why Rust needs to distinguish between an 
> > interface that is bound and one that isn't.
> >
> > Even from the point of view of the device core, a device that is bound 
> > to a driver is the same kind of data structure as one that isn't bound; 
> > the only difference is whether the ->driver pointer is set.
> 
> This is a huge understatement.
> 
> The state of a device being bound to a driver defines which entity (i.e. which
> driver) is in charge of operating the underlying device, and thus defines who
> owns the device (associated) resources.

That's not how I would describe it.  When a device is bound to a driver, 
the driver is allowed to create and use associated resource; when the 
device is not bound, no such resources should exist.

> Many APIs rely on this, as in they only guarantee valid behavior when called
> from a scope where the device is guaranteed to be bound to a driver, or IOW
> where a driver can prove that it actually operates the device.

I can't think of many APIs like that in the USB stack.  One that springs 
to mind is encapsulated by checkintf() and check_ctrlrecip() in 
core/devio.c, but those are the exception rather than the rule.

> Drivers must only acquire device resources when they are actually bound to the
> corresponding device, and must hand them back before the device is unbound. The
> devres API, for instance, exists for this fundamental reason.

How would having separate types for bound and unbound interfaces enable 
Rust to recognize that a driver had not destroyed back a resource in its 
unbind callback?

> For instance, we can't have drivers manage IRQs, mess with I/O memory, program
> IOMMU page tables (e.g. through DMA APIs), etc. for devices they are not bound
> to and hence are not allowed to operate (anymore).
> 
> Those device resources all have a lifetime that is tied to the lifetime of the
> device being bound to a driver.
> 
> Consequently, any asynchronous scopes such as IOCTLs from class device
> registrations, IRQs, work queued on workqueues, etc. must all be synchronized in
> some way such that those asynchronous scopes do not access device resources that
> have already been destroyed on driver unbind.

That is certainly true.  But I don't see how it can be enforced at 
compile time.

> Or in other words, they must be synchronized against the "bound" scope, which is
> exactly what the Device<Bound> type state in Rust represents.
> 
> So, again, all those lifetime rules around the driver lifecycle exist
> universally, it's just that in Rust we enforce them through the type system.

How do you enforce through the type system that, for example, a 
workqueue item has completed?

> For instance, tying it back to USB, we don't want that a usb_driver still messes
> with a usb_interface, e.g. initiating transfers after it has been unbound from
> the interface and hence must not operate it anymore. This can easily happen if
> e.g. a class device registration is not properly synchronized and the driver
> still receives IOCTLs after driver unbind. In Rust we know through the "Bound"
> type state which scope provides the guarantee that the device is still bound,
> such that mistakes like this become impossible.

How can you pass types around to different control threads with somewhat 
arbitrary synchronization schemes managed at runtime, all while not 
allowing a typed reference to exist beyond its lifetime?  This seems 
very similar to the "pointer zap" problem in C/C++, which as far as I 
know, has no real solution.

Alan Stern
