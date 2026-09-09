Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD0A30D3F2
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954304; cv=none; b=VYXPD//5mtItttzfkIj8me6e67KF5fl1PZvE/jtr210OBEkiVbO3JiZRrNxU984FxH3PbXQKaNYT4bP8x0ZNi7fnpuKxybv9QupPHHBe0ko6Hb+i1MecBwyTGp1FtZLY3R/78x5zQlbR3sbzM4K8j4H71KkA5tQ+y3GlsFW+iXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954304; c=relaxed/simple;
	bh=A8fbtECilXcXT05bGS4gADzn1R0DQYSuDpwR36o1s6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKanhDR5bEswi7fKiDqcKJe+hElDDNOPDbs1qY/FeifPZLtCqYC5Um9X536GUcVNFCTGzRW2303w2hjzmKBxy8aZXTb6t5elzuudigLtvE7ncSg06/+quRC7d22LSqjgnOZy+lien2Iub6SzMMz1fx7BX4OQntRciDbRZB4rB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbEM89a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaMqZCoX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbEM89a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VaMqZCoX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUHNx1144574
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 11:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/BIAcKnu4PYwR1yQKunqDZK6
	VZ2d055y4cTbs1O813g=; b=UbEM89a+IyCMUH8fbe/ZDcIHuOWqydmjtSVvoiPm
	Nl96voSomED5T7SASKY78Nu7lWVixAZfc5oOlFGGD1QVPNGU05kouUJmmwAk0DzI
	ATho82FJYipFdvlWvMX2yLKHcxHUQtmrRHfZCBGvpQouyFO0fdQXS1drVJ/Vfz6n
	m2w9swZscbvwaOUSZN7xC6Vg2wzGqV8EU0rrova5mF3hFwE3ei29i59Hk+IKYwKH
	LXcoQWt6bVQtuWNMf7LBf62Ppbk/1OEqmVOXPVKhxct1LZjbwg39uJnblC+7/oTy
	Rs23nM1smCaSB/QgBsIxnxKjYSZ+EqnmMgeV42j7QCvMpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp41xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 11:45:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d8cdso1076252485a.2
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954300; x=1789559100; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=VaMqZCoXkXIuPHKBvadZsrMCEV8RXo/3uGmpdEDl7L2dFIElG/zE8kLGMx7PD47D+0
         d2ZTt+PMBZPOPnXKrrJDXudxokpc3WbjYKUrRIKrPZZ6grAMA1hn0zwHxCKptCfM8CM8
         S4Q+rGYH8l7Qi4/vP9kAcz3zbwGv2BuyfjpwlQDoy3vbKrThfhCIKSwZM2SM4wHc23w4
         V4zm2UM4ZjUUnfU2NZ36KG81T41sZQS+TaVDihfuE4kN/sAH6xmW7In4eKSfkdhBT9I0
         pdnxCe77wJDN5Z1SlrgbIrEZQVUNWZjNbI+KUAxs8jN0lWBuL5mkBlFGrQ/tj9b+U/AG
         q0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954300; x=1789559100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=FHuilVfhVU3D+Ml5q1kmtlZraU+q/aPbHI3TiIlwi0wbiIGURH5Ioa8xjnhrNP5xkN
         09bkv2CKhlcrwdAAnAQizLzfh5nsug0NDVNRqpzZMMTFB7263mVKxbJeqYyqz3oHD7NJ
         mj+OETUWu99+wGUCP4raipga7f1WVKJqLc3g8eajuZkulRvxJT/4beP5AJzfGayyyYLt
         TzeRdu6bVZXeW0f36HdTa2nDxKWBGj75xdjuF590gnzLez3lnjYulsYLXs/GQ+HYTrSS
         fr0/ONX1bs8xGGuFof8I5jJLyReIc7ogo7pqd1BBfzKwnoYRT6FPT+X2XaldUnL3kw6t
         bh7w==
