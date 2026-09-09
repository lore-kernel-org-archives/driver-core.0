Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B06472545
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788992424; cv=none; b=Q/JIl60shvKtcbrpgSDdaQwnKYq2FLVSn872j11sx0gRuyinswiBGVeN7ABLvlEbwmFw7UeJEe2N7ghPbToAVLIrRFJlAA9NrxA7ghG+MnsnzL0Yj+ovofvTsEgxDlQY7ZGrHeXaF6gVRl2FrUik3g9NNgy+9ynN6BsVhAidwmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788992424; c=relaxed/simple;
	bh=8l+ami9ldrVu3hr0kXGLYQ6blpuZnPW3oAN2iwaBd/w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QkVs6x9pehwybkOSpzJrlg8KM7r0epB0whloIhxviSsgInZod9FTIV7hyIfk/JWp0JMN6BHw77HJPNUwsyq8amaSMz43LsBkycEsTrWwMTcL8Oq6E8w6XzFS4QgHfxhqc2lAKrUqqLkJDzYPzyDPF49FotRvboNYWfO2KcBIdss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nz85hBmb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+pdePTX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nz85hBmb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+pdePTX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9kaj3138283
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 22:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=; b=nz85hBmbk8CF/1HF
	vTbyg+KZf8S/LNo2l7OjmmbgE6jb/RLqXJZdXx/7KYe21yZXFTVCre8/zf9vuEjT
	Gwnk4rQ356tz9ul05I9yxskqShI8GX4s2iQeZXOABk6ey4K1iSCCJ9V5i0lPpxv4
	V9tPOriHxMK7eLuOgElzHggEBXrpL4HyySQPlJPFhhW+gi5N6+1W2ULGEKGB3eTC
	vW+C5kul7NAkiIj6B4eKLhIkaSolGj23ti7/B2aRh095fvIMj+wOG/YdUMb3kUwY
	KcoH9tg26lUD3KFlRiFzbuVd3gufBeg0AK9RL9ToYc3SG69/O/VhL4agBbyLx0mr
	cXB2lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfrwwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 22:20:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b6416441eso7599696a91.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788992419; x=1789597219; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=O+pdePTXanItrKDluMMeMVbjmhqyrR5Q+sMTnS8bMaWMLbaX6ZNCNFmF2beAddbtQj
         nUreZjbjTugPM9qWCv9X+CWSCl+CHziMBQWyVZCpaAHSf7DOSrxLgf9EiY8OJmmokrpB
         L6QTNhCswABTLEq0SkNiyOK0aI8X9mCfDKPCEPjNyAHPey39NFW45l1XKVL33JinFJqG
         1MEqJVWjCJoD3eN5+Zm9T4mo4x7ZosUWRXj4s6Sw15gR0JsuIfjiV+/0VIX4TTCl+o+O
         tUFPiTHkNP2bSqyOTUB40Cj16tEisuWqyhQwA6kS5OgZ21kiJs2HS3jc28ZCkcUfYMCH
         37sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992419; x=1789597219;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=GsU5F+CJnbf5omkcBmL8IbMXEcsncI6CDr1GPRml9nYFNWGTAJ7rRYx4MRhItEvB5C
         1ps/FgMKgI+sjgGscXy3pLDW2WPWkbhqgPk8KYJH0Tinrc6/IHerx3N7eDiyjwhu0qrv
         FeRzTMAIWAjGiiG5YoE2brYfC7RYoKmU9c92NSXY3LQdR3/lbVQDqUeM8pUv6vwCX9GS
         Mij90gurMcND5UNw9aBkU21YCaZpMq6UQYPkUTLyp1k2S9dBrEj0szV7Fr2ELf70xII5
         wJFGuoSjxsvp7YiUGClFWckwrMAVXB+gqyv9XYfao0Q5x57i8VBuJOtofb9kD+Tmpgeb
         c8hA==
