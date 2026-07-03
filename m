Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B70414DF5
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091160; cv=none; b=EC5a9Z9OT2Gr9DtQwZBfXPnsBwOz8nMm2n3D15Iqus4cihoLh0wVdbjNbkOjoVmdSYbGSoMkwMCY4v45PU5Cd4S5MGRw+VJe6OpuqxvQ09vY4g9YDSfYDKBgnwoJUVnW1x6OPXm3U8YRLAPCX1gAW2MvPEYLUralsW+tppL6FMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091160; c=relaxed/simple;
	bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzB3fL/sS8vDlAaMZBvTRfwtgp5SuqBQV3O8/F6QEKBecjE7CqxaVIlrAY4irplDqE4oxPAWgEPFOil2XhBMbMBURmpktSOwZsFs227LNYLyscAan4PghdxQEbNt+osGKFavJKqx0yjzqkgq5x7GpkJuDluk2aPMCb5daiIrxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcotVmxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRQROQ27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcotVmxO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRQROQ27"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6639C27e3694611
	for <driver-core@lists.linux.dev>; Fri, 3 Jul 2026 15:05:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=; b=LcotVmxOSL6VxQ+G
	rKDzMiieqY5JNcqRoSE3x5EBrye2NY2w9MzLvEkucKlTfV3cvyz6xxZtq0hvQuW4
	1k8VWnIX5/rD24kXq7pD1dwbFGXwhoxCN4HYZulqZ8+y6XbvIeFuEUtt84e3lueK
	vYtv86zAwEiPQEUC7Tg8TUA4Ww0XDD7nS6IYi/VqL/xdqeIvrDLaY6ODmgQ3iUM9
	jsGmNiYfTXB/jnIfnxTueN5mDhcSLiUpMr3K4iYUxsKNiQnlyWvf/Mk8nc18keOK
	OQTNzed/dh4ls5wYiw4554EyGHmfkXo3OKD06cjvZlINJ59+OFL7HzWVHkmM+Lox
	znFXRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a8497y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 15:05:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c7f385887bso11034905ad.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 08:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783091151; x=1783695951; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=fRQROQ2727Eg0ocjz2Zs+EGu+29nikc6YfTyv9k4OAVTQ1kSKwwqsrlZBcfHvLaBZR
         FkQqvtN3KgALjQugKx27nQdrhPBhbywFW/mCmam12uzyAEcAm9lvblOnN7HEAhfGvIyz
         H2WsCzpaOOJ7i3Dr39G1WiMTyMhWRM4jo2TNRVNyUl9IAwQ9rrY6NgnieSXCzoSvW3Js
         3JD5goRBYQaUDxaD0QyM/K161m8VWt4VJKXcP1hoY4Qsw0qKMbvtQzVKV6Xe/ENRlgkZ
         Zo8roPUrcsUtIN5Kf8KlUTMmp06wOVOM/eSBI8MezJ3TbwwmFn4ukeJkn4eTBJL4dMqj
         2TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091151; x=1783695951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8y6oQ4O1PrHXWEquRWNJMTThi3u0P0It3nfZ4zz+tEY=;
        b=fusHvFvVXG5iclpIRl/J1CM3+ZEjyzVN5giUYhKRQn2MdlXx4Sh5LrrKpI3hUkVyJf
         aDXFYQQ64z3zkB4CKHiPbbYd/1gkjt7mGEegnqRRSvBIhMAMz692I1eGPyY99qtX9ceo
         6UEkoXe85dNZuPg8tSU8atFN+vGs/re0vTBd5bSttx1M8vmfJ17fWalRmxrqdkkWtAVU
         Hq+Bib0OdN0j4Oy4PtlNMmejWfPhuqlxpHLP2OD35FaU2DqdsN0oFK6utqBzaYW9dy/S
         ocub9wHXyBUAJI+qQhgQYZXmAzPBLwcX68IUze9ZL+Uzlc0RIzTxX454Elx3QZs7Kyye
         wITA==
X-Forwarded-Encrypted: i=1; AFNElJ8RxYDz+ahKPYvDrGtRM4iwNTrjy5/T5hnvKIbTQ4+LhDwizbw9rwu4AdpqESgkTiaKPu4YiT6LgcQCCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj3PqUZB7PmIsjibMAWVSmRHso+0qRKV96GF5nKpzyVRBM23GG
	8AEHALKh9FI3Exkv2LR7qr+6/T/ApkUGsBMyIj/KAD56D+DrrkAdKwsrKoNpt+M5TB7fTDvIhWH
	ntl5kF+VXPXww1bAAEI4EWHvxLU1JJQEDPSDdEOX4DGyBYCqT5HcrmemRN4hrGA2lvQ==
