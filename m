Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F20B388363
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778665612; cv=none; b=PS6G3pjJfh+R7KlO7FhJQA3KFUrvvpC0ooBXydrVKALip7d8aJ7At2LOJ0IaJUHaGitGsR0WoIvwDkseWw+qhEybOPxKARIny5UjHuJFr1BW/UujTLVrdO/9datZvDEdyuKJGdKVvjZcPL44fLi6tH+5eBQMVIKEokjJFg3p2Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778665612; c=relaxed/simple;
	bh=4cVrELoKgliQixmbiGLXq+TPi6bnZ+Pc7JhU4X8N52I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROKtcebGFlt/pPwhIVG2KV7D8jzo29KazG8R0c5bKNF4MP8PMot1F3rhYhw6LK3BZyw9d2/eCiueP+N+3YmEIbpu1lCdFEekGvDGL2nJRVnA/tJcWwvVstF5YqDJ25M1jmzxk7OMY3MwHTLCNhHmCoA1WavBhoQwP6C1ZycCDmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=p/utiWlV; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="p/utiWlV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778665595; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=YJtUFTd6iY9ZibaH/hP7Zb3krsqEIIG+g+nc3BLdIVw=;
	b=p/utiWlVyxBwphTS6guN0Q418NIe7ZYj6FNoQTd56ICfYoXCX+paD/+Bs3fxLAOe3Wu2Fh4Gdl9rRmnyrAOTKlOKc8Rxa8I3BHFI2ew3NMg/AqgB2NMWY+dTO4IapKQNscakBpig9MUUkCz7Um46pUf/Welo9vPJWB8poz5zZdM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X2tYYpP_1778665593;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X2tYYpP_1778665593 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 13 May 2026 17:46:34 +0800
Date: Wed, 13 May 2026 17:46:33 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH RFC] arch_topology: Introduce nr_possible_packages
Message-ID: <agRIebOKjDEe8Kmi@U-2FWC9VHC-2323.local>
References: <20260512150505.43871-1-feng.tang@linux.alibaba.com>
 <2026051214-supermom-brim-4608@gregkh>
 <agPVYkyVMcUye3cn@U-2FWC9VHC-2323.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <agPVYkyVMcUye3cn@U-2FWC9VHC-2323.local>

On Wed, May 13, 2026 at 09:35:30AM +0800, Feng Tang wrote:
[...] 
> > And you don't have a user for this, so we can't verify how it actually
> > works :(
> 
> Good point. Internally we have some PMU driver using this, but the HW is
> not public and the drive hasn't been posted yet.
> 
> As for validation, we tested on production 1P platform, internal 2P
> platform, and QEMU's multi-socket case.
> 
> I checked a production arm64 2P platform 'Kunpeng 920', and from the
> output of "cat /sys/devices/system/cpu/cpu*/topology/physical_package_id",
> the patch should work fine. I don't have root right of it yet, will try
> to really run the patch on it.

Just tried 7.1-rc3 + this patch on the 2P arm64 'Kunpeng 920' server, and
it showed the correct package number:

"[    0.011284] ACPI: System has 2 Package(s) detected"

Thanks,
Feng
