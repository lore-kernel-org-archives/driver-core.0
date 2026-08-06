Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163473B19B7;
	Thu,  6 Aug 2026 07:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999834; cv=none; b=LF++H5NIOmFE4qP8TAKo6XNC82buWANCPOgW6Qlr3Xr7+/WLVbZZpMKsbiVKhzX4e2C+i5GnEcWWFxaeLv6jUFAT3eYIriyy5HYRBrQkxWJlgOIWFg07TU//nLAWv8TSSi9sSnrli9ghbf1QI36uLqyaKUFDtTmLmWKlXexO238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999834; c=relaxed/simple;
	bh=l4F6nqTq2//FcFmr+JEuG4aKd1GbfhHo22a6QoYnhbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLXFj2dafXSvnWJCVgRsgjmw0hxyqDsEdQUEGT/fLam3IabcvqBilRHpQEezJWaZ9UDFZpenl0X34uPABGPyRTmMX8uK9SSW0Igpltsq383Lj86xJ3GpEDg0EyYRUgNW3cSE908CntWpJySf5T29lesdbUH4uWFtCtmHjiYbF6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Ez9zk1ej; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ez9zk1ej"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1451F1F000E9;
	Thu,  6 Aug 2026 07:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785999832;
	bh=Bun4OEi9tagpmxGrHS1oR5rbRsR6OkYKZiGDfVwiPHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ez9zk1ejWKwB/nVl9E5bwSkKVYHKWD7WyLDWZ/XomFpQXqO7AA90E93iVx90FYzDM
	 DTeWgJxI8laH3LS3IEmL+5Yf/ydNxGhh293ZbmC5pAM4gOvG+ib+d51QchlnU/Ygex
	 csgnmEba6bBK2IruUkpKnPpOZsQy10kEU1KsgOyA=
Date: Thu, 6 Aug 2026 09:03:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <2026080623-showgirl-washout-3ef4@gregkh>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>

On Thu, Aug 06, 2026 at 09:58:38AM +0300, Mike Rapoport (Microsoft) wrote:
> arch_numa.c implements boot time discovery and initialization of NUMA
> topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> and riscv).
> 
> Since this is step in the initialization of the memory management
> subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> numa_memblks.c and numa_emulation.c.
> 
> Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> MANAGEMENT INITIALIZATION" in MAINTAINERS.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

No objection from me!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
