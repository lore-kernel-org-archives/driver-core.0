Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABA352120B
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988422; cv=none; b=pVb6cR/6nptNtZ1tT6NN7Df/6J5i15EWKUV781tQtZZpcoQD5ZtYxUMuN6zNfGFhJpupA5UU7AZHsXyophGDmNlBWr+AMBCx6SiehTgwYIbTsaeAUnXKJ1el1qoVuSwbzx8nFbOjjDmyuFc+MezECs1769tg7ZThauISxrNwV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988422; c=relaxed/simple;
	bh=+5PLPrr9n0KYI6GRH3NRijC+PobyDKxOrwuWi3GiuDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oyZ4CNY1wjSn3UATZbQyvtui/htA4QJ1KWydzIEVZVLKEh2r+CWjKyhFK8WJSWGUDdxOJt/S+wTgSfbA8YBhfBwScP/PiG9YdJxXx5JcZegZVLiD1egzE2Z8d7sKRvk7MwNLSQSGilCxl6Rx+ebBks1VHOS/+DWZEhaIVcule5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KX2c23bz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HpsU0gP+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KX2c23bz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HpsU0gP+"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EAC22A806986
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=; b=KX2c23bzOARDMXps
	aDYzFVaiUvLyi7xGKrBCvoWp24tfaCh5uRO75xF3e2JMSyF7SSWoQRUq5AAk4nMI
	nRrvwDu/SuH8fVWXBr+GLhhkgIb+y6Y2mbHEPhmr0/POKZ6Jz/gCQDDHmcUBRFfq
	q29dctfIpAb7ZxJYDid82GOg+Wx/DgV8jBG9k0oHFYVzHwTbRK2g3WqRjwVd9W9b
	nHZqWxc5KuyvPxwfLU0OODmPfSvu05tcbiAQ4j67okej+WwkJQNczPMR3dZk62nb
	Sq7IkqQJ8xMkbYKp1pHATkCZgiM4cG/YeIkCx3HA9V/QzMPX327ZWFjzfW9fytv8
	JtwqFg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bxdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:33:40 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cba2460f8fso133004137.3
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988417; x=1792593217; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=HpsU0gP+3Qzc5XvzzFGF8FnBeKZ4kU4u0P3zHNdLTpkSEv2/MCW57QnBbWPm9nhlth
         nFD2tMMC0vD9dhhNAMJ7yPXrxwookjKaqJqsMU21YkJVqYN7+Ut35IcyfShJ6yvIrojI
         InNC7wkatvXL/KH+tbU1yFBTn4oFYmowAxAMQvUXic/47VkGY4fM4zXY1P2pNjmzUX+e
         n1HKutw6p2nJnBxQK2kO6EaEhvvZuszAQzc8VLTD6UlpeNoLdeWjaH45PuhVhm/O/2dd
         a1z1cnwv/O5owHfzqrYstAieXv4sRYZXx88odN71qCkvP9ItnrWAMH4docVm0wEhoKaS
         ireg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988417; x=1792593217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pARb0cSbsxH1j0eV8lXPIFNVaNSi9k1K4sozd3r/QpE=;
        b=LTgh2+4Vl/5CgtVJ4yNmHZgUJGcghtw644QX2fNqew7nE/3tbqWCtmmuqCGEklhfR0
         l09/mf/eMqEHcO3H9lyYc9dMpttOo9boKYT/pCXUNRlb+hvcj4BiFLS5dF2OFzI8tm5y
         Gc749JvCXhfG4EVwMWkgXwqyrXk2G3p3usnIU2G3jwdiX1d6W1hSOFG8jZjzXGSMbaaR
         2nVziyK277VwGbDEPzHZQY42tfwmLMAgiG4/lX+LzbKU12xIydBIzr6wbQpBmwsdKJRA
         fVzIZ7VYnu0KLmNo1lykvBAvpC/5ylQCuCLf41dvl7+aUnsDKeSEKCBCPytNK94cKjcb
         6vTg==
X-Forwarded-Encrypted: i=1; AKwUvBwT1qxYf80xp9UBAIuJtwz3O3uXDOogFVn4EfLcxejdAqWqFeIWiYkuo9hAuoUtXpOSXmCFGHSkfJO0Mg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIp2S2ezFIGutQLeKhulwLtmFJe3mb79SCEtPNBSn2fKPpVxn2t
	PhdwIJPPd6wHPb7XxnE4t6K0cSP6SWv5gCIk0hz2hxA2esF865aDMcCLpXADvpFYRPsxp17VaXq
	D/YEDfP9UPP7RVFNUO0XGIAIUQGmB0SaVogg9dQIHD/+AYCmut8Je7njvoTh4FgJhpw==
