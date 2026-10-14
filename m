Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA363528437
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988604; cv=none; b=cCndG41G1mkLJDo0XBpk0yAXnW8EUwmzlrzlziZD87LzaZAdine9d+1n0wPpf8GR3sLvnYP/YxQIvGebqNHEahNRvrLbe1HjCd3lVBvSHNyS4/KeyGPV6DZO49rMBl1R0EcVYuMdA7untCS++m/V7Q/5IG5/r7zHHQkl2WYoN94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988604; c=relaxed/simple;
	bh=vcKFUlMHhzb4aWhwKFgdD+usZHVbdciqtOJ1LMttT9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SAkJ4hbS0zTFVdOyPDMLx3t1SOTBQKLdvxYEjoijJa222fSMTMrojiZMkt9r1hvsj/YIu24v1tTm8AOMQKdIipTLWkewdhDkgCZ/X3gKKw/OkDiNehG09W1YxHiAFsyG7fQuq2YvtJVsvPg2+BZ4HCg8cag6wMaE0PU/EnONyKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGrn/8JY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e+bdQYdt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGrn/8JY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e+bdQYdt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ECca2G2874361
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=; b=MGrn/8JY+3+qM2Gp
	T6czweznP6UkfQEiIZ2PHZWPsTiKPScMY/h53E2AuZVqUsuJOGuqwfL1bMO+1pP9
	YFzowEAcrVf1+p8KfYLhe41CFdR6Ff2wM3daFNRx6dEIQEYDLpqsmQm3eEF5V/lX
	8R3GwYVoe3AopBWl3i7U8DlBhRHL4zPjiwdzwG4J9MC11QmFFFi6hmKBoujoMaBL
	idQcLCjzHKVmHErLw46/7mLBWXvurW0puBpr2S85j0ot7F3ZFONo5wJBx8pHUMlB
	ymTWbND1uofE73G4gm4Unk5Lmy4eWD/oh9XZQz2xFOwLWFhw48VfElZMVGukx6XI
	rUSbaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphk1qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:36:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac58b24so53897085a.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988601; x=1792593401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=e+bdQYdtu3Q49Rx94B7+75JuSLXu6MrXBmZRDHUhXGKzGuGd/FhOYShku7x32Y98KB
         Z9cHMgHsBL7A8xn8i2tuiGIZOciNImpX3FjZ4ohLxWZzJFbugxDSG5g3Fm+1arMOzTgj
         jeYriuTZUraNx84GTJIGz5DnsyKO7xh5yg2w37NbPcZcedy+N6NfRlCCdw4Pgsx0+dw2
         eFDJbHQH7ve79ympw2gSJqkmc0twVq1Hck007PvLguFDNGvFLUDPi8OnL/XgqDMVvXXR
         9q2H9LgfX9Ts/zTyR6E2tcVEiDUuOlfwpTcuJkSo1AmboPkGbM8jLTgQNr7ARJQn++de
         ds0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988601; x=1792593401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IB/8dXjwtfDGBb987xwDsU6P3iiH/jaR6oo/R8A+4R8=;
        b=Kc6gHpm6RpACFbraokQAei2JQwzH1BRuFRIPLlc5bmkEWcEpzPm5IVKvSyFJJk639l
         Ez9O3cZ6Dgx3uyafxqkoGEqubnuyPCdv9Wcwtmb+BCSSyrvOk7kBtErMZZ93Kr5Gt/ZR
         qTFMC9H+tTQqJr91BIvml7W+JMzJne+6EupW9cd+2HpPxcbOEGoGcAEx7ECeqBn5VIja
         LrYOp+EdrVNWL6S6zQummi5cLwch1v5MKEUKD651YQ4C5NRymc1SZo/faaTvROWYbj1p
         WQlaOENkTTxbhlWTVkUXxvmGd9I+10/VJWy4c3mt0TRTX2kHPfSFbbcQT9Gcj2mI2rNU
         bVhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYBrWfioIVG+Kv00/NY70Y7tlubS8Vtn6Ztap6t6q7G2G/8a2lC/7JvyHZzXZVU3rymSNu1zj2B02zNQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYL6eGHvXqNQ9Wd+K+LlWinb97v2QwN4JjliCvrD2nW7eOGEpx1y
	5pt5xMauwQZS2gxofdZ1JWa7JSzWB+Ctq6+aaZrTxzFhQLuWw+hLJ77qJePJ/x7W2Miz3Zsj0XL
	Rbk4yQmKm/5uKDHsBJo7MK/+JTB1ig3Rl7KQKYnF5zRQuSckOArzMUcSqt2VS+own8g==
