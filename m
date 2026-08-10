Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5753B9DAE;
	Mon, 10 Aug 2026 11:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786361958; cv=none; b=mCwBN2OLaqlbAUaTVf3kwxowUsU0xxBjmz7a4pC4tNTC6fzIwEa8ufowswb9P/MIFyKl8aerYp1jW0HMbZO56KVg6r0ljwR3M+Kr5kUkKj2Dm3Ud+bKFlZZWU87nXdFNkxh5ceW3rGQ2PEOAXp3j+ZkiVTus5+wXSeKU6ho2sZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786361958; c=relaxed/simple;
	bh=atxt0l2OVAZdt7cZ5M3hkSsmj2uyoR3AiGUzTTrcWyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRgyJOZFKW4/t2UEur3ozBGFCkkJez2fUHiAubV3Js/3Saic24aCEHnA1GolFrXoLaCPz8CLhnmCQvl8YZjaaNfDxmKNmxALz1kCFkRwTXE9lfrJ+q9OCHR69KuAKL3tatzbYRD7P0VaWoxzQng3gI1uJH5cl9zHtW5IPr7EOfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0n5GSYMj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0n5GSYMj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 397A11F000E9;
	Mon, 10 Aug 2026 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1786361956;
	bh=P0u6lGUiQZ9xDiMEWf+IKqlqkyWhF01/3VtVUUrckZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0n5GSYMjKpmNPLb015C0thOzWGSPPkoWGGuoIt2+ELcLaSMQGIaMyoOZDKUw+hkvU
	 M+zxwrMLMEusBAVJds31c3BcDFwQ8BC80O+P0nZ62caf6QGVSTDf51Qj8Ak37y0tt0
	 SUElGnBIwcGv63s6L7SLa3uxesIEVZGFEngp5IuY=
Date: Mon, 10 Aug 2026 13:37:44 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: seanwang1 <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <2026081025-rummage-rifling-982e@gregkh>
References: <20260810102006.9986-1-seanwang1@lenovo.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810102006.9986-1-seanwang1@lenovo.com>

On Mon, Aug 10, 2026 at 06:20:06PM +0800, seanwang1 wrote:
> arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
> arch_freq_scale when a CPU enters idle. This bypasses the sft_data
> pointer check that topology_clear_scale_freq_source() relies on.
> 
> As a result, even after calling topology_clear_scale_freq_source()
> with SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling,
> the arch_freq_scale value can still be modified by AMU counters when
> the CPU goes idle through the arch_cpu_idle_enter() path.
> 
> Add topology_scale_freq_source() helper to check whether a specific
> frequency scaling source is currently registered for a CPU. Use it
> in arch_cpu_idle_enter() to verify that AMU is the active source
> before calling amu_scale_freq_tick().
> 
> This ensures that topology_clear_scale_freq_source() properly
> disables AMU updates in both the tick path (already handled by
> topology_scale_freq_tick()) and the idle path.
> 
> Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Sean Wang <seanwang1@lenovo.com>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---

The From: line does not match your signed-off-by name :(

