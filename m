Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74F40626A
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591112; cv=none; b=WcI3L5QZkCPSu5pHJQVR5CNDwOV3g46AaXnI060LM+sPRlmWORmkDCS4Moj7SVpMS4+NNuQH9uNpMPFLB1VvCfnFe1kUvnQ0sSNlpojxi9fZtfS0iTrnPykUB+oUw2NJ+Tzd9taNgymoAv4Zi+vW8Ra/MKYJ/BRcwr+YvNAZI9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591112; c=relaxed/simple;
	bh=CYi7LZ0Rf22w7yCUOrMnfczHXIbmf6KgtnE9iKQkT0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O5Rrr96gvoeQ4lwr/e3D9xzSzqaIHJ/LXczbkGsjjOVjw9zOPy4UYOLHaahzoQdbpW2Qn7EdQHUn9w0ts+oW/verErg6IDkbOiBnV+aX8p5g05/v+JVYt8HNopChhSSDvyvRuV1bEjChO5C3dEzTUDJdv1nh0PQ7mkv/0eArOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Oc1Q3gIK; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oc1Q3gIK"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1362035a91.2
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591110; x=1784195910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=Oc1Q3gIK/+qCl+RCFDydsBeIXZhP6Xyc+KA8kC1mDMx/2p0ctsTEtCo6DQZ+XXtD8B
         Amj9/KPExbvd5rSvTuTHV47RGCqTNuPOel12SBtSNjM/1K82/TaT3m1/Flpl0celFiCN
         QJpu+Vlta0ePA+HsiZ7H1Gl7Fy9lAMfXt0anY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591110; x=1784195910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/IgEXneIniXkPZT8bYgKBxJsUil0rvnBRux5XQE4VE=;
        b=oDInG7RUGAfLsk+pns0Kw9CvNxLgmKKnnJAGeJHLTJuBuGPJBY4US+xz5Pat+yV1Q7
         JS4JykpfncsCNTa4eFq1VMaidF7+OjAwmeNRbY8v87n8O2VSGHUJkjy5MqocqGjmvT2o
         1VU6x2IPsc8vDVKhtO5oA/+701VE7jBNRnJZaA3TAtY8oucaIO+W4oJTmiLGtyBfhEyL
         kIDHhFPSHtQAWwaWwzQi9MU9r/DONH1rl4106FkyNcfkPwlvYoP2WuqdIkCDvcTnl6kD
         dXE3WVM5G4b5cyfFolYU+0GfLCuWnkoMK/Qrcn14+2kgmrMuHbDF9F/TVjWjIhs8lTnu
         J5LA==
X-Forwarded-Encrypted: i=1; AHgh+RoiJ1Ah6Nk5kYTnfZIERd/X+pgY3KA9tzOZ72F+c/eGBno94aL3Mrt1OPW9/pcNQ/Dnxte59kT/vPzBXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwIFtgmIedwmVtjDYGTqSOPPyAYaJJfynKBIv53OryscuWnddFp
	7oBupV9YnnXSDpHwFxuX/vnYU0uF0W0MCprFRinSxBuHcIcYJ+VO/6jLingQfRSiVw==
X-Gm-Gg: AfdE7clXr9DpbZGNq1jpMtqoyxauyO+RGKGgN6g6zEK47qaM4R4d0OT6DOI+aAXA7ZL
	UwL9dj6XUZMGjrdv8iuQ+0MMUTiU3Zv9hsYwPXLdetTtSxgN+uiI3wnPGYBMEcC4VmwFdqdMQbs
	hzS/mumrT+XfRdDhLb9P8103F4h6PCzpAoa4XMKzc5EC0ztT/wIRPy6HhTvYoasuo+1khdR/hTG
	q4uaiyDIw3fnZx9wHmnqZWNAFxybF8NTAR3S3kvLP6pdg23nCVLeFuJkyXTikBKkehnp8HORbE0
	tR5uz7YbcT6Q7BZx7DwkWpbNbOUH5DyqdW+sg+biWR31Uk33uF+x5ieFYh1uELUWZprrYFRTjt1
	sMJ1OlWtEG8N8ptuzqQgsWY5Uv5yuA4DFtjhOv6MfW5Em9oZ16m5j+2nZ+QtI0TNx21iGYSI5k/
	KclN6/9KvKHRN/zmrMgHOjtRChX7K0/64rglogfqYbgevbA9wUb7ghdoUEikB2NYHfJvIzrg==
X-Received: by 2002:a17:90b:3ccb:b0:37c:607b:2cd9 with SMTP id 98e67ed59e1d1-3893d81f4f6mr6100304a91.0.1783591110117;
        Thu, 09 Jul 2026 02:58:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:29 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 10/14] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Thu,  9 Jul 2026 17:57:15 +0800
Message-ID: <20260709095726.704448-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
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
2.55.0.795.g602f6c329a-goog

