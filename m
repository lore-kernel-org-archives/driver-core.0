Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342854855B
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987799; cv=none; b=NytQfLYBTDfEMnPWFMcHjAKl1t/2YndrUhMrseHFkZsOWZHfWJqOQMsZQiFndqGx0ezuuwmUrNicSCfHZJK9taKYlQJ+FP9s+8H8jVCbPELn03LF1uME1/b/Lgp2owais3KMeGE6+UvtnZkS/UlhVnXWwAKaZqW9fUs4aeg6NJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987799; c=relaxed/simple;
	bh=tx9Xx/2ujSCsRzYR5b6KO0ZDOUNlLvzT/wn4ry5q0iI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eb29FGyAMCwC9scSMaBhd69WQP2WdGgHN6Zd0o7fsuQCbySR09uINkpgSq3kerQRs07kDNdXrJUpckCn1VYEPSidqazsXKkAfkvl93s+YMNc0AXglfMu5yShkNXSAkp5YdCX9xcou7o2Lu9eZPx4SVrMFt2ZWVkBhDmrabHGfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TF1S2lnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wlq4HeMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TF1S2lnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wlq4HeMy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E8mV5O3000890
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HxggoZsyGw+wkrlt+cBfpByq
	ki1BnMRvzaCfqLVXJus=; b=TF1S2lnZJFZuQXXKI6RIdo8aRvTUHZAqHZILAp7A
	vJ2B+fI4gARqwq99r+lwNgFGXtMxa93KXML3ETomP5IZuOH5YyJ9gK7/E1fLWQfJ
	Njhz16GL+biCZhSaOBXoGBLhL/5bfaybergcrzyRv0NuEbQRcBAyLPlMXzkhD/DG
	9OycF3LNTiwJaIjlAshxM4dJR6atyZd1AJ9HkeApFQ/JRp7tv4t0zxna/RLE6b8H
	L1HIlqLhhbwbNUZI7Torh5L0QRMvwdjVCChlet1V6h33K1KSTGSJPKmj075LpKce
	AQ7Ywkq6UzDQ7KkM0qmBsK5Fr8fsk5lRYjA4ryHoSkvteQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbevcd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:23:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso778719685a.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987796; x=1792592596; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HxggoZsyGw+wkrlt+cBfpByqki1BnMRvzaCfqLVXJus=;
        b=Wlq4HeMyTCPNGImccnjfe00oGE98pr9vvSOvV0ULQT1gCQA5XbTuto4GnGEY0Gja5b
         BQXbAE3+6PAv+mmPaBrL1/Omk+3gj//nUur+N3MbA0bvX/F4VhQbfDF0x55eWwc1MFsg
         hOuEq2OJhbUDJF0581idl2eg0cXDPdMNMnSERRokAXP5vWYy9tvaTqzR2O62NpjPQXLy
         z6BI5MP7nxtqby8Ar1Khs/+nCX7VyRGB2zxu2P1mFy+K2L+zeEKd349zdAj74UVhp70b
         TbkfzQNM0zJDhjbuzkL2gCvvLQjR1o5mdMoRhu4m0b8rvxafyInS3gCQjPM94Roo7FG9
         sxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987796; x=1792592596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxggoZsyGw+wkrlt+cBfpByqki1BnMRvzaCfqLVXJus=;
        b=b383q9H8o+PueQ7dmtxdQ4LhTny4qFZCBQlqm+eD/lM1tOQPgpmkgPHUpVQM65OPA8
         WoCd+AX4tmche9aosFQboLC5ms1+ruNuJAJPYmQxRhbmyTeanLKVN3OpC2fSDVXnA+LW
         5nOnNqVm6gSID7V8BbhPSQ/QhsDPoVPm1yMzdR6SbkJvVaxlu0jVslEQKfbGKIrywHv3
         TqExlz4lmjHyQkYTm/fRFNWyIEHLe82nP+sr9Tb4Zp1r2CYkJg1yXnJ0nR4v/cnaGgGA
         CDTafCiqfdSj8CDeEvUF4R/veekoT8L/63IF8klZhoTD55oYetU4Rza0a8NjhHlsIdMK
         hNrw==
X-Forwarded-Encrypted: i=1; AKwUvBy1DrhhpnTE6adQoivl1i1Sx3engyshh+daASUOZdJt4w+IjfIgnlTGQS/qD9PK/7P0ZJqANEEFgJYrdg==@lists.linux.dev
X-Gm-Message-State: AFq9FYLcK7rW0KnnK0RrirRkjGpeR0CYmJayR3nyRVOi4urupekhC5zJ
	D7MIsmG3s8wK0lINKs1L+86l1EtXQLWHfbhjmzf1tHKkknALubwTOJQgrIFK6xkkjn6sI2/Egqx
	RhaRKEIeoF7cwlGl+IuhEa6h1Oj3UjXZI2lqQEEE7D8VZt81BJahPBwqthMC5Fkj/wQ==
