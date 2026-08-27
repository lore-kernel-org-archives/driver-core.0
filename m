Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA54D2F5A36
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 12:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787834044; cv=none; b=MVK+uJgSdj8IbWVQOSA+4BLzlPOGE4+NvzWC/ywr/1/thmH63VaqeWOCYewUShiEdXUGcmpgtSnH2bI6hNkhfpeVwGH9f0TdcHcl2JpgIzpqRAqFd12Gttttn49STQaB0KS3YbGlXpIMdEsehIraGNYFyA75cvpi9B48vJ/M8KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787834044; c=relaxed/simple;
	bh=mY3Eav+LjuHZMwXDTdn++FZAjJ/U1MT/NAZX93Cyy4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhCXaK0pZCEEWh5N/9gwWr3+hY6KRCPecrOosxDX5d40virK7mPevvxpJfC3LLwSmqu9M/bWgGbLChoYiC+usGGFvsiugF6lcwN/RZAIlbrqsQhPkUJy3Hxm1ptY75LBHzDKfDA8Ss0oL7Pjcfp3g0LLne1QlfOMQbkJKBcJfZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OsFUMBHE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OsFUMBHE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4401169E;
	Thu, 27 Aug 2026 05:33:57 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD2EF3F85F;
	Thu, 27 Aug 2026 05:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787834041; bh=mY3Eav+LjuHZMwXDTdn++FZAjJ/U1MT/NAZX93Cyy4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsFUMBHEaz0MEEtpQe2t/mV0Bh0yAMbABVuevsnZfzq2jdkZC7jCmm1dBlOs17pWq
	 WZ55pKQ6caopkWdxmTSrDDeBrXYHU+P0eoZQCtRXzYJLjqvkMAgpWZVClF0upnWdGN
	 Y8BmeN/1xOQ58RPN8/J1H5NGvzOTt1q3snNZ/ufo=
Date: Thu, 27 Aug 2026 14:33:50 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Xuewen Yan <xuewen.yan94@gmail.com>
Cc: Sean Wang1 <seanwang1@lenovo.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <apAurrE3JOpM3wE0@arm.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
 <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com>
 <aoX_jiuhv3dyMS-g@arm.com>
 <CAB8ipk_4Zbhb=azTDGQEQ1S=n2Zhzvqs7pYr6ZfOOWL8meE_4Q@mail.gmail.com>
 <ao_9EiKz9Cmx_YHh@arm.com>
 <CAB8ipk9KknqBFeQrDYXAqRxGbM_bjtU0w7Jid95XucnzkgUdkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAB8ipk9KknqBFeQrDYXAqRxGbM_bjtU0w7Jid95XucnzkgUdkg@mail.gmail.com>

On Thu, Aug 27, 2026 at 05:11:28PM +0800, Xuewen Yan wrote:
> On Thu, Aug 27, 2026 at 5:02 PM Beata Michalska <beata.michalska@arm.com> wrote:
> >
> > On Mon, Aug 24, 2026 at 05:21:03PM +0800, Xuewen Yan wrote:
> > > On Thu, Aug 20, 2026 at 3:11 AM Beata Michalska <beata.michalska@arm.com> wrote:
> > > >
> > > Should we distinguish between events?
> > We could although for this particular issue clearing the source is the one that
> > needs attention. But I do not see why we could not have both.
> > This was just sharing the idea, not a final patch.
> > >
> > > > ---
> > > >
> > > > This is just a rough idea, and needs ironing out the wrinkles, which are there,
> > > > but that allows leaving the idle enter as is. I also believe this is the right
> > > > approach for the interface itself, although I also see some drawbacks and
> > > > potential issues (in its current state), especially that the functionality is
> > > > being exposed to modules.
> > > > Nevertheless, those are my two cents, untested, just sketched.
> > >
> > > As an aside, could we verify the functionality of the AMU's
> > > SYS_AMEVCNTR0_CONST_EL0 in the current CPU before enabling amu_file?
> > > To my knowledge, many chips currently have inaccurate errata in this counter.
> > > Alternatively, could we introduce a command line that allows users to
> > > dynamically disable this feature?
> > >
> > > Thanks!
> > Do you have any particular issue in mind ?
> > So far, from what I have been able to track, the issues reported are either
> > handled by existing erratum or by the latest change that reads the counters in
> > 'one go'. Can you share the details of the issue you are facing ?
> > That would be helpful in potentially finding the right solution.
> 
> For example:
> There is an A725 errata:
> [A725]The CNT_CYCLES event can have a significant increment error due to WFE/WFI
> Status
> Fault type: Programmer Category B
> Fault status: Present in r0p0, r0p1, and r0p2. Open.
> ......
> Workaround
> There is no workaround.

Right.
Will be sharing a patch for that one soon.

---
BR
Beata
> 
> Thanks!
> >
> > ---
> > BR
> > Beata
> >
