Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8293BB139;
	Tue, 26 May 2026 04:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779770100; cv=none; b=Tipj0zdRjXxIVAjIUyS7K5slpdIdUPNTqol6Hhhl0oOfJIhQZzzZZfALhsFShWKrZCfIkdRMhimwIc+qp59Crku59sdQnvM9YUQ89tguJyKgHpl15pExFcLs0V798gU9OtKOnFTrAdcmdz18dHlRqiavajhYivpYWEaJPGxsLck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779770100; c=relaxed/simple;
	bh=BQ1Ge8yYKRh7oYHsaoOYGjAr+3quMqiiMO3oVBDBQhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ub4Xh4Ft2LFIc2rprwUK/Jviw54+whc1wM7ct/bQRpeiv4viMfd/sFZE/HHrF6F3Rdq9r/c3RAM945QHd2DayM45pCQjFkn4SQwH5W0z+t+D1amTnqOlNQvawNy6peGFsmgRdHqp0F5CIUkruD5wdh003zwTmoi3R9JpKBKTNSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K5HSsx5k; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K5HSsx5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779770097; x=1811306097;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BQ1Ge8yYKRh7oYHsaoOYGjAr+3quMqiiMO3oVBDBQhA=;
  b=K5HSsx5kBWW+aQeAZAldBo9oGR7tWOHOqEeW+PIbxa5oK/Pu0DaKEH/T
   vcp1gp3v+UV1mfMeE5BAwCTTZxxEYDQJtxoQFBIYH2GkP2FoBE1cmbBsk
   27aH4UyscWubcTf+AZ/tOz+c4MZlJZOMedkh8U9f+L+iYxBfEiMd0ISTZ
   gRmwa8SBRjeFgEQZwEce5oftC0S9+r17AsHDnUTs7BhZbTcWBajZbTlaM
   zFi5qU0Vygui2mz43nzyGEXvPCnkNBF09A4yu17YsU0tLpdBhJQBH9lA5
   DU6M2rJ2adQi1iw5GTFPC05nzi2UILH2GYJGnQQmbKvZ/nMQXgC5+wY0f
   A==;
X-CSE-ConnectionGUID: VRbwPxWYQ8O6zPMtNQtViQ==
X-CSE-MsgGUID: N7tLzp0ZTKiL44DpdNj+pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80633123"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80633123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 21:34:56 -0700
X-CSE-ConnectionGUID: 9vuxCu3nTKSyzSwq5WyWmg==
X-CSE-MsgGUID: sLVSPEbPRwqEI9hw+5hcgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="246756023"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 May 2026 21:34:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRjV9-0000000027O-1m6w;
	Tue, 26 May 2026 04:34:47 +0000
Date: Tue, 26 May 2026 12:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mohamad Alsadhan <mo@sdhn.cc>, Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Tamir Duberstein <tamird@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mohamad Alsadhan <mo@sdhn.cc>,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] rust: replace `build_assert!` with `const_assert!`
Message-ID: <202605261249.YsIyj5Ye-lkp@intel.com>
References: <20260523122759.30317-1-mo@sdhn.cc>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523122759.30317-1-mo@sdhn.cc>

Hi Mohamad,

kernel test robot noticed the following build errors:

[auto build test ERROR on rust/xarray-next]
[cannot apply to rust/rust-next driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus tip/locking/core linus/master v7.1-rc5 next-20260525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohamad-Alsadhan/rust-replace-build_assert-with-const_assert/20260523-202931
base:   https://github.com/Rust-for-Linux/linux xarray-next
patch link:    https://lore.kernel.org/r/20260523122759.30317-1-mo%40sdhn.cc
patch subject: [PATCH RESEND] rust: replace `build_assert!` with `const_assert!`
config: x86_64-randconfig-161-20260526 (https://download.01.org/0day-ci/archive/20260526/202605261249.YsIyj5Ye-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261249.YsIyj5Ye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605261249.YsIyj5Ye-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::const_assert`
   --> rust/kernel/sync/locked_by.rs:6:5
   |
   6 | use crate::const_assert;
   |     ^^^^^^^------------
   |     |      |
   |     |      help: a similar name exists in the module: `kunit_assert`
   |     no `const_assert` in the root
--
>> error[E0432]: unresolved import `crate::const_assert`
   --> rust/kernel/xarray.rs:8:22
   |
   8 |     alloc, bindings, const_assert,
   |                      ^^^^^^^^^^^^
   |                      |
   |                      no `const_assert` in the root
   |                      help: a similar name exists in the module: `kunit_assert`
--
>> error: cannot find macro `const_assert` in this scope
   --> rust/kernel/list/arc.rs:254:9
   |
   254 |         const_assert!(ID != ID2);
   |         ^^^^^^^^^^^^
--
>> error: cannot find macro `const_assert` in this scope
   --> rust/kernel/i2c.rs:105:9
   |
   105 |         const_assert!(
   |         ^^^^^^^^^^^^
--
>> error: cannot find macro `const_assert` in this scope
   --> rust/kernel/dma.rs:386:9
   |
   386 |         const_assert!(
   |         ^^^^^^^^^^^^
--
>> warning: unused import: `mem::size_of`
   --> rust/kernel/sync/locked_by.rs:7:30
   |
   7 | use core::{cell::UnsafeCell, mem::size_of, ptr};
   |                              ^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
