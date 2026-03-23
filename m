Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426C223DCE
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230886; cv=none; b=TNWkdisTSxhO+nwSvZhrbrf4bo6HBsmnq1gtSa2AhxYo20LwsWurzBWbrKboKl7OfW8InGIq6l3i+gx7xi3e8arrxUYlu+8wB4SNfDR7+ijIS8uGw2q5W1u8tiSCkaWfzWNot28XZntDO0mq+/l8nDHfswadQ8pzZvB50JfIlRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230886; c=relaxed/simple;
	bh=vhx5QpoROnyh2q914MrL5geRu8AVJM0r0udOxsoTw6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BhjCZc44JRxwQNN3bNybhipU1w8NtRWJPbl1D0wL4hrytdYwjyrbLhrWhzT5OaoA3N+Fd8j9XFuQuTSVnAdDxwz8E2aI2DJmQH6HLMlD+0FhEiqWSG0ZP7/KdBJWC4MyX192ri1Biwz+HN6fVJw8Zx+TljvzDiEIGXSIYd3stW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWtSPXqf; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWtSPXqf"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso2165294eec.1
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230884; x=1774835684; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFZooOyb7hfKDEpM9yx+Ztfv9BY6tuw4luVBl13uVrY=;
        b=GWtSPXqf6iXLqEYrC1QFbIkjKL+v8IT5LAlWELb0kYMNfv6Ig8uRSi4Z8fVJK76cW4
         RmNKnsXZ92CkPMcbtS5DqUD0zXOBPvQhAsIXna7AZ9ON+kZNTx1mwtFfLRcWpiveWZVk
         t7EnEyklnuxYiG77O4MYmqKZFyN3a5FbfUMOnPiu9waE6HzZkMKA9vzA8MwssoKwaz2f
         2C9bk7KcjdV3mUbYTQi7QRRqZhFSNiHzDfLZPlN9EKKtwDCCwDQdrgEg3FQfY3ZiFHwC
         6MoBD+MpmtGWhDNoqr5Xi+FmL6OZT+VRYkAoEzAp91phkCzTJZrEeW7gReH2aVktozqV
         tpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230884; x=1774835684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hFZooOyb7hfKDEpM9yx+Ztfv9BY6tuw4luVBl13uVrY=;
        b=WlXS7u6UKdSGjDdobpIigXW0BK52AZq5OFXJQj7yV5FEvr5QvPck8isKRAux9YB6ae
         bEKpUxN+f49nJqsoHpmgJkPrXO5xBqTPoTLhTm7M0ZGzN3rAJIW8YnB0jx/Im7lD4vn0
         lZST9AGPZuGbvmy6wgcEpYoZPCusIyepgPEthot7O2ThZNHTikAEOk65zRHtV7i7Vn4p
         qVJ4IxZ0AolNNqlgwMPTJ7ggk4WEtTalqcFq9iCq98G9EsuIjucsqnQ8cR7jkk0k3JqY
         Owo3WEXegpWAV6P9GuNWfvGYqLn2CIwov70vm57+CASvNwidRWaGspEOpLkHTdpwTXGg
         ww/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrQTPdi7PT+cB69D7cvq74p6yFSZ4MaZaYEvXSykj0+1t/rqg3C2+7sBvs+9aUA4kWIo3EbsH+fGfnZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSQFArktYUXQsGOnjUrO0FIefNoUaVRB6rhoZZZgP0vJrU/LNh
	a0bSyXtLkepfBDKowvo3Ic4LLH6jOqhcKtS8a/JryBLaDsKc+q+Ge2xd
X-Gm-Gg: ATEYQzzkyXOCvWoxZlJeyBs/nYwlH48yWejOdqz/WYSnFIuYiIBWK1dKH/QoFhccFf9
	mZj+sIXtBlKbE6qcjRPcZkOKIj4oJjPbkxVfLew7BSX6Cb7tiDm6/5ilPGYl8dwrmN2Hm+dAtQk
	rCnIWvZJocSBztkw3ZbDLRanzQJrGOVvO47MSK1JBmAzFEN9MGZqTvgTABHGSkL8jQmKBFaWNhP
	y37JvUjj+mWSliMG11oYeKF4zCo3KbSgu/v6w2Hf/2C7Cn3uRslGfpSpTq9YKCG4TkIBfqlP/nl
	mwy1x+GgAXLS3ZbspaNwzK8Q0mgfj/w3HSRix9uFj2lBJmZl5XhKjwrn1qXvUB+nbq6FdbJD7EM
	F7d5SAilgiCYAk44bIn5tNZKCNhI+TnGRIt3x5LHV9bcPV5Jc7lxCyCtHzn3eUVcTMz1C+JuxxE
	eCS0ve7Su1fokD5URftfMxEXsxBmwR/8+Nm1MEYHrM5sPTQTh1PLhPh0CIh6tW0+eLK/c298GFe
	Aar+4FSVykVWsU=
X-Received: by 2002:a05:7300:d517:b0:2be:1cb2:3a6 with SMTP id 5a478bee46e88-2c10980a523mr4129993eec.33.1774230883846;
        Sun, 22 Mar 2026 18:54:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:43 -0700 (PDT)
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
Subject: [PATCH 03/10] spi: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:21 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-3-b72eb22a1215@gmail.com>
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
 drivers/spi/spi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index bf1df365f795..071a9ffdb59d 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -21,6 +21,7 @@
 #include <linux/kthread.h>
 #include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/percpu.h>
@@ -4948,11 +4949,12 @@ EXPORT_SYMBOL_GPL(spi_write_then_read);
 /* The spi controllers are not using spi_bus, so we find it with another way */
 struct spi_controller *of_find_spi_controller_by_node(struct device_node *node)
 {
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
 	struct device *dev;
 
-	dev = class_find_device_by_of_node(&spi_controller_class, node);
+	dev = class_find_device_by_fwnode(&spi_controller_class, fwnode);
 	if (!dev && IS_ENABLED(CONFIG_SPI_SLAVE))
-		dev = class_find_device_by_of_node(&spi_target_class, node);
+		dev = class_find_device_by_fwnode(&spi_target_class, fwnode);
 	if (!dev)
 		return NULL;
 

-- 
2.53.0.959.g497ff81fa9-goog

