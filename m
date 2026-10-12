Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F071747277D
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799895; cv=none; b=W91d9p0Q0q/yt9sLoWdCV97Ox96F6DCRmu6uRqSJ4qvgYtS+DUtxhMsbai+WfrE73WNbS3/cM4MYN8SllNsYeJxWeyg1MJ5UrBLGLyxmvSp1SMjXlFwuVc+Ypb1GjNOW2Evdy3fNL81C0aFHuC5L012K9NloewcP5xaVnZRph+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799895; c=relaxed/simple;
	bh=TvsucdrpRWbg+nMNXlqHZpLBasZrZ8y3ICHplgkyc/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rKzp4e3Cebpv+4bNZ02wqXHBEFBTtiXbPOwTwdiSo/WUxzm5EuQmS4wFIa/MSr55UgtK2LAB/1zOyLUktO3GEIHMmN7o0Wq7XseoWYaWhaPZgJAMYcurI0hE8ormGoM+hVdsZspXZVAp/CUTJxq5mDNbkoDX19vz9GLJcRne0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWgNbi01; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hza84eGk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWgNbi01";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hza84eGk"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KcBW1592787
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 10:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=; b=MWgNbi01PvSuV0K/
	GF5vPCOZWMSjPDap+X8gxQFGn0AxFPzoOlEuhclgJlQoh+1EyVaLIEMI9aDt6V2u
	E4JTNI2xJ2WVBWFmrlPfqMd2FmMKaNzPOnQX9w0OdTYiFZ9E/sCmOwbgOUgxbPc+
	q9w/HB3hXhNDqntAfxEeSUNgCQapin4GrYsI26ruhS7cJrTeNRl9fGHnaUJximpn
	bZBRC/015zibDeqOHhuGE9WpdFLSI0wob5SUYSompRBWtA8qOEQfxY6fFD8hafTN
	N0/YQkRBLX1o4zVMPipBGfCyZ/0QUFVz7Fu3bHqYdDwOAb48flvJXm+DxewaaALa
	xQY4Kg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu1713-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 10:11:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc11b5dd54dso3721520a12.3
        for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791799882; x=1792404682; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=;
        b=Hza84eGkqozxhz0m8/XhH7GgXsYfqZ4eQ7ov5sLzkY8HMa/PU5VqHvttXZ4B3WgiOT
         kUdMJlFFdlH0pFbyitZ5wrYnpqJxoFuDZWiXAzfoRewiWnxO2Es7gPeSki9KcYMPwuxw
         380BR/AtIPgWB4L+z7yvmixWD2/wXUMiiz7lZoxwumsZHzopP0ItfQlt9/CDDxMsd2Og
         YNhuH7RRZ1TFQ2W7uVTaPCtyXK/pOJVxT0xtUEhu7QnqpVbmNYsIWwacoB1BBUVs2KJV
         auqvz26AswbrXYtApPYvjY9iwpNYvh9diJJBJi8Nnvhl1CFTIeoNhY4G4PftJFWdhfNu
         NMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799882; x=1792404682;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLO3xElZC/wcDFG9lAUoZKlFW4ekiZ3DscpSdqapZBw=;
        b=lg3FNDVh0vunVGfUfYJyW3NM2gONE4bj1x8jwTCNj255ovegOMkaWges47vK/5YtLB
         P7GJR78hfj7/jmS99yxWwDk6LYwcYYFjjLm5RghimjnnaFF/mHKGELsrd0xjOz8Tmi/0
         vOrNytkjJ8mWD0uWreGpvbJcQaDlh02HiOlR1YZD+hENubtsK2tQW6XquO9W9Wg1C50E
         xKf5n4aUt9qbIsNUk49huxPf7NcqlODhZ0GgL4FZWvyrHZdeGIqyWta9j7LcfeQqwcr3
         4+pM8K3vM59KaMdyJzzWMNSmzhfZbZnfrJyhRtrMP6IE76BZbwOeCeL82jinu+D9ARtx
         bFgw==
