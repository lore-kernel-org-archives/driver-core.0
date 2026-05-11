Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AEB423168
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515160; cv=none; b=DF8ZirPL+wO7gt+/otnjlXPQtradrN8xZgdm1ELlRTj3Y7yR/yJfC6FG4aSwnwjr0gfn86gvjQuKhqOzpjeNWBvD4V9KmCIQDxVRrCz0D3wecfos9WIWMEcp1FWKNfVENH/tXP4+1mSRV30VB30oCJxCTfITCJihfXM6spUPn5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515160; c=relaxed/simple;
	bh=w3bzU5+fI005BUSDFvDAmi3e1zzqSzsVWsUAnGjFQic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8Yw1k+41qBkaPdew2LXjqz3rjYgK93vK8Y995JyLikFKQDBPAM7V7Z0LkDig/57GyA20sO7KhyTxOYChasJoQ0TEVvt6bVuvSUC1ZuxLxrtjxygcA7K975lqrVNYFM8EsRZEbB9Yz0YMTB/os/O65w/NDtWPzeD0vmsN/0l6U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YfZZptih; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YfZZptih"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D0591C5E14B;
	Mon, 11 May 2026 16:00:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4393560646;
	Mon, 11 May 2026 15:59:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57F0511AF9F19;
	Mon, 11 May 2026 17:59:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778515156; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=f43D8ATRX3ZZph2a3Y4bwWOu8qESFbudFIHWHnMpJY0=;
	b=YfZZptihTRlYwdSRQHCQLDvkQ2jWLRDBZz2ttBXSVwglXYbKb/G8UM8AG/eqBlyx18kIzB
	hAIa4P7oXrI/Q0orbZQbcxsTmKKi5/Z4Ev8pKxGSM8hVs4nILDCSWOQYl6CFMFrv8XuNqa
	jGx2I7MoAnA7c+q6aaKuQueGyETxufE1j59UJQcsMKZCbRQ/0KDNQSksl6AoWHCSHnEJQI
	0mwzRDiBq2GufSS8/qVrpNKrY51qH2vCNtAUPNk/8iaPTXR7tgjsYc4DhSpMjSdeiAr+OP
	rcAtQpYhsyzkezU0KQ5Eh4jvFIQeGEkkT1AsKMOovLbFQ+R3dT+B83Q8Sz/C0g==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v7 2/2] bus: simple-pm-bus: Populate child nodes at probe
Date: Mon, 11 May 2026 17:59:00 +0200
Message-ID: <20260511155902.34534-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511155902.34534-1-herve.codina@bootlin.com>
References: <20260511155902.34534-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The simple-pm-bus driver handles several simple busses. When it is used
with busses other than a compatible "simple-pm-bus", it doesn't populate
its child devices during its probe.

This confuses fw_devlink and results in wrong or missing devlinks.

Once a driver is bound to a device and the probe() has been called,
device_links_driver_bound() is called.

This function performs operation based on the following assumption:
    If a child firmware node of the bound device is not added as a
    device, it will never be added.

Among operations done on fw_devlinks of those "never be added" devices,
device_links_driver_bound() changes their supplier.

With devices attached to a simple-bus compatible device, this change
leads to wrong devlinks where supplier of devices points to the device
parent (i.e. simple-bus compatible device) instead of the device itself
(i.e. simple-bus child).

When the device attached to the simple-bus is removed, because devlinks
are not correct, its consumers are not removed first.

In order to have correct devlinks created, make the simple-pm-bus driver
compliant with the devlink assumption and create its child devices
during its probe.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 4b2a793dfbd9..d969bf19a4e9 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -42,14 +42,15 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	match = of_match_device(dev->driver->of_match_table, dev);
 	/*
 	 * These are transparent bus devices (not simple-pm-bus matches) that
-	 * have their child nodes populated automatically.  So, don't need to
-	 * do anything more. We only match with the device if this driver is
-	 * the most specific match because we don't want to incorrectly bind to
-	 * a device that has a more specific driver.
+	 * need to have their child nodes populated. So, don't need to do
+	 * anything more except populate child nodes during this probe(). We
+	 * only match with the device if this driver is the most specific match
+	 * because we don't want to incorrectly bind to a device that has a more
+	 * specific driver.
 	 */
 	if (match && match->data) {
 		if (of_property_match_string(np, "compatible", match->compatible) == 0)
-			return 0;
+			goto populate;
 		else
 			return -ENODEV;
 	}
@@ -64,13 +65,14 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, bus);
 
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-
 	pm_runtime_enable(&pdev->dev);
 
+populate:
 	if (np)
 		of_platform_populate(np, NULL, lookup, &pdev->dev);
 
+	dev_dbg(&pdev->dev, "%s\n", __func__);
+
 	return 0;
 }
 
@@ -78,7 +80,7 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
 {
 	const void *data = of_device_get_match_data(&pdev->dev);
 
-	if (device_has_driver_override(&pdev->dev) || data)
+	if (device_has_driver_override(&pdev->dev))
 		return;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
@@ -86,7 +88,8 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
 	if (pdev->dev.of_node)
 		of_platform_depopulate(&pdev->dev);
 
-	pm_runtime_disable(&pdev->dev);
+	if (!data)
+		pm_runtime_disable(&pdev->dev);
 }
 
 static int simple_pm_bus_runtime_suspend(struct device *dev)
-- 
2.54.0

