Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027F3C2BB3
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076666; cv=none; b=AoXYk7k4ZXFV87ygmlHd8V+hwc7gX97rQnfk+okWetyhLuEqiRxmBiP52ieNKsEe23GT4VwmZcfb33KOmOXuSUD4ztqmF/RkS6tsG/sijn5oHTaNZYzig/zf4vfGfLKx5kGWUtQTz5FWWcc6c6+M49JdQZBD/j4Rnaj84AEC/nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076666; c=relaxed/simple;
	bh=+XcbT4Ma7LbrG3VMjTGW5N37dlNbr2BeNFQ7+Bh8UiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZyK5qQK+QVhU09vmXOBTJZJXft4rpc5G5T6Zm/7gj6Al9NZJEJEA8yXSt5jBKI+27LAzrmh7HZjFhib34F6kFZ6QFgu5XATeM9taMoonRf6Cqjplg2pPvn268Sbq6HmEkhDyyJGFog6x081nCtWWG3wc3uW6WOrDuMCcZlEA8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RowVj+zn; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RowVj+zn"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caea3f742bso1486935ad.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076664; x=1783681464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqdlZomoyNAVRvaeXkG61JOu1jmM++65FkGRpMf9qL4=;
        b=RowVj+znzeEnFVuXg4W3LXbeL7wCFqu2cb7gfW6uclM2jIn+0ZXYwhMLkVgLt6Iokx
         qiiYD2fdcG3Ub/S/EgR5OZWmDAgTKWGUOwPlsF+rk5Z6xhxlZPDp6K0fERAy5bSbwKFX
         TiNMmdy1bpDN5skdeF4DRS2O4DAl1g0j64Uwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076664; x=1783681464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqdlZomoyNAVRvaeXkG61JOu1jmM++65FkGRpMf9qL4=;
        b=N1lEUQKJnxDtV28247ShH2xzMvLhAD7udGOGTgdkiUscTlgI18EzspYhdk+p0XEoW0
         pTbIhlR7qzuLF4HFRlIRDaV87nT/6ZLWM+FPRisPmT4zuz7ZQMwlNrLXGh2Utt0gEqqC
         64JxW3dYJhmJgfdMnBvzEag4PqkDkxlcOWd+aCnBslrre/2t95aZJCe5AnRVqZ3y/fMU
         20bK6SsLTt/xbSB9TKwLTSKfail1LvfBMVChYGDlua5rBBZeDqgSMiTEI6nDy7YR32ZY
         +Sxm4X5e14JawoLnWS/olREw/yX/QVdhwf5o03rgNpLJ/25JL5kOJ8LcXFkTjJlWrd0m
         MOYQ==
X-Forwarded-Encrypted: i=1; AHgh+RruaftABN5B3yisAXa/IauJk3ezO5Qrfx1i4R9GC7HMFmah6wY+a9Pd+A/ZHLnTEJqFbG/474g1jlSsrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQzLwqij/unb6ojbDuBuOLGOe7Bft+8oSlzPuhkgor3kU1N9IS
	0mou8UbT8HCRp3jJwSc5mK6KnlHem55wXU5SRVOcaaLzqjgkTEwaAna6QLnIawJRBsPnuTTBN2e
	by0c=
X-Gm-Gg: AfdE7cnTO63LKAWJHNNJr0Mdd6xCe0ojWOIKmr27BVxG81KL8d/Rb8/S7PJq0Xi+DR8
	Q0f1VJkK+Ll2Om9otwdr/biYhP7xwIjLRxzZUXzviUgeFzm6gl+5kmUMSJuCgCjIDHkNtmMwy+N
	l4M0jpi3wFsqjTAvlSk8fCSsnw6UV4VzTOu6O1oHlB/gd0utru2fK6rbm6fiE3FiF005kWePNY4
	o5QwRx38wU2qKTTNRd/Xnz2TTgT38afP0CeUZLjl2Pt8jD1jaSw0FX8n6isPx6lDEKtgkh06snA
	wFPZzGc6qdGLr46iU0S+zCB57QS8dKrPQwfFF5WWdZGRGVwGuuV1gRw6dJ0bOoxDFDr7BbylZ2U
	M4LQVMLlGM6I/e+7D87e3slN3FaL+9teZzwCPdBC6K3GmGyzV8tXXHA7HSKyLnMgLL8vplySYLN
	Qrq6Ap8xynQxz8lYYnQGdOdYCrV2d99fNFBjPZ2iJGzbO54vViwI+WYCK9W+HpNFFY7yEf3V/3/
	Pn3GBJ9
X-Received: by 2002:a17:902:f642:b0:2ca:ecf6:9119 with SMTP id d9443c01a7336-2caecf69930mr5132115ad.5.1783076664127;
        Fri, 03 Jul 2026 04:04:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:23 -0700 (PDT)
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
Subject: [PATCH v3 11/13] power: sequencing: pcie-m2: Add usb and sdio targets for E-key connector
Date: Fri,  3 Jul 2026 19:03:12 +0800
Message-ID: <20260703110317.1283411-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
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
index 16a47f76e7ce..029ae39f6e3d 100644
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
2.55.0.rc0.799.gd6f94ed593-goog

