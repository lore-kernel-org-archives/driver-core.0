Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233187;
	b=QCXP050MrdVeWU8ASySSRtOWCy91LYsHFnA+ULO4y5voBvbU1Bc0Tj8iES6B7tTQAiO7
	 rhSkJLEKVh5uA/5PITwwCEJzcLfMpQQ4sNgW0+N+KKkC0s0nT1hV1hL5R/e5s/SVo8lY9
	 yNFG3lIgrkYIMkb5bjFCr/AraEhTQrhSC7JOyCYELiEbEyCjtghheQLSngIwQ1elPv9LB
	 P2OwhxPWDAkKhfXuSsY7Y1ZHcq76qmjGQNXsjZN8Ptih6MBjPDv+5Zd5+RC3U7xVANo3U
	 8Xfzm5KBvHb99sg+wF2ehSKA2IBG3bHNhuB70VdcZmdYdmjfqGdCGFj5/tLoidB9szw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
	b=YCJyahHypg9H2N1cfvf8md3nSv+rjsVP/Tox0l9chGoz7RjpX2ULwIJut0bIwcQoZwle
	 rjyCtDms/yC5YHnBA9IfGdDEJIjkYyLbKmA2s/96uKghNCjQwl1jRmZQIjXM5GQqxfgTC
	 UiY/yDbBD5vD88PSr6q4RenhROEOWFiqd0+gc9+ukKpjGNNECl3K4ufbOFq+LNM8Rgcnl
	 sSp3y8Cd5Y9gWOtVZaXk9QV7SHZ4B6CVzq4Eq3HIH7fyHEuM+MbxCZd++NbaQXPoOGDY6
	 d8MDN4X5jxkbrWMg1ig17J473xsWDLr7cwFFZDkbiMshFoOMm8YAVZLkYSNAlGbNaSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XF8g3Upp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4ED606A325
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F4ED606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk+5LGwY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XF8g3Upp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DF6Sc3461055
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 14:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=; b=pk+5LGwYMAfOSXFA
	lecrTQTHD6VN3Lmy8W3ERVHogoxBAZJ1A1qTiGq8rGTwbGZHTJOM4gK/hVZMng2d
	/hLXksJJ2FQIwT50rDlyW9JkjHHr4FSthKCkNi0D1VwcshthvB4zcuwz2Fhz/gx+
	e6ca0MF62VNUL2A2gQhezg4RDfbM4YB5VkkEep9oALmlUBbKHlXGSf5oyOAfa3xb
	wPeMyTqKsdm7KX/AjraZ5/LRui/0jHWtnn2CPteSmveQe0+AtdnsrQgWJ8JUeYo2
	55ITnY5cWnOe0EOQVCvtYsTzOkQYIcokK+cIOs/3lo/bI9Gn1OOzFaAWIJRmXESw
	kZHkVw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hue0rrcq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 14:06:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7d2f843bacdso18390137.2
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 06:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794233184; x=1794837984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=XF8g3UppJwKsD3hOZrpcp/3A/dXLFOudalo99w8CLu6dHlGcXQahDwOt3+HGswj+MT
         5TYikZXauEqn3ChuNOO/wtPk38ya/an0Qi+Jvny+8zq78aYRXGIdAWrZmGjjmkM1cVtN
         BhYyc9OLyZ3ZxPEDMzGuozy748CPCwCbxQqFGF0rQVudVuxUgFlgHB3azougchIXBlh0
         Nn5g+z2uQ7F2rYqV5PVKAxE7oQgd/PfnsfM6f+HzhVE2+hWi4nSoORUM9LBdSV21t6b5
         tqZQsxcK1+9rLzuiDYodXa3ZMTpGjDhBnozCpLtt03jI6heBgGZ30Jyj5SSSAeOQLLTo
         FRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233184; x=1794837984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SZO2pxjMIijEZXAP7miXBlorgEdIzoDz/u9J3Nan4lQ=;
        b=thZjevzhTamIIKwWl5Zcx4RKXVe3UyuJWnNzp3dGUH6V0qfiBoQ4XRc2jK0mqT7bDi
         X2B4/CNVi8IqQqfWMJYFRBBwra/UqkHd144mmB2mmCgKMZSMqA0n1GQOnj3JaxJwqx4M
         5dAjJ1x4f8bE9sx1ERT1WhvJz25Dlc70n6OYhcIKamqbT1hZ9CUDR5iLa1KvN2sNO2w5
         3VOAwMYtiqAAIgD0UfIfyZdhbN5vtDQXZpsAS9Al3/OJILux0v8aAaUEbbJAEndvlw7X
         Xkzih1vNOB4mwIxAAsuGqqfxvXvdNUJ6IyVq8E7Y1czf4FGvhmaWA2m9Xsqb0C12O7SJ
         6jPg==
X-Forwarded-Encrypted: i=1; AL+hErGQmpTN0zusGy2SAs3w6HLHfUs5wCLg1lQ5AB0iIcmr5ADArIUOgyMa9GFbdFwqB1w3HPbcsD5ALbrkog==@lists.linux.dev
X-Gm-Message-State: APuU4Z/orYL8GCB+C0BGDOsvCkDTx2kzmwdeDQjY3+J0LPiuikzw2lDj
	wKhs7jUVJrjkSCGMwjznZuLJAly5kbMwgRMH2G+i4zaF7K7E3exYlGfmwzc0kRlut1cpQTu6SkL
	THqWk8W62t5q4yTc3PKos2HmvZ6m1g6mEWAAGMP3vMlGVL34btQ29t/unIaOIvZFHQA==
