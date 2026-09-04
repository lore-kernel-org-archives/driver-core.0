Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA5B3B47DF
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 03:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492445; cv=none; b=tI4/r0A61Iqk6C2q+bNLkfvAmbYnX40bCNjPjJY2JVtwN3MuzgeTyiiLRLJqW9QTSUktbAylZTgjTyVUWxtXq8kWJJpm5gu648/seTd9iF0LsW/YIADw6OZwZE6ttRoU3M2GEvfJNeL5mwVdJirpPIsmP7Hm61ZvwQFgAkNwe5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492445; c=relaxed/simple;
	bh=AesykrXJpfqrFNrnBChKHhwctDryuGG+ptNWruYfUpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGwRiVENFU5ynWmOzdMon3kItgicPGHPs684xtrYpt9ymP9YsD71M9Wl6tW/+4vNOBXsB+Rf3Wsc4BIElnPK8MCkUcDNmW65Tbor5Eg+hgai7DW2tuSFEaOKkbpPViUzFPuYAZQlA3kl6oZ+PhdADXKBhQf/B6W2pLuGux9hBZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jXnYvFX9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H4+z+j6a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jXnYvFX9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H4+z+j6a"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6843K3ZR2543942
	for <driver-core@lists.linux.dev>; Fri, 4 Sep 2026 03:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjHTMqkGx32+jzb8+TMRbJY/v2aqI13N3H53qRFfSL0=; b=jXnYvFX9XdAsTAYf
	8DDfUjHmmp4xHIEsqGpn58oSYQFkSx6sDxzRd2jXmeB04OPHZ5BgoqK6MPO5huoq
	zJsxotEIQYhibVSGA/2BjkRj9ST/vNlt6WaB0zljhyL/MEJpJ84h0QvyVqC9hGfc
	W/Thx21eTzsp7oZLcPapgaDF3xgmG29G1THFpCmvkWhPiAIl02usogqMHe+dr9b4
	VOdqoDXkISvo3pd9ODzUiMLYbhsZAIt9sQuA9tDmTr8EU30gMGTKzirxmbKL5Tkt
	x5pd7Z21lY+7/r0SUdMHyevK1jWldDpPhd2xDhGJ5IcKW1GwbJNLUTXw/SMcrQYO
	sx3PSg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekmt84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 03:27:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso856169a91.2
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 20:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788492442; x=1789097242; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjHTMqkGx32+jzb8+TMRbJY/v2aqI13N3H53qRFfSL0=;
        b=H4+z+j6aKXrlDMJSmN6QgR27joxpoh18mNzpLcFnGJl/AqEu61nmGQCgIdxGOXdaXY
         GRvd9035+XFN0NGaS9vh5ZuPo3dkHtZdTrzY/oH51IMxeAQnYpaYKTOounId8bYHCLqd
         O17X6xM0oz3Mgoxctx5Ebp1dq5Ajuc9erAakecFKWoyIhIIWPoplMUDxgA/7lJ2GdcnZ
         tL/XLhhNKZyOdUxZMX6PSf3QdBzLxlKFfi11lIJCTB8R4iA7GRU+lRmPcQ9zMGpBhQuY
         0oRiU7rlYVrl/ScupYteiskyBF6/b8jlj9n2zKlU0AuQ22fdASeoxBQ8g/o3NClGaWOy
         Mnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788492442; x=1789097242;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sjHTMqkGx32+jzb8+TMRbJY/v2aqI13N3H53qRFfSL0=;
        b=ErYce1q5ndQ4n6yzju60eXIbWs30hppNxIZTPu09TwfVwuSFeTUEXVybABxP8awdOS
         nHYc2UdCuOcmhRuQVqrw5n8G/9YNPcJbo4EpHgOymBYtSNVuT2ZnbokWvupi3AaHQY0Y
         5EH2V1CmmIX0/58cqG0uS6sZAkdYtQPXBc9WhcHSmNEFcgV5xYQfyFq9dpPByV2p6TVe
         h6X6nsPI9k+4XCxkbN0yC2eVVlOiV7dSIQaHSMn+vpycyEps2jjTKvnKX5CqTY8DvTcb
         hShyiYJjXOG3C2oDtNPV7A0fWLwUIYWKBFW1NVu0t91fRPdbNxBYyDf3M8GF8MxrvB7y
         QDew==