X-Forwarded-Encrypted: i=1; AKwUvBy+YhJLxVyEIiOGVeAxKQ1wdu+9soMzsuBUWsf7hiqSLtV7L+lGmAZJAxuoaYgd2/hiW0V7gZ7T3HdQKw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJHiKXrTnrfnvfwPnfWBQ6F677B2JsHwICmS6to6w95Bu/R8PYb
	YuicureaGFd8mBymMqh2A5WE3QEPqJNeKwZorQNVmzMNn9lOm91zih1GSmixdkjtt9OolJNba7x
	Lp7gvBXKa/lu9xJ41Ugq27PGOeX/dJj6Y6nNRJVBlbmU36UYQnGBCDOQs+xMORL5syA==
X-Gm-Gg: AYBFou1KX0gFlvGkysvBf2XhspifdDZoX6GAN+OMXvdo8siPP4giQT9CpVvRy0DxAn9
	oM2lYwWKs/ap/vlFfxduSKDNqinGBxtBp4AcDisuxKDqFtkjRAOj33qxUlPPmn+TevbuEbX2eeG
	dfhM7VjaWgUA2jVKQnhYK4Mgupjj8peoRLNnpdgezWeZcscqCdYPYtmcBI5m+ygIo6qQG1fccqS
	s49gkmKSOKL0Jqwph8DyKicb2xEpofuRDp3OOxAg2gwE+r2gxOYYvXu5iJJE/Eoi5ei2tua6rMl
	Y6PRz/S633YPy/XroN/uBTUNUi+kCQzENdEkXyxUFVCZdjUsDJBt29mGCmrl+I0PbqPXwSeA3zt
	rZFMSP9vwmFlwZiLEkQ==
X-Received: by 2002:a05:6a21:329a:b0:3dd:a00a:170d with SMTP id adf61e73a8af0-3e16be79864mr7616197637.40.1791799882415;
        Mon, 12 Oct 2026 03:11:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:329a:b0:3dd:a00a:170d with SMTP id adf61e73a8af0-3e16be79864mr7616168637.40.1791799881951;
        Mon, 12 Oct 2026 03:11:21 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3107348sm3869973b3a.13.2026.10.12.03.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 03:11:21 -0700 (PDT)
Message-ID: <e25158f9-9fda-4561-8bb0-d05a21f420e2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:11:12 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC on
 DT platforms
To: Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
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
 <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
 <20261008212904.GA1450868-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261008212904.GA1450868-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accb24b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=urU-21cbkK_4QL_mq_YA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX3xf0jWbEnvkZ
 Nn0T0ckozgRjoR6lzDXU85jsOujJ4Jkw296UnNBwQ90ReWEG9YY9GecFhmh2jfNl8kP7JqixXt9
 P18fBdb13HYVZs6BZMD4neDFJn0Ur/uOWwZv4UnuVMJPytbq4a3zegjLP4GiQNJYIb7Amx++Z4v
 BtPSX+XC3QdRD5ORAkwxOi0GYXPXi2J4TeYfQyEERDdK8PsBJxkVZOj8Su6CtMNFHxxc/rOfJTz
 BNq6XTyLv0cJYeLpSXUTJfoALgMYqppWMoQiILcjd6YZPitBzMDTR8IdVOT+7/8HjfKpiZSRfp3
 5ouHh8mU7tRLAR4viWbOLkJz9xQ28ww9Yl++1uuLEgQrwiXId95LdY7x5DfYjs/jQp/AAHwpdlq
 8r/6hkuYR4+YB5fjX4AL0N8WFKbyqpNGYsM+Lf24CElFbBEz72e1ybyTP3O0+ztgClFGDTlGd9l
 286sFySDB47wOxAiEBQ==
X-Proofpoint-ORIG-GUID: b7_nL1oc-doVNjZGJwpwHfXOIKWTPolU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0MCBTYWx0ZWRfX1SIctTOd/40A
 4bYYJTgHeSyhlm3xo25y1T9O4JWfmElzCPh0Qv3qrD6ydeaPeaJVFpWQhUl7+cRzdExrqrubRfh
 05opbV0ezuV8ekv4HWeP/QB+IWJFxiM=
X-Proofpoint-GUID: b7_nL1oc-doVNjZGJwpwHfXOIKWTPolU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120040



On 10/9/2026 5:29 AM, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 02:41:15PM +0800, Yin Li wrote:
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> The MPAM DT path only handles cache MSCs. Memory-controller MSCs
>> cannot be probed yet.
>>
>> Add support to discover memory-controller MSCs from the device tree:
>> derive the component id from the NUMA node and create a 'memory' class
>> RIS, and treat a memory parent as accessible from all CPUs.
> 
> Where's an actual user?
> 

