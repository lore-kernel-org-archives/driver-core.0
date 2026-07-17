Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129D372664;
	Fri, 17 Jul 2026 05:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784265797; cv=none; b=bxGiLOI47f1gtSAeR1igMwjOpZtXAHWBEidaex/qiDgb8hPbi9UoevjN8FCO6TfJ7kA0UIu20As5qlfNx+Um7RyV2ZyGiM8nUaZ01i5PIZSUDWcreqBG9QvsZwks+axIH7mLd/hnFfcbIDrYJy59JqhM87VQ14D4WmjN+3BQWLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784265797; c=relaxed/simple;
	bh=el5060I9QBGLp3EGyZqdShQ7YMVwWTcU4AAL50LWxx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tmqNEiBHPtHSeiOgOkOEfcdJVPHSgBr6SBKsJjafF/M/EMAPaoVS9aIo4MQMgS3sEozXImJiJWdUpNaE3NW2YRSp7CG9pyHlzHW3MUJf2ekh5K2ArFhXoVrpKASjqZHgs6u1uDcxxyLl/KBCTN7uL0fYErypRa85LvlcJUo+5tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QX4gk/kU; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QX4gk/kU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784265795; x=1815801795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=el5060I9QBGLp3EGyZqdShQ7YMVwWTcU4AAL50LWxx4=;
  b=QX4gk/kUCVXWExEFgjsbP0F5dtgzA0Tzs9aW5Li7SbhdTiVUt16I4cmp
   rAq1R1XH/sAubN4w9ZODwE6Zda7iM1Vs72yCFUF+8ypEmI6ega5cxAMqU
   ZplKU0Jns8PGQ3CqlPGbf24syXWBPqCrs0r2AnIngE2e+bxGwqN+aqlfO
   fz1OUUT3mfFsHYJHSJ2MWBKvixE5Xg/LBQFYzfBBBJBI9WJd4PUJtdhf3
   DW/qjrtO+P+B+t9K/+bfFdWPbKj31VazIf+Ro8sEJJUgOYfDcfzF+Y7mA
   wSh9oJwGoiJbrns0i37Yjo6js7aop/uxnKvUxKWK4kTA+M7gc299GEfEJ
   A==;
X-CSE-ConnectionGUID: jt5gCTATQ3K6e9Ya65NbGA==
X-CSE-MsgGUID: 6wLZrr6lS/yftWI6sbJmvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="95290537"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="95290537"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 22:23:14 -0700
X-CSE-ConnectionGUID: QEVpwawjRX2jnsK5yWqnKA==
X-CSE-MsgGUID: 7A1LMzjARN2Kha+Lbq+x8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="256766663"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 16 Jul 2026 22:23:11 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkb2S-000000005RV-08X2;
	Fri, 17 Jul 2026 05:23:08 +0000
Date: Fri, 17 Jul 2026 07:22:14 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Matthew Maurer <mmaurer@google.com>
Cc: oe-kbuild-all@lists.linux.dev, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] samples: rust: debugfs: fix excessive stack use
Message-ID: <202607170734.2N6biRuj-lkp@intel.com>
References: <20260716144144.3665719-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716144144.3665719-1-gary@kernel.org>

Hi Gary,

kernel test robot noticed the following build errors:

[auto build test ERROR on b8809969e1d7a591e0f49dd464a5d04b3cf02ab1]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/samples-rust-debugfs-fix-excessive-stack-use/20260717-053803
base:   b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
patch link:    https://lore.kernel.org/r/20260716144144.3665719-1-gary%40kernel.org
patch subject: [PATCH] samples: rust: debugfs: fix excessive stack use
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260717/202607170734.2N6biRuj-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607170734.2N6biRuj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607170734.2N6biRuj-lkp@intel.com/

All errors (new ones prefixed by >>):

   PATH=/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   INFO PATH=/opt/cross/rustc-1.96.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-22/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 12h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 -C source O=/kbuild/obj/consumer/x86_64-rhel-9.4-rust ARCH=x86_64 SHELL=/bin/bash rustfmtcheck 
   make: Entering directory '/kbuild/src'
   make[1]: Entering directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   Diff in rust/kernel/cpufreq.rs:792:
        }
    
        /// Driver's `adjust_perf` callback.
   -    fn adjust_perf(_policy: &mut Policy, _min_perf: usize, _target_perf: usize,
   -                   _max_perf: usize, _capacity: usize) {
   +    fn adjust_perf(
   +        _policy: &mut Policy,
   +        _min_perf: usize,
   +        _target_perf: usize,
   +        _max_perf: usize,
   +        _capacity: usize,
   +    ) {
            build_error!(VTABLE_DEFAULT_ERROR)
        }
    
   Diff in rust/kernel/cpufreq.rs:792:
        }
    
        /// Driver's `adjust_perf` callback.
   -    fn adjust_perf(_policy: &mut Policy, _min_perf: usize, _target_perf: usize,
   -                   _max_perf: usize, _capacity: usize) {
   +    fn adjust_perf(
   +        _policy: &mut Policy,
   +        _min_perf: usize,
   +        _target_perf: usize,
   +        _max_perf: usize,
   +        _capacity: usize,
   +    ) {
            build_error!(VTABLE_DEFAULT_ERROR)
        }
    
>> Diff in samples/rust/rust_debugfs_scoped.rs:75:
                GFP_KERNEL,
            )?;
        }
   -    let blob = KBox::pin_init(new_mutex!(pin_init::init_array_from_fn(|_| 0x42)), GFP_KERNEL)?;
   +    let blob = KBox::pin_init(
   +        new_mutex!(pin_init::init_array_from_fn(|_| 0x42)),
   +        GFP_KERNEL,
   +    )?;
    
        let scope = KBox::pin_init(
            mod_data.device_dir.scope(
   make[2]: *** [Makefile:2029: rustfmt] Error 123
   make[2]: Target 'rustfmtcheck' not remade because of errors.
   make[1]: Leaving directory '/kbuild/obj/consumer/x86_64-rhel-9.4-rust'
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'rustfmtcheck' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'rustfmtcheck' not remade because of errors.
   make: Leaving directory '/kbuild/src'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
