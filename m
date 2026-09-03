Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4DD3BD63C
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428757; cv=none; b=QLU6+XLPJ7n86myQkXP84/bMc9+XjEce/DHgk4A3MDuB3hUwNEDt/0VivFZiMgFr7xhkYKFweh0oyYOdd6QHNIacQVJCqgyKv2Fkci5ofZ2JDECZU1ZPHW8PH0g9tYfcW403Z5WIrONyzOSHqToeP+xVUngjiIU+0tz2iSSwzpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428757; c=relaxed/simple;
	bh=bjN3M30Ep3WgmUgjhhDmuncCbH8FYD+tR8QRFkjuQn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3JunxIBtlZ9dJGjvsyhZi8t8weUvDhc1WLxmV9G767bmydTJJTw4cIL7hL1lCfWHRqNHsKpPWNA/5VxD/M9CZkj9KbcrHOstH9aiT+PR99p3D9Rg9gC7mlFHx4z/A3H1LXyDDSyin03KIYCsUgy1rmmw7kroowiHlL/oSSZef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8sAFUfX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7f6YDSk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8sAFUfX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7f6YDSk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392AIk1158700
	for <driver-core@lists.linux.dev>; Thu, 3 Sep 2026 09:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=; b=i8sAFUfXSEkYKyzy
	kZ1mu/S8BnuJRg7AS65UyLAyAnzE11ToHM7aYAZ4CD2AtI7SC6mabv7lv2++B8WD
	cnyus6NbgNNxojnAnLhhB2WOIwFzG9pqk/mgoSlyfr0mBrOcCH7LMQXTB5+MDLmB
	HsCq41xmadauTBv2uNw1pD3CylGRGU69+UF6Gb90Pp+JV+XOzsPcRSkk8Y8Ws+M9
	nECHQzUDS+vaL4A2Gm61YXuweYgSd3FYcji714yBl1jJ54OQE9Tfe5yskM5uexU9
	UqsbdrO+ZuS3F4RwHowRwZsB7P2nAodkcuWfdbdcsnzQ98HEfyj/ArwCC09Ak/h/
	YoJXPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnmdfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 09:45:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so3565028a91.2
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 02:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788428754; x=1789033554; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=;
        b=g7f6YDSkDi5oeuPwIPBsaYx4SJj0OyAE/ACyjv0Kt914/MO8eFhglXAU8sksCcgSpb
         eo0ml7aKqRpViQeLQTMZRH6S/wWRyHPFOwxJyVLBOyv4ATcj8WvKlX1mUvtRWJ7R1px0
         vOXFOHuN0iKLZnBDoaX+WrrQwa7A/RkYwHbBWqZDxCR5/8nwFBtD2DslIspRJkb4uJG6
         blE20PoW5uaxMcfhqrp9aZGGAepP3EIo5WCPV0V323j0R7AK3BlpP3qQFetR1SyNF/Vb
         kkcRiy1+rBweGbscwtPsfR0nW+/5K6yABd2tC1hccJOCjnEWBxbO7F0hopxRgEU5XQzf
         S6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428754; x=1789033554;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U0lmoue5eucI+rt1G7AZu5sBjUo04Z78KhxZq2assY8=;
        b=IRME1UltPuyXGwMA7J9gDqmAy1AIGCcoc+J7A0eQk852xLMIqZJLZ8d1p9MZ6JiaxL
         iJwfh4OEsApYkZMlSGRab3MioF2NslcNc1pcfx6q/JQbEPKrR7haDdU5euzUb0KrIq6Q
         Fk9DKDX8AejkdD0QuZVfKqmuF3NrUO4PrmvGZ6DGJy+V9byYttEt9tr34sl2wRe4zp25
         Oo7jPPQNOx8M8zGc47xMF0Q+ZxvLgRdub6ZT9vvAho0vyb824NZi9a75DWl86Y4HyTrn
         kiUuBEU8ZWPhy/S6MxfQ8Z8cgHFmxsT3uvzLsKQFcyRO87DIMJp/NCFjqvAUYhmcDohr
         KSdA==
X-Forwarded-Encrypted: i=1; AKwUvBzDpZ1n/dCHJ1EQZY8dK5Z8F/IH8DURgVCt5ORev7ylRItgburJUmI+79C6gplFQMleI6ITMMN7owMXpg==@lists.linux.dev
X-Gm-Message-State: AFuF++kmo9Lhw9xZ2vaFADfDC+iNdIHPLWfo0dzU72XA42v4nGy5M5XB
	ZIcD68rax4a4DGjHa3j7IN7wGV3xno20jaN0cJDMFTV5Qv0+KGyEHCApTSo1j+FrEy5i5/2KH2F
	IFTaFj5t40pifVXBRMPCAg4ktt4wI6ZMjBtSZfXgBXml6JlRDZF90qrbZD7yxs+azaQ==
