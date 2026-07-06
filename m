Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B224DD6C9
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 08:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328018; cv=none; b=lE1B8Pq2MjPvb+ifTv9um0SsKIz5/p6eWX+YYeO6nSuz/m3MhwS5j9ToM3UnXxNxfbWI+nbDdfqD+V1gLmmzeQPWVQAqosznNQIMpAixjzFJX7ngDRGzSYhWYlWugcBGOXmrOBCXJANFEpi+UGyltJ/eqtE3wDrHuxjdQoxbw+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328018; c=relaxed/simple;
	bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TEpEiLB3At0unqT1nelGVYjWVnBNUme1rKjpbktRK95OSGeQyXiVdS+MrAqJO0euOleHOBw6BlFgR8oMus63d9f2mwbqtHPTkoaWovsvYF1pecob0Slf+kxu4p3ztzaWIo9cRdEIojuJA9sarbuVgeqdvFGr9ZoAo+mVZnGOyF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f8rGe151; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BNqeKCwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f8rGe151";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BNqeKCwl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641TnE3470431
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 08:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=; b=f8rGe151LJsniXpU
	96LdGu/jqjnjIE9VAtNKvKoyKmLrJmqZkJyZsytDw52r2osPlT5depUOmREMAQ20
	0yxKLLrrqx1MsBAitZ6P1qKIARnntyqa/5RUsSF/yrnkGy8/JXXTCkK+0n4GdCjP
	oLmNyN1tgHbSqEy91tvmdOO/9drBRFLR7u+7QByjlAJzv3rgwBWefnpOxkNmL4hX
	ptOAFY9bgE/9vFbVTDmbb9UITNX8sSCc0HGZi0v66/EHFAOlv+XEZWkBUijWKxv4
	D4eq58U+J3g7iWbBvExRkbcWWs7qsmqmDTZuTMo9I00r3TrqDd0iGGwibjKHdZ5u
	ePw8pw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6txen8q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 08:53:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84622d6102dso3752333b3a.1
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 01:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328012; x=1783932812; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=BNqeKCwl4PcZCjGYjfHqq7JiUDLebdTKBe2jkZ1JevumtSBjA/jpEtKk/4JzGVKi5U
         4ST+8YukB6o3sDssHpXsKf4seEloCqnGzu9OmNkKxYgOv0qBy8dS0zxBn9u3dj9WpQta
         KY7dkB6Le8uzF/Opz4R6wwnK65pRn6JqvKwoY4uLAMg9fQmY7YbxHJC29aCEmlqMM6Q8
         G3xUN5VJ5qrmoAnblcbDvEQ1ZgeuBQXjGOquCFzEcyWcLH2ps7NYtppF8gXtICXgIddt
         3q03P8kEfWYhjYuq4j0LuVca78V91ehOuz+zG3MopzGgu/1B7M16VWXPS2dU4lGuitPV
         DTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328012; x=1783932812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=llpD5n1g0BP3K8wHQfoZGgIBiBrquVpV99c1m2b90NtSoMWqfDOEwDGMGe2lzBR8Ms
         +Yk2X0EeEHAyioliciJh7ODhkQg7PKcPZSX5daz/CXE09RUO8TfcZPxsYHbdVwvVXcS3
         hjVneZnOQwB5Fi+tGelzSsuA/S1oBLedVixeG1Fk97u/CSJ1ENSpxi4ww1OBcjQzbM/H
         pSVk//ODtuNnPZyTgx4O3xa517nq9OhNeA1iClGer4qyW8PXLDkq0UZUnBigQHHcyUFc
         PXZxGKe/xffEmq86BYuK6Womha+/aUkOEsqG+6W4KsXb1GDH5t3k8ibsDZk8U3p0toY2
         qvfg==
X-Forwarded-Encrypted: i=1; AHgh+Rrqn2iXvNweNX0Um3CAlH+WIZ2UsGEql9xBRSJjYd14mkDJrcZ7Qx/8zXieuxwq4ufQ+UVJvly3boVySw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzB3McX+kZy/1Bip4epomln44vkg89qDbkwbqqhe+eZ5DARkQL
	q5+Z14ELAmkxjWGQIpboHwDDA89fLp/FAfYvx+D7aEoTFGJHgh2fVj+PhGsH5EL7bTjhPg0+sV7
	WqojyzSQfDp2eGMmcIGZ6iduN5nVUKNHe7PvxVcH13/iDcyFK23nVQwCzhM3CdYyk8A==
X-Gm-Gg: AfdE7clitl1aEjtAaxWSWAnWGPYS95oBZmNoOu98+nuvMvlAsh1EshkrhxzvI3ELtZG
	Q844c6FQaAsL5kmJ3CqZt+uhy+Z5z/tiw9j8/LYpjz84f+RRnYuf20V4+LOnGCF8vWtM2wJ2YuX
	o9Fnp5OQYw6p3+DH5j+HPOGHtckcVK4IBJDpsKRvbgwZ6cNlADgMRl5H3h2Ze4iIxEEVlu30uUB
	E0IIzedHj0HP5RT8RE9rG5G+PmDScoKcMQjrUTxaDOm9eEae64/nnC7iRI6ktSVEdL9txwN37EO
	6MwmLpxYothAOVICq/ybdTIwnWfeZgZWs2vectsc9DhHKKZKVgTeco++IbehU1r92JM/nfb2PEE
	J06x8ZHdAZB6GNyPkeKZEXf2nMFgZyYmnFCnjFcZOry1+
