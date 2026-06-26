Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3552DB7B7
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 23:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782517821; cv=none; b=jG8wixB2x4e5fD9lbwcYSDVF9QCona8at1Sm4FkVToBCuAN7rxPWC9nneoegD7f1usZIO0HnJWq1sXoZieB9BPeJyVcCml0E/TxjYOCzIDJLAFA7KlxSFomwoPJyhxzjsMH0bb5c2SMQ/QQkKAUWvSZUGz8HGbUd4DmC93XzCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782517821; c=relaxed/simple;
	bh=tw7O3G18WM+tsEMcajV83sOUmXqD1KkathtWb/FhU0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XsjnOO+xU0kGUiirJtsaX5Mntq/k8PGtygAFu0VUPKXvdaJ7arpC0/MjgNKVeQiEJmoTkSLmpnYrOAKH7XKlrMUOjAeTZ73Qng5G3io/mxqFV7Az8jaWX4v6rocg6SgAUVX6rUt+xfUxAmRs3E7PXjIc7+9ELGM+ceeMLabdxyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0BD1A6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eOa40SYT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0BD1A6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eOa40SYT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QMx0sr2205430
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 23:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6WrQjAuTZPs9JdyiNNHUaPM2KCW5bh7c6nhy2HX82+o=; b=k0BD1A6pneDG660A
	MuQ8jHjeCDCmqYUboDEQtY73XNqlUKMEwfgh1AYDFOZrdZ5XhccmPLnCVIah/YzQ
	vPH3Txxakq3StxhF86rC3HTy9rEFDuXLx1BsAIp8xldC3vbNocIWsjuoxJApV2a2
	r3ynWntN8Qbn/7b50ihWz7a6Qp/pAreqYQgCkKjl4Bxk3VvYUXIj0p3jaawBd8qk
	7GvuGnnkIJSwyY6zYBkiHM2PQPbeL7UbGUIrcqnJStU/HHanHffO7voASH19Sy7R
	AdVwtULgUJmb9/ltcEa66qZTRNSJR3Q5eqRP8N14uqYmo1cKivs/1GXqX5CLGXko
	MfBYpg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1vm2hd3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 23:50:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37e06c76b59so443675a91.0
        for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 16:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782517819; x=1783122619; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WrQjAuTZPs9JdyiNNHUaPM2KCW5bh7c6nhy2HX82+o=;
        b=eOa40SYTKGeCA3yjZKKH2N66RUKFPwBRWPG1TT+9orYHeUTtds8gOsfcsABpBm3sTk
         t/kzUJYDWJdOZWY1l29Af9KvbAcmFv0b74bMMG7Nvm1wKtHdFhGW0SwyhKZrxUvDgMcj
         foyqXNCE9CgLef+65HxWfUr3T6GAHgm8xBtIxJYpvvCCyqhho8yzIpZ2iKKadziB0Cz/
         6mek6e9PZBEIBE/QDuSHUSkDVlDJd2To2TMNDDg+juj38d07Ghp6Aa137y0XTFq1SB8p
         OAbfEVefu53Gpy/g8Vhm79+OqlgsFD37pXIE9CB8sP1rXnbWdM8/UAM8WqLTtLrFEMx5
         b8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782517819; x=1783122619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WrQjAuTZPs9JdyiNNHUaPM2KCW5bh7c6nhy2HX82+o=;
        b=nN4wn/7pelwpY2yafFJzGhJ8PPMKJ8fvVQyz3Pcqbwsv51HS4fHWMaqaC/SRHEpcSO
         mhJLABQ3wVk0ZcdLM6XOHlsb345G1ISsh0R0XPBdIXxWfvkmNV9wi5geGgoFjB682mTm
         08PXmkhIR85ou5C+jyr/JxsYpANS3SOY6JV0sn5AnBxqF8DDGSxFw/esNpDRPWNaJpS5
         Fdx1+SZcLyib03yDjPzeepnpUVWWLmC2W/mCO3dy/aY6wRyub9uJkIEH3cfTmiCG6uBs
         rARfFI7R/QKuwpHR+r1zsYM35kGUJ7FOj8lPHAeL1lGNs7oJm28QLw8b/SDVSSvQOU6Y
         /KqA==
X-Forwarded-Encrypted: i=1; AHgh+RrmbeCdqO+F35SYWP+feb2r57yX1vjJPiYCg982G5oroQPURSx8Ph3yqlVfJMMlu2IQ6GZme1L0mxRX9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr/Bf+yNi92SFBlyhiLkJ/MvFW6xABcuvp34tkBdPmSNNyg/qF
	OpeRXVcLJbpj8nnizGlw/X0erJYPqsFmSqE/JVgvobzleJAp5S9CVOTp++sBQyKbUttFw8S6pMs
	nnLmIrBnw+uhth5ZH9+n+1ijWcwXgM/PtMGkNVDRBOTj6N+/p8KPuUys86t/4K1PmPA==
