Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F8D4CF460;
	Sat, 17 Oct 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792242703; cv=none; b=jJfSuCHin1LQxkCSFx2TLWl/+Ju3qDXgF9nwhlf52aCwOu01fiSxZRncOTZReiqGsfy1BA643NLVtQ0n3URrh04ZHZI8VCT1Us/mWQoQw0r3HrqNFX6cBDU8w4E/px1rpFJc/2ap6OelGVkpL/PfxHf+KZ6fcVaH2GxaUo1PVS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792242703; c=relaxed/simple;
	bh=7bBcTK63AgltO7nov8PBLYUxhNKVejBRL0mAdveV/Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsxUlZ8QlLFPfwR7TXRNlZ9+aVQynNbts8budf6vzO5GR8GsqUgl3wiT+300NVQ/i71wWWyikjK7+fg07zdGgHQDcTCLZmmdkeGU1Gd8NsAylQGGNCFtpHncrkB5Zglw1DRXInIV0k71/Eqf8HN7NJCwycvKi/DSPXLkdJRYiDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MKbngAZW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MKbngAZW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCEC1F000C4;
	Sat, 17 Oct 2026 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792242702;
	bh=YyquvFHVoQO974H5DnDO43E9kmsniiuIaoJndyHm9kg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MKbngAZWWbo1I6PxgZusUGHHiwvkUQMLTFXIgKb6BPXCRIjVKNRHEj91/aWIoyex4
	 UivjBnNPhs087bTy2rFJlc5oTzsAU5oAdCeng4WSfN7H5g+BBww+iEAh2sNhH/+gAP
	 jAILIs+7hwFMhave9YW65FsDpFrq6bbYUJmVHlDI=
Date: Sat, 17 Oct 2026 15:11:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver core: unbind only the driver whose unbind file
 was written
Message-ID: <2026101740-version-overreact-7ea5@gregkh>
References: <20261017020935.792500-1-nickolai@csail.mit.edu>
 <2026101755-mangy-flatterer-3d87@gregkh>
 <CADGQE7EpdbtkzzH53Jh1yZ+nv6oCQsLiH6FDN=DxyFCwTjFE=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADGQE7EpdbtkzzH53Jh1yZ+nv6oCQsLiH6FDN=DxyFCwTjFE=Q@mail.gmail.com>

On Sat, Oct 17, 2026 at 08:24:03AM -0400, Nickolai Zeldovich wrote:
> On Sat, Oct 17, 2026 at 5:49 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > > The pattern is as old as the unbind file: the check was never under the
> > > lock and the release never named the driver.  The locked variant has
> > > existed since commit 4bdb35506b89 ("driver core: Add a wrapper around
> > > __device_release_driver()") added the drv argument to
> > > device_release_driver_internal() for driver_detach(), which has the
> > > same requirement.
> >
> > Because this has always been present, and no one has actually reported
> > this, perhaps it is not really a problem at all?  In other words, what
> > real-life-use requires this?  Again, bind/unbind is for developers only.
> 
> The goal was to pin down a precise spec of what should happen when
> writing a device name A to /sys/bus/B/drivers/D/unbind.  I think the
> intended effect is that it should unbind driver D from device A.  The
> code already has a check that tries to ensure this.  However, the
> check isn't technically enough to achieve this precise effect, in the
> presence of concurrent operations on other cores (like
> binding/unbinding other drivers to the same device).

You can not bind/unbind drivers to the same device at the same time, the
driver core should protect yourself from this, BUT most importantly,
bind/unbind is a "best effort, you keep the pieces of the broken kernel
when something goes wrong".

> It sounds like this level of precise specification under weird
> concurrent operations isn't useful for developer-facing interfaces.

Again no one should be doing this, and if they are, they are root and
can do much worse things :)

> I'll stick to more clear-cut bugs.

Or just prove that this is a real bug please.

> > ...
> > > Found by formal verification of drivers/base/bus.c.
> >
> > Where is the formal verification proof?  Please don't have your LLM
> > claim this without that as it's pointless.
> 
> The intended point was to give some indication of where this patch is
> coming from: it aims to formally prove something about the behavior of
> the kernel, rather than fix any specific issue encountered by a Linux
> user.  There isn't a formal spec for the Linux user-kernel boundary,
> though (as in the above example: what exactly should happen in this
> weird concurrent scenario?), so for many cases I'm trying to infer
> what the expected spec is.

Then why did your LLM say that this was found in this way if that's not
what you really did?

People read what you wrote, you should also do so :)

thanks,

greg k-h
