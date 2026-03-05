Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A1035E93F
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 21:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772747195; cv=none; b=ndArX7YUkRk/OYjrRf289z7O1EpEYNiwZnGyJr9QOuiEbbkAcqCyR/WsdNkl7v+TjkERbShWAXkaeJc8v4lOKtKfYTzuzHzloj/n+xhGXCxzsk+yqLYzyqh3QAhWYPP4z5v7A2iwaHWLHY9NGpD1RTZA7U9Fugx7mj8nWgI7rwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772747195; c=relaxed/simple;
	bh=GLZGLUI6y8mTC1CoUCYnqXy51nlJ9FI78lkz9mC/UlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aF/5l61umVhgIu/D7faNaHevG+FS/IeG3XjACuoZwRLILDlLkncFM4UUxWltVMaeFtjpB19fLUEJNk/gLTEJXIVk+2qh6Xq5uxFt8xRgTOvTr+wTFPvNPOYs9u53iUHhchwD8C71jnk02SlXG2+aED50o4ghbA29JDgQ/8WkpEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeBv2aHN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LQsKg6Hy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeBv2aHN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LQsKg6Hy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625Kmfad3136718
	for <driver-core@lists.linux.dev>; Thu, 5 Mar 2026 21:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=; b=GeBv2aHNVvKJuPtt
	eqOaebwXuSQyRXKB14SiCirL5sWi0kFlG7GjQG2PGoGLP5iNIdRwlb2APnrLD29V
	AcWpBx+LDgm4Ns9G5c5nNRz/Bm1VOy/z2inACLoaXG84LKgsYo/AwHUh3izX/eab
	u5T9A6Ww+RUQ76gVcYzTGMEqQifcJorocpBhrICD+UHOdQkIS+q13LQEWyQh+HKa
	2Lo1uTq+1Q5MFjbfzsZVmjzeCaHNdhWGCW1InUj+W5iwk4Z8Far4fEmkpAz5ZZlm
	Ay7u7UY/xudN8LiOczLN9xi8YOXCgWCPKbEPaLfJMl3wusZurk7q9rmRR6J+XD8q
	v2yp0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq1pk3hx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 21:46:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506bfa0441aso131350121cf.3
        for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 13:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747192; x=1773351992; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=;
        b=LQsKg6HyvAqzqa0IPSKBFMMMcO4h6bkFdmDrFFxHpY201oMKdo5MN2vh7pnURKc86c
         hPrrV1ujAAfcHGuFQdJ0LuRUOFGh+H4MLYFzfeC3ubibRt2M85ptKgre03f2m2HlesKc
         pDNzXd9Pd3yRBzy9dIGyT177TDKtbKJtT5dalRFRB6VZUVksmmcqH0A/mEN1U10kqjNX
         tqnV12jDGwv4beKoBpnIYlzgDWOhENfxKm5uAFaxQVL+p3L5Km40Hbhj0UmexL/0NIoA
         9MHsGp3F4A+/EOrYbs/Z0R2O5liJ33rfBAqa+CiI3qpcp8X8OAnJhlV0soMO6QZwV1Hh
         RAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747192; x=1773351992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xpMBKCSvSSCJ6d7tlxcLy1pZDHIoGSHsADWWql9ZdpU=;
        b=UzomcPkIYEk1Dksn/DIqEPhVO2rImRJx6sdB6oXaMnm0Z8m56bY2JI+P+0IJJHbk9Q
         q+qPWldZfRat1MfWwKDDxcS3xzLv+yaNfRVygNhaQFHVc3UKjH+K/te4LJ1b5FHnxNF7
         KdRmlXbZgpmG7iiI/T9OWXyD6bxRfAz+gjjFBgnvnWwYSN9ty1zF2DvPZsnTNJaJrqqV
         7IZDzl1DaDgM8CoySDDsJgaSETGdMUbxT1uJyXQrELIZGCzTNmT5mplmeoJrMA5wsr/O
         iKUTGK0wnl50SgraPsKJyq97ppH8TbiICApUu2NkDcm7uttFlzQgnD/Nmuu7BvupvDs4
         Ez8w==
X-Forwarded-Encrypted: i=1; AJvYcCVfNiE1SxRZYY86P5eDsybNAoi1ZQ1hAnamCHfD3UZ36Wlji2sa4/DElb78dAmDWaQF0mdhDQQQqhmVHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHZSFMVcSFp65gKUAVWEYtUwb24WjnfGOz5+ZAbEjUQPofK57I
	G+23n0Sgj9rSRtHPI3zoxe44SVW+0xnJzGJRCSNROSPxab7ZYSFuRgI53sxyetFz8zabG4gaNuT
	aBzT7/HOMXuDkWAz/jGRSzoDONVqUx6grvm+0GXNZIwMUdDOFv4p1YYXQ++IBewB7nQ==
