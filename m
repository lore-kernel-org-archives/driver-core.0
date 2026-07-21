Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB049431A26
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616911; cv=none; b=G4xepV47q17taVfPqclzZhglExBf68zZ6Or5qPWN9II3NwyIxJCbzyQXmQWI7bzRK/3OcyXLvA2o88WN42aVq+mFjzCDascTw/NIh2uJrKVk5ZXGSwJNQfkwxKUEFuJVS2qrqWJhtRhFneD8/3OgApIRImF5q6j6utiXsCg4zXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616911; c=relaxed/simple;
	bh=IlZ/0IeKP4mmnn6s8JCPzwMroH/vaSwiA2UpQ8RQglw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GPJ8NChR8OR++CRVN/tQBTwnRQOjg4y0iKYRL60KsRMWkDkNB/j8EZHjE4eWIn1S0VW3QYfsUfx9aqn8brk24xhcqjWthABHZtlybquRgwjvFIUIO+PHgljdLtF/PNcy9sB2afunHywguG09SITPp/bNT/lMbI0Kt6oQIex3pvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nTsRQNbO; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nTsRQNbO"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caea3f742bso130797025ad.0
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616909; x=1785221709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAcFKcy+EqEALwPe3iCzQnqqeeFK6XarTVIxswfGgCg=;
        b=nTsRQNbOxU049pzvy4MIeyUm2+hcx+1K7ltnyrGti3L8hz7j6i7Im+AEUPadxrOIjZ
         jS+cA5rsfozP1nep24gjfxajTAhqjkahWs9pFT9XRSyBAq+PK3RiyIIGHs7Mn6aDXeYD
         w2PI3IlMSlSrMPY5VReZm/DL9U66NVAfCxj68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616909; x=1785221709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sAcFKcy+EqEALwPe3iCzQnqqeeFK6XarTVIxswfGgCg=;
        b=QnaE+fq/Geh9yYtbKTDYmJBOzVDdOzsh7wzOQcAdGR6w+Vu89uJ2O8NyhT4Rvkcj21
         o4tQPrg3DmdrwXIV1YYszKdMZrP4GMilXqcyBs+xdX9kU0fdlrrSWQEhCu65yYc7Msjl
         y8fZ4WOZV4T5s+FDNsrNo8blHHrlFjavfp5MwxiwIKvk5PxSu/gFn0ZaOGfdjosBzwfM
         zlpIK9NNIDU0O8m3b4AWG33jredHpI2QJvRNf6K8w66B0/0vpX6kxibDYX24taNSgTmn
         6+029fL0fdTg5hP/zDT+YUVmhuXvnLlNr19ucExiCrS27PndQTJBKCh74dR4TKXOUfLd
         FwZg==
X-Forwarded-Encrypted: i=1; AHgh+RqUUcOhI9VPGodf1m2PSQntv+zeGRrQPSuHQTF/U5zddr7f2iWuc0jAG1sbqVsphSjTBXgvN4QJepQp2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNobZvpdLvQhuXKoEwjP/pGmFIKv7qQEryOmLmB1pbK6ofjgcX
	LIDYqnwMm1nV167h1rFnyn2AVMs+0r+IK7z4HZaW2wURGdPsvMnWGicnagHlGJDLkg==
X-Gm-Gg: AR+sD12vNsHV+4J+vn9TN+TJrSFfhDXQ0NPeyu5BV1sPvcAOELOVQ7WUFrc8oR0Diny
	7B6SxKdeQqFWAaf4Fp5XLg3bjoKS6tcBSX6Zl3c/Lw28IPwfK11UwM0wy6LXXml6k3g/EMXsccJ
	PpMYmQbVojYlEvQ4omkI88QkpWRXvblmOZqHiTJD7ig1kSOyzMHUdAs8ELZFoaaLu5lZ0HXmVjK
	dtR81r7PwpK2e90Vyq5b9MO0FHIDIAWcO0T6HbzwmZ6MB083yw+Deyi4qADXE2DXAGAM8QhkSCj
	XttHSjhFGEZMdnW9D5R1n/qmLjSHuCR9+Sb7oeE0zus7WoHDRZCYeCKnIeeONcdzjxvH/IXqTQb
	cz8r0UnLpRAIoC0YYc61+flx3HfXgRWOJdPUY4ca+MhZXC0/41S1IXr1ut0MIYdQ/TRPXUTN1HU
	CpfKT5NAQSGJ77xJU1tYbxCpUycsze7yKPV0W/4YLja6q6VtpwYW5io+LRCyk=