X-Gm-Gg: AfdE7ckOQGDAvpCk3P1qI3ghtALUV1Bv7tD8AlCFkpB3UKRIrfhcYa5YOQF8T2SYbwT
	5NdUDboAsylx41uRuW6tjKZaaUKVjllOkJ61ynopXw2MzWNy9pBvHpO00u7J83RuNn8+5kjQNXA
	Aez9GhaRC5F9G1k5Y5wgWRvwgZXOi3bPZjLMiMhZvSH3YpOx/qRD6QTLyuw3QvZwYdDpaquwTIE
	BJNeYWLVVt3fpdJTLf/gWaE1r1N6pSrLzenTI8pGDeSHCH3Jo47AtFEza0MlbwrHadLx4iDJZOc
	q14qkBxgSWIMYqjgtOXmPGX/SzMWpqUyB2iOxSbptv6ZCh3WiAaccyHg8SZ4UoLA5HyT98lgt8q
	hyCss1MMO7VFQs0l72irQWSdQDf5oaBUbi5tJhIsf+EiH
X-Received: by 2002:a17:903:40ca:b0:2cb:2b50:d9e5 with SMTP id d9443c01a7336-2cb2b50db6cmr505045ad.45.1783091150791;
        Fri, 03 Jul 2026 08:05:50 -0700 (PDT)
X-Received: by 2002:a17:903:40ca:b0:2cb:2b50:d9e5 with SMTP id d9443c01a7336-2cb2b50db6cmr504575ad.45.1783091150235;
        Fri, 03 Jul 2026 08:05:50 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85b345sm32904517c88.10.2026.07.03.08.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:05:49 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 20:35:21 +0530
Subject: [PATCH v2 2/2] spi: qcom-geni: Fix missing error check on
 pm_runtime_get_sync()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-2-578b78a0cf46@oss.qualcomm.com>
References: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
In-Reply-To: <20260703-fix_sticky_-einval_after_pm_runtime_api_failure-v2-0-578b78a0cf46@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783091129; l=2738;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=CxSDGrGNPrn/f5+nMWjh2s3LE8mRw+4kULPIPcanjEs=;
 b=GXpErkxbu5zSV355CLd1HAsbeyFy81q5EchJ5XeCQugAQQ1WDNyNc4XFo1V7ggaPPcEsDlrOO
 Xrq5d/i4PbvC4R9ZwZk0tKpNptXMscb812LA1orTH1BhrYUssUTNfGT
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: pU3Ykl6EomK6rIl1t9_xQ9Pzc8dqZoLH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX8Ibc/9ilC5jZ
 v2hfHFEAxCxeFWNaCp90KVRjuo1VPbBNc9ypQG8BODYfp294KuuR9wOKTEf+59NtqH/DEs7VN4E
 D4Nt9vBgnl3Hb9C40KBX/Jv09RqC8aY=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a47cfcf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rPJgdety-6tgKaoqdU0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0OSBTYWx0ZWRfX0ar9uarQ6ixE
 UrWOrH79CRFlcUWO1/AekLREPeHrttbOOlN3G9W1iO6Lua1b1c4EqCcljLCPnUd2qF3TOOp0x3T
 p+gf6VmcmHtIktrq0d8P70MbCiZHTok3dChWn42vXm88VBmavbDO418sMIA3hrF5+EH3IyAbKfJ
 LCuXOKWbZMn0ft0QuJYuVOgk2yxzEW1P88feSooxaLii94Jm5SRHjBmf7k+4M8zRR7dzLzThF53
 2pmSpor/Tf2wtMEjQ0LGpq0x3bqP+4QOM4kM/ItBSsVtamVXps0Bc3nYWAxsNpRvERCVRWRacXm
 uqpOfOd+UAjGyHFmd/8I0FbVjBzRYNtZ9D8zW/EIOZakOZ+gWQmeJErenGRPFxdeU8MHz+QwzVE
 TbDsPQsOhk1ETnTZiLZYUfuSK7JxHbQYkOqtIkLGFoSfJbpl74/PsmNSrR9KJRrD3TKO59uZ8XU
 vMYTNDEzLjbiRN2vCSg==
X-Proofpoint-ORIG-GUID: pU3Ykl6EomK6rIl1t9_xQ9Pzc8dqZoLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030149

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

