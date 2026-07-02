Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C534836403A
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 06:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972552; cv=none; b=D5NE2T9cGQBSxWN2TkS96X/MQZQloZ42Rcf2S/8sG+14WtRvHtA1TXzTbWPRz9nGywY+R+XdjIyl3C5ZWh274eYpTlzqKMgDrnHA93oDCaOfUw4H/u0U1pormLMs2C7qa6cyTXLfBMVGjywJ8scl45xJxWccEOkowpLIjpt9Z7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972552; c=relaxed/simple;
	bh=ABJeyst78FLFzl9Ct3p5szQOsed4/LKHB3A9jqiuHok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MA8xrsZLVIP5PxVmEQZqw6HV3Jkwx6jUYOeKMKNOKijHU1WuYiFlNju0iApkqdvviuH8JNkJlmyFlzZSMNNGC0Dt3NU/E9m7EKqBIWe3ST3EuJLVKDQIi62vumLwKxA8sIG+L4YGqosPoUD22LMFjo+5/RsJ2opdLKG00iwsWh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YF8umf35; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahbhKvUZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YF8umf35";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahbhKvUZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KSgx2957684
	for <driver-core@lists.linux.dev>; Thu, 2 Jul 2026 06:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z4c11rFRRdg9DIaHq3/L5hXGchxFnFdVy3MEIWfSpE0=; b=YF8umf350ugwReW8
	WLyKw1fYhj7iweUtFyEQGJfItQJwpaBqBEi8dPBk7p6eoHvNVqjHsFhFBaFz4NUJ
	mSvlqDFgnhiJtEsgZusvHdtSeU4hUc4ZQWdQa4rUx5fhLhPBqTy7ow7NkQQGU4os
	AuOXUNvTAKBJ3hDPRVCEGqb/pMiYJaLFNwdOWiW75cgf0f8fd9YxfCSThh3omQ0F
	MP5lK6PLNDjyWT+tOeBapcu6hHByLW7+15T36451FsT9P+TJ+cgB+l7bMNma/BBo
	cfMbJL+tuHm1qkJ+Yvzq/pG4BPDSd69MXJMgPdIoZEml8xRGV/vCEhxoatiUk0Vv
	gS8lcg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5630aqtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 06:09:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9960cf96cso22447565ad.3
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 23:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972549; x=1783577349; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4c11rFRRdg9DIaHq3/L5hXGchxFnFdVy3MEIWfSpE0=;
        b=ahbhKvUZf95iN1dCoRgpf3Vb5f022Ho1gOqB/bI45RjrjnWYp+KPdWBfOOoWgPYhBb
         8Irzox+/FsbVyJ2oXuCiT6rb4P+gfXPj5flyziJeod7jzS62qw1U6Gt/9fnG+Ew2ognM
         2fHlpfPKcL7/SF4nPIsm9zYM1Y43VzHq87vhhgb9s5dF3a2zN+hRG+rmUD5fZlLPXdU0
         kOmt+KMRkXXtOA1UBdemJzIWWB91ghxSKFNpGj1MwWwHvN03dTOt0jNC/6Q4jY1rqh2p
         btVskSN6EgD5rraQViTrP/lCTvoK4lMWoa8+B/Mds9tPUjBT3dlvUR17O0zPT6p2fGEk
         tuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972549; x=1783577349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z4c11rFRRdg9DIaHq3/L5hXGchxFnFdVy3MEIWfSpE0=;
        b=GxtytBtVXu6vhzWV8xtmXtTQqfDidyIRshkk0ybf0mJDYL5mAWe7vi2QGfF5PTviNl
         0g49ZQUNvHY5PEO4f94gAhRU+bQOj/9E/HqUI++3TrUtZh47dBdsJf/vAQle3f+1q9qD
         oI8oJbJcfJPG6eLi8XVzPbez3hy/r/2xqYHHc9mkW5E2nJCvvnM+1Jjp5iXgeIpGMIIe
         ZonRpjbdznwHugNk8HfSIrPVxVt6Vw5IPeBlZDijAxY9nw/O0BiyQwHSm5Q/dGJcKeke
         ZS3HehldsWp+H5cmzeBMeDdIH1RTrgRbmWLrdbvVIuYjD5OIAQE8cVu1qLHFWqA9RX1f
         rP3A==
X-Forwarded-Encrypted: i=1; AHgh+RqUOnHSBpvxLY0255QYedNSXDCq2nAfeg/HLiDhuoX2eMGFfKNEPusB8PvJFO/J4m/LUoHBDezeBc6j3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFmf26swVq3EwL2D39q5L1pxntW01efG2DQvcNMXORITYOu9RU
	bXvmo56vCdRQiXgcx6vR7mEBz2WIYRJEHmjv7Lmaugr/sIdEOMEwGCSwZERgKFr+acbJu6zpLfM
	1NB15HgM0KCUN6X21AICQ05MOsEsIfavS8jfmle8tMhhkw5mmHWO3VEw2CqtEszcMdQ==
