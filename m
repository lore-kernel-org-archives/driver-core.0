Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD4143F4B3
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511476; cv=none; b=czjZjVZvibWj9GFKedhI1WJlTscaoMFZWMWGitJkdTGMeoJ7nqyK+tR6lXrJ2NEVyjPC1n9xgwr6JvKqvx2rVEepe7aEBT7mU97T88wnvMF99DfXHWUVPIhmshGIF9+DaXFzt1KgX5lE3HNUFYtNt23T8JP5RK8cLMNeW39XnIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511476; c=relaxed/simple;
	bh=iMNgXmNz+LIwXhN5Tpbg3zFAHcxrNG+nhFvPP6LiEEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDA/4WHIy/0wxi5N4p6bTASUFIt40//fnUphRiUVyW9QzNyF/zJVDQayHF5DZ2ccez/mq9F9P7HLFav5zAbWajubBbYJlBbavxtLqpfDDngLl4elnKTPf+W2EDDwdKCfUzJQUY0EW1cLm/aNozHbMVrRpu51Ei16qW1I526VHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HK27hjoY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HK27hjoY"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so817875a91.0
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511473; x=1789116273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=;
        b=HK27hjoYFJg/LIyt+vy/g4s/77HiDvBcHqqPZDAmDmBBQl27lOY6NO6TnLg2ZMclxO
         OpaEOvYImJxz9d8WbIxjF+/nHsCX9an0wTX9QFVOFAtsglTpe82toUPft8QwAZbZE8AG
         GlXrKHcFo2C1GQqIzOOVf2e7huCV717hds/0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511473; x=1789116273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBs9AvV8VgFuyAyigj5QfCqQvbDEoRbP4Si3r+fhDas=;
        b=RgHPvEhA9KsN8dM8igxO60pKdIF2YqN84vBc3SaVkAIFSZCr1bf3ybWry6Xo15AIrL
         R3/hzcR80vGfl2piNRx61DahoD5acNlS/0kz+ciTuzxWJuBjItU5vLmZvxo4vy4Rbkf/
         qaWz3m6PteUPPnHxeJePwuCzp1cuTPWBAonAvPV1AjCtuOa0lC75vGbLql7TqUlXXMNM
         VvCNAjT59MgXa5UxietOcSqcd6NNHXUinxO1Z/TPIrXyd3gukz/McTpp40aV0+jLjexi
         M+fsjN8kmAOJ6ZUUYyQCx20aGbEoI3AwQnVFHufwLnhSPaYata6YgwB6Emhl9c0C29gv
         Bx+Q==
X-Forwarded-Encrypted: i=1; AKwUvByKUoAyLBYCG/42piWGsH2Fkfv6+HMRZL45yz0CVm+thm8LnvZBugfTeD5WgNI/ekFYLweTxVq/vCi1/g==@lists.linux.dev
X-Gm-Message-State: AFuF++mk6P/QlzCSOaTlCM6ruCRzyQTYjaVzwfj+rLl4jr1DTJ9MPsXU
	y+gluNdLm2nu2FZS2TJ0fxBa4aAFWdL49j/d/z7ENM2t4KdUHauKR4aZ6yQUjDJ8dg==
X-Gm-Gg: AYBFou2PnOhUTkBgeA3Tg+3FZryiN7tmCNkVRAg/OQlnHCU7oZCF6TozCpOUoXJrnqL
	ZJLrzpSXMcvsLhbcvVhdA5xqtyycg5kZSi7+kxRfrobl3O5FSTlvW0L4Xzu9dZdVHgWvz2q52cM
	VZLKuO8LHrPjhSCI+BzhW+w0jXkfdVupdzlZEGvanlmqUhycK6BI1DDoeXgBywUEHDc6KTrxjXp
	gYNmNY6sLskkx5Ue3gfbO279+H0LXlNSOGYZ2VMA6/G//YXbSs9FNu6Zqh2wCDMN0kq7az6YH/a
	2nD13Zfz1bEc0YW+BZAhHIhtUQa1XGMWYl8GwAXd449sHtisdgHqTcTu4Z8irKhZWKnkvtTGWzQ
	WyrKfBwk/bBKouSJjTKJPak3OysHcxtUKJqUQciZmuQOjo6rb+TUe84DFk0Y316BL4pRiXAsT4T
	D4EnJkX52VaT+cmT9i57S4tvRnE0He7kZgUst6Cxo9hy4Ov4nmCdO+LKhlAiArGQo/ErxJDn05I
	h9zRkknAgP0Ac32ZBM9GSfTIONq9OLbPRbfBR8Cv+YZ3QlhSe+1QhXV
X-Received: by 2002:a17:90a:e18b:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39b26155274mr6523995a91.10.1788511473366;
        Fri, 04 Sep 2026 01:44:33 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:32 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Fri,  4 Sep 2026 16:41:53 +0800
Message-ID: <20260904084158.1341550-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
index 987faa9f3b3b..f7bcc8bb4c77 100644
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
2.55.0.979.g7e5102b832-goog

