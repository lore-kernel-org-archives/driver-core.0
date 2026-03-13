Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83036C9CC
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385754; cv=none; b=YKw1+4y/0cnyNHxPUYij1OEuSBe8noxMamy/BMWf9RVfepTg51+14/RjLCiK5/5A/p9rbiEon5WLqcASXq/EZKN7TqvwJX7brWTXkoNUNJrprD1+Ct5JIg8mnrM1QWVMyg7yYNUVPm2R1yJW4xyMtxVpf5/Sznk/euKqfPNAyfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385754; c=relaxed/simple;
	bh=dRR0utfxiVW1TMW7nZdLzpAZJ8WGa5nY3AdMtZ8XzxQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVaqyqmgBiUHLbYTS9ffK2+IKYlBhTDB6IASR7uQK4GosprCjbMTVGjutRcO+HfSavCzmI9N6J0lZX2fv/yC7JO7UBXPS4fdHi8iUzvKpq0/IVSDagW/i1C/7F+S2rVAHNd18mK4jrmiIkSaJn/Tqs29BYSLSiUMT48VbWBEr9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HWG0GFy+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=De2aPPYh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HWG0GFy+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="De2aPPYh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tleb2018424
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQwM/wT8NrUVJJ28qh2UUCUaImA9dv9ckAeGdiv9hNI=; b=HWG0GFy+nIllQodp
	sgv//T9ux3X4dUhX5R8aQ3C/6SP6nS4YL66BQOJr2wY+YPZ3cwcVmdKtGe4AjtNT
	7VnvOzGl356XEeyHEsqZHz+RA4FTZk1TmOKfCO6i40xwliLFwbqbEyF0f95Rzn/H
	iiwtGSAAmUu7n7eU1j+EnJKPC5NKRw0ASVoyo7LwNG35gZ7Zajg1OrJJhSGtBe9X
	Hhz9Kg+IzOmmWdufPZ2r9ETVFqsuUBsLC48dNqJ4jr9oeLUNcJ/gn+Zz63GZ7a0Y
	wuFvZVfXfzs/w/QcTseiGu/ckZ1XHAwCsliryFZbTA5RyvrjAjOvGh4z+/TWT5aG
	L5HRKA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4wvxrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e7f45e2ddso8468323a12.1
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 00:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385751; x=1773990551; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQwM/wT8NrUVJJ28qh2UUCUaImA9dv9ckAeGdiv9hNI=;
        b=De2aPPYhVyY+1D3luRI3zJbaFgZEf2fml6aJzWGvZHl70JGp3rWB88rHGjE9yCqF5C
         kVjIKgJKR+PXMFiFlTsgSbCCyTnKomnG1YaEOh48xv92xLuc9oDXhn+QAw5NuYuMsybi
         dE5Xwza2iI++un5y7u/+8SvsDLZUw5ewo41qF78fWZ+tXVL9NjjjC+SSleK9lo4UAvE2
         6Bzp0xuKqXpqeOSAjSGV1LYOAHHPg8r6HMzD0QWIsrp/bOVbTGGrv0gUO55NTuuQ3xqe
         Y91i68JCOw/TVhhKhZ+A2sPWiCmBRbD0rReOovQdK+0DUyrsKahqBs7E8KaebHoMfTQE
         uHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385751; x=1773990551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lQwM/wT8NrUVJJ28qh2UUCUaImA9dv9ckAeGdiv9hNI=;
        b=NTZhPbJ5Lxi4MPgJyQ39aGw3IGO79ibSNIdk1O1zfoAyyy9ToVsx4z4w+FXuzQjY04
         n1GTDEarMwBDyDxgCE52cuN4Z28clic/8WT4gutn+Z1I7hT3huLcculYbG3QE8lhwLKP
         fDxgmnJDpKqWH6PiF8NuyJ1KFjc9CRcL0PONmxYkuXeC2tFsNp4UIXNIgW6USYTHJICP
         1ifd/70NhUaTEqRUQJgPHZy8R172i1ZC8bn9sRhKbnknuoYfI2CN4QZ3I7098fRwWkCM
         2627ZfVd3eoG/7oAoijnsdfxYaS3b/oF7XLvOTvEytz4LQ9lNWMrnkh73Pden64nOTUk
         a1WA==
