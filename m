Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93FB372EF5
	for <driver-core@lists.linux.dev>; Wed, 23 Sep 2026 02:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790132398; cv=none; b=j3MiVtyKnH1XG6uqNdNitdhFkkKSqx1x8Fbd3E3MRJ23O9c2aEmz6TVDxcDtPWst/30Sv2FrMjNn8TylmNZPxvdV4riIVuN5eG82+iCLRT1YHNEG9joJg7CXEH7nEZANFtVbOD4Zn5tXugPRIB29YcQQnnYmakYikZ67wbOSA48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790132398; c=relaxed/simple;
	bh=RMKbGXPUS+GUMUHxSbHbcqX4rPxmEL/XQKVk0tP4MBw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTTb38ND18yzEP1RmWeGxHXqLZE4CBh6a/tEqs9gS8IBMEETPk4WfhxKvrbn96q7VFF3ZwgJKMeWDeVsjIhoOIWJ+kECUkIfxEqgdyEvEopnovmU78l0CD38wBPzjrMT9ircK4hX62LYkq4eyd/WERcf6F6LDGcbuZQHBU6CsZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wq8YoPsK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cMvLtKD7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wq8YoPsK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cMvLtKD7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJBkpV3897620
	for <driver-core@lists.linux.dev>; Wed, 23 Sep 2026 02:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=; b=Wq8YoPsKkFmdS5IQ
	27CNPJF4Y55SVu/HVYyhJ+VIYXGt78vPWF7zB24f8c3q0F4/dmqjBrBOeqW4kslh
	10sIcD5NF2b6j8inY0eB+x9WOI15zG8Zx3ESCSqye8V6gXYr7JEOppFdyJMpy6E6
	rRubpQAz0M+zTx6UZ5VkeUDEIuUljlCbUzV/6kupOgE9bHwQ7669E6S2onpLYCiZ
	RY6jkAP6q+jjy98CVye6d6Ylcy/VVZvN0b0TJeHkY93wJvT39bm2EbuJJFKvGJIW
	3jY7lxYS5KUk2AisHm4cizcPrIAZdEaOjPB6HBvpz6HxXNmtczNJYJ6u6K6VUw2M
	kJKP+w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma1p48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 23 Sep 2026 02:59:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso780183a91.1
        for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 19:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790132390; x=1790737190; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=;
        b=cMvLtKD7pI7lf7QlEBfMsT+LDwc+0AFn8u+2oPzMZwk1yYJcQwxxPLC7QHcjQ2r542
         3kukb00u+05m/IgNg68qlKVBAFPSkevDzRmotl7Evi7hiZbXiFW66lRzOCApskAm9s8o
         vuv3URJSSesJfrUZ7WmbXCkpacH3o1mfBDYAJ/pTYsd2fy1z4Xd+XBVfaBAJFUe/04bi
         Gdvj7KQ/nCs80DFh0JbWoiQz5uebhHlgfVJvj+2cnifomcKE6NY9MOWFhV3FrTEN+/pr
         /ZPhsTumNOHi6u/IdvSUoK9zYaCSNOSBzaZZqL+/BAYT+jrEaPvIaU4xWldEUtXeqXE5
         M7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790132390; x=1790737190;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wv7VUHWdp7FOHwnmCDQTxgbKyh+3nz706HoUphQe+oo=;
        b=M2fsKqZXH73NVmg/mGY0w2lEXcmKITNajSLl17i0Yyw5NlLLumwd9UZ+1MWjbl710f
         jisIcZH3YzwKJWrISD943JvhsQhqJRl2UM/ZtJVdCIoM1HoA1WvgfZM4k2/vk/CMMl9q
         jTUDROHTx+H4lxh7+wWiAfBKVFBuofFoJQ43fisGrIf/2A59y7DPqwESI5lo8slGVlie
         YuOdzSW0x9Ej9MB3Zn7P6TEpxm3qw2GoQXNFAmqv/s/ir588yEfs+i7CfLqO/+M6JaYn
         0Swl2506MitMjt3WV3C09JlAhUcJmSAG6vhTFnO9GmM3ItE/sOHm/EmpCQLrpmX2BD1J
         HRyw==
X-Forwarded-Encrypted: i=1; AKwUvBxJAqgdtYKw4XgizA/Lg3Ia1hPMYuaYR7jEiasm+0NkMWtpZvMYxP1JGx51gjE88KogzNvznVjddnonhg==@lists.linux.dev
X-Gm-Message-State: AFuF++lQTwL9nRA0L8088RIDPTP+Y5PY4PzogQ4ZlZT9Z3m5oUZxq9jy
	JbpR9GV4opDY27tVYCq/vBAeilI3lMRt45gNlqksJ+IFytz0rO9BuRPnspf6BEz6eREICMN8q6t
	kPn59bnpDCiysA1S6aWyQ6pfa9n/c/gciLNbBiKVLO6/KNz6oy9v4LA5ek7d3ePtyIA==
