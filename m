Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF6936493F
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385425; cv=none; b=ZjKBmOEa64KikZnxR9SY3S7ezWXo+RDU1za/uApv5AAGWlzoCJ/zF1OI3wF5mgkwsOvW9DZ7JRGUPxzvH3sid8zNPmij4vRT4NdJkuJyGFXYXgE7Q2zneCmJ9YKhhjcx0ogtBSizEmwTqdwgzx67CdaBmP2WKaBX8659/QkG/YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385425; c=relaxed/simple;
	bh=Rn8wHtCLMEv57Olj+9qoKpCygPJwlSOUIiqpDelPERk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pgu8Yr0XU/1S3I+80kXx2t4ZjriRMYIT/UOqOL7WKktzNyPZAzAuOaum0MbEUYfsFQ1LSPlX6cg0Qn0wkSsWaGaNE07GT5qHCfzldOCk63GsyMAzlUfKxC0rjPrX/dZizLznLBP7Bsin0beydlI0hr80NxuymUqydwqJUTC/V9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4QKlM4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GT3xf/aP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4QKlM4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GT3xf/aP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tndV1015133
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:03:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zEP0RLQ1FcdKjb0SaePafyEpkf9Bx0Hizh3a1ioi+V8=; b=I4QKlM4UymqKZXFP
	PKcF6zPyg9UbFQB1MYYkLiw8zjs/DVth36yYp6nHYC9Bsbn+0TT52kaJ8YyqGOnl
	9NkkemP4jZekyiG9CF1W5hMZzhvJ4A8UXG0WqdGInso3z7QaZr1eEtGNWNq9E8h/
	CRRF+St3t7p16Ku/zcj2rbMB10hgJofduwIhsqWlW1lHIrKM9/y+DKkTvnVPQ0IV
	AKomOC8lIJluZlqDlNOzkYzsIHIXy8pJwFTKjsvrhJjNbjaVtKQ9X7k8fsxT3bN8
	zrAGV2dl9nhRvY5kgZwuXr+v7cKFUiL7csF6Gt1Dfq/wAtaRt9rS0NjbZ/VFn6j8
	AJpQng==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdm95c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:03:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae405e95f5so21279865ad.2
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385422; x=1773990222; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zEP0RLQ1FcdKjb0SaePafyEpkf9Bx0Hizh3a1ioi+V8=;
        b=GT3xf/aPhsbh9RvJBMlG3Zibs4PYiklV3v1rI2h/Nn98t1n4jFAqwzrsuD/CaafTXF
         5JwBruVuu/IOEdZ1U37OkuAtgVg85WuxGCeJZ/OuyHKIxi7ODMDqz8AaFmJkmi3NlTmc
         +WWhTUFbBTs06hVKlS8EpX3ZJjnxsQ5yN6s87IVA6dBcJkCTTtPgfIYr4xi3D8HA+9dY
         WGlNZe6A7w/W77CCcOe1tDzzUhG1hdn9QYvsBUT//ZEQxPh5jGoRceNZdVR2GkZbwlYz
         GZd6VNxYzK+XmgqxQTOxD9SPAz1AaoJ7NgInhMR2kKce1ooBVFOfhaX9zTWR+FJMXOPy
         or8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385422; x=1773990222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEP0RLQ1FcdKjb0SaePafyEpkf9Bx0Hizh3a1ioi+V8=;
        b=qtr8BSs87HBHXnics1EXCUeXBEvsHh/90w5L8rRB0aJfXFL+uoTo4Z+tBjGaZ1N5o0
         Ijxz6HGsdxH33cQzGEoMOGa1uCw6lWF406+/HkWs+SAB3vvFbGkPDMIySqbzaplBg6wF
         Ol0FC7m9R5ICCRgS2gzEhoTelf/cQiRs1yKTDb+UAqxZhxbGIfAVKU+wqiLQ0IcjzrsY
         KC1mMkP7l0L+JM3wDql2BqJ3dSEQOaUzHq8w6CNZRLr90K6Yj5MKMiX2XAPHY79bFAgQ
         /LE/CuGeKdgRo1rsZ1VS08MI6bXVuJzKWk4sO/NLrV1umc3ZNynR+HA4y28eR8187vAq
         l3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVbP4/Zl6+m7fkX3sF1WNqoEJ0/0FxPcgvoF5PywAQJIFa1J1HirnuGa6om9KIB5SMf1mOhF1I1V8yWNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi4YqRxJwiwE76SW9zPYfRqL5dmYkQQikQeRRvxIUWN+BxiJTc
	M8K73/UNakaTO7h4jwTTSQF+c2GtiTKfd/Fb9DeB9eAdcvv/HXyvy2F9strDkUlOCFV8YbTrvDu
	j31yw8OjN9dYXGNkA/X/tnVR2OkaVzHT/2/8Hgcf9islHYowr859ZTT+gdIeNn//zgw==