X-Forwarded-Encrypted: i=1; AKwUvBxp1PhjHmwWkLVdgtm41jB2z2Hd5va+c0lbw+2OtPeo7xrluHgZC84YYjLIq0t0ef5bDVWBfNxE68GIeA==@lists.linux.dev
X-Gm-Message-State: AFuF++mZPRGHxDgyexCa5jbavrTw9Qs0Y3oThyWFLLJnLkWrI4vYoyge
	C3RDGiZaf540AnKyIQYXQ5qU3ZXTgmpw2r01g3OwFMJaDa9rX+5SeujlBUfFY/Y/dxs0ax6OUKy
	qqFCGjCXMGwKaKTAViCQZmZ+zYh914lqF0WM/SifIHtDNthoP1qIgtv6bA4qWA9TnDw==
X-Gm-Gg: AYBFou0PAmYsyP5r8KHilUukIbf/gxwZ+gq/2YKP4byQ1o1kE8rePmuBYZBve7fojHS
	E0MuySRfjIIuIXToV25TFksIDTi84a3I+wbfK0eVhuRVa2czvs26RgRhDfGM91bl24lEeG6Frvh
	1Y97Jy/aY0HRZzl9eYub4dKuNzb+4uhZkDnBH8g5sj5evj5vBvJlRy6IEXdFBLTafSpUInl/7rq
	B50l3CfL9Pu1dz5OxNGnJ1ZG0kuZR+Dids676lXp9ktGNYZdh8FHeOvhLJQaGdsJtny98JpEGpw
	he/9uKBwAEyOc5z8xeP/ssv6xdKog6mHlNy1lHQUMQh7XMgjPWdKX3NeLj9QBkxCl5nu1alyqWi
	BVn9Su6kistylHdrdjC8QSgHkmGkvROZW5K4T8fJnfP3DEuv43v84ISDgCLVPQq9J
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr4828913a91.23.1788492441438;
        Thu, 03 Sep 2026 20:27:21 -0700 (PDT)
X-Received: by 2002:a17:90b:534e:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39b2624f0f4mr4828842a91.23.1788492440928;
        Thu, 03 Sep 2026 20:27:20 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd291sm1979514a91.6.2026.09.03.20.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 20:27:20 -0700 (PDT)
Message-ID: <4de6c2bd-2f9e-41d8-84df-aa1a6545ae83@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:27:17 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/15] arm_mpam: Fix cache ID sentinel from ~0UL to
 U32_MAX to match u32 return type
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com>
 <2dee8a67-3da9-4780-8528-6cdc9c748b0a@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <2dee8a67-3da9-4780-8528-6cdc9c748b0a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 517lqjFQowDMeTrHOnwlP0RboYdsf1HY
X-Proofpoint-GUID: 517lqjFQowDMeTrHOnwlP0RboYdsf1HY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAzMCBTYWx0ZWRfX8vSdslNLM5LA
 4mSPmaRou1uSVplmroYGW97cvPgWUVGDfQUCDTUHE2HAKJbY+Ipo8H2DeDyMC8Bdjww0JxPSLsa
 1pEyqkqEUnE+VSgwN2r7wEY9f3pl1ReX59PDfv4OrjHqOkpM4u2bexQ01PPTQQ7LK2t+9TfkBtd
 Kh29RknlowJzC6aGsQ/zLKoOQRJMW5OQdIDK2SSlv5XgAf3KDWOQPwfYrn6va08zpXEFLULrFqh
 +ZSukzh4COfXSiJBIrUtzLSchYdFR8QgL34uBNdpSwq3f4M4ntHS2K7FrZKxcwOBgk+SGBZVnr+
 SbSQup8D1j854w92ZtN6AQ+hv3t39jlhkReO507Ug+1y9GovarDgvkR/n9a5tGPUb6yog8Be+jL
 b1jp1zMI1/M5drp1M6UYaVkEiEbo0ijqYqCvxdNvks9KeXyNlW4OnnRdsK9BNgWcNkC+bZUiyWG
 2r0PH3M1ZZrwnj/E+/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAzMCBTYWx0ZWRfX6wBERj0rEl2h
 gfg3XFtZs3lq3MURfUMUdc0jUpLVRBpYSqYf6MgTa+otAWlKuDeTyF2C8VGSGfJK/oZYKrr2sG0
 IkGwrP1XkeR6iaF4mWb8625TpfRONWk=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9a3a9a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=usvcRaTLrWoK5MpvqOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040030



