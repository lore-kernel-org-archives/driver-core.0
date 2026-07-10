Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E0C3DC4A4
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676629; cv=none; b=ICBPESko4Nr9DtRJHkXXWXZPuYI7Nm4YHxlEsFeQ0HhAIqusHs8JM8ezFdqCGp7XNXTGVGn6ddvkhU+R7HDIUptn9iwUIw4E89Sy4XSH1/PNWAZBIS61LCc6rKDlinTQaZTTXmixhDPE78tL1f1zdpZmVjqfeqWKvOhW/oghvOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676629; c=relaxed/simple;
	bh=DNEj/bYxVRNoGmGDSfuPj+SgpTbOc/y+W9R3xVCwfPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iysz4kvRCDuMlioouQqbro8zMhE0M4m61i2khOU67TlbstGM0xuO3w4iTGRnKz7Mp1J/JH3yux2k8tBBv7ky4IDidIdNzrncggFOq3O1U881cwctZVbwSK8wMQ0jdJULwYDuQVF6Gp57z7TbK8iEaGZX63X7Ueu4+KVdbIIHvMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKv35ZI+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XpfGLTNA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKv35ZI+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XpfGLTNA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A9ThEu391398
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 09:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YDRs4cZXDmmoZvoqPlGbupiGeT5hQWumLyoKKSvxvvo=; b=FKv35ZI+yER7mhFf
	0G9MVvzDZC3HF3DlWssBkB1aS+VdD1ZOnb13dmcTnUCOEVnWi4B/KiiwQ8sZdHbo
	N0adpdcoNVv4g61+jtfpLXwAF5kGIRhe0fdlF9o8K+AIvutsjxcBBxdapKIvsqBC
	qVijZ+/VN7w9d9ho6yygWyNzoE8t3WSJg0gxw40+ccBvwyOb9CMqO8u3Ot8forAz
	e/zDRyx5Msp11zlzOeGOSkhRKgQDgkV7XA5+bQ53raqJbOXxLyiD520dH1yVNFRM
	rCf2l8Rl4gesAhiqU3H3aUKEuNth8jFi3T8kG1QLe45n1ZPVBzJVivHUXx6RmJLC
	FtRhNg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5f81xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 09:43:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dabfe0f80so717264a91.3
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783676624; x=1784281424; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YDRs4cZXDmmoZvoqPlGbupiGeT5hQWumLyoKKSvxvvo=;
        b=XpfGLTNAv0Y4XAQZaK2g9Ak5yxp0Yn67BWELHJYijOf7gEmWFgEDuswgUI1Gn4v/Sb
         wKyXniavcVxvnPy5pm5etxYakKQ9uxksfyYXFJkHBLj8lL7R75ieew/w4uStYERD9gS1
         JTG/6yDZAExVequJSP/mEP5rsAPWy4nqylyj2z1qhhDf9Q8OTwd9DvR5ZRhGJkLX7wAC
         Yeh+5hmpsUIKPW30nU9LjxxjHGhpYh8ZEbhA2ny6/z4faIF1aa5R3JUHaBoHbo4XJWS0
         8K3Em+30CcXIQrvXMoTaRZZ3znDiahi+XkKqRAKili7otrBa/jFaubDk+/b5bQS7ABOH
         VedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676624; x=1784281424;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YDRs4cZXDmmoZvoqPlGbupiGeT5hQWumLyoKKSvxvvo=;
        b=RCI9Wty2ByHqo8/IFJ44oUc7ykjo86TIvd43beO5nq6OJenZ6DfQWZVGXC2Z7D2s7P
         2B6lclQD6KHUcXxZIo3C0OfOREq98vM5H/ZdHxKlfYZJwztwwMQs/roLfFTkB3QChhHO
         f1iYCOK4o4GgEwGnDpEMLRqcfcWAQweR57hK5sbVMq19cZ0bQ9TSrJL5Ou+ae4Z2bjAK
         lO+X55PrxvoQ/w+kvD8OS4o8ua47MZg/8r9xS0w6Z8gFjSYLiXqgUTz2NQr+xc8MMtd2
         BKloLcFmvb41Q3UDApdEku1V2qaRSWx4QiBYcKiNUk/1qfz2iFaL1ZNDhF9Hq9lp9xf6
         +9iw==
X-Forwarded-Encrypted: i=1; AHgh+RqcD1qdW7mmEMldaMddapNZi4O8NKq4Hov/sLibyrf/rnRs7eLIAktysrWLilCNBgdh4PWePe+tHR7hYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzC4KlaIawR8n54BARN1PyTY8OjLIGCAvo3XgHi5KQqkw6ySk4f
	vI/gHzoKduKxRmJCr/eHdjUm2NkXbzQcZMucjdhH9qrf+/oy1ePi6q2jHbWKZXIs/tLyMal5S6F
	v7dAD8v/hasgyAhANkfQUAY5tVAYbAeR+sO7n5ZaYovb9Bt1VcIQ1StNCCngQil+OuQ==
