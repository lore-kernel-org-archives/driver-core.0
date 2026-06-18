Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CCC3DF009;
	Thu, 18 Jun 2026 09:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776690; cv=none; b=nudXGWzpScrDIbs/cyMl3/pmcjJiCBp/l++AekTtDsG7AJ9HZ9+4vOK35uWH+guCCX9JlDl2eSOtwlPHIoA+t886+KkJ9lA45egE1FFPAe0l2/Mn5e7Fr54310aGh38DArs/WCHKNeyo8qz51DwhKEwEzbmss5za0kKhqS8PeBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776690; c=relaxed/simple;
	bh=O0ymvEBzcHqLp7NXC5E15Pmgz86kUrFWnUsF98ZpkkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XT4Au6/zbg9r0efyAwQ1moh4WNOhG5lPq2j9Z0x2ekqGrQVkjZJQ95XjXhiQ+QeC2M4e0dNx86tdO9ObaHrUiyGRPuv3aUBX3smyJwFcf0Nksf5AsfUQCsFvXf9fuQ/s27GVCEMXEX9v5/9q1S978RdDq+umDWThIM0+v6Cp1EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIS8zgEY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIS8zgEY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86091F000E9;
	Thu, 18 Jun 2026 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781776689;
	bh=tiNVS9vkzE9TdVgyxNQuAslrVNFTDadDu+nPGoDezg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eIS8zgEY0mshL+1CaTXP0EN/b9Ga4VR/mX1OrV5Z6f91jnBt0gg7xwzcBy5ePpSob
	 wwolzpxTuUSZ6DBpcCTCN5GSHypgJZowuMkzuz0N2cM/Edy+gvQA5jUhWYWgZ/0Gov
	 ADoJcVCU2xlBwk3AVX3zANkmQTOocXctyAEDRKJ/NemmiQ2MPGKPmWkQtGB42CCGB2
	 fTpX5Ee8++WrXhnS0K9G8E0zsnB5NECgadtDVfst6TEC9s5FouJVamFRwNJiRz2VIS
	 Qzwz7JpWVUDW/bypyDIylmVl0gvqkVjcbY4lbnCmPbEIJVeVo1oTirQlXld/qCxEHN
	 R/Eqe2T1gQrvA==
Date: Thu, 18 Jun 2026 12:58:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: akpm@linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch_numa: remove redundant nodemask clears in
 numa_init()
Message-ID: <ajPBKyhjzeDWKhRr@kernel.org>
References: <20260617163919.2544899-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617163919.2544899-1-ekffu200098@gmail.com>

On Thu, Jun 18, 2026 at 01:39:19AM +0900, Sang-Heon Jeon wrote:
> numa_init() clears numa_nodes_parsed, node_possible_map and
> node_online_map, then calls numa_memblks_init(), which clears the same
> nodemasks. Nothing uses them in between.
> 
> These clears have been redundant since commit 767507654c22 ("arch_numa:
> switch over to numa_memblks") made numa_init() use numa_memblks_init().
> 
> No functional change.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  drivers/base/arch_numa.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index c99f2ab105e5..442ea239bba7 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -231,10 +231,6 @@ static int __init numa_init(int (*init_func)(void))
>  {
>  	int ret;
>  
> -	nodes_clear(numa_nodes_parsed);
> -	nodes_clear(node_possible_map);
> -	nodes_clear(node_online_map);
> -
>  	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ false);
>  	if (ret < 0)
>  		goto out_free_distance;
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