X-Gm-Gg: AYBFou2th6ptIEQgNkhz/ceXIAhilf16rPD/n/gJtOZoLtJblh+e4Eptw+i+OTCR36a
	5zU0dwfr0Q8qPdpG6vBd5iIr6O2o5KvLEFfMhJeVNaBG5FSbU4tHEvrqT3hpPEHYZHX6hJO3p2P
	4fd5qxaA9cKi44BrmXiHWp43N4+tCGnDzv5Rl4WU+nLsU236pLjW5Kln3tj9o9BgkIKLDYWnWz5
	Hx1RuTUpiNX8b2ZSo7cAXmTA2M8BVa/nTvQq9vLJkAIv1K7oUdqNhr6ChL9TNaeMW6rwePEiGPj
	elJPdUn/CoNd9z4Zfwj4ZY9FfvCBUjUDdFyaGwodDWKVMeRq3UkR/KFgHXQPYKh9u9r0nxHPbk2
	c5g2P72R2gtfwz7UtAAac+Q==
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697095e0c.2.1791988417538;
        Wed, 14 Oct 2026 07:33:37 -0700 (PDT)
X-Received: by 2002:a05:6122:3b10:b0:5e9:484a:3499 with SMTP id 71dfb90a1353d-5e9484a38e0mr2697064e0c.2.1791988416956;
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c356f981cd3sm327141866b.83.2026.10.14.07.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:33:36 -0700 (PDT)
Message-ID: <0d448a75-6fc6-4f38-a871-7a5338ee31ff@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:33:32 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 15/16] arm64: dts: qcom: sm8650: Drop
 required-opps
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
 <20261014-topic-qc_clk_dvfs-v1-15-3041b788e9f7@oss.qualcomm.com>
 <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <r5dc5p4dozb5lkz4yaiv3epp2nskxmgcjjhf7fgoy34vcsspc6@27wzsgsvgspm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gEqa1DgsYQ2uUgdR8YitBYkvTsC74y1d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXyJMeW9L0Cu21
 /LXFELq/MzcgSZCZeMhXjGrRYDHzzez5g9n3N8cjIO+DbGgbCEB0MygjGWK/WcoGvNW6NYXUrUp
 /x+nez0bprLzHNYv3XzPHxjMa7bMBWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX8fjQaDXynCIH
 pLNo5jduipAWzMk/XKt0ubBjjHpfi868pbZ4ZGM9hS9IyKscdI2zrN9gIIHMBmMEtS1sdeoDqEt
 p1cw7xNl9s9rBCyb5ueL63heYmi5WHV7yoAJLma88PF2jTDm0tkVcu2BNFPh3QXSHeRlLXj8mBi
 LajjHUflWnTaWNlDm60t7z13HYEAoRcWBa6wlxWDhfm0PRW46GepkVNiWo4AY6XTOXsAYnTSXLr
 Tl7JIaBdmDoxrPKDWaTzUtfoojSwMBLZ8b3tFj7O59swFVD6vgNMsd91hjiIShX7f5VscAMtK6y
 W0tm2KEiXr31PGwnAQbqNvbMshhljrt+EtNLZKVMaVh7hu1qj4SBei5G6ev07Fp0DPTPa54ppiN
 /f6DrJkTbz4BCHH207Ta2F2e4JdKdvzLst5JEiMgzIjqRjxWtAdqGiZ1jhN3SLgyV5OIsiC7Bmy
 9OBvV7b6QN0l/3N2LqQ==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf92c4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eDuGKJUQ3iVb9g9TkgsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: gEqa1DgsYQ2uUgdR8YitBYkvTsC74y1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:23 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:15PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Now that the clock controllers take care of their power requirements,
>> drop the required-opps that were only there because they previously
>> hadn't.
>>
>> Assisted-by: LLM
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

> Can we then drop these OPP tables, which only have a HZ entry?

I suppose so. Unless they should also have interconnect values?
(depends on whether these can be inferred from the bus freq for
all protocols)

> 
>> @@ -5200,7 +5178,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			iommus = <&apps_smmu 0x40 0>;
>>  
>>  			power-domains = <&gcc USB30_PRIM_GDSC>;
>> -			required-opps = <&rpmhpd_opp_nom>;
> 
> How do we ensure that we can access device registers? Is there a clock
> (?) which now casts a vote, letting us access USB regs?

Yes, the device driver turns on the GDSC and enables the clocks
and the clk-dvfs layer ensures all power votes are in place!

Konrad
