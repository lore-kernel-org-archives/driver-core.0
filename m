Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346238F938
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 02:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490367; cv=none; b=h0TWdxJqZ5PMJNJZrDerUSultjj2Xydlv0IiCJ/PVSP2bbIpnJ60m7R3eFLUpyNfaFtc0OnbwOzBkBx4OSE1hTK9iWMzSTLZJD6WNCVAVTNC21+KNNjqQuGswTrJeJ4oKJMmtC521/S9RkhLsqgAogcP7M3aN9WGePtFc0n1VsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490367; c=relaxed/simple;
	bh=QlMujZHC49IWB7sZXkB18nNzk/S5D8y89vS/hMwmN7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rMaiAG21YgARUYZ/SuuosEpfp/EyoNk/xL1VQyHJzyokj8cdyblnWqGRfuk5xdUJMqgtC4q9jGfVe7sByN4BIl3+gTQzKrr8xcE23s9qBCNYNCAuzgyFP4BTNjotniA8jyAs0jUd8zgSHu3GnK+vanezOnLSRfwOLzBCjKKVXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BHVHwmbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsYfrTod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BHVHwmbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsYfrTod"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6842lOqA2341550
	for <driver-core@lists.linux.dev>; Fri, 4 Sep 2026 02:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FnVT70+tbIY9nO1tANIx2ub75kL7OtpAGxjZArmoyvM=; b=BHVHwmboAVjavFlr
	M/bwo9cFOktxOch1SvGGL27JT5WKyHSRKcEulq2mTu/6ffxeUklaQKP2kq8nbBqa
	PnyCo0Hmd7ehwlf0x+iUVRUg7BpmgrAsAgRl3unAtE4H7D6fVEgWxwfGRwEKWC6H
	ZEbgl2J+++VTVRO5HrsSyFEnOKO7LO2ocEoA0/aofQjsvVOwCjXh6gCAmeO2FskS
	cnbNwh3Bd7i4koi/97+xAm8OgiIoqQXoPQabLETW7J1GgItplbcfdhInw5QKJq5+
	MiKSYjJD/FolL8aQIfxyFzT/YEaTCBLHokQsHDNQAA0a+yNnlElzKQHySWuy53l3
	6OVwOg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyxhqh4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 02:52:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so776794a91.1
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 19:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788490358; x=1789095158; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnVT70+tbIY9nO1tANIx2ub75kL7OtpAGxjZArmoyvM=;
        b=ZsYfrTod0qDwYsd7DgyMaMCK7bFRfX6rhd7jJA9PHJHmo2uAclu7TX/W0BWHbavG+L
         4j6N1jgGtHwRYZYa3CnsisWl0j5wvnlKkb3dKexyM8t2FE8cP5mCWP0s3T7QpG0TVOdl
         0uJhWDmIf3HIriim0cSWUot0pQqw6r/X175+hkPT7NCS+sQkNlTEhBwl18wciYfkIr5W
         8tXjfNl8ogmghohIS0EdPTuxBZ+gu/dQtdvX3dLoKngPRbN8dyffpRz3CnWpyQhICVvD
         Pdaa8Bx8I9523aFqZfhFki2jONmxGDQ4VfdwXp/d/DgMG+4GjBxtdlknfAf2wVQ7+1AV
         Jj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788490358; x=1789095158;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnVT70+tbIY9nO1tANIx2ub75kL7OtpAGxjZArmoyvM=;
        b=D1/Nqq26s9VFi0qH0NhfnuG3/CL1bLikFP47XgjSr48IYpqZTGPya53cS/PTL6yS9J
         AdRPXEpola+rLpgNoxxlRMm3eipB/CLqpQdMQR1FhUrohQLSR51xy9wfB0pnEipgHd1R
         KFjYfNYFg9Pn3VwOAc5fZgNhojRJXG57RIhMeEN940ZtpVIS6UgliPpkNF8xlbwdoB/E
         ede6CQ+MBs6ACSfkYpxUQIuvY0YKmd7Ts2pfXF88QigPwWbYmJtuT6I5kakth9H2DreF
         /7wpX2NblKs4VH3Z//7uH2WDjH75ubFUtM4i3q2uFlLFqkeEz1xUXOzucS5NlNy9Qp3W
         Ol5A==
