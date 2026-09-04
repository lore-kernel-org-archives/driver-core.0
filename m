Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7391A3AA51E
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 02:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489761; cv=none; b=q0tZibhkKxLIpSZ7OSiAqdU958a7/ogvonvcabAlvqE67+m3Y4yZ58gZQ7fkFUryw0PETf8pFJn6AJ3YQc3KRZcUlzud3orPePK6Qcw/8URnzQ40HsSVq5YRF7hYl+x7EyZhFA7mLIy1fekyl0dahMdHIZcI3bIjlWGJB0bxDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489761; c=relaxed/simple;
	bh=rxG5qb25UYzVQNxYfuPHH3FGVqj4kKxY8R0d1etCtpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBZUpyP0ND5xFZlBhAU6gBPWwcjFuR+x9GbeK4Sosm8y35SRovrif5lqjm/1V02SK9KGSebaUxDOrL3te/rfXaH1JjIYje0bXK0ZZdIlV5ZTnGNGwYyIOrS3tc2OaWgx2OUM9iezYGfb/MLIfW94z1YffUbMr+h+RT/WaKJEbBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eo74QmJ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DcOlNgD0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eo74QmJ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DcOlNgD0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683NcrWR743120
	for <driver-core@lists.linux.dev>; Fri, 4 Sep 2026 02:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0525HgtheBE4qZcaZExgs/VP1xEGbWMqw5TkM1yBa9s=; b=Eo74QmJ5ELtT75BU
	Q1uLmrkRmvWAxM5L9rH9zzFca8D9RwmjKYzXG4wugbg9br34pZPhrXg0wkKsCg5f
	7MBvwh22cYuvZ0UE8ninhzVlUu8qYYVQfgmyfNi2IVyZdDmzLkjOjN1JKcE2009v
	4ZbWMwM/6izpallQrzUkdSbyfFZSDEep0/13UkdxE58OPQqJT1TqynAXjSb5EUE4
	SfNudi6VfL8zCXWU2uHV/qIecWTrk8AlURHKACtsTEktuGhJ9Mj9wSi/EGkf1J1w
	7/lETQ6xp+l7bu+rCBK1mkTyZkvaQCi/jOdelW5EJAahJ6lERwTvHy3Uq1FMOpfS
	UXihuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d148t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 02:42:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d001671a54so9157425ad.2
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 19:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788489758; x=1789094558; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0525HgtheBE4qZcaZExgs/VP1xEGbWMqw5TkM1yBa9s=;
        b=DcOlNgD0Pz0dU9V5lLS4b1Cje6wWSi9nGLeKpmCoMdPK8EbVvvfiZv3J9fKIZB+6la
         unkzlbtBmnCl69DU5NTyDAghTiafDVcY7M8+ScBNPFezPbzwDLTJlr2QAcMHGJGh7hoI
         0plYT4NUsFkhvf9lVVMqQJHlkr0RHUW7yKxIpMEX0vcvs/OIJ4MqH1VnY21EyPJ8eyNQ
         7VVQaeLiKmSvtL33foH8qHKgnl+YerBRdx0xVUmvLXospTe3UAm5SBr1sV4n888lWOPm
         gwEH3wkVaE1PmcMPN0d85u2C2yj3MOkpEJrtbWb4LZKqzLklGwmyzNsMxkCJng8s2Ysp
         xIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788489758; x=1789094558;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0525HgtheBE4qZcaZExgs/VP1xEGbWMqw5TkM1yBa9s=;
        b=kSH8poNf3vkgZwkz8KdUdt3PalB7mdVIjY4x1sfZxodjcZOUGMrzZ13It0+/cMMFdS
         6tpA7Se4oqdEhKwGuPc2pOOiMiBL+Qrcl/9T3c0HlmxDHHj67IHbY8Ep33DzNEd+Mw+W
         L4WxR9jmC4qrNr7Sk+zPPWMoSioVY2YhzPSK0n7NSBygJBGtIEqhoFAl7mvg4NqBtWuw
         phTjvqC6ZtxN1G5eZiu0pJTvHHHCtKfoBq1ikX8NcdRGB+kjebwQ8WyZoX1nKHYSU99l
         mHQ1qS4gGQuhGAT7zSIUkBCJalGsQp9fKTW5SxxWtWTPRnF99JLVH4z3QQQ4JV7tKtuz
         1DVA==
X-Forwarded-Encrypted: i=1; AKwUvBwuYjKXm0aJNC/eg/OFnvS8hC0nH8dkh/gKCE+ROA+tHk5w9mIW/6T+OWAJtegzMuiiXN6ilgOd5wTxoQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kXxjZn6tvSaEj1MbjbXnnR9iwrKJ/2yMf4qxKZxUxB1itw+DuU
	71cbxVYYHRWbvminPE4KdacYjRKUhcUK1gONI1wg7SEK0X3I7LnWdUJIidt8hXTuCu1w7VDBAw/
	XGIZM07t0g06nFa+TMTcwfl4TKcy78K8F4P0vozVGxNZuAPjRgp+166dGixLsc9am/g==
