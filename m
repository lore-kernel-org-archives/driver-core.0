Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233383;
	b=T8boZrg/vUWp2OQ1zKkkseA3kRwyqwqZBWhhZzekAJMgj7Wumb1ocKRsUAeoJHAkPa8e
	 qh1Zd9gNz3yLq5E2+QfUb3yMXGIjOOV209MnbuR1tYkAbM2Hkzhlsxu7vj2QSbPiMAPFU
	 Py2w8j3N6KQuknWv8GDHW6zs9FL+gMnfu0PWGt+hm/NAZz3vlriaTX7+XAGi5sTKL6qAv
	 MsnTdAOj9YG31Y6JpuqqdxXZUGoKI3tZ/g/3gwadGQt0NIdI4ZXUPfxLwDc9qXhtPDdUo
	 19rknm6tP9NNRwx2b/uBLYcH5+iHoYNV6jCamLSoXmfWto/Uin+rlWWEfX1PrVWW1SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233383;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SnpBpONi2hKsnLkH7ie4ozWlmqX6tUPpRN0WLEqSj5E=;
	b=xUsQOFfZPoFfvPgVtbF8+bONK2HcSUTKUVgJw8JSaFjEww/Phgr3wE0Bg1tCWrGpQuHa
	 HUZ6usQ90Nf9L9HPBLRhkpBzVWvSt+t4U5EwMW6p8PgITAxLsrg8WNDbAbAT8CXVhOhea
	 CNZP/JaxH5STBFybIeL43/SQK7moa1QIXx50wNCQeBVd4SMFqlS3dtVpd3hJSQrh+VyGP
	 IUx3N2P7gfHF5CT20XkQDUIddo6piE3yNZ7hjck2CF1Z71kaQYzeTmA0169AMSx5E5W6i
	 tJDXBgh6HfJ9sOmA27K53Slk0Y8I1xCNqvAoTIVYuzc4uI6DFrAwj3c/Im/+YDqqcFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=13PXNakb;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E387606EEB1
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 14:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E387606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=13PXNakb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 156171A15FD;
	Mon,  9 Nov 2026 14:09:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D722A60051;
	Mon,  9 Nov 2026 14:09:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EE289103291BA;
	Mon,  9 Nov 2026 15:09:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794233378; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SnpBpONi2hKsnLkH7ie4ozWlmqX6tUPpRN0WLEqSj5E=;
	b=13PXNakbftQQnI+PimZ6lxIJXkAVr9BISrGu2q+LP/bomaw3sc9+NVSeAWV368BQOBHJXp
	fR++xjDPl+sxdWZ6sYwY5CYWUJ2I2qepKTsw05PlfG7DihTgsVEmZ+Rn/2zDGxL5k0noO7
	uE18Z+o71+R2sxfhjRsx2oRQ2tnjGM1G8KkowKlKZhxncCknAdqgktVz69YM/iX6x8sGdW
	v7ZmYZKdhoVC3IAVWUCO6/RhLKH5QLwy6iqo9QhFvY8W5YhS3JXcwjc24Yv0RtZaI9XfaL
	b5wvd2RQ5/MNe4kE0TYXcRSarhF8UzArIBhp3D9FSCtdzIstlRl68Vfh4quHHA==
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
Subject: [PATCH v9 2/4] bus: simple-pm-bus: Remove the remove() function
Date: Mon,  9 Nov 2026 15:08:40 +0100
Message-ID: <20261109140916.90625-3-herve.codina@bootlin.com>
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

Due to recent modification, the driver remove() function is almost
empty. It only performs a dev_dbg() call.

Having this remove() function is no more needed. Remove it.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/bus/simple-pm-bus.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 4322a778e801..e45700156732 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -77,11 +77,6 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void simple_pm_bus_remove(struct platform_device *pdev)
-{
-	dev_dbg(&pdev->dev, "%s\n", __func__);
-}
-
 static int simple_pm_bus_runtime_suspend(struct device *dev)
 {
 	struct simple_pm_bus *bus = dev_get_drvdata(dev);
@@ -150,7 +145,6 @@ MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
 
 static struct platform_driver simple_pm_bus_driver = {
 	.probe = simple_pm_bus_probe,
-	.remove = simple_pm_bus_remove,
 	.driver = {
 		.name = "simple-pm-bus",
 		.of_match_table = simple_pm_bus_of_match,
-- 
2.56.0