X-Received: by 2002:a17:903:18d:b0:2ca:619f:9733 with SMTP id d9443c01a7336-2cf348f9f5amr194323965ad.17.1784616909129;
        Mon, 20 Jul 2026 23:55:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:08 -0700 (PDT)
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
Subject: [PATCH v6 07/16] usb: core: Move struct usb_port and related APIs to port.h
Date: Tue, 21 Jul 2026 14:54:02 +0800
Message-ID: <20260721065413.2306137-8-wenst@chromium.org>
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

|struct usb_port| and its matching container_of() macro should live in
its own port.h, matching the split we have for .c files.

Move them as described. Also move usb_port_is_power_on(), since in the
next change its |struct usb_hub *| parameter will be changed to
|struct usb_port *|, and becomes a non-static function that only
references |struct usb_port|.

port.h is only included from hub.h, as a subsequent patch will directly
use fields from |struct usb_port| in a static inline helper in hub.h.
The USB internal headers don't have header guards to help with this.

Also drop 'extern' from the header declaration of usb_port_is_power_on().
This is not needed in modern C.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- Dropped 'extern' (Andy)

Changes since v3:
- New patch (Andy)
---
 drivers/usb/core/hub.c  | 16 ----------
 drivers/usb/core/hub.h  | 48 ++---------------------------
 drivers/usb/core/port.c | 16 ++++++++++
 drivers/usb/core/port.h | 68 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+), 62 deletions(-)
 create mode 100644 drivers/usb/core/port.h

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 8f8624a0d36a..a6c4e4c0368a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3240,22 +3240,6 @@ static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
 	return port_dev->ignore_event;
 }
 
-/* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
-{
-	int ret = 0;
-
-	if (hub_is_superspeed(hub->hdev)) {
-		if (portstatus & USB_SS_PORT_STAT_POWER)
-			ret = 1;
-	} else {
-		if (portstatus & USB_PORT_STAT_POWER)
-			ret = 1;
-	}
-
-	return ret;
-}
-
 static void usb_lock_port(struct usb_port *port_dev)
 		__acquires(&port_dev->status_lock)
 {
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..de524c6da9fc 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -15,7 +15,9 @@
 #include <linux/usb/ch11.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/typec.h>
+
 #include "usb.h"
+#include "port.h"
 
 struct usb_hub {
 	struct device		*intfdev;	/* the "interface" device */
@@ -78,51 +80,6 @@ struct usb_hub {
 	struct list_head        onboard_devs;
 };
 
