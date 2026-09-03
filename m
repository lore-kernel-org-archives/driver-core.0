Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81338439320
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428560; cv=none; b=nNskjw7eDcFdbaiEFM7KyxCxdUObbuKWhq65M8uNBwe+zbx8L6kI7ncZprwCj8r5nE6W9wweGdOsyo1+WHLaS/QF21Syu1MLnodB1oDcX+t+NP116zEdwl65Cclb+F6Nltvvp+pgRc+nsavFEg6x7YrRiGAXmZyLK+lDqUmocZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428560; c=relaxed/simple;
	bh=W2pM+s6RZdTdONP2DLs0my1ASvHPk5ZTKKrIo3pXhzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAQXj/r0fQN4x/4LwqTcWRsFapugHMIjlG3lpDSkidMKhsQG32YvVXwDroPT+cpVa9sZBA6tLzJbOrv7VuzfzxkTQkt7yVSBwjR+RUISBXoCPydOGOfxTponhMMiOxn00/rjyZiaSb4N5XRnfJATVYZQLYUeFErc50WWZuL8lbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D05honEv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iSY1hdq3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D05honEv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iSY1hdq3"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683923eI3549247
	for <driver-core@lists.linux.dev>; Thu, 3 Sep 2026 09:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbC/aiEXygGDz6MUoegwJCLvCP5wYlDG/NMXYLQigks=; b=D05honEvlt/nGR9t
	r29iJ6NAyWEB18MiFWj9gMAS5/nx9Dk6xn+LRhkPKDWGU1mMbVZGAMKHDsIdVElk
	Om7SM8d+cSqjC61s0NqH6abHWs2Do3zQD1fVzb0U6buks0rMNxetuRV1RGI5B4AO
	rYuR4heamylZcLbIHOmMtEXZP9vyFWfkltFyXHFi54NhC4Fbx+fcDhHCF8GzwReH
	asSbTVD64xOoRTkPggzBaAsoVrb7x1o7EeD04cL8xSBmnIFErio0+XLAPrFd+xaf
	R+1EzeNtWdZF/v7FGa0W/x2nZ+HiErccLb4ALQHzcYC8WKDp+xtSLBablp2synTY
	C604Rg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjsfts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 09:42:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so148935a12.0
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 02:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788428557; x=1789033357; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbC/aiEXygGDz6MUoegwJCLvCP5wYlDG/NMXYLQigks=;
        b=iSY1hdq3YKeEMbGZUO49VHZUG3ORvSthoqa6NhtIswYFdbESBybPwuwUBlUORrha46
         m9ynmFEURwz8O17gyjVRz3LzWYjRt0qUjCzeYB0N4GmfhXMWGEuXI59727tSIlzzdTeL
         3BG3yDoeht7LVCnynDtGSC+67Yxopsl+nkppIzSAlbbY6RHtoyYYjzy3fA9ed7/UcdNU
         k1PtW4pelmLnSUpiI45APClx3VdHxtU5UuEhfH5h8qgqvfepm1azlSFq/s4bMk2mJdB2
         n9qWkl1aLwic+ndf3Y63ZNIV9gCVb0Psu47VPcR2UiaOGyu4Z6JGOccT0OYDduOazyFI
         yGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428557; x=1789033357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EbC/aiEXygGDz6MUoegwJCLvCP5wYlDG/NMXYLQigks=;
        b=BdEKZGU+wmtLA0eacdCZE2ant9luortGr69ib1yxhz/84X92v8ty6cNnwZdLEiE5mW
         K0tqTyUpyvBu+lq05h18JF0Oy0TAxCacedlLkIWA1uL/Ml1G3YTBeEQpJfsRSRT2YLaM
         vVaArFdiA5jwUcMkf6VfEffxFsbDI3dObgG2Zsvn+Qw6u0azSoAan6k3U7iLcdcw4ssN
         fpPJ7VAe/AIJP4VLOEnNyljvv6qj43CvHlUrnLjY0BSIc3FIogpRpbb4EgV9/zl1+ayP
         fXFvsAtp8klzuZrI5cAUvmyfzl8+fe5ZJBnA10QEbYpuh6Pjm2hk88laPzWKMRqB46Me
         mDDQ==
X-Forwarded-Encrypted: i=1; AKwUvByMdbdqNDZQ9qjX+4ucReEJDrbsanhHPG2+cTb8aESKL12AjSM6pMKoT5aRiiQrOSj3NrryBTzP5zvjaw==@lists.linux.dev
X-Gm-Message-State: AFuF++n4PTrnSvsboC25auJeOHzGojF3ui6fGHAL2M3FkX17IhvIF88k
	i01la0Ycmj3wzdqvVLEvytSqghWaX6I/8005vz4UnD3mJ1w/mBTYJFqZWtx57230+Qiipt3ceDk
	BvyVa4MgFWeVzvHwelAdaO02EI6r2LiIxiOWoDUDkRQJhRquSG1vYXru3Pc48Bqh+5Q==
X-Gm-Gg: AYBFou0PeXCekdrnz5Srx6ExsQuBH71DJPaZo7k2fsnzDN4whxPR9k6SJuyWg7Zk9yj
	8O4pF7XVoHZGGu1WQAOOIoSTKCp4C/zHfIhHbxN2vUgD5gfZgFl5ZomYCrQrfEAgAyRIFBPOHMN
	EfWanI4Glv4SUHvblJ9/+mTYMxDmGxY61ayrwt+bM1I9/nyWwQpf08+sMlK9QYBzQ8ZR4ikAR4v
	41iWuWVX6upE28lmlO0NCPNkHTEdEvLTTSwPkAin6rajKBCKqVEzCU44SsJZx6iP0/WvsvKv9Re
	9OSDxcBckhwdhx04gOjLFeuQRyOr9sjp5/ZzPgzVuk5H9xND7SbGl8p8DG3XrCRKvwBEdCxRj5q
	LolXDSk+z2jVR1eZLeQ==
