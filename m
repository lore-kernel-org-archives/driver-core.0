Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C343EFFD4
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994492; cv=none; b=DcumUDkNp7lAK5PtRIETdNgTlPnAD2vt1HfSXobW1S1cqSxrd6DXyumOgE3X9kXatrkfFMlLHmo9+XJKhZTMwND3u3wN6sx3w8SpD3VEWJZ5PLPbtjPsDELmlXHatn7/FmMEBb1ugXG3gndeJMDDbKUe+aLgm3M5MLE8OI3Ptto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994492; c=relaxed/simple;
	bh=rXPxWsIC0j0zVW5eD5YHYqn3764rN12QzF9i6j7Ck1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H81lG3BMKFZqTTrZ+h75RWW2Am6qj1BHK1bDLk+KonRK16s82VmqPYMOlx2IMRfES0lBil9i+ZAqzKSNb1xKODZWNJFT5bfkUABuhkzwUtRW/qoUxdy98lRrEHPEZ8xyrSVAXE3Q8pCcpL9zx4kmSSv6//aoR1AYkJmYkd+vLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jq+vs0MZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SX42rKP3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jq+vs0MZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SX42rKP3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbEOL301075
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=; b=jq+vs0MZYkXhx12v
	ANzIjiBHTtI9EMfDXpohLhURQ3zpZsArBrZ6gj1N4tFPMQgrRC3dG+Hhl0N4/JV9
	J/FrCeGYZIMUlY3r4PlTSjhSnQgy4t5FL4Q31WMOLnbxLvMnSYpEIO/kLKxOSFMX
	8sdajDgct/zI62+leqRY7QULkMWMV3VAPUwDQes75q9tX26tulnjNf/4DzTfNcxi
	AFyvuuMi6O4ww/+eg4YfQTuKY22MAc2sPtnM0JWpaX1yJ8dMVWZCOqo3v+qNY3js
	70wF3SrRudbaxUKPBPqrBDhe2qAydrb4O3U5B7oDMjotfJ6yD9DklRJ71ihktAeg
	jzad6Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622f7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:14:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535d44e2c23so7652461cf.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994489; x=1792599289; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=;
        b=SX42rKP3DCO2Ti8l6HuWQb2Qkx6/9WkCgmd73XvBShneZtrMjpZ/tvney5tcyQdkaQ
         HqHLhymOStTZGJ7cZ5Etj+zLgqgvwLvMyanKVlcjmITuXop0yZpKAO4K7K9R5jbjStY9
         HhB9NRhHcBT9+l8Hvi8/uY+iviOwHvfk3NElyIEg2N9a6CyGpAO8LTVmup/2Gd0Somqo
         49LEAuHAi6NGF2GL6iayJTOiDVEQKGCuRhOmoihc/qV9CjkcNRMyJawzGl7Pj7PMNZHV
         gFfK5k69hchUD/pThbL0o0MylqWC7AT9Steiqxw4VeDYeYnPx7fbQ8aw3K0MLh0fi+WS
         4ElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994489; x=1792599289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6aIP0TjEoFh9Gsz91ExeYEYlJZ6Di9/dXoT2DgWJd8=;
        b=aK7oE1GTUVTj9uV7xhJBrRNlRYi3H83OfoJWIzoF4nOKPjW09sK5LIyDgqpn9YMSeF
         IR/5oTS9L+6E9VG5okfxpXceAANhZMpXOU237XRem30ztQ83O3LA+mwEYm/abAShpmKr
         AN1DSCJnASXSG+Ve2Ymu4JRRLtvOzmglaKDuFEi533hAzhzZ8mLCM//bw+uaOkeas9Xh
         Jb4pfozMsLG2K5yENySelM3Van470ax4jd+M+4v0AqWUdvzG0osjIKqYE9PTIWl20ulo
         CLxjMH0H04zA+YzG0sABluEZ7NhmaSfq3Rc4JIpIjof+Lyf+RJotcuI8E9/ZYxFsNto0
         GPIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7Me0S3/4tVbB3z40MbRE4gFSpFE3D7bCVEKOM4qKxuE7Pw9Ro0TauQuI1T7g3PhMCtDHWOfoEzw5WlA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJhkfChttzgsaei/k/TpmcquWnIFt1Oul+eqVZ9w7B5zvae9IX9
	GeIfWpJervDEKVa2FAptvbCfHEcGhUCoqRrDjOB/tiH4Z7JQlL6Hb3Fr1dRSHOoLh52PDBcET8r
	psD2IFY5PMNsExuq59iMU7Cfr1LwAfLMi11BGYPu0MeZj7N+3kwxv6eCg9PclkESrDw==
