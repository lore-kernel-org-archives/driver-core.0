Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34245FFAC
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 08:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582591; cv=none; b=GZPTrMsvZ3uGFHob4iOk8dzV6nqMASbDkDqNhJdbccyIuC9e9J9GnDOpoKf0fYR35ceGDJf5aGTxxERXXQAhPuOvUd7ZIL1Ct7GpOEm/HeFRcv1fnwGbg0UBNv4bJcHaELgG68S5lATj198XKjPt6Hi2/Pef9ZVInjhKIdSNzVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582591; c=relaxed/simple;
	bh=u6pM4Q2lirOQrXvVOmhw6eCdvf86YRNbjnR3yNkFQzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQ/35zp7V2n8Q+Y/VDZ8XBkTZUI8aliC86iVFKmm7wRGKkFgk3Ge9wHU21Hq5rwUaOiXA9lQfJV/9ecE2esv/Lk3WW+FhB+RDMFydg80VK6D9F6sTPlAqHpJ1cDHoPcod5pc6SB+uyGkLxet0eD+3/w4vpwNgin8NlLhqyMZkFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vHcFwdui; arc=none smtp.client-ip=95.215.58.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vHcFwdui"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=u6pM4Q2lirOQrXvVOmhw6eCdvf86YRNbjnR3yNkFQzk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790582587; v=1; x=1791187387;
 b=vHcFwduiiYal6JFbD2brhtDRbI5W6UoliaoH0Gb0ZHRjEImeVNbTOKzwlabskqCOMdu4B9/r
 yuLhfXSm1Ni/Q2nzoL+dxswkwJ1spC/6XVyGX7IawflucwixqkfFYKA+Zt27+G7QBqikM9xGgc6
 QDVi0N5mVUf2hJw77wL2xQEs=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6cea94b206c11561;
	Mon, 28 Sep 2026 08:03:07 +0000
X-Mizu-Trace-ID: 6cea94b206c11561
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 16:01:16 +0800
From: Dave Young <ruirui.yang@linux.dev>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: David Carlier <devnexen@gmail.com>, akpm@linux-foundation.org,
	axelrasmussen@google.com, baohua@kernel.org,
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev,
	brendan.jackman@linux.dev, dakr@kernel.org,
	driver-core@lists.linux.dev, gregkh@linuxfoundation.org,
	hannes@cmpxchg.org, jan.kiszka@siemens.com, kasong@tencent.com,
	kbingham@kernel.org, liam@infradead.org, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com,
	osalvador@suse.de, qi.zheng@linux.dev, rafael@kernel.org,
	rppt@kernel.org, shakeel.butt@linux.dev, surenb@google.com,
	vbabka@kernel.org, weixugc@google.com, yuanchu@google.com,
	ziy@nvidia.com, devel@lists.crash-utility.osci.io,
	kexec@lists.infradead.org
Subject: Re: [PATCH v2 10/13] mm/sparse: remove SECTION_MARKED_PRESENT
Message-ID: <aroezLexo1WoeYI7@darkstar>
References: <20260921-b4-sparsemem_cleanups-v2-10-54d81d65e125@kernel.org>
 <20260927192013.144672-1-devnexen@gmail.com>
 <655c509e-318f-48bc-8183-2b1274dd05ac@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655c509e-318f-48bc-8183-2b1274dd05ac@kernel.org>

Cced kexec list.

On Mon, Sep 28, 2026 at 09:28:08AM +0200, David Hildenbrand (Arm) wrote:
> On 9/27/26 21:20, David Carlier wrote:
> > On Mon, Sep 21, 2026 at 09:59:02PM +0200, David Hildenbrand (Arm) wrote:
> >>  enum {
> >> -	SECTION_MARKED_PRESENT_BIT,
> >>  	SECTION_HAS_MEM_MAP_BIT,
> >>  	SECTION_IS_ONLINE_BIT,
> >>  	SECTION_IS_EARLY_BIT,
> > 
> > Hi David,
> 
> Hi!
> 
> > 
> > It seems dropping SECTION_MARKED_PRESENT_BIT shifts the other section flags down
> > one bit. crash hardcodes SECTION_HAS_MEM_MAP as (1UL << 1) in
> > pfn_to_map(), so it now tests SECTION_IS_ONLINE: offline and
> > ZONE_DEVICE sections no longer resolve to a struct page. makedumpfile
> > only checks bit 0 and is fine.
> 
> Thanks. To be expected when relying on kernel internals.
> 
> Which makes me wonder why makedumpfile
> (https://github.com/makedumpfile/makedumpfile) not require any such information.
> 
> > 
> > Keep bit 0 reserved, or export the bits via vmcoreinfo?
> We could export it, or crash can simply detect the change based on the kernel
> version. I remember the latter was done in makedumpfile in the past (although we
> export it).
> 
> I can send a separate patch to export it.

Thanks David.   Checking kernel internals via kernel version is not a good idea
due to the downstream kernels.

> 
> -- 
> Cheers,
> 
> David
