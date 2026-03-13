Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87888366DDB
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385743; cv=none; b=XDsoZvIcxmmTTppQe6SSl63aZS1Q8FYMna9Vdp2jj0wCrLaxmJfGwIL6EovntPCYAwmTGWEqn+F+S0osWcBjzj0s6qzMYWYWMrejwuH7oMXx8T2ubgY47VtIRl2NqqKoD97wQqnPX8Cl0JcuRRMB5phccs69Bk3jvMr2ztOVcGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385743; c=relaxed/simple;
	bh=rZiOZBnfnYQhiYHGIxAvJ9diYifTV8qWwPU2z0ofvp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kaC9w4M5ub7v6Zwn5j41PDnQVfwgFuA4cKRGSDWADcLDqAQXwRyayKWhtxx4cZ9DCHXRLrF7Wc2HiJ3dCXEFUyRofdlj5EAQzCawiRGm/mCRfSKvHq6pelVqdq+2wQuL00a3zbRwukFdX3NUjw2K1XyTLY92rXkaYzDjMv7fW1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtQZISQ4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gmnuLbHE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtQZISQ4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gmnuLbHE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdsU2017772
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=; b=VtQZISQ4gXif4eDM
	f+9MBd27EG8icye0NwvCDGtfeiTqdpiNWJOYCUp7SPKQ6vVIG1K8wx/DJFsNH3Ha
	SUaTCM7ZGEQSt5PlCbDdMyjcT6kHxBq9ZCOsVTXOkOmsl9QA5n32ndJPTnH8sVGf
	Dx6ExBfVyWgS+SwRm4Zbep5GPcAABzlu/WiA2kKv3JTTc45LQ9uDMpW7Dy9ODPvK
	0eldBnWNhzlj5qlq9OniUuY+jczVDFqXkaRpFpIITJh5HPKSfG+63XWuBE4iKyMh
	IVH+3QPVrQu/m5WZKs0xBmJZjT/18lyl3pkQOP8bV0YU6bRuBu9zktQ5K/5Purxu
	w1t8kg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wvxqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:08:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b8bb5211so6400674b3a.2
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 00:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385738; x=1773990538; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=;
        b=gmnuLbHEiIvB8YaGRkYfRWoochXZ9/xeyBH0vPhskeMWWKaIaisfpT2TSwu7mGxMwa
         CpURyzyRVLOVYQOu2wY4SQoL2rsNWPPQIacCFLfLuEIEL88NWC8bRttD/RUEksWQdNMJ
         Rfejcvvm9W6BtMDB2poNl5hAJx+TmRLfZW91umD5Kv0yUckduCKJNRirVquzvF/ySPzo
         2UIccqjWZDqOWw9eDYiBIlIlQz5iUCMkrvS7uZey6K4+uiKk4ZAP1P6P5wkCucEkI7nQ
         GtJRjlft/poo28nenxrPE8scAyUKlkqBRsrRxv0uUdbVnW0gW1kC561uaYIT7d0/gihU
         NtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385738; x=1773990538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=;
        b=iWTi0y17U3NMi8nktKe6NrvU1JBd3cu4fnsilz/Tok4zTDhxDYBBh1L0HZAlYlLGX/
         tlmp1Z4W13QoZAYioPF2bXHwqGQhWGNgE1WzWPejy3AntMIhbF/fQyW/7Wt0AMbe7bWA
         wJ0Ue7zrnylziFwspl+YegHW2XS40pWyAp6Dy9IcxWuujfePHC4cTXHnODeu7ZeUlFLL
         IJx4RN2FSiEXpRLiK+ZEQxCA8KakxXI/EFtaW3vauQ25YUCOdTZEz5pxSgq4lfejk+wS
         h+799c97j7MhUa43/nFKAhVJY8mwgwZeRYfGCXSbCwMroVUPm0xTasfvmJ8YmuY16j+f
         kPFA==
X-Forwarded-Encrypted: i=1; AJvYcCUkcdnZHUBRVO0OUHYN776Epk7FkizM/Tu12uOHtdSPqGDp88Fx/bjrSOJp5QEXmNzdvc1a33C3FmW3tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqkSxSha0H+mHZgC96l1bZTTGdzBuj2K+l+sjXen2l2d90/uoM
	HPxj/o6/djooUEngAn+Cv2XIm8e48mk4evFZ4Jfet6X4Jg3nGrFEqAt1varVVgsA8SK6i3gNjA+
	5XvIPXsmjGhw4rA+XeiqjvTDYisreIJ4lcN0pevTZEyFvqID+xMEtF1ePUZRoi99eqQ==