X-Gm-Gg: AYBFou0M7JVfLmukjxp9E7a26GudJHT3YV+9fBAaOq/I5cnhxftg+BWEg3/gtaA+ypN
	8+sE8EBh1D2ACafr9fS1pvYciNY2rDLsILC02lrwf2uXVhJQvaAQgicFBQ7hVXT8mdSftmjGWBb
	WogDSmHSGxHM0NTS3+Elv8J0kLSmk+smN2XyM9WL1AbJvuq/S2Ci9WuUSQUtwo4IwJ3dSHQsbZ0
	OVTDeUfNiAzcm5fcopnaMolMXiqV2e1Ojl7GXT1Vgie4Y+yTLk0Hrq7iX+OVTzXWZd1x11IGvXw
	sS+YT1X5YE4imh9tjHnIEhzfnn3wxIeHcr28wCteZ1dL9YxXKC0VTEf3OaORgMZNvdOVmJCWcv7
	2R7Q3dyLpaRODPI5JidJy+g==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2745452885a.5.1791994488893;
        Wed, 14 Oct 2026 09:14:48 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr2745441985a.5.1791994488098;
        Wed, 14 Oct 2026 09:14:48 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda043cbfsm2141866b.55.2026.10.14.09.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:14:47 -0700 (PDT)
Message-ID: <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:14:43 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
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
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YH58dDYWnE5IS6xG0s0-niXztfutswaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX4ei1x7QbdQJu
 iLqLSR9D0eIvokezdFTq/tu5YmeM/W8zbR+YcqwrdMi4IMQ4iuSpY7OxcDrJ5fsezuCi8sAMzYm
 /4KDOuyD1WuCxzClpsCjtEG/GE77r/KkPhzLiANSv9WgHaUfSCHxqA8Z8KvBiucWccBIs1rX0fA
 Drqaaw8+yzcPQ9jML1pBJtHdQyie/P+lXI+/qYoGUGCh4xtRtBstK1xWrnE4liU+O90/2lqg5yI
 /qfrgp1+0w/I+0WNzXKltd77MwAXr2tkpeiURKFUaOZLpMnf+1qaRf6zlRpv+t1M8va+iR1vn70
 7al3QsSxKdxM9jNsxO3C6BBg+xrXWnf70QPCZWL+w6RxakvYhIlzm/gaQV02K+8jEinEC6ylV0w
 xiFaMfqdxz0EiBk2+BZ8aFp/zRfZivMLKtMSSNdMEh9Bb0BkC+mKRCKU5zSUJZ13sqjrHJwYY/U
 oOS9wTxcORVHmHq/Q7Q==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfaa79 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tSyx0q1tghd3iirTVWYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfXxOJ12BmStXIY
 NCfkhx7bKboGCdfeq/ofkYqlKxq5fcHGNGD6LJXjf/xb+nF7ngXJn8wt8bsgbeLYtCPE7an5Sc2
 5joIAAJycIA4q78b9WNhX+zx+nG+264=
X-Proofpoint-GUID: YH58dDYWnE5IS6xG0s0-niXztfutswaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140064

On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> A failed OPP transition need not leave the clock at the last successful
>> OPP's frequency. If hardware changed before the error, the default
>> single-clock path can subsequently skip a necessary retry because its
> 
> What is a necessary retry? Shouldn't it be: try, rollback if it fails?

The failure scenario is:

opp-table {
	opp-400000000 {
		// low
	};

	opp-1000000000 {
		// high
	};
}';

1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
2. A driver requests High.
- OPP raises the voltage to 0.95 V.
- clk_set_rate(..., 1 GHz) changes the clock, but returns an error
- Assume clk_get_rate() can report the resulting 1 GHz rate.
3. The transition returns an error, so current_opp still points to Low.
4. The caller tries to recover by requesting Low again.

Perhaps I should have included that in the commit message.

Konrad
