Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77F9233928
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 18:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780768; cv=none; b=rCEX7xd1QOr2XKfWkpR9x6TKCcAdz7+f/1UTDfPTkFzCgvHBnjqy03EHikicSC/nCVOcJHcn1JLb3DrxNZRF9UoD6Notp84+QeHCd9nBLA2tOExJa9FjQaHpT48MgyZdqcHt6DwFjWoqBt1sQucX2G1BEsTE3kfZ9ICs4DhKegA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780768; c=relaxed/simple;
	bh=EM8Bv87OIFJguwwPY10ZfMym8sXFpTRjNs61zBwmnjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPkhPbMCkMKeEQl6u8OoH3IfUt9fK0xWoqyZfkqjPjitZ0Mf8lsXUL8SDlYvi9u0XOORemaQ+B+0a38JVmxKtvMvjx8fNv7YJ0MCh3znJe2J3QaGd1mvTRkv2ESrFue2isgCSDq1D7LqWgOWtTsDJf3rMcnRw57TVghnoUyj3Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nU2LYnn6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H9R+BrZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nU2LYnn6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H9R+BrZE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673H6i8p1376775
	for <driver-core@lists.linux.dev>; Mon, 3 Aug 2026 18:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mPlb0aVawyNRxTjUskFJMY+N
	dkOvCMs88yfN4vm0Ams=; b=nU2LYnn6bMXYgEdd4bB6bJ4fqh2i8YiYZwiuNOz/
	u87sP58WTJJQUN6tLLlJsgQZJ1plYQiGbxwi4EStCesUJiMZDMjVlGwicnJQtRIA
	gGTWWGkCQY1ZWp+0WrUaPpjYYRQtaGZSL4p1kzIAHJfOhpvn7Daq1neAO1obpvr3
	FBAEXNa9xysg5z4J/T/FIig3LLwCN+DZmbn5llszkccPg1f+QjQTgf5JuNMlepzn
	jz/rEMeAy6iE1rzST8B2KzvSVzUPjpL2tRDx4QJyg4/SeZ9RJijyWIaZJoHktqlZ
	C0QAs79eIseSIybrZgnW479OCPN0FrhCLZbWEHISE220gQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r09q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 03 Aug 2026 18:12:45 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe62e01567so289749a12.2
        for <driver-core@lists.linux.dev>; Mon, 03 Aug 2026 11:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785780765; x=1786385565; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mPlb0aVawyNRxTjUskFJMY+NdkOvCMs88yfN4vm0Ams=;
        b=H9R+BrZEfRk9nqEAOzlnFAnjlwCrQQTfwW/df/9D7kXuN0wkIPr7OQ5A3dqIL6Z0zP
         xJCigFcjEg39WyGanfFBiyWZXTv8Bcmtb43HeOWUT2aKfyWAKnNmtwN7Z/iP7Y4PZZ/d
         YxtG8r7iKaI2eb+y8/VTFMEuYng35J8hOh3Idrv1NjVkeM2LjtBtKW900X25M8wN7b+Y
         /7Ii7worjR2rIbJLu5M9FRXc6JlC/BkkkigdnZ7c1KL7uz2Q/FLIT1A52MViJcYyiVCt
         uEf5Vva9EnSH/Dg6+HPxR+S6ZjgQQNnb2nKrDWIa2RZAbB0AQcqw2rhSwOSfH/v/wkiD
         NFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780765; x=1786385565;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mPlb0aVawyNRxTjUskFJMY+NdkOvCMs88yfN4vm0Ams=;
        b=odI9pkSYFvkr88sGTJBvriJx5Sz2Eq0D98jVNtAsvESoJSou03tqGBH/Zeurdl2iM7
         jTamlsOKMDZqNez4Dgg9Q5dyQ304I1I0e5Rh03wHVrvGp2ABAlX0ue8IMp2ngyXO1/zY
         ms3UuGaMNAT6xXIyJj/e7d6rsstsHTvBTnATVGpLGM+36TR0vV/AEAAdnqew9YAp4xz9
         SUhv4CbUpcmD2ohVLJy3WmkRYHyaS2UWGC4q2G6eJTzSDeuCiGYVkN9hAzY4JjkdLZhq
         dpRPo1XvppJIRV58qXJMihQcXUf9LgndWVMV6TTAiQbAGcBPUjMKcwiRNup4Hjw9rEHq
         hf4A==
X-Gm-Message-State: AOJu0YzbylJuiGhsDsdImL0dirq+kS5dumIIT7nfSpcUyZ4HUkIt9haX
	dFQb6uUceS2gvoTzycLKUVTepeBMlR/n/H0tHBY7DULww2p+focD4gfloWWu68XNJ1/1w191cQr
	DDomRdEtbnjoytdVHhUFWobq+0D/t5/68ctyZ+fKsUhrn3c5XjHSmhHCQXSp1ZAz5CQ==
