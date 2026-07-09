Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A507F407CC1
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 09:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591086; cv=none; b=J5aXy5RUkpmH6Q77QrPU6vvPdpXgIMwrAHBZN/i0h9jQj7mHmEKRVN/W4GWJjyp4aHIEL2fbdyOhOXaPbv7sg0uRbcRNcKarmlqgnXkVhoI03b6u9sY82wV6+zLLNkLPFfzzGx/+N9uPuoLaP54J8YNAgmmxSPYI7BXL4nOFNXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591086; c=relaxed/simple;
	bh=rkWLn0FHl7H1kHVZqLywZSX23TH3svX2tAwmJopyKUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=evvzqreaYlxVUr494m7MPhGRTeNuYQRh7jN6qzJe9567NcJ4jbl0bm/U7OpdyHyu/ROppBmMt6gz5A7uy5xVbypRoLXn2y6t3IWMVvpyrLBmiHc1gG5NHowbqXICUTrvzpzlJFihAIpyP/+9phq/eON6un2njWYbhcsnSpCzIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QoNc+XH2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QoNc+XH2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso24395765ad.1
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591083; x=1784195883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=;
        b=QoNc+XH2UPM0JGExBwmQoaaDrTl0vqqMfbTqGMl9np54ygU5tjcYPCH6gL6KE02tox
         /Fe9OQ9dIA53rhQ8/9nC3GkmPNDaVQGYf9L0vrWdbY002blIlLNhUAL5m4LSfD7Rk563
         jSZAvmq3X0C9CuNJHOcrCd6kusXbfTwoc7//w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591083; x=1784195883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/uvU7sUOw7sHC5RCl/6W+zWHmjzyCxjd+jlaUCTE/Y=;
        b=s9ndSPI1Ea8BBHYTnjcRx7nlyb/GWIfh9k+sCd+EcbOQ+sVGZkR28QLAIvx6tnA/fL
         VvPmQ5N4Ilb1xv9GCS+0tRnXHsPtyBP1IPi2HDrJ9XJJ0zvk8TKcI9bXiEmDXh1HEoC/
         E0nloEIa5v+ee0//lCFqkA/aSWLewKoa4Q5nXGv9qKfFsEJi7PGV3zQ4eRT5ByqZwxZw
         ohQK2s/+eeeyakEdIEggjDzk1JqnqMPkqrARzRHPySf2W6Rq66+O9bksOcclBQqyfCK6
         bGmQlFyqGIlCQT6o3p/4c+51/nxHLgHWqLTolkCDmRzowndegrrFERNZahxMKIx2qn5l
         iYkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIqvqtKbEtpRYgFVCPhmPO1AfXeUTrM5VcblTpTwDyxAd8GpxrXss7IHMjQOdfrVuEXHBQiOgQbLJUEA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDxR0istbN5o2yGe+RctQh42E/oBNzcQJedqHF6+d9Ji6kLWk8
	x8IqKxy/6X2XMy7tAfok954YAUE1+RV82G3btFqH2HoDNbrCPk3pxqsxJxX9+QikoA==
X-Gm-Gg: AfdE7ckO5uifDSBghcKs5XT72vIdt4WogRbD/g+VQwo56ERPcoMOi1UNN5CAVGjEKp1
	utZjqfK6Ry7UvzDaNscWge9HDgZoZsvs53M/VbJuVghJTPQS0viUJYcweO1SdA/E4RokHX6e6R5
	O5fw4Jg/G4qe3E8nes3Yq+Kc3ehRmCr6M77bbLP/+NXlzKwp6HOgkME3CFhCGRSBjhAVuTFVfAS
	UwHjAwuMpj0uFz6g59DvdPUfhYLOS6IOpk3a5thcKPceWbIdWDDKATSG+eqxOql4bJPxrrS+N4q
	O/dXyjLr4nQE9bgGL0kkt6xz9i10z7pYW1iQDThb4FcAEVhmPa0dAfRrgEQhg4uSSC0u4F2+tpr
	SfXMQkavqYAYmab6GdMO2KB6Gf9ZEkIYb6bwnV8GFOv2GsFycxWejOaA5mfp8HtYYFHmrON0q2g
	sHonv3MY9N+OmjvTAEREj4fY22vA1/s5DE8pssc2R2F0XIszzF0pLdNubARQj0ac2UQfppQQ==
X-Received: by 2002:a17:902:c402:b0:2cc:df15:91de with SMTP id d9443c01a7336-2ccea47c1eamr75805365ad.42.1783591082919;
        Thu, 09 Jul 2026 02:58:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:02 -0700 (PDT)
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
Subject: [PATCH v4 05/14] usb: hub: Associate port@ fwnode with USB port device
Date: Thu,  9 Jul 2026 17:57:10 +0800
Message-ID: <20260709095726.704448-6-wenst@chromium.org>
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

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

To avoid potential conflicts with ACPI firmware nodes and then causing
power management issues, only assign the firmware node if the hub's
firmware node is not an ACPI firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..e8fb2acd77be 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *dev)
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
+	/*
+	 * At this point ACPI nodes and swnodes have been removed by
+	 * device_platform_notify_remove() in device_del().
+	 */
+	fwnode_handle_put(dev_fwnode(dev));
 	kfree(port_dev->req);
 	kfree(port_dev);
 }
@@ -780,6 +786,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
@@ -852,6 +865,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 
 void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 {
+	struct usb_device *hdev = hub->hdev;
 	struct usb_port *port_dev = hub->ports[port1 - 1];
 	struct usb_port *peer;
 
-- 
2.55.0.795.g602f6c329a-goog

