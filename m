Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241CE3D7D77
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882676; cv=none; b=YVN0hdr6PVitadwSV93YIBgljLwneNAYPICtIPYbsp0cjLw9ZqAun1ndHgAOmYUhwcwnILCabSbNHpMTA9frqDoWO8T8n8tAtc5cXnEm3hRnEl2a/a1obZY8sA3RPKBdXTHosBAKV9bMu0RJW7vWsfnrKk63hhcuX0iCsoS3yGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882676; c=relaxed/simple;
	bh=rDxhkqymr7zNZNO5s5LLG26mVpihgtL4jhXYrXXJ+wY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBTVovZdvloylblaHKhy7COwUAFO1P8emcmwHzRmYy71F85KeHg059GtTu8AWBRr+MCZuFQ4+6zfeSxi8eWTamrRN3rtHzPxZ8lzrtDsQtatEF3/BaljIBrV/Y4JRT87ub7TD2+Ruegn6EsgCP4QGvxHOZuDAhMBX9lDDo3b0qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DTdJ1Wry; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DTdJ1Wry"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381b831d535so198680a91.0
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882674; x=1785487474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=DTdJ1WryGTn+XvUw2TP/VOMTG1yX90eWYbH+IBiRcRib9rVxL0bBa1KneqklOcHwEi
         hDHnoXbus3uQ3zYLytB9ny2tYbnQNCspk3/tCh4+IRmbj/05FmmKR/j4U0aQ3FsaWJeD
         JBDU3x2LOM4Q2QY8Wx8jL5L7eRk6kbx+zcI5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882674; x=1785487474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=A/dxV5Wji45aNCiD9FujoIY2gdRV4PIfuzlZDASmS66kQ8JgdlA/G5284pT7mjMJBu
         OLh5UtqQgc+2vk4u+Jll1ue2taLhnqLbjjRNRypHffZEGtlLDNoCxRh02tuQ1wdgUUUc
         ms8e99s0WfHbS2t6BZeOC+5wS5SYNHpvRz82jcuh7ZAOXZ7tfx6xpA4NVSE7hY6bnbxT
         QGQrdAkmixNu2lc4it+lJ40u02OPlQNbWS8D4652u95vg8KFUuOj6a16RXEeGWjOb8Hg
         lgFdSVv051rIdHQlXkotk/smfaV6G1erVzvsArCLyeTyP6eJOz/rT1Mq5zBETKlY6XWg
         uFew==
X-Forwarded-Encrypted: i=1; AHgh+RrS+/LpcS6nrI55J7q+EbKu0zgIk1hhnME4q/kZQIHQLEN9sIUYQAqNbwp81EhcuLWqFnDWbMSLkZ06zQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRQaBaJmQn6zlaY7vQ7Xsd7UI2Llnd5HWES5SSHXJaxXTtN0Gd
	OwoasD1UouiTRRNNvDELvhxnpHQVqcMSOvr4FD02o2hWAD5eYxKLBAvPdKV7q5FzQ25Ou4QtXf7
	TRR0=
X-Gm-Gg: AR+sD10I/biuIJ9NtrdwglXJlwuyhXojATJoy7wKWafjT6nbABVMkPP7UAenXhso+J5
	9cqjC0iOfRE4LYy3hiKytawyo0Q1BCWtFh4kVchdZ6kaQd+A1gxeS7JidCsYQ+fYEZo6EivBTk1
	IQ4aC34k5WtggJFL2j69zDt9rF7FTjpky/et7iesjjOP7eh5agsXuTi6z+418z8lI/SeGOyJnrP
	1le2K9G3qPK/f9kCoWUrnHCCaKrYoKwqs26hRYKdOOD4bWOiCNDzi7vFEFWrnvuthMAR98sNBjy
	HCDz5/7fe/SyKICq8NujzP27LyJcM4jy/yAQNdBDS14p4scVtfkDltwmh1YoFFfB55NUMGiDx/e
	DKPOCU4S/dQSwulDQQeprVzrN0Zs6jLL9YXnBJS2D5rNqqGce6Bo3PSwB2jBa9HjGsCZXnmHU7+
	VhCMEns9Lr/NcErvK3KUS0oltX7wQgrAfw/KoHVpkEOdQFgc0On5wyb7W8Gx8=
X-Received: by 2002:a17:90b:5407:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-38ec6650435mr6482024a91.20.1784882674612;
        Fri, 24 Jul 2026 01:44:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:33 -0700 (PDT)
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
Subject: [PATCH v7 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Fri, 24 Jul 2026 16:43:15 +0800
Message-ID: <20260724084328.3943997-7-wenst@chromium.org>
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
Changes since v5:
- Added extra |struct fwnode_handle *| local variables to shorten lines
  (Andy)
- Added comment about passing fwnode_graph_get_port_by_id() return value
  directly to device_set_node() (Andy)

Changes since v4:
- Dropped unused |hdev| variable
- Added flags for fwnode_graph_get_port_by_id() with
  FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
  ports can be connected

Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..c0a51d9b06a6 100644
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
@@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct fwnode_handle *fwnode = dev_fwnode(&hdev->dev);
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(fwnode)) {
+		struct fwnode_handle *port;
+
+		/*
+		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
+		 * or NULL. Passing NULL to device_set_node() clears any associated
+		 * fwnode. It is effectively a no-op here, since no fwnode has been
+		 * assigned to the newly created device yet.
+		 */
+		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);
+		device_set_node(&port_dev->dev, port);
+	}
+
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.229.g6434b31f56-goog

