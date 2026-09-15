Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CC3A16AB
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 20:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504471; cv=none; b=IqbktJR/Qjqjowf5vtqA9+jsWPwr1Ktu/xOjFxxQvuTWMzs3xm/GepMTh9I7VqJ/loW3W0tXe8Ne0gLXbGDnT1DU4JzeDLqnI6adN8ztUKKgoa6skN1FYOmO4X50HEZkr9+pDeJ08nFFDrqsvdcBA+mIhVkMShDnISjVVEYYy+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504471; c=relaxed/simple;
	bh=lkzMEfbId0rnBZ9mHvEDXRqhPKtVBsFzup7IU7HLZbs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=On8koxr0SDbtE815jUSyGsv5XcIC+aaQd8ghMMTS9174DcCLg+irqmXqZ6n8bbat8dR/mu6uF7tpSbrStltRvJ08/imeHH1+/Z++ESRIDImgHAnOStbHgi630wETKYuXheF/vgnOyM0AEVFtNaJReO/SQqOZkCTkX7mArZpTPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXWsty4c; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXWsty4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789504470; x=1821040470;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lkzMEfbId0rnBZ9mHvEDXRqhPKtVBsFzup7IU7HLZbs=;
  b=fXWsty4c/Lm0dIP/dsbALrj+bCT3Pp+nC7OQQCWgHOOL1KyMeXEzhFAo
   QCbKcPRzyF6QYw0OqKhvHBi4MUsDpDE2/SxWVsoq2RCN17vRA0aboR0RF
   3N3pWFk/+07etK/CgxuVquUnvFVl5jqbXTrQUWiyhNn3TWW7TstiGYNfw
   Ph/EvIoS8OBjFYcwB2zS1cPYIEAR5MPgPTzpjxKiReJj7UZxoNRRWBUvh
   dieQIruw+WqYl+eqJJj4ugSN1hNKUxtXRTnbAFDdc9CFdA+8OHv2YHp4+
   jzHfHq9eOKRu8ewvIGDpJnLYkBtugMi41qhau/j45iHE7N5F+GE/KsxN5
   Q==;
X-CSE-ConnectionGUID: pYtNHuBwT+2oyyM4vqzTgw==
X-CSE-MsgGUID: tf2S/bD0RTGf1sl1clu+Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89897446"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89897446"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:34:29 -0700
X-CSE-ConnectionGUID: ldhO4efFTkuS0zhxwjONMQ==
X-CSE-MsgGUID: KAE7iweJQcqwF3t/mLzjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="303007102"
Received: from unknown (HELO [10.241.243.185]) ([10.241.243.185])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 13:34:29 -0700
Message-ID: <7aed4a31e3608c0b7edae57edcb245c912ce5f92.camel@linux.intel.com>
Subject: Re: [PATCH v2] sched/cache: Refresh LLC capacity across CPU hotplug
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Davi Chaves Azevedo <davichazbh@gmail.com>, kprateek.nayak@amd.com
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Chen Yu <yu.c.chen@intel.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Valentin Schneider	 <vschneid@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  "Rafael J. Wysocki"	
 <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, chen.yu@linux.dev,
 	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Tue, 15 Sep 2026 13:34:28 -0700
In-Reply-To: <20260915175714.2015751-1-davichazbh@gmail.com>
References: <20260911220229.1368887-1-davichazbh@gmail.com>
	 <20260915175714.2015751-1-davichazbh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-09-15 at 14:57 -0300, Davi Chaves Azevedo wrote:
> Hi Prateek,
>=20
> Thanks for the review and testing. I've added both tags to my local patch=
,
> with no code changes.
>=20
> Tim, may I include your Reviewed-by?=C2=A0
>=20

Yes, you can add my Reviewed-by.

Tim

> Chenyu, may I include your Tested-by
> for the Ryzen and Xeon checks you reported too?
>=20
> Thanks,
> Davi
