Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A946D2B1
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545599; cv=none; b=CYCDAnZecVihPWPBbXhWYUdpRw+M0Fd9RvkqLUkRW38OGc36hvnisVAqqV4hTl0r7jqwADCuXXi/sLt3fJKVLarKNCUwicYeUGRvEaOkRRys+h2kOkg7OU0ZpNKsIjwFie5usydORx2sz4LCF1R0Pdo/YMweT9ul5FbVXJfl41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545599; c=relaxed/simple;
	bh=gM8tPRMx33Qx0BJjFPOzM7No2FKd/oVjiOutbBIFOqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SHR6zPSE8bMUwRsp/tLSGejCObd36A64U7DEh2OtuO0C/MXBMTn00EIqsNvAXq1W3MjY5Bw+PusKLxKZhgitbYDCvxydbMsi1/yWUr4qdLEQb3Jsst5/yzRih9OiCtCO6bb0nrOh3bqUmklFGz3q5fssbe8kmdUOz65UXRU4/z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AJJt4Nyu; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AJJt4Nyu"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1442724a12.0
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545576; x=1790150376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=AJJt4NyuYmWi+f9wDZVKEvGQFMVfK+gyHLxiIB22xXBcu8eykjCcy3Kfb8D8wJMy/g
         9LjleCP36Odq5How90gSFOW8OwRH9u0v66XE9qH9Tq7qVRDV5FVcEu52OsG77Oga+t+y
         7c6FW7PPE1IIUhLpC+v0AS0cmAjfRYT9L7UwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545576; x=1790150376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PYR5maRbUEPUYHaCDp1coaVQzS9XJQmry5uta3mhbEE=;
        b=FiEY/SxfAoFLZ4WF28CiLe6DU8mPtjy0hFwpk75TlJHlu/HmRytrwonV0FjlyBhY0Y
         USU0KbLUG8w6gekpoAjcw2tVesrKUMGbLWPkYEOuOxxA3ee6cfE3h5VOMOCm+erekR+a
         A2p93BwV7AEPYG6lMVnzrcleWlKhAKjSFoIbbPlqp4ZdmvmAYQVULKA7Hz+mn8NX3viT
         rJMlPxsdS3tZlh5PJixhO2qYGXUFDKWAKBdF4iOvRWPCWpCXM57XxrH4tlP/SrPohIgx
         FrgIaJi4M66dS9kRtDX/FR/6FZtNx/GRBkoM8Ydl+8qlsK3mL7lHG7OWqqhE49P87I+0
         fDFA==
X-Forwarded-Encrypted: i=1; AKwUvBw6webjtHDBMlVnLRO1S4COIkgCt7UyDabE/LsxnyRTHJigY2DXcj1cw65nm2pESFHiHBtunAduObklbQ==@lists.linux.dev
X-Gm-Message-State: AFuF++klwS7GERSCyUDt+/tA0vx+MnujQIK3pTDQxfcVddNg8V6TgO36
	cTnKMJW13Q4rcVUnigZM7ysiebifZrX+AcrwqmKoRlsHFfbPBaELRJN6peYuWeys1Q==
X-Gm-Gg: AYBFou1SsNKOSaypPHWlFJbAEDye0nGIajnXefDhNBbB5QxTxw8Y8/o54a0xZZwbOdc
	GytCCle8VFH0sh0XkxSkAuCav4+ZwzIoZxCgvQXyiXfYri/5jrlzUIZKZEbmkxYli6IOhLw0lo2
	AVyRZLD6RG3TQcIcot+gdNz/BA4TyozTmuX4VT43SjOxJpLkkeAJ5AlBrDFCrYLLKnX5QZWU4/2
	NpYQ8sOoj51z3Xx2Ild12IluRG5x2pmkyCpT8iKrGdwL2yipCzezaSWUzIMuy7SnsvL1E4g9tFq
	7W5JwXCTu7ksWHaJMbL0IMXWGg1Tv67xPjez05dTE7IBnD77Hnd0mN/8mQ5yUsvuUUpS4NBN/C5
	zzn7jGpE+58ztjBMxl7ConOEAP6Ms3zXYU6bPrgyiX/bZO6hmHpXWG6CJq8apSGBjoezV60QDW/
	AX9PoIAyLHscgjx6UyLnSc0MkXiSD9N39Y4cvceN4R9l/6tSxvQLcZsDA87xL614xrC4pfpa4g4
	CbcJ+cKCDY7q/pVOT2qAQYOoUcY2U8DgZQB0bwjYDf8EyS9g19Ofjpx9uWOf6nc9AVt
X-Received: by 2002:a17:90b:3c08:b0:39e:fe9:c5b8 with SMTP id 98e67ed59e1d1-39e0fe9c653mr6440889a91.10.1789545575967;
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:35 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 14/15] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 16 Sep 2026 15:57:40 +0800
Message-ID: <20260916075745.3549953-15-wenst@chromium.org>
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
index f06ca2bc165d..5d65f4554c6e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -271,6 +271,47 @@ tboard_thermistor2: thermal-sensor-t2 {
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
@@ -796,14 +837,14 @@ pcie@0 {
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
@@ -1090,6 +1131,13 @@ pins-bus {
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
@@ -1642,9 +1690,24 @@ &xhci2 {
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
2.55.0.1032.g73a4cd73de-goog