X-Forwarded-Encrypted: i=1; AKwUvBysq9HHdgfltPOfL9x3xPztfRFr056+TNgehgD2ImxhTGB0YdGVdKLOVxHByQf8S7oSBUYIRo8EGyKjTg==@lists.linux.dev
X-Gm-Message-State: AFuF++nrf5N4qV4us2e0h3CvYDxAU2jGmGat5TfAHsMpqC3b/nx9MJsO
	Fm97D2r2leNs5hwqBVbr5WMNfH5MmxBMvmMd0IbRB+5MTuoAGO1JWyypfKGyGT8TICDc3tlxuAZ
	keJYou73s6udj3Xc2WcT3jdiu8u7odIJIHDZ5/SoPkywBPy2ttQt2Rrp+XOnvbdFM1A==
X-Gm-Gg: AYBFou3N65JJW0AvAP7sNeWQcPR7Zt1vekbHYleP9PpL+jjIt7iLkJxEtq7m5ytZw+C
	Y5XXkYqX6wXV/4pVdH6GAQHsrWu3eAL5knWRcsM5DN735ogHp+EPn2gpKcPbFEZHI6th+nW2Zwe
	25JaQnWuPl45z9jxotynqbrmZ/9BI21u46SNz7HMsENiBu0E6dzbJAUXfxmuLXNhCypspBELbuI
	X7cioD4BRCTyKPCFWdk+DjDIujo8WY/RBT9iGaiCRbu4MzVXzcmBfqBXxNzmHk53gYFH4iv6CVL
	v9AsikM+NY4P4Oz6HqqAAopVqZtmxH5WZf4Uo/IlphWgaPyHxfX3G9T2i5jlGgnEpa8s/Do6tUo
	6+lzfyULUv7kyH0vNhPPwlo9ithbJmIn5tFX4/hY3zul/RVd6drhZPXNDaqAp7ynS
X-Received: by 2002:a17:90b:1d4c:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39b27c121dcmr1781104a91.3.1788490357893;
        Thu, 03 Sep 2026 19:52:37 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4c:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-39b27c121dcmr1781087a91.3.1788490357390;
        Thu, 03 Sep 2026 19:52:37 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm8536044a91.16.2026.09.03.19.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 19:52:37 -0700 (PDT)
Message-ID: <0365be38-954b-4aaf-b73c-76bf9e3a86b8@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:52:29 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 00/15] arm-mpam: Add basic device tree support for
 resctrl
To: Ben Horgan <ben.horgan@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>,
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
 <8f0c4f14-d0fd-4b57-a080-7011fbc54be0@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <8f0c4f14-d0fd-4b57-a080-7011fbc54be0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RCiH2eIwi28rMVb7Nd-x61ZPXPmFzmvO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfX++8ey9XOuliZ
 8i7DbNdpT30Emx51ReIAEdiAwCvN1EyDgp437FU0k7QsjJk2IvLyrxeRlPKYdGJORWCNSSr/tw5
 XRRPNqbkZdc3KNT8EKSJHR5cfHEEARk=
X-Proofpoint-GUID: RCiH2eIwi28rMVb7Nd-x61ZPXPmFzmvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfX4ARyiJ6KtX0t
 wIqS9kuh5i5jINDHyZXQdvRiXYTI/Nt0IRIR1/fyDPVnrqhnjB6LanC/qWJFmLihiZrGEBo8oEY
 m95coUGB936V457/aezq1sxO6h9WLMC5j1cwDwLaYF0dZBR5/F6DOoXUaCkAKgs8vz2n8iQsXOc
 SpTIooMprkGFE0XIexftI0N1+8QQPUlXDbb5jFR4YHEXlQWuqUwBL0wjnLlCj3xDLHet+vh1hPQ
 oPkHIlQvqbwzXjiHVDcObF7s3OZp9DLLWGrfXqCpiRTIqy2jmmMn9DLp6JOurUj7WMnK5FjkgoR
 0PXcIr+OxLJHGEBMnFvLgTvkhKqckYITVtEi6cP5FnjsRDP0mLO1iq86sGBK/kXu4jQYd7XAi2a
 CJqNajI4qRD009EbNdgXRna4dEsoDtIkSmct6poBFa+t8ik24ePRVRWC4SOBdYGfkieOTQeOnFT
 8bljv/nTvRcT5vzb6rg==
