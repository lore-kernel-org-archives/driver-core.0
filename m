Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA52B53D0B1
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953109; cv=none; b=EhVCSKtmkH5HfuWT5uOZoqyyIqNr5GXgsfPZUVcV83WvOsp5WcEtx+czKtqloCeweuzsAzxsXsB8237EI/VZVHDbBLmxA2cTXWENoIaLCGdrcWjS2MbT9a9DOXBN3XN+wErFVR210VNLY3req5w3XWJFIecfKiGtozliuNXZpXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953109; c=relaxed/simple;
	bh=Z09T1KtKmhwNLXiWVpHaJc9LPvi/1qHau6NWWjZF04Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bViIgc5Ize1dwah2kGO8gADrP9giK/2V/NHYGxdHVpFNiKTY/tVFB28QUK2dO918Ih4rTzx69NSKckLkG8y8Rq0Rq7eptNsvzvhQT4Yl2/OdbWYpGtS91j+gsHQCClxbGr7B3iQBLw5G10GTpQLu8Qn4hdP3P/BH7lt0GHB3MYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kvu35bdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OwMN7Fhn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kvu35bdv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OwMN7Fhn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689ApnXu1100357
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 11:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=; b=kvu35bdvj/2kTlnr
	AmEQcrS2WB3tRsgh3yjrsEXxH4quAHR9QtFzNCeisv/2PaZ9vXe4D51oR3/0PDtD
	TBewfHUy6GzQvW/8aOwW+ABXkzA3TskbuJ9l38r5ZIOeHHtQnKUkzo9vUqFEM0Bp
	KLABwX8LUA7loUJdhZmvJKM5mo38M9qdUo/bUusVf5dYjwRimfR0HnSjaxPlq0bL
	IZWJJSD8cttC/p+J8QPeXpVcZauWndKY6+DSGa/L+9+FXAGxjArMkgpaAWTI47x9
	ozQS8nZmxbiediOZTxetvFW7fxmSk6SKEig811q4vSbRpVMuPgRuhfjfzpNgq+PP
	iKpeDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rbk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 11:25:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390890ae83so72525885a.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788953106; x=1789557906; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=OwMN7FhnY/LLsUcj7cIkTt2feu9U4dFTHaiUZ9QQcf/vhbnIGRohvavRtqabJqZx8T
         QLsX8Hda2ceLmfjk33aKjy+XM2stUF953Qy4vMkt4alZXhSoPCZXmixQ9IEWvryd2P89
         CH0qDb1fkD1ojR1dssRdDBXQYL0TtJJmJEQmdqxP08Pu64jlrQA+MqxKYp615a/RstV/
         eXxtTlr4O6aHQdAzlCd/g3c+kxBjYZlvWYkvHkS2VJjnvSLbnkayMXPNTRr8DSh9JHYU
         6jzDzMShkCButdnjhqJyMTxVZ8HbJTJoryllmk8OccrqCnd+JSR5G4ywYf6kiwPS6d5O
         4HfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953106; x=1789557906;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LmygLzWOfv5qdfrTuFBPJrVJYdNWjT1c7y/zoAmNeWQ=;
        b=FLVR9MZbr/FV1va506Xs6J1JgTHr+l5+KnYG2gsplhTwz2drKI+lcWJykD2K1Qpbr4
         CyM2mAMuSOy+0kqTNEUayl2qCU1Zo6gfKbiUuPFDfIoHIPvH8QzL4bg5ocDO0/KkmDQz
         TpYzd7jzmwQFq5lUYjj7VX/PKAJoKD7OlFEnl+rHcTOdbAXd0A3Mtr1Mf5IUoe+Eyjaw
         v3RQDaiU1t43ZI4XZJFybxtYboCxOEqvfiWzl/iV1sZrgQ04K4I9TuBxKqyr29TY9Q4z
         KW2pJwKlPe1HydWHefvWXgiMWIww7k7S0OAc1d2waZNHeUqPhUGb5jzB5KicHR3qS9yH
         Dmcg==