X-Forwarded-Encrypted: i=1; AKwUvByiEqnWC4Ig0VD/C/7gZRtSGgX83P9sZfk0xaMCmBdjnlt0TYB+jI5IKkt2GtxyW39ua/qf5pkxIGZ+vA==@lists.linux.dev
X-Gm-Message-State: AFuF++nG+zc++AJJD3eQAmgYGTv32ZhdfJ4Fzs9AXcaJIjsz7hv+CkYQ
	K32QnfYXrFCOtLo0M8dLfsaM1Yn/UNRAK9IJJpId8oL/i/9N//Pdvl1NqNXReiF85lv2IZKwfSg
	1wDvtYrSRA9mpAC2OoLpuhP2rDJcB+AbDA2pGu6HR42TbLUyioRc9MCPVNRuslQ71iA==
X-Gm-Gg: AYBFou2hJKsCtgqBXPEWzYWqPodIluCoAr0v3wTm0PjxHAAwihaRyL7xYkY6rPynmPv
	PRUZGo9xXQw294DbyylNUlq7FwJWrTPUz4SMoTcPhjLnIEh6WM4m8tnEf0BgOPsx+o5cG7Vsq68
	1GQpa6qAT4UFTywCvQiBuSF1rf3NI5iQvIGM2d1IBPQvYs7WesMpEkv6qZLXDf79QyPROZQ0h7l
	nC1EbDapDErUrNNmzRs3jrH14thZoX6kbgwgeevml+/Bgr8YBdLMtDF7V8DDx0xgJ7k3CRMKiZk
	QNdyv6Ei73cWX2+2ZyyrK8yfzv804204DvMjB0O5OjIgHmt68ti09k/iRhSDvn/7rpRPRKgdqWp
	fLYaRbNjyqV8=
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934362585a.52.1788954300407;
        Wed, 09 Sep 2026 04:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934353985a.52.1788954299549;
        Wed, 09 Sep 2026 04:44:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm40029685e9.0.2026.09.09.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:56 +0300
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
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Message-ID: <eu2j6ohmt7yrhkvfcwiwfdcsebezdi3rr6vokc3t44ynfucuew@633443hrwqwf>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
X-Proofpoint-GUID: odxD_aP6XyRMUlS8Y-6fr1h-YH5jw_82
X-Proofpoint-ORIG-GUID: odxD_aP6XyRMUlS8Y-6fr1h-YH5jw_82
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX6gH4jx/SMwEz
 gCmCVrsQzJITp/Iceir18zlJcK+S9M9+veJb+6uNMEuTEY4X4nKyMavYnRPe/TEd/ZXhCocKEr0
 CnMg6MMiPgm4B6QC3DClD7QC3ALlBXX5jQ2Ajh2JtrB/QuMGdiCNpZRRcZHuz2LwW/6VBNA90Lq
 BJGpB1pvvw0EorekU4CLStktm0H2NenV55yoHpuLZSowz6qJTkl9R26gZY7JBswLV2sszCwdUs3
 fXqeQU9Fo2LuiQru4IVMcTYneDkB4pRXeNsD8GBo6bpfVtRREsQ5DHeVThrj9aIs41tApu53dFV
 8+oYangXJBeWikZXPD5ZSXNhvuDGT21+FZIbpi9t5pekaT8ffAHmkc03kar4Rg/qCDxq4m/HVYo
 qXddmM1g5qj5vJGsdf2smoaV07kVPMi932lXstKaXcd5DYhWQelAnZA4QxmC2vixPtd315XBQKh
 wmePfKqmM0UkJ7wnu+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX/gBet6aQ2joU
 rvxg/FOYV0TzdyYd6PCPsM2YQPYyQk8efO3djHgyID84YFwJWM9DRg55T9wZKgf7/53S+gzr/AU
 LTQRzQ/ihxjIhS6GnUtZqvkpgdBMXQI=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa146bd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=7ud9App8h0w1rxOIwrsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:19, Brian Masney wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
