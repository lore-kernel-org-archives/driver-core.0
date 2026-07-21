Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5834742F712
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616916; cv=none; b=eiCdkHuzuXYWckmIlhAbW70xQSao0SGbO2JH5yQF/tB+j73ztFBrdXXy8fz2ZccJrZfTOHaWGUZAueibTu8E24Gp3LrNYQ6naBQnLdBiHT9jACE/zJBvpQ8/op6FTTo3klWPGFNzU29Pv7stmWus70tUgSyXdWkuolr3FUASR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616916; c=relaxed/simple;
	bh=uMqpD/0Y+buNT85mCET4vOpwigIs8u3oS1rlx2XlGCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+t8Qvn6oUFJPdPJZz5rBhEUAahPEB1kGNQ+D66Gs1woz68Y2FEejKasSPKdPX0MHQGvZCkGOjZewEowcp7FXHphYLyAdbO18XHE8Y99TALv9tEUA+A4QJroT4FXz8NWAQd6zZ4t6II7UG1x9b+YF4ecNfb+mteW0hKboN0F3L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ebnRPEk8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ebnRPEk8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceed7018c8so49940855ad.1
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616914; x=1785221714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=ebnRPEk8QF33Eefx55yCycBmV/IoN6wjbVBGL522Lckgaly5GSt0/GepHR3bunBl9G
         ZEYbBftV9/n0nv4hCDvaRMXXeko5ppjpRzxaROZ6LM7i69+c9USQ9Au8J6Qb0INE9nNf
         QZFiQadH4LYhY4/ymhYIrNrABaxAK6lG3jOnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616914; x=1785221714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=DfC04tExLBnixrJ5V2Qd6NZ8MfthO0X9FDnoLEhgnoZ13NRQPjnj9T1yVqsZLms0TI
         3HH06MEmhFmpvoR3dofqLQr4Yf2FnhS6uPXaIpyeX6jdab7OP3mumZFw4w/PZDjVbsG5
         YyhN/RB0EIPm0VunPhr35T96PpeeOECuH2yTi8L0l0CKlosp5aEjchwq3GV0oLtxQ0rw
         aLNowGcVSi+kDlcmNgbGvUdXIB9/7OfqpTyuI4p0065B6+F+p6MX6GEi7SfhAc3EDAwH
         6HkoFu4zWhEAs4pQT0mWG6APMYVzWbdn0mZj67ZX+C3LFNOteCX64ZuyjelWiUhqs+75
         3k0A==
X-Forwarded-Encrypted: i=1; AHgh+RrR4Yp1Ojoh8+SD5Im6lo4v9CXZ36kJHE7TdiofBylQ84MEE1kBKstGCggo927rmUxc0QIWXdIuYgBPOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1H5xaa5qDr1sigxjVWMEZaP18HTI1WTeUzgALrz8jHFjHI6yd
	0DfdN1L4xEOcWyRzWXjKmgH0m2odp2CqmFvLG5coCn5lqbR1NBzo4Ws+Afi1m8F9lA==
X-Gm-Gg: AR+sD12ojQ/6srnA0TUjRqHXXJojgf9tjRcWZdPlKJ8BNksBM/ovGExzMH5Luiwabai
	j9S4sJ6HDQjvZGi2lhHbT0nWgknG8Wub514L1IYy3ljUEB/oOVqVYnWyWHimqy0z2ue0Dm1EpcP
	xpW4Ebtwv98DGh9ZjCE2x02uWTtvB0XwwRbPvVyyWO/B142khlPe+MGDqtMmRoQSqK0JlLI7aww
	3QQ6xd643UXRe0h21PaySYEpPfEdgEqSpe2XVTt9s8hhwN81D5BWD8paGoT/8pPjnOyli1Vloyp
	nADWfr0j3rmqfvgAHQpwveJxe6NMVz40HbEE4D5+JbhoY9KXQcFI7T4uta8vsQUumZEf/o4leNb
	FGIF/FuPciEFQFa0/FrZAEVLejndcaYeYbXMVx4B+RSJsWr4voPA1HUwhPEZ/QTeH6rU0aQCth6
	IZ1moYP/NkIjPoF3YBIUi6hEyEdg2/+vI1xgaACgwv0UcHUGOoGWjDcoTD+kMaX6rILM0N7w==
X-Received: by 2002:a17:903:2383:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2cf34a18cefmr188566915ad.42.1784616913792;
        Mon, 20 Jul 2026 23:55:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:13 -0700 (PDT)
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
Subject: [PATCH v6 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Tue, 21 Jul 2026 14:54:03 +0800
Message-ID: <20260721065413.2306137-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
index a6c4e4c0368a..6671b5e45191 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3291,7 +3291,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3733,12 +3733,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5434,7 +5435,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b2e953f137f8..8d686d43e996 100644
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
index 00f7500af336..2f4349b3ce6b 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.229.g6434b31f56-goog