X-Forwarded-Encrypted: i=1; AJvYcCVHdZF7pq+w0/fnX7HC0ORi23XBPTy3P4/4tA7fHASSs7Mi2AKvYfaCCIEb3Ox4SY1HiGQIanUIM6Da1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yza60+YypSOcj/ww8GQnx8K1u2SIZ0Y1cFrQC/bgvGsscdBMewU
	PZ6U4zGFYc0+KKHL/eXZhb7P5SUQUpSmBe0G1VCWFzcy3UNCJCEvaKKXXr8+MP04ek/Nwbj+pxl
	HFROvYG5Qnxf8Gz9BK1AfJPU4jpkwUB76UpIAJXVJGUYU05ma5Q7RtD0xq8JXZu0f5A==
X-Gm-Gg: ATEYQzytCXBcrNDoyzwZ4S1omtnOIVIb8yAUzh98whOxR7Z8FUJvxhHrRIi8V6zwRX2
	0ymZooJiQ8XDJExTr3jsU11XmP3SWTebo6GlMnZxgszuCO1Kk2KEKH8KT36zrnlohYUkhirOblX
	o1n8t2trvy23T2VoqgS4Kwdliebr765TNa2tjAHK3WsDti66R7vwVWc+c7XruFM/o33zBWsPEQ2
	Q80Dgl/yp4sGIulp8Nfsz6mmmhb0GHF+iiYHlmP/GFOHBNJIRAr6UcHAK9Uc7bWyeV51pjsQD0v
	7DkF2AfTd1v3hsxizr4+hI7kE5+lIsvxycL2dzInQYFr/LWPgJWODhu5qEZYgf81bltpdXgtzxU
	kuUzktnhmVxQkAFMmB5PKcewA8HdMNhyN2xYftg2KdDpGT8EFOJCnIOm4
X-Received: by 2002:a05:6a00:4009:b0:82a:1428:da3c with SMTP id d2e1a72fcca58-82a198d717cmr1894917b3a.35.1773385750926;
        Fri, 13 Mar 2026 00:09:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:4009:b0:82a:1428:da3c with SMTP id d2e1a72fcca58-82a198d717cmr1894882b3a.35.1773385750379;
        Fri, 13 Mar 2026 00:09:10 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm5148536b3a.34.2026.03.13.00.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:09:10 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:38:42 +0530
Subject: [PATCH v8 3/3] PCI: Add support for PCIe WAKE# interrupt
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-wakeirq_support-v8-3-48a0a702518a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773385725; l=9592;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=dRR0utfxiVW1TMW7nZdLzpAZJ8WGa5nY3AdMtZ8XzxQ=;
 b=fLmhx0oZdoItLLNgEENY4IhUcvTmCA9X6MCXg7tPqlrQU/gJJ/fAAY5UgkWtvPpRYUe4UDDuu
 Rjg5CwFx6UdD8AojHu/6HJHeM70tcdQF6Fg21/Wp8jZ5jyA6odv0Ox8
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=GcoaXAXL c=1 sm=1 tr=0 ts=69b3b817 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=XVdArZcsv8hm62BSzCUA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1_5vg04_K-SbpuFdlmn6CCVUgCsGq1ND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfXw02CvUfGyta5
 2hB8Ayg71sMBlf58l9xYELaCZZntT91ncqdB4oseOfvzRjG/vnLnNOXnWMh+7UgbRe8ubo/6Lr4
 q0IGSYIIGJAEixZCdu1roinMIx58+YcpkSM3fnyek3re/ZUBHPtS7RStc0AGDYGkYX9nmB9ybw9
 DOGBmNT6dKss/BZjIOjeQh9mHJdhXN78pTuV3m6C706yMyVxMCl6I0dGBrxvyz/LjgrwpQZbVYc
 nlPx/s+djFZ+U2ia+5aJxxVL0f7+ixQvEXze2WHmOnf5qc8ZQfy0j5+VJHLmSeBvftdzkRprDDw
 jlbsjGDMvd1E9bGMsAPqhQ+NXKP6RSQGiaf/xKVcgUSBgg1RkiGtxEwzlBjaZKdYm73Qz3LRuM6
 QNhPseyRrX5P4T6rVtADPXDD98y3MT/hZ6Gsb2AyCmNSgdtlS+n+PXeRxKsH7qdcpl6CbcKvNPG
 W3ocJuolx487YL3Intw==
X-Proofpoint-ORIG-GUID: 1_5vg04_K-SbpuFdlmn6CCVUgCsGq1ND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130056

According to the PCI Express specification (PCIe r7.0, Section 5.3.3.2),
two link wakeup mechanisms are defined: Beacon and WAKE#. Beacon is a
hardware-only mechanism and is invisible to software (PCIe r7.0,
Section 4.2.7.8.1). This change adds support for the WAKE# mechanism in
the PCI core.

