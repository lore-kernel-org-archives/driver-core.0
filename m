Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C9411A08
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961764; cv=none; b=MxlQ6zYmL5biPFNiIPrli2Kbx72n4foEQc4L1k0C1P9dXCBKlCi7p4b1GWxmJYdKhGEhP7ctMA6fXjapEbFAb1PLzfGTZrzwMDEPbQFf5eaXZjPRGNWykUiinUvcIxo/211i3iOkxtjZVI+zTMvkDB76zzH3gl5j2jz43kGAisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961764; c=relaxed/simple;
	bh=Vqo8WZTmAqLfeBfKRErwPtgdcy8AHcIFUZaWa14fRVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj8/qVrDYjTZg/6wDX1UFmDLA8Eb51ChzF3s/WrFgOc4kzd1lzaOygs+tT20tjxd5E0xUrxwgj1o94P0+5WFQugg2/O9huUqBz9awW8yqYq8YSq3J7iuK7ciyvBPnKtsWvGvdJEg+ws59NpxIA9NnvrjejVLACm+tx5WcJvekdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GvD0/BR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDXwkNdN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GvD0/BR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDXwkNdN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E224Tj1592427
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=; b=GvD0/BR5zn7RHbt9
	tGJLDyKHaaIRIjlimjqYqS/zHeYc35ydJFm8Yc5OXsZe3kmiKxldKg0IniHgmv5c
	5uSoEc8PiiPLqIVWHaEEUcqCqGhofbNfPLLtkNUUSrFnkYtzBa+YFgMD1JeqNNlg
	L7uXwqmpGPsyDCqheJhMH8liT/r+2K4r8g3tIdohMcrEFB8O34kGz12pKHuc6qp2
	Y6HdNvkGtb3oOsoGauYzl/EDD9DImFODjaT6nJZSOHGZlGtgtJTcOHwpJvAxbGtR
	uFcOKz6jfmNkNCLY5Q6fao/NGfIxLEsFQJ2+S/8d3SxtJBUhjmI05yQ99FGDe3Mv
	MrBM3w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s1tjvvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:09:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso4094746a91.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791961758; x=1792566558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=;
        b=TDXwkNdNvn8ucHmg4SJ2a4VsZtVxWKMixJy7vOJg3qKNZMKLUl2yHE9YbOx4szMazK
         KlgCMs7gs0VrT5Eafv9D5WjH0npAtSKGPrQPj6iDqbYvXRx7f7tNeF3mvQOQhRqiL469
         GDJJ5yZegJZoJiJ5lC1sXc+kHIP+b+XcCCZswvGul2Rd6qrPetMPfHrmWOoAAA8JGEvP
         HZI+YlNorPkUHRoxmeBQh2Lo9ypVzasxDnRN5gsZ5l92uAQA/r8gb7LHhwDf7HHFl6h9
         MkftNmd9WeT/FZAIpSC3iU1Bo87hixnt5Ye6HzfL/rqjJ0ewRqpULx9aoc52CDSouuCt
         zcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961758; x=1792566558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDimXCojMVGcvs0uonLQ7d+VBtHE9WDGJuZuAfpDOhM=;
        b=0HJOy4D1uoTZM0YMIBzMOW8kbikMHb9sZJuhJlrbva6DLcz0uHBfnVFwMXX54XCLYz
         M/BpQiFhIa4n3CaA+oP2X75MPbNtCkhJeCbfO7iltWAYMHW+ftY4LnOGcoFHzl+0R9vX
         59GnAgT46/pvX8k4qBq1PfHFE5Hec+vcitfM4DZmzopj6qZZ9J0OQlGz60ezyh4mZUT8
         UjFRtIVMMI1tbYvPMAg1SovzrAP3nGOtBs4V6jqLuHpkrM4WkwrHn9PAeZg1U3bZRTd4
         jvSNH+IwAqwAKJ8EejCMO/pMR8/8lCWmLQgmO/A/fCme2MxDh4kKkyAW5dacD/G1sTwX
         OrRA==
X-Forwarded-Encrypted: i=1; AKwUvBx5otfcYTAvDSeQBobbUQlNERFrS9qJj1UkJ5rgzgwkTNdPbBs6OXqmAtFJO+Vpu4YaqM6+1wWXlMmSrQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLnghLUBnkNFCG8fBGYDkGvqw6Rov+PetV9kjr0O9dJvpAEai0l
	qBx8/7cD3q2Ibf8gUBfa13g8KU0cqDsaiy7hXnDcI/gApvDNIIce7lppSDysjJnmpUnfWUN8zqG
	Ht8A7ZBODFCM/6AkdgNv27I12ThE0Dw6zZDnzXzWfvRydGmK4LK76bzqaOWYKgYk3Ow==
X-Gm-Gg: AYBFou0jeP3RZmPvsA3cp7c5eEwCkDind0Shg85zps0tw0ldHtxQhxSJG10FeorLdGY
	Uc5se9Lk+7r2ToCOl/k34lZmiCKHB95jHTtwc4xqUUtwt5xNGXpleV/VT+iqFomKgEfzyOZ2rad
	Krm5bLrFCH8Ddr2EK10V/1YqBtxUbicTxdJkef0us59tjYxP48b6Vwjo6vcgpwUPUF6vTyz2Ig1
	G+POZ0BUAofTCQ0tdvbjJeK4Nj3trcaYxnmBnRstSlZmn2qePffAmJdI4AxQvq8Ra+6xq3Ub003
	8U1KdajxMkgmzJwUrAMTaoixbsrhYSZ0sAZwjH+wVgVH3+A5iRikSY+6ZDBYikNVQodxGr2x0GL
	eWX8OYfYToRsRBrYr/6Etso7/jqbIvCRDijFHZZLa0mAuSgAPmnIugnSUmKeZ3sA=
