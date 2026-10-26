Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020737;
	b=EmOBflour5zD4ktjPljkDNIEQJUZoUmyv6erQXByJtXev81Uv544v4ffyHLDAdngrQCG
	 7QPaUBRClk8lAnThxsHNKrdL8Xq/GnSICoLg59rLbR4h43z8eMheB0aRRb5R3CNOO5Iqf
	 Vvb64fFJiu1v3DcNiVzPTokH3VaRBqxMOWMF5EhhmuLb7rQKjIAjHghDCbiWG1wM/zU/h
	 3md3gU4ZShfFlgEHm0uoDcD6bK7yo4EgEEWdsPerskVfe/4qe0LoeqQYDP9Qler6fXvCV
	 IulOpbvvYjzi056h7T7iTzXrKqQrjiFl+u8//0Kv3hbUbnQUHLwarWeuIzWVeutJN8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020737;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
	b=XtrJOobXciPLIQKTJYFGCx3ypviLovTO6BKVcyL9n7vh/A5R5rgWm7qnyd0sqhC5H4Rv
	 FdNntNChR53WyjtFS/S8UUeG5HDGLckb53WHN+rnwB9WSem1flACRr7siwto5HX1T8C0y
	 c1KtbKrYe2wug8pn5azMjWD+dcXurzxfReKxb5hjHvK8HfG6SFL1VRmPYltivZmGYfJUk
	 JZ8FEOGmTLhxfQAyVuu3sjCRM8wXGZ6UH9ebPM44NpVdpSqTe7UyDxegq3qwncNiZ/3pz
	 0Ul9xTSkUt+SVBdvS9jiTlTfllY2rT7OSrtIoYFEnpl7+aesnGUVanN/KJwb98pmOwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M9IYbMCO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F4A606A31D
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 13:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94F4A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NGFEk8AC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M9IYbMCO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QCtR0f3348828
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 13:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=; b=NGFEk8ACpJBSGqlN
	l6Rk7apbp/vgUNssfJ0pPDQN1vPFwmiO+HNLvgIbC4ymQrEnhQLmHGTc8fh/lLZK
	J4QgEVzB1cSkR1kPep3qiBeHAhx0Nc0SJJ99GDynyEl9JCJ1cEwHSrLh4g6MaE1X
	9KMCRLDACZBmK4GVohrpX0Ud3OFIQzV8/2vEwstZ7qinPZ3WzSk4GEN2xbEXB/xs
	Qi16szDSyqB3V6rKPiFt7GWbcHGt7MJ3blA7OwQ8zm+PsKYS/wa9q02Wt2aT0V+6
	q6ukTSUQy73h8BIEuk964CYqjJe11YcEYBI4FKF36PmfcnSC3nMjr2MUwQ/q0Vv1
	HN6G7A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj79xr33k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 13:18:55 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9833e1390beso46598241.0
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 06:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020735; x=1793625535; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=M9IYbMCOJOA0BmGwgivP4PGVnn2Y8vTg6CZWpCWEsAXBM4OeUdpv4llMZvjKIi4bGE
         tPy9Jma8OaaXW0N47LsY6o88NTfLMRNX/vvZq3nWYjnJdRvGagZtcJ7y6hE0uuYGC8Pm
         YP4AB2hnFYj59zuIrybMvQgu5qIxXWcX77UxdjIgcBVVym3ytiACVUcf30RrJ/qyGg9a
         dMDvgJUJvkkbyhs7oUP0Nmjn2c2zf5KKm5b6uGU65nYf1YIJnIfxwUGomVSGf/PDEcS0
         8hVWJbTRJI8rrYlgTqoHAcCsbsJA6zYNy/6kH8wuTxZCnz/et7R3lRZF8fUyFN3l4ba4
         gzuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020735; x=1793625535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMyf20BlZ1h0WZ9ePXYbEch50SKh1zOCdibpTfZjCDE=;
        b=h1cN2aLJ5mNNny0ADL6IqtuFntSQuqKGoy9I6dyRfa5w5v5DiwnnAPLoj2Fgo9V8P1
         FfFLrWzJCC9JzRZg6MTKXj2CCLDk0AW/N+fLSCTwzj2t/IEsQe5I390tzP7F9yow3wst
         x/JREofpMpPUsVYeMMKmbiUGqf03cAoOH7nVp3cYRy5xeYegklzcqcdD8NWJrrFLDN5k
         Mq1VXlo4SbCAD4in67hTV2U88Vjb4Zw2LITkmuWaHO9ihM+xPigG+yHQ20Zfc1l157/d
         SiPxSKTFmigBQigiwQMohNCG2u87C7CRZxlyBQqW+j0tvKrhDtE2VWYkw5jZlRsqpCCF
         uTbA==
X-Forwarded-Encrypted: i=1; AKwUvBw/rgHMnQm6H+IXrirEK9Ll2CUuIci3RDg+t4agy2Ch7E/d8haIjdpd4F3lgmtkZFuCL9ex5AP6sldjbA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIkQP8KDPn89lce7FH7foVQ8Wl7swJOF6M8SMqcdLe7Ftedi7cX
	DBOCrsChNJXE4korU/RWG2mC+YBSaB6GTgnkbPKlBa1+tXEpoPUuR4ZeCM9XsEpVpcSYDweNt1Y
	2sJnA+HPbWFi3l/x+jo07xLIDNYetxHkteZsFq+qryJdTzZOLCcL6pwDgBWeOwk7ULw==
