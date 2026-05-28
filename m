Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D235AC09
	for <driver-core@lists.linux.dev>; Thu, 28 May 2026 07:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955019; cv=none; b=oUM3QFPvAVQwATSKc2es7mMeaT3RxUCJAxVKuGYMp03yaqn2s/fmFwZqFsQfIk+3Cnd9hP8kzWGDHhReuVSNpNRnMnIfxaBD/laSlGU8b5Ss/XqO/bCTqDZL1Rw+aZI/pQO5dZQkSiD748z4L5sqKozrF2dySHbvUc5KtPRfp0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955019; c=relaxed/simple;
	bh=9uLvYRuhcnPJVMn93S05Gb4HWbrZzXdYp602WIKWNC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCIrjtUz8t6jelPBB1O0VxR4HN9Gp6mfdLjzCe/KBT8DNIzWukM6cxsLpBURdbI5WMoJGBnoXvHkrELu8hZ/7/RXXC2rlVr1n87VlCCwl88+8Xj2Bl5cor2qAhIckAH6ylOSk+w8WcpBdusFZx/b98xJOzCRTBSLVh4HcfVREgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=bpI71KFf; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="bpI71KFf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779955009; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=8yyC5o+799uJ4JFPQC1NXZ7HzCY5/zDoQiyagb9nv3E=;
	b=bpI71KFfnkZeCMwLWdRldgiA9+1gylZIXlyQqHQX1/wQDUkqDJB7lZuGNff/s46nr6UxFTYv3cFkrx7tZGOg9JAW/TOzhehio+TGQsKoxG2KIv9pztaiCQx2eyvNYkj5tDOG4icxeoRWPvdobEzzbS94k2+VS4dqs54Hnf243qg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R661e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X3lmyyH_1779955007;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X3lmyyH_1779955007 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 28 May 2026 15:56:48 +0800
Date: Thu, 28 May 2026 15:56:47 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v1] arch_topology: Introduce nr_possible_packages
Message-ID: <ahf1P8-pM-vfXraa@U-2FWC9VHC-2323.local>
References: <20260515144435.93035-1-feng.tang@linux.alibaba.com>
 <20260527-organic-tentacled-ostrich-857e0d@sudeepholla>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527-organic-tentacled-ostrich-857e0d@sudeepholla>

Hi Sudeep,

Many thanks for the review!

On Wed, May 27, 2026 at 02:53:24PM +0100, Sudeep Holla wrote:
> On Fri, May 15, 2026 at 10:44:35PM +0800, Feng Tang wrote:
> > In multi-sockets platform, kernel or driver code may need the number
> > of packages for chosing different code directions. Some architecture
> > already provide such kind of interface like x86, which is being used
> > in some architecture code and drivers.
> > 
> > Add similar interface 'nr_possible_packages' for platforms which can
> > get package topology information by parsing ACPI tables in boot phase,
> > which was verified to show the correct number of packages on some
> > 1-socket and 2-sockets production arm64 servers from different vendors.
> > 
> 
> Sorry, but without a clear demonstration of how and where you plan to use
> this, it is very difficult to provide meaningful feedback or review this patch
> in isolation.

Yes, Greg asked similar thing. We had 2 main use cases locally: 
* some arm64 PMU driver need this info to program register accordingly.
* We met some arch_timer un-synced bug cross socket, and need it to
  judge whether to start a timer sanity check in boot phase (very
  similar as the TSC timer check for x86)

Patch for first item hasn't been posted as the HW is not public yet,
while the patch for 2nd is tested and WIP for upstream posting.

> I am concerned that this approach may be based on another architecture, while
> arm64 might have a better alternative due to how the firmware description is
> structured.

My bad that the commit log is confusing. I mentioned x86 just to show
other architecture has similar requirement, while this patch's
implementation has nothing to do with x86.

> Please provide more details so I can review this properly.
> 
> > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > ---
> > Changelog:
> > 
> >   since RFC:
> >       * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)
> > 	  * change the possible max package ID to 2047 (Greg)
> > 	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)
> > 	
> >   RFC: https://lore.kernel.org/lkml/20260512150505.43871-1-feng.tang@linux.alibaba.com/ 
> > 
> >  drivers/base/arch_topology.c  | 21 +++++++++++++++++++++
> >  include/linux/arch_topology.h |  1 +
> >  2 files changed, 22 insertions(+)
[...]
> > +/*
> > + * Assuming silicon has a sane package ID decoding method to not have
> > + * an ID bigger than 2047
> > + */
> > +#define MAX_PACKAGE_ID	2047
> > +DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
> > +
> >  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> >  struct cpu_smt_info {
> >  	unsigned int thread_num;
> > @@ -912,6 +922,13 @@ __weak int __init parse_acpi_topology(void)
> >  		cpu_topology[cpu].cluster_id = topology_id;
> >  		topology_id = find_acpi_cpu_topology_package(cpu);
> >  		cpu_topology[cpu].package_id = topology_id;
> > +
> > +
> > +		if (topology_id >= 0 && topology_id <= MAX_PACKAGE_ID)
> > +			bitmap_set(package_id_mask, topology_id, 1);
> > +		else
> > +			pr_warn("ACPI: abnormal package ID: %d !\n",
> > +				topology_id);
> >  	}
> >
> 
> MAX_PACKAGE_ID is set to 2047 yet it reads from PPTT which has no such
> restriction. So it completely falls apart there as UID is just 32-bit
> number IIUC. If UID is not present we compute offset which is sparse
> and even that can be > 2047.

Yes. In theory, the package ID could be 0 or 0xffffffff (though I
don't think such package ID is reasonable :)).

And for this, we may give up the bitmap way, and use other way to
count number of packages, like create a package ID array

	static u32 fresh_pkg_id[1 << CONFIG_NODES_SHIFT];

to save fresh IDs during the PPTT table parsing, and then count
the number of valid ones.

> >  	/*
> > @@ -927,6 +944,10 @@ __weak int __init parse_acpi_topology(void)
> >  
> >  	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> >  	xa_destroy(&hetero_cpu);
> > +
> > +	/* Count the number of possible packages in system */
> > +	nr_possible_packages = bitmap_weight(package_id_mask, MAX_PACKAGE_ID + 1);
> > +	pr_info("ACPI: System has %u package(s) detected\n", nr_possible_packages);
> >  	return 0;
> >  }
> 
> IIUC x86 does not expose raw firmware package IDs as an array bound.  It builds
> topology domain bitmaps and derives dense logical package IDs from them.

You are right. IIUC, x86 uses its own way to build up the topology mainly by
parsing MADT table in early boot phase.

And arch_topology.c of this patch is under CONFIG_GENRIC_ARCH_TOPOLOGY, and
was selected by arm64/arm/riscv/parisc architectures.

> >  
> > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > index ebd7f8935f96..960045e6ac05 100644
> > --- a/include/linux/arch_topology.h
> > +++ b/include/linux/arch_topology.h
> > @@ -105,6 +105,7 @@ static inline bool topology_core_has_smt(int cpu)
> >  	return cpu_topology[cpu].thread_id != -1;
> >  }
> >  
> > +extern unsigned int nr_possible_packages;
> 
> It does not provide a logical package ID mapping corresponding to the count.
> A consumer that uses nr_possible_packages for allocation and
> topology_physical_package_id(cpu) for indexing can still index out of bounds
> on sparse ACPI Processor IDs or on PPTT offset-based IDs.

Yes. And for the user cases I mentioned earlier, users don't need the
logical/physical package ID, but the number of packages. 

Thanks,
Feng
