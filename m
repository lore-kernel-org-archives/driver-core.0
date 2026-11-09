Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233385;
	b=suFNSp+xAVYkKS7qJBDvOoCUDtbpRS412GYUi6j3NesP+wgiXdMIG4VcqhGMKgUTH/rj
	 rTRmFfwTK23FgzCBkg7ZUv+5tgzaV1UVucEbLXPLQQmUOMBER9dP8mGno7SLyp+sw1vCu
	 Mnizx2C7AXcsslJmA1BoMsvXkVb0inEmM4RnwMOF6g/TYk+4l4/I9OMt6IrDuHFX8sf01
	 AVNSg1My4dwGKeoEK1mjHMKAMwX4rt25go533WkC3mK1newqalJM/TDb2Tk1gd5efXJPz
	 S7mu3R6IKjXY0Lfmk5I0Uumo6S8ezIoGJy0gQ7AGTqOaPTxAwlkiuXv5+ASSUntJDAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233385;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=L1YcTl/uYfFtLb4iHc/VuFExeEr6pRbLZWly8UMoO5U=;
	b=lFTglYUZYABOzjJnTg9V9sxLxIi7l1zeoBMRX/HIvN69hQc+owFknKoSPg1E+grvqKHG
	 ucCTeKqQW9cRHzpoxo1JTaFJZhfKNdK4QkCNfqWhXrtLQMVJBxRF0XlsFkthGJd0KzH/S
	 ZbGKxschEKTuUSwOTCCHPbg4//9rN4i6ciePtsk0Qln5z6sXYNbnNkJhP4P9uJmkKdr2i
	 qlw53blpq3boGQQPTcutFcaBHx4ZfrJthTXvtcqzRL6CbOWITs57VLXk/0uXfbrKP/Pq6
	 ZY20GxL0F1XkaityrbxBk+eGtgedKg0CMC1ZcqMlgye6z9eT+dygVH3G98dbPIuVPTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UvUrFAxl;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D353606D836
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 14:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D353606D836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UvUrFAxl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE642C79A80;
	Mon,  9 Nov 2026 14:09:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C59F860051;
	Mon,  9 Nov 2026 14:09:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B1346103293D1;
	Mon,  9 Nov 2026 15:09:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794233381; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=L1YcTl/uYfFtLb4iHc/VuFExeEr6pRbLZWly8UMoO5U=;
	b=UvUrFAxlpJbvV29mh3MeMEVI7hIYOiY4XPs8GaAiEQe9fG0JX4bb/vkCLHAL1HhZPBoziK
	vStNEyvNvZ9N4r/d+jBZEO2amvu7yD5MU6NZcNrOLU1yjMGpq+y7G6fsCFvIIH4V8BC+Ol
	fxue7J1VS7yvlu0vlfu/C/oLKnVL0XDjYwigl6SgR73nqEWBCCyRax7Wcbbi2Z1AmHGEnM
	oYilIKysNTQnJuAcyU4rc+z/gK+54U/h0YCeL5jihi231vw1XaWS0y0GIsohYL2x2xtUKO
	0bSIkUKMoW+RFLHNQElcMJpFRSQ51ZeqykGOAO1jHghmLMXjTvE7DIE72DOw6w==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
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
Subject: [PATCH v9 3/4] bus: simple-pm-bus: Remove child devices when the bus is unbound
Date: Mon,  9 Nov 2026 15:08:41 +0100
Message-ID: <20261109140916.90625-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109140916.90625-1-herve.codina@bootlin.com>
References: <20261109140916.90625-1-herve.codina@bootlin.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

During its probe, the simple-pm-bus driver (simple-pm-bus compatible
variant) populates its child devices but it doesn't touch them during
its removal.

This leads to bus child devices present and bound to drivers whereas the
bus itself is unbound.

Be consistent and remove child devices when the bus itself is unbound.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 45 +++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index e45700156732..23ac18551fd9 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -22,6 +22,46 @@ struct simple_pm_bus {
 	int num_clks;
 };
 
+static void simple_pm_bus_depopulate(void *data)
+{
+	struct device *dev = data;
+
+	/*
+	 * Bus stays on for children
+	 * This ensure that the bus will not be put in idle asynchronously when
+	 * all its children are removed.
+	 */
+	pm_runtime_get_sync(dev);
+
+	/* Let remove children */
+	of_platform_depopulate(dev);
+
+	/*
+	 * Lets runtime_suspend() calls simple_pm_bus_runtime_suspend() in a
+	 * synchronous way before disabling runtime pm.
+	 *
+	 * This guarantee that clocks are disabled and unprepared before the
+	 * bus is removed in all cases.
+	 */
+	pm_runtime_put_sync(dev);
+}
+
+static int simple_pm_bus_populate(struct device *dev,
+				  const struct of_dev_auxdata *lookup)
+{
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	if (!np)
+		return 0;
+
+	ret = of_platform_populate(np, NULL, lookup, dev);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, simple_pm_bus_depopulate, dev);
+}
+
 static int simple_pm_bus_probe(struct platform_device *pdev)
 {
 	const struct device *dev = &pdev->dev;
@@ -71,8 +111,9 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "failed enable pm_runtime\n");
 
-	if (np)
-		of_platform_populate(np, NULL, lookup, &pdev->dev);
+	ret = simple_pm_bus_populate(&pdev->dev, lookup);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to populate\n");
 
 	return 0;
 }
-- 
2.56.0