X-Gm-Gg: ATEYQzwkkjwzKKbbaPcRy37KOS5tvRnmKaDeazS7Bbu+x1QO/GMm0IsaXSlM5kdh7EI
	eUsqdeikrWNOahDD9l+lkl6PReg49y6WKJX+RTc0Zrh5Mhd0WK9hgFa/Z3hwMPCzISa9v3Ab18q
	smUNKczP1sAK4MAs0dCQDiD1VK/qh5moD/CSep2oD3KObAzkhJ9Sr85+dRuQdUltSk9eX4sqmXn
	9odU8via+jmnxVcGxofd+EN+sKSgAvcReuNc+Kk1wKKKyjHv1xDOvnL6S1v47fw8FVFmKkA8eJ3
	a5rmnXqgEYf7BEyZbo//eXWPj34bgmzOGB8KBOpCVK84fPKQperJAZR1yTufT3TruCp2KZQCwCr
	nPcGEEXhye8BCuPs06sbu+194XK32/lcm5qXKMxSiCP+flKplrtWTjA==
X-Received: by 2002:a17:902:f690:b0:2ae:5a70:476b with SMTP id d9443c01a7336-2aeca9e0906mr22825665ad.15.1773385421940;
        Fri, 13 Mar 2026 00:03:41 -0700 (PDT)
X-Received: by 2002:a17:902:f690:b0:2ae:5a70:476b with SMTP id d9443c01a7336-2aeca9e0906mr22825295ad.15.1773385421470;
        Fri, 13 Mar 2026 00:03:41 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62d0easm15764975ad.39.2026.03.13.00.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 00:03:41 -0700 (PDT)
Message-ID: <54798338-83b4-4088-b2b1-52c3cde960b2@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:33:35 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/3] PCI: Add support for PCIe WAKE# interrupt
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij <linusw@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev
References: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
 <CAMRc=MdF92kriuT_-Fbk3pj6YeJiNv6RSiDE7aB0AKL9oFZg5w@mail.gmail.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdF92kriuT_-Fbk3pj6YeJiNv6RSiDE7aB0AKL9oFZg5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NSBTYWx0ZWRfX87/jmdC012YU
 +xhbxvxcMjTNfPQujWzJDbd+AaILV4Tw++tKbQUSuSyECZOKDS0fMuhv3dPRgYF31uW058kFezd
 kV8x6OTSEs3g2w6ZJoynnCqeSOZaqbTM1KWu69je+ISd6FXJWpxNHzKFLZkxeCYbAHeRyY+yuD0
 RCrKysXQ5DdQPpWWZ0LWHe+/eFgWJAD0ck+yo2T0X7fM1w23LS2eRnTa/BqTzxAzibW6cZwuY5A
 CsZEI1wBa2zeKMPOAzy4kRJ4klKoT3L8y2D4am7zOeQawwL0oGHnLaJCwRREgAT25ZSaUDcndAK
 9Ezm/mpAC/U0iaJycnjXUsfenoouywAvWyIZRjKEXTrYsJoQQhMifAkPT1jKBAzgQ4AEmdDi8Vx
 VBDLPGiawCoCLI9kI0252jpM4RCrnX3IqPzz6gvVq5hfaV2e08XDLts4cJSogTR9nO1E/hW5XUF
 LmBGdVNURhEJ4lbFf9Q==
X-Proofpoint-GUID: RIDxkAhx_QpkPsRSHL3Kd5amVnsnzzJS
X-Proofpoint-ORIG-GUID: RIDxkAhx_QpkPsRSHL3Kd5amVnsnzzJS
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3b6ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=s8YR1HE3AAAA:8
 a=XA70DKTrLd0yiFKK3swA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130055



On 2/18/2026 3:31 PM, Bartosz Golaszewski wrote:
> On Wed, Feb 18, 2026 at 9:12 AM Krishna Chaitanya Chundru
> <krishna.chundru@oss.qualcomm.com> wrote:
>> PCIe WAKE# interrupt is needed for bringing back PCIe device state from
>> D3cold to D0.
>>
>> This is pending from long time, there was two attempts done previously to
>> add WAKE# support[1], [2]. Those series tried to add support for legacy
>> interrupts along with WAKE#. Legacy interrupts are already available in
>> the latest kernel and we can ignore them. For the wake IRQ the series is
>> trying to use interrupts property define in the device tree.
>>
>> This series is using gpio property instead of interrupts, from
>> gpio desc driver will allocate the dedicate IRQ.
>>
>> WAKE# is added in dts schema and merged based on this patch.
>> https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
>>
>> [1]: https://lore.kernel.org/all/b2b91240-95fe-145d-502c-d52225497a34@nvidia.com/T/
>> [2]: https://lore.kernel.org/all/20171226023646.17722-1-jeffy.chen@rock-chips.com/
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
> This spans three subsystems, how do you want to get it upstream?
Hi Bartosz,
we can take these patches through pci branch, if all maintainers give us 
the ack.

I will mention this info in the next series cover letter.

- Krishna Chaitanya.
>
> Bartosz