On 9/2/2026 9:49 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> cache_of_calculate_id() returns u32, but callers stored the result in
>> unsigned long variables and compared against ~0UL. On 64-bit systems,
>> U32_MAX (0xffffffff) assigned to unsigned long becomes 
>> 0x00000000ffffffff,
>> which does not equal ~0UL (0xffffffffffffffff), so invalid cache IDs are
>> silently accepted instead of being rejected.
> 
> Yes, I agree about this one, long is not right, it's u32 (acpi) or even 
> a plain int elsewhere (get_cpu_cacheinfo_id()).
> 
>>
>> Fix by changing all cache ID and component ID variables that receive the
>> return value of cache_of_calculate_id() to u32, and replace all ~0 and
>> ~0UL sentinel comparisons with U32_MAX.
> 
> ... but am not so sure about the U32_MAX change. I think ~0U is a common 
> idiom in the kernel to mean "mask of all 1's", and while U32_MAX is the 
> same, the _MAX part is slightly misleading here, I think.
> 
> So I think this patch should focus on dropping the long and L parts, but 
> keep the ~0U notation. Which means cacheinfo.c should not change, for 
> instance.
> 
> And also I wonder if that should be split up: one part to fix the 
> existing usage in v7.3-rc1, so basically the function prototype, and the 
> other part for the newly introduced DT code, which should then be squashed.
> 

Hi Andre,

Thanks for the review.

On the types: agreed, and the patch already changes them from unsigned
long to u32.

On the sentinel: the patch currently uses U32_MAX, but you make a fair
point that ~0U is the more common idiom for an all-ones mask and that
_MAX reads a bit misleading here. I'll switch it back to ~0U and leave
cacheinfo.c unchanged, so the patch focuses on just the long/UL type fix.
(Drew raised the opposite on patch 02/15, but as a question rather than 
a strong preference — Drew, please shout if you disagree.)

As discussed with Ben, I'll fold these type fixes back into the 
respective inherited patches.

Thx and BRs,
Yin

