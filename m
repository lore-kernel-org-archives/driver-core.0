Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883865349B7
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996355; cv=none; b=HycfEtLmGBEDP2jCGF8zTYIkytLLOMQsovsZTwNaQFxWAcjqvasUsow2+ASwhjMSop+9Tiyp3oqv45Apaz777d/vMYhsqYIPNqq2iCW1F9hHPTQLA79jmesboSrvBvPKStYkGjE54yw0Y3n8nicMJMhknWbpiB0/mPCgYYu0/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996355; c=relaxed/simple;
	bh=avmiatq5ycfq3Gus4JRQptPL9QjSFPMI9z8DIWEoH7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rnqGYUke64uW02HT7D70zTYmRn7okax/KNZEF/386dQ5/3N6Xriuwg4zp0P9nUzGRgwZlB3IAsBeKD1wm/q/5eYkGJ5V6EYgb6AVOyDaxyYCO3SBJWWZruCuYi5AhRA3+OyQWUFQERD18UiWbhnja8WQ2c8jM2EROIsY/mji42c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jEzHYwH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TUbV4kOj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jEzHYwH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TUbV4kOj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbEFT301159
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:45:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOGH9ZC26XcWJ/gjq1+5uzlqR8S1/dn0I31tPVR1QeQ=; b=jEzHYwH934IrzYuI
	ynJmeEIh10QL7DWW/i4crH5aW5gLJqI9MFNYhhg/EPHi4iFypDBphxo4LKCahEk/
	So5w5/cahPOjHd8RAXJjXucGpXKXSNchNgpOjmEUkdPhFuYdXbQDHRMMrvgNikEZ
	n7bDawQlRFRxtN2LksRIpTowMHqEKWRuOSbq7b1a6siGKwn6lP0AL9pT/ppwnYEp
	4Bz7HmB1FLq3QJTsx+Ipz9cqdaMgaKM4yUCJWrh61m6X95F82nm+5BHWYL+BYwSG
	P5Gygm2w8POEDqWZcA30mucnro9zpWojaN3cyG2Nut8IWyXYfiDGfAIULC6rUWX4
	yQ+Opw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622kqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:45:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f0aa07824so6429485a.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791996352; x=1792601152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOGH9ZC26XcWJ/gjq1+5uzlqR8S1/dn0I31tPVR1QeQ=;
        b=TUbV4kOjGfXpAy6ih/n0EyS4sVrdPueayI7tpAIw1pKim1n2NrJZjXLtuWRoKAVHoN
         C8kzltfMwjmkL9lbrjMW7qE6Ia+nILW+IkF18gUL39Wh5KzNnd5WPKU+vgwfwpxpCjav
         EYxtfntIRy33BUXghPFaKwhaaF84Bu3S3wvGcmBgPtUivKf3zUuOmKZaI6js+fSgvE8j
         J/44BCdQ5mAuH077J7KEXi2sYDFCu+SK36LdFgkBAcKH9BwNlh6kDf2yRaXhDaIXdiry
         wfy7Oe3wYf8yJdJ/jkuOEvsBXEaxLavxT44HNvWhhs8mZmAGnb8c/8AAcqmz+ABxKl+B
         AKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996352; x=1792601152;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOGH9ZC26XcWJ/gjq1+5uzlqR8S1/dn0I31tPVR1QeQ=;
        b=SYTGfp8qQgCRlyEHA5o8/bj2GPXYb2pe3/AKNqxcmzppRo/Yjxf/b5NYrJgNfPe9BQ
         /rjEhV/YEGKRIIdQkNA9V3TB+Kblyu0VbuO+M7lc291mx1oLDrMfzcUo+tG61JFj3ykQ
         Ypl+QcoUqsjVNd4kraCcr8sJ5lQ8ydJQTyq+IbUOhH16TRQByQXz15R2J8dtXX0vsrs/
         jY3Zu40IbJ15ZJ2y8d2BY6SGtaIFkdnpPTxqorM7P0+Xmwh/QA34DlRaDhydfaaUhhiP
         ADZPTqfPliPtMLTbsx1wPa7KykEyXXiAjJESpAx6ajnBd4qIJrqSX46BLRIMy0/CbvaL
         sAww==
X-Forwarded-Encrypted: i=1; AKwUvBxNw9GFsNkqPjY1QMR4gbjw/vHnU40RCuBc6zB1onRKTLgZYeswpwinEaAsb6ECVs7ofx7/HwiQnkvfCw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJd9noCsHD3pwBPJpu94V5lVOX2dxyjGpW7EyF5jnnPgWTu08fS
	R3BjYyKUM8VLVAlxfj5UU+XF3x65KT5Gp0cZo4bNRYwHwLIlqpTIRKN1WCMy2ZERILVDESW3hih
	VUvl97lrkWisJ9wVcAa9UF+O2FGCWHoYEJKY2ZRYTMGl0Zf1me/f3wq7ClWBI0WnnDQ==
