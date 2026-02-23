Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF61B78F3
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831681; cv=none; b=LILqChTjFqFfAEWDHvmWa82Qifp+fuVQHbYpkUyjEh1L7CGSnYab8uoj3NFBsR2xhabhBwoaBzLSD0kGLKAAJzeARaGaTVIY0G1ieqZJnVb7Q3hP7+MWxiH7To/k3lnaflRJvuBp2g+noalk6l4pY3cUY16lBjcm9gcIOBtFYf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831681; c=relaxed/simple;
	bh=r9x2dulUi2i/xHeDpXgX0ZLrT/131D7Fe/8Z5nmd+1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KKSB+M0KJTPWzNnEBxKv+Vrb55cb0dXt4fmo5iyatG8s17H5FAgGvJyzGfN9Koy50KPwkIWkNctIvm0Dgx6eBpJgwHhorXhSUiBjHpNo76ea+iWoagGoWAxupMzrAfM/1fMm20ubO2dIU7x6s7nHSRZrDjvl/gCjBziHAVBvk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bXFefgdh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utnn2Imf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bXFefgdh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utnn2Imf"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MGdUYQ2318909
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=; b=bXFefgdhxPDsuijE
	pYnRuIw6NL0O9YNgYItg1nt7i4ZCQEWOoOkFJAUghwrB+umKaoiUYEtnZpPxNNPv
	OlxrAGmuu+grnE0hac0PCqTo2xII88LwC3ifwVKfvHze7LyFkgVMOAn4C6uMF0YJ
	8jmAdcTJaXVqOp4YC+mru81BehBD+pO8nU349x98rPbYDSELkEAXuHO7UYcyA+yV
	K0q+d/6efiT0GCyZpTSr8tHZ67dyXrgpKBBLC7c8thjs3hNPl4RTemJhOjlQSZX9
	zgOUbR4t5ODWBY2zjHg1jkLRKO2p5vtjTVKJ21Y/ynHGhui94xPGB13nXFD7ys/s
	uWY9GQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj3rfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so3812228785a.0
        for <driver-core@lists.linux.dev>; Sun, 22 Feb 2026 23:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831677; x=1772436477; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=Utnn2ImfuLTC3D56+Et5vdXZJ5KvfJA6GPyK1AN64F8Cq0tAKwYJyvgvKtsGkAYTj6
         spv/8VM5hAMkIPEjOWVJOzTCrbp51bpKffy3piuhhd7efFWw+ZfZUqEOd85rQg3VARjU
         yZpIe6F5l7a8fNoMxqCtvhKFhN37bsYzUWQrdxl9vRisZ4RJaiiIv1y/BuaYLoat3Upv
         Yx3ioeQVHvCFY9XC35dQR+5pFuePokIR5RkV8JSuJ/KF/72JPYXBbbsHKg6+NzO3s0UA
         HRfknvbJqEib9M3zcST4i3wrixfPEZ7vX+V6SpgpI3Kizj5HkVAxGY//W0yfbKsX2cxV
         MU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831677; x=1772436477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nrZc/Z7Be2A9y5DqcniQ9Lm/4gP6G87E802BvnTYUp0=;
        b=cQJK4JOA7PNdtYV6Qo8Jj1as3JoPSlhiQMhr4DPJMlXJ+Y0gAKe79nxNDIjP1S/ysT
         1Uy5kdm27psYyY3ZUHdjAFGt3ibWDI9BSCv+199pWRQuQG7NP1Tciu7LWCRUh/tmOuAG
         UaKn5rvmRR8b3gSY5TtsCIvj8H0CGY6WY4v1UEV3iSQRsI8/6bldejj1siR7EA1u0Vj7
         VD2J/bbd3Wt4Vqxj6F8aIZcXKjyseQMH/XH+zjcmD9CZ/Y4z/ePKFnKBqK33uZTOt7Ob
         w6Qyg80rk1Eca1mgB3/OYSjN0QanHnt8Z3BXxh88c+p2KoYln2tW5N89apIgD1Aus7ZE
         G0+Q==
X-Gm-Message-State: AOJu0YxcpXlxRJ8m2Dtdo0fq8SDGrNdxVM0N54nENImJzZSnoZFY9fhW
	4e4NUm5xgY9JTktCv/PQPaTL7dgcU8gDEDDDsRhUEFQM7DqJYGfh5Zm2gbATYx3Kg72ZJuUf8Ut
	4+aknuOSJto+EzbYlRJo2+qSEsMwGFA2C6DMr5EixXM3q//tWViT9XsjlWazjzWUxRw==
