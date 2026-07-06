Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DF5420898
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 13:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343073; cv=none; b=QfjJDHWSCcJMXVy2i+Iq2ssyK4zEkzfR8f03Y6wQ0nDxstsjQtAzH67xVltDv8ooyUQ/S0aF3uFytKc/OzEDPrDTMGWjOs/KCALKs3bNCriU7UIoOlOF83WSf3BTEJ2Oh74vyBsQna3ke34jsxy/E6Jx2Hy95ACK+e9sksLX0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343073; c=relaxed/simple;
	bh=9/7QPfKMTMI/CjWRhumszI3/aGbVFOoiMgVoaf9cHw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MZSlM0PTkN5NHpuXOVgcheJaIUh8L7mGrB6wc2+GM91t6awx+xM7Qf5qg7yB/cbs9yYsIH4RCDgqZT5YA5vWivPfHPSpLOO8B8exO8rXNbBXNJ3/NKZ6USjwzdTQIIngb/FohCCND6PUW+6GgIYk4xg1qEhGQG9ZTeqKSXoPgmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JapYqo/b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APcE/qZK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JapYqo/b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APcE/qZK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOmv245846
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 13:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pWsnU3ydAXBOIOITNJSSKAM8BpjQAyuQui8bRCBB0A8=; b=JapYqo/b3DOlXT5l
	YMkVOG5SkD+soPzoW2SxJcmivNrwV0JagYLz/i1Yzga4SuyiMddZ9BOzp9AY3VUC
	ZB+ETwaWTBYE6NkT8O6hB3MrGqkwoUBLOLV3OCVJvHIMk1sMG7WbYFJk4EiEDVMK
	A6oAebTAZ9ge/1H5uZTGMSAVfn5v1ItcScKJByUgdfAfZ5qsG6M0NjQbef4hLPlT
	JRh/wZ1lUSLTwa19my23fMtBUNR9r/eJrT7V+Q8J63mMlQIPc6TtTOmCh/ovCzRu
	21f9oUxvn8bpiG4mzCmDG9+Wf1njfa2eNPEuWfVhcHV8EBH/M/igw9ujOvGR0pl7
	y9GzUA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gnbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 13:04:31 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e40e60b1so143037a34.0
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 06:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783343071; x=1783947871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWsnU3ydAXBOIOITNJSSKAM8BpjQAyuQui8bRCBB0A8=;
        b=APcE/qZKqghYfSKW1C0SLnCU/eMvWClL4xNnMmeMV7Z1PEtzxqY4qIAt3ez0dFzfOs
         CaZktBdArOfdp3SiNDGQ4dK7UyiW7ys5eBTAXyGbVtTKWjzWxqIHBEVpx6tNfgAUTqmi
         mkMEmrazvbf6U7Kc077WnioDXyirYMVIHcW2rxu7v/bCbZEoI20qhcybY/KXgPmZr8ay
         1iOVhACEvqREApue0CWbDDkl+4tUz5k5jXAO0DeoZUnXkdtdw4xop0k6lOLE4V4K87wr
         gLfztUeCy7kUdMFfrVvZyiXOkhQPtgoGkluupMaDz6iS2XofJ/KKV1AVYAnIyCasSoLR
         B5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343071; x=1783947871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWsnU3ydAXBOIOITNJSSKAM8BpjQAyuQui8bRCBB0A8=;
        b=m2LtmffWd5vnwTwVNgU7i43Aoyh15TwFCRzdU0M0V5RDNJSgwunQeAS3ZFDTwmudMr
         y9MhlChN16imIQyeOxu0CtS4e6pl0h4QKYVJSZZfzxviZvJ7pYQjX2pedYqaGFQtAhS7
         Em9JFVk/JFoJ4bHihZ6Vi9YtCy10MlaUWJbbEcyvT95O4hRtkOjExszUki7Wx1hUSpnR
         NSRAQ4pZKXqIZmnpauh4roMtwJJZ7ixch9I0Zoj8Y1XhXQ4ruPKic6JU3PJshBRQOZUZ
         cPdm6+i050Uw/CaUsvczR3zH63WUqJLOUFJmXRURuYnrmVdZI6BEhmdcUBsvrhpim3cB
         4Iwg==
X-Forwarded-Encrypted: i=1; AFNElJ+TvOEZJPn5eHbC0kGWnPLrZEpkCCcPGj8WxUitKTrvzOcLph1Sm2UfH+Nh67HmensBS9b+pkJR49n6Ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKSkchnZzL+JHZ+EfmsxLEU120T7gNT3bLcos9sd8d2HZ32ykP
	rdXKDbHHAoU3TU+09R4iMBVCQYtavkQB9L4vqiP6T34NTp4xbwfb+XXEETiKwf5Kb4FARtzpxnb
	NruFJ+YV1WZVViQ3ovEYN5P6GW7t642TR1C/VQueJYljYFaAwYKzQM+/fXawSTvoLDw==
