Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1F93FC5A8
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727586; cv=none; b=B3QN2EB/ILE/lOVBjaj3VfXby/iY1g4BJwymhYNZMTHQyX4sBEz/NkALWT3IgHe1EV8BjvUnEX0ryww8b1SkeRYXEdOZE+oDB+cIHlW8+iebQOJtzBZ4HFUd4VUl+YY4rkTWQ2Jk362Cfv7C29YSxgKNGd4ZfMb/78a7epMIEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727586; c=relaxed/simple;
	bh=eYrZuUDW54GVV8/zA+Zs7S0GCSgEOyJGq3UYJVTrPJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g7ZsdQQXo7U1M+TMwAfNNeC+NuhlaFOSLyGndMVVBB1BCxZ9nedBuy/i9r5fKJSTEt8zq+lfL3EyFJkz8DBA7MIuV6xQrs/9iLjAy2zS+/mIapgtrYVd8rlBFTYdWN9Xh+JAnjQPcjNgLKAHyBEkz5/Y7/PsM6dVOb206Bc0IA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MqZ7xCHb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWLslusp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MqZ7xCHb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWLslusp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8O9H62348342
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=; b=MqZ7xCHbU1O4tss5
	EMuW985nkiThlT3+GsjK3ceVrdJuznujEYmCOJYJlPcy2hDjSRSBLI0qofA8W3Df
	UHspn07PPrzMDWwOvJI5Qpn1m2PHQGN2TmD0kf9mA8JL2RyXxR44ndHznQPt+BMO
	VlMR23Efa7mhmgwVR/T3CJjflWI+LPBYyNyAcjgnFUcu6ZGX4sW+aVt31Cv1Aa+f
	7H2ZCGXJLwF8gCLP7f58JXPPd6UBVusZLffrQ5RxDjwIPfUZNmWa5Jjjkisz1SBv
	gEpeffsGZjxTM+UeDMDISujGXSAcdiWYJIHnne8FN3A9xH98a1KixsWEy7LKC1Jt
	ChXDMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0epq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:06:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so651371cf.3
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727583; x=1783332383; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=;
        b=AWLsluspvq15ygxM4xd93eq8V8n4oLjFPEdvMuSoS/Imsy9mdWiL8Pacs60UErqJWg
         iBLZ0RKRh09+8YqA4bCIrzz7drGs9JAxqT5yfOlgt3XkrkHkbxnvj2YzAn6oiYEBKhYR
         szDIdJessoaPXkkRp0yW/dEG6GPod8nQtKJhyT+QJXRpUwK11rbD4mPExa2wmrKVXteF
         Yhe992sY4zkSvg11bI4S51OS4i1Qn7qxcXfnLVkM4ijsE4Kz5V6eFhSWKvM5ZdjCJRCe
         sBti1i97P8FHIpoPFHcgBGzIxwzlAcYRwljVKPTDvVtVgqdzJq+gn1kxiguv+VZchRJz
         1w2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727583; x=1783332383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVt6Gi25NiYqcnkyDANHxTfSbL/4fUYAeYFJ+RUI7cE=;
        b=e7BAUDARC00AtPjZa08Jbv6HYTnSr0LJE7+UpnAp+PsKz+92jjVcB5K6iVj/r/u4WE
         dta05IA7autldOHoM/Fc30CLXFROnPaO+Tb5ATl0JqhIusLNq2eNuj+ogUIW+URab4oe
         jzQbG+kvgWChRS6hPoFHXBwyRYmyBxEDvQ0uXVxGIuDfR46LfhYYbiIB3OXKZPc7/O2/
         t1kkAE0lFOarUSbBJDC57Dol/EVLNEniq/OX89MPFxEWi+6ORVPH09EY+scuMxq58IEo
         sN+PVNUhZa149N1FuZR8WDnKwSvmHgsZlpBSXzzyOjfkB5kMYtSQOcXcGPicHv4H9cBc
         jGFQ==
X-Gm-Message-State: AOJu0YxFsv+apTxG5bd2QC1IEqXQ5XI14SnA5ok+FJ8PPVzU/LFO4sn0
	CMYnCdPbQRqabgW/S2TtJjHelEXLSK2lbPTl/Ol6RBW8b1sPA4a96g+M9rMVn5Ice1x6/UuAKVU
	V4knOQduaPu4S6yyinIrL+DJl1gMo+ZIBPPFX+B+bkMwejiCVAGX2wc/yWmLXH2HUEw==