X-Gm-Gg: AYBFou19GhVT8hRJ2DsMU6T88UBqIEQJ+u3X61U1/j611T2qDNJ8/zzJr/t7DV7BJWh
	orrr4/LrmE6Bofh37FEBrwSYgq6fVow4Vga/25EZwY3Mqo9hz9b2ispD7BKmwx8VDJEsNBJrYOj
	6Yz++i2ZA0mTyMXAhnuR14cm7tL6EQKDcFey72P0aKecumJIHTCbi5YYPi6ywd1OvhOT4+oxKK/
	thr+tPPvDnPpn6ZAzNkXXyIz42X1/dBfb8DlnMeAkZ/rFxuTpCKr9Mv12ptiFjeQ54vsFaoFphW
	OV6Y/DQx0bXdXOZ1p1TseIqkmhtlvMjG7TBwcjQNQgEv7VGklzrYsv41sdUmgDJ/m09eM/dMg4X
	OazYbU9OOSbWrz4UXCg==
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr18256926a91.1.1788428753652;
        Thu, 03 Sep 2026 02:45:53 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr18256854a91.1.1788428753180;
        Thu, 03 Sep 2026 02:45:53 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c39451sm4337270a91.7.2026.09.03.02.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:45:52 -0700 (PDT)
Message-ID: <8664726d-80b1-42e5-830c-a5490f8e531d@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:45:44 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
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
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <bd59c8b4-6b29-494d-b540-8feed38d0955@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <bd59c8b4-6b29-494d-b540-8feed38d0955@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ullwHuftHOcdqrne6HGxWTRuJkdhwww-
X-Proofpoint-ORIG-GUID: ullwHuftHOcdqrne6HGxWTRuJkdhwww-
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a9941d2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=YPZJ3_3Ys_XZ9m81jMgA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX9wYiarz7XlWO
 YQV0w5MSgyHjAqkPWYEIhgscobWmgbaBQVRvz7EH/ww8rBxzDuPmtKGzdcuo5aZgQQv9ml9l75G
 I0/b4IeAnNzlU4I6xPhPpJaYsFl9Idl+5D3FuvpsP+CGM23w8FHL0pfdEnT4HzQ2FORSf2xKDeV
 X/FFnKqlSqnllm+VHWphGBQ09ad3pvlh8GqykhE2JDd0BWOjTEZEUpboZRGCHqmVDcJX8veFPUd
 1Rp8qEgYR58oG3qaO2mZdFaEDAxf6C6RGkxaLk4fT03ezhD0UNRuA4zPeoTjuMcfVEC5gS6Gu6y
 bzyF7Rj/xfFopryZYXpMR2kf8pFLur3gaFoUpc293bRRiI5fIYck0MWkHGPvYQuCp0fYzg7WQ6Q
 kUz5qEgOvyQKCWZCCzf2eMB5ZaMSKLmYXcAigM5YPYnOUQ+SpPir6zdhwKHfd4oBqxMQBlu8Y6I
 EG/W7vJZ0bwMg15ESDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4MyBTYWx0ZWRfX941uLq81ZCYk
 WfDbJ+mseGxj0kKl41FcZ/wjmKfknivsoQI0+WkfWhTW2UXrtDJzuipPHTUuDsuxOOpu3w9GEp2
 EM/1uGVxGgqKQPfd2sqOdoUOJPgPWEs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030083



On 9/2/2026 9:16 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> struct resource uses an inclusive end address, so the correct size is
>> end - start + 1. The previous calculation of end - start was off by one,
>> resulting in a mapped window one byte smaller than the actual resource.
>> Use resource_size() which correctly computes end - start + 1.
> 
> Yes, thanks for catching this and making a patch. We found this 
> independently during other MPAM work, but no one got around to make a 
> patch ;-)
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> So this patch is independent from and non-conflicting with the DT work, 
> so either Ben or James pick this one directly, or you put those kind of 
> fixes first in the series, when you repost.
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

Agreed — like the RIS range-check fix, this one is independent of the DT
work, so I'll move it to the front of the series in the next repost.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index 1e082fb60e30..5d1854d97371 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2296,7 +2296,7 @@ static struct mpam_msc 
>> *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>               dev_err_once(dev, "Failed to map MSC base address\n");
>>               return ERR_CAST(io);
>>           }
>> -        msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>> +        msc->mapped_hwpage_sz = resource_size(msc_res);
>>           msc->mapped_hwpage = io;
>>       } else {
>>           return ERR_PTR(-EINVAL);
>>
> 

-- 
Thx and BRs,
Yin

