Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA153BFAEA
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788746; cv=none; b=nukB7So8guvXuonZo3pX8CAgc2QeO9+s4Z/AgeMQmnxdNlUrcPhZl3/2BEamzCzTdI9i0nr9Zon3I4sVoZ19T+4Qp4POkwwgVfk9GSEVzPnLbBZWZgQUeXG7VvHcbQRHThT8tMkYWaIm9T5AwCsP/+kdp93NadGNUr5yVZVM0bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788746; c=relaxed/simple;
	bh=Jui1feQl4hEZEpL/E1uz6cTa4FdzvD8qKTPGvFiLhPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTj/9JIMwcl1fmUJGCR25Awzf2mciz4MJ4FvcaFLX3M7mndAnWdbfpDFHCQdByt9iFQpCkndN0+C66MUVe7zbEAgwcH8c4XK7+uIAVmdPM8OO64Es2VvCPBIzdM5cdjrDhXk0vYDw+wKxmssfomkmcyJ7QeAX9+xxrSH2w89clQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxohMTpQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm1Rtfk9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxohMTpQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm1Rtfk9"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55kiw1856967
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 07:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0mkIBpRp2fdiYGw3F/8jBInFQ0xmXuoQThNxyii/ePQ=; b=YxohMTpQhpHlKFpU
	aA5P7OFC0FlX5oprdPeYRrtOXfX8yOQJD+wRdAqF9jQho0D/1MUh/j/ovMdwA2cN
	nst1pLTAiQzVKD+MrX9C2HBa81SFxHaN6tj1BkQYEpUaKHewK0bvxXCADKpXfbII
	cFF+ff6a80SCnP/W8Y4RRQae5A6E9s9rjoBA2LtWt3er4L0TCSxy0nVYr/y2Aq0O
	t/zbfl45vIzarVRSL9cC62dQhmaLNiHWmLbE7ggwdoxXFg5Gl+sVKkvq/vHoX+BC
	7mL0NrmNO+A25Jzoazfc2wzz82X7ZlpbV4CZeC7IwDxyX77PpE4AU1AyW0eCy5ZP
	0KjpIg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxnd5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 07:05:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-887e45c7063so1203386b3a.1
        for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791788742; x=1792393542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0mkIBpRp2fdiYGw3F/8jBInFQ0xmXuoQThNxyii/ePQ=;
        b=cm1Rtfk92PcEnBeU4xhzLnS8QZu1Pd2G9k3VIWzQCn+G/OoD0g/VNx/b5tMGQoOLZh
         TqauyDDzja9HLqUKeW26Z5wFY/G0TMacaiSsOJkbd/HqTxKOkQxfyiQKNcgiqSbopVFQ
         63our3couCQ96OIgx2ZTE3ijv+uvZZtlgPn1YY/mhHaA01Q1XBfjuyG1q8d8rBL4GAkz
         DOD4u4HA/p9+VqB7kdVGLDAPNvgEe1cEosu9axDG4VyDJmmUFbjAm3oY+9u2n6iiar7j
         H6Sa4B+XJA3whPN+uNC+z++YSJvvgfPp5JuadNQtbHCQ+e3dIpOn5cPUxyatUZT4Pp+E
         bEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791788742; x=1792393542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0mkIBpRp2fdiYGw3F/8jBInFQ0xmXuoQThNxyii/ePQ=;
        b=bfY0dKlwUuaiaYEbozKOeckmzjLDgxWL6Bn3GdwWsAm5djiIpN9fkV4vVwacHIvdmb
         39+3rgrC3gtk+XFoQDpQI9DV5tXQ/P5XoH8XxsMtbKcidXV5DTrlXF8eudG8/v+3Go5h
         wVaONvd/wSb7yOSEkCUApq+qdmmrfDMFr51N300fm8ZmsNdFgP9sMaNo38lWBvJ62eHv
         oJs6EFUmK6oIt+8Suklf57EXu65C55S804v4vs/35kFQ0MgA8LbOyUa25bUZzz6+Wu/f
         xH/RiWQMiULcHRzf12t6eY245hBHIJlpUkPFri8Ri+LR9Ds8+y/xJGma3GEVk4HtYFOW
         r6aA==
