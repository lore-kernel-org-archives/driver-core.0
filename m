Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF2E374A15
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972545; cv=none; b=VVQCaKIqEeWOGPlL1Bn7TgXwPUvwlszO69+UEXqnk7DzLalaE8QapttSptRGT30jH5rV9jcCrGiYkz4iLjfNrBpX8m2ub50tfro8gQAymrO1h9szbU4/zmZwLxJTo4MYhJBn9bA6IYGyAMO+BaxvwTnBNtK/xIegTyjSkzM1kFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972545; c=relaxed/simple;
	bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwcQPM7zfPWfvx+fwfusucZNlCSljAQAJCGv7ySzJ8xd6N9733G51/aJWTdMMyLUM8Twusc2UGqL5xGO8CxehpYlWX2gDuhLzbSm85te7SmSjKGK5l4k10jn8RmCOadNaK4X+sJQyUxzRxKENyEd1VhVQJ7KuN6fdq5NHDRg6LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JifBqT1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dx2yIiES; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JifBqT1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dx2yIiES"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KJcD2959716
	for <driver-core@lists.linux.dev>; Thu, 2 Jul 2026 06:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=; b=JifBqT1LvVgFjwZg
	ezTrDVhyLhJXX0QuF0ziavDPerD7oq1/rxigVFJ3V/IsEc8moq1Xql70d4lHeZOF
	5xlVUPmeITaDF0rBHy0P8qnPbStKJFfllGCs31+YcHATSBAZyb2GIpueIc5FcX/W
	362dAIlDQMajXB5ARtP5IZ49209SfUoeMiQKn8BMWa27+5NaUbil0A8OvL4c/e0F
	sTJcwolybOFXr1aDsvYjmmVZvXIrqfr1lyV4VuoR1J9OOzK3kl+Je4ZihUqo/C20
	dE0iKz5mOPV7qnnYJSViXYzswGNUzS9h+cg97m55Skj7qSl7XujW33y3yeICD3cb
	mf4YHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f563mjq5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 06:09:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca2396713bso12866015ad.0
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 23:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972543; x=1783577343; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=dx2yIiES/6wewajb89fJ6+T98eG2QwiyncfJ+hGhN8glquTkSapNIwPLhGBPOrnxw6
         9MjDVrKN6tO/GlJ6PVcPjp6SqNJrIhtR8N45Biv6krvyd3a5tpS2bye66Ry6uWkc8Ntr
         Sp0Tc6G/u4y6RNW6dtHPzyEjBrKI5vYyl3yXqjcbx0x8QAmsWk7v9/nb98CU4ItWz/8Z
         qXUyA73ZU0Svhftwjk9h0o5gV4gQOSe271nTUir0BzY0Pxblh6Uxnj4Vy9Pv8h7ecvnQ
         WRsuBbC22oNaN5IQU6YUUS846/85/hrAuM1MP6TuKV6ClMJEZUby9tO8zTenXSO8b/4g
         oygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972543; x=1783577343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=H7vu1zKdsu2XILPaBj68Hsqzftvr0dJP2WohEEoXzchfwxvfJJnV3lZVJ1DVNqELPO
         XE2LZhUqT5Pb6wuEo3iKEkmN1S9ZloVEMjcVz0kQXbHsQ/7fyx03atuXz0TCUpldoJS5
         RYHkn4Oey4mDXKxFdc/zeTuWFvzBuHFX8pjUoDkNClGUVIzdNcVtjJJrmgMIhrAFiKIE
         EqtMPVpagm/tg4NidtuTyIG6/U8kV7M95joSWtdDT8NYwCCYaw6gVEaVYuG71YYz2nMM
         5ELIDbI+mT8Oq8Xy+FLFbr4hHbo+JLBq0q4ZEtngqEEs88VG41GkMf+v+QKy+S4P2u3X
         7Thg==
X-Forwarded-Encrypted: i=1; AHgh+RqnX4ZccGojKFyzPn0AjM/2GwLNpWFCbfgPxS30OMjeK70HCc4rmyjwCZ5ZEclKCm/PfnRezCbfEqiLFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YynZurvF+dmmufOPpZlPCPAueBOxXP6q0kT1ZeztsX2jwCo6QuL
	uyS9AgfBiarnEKd/8wCFWAyYNM6jAGqWLaBlhsps5uZtXSn4wY2GtNGr8phB65ngdkJGk/Fofkz
	Y6NrmD44yNeY61OaRPo73OEq5dXI9oUAk4nB/CuX/HFXailoY1BC2+s5TjRffkR4aMQ==
