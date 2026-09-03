Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C5389115
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 08:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422890; cv=none; b=s9agfAaDWrqEo+G6worNgvpexBgrjElOfGfsCYZwv2IOI7RMoLN9jB2cDgb4qmclaQac7Z/B11LRyV08OuFpcOhf9PG0eSbL0oqweHimSjr0+A9VW7Az4wvZNdh/uBwZCGslJf+DTscsU2vEZPLa4ADBm3vnlHcQs8xvM81UZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422890; c=relaxed/simple;
	bh=rGBBt0AxbtG8LzlxBHHSLHwFFdkl4bkEFjoyJFndGdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QprrH6MOxH0h2d+RfgLlW3hZjurT/3Q5lDUM3yqwDNJ447sJK6gdHOy3csXQ8RyYg3i0V2aJcUYEdYLwjzdXsytz0ULdR02/AQlNwNA+lC/A8UXUnay3yjBThyDoMDX4jTO5cVzAptb2mX1OsaZE8lw71Jhdh61tTd0sXi6ps/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2m2scho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JXxTwgKU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2m2scho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JXxTwgKU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68382Xmi3549605
	for <driver-core@lists.linux.dev>; Thu, 3 Sep 2026 08:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/twb88vPrIOizB1yi/dohC7S8ivyVgg3mYajZILtPNk=; b=g2m2scho9d8g4DQ4
	vhNAbVQhjvIclQC7VYCIav95zlXkbCE+yzy+yE52d9T0Bscjn5NKwmxHUfV4WZA6
	9f4aAIP8akF3YQr3RE32GW2kn/KjdiAaHnA8LFHflrprgYMA7C3RvTb3lUwguZkN
	TTKKyoYZW3/1FN9hMuk2KoDF36491iOLCBlTx+vi26dEb1NAYyANIMAFCZr/nRFJ
	D8o38d4TTxXrIAv+wJwnGD4urk3vQ03fe2EQnZF4psxhW5T2t7Xv1uHx36pN+WlH
	2qtKNqaCpCZ8/fzvf4kkiKw0Ryjybpflw/aBX6Qm1blQZHDUTLBwQ3Mot/f9dQmO
	6Lgqxg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m00r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 08:08:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc73f47bdcso25888805ad.3
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422888; x=1789027688; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/twb88vPrIOizB1yi/dohC7S8ivyVgg3mYajZILtPNk=;
        b=JXxTwgKUt3xXQUuV55BNwAq2qRDT4d4skaRbtz4LR9AqMdlbvZoNgcbk/Jnqezf+WM
         6AF82rU+0OhzFj68SrxBN0TPpe9BdyBzF3evFpkso+MARqhxp9ihErKY/HoXCvJ71N+w
         uXif4v6w9AQt2XlDeZ7KyXpmBYq+tlgJsrcUWtkro0UUH5euEe6bN88DuGom358wHEdE
         IYJmHL/1U4nvoflK8g6jkYtkhRVaX+NypvZ+4NHpPALluqHn56hhyBpTF07Pr45WQpnc
         NG+JZZW7FAEwzt2kT0673BIjdfy/gfFx4wt6NhNMULxdk8Wi+wMaB7ECV8FQjnv9n4dC
         zJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422888; x=1789027688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/twb88vPrIOizB1yi/dohC7S8ivyVgg3mYajZILtPNk=;
        b=GyES9+8WUq/9bMNzY+3xrLAr9fmf2WJKEtdAUmTZbhPpNCE2PTJSndx85nBeyhzCIj
         KV3px0+PcfkTjwI4iejYzukz2KnHq07j+eE+7epBmXKNtC8Xn7v8PicYplfR+UvHBEBA
         xtGXJapwV9y5w0V2r7nSp1m7BdUdPN/g0BVTV0sdkAWvjPiQuuFA1oGhdDYxVIpkK4cs
         iDZUvNCa104gkINPSlFKEOqGWse0aqsLbV0o62EVEuaU6j6FohZKj+WdTODhk+ncaSo5
         jXlWbSaTNrZoI9pCkb5DFoA069x9U6kLLoFRFBKA1mMbr9K2hsdPaI39nBvxKvjr3r+8
         hD8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx7MW5aVcrCqH9y46O3DDjKaqt06h2XH/g48ZM42ui3qv4ChaEFkOyRHm9qwl7q2Jd/1YIJvyZxHZz3jA==@lists.linux.dev
X-Gm-Message-State: AFuF++kvV9vK1wiijQFbvDC0TdHTvHFY6MHZKMUB6QVlGPYhYve844AV
	aGcbYGCg0xWXppz+lyZUHbDe+cFvUCJxyzaWKr9nKjoYP5jQCeTmQ8FU2IJ4EUIeZ/tXDvWpjZ0
	gHXdboiyAgpUrpn1B00RG9KYJabg4tRm6Qwyb/2bSVblmSUSWFmB5SaF94Fado32xEQ==
X-Gm-Gg: AYBFou2tAZuVTFSroc0eN1lH0DKbiTGcFkvqC+W7wnoEVT/0Xp/uF5MwRDclCc0d3+J
	xGmqtZTVfvpFzSuXKqrPuP2TkeF6h49rZMWF64OoHKo9Ne6s9lo4AcrwEYaPfepOrsdB3g0AYSi
	9e0kCrbYw7162Px4sowUuLCNznZRCD30fx6B1UQyIVbq647J0SIpqmgG7EOUjkuwwgBuR/YQqM+
	zpP2hkGWYkSTxqvAn9y1cNDRKwp82iIm3VnOUNvskKwzeWvQD3zww3NpF4kfIbdFoqtn0+IAnuE
	mpACoSV4AmUZj/qlN1YVDTIvEcF99+YSBRM2OdHwxEIo7bnoUE/LDQwMZ1bFNTCsKlv1YdFREt9
	QjcEUt2OclMlQlGaiFw==
