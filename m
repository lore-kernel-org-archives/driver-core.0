Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A66F52BE47
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913805; cv=none; b=KpSr61d+xovkk2/T/n+x0Ok3Ettu10v9m7k/jHAAjT7r2kUIPA+WCqpCuZ3xIuqaiOHZcv7Ibnc473Ap4huaSYO8zex6VOCIzOoXgOLoDW+8z/ae5bkdPNLt9BnpNEbGxGHYhDcgbjTCpYZUZrd5LTXHyQeAOnp/4PxC/0X+PGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913805; c=relaxed/simple;
	bh=LeDPnBgrM7pNQ8OlNZHsJRQR3r2PXLGLegBZ2Qsqzf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dv7exBq7eCDeLAr+cehNVJd7ktxPlOOk3BL+GuzSGNxhbHfDR8/JzqHGWca7X55XNEEj83GxyyAmkSf+3NyBe6Gcs5PWpKLdLcI3puEMYr4opZaGrTMTMYWFqGSy/r9FqKMPaB5tZ2cIkQ9roKbQMrn9fWSeYG7H+s49B/SAT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=D9N/XeK7; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FjGgQOgH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="D9N/XeK7";
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FjGgQOgH"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D9ECB4E41215
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 17:50:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A8AAB60362
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 17:50:01 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 282E511D71892; Tue, 13 Oct 2026 19:48:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913801; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kAb7NHjVc8QoTRTxUb1OG7thf2F5YhXlem84GhsJqnE=;
	b=D9N/XeK7ybs44AftxW9lEFi4Vg2ddkutyQvyYlfW3CZKV2vzmCednCQetPR7BqU64jR8Xa
	DRYJO+JOcae98Yf/tWr/I3IYfTPkeK4Opnw+Yrol8L70Ir/l6pl87Kv/QjkJJSGC2gBTSw
	SEmNyvd06LwoIG7cx/1zPcv0ejX1blZqYvQc9ZAWiovEZ72x++ZkdGoXXeg3vAJiLT4uwh
	CGD80gUynxaJ09QfriIafZEP1lEF1MUmZJjiuqqZ4c65pZmHv382JkTMYmeuQdV5HCXO8N
	9raLhAqt4Wqb4IxBBWighOGBrzTvM+68//bW+C0fD6mR45ix3+Cv4asXwXwz3g==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id SKPIALTuzGoYHxEAtaWaaQ
	(envelope-from <herve.codina@bootlin.com>)
	for <herve.codina@bootlin.com>; Mon, 12 Oct 2026 16:29:08 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F37FF11D708B4;
	Mon, 12 Oct 2026 16:28:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815339; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kAb7NHjVc8QoTRTxUb1OG7thf2F5YhXlem84GhsJqnE=;
	b=FjGgQOgHcTUDDGnIbSuozwmNqeMTRdBQVZaPNnUfhfNiHolctNHx1hOE21Ll6aYc6zsp1v
	tYfEnkKxdGOOtY680hMNAcNEJaM9GkRVagicVm8ou5DFrd5VuLmwgGbbtWaPBFa0nRcAW7
	iuGKxtDnIWPKwfwaYZObdeJ9zckNqniI+KLN1vyuvrXhXy0sCRuVe0N2R2v06p+hCVJxzJ
	Oxu6iH3orqfi6ElTPOegR+Wj2TpZlYb7tN7T2IqKprgAnyueowX5lDSHa/Zsq+QxXiQiAc
	GNRjXOfG2P+7tWArtGJk8xGwxsp+opS6e8tVRR7Xqp4HXMpqP3lAkPgm74kLIg==
From: Herve Codina <herve.codina@bootlin.com>
To: Richard Cheng <icheng@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
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
	Ulf Hansson <ulf.hansson@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 01/10] driver core: fw_devlink: Introduce fw_devlink_set_device()
Date: Mon, 12 Oct 2026 16:28:15 +0200
Message-ID: <20261012142826.159178-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012142826.159178-1-herve.codina@bootlin.com>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 282E511D71892
X-Spamd-Result: default: False [1.77 / 30.00];
	DATE_IN_PAST(1.00)[27];
	MID_CONTAINS_FROM(1.00)[];
	BAYES_HAM(-0.73)[77.64%];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	URIBL_BLOCKED(0.00)[cirrus.com:email,nvidia.com:email,bootlin.com:mid,bootlin.com:email,intel.com:email,localhost:rdns,localhost:helo,linaro.org:email,qualcomm.com:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	BCC(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[herve.codina@bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[45];
	PREVIOUSLY_DELIVERED(0.00)[herve.codina@bootlin.com];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,lunn.ch,kernel.org,linuxfoundation.org,google.com,opensource.cirrus.com,cirrus.com,linux.intel.com,gmail.com,stgolabs.net,intel.com,zohomail.com,bootlin.com,amd.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com]

Setting fwnode->dev is specific to fw_devlink.

In order to avoid having a direct 'fwnode->dev = dev;' in several
place in the kernel, introduce fw_devlink_set_device() helper to perform
this operation.

Having this helper allows to hide the fwnode devlink related stuff
behind the helper.

Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Cc stable because used by other patches with Fixes + Cc stable
---
 include/linux/fwnode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a9dcaf7e7076..3ce49575cf82 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -260,4 +260,10 @@ void fw_devlink_purge_absent_suppliers(struct fwnode_handle *fwnode);
 void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode);
 bool fw_devlink_is_strict(void);
 
+static inline void fw_devlink_set_device(struct fwnode_handle *fwnode,
+					 struct device *dev)
+{
+	fwnode->dev = dev;
+}
+
 #endif
-- 
2.55.0

