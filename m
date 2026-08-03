Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F081231827;
	Mon,  3 Aug 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785746632; cv=none; b=aBiRzDs3UDDFUHEoFZ+0CGptVzjMNiDRXc53WPW+CbQ6PCcboJgjp1tK9237yWi22Uv6idc4yjbZ0DjBWJTQ+Sl/aoRRRAWTLuwp4eVBDMjfY3Er89cXzCf1SifSfFNLamryAGfVIENRDbB2r+c/nBzq4vSUgI3/e5aWYB0HygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785746632; c=relaxed/simple;
	bh=JeTdojB3gj0aL3Wx9BTKXYzAbMnOydyjkSOZZQBFVrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjl8e/AoFXuMOMs9Yqqgk6dIVJXINRst5jb5N94Pk33jw2LVSbweY25OaHhkscrgkVF3/abuovLaCZyMAHbHA/P0c9ubhnuhmMKiTlf7rBmEC7xzcqnroLbaxy72+z55X+QH/F4DGGH8E8mYpjnN3LS3KMbncE8y5JXtkjS2UQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gqXpqmt5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gqXpqmt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664F21F000E9;
	Mon,  3 Aug 2026 08:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785746630;
	bh=N2Kuhj3hbpCVuxFOsw702cuNgYY2L0dqf3RNEjGN8bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gqXpqmt5fKV3GNDTLhy4z1go9xJwghX5nKD68uZsdidikvYZ2+63U8SO4cSH6gMNk
	 sVcY6WcNJADbXosYZR3CWm6gFZXgu2n5uPhpmmBzdNvzhkELmidEQoemyRC9Kz52Bp
	 XqZzXFOwIzVM7uWCNZQsuPRGSr1uOMAQxreqYfcw=
Date: Mon, 3 Aug 2026 10:43:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yichong Chen <chenyichong@uniontech.com>
Cc: dakr@kernel.org, djakov@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, quic_mdtipton@quicinc.com,
	rafael@kernel.org
Subject: Re: [PATCH] debugfs: serialize debugfs_create_str() writers
Message-ID: <2026080349-gristle-underdone-415d@gregkh>
References: <2026080345-bucked-debunk-5b57@gregkh>
 <20260803083401.819079-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803083401.819079-1-chenyichong@uniontech.com>

On Mon, Aug 03, 2026 at 04:34:01PM +0800, Yichong Chen wrote:
> On Mon, Aug 03, 2026 at 08:19:05AM +0200, Greg KH wrote:
> > Ouch, you are doing to serialize _all_ debugfs strings on one lock?
> >
> > This feels wrong :(
> >
> > Wait, why rcu if you have a lock?
> >
> > guard() is nicer.
> >
> > My larger question is, what code is broken because of this?  What
> > debugfs string replacements are happening?  I hate the string debugfs
> > code as it has had lots of issues like this over the years so maybe we
> > should just drop it and force users to "roll their own" implementation
> > that would be much simpler without the rcu/locking mess at all?
> 
> Thanks for the review.
> 
> The patch was trying to fix a double-free.  Two concurrent writes to the same
> debugfs_create_str() file can both observe the same old pointer before
> either replacement is published, and then both free that old string.  I
> reproduced this with KASAN and got:
> 
>   BUG: KASAN: double-free in debugfs_write_file_str()
> 
> I agree with your comments that the current fix is not a good direction.  A
> global mutex serializes unrelated debugfs string files, and mixing that with
> the RCU read side makes the helper more complicated.
> 
> The directly writable in-tree users I found are:
> 
>   drivers/interconnect/debugfs-client.c:
>     /sys/kernel/debug/interconnect/test_client/src_node, mode 0600
>     /sys/kernel/debug/interconnect/test_client/dst_node, mode 0600
> 
>   drivers/soundwire/debugfs.c:
>     firmware_file, mode 0200
> 
> So the write path is reachable through in-tree debugfs users, although I
> do not know whether anyone relies on concurrent writes to these files in
> practice.
> 
> I can rework this in a few ways:
> 
>   1. make the locking per-file instead of global, if we want to keep the
>      generic writable string helper;
> 
>   2. drop the write support from debugfs_create_str() and convert the
>      writable users to their own small file operations;

If we only have 3 writable string users, I would suggest we do this, and
just leave the debugfs string functionality for read-only files as that
is the MUCH simpler case.

If we have more, well, let's see how many more, and just what exactly a
conversion to "small file operation" would entail.  Try it for the
soundwire file above and let's see what the diff looks like.

>   3. take another direction if you have a preferred approach.
> 
> Dropping write support would avoid keeping this locking in the generic
> helper, but debugfs_create_str() is exported, so that would also change
> behavior for any out-of-tree users relying on writable strings.

For obvious reasons, we do not care about out-of-tree users for any
in-kernel api, as that way would be insanity. :)

thanks,

greg k-h
