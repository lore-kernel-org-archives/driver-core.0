Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C8436F42B
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 10:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026690; cv=none; b=F9B/yji/RlcX0H/IlYdFI2QMn0V4c6XVnwxKYVslggafECPfDAZ6rn+uEFL16Q4oQ2PbGQMWvA2uXYfmP2TBz+oI4X1cqL1k5Dokl/T3OSLe0Wt77tlYCq4POgoO5fqhOApscgYtBL1E3SPtj35c+/HSoUPf4nWUT+PvoU0nO6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026690; c=relaxed/simple;
	bh=YMZ3usUZw9E0KGvmv+ttUT13W4jFnP9tOa+jYYoLrz4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K2/paj4jgbc8GcEALjLthL97TiGyzJUUhUVwQJuUNZxNzPPpB8RKU45wknNfV3Zwe78lA6Yw6xp+WlGf4n1K+jtqpQZWaGZ4F3ByPQUS6oB91am1AAhns8uXmvCmccahbCTL283iYBQqvu6A8qCv5oFG6Kb9bErw6vofSgSNwes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R6JWbiHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BSWNkx8h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R6JWbiHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BSWNkx8h"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8H7ro2291550
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 10:31:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=; b=R6JWbiHr1Hws4KFD
	P9EShqlovtNlSf0AByxhdLPJUa4yZ+U1z93tuKKYXReXUOh1Ohhj0F+mt6flshwR
	/tF0rSAvddvM7tnnRNYDFv3A9iHf1kV53PboqvNmAtcE591LZnrza8MHeK7UtcNz
	7ZOsi/JRnOGYSR7FEDqRo30aq6g1dO6aqVzP4lJDQtaHtAmCoHR2NBnkWM9ZsnaH
	jp4+B05Y44J3DavygqvO8iGPet00xALCA+r31AZfZC8hIbuVWCLFIeWfApqtVG2/
	v9sxRb5TtsM4rnbuuWDe01yfk7PpNWDZWXSqhooweWZSAg3Fseq3PT6bCsIOiDrn
	5FvXyQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqxbpa0kg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 10:31:28 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso4429138b3a.3
        for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 03:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777026688; x=1777631488; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=BSWNkx8h1rVw3aHjfT5HbhtO1vamMIXIXQGiBjapxyeOVdna3gelpu8n1TfOP1Kn1i
         WyyIFjZVboXn1Mz1WPxX6OzmOeQB/0/xOiyHDAKsrqB+GM8+kmyR8wjKdVERIBPM0n58
         yUIdUpHJ90+Et/hUnB6xNBFhtleqAcplkTxw+MmmhWXiOydzPaSOp+PKVfxz0E9wlWQV
         H1ErwGDe4idej9W4uLz5TgvA7WQLYrlMoPEVBpgzubE77dIObpg7qzZgI4U15r2NvLSM
         Ej0uFeuC98duMauVYhjctWgvN2X/NZmfekNb0Ns4Lj4ldn0hyvIHD2MJh/KkmpM6faXm
         2oZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777026688; x=1777631488;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fkq8FSSmqZ+BgpWN2pN52kgGZ+J4MmKi/hhUikJKRsM=;
        b=riFcOeoqWUcsz58jgiEzOEz/x3g6gTByl+7L6v+3mYu+b8knhKvQX/dKlo7hDfwxCV
         5gfX2i1cX/Hs2q4qURex+MTiepA7gpJssSaCYRTR/JIslZFUrvgn2QDNWVhQJt1ZpLPy
         09aFj3V25pkJAXmgoLjp7/wk0eIALNrQH4vYfaCOr4GLVdRgAalWgai4ugItvKVvYmiu
         Qo/hSQVdbXPN7vkRxFEHFZOEF8KOGWbO00hzG4iAxCOYRiORkdyrcSyy/TjqwRP8TRPV
         F2neON7C+8rBxQQL2IbJbIABbnP4DHuycBr5XN+j+01mru+CikDoanAJsV+FNU4yqwE3
         VPvg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZGpbkDM//VW6I7ilFiadOY8Y5yqSGgJ0imgFKzOgo8EwXvxuThz5J6b5mXOj9KKp/Ym/KgUDgIph4hQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YySQPPtgwPlW51BiDodZD+6wzHYHM9YXEd7He88n1+yEjQ/4+1+
	bg/RLxTTvBTH9d5xBxgmz/D0+tE+Vttl3YC6KmBPPTTXGWpkhbjtzNRiWH2kZAp/WwBWzVhauhA
	rusZ10etKtYFVvIpi6wJfHalG2g97LkzqH9J4EHvqJK38FV3AfnIqu8kjflKvIUvV4g==