X-Received: by 2002:a17:90b:4f41:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ac6e91416dmr978172a91.37.1791961757428;
        Wed, 14 Oct 2026 00:09:17 -0700 (PDT)
X-Received: by 2002:a17:90b:4f41:b0:3ac:6e91:3f1f with SMTP id 98e67ed59e1d1-3ac6e91416dmr978130a91.37.1791961756667;
        Wed, 14 Oct 2026 00:09:16 -0700 (PDT)
Received: from [10.133.33.145] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm6432925a12.5.2026.10.14.00.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:09:16 -0700 (PDT)
Message-ID: <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:09:07 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IpOL47/g c=1 sm=1 tr=0 ts=6acf2a9f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lWq2qqVSSi_Om9X4mrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX1fw9jOUOes6M
 nMTrUZZ6ugGErtb45qV/B8GZTfESaZ1GqoBHHy0C81auGiWfLgcw1eNCoyAJbEdkDCI3oRcVvF5
 JfoZa3RKNDkzXmmJx9DaBAMW29daOPIa5DgpHE5/4tOAhPav6jFpwfv+R0JN0exoqyeksqXbvW9
 i+W93JB9mWpYTmfJMlCQXEogKGQ/fSdmJp9X+fAiefHf4oOuGmX5bEgtWYk2P2yjVNyA7Keexok
 2kouLo82nfHlYXMeM2UNo4j5WpKqmMOHDbk0bCBohRNo6y/fG0TDaKXPu33Uwtfj5qC/XSNKqJF
 3fbAB6QplW5zkiuJnoYR+FD251TQ+gw5r9RxjmpbbFcfvmmmd/RqITbdR5CVXnGAZ+svD9iA+YW
 9qR+TGVc9rF0wT2oqrXPHvizDCfVJXeLeXbM+8SXupe3SBEmCWoVKSjsU5pN1NQ/ylkwfOoYX6w
 PZOrv7mfH2uW87RpndQ==
X-Proofpoint-ORIG-GUID: 8hGn9ielf609KZgmlLlOIBH9VJvZd7WF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX6SuV8SDvVxev
 O3JxTST32Qt7+xI0Cr8NMdJ7uk8mf0v7I8Ye/wqJqZpt/g7xyQWlseznYjepGOCPAWWm2KzzDTh
 7C+Hdt+95MDQLsmEiTT1sLIcWVZleoM=
X-Proofpoint-GUID: 8hGn9ielf609KZgmlLlOIBH9VJvZd7WF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140028



On 10/13/2026 6:37 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 13/10/2026 11:13, Yin Li wrote:
>>
>>
>> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>>> Hi Yin,
>>>
>>> On 12/10/2026 11:48, Yin Li wrote:
>>>>
>>>>
>>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>>
>>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>>> the root of the physical address space, so each cache node only needs an
>>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>>
>>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>>> is not intended to be merged.
>>>>>>
>>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>>     1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>
>>> [...]
>>>
>>>>
>>>>>> +
>>>>>> +        msc@19870000 {
>>>>>> +            compatible = "arm,mpam-msc";
>>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>>
>>>>> The MPAM register length is 0x321C.
>>>>>
>>>>
>>>> You are right, the MPAM register space is 0x321c per the specification.
>>>> Will update accordingly.
>>>
>>> That is the full extent but truncation is allowed by the architecture.
>>>
>>> Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
>>> some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.
>>>
>>> Does your implementation have domains?
>>>
>>
>> Hi Ben,
>>
>> Our implementation does not have domains. So 0x321c reflects the full feature page for MSC.
> 
> Truncation is allowed when domains aren't implemented. I was just trying to say that that part of
> the spec (9.2.3) is out of date and needs to updated as it doesn't take into account the possibility
> of domains.
> 
> It's only domain specific registers from 0x3000 unless you have some implementation defined
> registers (9.1.5). Is that whole region just reserved for MPAM anyway?
> 

Hi Ben, Konrad,

The original 0x10000 reflects the per-MSC register block size as
allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
use "how much register space is allocated for this block" rather than
"what the last used register ends" to avoid holes.

We'd like to update it to 0x321c to give other platform authors a more 
useful reference, without exposing KNP-internal details such as address 
holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, 
and — as you noted — the registers from 0x3000 onward are 
domain-specific; since we have no domains, those aren't used either. So 
the actual footprint we need is smaller than 0x321c, but showing the 
full 0x321c gives other authors a complete picture of the allocated 
register space.

That said, this patch is marked DNM and is intended as a local
verification example only, not for merging.

Thanks,
Yin

> Thanks,
> 
> Ben
> 
>>
>> Thanks,
>> Yin
>>
>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>
>>>>
>>>> Thanks,
>>>> Yin
>>>>
>>>>> Rob
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin

