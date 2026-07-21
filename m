Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66050432BC9
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616944; cv=none; b=TNXSjqQhdMN4RDs5/gAR7vXv+w2bLVnL853B8eHl6DiXgNOHKThg0TCyllf0LwbNHVE4sITdSsFW75bVo91VVGf399Bg2vG1gwVKQgQGQVSU3e6U2Qah/DjPplcsX504Wu9aDqiQ8z6F1dyHw2U5qNyuH5p53RrBKxyJFKEqZS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616944; c=relaxed/simple;
	bh=2bdpJglUXNu6BBTggJFiuCLLgE+aHPv4Z4H92NilTHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaQzh3RlLHyKBUENxPWiL3PEss39rhAeC2rqjQ8WOPzQ0RxHxx9wDWsQPmyaXxeIeV7A7sc4/DIrYLkbYTcl49W4K2c8j9Kr8f28hpsl0Zd/9hVbgI1CSxObUSEb61JZMwbVRLJQLCdhmBfE53IYMG1AbH6gLWI+vTXbsk8sb3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iNqV5o9f; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iNqV5o9f"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cf52d15d88so25296535ad.2
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616942; x=1785221742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=iNqV5o9f/3/Zgo7rKKT66emEFJtWn1VKOctnoH0ygNwwVbNyTuW8jXb7EGfS/SXrTH
         cld3nbKXwQSjRdBe0BMQyJODEmqA+gAZMP0OTeZmTnuclqnW3WtiBko09MScYbQVadTk
         fT+b4fLwGq5yVQORtTqd/ljyMLFozZ+qfzJtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616942; x=1785221742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPhOqCEBzv3eJgxR2FHq6mhzbCgxaYl9KnF0Ou483ms=;
        b=rBj3TvS70mdJprtGsI+NtxEoaUUS5/+VKgky/MlnFhAxWzONm5uEBtXgKj2WhjlEjq
         2WDUKyGLUl7DOARbz2TeBHATJI7RtQhNV0CxMnR8GtPLHNyFtM/xNKpwdw/9XPiEiekt
         Ceum7dYhKpxTNob4+ee3a6mlqDoS+o19SoUDROo1yqzfTot7AzzDtdrPB2zUDj6uj8un
         tFTW4FEudHBkLkUukJJNTYY7gq3AZSvoUwm1GOrlpln+ZnLFsX7o4sChk3bLH5h9yrnq
         r1bEsiBTlnFYXcYn5KyreyVjqzZI7l08A4dRdmnc5efC0XvomaiuWFMS4Knhm58Ylii1
         7zDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpPpThCw1rchTGvn9spxrtla6Ynsk8KssCrJs/XKaLGgVHI5vU5ZjkC+d1V72dkqeTGdaKdlAL+sDbRQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPE4wqJ4f6MQo3XUdUEV3ZZj08D0x4BB5p8b1f8MiCTlv8z2r6
	DrDeKfnxzRbSQwjQaoiLWW4KK2s1HpbKGWvc3UEqJpMs+6Lsft+DBONvsegD52QWpg==
X-Gm-Gg: AfdE7ckGsEST0xlz1iZmomy6etdaTr8cX7Ov99TP48nsxU1UvvJbgCu57LBq0ewnDg2
	al5NUUlafxNdo3/Bq4XboXsiAPr4fioNFEd0xopFTTh4EHIOI5TE5B1+NlYE8APz/xL/0n+4ivj
	8XGo3Odh7j6DtT4bwvBW1YsoelbXZ/0AcDCvlYFfBTqTgpny53XbJuTVi67nyH8+THG16tH+4HD
	mYbWq5XQ4TTA87k13H5deU+qVI3g3cMpwFqkXEzj5NI7x3ZWMkx9Ae8ZhB0zcZrSkUKlk/hxzVR
	PISA/eWUGl5iuPFplki6GwTQTIxDL0QVf6LpP9BwqodsALAA9M232riYvXE1M7Q+eMoySUnLwf9
	r0bK5AoMIn+WBOF/jNr5T9eDbL5cUwybGewJd3EUsp7jiCbljYkUKPlpusMLVLsBtOq5zDelq14
	/hUb+Wy4zN48Lt6idW9o1KQ3dLYqr58OakHtyejdl3OCfk14NkdVInhT1PwhN1myGVndvgXQ==
X-Received: by 2002:a17:903:3550:b0:2c9:97a8:aff1 with SMTP id d9443c01a7336-2cf349f76b7mr179989295ad.42.1784616941867;
        Mon, 20 Jul 2026 23:55:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:41 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [PATCH v6 14/16] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Tue, 21 Jul 2026 14:54:09 +0800
Message-ID: <20260721065413.2306137-15-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

