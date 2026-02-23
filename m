Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DE234889A
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831672; cv=none; b=fPc/z6lT+EwT4InxJM/n7QXUGCmhsKGR7HCOf5ErkugnaZQ/X4xRABpDgIT9mp3YyzT0Z6YQfLexHKCs+mjjaXfWXM98STbKsx2egWQchh7W6hN30No0DDxis7wvNo2qYrgAsodPE3bo1U0w2Oi9qJobm9jOCrmUpbRoWfoWO+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831672; c=relaxed/simple;
	bh=H4Qs2JkZdWI+ycAqQDT56iXbPAaAVIJgWc4JAWD+760=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/XUHX5P/3CmMacplx05w8F/rj6iGOXDZejQeBbQdDw98OrLe8A6tJdVwuqUPNEsCeqTl+/jB+J9fIF8FESeuLrcqPiZfbStWUykGJ9t2YsT6zrtrBVymv2ZcmGWkwmAHfhnlRbQI93KMyJB91xde5Fx93Ga/pOePFZABsrgjgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P7e0PJNi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ydt42QGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P7e0PJNi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ydt42QGq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMsBP22238684
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRA3RyVyVxbH2SrEeG1JLyYKtVz8CEHlktSTCViEaYk=; b=P7e0PJNiKELxPETZ
	Awfd2x6s3dW2Ylcim2o3xqoz2thYA5k9ocfgidH4deTBUZaahdXtPDtZDGwIPiao
	f8EizRfXlZIXjA8p3hy9D+vFKPt6tgzMarQRAUBPNm7kJyv0Tvd/2xyxJQ8mdP/C
	OZYeQ+DA5RPkIWFqd01XZnueIN3ZDeRL6Y6yilnH/UA/vPixzT5LxVhdwnhsC32o
	nyrtRQ7k7rwzahA8RX3iQd8H+GZIpTAspfrKBGvVk3KUZFGdr2+NRx4ddgzrBVRd
	jEZmEgqbMC+v4M42eSCtBWNfGk5P95Q/CT+OTkxjyIg7IVTdCtrqHCVXf1MTiDZ/
	VbN/kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vukq3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb413d0002so4753016985a.1
        for <driver-core@lists.linux.dev>; Sun, 22 Feb 2026 23:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831669; x=1772436469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRA3RyVyVxbH2SrEeG1JLyYKtVz8CEHlktSTCViEaYk=;
        b=Ydt42QGq/jejhPLmjbdwmlz4/4zksP6N8wrLKLRXHt80I9iiyHl1ftyzzzSu05DU7q
         y6vdqZSV62bZ5EuAOPzMqcDTaMeJoWYYnld9QhHB/XF+6Eh0BG7kwLNP+qg6YZnU0NmE
         kbizflqJvltFIimQ0c7JGMAS2xgZx21/xK0uDcM+KzPiM/lbAirANChuhmWaSTknqCrv
         pzWt3YFgNYoTZ+LXRgzVf98YezmRusB7pNPw93mX7Db0dJLLDHcxkDivLzJEmr/jvCpL
         1GiMxGf8Tbl9v9ns2BYTyIsifzC7L3stPC3Y+PvUAOs9dDC5FMfuCfOkQdLj+Jh51O/Y
         IMcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831669; x=1772436469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VRA3RyVyVxbH2SrEeG1JLyYKtVz8CEHlktSTCViEaYk=;
        b=pRX7QvXaGmnCln8NH7pNW1g/GGAiHUUwrdrrRDjFkKNzxeSYcKWe1PC3ZcNHJ/zfoM
         a8vkPIfgFBxuc9BpwpWfSoPi+uBfTpuiBa+6jTAXC/TI2EQ6q+j9eP5d/tQ3ABR4ieSj
         KOTQEKavTaqArFPcztyBnljibYj6tdVcfb+BYUTqQHg72KvJyEqvlI1MVe8YuTCDqtvr
         ovajsnpIXPjlzT3kJ7hG0cGCW6JmJ8HuxhMK2lfoo2lveL/+mj9LZ1+wmtOSrBXxViYL
         P9E88dzRcep/7awU4rTRys0jDsFV2Edko46YW3GGQVZPovAmQcubZs1dpjyJk4Hjdyr5
         JFtQ==
X-Gm-Message-State: AOJu0Yyf4tQQSvzjPiQjOB7FEEdyFBJJy1sPkWDSX1Lru73kZtMP3Gjy
	jassRjlUrasWTYTIcQIHH4vowTb51Pp/J8/+LSyFkf72SxgoV8kiaanMviawpU4lPSmYPlA0VSC
	27kO8BTQN7kT5pdb9BaV+QgD1OBPJ9F2vEGNNoZ17ha0IShqQjlvbwtj/1eIXBlfMHQ==
