Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086042;
	b=mq3k1FeI0+TiZfkGC8iUJTLnFkDgoxs/Ugvon9aGyevNp1Ug/0Fp/JFuES/37DQcGuhs
	 wq4YSlbmSEB4W68go+ebtxmWkMJaT7QHsXgB4u10yaSznmeCVCXeeBNDe9uM4FJGpjDGl
	 z0dEc4oPiF4vlyATZz49TnzerxRlWhyiXPdIMTKDtVyErHziOJfMeaCnCZ8vhzowjfgGD
	 o4uPMO+My10GvQydo2ylPfLBx1I63V1dj/TyKDsvXwxNu5Ga1NLpqu2AJ9Yxi0fYJot9t
	 Wq2l/xrtSyUyAS7iRmyjfouYU2UKuxTkiMIfExHSFUCe9nibFHEdiopApZl6Gwdwo7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086042;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SnpBpONi2hKsnLkH7ie4ozWlmqX6tUPpRN0WLEqSj5E=;
	b=xbsZ8MZB2zXMbw9KGT3I7HfzUc6ZPkdfo0OQuz4erpfY0mLp1jxhVckPklSZD1iZTgv1
	 tFt0DLogFklM5ms32LBIE37eX8i7aNikkQvCTNXMgXubfdeKgTC8yVjJH4VGsJjer7Yez
	 Zor6QG20aH+yx+3KVsCm80BMbbAUIgkbHd4Y07ywHzPIBgcDDgulYJosWq9U8CiaU9cD8
	 XtInTb/tR3Kat3rUDj/wpOesq1x4807V4ynXqe5HBa56eiUVy0syK+Mjj2sHFcx5nEhB6
	 y8HZJXDO+D5uhjnEi5cOF4FBp7YeUP2YOsjadB1pkHCwf91rEhkwJb8OQSCsMrh0lWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lv7fnnKl;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF635606A320
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 11:00:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF635606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lv7fnnKl
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B024FC4CBF3;
	Thu, 19 Nov 2026 11:00:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 795B360237;
	Thu, 19 Nov 2026 11:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3B59911BC0F59;
	Thu, 19 Nov 2026 12:00:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795086038; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=SnpBpONi2hKsnLkH7ie4ozWlmqX6tUPpRN0WLEqSj5E=;
	b=lv7fnnKlNhRmPRNuZQwBsRGy8WrJpRjXUO7evkd9bCKQiPZpBCeSDSIZyQcQyHkgES/fJ+
	r4c30IM5fhM6GOEgn2kwqGa7rXwhovo7vatxxDxkuIH2wdpeRRwxutFDlV8PvVWHFKnD4D
	/tTR39B+cKXtWgK7ok6n+SZ8nYO/VNxcIMq5o1HoCCiKHNpCuK7Bm9KwAHEyZTWwvRezj2
	OKdo4Z3ekluank4NWvhfocTeCSxUXdCQNRDwdEhp3zgmXNMQtFHnUntxV8lpFEuAhPtd/C
	vtsWiT3uc8qjZHzPd2wErz3HxaXBVj1q2rt2kzCIBVnkVWKBK77yS+x8SCB+ow==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v10 2/5] bus: simple-pm-bus: Remove the remove() function
Date: Thu, 19 Nov 2026 12:00:08 +0100
Message-ID: <20261119110014.582363-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119110014.582363-1-herve.codina@bootlin.com>
References: <20261119110014.582363-1-herve.codina@bootlin.com>
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

