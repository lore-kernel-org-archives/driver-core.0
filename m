Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A5918AFE
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775237637; cv=none; b=AfpBZpyndZRtquupvdWCuJ0otBw/1C2SvdH5i9lPIPpgH7r8fHzXoiMH0FDaSHRg34PFu7yDqgUM780cH2hZ8O3nWfxCx58Qwf+9EFTXx0trVQ6yyLZC+nHyRi34OqWYtBB1FtXsTebjp+zBdWPGaw3e9+OakCh3w6WEWSn8yX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775237637; c=relaxed/simple;
	bh=rZiOZBnfnYQhiYHGIxAvJ9diYifTV8qWwPU2z0ofvp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xjc3zZyha+IfZzmHjZ0p0r6ylsPz+PaGUZGknXOxoBO9jsMyXckQxxH1IaW0k9WWIfTl84Sn2hnhypvQ2pdvAOhlKOCH27xISCHISMTXIkPPWvx8jHIGjk6pvJrnmyzVFPiP/Fm9Sr6W03DBVS7a12iZJd/hdBmMla7h+Spts3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqeG9Sey; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/rYRYuJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqeG9Sey";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/rYRYuJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633B1diI1453174
	for <driver-core@lists.linux.dev>; Fri, 3 Apr 2026 17:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=; b=dqeG9SeyGxu65jgn
	253UAbPLB45tHnHRPFfTb/GgGF91MtPxXdQq9uG9TLgV7Li7MPEnJ+fGGDm19+9D
	LKQzsJSTvzU7HA58w6YY+idGppBEOqgKRjEruPFJ4bx7kubqHIBmV5XUnimaZF1f
	T4G9xk6lruJrqDo4oGpSBeXzde097t0BKCCczSNrJ89+W8ZhHGyiUpFVjMkaL38k
	jWJOxNlqaju4iu1PE/o4wN1CTer43klBXDPb7iV7EJGarsIav29LrGyNKbY/llUa
	nZFcYqhjoUdH0HouloI+Wjp6nUliGgMREX6BV9obnJ1DEeLRt9IeB4LC1pCxob4a
	MPBAMw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dacam92y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 17:33:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7414516609so1485383a12.3
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775237632; x=1775842432; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=;
        b=J/rYRYuJw3FyLdjlG76D7+8ia/hDNg4St32LZdM3VzJTK81yLRzJX0fMI7dRI76+HT
         +U2M3NIhD0nrNTw1H5AhBS//mXXy7yhPgghWkgjcVjkyIL9S42L3sOCD6W3aGNAvGFwr
         WVA/xaE0l3qvvxGohzu41oCrLU1+wFOqK9B9dh+7I4lP2iSDn4emkTwXXD+f8Ich3nd3
         wD71GWemVgUMM4fTxxDESammxApNA/qqYvYjha+SOx7QgR45/SB1+6HgIzc8lCAnqbSJ
         FyarFEl4nGFO2Bi6H62C9Qlv8eIjNDjDDX3ZM5kcPGDfa1nsV4CW8m27NdpNjFPShRQv
         RcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775237632; x=1775842432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vcScscqC6ncRDOFK8ujM+tWz/LTHnr7UQ8J+Pxb8j2M=;
        b=H9m4qEO8Jt/tV+L1dpE4bRodsM3/2/PmG3vh0vBVeyZyqP5IBx2G+e3F6JrtinjcM6
         jB3jRltmKNOTfizxRARaDcRlsx7IrtGfhU11NmJHcMkyMln1VmTi/nmk7WCAvyyr/oMy
         qX2ZiiuDdrIL9MlqmbbugyzTGdslZXfXdOQnPMPRWjEqKE2qTCBF0E+W3JsPppRSYZ2i
         VJEsqigcgigoiR8z32/AIuLafpkU4oPVg9iUVTxaIBseWfF5dkzQDm0eFprpkjaOZXGY
         sts+HrZqzZ7TnuIMQ4FiOKBqdqNxuxuVANEc5zieqSZagqTpUPVTMdyU7Dwm10NE8zkG
         3VAA==
