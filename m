Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792757045;
	b=YPk1U/2V7q3zejtXvJBUK4vck3UJkE+6UPNGXthl60iO+9uz2pD8TRVbEmxCJai57iFi
	 YcJ1MpwAIP2zoGobCWQOxcZOBIUFazvLjggXcwKw9LglAzaX/Dahnx96eUABViXvrK8dy
	 3VJCX4rP3iAJ1H7V/zJCT38/c56cKrLkYdRaU2FHfdu95PsxflzfKLnBAeZVLCqYaF3Co
	 NQW7hQwXZCgJzIT3bNBhT2qiUvTia2cQu+4Zvy8JjO56NyixMpnYDZkyFZSpN4c7nWl4w
	 v7fwd084A/VknBXhFVw5LO6Fs1eBegw4i/skiv4/MI3SNZQmGyEz69/0nXGRTerQzmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792757045;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
	b=ma5N9DbYY0RYp57eQEXfEMwt5OOCUa5ixU3YSGnJ2eOVtJBAwk6njtn4tlRm/gUU+CLh
	 HVGFXUYToiGyhyDSGz/xjPhYNtEGEYWb0yjQG1wqn6/k11HJwnDln1TeAxNSPtCXO0ZJP
	 sGm6OP7bFT7+36aeDjX5tNQl1nY6Vo1J7xrzA+MrmWAjb9OUaIDoIyoLrCo67c/Fbn4t3
	 9ZOX9+Qo8zRLHsXbQDpW1tGvGe0I+0IHVgjg1NfVs3O/bSnzak7NvmYvBhsWrBB6Huski
	 sqhFrdTt9dND4km2jJmo64yEjJ+Ly7jU46OY4MF3G14a7B5X510GW3jTvnVrV2NEEiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5L59kEI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aqw838hE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D39606A31E
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 12:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78D39606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h5L59kEI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Aqw838hE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUV92164244
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=; b=h5L59kEIQ/3LwFB7
	bNnjdoQed4rRZlG/2nqyWogTvOgQxtmgAFJWoqOGMfgv9Oy2q0L95WZEbPm8CXF6
	gUMwudisky+BO/d/5ARtn9Jt9QpzA9om1ylWvq+SVUHrVF6AWt4uBQ52XhFiALFp
	wisDT7HfLyTQ3wNQHoDSWClIKU8+Zo0wj5fzPJ3ZAfE/VWmELr38uEAClRXF80So
	nPLbPNxiogVq1qvif5iEw2AcvBST8tZQaj5NK4ojlcFJEmEYtUeQIhu+4PXxnYvM
	k7A2AB2gWgZ0cezr9xp8x/YuKn+hmuwotIrTE79J53YP9qX//rK5SvvHBeCK41m5
	z8Y24A==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahv0jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 12:04:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988c723394dso14399241.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792757043; x=1793361843; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=Aqw838hEu1POXkJmus+KVb+HWIZUt68ycP1FKpLUv1Yq4AFzTVRaaMwOvwOJZhYius
         zNpkHuFrzaOREf39PA267zE2KEhtoOQI48XZWWJRkQ7QV+xV5ApN4j/dqluWc89mx8n+
         YIS5M1d6b10lAMPky+rAHXvYjY6U1LlF2VDJBqQe8YdXRCpW9OcvHHm+wtX4Z7+808X+
         kdStk/sCrkOLLt39n1n1uVib6LL0c3oANwc386B5/1J7zkRvyLXis9sVTXT6zNUFBylK
         jQB/tb2hdhRJGlWAhNFHiITpchjxzbdpwfYpBkbh3KTuicwPadmtsbu+frDfEVb4Fkqe
         6+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792757043; x=1793361843;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2v7sykkVpQFD15T/qtMC8NWAztz/dUgETy0RLYu2jp8=;
        b=QkmcipWyRxlGcmzFer9kUzk3lCIUExVjIIfgbkQ0SQaKXMVsmT3huVD64d7Xkg7DKl
         aZuwjomcntEmYg1w0KTkyjoIeXUoJoojdDiAM+bhfVErlGMW68fdKEqxgUL9hZMAuD/L
         L9qK0mlfdG18lbpZqXVV6hLozIpinpG1aSCm/NY/EAahsxa32sZSyLks5u6mNnZqvjZe
         ZZBSxTDrB2bp3eAuDZMRAifrWNoAP5obzbm0+7Dr5FT8HURYpaZWNcj7SNqqL2EDvIVQ
         F/g5hhYIpvrxA6Vt++LG1dcoy+jENJbXLO1vy1NIeTTiENCY53ycQPnxhXKM31dDiYek
         ovww==
