Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49904F4D17
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 22:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790635294; cv=none; b=iA3rDb3G4bqA13/EhnyHT4DxuDvsJc9yYY7F5ChWA4TSzVQS78t5BXt1xLvNS7rI18s5Ach9JrOUZyUdWdYrC4E1M60G04RoP0cjLqNTRkQDCas2KfAk/oqTuNJg/+7hD+aaLdla3PFziwfyvR8dHJDAz1Df5uCYD/LLXg7HLWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790635294; c=relaxed/simple;
	bh=dlibW/vQ+f9/VdkDSXY1CFVI/jcz3sV6AIMdfgpLZ+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fI3H19ZBhDSjyM5qsCyDpRzY6smP9hJN+XFkN1dQOb5XjrpKcEYbs9xb4vI1FDfahHv8qMXOZIXRSPZad3iGXYjFS3sZAdKqr4NLU4zpTU+KiO2EGVKkajnJA8Ppv9DgBUVD7HQFX9Hz5dtDg3JaNxez64fOuuSrGznQpfQ65xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fjfMX7DC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d5beo0i4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fjfMX7DC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d5beo0i4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SLTiBd2546983
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 22:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2LbniYZ7fnuS8HEmKzDH2uTF
	6sC0/heSzXV6COCGwWA=; b=fjfMX7DCgOmRzT/SXFHOJcxZhAEzsF0iR1PEIrfP
	2PdEa/zcK13cRf9T1vNbL0Dg8hnERdJYitVwMvmb37m9I0krzX/UukT9vhI69UR6
	lqjvxKl7o0WKuEzRtia83YRly66FDBtlLzXVBaGcIArK15GzkI4+V7Jo3qKnHnNB
	WWUDb7rAFiT8n24DIErCVv0m+IweYpsJ+XJts7I5Bkj7v6LNsP5UPChyMg5YTwnl
	17gWs35BJN0fTOILqfqy4rlkyEq34pwWHwWd1yeiQZdc2JeUqsGdNEtYpt5jJydc
	cMqZhq9/NSp4oyuHDnXG5V7xrXjmrPUkuhFGqdQp+AYaAw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynbc34cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 22:41:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34316295d86so5713675eec.0
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 15:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790635290; x=1791240090; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2LbniYZ7fnuS8HEmKzDH2uTF6sC0/heSzXV6COCGwWA=;
        b=d5beo0i4TQhUTK7Mo/dtX3jTbAGSpj8MpqmwHGFTh/8nUgQw3cQgO/W3yyTf/jU0aa
         w283874NMxd6qx8bmDq9GuViGcL28OR3yQU53t5KlZtptUZH52QBcS8oJjQpBP06TfWL
         MezEPnGC1zg4EDoERUEfw36RbLM91XawaAT0ahVTQOBYS0vdZ4CrhBI1vhR0kLfCa3DV
         5MsS8kYm8Q2AmPhkcRu2YCBAmSuHhRE814JQuJHmTiLLv6JZd51HKY+uZVeKfrJF+eKj
         2obhdl2InaXUy3TA6wih/Ph9pbVhdGsvabci+8sUHGZSUFjNfGLxgowJairDlu8MSc2B
         H5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790635290; x=1791240090;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2LbniYZ7fnuS8HEmKzDH2uTF6sC0/heSzXV6COCGwWA=;
        b=XL9+YFqbWIrH45W+f/pEboR+9sRGbiUDHM/RThVO3kdYZl0XMwTUsux6ato+sQC1rh
         wyeSP0s0sKHdXMeX30ItT9AgwyGb1vrF0mzII9wcw1Sp9NzIDbTQwtaNSBD5T8u0njsJ
         cKaul7lHl2wa7PvAeMSdmN/fKtnh+jKTI4n8haPxivrHvQiceil4zzT5I06W0HkAKm5U
         AIQEke4DatGP+AYpjg38shrwQDNtVBOdsi8oJhu6feFbuMxfoehX29CizeCbCI8ICYj3
         +3MRGsu7AUZK18dKTuHaioenGBNU3oegcafp41iIwk+l2WKb6WJ8OkeqaQ6E5l0jZ9Sh
         42uw==
X-Forwarded-Encrypted: i=1; AKwUvBzNSA+thOcAZYgqpKJYqBmhTOiZZ0yVp30dJLIoxOviJCL2tnEoGYCnFa9UUpf+unMwCG+iYHkcIlFXqA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJxbZPXRoS+KpmCN81T0TABXyZiApDV5aFBY+3vFx8anYxfdtSK
	AAYWAvMLOhQdj5TFqM+OZv8buofHAOU7gQVIFtnYYdIcA/VPe4SjezQ84pH17tbtdm/hX+HBSbv
	6ifrDCbuncNsLIYQeJeXuH3ddMnlWXLxksDAIgK/qieVHilHFtRUO0pWHOHH1EuRGeg==
X-Gm-Gg: AYBFou0fAyywjMlKXtK2Rii7gZZ/ezcPYRObHXJTsP5UkvfAU5Rzwrp2Ivfyrt7Rj5s
	nZGoQDTzoStXynbilaw9hKvK/n02C9LTMqdkRAA191+BfCpnaodip2gUZ0rucBh+Nncf1fIqnxL
	DADfilhJVDNCi4bQicHxQiXktMMti7N2e42Lp9VkxDwz5sH/pzBvYQJhU74VAa8zzR18qL+vg+l
	SgqoB/jFiOOuZ07P3bedpnzzMT0UF2eXI4jNB7RkAos30WK4+tS7y/AZamqAwk0jjQbOSbYlE5M
	MjI4JXR1JPTiVx+87fQE0tFK6tdyhGWorBl1gqZQf9SsoxTYKFs4rnVULzUcYarQ9XCwBp0VlE9
	4s4xCcWb3nO0ecs3KFZPWVFUxW9kmpkhThd71ab/zDsA/caNF
