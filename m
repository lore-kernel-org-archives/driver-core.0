Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8BB317173;
	Wed, 29 Apr 2026 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777474969; cv=none; b=pRJZPpo5QFRVWlr0RHoBZmpSeuPctFEWJcNKPKnGSYuoKnu6IccX9yN6Vxnah87C16yd25eUDHEB1UNKQ79YYBUc9LR3xJCjWXmlGXL4mqIdIzFrMAvlVoGC1NLoVOnd2etn81owopZlYRLaPF1+3jQxYfwmnZAd/Qs7y32s4sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777474969; c=relaxed/simple;
	bh=ctAPrMfJMsxRRxCRa2/i4MD59Jh65U6AxRazSKD4SxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYtaZUORDEy7uVOyQWXmHZ8TU6grDVGx2jckzcYm9zLBpLB88a7Rr9rQLRXKMvJ9Xgto8NSGMfUV3EMHRwuXwKHRXwHmpU0VXafKwBOpZVkadSx8PpoeqOHT1NM4Uu3JoWBeoCmVuOKsHndIgDxa8QzJYEElobRs0YnunITMySw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=domVGPMi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="domVGPMi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8644BC19425;
	Wed, 29 Apr 2026 15:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777474969;
	bh=ctAPrMfJMsxRRxCRa2/i4MD59Jh65U6AxRazSKD4SxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=domVGPMi+BytALRWQwbV+rxuszvrZJ3HULkM1FUtnMzkS9N1fu825zw1n/BZ5uEST
	 urbRA4B0fFu9IsIY6IZ3Dl/C2o1MMq5DyHxfZbeZyt239A/Tn13XDxY4fPEun1yNSc
	 YhyJpKvd7LqouCy/8dAhWO0xufpyOY8TFVYEzfuiipB3uL+TTwNbn3WFvQooELh/xr
	 BSvgGgEtSexonRGwEF57woOGQDODc/PxEc4lYv1AOGQXRIDp5LrGasKXE6peG3dSx6
	 ZJ9iJMqdkYhP3wT44LGNbgx0QZKmCmMk02h7Ll366Fe0EbhKeHQgwLz5lHgNwwvyeC
	 yut6IH8k8t31Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wI6R5-00000000lJy-0a7h;
	Wed, 29 Apr 2026 17:02:47 +0200
Date: Wed, 29 Apr 2026 17:02:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] driver core: faux: fix root device registration
Message-ID: <afIdl9VcaXxBb0Ll@hovoldconsulting.com>
References: <20260424153127.2647405-1-johan@kernel.org>
 <20260424153127.2647405-2-johan@kernel.org>
 <DI54XY4CNFCD.30M3UJGK1M3BE@kernel.org>
 <afHapCZz5C42euaD@hovoldconsulting.com>
 <DI5KV97TNS9D.28EQTYL46PKT1@kernel.org>
 <afHpUxQ5U_4RWjDZ@hovoldconsulting.com>
 <DI5PDWIV7N7X.16VB7OPUTJ6ZK@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5PDWIV7N7X.16VB7OPUTJ6ZK@kernel.org>

On Wed, Apr 29, 2026 at 04:20:18PM +0200, Danilo Krummrich wrote:
> On Wed Apr 29, 2026 at 1:19 PM CEST, Johan Hovold wrote:
> > The stable rules have been relaxed in practice since Autosel. Anything
> > that looks like a fix (e.g. has a Fixes tag) gets backported.
> >
> > And people get tired of asking the stable team to drop patches that were
> > not marked for backporting.
> 
> There is still a difference between this happening in practice and using that as
> a justification to explicitly request a stable backport for something that - by
> the official rules - isn't mandated for stable backport.

Again, feel free to drop the CC stable tag if you want to.

Johan
