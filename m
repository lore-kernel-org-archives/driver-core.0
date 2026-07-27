Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D22E3D1A8E;
	Mon, 27 Jul 2026 06:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133566; cv=none; b=bSf9Wxzvp5P+jv4MIMPVd/2Bx1Ikg3OrPa6mVNWRLzWTU9cIMpIcLG2r27IG0wfFqlbUyghecy8GYvt1oLEhIZk1X/yRBtYehyZhFsoKnF/6F2kpyNNZN++VsszWqwAygVzdWSANAbyDV4r6ThSu9huXx1fpvicxjGTG2lpVLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133566; c=relaxed/simple;
	bh=m4sePaZGksk3LqsfoJFCbY5XTzik+wdYAu8pzAuhhhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFdWK0Bngeanq+j697p9SfBTtKt3i8esccG+uio3gq7hMy7JUtPwE8HjjJ2rYcZA2k68723zuymtrCuG6B7nbiJUKxlRTHTIpfC671E64AjiQr6zK0BoOANo3Uz6iW+gqmem937FnLtFfNAiGLYeq+Hxht/7it1xd0uv+J4+U3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LIsZStyK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LIsZStyK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7701F000E9;
	Mon, 27 Jul 2026 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785133563;
	bh=aOIfK+1tyvoDX9Jq2BQN/ewxJfV3YRG7CYZHj+H6BLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LIsZStyKtFgpxRm8hLgB9IWm45V0wfKXywBaFBSrh737r/FujdsR+QuAIRYCr9G7H
	 P1d9gKaYx6fL9UZKP8VyvhnHy1zo4S30NVIser8pwJWKItDCHqWOonmf4xmDLGQaxc
	 Rcgu7JKlSnqNt3P6rvRVOAf+QD0t5oggqMKI6/oE=
Date: Mon, 27 Jul 2026 08:25:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <2026072717-amicably-tray-4a8b@gregkh>
References: <ambsuv_6mCK8U9IP@google.com>
 <2026072729-driller-leggings-e530@gregkh>
 <ambyXEGt8-f44dJD@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ambyXEGt8-f44dJD@google.com>

On Sun, Jul 26, 2026 at 10:54:54PM -0700, Dmitry Torokhov wrote:
> On Mon, Jul 27, 2026 at 07:40:57AM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Jul 26, 2026 at 10:31:41PM -0700, Dmitry Torokhov wrote:
> > > Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
> > > driver_allows_async_probing() to allow asynchronous probing for drivers
> > > marked with this type.
> > > 
> > > While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
> > > preference. Subsystems that require asynchronous probing (such as slow
> > > legacy buses) need a dedicated probe type to guarantee asynchronous
> > > execution.
> > > 
> > > Assisted-by: Antigravity:gemini-3.5-flash
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > 
> > > I am planning to rework serio and gameport subsystems to rely on
> > > asynchronous probing instead of rolling their own implementations.
> > 
> > What do you mean?  Why doesn't the PROBE_PREFER_ASYNCHRONOUS work for
> > you for those subsystems?
> 
> It shows the intent. It is not "preference" anymore, it is a "must". If
> we ever introduce switch to make probing synchronous for some reason it
> should not affect drivers that must be probed asynchronously.

I'm sorry, but I don't understand.  And as there's no users for this, we
really can't take it until we see those users at the same time :)

thanks,

greg k-h
