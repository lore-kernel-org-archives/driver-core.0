Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93FD344044;
	Thu, 21 May 2026 16:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380291; cv=none; b=rwG0KE+I8aAajSQqSjauCi4hvdt2YUyiUZgnySRI0sxlWv0QIDFiKYVPt9e3tiAv+LTZIc6Vk9wPyGjvLPRAb0fa3Su2PRlyQAPtu9Wb+lXNfNYTnFYadcqiDaZCw91Cl4V1IgaIUg1292I4lumtG6K8l+zbxgIyVpsZWZs4NdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380291; c=relaxed/simple;
	bh=qcQaV328vwYVSBla6I4ej5FCn8lysbi5QoZJbgg66to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oaMHlZElhacEicjfuBC086oSW98hgr3tNzAK69fernnqMGL7TaRlYm7gNznpMFUUDeWMXmrXTsCJEepJqRi6HWP/1HpmllyM/CAdu3MH3192u8s0Eca2RNfou9/jiSRiyp3dQnKfRGZd/8EWdA6lfj4VLtU2qMQXoI7OLT+dB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nD+reKky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nD+reKky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487B41F000E9;
	Thu, 21 May 2026 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380290;
	bh=sb3U+N/NdJ8SaVd8xNTyT3MROQLMSWSTeUbseoBFNv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nD+reKky09eYbqXJmPwikD24McavMUMLzzjENIZCK/sFOc7iOHPLAHv5xGTF0pVRv
	 oP6JhPk14TLx9G7qiuffAcB2e0e0qJqq182rez2+l82POEz6M93wPc4TENKrs3barX
	 eNl1AZHuKJS9LFp3l8guVSJwXgQ8PP8oubtan0Kk1zPtLcMMlBOZaCBhNdbw45JIeP
	 nc/+Nz6LvBIbdSb1Uj/3k457Yzr/+mqP/MuLNgDEVhZn9w5I8nCIUGvkRo0/V91EGn
	 ZSKjhQkdtPI2WGzT87iiOXuIvm4jT3JFp/jnGfVB/psKBGq5IVqzPt2qeyY+71tZik
	 RpyaunwTT7RJw==
Date: Thu, 21 May 2026 06:18:09 -1000
From: Tejun Heo <tj@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, NeilBrown <neil@brown.name>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Message-ID: <ag8wQfilndx2CtX-@slm.duckdns.org>
References: <2026052000-drove-unicycle-d61b@gregkh>
 <3fb84b4c71fce994cfe1e06a5fe3970f@kernel.org>
 <2026052129-mustard-sepia-5cd6@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026052129-mustard-sepia-5cd6@gregkh>

Hello,

On Thu, May 21, 2026 at 08:18:32AM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 20, 2026 at 08:19:34AM -1000, Tejun Heo wrote:
> > Hello,
> > 
> > Two nits:
> > 
> > - Buffer is atomic_write_len ?: PAGE_SIZE, so probably better to clamp
> >   to that than hardcode PAGE_SIZE.
> 
> Where is that check at?  And sysfs_kf_seq_show() doesn't check it this
> way, should that change?

In kernfs_fop_open(), if ops->prealloc, we allocate of->prealloc_buf to the
size of of->atomic_write_len ?: PAGE_SIZE. Maybe we should just update
of->atomic_write_len. I think the intention was to allow >PAGE_SIZE atomic
content. seq_file now does dynamic buffer resizing, so this may not be
necessary. There's no clean interface to preemptly set the minimum buffer
size right now but that probably is the better direction. Then, we can just
always go through seq_file.

Thanks.

-- 
tejun
