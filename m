Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4527346EC84
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545561; cv=none; b=MkWR5JsajBBtt4pRHk0t7+ONnzsrYIeJoQmL1mSJWbTvCXKjIsCbEGAWZV7ieIiHvU5PRfnzAwby7nrb2RhSeRdpEd/YugMGnjPru+AEMN97UraG9O67vGEcEf6JDHdsaATWr9jBd6rkkCVPNUq9gf5ETUqjIQjwfeITvWM55SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545561; c=relaxed/simple;
	bh=tVWWoCrAiAOBE1no/RqFInBi9AakwZo+dXi9+HlMNas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tw8hQ9POn5syQ5OtpuKxjkBxpvxRyvApD4fjmOMO+4QpGbfKj1DteFpu+DZfvvAQcE/QMO8oHZsK3Z2uRQ1rqpgMQEnpVwdkDjR5g022zUb9767W4I6hFpgFYB+kYhZR6WHtTOyTs+sGAIZH9IiNQI8HTqLodwf21HY45P5p6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gLPKWgeV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gLPKWgeV"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso595432a91.1
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545539; x=1790150339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxcOLcYtzXeNvmAXwxnBSPIznA4IuiBXVh28WxVeHIw=;
        b=gLPKWgeVjBALq3X+qMHJkWQ0OcjUgE9xHrfNVwhSIuljH+dwBIcNegeicTzYT0SZIc
         XLbiHbDthGF4idaSl7xTf0GhnAb+vm8FCbYxRCIVRsGQaPGhLYDKtWnFWlptJGe1mRxC
         1QSTVLLytCJDJX95k3NXk325fsKPSM256uEQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545539; x=1790150339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxcOLcYtzXeNvmAXwxnBSPIznA4IuiBXVh28WxVeHIw=;
        b=2KoyCJokbX7vtfs7trKjw2S1+7S3A6o9gUOmrodY59oxh1T3OPOga9GDy5MlF8Z7tX
         GjKfTQjj+x6rTzjy/iqDts9BdRFgPhEFq1i4uCqQ8vOfJv6JswmPjbvDNZK21fsoJc6P
         UDyHEL37/rLNxkB4Z777in2YeUzrJ+iOcgu79/okvE00slbUnXs0aV8yoEe0kIS3MBaP
         sqGCzdTT+28NRuxqBTxbALgntt5t5g0VYsssi+OvxuTgg+pnjNT0iDgO+AeYG6A5utID
         GQaFCV3bRDeRTxH5OU8tBiCCRKka4olTxj3gqmnqjeHKlzwEX6a0yc9dXFNKxZQqGw7B
         HscQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpLZxmZMug5QGYNoeNdmS7Oh0uZxcMQMPQRcfRPzWt4VjlBsv4dHxPNfGx7TwfqWMPEnzZmdk4L6gl2g==@lists.linux.dev
X-Gm-Message-State: AFuF++n2bpQZJBWzM+hIVQ8ObeB2lNDwHB+xJJrZlwfnwprEaWgDT4wA
	PmUR5z6CwHrZCHWlJ6ljIO7M7Sss09COuHo55Iox+6x9FAY8+aoUN9CN/Rf5k+D1BA==
X-Gm-Gg: AYBFou22EF9Y506cXEusBocCm/VwnzMBzvQVlv70a14LwIuF90CANePdEhduG63gaJe
	GKEnqT02Y+OOe+C+2tz3BfxUWxKMO3ZgTwXkk9cM9G80mtUSOGNygVkNrmznEdmWZxXC8wE4xwV
	+vHjfHYCOKHOgSlLwm25T8Yu1AkGlMK4heznon7EdeSSequ+ZCpORMrZRrGCgtMmEO91esvPGPz
	I1VA4N5WjJ4xr5cKy7WcfBK1g9A54wV2K0qmsAQxFspKZ0SHhXGPBoN51amEz1QY6ZwV6YQY8sG
	UZGuBl99tVns4WF/r5kZZNtdp7xKRFyMinmIPhZboyKxof+BBu6ngV4CPxR01imEKrr7vCM+X8U
	tAi89ra9nCGV6JLIiKq5rw6tYGgP96+5XLKqcfrkH7iCpDQRNNLhGps4EBUFg4TYlZo26EmCeCx
	eZURvgE5KC48opzVwOIUV9rvwywzlkC1uZFpsA1tO5YpeUYHwOm/WLOwIu+N3HXW6ror0mkBgvP
	/lqCqdppRSbIKjrFbSXY7s6T9OGtPA/Ra1Tdx7Z+9o/FSJeJcAZNcJ0tA==
X-Received: by 2002:a17:90b:586f:b0:39e:28dc:3682 with SMTP id 98e67ed59e1d1-39e28dc380fmr622870a91.21.1789545539469;
        Wed, 16 Sep 2026 00:58:59 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:58 -0700 (PDT)
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
Subject: [PATCH v9 07/15] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Wed, 16 Sep 2026 15:57:33 +0800
Message-ID: <20260916075745.3549953-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
Changes since v8:
- Adapted to |struct usb_port| and  usb_port_is_power_on() moving back to
  hub.[ch]
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 11 ++++++-----
 drivers/usb/core/hub.h  |  2 +-
 drivers/usb/core/port.c |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 707eeee198b0..1a98ccfe2664 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3249,11 +3249,11 @@ static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
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
@@ -3315,7 +3315,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3757,12 +3757,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5458,7 +5459,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
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
index c0a51d9b06a6..67ae2bfd3e93 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -98,7 +98,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
-- 
2.55.0.1032.g73a4cd73de-goog

