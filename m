Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D03BBFD1
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080907; cv=none; b=ug8r9AuGfGVIywvWmXm+ZCEIRcwK2RkXaXXnbrQVLhRZO3YKjBp0JVS1uv9oPvUxkzUGN7m6/OZGXwV30USSk73QfpwqvuJL7Gn0dxBb8dTPrEcQLrHpMIeYhPcbS60joI4whKH/ywMFeJWMHt0nTb4hCbnw6xct3olKftsBLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080907; c=relaxed/simple;
	bh=o+U0+uxpLyICxN5cZBssxYj1c0o7a0rN3El8ggjYj7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Feeh5T7iZ6UxHhXze13dba3rv7JdBrG0THjoqXjnBngoJzPA9eK+kKJ+WoFAaaT8Woo5t3DsTpMMYv8M0ajuMjmhkVq07XH+qTcChhxEzLG9aEbQsgyYVVekNdnH7zWcudNBxYmjuDL8QibqkVizqWQXlzMmDr+gQu7jH03YtXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LbkbNscK; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LbkbNscK"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2c0b944f6edso66409185ad.2
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080906; x=1781685706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxbS167RBZec05UVkxkxFcWU26xTYm3kEJbXHA80P7M=;
        b=LbkbNscKj37d890sPcQV68yNouSepzoTLI9DLgPwP3JeEXrDFzJLlAah/dluKMAuN+
         GypNBctCMZUNejZyJQb0RohUj3Pku7LR7Fn8Bi7VoSqPZtjpa/Osbms78YJwBRlgraxX
         AAOjgs7RdmJXzr2CgiZA3Jn6A0ajkbgYwyMNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080906; x=1781685706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxbS167RBZec05UVkxkxFcWU26xTYm3kEJbXHA80P7M=;
        b=qIaGGSWwj2nsJ7pIaVoZXij6oLBDuX8k318WC1UBc7vtxbgGvsk1ojtZC9hBhLy/qY
         EAhd/7cmcBnzzVrmZHAsuxWTAA/6dR0etKVy9nn+T7t05BObW2ApzdnME74bi2aNJxxS
         BMw8BFDUARbkm9CtdSN0yQ+BWYtSorMyges+vjs3X46pnGc40Mh4UYoZpLTEtwJ6wHtb
         0bDcSNI3u2v9UkiflxMDMPPmc4Vu9hAfBCvrWieQYod4VCoq4opPmGOS8b/EyjUzntIm
         EwhoGOnyfP128iFDXNo7hdLaI9Iy///avazHVyMsCp4QVbZf+2mou5EMrHnytnQx6vca
         pWbA==
X-Forwarded-Encrypted: i=1; AFNElJ/jvLYsRl67DXIhSizg/ljSsIKCEdpZXq71N5+yMUEJa1xKhv0gqWrxuSj9RQlFmfSnoTyOVKwroYeQjw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNtPZGu17oUSidjTNMSE0B3ORQz46hC8V/obs5yoCRRQFQMiNA
	HD0/wxEQ0v90X1zXFUycmIvjhJ/iTfo56S3NsEqu7vSDPpQf1GRUsyB8t4q3hBH4YA==
X-Gm-Gg: Acq92OGmGKwIbrlHunvKJHsDNXWN0kX2dPmezuL+/hL2+ZAFKX6Vhx5D6tbcl7qMMcH
	e4efTX0Pd/pgOZSD5gy2PyPbiad6lqvykHglF4+n9QMz1DuRltcdRoHU05rpXhuXdcoy12/OjG2
	zgSmz60bvAsbvRDOc5B+r51Em/G3Z7tICcZojGnv5WN66lRP+79CQeA9hAuTUmdXnclBE5sYltY
	QQNxw6B40CYBcqehhK5HuCGVAHfaKFsLExaVHiQ+9NXYLV/AV2MOfYjvNkrMUH79aWo4ohqQ3ZG
	OKBvALsaxA+TX31Nhbv8c6joFn3egzFXdbTgPwhg6qjp5gWnHyq71Gq6ZdIeqFaeCKdEX4RFZ+X
	mrCKJePxutkSwOlG6lCDnznhOyi57FzMJYDuRait3sAjspRi1Hei6GaGNMmyeMW2+Lg6x0oz/Ay
	ZrNp6Bb9vMfxGN5iPCywQzmsO1v01q5K4RJZFR8afCD6UptFHnGs14Ke3EKYFcAzvmYpr12zRbO
	s5ARnRk4HwSxzTLrA==
X-Received: by 2002:a17:903:f8b:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1e836dfe1mr288494565ad.37.1781080905536;
        Wed, 10 Jun 2026 01:41:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:45 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 06/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Wed, 10 Jun 2026 16:40:40 +0800
Message-ID: <20260610084053.2059858-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c  | 11 ++++++-----
 drivers/usb/core/hub.h  |  2 +-
 drivers/usb/core/port.c |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 985551d013b2..362a10f7eddb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3240,11 +3240,11 @@ static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
 }
 
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
@@ -3306,7 +3306,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3748,12 +3748,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5449,7 +5450,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..b65d9192379d 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -138,7 +138,7 @@ extern int usb_clear_port_feature(struct usb_device *hdev,
 		int port1, int feature);
 extern int usb_hub_port_status(struct usb_hub *hub, int port1,
 		u16 *status, u16 *change);
-extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+extern int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
 
 static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 {
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 1846eb1206a4..d9d3e2bb8f25 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -97,7 +97,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
-- 
2.54.0.1099.g489fc7bff1-goog

