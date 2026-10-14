Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917754EED8
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991394; cv=none; b=azolb9Zxn5WevQtJZt84uzapsLumCbh1wWrZUr8tfFC/vb2lgOZSE5L2PdwCEfiwDylIOk1OOYqSpYaZd0nn6NgG3845FHrA07FvGFdpHntVSMqsdODyP9RZlodU6DVr4zbcmkMwwjYCcQtXM+I+TETdwohAmIFCQX/znJ2/akI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991394; c=relaxed/simple;
	bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lv0HJ7RiuL0IUmZN0QxQL+sYxevIlZncTJA6VnjAupCDZYtqoiVWGtuFFW/V3gi6Omh+Uo5eWr1bueiEsq8NOSLlwN6n8bsb4c8EUxTLqtsJXDZ2hIQLWZew0aGLesMpz/0lrh7W2CMWGIDQAVQH+X92eVm5yG0beQME0njF3bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFbK1YyA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYm+9ABf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFbK1YyA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYm+9ABf"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEax2n1509810
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=; b=KFbK1YyAk2uiYjsb
	uu4AAULQUxgDXyWgiaNDvbRph6/UlWZrH3ApI8eVIJgX9xdOnjfXfQksAuHcT+M5
	SVrCo2qhRrqADx29GQV37tgKSQaKNT2/6ixn+eRerddPtJhuBqsM38p/gyJZicai
	KbV98rVTA9AKoew+5fNnl6oeurINPpvoiGUy/NBw9LVv3lZYEG+5UuG6DcqchanZ
	WIKAH8hRtD0vKSSKgmKy0hGLT9FlPFdF9Bz2z/eFFCYGw2VqzfE6fF4DHRRRWRR/
	11wRy+AQEBf8gG1VofG7d+UpFSFFqMA+v2Q0HZT/IXT392so24+3NZO1vt4pZxX3
	eHx8Ag==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sbevmfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 15:23:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so82018185a.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 08:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791991391; x=1792596191; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=cYm+9ABfzKysX5sdit6u8MH4+Hgg/nFuEcroHOBt717trjsIiAnxop3T9FuxG7lmdq
         JCNUPrD0YH6Z25O7FXl0KCUirNem2MooPONF6a7aojcB6/kEbVpdkvuAxbO8jtioj2+n
         c0UX6mwDAOGftn+2cprXWzIeJ4Ns21mwKB5lq8qRHhC5U+OEgbFNToCk0VympppCui6m
         FcoyDV5ThF0ELabpmwdrCLpbGOOMiiv6xty96PK4kZZnIFBZCVngZqcK7ZDWz6vC49vl
         yIj93xQoHIXQB8EG6s4Skeofq6SSsGYvwBZMBy+DaJ1aOk7U5MBlnoCL5dwkJ+vjiud8
         Mydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991391; x=1792596191;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gKFZyYRMaW+yGT+qZVr6vtv3tDPMrkptapq2/kB3icE=;
        b=gPjmxQtttJaqMx81t9NuMdGWX2keK6eXMB3xXAkdsqcMN8uJDzJ3oB+fT920vOqIgR
         xR0iFeZx4jiqYh4n46ifXjk6msNQ6BzNa14QDPi7i1QNBF4FDHEEexaGnShFapydxn/6
         gfUoj50dhTChKrAX3ZUUYMvf9Kem5SJKkUA9RbgPCBgR3GY6Nr+ZdBmUJHm3/XSUXMPl
         dOt45iLQzz7egMfR3MIcHo0tv5nCPvV0xmSdD4Ikv/7HuW2wDfCFDvJaggfQOkue5s4d
         n/ul4oPzjsUfpspTCuvehZ1kAhILtbOIIONIoyM7GXSeTmAjZliu1OIyAeRjiqXrj4mt
         7qsw==
