Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAFF3EAC71
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511436; cv=none; b=MsOTJ/QjnXQ/bTLdXo70DsOv88yry5S+PmSqPo4yBcm1pzHcGHgz06PvL7dL2x0ZIrl3QWvmGg5wuwci/ttVnSjh3YtMs//uFjeXgCvS3ToErgn0yRp/vh1OxbRM8SjvPrH/ZL3wbXi8ApZzD/m15/PcBJptnYlC1DQJW17MnkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511436; c=relaxed/simple;
	bh=iO3DF4u+63xTtKP4FxOejaFf7KwQ2Ou9YoxBchLW4e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBaCMmF4LZsbL/rPtWiWajzD+kGEVTQD4a89e/QqOR0PBrDmp35FmMRJcM3NafrseiYjjlvTHIE0VeJOOjqduMFw8m/n6km8YQJZee/zTAl5449j0CqZHcThes1yg3Qp0zrOqDaDgwytTbtIuBWNBH0Tpy5KGxX6oDa/oA4Gb3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FA6VeukX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FA6VeukX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso972008a91.1
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511431; x=1789116231; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FkHDnS01ZrIUIFEZvu4Ez5qiW1Xnkoau5FbL5ZwNaU=;
        b=FA6VeukXWyGPuogQeISKM6LMRn1QI6tHxamTHIB4Bw6U8+bDr/aW92GJwk0bdEwajJ
         BmLZ9N79YsVK0dPrfRxjh8Gs/BbOeguHQNg4mbYmUlG1vhwIm54etgPQ2gSGZdnW+gT0
         uYLiz9cTVyz9mqME0fse/QhzW58sB2lKgbwjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511431; x=1789116231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FkHDnS01ZrIUIFEZvu4Ez5qiW1Xnkoau5FbL5ZwNaU=;
        b=MW5t57KEpfgUVYtts5IbJy8PDWuK+0vIW1Zv3PmCOT3WO766aQZ+3+VCjrsnzmQJtp
         /TkrTQ3/25FoUei3+xdY75kwO0ARsUKULHaVywesWRLt3H32kGe5ez7d3Tx4M1YoBIu+
         //guwJEhIJ4NHuHY7BVXbhBpW1m6eD0X65NayzFPwcEwQpCGYn1YKsTbIQ7HGd0v5pk5
         XHZYXDCbbBoNgr6wUZZfIyT9gyad/ktlBe/VQR1nxtgUKuFpXTstxp101yNDUmmgwnX+
         +0IVnfaXjTHeeO9i6Xz9uApWG9Py+N1HWXjxwg8S6D10LBRTEu57NVp5exuGx2MPMyJ0
         mfPg==
X-Forwarded-Encrypted: i=1; AKwUvByDAXb43DFFibNBNlS/qlTfzDOBvqPmtA+iPLRI4jxMtqeiii42iCVw44oJ61BQPSxcOHmN5L/xL+jPDQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lt4Tr0CpSG0ZyHWQdQhfxvlabuO6Le8sjdSzmKuiLtH8IZzFWJ
	/+hbHz96w3Yc1M95GGFmm2SM4iXXNUE96ajVtJVbVu+j/GeQUzrvgT+LROTvvBgKrA==
X-Gm-Gg: AYBFou1JLeRh0vaQshvVW6NA6mxzWPK5jMQSaqiY7l/KBtv5t+6SP8MzrhMot8azYmQ
	wjXOV6HjW3qfOIfG+M2yt3Z2AJ4W17qziwW4qZkyK7lCE7YHV9cAfF+z5Cp9qca1/QrwHuuA5vA
	ZpPdIkyfctPlQ8S0aeZMg0OU6onuBS1AQMzST4CAsAyKw3T+wBzAPmkv1rbA44PHb8tXXCHOXLD
	WDiePA6bqTKG7XirK33g8gsGLmrff+KXFBR+ncThGXIlfFAOUOIAYpeoogM0d+yY23X+CO/h22p
	7ifrwt3srX8ybm/sxnXOVWiOrY9R1ChWhlUePIdYeVn3JBhz+NjjDUcJzkGWRU8sFGbnln4Tp3q
	7xSAZ3fpv4skg8JnftHRtJUh4J0R9/8vuFFdNpjnmK6+uezEsXvz/sQoh6OkKyzbDLp0aAuMlmS
	HciiAet/3M3c+c6NilVUS4gISMrJ/CUCJrbHGiJrFvSmVDqN/G8bBoLHPglgKTZ2ElNFiXTx2rd
	XCsATClZUIbya3bMeLnORAvXhdrp2FQsAEq4y47TbfONvXL8RRz5Bk=
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr7487531a91.10.1788511431512;
        Fri, 04 Sep 2026 01:43:51 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:43:11 -0700 (PDT)
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
Subject: [PATCH v8 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  4 Sep 2026 16:41:45 +0800
Message-ID: <20260904084158.1341550-7-wenst@chromium.org>
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
2.55.0.979.g7e5102b832-goog