X-Gm-Message-State: AFuF++k/1q5kUx8tFSWK/cM7EJfWobwHEQMKi3s8bvHvGkrTWlbJuacv
	6ydL8NYxTJK6UA8/ERa4L9kDbPr5abS6PMawcZj8I0clMbWgH3DKoXSKlGS55gkePL2GxTEb69U
	Oak4H3cA/S7IdEjQfCOyuIU/Hsy2NEdbp9CiBP7cVnlhrHNPYpD2ghbw+rSQzXbCGCA==
X-Gm-Gg: AYBFou0O+CIFsX9jxjIHYqSyFjNaMp+kiGslcB1N+ir8gjKEMwT8PcIoj5XbLbgI4NW
	dgAEDrl9T2OXm7sF5mb6V3Y9A0QPjZ3xp4GixHZf3UO8gZHvBqKZYTzL8XUoNCaYJ/vw7aiy6Ra
	DztuSXU7CG2r1tdyRYWBE1lq36rOwP/ef/NTejEZamNGSx4NTUaj3YCrhHGkSZvYvXHF1r967nM
	mcXzvmQRKo+s3TPstTuFjTIBgSaxsNvlDUV1cWDnyblFZ/Wk+3ZM724CSSVi8Jbv9W+t1O+Bhm+
	nS1X3iOUTuIUlmW76uOvmkanN6nY5Vb2x4/a5uBgliik6KCPYspv2uPoYdB/PgFBP59zH87poVK
	Ihghu68CSMGDYwrBzp7LrrQ==
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560512285a.4.1788953106002;
        Wed, 09 Sep 2026 04:25:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:c8b8:4639 with SMTP id af79cd13be357-939c8b8467cmr560508385a.4.1788953105607;
        Wed, 09 Sep 2026 04:25:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26e956ea81sm545162766b.33.2026.09.09.04.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 04:25:03 -0700 (PDT)
Message-ID: <c15d4fdf-0e78-40e5-aeab-56692623b6ea@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 13:25:01 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: convert drivers over to use
 subsys_platform_driver()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-3-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa14212 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=q2Z_u8HKrAuHhouZslcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: YyAqpFbwgSx6HI8qBV4rQ-Hb3rmjGdme
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfXwoTO1iClDHC3
 Kf8PBNs7pRI7pSUnZXLf3WAQ8hKxpOtla0X669yfsfQqvX4g1nsIKyS7bxeRqphtnwzQBDqtdSU
 8z1QbV5mV9njV/rA9l86Ri37kERgh4c=
X-Proofpoint-GUID: YyAqpFbwgSx6HI8qBV4rQ-Hb3rmjGdme
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEyNyBTYWx0ZWRfX4SgbSVWU/5ko
 VqTxlSB1BfI7iVZJr0e7gLXDIW6ZAz8X2NdD6Cl6yF9skCOGgFQE2iQYKw7oHsvCeSXP+u+GfGe
 afkTSpzHqhwJj/zK5bACOccWXIOPhuSTZdm82ZQRzLx+x8towbrAqxcqPK7DDEbbEUqGivQdsd6
 VEbLV3oG7a7pYcnjS2IJ5VyC5znkttJlqiPUiwnhIqkXrL1dz01DRdnzsUeKGT4/QMKGUw13gcY
 N117pLznzvy49T9gQOwk5FnVMNKeobZc4e2lrMicrorp2NJOB2hWGZkrKdYR9YvgXKBmzNU/euM
 LJBt7OtAb4CxvU7Gp6l6SGJNvUgGVa2/QdE58KzHCO+8qu9Bp8gdD1cYHcwHkc0z7T0CSlN7NTx
 pjlEfstQsGEb89LXyTI24P6v89sAnkdq0fhwyz9+DMunX6HgvhMThFhnGpM0/O+HDbNl1Ego6ho
 gjoTBgRI3sx5lYbYVBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090127

On 9/8/26 7:47 PM, Brian Masney wrote:
> Reduce boilerplate code in the drivers and convert them over to use
> subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
