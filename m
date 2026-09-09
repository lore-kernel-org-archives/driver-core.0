Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A96D55C327
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 14:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964834; cv=none; b=dBD2hTKKd0ZgiuuJ9JcsWfR1ldLuR43E0kTxG5z7oC0cRmwbnSXDNmMkcyNPigcSXyKIf4EkjaHoC5uaAaaE3rgYKeFqOqOd8jOuVbf7W51X+N7u65HvQjUDJ5Ie3RnjJzzWjD26DNJnpmrQnXqEnNS4jyA5hZ7yeBOr4D+Bx0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964834; c=relaxed/simple;
	bh=ncH773zu9pb68ueH4PuldOxRJVltvE/gmWzndPjXc+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fA1uS5YDU1bnl+HVGTXf4UA12+gEVZscW/tmOCzp0vak2EgiYlPFGTZK/6c2AnwBPAEzldJkAdN+d0i0h+OKh3DTtdTW5JDcH78ICKQfCNx1WYHiDURv6GnwPuo2BBYrzw8J86JX1CFyynv36fn4UfJorQPbUkINLqAnieYux/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pv4l5QIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQXQ+/se; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pv4l5QIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQXQ+/se"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4Kh2171694
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 14:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=; b=pv4l5QIg63CJ8cz6
	uxg1ZcSuMQ8RNGqQgtV0FUaFN98nG2qEGqPgoJUA1J6NRrXIMO/RPTSdLWYUjfb0
	8WqijyAFSRCaQYGWIQV9USbTPvuF8FKk+GfgAQzWGQNgRSqNzUDGsMlLS/XjPufj
	26ZYb1bAhrKT+CMez3BsgNxfZgt2mI1FenKu5RtpHPdmlxZOSUKpI70wApwkvdfT
	9RUAUN7LlnzRAw5ZDj2jpGix2sDnS0BjEjkSrNJh0T4Esn2/mmPspSBaB+cOfK7v
	oandqRb02zfa6XzOrHaeYGmSvyYwozB5PoessXG8AHW0s2D0oAvvDGmifFNwDln5
	5fmvhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgh0bq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 14:40:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6703769a91.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788964831; x=1789569631; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=;
        b=ZQXQ+/seXPOeMMgobkL5ZyyoIgFrEEosLbYM9M+wRgd7+/f/JAKwf9Gb9vCU+U7xsy
         +iyVRgfkDcP/cP2WDKn2pYGAXw0f+X0Kcidrv+h4bwjdaSN/H+0Y9YcFyJ1sDKRn0NvY
         jv73j+VJFcB+zM8Pp9tkFDqjrv3+2EOzgTco1/8TYM/N/bnq6nXmUViRgzsNUS3zXqLU
         tT/BJVLe5Jp5L6CNFf9awcGreEEI7Pg0OrjFZF8sP1FDs+pE3VHNcQlNG+QmZT5jT1gK
         r7O1CfV9+ifPWt3Klq4RSnj25VNVL+UWYjXfBjA6h6s3X5Zk/lt1QygTzC9tunZmr3eX
         gkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964831; x=1789569631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=;
        b=de2lLx34Th7EoIbJLzNZf0xFvCZSPyK5u1fPeATI8JfBlsXYh+LRPfo5TCqbULYjPz
         W0/BrTpUxEMI2QOCouc92+xbzG8sPjHXV8mXDC73GHP579ZIVfXiR/EgtrN+UowKxYTm
         xBYGZaHbryDJKJPM5idqvhMG95lCeGQQdEmbiSkTgC72TmNwC8iCIzQRtiv49rbV+IMc
         D8aO4ItN1bZKbcMNwa+OTc2YRco9Jac8y8Q/FNtZU8vuMEdu3oT2QJCsb5zme19FqKI4
         1oV2Gn6KNkMIzoli8YXQrrMa9LRcFFNfgVXLIXoStnrME2NT8JE2YWE7f5dfwALT/tAX
         Btrg==
X-Gm-Message-State: AFuF++lQuIa59+Ixa8QLWhbCrgjNaY9tGxaiR0sCWQzJNu1HX25IBxEd
	P/XJDKzF60cNLK6P2icAoUckYkV9lrHrsxbP8VI19W2JrIGpwuJrSs4eHAGv2jQBKjr8uvV6x6A
	1vshP+VPsMxTilvqbyjwMpSVytpzRNqqQPZZzcWNmeYdHJxhHT3IN+S081OwDEpdkFRtzaza+rw
	==
