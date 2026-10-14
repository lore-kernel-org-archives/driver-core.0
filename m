Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014AD5427E6
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987558; cv=none; b=bivBPzePG3m94HnzgcsdowyRdE/TFJZmEeAjstPECngahic8Z+QhUzAapNVLE1Y4mJnUaam618wkXt4Ya13oITJTgYEFIU68YkSvtvwfxqk3XyGqHxGO/M2iJ4D9XPEbRunBJm9tZExQ/W4ARmLEAiity0EiCozWzUDOdiWujyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987558; c=relaxed/simple;
	bh=BDUz9+sR1MG+9QTtU4g7da81T1K9UMRtam5/8VK6MzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ead1nkTvaOzRZdPR9I9wKMNrA8TIl3FGwJtMw58gRZC1yDV/hEx82lujxkwCY2pE9ImXEmYR5uMkwlPHxAYl85Kuib0Gs4HqAXmazqEs5BQ7c32aX0YyHH4aVUxwVuGzR+6angR1AEMLie2835Fnn9UtHYZrSNUCplEJDxCHYLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mORoJ/tR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtBSUxmG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mORoJ/tR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtBSUxmG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAJnO2806685
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=otDFpGsBNupOLGxmfEYEnGiO
	SHtffWiXTVN0YvKRNs4=; b=mORoJ/tRx5OKjExxV2I8SHVWam/voerBRirkC9gP
	+P60tMbhhhI5jpo2rM+yBWeoK3vl3s8d1VidWA7fGGkcmMlDl++JB1xYimDsCk5j
	Wy0HYCTZWoHKkyDnBt+uPUfbaW5hpb+aECVcD0Hfk4ZiPaImrIMCOZcvb8TwilzM
	2ncAObT5Vr0RArwE+hPcUmcm25vo6ocD34iqyGZN2NBysb1xSD8jr+2LOEeWtaM0
	82E5E427tsHz/yVcxsbv8LqS4BJd249z30JVdhxyNc16pxzFsVPC/Goxbh+fOoDv
	NH3Bo/p1pMJyBWDLkP20fY5xYpCYsfNnPHWL5S0NLrV/oA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bve9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:19:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so888728985a.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987555; x=1792592355; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=otDFpGsBNupOLGxmfEYEnGiOSHtffWiXTVN0YvKRNs4=;
        b=PtBSUxmGyqm/wCvnhWVWGDo5LsqdslrvTPBneLSCLtu34OrNetJCOd1f30gL+rt7QJ
         6zl9+A1ZcJWdMyjzD7k/j5YAND87gR6CpDLBzif0eY98l4NCTDRItVL43LHslSqg/TZy
         vBjGq4x/vCxNqyiZYxptk3KlEgyhI/JhP9xeLDhCReMrP3buUEWg1AB7+XX5d8lx82z1
         gVF3MiardetPSfrTnFCn+XGkuKZCurbUl8hVqA8K/nwk3cG8Va9cuDZVeiLveabGxvct
         Am9BYOVCDTDqNDxljA+DH+QWyC6RyP4g4itW6XXtaNxTcxvCzeW9VQmwLG+ZSTtjGMOy
         /ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987555; x=1792592355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=otDFpGsBNupOLGxmfEYEnGiOSHtffWiXTVN0YvKRNs4=;
        b=Emdj3nFOGY6nhAER7lze+f4722dX6NLeBYDlvSAkxce6ONtmDB9EyKalpbHML2wpkr
         3zjNmmZJQ3EGziGl6HP77+fjv5U3bcLCK5tR/NM340nOPtjIs0KMPLYVsDs411MibO/o
         VAb1hwZvzdNqdEGJC9FeRv6/XVsSHA4F7UlX5fYWmT1cdpE+DKNXZa9x1LEuU7wq5Vqd
         kuD9bAqZHmkZzD4x/+xzD40OZMOwM2WOCXLbtJu2jqYczGEB7uPQSjlMuURSWawjM2Na
         OqguNtcYbE/CCeusz9gz1+XK9jwJpuNvdl//ACjBwpLsWY203WqtvMBD+5zYvfrc71X1
         XNgg==