> Cheers,
> Andre
> 
>>
>> Also fix the sentinel values in cache_of_calculate_id() itself for
>> consistency.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/base/cacheinfo.c        |  6 +++---
>>   drivers/resctrl/mpam_devices.c  | 16 ++++++++--------
>>   drivers/resctrl/mpam_internal.h |  2 +-
>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>> index f75e7f64038b..a4e0d1d47e71 100644
>> --- a/drivers/base/cacheinfo.c
>> +++ b/drivers/base/cacheinfo.c
>> @@ -229,7 +229,7 @@ static bool match_cache_node(struct device_node *cpu,
>>   u32 cache_of_calculate_id(struct device_node *cache_node)
>>   {
>>       struct device_node *cpu;
>> -    u32 min_id = ~0;
>> +    u32 min_id = U32_MAX;
>>       for_each_of_cpu_node(cpu) {
>>           u64 id = of_get_cpu_hwid(cpu, 0);
>> @@ -237,7 +237,7 @@ u32 cache_of_calculate_id(struct device_node 
>> *cache_node)
>>           id = arch_compact_of_hwid(id);
>>           if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>               of_node_put(cpu);
>> -            return ~0;
>> +            return U32_MAX;
>>           }
>>           if (match_cache_node(cpu, cache_node))
>> @@ -252,7 +252,7 @@ static void cache_of_set_id(struct cacheinfo 
>> *this_leaf,
>>   {
>>       u32 id = cache_of_calculate_id(cache_node);
>> -    if (id != ~0) {
>> +    if (id != U32_MAX) {
>>           this_leaf->id = id;
>>           this_leaf->attributes |= CACHE_ID;
>>       }
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 559fa09128b4..ddc15249ec1e 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -166,13 +166,13 @@ static void mpam_free_garbage(void)
>>   /* Called recursively to walk the list of caches from a particular 
>> CPU */
>>   static void __mpam_get_cpumask_from_cache_id(int cpu, struct 
>> device_node *cache_node,
>> -                         unsigned long cache_id,
>> +                         u32 cache_id,
>>                            u32 cache_level,
>>                            cpumask_t *affinity)
>>   {
>>       int err;
>>       u32 iter_level;
>> -    unsigned long iter_cache_id;
>> +    u32 iter_cache_id;
>>       struct device_node *iter_node __free(device_node) = 
>> of_find_next_cache_node(cache_node);
>>       if (!iter_node)
>> @@ -187,7 +187,7 @@ static void __mpam_get_cpumask_from_cache_id(int 
>> cpu, struct device_node *cache_
>>        * during device_initcall(). Use cache_of_calculate_id().
>>        */
>>       iter_cache_id = cache_of_calculate_id(iter_node);
>> -    if (iter_cache_id == ~0UL)
>> +    if (iter_cache_id == U32_MAX)
>>           return;
>>       if (iter_level == cache_level && iter_cache_id == cache_id)
>> @@ -202,7 +202,7 @@ static void __mpam_get_cpumask_from_cache_id(int 
>> cpu, struct device_node *cache_
>>    * The cacheinfo structures are only populated when CPUs are online.
>>    * This helper walks the device tree to include offline CPUs too.
>>    */
>> -int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 
>> cache_level,
>> +int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
>>                      cpumask_t *affinity)
>>   {
>>       int cpu;
>> @@ -229,7 +229,7 @@ static int get_cpumask_from_cache(struct 
>> device_node *cache,
>>   {
>>       int err;
>>       u32 cache_level;
>> -    unsigned long cache_id;
>> +    u32 cache_id;
>>       err = of_property_read_u32(cache, "cache-level", &cache_level);
>>       if (err) {
>> @@ -238,7 +238,7 @@ static int get_cpumask_from_cache(struct 
>> device_node *cache,
>>       }
>>       cache_id = cache_of_calculate_id(cache);
>> -    if (cache_id == ~0UL) {
>> +    if (cache_id == U32_MAX) {
>>           pr_err("Failed to calculate cache-id from cache node\n");
>>           return -ENOENT;
>>       }
>> @@ -264,7 +264,7 @@ static int mpam_dt_parse_resource(struct mpam_msc 
>> *msc, struct device_node *np,
>>   {
>>       int err = 0;
>>       u32 class_id = 0;
>> -    unsigned long component_id = 0;
>> +    u32 component_id = 0;
>>       struct device *dev = &msc->pdev->dev;
>>       enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
>>       struct device_node *cache __free(device_node) = NULL;
>> @@ -308,7 +308,7 @@ static int mpam_dt_parse_resource(struct mpam_msc 
>> *msc, struct device_node *np,
>>               return err;
>>           }
>>           component_id = cache_of_calculate_id(cache);
>> -        if (component_id == ~0) {
>> +        if (component_id == U32_MAX) {
>>               dev_err_once(dev, "Failed to calculate cache-id\n");
>>               return -ENOENT;
>>           }
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/ 
>> mpam_internal.h
>> index def0e3a65c23..aa45d00bcd07 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -470,7 +470,7 @@ int mpam_msmon_read(struct mpam_component *comp, 
>> struct mon_cfg *ctx,
>>               enum mpam_device_features, u64 *val);
>>   void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct 
>> mon_cfg *ctx);
>> -int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 
>> cache_level,
>> +int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
>>                      cpumask_t *affinity);
>>   #ifdef CONFIG_RESCTRL_FS
>>
> 

-- 
Thx and BRs,
Yin