X-Forwarded-Encrypted: i=1; AKwUvBzhipnEJu4z54pl3w1F50jo/mCB+x+LONPZY2diPldzRLFtp7tlz8K0y2BA1fUZ9C7TgP4Yy8Df6OvWSA==@lists.linux.dev
X-Gm-Message-State: AFq9FYILlnpKw/R7aHQdJzYNDORxfJVjL/PuUEnBm2wJvCfC3Hab6c85
	iXsM80MXTmEP5MMMbZG0eig4GFyTDIgdDuHKQ03bXIoV7NUFp8kuHdy6v97DzIkVGNIRSdpmb+O
	Uu9CZno2lG0JhKymhovoetwJcEF3jQDWSd4WeEjkOaph/WYfRR+t3F8LBV+nKmSf8Wg==
X-Gm-Gg: AYBFou3qkqahCM5vsNLFroGck7A64KRH5OCYmsBSGcdx4btLjmBwHu+BNKBQUmirKKN
	rBBezEcHGAywsnNrv+kwxV5jIhmaAqrT1F0keS7wZxuwoJlXzMbSIxi5KCAafgX0lT45fTR2bHw
	MP7hh4DGNlrAG4l2m/hWcLP7bdeTfBthWM/RjOA7MaH/tpeyj2kXEEu5Fm/J71WhvYDXQw1mJrr
	1zQ1H3IdCNnDyXW53V9KxPjJPCyf3qLAiX2AT1ykf4nYlrQk2RRUdaABtU/fzZwNiywuW0GGbj1
	7LAe1BoPfOIC4FWaDoNmIHbaePEnckvUFwkk19Lb+khiM2tjMOSylKZFj1K/+8CquNHilNyKPD/
	YT7LU1sIUDgdy26SvcrMuUg==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689950685a.0.1791991390431;
        Wed, 14 Oct 2026 08:23:10 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2689944585a.0.1791991389881;
        Wed, 14 Oct 2026 08:23:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20383a22dsm1269905a12.6.2026.10.14.08.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:23:08 -0700 (PDT)
Message-ID: <f5062eed-f619-41f1-9e7c-71a7405e34ac@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:23:04 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
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
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
 <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
 <924134e4-946d-40e0-8d93-2951aafda4f9@oss.qualcomm.com>
 <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <555cch3ceqlonpp5xgfrtxesppxolhuedabmw3twjjfspyoj6y@in4qkpalmuwr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qmUKzCJWm8cyYd2WGIX03lds-ZgrR4yo
X-Proofpoint-GUID: qmUKzCJWm8cyYd2WGIX03lds-ZgrR4yo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfXzmy6dvLe+OH8
 l5ysK8Lliq/CIRoXMcs7y4HcjJoEMOZ4aOGagS+jy7Pf8BQEKA6gDv9HXpsayAc3VgkF7gMv/fZ
 ZTgkoKaDWk4pxie7aDiUpuggV7htkoqBEYivcx0/jqfIKniIX0JNGIPHDU+MdaNJgRwPRPcKU2P
 uliT+X+/vW2hYFePWNQEbLzoFYxORmm6Jvp3dVh5OoAnzPFJCPKYdEGrYda82ke2Tr8s92OXsKj
 sQEhKtugytGHQYDGeR/xzF4UHc32BW4Cs3xsqFWnKcffzKp/XK8SnHSdYk5lBC7WYdJMBk10dL3
 APuSSL+xAjo+76pELLj9z3OKzkdKFPRc6UOSvV4cxbIa+vxMNzW++Ku7frOhx+589HjW0/NT5UQ
 u/HQ0RJA5k9MKRgyMzaHiVzePREAbxi50xm1fxiZlL7KphNuYC71PuKSsrc0332U+iqof0DRnAp
 bwOLGiT2Rt0DfTvOjaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2MSBTYWx0ZWRfXyQMjI1Vj980P
 5u7UdoL2BnB7tm7ZOZ85Ew8ntp3YAtpxPHU21fPLXS37/jz+fOUYAWR4BfXIlYl6Uml9B/HyiLZ
 evtjH5AOxOMdeNnTrEqxLbwsWoyUoJA=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6acf9e5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Y8Q4aqK4LaMswZtuF5kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140061

On 10/14/26 5:01 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:36:11PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:33 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
>>>> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:

[...]

> Ack, I missed it. The price of doing OE instead of kernel for several
> months :-D

We really need you back!

Konrad
