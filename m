Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E35315D31
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402364; cv=none; b=b4dv3tjWJWm0BeTj2p3MpVd7iiDIcABm9b/AvSqofpEIqhswHEuwe5Zdv3rDZppW7imlJHMUlDFH6IAZbzopn+9R3sJ55IC8934e0bq1Knjkt2XAuqzeNrOHQQP7eoDbprWEPrB9YD2m5SjjqGcUp87K/kJD5il4dUsC75H7j6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402364; c=relaxed/simple;
	bh=zi60RThwEC6uT58cj6Q/kkhix9+cyecfzrsXBYVuP1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c+K32X3E8YUdiubep6SshgG5YDnTQY8teu2yTmuw4Szf48WSQEZk24o68OiIeY6KhkaMPoyXAzGfJP1jSN0Vd51CpwOQwsqKsCcNcX9WIytSbTsjwXOxLULMSA4NVvdoJDW+aGRIIGFmeZ1IZ+uMtBg+47Kbe2QNuCd0g92Rons=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TzBeFqWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmYRQ3Tl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TzBeFqWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DmYRQ3Tl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I6aHLE1943465
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Abn9qINMymGVFN5Pnfphqo7NCfbB6ioA+GMclfrnZvM=; b=TzBeFqWARdJ1hxzi
	FmZhJzxUQylNXHMWvg72sXWQQbKOoARmMAtAV/2yq3gYHtoKXaFtx0QmY0KBsjTh
	T4CQve3z+0cm8poATq1DvMpcFzdShtFRZNbuXVpe+2dajGzMcEQW11XBV/wJc3u4
	RCh99mNQtalVtSIZU4ucWNYjjMVGpfmeSjZnI4SRcXBPpTkF0qZp6IjjiE93/OCb
	aXFBVxxu1TilZEmIrw6ZGbM/cxmU8Pu/QOdizUb9gk7ERxuXq0SXUoM/oEshpcrF
	2ujdHvo4mNk4Cc4pmpHXOhJKZwcjHJ3bNuYO5wXwWAkuCCOdPNM7wnqz6Ukgzu0r
	VFIA1A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccq4g3b5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:12:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aad60525deso265703235ad.1
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 00:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771402360; x=1772007160; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Abn9qINMymGVFN5Pnfphqo7NCfbB6ioA+GMclfrnZvM=;
        b=DmYRQ3TlywpzBbP5A9fOoE6rylQKv938YQ7gnA39SM+Pak1G75DlaoapGrk96L+9sN
         2OFJcTVAb4m/8VwAG+1ulQYAycvc5K/9EIciAd9ZaFxXjn6vTlL4VoAh63aN31G3LWGq
         Jo0pbWKaZAQnGwhRV/fqES9DCZqZ8xYGyrJb6nTAjIsrYmpPfN+1BL83ip5nYgGrh5uj
         YKjDNXsSYvmpfQt9tzfRx6J6duGrLV6E18bMVvLTZZH2y2NJfr1at6e+rWjoHeZN5f82
         NfgybIZq2SxaZO1BE9J9CIncGcWOE5q5f7fjSn248PleQtzI2jHU4OvC1BOE6ZNK4Aaa
         diRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402360; x=1772007160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Abn9qINMymGVFN5Pnfphqo7NCfbB6ioA+GMclfrnZvM=;
        b=V/GMSA4xXEbz+4CiHwGr1G5dByet9jCaMSg8zqKNRMj6GDWjNhwB8qtyk99vvxloNi
         TBGQMNm/WdivklO2NgGTaS60eLY3zOK+x1E0+HvoIPGv4wJ/VKC7NLTxlI9LqgUt94b1
         XGeA2feW9kpDpVvwNrgsTifiBWGxbjgj8Cdukv3+9vLqzmwqOyTTg/o2+brqZLrgxYZX
         61xY9PYqhe8OTJDAgU2vlBvbo3VhbWHc6ujkwwL8HW3yaYcgfLHOpsirswE/zN5nOSt7
         mNrSVSglHJ1i9ys7mTwbrs1eph5sGjp86+69507uQ2kOzf5LI5pRWyYLwv+cZuSGyvJH
         CUdw==
X-Forwarded-Encrypted: i=1; AJvYcCWqZ4UE7hunkigQQfsHfS7fCzrbmIDgWH/9+Aj3j9bbzzT4wExrHJCYZ+32p4R8MukVSnA43Sv9/7msBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyA6ZDvvIq7Mvk2YGEuUQVUXBr4STctGy3WobXAk468Aegw3SNu
	83DPlERFbV1EiYcP9Gbu3xg9c2Fw/yu2SalILop5dFF8RBlbtPT04YYfIDfHsIyQ3D7vbGbFYMP
	0VZpIZP4/EpxIa1J7lBwZ9zsX6d/8h7SIjcLv7E77/EbXVK0wb+yNjS5OPToGTQcgMw==
