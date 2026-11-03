Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721456;
	b=R3lPYZqHWM6mrzWGNcm4dErHpKRZpJH++oiwhbuiBWgYcju5loYHipdo/FaNSP35V03Z
	 SKK49r/xEQp4mnYZ4o20BsjCFdQ8jluN8F5i26uCUQe5aL7/vExit2XzTWv9WRK7Wfg0v
	 fWEAAHbszG5dUIcR0/7xsaNdBiBVniUvd4d433ZKZYhwKwBASUL+VpnrUUgvQscowDsQ2
	 efIfL35PsRoIPDlb3QyDQkUk/8Azo3kBw9oMkfSZkbtxp5+W9lLjyKp7DmwYgQpsWL9Ph
	 E4xx0+WAl8CXsMoKAWrsnpEvypqjGlKY6z72/dnCIhSaAQXF1KBp+y8JvM7F1M7jTnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721456;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=3TQHW+G37rNifSwPn5OcXaV1kVqaTQJJTD1CKDTBVFc=;
	b=3aHwcOoM9rQJHpwkIt2Uv5nAqO9FRfVR91iFzAW9RFLBgyacf7c528FnljuV1ucTK9y/
	 yrLbItaSEdD3Gr5U8NzgENYjkJtRgZRz5JCev/QtsmncxgAmJ4gTJHjpSLDempRH5Ci6s
	 sXrtYBFuDWp6BSemTrPfT7iRy4FzrDr8Uhs3UBg/Kvjcuw5N+E8fMj1dy0ku1AYHBxYjr
	 h4+VO6XRCcZxYzFR9gOksjsY678OjIpO+GXO7IBiwTiRsixwswnJGkqEBr40jMWL6mfDY
	 utCcgRQ8/HeyPBE8+3XC26IeC0UkUzuMt8WbZhpPT2BYWnaijWUDIzBunBuupnRbH4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PaAduEyD;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA29606A33B
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 15:57:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA29606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=PaAduEyD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DA184E413DC;
	Tue,  3 Nov 2026 15:57:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FF276046C;
	Tue,  3 Nov 2026 15:57:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA751103291D1;
	Tue,  3 Nov 2026 16:57:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793721446; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=3TQHW+G37rNifSwPn5OcXaV1kVqaTQJJTD1CKDTBVFc=;
	b=PaAduEyDCKiozaMAq/dbarxqcBkANWIC2aB0HsWP1OIlitinSXRwJmd080PETJ66W+Xbhc
	kvnXVLvOXfVJOZeOXqxVw6Q2+WuYd7Hr0fzZLJGr5r5Sj7I2sSMsZqkHgrs8RMMIddsjDA
	Rae4XdC4ktEAtghXFnEwmNBBydfeRB2NqlHUrx3WFyMz5C0kDMXjVY9uGSfdNVU3PiwvXL
	VMFDw2VPbXETySxkUZj5enP2Nj9JGIQD/eQKB1w3DaF3WInUZ0jctPN1Q4PYSdFQwxwMdg
	gqw8dqlyAH6QlkMWbykPe9PQzMdjbJyBwH3BQmPslQUW0cKOqtOevFEION4HAQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Richard Cheng <icheng@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Lizhi Hou <lizhi.hou@amd.com>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v14 09/10] PCI: of: Remove fwnode_dev_initialized() call for a PCI root bridge node
Date: Tue,  3 Nov 2026 16:55:15 +0100
Message-ID: <20261103155540.365294-10-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103155540.365294-1-herve.codina@bootlin.com>
References: <20261103155540.365294-1-herve.codina@bootlin.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

During the instantiation of devices described by a device-tree overlay
applied on a PCI device, devlink displays the following kind of debug
messages instead of creating the expected links:
   'Not linking xxxx - might never become dev'

Without those expected links, the device removal order cannot be
correct.

Those debug traces are printed by fw_devlink_create_devlink(). In our
use case, they are all printed because the supplier of the link has at
least one of its ancestor with its fwnode flag FWNODE_FLAG_INITIALIZED
set.

The culprit ancestor is the PCI root bridge.

The fwnode related to the PCI root bridge is created dynamically by the
of_pci_make_host_bridge_node() function. During this creation
fwnode_dev_initialized() is called which set the FWNODE_FLAG_INITIALIZED
flag.

Calling fwnode_dev_initialized() tells devlink that the device related
to this node is handled out of the driver core. This is not correct in
our case. Indeed the device related to this firmware node is handled
using driver core mechanisms and is fully compliant devlink
expectations.

Simply remove the fwnode_dev_initialized() call. With that done, the
devlink debug messages are no more displayed and links that were missing
are correctly created.

Fixes: 1f340724419e ("PCI: of: Create device tree PCI host bridge node")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Tested-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/pci/of.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 8914bfa25dc1..0a5797652e18 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -894,7 +894,6 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 	 */
 	of_node_set_flag(np, OF_POPULATED);
 	fw_devlink_set_device(&np->fwnode, &bridge->dev);
-	fwnode_dev_initialized(&np->fwnode, true);
 
 	ret = of_changeset_apply(cset);
 	if (ret)
-- 
2.56.0

