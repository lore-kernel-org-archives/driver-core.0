Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188967;
	b=CfyZlNafXYRblFH1BLvgDZ/6NlBI2v/3FkCY07mmaPvS2kXc6mLISioMnLY6p5d/AbDj
	 vMxC1zdv7U+qWt/2YMWNdVkW3S8vthE12Tsk+7695Lm3Z5b5g3prRno/6A7Eglk+bC14d
	 fO2nZ46LHxmlib45rX5Vht2ctHmtmi00CXhv8xEnvsNqyA+ykv6Oc6jtI9YrFjsr8XF75
	 y6is2rBnZkX9IUOXpVWXtWjDsmqvgOO6g8VZh7A3EaHMD7G5vDGOJNmyyDTKrPvbdDoKa
	 FeWJ0j/lppcI32Uzd+3ILYGjTqdtczUOD58HZYiUa/hLKdDXmpb7bfxpho7kavhdeXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
	b=uCr0i/K+R4w6pET3ShzxrU1PPOGiN4GQfYwvssAM+BtQcu57WsvupuY8LvX+MgOVUEEL
	 Ga2khWx3ME13EuZLY/VqgI2AlR4NZKimikj04A/bR0vlk3EJB/7CvjdJFOV7gTSp007dh
	 yuGs9aRK4vS7oPhNJ2otskuQrlKQFji1gKSvWpRkNdVqaJhrKuigVxfwE2yB6Sa1ZsLV6
	 1314LSRJuc7oJnLq/rImQNW5gdGZ8YBLIBr8y/B54q0UKZO/9qlyd+zkAimgPNmMmEgah
	 peoAXKE62iEUkw3PJ71RlvKo4vfoUcKcL4r0acCKpPvB6gm3sSF4znxM2iT3ACTJ/gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtHnINnJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2t3ypC4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0CF606A321
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 12:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0CF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mtHnINnJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2t3ypC4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdw7i2105569
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 12:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=; b=mtHnINnJIejV7VQr
	7XTk20uGRV2y/3Te1QAhRDX2iZ5DlHcXVE1IPb/I5sk80IV03hjICUm0v+XdboOL
	b0+QbELzt0N1/AWIqSBWtUzaEi29PIkXKRsdiua9fHWiIZNZ9kvp/tddr33rdd9Q
	1jaZENQnCG2vsEFsy9F4G/MXv/wjKUgziSuDPbNzaZ+XEADcwV4ZvNdRohVzdHDz
	wPlBvpPQgtNpSTOF0y+QyE1CWRWIHdKD90E3tTmdck7jvapy8s2Svh+r2LGTxVhO
	TuhUegkuK5agRkpK7wKAmQTCfBxZcsC4qyupOf4Etfhq34joM52wkBcYcNwl3WRi
	D1IdtQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pudqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 12:02:40 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cca35cf9f77so585945a12.2
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188959; x=1793793759; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=L2t3ypC41q2lbdz+vT4eDbSOPpYtung4rM/BUlPdbIqDhweNoG7a+mgXKjcYgxhvCV
         lyeOTVaenNYVduDyDx0uKRgXwAuBhEmDdcXRwpmJPFBmKn4BQlHwDnIror8DTPIlAjcJ
         JIydnYMKU/9O6J5ODnMYobZl9U1PzyMXq8QvK7A9BszMYgZK1qEbKOZJq8Q6UwVXoWDJ
         269Jr4ZMXuDbMMEYowSqqZkxGi2rskdH40aaPkYcm9pPszZ7bkH4ldvya0BnGlTFv3H/
         STU03hhD2IcUvtZ+sZ2rz9RRt/CuCcev1RJ4DDlePtF3bOgnH1ENgWI3qODfCaRFrIid
         KiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188959; x=1793793759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HIrlthp+nZ6mkyIpoQSPilbZ24G9okH6PlYynTxe7dU=;
        b=2jZ8KtRDi+2JwQWGHoMBiPUKfT8iXDAmQrB9T/j9r/Pb20RJ78iHwAO1TSOe2Q7DIv
         pp75yEtczk3Zmvqft55HdzERq59PPvnUHUTB6bmBO9Oocc1ncLr88JnvMaIwG+MwvwVS
         tnZpz/tPpE7fmYHAwc6zompgCrZmbN/JNQqlBiHC6C933Hn6W9p2tBGOSPCm5HdlMVNm
         TdUzlVhs8xYSzkF5rkfRQAgQL5XWwGshFKET4MvhuRE6pcFIWU1IgpVhGEQTu/wZ1RZb
         aBXP34vbTOlzDutdCW83kurUT0KbWglLur4b35mnHZcs5KZD+sfFHNWUQ+vz58Zw/p3v
         WcwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMcVNFzj4CwkB/YYuN2SGBbLmSUeazSOYXDl8yJClp0zjYJQOkbm3vsE1K34fVmUkeAqzQ4BxoWDHfUA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLoqveEmeyo8iFCNKLSKFt6P4I6ZNJum6Gr5ZMo6wYZKIsIVFrx
	ZKkZ4ezC3o9CogNYBaCAcNPWhXtYXIz0kpfXd8yJjzKpw8D/z7zlsS8lbtdH4f8TTehIk17fsVA
	MB7EGQYH2QML6inHCKU9kGbSuk8OoliBmmIoT4e2chRJzty3kH/nOl8Pkb2Wmkg7L7QrgftwTAe
	Gj