X-Gm-Gg: ATEYQzxPDx2QqOQzyYaFufAgxhceYB6L1oDqCU+nsoug3pQgnxy/i9VH9qI6ydJpDn8
	cSs6D9zqyq0lw0sZhtXak7XIShK5/RPoP8IMgetpK0D7cFAHRNslL/iXdodBv6c1/Ra0TiaD9U5
	BpPZtYJJoMuC9cPxibTetYNklm13nY+0JYKbBQnl2FREUA49LmDQw160QbNsWoxrGA7nODNo5le
	0mGJLUwSReR3XwO1ycnpTiM+aK118tmLZgJMA0xb0GNqUHmml3cOLyq3bYFtjt2bg+o5/SWnAfq
	zoMfbGXxpBDg4RQEHI1XN8TV7RYYHShL908YkKT4Xq9QsLR8hY8wJL/uptXJ+l71qIr9fVVtZvS
	RadzYp0FtoZu1xlkLPzTQ1ruHIvmy5DhQKPON7JTFODr3
X-Received: by 2002:a05:620a:470d:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cd6d4cc1camr1441785a.43.1772747191608;
        Thu, 05 Mar 2026 13:46:31 -0800 (PST)
X-Received: by 2002:a05:620a:470d:b0:8ca:3ed2:175c with SMTP id af79cd13be357-8cd6d4cc1camr1436485a.43.1772747191067;
        Thu, 05 Mar 2026 13:46:31 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:46 +0100
Subject: [PATCH v2 07/10] mfd: ezx-pcap: Drop memory allocation error
 message
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-7-66a38741c652@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GLZGLUI6y8mTC1CoUCYnqXy51nlJ9FI78lkz9mC/UlM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmeJzlU8gtQ+4HiL7LX4Fy8K19t5RszehHhz
 SdtprdfKQWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5ngAKCRDBN2bmhouD
 1+uJD/9YHgJPFhEWQZRYuFGzeWe8z/r5Tj5iDNybutQ6RysEUkerwdr2pHTgfsRQ//1RBXmWi4/
 cGOD0AGUW3fLq4SM0ozdgKVp4SGjHe5iS324Xf1SGuW4PJtLu0+DMjDrfZ9Kh1ya+NqtjLYuctz
 EwrBWEFLt253pIx8JCBgt1U9C6IW+kSFzgE0q/6wqJA4aWn75PrcCxhf2XrRd6gNe80PoXhkOmd
 iPj9TycFnCTENdm1LWjcEsZRyEROU5nbnitPogh3z/3ryvudV27PKHPdqL/LKiQpefeIln5miV5
 ykVaKnRr187X1a0M6VOJWFeleyCQwr4MXqY4dHZnwAwm2mzUoSfV/+72TagqkdYkAtYsXcGEnp4
 qwXZqkweTKfvInlQcX+MyS6503tvm1UMD6Q2kjN2gSX82uO9lbiHdSpFRU093QPrKuJupoShmdh
 c+IRyPPixT8vJaH4ptL0qsHeVwM+TK/12/SQ7fPsshy9snxcABFZ0LKXOo30Nt2gevOrIolUsGX
 PNGgDwpP5Mj32fue94/BZgfPd3GFsPgp+6L/76kAS7UKVXl62a9ZGQ/jZEwxiu0d7y3zwBnCiYL
 sOSc37AP/ai745h4xjt63Iu8AQz/MLguOCoJxLgCfbcrRpy1BlqgAR349lUqdkuRtqt7TOnBopB
 uVBAFJuWvfRWAFw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ep4tTziW9mYKjL1c3BXJx4iIojiqDVEZ
X-Authority-Analysis: v=2.4 cv=Gu9PO01C c=1 sm=1 tr=0 ts=69a9f9b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3HoxRS3-ReI3PdwluWoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ep4tTziW9mYKjL1c3BXJx4iIojiqDVEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfXz3G7Nr+gBcJi
 g7o7u0+op6hbQqGrFQcYhl2l4hfhMV5pCQH0XkJBXpJqrACzc4z07qVeuYI4wZqWshJxNHfeBqT
 Ujt20QPt+oebNziVxpQH+tvYEk1ER5TdaHMLQDu1JWYGo6LX7Qspe7i+Mq2TAgqEUGjmEPIgieO
 AtsKUw9fiDUiZVe7RcReta9RgO2FLZ2oe343dneujJ8mfCx2Gnu7oEpv8F7kV28x6DIa1djPlZb
 +BSwtVtfjb9dN5lGG1f9uv3BCf1PzfF1RbjMqXUEWtthQpm483hWH+EHBLfXSKPx7pu0TPKOs9X
 zaUQbsW577lJhqpVdB31V7iVcG3xY0bJujzJGV9/BDkxBSmRgeo20xjXreE+xFVakKkYyUTM+By
 BmwH46huAgjg6TnltZ4vXc0pcwT2YbsiFeVo1RBqyadCn+f4xVDSQS9reH9B1J3M5fx02ZeeOsi
 ReDmnPMbyIuI2fWQcYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185

Drivers should not print error messages on memory allocation failures,
because core already does it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Further patch depends on this one, thus it should not be picked
separately.
---
 drivers/mfd/ezx-pcap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 24ca140d6a48..cd0520a08224 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -416,7 +416,6 @@ static int ezx_pcap_probe(struct spi_device *spi)
 	pcap->workqueue = create_singlethread_workqueue("pcapd");
 	if (!pcap->workqueue) {
 		ret = -ENOMEM;
-		dev_err(&spi->dev, "can't create pcap thread\n");
 		goto ret;
 	}
 

-- 
2.51.0

