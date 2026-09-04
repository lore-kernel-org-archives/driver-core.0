Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9E41D108
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511463; cv=none; b=Dofkjsq5oXnZbB5RrMiXQwrq08mccv4nBWKwDxRxHLaRw3r46QesW5ulN3UYahPhxUDEuE1MaUXgZXhPigxsCADMAYdLJnfwzRC4Kp/WoO21bmhepW8MX25M/a4wOhomavKawZXnWPbyUTuR+L+xgzzFqi4ygwrdmL7ir6/wkE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511463; c=relaxed/simple;
	bh=evX7eHGckJlWiDjaLlRDSEr7EUj3T3hqiY287BkHQLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMe9RIYBKbL4jelhdekJEFK9XrprUUDD+idCfJW0k5vF7IMYBGWyPJZTMbSihzJZxDGrsp21IEeRaX08qLvDT9IYYL6Uinu26JyRBU+oa1punX1kyqLkegkH5LPgFqjfWo4iK+AtL7w+jRFL2N9FQNYP2T+RD0y+Z2FbMkTZ6+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YN8diwGq; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YN8diwGq"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso680763a12.0
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511457; x=1789116257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=YN8diwGq/lUFaI7+Lr1Gu4FEbTSzZ0cYfe4DHYum10ceDQGHKJfI1xrRzV+URX/VBb
         pyvd5fBTBI3Oj45ihTQhcSzTAug65y07EZFdThahusESp4Fzgj2BbNjKlgbmjAMyQDBe
         cqHdH98u2O/Av2c2wMxoi2o0nrBj0XW5/0Iqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511457; x=1789116257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=bXQBpXkLG5g65AaXZy4rMTOrdXEbEtEXxTLxWscp6OR+CfrJvQNZhrkjmNUJaFysh9
         n00MU+x3i5dCfg4XjJ8e4cBbYyNGKoBRB/JuQVNAPinscWbcqAuU9et379IGityBHkuK
         /YenkpobovOuejdF2rp/lcrAuoDI1R8okWKcZAWKRQXlXI8A487ia6Z6dqkPg2PT3hez
         BssLGSmGrTh1RxN8kWVsRm5K9shSoBqemxKHe15GcXYA5as4fCX2f94LNJqO7V2azbaB
         6fj3eiTCYimA0PRDfsfJqSDpXFDhwYr4991jBbLB/W+3wnW/5BA6VAHp+XKXO1ElMpn9
         KWsw==
X-Forwarded-Encrypted: i=1; AKwUvBwqh28qy3cLNZMAv9hpI6m1SP6SnzM9uOw8XrmzqsyuYefq2WdlqZvgOz4Hk7kDCk1gvdARCLJYBF3RMg==@lists.linux.dev
X-Gm-Message-State: AFuF++lsD22g7XLEe/oMZ6aQHl0+gNbR1JktotmIEg4585GJXKztGhCc
	lYok6BE6jSfbqU0TkbtcoazgQ6t139m8ZdvK0wQ82Rgss3kMxPGeAj+25g02UMiDZg==
X-Gm-Gg: AYBFou1st7cUc5rnsjEzd1V9eaye9ddW0VAawd83Hq0oOz40m8kC8FP6Y1hWal6XUfI
	hlvVMsBkRp910opsQOXdmLS0MhyxV3d4F+MFzLDCQpcdCmCbGH8GwjEzsxIIpBIUa/AAl/L6ITU
	YB2x2DttF7VgQ/2ovnqT0fV1rUbUxcfQZ3X5ryCcxkYfjDyFbiFhcTqj8neGOIuEqO1TS6+etm1
	Dk4h7ZfqRKJb2yUNWAM9XjxWR6Uc45NUeW/dGFwo9H0pyCkMNJUCoK256gKjk5W+w0xchFoibKi
	IH8kMZ1dDpf4ouMK2QzXnNY6+9NGH8R+/LsPMWPM7SDGf1KeGS5rRYunExkKTUOooKam3Tn8L7x
	TwJRL4rLCQu0Cf5kyfIapa0svOy/JUBliZ/2zUbFCnoWZJTwVOO6dPAongblT1T4q/kzWu67PJa
	4wp17bLK3wyvyWn9YY74gkvpD2L5zNTVOkhzrLT0h4G9Zxwr6VzP9nlkUpg0UM9qGslZRo0BtF9
	KmrlwUAzylsqARBHvUc0ruhooIH8ybm/d6Q1egDaDxg
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr7039451a91.18.1788511457565;
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri,  4 Sep 2026 16:41:50 +0800
Message-ID: <20260904084158.1341550-12-wenst@chromium.org>
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.979.g7e5102b832-goog

