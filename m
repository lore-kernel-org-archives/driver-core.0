Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E442E001;
	Tue, 20 Jan 2026 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920980; cv=none; b=FZH7FVofDqE9gOsz1zmXWic23oHTdz4Xydxy4zrC9xdqe9J9+meitm8cEvQJa8w+w9dBoygdVuZGTnevjB/+ivs7AQ1hME/1/EgzEaqOWD0rZFILY+kHM41kEhePBYS/oZyQ0lfpAbMDHcSUn5KP8hfaWCEo1SiYL/TCCJn0tLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920980; c=relaxed/simple;
	bh=vaucwY5NHuRMqkFSkBYOI/rEPT1+fI+HCYOZ+FASvpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZ7Ke8g1ypxBySP5vXGtpOQnQztdpdOuvuJzl5V7lBY9fT5WOq/HTxcLrpKs5KdDMazZzo6oR31uTcKj+dCHejpnK3cvWCvzE4nn/HRAtoyFkpu5O9/xvo2GRvlCCibkHH1mg35Zc4YTxANPtuWWfDv3y4w6SGqZSPaJWGxBXqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DX08YOdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DX08YOdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA1BC16AAE;
	Tue, 20 Jan 2026 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768920979;
	bh=vaucwY5NHuRMqkFSkBYOI/rEPT1+fI+HCYOZ+FASvpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DX08YOdCfwwH+/M6PlDzvE0ctlfQOUYPgc7gffn9SCVAiBBFUPSu4w8ppRuJ7d7lN
	 3J7bo3J+YXAD55ygAdwgo9VlcHayHSGhRDSAXUpXETOLbdmP1/yS7oAp645xqJLU9W
	 7m/cKH3xchRc5CoRhUelzC+PnYU6QOJoJRvPMuJM=
Date: Tue, 20 Jan 2026 15:56:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com,
	leon@kernel.org, aliceryhl@google.com, daniel.almeida@collabora.com,
	abdiel.janulgue@gmail.com, robin.murphy@arm.com,
	a.hindborg@kernel.org, russ.weight@linux.dev, mcgrof@kernel.org,
	tj@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] MAINTAINERS: Add driver-core mailing list
Message-ID: <2026012009-expedited-opacity-792b@gregkh>
References: <20260120123925.28267-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120123925.28267-1-dakr@kernel.org>

On Tue, Jan 20, 2026 at 01:38:52PM +0100, Danilo Krummrich wrote:
> Add the driver-core mailing list for all entries maintained under the
> driver-core tree.
> 
> If existent, replace linux-kernel and rust-for-linux list entries, as
> they're automatically picked up by scripts/get_maintainer.pl.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
