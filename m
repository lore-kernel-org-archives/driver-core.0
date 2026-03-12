Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7931F997;
	Thu, 12 Mar 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773328409; cv=none; b=hEWGjvIuXNJFZmIeW7qUkktkv45KndHHCzza5xLRQlyUmQV8sARYTRbzlUmnsB2gulcDIVmkdZ5WnvJN+vNfwnvToC1wqmsRThVQx/dfL6cVIBsfHlrcr0QPHDb+yS6cte8uwozDGjayOXDye8OC/mtdpfL8MiczUXwoBB2oJjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773328409; c=relaxed/simple;
	bh=2qQTPZCB1wxl6IMcUBhVy6dND0iZbZTpo+CfpYcvMxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBTB/WZK1MBfcjtJXZpQKd/j+YJNVla1A5xYJtaFOp9p55VikPefrjmfzPLVw+BbdwFXZG2t4wnyMi6lqIsoTsHhvibPOkhR1dYba1dw/FU3/7fMP79kwWvzckJwvvOIcV+BZx0JNdg7uqKdwiPwe25ZOJrYNuAXvuB8wJdDDng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0vDcZsIC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0vDcZsIC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A64C4CEF7;
	Thu, 12 Mar 2026 15:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773328408;
	bh=2qQTPZCB1wxl6IMcUBhVy6dND0iZbZTpo+CfpYcvMxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0vDcZsICzECgtcVKHoAnBMgINkVcI3RmoN3LlnvlGlekO1GhKQnEOF59TnZG07SKx
	 S1s/lnExNxYpDtgGX/gmO1NsJEHfBhT2RSzGkWgMD2CBXfPbe/dOV1rAWMDnn/MwKg
	 AByhg14qfPLw+Jdw2Q4wCH6OrUgOeBa2EjP6LdhE=
Date: Thu, 12 Mar 2026 16:13:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rafael@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] Miscellaneous devres improvements
Message-ID: <2026031218-uniformly-bobcat-8e2d@gregkh>
References: <20260202235210.55176-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202235210.55176-1-dakr@kernel.org>

On Tue, Feb 03, 2026 at 12:48:13AM +0100, Danilo Krummrich wrote:
> This patch series provides some miscellaneous devres improvements.
> 
> The most notable change is a more clear separation between the base struct
> devres_node and its "subclasses" (such as struct devres and struct devres_group)
> as well as the mixup between struct devres and struct devres_group.
> 
> This serves three purposes.
> 
>   (1) Better maintainability due to clear type separation.
> 
>   (2) No waste of memory due to unnecessary minimal alignment for devres
>       actions, by introducing its own struct devres_action "subclass".
> 
>   (3) Bootstrapping for Rust devres code to embed a struct devres_node itself
>       to avoid both the unnecessary minimum alignment of struct devres and the
>       indirection through devres action avoiding unnecessary additional memory
>       allocations. [1]
> 
> However, (3) is just for completeness, the series also stands on its own.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?h=devres/devres_node&id=6da8ca499fa65992d71c5cb7a51df7260666e695
> 
> Danilo Krummrich (7):
>   devres: fix missing node debug info in devm_krealloc()
>   devres: add devres_node_add()
>   devres: add devres_node_init()
>   devres: don't require ARCH_DMA_MINALIGN for devres actions
>   devres: add free_node callback to struct devres_node
>   devres: use guard(spinlock_irqsave) where applicable
>   devres: remove unnecessary unlocks in devres_release_group()
> 
>  drivers/base/devres.c | 248 ++++++++++++++++++++++++++++--------------
>  1 file changed, 165 insertions(+), 83 deletions(-)
> 
> 
> base-commit: 289b14592cefe95f7d0ef334873c12b96ce3824f
> -- 
> 2.52.0
> 
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