X-Received: by 2002:a05:6a00:8d1:b0:846:169c:d815 with SMTP id d2e1a72fcca58-847f6fa81f3mr9020101b3a.60.1783328011662;
        Mon, 06 Jul 2026 01:53:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d1:b0:846:169c:d815 with SMTP id d2e1a72fcca58-847f6fa81f3mr9020065b3a.60.1783328011084;
        Mon, 06 Jul 2026 01:53:31 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9e12csm3411834b3a.21.2026.07.06.01.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:53:30 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:23:09 +0530
Subject: [PATCH v3 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-1-92feb5a7b926@oss.qualcomm.com>
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
In-Reply-To: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783327997; l=1909;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
 b=QFmAfkS9VAoslxTguMBvbNBSXqWyknyttP23vjMCsCwplLnXi944ZWXmo6yYFdAODXns3ZOub
 /XzkupnyRmmD+41Ciqz5xjENstNf0XZD0vQ5xfPLqFXAp5koTp4fuDt
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX+b8l+SHff4fT
 la5a2XPA7/QvQ4UGuW1Bsb0JZJjZoCJeOOPY8xj3rpy07qtX/TaDkrQmgxvyskuRO8hCpO5Gp5d
 TxVUJPN/9d/Dx6qtk183eo47g3o586g=
X-Proofpoint-GUID: CYKWWAHZRijGrzy4S-kq68Z436rlwBhn
X-Proofpoint-ORIG-GUID: CYKWWAHZRijGrzy4S-kq68Z436rlwBhn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX6dWwggBcAyRY
 azvdXJCi8lmqvqSkDT0MhSXKx92DdZd3BVpGxMs/o/16hQZUdA/Yd6LAH/UqD/r7eghn9OxrpBF
 CpqSx/3d9C++0im6sRJ2yFuDZRlDieOZePV2HwNKjYxMFzWTd2ygpDOevTq5Ipf+wMRQHgXiR2/
 oYiAR7teiIKDwZrV4dImWrpnO+uXCM1VrKERfqtjiqFzKLXBJf5scxIbXnOQXkqkH9Qx8bXvO6X
 UG8gLe4f6SXDePH4kpvmIXch7siwB8S6LpGdvcweOmpcRGkgY1Jjz4+OYaHtuk5WDI6QZzYNsvp
 Kv2gL7cg623tm53NCbSEjLabS7LoFweqnmgWRSLMB8Zail7ryy80Q51O7NV8wnAJ05k9EpZGqnJ
 cXJrOg9o1HoHP4Yf3tCdH/Qw9vQY63lcWDQhpCY7XBP/HiHB929Z28FdSANbZBqebi3nzfIHizT
 RvHn6t8P987cK87KPiw==
X-Authority-Analysis: v=2.4 cv=HLLz0Itv c=1 sm=1 tr=0 ts=6a4b6d0c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=TpI2hjkGOM-ZtQ_OKuoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

When a runtime resume callback returns an error, rpm_callback() sets
power.runtime_error on the device.  This causes all subsequent calls to
rpm_resume() to return -EINVAL immediately at the top of the function
without invoking the callback again, making the failure permanent until
runtime PM is explicitly re-initialized.

Unlike suspend failures, resume failures should be retryable.  If a
device's resume callback fails, there is no reason to permanently block
future resume attempts on that device and all of its consumers.

Fix this by moving the power.runtime_error assignment out of the generic
rpm_callback() and into rpm_suspend() at its fail label, where suspend
callback failures are handled.  Resume callback failures now return the
error to the caller but leave power.runtime_error clear, allowing the
next resume attempt to invoke the callback normally.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/base/power/runtime.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 335288e8b5b3..fab38bc98113 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -469,9 +469,6 @@ static int rpm_callback(int (*cb)(struct device *), struct device *dev)
 	if (retval == -EACCES)
 		retval = -EAGAIN;
 
-	if (retval != -EAGAIN && retval != -EBUSY)
-		dev->power.runtime_error = retval;
-
 	return retval;
 }
 
@@ -751,6 +748,9 @@ static int rpm_suspend(struct device *dev, int rpmflags)
 	dev->power.deferred_resume = false;
 	wake_up_all(&dev->power.wait_queue);
 
+	if (retval != -EAGAIN && retval != -EBUSY)
+		dev->power.runtime_error = retval;
+
 	/*
 	 * On transient errors, if the callback routine failed an autosuspend,
 	 * and if the last_busy time has been updated so that there is a new

-- 
2.34.1

