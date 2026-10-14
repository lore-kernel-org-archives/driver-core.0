Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52BC5208CD
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987479; cv=none; b=SoYeY8iH1QAIzUdHWJOFHUIvh/5jn+OYPZDt26Y6tNLp1k4rZ95/DmOWGJ7w80UypgD19maUTSr4IeoldpJDUTQHqBuEanQDO+85n4U0fPOwC4znN3jM6PBx7tqvYUCURt/Ma0ksWXTR5FZ+SUQD2mbsmZPdv0r+Mk9KLkVIDTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987479; c=relaxed/simple;
	bh=mduGJu+RGnhlm5vJbzOcVpHGjFHq8q+1YTzaexNaa8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neeh9i+dwmfQumL9WiRnwUIwwntQwcejgA0jzn11o/fnBEhzppmKCszhrdfed5ndo8YHkCj/9+Xt213tvLgTBdQ25aPDFumPkTpUt+JM16qiANHtFJyOqt8Ec11lcvfoEL6G8UwefmbGPsLpDr2XYs1xsDIiQc8mWEUu59hPuNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5jHKLiP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/H9D0zo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5jHKLiP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/H9D0zo"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDHpjT328824
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mhxN6zCpb47Rc0mlziPtloK7
	GA4TQmP2+HsXBPO93LE=; b=L5jHKLiPUzWtbvAi2aJJCGwrcdUuohdkcu+eStQs
	qpBPUShHeeu+X0HDAMG7Q0pFPpZTcXZaGTr79Cx6KDs8Y30f3EYabmFMnbsg/hYx
	B7fWSkHsnbr4MMaHcKcBS6Eo7u31nfaeJXMsxyHId3rXGdOzOMUJLKZmAGes0pOR
	v3lMtazPN+mb0ubowLNa8p/j1Ym+hty+9abCFc8Ocw/nwO0XprkaZE/yyCySDTGO
	g7l9ecdxgfxLoUVnO+P6wJvey9lcpi0DnFrgUxxoU+GoBjpFS3yP/xdU2k2QLNkE
	bLhM9ZQGPRnydWjcZGm4IsXqPMjZRrTnJ/aIIMxySgnOkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf07vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:17:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so208828585a.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987476; x=1792592276; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mhxN6zCpb47Rc0mlziPtloK7GA4TQmP2+HsXBPO93LE=;
        b=E/H9D0zoozCAyVlDzx4Odes1kkiWazvDG6Cz4E7/SLGy0hThekBjy9ODXbTDCPw0qc
         q3nu6UAf/MaCIMwJpg0DFqLaEL7vDqJfhRfaaJlg68sMaIv07Izn4ebxyocAiKe2wEIm
         GNvk8OY44jtnD/yDrPo2SviFPF7/X3Y+U/IZO+SoAMrFixsD8pu77EaNeP5dXosAGdo5
         U3Ns2t3u9d+DaPQ3QhzjUoplAHS/1wRj6fD7H89oVqW5mmpuztJL8YhU4/zZhxqLgrqv
         IT9r3rRW3ZXCG4j+UDjJUFsAHpQwvoJrVRFgemLcAyAjFW4pTsnzizGzDpLR4sl1CeGx
         PH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987476; x=1792592276;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhxN6zCpb47Rc0mlziPtloK7GA4TQmP2+HsXBPO93LE=;
        b=1zUzFrks8jQ5/Vq/DxONUbA84whNGhBMcWkFLBELQrIf3o+MzusWUsiZgcqrONFj+x
         CVyk22bhEd1XNMHR3xiynDViP2i9eOG3LLk/DQZUqXQzIPbvdrWPcS4SFUIHmmXKFxa9
         Yb5gIkUX5qXm8h92rKtvTSFZRaew3WmRzAAdBkbFJH2JW1AjoNQmAwPv8JSx9OmMtJny
         gszoVj1MNTNkx5N7GFcg5i/NbCfIaOwuKa8ONojNOiuQQP6ZOrWdgg843CTbduOmvdaR
         xGb6aDDo9ElsZ6Ff8nDok8H9gM3Os+9JgIXG9KC5ESIw/WWf3KyH6b/cbqRudCiMj/hW
         SJAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYp22hGEs1vGFFUcAFPjpgr8aBx9m/JdKo3P1RVHCAP+eZovWJ3cCMuZUIyL2zME69XKqDBsTmosLHCw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJh+PvGeeMHDS3HqA3qF8GtB8CGXS6cIpVnmQOVGqk1CbkfmskJ
	e5O4Mhj2VrOJHWur1d+i5CQNy7FEJ74K3kS6DcDMK3ToJilpuK80CiXsHVVL/2wVl2PL+NWijnz
	/ZGrR59SdGt+MwOVlUpFz0XM38O5pYjmCOCM+tZZlI1nQZrFff057Kt6U1EKucOSJXw==
