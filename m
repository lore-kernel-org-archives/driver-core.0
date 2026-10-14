Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6E13DC84C
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995751; cv=none; b=NJ1KHtrNyHSoAgWKw2jbDNSoYuNLkeQQmjIR882z5TAMjXxayAstWEUjZNlaMuUwLtn3bSkBqeONJ6HcpHrXA14dFLLxI4YI7m6h/KHxC8qFCOu7oIFHKOqIpYFD5bncssjR6/wRpa5+T/pfF0A8tHICP2GI8AUXw9c4aeXu1Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995751; c=relaxed/simple;
	bh=X7mKNHor3cLzTX4RTHI+QUppUjJFb+b3imTL4fc0ThA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YRs8BErUm+z+5I5hCn0ygD/ZOo9BATRL5ln2V74PQFYNayzGRN3aZQ0uPhpf/qEEXy9sF50wnSFTBnVR+3xAGGlqnmJFZUwrO15CSvMavwhNMhEVtBrHZwQTl1wc5pKLHEIEzEZVmKSujpA+M3SUszg7L/nAppKy91zweolml5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct5TPH8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YK0N/jAw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct5TPH8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YK0N/jAw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFMihh1682636
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HpmIVHID1TA1uCqcusH2OmX1
	9l/wk4ki8tc/4k57N84=; b=ct5TPH8NgJ+6hz9IIbYXlJOOpxRT8n5U7uAB9ouK
	COsMrXkI4FmK3lof4Mz73RkJFJtTbOh/zK8swqvWDTo+qdZSZTHFUDviu/5609Xa
	qpeHhbtPHsSnjFifl16byXoQ7NC/sByLV+EtHqNAHOUzZ0voS7TjkmGb6mTzN6CC
	EwmQG2T8PPptEvr8aTIcwHokuJsb4Gl7RsCLEdIGaZkZh+7oAl+88uIE4m6tM5Ot
	r+OfbYLPMyMNilHf/HHSPxkZWM6oYjHdmpSXYtOYbIHkbtQ/8yv4wqo/IXf/s7oN
	Cn+tn12kZF5JxLbHEiPQcoa53dmWG1Vk15eZehqLBoTRBA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacb009h5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:35:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bb074ed1aso19218076d6.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995746; x=1792600546; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HpmIVHID1TA1uCqcusH2OmX19l/wk4ki8tc/4k57N84=;
        b=YK0N/jAwHFLU6bTHcHWc5Kf4TSTpgt+MPl/wepGeIWEZmiMANMX8TWqG7Hbbej7oJs
         31cBxu6EYQ+eKKXwM+dT/VOhcZiYevabDQLYe6LI5hM7pJ/b6aE4QWTLUQjBJMLPTjZn
         6/0JyYVKBdGNBzkk1CE63r7mViHHohDFf0DNdw/imWtOad0KHn7UBHkvuHacYGDB1xhm
         AYfEpFG5Coi0ZsfkzZX39RX4BSN3GaCohlnUshbomjXg7MT03+y1GKDleozdl7tgPi6y
         YjS2vnzVRnLe35hA21dSQbbTkw358buev62g/CnuTy/rgoq3seCTTqaE7XzYT/Q3iH6e
         Ws+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995746; x=1792600546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpmIVHID1TA1uCqcusH2OmX19l/wk4ki8tc/4k57N84=;
        b=jmgAsi632v42rbLKVOsd5fWQ/qg7PyQF4fPhnIr8kyPj7Y345CIr2gADqJBXRdPUgu
         NkHIrJW4J0EdHiisKgk0DGOwQqPtuUo7PNUcOqLetIGDOSXR/bsvPJSrbo2Y8KGKJ4aI
         mLnHtpT29Nb5/uQDOPGaUErzerk7zzHfDtXDD6VqyPF+D7888wSpUGs1mCo7Uc0HM7Br
         /l7KAgTa9AOAQDMfStqm0lvxcBrXMPp938JQymU8dW8ZPMN39ykLufgyj8CM/EDHEBsw
         67qBEfmYwZTFuuF0b+NUEsq8Y7XFOCxXhXW67PTKbAzFh2cPaTnAnPPJc704LDOmh1UG
         jbWw==
X-Forwarded-Encrypted: i=1; AKwUvBzGIFwYVG724AuEO6Jpubf+tNEmGKzIbgFmyhSBXyRQxoMrFHqM6Ga2k544BPdfLwCXhVjy+YlnnHhfOA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJUbJdOILgt0XszTuPu2O5frXKlL2chfhE/a4BF8wFxtqW8JHr1
	lcOlPsJYc1/uuOh+qM4/zuSpCWNY7ktPfIDjWesuPDTiMGltzRvTvJrmNuA2C5yIEUdiRUbw4Wn
	G4tcfzzshRDTcoZo/NhsacdBHrR2/ARD4AUKfv34pvq3R3WkyBGdQbCZhq/+lCOTceg==
