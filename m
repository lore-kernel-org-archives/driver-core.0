Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82D3F6618
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 08:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783328032; cv=none; b=Jx1r9+Ohj4du/bwBZf4UpPa/9eFaleto3G72QjtPoOLOu/9WEYxvZCqCMTUXKdFx1N2Hi93bbM1l0mb/8WUFODKMqsWI01txAE+BqOy/6yYOjjKWJu3YnfCMR/3Y3bWl51Qgb07s8l5HQ6kl/4s9Q/+3MiY63d/LjL7okLl75dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783328032; c=relaxed/simple;
	bh=0ufInVUVLfFzq8y2beOLns32ovlcfJNcUR5C24Dtp+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXEde9HW4sG4U/2hyCvRdWqBJ0gFq7EcY2Yj6R7gbEOSvZEbNQilBGWnp6GYpEIr5xNQ4QspAKdO1GAZOY+fhhXMYdYbM90K53luQXKukEntnEKKWs/mo5zD3bjHaxsc2AqLExFmKqRcUtqeeMPOfGcHAKmYqX+NogpIzvNEkGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X+SUIniJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kd3Ur3Y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X+SUIniJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kd3Ur3Y9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6667CX4O3845755
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 08:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MLeedBrkkia/qCCz/UPFtN7ntKyyH0lh9E88vuT4PU=; b=X+SUIniJ5e76N3KC
	4okub6IeNfLol0638NNvmRBHBEf/yZRoV7W6kmQ3kBZZJ+ReJNEiBVm9nf1zLwZB
	+PpvOUoOg3c4XOwhemASgDzeP+jIikkx4dpfOoPQadY3I+iEGEMGVJS3ElVaFW7m
	up+mxV8NYu5tHP2NWk9ArysC7f1y7gLH3Q+kHeKOtVaqg3fAufJMJEIL2gz4gP7J
	8PcD/NpEjm2KQWn/VkL7/oCY3QKL87d/QHpd44GgyhbUDIXVlT2lHKOzRoSjTwjT
	0C9BC5WVr4cLrm9dMhDKNe8hd9QRxf9qOMoq9xOpCKMAtzzBalq8UoOMqfDgWFE3
	I3BiFg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxrd0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 08:53:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478e9c4bd2so2901172b3a.1
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 01:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783328019; x=1783932819; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MLeedBrkkia/qCCz/UPFtN7ntKyyH0lh9E88vuT4PU=;
        b=kd3Ur3Y9xowNefn9FOTfhZZ5dopQJIlv1mk6z9UsjL04Tz4FmFc3Jc8FCIGs89ioUD
         6Av6vBjm4qMbRe6uKMgtVTGW6XN1LNaxhkCRUOLiQTdOTYv1INpsqtekeK34gk/Dlsir
         4vuLTnNtJQiEzhktg4v60bf7Mj7car6pBXNdA1wR21KFNGnb37xC/Q2Vl1/2wMghd0Kv
         pcq0O/YRmlh0itXuNQOsFQ5qrO4d8Z+1s9FXtJyzTXTgnt90T9BR6J6c/HoEuwAFqgXj
         JnqduwOBHTHraYnmatnhWmtWENvNayVhQhPKZlaCsRONYcXD/Zk18gLstZR1GBEQIm0Q
         O+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328019; x=1783932819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MLeedBrkkia/qCCz/UPFtN7ntKyyH0lh9E88vuT4PU=;
        b=Qz9qeNgM18AQk+6PtjPhfUpan8v9u02eN9c/Hl91KLGLFN1Zwb0dmE1B06h7uwgjPh
         nUErYAY2rxsq4ifkMVoJwfL7ackU8IQmYzbtdSNFKFNZTkCv4j3SdrDGNq1TbLAhrvOp
         kId1w2liy20jPIGqE9vI1af7KBZBhN+XjE6pkS1W0p0jmHtDoQkDKaI8Zw8su7JhzwNP
         LJK3Huz0/D745SGnE/1KQ7wjpzoXPw9QybVFacuYlxYAeLCtCqbPnXBX8tY3GT5gYx4A
         I8S2JYhVfwqIMJehkW3Qg0JGiwmUhUEFIz+YAxigQqfvJz2Q/lt0KClaI5X1kdda5SJI
         PVSA==
X-Forwarded-Encrypted: i=1; AHgh+RqsVy68rgsFSyB+UbYqnw0XnTCxZ3mZJjZ21ZYjVxWv25HqOIsAx9sSZxqonRmcKNbQJC84JdNhoHzHBg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOOPkvkXVzUXGSIKFEyryxTA/Jb3mFV/WfscUSQsNEfc8XSMlg
	ixJ47B+gcJHS/vX0nSeqhTb9fWBONO6r0IxcJcXg2zt/r/sYaT0TW99adBElnmEnVOkoDp9dWFG
	dPgA/qu9oUYaYkZ9ewGhZGpmRo8CC+l2JANwiWYFg04VMxnqOru4ixH9c+BvmevbBlLjLVkqMkw
	==
X-Gm-Gg: AfdE7clgaLGCwzz5TJcK9RtoAQwZ3gemMf1sAFrnYkoiHvNacDfGCl+Jjrce1EDl3R5
	xSCow5d1OUovIlVpyh61UeMqMNCzFpK3AsJLqII6gDMEBLEkYmXw+IoZF7Wijv82FHUkpP4UvoR
	0OgLIhGQh0Ea/fglD64MUoXaH2X6aKAg6w3RDnU287q0Lrp8Up6Cjm6qQvsOoZtL2OAebuCXnmw
	aXivqwGU7nmUpnFRmN4SeTkFZ2pfIAwyyNc/3OYsgPIC8PJ978UGNhzpm8GwwER546iWBSBtMs6
	Usc+0lwog0tcMydIHhYMiEFso3E54JpkMtRZNSG5ngzhTtme9TjB6tn+60W/mWhgIei1qoS8nRN
	7IGxybswYLANqk0sV3jTjqsGQDYq+s8GCsW6g6mGZz0jG
