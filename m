Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F733793B0
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 02:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789525792; cv=none; b=TFEb/3PZU7REN/r+TkhkYH8nzCV9ociP6PtGZq53bXjGFo/pqvj+I384QHYkHIYZMdTKWDeW0+oTBzllXnDiDXt3OfzHd2dA+pXavkSfTJ2sucZFcD13Bz25+JoP0BZpmIzKCtGjtfTi1oZS1aFcATGBPgG71h68i5Cupuys3Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789525792; c=relaxed/simple;
	bh=ApIHJAmA/+8e83vwR5ra2EnXDhNzHiDGza0aTdN5jHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlglccirnQSVA5xvr8+7wrvUW0WYuexYzFNpm9Gt2Szam8wMcjyqF1FqW0rPxfPJHNhtzPna79tsHMowOuleqqFBgF6+cY1mTtWNcML8OnXNiS/ZxD5/KDzorsiiq+7/TuBGsmMjtKzCbYp1hBW6++Q/ypiZgJaTfGlqhi9WU9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqdl1V1O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W19RBoq6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqdl1V1O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W19RBoq6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM3DRN1932237
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 02:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UpGhqUpVQqb/n6saMxotWbAoMDKWAg1M5PagdsTso4A=; b=kqdl1V1OM+OqHvIp
	BVmWXlPgbEtCr/1GUwUhfXnLte557DAPHtvtUxyS9fZhTvr42JuKaV91Um1NJbPc
	w5GT3qinYQDDWEBp0k326JGua63HInJdsnFlQO/S0g4TKUp38zKn8JSzktRzDzLK
	FBgVjBJWiDNasWFEl3q8mGVAfiYZVtfqQ8JV+WTohjqxlmNn/tAHLZ6hAEsJFjND
	6i7Qk4GunShob3BaYnlRYoL6GjVd/duPOd08jeODrLwBKPUkQUuhNGkoekl0MWUg
	h6W0ejzZNmtZtrBaNSKMHuAfCaOcSNcbmnHsTlbsMuCvRwuGPmxBFosuTx60eB4A
	mc91Hg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp8s44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 02:29:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8696b921ac0so8283380b3a.3
        for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 19:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789525785; x=1790130585; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UpGhqUpVQqb/n6saMxotWbAoMDKWAg1M5PagdsTso4A=;
        b=W19RBoq6HaWXaItwS7VZNdkRUP13XZvJxgUfP0CylnpNmNsAVtqUdFy9qrQ5/FVpmI
         doM3GdTuc5QxfgzGYhC73KWPdzB6KViBperfMFmueGqMQ8DS0Fo/++OytPg3TIXt6X5d
         kmRchoXsUy7jSWIekPidOA2s6UhHm8q6dAUNrf3fViM5hg1WeHjmLZrE2tyYSyW4xnCq
         imN2naVDXMNZQh4hWNExk0NW0wSVWEJGC7rWWLYTfiiD93Bik1xCC9TGTUpKO46XBvEm
         UHSRh8QCI2RCvJV3twQjjpkSAN/nBqtr8FQDKKzg0aUBAmcJQ+1kiHk3Eyj1f+VDVXVE
         sMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789525785; x=1790130585;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UpGhqUpVQqb/n6saMxotWbAoMDKWAg1M5PagdsTso4A=;
        b=bnRBZcD+UVHzjzdJKhb14RCIkvhQNWvhjIWMdsiYyWG5w9m/Jpfi+NBwdpWx23lE5u
         35EpP6OCF3sNLB0TXOCtAd9jLO7mu0s5vDOKOWVwYn/ZQxu/1tIm/pVStJbdm/xD7Pic
         3hXx0mg83aCEnM69IJzfz3zlw/GAUZefXIR+gR+zsv11SeVE7Q0bj9SVq6JIE/QsKfil
         4GKInUsOjo85XAACci6tHzt+kGcBqqHVTvTqrw3FOb0PSeyWARqU8job1z6CrKLD4QQj
         ueatLvDikbjoPU7Fb2aGDgqVDHNqVFhxTTJGWxoQ6QhVxvECTkSIvtuXvFLZ5ohepCBJ
         IxVA==
