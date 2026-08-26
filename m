Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D18D302146
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 07:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787728683; cv=none; b=iu4oCPM+FqhQmOoIJ8I1THLG5EV5dQYeYohIbcrE1CjZnKFVPgVD34IBzKL23atVEDubUsdQl7TrHN3+JEPMgMa4kDHIW1qkh1FWSiV6k9MWHUPEa6SHJQjiN//4pvbqP2K8OKPkrFPRq2Isxbfmk2NgECGs9Nq3xzGk9BKvhtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787728683; c=relaxed/simple;
	bh=uzxxyks2ToEzwNXkuyUgwmSloH8uK4bfgsIFGVs2mKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvBM4+Gekc7WFXN0A/EveSKTl5TNhl/MogxJxOvFmahW5RG2N58vcQkZRQ1iAS8N0LGfMahAwnoX8ri7U29kzXMsZ+jZtozaxY0vwF5TmymJlrJ3BgkyPIeD9Admg+yUcmrito/h+3oV1jvoUSzL7/LH1bTSMqVmxuinXsbl8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxYNtrR1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxYNtrR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787728682; x=1819264682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uzxxyks2ToEzwNXkuyUgwmSloH8uK4bfgsIFGVs2mKE=;
  b=NxYNtrR14dq5tAS5vKC45jmo5YlMTNtVdg4t/elsXFWbXKPIASU3+huh
   cVn2Lsd9wzBGm27xURje0oWDs1g3wybZyGnVhBT38t7CQVJsSyUmkeNnX
   N6Sn7rSPb+DCYBsei2Yhsw2wbyVhi9/L20l/ZteIpZV8Oqclvl0BTjyFA
   igfpv5nU18zzki1NGSrG+3A9vGMTq2e4iYzysi+ZSdj9VVDFHkQOgMrRV
   zhwcWOG/QrpbI7Xr5NNso9A7XhICH+yPxKF25IS/OjuDcU7QGRK4T1QBD
   nT9vRbBdqNcd7aaW2UHYylrXsKhNvZYCGsgKLsDqU4flfOcwRVPWIr0w3
   g==;
X-CSE-ConnectionGUID: aiS2WyvWQqmvYHWZsf1Jew==
X-CSE-MsgGUID: kc5XJKXRT4+CdJUTFDs9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="91884992"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="91884992"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 00:18:01 -0700
X-CSE-ConnectionGUID: jS2OywpoSzSvnYiIJQcP5Q==
X-CSE-MsgGUID: tM+nmQEuShC5Q7A177P1Eg==
X-ExtLoop1: 1
Received: from tester.sh.intel.com ([10.112.106.126])
  by fmviesa003.fm.intel.com with ESMTP; 26 Aug 2026 00:17:59 -0700
From: Tao Yu <tao1.yu@intel.com>
To: gregkh@linuxfoundation.org
Cc: akpm@linux-foundation.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com,
	tao1.yu@intel.com
Subject: Re: [PATCH] kobject: avoid blocking allocation while holding uevent_sock_mutex
Date: Wed, 26 Aug 2026 15:17:58 +0800
Message-Id: <reply-20260826-kobject-uevent-v1@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026082632-sports-cattail-a5b0@gregkh>
References: <20260826064633.589258-1-tao1.yu@intel.com> <2026082632-sports-cattail-a5b0@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks for the review.

Nothing changed in USB enumeration itself. What syzbot appears to be
hitting is a long-standing latency problem in the untagged uevent path,
not a recent USB-specific regression.

The blocked task is in:

  usb_set_configuration()
    -> device_add()
    -> kobject_uevent_env()
    -> uevent_net_broadcast_untagged()

so the contention point is the global untagged-uevent broadcast path in
lib/kobject_uevent.c.

Looking at the history, the locked allocation/broadcast pattern appears
to date back to 16dff336b33d ("kobject: add kobject_uevent_net_broadcast()").
Because of that, I did not add a Fixes tag or cc stable in v1. I do not
have evidence that this is a recent regression, so I would rather not
add those tags without a stronger justification.

You are also right about the race in my listener pre-check. A listener
can appear after the first unlock, so that part of v1 is not correct.
I will drop that approach in the next revision.

I also should have included the syzbot link and testing details. The
report is here:
https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba

syzbot has now tested the proposed patch and reported that the
reproducer did not trigger the issue:
https://groups.google.com/g/syzkaller-bugs/c/q6wmyA-hG6E/m/rLDsbLC-AQAJ

So the patch now has:
Tested-by: syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com

I also compile-tested it with:
  make lib/kobject_uevent.o

Given the race in v1, I will respin this as a narrower fix and include
the proper Link/Tested-by information.

Thanks,
Tao
