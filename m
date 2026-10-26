Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020328;
	b=Z45JpnpLoEeDpOnBGhucrCe+MfGjMOzX5hFjg7VKECTNO1n8lQI584Xhbgr6lb8Q1wyD
	 ZAHJfcb1f27iRSewWiDJzCyxwy6/lrZf6WDFhCEPUgXV4GH983/2xNXdn4T5/KcivS/sP
	 N3/DG0ovffCGJt9Rlr9vhOE2AUGaYgAoVLD5YprargE3zTUWP3htdYTbqe9NTOj8EbCXc
	 5iXWchAWhgj/NRP7l0KbrNsj8EB/d1lJIvqavJ5lAuJDeak/ZNk9faMEOY2HDhn2j4QJe
	 gEzy4leHQsSnmfvSslnt4CZpznRHTbceHHbtBMn7s+vSCmdO8tj7CL8gVr2OxT/BNkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
	b=PrHsMDWRNnABD44QUDCnFeXqMu8yXNscUJVXaxU2o1aS3X7P/8qLxxi73X0+Vdr2rL35
	 P1LV/hJztpl22cXmuljRLPwqbCN7FSHfN4h50INhtO5E1swO34bqjZHrnOpKDIaPC4f32
	 f+eZB1GtiCbdhxlAbQFeXuYhBgRM06oPXdUKRzMmQk0tGxWTkOs7TTiY3Vj1ilJEHs2lr
	 kapQSZcDNtlm1tvM6VHo5cv0jICwg4vF5kXaxMF0r3dXYl4kYRa0ja0qcS8+Kf42O7Jay
	 INYvov7Kyu6LgKkdanvjbFxRu/d2WY4cKglGLf12maWHABHkQ5291AltqmrfNHYDN8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMKFgxSe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOoBzHqT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62A9606A31A
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 13:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D62A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMKFgxSe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOoBzHqT
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMuj2009905
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 13:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=; b=AMKFgxSeuegHHZN8
	YrT7ACUt4stSsxsEmR90KoI/4kYGEMrx0EEbKStDk+nT3aWJ379akLCm44Gy5MLa
	xd2wBglGKOnnpfoSNI7DZb+EfSvwZf6KAUpb8spcbhZX3QRKhqXecACR1bS5nVKD
	bRX+9GJq8kdiPygSOYZYB5hTFn0meW65G9iATJO7fJAxd+PnPVaHz9VOihUx6DrR
	ZTyqWR3H3Un6NSp7kHKJSvIt+JeATgIN/NXC0LzNfbJbHqLSHtZbvxy8gYZtOXSi
	rOcfHQSENP9Q0u452Km/53tCim9tRTy5PmyPuLgLS7PRDbxbh4tIG5tasth5V5BA
	s+RD+Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgn27xgw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 13:12:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so93935385a.1
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020326; x=1793625126; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
        b=LOoBzHqTmxd+eQz54AeR5sflKbRlljxdf2Dv4mYLmUKCmgNDM4oO0nOCg9hzTRWgSn
         cyLRCGCFceUDESLrzUgBFcCPHxmAmsKdk58RzANPSB4xRmqQ7hPufv5sNJRGsfXbHxmd
         9QmJ5evA6UxqGWeJ6ILNvxD/NJRutZtRn8aEH+c9kejvQXT54FLwus2dR87k+eo+3ieM
         0aqAP+ldmzjKX3nijEBWoHNhH4JMQHJncqj/oML0GjPutJ6BaHFRu20S0fzqn0tucgFe
         lEnaPuOG48vKec2+PaZvfAVgHXdnb5rY3Jcs+9xCep8B6RF59nGPz78NB2/teKki1uQe
         319Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020326; x=1793625126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
        b=PsVOTL4QQ3xZdyV6vfQSUYqc4GnhQwfatcRY6mrQV3gRhSUAc01HeKahEOzP3AaSbQ
         YxOsCyo/BYzGfY3qbYegXB15hUfViaEsWyvt8u0m9/mR5TEzs5yu3ZTD8ztzS0TM5lCc
         vxPJuv55UCqh38Y5yhBwLqrrjo1KKmAtSZf4J52r91wTrpw+cKj3RW9TzF7vOJaauBJ/
         4vXfNg6S8jESztloBfBoVMwI8oAeDXYpSG6JU0VdMoLhX82fa0zVMZsKBPzbHT41vL7R
         WsVmNGmJ4Bt3oI8f9Dx0tkFoMu7vD5UInUYfOtUgivygzJOMt8SQK157lnrxGE8rzXyL
         OfnA==
X-Forwarded-Encrypted: i=1; AKwUvBwVLd8Iz6nyNRpIVy8mlv+d2S7zTW/kS4IbD7aCMEZxeL9vNVL5dRUO44rNBVAgIdL7TGJnxfHzV4ewWA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIy35TC98TtB06V4jwqZImFK6hUCGQPwUeJvdc5jl/xaQtZHB7l
	Wyz3atXrqZB5iHK1EEHpikxVWoZghiGZ3Ke0UoChNIk1bjyfjLWZs5vEDqVkcoeZJFnUy5dOLDM
	Smna8+Mf/3pZCVFRzkz2fUONKb9MxfRzVxBDiMElMnYpiRwzGKkmeDx6K6l4rn2XaIQ==