X-Gm-Gg: AeBDietD6LQU2QnJgz0jPRMqLdRarFweEvLsKcfYfYvWWU/sum5G+IXo2YgALO2JTET
	bt3i/ZrrDG0K+I8JFSOZlLNkKer+Sqfoy9mFXsURYp9lZNP+pf9R+YX19kCziie4bJRTdzHtPi1
	xr11GNXERuoUXHFzPDQPH1Tx/k5e3YUyKEmQCwLXUvoYw8tT2BT5BBYghqazoGaJ2dfhO5qcsP2
	0PeMpXJpHKsajS7dfjFNhtgXKll7K2d2e1rskOI7GFTSfPAF+Q/mjs8Nrr1vDcJeizxZjve6RMd
	I31grkSA5E9Mg46Qi5kiSjd9+1oNkdMeaVQFnKM0PByovpgnK+XEfekJrQG+kTfGYv2ycAT71Cb
	qrzPK11HH8raiOruwAh/KDShek0JfXYr7e2brruyXPZIIz7BfAULbrQg0+7D9dsCk
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808613b3a.23.1777026687554;
        Fri, 24 Apr 2026 03:31:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9c:b0:82c:e1a0:3447 with SMTP id d2e1a72fcca58-82f8c962033mr34808559b3a.23.1777026686919;
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Received: from [10.239.60.18] ([106.192.26.241])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9cbb1dsm25153536b3a.14.2026.04.24.03.31.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 03:31:26 -0700 (PDT)
Message-ID: <06c04947-e72e-679b-493b-e112d693f391@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 16:01:13 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/13] drivers: base: Add generic dma context bus
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
 <2026042346-trustable-register-095a@gregkh>
Content-Language: en-US
In-Reply-To: <2026042346-trustable-register-095a@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: llzrNlJh-4EQcqUMhHzVBkh6hdA3flJ1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA5OSBTYWx0ZWRfX9BNxaLiH+tbO
 c0q0JR7TFZjmMT6Df4AdZFy58JTqUrNotkopLCu7tgL1BCaStQ6YKyy0FK2yedP38OfDiB43KBx
 G3jxObWaDBR92w678VXOql6grjtbOAYPC0KHY5DBgyIY50a2TwY9D3U80Ht5n0Q/ne+Qp6cnhSq
 n8uPOPCE/Ojs1I4NyZQVSDXBta9ml1wbvuwI6yKkGah8cSaQEInLgU0TPAhB98+/rLmQbvAVxq+
 95u45zwRI8cIj9OEz98vRmXMeM08Q9H5zhLpMHbAOR4anAQ83BbK4jvYfLg9RnpxVpg/a8A1tJw
 pZ49nH6gMjChPY8ItRYkKWATC031zwmEYlAkjWVgzdXyadY0B0m0xH/Pkonnf5EQVdPc1R+xnCe
 NKGwyTJQiTggZKVNwiwwRFWTh6zZ4cE45XRthsfyYZnM035ggecNivImAKflINsOAJJkR1goPVg
 rCuiSPO77aawPHs7Cpw==
X-Proofpoint-ORIG-GUID: llzrNlJh-4EQcqUMhHzVBkh6hdA3flJ1
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69eb4680 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=K3jt3zD9TrcZs+Uyli2v9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=5Qc4mBPHLNQQZN8o19QA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240099


On 4/23/2026 7:07 PM, Greg Kroah-Hartman wrote:
> On Thu, Apr 23, 2026 at 06:59:31PM +0530, Vishnu Reddy wrote:
>> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>>
>> When a driver needs to create virtual device at runtime and map it to
>> an IOMMU context for memory isolation, there is no common bus available
>> for this purpose. Each driver ends up implementing its own bus type,
>> leading to duplicated logic across multiple drivers.
>>
>> host1x driver implemented its own bus type to attach an IOMMU context to
>> a dynamically created device. The Iris VPU driver now has the same
>> requirement. Rather than duplicating the same bus logic again, a shared
>> bus type is introduced under drivers/base that multiple drivers can use
>> directly.
>>
>> The bus takes care of creating a device and attaching the IOMMU context
>> to it based on the client inputs.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>  drivers/base/Kconfig            |  3 ++
>>  drivers/base/Makefile           |  1 +
>>  drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/dma_context_bus.h | 26 ++++++++++++++
>>  4 files changed, 107 insertions(+)
> as you can not have a device on multiple busses at the same time, this
> makes no sense to me at all.  "dma context" is a bus-specific thing, so
> please add it to the bus that you are wanting it for.  It can't be a
> generic bus as that just doesn't work.
>
> Or what am I missing here?
>
> And why is DMA somehow "special" here from any other hardware attribute?

Let me give brief information which was discussed, in the initial series,
the iris VPU used platform bus for dynamically created devices and we got
the comment/suggestion from Robin to implement a proper bus_type with a
.dma_configure callback.

https://lore.kernel.org/all/02b3d0f5-f94c-43cd-93af-97cfcf7751b1@arm.com/

based on the discussion, implemented the dma_context_bus and used for iris
VPU devices instead of platform bus.

Here, the device have only one bus (dma_context_bus), not multiple buses.

Regarding the "DMA" naming, the core operation of this bus is its
.dma_configure callback, which calls of_dma_configure_id() to map the device
to a corresponding IOMMU stream ID. The name "dma_context" reflects this
purpose.

I am open to suggestions from you or Robin or anyone else, if there is a
better or preferred way to achieve this, I am happy to consider it and
rework the implementation accordingly.

Thanks,
Vishnu Reddy.

> thanks,
>
> greg k-h
