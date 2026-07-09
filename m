Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4669A408035
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 09:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591101; cv=none; b=a/enQZXgYa9zVYJZleZH2MoAu/a9r3Liy3XLaOdPOL69hiG3gGJGpghAl+yO2b5akVvXx/J2rB/XhnR7FdU/0nPq7A4p+1dCYWErbROhVEAj5kdP6MIj7VT9G4wVEz5Va/gbebNO8MAEIlbRFftnr8rUhbLEm8V/G9Ou6iUYlUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591101; c=relaxed/simple;
	bh=o5T0PAKC4bhdWYNkYeRDccEnX6iTBQ7LIFU0ggYfB28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=friOHKWZV9wY6ls66PlXjjcIfv0FNdYXis5PxF9mj79Gn44Zh8uxxGRjAyO9LLu+1sFO1RrZ0U4Do03drbldRCjm3orOa2D81aDHSxAgg2kwFgciHoB/9u/HUNW4ozUL0Z9nhbMUA7lncnab27aM3F7mKEvs8Orjq1i/sZGVBOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J7BdwG9w; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J7BdwG9w"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cad4170e8eso8244465ad.3
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591093; x=1784195893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/jD944UIyuOWk9l7jvwFyLAi8etvWVpl+Q1R2YAPVM=;
        b=J7BdwG9wCfYDWM9lggiSFbpMjpSRonf0WyRptXZOpYoJhEeJ5zNa0NgdIsfzRkqzaK
         1AGYpbIw6fPE1Yb6Odh1zkUtoOZ2CG6GTP81fIgwm8Wx47oGW2z3du0t7wcuoSkcefJS
         FvTMZwJotkP1t6far1NF4o/ZA/wp3K4vqT/BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591093; x=1784195893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J/jD944UIyuOWk9l7jvwFyLAi8etvWVpl+Q1R2YAPVM=;
        b=WSpNG/LadVIDimCFxMeWRlgTw+hOqXKFhi/weYUne1gsJk0Uxv4Cw1cfkAlTLmUNFO
         D9izqnTI0npPqBQCdDaMXN1tn3iYo/e5eJ+o9GHWlsViRxrxn9v6vQyqrKFfa5aNwrr8
         eR9+CS3aO/ISgouT9xhIbJvZm9M2DKNrmpnxQUoNaeGmdj7ar4nGIoYkPYYRJX1WzEnW
         ave2TKQxE7ElzqRKQ+fo5FXkazZEFPfa6JbgbW3SvD4Bey+CviYIaHLU2gjV1kDh7zpe
         zivzwBQGBSaY1TmhzyCMZrTwg2YQIVrsNxf+dvdlzfN49Ze+ur3bIhgKNkWNy9ShTIUi
         D8PQ==
X-Forwarded-Encrypted: i=1; AHgh+Roq8U8ainIXvShD2svkW+yXrK7+iGD66fE6BpUSUQMlTwhEfk4vYyQ6z6GSOFcXCh2FfBcfSjYhZ1JGxw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0xXnu9rc6rXdem7xGv9ZJDcrta1dchiSPtPMd/igkx1fRs4oa
	0S5YDiowDlqYWAe+QSyc2EX6RRJhE3DSqqPvxUk4MM66NmjaJuuy8YAAyHHYxPym2g==
X-Gm-Gg: AfdE7clurOZh9BHAQVJfCKmo2sS2aNRFDjAyhjqNOJ/baqBa9eiR484b9fTnm4zE7Xr
	a1da4tcxWQZDKeg1bp1056oyEB+pG6pVDtWoXrPel0BYvgz73xXYbVrfvkO1RVcgV++gs6EN8xj
	G8kbHtQNrjsyaBebT451Fol6z/BLrYpAQeeacpR3/O3YwBxnaTcPh9p9um+9xQVOSD7wgbWAl8h
	B3Poyio9HWXQV+0Iewv081P4NbW+8Oaki3X/Za1SHgLVTegNIkux7a4hzmz9RdBkAKYD2b+0HrG
	m+aCci6ZG466koJpMu4CnUX5yQjAHYACfiBdOyXLRFoOIScwjKAVHHb6uEwSi631+hpy89gkold
	C4LVcfvgrDP2mr9QetTCWVfONX7pemaS+9yMZrex0VStiducDedBbhq3JGotc9TfQKx9Tjws2zX
	7FVddvo7gLmG4/7b6zYcWAQxj85UzaKKujl94zXIsnO/XUGBTnjQKev50HGxBnFA/FoHx5tg+Q6
	21OnS3k
X-Received: by 2002:a17:903:644:b0:2ca:cef2:dea8 with SMTP id d9443c01a7336-2ccea46aea4mr43506135ad.35.1783591093550;
        Thu, 09 Jul 2026 02:58:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:13 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 07/14] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Thu,  9 Jul 2026 17:57:12 +0800
Message-ID: <20260709095726.704448-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
it to tell if the hub/port is SuperSpeed or not.

In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
state tracking field in |struct usb_port|. Either structure can be used
to identify whether a port/hub is SuperSpeed or not, as the field in
|struct usb_port| is inherited from the hub:

    port->is_superspeed = hub_is_superspeed(hub)

Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
|struct usb_port*| so a subsequent change can use it.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 7 ++++---
 drivers/usb/core/port.c | 6 +++---
 drivers/usb/core/port.h | 4 +---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 6f576efa37b1..c7fa73673582 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3290,7 +3290,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3732,12 +3732,13 @@ static int wait_for_connected(struct usb_device *udev,
 		struct usb_hub *hub, int port1,
 		u16 *portchange, u16 *portstatus)
 {
+	struct usb_port *port_dev = hub->ports[port1 - 1];
 	int status = 0, delay_ms = 0;
 
 	while (delay_ms < 2000) {
 		if (status || *portstatus & USB_PORT_STAT_CONNECTION)
 			break;
-		if (!usb_port_is_power_on(hub, *portstatus)) {
+		if (!usb_port_is_power_on(port_dev, *portstatus)) {
 			status = -ENODEV;
 			break;
 		}
@@ -5433,7 +5434,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 206b9f9a5807..f3e4d6a31798 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -23,11 +23,11 @@ static int usb_port_block_power_off;
 static const struct attribute_group *port_dev_group[];
 
 /* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 {
 	int ret = 0;
 
-	if (hub_is_superspeed(hub->hdev)) {
+	if (port->is_superspeed) {
 		if (portstatus & USB_SS_PORT_STAT_POWER)
 			ret = 1;
 	} else {
@@ -114,7 +114,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
index f43f6b3b6b1f..22f9973638d7 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+extern int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.795.g602f6c329a-goog