X-Forwarded-Encrypted: i=1; AKwUvBzwjwV4/mPI8+RObSUHUXJtAOM+BZLuEuOXh4toO2rnQapUElnbgkxiIfMyFA8a1wk2IRbrTuouSbX+qA==@lists.linux.dev
X-Gm-Message-State: AFuF++lS+AIy2h3CnkfnvvRyxoPk0RsGspFXSHpTrYZsn6IrudM+vTmL
	+AsXG5UMJGMEOiGD3/wIzfU3ndjYNQOulHYiLZsituuFfb0cDID3dYr3DbaOHC0MIrtx6rHMssX
	A95kDL9+xtBWiiBUvUcTqn9Ft3kxHxAw/fHg9jucbzXrQ4/SFV6M130fyGKa52pUz2g==
X-Gm-Gg: AYBFou0tL788PyK46UvW4xMQRkVR/W8vfeX6N9CsR/kVDDC4C6nTzD5h5TZHCvYiaFA
	UoGLe7Ytf7SOkLVaD0QyYuAsBuOx0eOHPFOGvS6ox01SCM/UJKV6iSElquzkwyuNdpVhshqdnKP
	zhM7FkyDaIACbaTKNbw/5+6c7PFCnS0PwKbQik6rglM+e1MKbcmW6q8pF7mQ+xfq5weD/KwW3AN
	XpmBny7hJFk7MpOL0LBpscJSTxwmV3jVCyqn5sa1vO533TrLvP0PMcgfgSrvM7xGiCP9xHZ1b5b
	991ofpX7pOlUxQYB1zvJYFjy8s+Rjq4rkkdfzS+cq5bJ7fFxl1BIa8xIY3CqIxXjAS12Fo/nWoq
	j9DkBydHyqSKzUE2Wposfo/n0BvoAYAmEj+kMDZcp5KjuUmj2SLE7gaJUJLg9C8UZ
X-Received: by 2002:a05:6a00:3698:b0:857:72f8:dc97 with SMTP id d2e1a72fcca58-8723b394555mr1364737b3a.24.1789525784535;
        Tue, 15 Sep 2026 19:29:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:3698:b0:857:72f8:dc97 with SMTP id d2e1a72fcca58-8723b394555mr1364691b3a.24.1789525784087;
        Tue, 15 Sep 2026 19:29:44 -0700 (PDT)
Received: from [10.133.33.134] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-872024e6a39sm411715b3a.56.2026.09.15.19.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 19:29:43 -0700 (PDT)
Message-ID: <305e37ca-c576-4ded-b4ff-1f4eea3cb712@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 10:29:35 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: Andre Przywara <andre.przywara@arm.com>,
        James Morse
 <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan
 <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
 <317682e8-63e7-4047-9106-deea7bf96388@arm.com>
 <a340505d-9495-4f68-8ed1-c7e8772c28e4@oss.qualcomm.com>
 <e8a33eea-c54d-471c-9936-41762453feb7@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <e8a33eea-c54d-471c-9936-41762453feb7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDAzMyBTYWx0ZWRfXzWgsaEOCjuhw
 8ehgE7KHcTiJzHVi4v8aBAy4rYXEPmhDWUJI7FrjuRwJRkrX+cR4yckhdPMjrlbg029GmwOkLlV
 rJHwAcVgZMXzxqZBeAPoLZ6fhayZsws=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aa9ff19 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=brJ-6TMN6zN7E94x2iYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: YwA51ww3EEi2slweuCZfGpOJv9d7lBEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDAzMyBTYWx0ZWRfX+atLN/PQnaeg
 C740YOhAMIRaEhq+fabdQb35kB2uZ343/IRyknrGt/4PusRrVFoFsmhwsqsyGkDPRMRh+hXnn6n
 kXLkZfw/ISe7yhr1tTd1Sht4Oy/JPZ3VlAYtNvQg2oHMOjKaKXUpoXn6gBkatl3WvoftzcatmN5
 REIuhEXo5Lgik/Pdmzr64cQhSAa39yLs8xxLK6Kcwi85Yo0VdyNawBxVNx22wlzVtC4EUhm9ECP
 NcAiaGbKedGWBFPwExwPo3vnlvq6y8u/r8Yqjk0qAV2n0U88x+SOXFlL/DsRQFc+iK4FmysuVVL
 lFnNr/G/2OpogaMZrhZ/KJXjyRBel7Nu3eF622tiqdj6hqH0xKYEM5040VfbweAuHWODNUQJIRA
 ck5vcSvMH8lpm95qHHCns1NtGXZt3ibHwGQmIL3RSFB107XAySkSUdBu3v05Jlwv0lYk4jI3MXQ
 DNPuEWVrDaV1XkoG3qw==
