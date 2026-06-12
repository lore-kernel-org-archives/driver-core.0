Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECD71A5BAE;
	Fri, 12 Jun 2026 12:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268521; cv=none; b=h3kNnAtt4FUhC7/b+BZTem2of4YPj8EM7MDWxoR03MwaYgFxUGxk6BUBGdDSWVuvW+TpXYULCzTifmrjtPtn5OSi0C1N8bsNK3SjhiWOFV1PSkz17GeSmxQHnmDUV3KzCewc2rSIFWFmMW5lPkDQUGZadYYuj3T4geqYcQbxTO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268521; c=relaxed/simple;
	bh=2xBAE8B0PRoROg2Bm5rFLGBsSSmltwapGEClfmNHyZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOYuxvXQV9e0KoDBD7rob2wxBAgcSYMl6GvFTT/jnyUHGkEZbi0aSKL59XhJ0ykPD5bQSd3hnrPXoWTN2DFeUcnGeV5j3wDvsAz+f2uEe9wB0F5Cq5lm5A9Xq/s4hYwSRrRRw0AzTYJQcCxmuTohx8TeKFnik7SQbKzDCJ1C+GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYP4zjuS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYP4zjuS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430471F000E9;
	Fri, 12 Jun 2026 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781268519;
	bh=QQcXj9X9JC/tjIqmym5DNDIGY9BeEiaAToOSLaCoE2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mYP4zjuS+fU3ceR1RKHKPp0Yx4mOEhLviVxQCTp08fcZYT9ZiL3wxEtZ4vflsGAjw
	 7ssMt05Pkzvm91RNBbUakLjU/R7JCrxAyhycKh+mH3IJ6GYZXwaLzwJT5+3YAR6LOT
	 sRWBMcf8ybj1Oz9Z6uggHWtqSgVWdS6OVwCbBUFwT1pDnxOEsq5DTtz58YmCcyATHl
	 GpOC0Wfd+RhGjQtyBGHu9RK2ruAj0eNnXr0FhagmCYGKSCJzytD7EnDbdNdj5Q25cb
	 ZeBLznkjxpTtAPVYyWplZnQKqj13ZRZiX+2f8BISnYwFL2qSWh6gW0jRD6CztHkdR/
	 4STDDDa560T9Q==
Date: Fri, 12 Jun 2026 13:48:36 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Pierre Gondois <pierre.gondois@arm.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] cacheinfo: don't propagate DT/ACPI error when arch
 supplies info (arm64)
Message-ID: <20260612-jumping-spaniel-of-expertise-cbadcd@sudeepholla>
References: <20260611-cacheinfo-v2-1-6069ef066cf3@debian.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611-cacheinfo-v2-1-6069ef066cf3@debian.org>

On Thu, Jun 11, 2026 at 04:55:13AM -0700, Breno Leitao wrote:
> cache_setup_properties() sets use_arch_info = true when DT/ACPI
> provide no cache nodes and the arch can derive the topology from
> CPU registers (e.g. arm64 reading CLIDR_EL1), but still returns the
> original -ENOENT. cache_shared_cpu_map_setup() bails on that error
> before the new flag can take effect, so the first CPU brought online
> always trips a misleading warning:
> 
>   cacheinfo: Unable to detect cache hierarchy for CPU 0
> 
> Subsequent CPUs skip cache_setup_properties() entirely because
> use_arch_info is now true, which is why only CPU0 hits it. This is
> reproducible on arm64 with the QEMU 'virt' machine, whose default DT
> has no cache nodes.
> 
> Clear ret after setting use_arch_info so the caller proceeds and
> populates the shared cpu map via the arch-supplied leaves.
> 

LGTM,

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

Greg,

Can you pick up this one as part of your next round of fixes if any or
for v7.2 ?

> Fixes: ef9f643a9f8b ("cacheinfo: Add use_arch[|_cache]_info field/function")
> Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Cc; hruben@meta.com
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Ideally, good to update this or atleast drop these 😄.

-- 
Regards,
Sudeep