X-Gm-Gg: AfdE7cnoQGdvb+6Zpzg6kEEhZUqnqsaCSpwSo/ufINxGJUvke07pFCs612MZfwLAn39
	rbnD6m0OjUYObyYB0qtsGZgzHQJumXhUbdTRxxNucvr1pwm9oQ/ULacH5axgBg+3YL77k/pRS5h
	JgCl9Q85umFlZDq3UQdlgW5JiIhs5iukrCbh4HYyDWiYt3AUy0jJaSPk0uLSYdFpiI65f8uUv1D
	FhoZQ883AgWAe91Cu01jEsik0ALjyL2/DWOcc19BEj7O0RSRqPkeocNbwll9tVsR+r25Cv12vIc
	QDNP4NqDo75yMF2o3HVuXQ3vqbx8IbR23OTGOYFKPuad3TeJ+b5FOjV6wzgDxa7PcYEAmh2eI1P
	uOYFeoZFPbt+huW5+F2tlM2DvI/XbKi6O/1+m50eKVt6U
X-Received: by 2002:a17:902:ef08:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2ca91206866mr36376995ad.36.1782972542433;
        Wed, 01 Jul 2026 23:09:02 -0700 (PDT)
X-Received: by 2002:a17:902:ef08:b0:2c9:c517:d078 with SMTP id d9443c01a7336-2ca91206866mr36376615ad.36.1782972541758;
        Wed, 01 Jul 2026 23:09:01 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:09:01 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:22 +0530
Subject: [PATCH 3/4] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-3-6ddc317011c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=2738;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
 b=6Jd/edVSwto4JfXJn9C1CNeP3ZrYJorVj/+lQfjhM3eBpq7nj9Sz64curfgbvFcomrkaqnKAs
 rSW0rF3e78zASWzrMeaF7WeA/dMG7nPpk91R20jLXdbcMAIESp4T/c4
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: C3-bvVDdU1l4uHR0rOofw2MxQUneGnNJ
X-Proofpoint-ORIG-GUID: C3-bvVDdU1l4uHR0rOofw2MxQUneGnNJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX2sWpzvGhSlo8
 y4P286zyF7ydLAqF/0PjEtm/juVFYgbHt3fAnVoMAssT+Z+Rdpmms13wQnQg4yYTiHzEMQfOKqF
 YssU/C/kEcoCkVzK+yOujg3KULAca8HyuVxy5+UV4rmjIMeXA0/HUKyIyzgri7peMYT+5Bztwe1
 sJAv4ZsETkBmXMF1uR8KtM94GwqI14EZqo4v97KBLaVe1U8dtm5QbSl3k4kLOSV0DXSbWnpsv3t
 9vuZTVhAk/A7ejfQGprTh2CrqRkqIOLDkMuT4FU3twh16M8v+AyckGa3bXCHv5HYhg5QEQIuGgI
 ggFpNsE6BFRmDqDB/FCSyMa9UiSGp9gXjYqeHzaJUd/G0wA0pl2Mz8BsV63yEMQqCdF/6TUCFvo
 hmZ/YxMEHcBMay1o7wWgwDfzhXk7215JXc3qL+TMi+M/qn4cpdKQgEtFDRuE200P3xV/nvLRcZq
 YR4huME8obm33PaET3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX2bjXQarH96ya
 Gh1UyBe4fniTxgZVGHxL+Pdtp2jm5ZZ7QYMhwJ2edoi7rl4PYUaEPelZt+y5vAtS1vQ3CENHzzq
 KyrflJXF7TtDMWwjQx8Rfcq3mG8iswM=
X-Authority-Analysis: v=2.4 cv=UopT8ewB c=1 sm=1 tr=0 ts=6a46007f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060

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
 drivers/spi/spi-geni-qcom.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..a55a3afc0ebd 100644
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
@@ -693,8 +698,6 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 	}
 
-out_pm:
-	pm_runtime_put(mas->dev);
 	return ret;
 }
 

-- 
2.34.1

