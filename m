Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E074B222590
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230905; cv=none; b=u2depe4iZ5Rak8M2GjMgdzcwBL4fAyMMop1qNvSezA5NwyIlQWC8d9y9FD4zJ4yY8OREoYRson13i9vuu8U7bedew0+oftWmy8Ic4EUiU1s46X1Fsi7Ak8XPWZD3Bi54P172kHr9h5Z4y1q2abRrR7I+jcoqZmCGBnSOp/9QJX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230905; c=relaxed/simple;
	bh=1sqhnylLI7gkJzELxLCPnxHxDOb4FadriLVIc1k6lys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mnk7PnemZh36IPZPuj+8lgOYMYfdYbeezX9Asnc4yBJcWm8fHyxiZ707VZN/seGUsIfTk5tkf21Pt981eNgHyaev71RScXjB7Ixedn1AB6xhZkTjqOkKOTho+OkfD3O5ibMHLU1a5c0VtAU4t1gLbgNPlTLuPfH029LvrKEOd6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxRGNsRz; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxRGNsRz"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso653003eec.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230897; x=1774835697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV33ceOiC1VxLFfbHMOp1tzZ4L73tAWczcXKydNsu3s=;
        b=TxRGNsRz6VRpNCXBjcDHUAFmPVtfSCBP5dP+01xeYqvaQj26UATeRyoORDdDHE1fM/
         evh1mSDqQI1IWXrE8nPF6cahUmH904fjKDVhpVvBKmkEkk3jn/1nrfmV6k+6iOEgqSf1
         7xFtLSZ6jsyBrhul6yKdid7rFXN7M1PN7jjuQUrMPx+oh6/uro5z1KZR8quOWodYFBoO
         jS/3Ue62De5angb4v4v0Dz4bxTXeFk7zioiQ3ToY/h5q4NSFVRLiT0ri8nXpk/rcavBZ
         NnZfTLgExtYV3gSPf/r0oIUiwlR/G17ZYFKHS3qXhOakpD7oZ5AocVQZ/dnHcxUZsCyK
         fUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230897; x=1774835697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JV33ceOiC1VxLFfbHMOp1tzZ4L73tAWczcXKydNsu3s=;
        b=Oka1cRUEZa0eV3AumDEOWyRZ9N2vuPGAX5guYy7A1cSLUXgG9X4H0Us1rxQyBdfrJJ
         7LQ9ZnDQbJ4e0qtn2b/qS0ywBKP+SJrqgweSh2lLLOThwLbKkb6RhMb37aaY3YGv7uv2
         9joE2b9d/9IqEwM6iOV8nh7q7OTexxXnt19XFv7x0CSWocI8WwR8hOPg4MKHf4O+ui72
         AUV0skH7a0H/rAOgQ4T+711SMdYVp73L5Pta3ObrIX6j9vb3u4JJ5VzmIqNhrmS0E4rO
         hoR/ve6cd8qhXkOPq+YcrUUueUFLbc4IhDlgC+2elGHKQm+yG4rZi4ecXP2sgRbzfxmq
         DxdA==
X-Forwarded-Encrypted: i=1; AJvYcCWFRXKnxK6nB76jbnLH1povTVKDffRsfB9tSS/9LTec4zCG1ideleNsVDLDW1fqTV/xohU/Q7GOMLYJaA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0BPMj6+BgiJ/VgupWXhMIAyIaXzdaNloVp92czJkcRdDOmWkD
	K5WRJWhEA9OQd3Zuijdc2LkKJt3hMnAthW/KffcXhn9H4/REspuTdq4z
X-Gm-Gg: ATEYQzz4C30+WjP4rV0SJVLEdhPTcgxOcs4wcPrFlEtLG3anpJTegH9zOqRgl1Ok81r
	vCX2WW2V/VeWvpprj1UQowRMDPTy363yupdDlG9QZbaYMtKX0F12f1u0xpTZksY6WUs/pP6+pZW
	PryfOFvfxmtJIE30NzLLBKh7f1DYFRNcFZcvJAvNGHCw1qcfRQCi/tZgcvZE6jF5u09BLwQtPuR
	BLREe6c/MK/Hze1V20bq6adoAZoZrjG/xHnTgZkdW/3XO2BFsouDbodAEsVy8tHd3s1qa//7KyU
	mUdH3CNib82JJRv2Nk1P6GBGhrFLU5bFzyylunj2jH/LCONGfP9rkSdCSQaK4BQ4aLLTTiiHV8H
	Efd3x+racJHmPS1iUzCJBn4uQUIDRFzUD93G/m2w5+fpcxLwoduGGCYuT6Z0j/SRPS4ZVi1AFW4
	j1gwlE2hZvJL+gxgyxZHB95LD1rpPQWWVJ3DnAg+0YulKGOTLUxVCufg5pWAe6oHAfdKq6+onYR
	wVI6p5xsEo3148=
X-Received: by 2002:a05:7300:e2cc:b0:2c1:27c:75a6 with SMTP id 5a478bee46e88-2c1095fbaa9mr4810786eec.10.1774230897161;
        Sun, 22 Mar 2026 18:54:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:56 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH 08/10] fpga: bridge: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:26 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-8-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: 8bit

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/fpga/fpga-bridge.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/fpga/fpga-bridge.c b/drivers/fpga/fpga-bridge.c
index 8c275bd48a0d..3e04bb4341c7 100644
--- a/drivers/fpga/fpga-bridge.c
+++ b/drivers/fpga/fpga-bridge.c
@@ -9,6 +9,7 @@
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -94,7 +95,8 @@ struct fpga_bridge *of_fpga_bridge_get(struct device_node *np,
 	struct fpga_bridge *bridge;
 	struct device *bridge_dev;
 
-	bridge_dev = class_find_device_by_of_node(&fpga_bridge_class, np);
+	bridge_dev = class_find_device_by_fwnode(&fpga_bridge_class,
+						 of_fwnode_handle(np));
 	if (!bridge_dev)
 		return ERR_PTR(-ENODEV);
 

-- 
2.53.0.959.g497ff81fa9-goog

