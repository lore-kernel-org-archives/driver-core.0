Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B4493652
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991847; cv=none; b=SrPj1QtnWMSNi9eMUNtV8GmHlGXR7GQYcUqWa9BFZoBs+lyfz7FzvxzHL4wfoffGliTSWgK7zkBzO/TZnidOf0Fy0j8uj03YIaMo3z52HgFW+xZLx8FgQirIsGERtINxNVoi8JK31XxvaVUPGZRLMEeEX1poRkJk9B/BUo1PbVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991847; c=relaxed/simple;
	bh=a46s19uWMHTS78Yk2h9EFiIv+mAg2lXYSLAayKFym3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KEq2qJGsIstG+9rLCA/fTV7yQ1L3ZWrTtIyKfjpnL1RqSRgEyqXVzsBFqJDrN1paJ2eUY3RF4pBJfPZvaansR4OggtSFswn8e1Mf98VgC5exYEvrv3EldkNrYiluuuc9g+aYwiXbU+Agf5ftHQE9C+LWJcY3t+hB2fSnF1yYfco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgHLobZB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsJaziRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgHLobZB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsJaziRT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeCTV419390
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 11:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F+U6g5gueqDjL4Suw8UleQXx
	rIHFe/2S/+8BIIcGQr0=; b=pgHLobZBOfHsMyw+OWxY2u8iT5WDP9oh+b1DmWsl
	dt9LLDWr0ukDkQEmOADsor2bML3KzNJEYXskT8A7puw2q26mtB/6R3kJ1Q1cZyyC
	sAW94fGT6V9SZMFzsf6p0Dk0EpXt3eWAuLuG6WqSRlXr2lDUTQ41+J+5r5q3hj90
	DbSjZji1h2PLdIlt2j43EGBCtfnEqGX46HsHsJOihWCcQXcVV1T+DLLp5Z1Uk3K9
	cH96xumFOAn/cjI4+GOFbqG1u4A3PJs8lwAzXJlKpYmF7IRzT2/XiZYh2zXjpQWf
	lLgEYJ/PlnavuzSp43wKCq14NUiwP/IuYBmY17+qqbNz1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq940r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 11:57:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7348997a91.1
        for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 04:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991844; x=1790596644; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+U6g5gueqDjL4Suw8UleQXxrIHFe/2S/+8BIIcGQr0=;
        b=VsJaziRT8jLPSBlivJwz6j8PbiOVeWg+i3VORwYjeVuPJRyht994pQli6fqU30BZXb
         lXm2HYyXjWYd0aDgz/PKnoyRn2TkX9jWqWhsj0kwA5ozRwpJgnaWd8c6j708nWBfxJb5
         pAH5Cb/fXarS8Ur8NcmtCQITAVHfDfwDCtXy2S55miGtnToCGQ2KrZ3DDaT4VZvLOSxm
         YCpSctknJyQWJ/Oham/2dzgaGHRRaGY0tyrLrdwBG2y8eQTjYqMcsPEPC630Inpc5GmK
         Z7vCs9gZ6pSRU1TVSGHSV7Wxz2iueClmibqD5VEG1G0D0jdVWX5Bv/KX8b/+OUeayzPe
         hlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991844; x=1790596644;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+U6g5gueqDjL4Suw8UleQXxrIHFe/2S/+8BIIcGQr0=;
        b=ql39tMP/Hn/3pqrSB6yDhA2+AaeYIA3RewXmblkAo4SLlDJLY8NTB9PuACOlsve8h8
         gHYRwDSWlR03fptI1+77r7GsIXpyP0cZ7J2U1tsHShdmLofDcpE4z6xl6D3K6skSpF5d
         eOR7hRIZqFJe1QLolrLJ6W5ITJtS13P6ZftxX7PKlOeBFm6l1IkqgE+8m2HmoxVTDqpn
         tVWWdSIpMjxPueamUQJbNOBxnkhMDYdUKPF+lhyFzxecjMu+0AexQ9AiIm7jnUdhCdvH
         blfb7vQlw6fPPYZHJBsURkJ0iNhT5kRmonUj3xBW2mi9/guKXmX+pjKbW5C1n7H0I7z3
         oX3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwJOltlfk/zLTeCJvnZQ2VJVrmgN6OTnWNzmowVpICH3ACKJf2GwpejUkSc2cjPtAFE/UiL4tYc2Boqlw==@lists.linux.dev
X-Gm-Message-State: AFuF++l0tsnm7WbTiKRH4/suqEh8xu4Hx4X+NpBrcbI9o8PSh74kjMBU
	jOZXzuPdcryf/yiSbPlQbRHpURJ+cqIo0eTnx7O7j8KBZCGEoFrz5tJKTJhO2EXoM/Ar/uVdu9N
	K7EXd8P4c9elyalKD/+NwyUAxBUS3kHWWgkwP9kdU5EM3p8mILv3EQZ3fGUBsq+hN1w==