X-Proofpoint-GUID: YwA51ww3EEi2slweuCZfGpOJv9d7lBEv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160033



On 9/15/2026 3:59 PM, Andre Przywara wrote:
> Hi Yin,
> 
> thanks for the reply!
> 
> On 9/15/26 08:49, Yin Li wrote:
>>
>>
>> On 9/14/2026 8:26 PM, Andre Przywara wrote:
>>> Hi,
>>>
>>> On 9/14/26 11:37, Yin Li wrote:
>>>> From: James Morse <james.morse@arm.com>
>>>>
>>>> The MPAM driver identifies caches by id for use with resctrl. It
>>>> needs to know the cache-id when probe-ing, but the value isn't set
>>>> in cacheinfo until device_initcall(). Even after device_initcall(),
>>>> the cache-id is only available if at least one CPU associated with
>>>> the cache is online.
>>>>
>>>> Instead of making the driver wait, expose the code that generates the
>>>> cache-id. The parts of the MPAM driver that run early can use this to
>>>> set up the resctrl structures before cacheinfo is ready in
>>>> device_initcall().
>>>>
>>>> Signed-off-by: James Morse <james.morse@arm.com>
>>>> [ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; 
>>>> guard the
>>>>    cache_of_calculate_id() declaration with CONFIG_OF to prevent build
>>>>    errors when CONFIG_OF is not set ]
>>>
>>> You can shorten that part in square brackets: doing adjustments due 
>>> to rebasing is surely implied, and you can shorten the rest, like:
>>> [ Yin Li: guard cache_of_calculate_id() prototype ]
>>>
>>> Speaking of which ...
>>>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>> ---
>>>>   drivers/base/cacheinfo.c  | 17 ++++++++++++-----
>>>>   include/linux/cacheinfo.h |  3 +++
>>>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
>>>> index 9f9c72727a05..f75e7f64038b 100644
>>>> --- a/drivers/base/cacheinfo.c
>>>> +++ b/drivers/base/cacheinfo.c
>>>> @@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node 
>>>> *cpu,
>>>>   #define arch_compact_of_hwid(_x)    (_x)
>>>>   #endif
>>>> -static void cache_of_set_id(struct cacheinfo *this_leaf,
>>>> -                struct device_node *cache_node)
>>>> +u32 cache_of_calculate_id(struct device_node *cache_node)
>>>>   {
>>>>       struct device_node *cpu;
>>>>       u32 min_id = ~0;
>>>> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo 
>>>> *this_leaf,
>>>>           id = arch_compact_of_hwid(id);
>>>>           if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>>>               of_node_put(cpu);
>>>> -            return;
>>>> +            return ~0;
>>>>           }
>>>>           if (match_cache_node(cpu, cache_node))
>>>>               min_id = min(min_id, id);
>>>>       }
>>>> -    if (min_id != ~0) {
>>>> -        this_leaf->id = min_id;
>>>> +    return min_id;
>>>> +}
>>>> +
>>>> +static void cache_of_set_id(struct cacheinfo *this_leaf,
>>>> +                struct device_node *cache_node)
>>>> +{
>>>> +    u32 id = cache_of_calculate_id(cache_node);
>>>> +
>>>> +    if (id != ~0) {
>>>> +        this_leaf->id = id;
>>>>           this_leaf->attributes |= CACHE_ID;
>>>>       }
>>>>   }
>>>> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
>>>> index fc879ac4cc4f..c33bb3c8bd63 100644
>>>> --- a/include/linux/cacheinfo.h
>>>> +++ b/include/linux/cacheinfo.h
>>>> @@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
>>>>   #endif
>>>>   const struct attribute_group *cache_get_priv_group(struct 
>>>> cacheinfo *this_leaf);
>>>> +#ifdef CONFIG_OF
>>>
>>> Why is that, exactly? First IIUC it's quite uncommon to use #ifdef 
>>> guards around prototypes (unless they are stubbed without the symbol 
>>> defined). Using types protected by those symbols if certainly another 
>>> reason, and it looks like this would be the case here, but I had no 
>>> trouble building the kernel for x86, where CONFIG_OF is not defined.
>>> So can you share a .config example (or give a hint) as to where this 
>>> fails building?
>>> And if it does, wouldn't it be better to always include <linux/of.h> 
>>> in that file instead? I think I see a similar pattern elsewhere 
>>> (rfkill- gpio.c, sound/ac97/bus.c).
>>>
>>
>> Hi Andre,
>>
>> On the #ifdef CONFIG_OF: I also verified that removing the guard doesn't
>> break the build. However, since the implementation in cacheinfo.c is
>> itself guarded by #ifdef CONFIG_OF, exposing the prototype
>> unconditionally could cause a link error on CONFIG_OF=n builds if called
> 
> How so? Just exposing a prototype wouldn't be a problem, as long as you 
> don't try to call that function. And that would be caught by the linker, 
> and then you have a different problem anyway (the caller).
> 
> The only reason to protect the prototype would be if a type used in the 
> parameters is not defined. And on the face of it "struct device_node" is 
> an OF specific type, declared in include/linux/of.h, but as mentioned, I 
> can't produce a compiler error, and even if so, would prefer to include 
> of.h instead.
> 

