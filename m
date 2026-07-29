Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3582BE7A7;
	Wed, 29 Jul 2026 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314971; cv=none; b=hlN55xQ1MplTY2soD17S7nWopfRDXiy190n136VW5KMyq4WLZlbAjMfa3e96jF2yQh60XtH3DEJP8NrPfgLypXTLo+apa6+O4m8cHcJd0MZ/5d4CQ/Cp1CdzyIuSQztokux4uIS0u6hdhqLx9wN29X2j8PtSuoOYAT9ZUmrV/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314971; c=relaxed/simple;
	bh=m8RvoBujqRu/KyiLTJGXbMy1/rpN+56dXB3wqwk2X2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzVMK1jzZJHpwZQEwFzzOMQVNnF5bPN5nwmuAOTVWxpf0rP4N8rrte6bw9fihTxbp1AuN8HCoTL3h7jfabBO5aRaqrWQvhib3kMxKjZ9juOWjsR8LWPQyUAfS1+fHiVYNoimJG8EXAoniyUIJ+T0Y2tLiz+6xrVhhR2mVDEL5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0z74R8GU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0z74R8GU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C22EA1F000E9;
	Wed, 29 Jul 2026 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785314970;
	bh=FJHe4GZpD0qAdBq+FxyxG4RB5833vZs5JoCgZJbGzow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0z74R8GU2WF3lgJiZDr9s3ZZag9bO8e46YJauuFM3vCjFLRaBVg2NMX2hHzcFOYEp
	 a3U2kicOURqBKbqp5qExc4EkapYB1QeYQ2i+g6ifbW90Z+9Vxrtu4ur/iRjOFWaG6C
	 7oaTGpj1oOCgKWbwcSev+jCzzfXGc3oujykwl79g=
Date: Wed, 29 Jul 2026 10:49:16 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <2026072921-approve-halves-6f4c@gregkh>
References: <ambsuv_6mCK8U9IP@google.com>
 <2026072729-driller-leggings-e530@gregkh>
 <ambyXEGt8-f44dJD@google.com>
 <2026072717-amicably-tray-4a8b@gregkh>
 <ammQvUcOF4S_VrgO@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ammQvUcOF4S_VrgO@google.com>

On Tue, Jul 28, 2026 at 10:40:29PM -0700, Dmitry Torokhov wrote:
> On Mon, Jul 27, 2026 at 08:25:51AM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Jul 26, 2026 at 10:54:54PM -0700, Dmitry Torokhov wrote:
> > > On Mon, Jul 27, 2026 at 07:40:57AM +0200, Greg Kroah-Hartman wrote:
> > > > On Sun, Jul 26, 2026 at 10:31:41PM -0700, Dmitry Torokhov wrote:
> > > > > Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
> > > > > driver_allows_async_probing() to allow asynchronous probing for drivers
> > > > > marked with this type.
> > > > > 
> > > > > While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
> > > > > preference. Subsystems that require asynchronous probing (such as slow
> > > > > legacy buses) need a dedicated probe type to guarantee asynchronous
> > > > > execution.
> > > > > 
> > > > > Assisted-by: Antigravity:gemini-3.5-flash
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > ---
> > > > > 
> > > > > I am planning to rework serio and gameport subsystems to rely on
> > > > > asynchronous probing instead of rolling their own implementations.
> > > > 
> > > > What do you mean?  Why doesn't the PROBE_PREFER_ASYNCHRONOUS work for
> > > > you for those subsystems?
> > > 
> > > It shows the intent. It is not "preference" anymore, it is a "must". If
> > > we ever introduce switch to make probing synchronous for some reason it
> > > should not affect drivers that must be probed asynchronously.
> > 
> > I'm sorry, but I don't understand.
> 
> PROBE_PREFER_ASYNCHRONOUS says that the driver prefers to be probe
> asynchronously but it can also be probed synchronously if needed.
> 
> PROBE_FORCE_ASYNCHRONOUS indicates that the driver *must* be probed
> asynchronously, or the kernel will break.
> 
> Currently there is no difference in behavior, but it documents the
> intent.
> 
> > And as there's no users for this, we
> > really can't take it until we see those users at the same time :)
> 
> I am planning to use it in serio and gameport bus implementations that
> currently roll their own asynchronous registration which is quite ugly.
> Because we have nested serio ports probing *must* be done asynchronously
> or it will deadlock.
> 
> I would like to merge the new constant early so that I do not have
> dependency when I am ready to merge input changes.
> 
> Below is how it will look like (just a small part of a WIP series).

Ok, this makes sense, but you need to also add documentation for this
new value to the comment block right above where you defined it :)


Wait, in looking at the tree, I don't see how this differs from
"prefer".  I don't see how "prefer" can be overloaded to NOT do async
probing.  Am I just missing the logic somewhere?

thanks,

greg k-h