X-Gm-Gg: AYBFou103Nd/xiMiD5akjbVnI4p0Cmj1X7tlcy7k9RSQLAbbfY22e9ApQk/guXsp32v
	jgPlFqCQLZcgILT3TS6q05/ihscFDF3d+Ai+F490UuX1XTlnHUlejs9W6Sjek/WXT6J19CLYXOc
	+wGrvHp+P29CHWiMx0QRfXJLG7lgQ8t4ypGRlDCHe5VEU4nSpDapGpBMObPyU+8ev7YnSWVFoja
	LFKrCl5ma5KeCpBYvTkoq9RnEtDjE6A297x4GD3Vf6HmWZjgsj4oaLHAPHmB6GOIs0UmOLJ8RgX
	nRAuAcE3JNHJ8Jl/hhgNxzmzIANMkQ0oYUkC4wF6bePi5eqQSZq5N5tm45R/EXsFlpSEg6B62jx
	4CQKwjncGDVyo9ZKRtp9V8vSOQV75qzQXqW5h2B+JJjCgmWDbNFfI57Za8UUQxhie+DA4AgZWSt
	yO1DRzLzFttGKjF00=
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr1775750a91.12.1788964830426;
        Wed, 09 Sep 2026 07:40:30 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr1775688a91.12.1788964829977;
        Wed, 09 Sep 2026 07:40:29 -0700 (PDT)
Received: from [10.50.42.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm38218933a91.8.2026.09.09.07.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:40:29 -0700 (PDT)
Message-ID: <b01a3558-9107-4271-bdf0-6c3d548cef09@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 20:10:21 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce
 boilerplate code in drivers
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
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX9m4B21wcMr7S
 jNj0fHOacuyFtl8QQeYdHjmAH4wce3Bk8Cu3nvVbDr26QPAPVhmQM9N7E7BS7Lr7/dF4j3mQxK/
 6kZPv5bbyq2llpmwLRSAjZNbkGv/ohI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX2qwj/drNxT5b
 iAl08UXQfpysW4XZ03+hVni8zpAKhSwmlSEsu9qupuTWSAEZHjWV5cHZ/EPEeCGzclF+YIrEu6O
 eQR2irwWCr9K2whzEvspg6FD5uKZQJxZ0zzMX13ANp/N3o6Drph3l5n5h3C5dWzbjsicmt0Hs7q
 RstoDjv5PFDnqN8t92sZXwrKxuCzAXx0F83zBtufzkhIwGv1KLLwkyOOCchEg5gv5AS6mkuYiJA
 EIpS2bfwc337rwdb+nZYrz6MLhM47kj2/1gyWp6fQUSulcsxG1dY/N/DukDJTei0g1DZvjsOnh/
 WERcrK8BweJxt1bQWQvBMfzoilbh6ez2EsRLV5XHCNGpfbzh8ZMlFv32Yo+PiwHkGdXgqr7kWVs
 JVlgB1YMGdYrRZmbAk1tx4MWXI4rfefLNFGpDOp53c9lga92JGUgxDaXpM5axWqZBBIpCmiZ2C2
 0AgzjZhuJ+bL0kw4SJg==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa16fdf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=_6l-rGU-S9tz05y7jW4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 4q5gBYp4BbkC4Anx-6yHt1elP9JgPHAG
X-Proofpoint-ORIG-GUID: 4q5gBYp4BbkC4Anx-6yHt1elP9JgPHAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090163

On 9/8/2026 11:17 PM, Brian Masney wrote:
> There are a fair number of clk drivers that are registered at the
> subsys_initcall level since some clk drivers need to be initialized
> early for other drivers. Let's add a new macro
> subsys_platform_driver() similar module_platform_driver() to eliminate
> some boilerplate code in the drivers.
> 
> This series converts the Qualcomm and Renesas clk drivers to show the
> code savings that can be achieved. Once this lands, I'll convert the
> remaining clk drivers this development cycle if all of this can go
> through the clk tree.
> 
> Outside of drivers/clk, there are 364 drivers that use subsys_initcall
> and I am willing to convert those as well starting the next development
> cycle once this lands in Linus's tree.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (4):
>       driver: core: add subsys_driver() macro
>       driver: core: platform: add subsys_platform_driver() macro
>       clk: qcom: convert drivers over to use subsys_platform_driver()
>       clk: renesas: convert drivers over to use subsys_platform_driver()
> 
>  drivers/clk/qcom/dispcc-x1e80100.c     | 12 +-----------
>  drivers/clk/qcom/gcc-eliza.c           | 12 +-----------
>  drivers/clk/qcom/gcc-glymur.c          | 12 +-----------

Tested on Glymur-CRD
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]
>  drivers/clk/renesas/rzg2l-cpg.c        |  7 +------
>  drivers/clk/renesas/rzv2h-cpg.c        |  7 +------
>  include/linux/device/driver.h          | 31 +++++++++++++++++++++++++++++++
>  include/linux/platform_device.h        | 30 ++++++++++++++++++++++++++++++
>  48 files changed, 107 insertions(+), 487 deletions(-)
> ---
> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
> change-id: 20260908-subsys_initcall-05dfd5fb0f04
> 
> Best regards,
> --  
> Brian Masney <bmasney@redhat.com>
> 
> 

