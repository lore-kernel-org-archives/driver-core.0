Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC2A3FFFA4
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678392; cv=none; b=n/Iq6HaC6EnYfg/qMdy54KiFKHHPihG3Y1IQIImvU8uaSpCSDOu5/W470WFeGyD2UnenOmBfNgT3oeti67fXT9H6PBwRD6Cebl5LrLhoiV2kTWDGANlwIEM3w7l9lv3s8dnz/8BWlqucwQbrrjGRWCD6s86En/OV81XGGShfVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678392; c=relaxed/simple;
	bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=px9E8yTWutSDqVo7AifeeN03Cb+9VeNqtrJjXs5d/zYA1RxwumTntykXn9cHxacVY2yDN1Wv3n0gtabycG8IleFXD85NOM9zBzMIra5C2QxuThad7svD4v82Md8C1SseiOyp8lS+0Ks19jPv46fV5+Ijf/9INEFqjOSTioGYY0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvQhTW5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FsOd6sMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvQhTW5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FsOd6sMI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eKwE190764
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=; b=PvQhTW5/4hhjrrgA
	97x8FdCr98oqEst1fYU3R2AzLlMri3EztcmjXQEmfP9rIXZSoCXJAEmMmmNk0BaK
	GgrLTOjooFFW2+YRRaQi8NENS0KwqtQ28HQQa6yGLRzQiOokZ74boC0nvUECFYXF
	W8v9oOkFArWQT2Z2HztJzl2p5NbYiL5RyKxKH+lJ0RdV1SBbD/QOKwqGl65T0Kls
	1Krp2A1+TqCq6MjYZWqU8ZryHFjAxK5RBGuvybVwiffXhnyH0QB9cLC+LgJxkVfB
	DPYWn9V+gh2Ri1TRSKhYY92rjGr/tfN70eTg6NeDflXCLd87ew0m9Sc6z+lGYdtY
	BA/0xg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n1ch2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84854c2f888so1515529b3a.3
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 03:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783678388; x=1784283188; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=FsOd6sMIHaZAOfLmZc3LjDj3GMq2G2D+0LENdDFhTIqCIo47hxKHdRIicjT8exja6w
         H+zwp7O0HtDWtDRjf3dHBdSqqbG5Z6DpMEbrrtJIDj9LYac9c195zk4Tqy/W80/jgMqO
         1spkhgjbmhEHc5sdnW1JqDeXkWcdyDoXrznVPVQ/6kszHfS0Xxs9m/hoqpygQNLa1HAz
         NABFGLZKAOOmcXD9IilBm3zh49znhAcMG1kGL+DhTigr6uiMbo3HtsBJdaGBYYYwW3GA
         yBNOfPKCaDDOTO7vsFi1gz1L7Arm8pvlQ7X8lOkqWoftXN2WdTOrLJ2YoISgafOpSQ5z
         9r9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678388; x=1784283188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzbP8oJYA7lcUAvmgkMoQ6cRClvc0YKd16KRtgIXt4M=;
        b=MWqISoFQjVnESoE1n0WCl5Vc8PNX8J7b9zVGRDaZJp+jcmr9La5+h6f0pK35/vO0+8
         mqXoTDky9MAsD2p4/cVx34jUf6W59f3ANzOl/AGLXeFDTDxYf/tgnwKA8gWJthOLoTe+
         e6sILJAOFlgv4FPsoZvBIJk7n8dGE9jYnIoO0tZOBl04eJR69qxHzHwyXjLuWILAj+9q
         DbzOmSTnXVR4tN5zUIXKWqmo4cGtzQSSTvC6u9qSKcAv000OTeJ8VPcAffzcm5kUX8p7
         cdmy18H6514gGdEKsa7p++IWfvpIaQVsqhKNNgztEnqnC10O4JQyp1vR9J8O91eyzSKm
         3MAA==
X-Forwarded-Encrypted: i=1; AHgh+RqKlEL7CHxeljyijR7xAX0AIy2sWUoiCrBiHwGrFgFlHxNMlX28ySgW8VtaRpz43nk5ikwbWKlZSQHujA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTlFUgp1X/zucs3Gs7fIoi+zTGYqKOfCuQArtgiTZZlhoDAJ8Y
	ZLskRiMK/7X0rqpd873k1DsR/0UYfbmRv9lmVq+WCdTK8d6TSK0Y5zYlWl5wywhbsv/WlGD3/nj
	1KpziuL+65S4amMAnU25vMdHisyGBz4PAnVKFAciOqxoHFhEJRak7taV9Kkdy/kLz3g==
