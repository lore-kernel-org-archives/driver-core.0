Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB653F1ABE
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815270; cv=none; b=RwPSTaWe3Qkn9RVZkIajQTXKTYAWGu+gNGdLF4d6AWlsCyu8rrYS0bUh1kmxjw5+NyID9TuZ/k3nFCbAYcdnIkYXK+QuAbZrFPWFhKb78b7B156da8ZVmp+0RuWbk+SsUAtw0r+SMIY4xQizpWR43+dGpuIXdYVO7f6rBbuqm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815270; c=relaxed/simple;
	bh=V6UN6bwqEMS1zE4MxmGghRi6KxBqT1KqYJihRW1kRKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=upSFX6a+AEhFKgNTIWl+X5YUYfw/HzqzmVVEyO1GzOSWs4nz9iXmUOZdyHCt77DB3gjz8gWz9rSLUkxR/TSmrQhQM63v2k7CESbCmdLiFAlC/HFPrkS7ySlXEEEc8RmSsr0zSeEI5rKCQwI82T9lOKUL6FIzd//3DaY5UM7gkhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rxiy1v/9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rxiy1v/9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9869B1A0C75;
	Tue, 30 Jun 2026 10:27:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CB2A6025A;
	Tue, 30 Jun 2026 10:27:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0811106F1D96;
	Tue, 30 Jun 2026 12:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782815266; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IaXeqB2sKsDIMtRh37GrofBANs4uMS/5foflrswZ0z0=;
	b=rxiy1v/9pepKpnGbOtcywS9vX66oTA8pcNV92/KB4rfI0QaHaBEUwcDU24/Lgjrc9maz9c
	sRfxQXVVwl2xzQ+H6p1lElOJsdGuAJzWoR2NqutpOpApEoMSDfBfdpTTqaNqma2UCe5y1/
	KFLt7P9uUZwwIBkU3UeD6WaF2Dc4h9TW9OxU35iSGzcTg/3Ln4n0eSai1qAL9LyTcbLA3E
	fzurA6HAunT9Dir0yJfxqe3zyFoTYOFH2XOoiJtCE52vWaw97hf5hfH7sdcwKSu4VwZa8S
	huc2KzN4kQ4vcxk9J/tNyZOlsFAD4vDv8SRmQdh//Zd4DWRJdnZKGxcrkxt3Aw==
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
Subject: [PATCH v8 1/2] bus: simple-pm-bus: Remove child devices when the bus is unbound
Date: Tue, 30 Jun 2026 12:27:12 +0200
Message-ID: <20260630102717.413501-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630102717.413501-1-herve.codina@bootlin.com>
References: <20260630102717.413501-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
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
 drivers/bus/simple-pm-bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index c920bd6fbaaf..4b2a793dfbd9 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -83,6 +83,9 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
+	if (pdev->dev.of_node)
+		of_platform_depopulate(&pdev->dev);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.54.0

