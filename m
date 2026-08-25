Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF73B3B6BFE;
	Tue, 25 Aug 2026 19:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787685073; cv=none; b=uKzAZZO5xRUY9DT/u8SD0svrHEBnTXw8dowPsvvR99osal4i/Q/v3Ftx813s1ca8bAmKcoIu07Yew1Z2b2jjAXIJkYAQEu4a/1csXawx1TKwPthCLTx3fA42B51lxDrzDZPknnb9KcdJ6wj3UIDGEUW/dDbPq69gpKYG05HaeoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787685073; c=relaxed/simple;
	bh=hSDZXJcBCGB/BBPA2MFm/li4/XhPMHIg4h8tlgS83x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khZVARbIwpdPEs86bZ+Vaa2aL9OOyaPtxLa3LU8dWtxHTZGJVWtHCrUHOStVxB8MNV8Swv9CRptyAw1a+QNL5EIdhOnsVYZYtLSxgW+kYNjVHfw62kXxqyjIP5DUsDrT1/z75PnyBrzfNqxiIh9fkZN0wvpLCwvrI6ydnZc/Qxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ+cozbs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ+cozbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320951F000E9;
	Tue, 25 Aug 2026 19:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787685071;
	bh=jvBvGK6DkfgiPzDsah0Ms8Afl0UPL1Q+u4/BimvjWbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aJ+cozbsd7t0zdBQQ/itkIV2ZUoOycXttvjv1cSEx+HkMKiZsHPKX2d1QlOsrgQAu
	 dq6OWSLIS4+z0c+aqe/vWSeOxi2xu+OUovRnFflq0UPFwm1dMGT6XW1wUaRQ+Z3U4Y
	 6+AlTcgzZxyHHLPwbm7XiNNh03TuKVABkepZBNMsI9PE0Y8ozYgG836Kx3vzHeA+Vy
	 SI6ivPlOrLxUGtr6RNO67RF38AG2pRvI3/N6eUjkyPG0yg80BuZN7+kf5tgFL9Ji/m
	 kMC4I4ii2U6wmKgFaxcp2XPYmzfLUWxnuo0r2dXfCdEx+kVR934IJlC+vs4PFQm1hB
	 ztXGSYuG3ciNQ==
Date: Tue, 25 Aug 2026 12:11:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yin Li <yin.li@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
	driver-core@lists.linux.dev,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
	aiqun.yu@oss.qualcomm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 02/15] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Message-ID: <ao3ozXIhNgvb5nuS@gen8>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-2-ea6397bead59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-2-ea6397bead59@oss.qualcomm.com>

On Tue, Aug 11, 2026 at 09:30:31PM +0800, Yin Li wrote:
> From: James Morse <james.morse@arm.com>
> 
> The MPAM driver identifies caches by id for use with resctrl. It
> needs to know the cache-id when probe-ing, but the value isn't set
> in cacheinfo until device_initcall(). Even after device_initcall(),
> the cache-id is only available if at least one CPU associated with
> the cache is online.
> 
> Instead of making the driver wait, expose the code that generates the
> cache-id. The parts of the MPAM driver that run early can use this to
> set up the resctrl structures before cacheinfo is ready in
> device_initcall().

This patch would also be helpful for resctrl support on RISC-V, too. The
probe function in the CBQRI capacity allocation platform driver [1] has
the same problem. The current solution is to scan the online CPUs for a
cacheinfo leaf whose fw_token is the cache node from the phandle.
However, that does not work if no cpu sharing that cache is online yet.

[..]
> +u32 cache_of_calculate_id(struct device_node *cache_node)
>  {
>  	struct device_node *cpu;
>  	u32 min_id = ~0;
> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>  		id = arch_compact_of_hwid(id);
>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>  			of_node_put(cpu);
> -			return;
> +			return ~0;

Maybe this should be U32_MAX instead?

Thanks,
Drew

[1] https://lore.kernel.org/all/20260729-dfustini-atl-sc-cbqri-dt-v6-8-7c22b05d461b@kernel.org/
