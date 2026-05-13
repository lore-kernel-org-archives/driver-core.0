Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB1F35E923
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 01:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778636142; cv=none; b=oIJJDJZxgiZtatQVrlWeimRSiDFswQpq38obnRa3r1egCjE0KgFUQH3ah9NVdqxwwZFir1u4A3G0hsGDt1N2iVxqhrCGqKZi+LYPmPyMHfM+dSJrZaqDKgYcvJJIS0mwMGyWz/TbiRj4HXIxu3KqVa6uVFb+0QShwE0UZk1z5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778636142; c=relaxed/simple;
	bh=D4cwFcx69v07oiq+0OZ6K3U/5Qt9lZ3tKk7D8NKMtgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRDYoqJdu+QbRV3Pc1O/yH7E51+m5+BJmrC0LKvFJgMONUHKQR1P/qmAukdgyXfKkLDn+iLrAt2SyjHAzL+hnElvjjAtQxG6Lybdth2cfgXXnbQngXGL8YHwXxlpgN1zib0QU4RdjktQkdpgoZn6L01Ey9cIZzxX8mfl0zIxwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LIHGpvkv; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LIHGpvkv"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778636132; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=EK9r55pKvkj6ZurTHCbQ59ouUx/DJYp0bD/MFkvBTVo=;
	b=LIHGpvkvswLtrkIgB5hSc4qLWCo/7njdwRQT+9Ccl0UQQcp/xBA7ENqY0D/9k8fFqhHaOAyK/FVuEp1LYRZGF4hgFw4VN9CdicPVWS84V9/aFFOkJR2Jdok6E8qrsigmk1YuwZ9oWFRrO4sYJDb6IakLWJT/pnrpGm3lWRaj9Uw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X2rsQUd_1778636131;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X2rsQUd_1778636131 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 13 May 2026 09:35:32 +0800
Date: Wed, 13 May 2026 09:35:30 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH RFC] arch_topology: Introduce nr_possible_packages
Message-ID: <agPVYkyVMcUye3cn@U-2FWC9VHC-2323.local>
References: <20260512150505.43871-1-feng.tang@linux.alibaba.com>
 <2026051214-supermom-brim-4608@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026051214-supermom-brim-4608@gregkh>

Hi Greg,

Thanks for the review!

On Tue, May 12, 2026 at 05:51:25PM +0200, Greg Kroah-Hartman wrote:
> On Tue, May 12, 2026 at 11:05:05PM +0800, Feng Tang wrote:
> > In multi-sockets platform, kernel or driver code may need the number
> > of packages for chosing different code directions. Some architecture
> > already provide such kind of interface like x86, which is being used
> > in some architecture code and drivers.
> > 
> > Add similar interface 'nr_possible_packages' for platforms which can
> > get package topology information by parsing ACPI tables in boot phase.
> > 
> > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > ---
> >  drivers/base/arch_topology.c  | 21 +++++++++++++++++++++
> >  include/linux/arch_topology.h |  5 +++++
> >  2 files changed, 26 insertions(+)
> > 
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> > index 8c5e47c28d9a..796d8a7aceea 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -850,6 +850,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
> >  	return !!is_threaded;
> >  }
> >  
> > +unsigned int nr_possible_packages __ro_after_init = 1;
> > +EXPORT_SYMBOL(nr_possible_packages);
> 
> EXPORT_SYMBOL_GPL() please?

Will change.

> And you don't have a user for this, so we can't verify how it actually
> works :(

Good point. Internally we have some PMU driver using this, but the HW is
not public and the drive hasn't been posted yet.

As for validation, we tested on production 1P platform, internal 2P
platform, and QEMU's multi-socket case.

I checked a production arm64 2P platform 'Kunpeng 920', and from the
output of "cat /sys/devices/system/cpu/cpu*/topology/physical_package_id",
the patch should work fine. I don't have root right of it yet, will try
to really run the patch on it.

> thanks,
> 
> greg k-h
> 
> > +/*
> > + * Assuming silicon has a sane package ID decoding method to not have
> > + * an ID bigger than 255 (1 byte).
> 
> Is that a valid assumption?  What about packages bigger than 255?  Don't
> we have those today?

Myself have only touched 8P (16P) HW, which may limit my imagination :)
We can change it to 1024 or 2048, though I'm curious how the cross-socket
latency and coherency could be maintained for huge platforms.

> 
> > + */
> > +#define MAX_PACKAGE_ID	255
> > +DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
> > +
> >  /*
> >   * Propagate the topology information of the processor_topology_node tree to the
> >   * cpu_topology array.
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
> >  	/*
> > @@ -927,6 +944,10 @@ __weak int __init parse_acpi_topology(void)
> >  
> >  	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> >  	xa_destroy(&hetero_cpu);
> > +
> > +	/* Count the number of possible packages in system */
> > +	nr_possible_packages = bitmap_weight(package_id_mask, MAX_PACKAGE_ID + 1);
> > +	pr_info("ACPI: System has %u Package(s) detected\n", nr_possible_packages);
> 
> Why "P" and not "p"?
 
:) will change.

> 
> >  	return 0;
> >  }
> >  
> > diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> > index ebd7f8935f96..dee076cc9c7a 100644
> > --- a/include/linux/arch_topology.h
> > +++ b/include/linux/arch_topology.h
> > @@ -111,4 +111,9 @@ static inline bool topology_core_has_smt(int cpu) { return false; }
> >  
> >  #endif /* CONFIG_GENERIC_ARCH_TOPOLOGY */
> >  
> > +
> > +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> > +extern unsigned int nr_possible_packages;
> > +#endif
> 
> Why the ifdef?
 
Aha, initial version of patch doesn't have it, as I think many
architectures may need this.

It was added later as the 'parse_acpi_topology()' function is under
this 'ifdef'.

I can move the 'nr_possible_packages' for future expandability if
no objection.

Thanks,
Feng

> thanks,
> 
> greg k-h
