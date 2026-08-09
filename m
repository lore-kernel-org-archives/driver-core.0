Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA632882C5;
	Sun,  9 Aug 2026 05:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786254699; cv=none; b=suAhDJ0ydmhONg+9DW6hQiZlNVabC7gDyNZI2CJ6robypXW9reZYooN8APZpmy79fqG6K89I5ziEFtaGahBxFVaeAddEfENw3qWUMViNrMWvAwc9mHSblmF0NVHpZ91t8j9A6aLRNfIUmWRH4eccBcY6CC7aUI0RJsrasSHW0aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786254699; c=relaxed/simple;
	bh=e/6aByc8pkOMWF28smhpM21PAtCX3GZTtqHBKqHGiA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnEhxI4CEmEOtqCa89NsjZtx/qIGZ55azvXhfIJHcdtlvSpoLDsyABPOVYqOZrxnJuuEplQyGP41kzmJC0wnKTCBSdU/vrVkRy+pJ8jHHKIvkDO/1k3DwzUpBSXlsxDkdWl9r/EdyKRQG1juTL/zv0mfGhFGLwYdzllWgKQ27SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixEmCWHm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixEmCWHm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD7B1F000E9;
	Sun,  9 Aug 2026 05:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786254698;
	bh=T3FGOkCsyAkRq/PlWdyqKgGv29697plosgcUL2pIKfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ixEmCWHm7ue2f00kzDVoGx2sOV1FXDu+EXAaI2iOwLz+GBiH4XdAsliF60VuH08RA
	 jkOi0P473ENk5+CmpbrxxClJp4qkn2H4Nyb2FfdYB8v5l8CkaCzShWTOZSPZSQRzoV
	 QOjH/ievlWfMSifDniCKcMkYCY0sLwmwzFxfd5LmZ13luZgo46vjrYdrXDIOmD3nWC
	 83ntAy9WSZ2tld1oz2tTUcvfRBnAuIt1DaUTfisZTNnClBNMtKESdsqoBYifeflv8p
	 MP4u3PP5BkcolJtsL9gGsB4bkhZ+7fCEPtMOxmXLP9AMMdrkxNsL6NRMWevPj3Q6Q1
	 PAmFJQztTL81g==
Date: Sun, 9 Aug 2026 08:51:29 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <angVYX5owaXkZ3sG@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
 <20260806154842.9faab19cdfb7cf09799d8f79@linux-foundation.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806154842.9faab19cdfb7cf09799d8f79@linux-foundation.org>

On Thu, Aug 06, 2026 at 03:48:42PM -0700, Andrew Morton wrote:
> On Thu, 06 Aug 2026 09:58:38 +0300 "Mike Rapoport (Microsoft)" <rppt@kernel.org> wrote:
> 
> > arch_numa.c implements boot time discovery and initialization of NUMA
> > topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> > and riscv).
> > 
> > Since this is step in the initialization of the memory management
> > subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> > numa_memblks.c and numa_emulation.c.
> > 
> > Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> > MANAGEMENT INITIALIZATION" in MAINTAINERS.
> 
> Unclear what tree this is targeted at.  I grabbed it.
 
Heh, it's muscle memory to send such patches to you :)
Let's keep this in your tree, thanks!
 
> mm-stable does have this change:
> 
> --- linux-7.2-rc5/drivers/base/arch_numa.c	2026-07-27 04:44:55.000000000 -0700
> +++ 25/drivers/base/arch_numa.c	2026-08-06 15:47:59.019918702 -0700
> @@ -231,10 +231,6 @@ static int __init numa_init(int (*init_f
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
> 
> 
> which is easily handled either way.

-- 
Sincerely yours,
Mike.
