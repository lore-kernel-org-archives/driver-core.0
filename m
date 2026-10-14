Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022745505F0
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987620; cv=none; b=I0T3MTT94kpRoY3fddvsorCl4PQUnv9Bu4TtPM/rbJmiM1aVannksBUIS2rI94WeDrinYRmo4bbPqvl/cZItFGTP52eXemgeLVzzf4UnZVrZYubX2a2BRqhG3A3vQP8DH6wMtT5QR5Axg4PxGoQGYIgbJjqR7zUqgizGifd67aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987620; c=relaxed/simple;
	bh=j80kBhLRbRT7ilx/r64SHGFnzqerZq897S7NQ9XomzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mF4eGKTmN2moMbliS5LPWNlSOa/Npd+Az6rdCswl7Tp+McP31lOgq8uy/vcIP3w8bJLkhmoUfnI1JK/qppOsNZXm7wD794ksDeCuGdkcWjVi9DLnoOKIzY9cMKwNPzAHEE9WjBDe16ItLoBotvn8IsHsGLEMb4eH8I3jZ8aO3fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyXGonpd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJwjU2ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyXGonpd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJwjU2ef"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EA9ifP806697
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RH4UQDQQQqR9Z7YiIsMXW6iMHTA6XfoR0NTlbxmgtpU=; b=MyXGonpdVqxct8x2
	fRRYHn5afZ3HJXqg8GSmATfHiv9+UzILA5Tjh9Y5IERP/2KBniqWnkA0rfthwgvb
	3eGqKyZneCD9QqL679OU1ZMvirfsdXXTKMfkesLDAy8pFkvDmIKxi9KOZgETP4Cj
	SL0PB8NoXl2VNfZkmbzM3Px8mROeXfIiVjfCH6hGsUpxV+Dcr9XHECT43rVDLCMH
	pDyF21DrvJKybbdjPTD9ykXm8v0g/xl/OPFsqKopMxFZ13A23gRCDqIOHMzvwYoN
	efZG++hvTjLpBU+AJ22WP5+7HY9t2NBAMO6wYdqa1gX0eEhXBL3d0M/Sqv2oudP8
	VLAbnQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bvjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:20:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5de7ad7cdbfso143963e0c.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987616; x=1792592416; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RH4UQDQQQqR9Z7YiIsMXW6iMHTA6XfoR0NTlbxmgtpU=;
        b=BJwjU2ef66bAtOylpAS+VMMsJFQBVB3KFQxJl6DbU/cpwDGY7jkFnoFLeqQtFOKZa3
         vHA9/bmRn/EcUzI8drRDDvdnIE3yZ9VGI246QcXo/GfEw3TZbcd11trrMNFOWU22KUHf
         aT9hn4lauCGnh/OWbFWB/6tlfVjgyHgRMOoacdViKqwRXGkIpJL+Y0TNsY9GjbqxT4cF
         ujG+Y7ys+m/s6cgC4uaI/tx5XkwEv7fSCEGrkHtXHWIX8s0/6D5mc95gow6DZdDHtXLr
         fCi9tiOeAezsr6xkmxv7A4nIdA5Dv+eFOUPQ3wrc7UjFMCVbW0w31zPp2fbiUhQHAptG
         LttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987616; x=1792592416;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RH4UQDQQQqR9Z7YiIsMXW6iMHTA6XfoR0NTlbxmgtpU=;
        b=fyP0OzzGVnpGk6ac8ycsAG0aNtWwigflr9ci65G5+S7SGHiiGKhPukP8Hyr6UWurLf
         dCn5PKPt8dIljpFbTOceuvX8oVoiHLVotKLuAAyr/et24lKmgC4LZeuo755s3zmyf50o
         8LBJd/VoIZW9ti7V44V+bI1Jz+NUQSJU5A3WKBsXNyqJcR2Fw2DPpbundvC44IymlL/Q
         TRjouaWVKpMI05f8gwCrRZkij9fGihQeIvpAfAZm/a/V2qCrf2l0EU4Fz+GlOCfeRnQO
         LQMTcY8cLTLmDV+aXo2sFSTOie4wJcWRZPEvDjL7m53+TGuqxevInp1PeqHxltpyg9ah
         SNCw==
