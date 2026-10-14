Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F23547F2E7
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962048; cv=none; b=fhJNNJ0rddKhQDYrOIWrr74Gnxjwy2wLGEQSKH9fxqiNO649fEu2GBZLlcwUDyHHcI4PLkAlA8BE6SuEzUT8DhceEoEXwT+MbgpCo9LI4ujNC1UIRcqX5C02jw3XyQtnv6hKs3zyS2Pi2uTX914ApSlprcD9HRsx7O96NjBg6+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962048; c=relaxed/simple;
	bh=2+ue94dCmSYfAFt/squqruj5hYpfGvLZ625Z0fOQRfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUbPKu7LKsVWeTYjIcJhFTYMxEOF+GC3SgL1E/MWN4dtmUm/WaOITD6sCySSuQ3bN1TJkOZfcHV3/nyEZ4a5ub5MWuew5GVVdVaAyCD4ojeukjxI/38hjfd9D5+3dc8nQL5JFGpeED6NSSdBSwYMMjK6Wp9Jm7biVfMEV9FXMpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYqvlNGd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MaTGNfhQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYqvlNGd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MaTGNfhQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E6637g3365360
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=; b=JYqvlNGdbSkKupvU
	cb9t1+dgmj0aiWB8a2Q+KhxcX7UtsV2RF4XYYtqTeVyH7245e8ixc3jS0i9N1mLC
	PQAiYJLDbjKWxc7GI8tLpVUGeKmDnHw5LRDFTuHSAKhfXDfOv6h1MOyXrJ5PdsuW
	64uclrpTFrYt58BP3CC7Lw4BY2xsUUynJA4ivW6cgtlMefqAp43hWiDFly8OxTyL
	9Ka9yZdOxceJAK8tVY7DdLPbdZ2eGzUeisEE3Lx5hzBuhCpv/srikxNGhF/2hpiP
	QiT/PBqHVSPYUy7AUZMPnjjvLKun4z9pOX5Il7S51Ey+lH7Bb2YJFN7tbloGtEcz
	JM9Q9g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46208tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:13:58 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab868fe362so4689620a91.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791962038; x=1792566838; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=;
        b=MaTGNfhQZtKo9nQJQhX9wMzlG8d+z8tIZdgEy/7JDG9B5y1VNvd1FaCv9k5bRar3qa
         rdMRFyWGiVD1il53LMqHmvbZcEiWC2su4VW5flpj/Aq6NDFpYSMFZAi4gWGqbyYhLWMy
         YJIqAixcczksi/AwEYqxamYdGLdy3hzrGxF/Xy2y2fanzYcV61hv85BrsUnAIv1N+Agc
         QlMoX3uvXE2UmyYewxbAXM7kKrgTLSwBThHBo7XLljQD+FTyMpfszoeul011vBpY47io
         ckcqxZyq8ucyC4yWcM3vcvVq/b38MQT5snW8mroLJ5LGh5JXbA92xukF7jcuSFE1i+XY
         9xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962038; x=1792566838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8A/v1ScPhnPL3wg2XzmpvQmBVh7gCGcc/ddSXg+qT8=;
        b=2hO/CaSQEI9K1vqFoqRgdHYfkgNZG5y61LiXOQXKV5T/BiYQydUsijnj8O5eY3MUPo
         ex3uATDIdsWMZxbJ8RpKXvpIoCDIknrlgprg1X+2VwzxfCPnlsGuXLxCpyfsQGTc4ekA
         XaOiw26YzhJeNLcxmQuCwDGaaihEzJnTHGiY4mU8nPWrnESmnMbVg30li1aeD0ciIbgO
         4hcuTvMVAagMUSt3W4W7EYW10bFkgAtYSppxBgSx1sYXRswUztSeBynjwk3jScubyenZ
         dRU27Hax8DgI+R727NirLkedU+OI2UQmyhkx9Z6kkwYR/jGqu8rDuffuBoGEmK96mDWy
         wQAg==
