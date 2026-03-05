Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D825D35E939
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 21:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747182; cv=none; b=gGsaWRE0Wg/i7bGaU/PpHxn/7ZwPwTrK+tDxl5tavw2K6+WZPkDzw6KSqOIrl6cg+eYJqilQRmiwPkkXHE52Fsb2QGzllCERGhpiH0Cynqk+9nSrrWNCDKG2LBY5GxqwQtARlHNDh5oCkmYZ0JJ8c9sR6/T2sVxmyJKhLA0yR3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747182; c=relaxed/simple;
	bh=7qKBwP4RT8UWSNgGCGoui9ZGSKnXjO7Z7xGXOQ+rwgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QAYgLmL9L61hE8uzghclCxOfyMRX6iXtAv8ex0j/CYSv689TMwCJMlf4rmUJ7WE+Zi8Aqld83Nqc97LkBTNwgDtP77MFiF6/oSh2sHukpIZhmbA+1F/7BbLciG6lPDFtfEUWQpbiciROg8aq1nwUhZgKLAwEDNCc47LzT6w8RKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dbao4P+U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gg4SiQky; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dbao4P+U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gg4SiQky"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmVwt3136462
	for <driver-core@lists.linux.dev>; Thu, 5 Mar 2026 21:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MlyEHA9gSBE4x00iU9vPwkk0UY8GbFcxWCKm5P/2jnU=; b=Dbao4P+UefkUl3rm
	ohOcd3z6FUH8e63d6S1tWZznd+NcnMa+/fe7JovY0KiK85uxX6sJqUHevc5uqS12
	xrJXjHZktFtvwh5IUBQztxzmZkXaFHD8uo7uTEKLpxQ3h8R6f3Dju0TNr9H1w3N5
	xEag2YOMrW2WyH8euzmseUeGEjG2U+2M4HPYaVlRhcfqcSwYFNPtOmAFZa73R4IR
	0wQSuVyrW5XByJxUcTi2hxzq2x03dnPFKoNJETHlc3aUtQqRE/HCYtKE2MLHhEgm
	wcr/waY0O7iN5L4AikuVHY5OqtJmqILXkZIHTfoaJyHrIpvaeO96J4WSW5CqHf98
	sOwxNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk3hvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 21:46:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ab7f67fso1088102385a.3
        for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 13:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747179; x=1773351979; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlyEHA9gSBE4x00iU9vPwkk0UY8GbFcxWCKm5P/2jnU=;
        b=Gg4SiQkyVEBPIVCDsfWLYAjvSEdl0bRXrj4tr2sgriN0rpHqn1QhMgXKCct4Xcmc+f
         2yKm5dHD9ux9Xp0CgSkSSoKX/oxHY1q5p+FJev8e+x9GujwaDBIcAWzLhnBUCY6RGw/M
         6tWryTEewZq4ih08Rb6oedSXNjjvWQU5Xt43IncIkKuJvToJCGLcPB4eu3CoW0shlSdH
         q7Rc5C6s9hvJkXnPR6SYLJ/I4IXwpYZXtVbpYU9Zq5pIjtAME/gwRyUVEMWpN5R/TW0b
         voH7UC5NFQQXVgUm2xfnss2WYkKQbChMZbsitsIn/PHCe8XKROMWcMcodMn2He5rFUlA
         ns2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747179; x=1773351979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MlyEHA9gSBE4x00iU9vPwkk0UY8GbFcxWCKm5P/2jnU=;
        b=SMTJNG9jpmzlUOHvfePBfQD6Jpc/xQD6eapBdGkC1pXCsRj8WgZkhuRU6NmH+yfuPu
         6qJzoUOeModf/4qt/UGlZkzgGGhYHHG5tfsUmliiN5BwNnbkWy4EFjHm80UXH6EhGszv
         rqGw6X/gD+oKLmu9B5G3/9zKYd19ij4d7/i9+QMXCrAWGuadF7SAsG16sr8Y2eKy8LIy
         B3rda6a1PKY+76eTl/6edWOWDD3HpVBFjB55QbzRlmgj1HXjW66EN+Oi6agLaqbEUUi8
         4BFxOnAvjWVRCQJdzwkhw/YcNyQ1nSBXosbC4MKdkrJGC2/CJC4YaYrb1u2KI+UWHfek
         L7mQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxRYW4BZkNdX2QQ5OtWVg1kU8BN6zFcR5NZNBbbxr4vF2eBQatsTyiMQo9MJ+AR+IQyonkQd0ZVP781Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3mTraFgnk7s6zG2B9jVp+vGjGVhIV84piz9T8AuqX/j1jzkFW
	8Jwm0FcE9gL28kLK79pBDNU4YcJ5nXgR2vHG5eqnmjUmnWqLyoyovaCXI++h6oFf0XMTMLQzHs+
	8RNVrsTFM6RxT475IzGGp57adMV6oDXeac1i/TbP8oyMeOoDAwzRzi3lyQb0ZLJbNmw==