X-Forwarded-Encrypted: i=1; AKwUvBwJangHch+iFQaPYqhQP0MX0HL7CsKFtsBmFwOis1HeLjLUPUdyx5G3q2phzfwhE+fGYZlwKBe4zbCkSg==@lists.linux.dev
X-Gm-Message-State: AFq9FYICqlR0WvmaQquYhWj0cjODVjsOsfrbI54yR2NqZmXUr1/Mg1Xm
	2WmmExrZyVhCZrICBfOndKrzCrSow5pIqQxwspl3zqH7Ul6oL+kIWf5rq/7bOhXhhXrPSQO5xJ5
	wAiXvn0WuNyAPc2ZmVCFQmO5D3oKfyXIA5NpCoMJ15H8oNBTRvMysG1XiM025CYWmJg==
X-Gm-Gg: AYBFou2e+04e8KsB0wWn9PKe5a/T/seoKNCGpUbiFdoZvZDkvPG68VIQbQmmejjGgMY
	xaZTVgp1Ux+QssgmZp6Gr3O+q7LmmAiLUIMOMhJGwoUCYta/5kMKlyUpFzw9og2kK6QoCoEvV03
	2f/A1O/HQU8WdD45qp5L8mAvwPjsMMVD1lWzMl/bmyrnnzq3ZQ+qLRzUXMC/dpXC7Axu/7db72T
	wNmok2zUPe2CM/4cT5QEt2aGtsJyfhToGoFsESzp1+S5L6op0BodkIjawZRKhrboMj5HjEZWpBO
	I3oUCqPTqRmd0GUmMJGZAJ3BzzXeSAp4a2pb8L19irjlrLlq9ndnY71xtUrBljNwDo/XOAdIa9W
	sqtqbDSmpsGkFOAfMlWsyFw==
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718435137.0.1792757043422;
        Fri, 23 Oct 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8515:20b0:7cc:174b:f7b7 with SMTP id ada2fe7eead31-7ccc2d8f97emr718339137.0.1792757042539;
        Fri, 23 Oct 2026 05:04:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b432c96badsm977598a12.14.2026.10.23.05.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:04:01 -0700 (PDT)
Message-ID: <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:03:57 +0200
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
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
        Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX+uAlbfv0oVSW
 fN+66/fOF1HumAMnpcPc2siQeDQV/ggfpAGrtZpNPdteWvSMAuuMCD+FXNIlGwfEuW0XqoT4Z3f
 W677oeUCQ2VvkWQ/qLDGuthdV1LSK2o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0NiBTYWx0ZWRfX691hAm70Yoi7
 4romFEqRs8P7TBgGed0Bly+N0rphGS/ZElYIWiKMIk3l2ti4yvj83VrQGAGiQaelxP7wCDAByYg
 3+MlFCFexkHqcTs9Td3i44E21PVD0Cczq2c9ccrvA99Rc9qefOx3jl3JyttKszrP6O+Ax+FOvyo
 PtUO2QkCwup3BRpCTqyOdoWD4ICmWEEKDfqsqc4qoLo+5/A6nXH1fhbeF0JiIORaKOKSxNHYOnN
 UNAxI/rWaYrxo/7loMe+EnYwygTzTQR6PQtKahRLVHs3u/QTKm/LUqZ9DRkqEg0MK5UpxyKuHWq
 Jv3vuntaOEXZnux0HyVF4FeBYgsYUnefShsFN+7hrNxolzDJZBvYVrhd7RxG1L8x0+5U2BT/RlZ
 RdDvDsK0Ooe6vZek6/fhxOes9Ib01P3++vX4cM05dWYYWHPpyLWkMGtUvCN68AmHyWcbKZLp51A
 CEbsnpY5MxzIM7GiYaQ==
X-Proofpoint-GUID: P6K8OAhXRTXcmKG_Xv0LYzHKvTVpANx-
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb4d34 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=u5pNeYj4kXT91oPWfH4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: P6K8OAhXRTXcmKG_Xv0LYzHKvTVpANx-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230046

On 10/14/26 9:09 AM, Yin Li wrote:
> 
> 
> On 10/13/2026 6:37 PM, Ben Horgan wrote:
>> Hi Yin,

[...]

> Hi Ben, Konrad,
> 
> The original 0x10000 reflects the per-MSC register block size as
> allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
> use "how much register space is allocated for this block" rather than
> "what the last used register ends" to avoid holes.
> 
> We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
> 
> That said, this patch is marked DNM and is intended as a local
> verification example only, not for merging.

If you don't intend it to get merged, you can even put 0x12345
in there. But for future submissions that will have the intent to
be merged, please stick to the 0x10000 size

Konrad
