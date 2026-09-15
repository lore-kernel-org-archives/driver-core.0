Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52989394EB7
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459168; cv=none; b=Pqmsd6tVynF7Vc5q6GLWjIqjpoXI3K19G06H64jrvg1mD9lWNcc+fCWN0Ok3M54KJJITNoFb2v7ty+2BmN4ZUopGQ0Ed2j/jNtMiR5Ez5zzSrYx3smVk0pqK79Chd3GKrbHN/ImQBl6VG+Bs0XRv0MSENToiBUdi1qtieJ5zaes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459168; c=relaxed/simple;
	bh=NFm/Bmw3lQZ0sZ9bbnHxw99/b8GrSXW/d3Xz1RSCeO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdQa54QP+JW9BhwalTzQnbaHD/pjZK7irX7MzVitR50PREJ596OPQR1G2lKMWSxf16oTo56uZk/QocygKAgPgEntzRQw2r0WPuM0hEO5J9R35+QYt3t+4W1Y8PhaWf9qB/nhX8DiElftenUryrGxl9W0AyhZRABcl7WEwoHGx8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Dl75BtWV; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Dl75BtWV"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC03B169C;
	Tue, 15 Sep 2026 00:59:20 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 348883F86F;
	Tue, 15 Sep 2026 00:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789459164; bh=NFm/Bmw3lQZ0sZ9bbnHxw99/b8GrSXW/d3Xz1RSCeO4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dl75BtWVkvlLYgY6l9WA7uPXRoT36D3Nt7r8pBsnRpQzSfsxZ8hAg/k19yyxEGfHA
	 v/ge4Im8TagH1qzW4ufriEcxpI2b0Hd6EAEbehfcnqoax2CIBigQYzbRxndv0M6905
	 EFTt/crJfNSMvMY0W42CbEU4dMdrirLdoXlddr3s=
Message-ID: <e8a33eea-c54d-471c-9936-41762453feb7@arm.com>
Date: Tue, 15 Sep 2026 09:59:17 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
 Rob Herring <robh@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Ben Horgan <ben.horgan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, trilok.soni@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
 <317682e8-63e7-4047-9106-deea7bf96388@arm.com>
 <a340505d-9495-4f68-8ed1-c7e8772c28e4@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <a340505d-9495-4f68-8ed1-c7e8772c28e4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yin,

thanks for the reply!

