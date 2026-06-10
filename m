Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9133D9696
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080942; cv=none; b=CU5zEIgDkUnX771hLZsHKQnUTgUZSLRDewXTWbHNk7pfiOL6ExTuH0+67lzB/K3yx/NpdefBqojElrI5/3N5wdVYB4p9+6Rq2oECqdTCVR+vOf3JYJz5+ti7JkgEDSkhIyfxyMqyxYEyhnnCaz9nAPCXKlJ3dfJM1zf5oFaZlig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080942; c=relaxed/simple;
	bh=H+EIMxj9juaYlu5/QAviV83PdweIQfdGFZaxQ6cEvGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nq1f+Frz3Cugda4kEfE7VzWI74uru1jj88xrjupzvZqFWFIZXrx5F+2ZxbyIVfNehkE1uz4dPBxXYmsGVV9K4RS4GCFzMpCalSPTRRxXOOxlg5D/tbViBlTYDKPZiJmhb82ZlLyvoD6R7j7gbknY2+z5Z8Rk/S8IfToVMxmNAVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q47UtUoY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q47UtUoY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf114b0cf9so59294175ad.2
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080941; x=1781685741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+N3jX2N/52iyiNHpRxwGQULSKcGPzXu4/gET/t4pE5E=;
        b=Q47UtUoYbNM9ECy81t+QJno6xqZM1DXK6arQ5ojCpGCQ3n2UTXGqiHptc0QZUHy55J
         CHI1SfpuqJa5cs0OFUcPAlAOL5EHHps34akXbrwTIfG0zvz5qBRHyh770fstEnDQ/LwM
         8cVbUA3N1yucoxUGKT2TtBaM7cvjLxsDigiLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080941; x=1781685741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+N3jX2N/52iyiNHpRxwGQULSKcGPzXu4/gET/t4pE5E=;
        b=lYQlNvzMZ/4LeZRl6kUZ366eYJ6k/ihwolR3gj4I0I65sYWSjTqS7H/d5BLuvc65U3
         MWhMWTQLu9c4p1M9mwXJ3aHqNFYBOLh9TdaXb/hxrHeOE5oS0WGb07fJqajQqemvCmXa
         OLJl6JqNYpabQVI1Ij/M0UWiX4ZkbbTD1kEmhDBfee8SDcAVR+5i8ABAYCcG+j537rXv
         qpcr+UTUJukCuzyGuQiEgWKFL2wdpV0Jx+D7pfGoBLNgoYw4DA7j+1MoVZ3gI6weCEOo
         Hkvastix2/R1vPTVaHnbObq1U1mmu1n05bChAyqikgzzmemUwUjRSiilJxcTQmlhvSs/
         +sAQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qSqmA4L3OsqDDlhMTar4j0GbkYWsMCD+LokB6lDpsSAm5z07ZqIJErkd9WBuKo/OSg9zaT2FOHoxp8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDUW95oISiT0aosLetVUs7pcsEeXwU5BGgbhM8/18MvVGOvnUY
	UBCScHBj6pkzxvXCqu9GhVtfZ37AUhucIWwioMd1seUTL3Y4DKP4+VlZu/ikuvv8kg==
X-Gm-Gg: Acq92OFdrDsLB/arV+kYD4LGNGOLzj05N6xrwjceI1yGBnUixQqBySUwptXtCZvZQE9
	Yt16H9p6Yev0cDU6XHDUSvK2T9pXSIAo7HzMuUALOiXOx1SymQsIx0Qs3IkbYO3924huCBROcB/
	dy+IrEvkRvqJRywgroxKniKvnj5LqDYbWD7J9HCKcaZxP2mNwDLp/mJAV1g+E/QVB17Ik6Tpebf
	7wkoxNKcbTHjoXgvgAJpLQ5KRurx9KiTQpiYAL4mnm/VpYcQHtD6UdGh9ejyAsnMoNLULMlYrzL
	BkEc6Du15dV5tLpJbVk+fPvPcAG/+Xaakgx/lCb5h4KqdV7zOyBA5de36uHTNKvn0pV4ilRI6ll
	3IiTysj6chCbcRD7UhVtBp6cSoiEmcpdAqSoCevakQbO403gu2WcKYRKaShokCyGSxnDSh7gTIy
	lpQVuH+Vs8Bn9gB1FE3ukrTa57waZVRdlkmqv9smVTyzFyXqQtGDoAf6fSB/+URVQjxhW0j5IDz
	SNpgaX4Hbu/m0RHWg==
X-Received: by 2002:a17:902:e5ca:b0:2c0:b932:867d with SMTP id d9443c01a7336-2c1e893d0b9mr271721185ad.29.1781080940790;
        Wed, 10 Jun 2026 01:42:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:20 -0700 (PDT)
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
Subject: [PATCH v2 14/16] arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
Date: Wed, 10 Jun 2026 16:40:48 +0800
Message-ID: <20260610084053.2059858-15-wenst@chromium.org>
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

The Mt8195 Cherry design features an M.2 E-key slot for WiFi/BT combo
cards. Only PCIe and USB are wired from the SoC to the slot, along with
some auxiliary signals.

Add the proper representation for it, replacing the PCIe wifi node and
vpcie3v3-supply property under the PCIe controller, and the vbus-supply
property under the xhci3 node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 74 +++++++++++++++++--
 1 file changed, 69 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ef7afc436aef..c95a54de3567 100644
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
@@ -1085,6 +1126,14 @@ pins-bus {
 		};
 	};
 
+	m2_e_key_kill_pins: m2-e-key-kill-pins {
+		pins-kill {
+			pinmux = <PINMUX_GPIO61__FUNC_GPIO61>,
+				 <PINMUX_GPIO59__FUNC_GPIO59>;
+			output-high;
+		};
+	};
+
 	mmc0_pins_default: mmc0-default-pins {
 		pins-cmd-dat {
 			pinmux = <PINMUX_GPIO126__FUNC_MSDC0_DAT0>,
@@ -1637,9 +1686,24 @@ &xhci2 {
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
2.54.0.1099.g489fc7bff1-goog

