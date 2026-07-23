Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483F93F9277
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 08:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795276; cv=none; b=PhGttmwzQUvGrGnp4biv1EOCzts2o2byP2uPIxbS+7j7sX+fNBnx5WxfDTnJ9dLvnhSBCT6O0lmxbVTPlYw52aklcNhSAoXUMd6ejdiZrwXpJO5L5yOhS+vYcqdus6ssp7wRkaZWE4/6oIigWueg10oCtIfDYYE9S6WLdc/pBQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795276; c=relaxed/simple;
	bh=5XmGirqIDHTveNQt3ukMKJSsZ6sZAXc+m9F/XlJUxXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pnZavfvaQd15g1oUgymMB3zJ1l05u5qy0f8K0uedadSlaz81bRN/HNYZq5zyA2/pr6KO9UkB1dAdsOpVGW9gAJzMRBIkI+CaCBT9UL+uO90guonvEixmk3KPXnHsvhP0LQqv4fIS04eRfKtQk2rT3txMVFptt8GZ9YgDnvA5/GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=wTbcgfjy; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="wTbcgfjy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784795268; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=i8Yyo3ogKeqJ36R6Ul3Y3JRoOpYXd0lAkDof65Cp+kQ=;
	b=wTbcgfjyxIDh9HaHS31MHTmGN23F/cSewx8rnhTS5p0I3cHJQ5MfFovtrZG/aMyoLAROYdZH0APPFgzV+mwwzYTUPugtIVq+1QMrDvqymjgm6HVfB7j9jZrPEiWZFcAqBLWXLLEQvGSNk/AqV9+0nDoAVL5WCyAgco03JJ0y03Y=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7fcEnN_1784795267;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X7fcEnN_1784795267 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 23 Jul 2026 16:27:48 +0800
Date: Thu, 23 Jul 2026 16:27:47 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] arch_topology: Introduce nr_possible_packages
Message-ID: <amHQg6_IHmwkvQ6A@U-2FWC9VHC-2323.local>
References: <20260714054317.73219-1-feng.tang@linux.alibaba.com>
 <20260722-wakeful-lemming-of-snow-04fe9d@sudeepholla>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260722-wakeful-lemming-of-snow-04fe9d@sudeepholla>

On Wed, Jul 22, 2026 at 09:41:54AM +0100, Sudeep Holla wrote:
> On Tue, Jul 14, 2026 at 01:43:17PM +0800, Feng Tang wrote:
> > For multi-sockets platforms kernel or driver code may need the number
> > of packages to chose different code directions. Some architecture
> > already provides such kind of interface like x86, which is being used
> > in its architecture code and drivers.
> > 
> > Add similar interface 'nr_possible_packages' for platforms which can
> > get package topology information by parsing ACPI tables in boot phase,
> > which was verified to show the correct number of packages on some
> > 1-socket and 2-sockets production arm64 servers from different vendors.
> > 
> > It has been used locally by some arm64 PMU driver, and cross-socket
> > timer-consistency check code, which are to be posted.
[...]
> >  
> > +unsigned int nr_possible_packages __ro_after_init;
> > +EXPORT_SYMBOL(nr_possible_packages);
> > +
> > +static int package_ids[1 << CONFIG_NODES_SHIFT] __initdata;
 
Thanks for the suggestion!

> Since all you need is just the total number of packages, this whole
> array may not be required.
 
Yes. I also made it '__initdata' to be freed later.

> static unsigned int topology_count_packages(const struct cpumask *cpus)
> {
> 	unsigned int cpu, prev, count = 0;
> 	int package_id;
> 
> 	for_each_cpu(cpu, cpus) {
> 		package_id = cpu_topology[cpu].package_id;
> 		if (package_id < 0)
> 			continue;
> 
> 		for_each_cpu(prev, cpus) {
> 			if (prev == cpu) {
> 				count++;
> 				break;
> 			}
> 
> 			if (cpu_topology[prev].package_id == package_id)
> 				break;
> 		}
> 	}
> 
> 	return count;
> }
> 
> Something like this would suffice, no ?

This is a good point, that I don't have to call count_packages()
and use global array for each cpu, but do this package counting
all together after CPUs have been parsed and before exitting
parse_acpi_topology(). 

One thing is, from PPTT table, the package ID is u32, so we
can't say 0xffffffff (-1) is illegal (though I think it's insane
to really use it :)). Anyway, I'll test more in this direction.

Thanks,
Feng
