Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364BD3ACA62;
	Thu, 19 Mar 2026 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920403; cv=none; b=k+PMCMIwno5EcuK2sVPuAxGSre5Bz3EHoGpGoNPKVmy9PiOR9a0jpw1qqyO1PQJCobsfJJwl4411u1BwyE3zuQUiB472/90OohKH4AxVEqsMEJ2eW95pHwNsMuzHLrMQ2d9qCHO4udSJkLYvjH06VSrzLETz5s2PNrwmLsiFsew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920403; c=relaxed/simple;
	bh=LbNonImDdwy2Ow+VMq5RPUOMMA0MhjviMKyV08Iy6sk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2TDjIPdyZbPTwUEbUa1FhqUZc1Vb8w6quQpGNk/MUubG3mRk2XKi9DC5WC6oop4dpgLMEQFBIyKQ+LwQD47uYXd634i90PoRWwz33YHlQTponyZ4vPvc/mbj0Jb/3eO3HcfO9ZM7mOymQyDJFJuyPjvaKh4aaooBC7YPIKd+dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FGf0SOZ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FGf0SOZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF4CC2BCB3;
	Thu, 19 Mar 2026 11:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773920402;
	bh=LbNonImDdwy2Ow+VMq5RPUOMMA0MhjviMKyV08Iy6sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGf0SOZ9WitZJOfnz/fcmIS682Kj+vuYk9yqE6YgpgoaEFuFLMtW2NAS+wl+OEvc/
	 /xTQMX/uCKew4nkxwo44vLVemsecvlZz+Wp/tFIg3FSunZ366TMYQHZbTdyg2fzL0D
	 rQYWN+2+cNcURGkWnh4IeCExcc4igaWyhtKqr3dU=
Date: Thu, 19 Mar 2026 12:39:58 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] firmware_loader: allow firmware_class.path to take
 multiple paths
Message-ID: <2026031906-unspoiled-bunny-2279@gregkh>
References: <20260318-fw-path-v3-1-a701a08bc025@kernel.org>
 <2026031940-baritone-handsaw-f1d3@gregkh>
 <28b06032286beed696b0e95f9e96247cfd3ff667.camel@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28b06032286beed696b0e95f9e96247cfd3ff667.camel@kernel.org>

On Thu, Mar 19, 2026 at 07:34:46AM -0400, Jeff Layton wrote:
> On Thu, 2026-03-19 at 07:23 +0100, Greg Kroah-Hartman wrote:
> > On Wed, Mar 18, 2026 at 03:54:02PM -0400, Jeff Layton wrote:
> > > Refactor fw_get_filesystem_firmware() by extracting the per-path
> > > firmware loading logic into a new fw_try_firmware_path() helper.
> > > 
> > > Use this helper to parse fw_path_para for ':'-separated paths,
> > > trying each one before falling through to the default firmware
> > > search paths. This allows users to specify multiple custom firmware
> > > directories via firmware_class.path, e.g.:
> > > 
> > >   firmware_class.path=/custom/path1:/custom/path2
> > > 
> > > A backslash can be used as an escape character, allowing a literal
> > > ':' ("\:") or literal '\' ("\\") to be embedded in a pathname.
> > 
> > This is a mess, what could go wrong embedding another parser in the
> > kernel :)
> > 
> > Let's step back, why is this needed at all?  The kernel already supports
> > multiple standard locations for firmware paths, and one custom location.
> > Why do we now need more than that?  What changed to require this and who
> > is going to use it (and support it, and actually test it?)
> > 
> 
> We have at least one internal user that requested the ability to do
> this. I'll see if they can articulate their use-case better.

Please do.

> > We really want to make the number of firmware paths less, not more.  But
> > if we _really_ need multiple paths, isn't it simpler to just have an
> > array of paths here, not be forced to parse escape codes like you are
> > now doing?
> > 
> 
> How would one feed an array of paths to the module without delimiting
> them in some fashion?

I don't know, but once you start attempting to "escape" things, the
complexity goes up a lot and makes me think that this all isn't a good
idea :)

thanks,

greg k-h