According to the PCIe specification, multiple WAKE# signals can exist in
a system or each component in the hierarchy could share a single WAKE#
signal. In configurations involving a PCIe switch, each downstream port
(DSP) of the switch may be connected to a separate WAKE# line, allowing
each endpoint to signal WAKE# independently. From figure 5.4 in sec
5.3.3.2, WAKE# can also be terminated at the switch itself. To support
this, the WAKE# should be described in the device tree node of the
endpoint/bridge. If all endpoints share a single WAKE# line, then each
endpoint node should describe the same WAKE# signal or a single WAKE# in
the Root Port node.

In pci_device_add(), PCI framework will search for the WAKE# in device
node, If not found, it searches in its upstream port only if upstream port
is Root Port. Once found, register for the wake IRQ in shared mode, as the
WAKE# may be shared among multiple endpoints.

dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with a
device and requests it, but the PM core keeps the IRQ disabled by default.
The IRQ is enabled only when the device is permitted to wake the system,
i.e. during system suspend and after runtime suspend, and only when device
wakeup is enabled.

When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume() to
bring the device back to an active power state, such as transitioning from
D3cold to D0. Once the device is active and the link is usable, the
endpoint may generate a PME, which is then handled by the PCI core through
PME polling or the PCIe PME service driver to complete the wakeup of the
endpoint.

WAKE# is added in dts schema and merged based on below links.

Link: https://lore.kernel.org/all/20250515090517.3506772-1-krishna.chundru@oss.qualcomm.com/
Link: https://github.com/devicetree-org/dt-schema/pull/170
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/of.c       | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pci.c      | 10 +++++++
 drivers/pci/pci.h      |  2 ++
 drivers/pci/probe.c    |  2 ++
 drivers/pci/remove.c   |  1 +
 include/linux/of_pci.h |  4 +++
 include/linux/pci.h    |  2 ++
 7 files changed, 95 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 9f8eb5df279ed28db7a3b2fd29c65da9975c2efa..b7199d3598b31b62245716c178a5a73565efc89e 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt)	"PCI: OF: " fmt
 
 #include <linux/cleanup.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
@@ -15,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
 #include "pci.h"
 
 #ifdef CONFIG_PCI
@@ -586,6 +588,78 @@ int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 	return irq_create_of_mapping(&oirq);
 }
 EXPORT_SYMBOL_GPL(of_irq_parse_and_map_pci);
+
+static void pci_configure_wake_irq(struct pci_dev *pdev, struct gpio_desc *wake)
+{
+	int ret, wake_irq;
+
+	wake_irq = gpiod_to_irq(wake);
+	if (wake_irq < 0) {
+		pci_err(pdev, "Failed to get wake irq: %d\n", wake_irq);
+		return;
+	}
+
+	device_init_wakeup(&pdev->dev, true);
+
+	/*
+	 * dev_pm_set_dedicated_shared_wake_irq() associates a wakeup IRQ with the
+	 * device and requests it, but the PM core keeps it disabled by default.
+	 * The IRQ is enabled only when the device is allowed to wake the system
+	 * (during system suspend and after runtime suspend), and only if device
+	 * wakeup is enabled.
+	 *
+	 * When the wake IRQ fires, the wakeirq handler invokes pm_runtime_resume()
+	 * to bring the device back to an active power state (e.g. from D3cold to D0).
+	 * Once the device is active and the link is usable, the endpoint may signal
+	 * a PME, which is then handled by the PCI core (either via PME polling or the
+	 * PCIe PME service driver) to wakeup particular endpoint.
+	 */
+	ret = dev_pm_set_dedicated_shared_wake_irq(&pdev->dev, wake_irq,
+						   IRQ_TYPE_EDGE_FALLING);
+	if (ret < 0) {
+		pci_err(pdev, "Failed to set wake IRQ: %d\n", ret);
+		device_init_wakeup(&pdev->dev, false);
+	}
+}
+
+void pci_configure_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+	struct pci_dev *upstream;
+	struct gpio_desc *gpio;
+
+	if (!dn)
+		return;
+
+	/*
+	 * The devices in a hierarchy expose wakeup capability through the 'wake-gpios'
+	 * property defined either in the device node or in the Slot node. So first check
+	 * for the property in device node and if not available, check in the Slot node.
+	 */
+	gpio = fwnode_gpiod_get(of_fwnode_handle(dn), "wake",
+				GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE, NULL);
+	if (IS_ERR(gpio)) {
+		upstream = pci_upstream_bridge(dev);
+		if (upstream && pci_is_root_bus(upstream->bus) && upstream->wake)
+			pci_configure_wake_irq(dev, upstream->wake);
+	} else {
+		dev->wake = gpio;
+		pci_configure_wake_irq(dev, gpio);
+	}
+}
+
+void pci_remove_of_wake_gpio(struct pci_dev *dev)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+
+	if (!dn)
+		return;
+
+	dev_pm_clear_wake_irq(&dev->dev);
+	device_init_wakeup(&dev->dev, false);
+	gpiod_put(dev->wake);
+	dev->wake = NULL;
+}
 #endif	/* CONFIG_OF_IRQ */
 
 static int pci_parse_request_of_pci_ranges(struct device *dev,
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 8479c2e1f74f1044416281aba11bf071ea89488a..3d858f36ab48a6daec645574ca9027d9d6f071de 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/lockdep.h>
 #include <linux/msi.h>
 #include <linux/of.h>
+#include <linux/of_pci.h>
 #include <linux/pci.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
@@ -1123,6 +1124,15 @@ static inline bool platform_pci_bridge_d3(struct pci_dev *dev)
 	return acpi_pci_bridge_d3(dev);
 }
 