X-Received: by 2002:a05:7301:428a:b0:344:bf6:cd8f with SMTP id 5a478bee46e88-3440bf6d66amr7350723eec.31.1790635288878;
        Mon, 28 Sep 2026 15:41:28 -0700 (PDT)
X-Received: by 2002:a05:7301:428a:b0:344:bf6:cd8f with SMTP id 5a478bee46e88-3440bf6d66amr7350648eec.31.1790635287162;
        Mon, 28 Sep 2026 15:41:27 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a49febsm32699771eec.2.2026.09.28.15.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 15:41:26 -0700 (PDT)
Date: Mon, 28 Sep 2026 15:41:24 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [PATCH RFC 10/11] iommu/arm-smmu-v3: Add IRQ mapping
 -EPROBE_DEFER handling
Message-ID: <arrtFFtK7KgQfr0z@hu-ashoraj-lv.qualcomm.com>
References: <20260925-acpi-static-table-irq-probe-defer-v1-0-2c62125d0085@kernel.org>
 <20260925-acpi-static-table-irq-probe-defer-v1-10-2c62125d0085@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-acpi-static-table-irq-probe-defer-v1-10-2c62125d0085@kernel.org>
X-Authority-Analysis: v=2.4 cv=Sq4Fe/O0 c=1 sm=1 tr=0 ts=6abaed1b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=ZUgflM6HN2uMUVLQTkcA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: KT6WoyeJA-H3A04I8Pe-4L3uU5-kMiAD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA5MCBTYWx0ZWRfX9gdofNtEFd1U
 CN7+tL51bp0//5X2UVfTy5l3gvu9BeSTaGCTEeoP8GVejoYFW/NlDWYLApsPeaslST8E4dz3nvJ
 Jhrwkfo1CNbgVJlZsexdmwd6B1WDxyRrSjxFJdfOtOvqsLqFRQGq5m/GF6IRDo12FfRXhZM3vuD
 i7U4wrqquhZp7x0C0/f01uQgx5l2jgCCg9rzxmFb3M/1WPh/jwDJF0ZAfUFVzWceOdtOftyygTy
 ULQw/2UY9S3SCge4l5uIMqSiYi7HogAJwaNkrQxWj58WXr7L4EYaZQooZYLSNvBfyxjIzXkhQzk
 5l8ZFH9SexaIEGWPnwED44j8M4Sat0XR7mJmdTIHnU8z9f1lCTICOlI2tEnbOtIqlL8yaFAgjBk
 7wli3QjiSf08ZUWzBvVQ9w/+ULGkh4sYgxHA4eOk5RML49g213/nQ1Oonhc6MzNfL2tgEbaMSor
 SytM0qz4dD1mFLIc5VQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA5MCBTYWx0ZWRfX5ZBwqemQuRFS
 86+mtz3vuz2SZNxGlBNZssZmIdT0E0IkUytBTG/jhrRXJjwKibWrhlZCBX70+o1BSBaa2yedxoH
 XowpMuhbCva/L2l3YA5nqCaIAWZLYMc=
X-Proofpoint-ORIG-GUID: KT6WoyeJA-H3A04I8Pe-4L3uU5-kMiAD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280090

On Fri, Sep 25, 2026 at 09:48:09AM +0200, Lorenzo Pieralisi wrote:
> With the advent of GICv5, IRQs mapping can fail if the interrupt
> controller the wired SMMU interrupts are routed to has not probed
> yet when the SMMU driver probes.
> 
> Handle -EPROBE_DEFER gracefully for IRQ mappings failures.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 5732f3ba0122..1832389916a4 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -5562,18 +5562,26 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	/* Interrupt lines */
>  
>  	irq = platform_get_irq_byname_optional(pdev, "combined");
> +	if (irq == -EPROBE_DEFER)
> +		return dev_err_probe(dev, irq, "failed to get combined IRQ\n");
>  	if (irq > 0)
>  		smmu->combined_irq = irq;
>  	else {
>  		irq = platform_get_irq_byname_optional(pdev, "eventq");
> +		if (irq == -EPROBE_DEFER)
> +			return dev_err_probe(dev, irq, "failed to get eventq IRQ\n");
>  		if (irq > 0)
>  			smmu->evtq.q.irq = irq;
>  
>  		irq = platform_get_irq_byname_optional(pdev, "priq");
> +		if (irq == -EPROBE_DEFER)
> +			return dev_err_probe(dev, irq, "failed to get priq IRQ\n");
>  		if (irq > 0)
>  			smmu->priq.q.irq = irq;
>  
>  		irq = platform_get_irq_byname_optional(pdev, "gerror");
> +		if (irq == -EPROBE_DEFER)
> +			return dev_err_probe(dev, irq, "failed to get gerror IRQ\n");
>  		if (irq > 0)
>  			smmu->gerr_irq = irq;
>  	}

minor: 

Maybe consolidate the multiple if (irq == -EPROBE_DEFER) parts and
consolidate the return to one place?


-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc
