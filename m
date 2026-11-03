Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721391;
	b=3nOaja2AYEMNunYkOpZDcH9BkoxIANAh+gQW2x0SVCVZQj+Dku8mMdfZ6/LiKDTVGXJf
	 NiQwY4CiraYxv2NVZRQNhccimwp/7nG/vO7B+tLa2dGduXxPGIZOkTJ74OFAf1aIkzp5e
	 RG8Szs+oacDckzKIFGXgxNg9GbTxo4Syw5eKItu3FpdvfZc7fxt+2Skb1uuR7Ko0veiIv
	 qYHJpGSI83criJAJzTnbdG/1hjXzG0UTwNLjzfpOIXnPM0ZILeKC/QXRaLhoZZyu+MX2X
	 tUMJbz8LHYIf4aW87JDMRM1TTZOrbw62u3kqk+hFteufkcifkOLGmX2rswNYuYXvBJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721391;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=oB3sTwsAdHOiMdO+oDSxWl+5SJeWmjDX6oqAwCndkkY=;
	b=VUGCjCRK5K7BTN21O/VSHe1YRQj7WmnCRlcJxjmWeMMixZQKDaORpz1lqzw59V6qcG9W
	 3Vh5y41sTx4ISgDYZUc6648tEazOv/TXs1yhbnRKgJqlcALWgL17LXOKI6HcfDw56Pbgq
	 AZ0CaqrOP7oq41bvKjpo7F2wOsTzsIzc9RUQtt4RJ5VcVgYaajAAuyTdmYlMxKDHRb1A8
	 yOvj6M3H0W5C35nn3D1Jf2Vtr/mbNB2x/uHPNVZRCVj9RYfkJIppglF39QbQ6pokJNNBl
	 AQLyE9paLtO+AZpuhaA9BOfzebsE8iTWqKxi7wWKU5+GGxsH2KkrQitH4MY7aJahDsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v9tTAZ6c;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D19606EEA3
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 15:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D19606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=v9tTAZ6c
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FEB0C49F46;
	Tue,  3 Nov 2026 15:57:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A18A36046C;
	Tue,  3 Nov 2026 15:56:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50726103291F0;
	Tue,  3 Nov 2026 16:56:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793721385; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=oB3sTwsAdHOiMdO+oDSxWl+5SJeWmjDX6oqAwCndkkY=;
	b=v9tTAZ6cF/Weta5VUe9FddxuyK6xcAkKCtUEvpH8OZTR0iQ/8qlpKBLr9S+olLLXfIacbJ
	OH79fsCT63vk775T9pByp1IcLz+h9jyeX3ERFxUrwagWN66HpBS8YHoqXqEj7QLDDlxcjl
	pSXVExgHKXUG6reEO0LQiASd95p3XJNnDNkGBVlFgUA0FoPuJYhE9rDmS6KDCYMMpELKPA
	ZM1ATBkwsNiVrMuZcwveuaBRyTBRD/UbYXPAiQahENH3zj0S+phdtQsJX6BaGdmCOFw2SV
	aMDpZd+S13+MkR24750usTH4DX2Plnmz+SaW7RD66+JErWokkB1QgX1yzhpiAA==
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v14 02/10] drivers: core: Use fw_devlink_set_device()
Date: Tue,  3 Nov 2026 16:55:08 +0100
Message-ID: <20261103155540.365294-3-herve.codina@bootlin.com>
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

The code set directly fwnode->dev field.

Use the dedicated fw_devlink_set_device() helper to perform this
operation.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/base/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..09f4e9d7e03e 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3756,7 +3756,7 @@ int device_add(struct device *dev)
 	 * device and the driver sync_state callback is called for this device.
 	 */
 	if (dev->fwnode && !dev->fwnode->dev) {
-		dev->fwnode->dev = dev;
+		fw_devlink_set_device(dev->fwnode, dev);
 		fw_devlink_link_device(dev);
 	}
 
@@ -3931,7 +3931,7 @@ void device_del(struct device *dev)
 	device_unlock(dev);
 
 	if (dev->fwnode && dev->fwnode->dev == dev)
-		dev->fwnode->dev = NULL;
+		fw_devlink_set_device(dev->fwnode, NULL);
 
 	/* Notify clients of device removal.  This call must come
 	 * before dpm_sysfs_remove().
-- 
2.56.0

