Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7949A3C4;
	Mon, 12 Oct 2026 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817964; cv=none; b=ILI8FcjEzHxaH2fKVQCEfdKNhQ4KnGNtnhXcfLg1DezrapXvUv5iPJ9DOJ3Hmr6tb5b75yiCaBf7MUYyJi40NnKzSyp5Vy2apGf4vCRBOepupnCXqYik0LX8aSzcOW9A8p0bRHx/VSs8n18nF7W5vofjnA4P9joK/KSuK+rai+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817964; c=relaxed/simple;
	bh=cjVlDLyHzexyQk/miwCJw7lJrZowojOOPXVKdDgLiS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyBIGXwze2fhCY5tdGRBEvGkKEWjxwgtNcPbzLY5S7FB/pz6ZV6NUQjDLTYtjGvjF386dygTs03NUnqEJ+mjVzl8iaB6R//bzgJrCad+RkjS2g6WspLlG8RyWwQnP+cl1xh+fhUjW2CktCuROKxMvgPjtfSNM/1Q/pGjwc749Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V057OI9v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V057OI9v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1491F0089B;
	Mon, 12 Oct 2026 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791817963;
	bh=IVKdfv8RaJNMf+wu0gaswVHLPxUE0jDoiF7G/m0mbjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V057OI9vghfYBQeX0xFGDyLE2Bhf1G/ILBnsIeMgtATwwYEYqwO6RrCUyCVlfsBh2
	 CoBc5yYnHFaK++vahgn2pzJDU3kzLOjEHjBxOJTQHdmC8m9wuznbepbFk+E72m8TI8
	 rvebcT6RV7DD427qje4SVN5vLpr+lHT2XOq/wguoNW43bFS5S+rIKwXyqgGA9l6MJi
	 zukWmxEZiwpJVE6MBk6gVcEFoRl55Atf6Xzwc6vVNQPZ1054vFW1N114cE/7vLHAza
	 KK5RDCNh/TdGiazWqPg1U25ja+Xb/lIWPoxd13wdxUXjzEFZLdI3xVU8SHvoCOwAXM
	 Dg7bbh24/qg4g==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xGHhh-00000004PAR-1n2e;
	Mon, 12 Oct 2026 17:12:41 +0200
Date: Mon, 12 Oct 2026 17:12:41 +0200
From: Johan Hovold <johan@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Mario Peter <mario.peter@leica-geosystems.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>, driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] driver core: Take parent lock in async device attach
Message-ID: <asz46b5IgxH8vfBY@hovoldconsulting.com>
References: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>
 <aszXeki0LK1LYL6P@hovoldconsulting.com>
 <DM2X6XX7EGLN.38C96USJFEV4Y@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM2X6XX7EGLN.38C96USJFEV4Y@kernel.org>

On Mon, Oct 12, 2026 at 04:13:16PM +0200, Danilo Krummrich wrote:
> On Mon Oct 12, 2026 at 2:50 PM CEST, Johan Hovold wrote:
> > On Wed, Oct 07, 2026 at 01:15:14PM +0000, Mario Peter wrote:

> >> Take the parent lock in __device_attach_async_helper() as well, like
> >> __driver_attach_async_helper() does, and move
> >> __device_driver_lock/unlock() up for that. With this the warning was
> >> gone in 300 boots on the board and in 6000 iterations in QEMU.

> > Thanks for fixing this, USB interfaces should indeed always be probed
> > with the parent lock held:
> 
> I was about to pick this up, but can't this cause a subtle deadlock? What if
> async_schedule_dev() runs synchronously? Wouldn't we then attempt to take the
> parent lock again while e.g. bConfigurationValue_store() already holds it?

Hmm. Good catch. I guess we need to switch to
async_schedule_dev_nocall() and retry with explicit synchronous probe on
errors.

Johan
