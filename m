Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3031A9F8D;
	Thu, 21 May 2026 06:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779344362; cv=none; b=OQnhLCmtwKzNfMxBA0YkJQlVDu+4Mn6aa4epXyMHyHoP9SiV6VzVRAbSL5q6Z9r5SCKON832ObON9d0cc7K1qFeaMXDDEkw52bM/hTTwyFrHqCBio1ldMEzNdJeMG99W4rDn6jTv+e8jiaLTglaLEVC4rpcyrgHqRdMHaQmUsRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779344362; c=relaxed/simple;
	bh=SoIgHpZPefarzIVRS47BqqjWo7K0er2JzlZudT6xjy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvVDJw7oLxp2CGQP05c7aI2tb/90mmMWB1reLIrGiLUyQW0U29cVcqzLNDPKbdM9QCf8r1Mqw5Lf4oIa3uBiTVfEkTJzE/Ygg5BQiqWnYvuikIJNvTZixrauSw3324C48E4kc8aNf7VUUmMOTCYNDpzAbnj11QPLUHynLWzmuKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=uqGazO+D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uqGazO+D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762A61F000E9;
	Thu, 21 May 2026 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779344361;
	bh=e36InEZAwr4nqecUypb9iIsMM0RKrVGJHRUfbKdgR8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=uqGazO+DC5DN7YJUj93b/ArZf2I5yC+hYozvrnj7gQt5Vw/be8nm4myOAPp5nENjE
	 DvUfRwPMO1Imtm1xytvoeT4EsrY2V60ZeGu87WYJ4eEsXieFT4bfw380L0xHjbZqEZ
	 lUefaCr/avHNkI77b8Rnng5+JzGKixQp3zQXmSq4=
Date: Thu, 21 May 2026 08:18:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tejun Heo <tj@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, NeilBrown <neil@brown.name>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Message-ID: <2026052129-mustard-sepia-5cd6@gregkh>
References: <2026052000-drove-unicycle-d61b@gregkh>
 <3fb84b4c71fce994cfe1e06a5fe3970f@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fb84b4c71fce994cfe1e06a5fe3970f@kernel.org>

On Wed, May 20, 2026 at 08:19:34AM -1000, Tejun Heo wrote:
> Hello,
> 
> Two nits:
> 
> - Buffer is atomic_write_len ?: PAGE_SIZE, so probably better to clamp
>   to that than hardcode PAGE_SIZE.

Where is that check at?  And sysfs_kf_seq_show() doesn't check it this
way, should that change?

> - pr_warn() instead of bare printk()?

This is copying the message in sysfs_kf_seq_show() that has the same
exact format.  I will send a follow-on patch to make both the same.

thanks,

greg k-h
