Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB7932939C;
	Wed, 18 Feb 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422602; cv=none; b=R3YChaMYEp+fsN3tuMSTVo+ccDYJfE/YD/7WBitJu8UJYkvM7wOphpCRrtatFYg7FMxu1PqmNvDnvDsaaKrafX8QQX4QevI0Fu6Rz0VxaILZrzOP+X3c2f3PdGDsn+x5crSu9uZS1WEIFa2P/tKL5EhCPeKJTwSPWKY56QB/m9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422602; c=relaxed/simple;
	bh=W31iI7LLVILK7kkuE1ElHWcjo1PB1NNAmLYxWimCXC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uy/O10mLzT2y4CfeucyqE0Pc8aTQmM3wvYfiSKSLA84vSqILxgtgvRcShjDPpaRxITnlWfzyNwb0hDjIlNZw7f9AfLpYCBs5gT9XEaPS5jjE4+zGnJRTa3yJ+TPY8fQUj4nuv4MPU+Bz91c9kx9Kfw5bCDkF3xf+H+9jYl/TocI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V81VYmWP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V81VYmWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771422601; x=1802958601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W31iI7LLVILK7kkuE1ElHWcjo1PB1NNAmLYxWimCXC8=;
  b=V81VYmWPQDw2QkAjhlVRF6fp9XVk9BEIEzCeaz6ApCrcc18NuKB8HV36
   L5wo5wiFyeEin9YMBRFXKk1E6dn53yYAbLdQJaqMkGVmPUMc5g7D9fKXo
   kECOiyl5xRHRGmxqgEf0ylZiSu8JIstAJ/0u1nywUhUNHdDvaRQgNelHd
   hMgo+HAevaNMXpdbUmWZXzNkO7EoI7ApnYWHUF8e5liJzwUF0nCpGarSX
   L9r3zXOztEBm0aLP52XUE15oM3jdN4ZXznA4cmYtFIYbUOCfnym8/sD95
   /kCZi/0ngysZzWh7okvuB9oGut/kqPYn8EBDfae0QiFbB6BIIst61MWQN
   Q==;
X-CSE-ConnectionGUID: nw1xUfuXSQupm3SZqcywgg==
X-CSE-MsgGUID: 8OLPrpRGTDSzfMxrmAOJTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="83120856"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83120856"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 05:49:57 -0800
X-CSE-ConnectionGUID: ZD8PmMrXRNyK6JJMyH8kfw==
X-CSE-MsgGUID: IULIxgMpT5WculU9T9y3Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="218040471"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Feb 2026 05:49:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vshw7-000000012Oo-1N5a;
	Wed, 18 Feb 2026 13:49:51 +0000
Date: Wed, 18 Feb 2026 21:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, sherry.sun@nxp.com,
	driver-core@lists.linux.dev,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] PCI: Add support for PCIe WAKE# interrupt
Message-ID: <202602182100.CSUJWXc8-lkp@intel.com>
References: <20260218-wakeirq_support-v7-3-0d4689830207@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-wakeirq_support-v7-3-0d4689830207@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build errors:

[auto build test ERROR on cee73b1e840c154f64ace682cb477c1ae2e29cc4]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PM-sleep-wakeirq-Add-support-for-dedicated-shared-wake-IRQ-setup/20260218-162247
base:   cee73b1e840c154f64ace682cb477c1ae2e29cc4
patch link:    https://lore.kernel.org/r/20260218-wakeirq_support-v7-3-0d4689830207%40oss.qualcomm.com
patch subject: [PATCH v7 3/3] PCI: Add support for PCIe WAKE# interrupt
config: sparc-randconfig-001-20260218 (https://download.01.org/0day-ci/archive/20260218/202602182100.CSUJWXc8-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182100.CSUJWXc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182100.CSUJWXc8-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/pci/pci.o: in function `platform_pci_configure_wake':
>> pci.c:(.text+0x5d0c): undefined reference to `pci_configure_of_wake_gpio'
   sparc64-linux-ld: drivers/pci/pci.o: in function `platform_pci_remove_wake':
>> pci.c:(.text+0x5d4c): undefined reference to `pci_remove_of_wake_gpio'
   sparc64-linux-ld: drivers/pci/endpoint/functions/pci-epf-test.o: in function `pci_epf_test_add_cfs':
   pci-epf-test.c:(.text+0xec): undefined reference to `config_group_init_type_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