X-Gm-Gg: AYBFou1peYOCGzSnOV3nc4tUBFozGsywCGkwk2YUu3CKgfkvpbvIQDf7ys8BiPrgKvB
	fVsDNQo06xRSTDietNNdbyPk4q+ejo7oDwuKfBl7W4JrPP7xVlT0tNS/obNNw1uiQFF/nxXLbXc
	aKPuOI4V0mhiNe7tO7VY1vm3+Vi+B5oPUOm852sVtYEJnAtodl6f0ASRmj08I4LWdKVCnJGp5+X
	pSCpiRfUcK1mW6uOwayI0o00SxC8qoNY5ltxRG1+AeqlZ0Niayfl7DMyzxSyjsfekUMVVrZOa8y
	EYW4H1xJt5NELFqAT3tbVsqTxPcnoNLMx6vhJlQ4Gia6aP1TAgRR8K226eV+ThzjC6xjcZWuYkG
	AY1rAmZ2xci/tQH1+d/F6hqjUjnblmcDIM+wvFBu41MWBW8TdcxEBJKXR01ean6upF+q/wi8Jd7
	2GVB+xr4JK+12errA=
X-Received: by 2002:a17:90b:5903:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-39ed36cef6amr9098557a91.5.1789991844482;
        Mon, 21 Sep 2026 04:57:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5903:b0:39e:d36c:ee54 with SMTP id 98e67ed59e1d1-39ed36cef6amr9098533a91.5.1789991843977;
        Mon, 21 Sep 2026 04:57:23 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3314313esm19915703eec.14.2026.09.21.04.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:57:23 -0700 (PDT)
Date: Mon, 21 Sep 2026 17:27:18 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sched/cpufreq: fix schedutil's boost frequency
 handling
Message-ID: <arEbnqUuOroYX1oG@hu-anancv-blr.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <178966110618.2386.17602156528185920946@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178966110618.2386.17602156528185920946@gmail.com>
X-Proofpoint-GUID: TCPXKTjXvSUoC4_jZaYEpBW67ag5duuj
X-Proofpoint-ORIG-GUID: TCPXKTjXvSUoC4_jZaYEpBW67ag5duuj
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab11ba5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=snW00zfRmaIRln_NaNwA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfX8hjSVBUJ0Ppt
 DvLLSGZEeRVTgmTI8kMee7ODpWJ1OB+qSxpaaOlg+1RF7DllV93BTvViPcPrlbZ7rTaudJPOdIv
 YIzPm8mzl4EH5uEWOzAcjJ48KzbuWMNVc0DDjpXLTBpep9Rlu7aivXw19jsEc9B3eAlaoP65G6q
 DXKuDMdXwP4guwz32mZTkbkq9lXA4H4sFj58UYRrHTjTlwc6PA+s0DzdsLt3Px/umjmjAUvozvm
 zuxzR3dJd6bdBXZ25lvtfdCqOuVe8VIVgu67pvfd5Vz/nxX19OElLWWl+3Gko4cVrUK6lzXUfnE
 WSE/kH2xXnsAw9nl2oWMnW1qNlbrd/XCuKbYco/9krw+XptMJDoukrVevLORjOWjgxslNvJOPDB
 hbAuI3Q8LoKvOcXhnyeGipNNPKmlWHzoAv5OYJTV1KFgPTx6PUI+YxpZHFRUVE/DyRmG1uDAiDy
 afMYky98DwAXwCtm8vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfX/wjau0Uw/6OW
 UCTwCR+7vbEynnerEaLUkz4obo7NMooKsQZfA8gRejV8CvOAAMdVVZ5SpiViM/0CTB5PZ27aSxD
 vAcL1N3a9UETY/UCljJn688QKNRCR3Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210172

Hi Oleg,

On Thu, Sep 17, 2026 at 06:05:06PM +0200, Oleg Keri wrote:
> Hi Ananthu,
> 
> Tested both patches on a Lenovo Yoga Slim 7x Gen 11 (Glymur,
> scmi-cpufreq) on top of next-20260915.
> 
> 1/2: with boost off at boot the little cores get cpu_capacity=553,
> which matches the 4723200 boost maximum as the reference (4032000
> would give 647). A workload pinned to cpu6 runs at 4032000 with boost
> off and 4723200 with boost on, 3.14 s against 2.50 s.
> 
> 2/2:
> 
>   # cat policy6/scaling_max_freq
>   4032000
>   # echo 1 > boost
>   # cat policy6/scaling_max_freq
>   4723200
>   # echo 0 > boost
>   # cat policy6/scaling_max_freq
>   4032000
> 
> One observation: policy6/cpuinfo_max_freq still reads 4723200 after
> boost is switched off again.

cpuinfo->max_freq has a guard that only updates it upwards, so it is not
able to come down. This is by design, to preserve driver set values. That
is what the second patch is trying to work around. Runtime enforcement of
boost frequency handling will try not to rely on cpuinfo_max_freq whenever
possible with this series, allowing the value to come back to a non boost
freq.

> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11

Thanks for testing the patches.

Best,
Ananthu