-/**
- * struct usb port - kernel's representation of a usb port
- * @child: usb device attached to the port
- * @dev: generic device interface
- * @port_owner: port's owner
- * @peer: related usb2 and usb3 ports (share the same connector)
- * @connector: USB Type-C connector
- * @req: default pm qos request for hubs without port power control
- * @connect_type: port's connect type
- * @state: device state of the usb device attached to the port
- * @state_kn: kernfs_node of the sysfs attribute that accesses @state
- * @location: opaque representation of platform connector location
- * @status_lock: synchronize port_event() vs usb_port_{suspend|resume}
- * @portnum: port index num based one
- * @is_superspeed cache super-speed status
- * @usb3_lpm_u1_permit: whether USB3 U1 LPM is permitted.
- * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
- * @early_stop: whether port initialization will be stopped earlier.
- * @ignore_event: whether events of the port are ignored.
- */
-struct usb_port {
-	struct usb_device *child;
-	struct device dev;
-	struct usb_dev_state *port_owner;
-	struct usb_port *peer;
-	struct typec_connector *connector;
-	struct dev_pm_qos_request *req;
-	enum usb_port_connect_type connect_type;
-	enum usb_device_state state;
-	struct kernfs_node *state_kn;
-	usb_port_location_t location;
-	struct mutex status_lock;
-	u32 over_current_count;
-	u8 portnum;
-	u32 quirks;
-	unsigned int early_stop:1;
-	unsigned int ignore_event:1;
-	unsigned int is_superspeed:1;
-	unsigned int usb3_lpm_u1_permit:1;
-	unsigned int usb3_lpm_u2_permit:1;
-};
-
-#define to_usb_port(_dev) \
-	container_of(_dev, struct usb_port, dev)
-
 extern int usb_hub_create_port_device(struct usb_hub *hub,
 		int port1);
 extern void usb_hub_remove_port_device(struct usb_hub *hub,
@@ -138,7 +95,6 @@ extern int usb_clear_port_feature(struct usb_device *hdev,
 		int port1, int feature);
 extern int usb_hub_port_status(struct usb_hub *hub, int port1,
 		u16 *status, u16 *change);
-extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
 
 static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 {
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index c0a51d9b06a6..b2e953f137f8 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -22,6 +22,22 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
+/* Check if a port is power on */
+int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+{
+	int ret = 0;
+
+	if (hub_is_superspeed(hub->hdev)) {
+		if (portstatus & USB_SS_PORT_STAT_POWER)
+			ret = 1;
+	} else {
+		if (portstatus & USB_PORT_STAT_POWER)
+			ret = 1;
+	}
+
+	return ret;
+}
+
 static bool usb_port_allow_power_off(struct usb_device *hdev,
 				     struct usb_hub *hub,
 				     struct usb_port *port_dev)
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
new file mode 100644
index 000000000000..00f7500af336
--- /dev/null
+++ b/drivers/usb/core/port.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * usb hub driver head file
+ *
+ * Copyright (C) 1999 Linus Torvalds
+ * Copyright (C) 1999 Johannes Erdfelt
+ * Copyright (C) 1999 Gregory P. Smith
+ * Copyright (C) 2001 Brad Hards (bhards@bigpond.net.au)
+ * Copyright (C) 2012 Intel Corp (tianyu.lan@intel.com)
+ *
+ *  move struct usb_port to this file.
+ */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/mutex_types.h>
+#include <linux/usb.h>
+
+#include <uapi/linux/usb/ch9.h>
+
+/**
+ * struct usb port - kernel's representation of a usb port
+ * @child: usb device attached to the port
+ * @dev: generic device interface
+ * @port_owner: port's owner
+ * @peer: related usb2 and usb3 ports (share the same connector)
+ * @connector: USB Type-C connector
+ * @req: default pm qos request for hubs without port power control
+ * @connect_type: port's connect type
+ * @state: device state of the usb device attached to the port
+ * @state_kn: kernfs_node of the sysfs attribute that accesses @state
+ * @location: opaque representation of platform connector location
+ * @status_lock: synchronize port_event() vs usb_port_{suspend|resume}
+ * @portnum: port index num based one
+ * @is_superspeed cache super-speed status
+ * @usb3_lpm_u1_permit: whether USB3 U1 LPM is permitted.
+ * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
+ * @early_stop: whether port initialization will be stopped earlier.
+ * @ignore_event: whether events of the port are ignored.
+ */
+struct usb_port {
+	struct usb_device *child;
+	struct device dev;
+	struct usb_dev_state *port_owner;
+	struct usb_port *peer;
+	struct typec_connector *connector;
+	struct dev_pm_qos_request *req;
+	enum usb_port_connect_type connect_type;
+	enum usb_device_state state;
+	struct kernfs_node *state_kn;
+	usb_port_location_t location;
+	struct mutex status_lock;
+	u32 over_current_count;
+	u8 portnum;
+	u32 quirks;
+	unsigned int early_stop:1;
+	unsigned int ignore_event:1;
+	unsigned int is_superspeed:1;
+	unsigned int usb3_lpm_u1_permit:1;
+	unsigned int usb3_lpm_u2_permit:1;
+};
+
+#define to_usb_port(_dev) \
+	container_of(_dev, struct usb_port, dev)
+
+struct usb_hub;
+
+int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
-- 
2.55.0.229.g6434b31f56-goog