X-Gm-Gg: AYBFou1cmkgn/0FG9aj9nniffe/N8bi/5CYs/o1Cz7h+Cu4jm+dFQjNzxPaKIlxbolE
	jQkHMpYy2gpY4A301BqjEdiA0ZT2p0ygFUEfpuKWZf5ZK1PHf2qsIhWQt3/FEchUqcbOTeqx9Wr
	DMo7sBpiQM5q5e9Z/8sAKkjzGTjd3HzYQLvKH7K25XEUiIDmpjBF5684aKd0nV6rGbHnmKUfE4R
	jQz65dc2dMW+oYMx43ndYA5yatu8zzA5lMkP6TwKJsW3WglYmVVbmLj7scGEJCbTD6cf4s03uYM
	KWJpz3ZVr7NPZxjYxlKRfAPB3h0KLEQJhZDdu85rIHdr5M9fN4b7Sup+ceOBFaobESOtVlG5owJ
	XpzCtD20xjl1O7f7CwMN0Wl2LQHJNHI/DTuWjVVB9J06dBCj/trjXAMEIYNeUIn92lyVtG1PwGq
	F3fvSChei0pFpM
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr2563167985a.58.1791987795921;
        Wed, 14 Oct 2026 07:23:15 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:93b:d79a:c462 with SMTP id af79cd13be357-93ebd26b606mr2563163585a.58.1791987795429;
        Wed, 14 Oct 2026 07:23:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9dcdf4545sm28180021fa.25.2026.10.14.07.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:23:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:23:12 +0300
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
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
Message-ID: <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 4bIpSyBPDPUllRqFrhaPluernVh_NfOf
X-Proofpoint-GUID: 4bIpSyBPDPUllRqFrhaPluernVh_NfOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX4xEHMg3zXVqo
 0ij6IxxG1DU8NkEynVWHDjMGXBOFgikC9RLxBvqu1J+JRRLBYAxrmAgrAiMPA/5Lx14QoW1cnt1
 zSYiZsptyleZANV0OLl3pdRhfcrYfx5f3Kl4trSvB/r8r0HRlLnz3L65XWbni5GqPWlAXJmSqd9
 4QmAFsypQVNJkBmuEFMd4ijVvuXiOAVWs+LryGKzRktjczFzfLyo1t4BI5rMRPqXxAiQ+ErA+3d
 +o0VmL7CNfNEOmMAAFhpoRYjrLQzONBhO5tDmTPuxRA2jnEHlERPrKzk4MsFfU8REmPtVWdSgge
 NhLJ8ujihSuyfsZyCfuzAHgOiB4ehnYwYEMKQaAAji0ATZEI4XqGxQ1wn0P4TTdOuDw63VBmIc+
 cWE8QTSV0HQxenSayzH75Uq4G0Mq+gO9h564XSz7NHxPNoAGFHWcEYMXfMhQ9OqhPV0osFK/yY8
 +yFsE3iwIB7Wwb7F5Vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX9c8MnZsXdDN+
 aWcxTggMzDWWieAs6zIfldR/ZJfPYbP5vxMavgojlzPwZQfP8mwV/NYFuWVtSJ+mN3H9RlFbrGH
 IbNs25SpB8xKSrAkyZ+Zrm7DK7MoguI=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf9055 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=ycGoBvuFAn3-dblq1t0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On Wed, Oct 14, 2026 at 02:19:15PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Now that the clock controllers take care of their power requirements,
> drop the required-opps that were only there because they previously
> hadn't.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> DFS clocks (for QUPs) are left out for now, as they need some more
> code changes.
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 46 ------------------------------------
>  1 file changed, 46 deletions(-)
> 
> @@ -5057,22 +5039,18 @@ sdhc2_opp_table: opp-table {
>  
>  				opp-19200000 {
>  					opp-hz = /bits/ 64 <19200000>;
> -					required-opps = <&rpmhpd_opp_min_svs>;
>  				};
>  
>  				opp-50000000 {
>  					opp-hz = /bits/ 64 <50000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-100000000 {
>  					opp-hz = /bits/ 64 <100000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-202000000 {
>  					opp-hz = /bits/ 64 <202000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
>  				};
>  			};
>  		};


Can we then drop these OPP tables, which only have a HZ entry?

> @@ -5200,7 +5178,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			iommus = <&apps_smmu 0x40 0>;
>  
>  			power-domains = <&gcc USB30_PRIM_GDSC>;
> -			required-opps = <&rpmhpd_opp_nom>;

How do we ensure that we can access device registers? Is there a clock
(?) which now casts a vote, letting us access USB regs?

>  
>  			snps,hird-threshold = /bits/ 8 <0x0>;
>  			snps,usb2-gadget-lpm-disable;

-- 
With best wishes
Dmitry
