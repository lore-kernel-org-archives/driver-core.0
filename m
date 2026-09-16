Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F012D3D25A3
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545575; cv=none; b=sFXac07z+bUm+9AL5IbwkafRs/c3koE2bssl/M0ZDQORJGSKZAHXx6Llw8DN0UwQGSzJvnY2c/RRdGZTBObQGuGmr53SHc1LnWvqOlTyD8VDhN/9Q1Xlkp5Q9xjygBDQnpV0WXWYCYyJ1NXiT/+ZrrPfhwC3PGom07ywPMdpFZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545575; c=relaxed/simple;
	bh=n5OM2/VFYsx7oj5lWPwm1kxpni3dSJJQk03UQEkKIio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qce827kRG2XnLDRJCSaSD0a5JndJzi6gsoEJzE5r82O0z9/o5HQ/L0ArRxP8tHP8bl3eToZc+XZsPeImKckBALc9APKz+xYIvdYecUjvypxKbKzRQgU+upTqnSNiDqzqNWuvirQ5SvYIsiHQdW9s0Niv1VyQTJqGCoTsfsFqOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L1tfCEHf; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L1tfCEHf"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba92so528188a91.0
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545556; x=1790150356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=L1tfCEHf+bUCOBURrASZCb4ubD2Hnt7zNo2cSo+CMBbI5fe+8DZzcd/eIp/IZqMSWF
         /axB067Cw4pwDa/9wIGJTAu1DnJH6kh6whq9HEUeFhL0XESGli3FfT1VlUL2k7N7liMj
         tbBwSLmKUegvFZjaH/C6zIGhdbVNcaptfn3co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545556; x=1790150356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnPIF04bEgfqnB06sJJ+n/4J6DJ5aXluvuxFl2QwIxQ=;
        b=qFQeehSCyJo4N+KGSBXoLUO02pykxBsfdDUthjHgepZ2+VBizxHofmKBhjJLBrrZLE
         OmCcE9+skPHeZtkHRz4Ynl9ChncseZ7C6hqzog0vtNXfAVb2ckGoeZSZ1hFv8dvxFJOX
         3LcoCrg3GbUYzcsrHmwz/+wGOQ9NAPdu/DAklaWVXiI4vkcj7QfbK6+G5nThpeEHBG4G
         97Y14f/c7PoA07O3+miSw+ZrP81Ifc41A34xrJMxLs60vBa/sJSyN7G49NruYXfoFx6c
         wYccYMCBpYqVP7zD9BNEkmTB5ul7S95EmjZPOQLGgsM8NnSZMmccPLJUP+VU7EWGaImJ
         DmYw==
X-Forwarded-Encrypted: i=1; AKwUvBzBW54g6tNJMIitwrDFPR2cuOlQLfilM3dyra08BZjSNNXUVcumLuYP+Qdi7c2Pn7AZ2o5WzXxdVKaObQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nYm6CXl8DC8CQLDqYLCGCigeMb3dGRcjZoaXxSAmQXQuaul4JO
	pAyJZwOj9J/u8k/f6wCngf3UWLfbTYplNVHG+hSWoXFvEGYyz23O15PE3B/QzLf4ZA==
X-Gm-Gg: AYBFou0qyA7hvvrxK4CjRjq4RF2gb2nawVxWb9WCaUtiDN9GBEElWEmsxND1M/dH1HQ
	gWj+iL5ed4l3v+t43oUXFXV3di/YxHRVLa/aFCatBK8ToEBQEQ7zNV68w+MHAzN489ezDwD+jxI
	SjLRjC5s6xLHQ6yYw2UBp9H2i/fIPz26nDS8AZRs7yr6aWNQAaMnVIUmpp+OgAnEReyvXx9wjf4
	OT3FvLXKV1yfLBqWN72XOipaghvmpy26mwNrAELx+u5k3ivCXC9eTGju6fMf6Essdsqm9AFDDNe
	mpc2LnfhWVrfEg3jxp2ZHvEq+bJdBv98w2HAbG+V0kWKPImmhf++EVQo0x+kR3gIQ+rBkuTD42k
	7niyo5MMua5zxGWGL/x0m46kQ9sBAbYmfVmV9KCYTy3JkBjeUmnQVksisCLH1+wlQsh3UgTiY4o
	GD885wtXUqwe7VmjuI4v7f5EUBcNHoByJIsQkmjwmchwVkGzXkQZuZZCxoHWHbo0wRMvzQ41bfI
	KeYt0eyWA6gA5ujvN5KxlXmDwP26hePAynbWWdpShSr9YLaKE1WDNCipg==
X-Received: by 2002:a17:90b:4cc8:b0:398:c292:ac80 with SMTP id 98e67ed59e1d1-39e1e330a2dmr4372580a91.10.1789545556050;
        Wed, 16 Sep 2026 00:59:16 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:15 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 10/15] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 16 Sep 2026 15:57:36 +0800
Message-ID: <20260916075745.3549953-11-wenst@chromium.org>
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
2.55.0.1032.g73a4cd73de-goog

