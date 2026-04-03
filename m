Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC22B3D34A9
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237641; cv=none; b=HK7VZAnwXYuiORiTeeTibUpzUWbUalU96p3teQicKN7WjE0JT3H+ah6s5KW7IFBoIQQSFqMmZnyLY7GY6a2ppKxoZlfZ1Cc+QT6alqGUqGJrgzUkzSk7GDYJYRNsx9Ypj8Unuqqn/1BEgetFy6i9CAiDFx9e2odsEmjx9+6kn6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237641; c=relaxed/simple;
	bh=4QSi4U79nO6Kuv75iJWSSw33Z4grlzD3UTlYLg1qQkk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MeievM1cCoAe+1PRGCXndNv3kJRHh4IMp7tJUovkJAy0seTqhjvAlp6CDCL431w0SZpBiYimJ2yhpFN2eqEF6rD11lN4vUcyouICbemKllMdKbqo6cIDw3Jc2nWtaoz04ZNXVSfFhg9cM2+EVyP8DalhC0zrjBYuW7bwtW3Dys4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZEfTlaj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlE//FwZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZEfTlaj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlE//FwZ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FF4FK947641
	for <driver-core@lists.linux.dev>; Fri, 3 Apr 2026 17:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=; b=aZEfTlaj1hsn+O3u
	8NFaxgxBssSSIgfmJGXdkmcSIP1+0WYi6Hi3fL0KK5W1FKpdXtnbc3KIAPaueurW
	HcbQys6NSgfYA7VSBSLS5qb90tfIiNbnJW5eBeLZYD7ZU5LZo+/ytXIAZZC24ZlV
	PDLPQlw5WLq7zjy2ZBitWZzQE4DTCQV1+MogRJRgsR1S2vMH+ycjDgqh5Sh2OlMa
	vH3btz4KuBwSb701RJitz66s+EyyGbWimjJ4Fu9YQU44sFUFYHVP1lTfIgOiVefg
	zOZzlAkA2jQi/yAU9BXflXTHSmNqNuC/qLzitcKGPl5K7ZmTmF1KiaQJhrZEG7la
	ESju+Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfkdpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 17:33:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso1115546b3a.1
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775237638; x=1775842438; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=;
        b=TlE//FwZmXsGU3UCeT4Z/wvKb1GTloE4UCvv5IgdOAz/yXouQtCWJHyAfD+XfHO+Nv
         uk71+4XdPwIeKhP4Nq90W6f6vftv+zyTnVwhLJ6zCCrp9ZVWw13C178RsPn7C3dp/BO9
         G5nQD+ytOBoZApHDi8Yib14g9iLZMRG5iaUtQDfHBirEEztT/wFQ4wgbs5JwGC13PUKG
         cxB62kg3SZJBKP1jmeCv+IUlRnpPWclkJLE51V0ZZYiA7Tsn6/mYV9TgOXMLg4yWgRLD
         IZXUU7yvLOU/ojg0aQiHInniTu20hKzN7OBcDV8PtC7vGd9GxGNarT21FBSQcg3G5BUo
         2jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237638; x=1775842438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6NWwp7xMQI5NgRMH63RnyN3vLoPe8JewDZUaKKorxg=;
        b=PCgOxYlAnI29vvPeZQDchtcHsP42FgRgDtVosUbN+K3/gOejVldjKRkLd8l1PyNdRq
         rvwRy150TDU6UWqxupjIF8MLa5l/9gHYoJAPbePq8Wp5zfGiiy4zl9ejn/n0anGUra6c
         7XmscsvAs2ZXAU6/B4W1YcYxKBnJK369cc/LNHkji0DvlLx7lobJODZQYyfRmHDKiHx2
         sdOgLSHS98aS/AMqVrnINSkfgMcKZclPHw4atoZEhEoTCNzHkjjIywjWiptQiNpU/a8r
         FkoEEsCV3wtpOe7geyffu57TGiBQVsq7v2Trc46prr4L31N7vYG4LaJ6KBX7td6sidM1
         792A==
X-Forwarded-Encrypted: i=1; AJvYcCW2amnHwuzOBjfWezJiZzknhfbVFFxwmLwKLOw7JuoJEWZf2Acnj2YBnMGG1TFJxpuUAbcprVgcaUZTGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFxDNo1xZxFw/ea9aPICCOuBkJ8d1zzcr1L0llZuENANYOgh+N
	pIrMeTkrx8Edf/6BP/nqxCZ4q8E7nODc9ASEGbSg31G/ISWzOA1/fm6vQZhcAgaMkFXPenYBgJG
	KYYEpJVcB4dZQzGyrDl1HZ9BYDQCSLuKFH6x5P1xkI9iZlNZjg54SatW+VKd2zyslnQ==
