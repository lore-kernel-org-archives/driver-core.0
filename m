Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E9851E428
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 13:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984346; cv=none; b=YuwD0ZnMNPo0pj+AMyk3FBu2dWsgyYy1lLlmNY8k22zodjRNIMIWKdaxY07mJCuSRGEY/NHgJeyeHDZlZSewrZIwd3ddYo+p0Yv2hsWx1SJ+dmaNiYZLGLTze5bCKA7lVJOxN8McketpnkchhBH4e/ymk0JtsdeW0A3flzAGWPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984346; c=relaxed/simple;
	bh=0INl34PhK/HRg5WJtm1080VCfjv66/kDwm05AckFZQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVAbnCgCTHyHufv8WBshplIDQ6Q+pHoD+9XgxJtVgeO7pGlC5AHpTlhnyjcy+8/CMLKJYJQVbdX2C9z+otSin7yTs+kvRqEMDZy9C1Vuarysa7t/TrFzouIEytigcp0SbTipC32X+mLxT5CIrdA9IWqLDSjtLp9IZLHdulofZF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aKkAUL+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZt8K2rY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aKkAUL+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZt8K2rY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAeqNJ806704
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3zp0rB17dPxE0QziDSpcEJV4
	TAs/poWOIETcgxNKjkg=; b=aKkAUL+8T6OsV9J6HjgfOfDdXbSYg1fA+0PxtFyU
	d+ieAS79rAJG5VVYshE4C3NPYzjveMJMJu147/YVJaUbebJ3QOvBz303yvHgFk9S
	Ggli2kGpbF/6m0WWJGDxYAdqNAsEPxORkNV/Q6m4lm+0WIoLKlP/iiyODDwmrMqH
	U8yUXp7ovv12GYkXWsFyWOTRn7jxRasiMtApM4SNQjf9AubbJq8VOleALZHwca2K
	QKPEAJt/mBB8+BkdR1GPRlwbmxHBG+sKeJ9YyXh2KI/uhYbnl2W8n/DO2fu5GQR4
	mn+ykTkWgzp6c0AKxjA58nupLPAOXs9ys/cl+GLlsjqkZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bnep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 13:25:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ea9ea9d13so61189885a.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 06:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984342; x=1792589142; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zp0rB17dPxE0QziDSpcEJV4TAs/poWOIETcgxNKjkg=;
        b=FZt8K2rYd1u2H27L0bMtdeVrjfCkY3hbIG4wK2U5oSOaxiVtDYZgZ6Ljhr8/d+5ojr
         Kv7XiJQYCmTFpLFvDUzfJWANViDR40KOLiTdtJSrzlXQ4Vrj8CRSPQp96uxFhBcMr3Oq
         a97SqlpyypN45eEOazoqBB0Soq8oyCTtND3o3t+R3dW/TgxZv9zQjNEaUo5HS0dOnIiT
         ZuBSRJ4VUtmOLUq3SmyhCv41DV3yQPoIXxnHI+G9K7UKxaKn5I4yLA3DNu+uxiMtKUHC
         FksmauX+krmjt/x3yI7WhV9dorJHX3ZrMknOaqTBmQg4bmc1LhoLC6cZ0ayQbhANcR2E
         sqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984342; x=1792589142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zp0rB17dPxE0QziDSpcEJV4TAs/poWOIETcgxNKjkg=;
        b=SvakL95aWd1QHA60/U9qUijb1ZDgETW6nqQp1d9wdSV7jWS5+hJoAYVZHuHufuY2qR
         VEE2ubOFpNZ3N16ORuiSnOHvS1OaUujn+VarPuh3dNiNj0qMhPEIQT/mZ0sYGD4R1FtA
         PuTwgtjn+/HpykF5g7njaCjSR+/HtLbpCPS0cjzOGh8PE6YMeBDjx/FKVq2+/hmESBGc
         PAcCgTscHNMWhfuWC7t2GVvu6iq5KKDehLC2t3VpUNplHiPsCP+P1aY+OaJtQgJrM1Qm
         p7E+jDIN3iA/+o1xdVcyimlZvg4ERw1siMw55onJgPN17VuorqT/oZn+NCP4pvsObyXC
         Ycnw==