X-Received: by 2002:a17:903:3243:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2daec71752emr159035605ad.13.1788422888060;
        Thu, 03 Sep 2026 01:08:08 -0700 (PDT)
X-Received: by 2002:a17:903:3243:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2daec71752emr159034745ad.13.1788422887485;
        Thu, 03 Sep 2026 01:08:07 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dafec27963sm6060365ad.49.2026.09.03.01.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:08:06 -0700 (PDT)
Message-ID: <1c4c197c-18fc-4209-b5ee-4ded811cb22b@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:07:58 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/15] arm_mpam: Fix device_node refcount in DT
 resource parsing
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
 <20260811-mpam-resctrl-dt-knp-support-v1-5-ea6397bead59@oss.qualcomm.com>
 <e6d4bb93-66fa-4149-985d-87d895081ea0@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <e6d4bb93-66fa-4149-985d-87d895081ea0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CGT5AukfwOjZ_sjLt-VNXzsfzSEvobiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfXyHJHe0iGlObj
 YkBxum84F4Lrx+ew/yBzGufw6RdGFf1nIB8MJciBZ+W3AvpCymGZbph9qdI1ZDps5z6WNqmKi/b
 +hfXTjRqhEr6lczJH0hSJfWcwLars2lVIlr0xTrOEYKgaltCzvSJ8lI0+hbQAqvQPybXTh8wXiN
 F87Sb/1bS0A2wTsWbfk6yV1rRDW+ttGF0YyCZ9HWe2DNs710plwxva9kd28JkeelWfbwD200eao
 jjmYKUrye061tX45IgipgUdPjLmt1vh7AJyM7F0zdrsVLpWJqE1mfHw4vZLGputVs1kT1RwmORd
 iKpLXmxdWHBrYfZEfRGCNqBG5j3hZdD0I83s12EMpPcMaiyJ0jxDpFq4JkhzGEzIjkRDH7MmFxX
 JIm57SoFS5f5zHS8AEXPZcr0HxM+W1Bxo9YG2o0nymPZQ1+ZogvIhsUqBmsxwtm/g0n+Wc2y0Q0
 ecImxpqc/iXfj7kLrfQ==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a992ae8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=kWxAhM39eUj0LVJEsOAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfX0k16+2kfvdjW
 ofhnxOynDE2BLxYXNLj5o3mIDPuSETrEhUgitrNoTCk1ntdLd1i8Hd6kK/t/3HKUoQkb/RMOzmx
 g+4bL9j6hUES5d4JH7n+JAySBaqxkUc=
X-Proofpoint-ORIG-GUID: CGT5AukfwOjZ_sjLt-VNXzsfzSEvobiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030071



On 9/2/2026 9:29 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> When a cache-parented or memory-controller-parented MSC is probed via
>> device tree, the parent node was assigned directly to a
>> __free(device_node) variable without incrementing its reference count.
>> Both the parent and the cache/memory variable are declared with
>> __free(device_node), which causes the compiler to automatically insert
>> an of_node_put() call for each variable when they go out of scope.
>> Since both variables point to the same node but the reference count was
>> only incremented once by of_get_parent(), the node ends up being
>> released twice, causing a refcount underflow.
> 
> Yes, looks about right: there is another assignment to both memory and 
> cache, they call of_parse_phandle(), which increments the refcount, so 
> we need to do the same for the direct assignments, to get the free'ing 
> done consistently.
> 
>> Use of_node_get() to take an explicit reference so each __free variable
>> holds its own reference.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

> ... though this should definitely be squashed into the respective DT 
> patches. Feel free to do so.
> 

You're right that these fixes should be squashed into the respective
DT patches. I kept them as separate fix patches for now because those
DT patches are based on James Morse's and Shanker's original unmerged
work — this way the changes I made on top are easier to review in
isolation. I plan to fold them back into the original patches once
James and Shanker have had a chance to respond.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 975ddab771b4..559fa09128b4 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -280,7 +280,7 @@ static int mpam_dt_parse_resource(struct mpam_msc 
>> *msc, struct device_node *np,
>>           type = MPAM_CLASS_CACHE;
>>       } else if (of_device_is_compatible(parent, "cache")) {
>> -        cache = parent;
>> +        cache = of_node_get(parent);
>>           type = MPAM_CLASS_CACHE;
>>       } else if (of_device_is_compatible(np, "arm,mpam-memory")) {
>>           memory = of_parse_phandle(np, "arm,mpam-device", 0);
>> @@ -290,7 +290,7 @@ static int mpam_dt_parse_resource(struct mpam_msc 
>> *msc, struct device_node *np,
>>           }
>>           type = MPAM_CLASS_MEMORY;
>>       } else if (of_device_is_compatible(np, "arm,mpam-memory- 
>> controller-msc")) {
>> -        memory = parent;
>> +        memory = of_node_get(parent);
>>           type = MPAM_CLASS_MEMORY;
>>       } else {
>>           /*
>>
> 

-- 
Thx and BRs,
Yin