Hi Rob,

The Kaanapali platform in this series only uses cache MSCs. This patch
is inherited from Shanker and James's work; They may have a platform in 
mind, but we do not have one to point to at the moment.

The binding already includes 'arm,mpam-memory-controller-msc' and the
corresponding example, so if the driver support is dropped the binding
entry should go too, to keep the two consistent.

We are happy to drop both. Shanker, James, please let us know if you
have a platform that needs this before we do.

Thanks,
Yin


>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> [ morse: split out of a bigger patch, added affinity piece ]
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [ Yin Li: fix context offset conflicts; use of_node_get() for the memory
>>    parent to avoid a refcount underflow; use u32 instead of unsigned long
>>    for component_id and compare against ~0U ]
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
>>   1 file changed, 40 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 0640690eae2c..048d32e69f55 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>>   				  u8 ris_idx)
>>   {
>>   	int err = 0;
>> -	u32 level = 0;
>> -	u32 cache_id;
>> +	u32 class_id = 0;
>> +	u32 component_id = 0;
>>   	struct device *dev = &msc->pdev->dev;
>> +	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
>>   	struct device_node *cache __free(device_node) = NULL;
>> +	struct device_node *memory __free(device_node) = NULL;
>>   	struct device_node *parent __free(device_node) = of_get_parent(np);
>>   
>>   	if (of_device_is_compatible(np, "arm,mpam-cache")) {
>> @@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>>   			dev_err_once(dev, "Failed to read phandle\n");
>>   			return -EINVAL;
>>   		}
>> +		type = MPAM_CLASS_CACHE;
>> +
>>   	} else if (of_device_is_compatible(parent, "cache")) {
>>   		cache = of_node_get(parent);
>> +		type = MPAM_CLASS_CACHE;
>> +	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
>> +		memory = of_parse_phandle(np, "arm,mpam-device", 0);
>> +		if (!memory) {
>> +			dev_err_once(dev, "Failed to read phandle\n");
>> +			return -EINVAL;
>> +		}
>> +		type = MPAM_CLASS_MEMORY;
>> +	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
>> +		memory = of_node_get(parent);
>> +		type = MPAM_CLASS_MEMORY;
>>   	} else {
>> -		/* For now, only caches are supported */
>> -		cache = NULL;
>> -		return err;
>> -	}
>> -
>> -	err = of_property_read_u32(cache, "cache-level", &level);
>> -	if (err) {
>> -		dev_err_once(dev, "Failed to read cache-level\n");
>> +		/*
>> +		 * For now, only caches and memory controllers are
>> +		 * supported.
>> +		 */
>>   		return err;
>>   	}
>>   
>> -	cache_id = cache_of_calculate_id(cache);
>> -	if (cache_id == ~0U) {
>> -		dev_err_once(dev, "Failed to calculate cache-id\n");
>> -		return -ENOENT;
>> +	/* Determine the class and component ids, based on type. */
>> +	if (type == MPAM_CLASS_CACHE) {
>> +		err = of_property_read_u32(cache, "cache-level", &class_id);
>> +		if (err) {
>> +			dev_err_once(dev, "Failed to read cache-level\n");
>> +			return err;
>> +		}
>> +		component_id = cache_of_calculate_id(cache);
>> +		if (component_id == ~0U) {
>> +			dev_err_once(dev, "Failed to calculate cache-id\n");
>> +			return -ENOENT;
>> +		}
>> +	} else if (type == MPAM_CLASS_MEMORY) {
>> +		err = of_node_to_nid(np);
>> +		component_id = (err == NUMA_NO_NODE) ? 0 : err;
>> +		class_id = MPAM_CLASS_ID_DEFAULT;
>>   	}
>>   
>> -	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
>> +	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
>>   }
>>   
>>   static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
>> @@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
>>   	} else {
>>   		if (of_device_is_compatible(parent, "cache"))
>>   			get_cpumask_from_cache(parent, &msc->accessibility);
>> +		else if (of_device_is_compatible(parent, "memory"))
>> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);
>>   		else
>>   			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
>>   	}
>>
>> -- 
>> 2.34.1
>>

-- 
Thx and BRs,
Yin

