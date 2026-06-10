Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E743BF66D
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080916; cv=none; b=WmPxv6tuo+BgebpF6hj6lIfZNhA21DWRcz/cT8uV1ubclqmtVeEFb/rkdCPctx+BjvlQEfhSx2+5OxTqSlAh9BVRxon2iQzbkGOA3m9nMkPhfyYTJ4uUPsjPLZxuOYnX66Z2+B+PFYRvjUtVSpXjwEoAEtyyr0e7LD88cm89RMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080916; c=relaxed/simple;
	bh=Pm31+hL6qrgMtRuUHHiRRIlqVHF08y0dXaprDA+L5Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JstpVGFqa0RmhmwZqhtSMJcH+I/JiquaH1HUm+ZhPX3KQbsyh2CNmH8KaLcIATjh6ZsEUMKzLEpbH4etB8p1OLPisZbuDphOD/F3XxyHNJ9BqkkQrbEfysIxKK80lBt0gcEddoDJVjIGPoH8/rES1gHGluJGbSK3lhIWpdShxMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iFBNRz/k; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iFBNRz/k"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c0c3315c5dso67896615ad.3
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080914; x=1781685714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=iFBNRz/kJZv9tYkODhXZxsea2+26pCrVbEgNMWS1Rl9stF/axVj/GRgHNAHzzK2ZP9
         BjJ9QwjLdt3Qv5qzgRGADfKvuqvZD4RT7ActP0oTwqBGthUwXdjM+y6/ZwhMwbFNUqF1
         /9sG3DAEmxe9rkeBFOORiEiNRpQWf7yJ+4t3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080914; x=1781685714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YnO3yRdxbnlh4RjwbvilfqRxY8jsmsz+8SVoyh3JZE0=;
        b=ZnM6j2epHKc15sKiKWSE7BGiiayZ0JgcNJfswq/i2UAjxcAd7vCzfB7B8OGhRlXuMs
         a9ZV9fWmy9SAQ9gx3Cz6VfFdxIoUs6T+bFzKfAhZYfJfsG7HwY5dd3qWWyoprVpsSq6F
         eSYeCRdPRhf+5RC68e9bA9kekSKQliYMlfd95vFzimakIzduQkP5OgjwJlzY1SQ5Y4kM
         jsy7kPrIx4Uf/WBXrtWAXY/0LkimeQGcNEj92Po7uwUd3ttDBc1+7AivtOrOPNPG2MsA
         XPOm+ygtoW9A67ZQHF/b7EYzm/oa40r+MCwE9S61jpgAmSS1LFm4GPAU8yCSKwchwDUV
         sScA==
X-Forwarded-Encrypted: i=1; AFNElJ+unzKH5fdTY7xjyFz65ZLFsENBI/G3XwOdUJ/4Oul1Gi0LrwlSu+L0MI+q2NH5nOYtMvuSu6qoEU7abA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb71qReYfbkxVC8/dlxaO/7JzLDmI+H1v2SfiyUH8Ols5nFzBZ
	XGp6zVMphw4auYw/uX9WB8Uc3zXWwPsxe0HZscNW3yCbpcdR8G1JzP3sje47X+ZfTw==
X-Gm-Gg: Acq92OECvMXO2WKGiZ8K6zWm16UgFSCxCt1voFMJ+CyYOoAaWToJgZQ9dZuDAcZ4XmI
	u7gX1kvVxYa5yzaxt86SBEBtLF8ehv9BwIncZnM8eCIblQr35KJcTr/dvrudv/IsHgTmvBGEdqK
	JBL2dsm2G5uo9WL4v3byJzKsfVyft/Yk184QSlPkFL+eWpo9U7ORcmQn6PQAYq0KDO/cHDfLVKk
	x3nkXgOs8oa+fsciQKFok2O6aJnDXi6AcNFt4ifHHOncOaH3eoZZRJb5zZ/GD/fjpGRl/9ELFVr
	t8ckoCHDtGwkzYXcK9HDfC0w7WjrBUsIdJNp0wq/hT70jhUD/4ulJwm0jxpa+gN/Zx3h9BHHSyf
	XtOQ3EwqZwnpMAB+30dJBEw+zcfNKD8k3r4s4QDpcp1SI59ZATTzqYOM9VB23hokuaT7dNm3vtt
	+1Q/hYkuQgIkQfac6IGry84UsW7nPZmgkclMc/+w9tYGg/fSdn/YYcdAkRANi1PZ5aPgiV5Uaoq
	opiHMz2WEPYwOvmHA==
X-Received: by 2002:a17:902:da8b:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c1e85ac571mr292987545ad.31.1781080914415;
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:54 -0700 (PDT)
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
Subject: [PATCH v2 08/16] Revert "dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP"
Date: Wed, 10 Jun 2026 16:40:42 +0800
Message-ID: <20260610084053.2059858-9-wenst@chromium.org>
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

mtk-xhci handles both USB 2.0 High Speed (HS) and USB 3.x SuperSpeed
(SS) host connections. And there are USB 2.0 only mtk-xhci blocks.
The SSUSB controller handles the device or gadget mode. Saying that
SSUSB handles the HS portion is wrong.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..75ecce3bdc7a 100644
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
 
-- 
2.54.0.1099.g489fc7bff1-goog