X-Forwarded-Encrypted: i=1; AKwUvBzP/tyJXBgtO9OfLsyos9ZjMJ5QyvU5cwm8dtBYZB3b/xd6nZ5r8B3wREBKJEUMdZIafJlBPYjrXnkpOw==@lists.linux.dev
X-Gm-Message-State: AFuF++mSr3A8FOr/G/+oE3JCt/v9DpOuxGFB8wh3cCUdcLwsaAJQC1FJ
	pGS44vdcNqyid+mke6tbuVZizDUoSpyFd2tR/CEmVgTR6vpKXmMeJ5l1dSYLTnrJq/JguwS4lyZ
	5dZ6jb8ZexUvQjDXtZ73YRbMcLH1yoX4dMAZi0v1Vb6MFB81p1a4rG8IVqPJtxtvKtw==
X-Gm-Gg: AYBFou3ybDg4PPVXmVleh2FCPei6At7RxRACB/E/JB4X4uT7+WATAoQLv++F2tLMfL8
	vBUKxtC7P0jixvBSYfztD0NBOQaxQ3kloLzRUfxzjvlBjNZS1HgiKfa86/3Nf/u5lAeV3po5pio
	O7xFdbIFCiw0TWpznJqCrUZnPNeeFahjhaAzTD2VTDoFl1s78vRfpQY+mijSPTcNUbh0TZkftNT
	GY1PwSFC26AqJEdNqiET6wDgtmBtF1KPZ8TxcjxYAseJHZd+eHz06ne7hbvZqmi1kUXkGoJftXZ
	b4BZNQFWGiJMUX6Vj5dbm8xefuRDc6nOp1EqsbjvDPayoxCL+N7tSAgNq63Yz3CfIGilFkBPl39
	o0jvmbne9U1wUGXF5J6HFMMonUvk=
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531198a91.5.1788992419297;
        Wed, 09 Sep 2026 15:20:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531105a91.5.1788992418800;
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm51299924eec.24.2026.09.09.15.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:20:14 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Sumit Gupta
 <sumitg@nvidia.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Prasanna
 Kumar T S M <ptsm@linux.microsoft.com>,
        Russell King
 <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909152014.000055d8@oss.qualcomm.com>
In-Reply-To: <20260909192351.33910-2-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
	<20260909192351.33910-2-okerixx@gmail.com>
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
X-Proofpoint-GUID: qKLIYfqtbRK69k0gXnDf5j5syMT4bi6c
X-Authority-Analysis: v=2.4 cv=GNqdgeNK c=1 sm=1 tr=0 ts=6aa1dba4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GPoSAeC3DJVMy4bTL1oA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qKLIYfqtbRK69k0gXnDf5j5syMT4bi6c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfX3HxuxV2MS79p
 /1G7VbispMfYoAOGAQr/7pBgc6L9eySSNyqhDHscw+ZtP65nceVfPEwd7JDlj/slAgPp+pZDtt4
 9TV1XVhnsX4fa9NiQRDPfG5TyEYK+v8ssEBrP4jSjKuov8eWYjszusLaDapGG71FtPG7Q3KD2C/
 rqXEP/qk4SgFwMLcb+5N0Fg/nrF9eXKJloZypzHuDVGNfz7O6wNmAPtV9pbRPHde8eNrKaO1pso
 M+t+pgmJtNil5kvfrzxqgKCBHPz8o2aW2SkItiozygN/CKkSIULmCr9pyKZe/vm+eX+1JJ9eRL3
 ugMLaLRoCg/WW2dvwckEWzXFfYFdJiDfxnKAMMLYNf+a99g2qXbfozIRbPKnOrdzFoEpMCuTzg5
 gEeB3twLrXF1OB0twBpBFzWdgIB7YQCzCA8HufZfJCxTrfaR2b+wciEMWMGI/YmDhNqU+UNMtDw
 X+qwwr2RnDYy2aAl3MQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfXzb8dUhbfhEZJ
 s0+/9b+PbhgaYC5FHGWxNNxgJIzhiJjfcaQjSQu8mL0iPL4bdVsVStaMkNX6VX356oWuNTRUbMk
 4lYqXAEIDuLCwzIeUiPHJPLhDer/7t8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090251

On Wed,  9 Sep 2026 21:23:50 +0200
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
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
You don't add that for a review comment unless it results in a whole new patch.

+CC Sibi who is a whole lot more familiar with Glymur than I am!

Jonathan

> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..0eca321ff113 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
>  	return freq;
>  }
>  

