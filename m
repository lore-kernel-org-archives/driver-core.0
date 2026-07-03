Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62B3CEBB7
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076675; cv=none; b=mgLEaLr6pQly2ZmS7n5gcoLrMWfdMGoqcYVEYVuETfoVCq1SJd/aJ/a9BJGybRtLASU4CEqFzI0LPFkS/wMchTWgTPQIfLsFeJwuA97rzEtv0AS+509fLFoH2H2Hs1vEUr6+Hz1Aa2KseYs6yl8geH0LbCZ88vz2N23L7WYabJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076675; c=relaxed/simple;
	bh=h2KtqdCw91jXcrcEtBdWKqxtEMrPwR1BFhKp6/mntxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWc6BOqJtdL8pj3BFYCABbhxOd3d4jrlpyCjPTu2XilwoaJj1SQHjABIS+YJCz9oXrl6/5AluieiO+zjMg7Q7isiYkB2zaYQ7vi+pc+7cFo18Bwl6ULSCAU8nxperrvMvp2dbGqEOLaARXCPBes08H3yPpXJ5Sdoopn7rkTNgj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NDVrRSXb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NDVrRSXb"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cacd69a9c0so3439765ad.1
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076673; x=1783681473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsnzo2At2D22M9h7H+DZqNmRRrbT1zORZI6ZvXqk3jI=;
        b=NDVrRSXbIGCr8O0wgh0dxKUxT1K2qkf8jhPAWnGKmjH3MSkWEDd7pDGUWbdaikTS/+
         hAWWiZRk3Ds70dPX9BFMhYBb48a7BAs/s33KTY/5tmSrS2ETV0tMuzUSmEZTtd3BFbSq
         dp4JQXOMX+sNYEdVpAisB2QfnqTRGLrZjkG64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076673; x=1783681473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsnzo2At2D22M9h7H+DZqNmRRrbT1zORZI6ZvXqk3jI=;
        b=pXJXusHxJ8LcYvNBYw4gtH5AWYANzXbJxMXfhh8NBrDaUyWMQsVe3pNlJAOO/B0NrO
         A2J99t5TddWiPCZ/Uedesyi/BkrUSRwgxQXhgaSTch8Nt5ryMbTakJ83nLYhwPi4V/0c
         3UKR4NI9j/06WrjXO6MgEFuQw7fcy27w2FbvE6jwPmLF1kG9FzhpnG8JhF7p01BspXlH
         cuOeVnJ/mW7gvu7Hhq3jn21tPjqSHAacboyo2lTA0NvvlONr2O+Nf9Yl1oIh2eGA+LOB
         wVYzAqU5f3s7NpGA30UzWTrhzbx0VJUBRPKYJznEcIlYOLNjjxAvsljMBmXAV5OlHP5v
         3pfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiQHTe13w9yQLqklcXZujUD/JSH1+5yZNBOF4VLJc7IGJtuJhaDIbr8Yyczxur7sHA4BrqEP7fGfp9Yg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZu1PfTMuHVHWPyHHx0j+mTD0kPKv3zJ+eQDTcGl+PjNki9WPj
	qMyDGNCyrfOVN613qTQ+Q7obX81JwV6MltRAx6lvT/y61MY0Cd4Yard7jNODUFDc3A==
X-Gm-Gg: AfdE7clQXza/HP9nqAhj71T/j7NC8suZXjD+0KcPNj0xzFQ7601a1v3ziRdBrtLyirG
	3jPuIBgEvgq6KOEiCVfDu7mbBvFK6CyfhQM9AyYiT7vIrKI6pyrMh8XetlhSz1NJ6aRdiRolURZ
	MQJ7i7NT+TIfQG8QIIV7l5eW8QjaB+CW5Wy7RYbCUp9dw18VayDH+JXTa62rpX7LalX+AqajWG4
	hhJT9OFRmnibAsTyasHqgP0Tdkzl6ZaISRDgpih600hdbmyUuhRq5iee937fPjhF+ersOrqEn6Q
	68ReGjqyDjOpmhqAqXMYlz3xb/l3gizhDLUx981uuGPkFvnB24ebZaccKQxSqkRQKZT8pwvhBHx
	CJWkbl4wPWk91t/CwaB5uF1LGfIEGl4MB80zDsPD4Qb4OkTj/4X2WiT982B5ADS3YRMHiIfjsvg
	aFHzdCsidlFELxGSon5zHRhs/s/+zXlfeYKVY6Lmxp+N48oy1qMdplo/z8CjYFIWdP36IUoQ==
X-Received: by 2002:a17:903:2987:b0:2c9:97a7:f540 with SMTP id d9443c01a7336-2ca9120fef1mr94980545ad.38.1783076673338;
        Fri, 03 Jul 2026 04:04:33 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:32 -0700 (PDT)
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
Subject: [PATCH v3 13/13] arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot
Date: Fri,  3 Jul 2026 19:03:14 +0800
Message-ID: <20260703110317.1283411-14-wenst@chromium.org>
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

