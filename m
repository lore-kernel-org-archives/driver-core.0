Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698301;
	b=YYbOEujdAvJTb7MrOAWZCNlUSVbEiANpNaAZRw8P43ZjUEV0X7cytQKJC8LtQmAGFK1G
	 8V59cR7PVLGfsG8Dnma0mljYIrC2Cud/oWs5hlKbmwlxA9kHGZKVB/+zno8lYMPqRJOQ3
	 6Ni4fAE6cgnmhAHhlgn3ehCDkqpZpEkjJfd+uRvU7vBnYNpt3LiovPrVH+k39VNNxgD7e
	 LK9v3IXE6OrjKxRd22a1DFkFHzgytUNxn9Cj23rIAhUQBxPHCuKaOk/jASE/mvaluJQGB
	 v9vRD0TOjehEwoinS4xGXJX+vh8i5UPOVw8qZajEZ+jNdsCMhFcOvDV1Ri39vcRbRxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698301;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=fQLM1PvdJanDdaZn/uIUF22Fu4+LvgFnjHQUCGpdnKA=;
	b=sA7ipSlHPTmz4CMz3w4MfSORQjnfyH3NsFSegw6OZEXAhHNeRpQAnzOHw9pD/7somCiM
	 GCvENO81SJuS0hVjVbbhg+bQ7vwK7U+2erqG7cu9V9TMDsN+V54aNj34kld9CTHvA+q8w
	 IOn4g6/rPMHq6OLYjQ0ozMS3hslGBC7kZO10Dm0oLjPLHqwHofPvRh7R1h6GQXW1O4XWA
	 3Xf/8uDUR2+CkhBKVlfFz4XLrxo9LyhxwYWCa39p1OHIRg61iwZglsOPudpXcuafqy1PH
	 u3Zt8lBGnVk0UqApqoKU9l/Zt04WSgqbXVz2SyL4mErRh4Gr4JXqGAWhxwilB1cXUXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ozCX3SNv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8727606A32D;
	Tue,  3 Nov 2026 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ozCX3SNv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CBC1F000C1;
	Tue,  3 Nov 2026 09:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793698300;
	bh=fQLM1PvdJanDdaZn/uIUF22Fu4+LvgFnjHQUCGpdnKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ozCX3SNvSBx32mYc+awAu1xlPAUZCqXtZZGMLYHxnP3GOc5/cfrG3ZfZrgQos7XL9
	 p4t2Z145i1I37I6umYahA0/hvVowJKOGEw8eyFOBGsuiBLaxBoDH4JWeE9aAlJQa4+
	 rLHoz7CZTtM5WoslgnRvRwJQHayXcS58CRtrxDTQ=
Date: Tue, 3 Nov 2026 10:31:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shuncai Tang <jacktangsc@icloud.com>
Cc: Tejun Heo <tj@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kernfs: fix stale comment referencing old @sd
Message-ID: <2026110314-july-quake-e948@gregkh>
References: <20261103042551.10800-1-jacktangsc@icloud.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103042551.10800-1-jacktangsc@icloud.com>

On Tue, Nov 03, 2026 at 12:25:51PM +0800, Shuncai Tang wrote:
> The comment still refers to old @sd which was a sysfs_dirent.
> Update it to @kn to match the current function argument.
> 
> No functional change.
> 
> v2: Use full name in Signed-off-by.

This goes below the --- line, please read the documentation again for
how to do this.

thanks,

greg k-h