X-Gm-Gg: AYBFou31CrY4n8iPiP/55LoeTg3lMrQsBMW7L2NHI+PDSZMVbo3xGhikEXTiJO9SX89
	0H/32Tj4j7S8dShXCeH9PoEB0LG8m24OLMDyjIzTKhT61SZ4dTIGTI3v5CldHQsJq6H36LHSY8J
	ZpbSMBU1ZVjqLoBFR5K5QcfXW7/Zt5LLJLei5TdCy+0/B6qVgaNsDF5wZDHZEEt+mep8AuoWgMH
	STsvW63fYszKufZwA1T1vdKzJS0n+jiufDS9qf3uCi+FoNFzfb8aCgX5sO8tasatmDvMx9QBxs9
	PsrvwhqVcAFrwjSSgt61Pfhgz8Qi34lu5CNNYiUMQdez3MbCCu+16lgdJxLwb02I6uZmmmE2G8v
	q0ly5ltYhUNhmN9qJs1Fc4SB9MbrHtuV/tISFeAe33FhyCtD1ylflRbnjh5BOc8b9
X-Received: by 2002:a17:902:ccca:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2db127cc2afmr41780875ad.14.1788489757707;
        Thu, 03 Sep 2026 19:42:37 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2c9:aae1:a61a with SMTP id d9443c01a7336-2db127cc2afmr41780565ad.14.1788489757237;
        Thu, 03 Sep 2026 19:42:37 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1497e9e5sm3207345ad.38.2026.09.03.19.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 19:42:36 -0700 (PDT)
Message-ID: <3f67a5dd-e567-409c-ba93-8931ffadf75b@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:42:29 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/15] arm_mpam: Fix ris_idx type to prevent range
 check bypass on truncation
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
 <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
 <bca22f76-4fc0-4a99-8648-4f148de7246d@arm.com>
 <b6463a78-9aed-4e17-b044-83b734cc0f9a@oss.qualcomm.com>
 <bf973056-590b-45d4-a66c-d61b480ce229@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <bf973056-590b-45d4-a66c-d61b480ce229@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfX28aX9P9cbtmQ
 MwSnjlbPNRIEHBKBNzb5MZVGLZseCJKKlCGdS7lj6R/Iy5reJA0zBGq+ID84RzX2v1tKjOdrYdA
 pPDwq/U3FUFYAXkiJiRFfVvGksBq8J1Ba95vktP0cqotSCZ+rfc9ST9+bJYKZ8tOiCzDW6hiYGd
 Gz1ylz8yP7CDfDUmYFFCXj2p0wOgtEc3vtrwPzh8UutKszft9Ntj/K7DY8Y1E0+xyETwSk4xzKr
 i/TL1sZI8AE4H4t5vD3xgLqUA9t15qRDsWRxtDyW4E7JP6gjKdqUqwek5glwUiYFb3VQFLiS7lm
 P/VGah8ZgVJWTJpiOrX5wczxgshnLQkFkK0uDP4hQZQcvnfPF4tYU5/RYyminscm1LJ6W+uBGI9
 iArW+aDMCu8Z9KO0m/nKdAbivDOQsKtuCedXw8Wo182WimtydUOoAIjiPLbfS+g+O1Q6gQgP2Tx
 hDw+5R3fyow0vxA8IIQ==
X-Proofpoint-ORIG-GUID: xxwpGxxjAK4naQVT3REEkZGvv5O-jkoi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAyMyBTYWx0ZWRfX0ddqDk4c5/S6
 lP4ST0nUICv0GYFDK2s2bggyDUIgkumvwpwYnqFvP4v3h+JOKL480QgJcr5n6u9rubC7o+2/p0N
 eKfAf7Ia30rHn57J1GO40p+TnZ4bUKI=
X-Proofpoint-GUID: xxwpGxxjAK4naQVT3REEkZGvv5O-jkoi
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a9a301e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=neYdvBUB4e3bnShflY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_07,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040023



