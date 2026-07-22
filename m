Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6073E51D4;
	Wed, 22 Jul 2026 08:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709527; cv=none; b=cZOzWzoUHUoQmN487AgONVTo5ZwO8VISt0n/djeGAbd4gHFqtGWri60xSKKoM7vPH3zDM2nSrGDSBjAYsAgqFjZ+2Yyn7fx0lhTNF2UkUbDdav/szls9kdcc47mpfTnpc/yeRvURPOOCVqaQnhLWutclk/2djjE8jqUK1nMZ0ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709527; c=relaxed/simple;
	bh=gteBRVnb+x4jfZv+G5jdDN91Ku2guTTl11N4ccxCRL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tG25DJBviiyjqsXDz2z1kfhnXILlvCsj2fCtzZSMexc569RgbEYib/YdDR0WQ5huw+p9QM+P0AkQrUD3T22z6U3dl3cN5mOfjwcRlPUT0Wrp1DeOOMhqpsJ8EQrUCmPAXQW0T/p88fwQz6XGcNTsu9xnNtqjsrNoeWp6Ej9j4Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPjbywWa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPjbywWa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDA01F000E9;
	Wed, 22 Jul 2026 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709524;
	bh=Tw5y86rUnNqSLDY02Dg1MceFdM2uYoe73x4adqcJfek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lPjbywWaHUXWXnWdst4d3WvsKgtsb6dyXg/CG8KpuCILFjouC8yDpZ7RlR+oHmbm6
	 vXBoTUz0dqA8c5JUEA8OFSxtFAot854Q2x+XwPzhJFI/tUDaxJIKhpEh+cYrCJnvmG
	 LGHIsfEuW/jTG4bNWUfCaC0w04nCfCoWZy74VGu/Yr3awhLU3J66xCieGfA0tXGPGi
	 u9ZovCYLm6YhM3h+IKEpY7NfqjxYRAjgvsP6rTJWU1wNjNLHwrf4HSY1P55niiJ6ru
	 8es1U5yIjg9bGVEHsAettP6XoCFzXiHgKlywoBw83ehguxRCrRgmWRi6G863mjGMuR
	 Ej8dlwYBMCOXg==
Date: Wed, 22 Jul 2026 09:38:40 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] arch_topology: Introduce nr_possible_packages
Message-ID: <20260722-humble-excellent-hawk-44fa4b@sudeepholla>
References: <20260714054317.73219-1-feng.tang@linux.alibaba.com>
 <20260721-armored-lion-of-pluck-9fc8a0@sudeepholla>
 <amBoSHYWpt2jbjGr@U-2FWC9VHC-2323.local>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amBoSHYWpt2jbjGr@U-2FWC9VHC-2323.local>

On Wed, Jul 22, 2026 at 02:50:48PM +0800, Feng Tang wrote:
> On Tue, Jul 21, 2026 at 03:32:03PM +0100, Sudeep Holla wrote:
> > On Tue, Jul 14, 2026 at 01:43:17PM +0800, Feng Tang wrote:
> > > For multi-sockets platforms kernel or driver code may need the number
> > > of packages to chose different code directions. Some architecture
> > > already provides such kind of interface like x86, which is being used
> > > in its architecture code and drivers.
> > > 
> > > Add similar interface 'nr_possible_packages' for platforms which can
> > > get package topology information by parsing ACPI tables in boot phase,
> > > which was verified to show the correct number of packages on some
> > > 1-socket and 2-sockets production arm64 servers from different vendors.
> > > 
> > > It has been used locally by some arm64 PMU driver, and cross-socket
> > > timer-consistency check code, which are to be posted.
> > > 
> > > Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> > > ---
> > >   since v1:
> > >       * fix the potential overflow issue for 32b package ID (Sudeep)
> > > 	  * add real use case in commit log (Sudeep)
> > > 
> > >   since RFC:
> > >       * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)
> > 
> > This is undone in this version, why ?
> > 
> > > 	  * change the possible max package ID to 2047 (Greg)
> > > 	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)
> > 
> > Again this is still there, misleading or v2 is back to RFC, /me confused.
> 
> Thanks for the review!
> 
> My fault! that I messed up with the locally saved RFC and V1 patch. I was
> focusing on fixing the problems you mentioned.
> 
> > > 
> > >   v1:  https://lore.kernel.org/lkml/20260515144435.93035-1-feng.tang@linux.alibaba.com/ 
> > 
> > Comments about users is still ignored.
> 
> I described the user case in commit log of this version. It was
> locally used by several drivers and other code, maybe I should
> repost it together with those code.
> 

Yes please.

> btw, is there any problem with the new package accounting code?  
> 

Depends on the users really, because it can be simplified based on the usage.

Regards,
Sudeep
