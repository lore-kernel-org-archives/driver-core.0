Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C9C45DF65
	for <driver-core@lists.linux.dev>; Tue,  4 Aug 2026 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785850159; cv=none; b=RbHZ/SnmNiYFPZq7Lxm8dT/Bw4k8Jf7eotS0ip6g2QXWmikbXqN73IxnpJ8UskSCnfCPndFGOlq8Do9p6VsDvi1wbjotSWemrcDFmvH4+EoH++p4PoI6FtdlIb3JQ5Z1txlZ4MluqrqlJZ+K/VwGn2hJ/jIiguphWVHSzUP1LZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785850159; c=relaxed/simple;
	bh=LVdiZF7CvaM94iteidROu2BkJoAaGj3MZe4/m7jriJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOeaihTYiSN1V94oFQVcjNSPwFuVx8xZNdv2PBynBaVD0TSCjFY9fUzjbHfcPWF0OVVnqpmuwDA5kihgRlzQI1K11nBY8dx6ARB7heGkjlPy1aKlnNn603PXzVakLQOTueElFRUo5/VOeCcCXAbYkBdy+4e0vPFK7QC1WB5m4Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KpjlhYHi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NJhzNHwF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KpjlhYHi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NJhzNHwF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CXMn03829985
	for <driver-core@lists.linux.dev>; Tue, 4 Aug 2026 13:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yqNQQDZ0kzr9GItKVarNWHVJ
	LBAJsCftPb64wB9ngRM=; b=KpjlhYHiQBEYzUflzcTH0UJU2Jk0JttJblhgRsQV
	j1Q01Zofx3UzPO4kOL+Z7TWmB8Gd6PH9vfEmAOYtr1hWWXbn0iN+dmyWY+OXVsRn
	WWm3GGdZtewXPs6k7hG6DNKspzpFYUfZk9tCzmZJFyLDzw/wmEf90lG24PRSy8d8
	d2g/fTWTxvT43TU64WmjsLty8JWzajWXhus/bE9xNpc32L3oGHMCby9YrLENLk7i
	6bUTwOZr7Uezv4z6SFuh+clSrO84beYrtqtS24zpF3SZ1KBxMP+nb3EbmICEeWOx
	biuQiHrr59IwxLATT7l35V3aZp+ca0tOLFHglJNRL+tzUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty5scdey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 04 Aug 2026 13:29:17 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso5639415a12.2
        for <driver-core@lists.linux.dev>; Tue, 04 Aug 2026 06:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850156; x=1786454956; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yqNQQDZ0kzr9GItKVarNWHVJLBAJsCftPb64wB9ngRM=;
        b=NJhzNHwF+8K6QQgrLSwV4O22kLm7iyX2KQFyJxLEAzcG6H5tABqSBCPWE/eBFPzcQu
         kfTz2/L4+h1DssXLumuFMx7YHBv5lGmGbsorAn5d/F5WvcAHrxzzRkDPAD70bIPdFsr4
         yk62CxHvlEM6iyCx6UNENK8/PrjvqBIfqTWzPBhMmpeVnP4THbvgL6TCnUO+K+u8VqY8
         EhAQDXQY/SvTSPSzOHbNlV4DLn4IeSFxcFjJ/QEEQ1IOf2Hu0s1oHs4G0q2oFRS/bI2d
         AOkajvllpl5528OF7IbB6KxAtKaSv/95+qpZowC7cC74TKGUD5tQOrf35Yk1pPclinrN
         MHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850156; x=1786454956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqNQQDZ0kzr9GItKVarNWHVJLBAJsCftPb64wB9ngRM=;
        b=Y7Ye3AKC6EKe0ydkrxi/3qRAriWs4SkJx2qq+52DSUjk7vuyNpveS+decSPvjdwx4j
         O3GnygTVp7IBAIwv1xTjndM87+AFqkivLLd4ExeeuEOK68ij2KthEGLMUPH2uZZg15kY
         ffGPC0OW22Dfr7VuVvzreehvh66azBJpM3p8VizzLmSAEEamz+36pz3uMztmd6Y4rwPK
         yvJa2XIj8BnSBNyCxDuzvsgffGjYht3H8SEh4gR0+VKHKlpyKSETrI9z/Cq4P3IArd/q
         mo/4zCMQwelE9Gi4fOhdU/lGwHOCC29fP+wwKHdqOS+q6kCIEEpaAHUoyX1zaG8puzQq
         PBQw==
X-Forwarded-Encrypted: i=1; AHgh+RorhYe/9MQkN9IfS4pYvxxG/HhjRAe4e89P4T5uSrzSVkK5obWTMgPnTZpXucBB7zTcMCqJhg3pZKEz6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp7uZQrclhGJ0VtKbZmWkhEi/GZK/sugzeVZeJdR/ANA59bJkd
	5fwCh0rU/joZLcWH19TXtTFEIYn1nkxWO/GmRj60F81wTT35n4Ks2d0Pb3Nbkt9h3rR+8ZbbOdR
	0p1MdRS6D7Mr1GX0Ky/wR/kP2AyCQiwc3/8yp2BJlVcUcazeOPp+hUxIBiSx7E8ad1G9SxCQtqA
	==