X-Gm-Gg: AYBFou0CqLfFur01qi0bgrChp6AZhI8PgF64NqXDiikH8DJL+yqldRqQbtNxAuPyHob
	yk3HuqGpiCJCmbrlXK+Jxg69pU7TuVkcabuyTgTfrHHwzMR6qgkh4RQVuj6cpLpgGvB4Fr1xHBg
	2MC7ijAUqSNy4yZWnCTGzVpT5EC5ZBXycup6pIFUeXBvRXkR2kozH3eJr071OZJhFEI6WlH8Hw8
	tNdLQqxq2/cQi/uZ5s9KPush6604jh5ZTpOwo7w0fWUpM0CsQDljz8byuVFJVEGgxIaku9IYh+c
	keBKGchH2wis3ACSMwKrk+tEZwLmG/3CtbbiXawLwmmVKCwIt3+ZsdxVmtpP7WEB54QIC81RmCo
	hyfmXL3tAZ9aYFtbV3lmpSBVy9EDaL2CMp7HM3AL+x7LZsw8vuEr/qa6t5Ivu7wCeY/GaHm/lF8
	KgMzB2yoeVg7B+
X-Received: by 2002:a05:620a:1d09:b0:93c:891b:90f1 with SMTP id af79cd13be357-93eb96619c3mr2384350885a.26.1791987475920;
        Wed, 14 Oct 2026 07:17:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93c:891b:90f1 with SMTP id af79cd13be357-93eb96619c3mr2384204985a.26.1791987460504;
        Wed, 14 Oct 2026 07:17:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d90ce5sm688706e87.59.2026.10.14.07.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:17:39 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:17:37 +0300
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
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
Message-ID: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX0qRzlg9K5Ziz
 4vmSoF/oc/w3zaaEQK/h1V+Jbv7maxVOfBBx4sKIvKnaXlz98shOdFD1TsLyrnBVYy492m9Dryc
 NlqukSXDTZNsb6w3fRIs7F8XO0+jolmiYhV5yir6+RynlbuChTNqdUsj/rmPjte2UXUQoQMWikC
 2f0ZjQcRwuDxcG0VaO/Ux1heczpf52KXv/j4YNpbEne5Twr6TOfUl+ekc5mt9ZtKyoHy8GYsLzS
 SDn/NjmVKhGJ1H9yRlBL3RD01pijqovZ1tPWks8yPC58km4JjUkJwcVAAvSSWbOTL2mWF6tVBXe
 jP5Y4yVMzt8Ef/HI1ahwWWI9T4KZ5lCVV6FawnaS/yKH8BKQcCMlJRVQsvJ5ucKC/5ikt+SRo0K
 9EYz2wQp702Q5RWTBaaq7Uo4VO5WEXzj/PzRLAtLxfsK3RYzrUOO0Ia+LNXFhvo3LTeq5EZC9BE
 FdVQ4GaK0ioosiFxNsA==
X-Proofpoint-GUID: tNdjxO_vJ2VmHUrarzKRCsSMUJiRNyeG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXyVOCmYdPOpAQ
 ek07cJdI03haog8qsbPvZNOU2stIrUSUy1g8mII5lwQuyUFIXCF3+Cx74vvMUIOpqorAaoM/rEc
 XK/CJu3UrSVr+sRIGahlHAUONt12Suk=
X-Proofpoint-ORIG-GUID: tNdjxO_vJ2VmHUrarzKRCsSMUJiRNyeG
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf8f14 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=gF80273UUj5qe3Hr1MkA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Clock controller power-domain attachments currently become parents of all
> top-level GDSCs exported by that controller. This conflates resources
> needed to access or operate the controller with actual power-collapse
> hierarchy.
> 
> Allow callers of gdsc_register() to suppress parents inferred from the
> controller device and its attached domain list.

I think, each GDSC has a parent (in the hardware). If we don't represent
it in practice, we likely need to fix that.

> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gdsc.c | 13 +++++++++----
>  drivers/clk/qcom/gdsc.h |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