X-Gm-Gg: ATEYQzx3ak3Po2MR8huiZR7A84ts9q2DWjaMeyaR++eYzLqt22WHHpchPDn+Ld/LVjG
	wlGPoJCwKWqoEgq9owbEOWEDhh13qQu5ZVq/VIJ4uZFDXZi83OsLvUoga4xkIMnQEycgCoS6WGF
	HsqQekB62X3FvhXh8rvcM0vXdejNBlv07yHNErYmFB8cCKUA3tBrhqqpu1HjRmvRCc+HhDZVSfW
	HtLbOTehRD/ZcwJhbRTjJkAVjbdXNK5TaRwKsVup+JCyJN6Nu0BCmgj4tvNDbxIE9CxcLAmdBAs
	2sH6wBRBs/TrsMlORHnBfnlNtZX/Mg8pBz38JAAEXlBH4jO9TCBDAaAcFZryRowNVQELkSH0pHm
	474jFPjwN3GLp52f4X32/BN4TyJrF7zJhMjwEwtUtwEu4p2QrfGP9KSzn
X-Received: by 2002:a05:6a00:2d0b:b0:829:7553:afbe with SMTP id d2e1a72fcca58-82a19952539mr1970555b3a.57.1773385738499;
        Fri, 13 Mar 2026 00:08:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d0b:b0:829:7553:afbe with SMTP id d2e1a72fcca58-82a19952539mr1970522b3a.57.1773385738021;
        Fri, 13 Mar 2026 00:08:58 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm5148536b3a.34.2026.03.13.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:08:57 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:38:40 +0530
Subject: [PATCH v8 1/3] PM: sleep: wakeirq: Add support for dedicated
 shared wake IRQ setup
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-wakeirq_support-v8-1-48a0a702518a@oss.qualcomm.com>
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
In-Reply-To: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773385725; l=4919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rZiOZBnfnYQhiYHGIxAvJ9diYifTV8qWwPU2z0ofvp8=;
 b=sK1VrvyBMnRqI17H0rZDdjGA2MW67ilKN3wCvOiI+I1r7BhnpKu8+OppiMuh1kfZPziuvlf4j
 840DYh/TkB1CtDnzPkpYqpPHl5+uafsLEr8iVy+8k4GhAvdc4Fm88jV
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b3b80b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GqrSgIjjxmp09zFQf4gA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: nvauQCZf2OW8slOcpyvwhsiTvm1CSeXf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfX3xEm38tux0hB
 O/FnhOtTektDyYS5jPgK6UNvLVMf8kTUk866qC9aOV+UKwAMpfcz2Lt2DXDdlfa0kRZDsX2NQ2d
 Q3hwCC4t4w+sB+vx7NkfhpLHgge/YZsydKPlj3x7+XAgFC4VDDUpMx5nidHZ0Q1Ri6D/exREXFU
 Ax6LMJ4wx1m4ZUUF68cW1xdjjD1hbO1KqsDS1G9wPoTbKeWgtctLJ6GgEgrGc6wCJKfPIvPr7zN
 DxslrVr0pY7EPBGpNSnQ8pagOw7k08IlLJdpVXkt/d4xiaSMqx9Yr4yc7z370epf9Jw+5QX1ZLh
 BgIZQ9h50DI4e3yiPHlEX9+Py+EbhWUFUDMMpE4RorEx4mtSPNWGolZGkQfTBoRDsWqdPW3VcAR
 n/gq2pALtG1ghrYxD0seMq0ha3mLX4Nk1CBGgoeOwRYL06zis1ajzlYFsetnH7uUBW5BhWeM06A
 pVx6viu37J6ugkTCBLg==
X-Proofpoint-ORIG-GUID: nvauQCZf2OW8slOcpyvwhsiTvm1CSeXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130056

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
index ad23f0fa5d1a5a9eb49b1af2288ee4908082b13e..b7b106f55559a7c85cb35d9e5ed22fe37970662d 100644
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

