Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630A837755A;
	Thu,  6 Aug 2026 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000620; cv=none; b=RBiCLC8s3dCQ+zJPitUZX9l522FmPo3L+4Vsrl2XNZaSP+phN2GlillIz8tLweQro4izZ4SE4ZDv9z1WsqQg1uC+uzQZP9NpVpsEMMmliXZcmqaQUdsMwan8kMIKQiAQcNf2SmIIaVOebD3XgpOL3KifNyjEfgGcbcahgvADxfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000620; c=relaxed/simple;
	bh=buU+5melOjc491TqYDcZUzaObWq0WHd9IiW718kCEIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O99jixbOqcbCjXtvenyVXlmL+UdrL0uf6v8bBlZGWUqHcYlTCILcteHyN3LFltANB9wBQHRTcU/HXkYkdH05vd4ms/4V+YVqEUyKnfnNb+DzSeWUYKF4FsbRUUWGz3gcOPshFt4woIwQvtNFe/1o3HDH9n/v4XEd+zo1+15MUAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2eClChD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2eClChD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CEE1F000E9;
	Thu,  6 Aug 2026 07:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786000619;
	bh=NXENzFGewvbVKEIJwXHYAIoiYNIgGa+Cz5Fo0Nhu2JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P2eClChD/AaOKwmAmAyPQS1DUnipFlxmEzB/eMjNEPjEZ5aqwC0SmjO6Gyf/gc9Mf
	 Y8TZpzplAPvWlbF9BNnJxxPUlusi9jGsZkeCvUZIhmRdYmNFXoQarDX1ytS+V60mGE
	 vMzHPk+Q4aZKzwILGzfSNWjeY/XsFH+sOUJJPSMii1RG1HdF8/za5vnD1S/ynoDBKM
	 nnZMlXWiW2gRlqlxwvxMwBlaEaoQegPOoN+OtOvVaF+G3COJg+PqcpJ0htnn+2mAM5
	 H/nKGQ08QO9jgCFDwzl6sJmNYiICc/IQW2zsN/jzKgslc5XdoBHmPvJB3FTZMZl6Fn
	 EHwjv/NOpoFlg==
Date: Thu, 6 Aug 2026 10:16:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Message-ID: <anQ04CpxDjqktbbB@kernel.org>
References: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
 <anQyFuRVekkN8Z5a@lucifer>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anQyFuRVekkN8Z5a@lucifer>

On Thu, Aug 06, 2026 at 08:06:12AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Aug 06, 2026 at 09:58:38AM +0300, Mike Rapoport (Microsoft) wrote:
> > arch_numa.c implements boot time discovery and initialization of NUMA
> > topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
> > and riscv).
> >
> > Since this is step in the initialization of the memory management
> > subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
> > numa_memblks.c and numa_emulation.c.
> >
> > Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
> > MANAGEMENT INITIALIZATION" in MAINTAINERS.
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> 
> Everything is proceeding as I have foreseen... soon we shall have control
> of all of the kernel! ;)

I'm also eyeing drivers/base/memory.c, but that one is more involved :)
 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
 
Thanks!

-- 
Sincerely yours,
Mike.