X-Gm-Gg: AR+sD11HpVvHBrqzPARmUpOemvmVVJ72sSNE1Fa2kUeJiLGuDhvZHP9+EctHlz0RGBr
	62sPVnOfrLPfJrpBvq2izYtcft3vwMgYytNWN02OV1XD+wmPn2K1/WVBH3nrFBMNXQCf8/TDdVx
	sW3SIheM1ORfqdI16nUtrE7Yy8OIs8bnYt6BhjIDVUw6mvAKJrHIkTj2EYFIK8njiV6ZlbdSiGK
	0BpnrviIVkYmFwb0JiQtdAxBvHqBD3h1Tm8m//wMSIbNSmKDrlsV8wX5IYxhcC9FJDgfCHmUenR
	gv6XGIHEMwYyM4kajdSluYpBEU2LLBY7rWHs9AQmR6awX23XzBzjyuvwRUJHZnJ2kUAthXQdXCT
	Pu59dyC2W+CGHiVVVFsxxO+ubFNY=
X-Received: by 2002:a05:6a21:9183:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c92a89c476mr14560253637.40.1785850156077;
        Tue, 04 Aug 2026 06:29:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:9183:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c92a89c476mr14560215637.40.1785850155602;
        Tue, 04 Aug 2026 06:29:15 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586162e80sm5565206eec.0.2026.08.04.06.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:29:14 -0700 (PDT)
Date: Tue, 4 Aug 2026 18:59:08 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Anirudh Rayabharam <mail@anirudhrb.com>,
        Shuah Khan <skhan@linuxfoundation.org>, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware_loader: do not queue completed sysfs fallback
 requests
Message-ID: <20260804132908.oepyhy5g3bgzqrby@hu-mojha-hyd.qualcomm.com>
References: <20260716081601.1674470-1-mukesh.ojha@oss.qualcomm.com>
 <20260803181237.kkfi4mtmmd637e7w@hu-mojha-hyd.qualcomm.com>
 <DKFJ13ZEUX8M.29CDWH9A0OF6U@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKFJ13ZEUX8M.29CDWH9A0OF6U@kernel.org>
X-Authority-Analysis: v=2.4 cv=SPJykuvH c=1 sm=1 tr=0 ts=6a71e92d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ON1YFn8C5K9rNmW4d8IA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bPjIdjVlpCGVUpZzqIjYr54c9EX3yYec
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwOCBTYWx0ZWRfX1/up5CnOWprS
 iF5b4vlGwjQBtPX/W6WnliAH7kFdv1p8444/MBAueWZCqzL4kB7YShn1czFVye4Rfia2OG8dCyk
 ecBIjseMjeJ8AlApLfee5ugX1d7L1i1ujwO29L5LZdtxjMyNRTZ+nZ6KZlqLsGtbmQdRlPrUcfh
 7ccuevudQJzHaPi7R7fkxGnMARGXPs9AYsUxm4jsVKk3of/vLT5VjpJcbOIcXJN+/qG26CMT7Au
 qsJmj0Go/QygB/U2BiWHR8eMnCxzj9Ufj3U1Adz7IXFlPIl83nKCxBk07OvN/I4OzEMLksncOyb
 Ulj1Vd51ITt34KyZv8j9BrSAVU/hBruI3gKqlVdZoFfhWXRiqk6YchcaMTBpJK62SOV6wCl32T6
 iIPjebC6yGCSNPk24rEiLFYmehqj9pCFUAoLVsO9Io/3hEHt31c9gTyPpVMqpGbB0gddngJ2y1O
 gvWOpNLOLbjDECammaA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwOCBTYWx0ZWRfX1DGeTeaARX8A
 XRGvEwnv5e7F4YRWDV4KKtVNwYPiDuNSbJtGA5N5uBrwC7iBNEFfM283pOMLMTHNlKXQ1cW1ci/
 Aw81scz9SdGyCsq1ARxEMZ9pKUsnRPI=
X-Proofpoint-GUID: bPjIdjVlpCGVUpZzqIjYr54c9EX3yYec
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040108

On Mon, Aug 03, 2026 at 08:40:06PM +0200, Danilo Krummrich wrote:
> On Mon Aug 3, 2026 at 8:12 PM CEST, Mukesh Ojha wrote:
> > On Thu, Jul 16, 2026 at 01:46:01PM +0530, Mukesh Ojha wrote:
> >> fw_load_sysfs_fallback() calls device_add() before adding the fw_priv to
> >> pending_fw_head. device_add() publishes the fallback loading interface, so
> >> a userspace helper which discovers the device by scanning sysfs can write 0
> >> to the loading attribute and complete the request before it is queued as
> >> pending.
> >> 
> >> In that interleaving firmware_loading_store() calls fw_state_done() while
> >> pending_list still points to itself, so it cannot remove an entry from
> >> pending_fw_head. The subsequent unconditional list_add() then queues an
> >> already-completed fw_priv. Once the request is released, pending_fw_head
> >> can retain a pointer to freed memory and the next fallback request can
> >> fault while validating the list.
> >> 
> >> Only in-flight fallback requests need suspend or reboot abort handling. If
> >> the request is already DONE after device_add(), return success from the
> >> fallback path without sending another uevent, waiting again, or queueing it
> >> as pending. This preserves the invariant that pending_fw_head contains only
> >> active fallback requests.
> >> 
> >> Fixes: 75d95e2e39b2 ("firmware_loader: fix use-after-free in firmware_fallback_sysfs")
> >> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >
> > Can we consider this fix for this mentioned issue ?
> 
> Sure, how did you come across this issue?

with Kasan with some fuzzing.

-Mukesh
