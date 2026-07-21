Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BB943302F
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616931; cv=none; b=TNzbUuo+TQgiMJ7nvJSRXdgRpNKZ3aDCHbHiqZDCdZ9sBcn5IN5vFcavoPsl21jFSFaJOQQX9Tt5JVB+mP5tb2Mu4aip8UPM0VDYDZme4kkSAiwKMbCImyMCI7sNrXilMppiGUXK5+0YPcqJXK+mSIlHVi9L52HGqNawWIER4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616931; c=relaxed/simple;
	bh=Weo+Ui8E43MHQNrKTqB+K8VGg2TvPBPQ6D1g4YfmF4g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOoX4M6jhqxhYcnaJmbzVAX/Of1PLzoxMoJrXw9XKWSPZzJSoSiysg1Hzd74Dpxznce9Gg2g/8hp689QvMjKWVSB41+eQqu9d0SqGI8M9U57ExdqdEk2ysEn1bbCDB5YsHRV8hq2VPKW+locsIoF6vFdWwI1AnVLMonpAvYVsLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ikejAkXz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ikejAkXz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so22152765ad.0
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616928; x=1785221728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=ikejAkXzDHs2wDw6eRjzcq357chZ+xeTMdbGzC6Eub1pFpV7dmooXErt1ZmfyVt+gb
         zf2o0/99Ne6v0uWghmyASy2sH5gIoHIbVLWhN/ZXWzR6vr/D9ZYjjpTOJs4Rja/guja4
         IEmQTB6KuNKTmCJ4Dnxo+vzqx8XRYBVTA07XA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616928; x=1785221728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=poseqG4jqTYtg+dzF++PTZ2/+0H/c3DI3TYdoVZkKit1aSrG6Dmk+x+iAIl1yr5UT6
         N9rsqJlCzOZZCrs9FtMzw/GK5s5lNt6FGN1/od2oxB5OrwqUo1QKn9lG7gxS6NWEkBaQ
         /QGBpjjPMIHHz5rqC0hQ1JBWpRjPWK381qUQTPto3Sbb5yjlaxx69XM//QImNZ1dv/e4
         VC09chG/mnlJdPnrK5j0PYLuxwwX1A4HCmhlehXKrOHNTFDGXVnD8DTkht3+i0jNUWWs
         RtrlgUPXEST+VK4H8DBB8eSWZTg77Ckbr5yy34Z/wTC/toA9gm7OfGqYKYW/LlOkg3B2
         Kk7w==
X-Forwarded-Encrypted: i=1; AHgh+RrLfOvA7ZrBcg3wbSMjHDwk0sh5cm69qK30rGur4je9pSu8DJ20MsOG3QARJU6c31B4OB2+fca5tkAj2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzql0l8n7325PSXdgE9qTfEehAv2e0M1sYQDO8etInSZXLygI9
	gUjlbOd+38+a/2z1N8v/QGO4V3m4LtFpSiuEz5i/r9d+jxJ/BjPwubEKpYohimWRyw==
X-Gm-Gg: AR+sD13qzOLJtRAQtGmbaVVBry0xDJ5yxDtVhu5QH9tjiAQipspb9z4S9qvqDpKnkyj
	zoG+Pm2o450LGPQcDd1YSr3aHMrs5dKIxWdIKQOoytO4Ho7NS1fxdJm8sJueHhi1r7J7jsXAweH
	4QqAQESSVYepSMZ0gfpK5xyojDPhFuYwl8RP7r1cWSxzGjkjVPcwwczotf6sGmsNuaq0dpzMvQI
	dPIFLUllOyfNIIKRUCHKCLlK7vEl3WG/x+Xm7zMKcNo+yr7CdBcUnlCTKygs/4AYyXAuTOFBBdO
	M4QWVtq91RRGpdmPoz/aF+5AVzxxPFM94kdb646DvuyXRNkolek9kwBjuZuQSwsrYfsooO1HSQc
	82VuUdjNfCguaKtD5gXJKC15bkieGS3sKZ0wIw4F/Iu2H0KfKyxPy0LLWa2ptMghfAybcCl/SyN
	vNtphnY7YSEMVZ3I7zqCWZrD1rqTY6T4Rok/asD/mBdOnB0srkhMtiZvICXNU=
X-Received: by 2002:a17:902:ef49:b0:2cc:ee78:3236 with SMTP id d9443c01a7336-2cf34997125mr195766485ad.33.1784616927898;
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:27 -0700 (PDT)
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
Subject: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Tue, 21 Jul 2026 14:54:06 +0800
Message-ID: <20260721065413.2306137-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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
2.55.0.229.g6434b31f56-goog