X-Forwarded-Encrypted: i=1; AKwUvBzyns8LoBJYUW7NZYr4AukMjRjCsawdjO/5ZDCLCJ6yrSLy5YzR0dM2RtijQHQBvDG1hbsV1qUFpILMNw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLx4YB06LW9zLfK0g3e1Al8t9EMA+4OFp3CshjG2cKoRWH/mn6w
	2ioSjryHPIFn9YEURgstWvmAUy1mO1Mnw20MYowjXCZJqAVMxC+0aim8KMZ5scuhK5LazcxZGND
	Dcr/XLTnFgjYYvgn6f/hnX+EOP7ij6hwAdv2Pi8+j99l0+izu0lp+NvEmGNUKpeqVSA==
X-Gm-Gg: AYBFou2Amb6hfDzQ47BJS2GoZ9Ps2RfhIIdssl1hLPVg3ADY2xC/3fPaBQCJ1sYPfSe
	QAEy+pJIUCjqiB1gsrN1COPyviekEaE6+CSNNFnp5tVu8cPNzLWhz7fpr5pTtiMWPbSo9caF7le
	eeBWbnpNOhibP2LDGouSr1rlHnalYcQ3VZJPaYbl+7onzXGmy7+G/wRPEuRfeqmh60clzM/2b2w
	Gpqx3PmupmHi4Sw7/lciB3zTuAI/Jnj2lwubxDbNE8SspQGvpb7HmHx/y3UlfOVxPdNvaaPrY8S
	e1Sv9NI/d5YYP+EzAyLO4F71zrIrXLogwL1JSrldWKx6AS2B3+S8xwMXb584D3A522Wr37i45RH
	xUMe6vrU/D4D6LLbaM2IqEwycFTFKW5WUdCSkdZbBcgCNfXo6nGcFs7nMbYfznUraHEgDyjCJ1a
	3btIB4TYVQGDqT
X-Received: by 2002:a05:620a:6496:b0:93e:c12c:9b6d with SMTP id af79cd13be357-93ec12c9ee5mr2552207985a.72.1791984342368;
        Wed, 14 Oct 2026 06:25:42 -0700 (PDT)
X-Received: by 2002:a05:620a:6496:b0:93e:c12c:9b6d with SMTP id af79cd13be357-93ec12c9ee5mr2552201185a.72.1791984341835;
        Wed, 14 Oct 2026 06:25:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d88252sm665670e87.52.2026.10.14.06.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:25:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:25:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
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
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 01/16] clk: Propagate rate programming failures
Message-ID: <w5omlz6fgvtruhz2mmlpx2jps6vww5rnbnfmfgfyfflcuuxlqw@kji5by4g4ghn>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-1-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RRZK04y7vt7uyrQ-sSdrCvtND3Pngt3Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfX0ic2hx5Fygpv
 MBwyrnjB/6R5nZLiXIVHQ/KY1twhomeQEpLoq1HZrY281meSKu98SpUSWepYHqm+/hFATEkkmQn
 mkwVjYkN0RW9oCY56IiAxLbzVGcpAWk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MyBTYWx0ZWRfX7nLPQpkAMRHk
 zWL8MFqz6aDkdot+Z/bARPMgRhds/o2kajB11eUZRDDKrDYYP8eTRKMNOPnY4L8osczsY0LfsBB
 1nd/B6QVh+3s3EEhC+pL8O5L2UDz4on32JdQX3tk295oeWycfloMjDVif3yZO1yZxQC1SSVOEmO
 qYrMbp0f3UpOKgy3F5INfopn68FpiI21UPZcIvFQUBBDMcj8KAA1UfRbLJShA5IZqldt4bOWFSG
 8a65szWDERp74Zppj7HjfZHwC2yn2XJHzt4Q1m2teOnU0GtYmvmBQb+od/1JwacrEfud1l4IMDk
 D9ZxMGUM9nSvWuMSX1ZMVI0pXuTiQqAx3KnG6qoUadQxdxCREZZbiXumP79lPOYknKnq6HSG3pr
 9usmpMhWsGBQU4fqX4o7wOebLi6vBZiZEWjLVkQvW9bWVuGyRNIOSkCkQJRzF9FyZ2cdQQ4vvcL
 8swLBNxTrQGZ4bLs+Pw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf82d7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mF3ojIlt9b2smrM3QEAA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: RRZK04y7vt7uyrQ-sSdrCvtND3Pngt3Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140053