X-Gm-Gg: ATEYQzx7A9bPJ34gg9NzPxrjhvi+o05IZq3GP3Hjp5XqN5CrVjLJO1Vi368TNY3OVwd
	OcdCZReDH6YkdMkyWq4Kz+kq/R4eYqNhF/PHK3pp9J+/mSdlHjjaGIpF8q8LiMj1sD02L/5k9Xs
	/Wh+00oDgdQo3pJ1dKJ6KvQ8vE0DubLCOXeXpFQskc77hoV0RmpuuumtYeTrfndpzMAeaaPCcdh
	QHlYUAT85FLeMQ+hQrTq+3633E7qAjzE7BZiOYpNymY2AwuVkJWrds4FdIBv7x7XtxrlIqS5Smk
	Huu08qusGwMujcUWJalS3uhNlNAk6cJ3I3VEd8OMCsdnsrnRmA3jAwsKEyCSHZeLJZ+Lm2c0jdR
	NyY8VMr87duSgLs7jQYAWj8ki2jwzR4phlF7B/M0hro30rRFT0zQMkweA
X-Received: by 2002:a05:6a00:3d4f:b0:82c:dc9c:e765 with SMTP id d2e1a72fcca58-82d0d749427mr3930142b3a.0.1775237638444;
        Fri, 03 Apr 2026 10:33:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3d4f:b0:82c:dc9c:e765 with SMTP id d2e1a72fcca58-82d0d749427mr3930115b3a.0.1775237637915;
        Fri, 03 Apr 2026 10:33:57 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm6359125b3a.18.2026.04.03.10.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:33:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 23:03:34 +0530
Subject: [PATCH v9 2/3] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-wakeirq_support-v9-2-1cbecf3b58d7@oss.qualcomm.com>
References: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
In-Reply-To: <20260403-wakeirq_support-v9-0-1cbecf3b58d7@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775237619; l=1418;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=4QSi4U79nO6Kuv75iJWSSw33Z4grlzD3UTlYLg1qQkk=;
 b=S3BBZnE3MjxvBLw9tw9ecCrgVVwynC/kNl/NBJTEmrlZVZtP/c6mx9OmMyhsxVYd5XSpcq4h8
 ahd7a5OtAF8CGyTIaMGUzdN/cOHXYeBoxs6bvGKrSadbndkpQ7xGY2r
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: iULUbZBWi3jC-Z79MRn0L7MXjFjUTU9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NiBTYWx0ZWRfX0wykD1jsCg7a
 cy1e2aUGpnC4sd5jdfM4TgtRzZ/NixMwuHbBJbRjOQCWksJz88b25CcnAmoHilGcZdMjN7YzH0n
 22X1xrooGage62IwBW1kOVT8Nj+eJ0ZUJE5+DolpIIJ2s5F4S68vHO4Pt43Bv7cMkTWYEdV40Hj
 DAMLMi8di9pRkoIIf+Qp0/AoUeHPQxCbuVl+usqhqtN4VqX/eT0qcOvxFb9JNW1LuvM6cscGien
 cHA774nhBVCVp3HpL3E+FDROi/jPQvrxfOS/+yshlbeJH59RlJYNPpYb8DvnmtoxV7bi2/wp+9V
 gC0F+X4ZXICYMuZ++M4D3X9Mx9cRF1qAsvc1wdkr7wHVbGr/6NyGG3KaaAVZ4klD6kR1amddyZs
 UZa/TjH9VtTeLl6LGpAzV8KyV+42rqquSAEKVx/HcbGGVjbpUv3fJ1GIWWkHFT54O55+wrtz3Ev
 x08ou9iznfmQ8CUOszg==
X-Proofpoint-ORIG-GUID: iULUbZBWi3jC-Z79MRn0L7MXjFjUTU9F
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69cffa07 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030156

Add fwnode_gpiod_get() as a convenience wrapper around
fwnode_gpiod_get_index() for the common case where only the
first GPIO is required.

This mirrors existing gpiod_get() and devm_gpiod_get() helpers
and avoids open-coding index 0 at call sites.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0d8408582918680bfea6a04ccedfc0c75211907a..fee926c0262ce9dc4b9a3c151e74f2cf37470a49 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -596,6 +596,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
 }
 #endif /* CONFIG_GPIOLIB && CONFIG_HTE */
 
+static inline
+struct gpio_desc *fwnode_gpiod_get(struct fwnode_handle *fwnode,
+				   const char *con_id,
+				   enum gpiod_flags flags,
+				   const char *label)
+{
+	return fwnode_gpiod_get_index(fwnode, con_id, 0, flags, label);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,

-- 
2.34.1

