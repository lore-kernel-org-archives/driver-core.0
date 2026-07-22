Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EB33B47D0
	for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 06:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784703057; cv=none; b=Fa7XeEhB0h0WirwZs1XrCd8n3CEiKTSX/w86lndryJwRPSyIwTMRr7L4yL8fc2bjGxzDwDkce8+Q5TOInSLMez8pSLtOKLIqOBk9GPoJNSrkyC8FBxkA9pkSH7yG18osZ1mkvIYY1XkjtQf/ODqKuJUtDG8r8Zrd/if1WvFmo+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784703057; c=relaxed/simple;
	bh=KON5tFLmBE6kg+cfbwf2drQi2w6GcER5WT1msugwsd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+vdjAcbEMbly8RQkkYcscnkGyFcI10wf8Cgr1VtN94w3GAR1SVpe9oX4743UZd+/s5KavRb8JUYB9vK73oogifDcwnXQ/W6vP4WL5pbR4R73ZEnS7Vf1GpsSmxO99edYRiRExLUzmzx6NesefkQaTSL7jrNXdiG1svnf8SdfqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=BmtXQ6S6; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="BmtXQ6S6"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784703050; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=a7ypzn2Izv8iRYbp4DsKc0tIVIBC++/123/zDrXzj30=;
	b=BmtXQ6S6AcRQs3gRdZqd2tF6DvG0VtedBMzjgqH3yP0s65JGZHrjaMOMJBtq+S/Z7ssrEQRPmjzGH+tqYVewvjnwETTXqimSqQFPOMecz5UyVPrkYT2TgTcIcp6C3eknaIpMWc4SotqrN5pwEdH/CYWkDdQ5F8JRZqocbQwPNDo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X7cR-9p_1784703048;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X7cR-9p_1784703048 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 22 Jul 2026 14:50:49 +0800
Date: Wed, 22 Jul 2026 14:50:48 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] arch_topology: Introduce nr_possible_packages
Message-ID: <amBoSHYWpt2jbjGr@U-2FWC9VHC-2323.local>
References: <20260714054317.73219-1-feng.tang@linux.alibaba.com>
 <20260721-armored-lion-of-pluck-9fc8a0@sudeepholla>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260721-armored-lion-of-pluck-9fc8a0@sudeepholla>

On Tue, Jul 21, 2026 at 03:32:03PM +0100, Sudeep Holla wrote:
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
> > 
> > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > ---
> >   since v1:
> >       * fix the potential overflow issue for 32b package ID (Sudeep)
> > 	  * add real use case in commit log (Sudeep)
> > 
> >   since RFC:
> >       * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)
> 
> This is undone in this version, why ?
> 
> > 	  * change the possible max package ID to 2047 (Greg)
> > 	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)
> 
> Again this is still there, misleading or v2 is back to RFC, /me confused.

Thanks for the review!

My fault! that I messed up with the locally saved RFC and V1 patch. I was
focusing on fixing the problems you mentioned.

> > 
> >   v1:  https://lore.kernel.org/lkml/20260515144435.93035-1-feng.tang@linux.alibaba.com/ 
> 
> Comments about users is still ignored.

I described the user case in commit log of this version. It was
locally used by several drivers and other code, maybe I should
repost it together with those code.

btw, is there any problem with the new package accounting code?  

Thanks,
Feng

> -- 
> Regards,
> Sudeep
> 
> P.S.: Please avoid personal pings as it will not gain attention from other
> interested parties.