X-Gm-Gg: AYBFou2wsWsjwzxKVlELKwkAllLcxYTzuz+SKacX50DC/znK5l+YpBej4wTV34wt0UI
	oqNvJ4YCl+Wl3IIsAsCXDRWkStf8tZTKIsP6WWElT3SoERJvBlVy0NOKmGxPtYfbG5nLbXP6XLc
	Mf7UQursckY2hpVXcGByo7ys9pdf+0YaIKqE0XyZedh+ZsFd86LAKKB70Ne2/jcMLg899Gi4iD/
	/VWqrBaKRpTdAMrz43Ry2TCpakXEsX5KH/4WKkg0OAczrmh8+HP08WAZjLhhpPXLHuI6TdemT9g
	NRVvU1rCZxvNqhcKtwiJwIctlynCW4x9bKyXeLF5HP1+61lsQCWnj8PHc5HFYcyM7FqDmVXowWg
	1u4K+ILu8XEj3ZVYrYsShbQ==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793495985a.2.1791988600667;
        Wed, 14 Oct 2026 07:36:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr1793490485a.2.1791988600134;
        Wed, 14 Oct 2026 07:36:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf06e3sm361049766b.33.2026.10.14.07.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:36:38 -0700 (PDT)
Message-ID: <a8bdf3fc-7da9-4017-b61a-5b4f605ae0a4@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:36:34 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
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
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
 <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
 <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: nEJODS0IbqhONhL1vuOZOLuEQD5nvMkm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX4lA+20+QEt/i
 6eSO7cBs9aeB18ZES28kE2h4xFbRsvjnHAOFSvgAgnvohuiAi6nBNAAzVXV8DXtu4boEFivetZo
 B9SfeynX6ysqVwKblliLYA5LCVtnE5k=
X-Proofpoint-ORIG-GUID: nEJODS0IbqhONhL1vuOZOLuEQD5nvMkm
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf9379 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JPrUV6RX21cUErznEBYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX+KeUBPQ/XevH
 68vdTCKzoW+l9YQGrC0GLDxj3F5zBcl3KnbdiKMh4+ndOR1hVg03AMj+aOqluX+QDEqV/HusN6v
 xZR1KSWSY6EM1G457q20KvA3/A1zpxcXaYDDR1dLAQ4C+1Wa7ABkkLoc2Ts/B8ApLWYt3lTHuQP
 +JeMqKkwLkI4hN8IcW7UPjF2/lgTer/INZFh67WxNALhSox99QaDPhnbWVwnuJoR73Zj2ikct7s
 Uwup9c9CZ3mv3JM1Csh7oqnvBT+yFDaUkug60zEyKKpunk9uibxmu6+XiQvfXDi4YuS42U5FXPr
 fVE7tMPXzR4+WxCg8xTK4Idrc3N8bBZegbGdbfkez36XDZI78Oxma+iqftBXMNKqyhUO0vAT7zJ
 a66Gbegl34F8axLAcy/EcTgKrMA8LwraPRtltJPBDZGYrsPhdKQUOi7u9MO7/8GXsEinaNUF4+p
 FO/1VeASXUvVLEaQSzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140058

On 10/14/26 4:34 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 04:20:54PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Clock controller power-domain attachments currently become parents of all
>>>> top-level GDSCs exported by that controller. This conflates resources
>>>> needed to access or operate the controller with actual power-collapse
>>>> hierarchy.
>>>>
>>>> Allow callers of gdsc_register() to suppress parents inferred from the
>>>> controller device and its attached domain list.
>>>
>>> I think, each GDSC has a parent (in the hardware). If we don't represent
>>> it in practice, we likely need to fix that.
>>
>> The next patch allows setting a precise set of parents instead. Perhaps
>> this commit message could be improved.
> 
> Or the commits needs to be squashed / reverted. I really don't think
> that we should have a parent-less GDSC.

FWIW this commit alone is a NOP.

Konrad
