Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA6231F9B3;
	Thu, 19 Mar 2026 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901431; cv=none; b=JqDb5R8k/3JiU+ESv98v7YItyi/xzPvdZGutWLkq+A+8dczpvhUUqiW4VRaaw8ukggLX0EoQqrYXirJNkohP5C6FR2plr6dRXQg9YkRbyRRLz8iF+jpjItfK8jlKjeJ8XH1lca9pu3MF+u0pzvYSHiBmWUIYwHsrRC3wE+YDDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901431; c=relaxed/simple;
	bh=mGQBpFQYA0xX/Vuqn1n/TtoGmzHg5jeW7sLOGX8ZuKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRJdMcoFHHJjv7lvTy9a80XHPQIvCiZPf+QN9QmP+xXWLUBZ0HzhAdU88rskYWTeme5TU/l1w+uT1gKXk34bjJe4Rmw5KkibjFWQ5aU05zJVOxbecjvhFpRVSQXs1iuvjD4Zz9osX+bOtOYh2QDFPJNdWWGIUegNN1VUpYz1M9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=guPUEAOs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="guPUEAOs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF00EC19425;
	Thu, 19 Mar 2026 06:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773901430;
	bh=mGQBpFQYA0xX/Vuqn1n/TtoGmzHg5jeW7sLOGX8ZuKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guPUEAOsLBuCuCXBMQGxB4IWEyfySvruABSiSr5Nla7EqD3ZNKDoZ2SlNw6ZAandS
	 ZZ+k/IITvbs6tKLGa2DlnYeHghe2MAJdBHFSMgqQ7oudMImVCKscaIDjmB8wkWcIbI
	 Dd0/PT19XYxSoSuANLmMKvtWg7oVm+idZGDHxw64=
Date: Thu, 19 Mar 2026 07:23:45 +0100
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
Message-ID: <2026031940-baritone-handsaw-f1d3@gregkh>
References: <20260318-fw-path-v3-1-a701a08bc025@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-fw-path-v3-1-a701a08bc025@kernel.org>

On Wed, Mar 18, 2026 at 03:54:02PM -0400, Jeff Layton wrote:
> Refactor fw_get_filesystem_firmware() by extracting the per-path
> firmware loading logic into a new fw_try_firmware_path() helper.
> 
> Use this helper to parse fw_path_para for ':'-separated paths,
> trying each one before falling through to the default firmware
> search paths. This allows users to specify multiple custom firmware
> directories via firmware_class.path, e.g.:
> 
>   firmware_class.path=/custom/path1:/custom/path2
> 
> A backslash can be used as an escape character, allowing a literal
> ':' ("\:") or literal '\' ("\\") to be embedded in a pathname.

This is a mess, what could go wrong embedding another parser in the
kernel :)

Let's step back, why is this needed at all?  The kernel already supports
multiple standard locations for firmware paths, and one custom location.
Why do we now need more than that?  What changed to require this and who
is going to use it (and support it, and actually test it?)

We really want to make the number of firmware paths less, not more.  But
if we _really_ need multiple paths, isn't it simpler to just have an
array of paths here, not be forced to parse escape codes like you are
now doing?

thanks,

greg k-h