X-Gm-Gg: AYBFou3/R0lvYSPemLdswTSbGt04DytWDqBE7HRbN4a89F60KzbCl+WFgGoQ1FEgx+S
	BWOx6PeGALVbtwBr6RF6/vXgVRxZQ6JL81iR72IvsH00as1b8pL53Ua+XcNPwoEnPiHOkvp4X7F
	SC9hUuq2R/VN9KxEg8GcX5tanfG123mC/E3lY2iJgSQRxVts9btADxxeaWc74tl66GUEov4FBwK
	UsATUgkdAldKlX7tpt4WwuCCCMgZE73yR/etBi9Cttp/DrPcXQToqfdZUQXp/Hok5pC2VNnZm+E
	2iJNawqQrFYMg1Yh/14T+1U2GuK7fiXUuzHGtkWqjB7A1uhcBpjarOPDkFL55535ir5ZnBzgf9j
	BqP7tBjvaPy763GV8ZAP4AE6LGUMZKF8woLO2gMWtKiUqUOtsiawyXZbsXUQ1IuHR4rYtXPOirI
	OJAYkOM0tbiYbN
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1967090085a.82.1791995745894;
        Wed, 14 Oct 2026 09:35:45 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1967085285a.82.1791995745377;
        Wed, 14 Oct 2026 09:35:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33da271asm764183e87.81.2026.10.14.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:35:44 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:35:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
Message-ID: <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
 <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
 <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VKpIDNPX c=1 sm=1 tr=0 ts=6acfaf62 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=N4fB7MosYFnxNERqB6UA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX6dMx1dx/nxi7
 QVQXsRCUIrbhgkUlFIy3qV1WN9jU2KxgRbF2BYF2D5SPU2L3sDxaZBkdTCa0KtX7+en9KIoO7CF
 a8IqNtchQiVbxMvVQewsrlf5NcJO1bg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX9qXqWkV1vAfh
 BPWN7/NHde9hcYmXYlSrrc3h+gGIfC6PnzECOqqOvsnKzJl5kTHzWobfRxYy/ZrjeXZD8bUApc+
 Utipd142zCLzR6xxWiMT0tD8Aj/af/LxL30hoxACC00+1auWhfhN1c7Fpe3Dtedn+3VQ9Z2ptvZ
 DqZhzuK1lgF2xBJm6BgePbEx/e43gsoF3YNqIRtpiC133PuuY0IHtUKu0mYtGXedNCprSgdQuBd
 TmH6c4794su/ipTaXQ0mbXMEk+vLvOgrnJVYXSkXazrUAcSPkI0RG1rq260aqJW73kr8s/wHGq8
 kqGS5tAOfT1AP9HbUFhGZnlwdRjnxpDINadp+nz/V9RH8qFh6JCtfmbJrxeGqVkB/g7mGqi/P7O
 7DVH3j1U4VllZLkv0QEYLm7vBs/qCzdWkWE1v/YJFtuMW4ZFfQHKnoto2R65DZBdcyoCbODvgq+
 7F80qN2LTlgFSPjfXVg==
X-Proofpoint-ORIG-GUID: -hndS5suTBEYUh7wpaaDYRcDdSylDIoN
X-Proofpoint-GUID: -hndS5suTBEYUh7wpaaDYRcDdSylDIoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140066

On Wed, Oct 14, 2026 at 05:22:40PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:40 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Make use of the clock-dvfs infrastructure and fill in the power
> >> requirements for SM8650's clocks to ensure the hardware can operate in
> >> accordance with the specification.
> 
> [...]
> 
> >>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
> >> +#include <dt-bindings/power/qcom,rpmhpd.h>
> > 
> > I've commented to the cover letter. For me it feels like the layering
> > violation.
> 
> I understand. I still think it's okay given this is a driver only
> for a specific SoC.

Then soon we will get MMRM submitted upstream, which (currently)
randomly imports a set of the clock ids and asks consumers to talk to it
using the same clock IDS from DT bindings. Doesn't sounds like a good
idea.

> 
> [...]
> 
> >> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
> >> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
> >> +	.num_pd_indices = 2,
> >> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
> >> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
> >> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },
> > 
> > And does it actually have the same vote on both MMCX and MXC? I'd need
> > to check the clock tree.
> 
> In this case the RCG needs VDD_MM and its direct child branch
> needs MXC for the flipflops.

My question was "on the same level? Or on different levels? In the OPP
tables we (should) have 1:1 between scaling PDs and PD votes. 

> 
> [...]
> 
> >> +static const struct qcom_clk_dvfs_data cam_cc_cphy_rx_clk_src_dvfs = {
> >> +	.pd_indices = (const unsigned int[]) {
> >> +		DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MX, DT_PMDOMAIN_MXC,
> > 
> > Three domains... If we want to have three votes, we really need to have
> > three votes in the .rates array. But then it starts to feel like an OPP
> > table.
> 
> In this case, yes, three domains, same RPMH level for this clock alone.
> 
> Konrad

-- 
With best wishes
Dmitry