X-Received: by 2002:a05:6a00:909d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-847f6d6708emr8249559b3a.9.1783328018683;
        Mon, 06 Jul 2026 01:53:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:909d:b0:829:8942:2c93 with SMTP id d2e1a72fcca58-847f6d6708emr8249531b3a.9.1783328018026;
        Mon, 06 Jul 2026 01:53:38 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9e12csm3411834b3a.21.2026.07.06.01.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:53:37 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:23:10 +0530
Subject: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783327997; l=2819;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=0ufInVUVLfFzq8y2beOLns32ovlcfJNcUR5C24Dtp+I=;
 b=Lxpi51lVQh8CfIa0DMGsvzgVX/5WK/vUmhHZ4ROGKQqbLRm7Qj+Ah9siSBj3Pxzi85bbp/reV
 PsSrkkU61iYAUyDE5ufd+3sw/mfgU22Cj97wfFqxnnPNeiq1qCBJbVQ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-ORIG-GUID: ZTEtquHSacieMhWL1fnWYpKKdttL6y4W
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4b6d13 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfX6vrsdbXEI5tv
 T3vqDfFJkltOXMQrfoSRPOteSUsQJsTW4SIfy9J9f7qqECZSJk/UK6ywWy58gZAf2szpRkv/Npb
 8glrHA3XXA40q9hCJ0Kmorbd0ASNmTs=
X-Proofpoint-GUID: ZTEtquHSacieMhWL1fnWYpKKdttL6y4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4OSBTYWx0ZWRfXxRAxPwW9hpmm
 CMCLGWqZAtNKgJC/ndVDBAm+2cod2aBZ570kRT0U37THGVNeN0gGN06m2qEmaKYKPT8SYeeGigr
 2+7nLIzmCgn38d75Ns/i6/Yao4BvNnTeTBSUgMT6ZSREoTAgjPqyi4vMjVc8BmZvfRVLtwDpxMe
 60a0/3h3xyCySoirpOx/654xM0PUQOsM4XcDJhyoOd2N7zpLuVzlJcGn5SBqPEQLibsno/fGyMt
 eyqmKCsbhQ5vp3PX7JmkV9zteRNRfAIY2S2GqL5nbJYD8/PmKYc59aPKjP9pZ/ubo3oH+zQ5Ue9
 SaLDXkjvNjPloupugYuf1CcsXDkWwPXNzxpfMl5A4rNeRBKtHEuT8rsNn5IGPANHhU8MhWOLTtM
 0HMRPyxz1Hvh6XofMtEpG196Y9o63TmUfJV/343V519ePQiW8+zLKUdrkPM2U7P1E3ihGjv8kba
 9MJDYAtkGXs5hTQhD+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060089

spi_geni_init() calls pm_runtime_get_sync() to power up the device
before accessing hardware registers, but never checks the return value.
If the runtime resume fails, the function silently proceeds to read and
write hardware registers on a device that may not be powered up, leading
to register access faults.

Fix this by replacing pm_runtime_get_sync() with the
PM_RUNTIME_ACQUIRE_IF_ENABLED() macro and checking the result via
PM_RUNTIME_ACQUIRE_ERR(), propagating any error back to the caller
immediately before any hardware access occurs.

Since the macro handles its own cleanup on failure, the out_pm label and
the corresponding pm_runtime_put() call are no longer needed. Replace
all goto out_pm paths with direct return ret statements and remove the
label entirely.

Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..392accfd8515 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -613,25 +613,30 @@ static int spi_geni_init(struct spi_geni_master *mas)
 	u32 spi_tx_cfg, fifo_disable;
 	int ret = -ENXIO;
 
-	pm_runtime_get_sync(mas->dev);
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret < 0) {
+		dev_err(mas->dev, "Failed to resume and get %d\n", ret);
+		return ret;
+	}
 
 	proto = geni_se_read_proto(se);
 
 	if (spi->target) {
 		if (proto != GENI_SE_SPI_SLAVE) {
 			dev_err(mas->dev, "Invalid proto %d\n", proto);
-			goto out_pm;
+			return ret;
 		}
 		spi_slv_setup(mas);
 	} else if (proto == GENI_SE_INVALID_PROTO) {
 		ret = geni_load_se_firmware(se, GENI_SE_SPI);
 		if (ret) {
 			dev_err(mas->dev, "spi master firmware load failed ret: %d\n", ret);
-			goto out_pm;
+			return ret;
 		}
 	} else if (proto != GENI_SE_SPI) {
 		dev_err(mas->dev, "Invalid proto %d\n", proto);
-		goto out_pm;
+		return ret;
 	}
 	mas->tx_fifo_depth = geni_se_get_tx_fifo_depth(se);
 
@@ -664,7 +669,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 			dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
 			break;
 		} else if (ret == -EPROBE_DEFER) {
-			goto out_pm;
+			return ret;
 		}
 		/*
 		 * in case of failure to get gpi dma channel, we can still do the
@@ -693,10 +698,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 	}
 
-out_pm:
-	pm_runtime_put(mas->dev);
 	return ret;
-}
 
 static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
 {

-- 
2.34.1