X-Gm-Gg: AZuq6aK74uvQNKPVRqfJhv73RBBfwoMl2S6bV69SQXOJ+BODvda7U7u7E5vMmhKEhGO
	N1YhCYWcRuLpSSwvCHzYi4O0AMV8Luq35klvez10N8EdlMgiITMSQlyrpqM6/fmKteUvxPwI/SK
	MRYExPJUVkoD5wPCPRn5G8YFSfLA3P92/VxyA0EzHohYYSdyGosw1Bn57Y/F4CBl2pjBbOsXmwS
	c4j9Hhx+KBNPFTa5WHKkWojSqMmKS5Zg4kq2ZjEY11eipIhXAVmScmVZDRTTtEpyhRcUJhUN1cC
	u/LV4XzNtVRvOqnojFXWryB94p1dl8Vcj0iXjW27Ag2o7vy1aIej7jsDU5VBHbGFBfKDsXbeJIo
	fWNEGYnzyKPAddKoO3pIvG/NVTYgP/TQDE+b8M08aY9xFuukYvomibEEl
X-Received: by 2002:a17:903:1a07:b0:2aa:e39a:a7c4 with SMTP id d9443c01a7336-2ab4cf4f7f6mr150956285ad.1.1771402359581;
        Wed, 18 Feb 2026 00:12:39 -0800 (PST)
X-Received: by 2002:a17:903:1a07:b0:2aa:e39a:a7c4 with SMTP id d9443c01a7336-2ab4cf4f7f6mr150956045ad.1.1771402359100;
        Wed, 18 Feb 2026 00:12:39 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d624esm118123685ad.49.2026.02.18.00.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:12:38 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 13:42:23 +0530
Subject: [PATCH v7 1/3] PM: sleep: wakeirq: Add support for dedicated
 shared wake IRQ setup
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-wakeirq_support-v7-1-0d4689830207@oss.qualcomm.com>
References: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
In-Reply-To: <20260218-wakeirq_support-v7-0-0d4689830207@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771402347; l=4919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zi60RThwEC6uT58cj6Q/kkhix9+cyecfzrsXBYVuP1k=;
 b=noK8LQipAKG2D7C1FRq6ywjqy7FzAkbdoYSMHusSRkOVbJWZkG8O8YGXJVGOnOPjcZDn+4PLL
 FA48oqomtubDXYh3Cim6SO/3o29N4jvqzUymr5+J38HDqDQfqXnQHmC
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA3MSBTYWx0ZWRfX1vD2jbZvosGw
 o57BkpgN+ZzYck+Ml23jkjFV6/DpmOdHZ9uucFME0GypPqX5iTR4rHr7/NHCRMKI3SJD1fEoJQe
 Mh3ao6m6tNsstaCW1PDNMidqz3XJbQQ9yruohIqTPzNeVy5oNW8UPSrYll9AMS/xCHg7KsCpZMA
 gld8r9FFAfVVFykYzOjIbkXfw7LSjnIUWb8XO7xj6xMfoxsZ9PDG5IYPGo3kW5X3L+ROeBjhhEe
 bKihG5dtp0yp2duSDbwx/cVJ4SzElHqzxgSQq77tnjOKXw3Q08x5dpxr8MutShhDP9itfMqTlTH
 7AmV2KgWktUphnuvmBUlKtoMkjq8GEeaY01YuWvDqyh7gYmpZTkGpUaGAwZXZnjeR68dSrhUaMa
 3s9lNlMz+AWoQF+7x52iHwc5x9YNIyqwFGZsIkxtmlKuSY7gdaU0Zd6n2KgiXNdSCdJBNIvrEcJ
 sQ101BC9gPtAkdXEqSQ==
X-Proofpoint-ORIG-GUID: cBDEyAFrs0hqvV0you7-oYE9JRXuBLsq
X-Proofpoint-GUID: cBDEyAFrs0hqvV0you7-oYE9JRXuBLsq
X-Authority-Analysis: v=2.4 cv=YdiwJgRf c=1 sm=1 tr=0 ts=69957479 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GqrSgIjjxmp09zFQf4gA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180071

Some devices require more flexibility when configuring their dedicated
wake-up interrupts, such as support for IRQF_SHARED or other IRQ flags.
This is particularly useful in PCIe systems where multiple endpoints
(e.g., Wi-Fi and Bluetooth controllers) share a common WAKE# signal
line which requests platform to re-establish power and reference clocks
to the components. In such cases, drivers can use this new API
dev_pm_set_dedicated_shared_wake_irq() to register a shared wake IRQ.

Update the internal helper __dev_pm_set_dedicated_wake_irq() to accept an
irq_flags argument. Modify the existing dev_pm_set_dedicated_wake_irq()
and dev_pm_set_dedicated_wake_irq_reverse() to preserve current behavior.

