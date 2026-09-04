Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7AB423A9B
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511448; cv=none; b=TCFN49wFb/NYk6/mYAPMPydoMNna+vtBtu7JNHZbWkDdoeBnrJ8FZXsMai1KSrVbhMW/sVKrCDYjTBxDHDg8zNk1tLOtc9qh9md5Fj9uJkEJf4oW5wNfu00I/8jrPKP10Z6q9J9ggVyq5DW7XbDpufm8Dc3sNKuNoPJztEpRD+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511448; c=relaxed/simple;
	bh=Eylu6JRP3t0c2eW94X4vuzvx/0pFZPIhGAAA4G//4lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WycPN0VHn5DaHbr7Wk61XjTujHQCv0f2qwFQDpQkKkB8EQcl1eD3Z8t4nHgQvk8+qp59QmQSaTK/bPIN3D8KWurMus28LqfsCEieo9xu0qmLJXM54lyKR4YtRw9IHSBv48gti/sEOXmPFMdr0m0IRAxU8vk4BBQ9DF+fT0gjwlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FOtQb9gw; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FOtQb9gw"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so932344a12.2
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511442; x=1789116242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=;
        b=FOtQb9gwoPIQ1I2Yh5Mq8ali4s/L/qbQTLqL55dbBvwCc7dXFgktXPTfeoGbJzdhgm
         6QSXIDjCyj2GPaPclnx2VXrPWlLrLFmDKfILtKGYtIuqSR39j0j3CPQCySlK42eQXqCJ
         QEXR5BixqtfvwjHCpIgXt6WtMUl4roOjRYNXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511442; x=1789116242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=;
        b=iwwjma9D077uengZyJIKeoFWMTVnF0RcC4u6c7YshQdq6pro9ZCMrGzJUvVLFikZwL
         3Rj/ijolLrJMrm6RasatN7K4Mib1uyVLSRFJhSJizMMShogBtjfEcMzbJq81ah0yDEfU
         beiRDJigb01SFiKfLldn1Qi3uZUKvuHOlhGoWaEaHR1ZyuXWKlI+gIV6XV3QwWAu+P1a
         W0LXsl2cDowB/UFB46Gzd7KMTwwpCrzdl5y1Ta/w2yIhjU/v4eQ8SMbNKKMs+Qdeec7I
         2eNQ654Es/51U46u9ETAGhOE6u4Qz+fuBC1rNQLWP08eU0GdqnjSH2f+UKzREp/1WRzT
         d9MQ==
X-Forwarded-Encrypted: i=1; AKwUvBwioUqnr/cS1oKY7zxeZYxExSMiS/f4F/M9kKhjTzfc+qvci0SSWlifD73to+FY29Fddbkv2ocKSIojCw==@lists.linux.dev
X-Gm-Message-State: AFuF++k5ZsUfcWjKwSaDM6KQdhguUdqyXeH4d/i3UKNy1vd3KgXsj+TD
	kGBFj9lYF1DrrIY6nxIAjsvhldpcpVUtqG03xgM7N1w1m19PH9tMLyKS576bkKVlzQ==
X-Gm-Gg: AYBFou0u9TGsG3da0WuUDGCEG6YcVQPl3MHIAKLBJwmfZduvEbC4MUnzW7pYplgN2HR
	Jod8tUMVkwgLaOR/gqrP01AV+ANbunZj3k11NrmtGRI8xejwwgX0GUOWrONgPzMgMzl10JtH5qP
	TizWRfirmQ2pMCGckBZOdxjA60YSHgEU94UZKIR2D6/jk8NckesmeUBuv1k3OFmYFIwW57mEBJ4
	8zNvzhd4gdNLENv0u6kHgJNpT1XBCeUUz9LDMudUvexi21S6RT1FcOpNvf8c4wHKyPlWXR3a20E
	odrFgBZyRVoQj2xtlcIkpcl7uqBs7Kvj/uClXJPj/7rrj5IyJ8r3YEfBY+7IaLhAv94xncn9do+
	7AHxy7AdqkZfJ42GPHCQ5TFuoh7DGQvIQcSacb/3vPE5qrsID2VTIhDPV2vsaijlGDdLLyLI1bC
	SfdQ9RgUdFjEiFan8Zj5ujnmjwEaL33PRZCDBHoTYfxMr0feB3EUdVdksThdLDPB19PjLIh44wp
	3r/0hBoqOfHHkLew2T/K0Fk6twGOo+eIoOxj/R0VOVr
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr5803481a91.13.1788511442063;
        Fri, 04 Sep 2026 01:44:02 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:01 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Fri,  4 Sep 2026 16:41:47 +0800
Message-ID: <20260904084158.1341550-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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
index 7f58d753d77a..1b891088a653 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3294,7 +3294,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3736,12 +3736,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5437,7 +5438,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
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
2.55.0.979.g7e5102b832-goog

