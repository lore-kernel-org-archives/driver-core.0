Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6BE43FD2B
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511480; cv=none; b=E03ZdVYafaEM72kcEZV+PGxtyn7xZrHqBM9mg0k79cUMd+wsNpihrNxSN8zO0embeXhEyfNNX85jHQMDW1A5i3cpvHoDNW4fYuKin5O4uCUdFOuoCnONRKH1qfIZhgaOC72l+m2Zamhfe0DvpD5Nk7B8afMsld7hTcY4ifYQVTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511480; c=relaxed/simple;
	bh=CRlSobqjLvG/xHwYpbxmBUCf/wNp/RdtxeWAo9rwuVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQxWuFpx4bjsv1tPOKtgk689LVVCp7PbaS7SOBMVavEPhWfYeDHhThaVZKzrrKIM7BrnbCzLyDJtzCi2/tnmpWiZ1/RrdcD4E1ddVNJhdE1SDGfDgpFTD7RnO+dDcpRjP0h+Y6RUh3kYxl7p2Qiz83dow/VL22KMW/8h+0v8DD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EbwwfCiz; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EbwwfCiz"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so584599a91.2
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511479; x=1789116279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+z8Cwnd44tBSJzkmGNNNosSpCrM38d+qGnlF9iz0lg=;
        b=EbwwfCiz3xLLlJTqTHMNT2goyzlu+X1hvHAMrpyXoou2gbgyl5YgJXY1I/tvaXuLLC
         pM0qKQwlmiP9Vd7oahW+wcR/IlpZOpqSpNnlFDBH9aTbUxyAYviS1HsksMtVfuD3hk4C
         Rc1X7kbFmGp5GCkDGXAYwUxKxKgaHFXt7GPsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511479; x=1789116279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+z8Cwnd44tBSJzkmGNNNosSpCrM38d+qGnlF9iz0lg=;
        b=dAVjvDmeUYYeAcMkqmaYbmBsCzXYQG0lN55yoIxFD6v0ZKhGCQzTvCXug4XTEtpLMs
         Luz9PSpR750bat30dUshXKiYLxzz96NwFAoDg7DHosDc/3S9+GHu3QpUVMTk7OcQoftc
         WfM5wA1fi4hlTTaxLpbsB0vZH+f70Y+C0rxGnCQpYdBapWJk6jQTqHAHUdG70i/6k3FB
         LDg+hEBiAhqGBqnklIbMnmzOzEbXZe3I2zcYorjUQhnk1TyUx0gAq50oyCBd1ovLFS7d
         lY2m1QB7voIUQxG+kzsqVeeCoikEXqh/X1C9Y4TiQ50twa/ckVjXQUR5Ax0meimBcXmM
         v+0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwgOym9UqHqCp2yuSoLy2L2AsCmZN0q0mueT4SAKi0Rh9bNwFALZlAGAnjblrjz3cJUT5YgBQKDgigVxg==@lists.linux.dev
X-Gm-Message-State: AFuF++kISPM5VD49gZoNrIv96tRxY7Brkig71EPdXK3gJbiyUs9FK7q6
	tXcobfEY0mhIrMTGyyX0Mw/irObzqsDYTnNvZ/u0/P8FRAyg6ZoAkAWNWpXRPKVk4Q==
X-Gm-Gg: AYBFou1PCJMTjb+F1DrkAN/LziID82fpGpxQDd7gLBVx34+nQ7gxgCNf05DYX+rB7bz
	BlZYjnYNGGZ2pvtqu+Tva9OXkp1L5oNG7MdfxoYXr6+C/OLzubIRi77Jye0c4+zAk2kFPJSTA5V
	6FEHgqHO+fOdAhLloLqucGWUpxfLShTh7hjupF5BQFEAIjW1cPMYKwP9Jj4kkOHEJtLDEOykt8b
	BEG01pFSgWgMcnHHKhU7Pizzg9ylDm1oTUFP6cC7VfXWcSx2EYYGZLyo0ow1xyizx1v83VCJ28P
	vW0XMQpfPUED0O5ZqOZ14cDbtgFZ/TphPhBDB6YQ1tDXIZt+s7+ajNE+sCrCytHhDuJiANVIqFP
	ZOVNS/wK/WRXI+beHUrBC1YrGYLi3LMgjTa3nJPnTC4buEH/DowcuQtCjwxGjOkRAh8SFavrA05
	txMViDurEyDoUsCSNrQFKtp88hjaKfeukONSaPX3jNt7SJHWnw6JBunUQxnykBlEsnOIT3g+CJN
	9Dq8AEPLRyAtz6DAgxrLDOc3W/DhgadEJO9o6NWpdPw
X-Received: by 2002:a17:90b:1643:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-39b26272f04mr6897920a91.14.1788511478517;
        Fri, 04 Sep 2026 01:44:38 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:38 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri,  4 Sep 2026 16:41:54 +0800
Message-ID: <20260904084158.1341550-16-wenst@chromium.org>
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 +++++++++++++++++--
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..8d4cc30d91e4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -266,6 +266,47 @@ tboard_thermistor2: thermal-sensor-t2 {
 						120000 51
 						125000 44>;
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie3v3-supply = <&pp3300_wlan>;
+		w-disable1-gpios = <&pio 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 59 GPIO_ACTIVE_LOW>;
+		/* PCIe auxiliary signals wired to controller. */
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				wifi_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie1_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				bt_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb3_ep>;
+				};
+			};
+
+			/* SDIO, UART and I2S not implemented */
+		};
+	};
 };
 
 &adsp {
@@ -791,14 +832,14 @@ pcie@0 {
 		reg = <0 0 0 0 0>;
 		device_type = "pci";
 		num-lanes = <1>;
-		vpcie3v3-supply = <&pp3300_wlan>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		wifi@0 {
-			reg = <0 0 0 0 0>;
-			wakeup-source;
+		port {
+			pcie1_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
 		};
 	};
 };
@@ -1085,6 +1126,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1685,24 @@ &xhci2 {
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
-	vbus-supply = <&pp3300_wlan>;
 	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb3_ep: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.979.g7e5102b832-goog

