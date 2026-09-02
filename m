Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8225549E5E6
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356974; cv=none; b=ioEpNaNUeoyZ+wldb5tK2wS2lmfw1kX1GGJdA5hprp34smAwbIOVfarOo6f+j+afb+ZvjdjQzHzAA5Zm+5t06pqYVd00iPeNYjYFP7hkdxXKybN433mRrRvafqjksflbyZ1sIBT03a4eTkmdR+hfDcuBWOhAx2W48vX+ZFOXdO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356974; c=relaxed/simple;
	bh=AGGsvYebdIGek/paiRe09dNkU8hC02qge8BL7DbifsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eu48oPmw64Vwj6+HSstaeYoGLcvG+4h62pEJmQQxUmpDvwokdoWTXgzErpDBsMiImazC6OHKdh7LFRvBhinLA//BgOtKXHSmK8untbMWjI0R8J7KtAf3hgSWFjh6TDfy7GOkrrFFDueFaRPaPP3d1pp1Tj1zGBbc2xR2eG2XgPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WfRdo7GU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WfRdo7GU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B4A5165C;
	Wed,  2 Sep 2026 06:49:28 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D05A53F673;
	Wed,  2 Sep 2026 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788356971; bh=AGGsvYebdIGek/paiRe09dNkU8hC02qge8BL7DbifsU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WfRdo7GUhunM2BC5wuuWEEJMEaCtKW6m9PH8z77ObRRSE9GCZu/RkFr8fkondhlSG
	 0AdrcSkLu3m0tvgOhJEqT7RXyrrYZ8tGYwqsE1ha6yJeMQzTKAmQQMP+CSCf3mlk+1
	 KTxxOOtYjVmz1rceUoF13Yp/JVdysXiYq6qJhYDw=
Message-ID: <2dee8a67-3da9-4780-8528-6cdc9c748b0a@arm.com>
Date: Wed, 2 Sep 2026 15:49:26 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/15] arm_mpam: Fix cache ID sentinel from ~0UL to
 U32_MAX to match u32 return type
To: Yin Li <yin.li@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>, James Morse <james.morse@arm.com>,
 Ben Horgan <ben.horgan@arm.com>, Bjorn Andersson <andersson@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>, Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/11/26 15:30, Yin Li wrote:
> cache_of_calculate_id() returns u32, but callers stored the result in
> unsigned long variables and compared against ~0UL. On 64-bit systems,
> U32_MAX (0xffffffff) assigned to unsigned long becomes 0x00000000ffffffff,
> which does not equal ~0UL (0xffffffffffffffff), so invalid cache IDs are
> silently accepted instead of being rejected.

Yes, I agree about this one, long is not right, it's u32 (acpi) or even 
a plain int elsewhere (get_cpu_cacheinfo_id()).

> 
> Fix by changing all cache ID and component ID variables that receive the
> return value of cache_of_calculate_id() to u32, and replace all ~0 and
> ~0UL sentinel comparisons with U32_MAX.

... but am not so sure about the U32_MAX change. I think ~0U is a common 
idiom in the kernel to mean "mask of all 1's", and while U32_MAX is the 
same, the _MAX part is slightly misleading here, I think.

So I think this patch should focus on dropping the long and L parts, but 
keep the ~0U notation. Which means cacheinfo.c should not change, for 
instance.

And also I wonder if that should be split up: one part to fix the 
existing usage in v7.3-rc1, so basically the function prototype, and the 
other part for the newly introduced DT code, which should then be squashed.

Cheers,
Andre