+void platform_pci_configure_wake(struct pci_dev *dev)
+{
+	return pci_configure_of_wake_gpio(dev);
+}
+
+void platform_pci_remove_wake(struct pci_dev *dev)
+{
+	return pci_remove_of_wake_gpio(dev);
+}
 /**
  * pci_update_current_state - Read power state of given device and cache it
  * @dev: PCI device to handle.
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce6698514d92500dfea03cc562cdc2..65ca9551e558d2e3331fab0a968620d6b2a2522a 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -282,6 +282,8 @@ void pci_msix_init(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 int pci_bridge_wait_for_secondary_bus(struct pci_dev *dev, char *reset_type);
+void platform_pci_configure_wake(struct pci_dev *dev);
+void platform_pci_remove_wake(struct pci_dev *dev);
 
 static inline bool pci_bus_rrs_vendor_id(u32 l)
 {
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index bccc7a4bdd794384b7877d453c7989941471c999..372b0d2f4531ea53c0570608306a547101d59e7b 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2771,6 +2771,8 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 	/* Establish pdev->tsm for newly added (e.g. new SR-IOV VFs) */
 	pci_tsm_init(dev);
 
+	platform_pci_configure_wake(dev);
+
 	pci_npem_create(dev);
 
 	pci_doe_sysfs_init(dev);
diff --git a/drivers/pci/remove.c b/drivers/pci/remove.c
index e9d519993853f92f1810d3eff9f44ca7e3e1abd9..d781b41e57c4444077075690cec926a9fe15334f 100644
--- a/drivers/pci/remove.c
+++ b/drivers/pci/remove.c
@@ -35,6 +35,7 @@ static void pci_destroy_dev(struct pci_dev *dev)
 	if (pci_dev_test_and_set_removed(dev))
 		return;
 
+	platform_pci_remove_wake(dev);
 	pci_doe_sysfs_teardown(dev);
 	pci_npem_remove(dev);
 
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 29658c0ee71ff10122760214d04ee2bab01709fd..0efd6e9cb4d3d3beaafb42ea411303139f1150d5 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -30,12 +30,16 @@ static inline void of_pci_check_probe_only(void) { }
 
 #if IS_ENABLED(CONFIG_OF_IRQ)
 int of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin);
+void pci_configure_of_wake_gpio(struct pci_dev *dev);
+void pci_remove_of_wake_gpio(struct pci_dev *dev);
 #else
 static inline int
 of_irq_parse_and_map_pci(const struct pci_dev *dev, u8 slot, u8 pin)
 {
 	return 0;
 }
+static inline void pci_configure_of_wake_gpio(struct pci_dev *dev) { }
+static inline void pci_remove_of_wake_gpio(struct pci_dev *dev) { }
 #endif
 
 #endif
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..d1e08df8a8deaa87780589f23242767fdcdba541 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -586,6 +586,8 @@ struct pci_dev {
 	/* These methods index pci_reset_fn_methods[] */
 	u8 reset_methods[PCI_NUM_RESET_METHODS]; /* In priority order */
 
+	struct gpio_desc *wake; /* Holds WAKE# gpio */
+
 #ifdef CONFIG_PCIE_TPH
 	u16		tph_cap;	/* TPH capability offset */
 	u8		tph_mode;	/* TPH mode */

-- 
2.34.1