On 9/15/26 08:49, Yin Li wrote:
> 
> 
> On 9/14/2026 8:26 PM, Andre Przywara wrote:
>> Hi,
>>
>> On 9/14/26 11:37, Yin Li wrote:
>>> From: James Morse <james.morse@arm.com>
>>>
>>> The MPAM driver identifies caches by id for use with resctrl. It
>>> needs to know the cache-id when probe-ing, but the value isn't set
>>> in cacheinfo until device_initcall(). Even after device_initcall(),
>>> the cache-id is only available if at least one CPU associated with
>>> the cache is online.
>>>
>>> Instead of making the driver wait, expose the code that generates the
>>> cache-id. The parts of the MPAM driver that run early can use this to
>>> set up the resctrl structures before cacheinfo is ready in
>>> device_initcall().
>>>
>>> Signed-off-by: James Morse <james.morse@arm.com>
>>> [ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard 
>>> the
>>>    cache_of_calculate_id() declaration with CONFIG_OF to prevent build
>>>    errors when CONFIG_OF is not set ]
>>
>> You can shorten that part in square brackets: doing adjustments due to 
>> rebasing is surely implied, and you can shorten the rest, like:
>> [ Yin Li: guard cache_of_calculate_id() prototype ]
>>
>> Speaking of which ...
>>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   drivers/base/cacheinfo.c  | 17 ++++++++++++-----
>>>   include/linux/cacheinfo.h |  3 +++
>>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>>> index 9f9c72727a05..f75e7f64038b 100644
>>> --- a/drivers/base/cacheinfo.c
>>> +++ b/drivers/base/cacheinfo.c
>>> @@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node 
>>> *cpu,
>>>   #define arch_compact_of_hwid(_x)    (_x)
>>>   #endif
>>> -static void cache_of_set_id(struct cacheinfo *this_leaf,
>>> -                struct device_node *cache_node)
>>> +u32 cache_of_calculate_id(struct device_node *cache_node)
>>>   {
>>>       struct device_node *cpu;
>>>       u32 min_id = ~0;
>>> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo 
>>> *this_leaf,
>>>           id = arch_compact_of_hwid(id);
>>>           if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>>               of_node_put(cpu);
>>> -            return;
>>> +            return ~0;
>>>           }
>>>           if (match_cache_node(cpu, cache_node))
>>>               min_id = min(min_id, id);
>>>       }
>>> -    if (min_id != ~0) {
>>> -        this_leaf->id = min_id;
>>> +    return min_id;
>>> +}
>>> +
>>> +static void cache_of_set_id(struct cacheinfo *this_leaf,
>>> +                struct device_node *cache_node)
>>> +{
>>> +    u32 id = cache_of_calculate_id(cache_node);
>>> +
>>> +    if (id != ~0) {
>>> +        this_leaf->id = id;
>>>           this_leaf->attributes |= CACHE_ID;
>>>       }
>>>   }
>>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>>> index fc879ac4cc4f..c33bb3c8bd63 100644
>>> --- a/include/linux/cacheinfo.h
>>> +++ b/include/linux/cacheinfo.h
>>> @@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
>>>   #endif
>>>   const struct attribute_group *cache_get_priv_group(struct cacheinfo 
>>> *this_leaf);
>>> +#ifdef CONFIG_OF
>>
>> Why is that, exactly? First IIUC it's quite uncommon to use #ifdef 
>> guards around prototypes (unless they are stubbed without the symbol 
>> defined). Using types protected by those symbols if certainly another 
>> reason, and it looks like this would be the case here, but I had no 
>> trouble building the kernel for x86, where CONFIG_OF is not defined.
>> So can you share a .config example (or give a hint) as to where this 
>> fails building?
>> And if it does, wouldn't it be better to always include <linux/of.h> 
>> in that file instead? I think I see a similar pattern elsewhere 
>> (rfkill- gpio.c, sound/ac97/bus.c).
>>
> 
> Hi Andre,
> 
> On the #ifdef CONFIG_OF: I also verified that removing the guard doesn't
> break the build. However, since the implementation in cacheinfo.c is
> itself guarded by #ifdef CONFIG_OF, exposing the prototype
> unconditionally could cause a link error on CONFIG_OF=n builds if called

How so? Just exposing a prototype wouldn't be a problem, as long as you 
don't try to call that function. And that would be caught by the linker, 
and then you have a different problem anyway (the caller).

The only reason to protect the prototype would be if a type used in the 
parameters is not defined. And on the face of it "struct device_node" is 
an OF specific type, declared in include/linux/of.h, but as mentioned, I 
can't produce a compiler error, and even if so, would prefer to include 
of.h instead.

> from outside the ARM64/MPAM path. A more idiomatic approach might be to
> use a stub to keep the header consistent with the implementation:
> 
>    #ifdef CONFIG_OF
>    u32 cache_of_calculate_id(struct device_node *np);
>    #else
>    static inline u32 cache_of_calculate_id(struct device_node *np)
>    {
>        return ~0U;
>    }
>    #endif
> 
> Would that work for you?

That's not necessary and doesn't solve the problem: the struct 
device_node would be present in both branches, so that doesn't help. And 
given there are no preprocessor protections for OF or ACPI in the whole 
of mpam_devices.c, that's a non-issue, I'd say.

> Otherwise I'm happy to just drop the guard in
> the next version.

So can you say whether you have a .config that does not build? Or was 
that issue just pointed out by some picky AI review tool?
Otherwise I would drop the guards, and wait for the kernel test robot or 
Arnd's infamous randconfig builds to show up the exact problem.

Cheers,
Andre

>>
>>> +u32 cache_of_calculate_id(struct device_node *np);
>>> +#endif
>>>   /*
>>>    * Get the cacheinfo structure for the cache associated with @cpu at
>>>
>>
> 