> 
> Also fix the sentinel values in cache_of_calculate_id() itself for
> consistency.
> 
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   drivers/base/cacheinfo.c        |  6 +++---
>   drivers/resctrl/mpam_devices.c  | 16 ++++++++--------
>   drivers/resctrl/mpam_internal.h |  2 +-
>   3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index f75e7f64038b..a4e0d1d47e71 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -229,7 +229,7 @@ static bool match_cache_node(struct device_node *cpu,
>   u32 cache_of_calculate_id(struct device_node *cache_node)
>   {
>   	struct device_node *cpu;
> -	u32 min_id = ~0;
> +	u32 min_id = U32_MAX;
>   
>   	for_each_of_cpu_node(cpu) {
>   		u64 id = of_get_cpu_hwid(cpu, 0);
> @@ -237,7 +237,7 @@ u32 cache_of_calculate_id(struct device_node *cache_node)
>   		id = arch_compact_of_hwid(id);
>   		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>   			of_node_put(cpu);
> -			return ~0;
> +			return U32_MAX;
>   		}
>   
>   		if (match_cache_node(cpu, cache_node))
> @@ -252,7 +252,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>   {
>   	u32 id = cache_of_calculate_id(cache_node);
>   
> -	if (id != ~0) {
> +	if (id != U32_MAX) {
>   		this_leaf->id = id;
>   		this_leaf->attributes |= CACHE_ID;
>   	}
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 559fa09128b4..ddc15249ec1e 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -166,13 +166,13 @@ static void mpam_free_garbage(void)
>   
>   /* Called recursively to walk the list of caches from a particular CPU */
>   static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
> -					     unsigned long cache_id,
> +					     u32 cache_id,
>   					     u32 cache_level,
>   					     cpumask_t *affinity)
>   {
>   	int err;
>   	u32 iter_level;
> -	unsigned long iter_cache_id;
> +	u32 iter_cache_id;
>   	struct device_node *iter_node __free(device_node) = of_find_next_cache_node(cache_node);
>   
>   	if (!iter_node)
> @@ -187,7 +187,7 @@ static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_
>   	 * during device_initcall(). Use cache_of_calculate_id().
>   	 */
>   	iter_cache_id = cache_of_calculate_id(iter_node);
> -	if (iter_cache_id == ~0UL)
> +	if (iter_cache_id == U32_MAX)
>   		return;
>   
>   	if (iter_level == cache_level && iter_cache_id == cache_id)
> @@ -202,7 +202,7 @@ static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_
>    * The cacheinfo structures are only populated when CPUs are online.
>    * This helper walks the device tree to include offline CPUs too.
>    */
> -int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
> +int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
>   				   cpumask_t *affinity)
>   {
>   	int cpu;
> @@ -229,7 +229,7 @@ static int get_cpumask_from_cache(struct device_node *cache,
>   {
>   	int err;
>   	u32 cache_level;
> -	unsigned long cache_id;
> +	u32 cache_id;
>   
>   	err = of_property_read_u32(cache, "cache-level", &cache_level);
>   	if (err) {
> @@ -238,7 +238,7 @@ static int get_cpumask_from_cache(struct device_node *cache,
>   	}
>   
>   	cache_id = cache_of_calculate_id(cache);
> -	if (cache_id == ~0UL) {
> +	if (cache_id == U32_MAX) {
>   		pr_err("Failed to calculate cache-id from cache node\n");
>   		return -ENOENT;
>   	}
> @@ -264,7 +264,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>   {
>   	int err = 0;
>   	u32 class_id = 0;
> -	unsigned long component_id = 0;
> +	u32 component_id = 0;
>   	struct device *dev = &msc->pdev->dev;
>   	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
>   	struct device_node *cache __free(device_node) = NULL;
> @@ -308,7 +308,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>   			return err;
>   		}
>   		component_id = cache_of_calculate_id(cache);
> -		if (component_id == ~0) {
> +		if (component_id == U32_MAX) {
>   			dev_err_once(dev, "Failed to calculate cache-id\n");
>   			return -ENOENT;
>   		}
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index def0e3a65c23..aa45d00bcd07 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -470,7 +470,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
>   		    enum mpam_device_features, u64 *val);
>   void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
>   
> -int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
> +int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
>   				   cpumask_t *affinity);
>   
>   #ifdef CONFIG_RESCTRL_FS
> 