X-Gm-Gg: AfdE7clrZP8r9MMamvveA05z2B5++uco71lxN5wEWzWyB7BOw9quahsmT+fcFhDy0w+
	WQHCiW/pBfEL/YFbw4yS+/c+rUepxKmPkbQMZoTXSKp0X0Sks34aCd+UihDlDKxSsPI2nT13cw8
	IEipoe5fiXbkX/WQtlBzfySJP4elgjdOI4PkqyTxXtmLj2Q/zTEdIHvLOWE42iXuNdpSBLZOP9h
	fS2WKyB2Dxrb7r8FYltZ3dmXMNPcvp9M/bKGxVzYnKlj0g6INd0Dy727q6BxPESnk3VX4X09M2+
	Yf0FHTuMnhPDQI998OTSs4j1ArcTfiN0EGoyKYrro3lXHPlJgbwKyWSakO2U80T/1+LAwPNzZ+5
	aauY3fXCe0FqNC6VUT6creywNoqEIr+pQcYQ=
X-Received: by 2002:a05:622a:3d0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51beab3578cmr59352041cf.4.1782727583425;
        Mon, 29 Jun 2026 03:06:23 -0700 (PDT)
X-Received: by 2002:a05:622a:3d0:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-51beab3578cmr59351661cf.4.1782727582842;
        Mon, 29 Jun 2026 03:06:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbe8125sm747959766b.19.2026.06.29.03.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:06:21 -0700 (PDT)
Message-ID: <bfacf381-8112-4c12-b87c-46cab7d7f284@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:06:19 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: implement sync_state support
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX1RsUEZPzPSKA
 CtjQNPOdSRTn4DptAox/YdXFsExJAGACIR+nscuaXsOJD085AZCtaafvVxI+RiFew9vxtZdXmEU
 btVgVkiK3fZLtVwfIiTjL3pcUoe718I=
X-Proofpoint-ORIG-GUID: kwBkxfoK0b66tue1Qsjr6KxrewGzjxsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXyY6XSisyYGoU
 uUkJk2WMfm2yxnJjjGw2OWncO4/UvWBXynXvq/6d5uWjvbpQ4iXk+nQZ9mP7jbBfxaqFFHFGzJy
 fQPUrrYJsVgaN0LvDtwdtTZ5qH7dcuhygUg4l14TR1Rm+iT9Qo70kvjL+3SiuWcgnhr+wcyDQpH
 RhcxJzrjzW4aoeVjvc8Nj611ZEoqh4Qc8l23YGH/JWEdRCchT0fjZG36ekjosO+jEoYQUUfi4/E
 YaNrsMGjp9Rt2UEu10IIKMU0J12AcDpeg8f61hkBQPHXNrH/R6A2GKxQr9ZvqBKoxbbhUHfsrfq
 +F9Kwyr1XAnwomHD0qMu0UUXY/UHfr+1qC/69nIfblfnQs1Fr82VwHzcvqtnYqO3FeRhSwRXXxw
 zyQusYSSGk+jWSHHQmBQbM7RxmqvBula+Co9EiSvjzI7GfDXqjwMtcJCk9oIDZqef//ILBnRKh6
 gLyrZuturcL/gMQ1WzQ==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a4243a0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=NDI1EqwwtgGkLGOeOxsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: kwBkxfoK0b66tue1Qsjr6KxrewGzjxsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290081

On 6/26/26 6:32 PM, Brian Masney wrote:
> The existing support for disabling unused clks runs in the late initcall
> stage, and it has been known for a long time that this is broken since
> it runs too early in the boot up process. It doesn't work for kernel
> modules, and it also doesn't work if all of the consumers haven't fully
> probed yet. Folks have long recommended to boot certain platforms with
> clk_ignore_unused to work around issues with disabling unused clks.
> 
> This series fixes this by adding support for sync_state to the clk
> subsystem.
> 
> Changes in v3:

The version tag is missing from the subjects of the patches you sent
By the trailers, it seems like you used b4.. did you play with
prep --force-revision by chance?

Konrad
