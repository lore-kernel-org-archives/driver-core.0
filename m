Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6487A46D2A3
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 10:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986434; cv=none; b=B+Rv7Yr9D6cgfDgZ/9poWnShU9EtB7De698mtavNAnlrm7EIhSD++LU1NKgaLhbSn17FG6mKOr4h1KvHaauDM0NOhae2hdL3/IkvsWuOu/J3tjAl8kVeK5mkBNZfvGYnngfW8o9O8RTxOgHTxZsI/h1hbmgUOrCwKmgJQ14vJnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986434; c=relaxed/simple;
	bh=yxgM3BaImAy+SlUU1mzmEvRZgl6g+xC5GNESqfvIEAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8j2fXesOD73C+KGxagdslkLvcyZ88Qa8dQUPzvHT51FMJ2BshOZQqmhz8oyT4KHcK1bZBhJ0n/hzYPO8HnOui/lQQijb4zn4sDpWkIbmvbfCUg6jlMPXHtLzbk7CBPHjuK7LFvn/dD5CK0UjgtL0/ZIj9rs91Lfn872/4fzgRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hy2TRqgb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A6gW56Fe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hy2TRqgb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A6gW56Fe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84TUq4135090
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 10:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5cKCGzxcgnnpJMH784yDGdXF
	UGRhOGR/aMYRfCbC+zQ=; b=hy2TRqgbMCNuIwg7jxkSzW+UOE8OoEAJ3V0lzXzF
	BY6dYDY7CPCEwGpGTmvbpcl/VxsgRJ6MXa0hXStUIoq2aJIDrMgcoXFmSxCCAkGD
	wxjy+3t9pxYG8Y9+uRMfGLei8f2EvaVgSJvRj9PHrB312hv22LkFCZBS/ibK7BPF
	BxpdwIhlM++7EU8hZua2nN0abYfAH9QOKyaBnrkMPBbBJTFd8YcbTIIXRvCjiviz
	p85qVkOSrVY9e1ivvJg5QTWC6uinvRUjMBMwvjL6NpomaataGmKtRmsCWg+CNxYl
	nYINfHrr59nkFT5uQqjrA+ogc98GV5qIAQ7FGBOhtMlthg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj0kau-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 10:27:10 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so2546157a12.3
        for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 03:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789986430; x=1790591230; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5cKCGzxcgnnpJMH784yDGdXFUGRhOGR/aMYRfCbC+zQ=;
        b=A6gW56Feek953OEkC79haqp9ilV5vI2IvQ2DoddaAyklHQkhGzYN/HePKnHiZcgCKI
         X2ZcpM8Eq/O930xl2jV6S9xFi3S+PfXlHL4yYhdQM2/kx8cDMuLsWavhoFlLJ/f0blfT
         8uCdjEUuSj0HVL63c57+WTALJwFm2vrSo3NFu4pJv9jLI+3QBW1Dz6WypbyssG//tjTr
         IYQlXoA50c87IhQ87c94XbMfrE3yfUwOeMkAJPh/0uMfCtsWhpZVTmH+bypN2ljUaNHw
         tvZWSU8y6qJitxBWD7P5nPizIS6tM2E1mxW+qfyaWK+ITeOuukf/6UF1V+a5YkLA9iqA
         l29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986430; x=1790591230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cKCGzxcgnnpJMH784yDGdXFUGRhOGR/aMYRfCbC+zQ=;
        b=ZNDI1f0r1Gwge3dyVVXvyj+pEY7MFzqFY2oeFdiPcTaH0hfGYoAz39+e0A9OVWr+e9
         08bwQQBaCNKdlouqTfgxJfEv3kY8ZlUg3rZiRDfuBdpf8fY5WKBFeOdzhv3KWXAHEe0l
         KsU6Z9QuZ1xQQ1TpvVkv+MxrPy5lpnPyLNrqWED/R2G9wUZ0TfZL71H2f7529cksb8cf
         Oh1+fN9P59v4W298TGmI6Td4vNf0MCGV3KF4rzw5dFgboepgGHm7BfjD0LT0hqdCJKew
         Jx7q48Fvs2g8ARidIUD+kk2hchski5NRfPKjpzjAbLb7barDS0A56yeTlGIZKqnbAd+2
         pTjg==
X-Forwarded-Encrypted: i=1; AKwUvBwmxiMYmKz+Vsc4FzlTDVTaSUXGL1XADoRp0nvbDdMTb+ZGbJ1srCzGsRKMNbd/CNpg37rRlf1yxfNn3A==@lists.linux.dev
X-Gm-Message-State: AFuF++mCw1GiGMGQ7rX55lGhrJmg0M0qz8/L3wWYOkdok5PLawxVvDTf
	U/OjX28bsYSi7rzV2QMHv261dVgxHHrdQmejRXMovKbPDCSado0SEwdnGyQdHJiLQKrgKe9VTPO
	r9OBlxgpsmx3H9XWzoB3pZj2LikblyCHy7aOa8aqYtl4mwzqvKRITk1TsN39njgdE8A==