X-Gm-Gg: AfdE7cnpxhDN5obBW4lK+zVvVg/73cvy+LDDqdSTP9rP3TiNmaBIZvXTOH7u1/rq6+L
	UdVF9FTdNQi6x1ogUHKXQC7VYUC22uy+8lACaG1RDgNspRLWVQAGuFKh8cIzUHMbkZrrYB4s4z8
	xyXOjeSCwM6u3VlkCAo1Znb7asz+hS30I9grVYtPmgLYQ4Xt7dEplZ/BazKHRUm7urwANpkDSGd
	CzK5FeeptxVgt7DUoMklrIOrVkz0o3pGZS8+s2GilRNYfxtl2s59g3319lWIiCy6rf22mRrvX0f
	7d9Uf9mYQev/Qwhj/CUuV4VGPqi7h+9LOOvoCoPtmfXJlvUqivmjAd/+JIpI5NvHSJEYdETDBrq
	S9c7OPhfmyRAX5B6wSDxgW3c5CLaksxZXQOd1EZTuc7cs
X-Received: by 2002:a17:903:944:b0:2ca:68b1:b64c with SMTP id d9443c01a7336-2ca7e75d694mr46456245ad.20.1782972549331;
        Wed, 01 Jul 2026 23:09:09 -0700 (PDT)
X-Received: by 2002:a17:903:944:b0:2ca:68b1:b64c with SMTP id d9443c01a7336-2ca7e75d694mr46455805ad.20.1782972548669;
        Wed, 01 Jul 2026 23:09:08 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:09:08 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:23 +0530
Subject: [PATCH 4/4] spi: qcom-geni: fix sticky -EINVAL after PM runtime
 resume failure
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-4-6ddc317011c0@oss.qualcomm.com>
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=1226;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=ABJeyst78FLFzl9Ct3p5szQOsed4/LKHB3A9jqiuHok=;
 b=pTmMgvbP8fxitvKl8gNaFpnEQsYhWQcIaXWMOE1lpf+pt3wEj/I/dPGuaDCXim6fhgCF2LWpC
 gUViEoKW7tJDmktroj3cQarFJG9LkP5v+iztS0gK1GCq18Nn0VBrgrG
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=JdiMa0KV c=1 sm=1 tr=0 ts=6a460086 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r-mwoWhorYt2bIR64zIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX+k3rmOPwsMLS
 6pZUN+O2liAqLRm89P+11ssnlNM1+Jm767BhmyMOTIyuzDVAsJc63RQPflGiifjG0KaAfm/RNg9
 G5g/0Sy4rdXD9j+2qW7E/xvNfQm2ZP8=
X-Proofpoint-ORIG-GUID: 5xkHUpq5I0KR1vCr6h5ZBbpOX8_cjLS6
X-Proofpoint-GUID: 5xkHUpq5I0KR1vCr6h5ZBbpOX8_cjLS6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX2CImnBOtE79w
 ZowmfVfNWFXUQUDWOvc39qEt1zMp7DhfBRDfzEIi6gCTPbldIRa6O3a9hqaGuAWzEu2DlPAe6o1
 4LBX/X2p9s4Ah7RBpxbC5GWptQwkmw+JCVbINKaeDCu1zl7acGoBsLXlk9ispfWlgpQc2fJtDFj
 PXE8Kz+085pYIjT+jHa1qFIxEqDb16Yaeq67T49cEJx/fANm3Uvpjc2aFV+cnkajDCBOcbcVK/T
 R8j3kZwtWCIBxcEVhwGmKMXbXjsxvjXvP2w1GZGVP6A0CYch3QqAslYmSRqGum43WXH0CNeuOxT
 L/YV6qEnZUDY5kDIx9OvXA4rdX/xVJzBz7uPU+DVV5mWC3gCD0LBX/TLyljHCpJRJCQ2XJ/lfNz
 Wwy+Vxk9G9gacGDRHWsesut36XPFy3779kkuBLLH1/aLVVom5IIy7swJ075TaUJsWNgApD+m4vt
 Ku9WfuiIHvS/ZrzDpgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060

PM_RUNTIME_ACQUIRE_IF_ENABLED() in spi_geni_init() calls
pm_runtime_resume_and_get() internally. When the resume callback
fails (e.g. -ETIMEDOUT), the RPM core sets power.runtime_error on
the device. Every subsequent PM_RUNTIME_ACQUIRE call then returns
-EINVAL immediately without attempting the resume, permanently
blocking the driver even though the underlying error may be transient.

Add pm_runtime_set_suspended() on the failure path to clear
power.runtime_error, allowing the next attempt to re-enter the
resume callback rather than failing immediately with -EINVAL.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a55a3afc0ebd..5f65e6d0d08b 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -616,6 +616,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
 	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
 	if (ret < 0) {
+		pm_runtime_set_suspended(mas->dev);
 		dev_err(mas->dev, "Failed to resume and get %d\n", ret);
 		return ret;
 	}

-- 
2.34.1

