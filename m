Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157EA421EE8
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515157; cv=none; b=XUSg73BdXXcdNzk4VOm18qOjOUMqUuezAnPE8uYDcfz7l/+1BWdMuniQaoD9Ksgi/0GW3QCx4sF5lsVfzfXSDdg67Gkgkk3PKmUiogI5spy/YgOyA6lN+Pf09zeWA6Ou1j0hxFqpZ6pmK9CUYBUrRnrWgKymVDhSjb3HY5LRTVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515157; c=relaxed/simple;
	bh=V6UN6bwqEMS1zE4MxmGghRi6KxBqT1KqYJihRW1kRKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSFAI5aFlVEAruyXbPxyCJkH4ORFhwCb33d9e6ZU3dZR9xAI/Yk/gurB50YeY4gPH6xMyemBd6lFtM6mhBFuu/n4+zcNcuGNCSkOgbELu9J66ZsiIiLXbFk4xSKZ3VaxcSV11f/hnbbfmzGdFMHJ/+4DIip7m/sNHN9bgVCoaDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yeq34t9x; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yeq34t9x"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67835C5E154;
	Mon, 11 May 2026 16:00:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF48260646;
	Mon, 11 May 2026 15:59:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E0E711AF9F0C;
	Mon, 11 May 2026 17:59:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778515153; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IaXeqB2sKsDIMtRh37GrofBANs4uMS/5foflrswZ0z0=;
	b=Yeq34t9xS0vwWcNADhMWcohBtzDHpA1cyT927x0zts5iHmwnnOuPxYKPeFevmi2aWNms5T
	MTyJU5RC6SadeoKZxwS5knz8HzbMeLLiDTMSu8+7fuWPd263TqwxMiujn5K+/owC53l5Xw
	FhXqHjoeL+vPkdqJrue8PC1ZX0e4XTsov3AtZdBqKLbfs6QU/3EhsKIvUzX9t46epIwIBW
	At6HgM1gY0n/G97gQRsJlye0ekxaopeZ3XCABp7sgWymfIB6Ydn/KjLfkL8pYrbO+2xU/g
	hX8o7G883vjxGxkGlWx/ConIogwKiF1xfWKalxATafxzT7VOGYiK0euzG3ggUw==
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
Subject: [PATCH v7 1/2] bus: simple-pm-bus: Remove child devices when the bus is unbound
Date: Mon, 11 May 2026 17:58:59 +0200
Message-ID: <20260511155902.34534-2-herve.codina@bootlin.com>
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

