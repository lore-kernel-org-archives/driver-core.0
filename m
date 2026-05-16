Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14293DA5B0;
	Sat, 16 May 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932002; cv=none; b=T7/bE6hA/UpJB+BFVXF7DWQwaMxHWtgR1OsuE7Pzk6tpR8ajtU3ksDiuP6DNPtlsH6AG7+ULlW0SiRiPFP3cldnr/s9WS/Vd8tQ/r0QfCLPzt8UJixyTlxMN50MLWT7osnXF05aQM6MfmA39iACVxREEAc1Zbt/SUdAa+KgCBig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932002; c=relaxed/simple;
	bh=t6HOHufvECaSv8A+/IS5zrPHSBmzIcTD6wF0m1l3K18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVXUTkCVAL+klnyu8umKRpRdARjG4yfcwE79pL+cLRPldlva0BF7G13foLaHTFx+T285nlodRmM/YI6TuXIDn8tONXlmubD1SDGy9RdBphI6DlmdpimQ4kgBRAfGtassbBE8ybxo5ZP3Lqj6z/sKO0wxmTDY+Nhkp843kf6dVvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lOWDf2lO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lOWDf2lO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778932000; x=1810468000;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t6HOHufvECaSv8A+/IS5zrPHSBmzIcTD6wF0m1l3K18=;
  b=lOWDf2lOB5cnyI8YDL77u24XMaosgPNfqYjQiwUqYaltR0sKObRDBlqq
   chx4UXhkgd4lVQfX9QX3JmZAVD1/v+SQIKH647NKh9E5pzpgoNayAmTG4
   Tq5ik/pktlPqzzuDCsJ2ZLZ6Ig6oTAGkP6sbUJpvoRzrzYrUH7mH13S+M
   KhyUXlmT+Wz22+uTStYpDXmm0ezBEubhIrcL0ySDRXhvbbvJqqiPMd8U3
   Xh/KTlUCCmjpNpfHCSkPtjBVaqsCD1SA+TPAtVrebG54nf6ytHSyNIVmy
   g7NVJYglfafxPyVYQIV2veo3LLWQpHRVa5rdHb+00EBqicv4aMPzJvie3
   w==;
X-CSE-ConnectionGUID: miWWAWhQTYy9hWQ04ljTCw==
X-CSE-MsgGUID: OHRUbtT+STGoy15qtJ8i/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="67394075"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="67394075"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 04:46:38 -0700
X-CSE-ConnectionGUID: hJpzaZZfTWmrLT6MXSu4fQ==
X-CSE-MsgGUID: YhgtzyK4Q/Ow3t45XSUfpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="238084381"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 May 2026 04:46:35 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wODTU-000000000mM-2NxV;
	Sat, 16 May 2026 11:46:32 +0000
Date: Sat, 16 May 2026 19:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Tang <feng.tang@linux.alibaba.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: Re: [PATCH v1] arch_topology: Introduce nr_possible_packages
Message-ID: <202605161935.1SnObrFu-lkp@intel.com>
References: <20260515144435.93035-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515144435.93035-1-feng.tang@linux.alibaba.com>

Hi Feng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on driver-core/driver-core-testing]
[also build test WARNING on driver-core/driver-core-next driver-core/driver-core-linus linus/master v7.1-rc3 next-20260508]
[cannot apply to linux-review/Feng-Tang/arch_topology-Introduce-nr_possible_packages/20260514-094659]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/arch_topology-Introduce-nr_possible_packages/20260515-230156
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20260515144435.93035-1-feng.tang%40linux.alibaba.com
patch subject: [PATCH v1] arch_topology: Introduce nr_possible_packages
config: parisc-randconfig-r122-20260516 (https://download.01.org/0day-ci/archive/20260516/202605161935.1SnObrFu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161935.1SnObrFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605161935.1SnObrFu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/arch_topology.c:841:1: sparse: sparse: symbol 'package_id_mask' was not declared. Should it be static?

vim +/package_id_mask +841 drivers/base/arch_topology.c

   835	
   836	/*
   837	 * Assuming silicon has a sane package ID decoding method to not have
   838	 * an ID bigger than 2047
   839	 */
   840	#define MAX_PACKAGE_ID	2047
 > 841	DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
   842	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
