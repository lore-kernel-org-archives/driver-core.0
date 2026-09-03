Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654FC4AF164
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788442079; cv=none; b=XecocR5qWBFmmtGrJjoA//hufkYjGtUskj1bH5DmxcmqyjB0j94kW2I8PWfb214fXh6QOSTCqmki/KjinNLkPMnXE9TcICwEAqW1v7s40u9VAnN9XKU6WxP07p8nqghoYK+fu0CbxzCQxlhfnhXipHG5j4TzZjUToeHd+VpTywE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788442079; c=relaxed/simple;
	bh=VD9Fw4QuHL6SKMSXg0EPPW9KevYF76jq6T17BJzHOOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbG5Kpzwes9fqil+RP8vdKnj8Due1S02jrH1fAaSIEQBcx+5efaE1DDUGvfoWO5dMkZ0qq6r90KZ54WBGMRBSMxr0OIk5DSik1l1hQOqVF+9xLP/OjJL6g/liShRU73Xi530CAN7tm9koUmThJOoeoeSEZqSnnitrEJu4sEmBhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JhknW58g; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JhknW58g"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 329101596;
	Thu,  3 Sep 2026 06:27:39 -0700 (PDT)
Received: from [10.57.8.134] (unknown [10.57.8.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95E743FA32;
	Thu,  3 Sep 2026 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788442062; bh=VD9Fw4QuHL6SKMSXg0EPPW9KevYF76jq6T17BJzHOOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JhknW58g6ox//BfSRzAZeor+7IrbpWUxqL28Lee2KVsbpZtFsgwsvrg5rmHQf8kEN
	 pYtP+slJ4FrNyPlxtEeWpe56Yt2JhJc7NuaKmx5i9t9Ul7bdvYHELrW2PiOECJhqCS
	 VKEUgS4+oYYdX3pcoCYOWiDJBNnM6zSAEvqHMQ9g=
Message-ID: <bf973056-590b-45d4-a66c-d61b480ce229@arm.com>
Date: Thu, 3 Sep 2026 15:27:37 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/15] arm_mpam: Fix ris_idx type to prevent range
 check bypass on truncation
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
 <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
 <bca22f76-4fc0-4a99-8648-4f148de7246d@arm.com>
 <b6463a78-9aed-4e17-b044-83b734cc0f9a@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <b6463a78-9aed-4e17-b044-83b734cc0f9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/3/26 11:42, Yin Li wrote:
> 
> 
> On 9/3/2026 12:22 AM, Andre Przywara wrote:
>> Hi,
>>
>> On 8/11/26 15:30, Yin Li wrote:
>>> The RIS index is read from device tree as u64 via 
>>> of_property_read_reg(),
>>
>> what does it do that using an u64, actually? Do you refer to the reg 
>> property of the ris subnode, which has a limit of 0xf in the DT 
>> binding? So shouldn't it be an u8 all along, and we fix the types up 
>> at the sources, rather than widening everything needlessly to u64?
>>
> 
> Hi Andre,
> 
> Thanks for the review.
> 
> Yes, this is the reg property of the ris subnode. The reason it starts
> as u64 is that it's read via of_property_read_reg(), whose API takes a

Yes, I figured as much, *after* hitting the Send button ;-)

> u64* for the value — so ris_idx has to be u64 at that point, regardless
> of the 0xf limit in the binding.

Which actually makes me wonder whether this is the right function to 
use, since there would be no translation (as indeed guaranteed by this 
function), but also no size, and I guess no cell size requirements 
beyond 1. I think it has the added benefit of checking #address-cells 
and #size-cells, but technically a standard of_property_read_u32() would 
do as well? Though this probably has the same problem, just with u32 ...

> If ris_idx were narrowed to u8 before reaching the range check in
> mpam_ris_create_locked() (ris_idx >= MPAM_MSC_MAX_NUM_RIS), an
> out-of-range value such as 0x100 would be truncated to 0x00 and silently
> bypass that check. Keeping the wider type through the chain lets that
> check see the real value and reject invalid indices.
> 
> If you feel an explicit check right after of_property_read_reg() (with
> the downstream types kept as u8) is cleaner, I'm glad to go that way —
> whichever you prefer.

Yeah, I feel it's sane to already check the limit directly after parsing 
from the DT, not only in mpam_ris_create() later. Do you know of any 
particular reason this is done so late?
If there is none, I think the cleanest is to keep of_property_read_reg() 
and check against the limit already in that function. Then we can use a 
u8 all along.

Cheers,
Andre

>>> but was narrowed to u32 when passed to mpam_dt_parse_resource() and
>>> further to u8 when passed to mpam_ris_create(). A value exceeding
>>> MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
>>> passes the range check in mpam_ris_create_locked(), leading to incorrect
>>> RIS creation.
>>>
>>> Widen the ris_idx parameter through mpam_dt_parse_resource(),
>>> mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
>>> is preserved until the range check in mpam_ris_create_locked() rejects
>>> out-of-range indices.
>>>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 6 +++---
>>>   include/linux/arm_mpam.h       | 4 ++--
>>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>>> mpam_devices.c
>>> index cc9fa1d78925..1e082fb60e30 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
>>>   }
>>>   static int mpam_dt_parse_resource(struct mpam_msc *msc, struct 
>>> device_node *np,
>>> -                  u32 ris_idx)
>>> +                  u64 ris_idx)
>>>   {
>>>       int err = 0;
>>>       u32 class_id = 0;
>>> @@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc 
>>> *msc, cpumask_t *affinity,
>>>       return 0;
>>>   }
>>> -static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
>>>                     enum mpam_class_types type, u8 class_id,
>>>                     int component_id)
>>>   {
>>> @@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris 
>>> *ris)
>>>           mpam_vmsc_destroy(vmsc);
>>>   }
>>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>               enum mpam_class_types type, u8 class_id, int component_id)
>>>   {
>>>       int err;
>>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>>> index f92a36187a52..30461cd71199 100644
>>> --- a/include/linux/arm_mpam.h
>>> +++ b/include/linux/arm_mpam.h
>>> @@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) 
>>> { return -EINVAL; }
>>>   #endif
>>>   #ifdef CONFIG_ARM64_MPAM_DRIVER
>>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>               enum mpam_class_types type, u8 class_id, int 
>>> component_id);
>>>   #else
>>> -static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>> +static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>                     enum mpam_class_types type, u8 class_id,
>>>                     int component_id)
>>>   {
>>>
>>
> 