X-Authority-Analysis: v=2.4 cv=X9Zi7mTe c=1 sm=1 tr=0 ts=6a9a327b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=JZ0jlq9R20JS8rWC7cYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040023



On 9/3/2026 6:11 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 11/08/2026 14:30, Yin Li wrote:
>> Notes for James, Shanker and Rob
>> --------------------------------
>> This series builds directly on your not-yet-upstream MPAM snapshot
>> patches from the mpam/snapshot+extras/v6.18-rc1 branch. Two things I'd
>> like your guidance on:
>>
>> 1. Do you mind us picking these up and continuing to extend them? We have
>>     kept the original authorship and Signed-off-by intact and documented
>>     the inherited-vs-new split below. If you would prefer a different
>>     attribution arrangement, or have your own plans to upstream MPAM DT
>>     support, please let us know so we can avoid duplicating effort.
>>> 2. The fixes to the inherited patches are kept as small, self-contained
>>     patches on top, purely to make review easier. Since fixes to
>>     not-yet-upstream patches would normally be squashed into the original
>>     commit by its author, please point out which of these you would like
>>     folded back, and we will reorganize accordingly.
> 
> Yes, MPAM DT support would be good but does rely on the DT maintainers having sufficient evidence of
> platforms that would benefit from it. Folding fixes into the patches is the way to go, you can use
> square brackets, e.g. [li: <what you changed>], in the trailers to make the differences clear. This
> way we avoid having commits with known bugs.
> 

Hi Ben,

Thanks for the guidance.

I'll fold the fixes back into the respective inherited patches and mark
the changes in the trailers with square brackets (e.g. [Yin Li: ...]),
so there are no commits carrying known bugs.

On the platform evidence: the series includes a Kaanapali DTS node (the
DNM patch at the end) as a concrete example of a platform that would use
MPAM DT support. We have validated this series on the Kaanapali platform
with that node enabled on a local test setup.
It's disabled by default in the DTS since production firmware doesn't 
expose MSC register access to the OS, but it should illustrate the 
intended usage for DT maintainers. We're happy to provide more detail if 
that would help make the case.

