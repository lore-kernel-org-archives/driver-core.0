Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789A013959D
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080920; cv=none; b=dGOrJZAbvYYuDOSxPlkA8ES/4EMqyQ17gh85gZLqfa2V/ybG+oDmCCU4QUIu9u5M/U8dLJGeCtWIY+zlpaEzdZS9DGoV3hRtVRVoFMikDjN9w1irPu/FZN7B/c8p/C+IZzpfFyQes1GQkfeusGo05pOwdI3lY0IecGqb8dkH9h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080920; c=relaxed/simple;
	bh=K4CbRZICEvXlvZnsotKBa841gnqFgA+6O9aKcbgn718=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrVv7VWKlaTYq3/qY6hAQ9pGKxIejsARJHaQYsbVS0nTq3tqYQo8C+ihBaz5ySq6OeyZnNoKS4ye7JhcW+lIYiRcrpGNRqO2Xr+8mfgfw2RyD5zx0gM/IChkPQEED9dUUtwN+/APtetTMCsi07cRznSSy6S9JP6yLCnB7Ni05Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DN+RSKCO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DN+RSKCO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf36a6905cso46297545ad.3
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080919; x=1781685719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=DN+RSKCO+Hkx8RzYamwfJerxVIFUL7VioSPiLQWW7IO5fuEM4F66WC1nW5VQeYp2yS
         q8I/YHQV3aGOWuM+n97Xf94TeYXfjOvg+QQVh02/YByHbZVD7lgczXp2cnJxa8HjLOpG
         p8whnzmYo64VnGEyIiI24+PY/JvdRQrWp6vfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080919; x=1781685719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ie5n/VZ8V7UrahMrX/rnRRNTfb3tFqqez2pnqYi7Q4=;
        b=gL8I2VSwcUnKP9lJBnbzHSRD1pLIiOkDitbJWMK7kg/G1i3CU0ic1QFRTnQgJeK+PZ
         ppeTvPcCdL8sRmj2vGiJLHzds6ovuMeDYAH2ULZy6vnJY+CMkFHbzLJdQl0QwIwUW7sj
         w8XvxPcHjIf4/uqWD5zkp2SXpPJ0ijmn7ssxAENdfbWLWdMw3Q+aClgsJhP8pEbIe6pr
         vLrI6kzQlyehK+fQsX145LXkitsLYiPXvHT17wBtyNd+uAQ7BK4A6084dXS0r3ZI/7S1
         zXztJMMvpc5cSAt7fvPlfPEwPhJdTSg3Wcy/5ZaPq5Cp2TJSjcOzLYAUU00FPpL6IsdY
         EhTQ==
X-Forwarded-Encrypted: i=1; AFNElJ97BZTGpI9qjIuCO9tVlmenme0S8fUIOBmDflja2+QSd8bfOaVGw20nHafu5tjC3bQN4TNZj+PurJlpaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyjw0M3TWS5s6gpFT/4+w2gFGbUlVO+6iD1vWPSC1oUtcKusdGt
	Uf1x3phBs+CplKCAV1GiDmxxTtee2kk+JQUwYiY7MRLXGq7KqoNSs0E1OP4YTsgeEg==
X-Gm-Gg: Acq92OEqvIttojlHVp0jeh+crwjiFKa34BR+s8UgvZ7bSGj8HoDhYAVkGCTriNw+ZjY
	RoWGxRiqZulf5hxS7ZP/KEWBrUQqD++vlEuVou6FaZ3rKmCGu08RGRRcAUFQbEW0PD0St1ibQfX
	oBX3IuM1rXHbC5UqLa3mxOKUxcMjzYsHcclod93IpTKrRKXB4JXmFU2Mdhh2L1AdkGon5tWOG/v
	aHXe5lP+UpJNBgqtDSwIcQB9OeuPheS5MFk/0LpYJApTQbUVBiCJPuX/eiK/TLFmcAL/Sd5w5XY
	7uOL4GHbBQihMZSYE45ynJfAgX1fALGs9TrxgmRhx43okmOwWXgAEbYEqeLEXSsiPkj8SItBSnC
	CHwRdSB5Y1RQ5Rv2Wnb0o+jmprWl66hrxp4R9BYWuifiVCii00Ytu/n3cpzDq03Mv1gMjkl0viI
	fgG1J4RP5aVt+sAkoVpA3oDpBxEZI8RMfBmzmZ69ZSexGlyTyvWIbncX9J88yMhkFvsPMp+e8GD
	evEYbl7W+D39ijUK8yWun0fD2ni
X-Received: by 2002:a17:903:3bc5:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c2a1bafec0mr80534305ad.3.1781080918758;
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:58 -0700 (PDT)
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
Subject: [PATCH v2 09/16] dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
Date: Wed, 10 Jun 2026 16:40:43 +0800
Message-ID: <20260610084053.2059858-10-wenst@chromium.org>
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

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Allow a ports sub-node for describing USB connections. Port 1 is Super
Speed if the controller is SS-capable, otherwise it is High Speed. Port
2 is High Speed if SS-capable. This port mapping scheme directly matches
what the hardware returns in its capability registers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 75ecce3bdc7a..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -184,6 +184,19 @@ properties:
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
2.54.0.1099.g489fc7bff1-goog