X-Gm-Gg: AYBFou0meuhKCeC1fQY/pyUR9r/7K27DRzyHbjJ4oi7JaXyZPAoHFl7biI3dOVwi9bG
	ds+/MlMewn8oJo5jTTzC8D0RgENVT1qeakiUQtJh6YYShTPU0Op1FA7eG6JCNxLem6831MBh4zh
	jMG1cxOUGaziU+JYfRwjr52Ba/jMuaeznUHoWNAnoZBEitf93zIFBR+eIoEUwpToFAwI9z/LCzm
	x2qTUdFSzep29A8qKtnB+2hpgojTLSOh75ozSFDRQpOPO0LMFu7MK+GAMtFJgKlHjJb65jka2cS
	h9S2yICLUGqAvyBCP6skHg2YLu1SwBL5nG5U59L+zhsug5lT5kHO2rybxDqM138Op8+9hKbsO0J
	z/FabZrQIwd9Ec8XFC4QwYrosULFFPsw56/ygX2sBAwar/dQ+hEeXVzawSsWH8940lObj6nLFNh
	GLC6RlBhgYZ7myjA==
X-Received: by 2002:a05:6a20:6a0e:b0:3dd:a00a:7ac7 with SMTP id adf61e73a8af0-3dda00a9e84mr10508080637.52.1789986430042;
        Mon, 21 Sep 2026 03:27:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0e:b0:3dd:a00a:7ac7 with SMTP id adf61e73a8af0-3dda00a9e84mr10508058637.52.1789986429627;
        Mon, 21 Sep 2026 03:27:09 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm22293447eec.0.2026.09.21.03.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:27:09 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:57:03 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
Message-ID: <arEGdyvIEXAgltRm@hu-anancv-blr.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
 <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
 <CAKfTPtBkv2yG6ne2FG5NUY9QfeY2XTYg=GKnyzoFawkweK-EYA@mail.gmail.com>
 <CAJZ5v0h+ibqtvTyOqG+iy2vOLCXx9WwfHSoUu1URDCvzBYU_sA@mail.gmail.com>
 <CAKfTPtATz-aToAVh4sGsTRKM+0sOoVW4AC6gjufAjrFyZg1zFA@mail.gmail.com>
 <CAJZ5v0i_QYa-LcrK1U1VZjZZiJ3d-9hPbMdBbaGoqMds0BAU6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i_QYa-LcrK1U1VZjZZiJ3d-9hPbMdBbaGoqMds0BAU6w@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1MCBTYWx0ZWRfX9H0YyXWmXbV1
 FzDwIXudfjCHv+KxJtSj/ZMqQ5thE0f1K/RqaX6ZumfenBOfk9PRjpxwsa6HHWUUsn5rgPnA8sW
 fQ6NkG3FrWWFuMnXBu33UU62Jk6AFf0=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab1067e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=6V1s5AGd0rRNUVeZ8sUA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 857CL1gKElQqsW62sD-YBIUe0uCoEGad
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1MCBTYWx0ZWRfX/SpC60YTYErx
 XJFQq/rkCqi5uru+6Yr6tFFX2G+KCR8gT1aSuna3STwEjKsAwuaaIVxuNZncVqeY8lYc28oJCKz
 Ltk5HhRRNpDMaYu2YFTg7r/djMKbM9f55ofJynXaNfdukRViOASQCLI7KHohvRkgA1ysigWIC0O
 o9wNhb65kASx6QHwgrAIwOpZBpQP8T6TVPYUtSILF2hYKbrJQ6bnalfryQIGb/IyFJFuuy1ssnV
 +7HTHJPUrz+QztLaOYPMfvF2AT0KRtpFap/jAdLk4+tE1jVvzNM8gLGghISMeDjJumIF7gIblei
 ron+MRPEKGlhzDA+JEGb6lZxr/n3uojBiJZcUh+MoCql/aBu2C0ZqpI7sIaAOYu6QgOCtbtArKB
 ypR48oG65CH7EFKgFZAhDVrOHLKJll5/JX0oSS3jJIVI0Wcwj3CohQj3BMHJd+F6ZcXYUravwzx
 j5Nhr5CtRfwLl6OSyeQ==
X-Proofpoint-ORIG-GUID: 857CL1gKElQqsW62sD-YBIUe0uCoEGad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210150

Hi Rafael and Vincent,

On Fri, Sep 18, 2026 at 03:32:50PM +0200, Rafael J. Wysocki (Intel) wrote:
> > We keep taking the max between freq table and cpuinfo.max_freq fo the
> > case where the boost freq is not listed is the freq table or there
> > isno freq table. Or there is another way to get teh boost freq in thsi
> > later case ?
> 
> No, I think it's the only way.
> 
> So init_cpu_capacity_callback() should find the highest frequency in
> the table (regardless of whether or not the "boost" flag is set) and
> set capacity_freq_ref to that one for each CPU UUIC.
> 
> That's roughly what the patch does, but it can get away without adding
> a new field to struct cpufreq_policy.
> 
> And the changelog needs to be rewritten to tell the true story.

Thanks for the review. I'll take the suggestions into account and spin up
another revision. The second patch also adds a max_base_freq field, so it
would be nice to know if there are comments on that.

Best,
Ananthu