X-Gm-Gg: AYBFou1Ghel0L4KLB28cuX3Q4eNbXn5U6nWr1c89h66/9TfSwVFCQNCRnJOl64a8XmQ
	/IQjhTz1LhuF4ne2NA6XgvCo/DYXof4kc+0msPXUe63uGIPCd5NLKoqCyInPJ+d9PEbREsZ7McD
	Kr9AhxtEB00Z9vPp27+PPMduvZU1UpyeCjuFsZ5guWEcomqEs2NrP/oEDo2WVddTpetubYhueWW
	ux5mJ8CZtgtgvlEGqSuR1m8ya9UNpDFBZBXTRz6c4R6F3hY113HVgLYw6Fk9Lwi2ll32uhD2JQF
	5++36khNf0DNdS89sFXqnSUn3xa299jDZbyhlQVXuumKyXI3gkal8rDd6t0naQBm34oRcgb60aP
	+o7hhCA3pTikAQr5XwoDUZg==
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562779137.2.1793020734845;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8182:20b0:7ca:21e4:8e20 with SMTP id ada2fe7eead31-7ce5cc7fd58mr1562727137.2.1793020734298;
        Mon, 26 Oct 2026 06:18:54 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3713290a12.28.2026.10.26.06.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:18:52 -0700 (PDT)
Message-ID: <343a80e4-8880-4faa-a60b-e3025f2ed40f@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:18:50 +0100
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
To: Jerome Brunet <jbrunet@baylibre.com>,
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
 <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275170360.4070168.15401690927522463377.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pNR7xlMLpxhFs1SomZ1-MHv6_cGzlKf2
X-Proofpoint-GUID: pNR7xlMLpxhFs1SomZ1-MHv6_cGzlKf2
X-Authority-Analysis: v=2.4 cv=FPyOVOos c=1 sm=1 tr=0 ts=6adf533f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=m6TPRz_fCz5u_OYVIq4A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXyeVIYULP4t9C
 Dief06pt4JaqQ1V2WdwqoGjRzFGtiOXchcbssMsAT3cT7DmqCv3WRMxujdcZ3hktyR03bgeNtUa
 cVdSrbRrlEag26liBUglk84Rt8tEU7YEL/7nu/Rl+jtTd4PbFi8Urao9+yDZFjsS4pCV6P3lVWu
 j4U4XthiubHFnJZt6/1CzEcMsBDKfzEI1cPjI8LHNr83nxOEXIh4maSuKle6iy3uJamg8NnOfKu
 fcf7t/f1g5Xk9LwiIOy3NSjVa+57XkIdBEhckn0Hb4D4T2epcf0o8QXps0jkRhrC5pHbJKZaMqB
 ryePgjb395Z6Fc0r+aHuX0dD4l6zrFjkqCJoklEFW0fcr5o9PZdtL+llYB8bD0a+HpUizUZ+X7j
 93xu2cZMCIyW+bnlDsiUoW7qsD8KUsOu3ZY/wOl1vSX4y/FlK6NrF/FdrrQJG+3Ok5RcPn9LBmS
 d2CmdRdLow9FjrloAzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX7HTqnYfSJSL9
 h3A0D6j/t6u3oiwFUHMqD7wwDak2143v+Y8CKB7SniC9GBPRyxiAdmymQvGL3R8s9kU51z1BYgS
 Yym5Z+rIOxccxJwGWFSXJoPM2MyGygA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 10/23/26 12:35 PM, Jerome Brunet wrote:
>> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
>> specific voltage rail levels to operate in-spec, but through the
>> separation and decentralization of clock and voltage votes, these
>> requirements are often not met and are never explicitly stated.
>> This results in clocks being undervolted, or at the very least a state
>> we're unable to reason about.
>>
>> The devices consuming these clocks very rarely have their own
>> requirements in that regard. (1)
>>
>> This series moves the frequency-power_domain-perf_state mappings inside
>> the clock drivers, ensuring a single, trusted source of truth is
>> established and that the silicon is no longer driven at out-of-spec
>> conditions.
>>
>> To illustrate the nuances involved, here's a couple examples of hidden
>> dependencies, as found on SM8650:
>> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>>   PLL it sources the signal from requires SVS (higher corner) to
>>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>>   requires SVS, but the PLL then requires SVS_L1.
>>   Analogous story for mvs1_clk.
>> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>>   requires SVS_L1 to produce that frequency.
>> * A number of camera clocks follow the same pattern.
>> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>>   of keeping MXC (a wholly different rail) at SVS_L1.
>>
>> There's a broad agreement that a consumer should only have to care
>> about the clock it consumes, and that configuring its parents is the
>> responsibility of the CCF. Requiring the consumers to care about the
>> above cases (as is the expectation today) is a clear violation of
>> that contract.
> 
> This is a fairly bold statement. Yes, the CCF's task is to make it as
> easy as possible for a consumer to enable, disable and set the rate of
> a clock, and I agree a consumer should not have to know what the
> parents of its clock need.
> 
> That does not make the framework responsible for it. Taken that far,
> the CCF would become a de facto platform coordinator, which it is not
> meant to be. The clock driver knows what its clocks need; the framework
> should give it the hooks to act at the right time, and stop there.

I think we are more or less in agreement - especially since this
paragraph of the cover letter is not really faithful to the 
implementation (since the ACTUAL voting ends up in clk-dvfs.c, so
essentially a driver and not the framework).

> When coordination is needed across devices, there are dedicated
> frameworks for it, like OPP and genpd.

Right, in the specific Qualcomm case we heavily utilize all of them.
For the problem I'm trying to solve, the clock controller is the
"reason for the problems", so its driver gets to carry the heavy
wait

Konrad