X-Forwarded-Encrypted: i=1; AKwUvBzdCu3Y36p8jo9V0a4FWLRxSzmyN7BVQX+u0xMAE8dI/J/eEPxjtew8YUA6xovsvtsWe+tnNVfV2lJB4g==@lists.linux.dev
X-Gm-Message-State: AFq9FYLUSEdILvoadv9VMGmWmQC3MYGvLprYy8jFrmi+V9xB896vwMkX
	mjrUo58vCebFItG2tL5sWF563s+7gcA/xZZ5u5RXCnc1DLdQ8cSkybT/gIFPJXPhdzI7HX5Cvcc
	vk1KG4A7naQS/nrruxpfwhlw3auMbJ+7V78ThpXnXeGzwbx3T9wJsiEshycKmcPOO2A==
X-Gm-Gg: AYBFou2TfrdPssOoTy3kIvdiuSEjT/8HSvCXWkzI2Hian7Xx1dXyYlOaeRaIgkRXklt
	OERxgweAw+NvZlc8vzAwO70pAobaeLk5Wovi8+qDBnHvHoQZQvI4u8jpj8J7vznImr3ao9f3vmW
	nQqBjWSZiTMwb5TjwSjrM6Ih+Nva1Ke9Q4jXnBc41LSqj55lxlmIpw7xhE+KBuQinIh+RO1E+JE
	HIIbRz0CJwqi2B/Q9Mr+Hlud9bxeMZVWEWt999r++k/OgQO3/nG6DbM+8QglUoBWp4aO5UeG0YG
	STVJ7ZXI3mqCp4oT7VugyNq00jFKSxPPchOm2o5YohmBLH0iWrvmGD0IPr7WKHv25yVquSU/aVN
	qBPbFv94sdPcDgzd7/OtisA==
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3486340e0c.3.1791987615900;
        Wed, 14 Oct 2026 07:20:15 -0700 (PDT)
X-Received: by 2002:a05:6122:4659:20b0:5c9:f6b0:e5e0 with SMTP id 71dfb90a1353d-5e91f45e3edmr3486296e0c.3.1791987615096;
        Wed, 14 Oct 2026 07:20:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ae6csm713353366b.17.2026.10.14.07.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:20:12 -0700 (PDT)
Message-ID: <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:20:08 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
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
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3LNWlu2qjl6ASJwLvHbRmMpOhZzjf-Wb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXydC+S3RtLr5c
 sY63Kyckxi7R7sXwkB1huR3KF8WscyuljRqc8P9/sjwsdXqI6vWDkoINRapP9Bb2NTHB4pbLZra
 WEN9jyIdqdMDilsBrDvcq5F0Rfgyplo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXy/+GTSaYf+jZ
 DIfuRc5Ta5lTSG68V2IZEt/Oi3GSy17Ahn3QtjTdbi3piSDdPSODNnytu+b7vprxja8tnh5qMmb
 QA3+ejsgOUCojnwtKr8AWup8Fjc15G69JID4GfpLFzb2PurCYriX4ktHyg6MUiDcL87A/h09wlI
 xFA/3YpR5IebEbIpSYyvCPDLP+gKmpdnUa2LDNha1u214wk++J6uT4KLPjOi3NqrR9bnCUW9F4P
 i6dNMgbAtDGecQvkbZd2kadQQruBezBJJAbAlSBh3Ovr7pONt6O/skLDd9+ZQtcHWBsMyFbauup
 eYNoBXhKHl4iQ6dY3rLBxffkUzGftopbeitP62m8XXNSHgqZ+XOgudm8/0j9ujAg9VBC/YX6iSW
 bBiy6wWa9qDD+PO4oB2PVnx3SBDM24088U1CJa3VKE5dKxfZv2e2Tf5Hic6u0pq+oJsAs0FBoFw
 LTzhnUFcpFB7+/LxuUQ==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf8fa1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KR-LitqThD-uOATdN6EA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: 3LNWlu2qjl6ASJwLvHbRmMpOhZzjf-Wb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The SM8650 clock-controller nodes omit rails needed by their clocks and
>> PLLs. Without those connections, the clock-owned DVFS implementation
>> cannot attach its voters to all required domains and controller probe
>> can fail before any clocks are registered.
>>
>> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
>>  				 <0>, /* dp3 */
>>  				 <0>;
>>  
>> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
>> -			required-opps = <&rpmhpd_opp_low_svs>;
> 
> I think this is neccessary (at least on some platforms) to keep MMCX out
> of retention. Even if we can drop it here, I don't think we can drop it
> for older platforms.

MMCX exists precisely to let you turn it off, the clock patches
retain a way to keep the clock on during the runtime-resume of
the clock controller driver

Konrad