X-Gm-Gg: AYBFou36PHdlrIumOiWdOkT0kN0NZcSJQdqJTsD++s/NYDyTQTxntECxq3RyAajNZUK
	QAv2ZMLZURE7zmhBccEB/Vy+yQTiJEjWP2LUWf0siyt63HSgn1wRl2lc1si47lZXf8CxHIQ+w2V
	wkugpm3vGGREgfrGBheTO1djjg3Rw7IlHTIntwwegYGfw/GS9VyKWkw7dBfu2vPYejesZ3uF6d5
	VAlBI8G4Q93A85ZGGyM/fJ3DMlyzOu0Mj2uC6vF7SrlotvOVZ7Vswen/YUD1pYYpQY40M/TshY3
	a9mdJBTDQNEmATObtk5c7RTPWh7c/g1JuY24P0z0PvJuc5/j6JBa5cmakykrVcqaVDHgD9/q08O
	g686JM+dDv9A9RtKnm1ANMRnLMnQIqF5d1enjhZ05wSQzCruAEnh5FK099nY9m8Q=
X-Received: by 2002:a17:90b:4a0a:b0:39e:6c68:c789 with SMTP id 98e67ed59e1d1-3a07e71cc99mr1203578a91.63.1790132390112;
        Tue, 22 Sep 2026 19:59:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0a:b0:39e:6c68:c789 with SMTP id 98e67ed59e1d1-3a07e71cc99mr1203540a91.63.1790132389605;
        Tue, 22 Sep 2026 19:59:49 -0700 (PDT)
Received: from [10.133.33.57] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5de5c8sm3352105ad.60.2026.09.22.19.59.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 19:59:49 -0700 (PDT)
Message-ID: <272abb48-8f13-4fe8-a7ab-bfa353f1f8ec@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:59:19 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 07/10] arm_mpam: Fix mpam_dt_create_foundling_msc()
 to create MSC platform devices
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
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
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Nn_hjXp-gfKpY0z8hkIzDdRLYE7DbNvq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMSBTYWx0ZWRfX8zlURkXKob7D
 7IsYt2j61q9mWpgGAc2U1QEq8lkn7RUu7rhq54NGEERZNJCAZZOX/fQOjnbB89o9gJEM+fN3RI7
 PFj64gGZzVUqmXKsnDXzxLjoagjEwAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMSBTYWx0ZWRfX+6Gj+PD02OcI
 J2TlVI4TuKIZWa/llw1vv0RT6zZ9Pyrfqp/rXhseW7mjwmu/YXBIsPxJEONSwhaguqiWtNSqAyC
 jsxFZ0fuSFtnfS9ig2Jbx9InyQFU/Nps2yOr0e0MeS0m6xo/ttrMHiFs2fD6EiZ1jqw8MyV9HPS
 ysVQF3pD7GjtZ/IsTYYlhTDk/fBz6YkaL7PTUCJ7sn9nw6lE55aCUUFBbRexo967P4jPSZDgtg6
 ul3royeK9PiVX2GrUcA8gHrTarQkXWqTwD78O+BSKTyWkq55DvpxjNnTvOlFxq69nzM4bkTzNpC
 greQmDvmq1VYuWallQoxjvZ/b65e5RwgPz3o/SygHYt9JC7B2Kx5127hmw13WjPhDQA0WyHbGVd
 vbk+/3xk8WWYYRdyRXBFS1R1czYrDyqtESqzQWTeMHbCHpWKXNw1DpH7paTdDVIxXuNlmkKm0ce
 kZV1OKKdpXH4DuXBTVQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab340ab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2UIP8dk73OJ_h1EwUPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Nn_hjXp-gfKpY0z8hkIzDdRLYE7DbNvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230011



On 9/14/2026 5:37 PM, Yin Li wrote:
> The original code created a platform device for the cache node itself
> rather than for the MSC, so the MSC was never created. Instead, walk
> the cache's children using for_each_child_of_node_scoped() and create
> the platform device for the MSC child node, skipping cache parents
> that firmware has marked disabled.
> 
> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
>   1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 480e38cfa86d..7ef3ed55b066 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver = {
>    */
>   static void mpam_dt_create_foundling_msc(void)
>   {
> -	struct platform_device *pdev;
> -	struct device_node *cache;
> -
> -	for_each_compatible_node(cache, NULL, "cache") {
> -		struct device_node *cache_device;
> -
> -		if (of_node_check_flag(cache, OF_POPULATED))
> -			continue;
> -
> -		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
> -		if (!cache_device)
> +	for_each_compatible_node_scoped(cache, NULL, "cache") {
> +		if (!of_device_is_available(cache))
>   			continue;

Hi,

As sashiko-bot said：Checking of_device_is_available(cache) here 
introduces a mismatch with mpam_dt_count_msc(), which only checks 
whether the MSC node itself is available, not its parent cache. And in 
practice, cache nodes are rarely if ever marked as disabled in the 
device tree, so this check adds unnecessary inconsistency without a real 
benefit.

I'll remove the cache availability check in the next version to keep the 
two consistent.

Thanks,
Yin


> -		of_node_put(cache_device);
>   
> -		pdev = of_platform_device_create(cache, "cache", NULL);
> -		if (!pdev)
> -			pr_err_once("Failed to create MSC devices under caches\n");
> +		for_each_child_of_node_scoped(cache, child) {
> +			if (!of_match_node(mpam_of_match, child))
> +				continue;
> +			if (!of_device_is_available(child))
> +				continue;
> +			if (of_node_check_flag(child, OF_POPULATED))
> +				continue;
> +			if (!of_platform_device_create(child, NULL, NULL))
> +				pr_err("Failed to create MSC device for %pOF\n", child);
> +		}
>   	}
>   }
>   
> 

-- 
Thx and BRs,
Yin

