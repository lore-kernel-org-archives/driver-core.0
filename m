Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB74838228B;
	Thu, 30 Apr 2026 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777532447; cv=none; b=BIEwjsMlhZVf8vtaCErxvA6sbIXe+E0yapiZrRxboKqMdIM3CqKxc/CxZtd0PdhVdl0zot57CeFXTOupyp6r4W6keF0hKRYqJKoTRHCzOHf4SIYOeWEXdDK4f6i+JKimLXVGap8DiF/TZGFOECLhaZm+LztIbtxdCFnudI2TN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777532447; c=relaxed/simple;
	bh=vm4DnZEcnJZov8kEum6ZEQm9FFa1s/wzkKI1zE9zvVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=igPgfr50jWORvrDI1lKD3pxWhZTu6sKjDw2PXzT36GPyn73IznH21xKWuOzBqzDVAJ/ITv9TxIbQu97R2WmtehCmAV+OIhFGz/4nohl7/mqGPuvPp1fomp6AqNajqkxDk5znSPVq8qGsOWblLp+mxsmT0/lNzgINz18SWOE98s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QOeRkHuG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QOeRkHuG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B39C2BCC4;
	Thu, 30 Apr 2026 07:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777532446;
	bh=vm4DnZEcnJZov8kEum6ZEQm9FFa1s/wzkKI1zE9zvVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOeRkHuGa9UdSBMBMJA0jEs1Tz6YWkscd1/CkCPHjledr/hKyADvk3b2UNHBk0Z56
	 m0dgMwLw/bmKeoNCK5dtTMNLzUl+scEWJ7dg7bVW18RfPWk/DKAF7KbOKsKTmoCn2O
	 B/pcGfm1VG7NuPQyNIGyEIXcnHEDLhrwfDXM/fJs=
Date: Thu, 30 Apr 2026 09:00:06 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] driver core: faux: fix root device registration
Message-ID: <2026043054-limes-simply-e9ad@gregkh>
References: <20260424153127.2647405-1-johan@kernel.org>
 <20260424153127.2647405-2-johan@kernel.org>
 <DI54XY4CNFCD.30M3UJGK1M3BE@kernel.org>
 <afHapCZz5C42euaD@hovoldconsulting.com>
 <DI5KV97TNS9D.28EQTYL46PKT1@kernel.org>
 <afHpUxQ5U_4RWjDZ@hovoldconsulting.com>
 <DI5PDWIV7N7X.16VB7OPUTJ6ZK@kernel.org>
 <afIdl9VcaXxBb0Ll@hovoldconsulting.com>
 <DI5WUT6CUDAN.3SI10HVHF3NWJ@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5WUT6CUDAN.3SI10HVHF3NWJ@kernel.org>

On Wed, Apr 29, 2026 at 10:11:31PM +0200, Danilo Krummrich wrote:
> On Wed Apr 29, 2026 at 5:02 PM CEST, Johan Hovold wrote:
> > Again, feel free to drop the CC stable tag if you want to.
> 
> It's not so much about what I want -- I just try to stay close to what the
> guideline is, and only deviate when there's a good reason.
> 

Personally, I think it's good to backport this.  I trust Johan here so I
have no objection to taking this for stable trees (nor the other patches
he tagged for stable).

The rules are there for the stable maintainers to say "no" to, not so
much for us to be extremely strict about it at times if it makes sense
to us.

thanks,

greg k-h
