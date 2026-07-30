Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DAB3921E0;
	Thu, 30 Jul 2026 07:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785396420; cv=none; b=eeEz7iSutKWgl0OZBjzyq6GFZeFg8Y1PH+PGgjU+4LH5wskzYWnBWW4eb9qe+mEkSyBR14z6Q9C3ZTpsX98C17nAU40KJVrLKAwPGrRuvlAWdlA9VCyNkHsL/Is1cK1jdXEblUEnLxmyCgfOgWYSK4d7Gm2IXBAAh4BhBbxL70s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785396420; c=relaxed/simple;
	bh=2aJxRpmT6kVoGBlClB9qW1QuGmWsuwmWtQY/9KvzqYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea+VAAbCpl8VeA4vepSEOfeKNlJkJGuuJcTdk1TedcnC6Cs+552zyFgU5CxxI+URptsLgDEYIa1yjSmA6d/+MK+1/CPenNC6MoNy+wwA3EzTclqMPYJjNctQfpW4YUuO/ly1TomQYZRJXVWXXDCasy5mt8H0YxB1hrtRFiisZtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e2XjjHWE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e2XjjHWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2B6A1F000E9;
	Thu, 30 Jul 2026 07:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785396418;
	bh=Dwu/vVUPF7mCTIoYUGGpqvpJUp9q6AeuslBpL5E67k4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e2XjjHWEd3pQqw4g/x8ryg7aDxPoA8HsFVay+tluHeiIf785o7J665uCTOHDnfpvB
	 Cyd1GIVf0m57y5f1OX1yQsS7uM5NOY5DNFA37U+51A89wiu4DYLqaGiwYCEmyxCEnJ
	 tA1cfAow5VynqLwd2UxJWCFvl4DkIrc9ic9/SLLI=
Date: Thu, 30 Jul 2026 09:25:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <2026073057-unissued-starving-c663@gregkh>
References: <ambsuv_6mCK8U9IP@google.com>
 <2026072729-driller-leggings-e530@gregkh>
 <ambyXEGt8-f44dJD@google.com>
 <2026072717-amicably-tray-4a8b@gregkh>
 <ammQvUcOF4S_VrgO@google.com>
 <2026072921-approve-halves-6f4c@gregkh>
 <ampBe9RgNYpvTENJ@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ampBe9RgNYpvTENJ@google.com>

On Wed, Jul 29, 2026 at 11:24:48AM -0700, Dmitry Torokhov wrote:
> On Wed, Jul 29, 2026 at 10:49:16AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 28, 2026 at 10:40:29PM -0700, Dmitry Torokhov wrote:
> > > On Mon, Jul 27, 2026 at 08:25:51AM +0200, Greg Kroah-Hartman wrote:
> > > > On Sun, Jul 26, 2026 at 10:54:54PM -0700, Dmitry Torokhov wrote:
> > > > > On Mon, Jul 27, 2026 at 07:40:57AM +0200, Greg Kroah-Hartman wrote:
> > > > > > On Sun, Jul 26, 2026 at 10:31:41PM -0700, Dmitry Torokhov wrote:
> > > > > > > Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
> > > > > > > driver_allows_async_probing() to allow asynchronous probing for drivers
> > > > > > > marked with this type.
> > > > > > > 
> > > > > > > While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
> > > > > > > preference. Subsystems that require asynchronous probing (such as slow
> > > > > > > legacy buses) need a dedicated probe type to guarantee asynchronous
> > > > > > > execution.
> > > > > > > 
> > > > > > > Assisted-by: Antigravity:gemini-3.5-flash
> > > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > > ---
> > > > > > > 
> > > > > > > I am planning to rework serio and gameport subsystems to rely on
> > > > > > > asynchronous probing instead of rolling their own implementations.
> > > > > > 
> > > > > > What do you mean?  Why doesn't the PROBE_PREFER_ASYNCHRONOUS work for
> > > > > > you for those subsystems?
> > > > > 
> > > > > It shows the intent. It is not "preference" anymore, it is a "must". If
> > > > > we ever introduce switch to make probing synchronous for some reason it
> > > > > should not affect drivers that must be probed asynchronously.
> > > > 
> > > > I'm sorry, but I don't understand.
> > > 
> > > PROBE_PREFER_ASYNCHRONOUS says that the driver prefers to be probe
> > > asynchronously but it can also be probed synchronously if needed.
> > > 
> > > PROBE_FORCE_ASYNCHRONOUS indicates that the driver *must* be probed
> > > asynchronously, or the kernel will break.
> > > 
> > > Currently there is no difference in behavior, but it documents the
> > > intent.
> > > 
> > > > And as there's no users for this, we
> > > > really can't take it until we see those users at the same time :)
> > > 
> > > I am planning to use it in serio and gameport bus implementations that
> > > currently roll their own asynchronous registration which is quite ugly.
> > > Because we have nested serio ports probing *must* be done asynchronously
> > > or it will deadlock.
> > > 
> > > I would like to merge the new constant early so that I do not have
> > > dependency when I am ready to merge input changes.
> > > 
> > > Below is how it will look like (just a small part of a WIP series).
> > 
> > Ok, this makes sense, but you need to also add documentation for this
> > new value to the comment block right above where you defined it :)
> > 
> > 
> > Wait, in looking at the tree, I don't see how this differs from
> > "prefer".  I don't see how "prefer" can be overloaded to NOT do async
> > probing.  Am I just missing the logic somewhere?
> 
> As I mentioned, the current behavior for "prefer" and "force" is the
> same. It is more about documenting expectations/requirements than
> behavior of the current implementation.

But you aren't changing anything here at all, just adding a new enum
that does the same thing as the existing one.  So I'm really confused...
