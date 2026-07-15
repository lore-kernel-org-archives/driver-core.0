Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD23D954F
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105736; cv=none; b=qhPysXlCg7ok6X0WtOMEILrFSU0NCrybwEIN60gYumvuJoEXXBiV9JKKQyPAQucWCMh8yvA5g91QvhU4GyhUfEq/HJijCV267tgvtcsy43T8qKsmt95Jw1MahMFGldyPepauKlxBKzRzRF9fVphuBnV9DoQq3Q8pEFHm9MPNf8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105736; c=relaxed/simple;
	bh=Kwdh1wsDA3PQhAJXo0c3P6asDMiUgGjPhgZiuNl33tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BC/f6BArDGd6JvQcplHi897goQxzawRBiyLKTgQ2IuFErvxP8VzqNUwbI9BC0JT0Nph+6WD8krjLi/m9zQVD3hKvy/DxSafTUkUWbaTXCGY8layXcW7jDzEe84KZOOiJ4XZraaTVne/Iq7Z2BZ6wkHgX8PJXpA0TEe+wx5DT7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X35b/H3U; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X35b/H3U"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8484a0b998fso3012248b3a.2
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 01:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105729; x=1784710529; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=X35b/H3UCuvV3RqRP2TQC+WO9oXcWOyNCRBkbtxAT6bdZgYL/+LluQXqzl3glMRUm5
         q534P0KhHEvTl7EjoqVEMZWD6IW7NaF41MTmn+IZA5km59lIreW6YDGZb5wBioxtYs5g
         tXCI4mU4tbq8iBJO4ZTQx7OO32IOuszKtex68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105729; x=1784710529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3HJTWjS7+7k2AMeQ/ADfiVkN81b/TWdXvCN6CQ3PZA=;
        b=KTEBS2vJy6ctJjM9vncqjF0iTBXgMcIK+CYkxUtMM9Sc8ttwuK9w5bsD3U9TMcqy8n
         4AvpprQndBJAf5zbeI2KqORubY2YUcUTaH0xqLLbZPa5bVRuX5nhZvdBdkDHKqcgwiNO
         IwH3HKcDrYIOSsKd/ciz+QpzfDX2n4sC/7sU7Nfb/SvytrbdnhNpN7Q7bYbIASTrHCkI
         zIzl8FeP9RoOt9OEYu0OshHyCTt2XPJiapokEHBaT+GOJTE+7sITKU7lvEww+big8hNz
         5DoysyqnCQJ/982Heuzy/dK9jwmsE70nhaM8e6ST4rYXFSXYkgGV2eB2AP0bVuIcksuK
         1LDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2gzMGzmWIphhyVgkGes/WG9g+v7QVsgsaaDOex1Eim6tPcADQbfHebnSlk1L7F6Qi2JjvCOsgaafJyw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywdbrl6aCK/dcxP0A3PADseEHLpy+hwSnNXoVBY6F2+Rt09vEaX
	eNqa2y72N0EbKtNQqWMNk/ZRmIWVvi9xyB+9EnkCdYVmMLRGr89ePaoRKjAB+6NkSQ==
X-Gm-Gg: AfdE7ckN+6oVAUNdA/ytT6y/6e07T2NyCVPnp3EYxqilAZIA0mBOceotxZNYAXr9tVB
	H41+nh/k6UjQ8oSk6QF5Y8mTJH4+sPkzQNOy0SKypjF436vq+VWvEARg+deAg836jHcsmQC1aa1
	gb8g2M/+xEjyvzz8bzRUb2QAQTtTH6dcpp4QWg5b0zMDQSvVSsPVg8Gc0hI90xuYAsOupZ2vVPu
	lTuRlmgYgY+eKy4YkzTi+UwA0NfSIL5D8lTsM1qv5UNAuHIfZpMtcBD8kVMfxzZmsWo1IcmDipr
	fwXRfSO35aFk8Zp9RjMsu+ra2zopqMEpEhH0ansSeVPcxt4/QtCLh04rC8BK631bkxyeDOhTJmq
	pOqMjuRww5MR5mmB68HBqFUuMAgqEI+/yOa8OBSH0PfvCjzm6Ui00ajTz7ORsq1tyjFC0NkZmiR
	PUZ7iIghTRTAjTjwuiBIxwfHwX2jwa9+WtlKXQp1szV2DsZUTvrpt8kGew9j7cQpoig9rOZR3vy
	KBNebzF
X-Received: by 2002:a05:6a00:23c3:b0:845:d284:9e11 with SMTP id d2e1a72fcca58-84889756a2cmr15382339b3a.56.1784105728841;
        Wed, 15 Jul 2026 01:55:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:28 -0700 (PDT)
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
Subject: [PATCH v5 15/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 15 Jul 2026 16:53:45 +0800
Message-ID: <20260715085348.3457359-16-wenst@chromium.org>
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
2.55.0.795.g602f6c329a-goog

