Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9029B405C54
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678399; cv=none; b=FxYDWSD+hVf+hfSJykKcIbyK3T9pqVoomKPbZYFvV36McfsP9yi+27GqcFZCS6zI94iX2H1xJaHRNTp4UMTV7c/eZmgNJJezsHKqXr3wLHPIpr3HBF9LfabinnNqAayeLgfjWhDBlA/V/2nsmcjinVOYZn0P56rllnpFeRhsZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678399; c=relaxed/simple;
	bh=jBBnW6WFudmvEPdq0uOwfkuZMk72McbQneZaQOFjN3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngIyjPy2rWs1HFZZjJ8ucsWq39yLGjZ5JcyPzG/1ZFwHFUavG3Dv7DSFct5mqZaUOpPik2MXOFjKjf4ZAqhIh+ndXydJe1oUavk2F/c0nuRe8MfpNh2c2eexX6l2bnaio877RT3BigIfV4LcjcTMrEOkQ7GYvdliRPuGVGTQGFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7jSSXxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AP6d1YQt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7jSSXxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AP6d1YQt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7eIha190744
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bV8KvWCZd21k3Re7nM7YSXO7CD2b03uTu9SGUiG6fXI=; b=D7jSSXxDPyx7uc6c
	4aut/MjSt5s4Mzo56LBaDDp/ojDd+7hkhupviKT2yW+Y4y5ScIXedvmacZ5cOLVu
	Hl1D7tmH/lXOq0BJDf2mps/LWCqQwZjf4K9dHtBamo4Piozxf0RUCBCO1n+OMSFr
	c6vlLOnhnRlFs0dX/yXT81oKdGcygN6KOvBICbI2oyxIeuXEDg2nMZBCgFZvqVHl
	bJJDZq5MYygMRpLo+5rbFcc/QAbYLEDK9Aa4eStt1q2XWBT3cxaoC6l3X9FqbfNV
	B9akTnIkKADUyl2TcaLz/6yYBGRw35WELJtBv4T9pRqdi84DHrmRUhw1UPPEjmqb
	vEOhug==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fas6n1chh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 10:13:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84877b362f6so933915b3a.2
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 03:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783678395; x=1784283195; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bV8KvWCZd21k3Re7nM7YSXO7CD2b03uTu9SGUiG6fXI=;
        b=AP6d1YQtzvZflcjiULrkO6nXOTgvxQcsJHSHVTObiD7i52GsphL4ujVO86Nf1K0s3e
         7c+oYrzL6oYI0V8PYZmBUnrwJqwkUOlamvJ1AH4M6NE9G9mWJdxO47bFj9wDqbY0Nbwb
         bQL56p52HdS78RZKJriDFj8QXDknjvDXBtUjUk32xS3vstLs0nLti/hfoi9bnBpgHZuQ
         Kr+Xg1MIup0Mf7ocxBoSt3bJ4qq6AcsrcSAsOz/PggqEB1neKHLopiTvAjyfYxqyFPrc
         5kNSS6LAt6Tv08EvrjUEZVAqKrEM87+Z5StbseIvx0X2ACfGqCZ8PLTNDHmiDUrP6ZO7
         Qcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678395; x=1784283195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bV8KvWCZd21k3Re7nM7YSXO7CD2b03uTu9SGUiG6fXI=;
        b=Kw9F+nSQZCAVZK5HKs+2mOFBsYDz+UGaXOz8wkoxSI0U5UW6wisDH/tF27+kLIPCDw
         39UhZS83h9GeCmgx9LWFhu15BYyvVGTmHHbGOTvs3qZ+3sh4qhUmu34tutbRASXO0bkT
         AEHasU9htF+mCFZlIUn81SwTeRgZ9J9aRx1Qa0xGNWsUEWCIkulxpzsj6qfjc0D2KQYh
         kIP8jG7H9WPaJmJ7X5UsLZcxjVo0ZYmSrFFkXrmruCc7DXB2VKvEI/hOd7L+ol8CvYqn
         WmWi4sXStOk3CJM7JJCbhfba+j0LczlzjAmDwHC6qNwwxK7J2ZCfQvIX9NW/cUkY4KhD
         W0jw==
X-Forwarded-Encrypted: i=1; AHgh+RrzAiIbIwMZkg7xfPAt/UpaQvA2e0O2+Wex8Rdm0E7lhfF8zAvKxGSnJquC+socmOmMGsk2QB4+lEHmKw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy03vcOCKBXnNNMztpHh1ZG1PMEii+hkgvaeExVAJUdt2SnUi4U
	JlOCKfPVFtqwf95yae9zP/BxK25X16sBST33hjAC5BfUH2C4YOAl0n10vb2FKaOY403xYE+pN5j
	i9OFDtoL60mgLCVoQA+BgpehMIaRFH6QQw9PV67k7GdGsVrlOVjAdhuXUqOWM8+62yw==