X-Forwarded-Encrypted: i=1; AKwUvBxGG8tSiGaif67Ou9p4kmOy5mUtdQMkqhrkoPmYAJW/x6U5iJ0CZuxkEf1D3pcIc4xvV8vQWMoIQyQe+Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYLNLvk36DV7EXJIWvghB83EOGkmia9sLGD/NE6m54aZGs/Xij05
	004686RrZRPOZHZfDf0X4o0sjGIEQ1wtSE2Lt9bvxzbFMUOLDt77CVEBI18eZgdURi5qmIWjVr2
	e1guSWqxeezU8xmEBd3+SatK4aLuYAebC1TGVy4FJdMigfB0luvjUAWgFGJecwMrc3w==
X-Gm-Gg: AYBFou1us2n2u+kaQ2DSOQqTvPyPg2BD/3TISiFhqsSDEf9I30b7+vjuSUfvsB6F2BD
	TE15gasG7SiuN75Wj951VwsT9JG9KSQDGfjoTQyYIszv0jVxyJMkzTYZLPU+mvIGkttr5IcBAqm
	7FewpZxZm5Tu/pIZZ+9sqRM91TUjjJcm7DHLxJIoSmKBgK39OyWz3TWFbUiQqAJ4Klsl0Hou5yf
	eb2NS5mDMB4h9L0PVugI4DmoZEOezFXC3fN9lbyw3+Tkx1P/Ez6QUplt9bY+R94rwyfhP07+Pjn
	ZlsQXrlsJ60w0DCHmEKZD3NLafxM7KNK1gFOqb708qGrBuQ2XNSpC3n0x7LGFa9+WYIeH1apPeB
	kSBPXjEAZyu1tMmDhX6YT3HzvQ7y8EPhSGghZQF2ccEUWthntYAiBqmdx1Hp+q9PTUOEj68Qg1/
	9JfbUv3aa/3eAW
X-Received: by 2002:a05:620a:17a3:b0:93e:6283:eba6 with SMTP id af79cd13be357-93ebd225b0dmr2683527885a.38.1791987555112;
        Wed, 14 Oct 2026 07:19:15 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93e:6283:eba6 with SMTP id af79cd13be357-93ebd225b0dmr2683522385a.38.1791987554612;
        Wed, 14 Oct 2026 07:19:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d85515sm680657e87.47.2026.10.14.07.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:19:13 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:19:11 +0300
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
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: uOyXWU2VFTN5bOLn1bl4uczGHM6dwS02
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfX1eDq2cY4syuI
 oQKkyfdfQBn3wnRueolW+LZR9xkQfU9DVIdfnarb7Sb1HYXwq4raT4eyPSrc/XKXOZZ5FOytnyf
 V0ZrNWoQjKaHZ6cNClvwgPTrLAr19po=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NiBTYWx0ZWRfXxk6cjuqg1UEq
 bVCHSDgL7sqeiFHSlhehysfZU5HyxgjgJT/GGXXt/VN7fOC+13kvq/O1udQmhtyPxmMYYQKbP9G
 MmtBkvybokhTaLFyUp8Q5PXdRMv4MlxiUdst+K5k6nA7kPLML4Q0rS/9sYn0sxojXuq2aQ+/r0/
 dZc51s9HOknIlPauQTnajHcYwG8iQW//kDUgbrT4G76e3dRtSdyV9SGgasfFB2+qZssb55ih9fc
 zrrf2l5WQy/KvYqsRoAWKRSG9feI10/dH2uLLhvBmEHzZnJDr2eLgoVwMUJiuhIlMkitp09l2OJ
 tJ/FEAcYw5lmvV2EF1zLjMJP0vtIrQaWeSuL+Hojw5tQu3QiTjkjYKLleTsXDu+MaWshIGIuzQf
 glkW0Tp3YP4MzyPUNcXtGiJSglyt+RCp2EESKBF1CxYaxQzYynywptKJIkd5jKiVquheKZWGb5e
 ixdllMo/yNWOU93jbpA==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf8f64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gsTOqdxa1cyUJVv2QhEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uOyXWU2VFTN5bOLn1bl4uczGHM6dwS02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140056

On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The SM8650 clock-controller nodes omit rails needed by their clocks and
> PLLs. Without those connections, the clock-owned DVFS implementation
> cannot attach its voters to all required domains and controller probe
> can fail before any clocks are registered.
> 
> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
>  				 <0>, /* dp3 */
>  				 <0>;
>  
> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> -			required-opps = <&rpmhpd_opp_low_svs>;

I think this is neccessary (at least on some platforms) to keep MMCX out
of retention. Even if we can drop it here, I don't think we can drop it
for older platforms.

> +			power-domains = <&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MX>;
>  
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
> 
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
