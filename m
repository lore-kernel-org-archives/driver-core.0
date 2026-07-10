Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088835E95C
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 04:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783656700; cv=none; b=gxIWlWm+oirjCCeXmbmOeD6xRqeOHNPkHbVrIBHvTNiJU+leLvzIWtB8+SgnxyyeoItiW3aihoVL2F8QrhJVDpqFJa56UmzJCR6fQRSeOPULACMr5TmJbFaGlrKf1cYr4aMOhI3QT0hZETQKJW+gWbvU655nmrIDS3dM4go90II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783656700; c=relaxed/simple;
	bh=LfFIKIOcm55z/amtHtkeCs37XEJtSuSYSN8HZUHOrRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNQnROPnQmsL1mjTJ6MoKBq189gjGENcVrvY2zFJzNNorVlzVYA54loGxC4i37peMMg2r7gdDcGf+0AbmoUDtG1Nf42bjPogRcVpxsQa4pSVNFOZDPv0Y3+aaeQykNbheuXy966+AlPTEElSX3E1sC+Glblic+O/Rxt6BwW9RoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSyaD+Vk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijHDnptB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSyaD+Vk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijHDnptB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n2OB3661696
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 04:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKVns+xih/NaHnE7xaZ9w5LtVBrsREGYlKhm+lRa+Ao=; b=gSyaD+VkX2sfDi/T
	5hpsgGIUT25JEfmeh77dPtu+ft2wW6efCMtYviLn3vy2GHIh98iXNn37QE47P2o7
	hBCi4R/IOZSfi0VLkkk8QwDlj6Z4v8JBi7ATTve0uGnKKiDTpjiBTxvcQRR7hLhj
	XUlSHLvcpJGyOtk3WmlKJtxZV8ltBAyApMwzYhHrYRIGX2Bh8/p5czEIuD4VhfXG
	4CdBz6MaJ9PVLFwtnWAOEb25aKzDo+I6SJErXfzY/TPtVgEMdyFhWlwC20bux3uC
	rKGSzQDx9DgpdBB9qU6NSZ3Y2p0TmEPPZd7l/dYx9v6wItbdw8lWWFjw2eCv5LeW
	n66Bew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24tdpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 04:11:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c354050c34so8254985ad.3
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 21:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783656696; x=1784261496; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKVns+xih/NaHnE7xaZ9w5LtVBrsREGYlKhm+lRa+Ao=;
        b=ijHDnptBCurEcZ31mvzcLK2OT6xNntC3puuXQSb0fcu2fj/2hc22zD+PoS8z//BJHs
         pDcEAi/akQw1TAsZp3Na1LvAH4yPQKGyUAIBIY/pvJjaskA3sImjKQrtXDcPaAMPb180
         0DM92R7mMCa+mo17XZUNogUf+Cygvsaw0UBSLD/l7eOB+f8KDaKveRRSfvhKxldBOQd0
         MzKXuA+Sm4/VuXBjiCwDUPTHIUmut64zSVHG+biVUdztZ92Z6SEBVWIJRE/pKpgzWrJB
         nxqgDvYCmUPUQgV0t3QFy7zgWySGGAHAiMKXWj33kgDgRm7y5SLzk0sOvWCFa15DbdMV
         ZH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783656696; x=1784261496;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKVns+xih/NaHnE7xaZ9w5LtVBrsREGYlKhm+lRa+Ao=;
        b=cidLlDAvkRqkIFNA/ej3qsoh4nXkps9yL2nkvuQrj+zzMQEVw9Nd/5J6pUijq29hci
         nFTwlY2NW1DohjyNqoTXXkAXt+waFi9NIyTiFmDMREKfGVkC9QhQU6AT21hUQ2jcnDRv
         Hhyvqd2OESwmpHyD6JKjzmoAIVHlYNfxJG2QF/7io+U/M2LckxV6MfS6Vfewy3Yhsrb/
         E4JwcqsBuSfqbH5A3wyOPVGfVVgDhuAXIpq/6hlsMohYGhY41Q9O3NDIwq4GSSUNPA1Z
         l2cBAkBdkOI+yWKc8ake9cc5UeUKZsciy3bhBkbY7d4WlxXnxQCOeA6j5murHJCiv2ov
         58Lg==
X-Forwarded-Encrypted: i=1; AHgh+RrYTBggR9DyC1i8oN5xGjfEZznAZRTSso6uFUFkGbbZIOGVJ3tbblxAKeud4/Dgta30+PD0WWSZSMYEOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxum3EU6LgOkhQoH9zHgJoWEhsH0vL/8lUYZVOvOnI9gRBB3D9o
	xqdJ9lW34HmzBZvVJvU29xd5RpsKoFFAWToZCo7/YFCg/IFmMfOgg/18a5pQ/ugCkenPYFHEP3g
	VcB4BEjPorri7sTzwJaYNJHms7LAtnNn3kOVjmriFNWWrcqVHJILFDSnXxastbnR52A==
