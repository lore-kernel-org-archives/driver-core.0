Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9C3B440F
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076646; cv=none; b=YviNKSxajzgSCM2+jNOMC6GafS9Lu7pjzyJ8al/dlI++FVRNfiU0QF45q6onkO/fOHBvlKJX/Edf2JhCtCNYAjQ/0mJo3jYsa4479e8DSevvIp8Xr0sXWJ0Be1SpYQgfnSZjoJVmVpjCJHmQmKIM3jlFY9uOtW+UWRdIrVPs/CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076646; c=relaxed/simple;
	bh=w4vzxOXOy9hhvavKl72p+0ZNQOP9ilFm/bOhh+IgREQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cTePTgicrC0z2W4mCfj/nSV+2SdK+uziE1DPBw71EBoUeY7iC0ur47rItD6JRzSMQRqpq481qjwM8KSnqQimcUWZlzW9Kw2tCRhr7UVkoLSSn7VHeWXvRQfuQf6o/QtND+PDFVI0XL/T4s8GKpG+6/pVKepLUMeJWKAeNENEI7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P0QEJOmv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P0QEJOmv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c9ed0c7fc7so6006675ad.1
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076639; x=1783681439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=P0QEJOmvdvyRVb6XLT5F2gCZ1mag0Py4KSuU1myZ020DeDYb32VDrN36ejk4MmPWOl
         maThHh5QRU/5tlgop366NehKdKcKmyVbCoFJ8J2Knf5MfnwD9XyDzcfaM0A0YBVKXWSh
         3sc5r9Xv8vhpVUr8m2BIUQ1N/cWZX4+bJ82iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076639; x=1783681439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=pnDbT5x1kG8MB0aPEWaQL6hXl9FANHyktOKipatfIfve3VufcZIOpxxtbpwkIMpYyg
         QhVVoG3SmW32cDV4DBZgk0CdrLVBFubDIAm2DCof7JTHa6jh112hDkgHIGL+L1gd4JB8
         E9gQI5YQiE/09BpTHvDCr+qh/OZw2QjsCrwEoPSHlDjlOVDMAJcVLDvFHL9DavNrKrWM
         73fslJ1u+6jJTa1nVy54A0jZKSKDrwvQAmrBF0P/C/U3nVq28esViiqhNn+v3Rt9Xe39
         +nftEExHCCER8dBCHjb5Aa1VEoE7kt5XdQwXu+bNd6at/xeyqzaMBiiKvZbV3/bL13Yp
         WtLg==
X-Forwarded-Encrypted: i=1; AHgh+RrwjOV0z+kzdvk+d718XOEmbtqTyY0BLuasFLJF0jvAUHrf2c9XKdANePod7ctJIIgofSuvg1VTQ7uxTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwE+wEqAGCieCCCUgOQ1zcQ2uN0i5Js/ENPFiRnomQ8jG5uQHC1
	7RJEds71ZJCKNB51rH7pLCWkflfBanXcIROG7xfg8qwRZDk27Ps0WjSzAaCufHTaOg==
X-Gm-Gg: AfdE7cnpmeg9T6Ec73iM4VSVi0rBEiNNN+n6ak/4gq6NeIkMabkYVNY/kzQiZGebmaZ
	UnmTo/XPK/DZdm2nLf7j6riwqCTXrD/jK8sNhIclYLdl7ZQahGSVC8msLia+wkgVyhYNuPBd9jf
	nPrTko7tPOprAi+zDNL27Ok/BS1UTvhWc3QnH7SdJD/fKYY/ylS5cCZqhezrNAURKTcpdfvfSKq
	muWxs9q4ioXRBGDEjf1lcYuPEH5jiUPbNJyEouqWhSUeSVbxT2pDN6Pu9eaWuCsQBv0f7djF+dt
	2L3jhL076N8BFARoXAmzuUDtsRk0nXVjwYTzrETw7PQHpMtrUGcZ9B7rsD11g/xYyhDPIthnpnU
	SA6QLNl1aRrUEYaWczOpSUUw1sf5wUcOlOMiQ3XGDxU3EcGvChlBLZZ8Ao6baGlIsy71fD0oRzB
	c1q1CfVAjQ3qnfw7qi/5A+zO9Twz1kA08LBPB3KRxfcx7AMHexxnYPdE54OcA7PVrX95nAyQ==
X-Received: by 2002:a17:902:e5c4:b0:2ca:d874:c6de with SMTP id d9443c01a7336-2cad874c884mr19763035ad.26.1783076639217;
        Fri, 03 Jul 2026 04:03:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:58 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  3 Jul 2026 19:03:06 +0800
Message-ID: <20260703110317.1283411-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Skip assignment if hub firmware node is ACPI node

 drivers/usb/core/port.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1088776ef750 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -780,6 +781,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
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
-- 
2.55.0.rc0.799.gd6f94ed593-goog

