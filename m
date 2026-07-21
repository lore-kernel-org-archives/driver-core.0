Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEEC146588;
	Tue, 21 Jul 2026 14:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644328; cv=none; b=Xe5NbyUs9gDfelVsCufKgMPhlwROmEc93XEgRNiAFO3ifXRm0CnFxUNGgb9PTuTGMAnhG+dyKyOwkwWQ8A6+bux7VgnpwXCbMa+MZba4Hmr5H35Tj1cB4AxStoyeyrE2vmm6ZZv1OG8AZSf27zT4d1gqIXH5rkuWn2uZOQk1Yeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644328; c=relaxed/simple;
	bh=RhJF1tQwxNaslAxIXYd1D/RT2UBjw4hhb7ChIVUTMYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=meusWuNqQm/K6cBz+jGhzmCb0YdcZ0RfIwWK79YjJaDtXGYbqX3WVGIchqiv67nul4e0seKfEQz36/tElK8MjznBODLpJ4rjc9Av7dVS2vHMCHMt2qioO3Yzm6mc3BOB3S513yXvrO1B5p6UQupXoCfx7qZ/uzwqMvRGyeuTrng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nz7JNyzd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nz7JNyzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3541F000E9;
	Tue, 21 Jul 2026 14:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784644327;
	bh=UALs/xzCw3tEa0jSeT6NpG4xDroijPsvsDbvcfZxV/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nz7JNyzdSG/KNkW5CpKhsdIVshZ9wo8lQL+vaEG66uANIYdra/vhXhk2H56YpVlEf
	 hUmNAT5lh8MJbAmo4L5127SalFIwgoVkMbn/MM2BYLEbE6lR0L/k2bv5zHiPTPc9vu
	 UTXcp4RdSRMHKD86ODa/KKHkXa4hMyAyb9/ZdirRhGffnfWOTS4V2W/7LRlvwRLNp9
	 p2bEgEBM8R/MJ9Je/zi1nu2cY/zc4tZ9VjX0xv0dwUQTvgDIRjZ/+eTeqPMiZoh/fe
	 97JG8/vzyPpkM9mWc5Z4eWoJa8Q94zfF7uY1mkzbKZbBOrmAWe1ARxLZXjpVEG49fY
	 uwBoIIAsCoRmw==
Date: Tue, 21 Jul 2026 15:32:03 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] arch_topology: Introduce nr_possible_packages
Message-ID: <20260721-armored-lion-of-pluck-9fc8a0@sudeepholla>
References: <20260714054317.73219-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714054317.73219-1-feng.tang@linux.alibaba.com>

On Tue, Jul 14, 2026 at 01:43:17PM +0800, Feng Tang wrote:
> For multi-sockets platforms kernel or driver code may need the number
> of packages to chose different code directions. Some architecture
> already provides such kind of interface like x86, which is being used
> in its architecture code and drivers.
> 
> Add similar interface 'nr_possible_packages' for platforms which can
> get package topology information by parsing ACPI tables in boot phase,
> which was verified to show the correct number of packages on some
> 1-socket and 2-sockets production arm64 servers from different vendors.
> 
> It has been used locally by some arm64 PMU driver, and cross-socket
> timer-consistency check code, which are to be posted.
> 
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>   since v1:
>       * fix the potential overflow issue for 32b package ID (Sudeep)
> 	  * add real use case in commit log (Sudeep)
> 
>   since RFC:
>       * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)

This is undone in this version, why ?

> 	  * change the possible max package ID to 2047 (Greg)
> 	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)

Again this is still there, misleading or v2 is back to RFC, /me confused.

> 
>   v1:  https://lore.kernel.org/lkml/20260515144435.93035-1-feng.tang@linux.alibaba.com/ 

Comments about users is still ignored.

-- 
Regards,
Sudeep

P.S.: Please avoid personal pings as it will not gain attention from other
interested parties.
