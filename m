Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DB3391851;
	Thu, 19 Mar 2026 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921849; cv=none; b=kJtiipfQQgDQQcmM4RazS/668WaS+JeW7eiBXXrCGYp/pOyLb9Ap88oo6SD5RKcbyP0U0ocG9Q4dKgEWGu1LDK5/ft0f0tGoszwWePlBsATlXM/8Jub7Pxz8JQwywAbdMqq27qgzegyFoeAofLObMpaGGK3FbqLSxIh96cuNWhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921849; c=relaxed/simple;
	bh=QkRzJRcboO49bL+9i/hUBgCeFMIaoeTC+DS7SrZfBWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YmgxRd+h8OdtWMcIqFM7Zcewd6NDwuUSm5Ht5SYOS3jPFHPIPAs2kjNmERVIqokgkrBptV6ZDkSwwEuq6ibqCB12oPjDa4EosaE6b1UUUO8rR69fGVjtWQqVIdO8g4RkcLLpMj863uGnlOfXntxrLAlMy59Av+X+oTLCjbkl5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J2qfAY3L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J2qfAY3L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DDCC19424;
	Thu, 19 Mar 2026 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773921848;
	bh=QkRzJRcboO49bL+9i/hUBgCeFMIaoeTC+DS7SrZfBWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2qfAY3Lr2EdBw892uxMJV3Nv6510ecB65l/mRngqlJ0M0rFr+RprOCTSWaDG4Tru
	 CQqf3fyknkMNFvYDNThfuUr1bbajqyr2M7nTijpJ67qCbZiL2Vy1siwR/h0B1LgY6A
	 eJACuDtCQ56YnPpe56ywocA6xU9G6QPDkUw9OLFU=
Date: Thu, 19 Mar 2026 13:04:05 +0100
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
Message-ID: <2026031918-related-follicle-8ee1@gregkh>
References: <20260318-fw-path-v3-1-a701a08bc025@kernel.org>
 <2026031940-baritone-handsaw-f1d3@gregkh>
 <28b06032286beed696b0e95f9e96247cfd3ff667.camel@kernel.org>
 <2026031906-unspoiled-bunny-2279@gregkh>
 <efbcc06d09d6232b8dcd6793b5f12dcb85e9f1ee.camel@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efbcc06d09d6232b8dcd6793b5f12dcb85e9f1ee.camel@kernel.org>

On Thu, Mar 19, 2026 at 07:47:31AM -0400, Jeff Layton wrote:
> On Thu, 2026-03-19 at 12:39 +0100, Greg Kroah-Hartman wrote:
> > On Thu, Mar 19, 2026 at 07:34:46AM -0400, Jeff Layton wrote:
> > > On Thu, 2026-03-19 at 07:23 +0100, Greg Kroah-Hartman wrote:
> > > > On Wed, Mar 18, 2026 at 03:54:02PM -0400, Jeff Layton wrote:
> > > > > Refactor fw_get_filesystem_firmware() by extracting the per-path
> > > > > firmware loading logic into a new fw_try_firmware_path() helper.
> > > > > 
> > > > > Use this helper to parse fw_path_para for ':'-separated paths,
> > > > > trying each one before falling through to the default firmware
> > > > > search paths. This allows users to specify multiple custom firmware
> > > > > directories via firmware_class.path, e.g.:
> > > > > 
> > > > >   firmware_class.path=/custom/path1:/custom/path2
> > > > > 
> > > > > A backslash can be used as an escape character, allowing a literal
> > > > > ':' ("\:") or literal '\' ("\\") to be embedded in a pathname.
> > > > 
> > > > This is a mess, what could go wrong embedding another parser in the
> > > > kernel :)
> > > > 
> > > > Let's step back, why is this needed at all?  The kernel already supports
> > > > multiple standard locations for firmware paths, and one custom location.
> > > > Why do we now need more than that?  What changed to require this and who
> > > > is going to use it (and support it, and actually test it?)
> > > > 
> > > 
> > > We have at least one internal user that requested the ability to do
> > > this. I'll see if they can articulate their use-case better.
> > 
> > Please do.
> > 
> 
> Michal said he'll outline his use-case.
> 
> > > > We really want to make the number of firmware paths less, not more.  But
> > > > if we _really_ need multiple paths, isn't it simpler to just have an
> > > > array of paths here, not be forced to parse escape codes like you are
> > > > now doing?
> > > > 
> > > 
> > > How would one feed an array of paths to the module without delimiting
> > > them in some fashion?
> > 
> > I don't know, but once you start attempting to "escape" things, the
> > complexity goes up a lot and makes me think that this all isn't a good
> > idea :)
> > 
> 
> Fair point, but the escaping here is pretty tame -- It's only escaping
> ':' and '\'. For better or worse, UNIX has very few characters that are
> not allowed to be embedded in filenames, so our options for doing this
> are somewhat limited.
> 
> If we really don't want to deal with escaping, then another option
> might be to add a fixed number of path strings "slots" as parameters
> (i.e. path1=/foo,path2=/bar,path3=...).
> 
> That seems uglier and more limiting than dealing with escapes though.

For some reason, I thought we used to have more than one "path" that
userspace could pick for this, but we got rid of them all to just use
one.  So you might want to dig through the past history of this feature
to see why we did that?

thanks,

greg k-h
