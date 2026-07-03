Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16693B6C0C
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076671; cv=none; b=UYD6BfMVeeSDmfo/ita2SEvSb0O2yNK33RTX3/beLE5CDxDwbo7vOdL/D2SNqJQNr03HtmCXZRqDhEnI7jFka2lHeT5/x4Em5wyVOUZrdMwi/amL5EsR6iXoWKfcNWgjFxwrIYZUA012aGxQZZd9OMbYtut1NBUao+qzDAoyoT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076671; c=relaxed/simple;
	bh=e3dvC7GoRiFIjE9/RFFzIWSZ9JOa2nwITKE1S/UptxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pcnVbZkgTxnlAQtmxSf9rWz95iB3MMKgd7S0jEI3oFrltqqtEI0CtQvrujo5+5bF0DVuLX+ttWekmy20E8DmqDlPYRPmj9wwMLbNAhHRb6LH8xx9wvTrjdsE9AZ4E0WnZv7lhCbILe3tlZCUyTtDySP55Lx88JiCKsXMaPNqhd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U/Sw2GyO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U/Sw2GyO"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cad225673bso3769435ad.3
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076669; x=1783681469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=U/Sw2GyOtck4VbRWLcszqfV5kdzDPkbDjX9cGPNYiCDBCsiWfx8HDLvXgzBgHSTVPg
         0wNVdX9pxeT8pzvRsgSwLrhgUpq60eC4evTAgeqcketf1KdXosQN0AfLNAUKR7jDgBNz
         4DtZGlX4CqpJ9Hz4yuhh6nGSDsPvtm4vbKFLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076669; x=1783681469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tXAwDnlU83VXoXoUyytOK9p0r0aF5pOYFDxcdcWd1k=;
        b=MarQFjQsJDO2CDJT9K8+jfqiEowGe6XxmWYmjTuMm1aXgSKiG3BlDo1wEWYeRu+Dwt
         44tnREgzArbVQw9ZlkQYAGtapaJiqXEGW3T7ucyQ/WRl/3azTZ23zHv7fA/ghsZshz10
         TLog6DvL1pav9D5exgl6cWei7IWS/MSRrumc6WaXJiMy3uEWLXnfD93y53/slrwVFLeP
         rVmrexPbXrFHVu61Oa93UQ795EfrnwFzuY0coUmTY9RxdZWO5m9n3/bFiQrkbSzntpGx
         pSttXEFhimZrf3ZOFsNGmcff8wOirrO+W9BaN4b8fck4UW2oCCX7x9zXp7LB44MMYu3f
         2aUg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+ic1uUtiT1sS5hOxmoNSDYf2lYG+4W9d4tSpcE7Zxclt4hWNJZEJQh3+kbcPydEcxTWnAVXym+Gt3Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAN5BTd8PZZKrm8VuyDjOdEI+XA3bKbWvNUxGWhjGdxROPW9dn
	qWFR98MOl9NmsFpWVovDEWCarEGX/U5zPDVy8yftNmPIKJZYkBiaLZJhhZYC7bbKrg==
X-Gm-Gg: AfdE7clyjpvk+faUbz82p4Ki4jZNoch/Fog0yrGQMNkV8T91Y/S1AfUzaOUJdsa8iSf
	ycTHJF6qsmtwN9Yxm66h8I59Kz/1GRF7ZHycjJ5rdQFhKdpPPQi941gCEf99uBDgAnEpvF6FHcE
	peF0os1VHEPo2JGy6cw5u7rAP2JIRl/EtZVIVGrNCt4K4GM9rValYdoyzghXoWVRSteGeYdPuO6
	7E8srDPCM4lLUItKFribAKFX501wvrajXmJ4+9pjck9rWgu5hJ0/NHTb2W3x3P/z/thRMalx0Bl
	0aJCzM9/eigYnkot/n2Mf9qg3drFTlIL/0ccD53w8M+YLB3ZExw3J9HdZSeeZK4Rjy79yaqG2ZO
	ZOrSHlZxvw8n7F4L0lehqmoL7UrwhYrFtYCFpwdlkwz9Uvc82ZCdyZsjhtGL6dnwgED+wcd9A6r
	LtPEwz/S6Ss+R02H0fFxoTvTW9D/NyZIx4mgDBO7szpeUgHBy3W5YFzLdNLg3uBoR/8W0JOGmnI
	bqb4yGS
X-Received: by 2002:a17:903:19cc:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ca911ddec4mr103561175ad.30.1783076668529;
        Fri, 03 Jul 2026 04:04:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:27 -0700 (PDT)
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
Subject: [PATCH v3 12/13] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Fri,  3 Jul 2026 19:03:13 +0800
Message-ID: <20260703110317.1283411-13-wenst@chromium.org>
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

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
2.55.0.rc0.799.gd6f94ed593-goog

