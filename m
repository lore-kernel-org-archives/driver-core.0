Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19793D79E9
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080935; cv=none; b=tknojXkXmCzxvLndVG83wax9lZGfRTSyYHVmTmpowzUFkt//jx7hfqwb6gxDZjGg8WSdFLub7/qlCYWXBk/HpDUrqy4kr99uXhN9DSbjigTKCbPcUwdZdJEtLgo3+69ICc7lsyYygoaT/RUC97gxKew6n6aqIr22xSOib82sqAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080935; c=relaxed/simple;
	bh=rV73mlDiXmF5Z2ojMFBLCM4SIkcjQtW4k2nOaQI0FbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l6uAQbqY4InIrXCBgg8BB+oqqdY9k/TG59lIc4tYUo0n3kSm6uUpMHK6fTiMYOhlIlzRwZKnwHlD1RcefxmyEdw+gvLGRVTjK7jJ7a8AKWlVVBaQEpiLOQ83uMSgyuS1QjBzwGM3c452t5A1E4hkdy+TFFyaonBCSGOFIXpaUls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=emJoYWFK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="emJoYWFK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c0a5354da1so52822895ad.0
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080932; x=1781685732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=emJoYWFKaSTePvsXmjiq97M9pm4oLsclIKrRu4zL9kx03EwyvpUVUVsEos937ISc1E
         JHnVMoFVguZG74MGux8n0464CPuxjameCabadVldrAHck/ob3ucqkYuXga+Dk8LVHgeH
         8lLcB0+eWS/ImdU0aUVa9TbceiQdAI72au6Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080932; x=1781685732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=//v6/82RkqjQCguIRc8t+FdPVtsIJvFDXM0cNoEMOXg=;
        b=kYTMSInW9rkGgYHq9P1gqlipF54X3j6bG11HsECLzHOVIiXXHgf2Xr0bwEKDg+BnQu
         HsdDLj7Z1yTeNGpuQ9oy1urAoMBAAhQVEGCz0iH8RuMc4FKeDPnkkHrM+sIe1SO3t3vL
         20w1dIxJj1G7NaEfjWsnnLqc5vSeNNGOMvfya+UFvNPZvTIu8HGEfLth2nEsSf1hCYvP
         lo6fhQI3FjYhJUoFTtLGuyaDrl9Zu1ei5W3J4lv7gTsYVwkj942GhGwAEzEm2v0NoLXQ
         DEQx8+HG/A4u+MOtASX4g9tBZyPUIUMFAK+wur3KbRPfIBzFjGHQFaBZBQJCiApaTKrX
         R+kQ==
X-Forwarded-Encrypted: i=1; AFNElJ/RB4IXls7sLhkDqWHGLpOwrjriPmf+Fyv07mjpteXZxmuMTceaV2S+N6yWHClCWx3ari8Bf9yKnBA5YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpALVjpm9f/cfV7V+KBBjTm/dk7QoMgzA52LLopAmJZqulg1FY
	rEuen82wKYRBtEtvliEaksfav/pcxlbxGJ9Zi700YivZPN/TjeK1jHEjHZNUOoUIvw==
X-Gm-Gg: Acq92OFVqs4ZYMOa4RFqwuW0c/zS1I9yF5Vrw0veSA2g2EkzdwbSuGXBbx/B+yijHYc
	FAJBYmQD633ELYSso3FWv9/UoCyKo+TLvYk3JJ0FyMQNi5pKOejDTj/zdwExic+DfGGcmuRCpYL
	OzVwFwb8f3DTn9lLDTwkxIbxksiMdPyF+SKD6vzE9o26ttiCm/Bmra69UNERBINg0ut1q+7FnAM
	8Xj3IUwf6Q9qX6CT4qktFblhvJzZ/1NOARYmuHTG3MKaqZiHmQTDUgxgQLlZCVYiHacDdnkImxE
	OqaXbskF6Rnm3vtT3Hmp23PBjzKFQoo2Cfr9CJDZ5WUq2XhiH/gqr94SVOC9TKLrh7yWZX4xyWI
	6Jkxx0JHnph9plt9i7N9gNaEXG+VB7jDOC8fS7EZqGSwn003Z2/BE337VkWE+lMbFyjgOJ9ict/
	cEy2Tzvclbr0cBmKDQzjt/XYo8qLrP15rB44svgUdZSe6TrN1Cl1B0orv6Xr3iVPW6zAk8c37Lg
	efceGg1sZ0wQUSxnw==
X-Received: by 2002:a17:903:94d:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2c1ec508177mr217649415ad.7.1781080931995;
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:11 -0700 (PDT)
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
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8192-asurada: Add USB type-A connector
Date: Wed, 10 Jun 2026 16:40:46 +0800
Message-ID: <20260610084053.2059858-13-wenst@chromium.org>
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

The MT8192 Asurada design features a USB type-A connector for external
devices.

Add a proper representation for it with a node for the connector and
OF graph connection to the USB hub behind it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 1 file changed, 71 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index b7387075cb87..fb4d92750770 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -292,6 +292,32 @@ sound: sound {
 		pinctrl-24 = <&aud_gpio_tdm_off_pins>;
 		pinctrl-25 = <&aud_gpio_tdm_on_pins>;
 	};
+
+	usb-a-connector {
+		compatible = "usb-a-connector";
+		vbus-supply = <&pp5000_a>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb_a_u2_ep: endpoint {
+					remote-endpoint = <&usb2_hub_p3_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb_a_u3_ep: endpoint {
+					remote-endpoint = <&usb3_hub_p3_ep>;
+				};
+			};
+		};
+	};
 };
 
 &afe {
@@ -1702,11 +1728,53 @@ &uart0 {
 };
 
 &xhci {
-	status = "okay";
-
 	wakeup-source;
 	vusb33-supply = <&pp3300_g>;
-	vbus-supply = <&pp5000_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	usb3_hub: usb-hub@1 {
+		compatible = "usb5e3,620";
+		reg = <1>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
+		peer-hub = <&usb2_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb3_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u3_ep>;
+				};
+			};
+		};
+	};
+
+	usb2_hub: usb-hub@2 {
+		compatible = "usb5e3,610";
+		reg = <2>;
+		reset-gpios = <&pio 44 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&pp5000_a>;
+		peer-hub = <&usb3_hub>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@3 {
+				reg = <3>;
+
+				usb2_hub_p3_ep: endpoint {
+					remote-endpoint = <&usb_a_u2_ep>;
+				};
+			};
+		};
+	};
 };
 
 #include <arm/cros-ec-keyboard.dtsi>
-- 
2.54.0.1099.g489fc7bff1-goog

