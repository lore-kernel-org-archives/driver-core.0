Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65343EE1EF
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882687; cv=none; b=ELe79nYKWPOZUVfHMOkLKmDB4QE3WmP/IKZ0okq2pX5D57k8jngrZXkiKhlhoMxnkOD46g/c6/Y09ir9q8Be9sgseZECoWOZKkYImonG6AURdSUMXhpp1AtlnW5SZKMebGZO0cnxf0Y1X2rw5Pqt0sYYWVOrvp8KFPv2265FbyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882687; c=relaxed/simple;
	bh=uMqpD/0Y+buNT85mCET4vOpwigIs8u3oS1rlx2XlGCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=txFA7aa4iyWRnL15uKOS/s+N/y0AAhxqLf+Cd23YLaGKcSKN25urgZ0jb3PDaAVZZnIoeqaEvJmKL17qFSIJhy9HJu/hSILrV0ZhJZMGmemANsDnLQPRY146EpgWEBeO1mJQLC5cegryQLbZbR19maBls/Us9E0mHBqQDc7frb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l/Y3bGd6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l/Y3bGd6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so94643a91.1
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882685; x=1785487485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=l/Y3bGd6OQ3/cusND/4dTtzKAilbD5M6i8ZwHow6sHTIyDyQEQ/xMq9hYzp1wGM+w4
         7FZd73TWm6e54ZkRkc6LhvBwsj+nHmDfPV+FEsAMm+IBHizuwj1nsAPskhA5A3jEjpwI
         HEypxCbaw07EWgMt0rmDLiUPwbptjp7whuGt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882685; x=1785487485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=celahkVG4wtOTqgA3RidkTPNUPWSNoO4GmZMdZHpq7PwKOspr8Zf4oqp/kAVg0blrt
         RQ2E/4rAn+7B0TJU9giOaRj56Mlm4OocdzTAzsMlVSsdKjHKmn/2Sn1AZdPy4/2Hb4Ob
         TW48cUV/yy9bP/SScNZ/OCsTEuVnlWA8Xs6Rkv6cXl1INiXEkpBcSbqH4RZZ+OIutR0U
         cVBMlP9qzXKnsQPkMxaMwui1+B4Z5O8+jXqpFOjd27SA6IIixLkRojNll8ERGQLO33ES
         oP7pxDcW2MPNcr03LRCX7lWUxy/C3O5cJOPbRsaSDKI4iQQuAqpPOCD5Zla94RHisQZ/
         x21Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFtUVaEHjNYdmcb5rntf2rfoBkCZthMwub6Lasjy+IrZzUD4xVrYn/YtdTL76tU7XOyCP5fir+zORApQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzD60+LA56xQCTHrGZ0zXPPp9SFzulcHhJ3Ui3kXaJlqqfoq94E
	e1UyuNFzwVoV2B1DGosCOTJfUKygaaZT++OJx5VypRqvFre2hz6PMkWJhH+FatRgbA==
X-Gm-Gg: AR+sD11UAMC1KxvemNDnmD8HyudwbrlG0c/in93fYBoYuWkFaiI5clcaxf1Ec3UCVI2
	EYYNz6yjDixSY5fjx74LOUliJOKzzDHL93D96mkEnA7/tUWsXfGwOwkvZsSnvJo7Z2Ctz09E1fD
	2iNSsEz/UiUBT4u11V4NewbCNVhFzRE5gRZITtBSmC+u018PrVSpD+CZO/VwFdxDMb7aHgd9Tw8
	KxdY3Y1YpMkfGDAE+nNcpHckxd5HWPyH63sx9cMXwyU0NqTOwjiCrYM8Kd2qov5J3ivJnd2FS8r
	FCzhQwtPAqOaI2OROmoq+Pi7U8JSv58tQCobEnd8me29aRusCkyYavWGUUThBRvhYln6Ry2HNIg
	wDOXGnXIyHt5BhiHV7qF3nNA0Z6d8O8xppc4ti/R6MOwxqsipsiWF1FvLLdo6a17dD+Lm1F5zlM
	u3kDqqgkkkHeBYPPoZwi0r4sNmkNMv6wKDVPqlUhnS/SSmATWuq3jDpSeNpn8=
X-Received: by 2002:a17:90b:1c01:b0:38e:6ba9:5203 with SMTP id 98e67ed59e1d1-38ec658e6bcmr6608480a91.22.1784882685067;
        Fri, 24 Jul 2026 01:44:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:44 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Fri, 24 Jul 2026 16:43:17 +0800
Message-ID: <20260724084328.3943997-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
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

