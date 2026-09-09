Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1C52B1D4
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954274; cv=none; b=BO6/AzuOH7GrKE0C0dNs12CFo55mpzIZq6COSsb9EmSX8nsdhZ7Tn2bxvzJyG75jGqZBgpSinLiiKfFTlmdQ3nWxO6JU+189zvf+rsP3YmsvwMuJpGaD2PPwadFzprEh/y8SSii4PYJJyXo5bAvDbotjIgGX+Bkns3gR+NWbpCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954274; c=relaxed/simple;
	bh=Q5ojKNKo6HChrWiC/HJMJ65Lk0CfqxwiOcXmEevOK60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWMe6v2Yurbf3JwCOdYLeYeln/sY57hVJ/K/Okx8fTqyH/ZUuaJ47gVI84BWdjCfw77kIIYDm1B34g6XsdS8359L0aPmuVDT0KWXqwz3WQpIdafbsmNpfzZAc8cZrMFzcTgvQ9YJbWziPgPEqgkvzlhdaRfZpChMhff0fdBCbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouq0vNez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dH7ocOVy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouq0vNez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dH7ocOVy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUbNn2019807
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 11:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Z3vxjDucbkBUn20X6eQMjxa
	kCQuQENAXW25c7p6duI=; b=ouq0vNezVu/DefF5uxtof0cFcCI/P9C4ofAaFR+A
	k7QhiVC9Wx+sm1bRd2yHVPp7Lwz0TFC48ulCHzLte53JEOlC5zyTzJaD6SRz4DOj
	fqLqNJATKIMTFJAKg3nLkHikMFm1q/VS+nMRDsyn01oAjUDmmw9lE8Dc0Ianodle
	ctsvzS6U8mvm6WXdEtCW0W09RBSQO4DmRI77eJWasgvaXEIg1xCCQjXZNfh6SjLb
	c0EBY747Q8VBfB+bWD15oBk7j8DJXF7MQrGwX3NwAspYv+sIlgipkSJ1FFNJlMZq
	oKch90bDYNGhh0NcYsDMM8kRE3weuhz1TI15YDulUlzkmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x85vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 11:44:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93975d63ffcso642156285a.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954271; x=1789559071; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=dH7ocOVywsjfd3eipKIzeXx3bZIIYc0YzM3P0AtlDSkGyQx9BJAx2RBuNNlGNDZpmr
         xVU/NZsXSvvEp4P6e3t3VX9xsG5Ai/jZq62LCJDIWnLLSDzRaioyqNtprhnbhgMFOD6I
         iRn/R18Bg4e6VIorsfXrH2MVm98xN/dGZDltv6ZL4bIyMcNBW6/e7T1nelCMPFRD9yWe
         WqutgN1xFTJNH/rtNuJjvrpsx0uwW/KVvkT8CEiuLv8HJurp3yGcG6BRgMcASVbiPq27
         +zwtV7KDfqVoXmp746E4//qxO7driHngIDEHJ7EkXIASgFJer56hSlwrux5mZjiuVicO
         r88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954271; x=1789559071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=lN5OU4AoBnmk9iUYlRhSh7KqgC00iZ2TsxWl402t+yTmowTQ5wEVNivJ/7SNPQGeH4
         n9FCtH/VkVRYSloS5nRxd7MGQ6aNprt+wJiqWgHQu+YCqBRiW9GunUxPU50g+pWAIO84
         uyMFrmE1Pw7Y0SH6s0HfdIyJ7S6GKccsh4ecVhOpN1f2oKHpsNZryXd0bFWEqw6GAal5
         dL/OU/7IY/oIbPPYBHT9goO1t16LTg1cZjRKNx3pz2rP2Z8Oa3gKBH+51bJTZQZmokjW
         YWQu00rjao02wQTNWjIBM0P8Oaj5T3UdtTYx+piv6lDbZ2nRtffL6jxFSFtL32dOD1dI
         LXHw==
X-Forwarded-Encrypted: i=1; AKwUvBw/6jHJtRTc2q4zK/Op15ntewZpzDLFgAz2WqOE/vkogxcCZDofHWIL5fVhHadYeYLPQkK34WxMqr3DPw==@lists.linux.dev
X-Gm-Message-State: AFuF++lGIyCJXYoh3SDNiY51wmoQKXwCavShbBM7E5WE9G943QdHWRON
	PfuhuFOEZBqZFrFzS7rl+dROqPJWr+33RmkYTmH/imyysYECIwxEUHubTmFjYUpMyWUVdYlo8mr
	gb9xK4X570uzSAtNXc5JZ3fMN6j2OBNosaOc5zEyXMdHCc4Fz2MoWEjV0+pYUwFji0g==
X-Gm-Gg: AYBFou2YoQ/k/Xii7S8qWsLUHc58/ErSfzLG93fQwJnIt1HIHVRCry911nqPPpaR5Un
	T0yj5uTSADtovonoIoa11vrnUiJqgGGFt3YWVfQYld1I09t2Bl1wJa4q23wM86sOfhM3ZpwRUC5
	wFnCMf7y8vUEwZ86KI4AB3xjzKzFLJuCzPa3ZQsdPig3IoiXNEkZy/7XnvnIxkcNSzo5JlWx7lH
	54CmxK5rKvpHXCGuUIFBoimtUCvk+G9SdnhhEpqjX5xzxxMVLEQYVoJ4ebiIcDu7QBeDbqoE4Rx
	x46Cofbkux3KzRFta5df6jE3vJeI8r0eHG3VrBX86KEOn+ereN4HZ0D7X79X6ckUWxVxTwYLXQ0
	Q57qLxriVmy32
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614855785a.6.1788954270666;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614849985a.6.1788954270227;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm374791805e9.13.2026.09.09.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Message-ID: <jer2cwmxbsvbcyyfjk5vv773alhivskfhx3yah2biemulszknz@6ievb2y3f6ot>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX8bSES7QefvTb
 9QuD0PHhWJC6RXJ99L3t9ZiO+3KjLFR7ujfXyJYOfIvwTjZEJ+BmAj+do6lfX1cnkhNJKELQ+yL
 bgt4Yo2dbjt3ZthalDcEo9Pb3hSIb6E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX6Hji+gGqfFBe
 f4g1m/KolHgSl8gJVqQUf0UlO9Kqig9wfuLk+ugFvhhJRosTZFruUyId2wiZn2quxbckgowoBF5
 jXm9BkvaQcTrJtu5o9Uo9oCwLP0/KztiXGwg0Iv+VjfrRbj/iTXKgd1OX+INgYYsg8OZVQRDc2N
 sHEHOfkRFga+veEqCbwAeUFtrU9PLrfAoF0S5P0/BjVY1WmV7nT9WIkAVhuuLxDRY6OGZHyj1/x
 BWV9+cwKiCtYJ1ni0mKNCjUCaE33tJEPq+vjlXfG5M6P5rR/94SFHr/xhKETpSIw5mG7aaxwW+d
 BZUhQ4dHVFyyYBVAF+xXIlmGoqEaM2eq0UYUc2vZqZWdnFO/VLT3nzyvY30hGMycM033ZHBibrj
 cqI3Go6HnSAGchF5792/FJaThOgXFbUfG2r0iRLW5GXZp+yhDql0h/njQcY1mgRr7olj2JnEnn0
 42XLCjyn2p0hWUJQOYg==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa1469f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=efGZWcCWKF3PpBPhZoIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: aM15K9h8FAWrJR1R392_FqSlcCE9miMb
X-Proofpoint-GUID: aM15K9h8FAWrJR1R392_FqSlcCE9miMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:18, Brian Masney wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

I like this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
