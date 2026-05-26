Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D553033EC;
	Tue, 26 May 2026 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779778941; cv=none; b=p4yeYsOQfzfqZnjkQo5NJmV3ojRYevYvKJOT+xoDBVYbrnby9xFq3ap/+OBFcc8rr9jGAt3JwakRN98SJGGLRVzOFwZV8AucR2AOmK08882mbLKa3fmf3GUqlgJwdhsqo/LEirI+3Pp3GFex6jxvxgwcaMU4vIBp8ukL5mF9Omc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779778941; c=relaxed/simple;
	bh=rujUh5Ut6oPOabJnGcn1GF5k5obYcmy9s1UpjRE6Wgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GW+Es23BwlxK5JbXOi+/8dwaDgXEZjXZibmByZVK0sV3GqboDe8eKK7qWzs2NKr+APE3fQWZwgcKowdAJQxlWCpv37a+hmol4Th2DsOJ8NWzJEaUq1QGW4MqVAEY/04AulfvwUjR3eF5AdiN5gC5YiWW7y+AM5twpzgFlOcrgzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=n6Wpwd2s; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="n6Wpwd2s"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779778928; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=B2RyETC0kQGsnsb3JDp2E8kaJbLCfy4Y1i2HQNE/6+Q=;
	b=n6Wpwd2slCt3l5fDC6kAHhtk8G7o7+4hBWCxKoYEzMnPbTIjsA9x3atlTo3XAH1gQB4fUjsM1yh+A7oND9c1m0+pv9MnoMCtVehZPQaYKffp4ncGhFaReys/G3PK6/6cxPLBxTtaF+Am1p7MU1jHTNeOVyixZb1dH4lxedZTxPY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R981e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0X3fNXgI_1779778926;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X3fNXgI_1779778926 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 26 May 2026 15:02:07 +0800
Date: Tue, 26 May 2026 15:02:05 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: kernel test robot <lkp@intel.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v1] arch_topology: Introduce nr_possible_packages
Message-ID: <ahVFbd_O1W44lUXd@U-2FWC9VHC-2323.local>
References: <20260515144435.93035-1-feng.tang@linux.alibaba.com>
 <202605161935.1SnObrFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202605161935.1SnObrFu-lkp@intel.com>

On Sat, May 16, 2026 at 07:46:10PM +0800, kernel test robot wrote:
> Hi Feng,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on driver-core/driver-core-testing]
> [also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v7.1-rc3 next-20260508]
> [cannot apply to linux-review/Feng-Tang/arch_topology-Introduce-nr_possible_packages/20260514-094659]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/arch_topology-Introduce-nr_possible_packages/20260515-230156
> base:   driver-core/driver-core-testing
> patch link:    https://lore.kernel.org/r/20260515144435.93035-1-feng.tang%40linux.alibaba.com
> patch subject: [PATCH v1] arch_topology: Introduce nr_possible_packages
> config: parisc-randconfig-r122-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161935.1SnObrFu-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 13.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161935.1SnObrFu-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605161935.1SnObrFu-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/base/arch_topology.c:841:1: sparse: sparse: symbol 'package_id_mask' was not declared. Should it be static?

Thanks for the report! will fix this warning in the next version.

- Feng
> 
> vim +/package_id_mask +841 drivers/base/arch_topology.c
> 
>    835	
>    836	/*
>    837	 * Assuming silicon has a sane package ID decoding method to not have
>    838	 * an ID bigger than 2047
>    839	 */
>    840	#define MAX_PACKAGE_ID	2047
>  > 841	DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
>    842	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