The MT8188 Geralt design features a chip-on-board WiFi/BT solution. This
is a M.2 E-key WiFi/BT board layout directly inserted into the mainboard
design. The connections to the rest of the board are almost the same as
if it were a separate M.2 card. The only addition is the PMU_EN pin on
the chip; on M.2 cards this would be tied to the primary power source.

Model the chip-on-board WiFi/BT solution as a M.2 E-key slot with PCIe,
USB and auxiliary signals. The PMU_EN pin, which enables the internal
power controls and regulators, is modeled as a regulator fed by the
pp3300_wlan regulator. Since power sequencing is now correctly modeled
using the M.2 E-key slot, drop the "regulator-always-on" property one
pp3300_wlan regulator. Also drop the comment in xhci2 saying "MT7921's
power is controlled by PCIe".

Also drop the voltage range on the pp3300_wlan regulator. This
"regulator" is just a load switch and does not provide any regulation.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Drop default GPIO output state from kill pins pinconfig
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index f382f90c48f5..8316dd41ba23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -86,13 +86,11 @@ pp3300_z1: regulator-pp3300-z1 {
 	pp3300_wlan: regulator-pp3300-wlan {
 		compatible = "regulator-fixed";
 		regulator-name = "pp3300_wlan";
-		regulator-always-on;
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
 		enable-active-high;
 		gpio = <&pio 12 GPIO_ACTIVE_HIGH>;
 		pinctrl-0 = <&wlan_en>;
 		pinctrl-names = "default";
+		/* load switch */
 		vin-supply = <&pp3300_z1>;
 	};
 
@@ -159,6 +157,17 @@ ppvar_mipi_disp_avee: regulator-ppvar-mipi-disp-avee {
 		vin-supply = <&pp5000_z1>;
 	};
 
+	/* PMU_EN pin controls internal regulators and power sequence */
+	wlan_pmu: regulator-wlan-pmu {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan-pmu";
+		enable-active-high;
+		gpio = <&pio 145 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&wlan_pmu_en>;
+		pinctrl-names = "default";
+		vin-supply = <&pp3300_wlan>;
+	};
+
 	reserved_memory: reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -193,6 +202,39 @@ adsp_dma_mem: memory@61000000 {
 			no-map;
 		};
 	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_e_key_kill_pins>;
+		vpcie1v8-supply = <&mt6359_vcn18_ldo_reg>;
+		vpcie3v3-supply = <&wlan_pmu>;
+		w-disable1-gpios = <&pio 13 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pio 14 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* PCIe for WiFi */
+			port@0 {
+				reg = <0>;
+
+				wifi_ep: endpoint {
+					remote-endpoint = <&pcie_ep>;
+				};
+			};
+
+			/* USB for Bluetooth */
+			port@2 {
+				reg = <2>;
+
+				bt_ep: endpoint {
+					remote-endpoint = <&usb2_ep>;
+				};
+			};
+		};
+	};
 };
 
 &adsp {
@@ -657,6 +699,22 @@ &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
 	status = "okay";
+
+	pcie@0 {
+		compatible = "pciclass,0604";
+		reg = <0 0 0 0 0>;
+		device_type = "pci";
+		num-lanes = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+
+		port {
+			pcie_ep: endpoint {
+				remote-endpoint = <&wifi_ep>;
+			};
+		};
+	};
 };
 
 &pciephy {
@@ -1000,6 +1058,13 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO13__FUNC_B_GPIO13>,
+				 <PINMUX_GPIO14__FUNC_B_GPIO14>;
+		};
+	};
+
 	mipi_disp_avdd_en: mipi-disp-avdd-en-pins {
 		pins-en-ppvar-mipi-disp {
 			pinmux = <PINMUX_GPIO3__FUNC_B_GPIO3>;
@@ -1164,6 +1229,13 @@ pins-bus {
 		};
 	};
 
+	wlan_pmu_en: wlan-pmu-en-pins {
+		pins-wlan-pmu-en {
+			pinmux = <PINMUX_GPIO145__FUNC_B_GPIO145>;
+			output-low;
+		};
+	};
+
 	wlan_en: wlan-en-pins {
 		pins-en-pp3300-wlan {
 			pinmux = <PINMUX_GPIO12__FUNC_B_GPIO12>;
@@ -1343,10 +1415,22 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci2 {
-	/* no power supply since MT7921's power is controlled by PCIe */
 	/* MT7921's USB BT has issues with USB2 LPM */
 	usb2-lpm-disable;
 	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			usb2_ep: endpoint {
+				remote-endpoint = <&bt_ep>;
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.55.0.rc0.799.gd6f94ed593-goog