X-Gm-Gg: AfdE7ckk8Umnnj9ZDr7MnC2sjlN9goi4gorYeLiFwFTLTh/cJ5f+FAEi/YipXt+bP73
	SI300ut0lR7UpyFb/L4s8VwLL9Z3Dl+HbxzIf+GkcDP2puRo123X++IlYAyD+AtCh8PBbhOcVHp
	vGs3g/DBUZPC1RFnzRYauuhs3lhEewCZkqEWFp8Am5OScdJ5CqwBn+/uOlLyBtzmJa1zMqUMMid
	cG+XyTSxU7mU4Gh4kA3xuljRdPtwLh1DisgYtzcXiyL7SuiDIXf+69nZdwpSfUnEppvV+KOYKb0
	CVGJtwab0briovBtL53pQAFQ6PHhOX1ivBUo5S8kzLavyCQSQPbZedHDfyMncrjydcvB/5QJaBm
	82lgBdSHzZeXUkLOvFywKh3HG5E0scbPHrGwpzXyap+A3
X-Received: by 2002:a05:6a00:288d:b0:848:804d:9c5c with SMTP id d2e1a72fcca58-848804da18bmr438267b3a.38.1783678388541;
        Fri, 10 Jul 2026 03:13:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:288d:b0:848:804d:9c5c with SMTP id d2e1a72fcca58-848804da18bmr438231b3a.38.1783678387676;
        Fri, 10 Jul 2026 03:13:07 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm9977815b3a.46.2026.07.10.03.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:13:07 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:42:43 +0530
Subject: [PATCH v4 1/2] PM: runtime: Only set runtime_error on suspend
 callback failures
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-1-be81d6c15043@oss.qualcomm.com>
References: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
In-Reply-To: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-0-be81d6c15043@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783678373; l=1909;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=fp61jno8++niFT6E61fh+qdDmseCUv/upWK5jKW9rF4=;
 b=GXSYLi8r438TIXhUlxg8cHoKyYWoGVzcZUQcWC2ddFq1Wud8IbjmowbFPWlatss/e0WWZvCUa
 nMcPZtXkklCDp/PDbkouYtwW0n6usAERIFxGeC2QhTHh3bnb3YoVwj3
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfXxR0nc1xQ4Asl
 W1lWRHXtRUYVsJy+ThSmsHZjUirg2W9XEzoUrWBEjixAfd8VKM1nnbkDEMItXx9Jc4brEOC15kI
 ZDTgPIuy3CpcOsf9iQblOUBGkIxLplo=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50c5b5 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=TpI2hjkGOM-ZtQ_OKuoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: wIZOiQvwD_4tWwOGcstvf6HjO3XJU7yV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX3P2NoFvkSmqy
 5t/0W7Vp83lA9wfu6ZzXZoZHT94HBJ0WNY8QSMEgsOOGZmC+yUhUqFHO5vdN7eqsjKmb7HopWDN
 Jb9HksgyS9USM5QhN68utYmaJxYrRYadYpHF/kHbjnSR1KDo3v4ejHOkwmN2F7fcSQIUj2ghf+g
 mvm2N6JhDnqz1BmAbw9EFPLFleEnkM3+BfGl+Tbsj9zFOupU9d/+feQBarIcT4p1+k1X3Ejowaf
 HTVV1GFdy7A3TNdBKgF0IGZHOibziBBoaTsPlFcBArN4QXb4TO7u4AVTlN4Uu92zE6INHMhnql/
 LJ6UhB4IvV6PjlYRNaZFYRd/Imj7gcbh/Q8qKq5JsanHWeH7C9ivBHAhFogiKIPLxczdjC9clAo
 hD2KQ3Mc/ow1FuWQw7w//tn3YTBTPhbX5VK37SLcm9b+DJ76H501xVY2nAsfmH3OWZ9faVUfTQr
 oPuIn16Q63NPXQjtD0Q==
X-Proofpoint-GUID: wIZOiQvwD_4tWwOGcstvf6HjO3XJU7yV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100099

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