X-Gm-Gg: AZuq6aLCY3+h5hGSOo2fEZ21CTAXQO8+tc9dCoejig7kw7WC1s5GDzt91oizVGtBlS4
	hYwTRx3f7wv/gnpIpXhPLDdQwLCkVwzwGP796CnDIr32kQ5jj71BM5csOzmu/uq5cDMZeS1o5f2
	XugY2Qaj346anx+Mtfuf+lRSxr7UK4xoUnLYGoh/jszYlD8JoOBKh3gdPt0PjdeVpmUyoh9fi72
	T69jMfvH7qOEE71f51hoXoKhXIWEhyMShX2o3erpy32nC/oMu6mclsdkdAo5Vb54wvmc5Nq8F7T
	PbUREBqSymeigW+ZOqPU26dOG0ZpP+er8K/ywM6SIAVCFxbXbJ0DiJ0/4tUFp3YYuPj/VSQpNvA
	hWy9BVv2Er2krQgXPmaLUHe8xCElCJrYvcl+5bzGLvWKSXg==
X-Received: by 2002:a05:620a:410a:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cb7be3b56dmr1528261585a.3.1771831669213;
        Sun, 22 Feb 2026 23:27:49 -0800 (PST)
X-Received: by 2002:a05:620a:410a:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cb7be3b56dmr1528260785a.3.1771831668821;
        Sun, 22 Feb 2026 23:27:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:48 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:30 +0100
Subject: [PATCH 2/9] power: supply: cw2015: Free allocated workqueue
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-2-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=H4Qs2JkZdWI+ycAqQDT56iXbPAaAVIJgWc4JAWD+760=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFnlKggUmMImpH+2q+EQOengTlEViaDst80b
 rri13T4ETCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBZwAKCRDBN2bmhouD
 1wL/D/4i3PYKpuAx1K5RL6gEvLpHiawDOSj9vjal+PUYon/bPYEopOZ/FUPvvzcyO3xwk1aE3fN
 Qjt1X6KJA3m12Rr3HoU4uzi7+QOtZhRC+Ee+waflrOuc2nmN4mgkRK5IZOP0P3ucCE7D0In7bU1
 VaDgnrh/V3ZCm37EuD+mQYYz7d5L0M3aXvcA7VOYqILqkUMKkSsY3F6fG2XrLIXh6XAIXjpKyHW
 kRH+idw+/a/tRpyCvoWBeHHdap8DB5XfnKr23uqVXt3Bt058BG82+iRoUjAk5RX0NchuKOAoejV
 mh6Yr1zLGVrUT7WJLWURwo+hKOyMx16oSSHu34xPX4RCVgbF1XLH6h7T2RAy+sNSv2pbMtcprVO
 d4xt/XcLU1usNGFqYiOKxkWyt0d2g9BL90vIdxK49QaKrhi8FKAJa9PIjRGf7Mw2hcaj8wTxzAf
 nBMpjwYqK9tj5Dma7CIHUZ5MZZpjZrlc0PbAOOs9UyXHWLWG0t6A5KoemPUprjvMqUTOJkTkUM8
 GVVtlaKnQwwUlKc8PHzp5UeJGRuoyXDOFUGsiarCRGWkISypxdARJzsBArPz8zFpm3ndeOnysuX
 lgYIX4UMonp+qXf7JQ9H520eW9Jwek8+IETCZeEhCvykTsj3Dwmo8Ip1VxDlwZ5+IeYSnWyiQkH
 4+N7CZUWdWSHfdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c0175 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HiF-IioCT9ZGAFrUKQYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 9NsDn-1U-AHzpgEPOdvNgCry22ESF87J
X-Proofpoint-ORIG-GUID: 9NsDn-1U-AHzpgEPOdvNgCry22ESF87J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfXwp8RxcJVRpTS
 RNeRZjh4GMWwil4ppCvJHzH7VymuU985ga0EtNZq7B6x0RsazLNtaP8oDex5kTdHwdfuL77CNdx
 IUii7x8qxE9X4topXzsClrfW0ODGfgKn95jm7xCGpjqb19OkJaxCVsP7dMuxQzwCYLwyzKJnpt9
 oIds3B+VhFaol1Blccj8L5g9wjGMBxOsEKOlUEX5Kzfez2/8mkdrRqzvnwpGjBe+D9VF4YOBv3H
 etL2ADzHRW6R1R6iJLM9PxLv45diRjFFhPxwTEQnUXndkkt9ohoOsaB479gMjz05Lgw3dbAE10j
 +ER+fN5ovxXLg+9CRL0KGiJnnU+mzsaHQABZJFvPn3UV/mBsARfagpB43CD3Tjf1WX77jst/4tV
 angI5Ljp/BVLhmiWeNNeAz0iqqEigGzOlQCqYKwCK64vVNPe8IclpVXGhIkwLUn73Sd7orfMfJ9
 fNNJ+H1al4zUG36rWng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Use devm interface so allocated workqueue will be freed during device
removal and error paths, thus fixing memory leak.

Cc: <stable@vger.kernel.org>
Fixes: b4c7715c10c1 ("power: supply: add CellWise cw2015 fuel gauge driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_create_singlethread_workqueue() from earlier patches.
---
 drivers/power/supply/cw2015_battery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index a05dcc4a48f2..1e4e3b4c7460 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -694,7 +694,8 @@ static int cw_bat_probe(struct i2c_client *client)
 			 "No monitored battery, some properties will be missing\n");
 	}
 
-	cw_bat->battery_workqueue = create_singlethread_workqueue("rk_battery");
+	cw_bat->battery_workqueue = devm_create_singlethread_workqueue(&client->dev,
+								       "rk_battery");
 	if (!cw_bat->battery_workqueue)
 		return -ENOMEM;
 

-- 
2.51.0

