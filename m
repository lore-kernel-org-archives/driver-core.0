Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721438;
	b=bOY972ZsNuLz05nQI4BRmdtyVHCvsv2AZ2CEcinhvdY9TopqXPtM5enDsJNyqmIQ8hE9
	 x7YcW1zNobfb2K+FOSI6qHSH2aQmcUIeML/9F0jNI7hfo9jEPuHyruPI8RMCrnEXGHNDD
	 11cSD8b/OAs4BIAxEV+K8LiFCW+V7IBYEAVXR9aOVPo735U9QZtxiGcRRczHj331K/tRi
	 t+CZwge4WOWeFpzP4rlhG0LI7O2Gr8Aa3aB4s03oVwqBNaRJiPzT+1gyhRyXum6WdEGbY
	 fOsiR9fz442TAIgc3+O00LyX7phmE3tlRWQlh0j7wrqYIJKTWsM6tryICaA9xR5q9qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721438;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=rg6h39Df+NI7P2uO8bFwLGtVargUeoRElBhX1mfDOoY=;
	b=e8vsZujy/rflfVY0QwTesrVdFbrghYPWBlejZozWyeKDJJ5VpjS827SGHuhTkWB21O5l
	 z8SRBqTVjGD9dgAFsMzNVco1/LVZYd4FGYmsTqZhRODlQ/eZnE8NBx3Zv5TY0TZLPJn71
	 oIXsXdpQ+VNdg8/ObSRTk1rczfOJDla91aqqoQr1gmsWe041GOGoilAGgXiudGyc4onRx
	 h01UzTdY9sx+0/V3diIcVPeLuG2LQt4jS3HhyW+o7/D7vO5Za84fA9+8SUXnpzVXdIUhH
	 LsPdfQofqDmtcSP5/46U8xJXqzeqeXDrN6Ja9IFli55jUCZ0o+JDFf9AzyKF2Geu20Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MkdWjGDK;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6548B606A333
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 15:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6548B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=MkdWjGDK
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6B8E3C49F46;
	Tue,  3 Nov 2026 15:58:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE78F6046C;
	Tue,  3 Nov 2026 15:57:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C49DE103290E8;
	Tue,  3 Nov 2026 16:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793721433; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=rg6h39Df+NI7P2uO8bFwLGtVargUeoRElBhX1mfDOoY=;
	b=MkdWjGDKfLltC/H81sgwzRL7J8EDGSyJh6W2NShG4pf0IrT11Bq80qzS6jXluduewzAViR
	QNC5Qfo+s7m5sSg45PsPFPF2nnnp/f8a4t7D5tiZhR91XGikjzKmkNBxshi/Aw2svlZerI
	/5BtODyVCZOAakNJjzb9ac943dLvx+ka6WNldcnEx611cKMjwkRPiv1EUGJirwmOiEyj58
	e/n8zUWAJAvtVmZshV4uLnZsD6qn1k2gmpF12fDgXcA/gfA4OJ2eInPzsLs73eY+lPpm/7
	r4a0EOab5OxjSDR5NKP27t8O5We4cD0BI7R1AswIL0wMLAIzq3z3e1Ymkh2VhA==
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
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v14 07/10] PCI: of: Clear fwnode->dev during root bridge node removal and error path
Date: Tue,  3 Nov 2026 16:55:13 +0100
Message-ID: <20261103155540.365294-8-herve.codina@bootlin.com>
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

During the of_pci_make_host_bridge_node() call, an OF node is created
dynamically and its fwnode device (fwnode->dev) is set to the PCI root
bridge device using the fw_devlink_set_device(&np->fwnode, &bridge->dev)
call.

On removal, of_pci_remove_host_bridge_node() is called and calls
device_remove_of_node() which in turn set to NULL the related
dev->fwnode.

Later in the removal sequence, device_del() is called and runs its
cleanup logic:

    if (dev->fwnode && dev->fwnode->dev == dev)
        fw_devlink_set_device(dev->fwnode, NULL);

Because dev->fwnode has been cleared earlier, fw_devlink_set_device()
is not called and leaves fwnode->dev unchanged. This fwnode device
(fwnode->dev) becomes an dangling pointer.

If any reference to the OF node is held after this removal, the pointer
is still accessible using the OF node (np->fwnode.dev) but points to a
freed area.

The exact same issue is present in the of_pci_make_host_bridge_node()
error path leading to the exact same dangling fwnode->dev.

Avoid this dangling fwnode->dev pointer by clearing it in
of_pci_remove_host_bridge_node() and in of_pci_make_host_bridge_node()
error path.

Fixes: 1f340724419e ("PCI: of: Create device tree PCI host bridge node")
Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pci/of.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 0f45c5b72458..29b63a9090ae 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -822,6 +822,7 @@ void of_pci_remove_host_bridge_node(struct pci_host_bridge *bridge)
 	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
 		return;
 
+	fw_devlink_set_device(&np->fwnode, NULL);
 	device_remove_of_node(&bridge->bus->dev);
 	device_remove_of_node(&bridge->dev);
 	of_changeset_revert(np->data);
@@ -887,7 +888,7 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 
 	ret = of_changeset_apply(cset);
 	if (ret)
-		goto out_free_node;
+		goto out_clear_devlink_dev;
 
 	np->data = cset;
 
@@ -909,6 +910,8 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 out_revert_cset:
 	np->data = NULL;
 	of_changeset_revert(cset);
+out_clear_devlink_dev:
+	fw_devlink_set_device(&np->fwnode, NULL);
 out_free_node:
 	of_node_put(np);
 out_destroy_cset:
-- 
2.56.0

