Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA80406830
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 09:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591124; cv=none; b=hRnSXmvIHSin2AEarFUR3h04/hrBtykDDdNPQOnFtUBLOcyM2BPoOsYcmhiB5gf2K9P+6JartB7C/Y+2pXdwVJejT3q/kUQAtHbTFH3qf53h+HO/oWNR4Vr96vhamAuuJZNZBg1FBqqvfgeJLVW6nmsguX9rpefLqydZUBg0/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591124; c=relaxed/simple;
	bh=mcWMNv7HhsNiSp3DMmLXndV6/eLqusOEgpevEhArbcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHfCIRHy/TcKfofYO5v8hvOD1FyZsSfSLKmMBV8Hjw3pkgUY2iExkQMMkwpA3c0PQqpkU6Te+6oF2WRX+22ix6EGOyOqPHPzaajAmP0w1ONgN10t3yGLJaXwdnd8FVIRr1IwuU2wvpu3Gad5is4nXLG/VXWr/Bd8IG3Xn0OYpf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lvTSAm8y; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lvTSAm8y"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso16602645ad.2
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 02:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591122; x=1784195922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TJQhyYS4M5x6G4jk8p4LYaJRSq9L1d3/4D1LtBYsTE=;
        b=lvTSAm8yFKpP9l9+aXIgbvdhI3IBeIHicLsfHjrdHjt49Ll4UpYmQbl4VtYiJQsq26
         eYetfydw/Q5996Ldxc9id4IbpQvg/jHjN9nvMhTtE6av8SfWUGsebzphRucxJM5Zuo6a
         TSk13/j9Th6Mn+VycBUUrvOa+jhEdJiyliqY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591122; x=1784195922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3TJQhyYS4M5x6G4jk8p4LYaJRSq9L1d3/4D1LtBYsTE=;
        b=Ip62XZlTcZfU0YZ17xQoL5IJtJEyTU4MLv2xWIzC8mtOPwrXZEjR4LhdZfAe2GNirR
         2svhhOFy3mDsjGZ9p6NmqTfRB5aYiy3pVm2q8sYKAVEbgwgIOUH3GHtxp2evvg6U5XN7
         8DSrC0RRjVL1SjfMB93AzVfVAR76Ed5CTVZtRuToOx82JGNo1d0fyraWD0da2gpiKfDk
         B7LEyn8YPsJkfmFzdv4iEJYZ0YNZ6Ynei1mGSnuAMwYwJydc8bdu4UQVglTFjg2cHiT2
         UAiZP6rKA22kqsSNG9pEwsrpoy4WJa0QQlq8eRdh5Gd2UuFlZV+Eg465W4CvL0eSttob
         wLyw==
X-Forwarded-Encrypted: i=1; AHgh+Rqy21eAoQDGa5mj9BwJzg46MrkBanKHe07tU5fl+n5owjovI1v6r7rxItQJ04W0+IBPV4BcJYV0VdepHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YycyPSdrMqEMwWMuVZmYbolrccpHOmj+8iYwAaiMJMcJTOv1UGK
	ygDUOGpQwQRm8k9TWKGtSJpDvRuH82Y/pWmjRFdsOlX2vsCO0eyDPPKVZ08LtxUgyQ==
X-Gm-Gg: AfdE7ckedcsWNHU6sLscLrV1z/VUzb/hbOm2RUWvWMn7ts6Uu/QjfaLhYufvIOLgn65
	s5KGxPvoJP3kSV7Jq2si54eexxKW5IAtNPaQ5LCPdepSZLJFl58yRxZclSOuDTC5XjBXK3AbJTN
	5PoX/AS4KRPj6SKPNCeEdhilar90aJsUX0DVXHKF1nzPpSFHqkYw6NjMrsjjEOdNdOu+6HzZUOJ
	+uptQ6aLyX5hwogCzSfZu+qW433b4MXlaUltFjObqYpiCefJR7JYYdfS0EU7Ejxzx61S7d9SusL
	6t9Dpzq5TybBx/rneFGnZOaby43imDRvknfUm+VFrghnd94FG22nJmvF33RMenUuzuZB4U7kkNe
	mDIdGV7JOuDGAzzb/AF6pVx99/gPqrD2GOEaOzRCmiJ6G4cAm8To8U+qr/JDG2jSCjiMzzXu05b
	iuMvcIjGtNbWQO9cJ8X6J7fE9G/AFuCBM56C7cvLz36vEpY8qhYrnW4rnWavY41WL/YFnaUQ==
X-Received: by 2002:a17:902:fc8e:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccea40b65emr65003915ad.28.1783591122348;
        Thu, 09 Jul 2026 02:58:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:41 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v4 12/14] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Thu,  9 Jul 2026 17:57:17 +0800
Message-ID: <20260709095726.704448-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
UART for BT. Currently the driver only supports PCIe and UART.

Add power sequencing targets for SDIO and USB. To avoid adding a
complicated dependency tree, rename the existing power sequencing units
"pcie" and "uart" to "wifi" and "bt". The existing target names are left
untouched. The new "sdio" and "usb" targets just point to the renamed
"wifi" and "bt" units.

The "unit" names are internal to the power sequencing framework, and
should be confined to a single provider. The names are only
informational. Dependencies are tracked with pointers to other units.

The "target" names are the strings that the consumer uses to acquire a
descriptor with. As these remain the same, existing users will continue
to work.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Expand commit message
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 733190175f84..d67bf275480e 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -69,46 +69,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
 	NULL
 };
 
-static int pwrseq_pci_m2_e_uart_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_bt_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
-	.name = "uart-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_bt_unit_data = {
+	.name = "bt-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_uart_enable,
-	.disable = pwrseq_pci_m2_e_uart_disable,
+	.enable = pwrseq_pci_m2_e_bt_enable,
+	.disable = pwrseq_pci_m2_e_bt_disable,
 };
 
-static int pwrseq_pci_m2_e_pcie_enable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_enable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 0);
 }
 
-static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
+static int pwrseq_pci_m2_e_wifi_disable(struct pwrseq_device *pwrseq)
 {
 	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
 
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
-static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
-	.name = "pcie-enable",
+static const struct pwrseq_unit_data pwrseq_pcie_m2_e_wifi_unit_data = {
+	.name = "wifi-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
-	.enable = pwrseq_pci_m2_e_pcie_enable,
-	.disable = pwrseq_pci_m2_e_pcie_disable,
+	.enable = pwrseq_pci_m2_e_wifi_enable,
+	.disable = pwrseq_pci_m2_e_wifi_disable,
 };
 
 static const struct pwrseq_unit_data pwrseq_pcie_m2_m_pcie_unit_data = {
@@ -130,13 +130,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
-	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_usb_target_data = {
+	.name = "usb",
+	.unit = &pwrseq_pcie_m2_e_bt_unit_data,
+};
+
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
-	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
+	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_pcie_m2_e_sdio_target_data = {
+	.name = "sdio",
+	.unit = &pwrseq_pcie_m2_e_wifi_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
 };
 
@@ -147,7 +158,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.55.0.795.g602f6c329a-goog

