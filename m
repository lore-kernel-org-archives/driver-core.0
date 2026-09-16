Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67AE453A3B
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545594; cv=none; b=PAKGOoyzZGsuH+ZKUVLZrzBtM4VpOiUdMmfMT0/t4f3zVzNCigFor5mkTeZwW6kaEiesD9cbEsRypgd0dujXO9hS+CU02hG9yDXPH4/ZRKxtCB50kzOObruquLxaJCmt/VJw3bhNhg1Z5sXk2/Ln7h91ANhoMvqKpFKhCthkSJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545594; c=relaxed/simple;
	bh=hSWKx7tzryLVW6Q1z4sc3gQFmOjDfslid4a9Mq6tRHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5NlO6bYfTiSyIsDEeGWeFckuiqmPWqfI4AAvOahbAQkI7d77Fdz6mYUMj0wxBeWXabunmkkVbUhB0ly2p3aHT8m54g+WeLaURae3PiLZkZQ9A9m8+RXxWndIzIYLWiwyLupG0gxnH8ekinbM7GxpLgiPJGjdZR1YoGYh4UpKjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FkvbUEM0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FkvbUEM0"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so531204a91.0
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545571; x=1790150371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zziC+imJfNqpibEo8R3DN11n7Ds3Jxw6/OGyIDHBdk=;
        b=FkvbUEM0BkI9+3ukUe66q77TR14LfzTqiFOfegWQlelFo4Y7a7dWbYmrOAIkUWaZiz
         inB2tnGB1jSJOQKYqv/aCQuLUcUAj/xGm0OhetdPrbZWqXTD2gtEDPUqy3KWo2C9qAW2
         AVnq48zamr+qAgCADyxQZ8NhtTrfUfki2bKAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545571; x=1790150371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zziC+imJfNqpibEo8R3DN11n7Ds3Jxw6/OGyIDHBdk=;
        b=2jisk2jg64ZQHF7C54Vmj8AAko7tMG23ZsqgW1L2+kv0JksRIXeLCdVdxbQB4eS63+
         4BICu3bSJlP+vHp4mTrNGrylWPraJkgmaqOlmIrRto246TVLNmp9sfTNoEWBHgudzqTY
         Y3+QzQJhMOmptUpd6n/l8vmC31K8XWI8ftX9mUz8Nv58SYlpIUsx8UrV47Qt+ZaGWDxr
         7ez6Gx6xNj2rrdMt5jdcTVUov18AMzZZoJSEX+O9OdYC39CAhMz/Qm11/Bu8x2vqvWgQ
         muchbB/KycDhTyPQc5ichefhYylU8mSLWw9/kJV/bthu5JDZPhbcvkyUaldTACMI8DkE
         XESg==
X-Forwarded-Encrypted: i=1; AKwUvByfqEyw3pwpFLcTgYuvxnFw/tm5IGEJDEgf+uS+ANPYiCadJDNIs8hydfsJcsXfwLe/y1sUKIf4WS+kdg==@lists.linux.dev
X-Gm-Message-State: AFuF++mk5KTBg9Z65xBspzuRBCsHgo90kUxcdSECua0QBwnBIKgd/vMJ
	xrn9X6vS3hBctggpHb5/0etP1Gyd8TWvesuEH/j1hafMPMQpymnh4Mh9qyPddBqv9g==
X-Gm-Gg: AYBFou0q/WH0nLIGHdNrxt17zyl4RSrZcCsfa+9Eq76JYMLPMpGiG6XiZKVfm3+I9tC
	C2YB5t6ZPcxkJb3qIxwpsqmsikJVI1wkemCGdEvr3r4bW9pPFS1OHrE5gi2XGup82yW5fcf1DhD
	LwpJVI9Ct/2goh/vMIQ4KMHeHdTPJWhelSGZobN/mQo/4bfWXwYALxYod+ikKp/BlKsku5r9tgy
	YxaHKuFntrXkfczExwIqvBEDvH4NkFKXriSygR64RKzRlCKJbAvxDmIQvVn7gVqpmRNcuiZXazp
	j8c3+WF3MZWj853EyJHVgpzVTRkX5ykRENPzcOyLjTm8lIjCXDvW650t9BjiyxWT6R3C/YNXQiM
	fF/QPcIl67+g1bDRncH+8MrjAJxMWRsf7aAqxRdUP8KJ315Rfv/XmRaVGagCCCyOzzM503E0U2g
	iU2zPrPCPBLwiMK3jI9l/u7kiRRw6Wqn5tl80vLPyWFKjzX564wKMezX/ovvuAcn+92oYzDLoZG
	vugs9uG5h8hj+BuGJkQD/yo/NkfVnTVWJ3nm0EnX5rcYaEuvjn7zSr10g==
X-Received: by 2002:a17:90b:3c07:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-39e1e2e2326mr4169180a91.7.1789545571154;
        Wed, 16 Sep 2026 00:59:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:30 -0700 (PDT)
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
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 13/15] power: sequencing: pcie-m2: Split Bluetooth unit based on interface
Date: Wed, 16 Sep 2026 15:57:39 +0800
Message-ID: <20260916075745.3549953-14-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
index 499cfd291a39..357aedd2a17f 100644
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
2.55.0.1032.g73a4cd73de-goog