X-Gm-Gg: AYBFou16wyJncyhsZjKWq67Qc79OWoi3ogIXDkA0i4rCgA5ViB5MDF/HxwuCcwlScGI
	4SwyXMWQ7sQE9NbiiZKEP6zUz6TcUqkmgy+e/+yaD3ZVUL6t610GnrnVDDuNdbULtTRjkLWRKNl
	EpfjOsj6FM1M4dHD3r6rdetNkPUZGitrGi3+2hw0q2/5SfTpSf4bjU1ouwBGA/g4xpskwAW5hN+
	3xrGmQyAvySUCPDK8DrPXiOOgKmCojpr4i9scH7969SZStgPY/tvRhdtJ2cPxdyLw9cf6W/+uxT
	CTmF7FdVLEjtQe8G23dAmLpQaNpaOhxsnR06aAqmVXpQtSYFp7nQxI0mWXU12gSts6td0/GcMcZ
	tiKZTrhpm7aQ8lpLuOAtE4xc/4BhaUal1D9CInVSmEeo6I0spsWk6/bYUguLX8ppgOPIy+IiOCY
	g0Hh6d56jkdkH9swgeWw9k4h6VLVB1Qoiv+ydk
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396745ad.44.1793188959504;
        Wed, 28 Oct 2026 05:02:39 -0700 (PDT)
X-Received: by 2002:a17:902:fdac:b0:2e9:5714:6072 with SMTP id d9443c01a7336-2eb003ecf3bmr21396155ad.44.1793188958907;
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Received: from [10.133.33.208] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae64564b5sm21513925ad.5.2026.10.28.05.02.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:02:38 -0700 (PDT)
Message-ID: <6c74dab3-f00d-4567-b9c8-c8164867e8b0@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 20:02:29 +0800
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Rob Herring <robh@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>,
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
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
 <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
 <20261026122300.GA3598537-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261026122300.GA3598537-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f5PTImMsGW7Fok405tyh0U2xRX_H0UG2
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1e460 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JqYqai5FAWh4DW1MJkEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX1tKH43TtngXz
 InwF9yhLnY+SfxGq2yCBFb9Phx/eNNfrWZ6hzmAqylK/JFIqaT9zkrKeGUIb3vQ2qkc/JZ+5DV5
 HgSEhIRvLudw2nRe+FePE/VtVbCedrXVXkbHugwNcFnWGoQw5x9zMIZuXBmsk9G9Bqx9C3/Fs6X
 JkaIWwsvFB6qf8QvbjinbalsRhfIqzUoSyH923o4fS8aJmbJAShdOgVIMQAIKz/d5sDTpd+XDW8
 TuuSR1AstB+irqiykalMoZa/JqQxYO6wShlNiqptsEG+G2DBToVAiuu85sI0AXXLkUzWzbW/MSa
 Ys8cucmLOb8eCRp/Q/Y4/FD7gMYnLqZq+Dog+TzUqmXSiOej/hwQJrgELQUFq1n1VE4G996NLZ/
 k0yR1ktQWIacBD0MlmDZF2nFTGIFTy84ugSdp+U21dd81b0tt7kvIidN34HY02XztHKrMDnsFTK
 gffjLj3kFc1RsYry+ew==
X-Proofpoint-GUID: f5PTImMsGW7Fok405tyh0U2xRX_H0UG2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX+n0jy0s2KOOl
 bzbDtc2CcBBL8RvoGx8li8nIxNYgRXOtyhmaWLKcQo2D/w+zY6axFFAMnLLQ+L3vpNUvkF2jZ5Y
 jfKZSpJWdGQa1Jq3C6Krqnpbutfuc/o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047



On 10/26/2026 8:23 PM, Rob Herring wrote:
> On Fri, Oct 23, 2026 at 02:03:57PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 9:09 AM, Yin Li wrote:
>>>
>>>
>>> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>>>> Hi Yin,
>>
>> [...]
>>
>>> Hi Ben, Konrad,
>>>
>>> The original 0x10000 reflects the per-MSC register block size as
>>> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
>>> use "how much register space is allocated for this block" rather than
>>> "what the last used register ends" to avoid holes.
>>>
>>> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
>>>
>>> That said, this patch is marked DNM and is intended as a local
>>> verification example only, not for merging.
>>
>> If you don't intend it to get merged, you can even put 0x12345
>> in there. But for future submissions that will have the intent to
>> be merged, please stick to the 0x10000 size
> 
> Why? That just wastes virtual memory space. I know it is "infinite" on
> 64-bit and *only* 96 bytes of PTEs, but still.
> 

Hi Rob, Konrad,

In v4 we settled on 0x2000 for the Kaanapali DTS. This reflects the
actual register footprint: the platform does not implement
MPAMCFG_MBW_PBM, so per the MPAM specification the feature page is
permitted to end at 0x1FFF. The remaining space up to 0x10000 is
reserved for this MSC on the Kaanapali hardware. Compared to 0x10000
(the full block size as allocated in the KNP hardware), 0x2000 avoids
mapping unused space as Rob noted. Compared to 0x321c (the full MPAM
feature page per the spec), 0x2000 more accurately reflects the
platform's actual implementation, while still being grounded in the
specification rather than an arbitrary value.

We have now posted v4, which also reduces the binding and driver to the
minimal set actually used on the platform: aside from Kaanapali, there
are no other concrete platform users, so memory controller MSC support,
RIS child node support, and related properties (arm,mpam-device, cpus,
interrupt-names) have all been dropped.

https://lore.kernel.org/all/20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com/

Thanks,
Yin

> Rob
> 

-- 
Thx and BRs,
Yin