X-Gm-Gg: AZuq6aLmwUj4kHJ5N5GFtz9g0sykmJ/49PKMxedk5qBwKcSdqM1B9ZAvIuQSRUli/Sz
	UEj+LMz0JqjPy8Aj3n15v5OV7W7+Snwr8yrfiFPtMkRrdljLermlaMcEWoHZBtnhCvWjQO1j1ke
	Oc7fdFgrIDNOKhq2QLqk/gB+JaP/0EP4C/VHVR5rb5J59Vh7BZJuGVpIJcu0z0alX8M9V6+Ixrm
	CFFUFF/IXu41MvjtYHKBq/ZIzKuRQcE9ooOgUG+uv/3pgFDClbKvMK83LiFUvTeoqzZKYCJVtAn
	uCiwTI84QQ4rGfdON5u6ahFZ2kHC/UMzKtoN+VzdEiDppvW0+oI5ryRdTVdZTmMNYQoVxmJ5ygZ
	PWusENodfFUoMqlzGfktUJ/eaY7OGojjutEQc/RL1XCxiVw==
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760941385a.56.1771831676918;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
X-Received: by 2002:a05:620a:4726:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb8ca740a5mr760938185a.56.1771831676321;
        Sun, 22 Feb 2026 23:27:56 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:55 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:34 +0100
Subject: [PATCH 6/9] mfd: ezx-pcap: Drop memory allocation error message
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-6-10b3a6087586@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r9x2dulUi2i/xHeDpXgX0ZLrT/131D7Fe/8Z5nmd+1c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFrkKbfiaWJobMJ1uaOgm6ZHmwStj8BHlR2u
 vp1CSwCm1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBawAKCRDBN2bmhouD
 1zVfD/oC4r95LjZ3DM+u2Ns+t8NFjd9MPKu16F32jeMboQjnWCR9YCLIRwn7Fvr1TR+ff5UtpyT
 XBgB2Rx8udmj/g956wfXJx/U4gpvw4kMozdxk98g5ROegzSW+zpfBmSdv/Y0RkSJY7v5JcH18E4
 nWjB6GjTLB5VOxQQj3pioJknmyxmuwTELNXH+jJri9kT3Z41Bz+Klt2i8/wc91yhXb407gbpdfR
 4DvWYkfuiKiF3C1e4MhjzEzlfuG9qQD3KIscOucgJL+YRlX3Ey7sED06o+WoJPNrPK0QfFXhHZv
 NOLX6kWeE53OeTAgE187NhmpJzoj7zvcDbaBI31ndIEGgthZWx7pORQJu6zkRlU71fOtYDaid9J
 FrKtxYHV0/sGCkFHormsZ+GOapWYEhWEJR50ScVUbd9ULC4ZlxUxCBTIWhz+Lkm9Gv5VXaFcLS+
 7OxY4GcIIWlXpspwcVNxWaSdqZ9JRVxzaRyzkcKW3kuNAn523XVBOUAuM9iCufA13SLXkpczN+Z
 ZZSw0XB5klJtECmOL/uR9A38T4ef5aU9LT4QNNVIEmKT6SgLS7zCvlvFse5bWOgrryLV9WAJGQ4
 W5iU8ft6bo8owCRtIIzDxGrRgVlwrPd6TNb2HR4Nqzie8fw3AxXahDDaQMK6t5HaFml+MzTwWfh
 z7dV1TA37i7F3gA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfXxy6yVkZUFkWr
 Q/z9kbo6o+eoIdWN955gUaRwpduzKoKR5+PT2z1yYX4VXz4puRpk1YCgXpZsQwDavVKc6uBKip7
 pWaaPHWba/BmLlikS05Xc/Xj4HzVsLV+NeRBxICVvakjiZw97IzwLxueu3qlae9dHOqdZdJQqQm
 SxLA4P+ERC4VhSZNDmozU4swpKJuf0f1szvLVMFd+CuaWmAaT9WbfXaFCglu2nYzOAB7hm09ieZ
 EMFVPBhiqAko7s9RQA+fKI6oId3DV8r9Q8kCQOWYz2nhpQbpJzSZ8hqdg8dK6HAHaABfji4qQGo
 3hkIUq9N10LlezUye9CkrFW/DYzboTMpFa2yfA+FNXr505txZZXpG7HYpR3XEYpb6y0Vbrt9tpb
 3Pu2qj7IRQTRIdMM6kV+EhUlN6RIKXI4jL80TwRQRxoicyXOwngkB9JD6QItNFk33DptttjKul9
 El6nP7esUPlH2oxOXfw==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699c017d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3HoxRS3-ReI3PdwluWoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: D1r0hM3X6cgbeEJksEAIuAixhvU07D0o
X-Proofpoint-ORIG-GUID: D1r0hM3X6cgbeEJksEAIuAixhvU07D0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

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
index 1be4557b7bdd..13cb185638a9 100644
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

