Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555685111A4
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988405; cv=none; b=MdfNH94XaWZ0Tv3/S67lBGeFLwmz2y9HOenHkipDkM18RI5Hxko3m+Dtyb76w0Lhcjom39zR56dHt+D0LbvIFvKSClBmkyfRbM9c/j7ylY7qy/BusP30JngAdtQKjCeSZLOEmebLJOFViLgd2clAc6DnBlm3WwXK+JqoDcsIV8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988405; c=relaxed/simple;
	bh=GhAP+Hm1mtY78lJnS460+USnW7WTojwu9rQ00L+MIyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKUkx5TdngGHEsXecI9xoDQc2gpehQFhs86xzzF+A+ff+7hhWopXj7tW1Eix7hYO0SARBKbHzj0O2Npl2+t3FjjHBvKGnrKQJqwBLcRlxkQFkimchSwQ2ngqGSR+q38I69PLZkD80m9hbbbIYKn/Yg9eWz1U7oC09VJa4h1LoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5U3zAgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsT60hns; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5U3zAgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsT60hns"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDHqt4328832
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J0wSqsUrhEenMN1GPGlX0XTU
	gQq+Awy3xS3qfY9XCFU=; b=o5U3zAgVZ4lsBCE+vkZEu9eJPIggjjOoB+7zuilZ
	fCrDe7aclAZi3deeEt3ymrtULjxuskB6vC3ZQ1qpS05XyPN9EvCfI3YlKsEBSF8f
	pKXbRe59uMvF9UWwEOqdjrJdStZZq8HV6z32B+nIIgf2xZhHMMiG6dqJX9clzBo6
	0uF7xxCiTNaNiUIMRjjyo+BGOn5ns/0o1Ap0qJf5Z2L0j2P6iZudcNHPPvldJ2cU
	fmzAL2GY12qXqzaW/ezXR6w7HwZUV0ePNu8PFrL/d5yVw1PzDH2yGPsamuhNI2HS
	Hlja0Nj4fDccRGfG2XDku4JwDAP2PFBpQ9xoGgiffJuHBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf09vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:33:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc0b31ecaso91034085a.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988401; x=1792593201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0wSqsUrhEenMN1GPGlX0XTUgQq+Awy3xS3qfY9XCFU=;
        b=KsT60hnsXXjZOwhl3k7NHp5l40UxbKPLcZ8VI7N37woUszqBYXLNlLETBSE9NCcyiY
         zNOAHxd72UXV3vPfpk1cnEJJ7sioZVaJGaI3uVV+QGtxKiUyZqMjGga/KxmtZITHzFq7
         u50ZQKDkPxvKRefpCCl29vbi8s3AqZECfAiq5fKQytiaI153WkVV/oTT/Sf+5FefkC7m
         Qjp7qCzW4HG4eXXADwm3GKwAOOYxn8ULTGK26XX4ASV3i60jihuZzWjX8yKjWo+4fcXK
         2Mnc5xv7hN4XZ8NnZsUR31/go3LcmIMBwzK/rijOAt5TFFbcTZ4050NtlJTkteymJSil
         UuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988401; x=1792593201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0wSqsUrhEenMN1GPGlX0XTUgQq+Awy3xS3qfY9XCFU=;
        b=xBl3/3YJ1H3gMP8SQBsKQ3BYSv5KfYluj7gNFEpQKsOv6L4RZgfPU+p/unjZksoGwo
         noCILT7tnq/nPcXvlak6ChbCXyOI0oJvmv9OGjp8safMhwcYwC8w1UAZOkxkqZdVk1Ez
         FaureZ9drqItBN2DSygJL36dNqOcVf46Ul4MGD53/DdSu6021QY4osNjnME/bN8DL+yB
         wLhMcxZEzCmd8CpwQ8COgjur4yIq0X7nohTcRS67BqWR2jZ3MkChX8rbQerDEIrCChsR
         4+DLWzRbz+kwzJfNPCEbjKry4ipCSdOvJ8ItQNIYlTvGLFRfssFSDy9M96NmPFrSnzjf
         KP9Q==
X-Forwarded-Encrypted: i=1; AKwUvByTMTkVBq3rVYUkTz/zMMkBwCkRq6Sjr/L1mNKLxdoLkmfh3fcrY7ZbatyVxBHE7um7jZF4Hf1Eg4QA7w==@lists.linux.dev
X-Gm-Message-State: AFq9FYKTXm3WgIEWKs5yEdLKJEOru8NRGBW0e60PXnJxHnLASKkoyq3s
	JzTjEp0q6UgeOkqChQO6OTjajP3YSVzqdInkkosQ6rz9s6xG05kPnvmvWSnwEj2XAQjXLXaQ9gK
	1jeeRyV0VYM9QJIZ2PiQXZxzVQp3nGI/bpYBHBujoAUpsfWnnjCrgRd/MCdQhFxI/ew==
