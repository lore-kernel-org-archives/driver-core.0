Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A0A3E7152
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105729; cv=none; b=aJhjdSsOhDlFFUzyjnesTdRNrNfVLcRI+oKxZJUpYYr9uyVFBvgxr8q9JuNjxGKHIAEbOljggMCrpLJ5VOOVlL1tDI63C601JAz23JQ7126cUF5cKghdKZ7+97hXyFsZuRi5gdzzFddQWCSY8uGUKuD7NYfmHnyvQNWaQhZUW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105729; c=relaxed/simple;
	bh=5/IN0+syw1+quFd0dmc3wlZb141a8fcAYXzlkitn7j4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MrOeoI3mxaEmsTg5I5ACssYi1zMXQUCG+p7/PPGWvon0VEUjfiNICjUzXym9sNq+DMRWulBfOd5WpDAahkimfZr/Kpqr9tbeaV2t73SdsmTAsFx3b4FH4oRHh6R/0SiFSCe12v3xEy4lYvNw9qpOcReETgl38zlgbErneppuL74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V60rgU8O; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V60rgU8O"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso2954754a12.0
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105724; x=1784710524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x4sxxYjabBMDuNPYs/dekkLCAVyFQe7dZPVIfnECI90=;
        b=V60rgU8OCmwD99Wg6ikdu/tF1oehF1nIaUWXEpwMY2mnuSGfiKl1PyAJw/oJ2a+4a2
         am9BQ2DVUuZ4ThmLvhZXFTRTHj7Pb30DY/y5Xrb6I5sq6nhV4yprjKs9JfrcjhJzIMMJ
         waT4k/xO4r8S+DZvPFzZsPjrtzC7AQ4mSAbHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105724; x=1784710524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x4sxxYjabBMDuNPYs/dekkLCAVyFQe7dZPVIfnECI90=;
        b=AeE2ORFl0LAkA27NClR2IdVAKVHXGxJH/fnUePbfTuZD8b9RZjhcrlbxd/yzJTxR1P
         42ONgIGmwS8ILTN+t7jSBCGBwLxpXREyVL31vitlDDgtx3ncA3vBIE3F8q0ACnwQdajr
         X2zb3Za5VL3IQO3Ob7Fn0Ipx0yZUMOTXnBu8rXKYzolFnFQyG1yla+L4lU/ZxVRxyE8K
         56H/ZNeELkBCj6tzy6RE1kaHvT5H1LPbly5+IHyrSRpKE+KGchoESz7shcvTVN4AtOoj
         89UrrCm8HuAcDyx6lsEmvZ4JYZ+2CY5K6YsvadUKp8o0UBuhnLSphPQp0UNEDH4aJvJY
         v35w==
X-Forwarded-Encrypted: i=1; AHgh+RppUw38HwryFK8kEgyPqHxopMmiPbQ3yLw91cMmuoiXtlr8mkF9r7LYjuZbKgV9rOAGJn/B52yOkAKiig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf8H9tELdXGm1NrkklPPDDBEu8nz0YHRc/trCQEY0vFoWrz4Ib
	kEG7JFwjIn1XF491StMYQGrmqA440FcMuMftdTIEOWOHqjfZ9RU7zgNa/6Y+eZ6aow==
X-Gm-Gg: AfdE7cnRd1q2vRH5pzpxggYMWAz26tGXiz6mA4111A7AoNDEnbECA+k8Mdc/olmtXUJ
	0lqknVuDYiubN7bZGDjM/+3JfvuQSOM9mxWr6du7Vg1S47Gmpls2uPd2AKlfdoRB3jTwQg+Tr9W
	EOnP08RI0evjmnlLfR8Fxpr1RVv6ZXnFnB4DYihMx33FbBTHSlnfgqVRy3as7A6TSYShle6H6vs
	YOEXua4xyRqibPTEY8OBKgK/oag1ga9ES4kL98io/VWxn4Qhz5KStm5ACjSBNAnQkyuDSTlpQmr
	qxE2XtKkmSB6tR6/ETHxm3FfIqKuoRfBuViZXXdo6/p6hzENcS3RYyLMrmkMWFApJBKqZIfT/M5
	FDwYs1y+HL/C3b7KwxTt4IwbbQvhM+1CKR3rknHq4enMBoOobpwkzYGoofYLY+iyyoFla8AhAww
	2gmCvrAiGItzNj8P0nuGkPMwRvY69snZTQW15JhIgJH3KgBDiZoc/U9kUDVkGpFdGmRsMgIuUV7
	g5KrQLB
X-Received: by 2002:a05:6a00:12e6:b0:847:712d:19ac with SMTP id d2e1a72fcca58-84a67242621mr1719045b3a.8.1784105724146;
        Wed, 15 Jul 2026 01:55:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:23 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v5 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Wed, 15 Jul 2026 16:53:44 +0800
Message-ID: <20260715085348.3457359-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some UART / serdev based Bluetooth drivers need to be able to reset the
hardware during initialization or recovery. This is not possible with
the current power sequencing API if a unit is shared between USB and
UART interfaces.

For now, split the Bluetooth unit into two, one for each interface.
This allows either interface to independently toggle the power, with
the last action prevailing, thereby unbreaking the Qualcomm Bluetooth
serdev driver. This is also needed for the Realtek Bluetooth serdev
driver (hci_h5).

Having independent control from either interface unfortunately means
that userspace is able to shut down the controller from sysfs using
the USB port's "disable" setting without the serdev driver knowing
about it. On the USB side, independent control is also desired, as it
allows the USB core to power cycle the port/device during faults, and
for userspace to initiate reset and recovery using the aforementioned
"disable" setting. However when USB is used, a serdev device is not
created, and there is no conflicting usage, which allows the power
sequencing to work even without the split unit.

Suggested-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch

This patch is _not_ squashed into the previous to provide clear context
on the change, and the less than perfect nature of it.

I think what we need in this case is some sort of lockout. The serdev
consumer would want "exclusive" access, locking out the USB consumer,
which can tolerate "shared" access.

Something similar would be needed for the WiFi if we ever add support
for SDIO for toggling the state of W_DISABLE#1. At least the SDIO and
PCIe reset signals are separate.
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 693b0d33f8cf..56e4f40e0480 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -83,8 +83,22 @@ static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
-	.name = "bt-enable",
+/*
+ * XXX There are two Bluetooth units to allow either one to be able to power
+ * off and thus reset the controller. In practice only one of the interfaces
+ * is used, so there is no conflict. However userspace could power off the
+ * USB unit by disabling the associated USB port, without the UART unit or
+ * its consumer ever knowing.
+ */
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_uart_unit_data = {
+	.name = "bt-uart-enable",
+	.deps = pwrseq_pcie_m2_unit_deps,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
+};
+
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_usb_unit_data = {
+	.name = "bt-usb-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
 	.enable = pwrseq_pci_m2_e_bt_enable,
 	.disable = pwrseq_pci_m2_e_bt_disable,
@@ -130,13 +144,13 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
 	.name = "usb",
-	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_usb_unit_data,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
-- 
2.55.0.795.g602f6c329a-goog

