Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4923B6BF4;
	Thu, 20 Aug 2026 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209623; cv=none; b=h7+Aa32Fgel2xzJ18fTgQ1v4cfO3QNeDGnh4TBr6kn5WNdl15kkxbcsu5a5i5JcbO2MSSIeol0Ht7Phggd/aXj5Mebfw7XzgVLCsy5sBYdD0BpvPaM3Z6UlXfUB/cGL/j/CxaDYecaaEC1FCdTiTazBGRupbVwh+8D+IHrq2PPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209623; c=relaxed/simple;
	bh=XHs6rMuniw0lgJKGbj6YasVJ3k8k360dY8AELG4r/ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcmT5VK0haaoj31oB+gMyPIVWDTAqfdiyzCHko2FhA/nvHWEp1TMwumXXKJnvu/EZuRJb43mGN9szLEzpCE9IzPMafHYURHvT6511ewWWU6QIJj88QRRdODJ9Uyo0OTHgmR/ZPJAuB9rTlmr+P2+xyj7lJizYf4VQDI3cVlA0A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ETsgZavV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ETsgZavV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA7E1F000E9;
	Thu, 20 Aug 2026 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787209622;
	bh=XHs6rMuniw0lgJKGbj6YasVJ3k8k360dY8AELG4r/ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ETsgZavVVLtwM7EdleCQAWDTYnKyn7vbJySKpaeS6LFn4kS1qPtDSGmLD67MORPdh
	 670T1GFbT1aJ/NmbO/hkjzJlSeoc6BXA/BfsOeKOCUB5jASLEt4kTovurBH6dQq2qA
	 uktGB5OgF0noyHhMjSjQubYfKk3Kv2p7QOS8l0T0=
Date: Thu, 20 Aug 2026 09:05:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2] driver core: avoid klist_remove() on unattached
 knode_driver
Message-ID: <2026082028-celibacy-unclothed-42da@gregkh>
References: <2026082048-malformed-finite-4e61@gregkh>
 <20260820065606.78768-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820065606.78768-1-khiemtranzo532001@gmail.com>

On Thu, Aug 20, 2026 at 02:56:06PM +0800, Nguyen Quang Le Kien wrote:
> Hi Greg,

Please provide email context when responding, some of us get 1000+
emails a day.

> v1 used klist_node_attached(&dev->p->knode_driver). v1 passed the syzbot
> test, but after reviewing the code again I realized klist_node_attached()
> isn't really the right check at that level -- it's a raw klist API.

Then please document this in the proper place, for v2, as required.

thanks,

greg k-h
