Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBD3BCD16;
	Thu,  6 Aug 2026 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999994; cv=none; b=kbMXxF23/aqzGJ+jMg9pVUuhcIQP/Gt0Wg3i4nzSoKk2nT72tRFFKG2V6p9TaoFwKA/jA7MIYfQlluBVoTv4LqMf7ebLNefEYBwaS1l87DaUTihKo8YSyjhFw8B2QspTkgA8Ob2afGJzZidm/w2wS3/uS6RqDAehCXywg9hZeGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999994; c=relaxed/simple;
	bh=oMNmKrdDSDXLJAZ7u3QEUn4H/UBCNnlFyIODV7WES+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZkXO3kA4RuDARLGR3puJWXtBlKEb8C7i9Yk+8a/zzk0seUgoBjQIzP2I1+uoYaFPqeMvKts4P6sFizXN/4lXsMWyhqHJHC8HISx52gkZJXv2v14NQlSHA3QEOsLYw/Y2TM6RJ1d9ltpzhxZoS+7H7HQCirw4CLLJ6c3DRngJEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TwW+Ap/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TwW+Ap/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE731F000E9;
	Thu,  6 Aug 2026 07:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785999993;
	bh=XcPioRNMll3r5OmjiUG/O8aq5a3hSQJFiegnJyFSvIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TwW+Ap/66ZcREdQqckrwX9vkc4Z93jN+7IIPxPYOiPbMC7JQJLgHtNmGACiqreIOl
	 6VtKD+H1WXaB8vi7L7DUqflVCLVDxKlXaQOa27Y1xlE94I5MQBOCxaLpGxu8w95yxa
	 nLR7i2qRWqCJjI04VZ4iK2rOwaTxETtqALN8uBB0LDAJipUR20/MLuflvSH4jZOaTt
	 FA29yzKuOloFl8WVrOPL8Sah+FiTPLMEt4IBdUmubGhXtw99looSINmmGHL01wl69L
	 MBjZU/REIsuooI/qb4X3q+UnhFlXJ4tn0gO4xtQOKfODXHmcQcBGGM/SzMw2jWtOmc
	 oc1hySP12bYdg==
Date: Thu, 6 Aug 2026 08:06:12 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Catalin Marinas <catalin.marinas@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <anQyFuRVekkN8Z5a@lucifer>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>

On Thu, Aug 06, 2026 at 09:58:38AM +0300, Mike Rapoport (Microsoft) wrote:
> arch_numa.c implements boot time discovery and initialization of NUMA
> topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> and riscv).
>
> Since this is step in the initialization of the memory management
> subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> numa_memblks.c and numa_emulation.c.
>
> Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> MANAGEMENT INITIALIZATION" in MAINTAINERS.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Everything is proceeding as I have foreseen... soon we shall have control
of all of the kernel! ;)

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  MAINTAINERS                      | 1 +
>  drivers/base/Kconfig             | 7 -------
>  drivers/base/Makefile            | 1 -
>  mm/Kconfig                       | 7 +++++++
>  mm/Makefile                      | 1 +
>  {drivers/base => mm}/arch_numa.c | 0
>  6 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5114e6db7307..465b64f8e93c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16880,6 +16880,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
>  F:	Documentation/core-api/boot-time-mm.rst
>  F:	include/linux/kho/abi/memblock.h
>  F:	include/linux/memblock.h
> +F:	mm/arch_numa.c
>  F:	mm/bootmem_info.c
>  F:	mm/memblock.c
>  F:	mm/memtest.c
> diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> index f7d385cbd3ba..1d93bfc34490 100644
> --- a/drivers/base/Kconfig
> +++ b/drivers/base/Kconfig
> @@ -239,13 +239,6 @@ config GENERIC_ARCH_TOPOLOGY
>  	  appropriate scaling, sysfs interface for reading capacity values at
>  	  runtime.
>
> -config GENERIC_ARCH_NUMA
> -	bool
> -	select NUMA_MEMBLKS
> -	help
> -	  Enable support for generic NUMA implementation. Currently, RISC-V
> -	  and ARM64 use it.
> -
>  config FW_DEVLINK_SYNC_STATE_TIMEOUT
>  	bool "sync_state() behavior defaults to timeout instead of strict"
>  	help
> diff --git a/drivers/base/Makefile b/drivers/base/Makefile
> index 8074a10183dc..435710f643a5 100644
> --- a/drivers/base/Makefile
> +++ b/drivers/base/Makefile
> @@ -25,7 +25,6 @@ obj-$(CONFIG_PINCTRL) += pinctrl.o
>  obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
>  obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
>  obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
> -obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
>  obj-$(CONFIG_ACPI) += physical_location.o
>
>  obj-y			+= test/
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 9e0ca4824905..410b8a0a92b9 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1469,6 +1469,13 @@ config NUMA_EMU
>  	  into virtual nodes when booted with "numa=fake=N", where N is the
>  	  number of nodes. This is only useful for debugging.
>
> +config GENERIC_ARCH_NUMA
> +	bool
> +	select NUMA_MEMBLKS
> +	help
> +	  Enable support for generic NUMA implementation. Currently, RISC-V
> +	  and ARM64 use it.
> +
>  config ARCH_HAS_USER_SHADOW_STACK
>  	bool
>  	help
> diff --git a/mm/Makefile b/mm/Makefile
> index eff9f9e7e061..fd29be716fa8 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -122,6 +122,7 @@ obj-$(CONFIG_CMA)	+= cma.o
>  obj-$(CONFIG_NUMA) += numa.o
>  obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
>  obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
> +obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
>  obj-$(CONFIG_BALLOON) += balloon.o
>  obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
>  obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
> diff --git a/drivers/base/arch_numa.c b/mm/arch_numa.c
> similarity index 100%
> rename from drivers/base/arch_numa.c
> rename to mm/arch_numa.c
>
> ---
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> change-id: 20260806-arch-numa-444bb4806114
>
> --
> Sincerely yours,
> Mike.
>

--
Cheers, Lorenzo
