Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864115;
	b=sgQWyfug2w4oBPCyjB7yJFmTNJZjRs3SSGhAtrDZrbHU+KM7r15h9kk0/GGPML4en4+f
	 8I0li6+LyqAdco2zHwhCIubPlUoX2YcQmq+PpoNEF4rM5Wz+DoNttAQttxED2hEhkOcRf
	 ghhQikbkOJMpxIlC6gHJLFu5VIouFaehypGoVX0Ed+LhxvCdt1/EIPBNxxIhxxmY47C8/
	 DnR183ds0RUoSUrJfugiIpqY9ldNjVOVNvKdYbugtC11t3sSQOK70MA7ogp1Ne+A3DQdq
	 MjFyv6WBEy+0zPcQ0J3+/I0mIVCLqqMI4qllAnia+mfVz8iukUpQLn3YkUgWqHW+fIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fJrSMcznO+jXm0R/Gb4sVutzbYoC421vKFMchCji1M8=;
	b=Wvpu2cj9zB9SMezU1dljyNpEesj7JsoNEKyMESCaImQnumUXM29qArr71KL2z6/WnzKb
	 1nIXRVog6C5AfcgMY8v5BXsuyHcR4YGDidNe/KMg7Fz1F6ADviQ8TBY1YAr+6xSV1oaj4
	 HCKYW9gidjTtwOHwsxW2hb7W41nWqp8OixfZ50M62v69GcE1/jQHudYaZaEh2RQUK9vBL
	 pVu3UAtlO3ub4I9hbmXoO0XY08XiUv6iMlcXdBY3MZZqHEYfEJyNK/fSDODrejS/c+65+
	 gvn5uigicGw4a7jjIqZ6OBfZT3TWe1jexNHZjI4KZdRlrr++UuCwiduGTdTOgQS348w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMdqqgJ1;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5F7606A326;
	Thu,  5 Nov 2026 07:35:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5F7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mMdqqgJ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793864114; x=1825400114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FfPBMUOPLe/QDkESDBHjFZFt+ydwEnQtH3CnagBhAQ=;
  b=mMdqqgJ17Hm4OBGhcDS3oX0BE+t49VRKfRoSoxzEcrCj2+ipynCXUZP3
   RqAvVn/RGtMCEd8PqEY3k0DsqJECn1V1XBKAStUiqgOLPHxVLEIfgnIaq
   NQILUriG4m6tvyORDaLf4VLirbUV97TZqLgWsAYH9vxqkjDSV1r23fouW
   rIhwSTptTaryYC/pOQ/r+NSQq0koQLYdl0VsswLAz1b5iu74V9aY6+wSN
   tZ6XqEfN3CYBQZMDAZYhgnO+77WRl1kSuiXVZwo5UaldqWiRthERRzs/m
   gQb9BEZa9D6EERHXB1ikRvmMGd74QdRMD/ud8jJlao7NduurDoPAKIRm1
   g==;
X-CSE-ConnectionGUID: grjPzFmJR1ip9AWLXF/71Q==
X-CSE-MsgGUID: l8lpab/GRIKEZ1KJzZKKJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2676548"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2676548"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 23:35:13 -0800
X-CSE-ConnectionGUID: tLiMaRPcTziaRantES99tA==
X-CSE-MsgGUID: o10u2ZxSSZmlxdEUbRPtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7099548"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2026 23:35:06 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOs00-00000000lrT-0h1L;
	Thu, 05 Nov 2026 07:35:04 +0000
Date: Thu, 5 Nov 2026 15:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kees Cook <kees@kernel.org>, Len Brown <lenb@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 9/9] gpio: shared: generalize most code to firmware nodes
Message-ID: <202611051523.HtiYeAbK-lkp@intel.com>
References: <20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4@oss.qualcomm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4@oss.qualcomm.com>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/device-property-fix-fwnode_name_eq-for-empty-node-names/20261104-150343
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261104-fwnode-for-each-prop-v1-9-6e28fe1c72c4%40oss.qualcomm.com
patch subject: [PATCH 9/9] gpio: shared: generalize most code to firmware nodes
config: sh-randconfig-1001-20261105 (https://download.01.org/0day-ci/archive/20261105/202611051523.HtiYeAbK-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051523.HtiYeAbK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051523.HtiYeAbK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpiolib-shared.c:300:12: warning: 'gpio_shared_fwnode_traverse' defined but not used [-Wunused-function]
     300 | static int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   Assembler messages:
   {standard input}:165: Error: offset to unaligned destination
   {standard input}:477: Error: offset to unaligned destination


vim +/gpio_shared_fwnode_traverse +300 drivers/gpio/gpiolib-shared.c

   299	
 > 300	static int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
   301	{
   302		int ret;
   303	
   304		if (gpio_shared_fwnode_ignore(curr))
   305			return 0;
   306	
   307		ret = gpio_shared_fwnode_scan_properties(curr);
   308		if (ret)
   309			return ret;
   310	
   311		fwnode_for_each_child_node_scoped(curr, child) {
   312			ret = gpio_shared_fwnode_traverse(child);
   313			if (ret)
   314				return ret;
   315		}
   316	
   317		return 0;
   318	}
   319	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