X-Forwarded-Encrypted: i=1; AKwUvBwkBkq4bmfTGuDAZEKeu8o1uc4ir9GWbYr8+vey0XwzEqHQdX+vzwqvBpcNCUWCBbbF2PcL6UJlvUQeUg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK/IFcKPwm9RJOC4NNS8Ve481rghpqIWuv5kA/aB0iKEStbG+ZV
	gb746OBCD08qQ+CplC6QlsUNKs2OXS3HjaJtTtxpIreJCMspUePLFzHbxYdmeDb3kRiI48NbGtJ
	FtHJuqpcLhDx7f6morG77oL69wgcwHIzvHLYiMxlg5KDqCQMlv/G8yWPfJVNMggGUnA==
X-Gm-Gg: AYBFou1J/uGpTWD/CjJCgKxhgEUXOQvJ21S2+U4Cght/pr1jLqk+WpT6e264ZOZTg25
	Qa3XJ3tT4zKzoV8TKZdET+rkKE0g46wWBmRvUCx7pjOK0e6yqGqPE6Tfj53gu1maT6rorfCaAKP
	0K65bEnpGLdfOlSpLuK1p56ng2GcjEykyjoZdb3Yj0T49TZTT4odnwLQA6SODu4t5uxbERFXftg
	TROTfeI+BD975aQXSz9vgkghhX+40tjpqlARIXhhoMUQUMLwWBnX26tWt6N879dBrM559nP2WHK
	VQ4vPxGGd9+GK00FbpWBthVe36MUVoxrQ5kGntht70fUgfxn2ZAO99wD5HrSxJPKWPKxKo7WLCl
	sO44trzh6NhIWY1fjjQ==
X-Received: by 2002:a05:6a00:4fce:b0:892:d40c:4f7b with SMTP id d2e1a72fcca58-897c653fe53mr7054530b3a.10.1791788741946;
        Mon, 12 Oct 2026 00:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fce:b0:892:d40c:4f7b with SMTP id d2e1a72fcca58-897c653fe53mr7054500b3a.10.1791788741395;
        Mon, 12 Oct 2026 00:05:41 -0700 (PDT)
Received: from [10.64.69.36] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896b68ef6c6sm3737672b3a.4.2026.10.12.00.05.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 00:05:41 -0700 (PDT)
Message-ID: <2eddfb6d-c622-4d72-827e-aed685e72b9c@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:05:31 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
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
 <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
 <20261008212736.GB1318789-robh@kernel.org>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261008212736.GB1318789-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 2Td-QVwWyR6vnOybrfxGUa4NsUC5SO9t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX7Lj/RW71lTyl
 p8vfT95gLnDLm6H9tQJD6Cv+Vvy/7zc99opF2LczPPUXMSeKKqtmrtmAKwVntjT6hkPVMbAkRWM
 SJWAEkrhYWkGIs5FJ9sPQZs0ssrDaPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOCBTYWx0ZWRfX4rmhpHtLoFK7
 xYcGuvFhRIyNC/HeHjoOeSL2HjsUXczZpfszP4atTfW74fsVLHq6rkq7v8l9/qjl9E22l+YkfT+
 jxRQQVVHrIywsV1EIjJ2JTs0SSOz5eNFVJVHx/Tsqly5B598oXW3Cenr9dBxLoTk8T0zlJs+68y
 UDMPuPcBB2QSbwR51ZofhxEGS95jxByXjOFMQJi/7tF7GvvsD/BOqCklmaR+6GJ9GJgmEdb6RsX
 RMQuxXNqG6Rfro5tcRfTfRcIj58KWBHATmwwhEtmT8dI+MzjDkD6sHJEMnzZGga2NPfdv/jhOg+
 EI0iaKLm8aTgQwJu5aWooSRIpIZD/7KeJXaqqRXra8oqxmgPamW7ckMyFovUT7aEFDEBqCTZBeg
 NZEojph67nvdh92f/BsF9eehlkyjXA3sj0YyuQ5uE+aQqvMqml/vSMUbdEC/Xb7uTxZ+mIAtZPd
 Cj7DsR0kzJAdeI1xirQ==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acc86c7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KYmfK08lGGyfDj9egygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 2Td-QVwWyR6vnOybrfxGUa4NsUC5SO9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120028



