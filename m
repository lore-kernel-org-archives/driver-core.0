Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F731386C13;
	Thu,  6 Aug 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043272; cv=none; b=EkkCbRb1olCdfrGSFLiuJyFlOgbF833h0rMkOdVlgXgpjWzO4ALQ/WQW4Ai6ovaW6sSlumaJvt28UoT1UGDl3I4PJMY6CJ1NkVLNwg7vLWzdpZVlUS8OBk0dPNjZB3EC69mwKpwf4SHg5wcexZGmde5T9Hhke5EeBTFUOM13rq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043272; c=relaxed/simple;
	bh=xSIBxESI2LsoRGEYRs0/9j6hglmt3A0LXyVRlu9kWmA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=eSkEwLEN6MFQkw90M/fJx/56RkltF9in6o3hDaH+IrTk5R6irPpO3pFGf3CkUFS81uV/df17PUPunQQxuOUYhnFrTUnmiJU1OXLG5e4KeYA75ZdkFguBR9YXNWCY5i20PXWTBfEf9E0BWqBuTY26XlK6w7lMm+NxbNva06wCISI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfDkMLMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfDkMLMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D4A1F000E9;
	Thu,  6 Aug 2026 19:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786043271;
	bh=xSIBxESI2LsoRGEYRs0/9j6hglmt3A0LXyVRlu9kWmA=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=CfDkMLMzLkdPHXnqlLhKxkA5MeUXehC8NdKjRJBzoZmebvdfnnhwObhxkBqNlM0wW
	 rFocRMiNewSiN8UT1BNMlYNaCW6FazoO0n+VUsaknt/d6/gbAt8fXwozs541gOl1Qc
	 F2YXl+HPKcLs9sJiQln6F5qYu39DSoVlaakxAxDHetlYuVUSG3ATDF8n/1bPEXxH+1
	 CFCqY9SH4AzZkR0uXmXdtSfa3IfxxheRp4+K1ySCezNOtEc1Q0msqsWU/XODkmmOVx
	 DJtHDUFJ4vI4riMV9qziNdXdv4qWhHQhy6yNM72ba6yIA8DlKp1S0mLrG3SxlbawtX
	 FK0lteBG7yUhA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 21:07:45 +0200
Message-Id: <DKI3HX8TBEH0.336LUXTWQJL70@kernel.org>
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "David Hildenbrand" <david@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Liam R. Howlett"
 <liam@infradead.org>, "Lorenzo Stoakes" <ljs@kernel.org>, "Michal Hocko"
 <mhocko@suse.com>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>,
 "Will Deacon" <will@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
In-Reply-To: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>

On Thu Aug 6, 2026 at 8:58 AM CEST, Mike Rapoport (Microsoft) wrote:
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

Acked-by: Danilo Krummrich <dakr@kernel.org>