X-Forwarded-Encrypted: i=1; AJvYcCUUnBS5Ys/qqPrfEb6u1CYlpjm3dtZCuxHOlK9kuyhtggZca6sdCKu6t/s3t13wTQfEHSgl7WEBU1Y5+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyP0i5XLa70JVQ6Y1bCrgGwZEqTMyHtmXghQGEDzlZTYwGdrTKc
	DPHbcAF4DymzfvPsqqHrA+0VC2N5uljA/zEJ9o5sKmyRko9VxRhYR29RpS6i5uhNWQtrQmxHKIc
	erRkiBZn4NriaFQLCtIzohREeQTD9kN8d2pj6IqO0yOtFOQjCvEPDgJjOcZEMajCQKg==
X-Gm-Gg: AeBDietz3DWGyvBX5+PQC57yTwDWiF/kDmD3pCa4XiYhBQhLWDmpkAYBLaNqkeZGJ4h
	oDmQ7XzXRpqcuw86BhFaRCFXo6skkfBN3XGTfoARe6126ibnhv871jLo3/ld9udg88xTfQVGoWk
	d4yDTWZhIPXF+J1gaGX3QtHymZVG0em6dZIsYy7hKLakNV1IkqCMdNn9eZljg016VvvjwKQwG+m
	P/4NUswBYXU/Kc3yHQwdCbM/7caSm16Q98eALC2IzFjUa7tl2gJQLs8fjo7Os0Ip9H0CpFqepzP
	v+ypwGKsOGzf/KUrePYu3Xiyvz91pnJykSvyHjwveuhBhyTbSiFvBKmpZ205MbClY7psPRWZtDF
	+QrgtHt1c+AxwmTpCN1eQ+ao/lhSvPYzW/XEqkUr8EFQLQgKRLSgHlTlE
X-Received: by 2002:a05:6a00:4513:b0:824:a0b9:64ee with SMTP id d2e1a72fcca58-82d0da6701bmr3354483b3a.17.1775237632095;
        Fri, 03 Apr 2026 10:33:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:4513:b0:824:a0b9:64ee with SMTP id d2e1a72fcca58-82d0da6701bmr3354465b3a.17.1775237631551;
        Fri, 03 Apr 2026 10:33:51 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3e169sm6359125b3a.18.2026.04.03.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:33:51 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 23:03:33 +0530
Subject: [PATCH v9 1/3] PM: sleep: wakeirq: Add support for dedicated
 shared wake IRQ setup
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-wakeirq_support-v9-1-1cbecf3b58d7@oss.qualcomm.com>
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
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775237619; l=4919;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=rZiOZBnfnYQhiYHGIxAvJ9diYifTV8qWwPU2z0ofvp8=;
 b=AtVe7Za3lH9ooZtSOFwQ+ddqgaaMkLKTsqDn9qYDBQyyFK+dX9FjNqWehwfP9dUX65Fmih+Dq
 T8CyWBsudwtARHgL1Bug5or/c6NzndI5Bwt1VErpm+i0QrfSWhK0PlH
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: Wq4hgoW3cXhe6eTLBz5okioss4KI9gq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE1NiBTYWx0ZWRfX60n3d9lzPaaO
 sroICxUImrWU/Cf8Xh9hhhxIWl2g72sPJ5hn/fgX/lQs4o4WToNoT8o82+yZio3EoUmctt4LdDi
 b2nrZfUDNppNiP9tenO2fpaB8R1ou3wtCUBGODQ25ng2OWm1u3kT3NqW61c+BKxOqp0TQ1M3WPb
 y5ak3H5aHJQbbf1QZm/KgmEDkZIbu7hXvoZa8saBdLZ7zdDYMsX64yyPW51NjooaDbncYFlAmLO
 bODCtY9XL6ugoOqDnvmyB1kswuvSI5KE8K1TDa2oB1Gftal7He2dT7tw+5flq3c2z9N9k8KnADs
 kwYK2sEQ21OiC667lT/0bYiYKhysUA3lLEgCKzRvS7yMq8LTtTYr4WhE6AyAmnILJfWYt+j+RjV
 Zm0jsYi6SnO+4O/1E62ch2zlFtis8vlig+6ud/fyeVHSQKOnYHJuSmT9YaK8/v18ff5EiYyr3uT
 Gb7Cjed/NqOYulHumCg==
X-Proofpoint-ORIG-GUID: Wq4hgoW3cXhe6eTLBz5okioss4KI9gq4
X-Authority-Analysis: v=2.4 cv=ULXQ3Sfy c=1 sm=1 tr=0 ts=69cffa03 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=GqrSgIjjxmp09zFQf4gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030156

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