On 10/9/2026 5:27 AM, Rob Herring wrote:
> On Thu, Oct 08, 2026 at 02:41:12PM +0800, Yin Li wrote:
>> From: Rob Herring <robh@kernel.org>
>>
>> The binding is designed around the assumption that an MSC will be a
>> sub-block of something else such as a memory controller, cache controller,
>> or IOMMU. However, it's certainly possible a design does not have that
>> association or has a mixture of both, so the binding illustrates how we can
>> support that with RIS child nodes.
>>
>> A key part of MPAM is we need to know about all of the MSCs in the system
>> before it can be enabled. This drives the need for the genericish
>> 'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
>> until a h/w specific driver potentially enables the h/w.
>>
>> Cc: James Morse <james.morse@arm.com>
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> [ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
>>    standalone arm,mpam-msc and the two-item combination; fix schema field
>>    order, type constraints and yamllint spacing; fix example reg addresses,
>>    add arm,mpam-device phandle and remove TODO comment ]
>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++++++++++++
>>   1 file changed, 202 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> new file mode 100644
>> index 000000000000..3c7b13a23ff2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
>> @@ -0,0 +1,202 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
>> +
>> +maintainers:
>> +  - Rob Herring <robh@kernel.org>
>> +
>> +description: |
>> +  The Arm MPAM specification can be found here:
>> +
>> +  https://developer.arm.com/documentation/ddi0598/latest
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: arm,mpam-msc                   # Further details are discoverable
>> +      - items:
>> +          - const: arm,mpam-memory-controller-msc
> 
> Why do we need this?
> 

Hi Rob,

Thanks for the review.

The 'arm,mpam-memory-controller-msc' compatible is needed because,
unlike cache MSCs, memory controller MSCs cannot rely on the parent node
to identify the resource type.

Cache controllers universally carry a 'cache' compatible, so the driver
can recognise any cache parent and derive the cache ID from standard
properties. No equivalent convention exists for memory controllers, and
the component ID comes from the MSC's own 'numa-node-id' rather than the
parent, so there is no parent attribute to rely on.

'arm,mpam-memory-controller-msc' provides the explicit declaration that
this MSC controls memory. It is used in "arm_mpam: Add support for
memory controller MSC on DT platforms".

On 'oneOf': the original 'items' form requires both strings to be
present, which is not appropriate for cache MSCs. Andre also noted this 
in RFC v2, so we changed it to 'oneOf'.

>> +          - const: arm,mpam-msc
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: A memory region containing registers as defined in the MPAM
>> +      specification.
>> +
>> +  interrupts:
>> +    minItems: 1
>> +    items:
>> +      - description: error (optional)
>> +      - description: overflow (optional, only for monitoring)
>> +
>> +  interrupt-names:
>> +    oneOf:
>> +      - items:
>> +          - enum: [error, overflow]
>> +      - items:
>> +          - const: error
>> +          - const: overflow
> 
> This can be expressed as:
> 
>        minItems: 1
>        items:
>          - enum: [error, overflow]
>          - const: overflow
> 

Agreed, will update.

>> +
>> +  arm,not-ready-us:
>> +    description: The maximum time in microseconds for monitoring data to be
>> +      accurate after a settings change. For more information, see the
>> +      Not-Ready (NRDY) bit description in the MPAM specification.
>> +
>> +  numa-node-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: NUMA node identifier for the memory resource this MSC controls.
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +patternProperties:
>> +  '^ris@[0-9a-f]+$':
> 
> Based on the 'reg' constraints, drop the '+'.

Agreed, will update.

> 
>> +    type: object
>> +    additionalProperties: false
>> +    description:
>> +      RIS nodes for each resource instance in an MSC. These nodes are required
>> +      for each resource instance implementing known MPAM controls
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - arm,mpam-cache
>> +          # Memory bandwidth
>> +          - arm,mpam-memory
>> +
>> +      reg:
>> +        minimum: 0
>> +        maximum: 0xf
>> +
>> +      cpus:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> Drop. 'cpus' has a type already.
> 