X-Gm-Gg: AR+sD133D8OxSIEDflLSnL+ZBUr1ljX4FhWoQg4jLQcs5aBopOgDtwyYAMTj/r0CRlu
	xwmtfEGaksWwbO+R2yyBH7HLa+/NYSBnFGCJIfWOAYhOGyPjA8NigJVCJ6kgpkf/3vJMR0a/n9N
	v6PdFXKnkE+Q2ojJev9H9CxAOgqTUSYkzLCynQ/qubllLe+5cfsE1vPzd0HVOnby6PgFopbddCN
	UDz19hIXmY/gPhzPSfuW+I+Wrobmdq3iwO/PsVM1hgLiyxVIDYIsrgDzmILBaal2E8JQN1iTJbj
	8YW14mG97xEkJKqzD3zWBsCReVKhZZUtc6Z3OFTG3xIKnQumFIW0+Ht/TdR6d0OurNsBdRhsqRh
	mCyJaGnKlOjoh6RzUj1zdbGptj1o=
X-Received: by 2002:a05:6a21:e8c:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c92a519c72mr11541574637.9.1785780764620;
        Mon, 03 Aug 2026 11:12:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:e8c:b0:3c3:8315:80b7 with SMTP id adf61e73a8af0-3c92a519c72mr11541533637.9.1785780764087;
        Mon, 03 Aug 2026 11:12:44 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab143a7csm30046086c88.4.2026.08.03.11.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:12:43 -0700 (PDT)
Date: Mon, 3 Aug 2026 23:42:37 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Anirudh Rayabharam <mail@anirudhrb.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: do not queue completed sysfs fallback
 requests
Message-ID: <20260803181237.kkfi4mtmmd637e7w@hu-mojha-hyd.qualcomm.com>
References: <20260716081601.1674470-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716081601.1674470-1-mukesh.ojha@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a70da1d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ljZgLcC45_xjIzcJewYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2MiBTYWx0ZWRfX7GZSk48+ssSq
 PWBkPdAVaVSGMCzAPWb7zLhl7doCxETvx0xTszXF6nOaY9Qahi2yCM0JMiS3R/I8arfbNqJlmvX
 o51l8Rfcbb7OL5o4EHLyjzMjS1KHyiw=
X-Proofpoint-GUID: SkZzaCSrHDVQSEEwsTHF9wsh2wL-8bjv
X-Proofpoint-ORIG-GUID: SkZzaCSrHDVQSEEwsTHF9wsh2wL-8bjv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2MiBTYWx0ZWRfX7M/vw7hL6J74
 2hlYLuuyp8OYnPXio8+zzSd84gOfgQW14uK2zczpa217ctY7AIECHbenbmPO4OpSQKM5TpxHIDH
 raoINRtp5R9jF9fGWApzps+4HwULZntkOP4y7BZVuvRIVGl0X3pH1SceEJpai29qQwlRdbwRxMV
 IOejNPrjDnfogfThNbYyZl2QivgKimu2wB9NkOfphCiLVETsUZ1p8qdd1WZvYuqkC/0CQU+Z5ki
 yNkxQF3DzF285yikU0H6arUD3qprifkge6teHFATsDp8jxH8lnvFTPeIFmuffFFshUoqpyIDSbf
 Sn+fqvMPiv+QcnKRriGEjz/uH/GyDyy4vBK9olv5q6zVLlv0g5SNBF/Gdid/mXdNEma4/J325b/
 TpZdtzs5Q+vTcqJV8mTAeLkKXYYq6RGoSmp5Tk0yiy/V6KOolPX+TqPrJtSTLVxbZSzty2eRzYU
 iYGUkRwqs+exgMsnqUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030162

On Thu, Jul 16, 2026 at 01:46:01PM +0530, Mukesh Ojha wrote:
> fw_load_sysfs_fallback() calls device_add() before adding the fw_priv to
> pending_fw_head. device_add() publishes the fallback loading interface, so
> a userspace helper which discovers the device by scanning sysfs can write 0
> to the loading attribute and complete the request before it is queued as
> pending.
> 
> In that interleaving firmware_loading_store() calls fw_state_done() while
> pending_list still points to itself, so it cannot remove an entry from
> pending_fw_head. The subsequent unconditional list_add() then queues an
> already-completed fw_priv. Once the request is released, pending_fw_head
> can retain a pointer to freed memory and the next fallback request can
> fault while validating the list.
> 
> Only in-flight fallback requests need suspend or reboot abort handling. If
> the request is already DONE after device_add(), return success from the
> fallback path without sending another uevent, waiting again, or queueing it
> as pending. This preserves the invariant that pending_fw_head contains only
> active fallback requests.
> 
> Fixes: 75d95e2e39b2 ("firmware_loader: fix use-after-free in firmware_fallback_sysfs")
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Can we consider this fix for this mentioned issue ?

> ---
>  drivers/base/firmware_loader/fallback.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> index 3ef0b312ae71..ffe1b3784788 100644
> --- a/drivers/base/firmware_loader/fallback.c
> +++ b/drivers/base/firmware_loader/fallback.c
> @@ -95,6 +95,15 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
>  		retval = -EINTR;
>  		goto out;
>  	}
> +	/*
> +	 * device_add() exposes the loading interface before pending_list is
> +	 * linked into pending_fw_head, so fw_state_done() may run first.
> +	 */
> +	if (fw_state_is_done(fw_priv)) {
> +		mutex_unlock(&fw_lock);
> +		goto out;
> +	}
> +
>  	list_add(&fw_priv->pending_list, &pending_fw_head);
>  	mutex_unlock(&fw_lock);
>  
> -- 
> 2.53.0
> 

-- 
-Mukesh Ojha