X-Gm-Gg: AYBFou0wV2sL0zLNjibnVFHmnuKsFhaeoVlQfFGTZbGB7cLVAy4/HZ8uMhoxTl+zyAa
	qkriuYnP5ifFFudNJYdZx23ghNmhi6A3Y4cfQIY9hMWAI+L10VHrcvC9/GBa/gSAPNvPtvDW6e1
	MjmrqynPw875/UCaMK+KKNINiSs8bPd+A9JYhl1oz6gPqmlJPvm8dDWOHQB+p8fxRkmCLYp3TE3
	e119IUfjO1wejxohOGEErLSPGR4D4sMaSgRJGm1fssJNRO7gmmQeo9cjJ2K5JuFI8bz71DKf3+7
	u7a3dN2F04UiIGOn6HEFMhby3vDuaiWyYSkcWkDU1HdI8NY8wWLqSsVzI1MZv4d0d/34blQUIgI
	AWhRrs7o5Zq1vAzHrLjSHoA==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3238438785a.5.1791996351363;
        Wed, 14 Oct 2026 09:45:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr3238430085a.5.1791996350722;
        Wed, 14 Oct 2026 09:45:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda61fb26sm4954766b.69.2026.10.14.09.45.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:45:49 -0700 (PDT)
Message-ID: <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:45:46 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yth_N7pu7FDKihE0mNPpXJP2oRzm5e5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX3gDkb+bAUTlb
 a4uJfkHlzpencb8gJ29vxIPu9NLTgfKr3nxnkqgmM1m2e6wTX0BR00jWbjwv2zWzkHBGaNU4o8N
 5WdviS1d4ilkpRiI1kW6+5hn/SKRbWlWUhE8pkN0SfnlzdvBBvn72cc6FBs5vR6kTPaHwO8rzrj
 OdPDInThChp/ew/PEgNnAPnSz1kFIVUkBIN2X62+7hImzxAilVn5Qf8Ft5yTVsEmgMEpnYP/584
 F+qesk11AM1YV02pMl8SDC1hyilM9iN3ikOI6uWbszwwGBFg1YXt7AyBColOUzKq3fhi9CwXxUv
 jdVspQZ4ZJDsuawSVsOsBrnllbuvE4MZYXOufDDdBjelICLiVQstmlXWfjnuTBuWuoFsRy//ZQr
 7ajXmZGT+I9onl6vXxFhBavJ7akTS6d4nknTsdx+ZnGahhh3BcvKHFEpJlCmxHgVbr6Lq/JQ8fr
 HJdO1riazcPcv7XwQvg==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfb1c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XY6eGlS5OATuIy7doj0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX0WzcFxfyONBj
 yfCdnd05jN3qYfoFra2f9dVAwPMAAqY+RcOHURcWo1AHmDBnT+SW0uulHwyMRn/w8b19j6GUpmk
 JALrbuDEGYn9MsaKNH4Q5IInE4b5kWg=
X-Proofpoint-GUID: Yth_N7pu7FDKihE0mNPpXJP2oRzm5e5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Clocks on Qualcomm SoCs need a minimum power rail performance state to
>>>> operate at a given frequency. We currently leave this to clock
>>>> consumers, so a driver has to know which power domains supply both the
>>>> clock and its parents. This ties knowledge of the clock tree to
>>>> individual consumers and doesn't protect other users that prepare or
>>>> change the same clock without making those power requests.
>>>
>>> Why would they prepare or change the same clock without making power
>>> requests? If it's a legitimate user of the clock, it should have an OPP
>>> table. If it's not, it should have a separate API to set the clock via a
>>> legitimate user / aggregator.
>>
>> That's the entire problem that motivated this series. The consumer
>> doesn't know what it needs on Qualcomm platforms. The power
>> requirements are that of the clock controller's, not of that device's.
> 
> I'd still say that the consumers know that they need a certain
> frequency, which demands a certain voltage / power / etc.

Right, but the meaningful difference here is that the consumers
only know they need a certain frequency. The required power votes
from that don't stem from the consumer's requirements. They stem
from the clock controller's inner workings that are necessary to
fulfill the consumer's demand.

[...]

>> The Qualcomm case is easy - RPMH is *always* reachable, so the
>> pmdomain provider needs no clocks itself. For the other cases,
>> "patches welcome".
> 
> Ok. There is a promise that I2C PMICs will never ever be involved in the
> clock / power tables.

Or at least that someone who needs them will contribute a
solution to this problem.

> 
>>
>> [...]
>>
>>>> +static unsigned int
>>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
>>>> +{
>>>> +	struct qcom_clk_dvfs_vote *vote;
>>>> +	unsigned int level = 0;
>>>> +
>>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
>>>> +		level = max(level, vote->level);
>>>> +
>>>> +	return max(level, rail_voter->safety_floor_level);
>>>
>>> I guess you want to avoid having too many voters, but would it be
>>> possible to have one voter per 'signficant' clock and let GenPD itself
>>> aggregate all the votes?
>>
>> What does "significant" mean here?
> 
> I'd define it as "using a different power domain or requiring a
> different corner".

I still don't get it

Konrad
