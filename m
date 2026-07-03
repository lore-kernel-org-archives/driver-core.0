Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8873C37A9
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076660; cv=none; b=Sm2q869CP4/gzGmBYlER2shbnfWpuPmlxRMWa1jpVyWBsuf1aDqQWvg4Ek3TkGmjZWjbYnE3BekLF6oZKrsOhnB32MFqmCGvoaQ0l1Qp9daPnEK8REAZIX7giHZNG84AGGzHDtKT6YcWmft0DF0KEgExL2LMQdGWOJ31s1niOQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076660; c=relaxed/simple;
	bh=StLYhAjRY3Tk0UVrkWuO2kk43YeFTxpvsEJRpOxBLc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j3LpKd84sAM1sGaNX1A0ON+YVNcRGwidxNwF6QUr0RS0OxKpR+jH6B+luakfKPLOIFmAazrBbZtDnPaknzKG/IUBucvexuoL12tbb7zWkoJZjEbAqJQJbCIOkQZyeQnqmRq+2mpLn87aD4oo3Tm65nY46fD24t+C3hmdDGrvokk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bwAYBEcZ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bwAYBEcZ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cace7da66eso3963655ad.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076655; x=1783681455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4WWH0bleuNmTAqXa1RwaMnEajgDvtrfpYNFP62ibWI=;
        b=bwAYBEcZWYj1uf0WuSxbmiXEdQC6Op336BIu2DM6lMog8ZoVUvoxdqRlkYZEU10g/7
         ekMHUy+lVRSPXHpe93JP46MWVhBJ0e9uGl+H5pP/t79vlLTfAHMQ4e5Mr34a4WFLAoM3
         rMqfW1/TMRpU7iNKWuiNqcBxe2JR2jjCg/TkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076655; x=1783681455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4WWH0bleuNmTAqXa1RwaMnEajgDvtrfpYNFP62ibWI=;
        b=QHv/gpIQzBf5jEqsmRcLQdR8HrIZr7w5sF9na2ArpgZLLImvTjh8jToSxQ4JK8n3gD
         UJw9GyQD3ksyKEozr87nYlitl2QR0WrHJ4t7tBxNesreWymGSLXpyMHuzr5AMZ70xj+d
         fVJsqHEG8SvdYJZEAp0OhKM/JnihI3INTMxW/MvCxdHx6RuRfoYU/IGJJ56sVYxf+lDT
         fzFD9Km9/A8g3tzLRp6sPOIdTeWO2zRtpHyDcOu8dgVjc4xKzp6Hj0eytdL5o0dbZ8aD
         TGoHjOMPzP/cHvqsPhUFf7RZBtmw3uR563jjaPY6aMl+ZXf4CgvO17pmGL1Eln0xaXws
         funA==
X-Forwarded-Encrypted: i=1; AHgh+RrlsKq5gqQiRb5u668ZvsiXkjvsNy36ZdGj9xNimoGxanPlFZ6BdfufzDo0evRIBHDTLX4H81r7XKUN+g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaVCFKYoRfI1lXyzxdeVDt6eLPVTiWu8Kq7MPMtA27SBFkrQSn
	dNYx3MT9st1Kr4XXAzmbiXxjId9z2px63XPCDFHb7KWQ1h02jF8IyWus+ssA3KbfZg==
X-Gm-Gg: AfdE7cn0PJX7ig78RG4CHfjGliLMWELLKL7BpgPrI4Vzig5c/ORY4ocpfyYVOpwkUQ5
	agKppVf8pgGFKNoKBnOgE3pjfrqpoxHzFZDu1+iIAkLfLnqTo9O3CxB8J+j2et7E36wnBu2/Mg8
	NrvLFjfqJMLvE86mjgwjBffYcyNaoFpZyIWcEc09i+nUYmEsbkmvr8UeHpQST71Kl3QpwSiqn1o
	Gd616ryUP/kPLyIuG3fWqCPFQ5pqx+TB+fYbMF4YIE9WvmQRGkk8NmA6sJteyfQHkba/l+Xn2+g
	6FK1NjBXNeYIb1OjHTF1IYTsFiXt070sqk6OmPEM78RdOOz4wECsKcHDO9YkwOsyrhEVO1KV2gR
	SeQDjkvAua6LmhS27rweNGLyjC1Nsb3QFcj9ctQD4JAcIKJm4/70JVYweRrPWOhTXbdinJ/aJsd
	wZ4vcHp6R6AFwogBi3ueNNm8TmDi4NdvadkMEQKwOfrlbmZ2k29dPYmGNQp1u7WPXncu7clA==
X-Received: by 2002:a17:902:d58d:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2cad7a013f5mr21135815ad.25.1783076655443;
        Fri, 03 Jul 2026 04:04:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:14 -0700 (PDT)
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
Subject: [PATCH v3 09/13] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri,  3 Jul 2026 19:03:10 +0800
Message-ID: <20260703110317.1283411-10-wenst@chromium.org>
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
2.55.0.rc0.799.gd6f94ed593-goog