X-Gm-Gg: AYBFou2PFCiU9zpuYQDTyfWxj6eMGvv0NcVteB+Uh9JJ2obn7u5INs2C3BGNB+PLzPV
	DZsdvVR/QqctWfk6pzeciGXAbEt9emC/oEcYG4w5QJkaIgINs8QZ/x+Xvf+htawXH+U9UdOGQzP
	HhQqsGZHVB8GJm7MEOr52ZISOttJObCqcPFFh4WR+Gjbxyxw/Wg5eBcr4PZft4CAr6qrb+5XuSB
	8dnvWINJx64rJ1PelSgiMVmJbj1BIwMawLuKRHnryA8ftSpe59omljg5lUcjQhokSjl9nfPCeYi
	Dlreu0U5bU8c3WiKH3iiMjMIojpQFgY0t9xU5UKSPP54vrR1qHJryfDO2UFfyw0+nnfzBFQqnvh
	am+SLwt+FQNO9L/UDLi69Ew==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1205344785a.6.1793020326033;
        Mon, 26 Oct 2026 06:12:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1205338785a.6.1793020325533;
        Mon, 26 Oct 2026 06:12:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3707047a12.28.2026.10.26.06.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:12:04 -0700 (PDT)
Message-ID: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:11:58 +0100
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275170360.4070168.11650113664838519061.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G7GJgNk5 c=1 sm=1 tr=0 ts=6adf51a6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Hc6wbZxCDKPXCg-kSLUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Z2YZs7V7BTArhAtqqJfXn3yk_Mg80dhP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXxbw8FMradqH8
 ktCXS76LqcNfftMrZ88JK79VS255EZrxJXC+E6Nvt9rbJ3PD+uQzVtfD9xYo+Zuqxn3V3U9ZIn+
 HBe9YcdG+eYcQwvMA1Pbd0DxJVGS+8Q=
X-Proofpoint-GUID: Z2YZs7V7BTArhAtqqJfXn3yk_Mg80dhP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX5i4n4chju2k6
 Y+uipECh9na75byUD0VTm0bgK4lmrSnExNKTuB4CjyQf9zgbMPpqFWjN1Ncc6uCMbppk103dXcq
 1xng2oX1xJM5PfGWv0y5yphkVXrOuq6Odx/jQbybdSeehYhYyvneqFgTC5y95qb1H5ScPb04/WV
 gS+xvaQU5vY3dTht4Et9Ci3oHtpt23GISHYwSz3gbhkEc4MwG6znYhN2Ak7bpmsTi/fZnnEYyIp
 +M28ilQnS9CKyGfInCE2kbhiM9AWpzbYLF7UGcao/8Uh6KmAxQ1liSQVxz0joPS02W5dAc0brgX
 ouw6ArgyIfOh5VAXzW+HVNel8rOF21qrXdWaNZZbv9hyZ7awGMfCwMdAUgSmDl+YCygYrw/674b
 ZQblo1q8o7PAbE6A8NbEAZKmE0YuKvfRQm9dlnK4UZ0YaJVRY5IGHWM7PZdd8s+bzi4Y5r7jWgY
 9O3Yq7oxzzRTiAqUjww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260052

On 10/23/26 12:35 PM, Jerome Brunet wrote:
>> Preparing a clock protects its current requirements, not the resources
>> needed while changing its rate or parent. A transition can temporarily
>> use both parents or access an unprepared clock, and a parent rate change
>> can cause other clocks to be programmed too. Raising resources one clock
>> at a time leaves those operations exposed to insufficient power.
>>
>> Failures make this worse: hardware may already have changed when the
>> operation returns an error. A matching cached rate is then not proof
>> that resource reconciliation finished. Retaining a temporary enable
>> reference without a corresponding prepare reference also breaks a
>> consumer's normal disable/unprepare sequence after a failed reparent.
>>
>> Make CCF acquire the affected tree's and parent paths' resources before
>> notifiers or programming, and reconcile them only when the walk stops.
>> Keep fault recovery independent of rate shortcuts and subsequent
>> consumer reference-count changes. Require explicit recovery of an
>> ancestor's uncertain parent selection rather than reporting success
>> from a descendant request.
> 
> I don't think all this is necessary to address the problem described
> here and in the cover letter.
> 
> IMO a new provider API is the wrong layer. The framework already has
> the hook a provider needs: the rate change notifiers. What the core
> should do instead is fix those notifiers, which do have a few issues.
> You are fixing one in patch 1. Another fix, about setting the parent,
> was sent recently:
> 
> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> 
> You want to act on some changes before anything is programmed. PRE
> notifiers are the right tool for this. The user of this change in
> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> it, ABORT drops it.
> 
> Also, what is acquired here follows the requested clock. When an
> ancestor switches parent, the chain of its new parent is not acquired,
> although it feeds the whole subtree after the switch.
> 
> With notifiers, the parent fault state is not needed either. As it is,
> it blocks every request on or below the clock until the same switch is
> retried.
> 
> Could you tell me what you need from this approach that cannot be done
> with (fixed) notifiers?

I'm a little worried about the ordering there, since some device
drivers may also be registering listeners in parallel, so we don't
get a clean split of what PRE means ("has power for sure " or "may
not have power")

Konrad