X-Gm-Gg: AYBFou1vbwQ4w7WiNwyqyp/QC58q91ENQPypAvRU237pB81uWn9f9d/qqN7EgsahMGK
	hZQaC4+4DIg3HRIREuZdZ5o4n07yKkBj5BvKgT1V5oX3P1aFpefYo7m8MsxAG4ucpJY39OH49oE
	PyeaDpgR4la2m7Q4x/CtG6RvJHAQG28rT/MGJ/qDcCiadNXgJiOZ3OHtbaPfDkSC15aAkuJGx7N
	XD8lo5NjafLmXO/v+iMHgzoqPslo1UvxnFKmJ5PV74ICkfVv5ojYuQ6ypoUVpi9jel1Uw91bd/q
	0vamIaoRtlTn0hV1Qno3/XLxoalwQXhcAPUBEDP0sLO2aiIUrnBN6VzySjbTI/ol7EQulV0nlK1
	61LaFdjE/vFq1Cn3xelRKOD4a55oBSVYWSG2itbKLHy6Z0lh2vUk+nA6PCEMykjZhcHyY+A==
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947700137.3.1794233184565;
        Mon, 09 Nov 2026 06:06:24 -0800 (PST)
X-Received: by 2002:a05:6102:6116:10b0:7c3:91f5:26d4 with SMTP id ada2fe7eead31-7d2db29ef38mr947543137.3.1794233183505;
        Mon, 09 Nov 2026 06:06:23 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721c8a9cbsm1525983a12.0.2026.11.09.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:06:22 -0800 (PST)
Message-ID: <825fbfbe-a9a0-43e2-bb54-f9e38ce779f4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:06:18 +0100
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
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
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
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
 <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MAuM-z70ROp6rAvjCBsHqlYL_-4yRWdq
X-Authority-Analysis: v=2.4 cv=MpfHeGae c=1 sm=1 tr=0 ts=6af1d361 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=tDZyZ9LLp4Dxownb6IEA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXzbqhOQpZWPIE
 LIt7itwzWV69XdcGyMXgfwD969b52Eecl1dPzKqhq9a/izUn1JNm19GNRU1eWTxxuw5nB7PQnxG
 CfMExAEoZj/MbOtvl6EkECV4J+a25KEMZAxwB9/exG7FFFEbIeVrkpjFi5R2KK6vqUMGk8kLVC4
 4sRLQtUl9gwi0yWgm/uSZIdgtKA7/q2U0FGAUEqY8bwMhyRkwDwaoDckwjyNK58pM9nXEtxwdML
 SooSBeKvVe1/tg2EEucAQEy6TwpfKpE728YRAoBTaElzGqcQZ0rFherUmCr8zp2kF4iaPO8ArSM
 u81OxzQezW/cwGUzM3w5Ra6sBMY9ruA1IRfV3QXeR8S1ENPVM5dtp9AnVYARiB1imY4/NPj2zSl
 BbN5sxSDLYeSADXWNJNcysDAtlHy+nnGj2TQHryYsrDaSPmOfFmjeHNhFlmdDgzTExzjqnRMMB9
 82lJJ2HSdYgXPEBrfTg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NiBTYWx0ZWRfXyL4/subZTcBW
 VEyZVizbworLlgv+dtUmcHMibBzW3ltBC7hcIp50s3sKx8bZNK8hA5/Qf5jVX3BK/SkWtZ4wcAq
 BN4BfWiLZf4zcDbUtzWL7m86f/FmQv0=
X-Proofpoint-ORIG-GUID: MAuM-z70ROp6rAvjCBsHqlYL_-4yRWdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090056

On 10/26/26 2:11 PM, Konrad Dybcio wrote:
> On 10/23/26 12:35 PM, Jerome Brunet wrote:
>>> Preparing a clock protects its current requirements, not the resources
>>> needed while changing its rate or parent. A transition can temporarily
>>> use both parents or access an unprepared clock, and a parent rate change
>>> can cause other clocks to be programmed too. Raising resources one clock
>>> at a time leaves those operations exposed to insufficient power.
>>>
>>> Failures make this worse: hardware may already have changed when the
>>> operation returns an error. A matching cached rate is then not proof
>>> that resource reconciliation finished. Retaining a temporary enable
>>> reference without a corresponding prepare reference also breaks a
>>> consumer's normal disable/unprepare sequence after a failed reparent.
>>>
>>> Make CCF acquire the affected tree's and parent paths' resources before
>>> notifiers or programming, and reconcile them only when the walk stops.
>>> Keep fault recovery independent of rate shortcuts and subsequent
>>> consumer reference-count changes. Require explicit recovery of an
>>> ancestor's uncertain parent selection rather than reporting success
>>> from a descendant request.
>>
>> I don't think all this is necessary to address the problem described
>> here and in the cover letter.
>>
>> IMO a new provider API is the wrong layer. The framework already has
>> the hook a provider needs: the rate change notifiers. What the core
>> should do instead is fix those notifiers, which do have a few issues.
>> You are fixing one in patch 1. Another fix, about setting the parent,
>> was sent recently:
>>
>> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
>>
>> You want to act on some changes before anything is programmed. PRE
>> notifiers are the right tool for this. The user of this change in
>> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
>> it, ABORT drops it.
>>
>> Also, what is acquired here follows the requested clock. When an
>> ancestor switches parent, the chain of its new parent is not acquired,
>> although it feeds the whole subtree after the switch.
>>
>> With notifiers, the parent fault state is not needed either. As it is,
>> it blocks every request on or below the clock until the same switch is
>> retried.
>>
>> Could you tell me what you need from this approach that cannot be done
>> with (fixed) notifiers?
> 
> I'm a little worried about the ordering there, since some device
> drivers may also be registering listeners in parallel, so we don't
> get a clean split of what PRE means ("has power for sure " or "may
> not have power")

Do you have any thoughts on this? I'd like to proceed with this
series in one way or another.

Konrad
