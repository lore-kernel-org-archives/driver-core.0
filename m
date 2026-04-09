Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2E28E0;
	Thu,  9 Apr 2026 05:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775712998; cv=none; b=AB256O/s7HJpehdPm1HGmEblKnP/0iyjEjOubI5sByFKwyN8B9ZrxhIMKmr4CCm4OMEmLQwqFThPhAumzVXIqzXiP5P9tst7hm40YKqwgJbOFr3qaILHALtylW+SVL+Ep3hNPoH34wR+FeLPdJEn+tsEUCmkK8HsrLu2uI3r69s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775712998; c=relaxed/simple;
	bh=+IX3AOfN1K+z/AKtmxmC0Qen1ORj6ACfpa+jwpB9mLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ic8I9ma5jfkCPjhWLkCwoUknpV0nJxSM/CZYNt9RnBRYXTyWzIFv2TK8vylda5N8g/z8IDvjspl9wG1/3S2LyhhXf/xGiCcaCot018FWyHmI+8U6yPj9s0eUeBMEDi4Mnreyq8pY1GT7nMpjqieUgCxSdoS5Gsleja6w5+2hwOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KeWujmGn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KeWujmGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA71AC4CEF7;
	Thu,  9 Apr 2026 05:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775712998;
	bh=+IX3AOfN1K+z/AKtmxmC0Qen1ORj6ACfpa+jwpB9mLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KeWujmGnl70XZKRJ9qXQZUOZ5nMeElXYeYMYhlV3jMd9jF6BXyRbVqZI+h9t1ZncF
	 fERYvhxhVbfkKVUSQTCSGGW9wQ3xLp474hnveUhYuijRJXaJ1QUiqGH/ybtd8cemID
	 gG+ZwZVDji6pR8kzavYxN3DyHNN3K5Yrpg/DCsh8=
Date: Thu, 9 Apr 2026 07:36:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] driver core: Allow the constification of device
 attributes
Message-ID: <2026040916-rascal-oink-8875@gregkh>
References: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>

On Wed, Apr 08, 2026 at 09:30:46PM +0200, Thomas Weiﬂschuh wrote:
> Allow device attribute to reside in read-only memory.
> Both const and non-const attributes are handled by the utility macros
> and attributes can be migrated one-by-one.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Thomas Weiﬂschuh (5):
>       driver core: Delete DEVICE_ATTR_PREALLOC()
>       driver core: Add low-level macros for device attributes
>       driver core: stop using generic sysfs macros for device attributes
>       driver core: Allow the constification of device attributes
>       driver core: Constify core device attributes
> 
>  drivers/base/core.c    |  50 ++++++++++----------
>  include/linux/device.h | 122 +++++++++++++++++++++++++++++++++++++------------
>  2 files changed, 121 insertions(+), 51 deletions(-)
> ---
> base-commit: 6c8dfb0362732bf1e4829867a2a5239fedc592d0
> change-id: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da
> 
> Best regards,
> --  
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> 

We still have the is_visible_const() stuff not finished yet, why not fix
that up first?

And this makes me worry, how many changes are going to be needed to move
everything over?  thousands?

thanks,

greg k-h