X-Gm-Gg: AfdE7cms+goY3N1kdCxe4Uj+I5sMi6KAajDPPgzuy8Q13gClymBG3oIMkoksPUXxgW/
	aCK2AphtCs+HJwBy8180X5GAP/M2zHrdLIY1kvVGeO9u4+3+f5gbX8O8hWI4b8SCbqNCPGMeQN1
	nzrfDHikoVoVpYERK0IKvrxy5m12vpnJjB9Yt5GIpiKMNmQAlsZhbbUl48QwdnwO+C+gComfDJw
	zyqf5bFwawP+pTE/iFKs7bA+NGcB76YjRNBDUEqEJGsPrCBhotEA8Cb9SCzXeXc6Bys3OrZqJOa
	Yin+N66hV6u7jxUZfIemtCw53QudXUdWunxRb51YRFnWLUeZtzl2e5qsIPJ3b9v74Yt0rE+MOg1
	dUrtkaw7ofAomYF/8vZT3fcIb516sH9Jj9rk3Lnup044=
X-Received: by 2002:a05:6a20:4304:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c0bce1eb1bmr11867077637.3.1783656696007;
        Thu, 09 Jul 2026 21:11:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:4304:b0:3bf:a543:e7f5 with SMTP id adf61e73a8af0-3c0bce1eb1bmr11867023637.3.1783656695407;
        Thu, 09 Jul 2026 21:11:35 -0700 (PDT)
Received: from [10.92.212.146] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm34378016c88.15.2026.07.09.21.11.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 21:11:34 -0700 (PDT)
Message-ID: <0e52adba-dff2-4cc3-a13b-758c8d92e60e@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:41:26 +0530
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
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <2fe34b3c-11cf-417e-9440-75a5d6e3f4d7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OX082P-p8Cm9dEgjUEn0E7ewC5VRIkle
X-Proofpoint-ORIG-GUID: OX082P-p8Cm9dEgjUEn0E7ewC5VRIkle
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAzNCBTYWx0ZWRfX6UEuq1WjfH6R
 95NMwG7t8esaU6OhT+15yIg8gLy98wtG2HpHL/QqtkhD/Mf8S1PZ54LslMIW9XqbnR4MBWZbkDH
 BY+GLyTTH/jYRmGDp8TrFAoSEynfGrw=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a5070f9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=BZ6NEH6zplJ_bYS8KZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAzNCBTYWx0ZWRfX4JenWA02Kim/
 hN5ybBidVRb4MEFK407KoKYskofb3aOTVAThEDsMSmQxnqNxa8B4jFgDLehmGFi5HKV9r1ykQXv
 jZcMRhOfIUm5p5+RBHwGMOedsKzBS070vX1JrKS2Y7kpF9gOv59WJPYxnEUmyC+tzWPmbxQ54ip
 QAerdZgM+vs3CIhNUMNWx5Ez7ovjLjb6Ee68UK4CY+A1FN9982Q9OToYIAzuyTVDzPLGLf1nzX5
 /xZSFgSLsViHlBwr/OBEKmd/YQTY/kUbLsI26+DJW29JgzT4Ty3FPN8ce2KSWFjlafzygVt7s5i
 JmmL2ZrcLmRroIccrK3wY62XIlUCB5bgfH8Cl6SMUpboJrwL/4DEpbhljIy3eNw7MEiGo5ljlfo
 jDwCbkg1rzE5wsY+cl1dpwJdr1nw1LPatkmSbnep/45pGJ7zoEfxQJ5gNx9LieiBL7MTWjmre+D
 wcHksMYFfHfudcWF2gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100034

Hi Mark,

On 09-07-2026 23:59, Mark Brown wrote:
> On Mon, Jul 06, 2026 at 02:23:10PM +0530, Praveen Talari wrote:
>> spi_geni_init() calls pm_runtime_get_sync() to power up the device
>> before accessing hardware registers, but never checks the return value.
>> @@ -693,10 +698,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
>>   		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
>>   	}
>>   
>> -out_pm:
>> -	pm_runtime_put(mas->dev);
>>   	return ret;
>> -}
>>   
>>   static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
> The above breaks the build due to removing the closing brace for the
> function:
Its my bad. It appears this was inadvertently removed in v3, although 
there were no issues up to v2.

Please let me know if you can add it while picking up this change, or if 
you would prefer that I send a v4 with the update included.

[PATCH v2 2/2] spi: qcom-geni: Fix missing error check on 
pm_runtime_get_sync() - Praveen Talari


Thanks,

Praveen Talari

>
> /build/stage/linux/drivers/spi/spi-geni-qcom.c: In function ‘spi_geni_init’:
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:712:21: error: invalid storage class for function ‘geni_byte_per_fifo_word’
>    712 | static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
>        |                     ^~~~~~~~~~~~~~~~~~~~~~~
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:726:13: error: invalid storage class for function ‘geni_spi_handle_tx’
>    726 | static bool geni_spi_handle_tx(struct spi_geni_master *mas)
>        |             ^~~~~~~~~~~~~~~~~~
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:764:13: error: invalid storage class for function ‘geni_spi_handle_rx’
>    764 | static void geni_spi_handle_rx(struct spi_geni_master *mas)
>        |             ^~~~~~~~~~~~~~~~~~
> /build/stage/linux/drivers/spi/spi-geni-qcom.c:808:12: error: invalid storage class for function ‘setup_se_xfer’
>    808 | static int setup_se_xfer(struct spi_transfer *xfer,
>
> and so on.