On Wed, Oct 14, 2026 at 02:19:01PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The clock rate-change walk ignores runtime PM, temporary prepare and
> enable, and provider programming failures. clk_set_rate() can therefore
> report success after a provider rejected the operation, while later
> clocks in the affected tree continue to be programmed. Consumers can
> then proceed with a configuration that was never successfully applied.
> 
> A failed parent switch must not leave the software topology pointing at
> the rejected source or release the old parent's references. Likewise,
> rate notifiers must not announce success before the whole walk succeeds,
> or lose their ABORT notification when a PRE notifier vetoes the change.
> 
> Propagate errors and stop the walk at the first failure. Keep topology,
> temporary references, and terminal notifications consistent with the
> outcome.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/clk.c      | 163 +++++++++++++++++++++++++++++++++++++------------
>  drivers/clk/clk_test.c |  16 ++++-
>  2 files changed, 138 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 4d2cc86bfbeb..95669775f8cd 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -84,6 +84,7 @@ struct clk_parent_map {
>   *                     clk_core->rate every time the clock is reparented, and
>   *                     when we're doing the orphan -> !orphan transition.
>   * @new_rate:          New rate to be set during a rate change operation.
> + * @old_rate:          Rate before the current rate change operation.
>   * @new_parent:        Pointer to new parent during parent change. This is also
>   *                     used when a clk's rate is changed.
>   * @new_child:         Pointer to new child during reparenting. This is also
> @@ -130,6 +131,7 @@ struct clk_core {
>  	unsigned long		rate;
>  	unsigned long		req_rate;
>  	unsigned long		new_rate;
> +	unsigned long		old_rate;
>  	struct clk_core		*new_parent;
>  	struct clk_core		*new_child;
>  	unsigned long		flags;
> @@ -2163,11 +2165,14 @@ static void clk_reparent(struct clk_core *core, struct clk_core *new_parent)
>  	core->parent = new_parent;
>  }
>  
> -static struct clk_core *__clk_set_parent_before(struct clk_core *core,
> -					   struct clk_core *parent)
> +static int __clk_set_parent_before(struct clk_core *core,
> +				   struct clk_core *parent,
> +				   struct clk_core **old_parent)

Nit: we have an idiom for returning either a value or an error. Is there
a reason why you didn't adopt returning  ERR_PTR here?

>  {
>  	unsigned long flags;
> -	struct clk_core *old_parent = core->parent;
> +	int ret;
> +
> +	*old_parent = core->parent;

And that's the reason for asking. A pointer argument is expected to be
in or in/out param.

>  
>  	/*
>  	 * 1. enable parents for CLK_OPS_PARENT_ENABLE clock

[...]

> @@ -2247,10 +2274,10 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>  	trace_clk_set_parent_complete(core, parent);
>  
>  	if (ret) {
> -		flags = clk_enable_lock();
> +		unsigned long flags = clk_enable_lock();
> +
>  		clk_reparent(core, old_parent);
>  		clk_enable_unlock(flags);
> -

Two unrelated changes?

>  		__clk_set_parent_after(core, old_parent, parent);
>  
>  		return ret;

-- 
With best wishes
Dmitry