X-Gm-Gg: AfdE7cnbNSmRKq5T97A5O97Na3kF7Y5+vtSYFJwDKB8mU5mSgWU66j2BAkOBkkdmh5j
	osWSrnKBq9KatYRWUJxaj3dEWR1zCpX+nEHJgcD4IA0/5mSmaPEq+zXcU5xBQvu2Rl39mtLXPgU
	fAlDuDCb+yin/IhPlVcz7gK21cpZhPSulpGciXMwzoXB/XpwQHiVHu1/JC9+Er7Q+gUbk2ikNn2
	+8hW6xEG0XQ0p6SnQmhkK4cOsiuKpVITnDYm9mCTWtVi0H/OOWwMxkaSM4UmFtV4vRlpw+LJKAz
	sze5W04ZAZ9HU8M8mVGVDMbgTZdzvQjzBXqT3UmInsCOr5CR+9h0MPM3Kh6ocHD9aU4uYWWoCJQ
	OuFFlDZ2cP43RLdkVu6wMokAvjQEt2R0+VIM=
X-Received: by 2002:a17:90b:53c3:b0:36b:9231:9718 with SMTP id 98e67ed59e1d1-37dfa2c9951mr4623238a91.6.1782517819228;
        Fri, 26 Jun 2026 16:50:19 -0700 (PDT)
X-Received: by 2002:a17:90b:53c3:b0:36b:9231:9718 with SMTP id 98e67ed59e1d1-37dfa2c9951mr4623217a91.6.1782517818575;
        Fri, 26 Jun 2026 16:50:18 -0700 (PDT)
Received: from [10.231.195.100] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b96eccf8sm4246469a12.3.2026.06.26.16.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 16:50:18 -0700 (PDT)
Message-ID: <85b2bac4-9882-4f35-81e4-1718a52aacc9@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 07:50:12 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] software node: Fix
 software_node_get_reference_args() with index -1
To: Alban Bedel <alban.bedel@lht.dlh.de>, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
 <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE5OSBTYWx0ZWRfX3Dlfb52jcQY8
 jrEa8wHY6htiF2i9amK2QXEI49t6uBY2Zd2WrR6/r6LT2/dqfuUXFX2zvC28ee3QBH1QqN6kRqg
 gyAZPg5BphgCMmKTgHYP/CLDMS4LXYToa0AuX2miwO+GuxFvA2q+zLInuE4PbkiDeQWY7Gn93EU
 klwV/+L2+TiCSk8WHYw3vsVBvwbzWezzRHhJCKes58kuidbq1l9TKhiKmCL9z/X5colO24wZ6we
 1x7M7cqUFnD8QklcJV9xZjEQS070K5fxKdM2MYEgyk7Qeln6v6gzkuqirZ5rnrMq7lqPhJimcel
 PXJV2VbHXQIHNJc2Zw+WF1K9dFizF05164QxGUeEDuRdeNGlkEPDkQpAlv8nMNojDzlpWMOkHr1
 XpSDxEpnnfCiqQLyngQ8RYm+KJC3O4ijtwNMmE4GroRjNEMHSLmokpjeHNSQ+wvSzR/acSV1va5
 /NfoFlAC/oqB37Jku7Q==
X-Proofpoint-GUID: hQlMprZcizYI4N6ivdur2eTS1Wr2v8RI
X-Authority-Analysis: v=2.4 cv=UIvt2ify c=1 sm=1 tr=0 ts=6a3f103b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=eDjjQEo3sodWcWNWpWEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hQlMprZcizYI4N6ivdur2eTS1Wr2v8RI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE5OSBTYWx0ZWRfX2FTX2wxJmk04
 UsPzViAw/GOA7netz24dDwqMHb4rqBT9gS18sdcLk72aqlYQxZCyWkhiXRFr/uKcF6Y4ewwubU1
 0hIlogJ2I/BgMgZuNdM54qNF02do1cE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260199

On 6/18/2026 11:20 PM, Alban Bedel wrote:
> The bounds check for the index passed to
> software_node_get_reference_args() was failing when passed UINT_MAX,
> this in turn would lead to an out of bound access in the property
> array. Fix the bound check to also cover the UINT_MAX case.
> 
> Fixes: 31e4e12e0e960 ("software node: Correct a OOB check in software_node_get_reference_args()")

i think the fix tag may not be right.

for original express before the fix tag: if (index * sizeof(*ref) > prop->length)

for UINT_MAX, multiplication overflow?

> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-devicetree/20260611103904.7CB131F00893@smtp.kernel.org/
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
> --
> v2: No changes. Only submit this patch along with the patch that
>     triggered the Sashiko report, to hopefully avoid another useless
>     report.
> ---
>  drivers/base/swnode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 869228a65cb36..2bc76f01eb77d 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -537,7 +537,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
>  	if (prop->is_inline)
>  		return -EINVAL;
>  
> -	if ((index + 1) * sizeof(*ref) > prop->length)
> +	if (index >= prop->length / sizeof(*ref))
>  		return -ENOENT;
>  

who will use UINT_MAX ?

This function is a interface function.  the best fix should check
input parameter @index and return -EINVAL if it is not expected?