X-Gm-Gg: AfdE7cnufEbrYUk713O6YK7CoRhtGVQolNFz+6Ksrem3M43U5DUO4UOBD+IPTr2GfD3
	HRBy00wdHF9i+8tn2DU7ky+5YWT1fdfIax5fwGYWXGJPJieq7w6n4JajHUORq90lEEoUBTmCgmv
	WzOS8YDuXulFvtf3K6ij34dCUbN1YFfoXMfg0R2tn/vxhl/7UH/4OgiZKITBYyml2G2mdTp2tDC
	2XXwS7rg7kymiJJEsvxDOlMN5HV0PUy3TuLduowCV5cX3Plml42lHFsuW6anTjG4Q0AZ1CG2jec
	9zgedyaIkkKwbroFfwIxFzhLoS1F1bfRC4CHc2dFqkVILRDJ5163ToOE57QYeRI5G+2JsISNzjW
	FhGMPbdSl9KmA7UYRyKCD6RS0XHo1OD4Js+E=
X-Received: by 2002:a05:6830:348d:b0:7e9:e1ca:5316 with SMTP id 46e09a7af769-7eb7f1933cfmr4339358a34.0.1783343070013;
        Mon, 06 Jul 2026 06:04:30 -0700 (PDT)
X-Received: by 2002:a05:6830:348d:b0:7e9:e1ca:5316 with SMTP id 46e09a7af769-7eb7f1933cfmr4339199a34.0.1783343067095;
        Mon, 06 Jul 2026 06:04:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbef44sm4216078a12.31.2026.07.06.06.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 06:04:26 -0700 (PDT)
Message-ID: <b5b46eaa-a579-43c0-9e8a-31dba0481a60@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 15:04:22 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan
 <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4ba7df cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=p3Hybbcu0AkdvJTjDJUA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX+t+ecfjlgHnW
 9swwcl9m7u6DsxTCup48gxOJAIQDujc+FxNQ4eROirXD6laYAlkDZi8R+nNFAcuD+For5OTqkd/
 rjmwlus9Sk7HuipXUg/c7lVh//1dlk1f3Vwiu/tO31oKhfewBP+wbgc0u9RH3vl92KEr1oLFg0s
 BBqf/Y1OJCRLlSZt+j9cOLI36UVNMI8zHkl10BPL+PbSXaBked06f28NhwHQQp0WoefUURDoNLC
 2S6jCkZllx/+3Nq/cYdzLWvU1DO/K3W6Su3bflI2yLV7Yytx27AYzp/0O6CgJyxzwGcDo8Xmyay
 DuVNODdgszx6/vLu2U0exbQpQgj8hyKOxmSljZmfqpi7ku1FnCkSAXK9aSrIgbmhiVS6ubOsagB
 paZyM21enFTaEJNTIDjoDzm1xl/wq6ue/fkZo+ljlY5k0x9QzfitkUE8uGmAs390KTL8JkMrQT8
 vCziCjGkA6zGFZlpLSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMyBTYWx0ZWRfX1yj2o9HjzvlX
 foUOp+aajKbYCgPgW2CchWnACWs9YCVU4QcKH7lBSzn7VVvTtqxMqHsD568q8B/P1EeZD3L88t7
 M5OhJgBS1xOPIjVPGltlf0SB9RFb+xY=
X-Proofpoint-GUID: ssm4MN1Y-Vheg1yV8w2QO3iFLQoiBfdo
X-Proofpoint-ORIG-GUID: ssm4MN1Y-Vheg1yV8w2QO3iFLQoiBfdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060133

On 7/6/26 10:53 AM, Praveen Talari wrote:
> spi_geni_init() calls pm_runtime_get_sync() to power up the device
> before accessing hardware registers, but never checks the return value.
> If the runtime resume fails, the function silently proceeds to read and
> write hardware registers on a device that may not be powered up, leading
> to register access faults.
> 
> Fix this by replacing pm_runtime_get_sync() with the
> PM_RUNTIME_ACQUIRE_IF_ENABLED() macro and checking the result via
> PM_RUNTIME_ACQUIRE_ERR(), propagating any error back to the caller
> immediately before any hardware access occurs.
> 
> Since the macro handles its own cleanup on failure, the out_pm label and
> the corresponding pm_runtime_put() call are no longer needed. Replace
> all goto out_pm paths with direct return ret statements and remove the
> label entirely.
> 
> Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