X-Gm-Gg: AfdE7cmXCrQ0+yEd/940vdURzX2XxCyyoj8uYABqn5lmS0WGjB5IUAbUXNS63J/h/5U
	rrEvyInR92v+Zwk2MEKPfRZp4Fp975XHM2s/cmsDqRiLyKPlqs8kEmL5Hg8aooXOTU5ay6Wn4Es
	vfHSAQfsd2pz9gfwTOAXNzk1GPpJJzhJzlcdMwEeFhTd6SkLcdA9+sC6Bsdm42MAiJIi9F60zMK
	uPLWGalRYXxWJst0sps1beRlx4slSPwtRz38CeGNUxiPeYVzyFuaTqNPBYFlzRb2Q/kW/68bkea
	8HBSTRt+BFCJc2/L4ird+Wfuv8yZDajxYF1MZBqwKlr9zfkZPG5tvlY/BhkwN/z2JFjqkBoifK/
	zIo9Bln3aun3gvQfjVf2EAkTlQy9zbylGwI9wyuLfHKtJ
X-Received: by 2002:a05:6a00:748d:b0:848:4754:28ea with SMTP id d2e1a72fcca58-84847542ddcmr8408567b3a.12.1783678395439;
        Fri, 10 Jul 2026 03:13:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:748d:b0:848:4754:28ea with SMTP id d2e1a72fcca58-84847542ddcmr8408533b3a.12.1783678394806;
        Fri, 10 Jul 2026 03:13:14 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm9977815b3a.46.2026.07.10.03.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:13:14 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:42:44 +0530
Subject: [PATCH v4 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix_sticky_-einval_after_pm_runtime_api_failure-v4-2-be81d6c15043@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783678373; l=2859;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=jBBnW6WFudmvEPdq0uOwfkuZMk72McbQneZaQOFjN3g=;
 b=SSyJjUgoguSeWg251n1KeZRyWrsQz325hAFIge4pglnHKXOmA/4WhEFet02HX4KH0aFHdds4U
 EjWuQGXvQiMA9czhxSLubFt5mAGm9HlMXmX3P8zySnpjyq3aMfxrwsM
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX+/NGymAomNWr
 KLgUFCw1r2DHHgKfmMB6R0ec+NMViMicIsE9MWGDTwUleK0mRNmztROltGvbJkEURwKgKrseXEt
 Elg7ZCUkwvJPQHXQ84g6pC4KfSYCCVo=
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a50c5bc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: dn1_6GoQB27esB77dqqhtutNTBAhVHR7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5OSBTYWx0ZWRfX1r6PynxH9W+1
 kw2cBGJMhnP3BNQTcPP74iGKzuyNdpTAxUxcpijveV0l58gLfQbIzsEGV6q1gJEzphPbp7It/Ez
 /thvvxrkrHoBun/03Dc5wOswBHlhaA/iHnXctPLpDpaa0FNkukM6d/jOhUZUJGw2IcqE4RuwfbN
 mCSfJ0Se33irPg24fsw6idPrLQlqaxMemhHaBlYarg9cIURXZd2YZw/4G9XAU0EqSNHLYWnzO1o
 zaMTySk3XrqQsePDGQNRDn/NYqQU1MAp6r99rpKqMG/jbcuRq/z3ZHr3bMx0pQ9qg+Oa6VBSxnf
 MntUiYjj5OQZL+CF8iCaPRjhqa9usLYbzpUdOlxqsX3/MVqdF+6UiJpf7Ci8sQDM1I41KG6nssv
 yqFEe1m7fjeXGvsUmsUZ5pSuNUVwRGv2zDCPXTxu2bIVIeEYYkKG/L9bdOYMDscoMIsJam+tvGY
 22pETp8saPmsT1c2dYw==
X-Proofpoint-GUID: dn1_6GoQB27esB77dqqhtutNTBAhVHR7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100099

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
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 88ac0833351c..2914d781dbf5 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -622,25 +622,30 @@ static int spi_geni_init(struct spi_geni_master *mas)
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
 
@@ -673,7 +678,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 			dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n");
 			break;
 		} else if (ret == -EPROBE_DEFER) {
-			goto out_pm;
+			return ret;
 		}
 		/*
 		 * in case of failure to get gpi dma channel, we can still do the
@@ -702,8 +707,6 @@ static int spi_geni_init(struct spi_geni_master *mas)
 		writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 	}
 
-out_pm:
-	pm_runtime_put(mas->dev);
 	return ret;
 }
 

-- 
2.34.1