X-Gm-Gg: AYBFou1hx8m+3dfx6e0bzzEBn18lsVrMRkreqQzSua4junRUWteJ3DQSUBHBA2A1zft
	jAqcaoK6Ce9yANddDCBlKoqYa/f4b271uCeTR505pZfSCuG3+ET4KUCh2s//HDXEOULsKm8KOrV
	dMbyzxcndK9tCZ+7MnDPzGdWPiOsyoHpjc+FoAwABJNuVuBXWRP+VY1xxvDqxNaVgNw+vCLfY2i
	e9ReENLDMx62NdpgWltHViAnDn7ZcX4fquACcfJ2bImm/EqV3FZ/2R2wzEaAT1QyeOKhQ57/J+M
	3C/1SqMfDE0mESHllLHXOk33kpEUxUfDXEBfuIAeOykVMkKjNz5WPPP2xZN5Z48TGuuFzrS1n1g
	6eoMIg0ItacUG5JDBjMFufa57lB18IYuvkZC8qWgnLmutgdzHAW41MeohXMgAQ7v4wkeVwykvZt
	8/BjDnVKZN+6Bq
X-Received: by 2002:a05:620a:280d:b0:93e:e394:78df with SMTP id af79cd13be357-93ee3948ff4mr1516721285a.58.1791988401040;
        Wed, 14 Oct 2026 07:33:21 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:93e:e394:78df with SMTP id af79cd13be357-93ee3948ff4mr1516712685a.58.1791988400363;
        Wed, 14 Oct 2026 07:33:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33c12b51sm687593e87.3.2026.10.14.07.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:33:18 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:33:17 +0300
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
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX1vs4IdktHVeH
 SlpH9aY9G/3OgBJGW7fgKGvi7iPesoaUKpceq/mHGuQexbnfghcgubcvbo2Hhzoj7pudveydtiV
 Zi2pOV60tCaWxh7dC3ohEYnhCNErR0IMfJs4A30yyRogK5pgtzN5opeNLAxNJ89mzoau8mjfwlS
 e8cEH+E55A0oUR7EIanD2QXhs/qyvstq2oWGFxV3kyjMzqmE8NS6TbpsQM9l9rS1++xRlu3ZH4t
 nISP6bssEcpuJZMyYtBmaTUSG95fohP6Agryhi1/rh272sRRSbiFkz8a52N+iDcz0TQcMwuLgAB
 cte0GXa0n+YzZz3YLsN2Y9k4ewjTPW9b3V042owwPZYleldFhSEtWjxzYuZQsyTGf3Pa5ehFwtB
 /zfVnEZxiZhAgeTNtp0K8B/8jvT6FKaoKzdr9oAbUK0+8hE0NRLkk+eagGENiiTSe4LYUgqnaxo
 F1p+pe/caggJQO+LaQQ==
X-Proofpoint-GUID: Nul6d4_eFITa9yMzpwrA_mQyQxFYorWZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX+fN9OYxbF56a
 ZFG4g/2F7uA7rgWNQdjROAkZ5vD3wnGw8fIgg/FmV2ryYFJcp2wE/fY6gnUrWdssEskeECVK4K+
 t2PKTgqp7nx49aI8TW/B+QIfRukQ6GQ=
X-Proofpoint-ORIG-GUID: Nul6d4_eFITa9yMzpwrA_mQyQxFYorWZ
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6acf92b2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=W8i7BNQISyomCxrj-lQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The SM8650 clock-controller nodes omit rails needed by their clocks and
> >> PLLs. Without those connections, the clock-owned DVFS implementation
> >> cannot attach its voters to all required domains and controller probe
> >> can fail before any clocks are registered.
> >>
> >> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> >> Assisted-by: LLM
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
> >>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>
> >> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
> >>  				 <0>, /* dp3 */
> >>  				 <0>;
> >>  
> >> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> >> -			required-opps = <&rpmhpd_opp_low_svs>;
> > 
> > I think this is neccessary (at least on some platforms) to keep MMCX out
> > of retention. Even if we can drop it here, I don't think we can drop it
> > for older platforms.
> 
> MMCX exists precisely to let you turn it off, the clock patches
> retain a way to keep the clock on during the runtime-resume of
> the clock controller driver

Turning off MMCX is possible together with suspending the dispcc. If
dispcc is resumed, MMCX should be at least low_svs. On some platforms
it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
On other platforms MMCX lists 'RET' as a possible value, however it's
not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
represent it.

-- 
With best wishes
Dmitry