Hi Andre,

Thanks for the review.

I'll drop the #ifdef guard in the next version.

Just to clarify: MPAM depends on ARM64, which selects OF, so CONFIG_OF 
is always set in any configuration that enables MPAM. I had kept the 
guard as a precaution for potential callers outside that dependency 
chain, though I take your point that this would be a caller-side issue 
rather than something to address in the header.


>> from outside the ARM64/MPAM path. A more idiomatic approach might be to
>> use a stub to keep the header consistent with the implementation:
>>
>>    #ifdef CONFIG_OF
>>    u32 cache_of_calculate_id(struct device_node *np);
>>    #else
>>    static inline u32 cache_of_calculate_id(struct device_node *np)
>>    {
>>        return ~0U;
>>    }
>>    #endif
>>
>> Would that work for you?
> 
> That's not necessary and doesn't solve the problem: the struct 
> device_node would be present in both branches, so that doesn't help. And 
> given there are no preprocessor protections for OF or ACPI in the whole 
> of mpam_devices.c, that's a non-issue, I'd say.
> 
>> Otherwise I'm happy to just drop the guard in
>> the next version.
> 
> So can you say whether you have a .config that does not build? Or was 
> that issue just pointed out by some picky AI review tool?
> Otherwise I would drop the guards, and wait for the kernel test robot or 
> Arnd's infamous randconfig builds to show up the exact problem.
> 

For context: I did experiment with wrapping all the OF-specific code in
mpam_devices.c with #ifdef CONFIG_OF, but dropped it for the same reason
— the MPAM driver depends on ARM64 which selects OF. I then kept only 
the header guard as a precaution for potential external users, but as 
you point out, that's not necessary either.

Thanks,
Yin

> Cheers,
> Andre
> 
>>>
>>>> +u32 cache_of_calculate_id(struct device_node *np);
>>>> +#endif
>>>>   /*
>>>>    * Get the cacheinfo structure for the cache associated with @cpu at
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin

