Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316B939DBD0
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978997; cv=none; b=juu2AnSRdVm+3ZZBjURgyUakl2U6fYsp/rpAAQfvYybxTh6/FS8nn2NW/VMotdKGU0/3c3GxY9Qbwoi2GRRKDsJR76DrVrr1Oa8I//uNVtvDBpX1bfCUSJiBRErIsWvmiljuOouIspGS1bipLmmuSNvt4VCsvTnlwFhcTypQoYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978997; c=relaxed/simple;
	bh=VTIfmTGTxvevC6B8X6TbPKbB2RVm5xX8myttI1OJqdk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twrdSkwg/iA4GhpdYDVTdIQPgta0XBv0ONRcO0+7SvQGf8+7sYy+0YiMs0nFK3t9f8bg3Hbn0MJatZW7eTQedKwTlluAxDOsQNJKsc5ymrBPEukd1QLZ/Oo1j8sW9ec4VD+IlzIkJhIJunH/1l6h1tZPFuVYw3McDxmv74neeGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f9fHyVhI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPpcm5op; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f9fHyVhI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPpcm5op"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7akr2065392
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 18:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=; b=f9fHyVhIBtdv6EUr
	DlNghKVHtEJRyrLKeXFDlVLXSO1UAA+Yn7hGbI1f0UYI1DNCkSV2lKeExYYLGD6g
	CSPcVJVcKhiTXh+Xxk/ETQTYTWiD579T5wEStNDRoul/rvzTnmVWP+boZ79lxeYB
	FXY6hC14K1DEc4aUkeAYYXllFrx0NuolQS0A1f6pVA4SDRMZaY7G+8AWxlJU+/m5
	q6QTEC2o3J+6eOxTUhYEmqbFUC7PKOZIsJUYrpGkhwey7ynH8YGPR2uJl30S6bXj
	1vlfmR5qjsJ07tSDg2GrWJP2dkDKKKIPmCtHs7DDLTuwk43KCYv1lOSTaNjljB4R
	hLNSRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x1veq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 18:36:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so12946658a91.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 11:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788978993; x=1789583793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=WPpcm5op0+GzY3lSFAJIljukLPjSifQVFZhPyIJXKgcHrXxs2YbB2mLT0RVaimR5Y3
         i7uK4J6cF+j/BH83imXDocfXMyeHIP6zdsLEE7GA96SepqVK9/lGMw5cZl5qPNDotZh/
         cOvo4bu0vb9eFeO2fRNJVVxzu8SmxMC1HriAzF669XTi0TenLumOsUy5QPsUlrKZkAED
         cbCXbmiDs2to7wiKYghNqhOx/CfIY+IqnXtGgt88qEgBdHRj45Lh0w0CoQ1R8t2V5gE3
         ZAmM8sHIp5PgA9zTj15UQPbjmI6pFYtyV5W3P9p0dwGwgaUTfg6qKBafZqKAaMAMo95g
         0y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978993; x=1789583793;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=LWYE47qzfa3hPhhQJwiOnUFH2jz5tvAECIGblwA8qRvCkzmrr0mABcFtbQZUdUDx1F
         M4NibyMLbn9EYHk62nSxeM/uF9jYGdd1R2YvSfiiDAL0MNxC4FFnVa90wzTI/pk8EzmK
         EcsUVkmZIqPPaTMvf91WmY71TMQNJEwLVnqAY0kI45VtW5b/hUmFegUtTXQJmyuoozGY
         CbatItuzaE2XFjRHaHcXue2cJm6DxGzEGHvTumqTbkqvE9FlzpJCzEP8CnjvbRDC/H/j
         0qSCmbaCx3odwwfoGpTvt2/wFOVIi4O/HcCj7A9v784qrzRIZvDE+Ow14fMk2yBChcrJ
         kn/g==
X-Forwarded-Encrypted: i=1; AKwUvBzuLCiViBmtnbNqnYVyXsLUrufR+T0T7x5JEE8gktYcPVbPiWvNoop1BuaAejmPrp9ayp4OkaJyCtnk5Q==@lists.linux.dev
X-Gm-Message-State: AFuF++lxwQ2rnooR1t9D17OYrMTSZYubavxpyl23WKmFjdPCGVNmwyda
	QzEM10IHua1LIIwTeFTJoHOxKa28G8/RVhtOdibaWAcPaareASQMk6oZQUOGaVQ/60BUDNgBTHk
	vyGVmkdQfYe7WvcJeMd+XBc7tDWTTN/yVF9uu4ipZ10sH0tWGi61pRHvJfmkIZTOeCw==
X-Gm-Gg: AYBFou1XqbJxY1Z0nRSfcdBgM7w3bIP1sG0hJUQqm3lue9SnBzK+cut+7FsIv7X44PX
	pg/H+nrVRMT0M/kaiMzaVCTz7LG+/+U9XDUoZX9nOA375BRRzsyv4uekHOUWmPIk6RFnewGYSyG
	HZfhN4kdu5BwWAGRCs2smkEbfs7Otn9qLfUhHwXh66DKfR6iSW/ehPPcghV6Xl13MdMgsPY6Ngw
	hZqavgO1JyLQO7PYGJfVfuOvak/2SC5N5+YNqnm4+iij096cRqQtAzRXqvb48mwlCmapSx+i3Sf
	LYL7FXhG5lZBy8EBPQjLTk2X79U7p1xGUitBypS2a01RiU39oyZDTQ8kS2O4NAHpN3puD3QAMK9
	hLrIGEMDAozRxtuJ4Sejo0DcBM0E=
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821152a91.18.1788978992932;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821108a91.18.1788978992503;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm50371041c88.12.2026.09.09.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:36:31 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:36:25 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Beata Michalska
 <beata.michalska@arm.com>,
        Sumit Gupta <sumitg@nvidia.com>,
        Prasanna Kumar
 T S M <ptsm@linux.microsoft.com>,
        Russell King <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909113625.000063be@oss.qualcomm.com>
In-Reply-To: <08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
	<08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0nO68PE8LbUjzd_KUUiV6vSt05mwvc4S
X-Proofpoint-GUID: 0nO68PE8LbUjzd_KUUiV6vSt05mwvc4S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX3jftaBSsqFkC
 MGB7eq56dCtuJiSl6itvO/7v/l9ZTVEf83i4YYJDYGHlVL5YLwNFeoCjc6FuhzCMcXGjK1PUssv
 qeHXP/O32lA+0+wByVi5ZjZfzlnS3a8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfXyPg1trbnPaSD
 c18SgKRbGChplFqUxvykEtxA+i1E0EkIoKwBEbg2bWLvIJAlF4TBwQBvj7NPi57WQMcgw5DeJtS
 T2R8esrGMFXigEfKUKeoAE0FA0vmHgVA2h5zFpR5ic3YUsVdOS+b7GP4iRh9v+FUpkmnqBXZwo5
 ENoHI2kicTTQ5T654fhZxdntj/1feL1DYGt0HA7fn0Dz294sWnYNWnDW7x4+kRv2h1KJXRv0rzg
 fx7fyXLdVbHfao8hXOaBBKqu1FC6nrlNRj6gmjEQRK8In1186VM5snMHXaih69W5A6mkf5Vy9iZ
 ShyWGzRKQ4MAe3sJ+ELQMU/N2RotKNykkif6VUlZVMpK9oi36G441n6YqD7sJzAr6Nbn5wOxxUQ
 A0oXvlyKY1mo32G5pLvkgB7QSMWif66F6ODbEEdIykZsPTY4Zm77AvNoNjjjnQ1dQueUDKUGqfg
 xIk4mlah0WyVpkcNpKw==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa1a731 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=vZYCpiARan6kKAuTxo4A:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090208

On Sun,  6 Sep 2026 18:37:14 +0200
Oleg Keri <okerixx@gmail.com> wrote:

> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> The product is truncated to 32 bits before the shift, so the result
> wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
> i.e. 4194304 kHz.
> 
> On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
> kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
> the CPU demonstrably runs at the boost frequency: a fixed workload
> completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
> kHz, matching the 1.171 frequency ratio.
> 
> Keep the arithmetic in 64 bits until after the shift.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..804758eeb63a 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,9 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	scale *= arch_scale_freq_ref(cpu);
> +	scale >>= SCHED_CAPACITY_SHIFT;

Maybe just do it all one line?

	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

I was going to suggest that you roll in the arch_scale_freq_capacity() as well
but then we'd need a cast to ensure maths was done in 64 bits and that was uglier.

I think this should end up the same as what you have.

Thanks,

Jonathan


> +	freq = scale;
>  	return freq;
>  }
>  