On 9/3/2026 9:27 PM, Andre Przywara wrote:
> Hi,
> 
> On 9/3/26 11:42, Yin Li wrote:
>>
>>
>> On 9/3/2026 12:22 AM, Andre Przywara wrote:
>>> Hi,
>>>
>>> On 8/11/26 15:30, Yin Li wrote:
>>>> The RIS index is read from device tree as u64 via 
>>>> of_property_read_reg(),
>>>
>>> what does it do that using an u64, actually? Do you refer to the reg 
>>> property of the ris subnode, which has a limit of 0xf in the DT 
>>> binding? So shouldn't it be an u8 all along, and we fix the types up 
>>> at the sources, rather than widening everything needlessly to u64?
>>>
>>
>> Hi Andre,
>>
>> Thanks for the review.
>>
>> Yes, this is the reg property of the ris subnode. The reason it starts
>> as u64 is that it's read via of_property_read_reg(), whose API takes a
> 
> Yes, I figured as much, *after* hitting the Send button ;-)
> 

😜

>> u64* for the value — so ris_idx has to be u64 at that point, regardless
>> of the 0xf limit in the binding.
> 
> Which actually makes me wonder whether this is the right function to 
> use, since there would be no translation (as indeed guaranteed by this 
> function), but also no size, and I guess no cell size requirements 
> beyond 1. I think it has the added benefit of checking #address-cells 
> and #size-cells, but technically a standard of_property_read_u32() would 
> do as well? Though this probably has the same problem, just with u32 ...
> 
>> If ris_idx were narrowed to u8 before reaching the range check in
>> mpam_ris_create_locked() (ris_idx >= MPAM_MSC_MAX_NUM_RIS), an
>> out-of-range value such as 0x100 would be truncated to 0x00 and silently
>> bypass that check. Keeping the wider type through the chain lets that
>> check see the real value and reject invalid indices.
>>
>> If you feel an explicit check right after of_property_read_reg() (with
>> the downstream types kept as u8) is cleaner, I'm glad to go that way —
>> whichever you prefer.
> 
> Yeah, I feel it's sane to already check the limit directly after parsing 
> from the DT, not only in mpam_ris_create() later. Do you know of any 
> particular reason this is done so late?
> If there is none, I think the cleanest is to keep of_property_read_reg() 
> and check against the limit already in that function. Then we can use a 
> u8 all along.
> 

Hi Andre,

No particular reason for the late check — it just followed the existing
structure, where mpam_ris_create() already does the range check for both
the ACPI and DT paths. Nothing requires it to happen there.

And agreed on keeping of_property_read_reg(): the #address-cells /
#size-cells validation is worth having, and of_property_read_u32()
wouldn't avoid the truncation anyway.

I'll check the limit right after of_property_read_reg() and use u8
throughout the downstream path. Checking before the narrowing avoids the
truncation concern at the source, and drops the needless widening. Will
do this in the next version.

> Cheers,
> Andre
> 
>>>> but was narrowed to u32 when passed to mpam_dt_parse_resource() and
>>>> further to u8 when passed to mpam_ris_create(). A value exceeding
>>>> MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
>>>> passes the range check in mpam_ris_create_locked(), leading to 
>>>> incorrect
>>>> RIS creation.
>>>>
>>>> Widen the ris_idx parameter through mpam_dt_parse_resource(),
>>>> mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
>>>> is preserved until the range check in mpam_ris_create_locked() rejects
>>>> out-of-range indices.
>>>>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>> ---
>>>>   drivers/resctrl/mpam_devices.c | 6 +++---
>>>>   include/linux/arm_mpam.h       | 4 ++--
>>>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>>>> mpam_devices.c
>>>> index cc9fa1d78925..1e082fb60e30 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
>>>>   }
>>>>   static int mpam_dt_parse_resource(struct mpam_msc *msc, struct 
>>>> device_node *np,
>>>> -                  u32 ris_idx)
>>>> +                  u64 ris_idx)
>>>>   {
>>>>       int err = 0;
>>>>       u32 class_id = 0;
>>>> @@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc 
>>>> *msc, cpumask_t *affinity,
>>>>       return 0;
>>>>   }
>>>> -static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>>>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
>>>>                     enum mpam_class_types type, u8 class_id,
>>>>                     int component_id)
>>>>   {
>>>> @@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris 
>>>> *ris)
>>>>           mpam_vmsc_destroy(vmsc);
>>>>   }
>>>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>>               enum mpam_class_types type, u8 class_id, int 
>>>> component_id)
>>>>   {
>>>>       int err;
>>>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>>>> index f92a36187a52..30461cd71199 100644
>>>> --- a/include/linux/arm_mpam.h
>>>> +++ b/include/linux/arm_mpam.h
>>>> @@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) 
>>>> { return -EINVAL; }
>>>>   #endif
>>>>   #ifdef CONFIG_ARM64_MPAM_DRIVER
>>>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>>               enum mpam_class_types type, u8 class_id, int 
>>>> component_id);
>>>>   #else
>>>> -static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>>>> +static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>>>                     enum mpam_class_types type, u8 class_id,
>>>>                     int component_id)
>>>>   {
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin

