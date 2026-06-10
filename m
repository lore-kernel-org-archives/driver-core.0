Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B67B3B6C05
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080929; cv=none; b=gfOQ1WxY/4u+vcmJdp5XbCv+tbbdx0kmGQPd9MaCq8usNkESiKnNMiUTftbW1ONZq8QaWqJVNGyPKSlbyoJjCdWZHDVngTIEBfUzEhk9RYjv9pgEi9O+TGlJNrZkHgb5EfR0c82BcQp51VBH+Am4NenfbM9RUqhI8SiRF5O6NCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080929; c=relaxed/simple;
	bh=aM1pKeD/Vxy8p9xU2vujlhCyS6zAz75iUguBLngP3eU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKNYZLgjtoa5kt80Oh6lP00wXIl9ZcYDi1S0MZrdT5rgdu3dRHFyt5LuOOe4lrWBaowFP0631ZGm/muIEIimpdDPSxT5WZ613qJRX/ELUKuOjGHca1YE4KP0eanKnP8CQg3u+kthPSzw60hDVcXrNfnffarV5ny3/+M66QyXROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WLLj6fKS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WLLj6fKS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0b944f6edso66411865ad.2
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080927; x=1781685727; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=;
        b=WLLj6fKS3c8/sOSFII6dsvgHppAcAQKSDBwnYk09eOY+TxVvfhDASAKIzhzh4xwlms
         mMEwU04F2XW9twuKGbOPAJeKdeBcrxKrdGmWTRWA5z/Ya3czhl3u3UTSP/5+ZV0OD5Es
         ZeKc+550/cxVacSaxADmqZUb6Y8FrE1idH7nA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080927; x=1781685727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oapuTl40hgb4G5/aDuwYBQkElchJu8zWsaiRUCi5VkU=;
        b=sqHlaPbbYXsXTV7p+j7iPz1/N1sN9wbj0dAQ3dDpiyrxDp7N6URtHg4w8gM0C4mxSJ
         HNvb6YKlUHOzeT63UkqcDFE5RQrw+qCN81zvRoYw5J55eaKjo9tEO5vKLzeX8so91RQy
         UmDPzzUsXVEqnOS4+gGwGHJ5rFUzgeiDPiGqMYJ6gBFcmbsRsIW9upoINoNaKizhFGhC
         4bFbF7+dbDjSok2Me0qsXSmRU0kwRVH0mJPkaT/uZT7+dm2ZzpxZiWr0wZZ5TWoc56Rg
         iOs8j7Jsi0d2H2bqHaDz/ztc+eGi5oE7qMfrT0GQF9h+JN1kJdx96g7+3TqTui843V8y
         Mveg==
X-Forwarded-Encrypted: i=1; AFNElJ9Dt0rzzyAuh8mb/bn6kdrQV9A7yHDGeVujJd/bZYBrcjM/QWZboENdPPOoQO5Zk1YpnAhTHBVhVB2BTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxReaLxldnbBBCDRFsmTWxKH6C1VcWRUdyK+1LIb3Cz2ZirYqgD
	EeTngohybqV85FUN0a0XAVP63XxRT9PS6H4480CXnLGDlSaKNi8FOQI7+FyiDZbJWA==
X-Gm-Gg: Acq92OFsX3k7aXMSWrQYdVR6Z8WdYIOdCIPdI7HYThqYEC8j9ekAZjA9vXB25BxTwDo
	0ZcfYKo733JwfYDBx8wmF4HaM+ntoBN6xyCuWyEPwTBKb4eI2XNEbU6lYueQJgQ7jRxi6okLUHH
	U/TU77/i5rHP73OOaxN8IVi7vXsEFuKJU7GrmXoZBfs+ZDjSVJO/eIUKlYE8+7tA9y/AV9KWnX8
	MBmXe6Lt7O5s7mivdLA8Vhm2T4wj11UdtG8N1bqGTSViBD1Jz2NJ75S1b/wlkrblQ4WUhx30W3o
	bwOic1SjCcolvt4hsrpr1IiuUbfE4Csupz9HqfUUQJgBPphs25QbHMSO/fdNzatdLg96uPI8Wps
	Azqho9J3uQqnBL+jmb4O7k2aalrzfuF+XoUwtjSbpwsE4QG2EMZDD6eDBY8zNcyr280u5e8M19O
	AdJX5A6qQbGwH/6TbMAMbTToiV6VIMYs1EuTPru5MTVky9AQnJyvJqqGcuNM4O3LBhuV8dqdV+Q
	yFCsl7aN9Rf4ffQ/A==
X-Received: by 2002:a17:902:e5ce:b0:2bd:5ab:af95 with SMTP id d9443c01a7336-2c1e77d145fmr269724115ad.0.1781080927559;
        Wed, 10 Jun 2026 01:42:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:07 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Wed, 10 Jun 2026 16:40:45 +0800
Message-ID: <20260610084053.2059858-12-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 41 +++++++++++++++--------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 49293376956b..a21a3dbe8a5d 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -70,46 +70,46 @@ static const struct pwrseq_unit_data *pwrseq_pcie_m2_unit_deps[] = {
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
@@ -131,13 +131,24 @@ static int pwrseq_pcie_m2_e_pwup_delay(struct pwrseq_device *pwrseq)
 
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
 
@@ -148,7 +159,9 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {
 
 static const struct pwrseq_target_data *pwrseq_pcie_m2_e_targets[] = {
 	&pwrseq_pcie_m2_e_pcie_target_data,
+	&pwrseq_pcie_m2_e_sdio_target_data,
 	&pwrseq_pcie_m2_e_uart_target_data,
+	&pwrseq_pcie_m2_e_usb_target_data,
 	NULL
 };
 
-- 
2.54.0.1099.g489fc7bff1-goog