Agreed, will update.

>> +        description:
>> +          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
>> +          parent device's affinity is used.
>> +
>> +      arm,mpam-device:
>> +        $ref: /schemas/types.yaml#/definitions/phandle
>> +        description:
>> +          By default, the MPAM enabled device associated with a RIS is the MSC's
>> +          parent node. It is possible for each RIS to be associated with
>> +          different devices in which case 'arm,mpam-device' should be used.
> 
> We should drop this until there's a use for it.
> 

On 'arm,mpam-device': we believe this property is structurally
necessary. The MPAM specification (IHI0099B) states:
     "Resource instance selection (RIS) allows an MPAM MSC to support
     multiple resources, including multiple resources using the same
     resource type or partitioning control. When RIS is implemented, an
     MPAM MSC must implement independent resource controls and two or
     more resources of the same type."

Once an MSC implements RIS, it must support ≥ 2 resources of the same
type (a spec requirement). An MSC node has only one parent, so the
association between each RIS and its corresponding device cannot be
expressed through a shared parent alone. A per-RIS explicit association
mechanism is therefore needed, and 'arm,mpam-device' is designed for
exactly this purpose.

The property is used in the immediately following patch "arm_mpam: Add
device tree support for MSC probing". If you have a different view on
this design, we are happy to discuss further.


>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +dependencies:
>> +  interrupts: [interrupt-names]
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    L3: cache-controller@30000000 {
>> +        compatible = "foo,a-l3-cache", "cache";
>> +        cache-level = <3>;
>> +        cache-unified;
>> +
>> +        ranges = <0x0 0x30000000 0x800000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        msc@10000 {
>> +            compatible = "arm,mpam-msc";
>> +            reg = <0x10000 0x2000>;
>> +            interrupts = <1>, <2>;
>> +            interrupt-names = "error", "overflow";
>> +            arm,not-ready-us = <1>;
>> +            /* CPU affinity implied by parent cache node  */
>> +        };
>> +    };
>> +
>> +    mem: memory-controller@20000 {
>> +        compatible = "foo,a-memory-controller";
>> +        reg = <0x20000 0x1000>;
>> +
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        msc@21000 {
>> +            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
>> +            reg = <0x21000 0x1000>;
>> +            interrupts = <3>;
>> +            interrupt-names = "error";
>> +            arm,not-ready-us = <1>;
>> +            numa-node-id = <1>;
>> +        };
>> +    };
>> +
>> +    iommu@40000 {
>> +        reg = <0x40000 0x1000>;
>> +
>> +        ranges;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        msc@41000 {
>> +            compatible = "arm,mpam-msc";
>> +            reg = <0x41000 0x1000>;
>> +            interrupts = <5>, <6>;
>> +            interrupt-names = "error", "overflow";
>> +            arm,not-ready-us = <1>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ris@2 {
>> +                compatible = "arm,mpam-cache";
>> +                reg = <2>;
>> +                arm,mpam-device = <&L3>;
>> +            };
>> +        };
>> +    };
>> +
>> +    msc@80000 {
>> +        compatible = "foo,a-standalone-msc";
>> +        reg = <0x80000 0x1000>;
>> +
>> +        clocks = <&clks 123>;
>> +
>> +        ranges;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        msc@10000 {
>> +            compatible = "arm,mpam-msc";
>> +            reg = <0x10000 0x2000>;
>> +            interrupts = <7>;
>> +            interrupt-names = "overflow";
>> +            arm,not-ready-us = <1>;
>> +
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            ris@0 {
>> +                compatible = "arm,mpam-cache";
>> +                reg = <0>;
>> +                arm,mpam-device = <&L2_0>;
>> +            };
>> +
>> +            ris@1 {
>> +                compatible = "arm,mpam-memory";
>> +                reg = <1>;
>> +                arm,mpam-device = <&mem>;
>> +            };
>> +        };
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.34.1
>>

-- 
Thx and BRs,
Yin