X-Gm-Gg: ATEYQzyEVXmegMs0e8uVBOdxQPTO3kFfsU5l9XcpOwt5z7l76AbTA3V8LamQW3MZbwl
	VgAAv8xtqA5X1MElAB/kuE19WmfPzADoPJE0qKXTHvUXqjgjS3yUyfP2FeMFh91T+bk0RGmPjNH
	12zkTlKI+4ZseLS2eybrWBT1g+/ldZeWaWCDQodbuElYRRl4+WSV4gmUGV/H+AL7SiROUBR3SX7
	VX7FJv3CcvUERD4jMaoay9CtTK6h0VavAgVSdfEqHbLY9+BOTuI1aRELzfI/PhfeK2d+4NOrOYU
	xvFP1mQ8+tG69kb5YuiFVK6TruL0AlbfM0PLy1nnUthXMaJId0CMfuCzMal2Djg+JDyDXAbNMaY
	oBbJINdLKK+oopo+fZfOSG3Es0Q2FAd7jV6rGANFzUgLU
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr3989685a.24.1772747179250;
        Thu, 05 Mar 2026 13:46:19 -0800 (PST)
X-Received: by 2002:a05:620a:44d1:b0:8c7:1156:efeb with SMTP id af79cd13be357-8cd6d431747mr3984285a.24.1772747178665;
        Thu, 05 Mar 2026 13:46:18 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:41 +0100
Subject: [PATCH v2 02/10] power: supply: cw2015: Free allocated workqueue
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-2-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
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
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7qKBwP4RT8UWSNgGCGoui9ZGSKnXjO7Z7xGXOQ+rwgg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmaTscz30XpaIVrSvMJ9NmAZXBjaoCJD1Qtu
 MsSty3dB5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5mgAKCRDBN2bmhouD
 15pAD/4uItAh0+Y/646A3SxgJMd3qGhnE6oah8kL+B+QDXVcgNkJZNqpTsWPqg1ukrpJ0ToFsQR
 RNiOC1FeiFP5X7vtMQJ3v4EOLkUXa0zCrnD+c1aO1FcMnG0Y7gZH+ugMGwOuPFct+bs88d/v49S
 ybptu2xzXKXKBEfAo84Y7OumSKn/LvtJUAk8kBIb8KDuEMZl4r2havJm78odbmy/l7+v9D6T5sH
 DPzVfzNJDdZxNGOQ6OcHWvqDGeNOCv54whjFfsAOEtdgR/5SPJoA4pUbUCWh3RsOMBNnP5h6hSF
 njKtVt2sOP9g2NsX7XKxyDgmUGmg0rLdisILsDZYnguu90Woj+1e4/S3JdqSgdurRvABYmrgiuq
 XQwY8Q6YuGYiMzqX+g5ZvpNN3/9o6ZI7SwqCKrkFeZ7AQaDocx911KL+I/1QlDyP+84NFDreBkM
 2Gj2nSEHDsqtUaRbvrwIAp1Vg4pE9vJrx9fVg6xi/PRznBpoB2kcPOd7BtrCcmYzdMrB/nhq9sC
 tYQqUety3kdK+MSAl70WKyZ7gGpo7fPGOTKz8HXxVEeHiGr+iBOg/MEgylptG4P56NqHhcXWMBs
 xZ0iALks8NvYwqQkLYn2+xyFH3k3z7qEemupGFvVcDLHVbAD/zRk6XrL0Pp2cZXlzqwyenzorOv
 8p1FNzzDKoAJdpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: db-2HQjraAC3BmLz6UX3YKSr-3akYj2p
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9f9ab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=zwXKoDzk-DkgMqbABcEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: db-2HQjraAC3BmLz6UX3YKSr-3akYj2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX/ORNPYHmSCLr
 nvPA0nDmoYKtFGlWSC12l82UnPE2+bI7tcv2ZIFE8mH5iFYVpFR+fLlIv3gMGHfNVvq0lnCjzJ8
 L7UOrOiks/cL+xXS7AjbS/q9jj+WwrhzDD+P4I/3avbhJYyQZGOCv7+7EIXbIRFNN1pSJZ9Y8CY
 hxkb7S8+ZWfjHJZjJcj9ZEfIYtFUA4AJFPa/gCmJey2MhSjFMGGh09bnmc2O4eQTyHps34gq+BA
 fCQb9aT2tqM+PRyyFw4n4nUFTfblGeYOm7x8vVec9224bOUsflMtc8f594kdPucgfF+KAZ6Sm9z
 LsJot+OXpJTdPv/erkT+DtxUlvn/nXzLHHFEsojCtZB/prIIZwI7OPeqv53zjEEb9pYxQLTetVJ
 TbiCcHX8rQ9WJVCwfh3DBtT2yGI35vRjE6z9prUucQgjEj8OU26+yvkPfB5DUdu5YI59AbKsqSX
 kZMo/W4FZ/3gVprWLPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Use devm interface so allocated workqueue will be freed during device
removal and error paths, thus fixing a memory leak.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to read updated data from the battery, thus there is no point to
run it for memory reclaim.

Cc: <stable@vger.kernel.org>
Fixes: b4c7715c10c1 ("power: supply: add CellWise cw2015 fuel gauge driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_xxx() from earlier patches.

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/power/supply/cw2015_battery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index a05dcc4a48f2..286524d2318c 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -694,7 +694,8 @@ static int cw_bat_probe(struct i2c_client *client)
 			 "No monitored battery, some properties will be missing\n");
 	}
 
-	cw_bat->battery_workqueue = create_singlethread_workqueue("rk_battery");
+	cw_bat->battery_workqueue = devm_alloc_ordered_workqueue(&client->dev,
+								 "rk_battery", 0);
 	if (!cw_bat->battery_workqueue)
 		return -ENOMEM;
 

-- 
2.51.0