X-Forwarded-Encrypted: i=1; AKwUvBwJPKb5YQNTQaaBJqIveeeH7CUnpVGTlR7oakEJkFz0m2ucGwcL38/uHOhoPgSAJOfyCv2yScjTPyYCGA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ8GO2NZOGtVc0klG1qPk7bpXdvmU5+ESNPm7uTGhPTXmFIkCqe
	GRCgcbkWDE8DmTriAvZ/crvwJ61/w3O/+XtiavykK4NYin/MZpOBlc5l6OKRHQj7wnWNdV7cgzi
	ir9T1ld8Uti6wXuMAHIAxdiW9i719vUDSHx1kAmHkqdYlgjhKgE6uTUWkYUaSeSGkWA==
X-Gm-Gg: AYBFou23KNacNllAIMhXRpdRLUXbJj6EbaZyEEGraOdAYsEkTP+ZcDPlNyTIbo77DWo
	eiiENfx31Rn2eGKrqgwf27V/sJaeqSLlwwUKgoXiJWgxIIqXlnSmp6WsXtIAMZNRjCn0cmuxv3z
	m2rCWjTxCX+0LgVqXtJ5cBn/FOLAdGHjLSbbV2kASrYCTAPJOi/ervcuUy1zJMozak6yjdx8WrS
	2dr8mjIV6vJXQ7rcwSgjdBELhq5Dp9FRKVEPZZAvD/zAatfQwUh+y4b1t8iLP4J2VvsLMiEEeQi
	DEENEXnWCclmkxU3seF13jrK7ThTArwho8FhObWlc1oWYq361Ws6wFiV/O5KGrycP6s3sb0AOP2
	IXOHjihsjMxNTMm/fNGjRX8c8hfrfn/TqEnXmnAVUsje2190Il4ixPIpUGX0dwuI+
X-Received: by 2002:a17:90b:35d1:b0:3a7:971:7470 with SMTP id 98e67ed59e1d1-3ab3ab20a3dmr11251814a91.47.1791962037970;
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:3a7:971:7470 with SMTP id 98e67ed59e1d1-3ab3ab20a3dmr11251780a91.47.1791962037472;
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
Received: from [10.133.33.145] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6006376bsm3136909a91.3.2026.10.14.00.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 00:13:57 -0700 (PDT)
Message-ID: <db1f275e-b97b-4be3-9295-acfb22875afb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:13:48 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
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
 <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pXnmbLVyUODQp34j2VLQ83orPI2U9GSo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfXwI8bDGuKQwdN
 8xr2JZAVjQCUw7MAc+R/SEzIfhfjA+d/NBplocvxpMCPFkbL/6G0+CkuK9PPui9kFuuvaDYczfZ
 QqhVLiPfTH9Oaid0mOsJGb0JQfWEQbs7gv7metbhGNnJEl/gVuCgQDbNd3CaIM19pthXC9GFTH/
 RN/5FJmyBrXIuX5CJEQDHBBCYy9UUb2gcYqztNXtbRcKo5IYqITueaY1RaJ6b+YxxvnJKzomgv+
 c4dAkM+s+tPSdWTs2RE6z0iXqDXKFcbTDiZLmy+teduxsSk2P1hwOhDWqOOGh1dumReFgAx7HRD
 1a40oVA/oqcZn/rJbckkB6owO2mmSufCf+vbSpKYfcxMR1/GpmW8F2xWhpXmNpMURwNbgJQ+hLt
 NmogIbDtAEv4Bdwc9uGI/+se//hyr04Psdh9TKa19jBEZP6IWYZGzTCv1b+U7vApnXBTMPx33At
 8exzIco5eMm00gRrp7Q==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf2bb7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0BaB_ceHjnLeFdfrkW8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyOCBTYWx0ZWRfX8MiEZHldfkHz
 oHOuoYGpzqfEObyVtcaURydNa9HNjYEmBKHMGdfuoljFeVeEkuEgYTBFPywi4J0QmlK33O0szA9
 C2BopH62NHBF0OLcZLu1J2vQ8GPICQk=
X-Proofpoint-GUID: pXnmbLVyUODQp34j2VLQ83orPI2U9GSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140028



On 10/13/2026 6:54 PM, Konrad Dybcio wrote:
> On 10/13/26 12:13 PM, Yin Li wrote:
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
> 
> In Qualcomm DTs we tend to use the ""how much register space is allocated
> for this block"" rather than ""what the last used register ends"" approach
> to avoid holes
> 

Hi Konrad,

Thanks for the context.

Thanks,
Yin

> Konrad

-- 
Thx and BRs,
Yin