When IRQ registered with IRQF_SHARED we can't use IRQF_NO_AUTOEN flag,
so after registering for irq, disable it explicitly.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
---
 drivers/base/power/wakeirq.c | 39 ++++++++++++++++++++++++++++++++++-----
 include/linux/pm_wakeirq.h   |  6 ++++++
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/base/power/wakeirq.c b/drivers/base/power/wakeirq.c
index c0809d18fc5406b224206e0c8e5028aa8f4183b0..a3ac133496d1aadd31a2a9517322f4ff1c5be7b4 100644
--- a/drivers/base/power/wakeirq.c
+++ b/drivers/base/power/wakeirq.c
@@ -171,7 +171,8 @@ static irqreturn_t handle_threaded_wake_irq(int irq, void *_wirq)
 	return IRQ_HANDLED;
 }
 
-static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned int flag)
+static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned int flag,
+					   unsigned int irq_flags)
 {
 	struct wake_irq *wirq;
 	int err;
@@ -200,8 +201,7 @@ static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned
 	 * so we use a threaded irq.
 	 */
 	err = request_threaded_irq(irq, NULL, handle_threaded_wake_irq,
-				   IRQF_ONESHOT | IRQF_NO_AUTOEN,
-				   wirq->name, wirq);
+				   IRQF_ONESHOT | irq_flags, wirq->name, wirq);
 	if (err)
 		goto err_free_name;
 
@@ -237,7 +237,7 @@ static int __dev_pm_set_dedicated_wake_irq(struct device *dev, int irq, unsigned
  */
 int dev_pm_set_dedicated_wake_irq(struct device *dev, int irq)
 {
-	return __dev_pm_set_dedicated_wake_irq(dev, irq, 0);
+	return __dev_pm_set_dedicated_wake_irq(dev, irq, 0, IRQF_NO_AUTOEN);
 }
 EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
 
@@ -258,10 +258,39 @@ EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq);
  */
 int dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int irq)
 {
-	return __dev_pm_set_dedicated_wake_irq(dev, irq, WAKE_IRQ_DEDICATED_REVERSE);
+	return __dev_pm_set_dedicated_wake_irq(dev, irq, WAKE_IRQ_DEDICATED_REVERSE,
+					       IRQF_NO_AUTOEN);
 }
 EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_wake_irq_reverse);
 
+/**
+ * dev_pm_set_dedicated_shared_wake_irq - Request a dedicated shared wake-up interrupt
+ * @dev: Device entry
+ * @irq: Device wake-up interrupt
+ * @flags: Custom IRQ flags (e.g., IRQ_TYPE_EDGE_FALLING)
+ *
+ * This API sets up a threaded interrupt handler for a device that has
+ * a shared wake-up interrupt in addition to the device IO interrupt. It also
+ * sets IRQ flags like IRQ_TYPE_EDGE_FALLING passed by the caller.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int dev_pm_set_dedicated_shared_wake_irq(struct device *dev, int irq, unsigned long flags)
+{
+	struct wake_irq *wirq;
+	int ret;
+
+	ret =  __dev_pm_set_dedicated_wake_irq(dev, irq, 0, IRQF_SHARED | flags);
+	if (ret)
+		return ret;
+
+	wirq = dev->power.wakeirq;
+	disable_irq_nosync(wirq->irq);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dev_pm_set_dedicated_shared_wake_irq);
+
 /**
  * dev_pm_enable_wake_irq_check - Checks and enables wake-up interrupt
  * @dev: Device
diff --git a/include/linux/pm_wakeirq.h b/include/linux/pm_wakeirq.h
index 25b63ed51b765c2c6919f259668a12675330835e..61f1e840745b56baa57db37563e450cb2d757a85 100644
--- a/include/linux/pm_wakeirq.h
+++ b/include/linux/pm_wakeirq.h
@@ -11,6 +11,7 @@ extern int dev_pm_set_dedicated_wake_irq(struct device *dev, int irq);
 extern int dev_pm_set_dedicated_wake_irq_reverse(struct device *dev, int irq);
 extern void dev_pm_clear_wake_irq(struct device *dev);
 extern int devm_pm_set_wake_irq(struct device *dev, int irq);
+extern int dev_pm_set_dedicated_shared_wake_irq(struct device *dev, int irq, unsigned long flags);
 
 #else	/* !CONFIG_PM */
 
@@ -38,5 +39,10 @@ static inline int devm_pm_set_wake_irq(struct device *dev, int irq)
 	return 0;
 }
 
+static inline int dev_pm_set_dedicated_shared_wake_irq(struct device *dev,
+						       int irq, unsigned long flags)
+{
+	return 0;
+}
 #endif	/* CONFIG_PM */
 #endif	/* _LINUX_PM_WAKEIRQ_H */

-- 
2.34.1

