Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C34937AA91
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786080291; cv=none; b=cYHyrWV+21oCiV5LR/arDCNNUCsHdWZnreHy5gHzvq7BJeuYqEKvTlcvBU8bkktotLEuWZG9iofG5vVrSVay5/Cwu44S0ShcyibZos0r1n+KOdhnA4FO7FpkdCOMQRnYm0JRUI4Og3RyZB5gZJeOmX+zeRLbJ3vgWSlbzIlrSpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786080291; c=relaxed/simple;
	bh=PwazvYnekf360rM81EYDLrcRyT6KDqYmEiYR0cpBj6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ANYTPTcIw3Vy6IamiBE1lIhMok/1XFLNCXKHP30lUYoso+rBRVLu4Ey1R6O4gYj7LhKJgBOsEBAkuMSJTS+LnKn6pq4Us+sof4sN0OiAbiXcsko7NJ7iZ4bSaQAHia0S1s89CLZMq/NaPJU40IYbDlqk6278cQ5o+vmS9m9I2JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FdyTZe4T; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FdyTZe4T"
Date: Thu, 6 Aug 2026 23:24:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786080284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pIn2I+WeP37ayW0ndJqkFb9BbIRil7aYgI0VckMXc0s=;
	b=FdyTZe4T6Mp0Q7+GhixJ3PIGfgqZsM0bBKEud7X7mm9S1zrsOH26u7frT0oP3JF3LUEXuL
	xMNBWULW4X7EPSE90KjQiMhR1Feb3TlXpH5FNqZ961ny4JgVcqtiSFuifQQltlFApkV2TL
	HXhqrD52nOv88dYW5Y3xgw5MKrgEkwE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: mcgrof@kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH 1/1] MAINTAINERS: Remove Russ Weight from Firmware Loader
Message-ID: <4562w4kmilphdekvzkfqg7e2ncdznxqc5tgzqh7g4ed2a6ulzd@acimaw5bmozi>
References: <5o4r7r76h4areyfolngggnzcd3msquwgubly6xjbz6zdvoha2i@doazljuavhgk>
 <DKI3CWI7Y5T1.2DS54JYTFSVSN@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKI3CWI7Y5T1.2DS54JYTFSVSN@kernel.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Aug 06, 2026 at 09:01:12PM +0200, Danilo Krummrich wrote:
> Hi Russ,
> 
> On Thu Aug 6, 2026 at 7:19 PM CEST, Russ Weight wrote:
> > Russ Weight is retired and is no longer actively participating in linux
> > kernel development. Remove him from the list of maintainers for FIRMWARE
> > LOADER.
> 
> I think we should also add an entry to the CREDITS file. :)

Thanks. I'll create an entry.

> 
> Also, should we update the contact information in
> Documentation/ABI/testing/sysfs-class-firmware?

Who should I put for the new contact for these files? Should it be you?
Or Luis? Or someone else?

> Thanks,
> Danilo