X-Gm-Gg: AfdE7cmoeQSn/CjzcOM67ZO4PfeBxJmpBbjKe+uGeOvmjGw+8zvK+eeg/x7RL2oHcj6
	fF2MDL2gIvKxhz8fEtoBqGmewRPaOMXzlij93PHZ46+qiccGZ9C5zg9ZPStDEZ8oKdI4gyIQm2z
	YpGR2K1WEiocz6BRP+3aSSWa5Fau4M+GzMn263sA99+wU5SZIiPiKUYlCO4mPrHCX9zSFRQRHs7
	UMlWfIC3nLQkkCZNqIxWn/e/rpTz3bnzuO8ibj0r9TTwt+9ZUQ4BkxpsSicizIDjCnILGeQ4Hb1
	yVXIe0z+zGZYCL1TVoUVnv2RUC69rMso/a8/cnEbSrf+ZoND7joHB3ULmZMTbO6hMLMyOMT7lmI
	ZN83wGxDRsmnmckoh9FaFZC9fb1R8Dy8cGpUim7dL3Zg=
X-Received: by 2002:a17:90b:580b:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-3894239bee8mr10959546a91.35.1783676624208;
        Fri, 10 Jul 2026 02:43:44 -0700 (PDT)
X-Received: by 2002:a17:90b:580b:b0:387:e0db:3faa with SMTP id 98e67ed59e1d1-3894239bee8mr10959500a91.35.1783676623644;
        Fri, 10 Jul 2026 02:43:43 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm5176800eec.28.2026.07.10.02.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:43:43 -0700 (PDT)
Message-ID: <a9f320e0-6a72-4e93-a57f-675fbf5d51d3@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:13:33 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
To: Mark Brown <broonie@kernel.org>
Cc: Dilip Kota <dkota@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson
 <dianders@chromium.org>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
 <2fe34b3c-11cf-417e-9440-75a5d6e3f4d7@sirena.org.uk>
 <0e52adba-dff2-4cc3-a13b-758c8d92e60e@oss.qualcomm.com>
 <5a1dd2b7-6e26-4806-ba71-175b195137d6@sirena.org.uk>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <5a1dd2b7-6e26-4806-ba71-175b195137d6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a50bed1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=h6hYde8dkmUs3SIWvWcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: TlpKxRsSOBQs95cRiV2MmHJZyjpZMyT0
X-Proofpoint-GUID: TlpKxRsSOBQs95cRiV2MmHJZyjpZMyT0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NSBTYWx0ZWRfX3G6kDNYI9B8I
 mUXnaumXygdKANmQZ4jdiA/Mbsw/GD/ZJcU8/fFcPdck5eXcus0vnTBrqn/CJ3FMeFTPBEZJoFW
 SBDP/PjGCR4zfNnFKpwiKU2Jdynu9a8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NSBTYWx0ZWRfX/mkypoWYIl7S
 yo+lCxI1TJ2ZJoBh1AlGs3m8Zl/8jyVT0lzl/m6xyQEnWeUeVQ+LYURr9670pTJAqAZDcAviOQ7
 YjRm/xjSRy9wqwBA87qT35rBzY+qCRJjQVdaFbx1haHcOBp+jRHgIXCRN3BdKBBHVhVcSqZ6+w/
 6nxrn3+MAp8mdcEx2q6MUaDB1oFsXPk+qMWVKqMQryyOpaXBL6Z9yUiJcsHrBOFoOSKPjbLXggE
 8w2dtVl9koenUVu2YtAcnN9fXzcbVIiBO6vpXQXlPUx3uDkE6d5ceh/TiwKfFgT924p5E3G2o1N
 TercG6S3IUThzPi8Q3XbjkiZg0gyKv64M/jGbk7ET3s521s3cizVsSz/5vC92KSiWhSJCH20ykE
 816z8VkxcIqNbWZ8TP0eUylEkUtzW8biXLqGDIZ+Wu1WLsl+UWQv+wUWue5/S+1fnqJ3hNyK9SM
 jmJNY/dVIEUoYFZtysg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100095

Hi Mark,

On 10-07-2026 14:53, Mark Brown wrote:
> On Fri, Jul 10, 2026 at 09:41:26AM +0530, Praveen Talari wrote:
>> On 09-07-2026 23:59, Mark Brown wrote:
>>>>    static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
>>> The above breaks the build due to removing the closing brace for the
>>> function:
>> Its my bad. It appears this was inadvertently removed in v3, although there
>> were no issues up to v2.
>> Please let me know if you can add it while picking up this change, or if you
>> would prefer that I send a v4 with the update included.
> Please send a version that builds.

Sure, will send latest version.

Thanks,

Praveen Talari