> Thanks,
> 
> Ben
> 
>>
>> Rob kindly provided some early off-list feedback on an earlier draft,
>> which this series has tried to address.
>>
>> Add Arm MPAM resctrl basic device tree support.
>>
>> Arm Memory System Resource Partitioning and Monitoring (MPAM) with
>> resctrl requires device tree (DT) support as a prerequisite before any
>> higher-level functionality can be enabled. This series provides the
>> foundational DT binding and parsing support for MPAM, laying the
>> groundwork for subsequent features such as MPAM Firmware-backed
>> (MPAM-FB) partitioning.
>>
>> The patches are based on earlier work by James Morse, Shanker
>> Donthineni and Rob Herring, with fixes and additions on top:
>>
>> Inherited (authorship preserved, with fixes noted in each patch):
>> - dt-bindings: MPAM MSC binding [1]
>> - cacheinfo: expose cache-id generation from a device_node [2]
>> - arm_mpam: device tree support for MSC probing [3]
>> - arm_mpam: memory controller MSC support on DT platforms [4]
>>
>> New on top:
>> - standalone fixes extracted from the inherited patches (device_node
>>    refcount, cache-id sentinel/type, RIS index range checks, MSC window
>>    size, accessibility return type, foundling MSC creation, cache-id
>>    error path)
>> - dt-bindings: schema and example fixes
>> - arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
>> [4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace
>>
>> DT affinity model
>> -----------------
>> An MSC node is nested under the device it partitions or monitors. For a
>> cache MSC this is the cache node, so the MSC's CPU affinity is derived
>> from its parent cache; for a memory-controller MSC the parent is the
>> memory device, which is accessible from all CPUs. A per-RIS fallback is
>> also provided: when an MSC sits under a generic container with no
>> affinity-bearing parent, affinity is resolved from an explicit 'cpus'
>> phandle or an 'arm,mpam-device' phandle on each RIS node.
>>
>> The Kaanapali DTS patch is for local enabling and verification only and
>> cannot be upstreamed: the platform is already upstream with a public
>> device tree, and production firmware does not allow the OS to write the
>> MSC registers, so this path only works on a local test setup. The MSC
>> nodes are disabled by default, serving as a reference example for other
>> platform DT authors.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>> To: James Morse <james.morse@arm.com>
>> To: Rob Herring <robh@kernel.org>
>> To: Shanker Donthineni <sdonthineni@nvidia.com>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Ben Horgan <ben.horgan@arm.com>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> To: "Rafael J. Wysocki" <rafael@kernel.org>
>> To: Danilo Krummrich <dakr@kernel.org>
>> To: Reinette Chatre <reinette.chatre@intel.com>
>> To: Fenghua Yu <fenghuay@nvidia.com>
>> To: Bjorn Andersson <andersson@kernel.org>
>> To: Konrad Dybcio <konradybcio@kernel.org>
>> Cc: trilok.soni@oss.qualcomm.com
>> Cc: aiqun.yu@oss.qualcomm.com
>> Cc: ganapatrao.kulkarni@oss.qualcomm.com
>> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
>> Cc: linux-arm-msm@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: driver-core@lists.linux.dev
>> Cc: devicetree@vger.kernel.org
>> Cc: trilok.soni@oss.qualcomm.com
>> Cc: aiqun.yu@oss.qualcomm.com
>> Cc: ganapatrao.kulkarni@oss.qualcomm.com
>> Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
>>
>> ---
>> James Morse (2):
>>        cacheinfo: Expose the code to generate a cache-id from a device_node
>>        arm_mpam: Add device tree support for MSC probing
>>
>> Rob Herring (1):
>>        dt-bindings: arm: Add MPAM MSC binding
>>
>> Shanker Donthineni (1):
>>        arm_mpam: Add support for memory controller MSC on DT platforms
>>
>> Yin Li (11):
>>        arm_mpam: Fix device_node refcount in DT resource parsing
>>        arm_mpam: Fix cache ID sentinel from ~0UL to U32_MAX to match u32 return type
>>        arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
>>        arm_mpam: Fix ris_idx type to prevent range check bypass on truncation
>>        arm_mpam: Fix MSC MMIO window size to use resource_size() instead of end - start
>>        arm_mpam: Fix update_msc_accessibility() return type to void
>>        arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
>>        arm_mpam: Fix get_cpumask_from_cache() to clear mask on error
>>        dt-bindings: arm: Fix MPAM MSC binding schema and examples
>>        arm_mpam: Support MSC accessibility derivation from RIS nodes
>>        [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches
>>
>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
>>   arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
>>   drivers/base/cacheinfo.c                           |  19 +-
>>   drivers/resctrl/mpam_devices.c                     | 401 +++++++++++++++++++--
>>   drivers/resctrl/mpam_internal.h                    |   2 +-
>>   include/linux/arm_mpam.h                           |   4 +-
>>   include/linux/cacheinfo.h                          |   3 +
>>   7 files changed, 638 insertions(+), 43 deletions(-)
>> ---
>> base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
>> change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
>>
>> Best regards,
>> --
>> Yin Li <yin.li@oss.qualcomm.com>
>>
> 

-- 
Thx and BRs,
Yin