X-Received: by 2002:a05:6a21:3947:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3d9afafc369mr17369086637.5.1788428556832;
        Thu, 03 Sep 2026 02:42:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3947:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3d9afafc369mr17369002637.5.1788428556313;
        Thu, 03 Sep 2026 02:42:36 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d39c899sm754924a12.9.2026.09.03.02.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:42:35 -0700 (PDT)
Message-ID: <b6463a78-9aed-4e17-b044-83b734cc0f9a@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:42:27 +0800
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
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <bca22f76-4fc0-4a99-8648-4f148de7246d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX6hV80MNSUQ35
 9OcblKPNa/qwYsYMmn67TnJXaQ/v7KrSg5ZW0oZGNF2ng9tgiYqXFZtM6KPIcmnMCzJDkrj7XaU
 lfR3icLMnyNNyVHtUAkFbvZeZNcODiVP6erDH/t5RLN79dcGBXdbJZDepJwDEON7e/CRLBrl1dK
 iewumxvMO9EHDfGpEV5huccLa43hBuZZp0G8rHuM8h09g5TPHPbxSpcfwAkrUyTVnSp5tbc+g+H
 knlEf2Qp9DS1rowsXZY2WgNrvurzO3xp42NSZw9rA7o1talQnbVzPBgr2+LpAog4HtrEd+rVds3
 tI+l9etCqB6DSBJcUpNvday/9W8+Za6Xx2SzobUGvWQmgh2OVVe1fAAfGLEh/SCrbrUITZ/+o1U
 Z2uZeuorxxnqu8T62tgGryE01gN1IYIRDt95jPULziTyzxqqi4fGhWLEn1tuhGDeQE4GVzTlpKf
 MtVs+VLsQjVzpFMGzRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX1KzKVqd1bADU
 UfLKizNGEDsjiqzD8TMbij05nyDRLDn070xn06c/9ydxKu2IxXYM+5vwhLKCKycQy1ryC6rgx4U
 uEojKbP1/piNIgQE+inQLn0czlx8x0w=
X-Proofpoint-GUID: suggx32PEI57BMIycumigpvQ492Qjuzb
X-Proofpoint-ORIG-GUID: suggx32PEI57BMIycumigpvQ492Qjuzb
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a99410d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cCZmPfQC1jL7EaltuNIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030083



On 9/3/2026 12:22 AM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> The RIS index is read from device tree as u64 via of_property_read_reg(),
> 
> what does it do that using an u64, actually? Do you refer to the reg 
> property of the ris subnode, which has a limit of 0xf in the DT binding? 
> So shouldn't it be an u8 all along, and we fix the types up at the 
> sources, rather than widening everything needlessly to u64?
> 

Hi Andre,

Thanks for the review.

Yes, this is the reg property of the ris subnode. The reason it starts
as u64 is that it's read via of_property_read_reg(), whose API takes a
u64* for the value — so ris_idx has to be u64 at that point, regardless
of the 0xf limit in the binding.

If ris_idx were narrowed to u8 before reaching the range check in
mpam_ris_create_locked() (ris_idx >= MPAM_MSC_MAX_NUM_RIS), an
out-of-range value such as 0x100 would be truncated to 0x00 and silently
bypass that check. Keeping the wider type through the chain lets that
check see the real value and reject invalid indices.

If you feel an explicit check right after of_property_read_reg() (with
the downstream types kept as u8) is cleaner, I'm glad to go that way —
whichever you prefer.


> Cheers,
> Andre
> 
>> but was narrowed to u32 when passed to mpam_dt_parse_resource() and
>> further to u8 when passed to mpam_ris_create(). A value exceeding
>> MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
>> passes the range check in mpam_ris_create_locked(), leading to incorrect
>> RIS creation.
>>
>> Widen the ris_idx parameter through mpam_dt_parse_resource(),
>> mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
>> is preserved until the range check in mpam_ris_create_locked() rejects
>> out-of-range indices.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 6 +++---
>>   include/linux/arm_mpam.h       | 4 ++--
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index cc9fa1d78925..1e082fb60e30 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
>>   }
>>   static int mpam_dt_parse_resource(struct mpam_msc *msc, struct 
>> device_node *np,
>> -                  u32 ris_idx)
>> +                  u64 ris_idx)
>>   {
>>       int err = 0;
>>       u32 class_id = 0;
>> @@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc 
>> *msc, cpumask_t *affinity,
>>       return 0;
>>   }
>> -static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>> +static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
>>                     enum mpam_class_types type, u8 class_id,
>>                     int component_id)
>>   {
>> @@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris 
>> *ris)
>>           mpam_vmsc_destroy(vmsc);
>>   }
>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>               enum mpam_class_types type, u8 class_id, int component_id)
>>   {
>>       int err;
>> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
>> index f92a36187a52..30461cd71199 100644
>> --- a/include/linux/arm_mpam.h
>> +++ b/include/linux/arm_mpam.h
>> @@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) 
>> { return -EINVAL; }
>>   #endif
>>   #ifdef CONFIG_ARM64_MPAM_DRIVER
>> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>               enum mpam_class_types type, u8 class_id, int component_id);
>>   #else
>> -static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
>> +static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>>                     enum mpam_class_types type, u8 class_id,
>>                     int component_id)
>>   {
>>
> 

-- 
Thx and BRs,
Yin

