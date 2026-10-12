Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D14952BE5B
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913872; cv=none; b=fB6EwgTidiouQTbK3g3jgPREZACtasNA+7p0jvOywBb0xwoIC33Uiv9H55C9O36fvFhHktLvhqFydIUjai/WB1q9v8mM0mxr7MTST9XyTIEWiFLznwwsco4kuRwTGqEVgvH2Dj19MZ2QxeK/hNUlELZLz1R+8COr1yNfIRK0Y2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913872; c=relaxed/simple;
	bh=NcU3zyHrdoqF7Sz2BWcoYero8xdv5Bz83v9sBOVAEgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVM75PYK4XVggAtF35Dkg77fww4dwOcuFxUfZelp2dCVeKtNqNc7BV6F3h0s8t6R76TBA73U6X2sifY4kqAsLDUL4B5fSSqCsJhYH4X6rfDNbZYtr1UMmIYvXoLm9E6IT3mfssMMjP6ek4dSOSzqX/fvQXdUzy4V5d2NpGObneY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T9Jfi2Zl; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YAW7BOn0; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T9Jfi2Zl";
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YAW7BOn0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 25EDFC653F9
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 17:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 682F760362
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 17:51:08 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id EF15C11D7183E; Tue, 13 Oct 2026 19:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913868; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=i9zMtqlaeC/N/r/1IZp7EGtF4TlbMbXPfFl8uC42X1Y=;
	b=T9Jfi2Zl8lRrbyPhdK7aYrswVVU4D9SjTqJuushRlkoQcy44Wt+KCiYZao2SGzaIGJinCP
	H4jcH2z4kre7EM+Mm2OHn5w/MBCXwEtQ6OBFcI9QZ24uuiZDA9yqmtD5IAyLykZ3pAV5m6
	UngbbRhMOT7dSOBpX7TNpT4gtWcYxI9cKubgaL8rjnoQBsbdCQz/ShAkBhzIM9n1+q+r2n
	uqylpDRh+ZLg67ZDoKI4ZzLIVuFFQr911s6ZZS2JgS14ExXljw3wOOqzKL/vjurOO/NtS5
	tlLf4TdaYlvsUBnCAtJcz3UL6y6iPNoXVp30mIhXHP97ymhZZ34+puupj6tLTg==
Authentication-Results: mail.galae.net;
	none
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id ODClAdbuzGqsGBEAtaWaaQ
	(envelope-from <herve.codina@bootlin.com>)
	for <herve.codina@bootlin.com>; Mon, 12 Oct 2026 16:29:42 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5603D11D70CC0;
	Mon, 12 Oct 2026 16:29:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791815379; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=i9zMtqlaeC/N/r/1IZp7EGtF4TlbMbXPfFl8uC42X1Y=;
	b=YAW7BOn0WCrHZnoFCxPET1QsUZ5WQIGv6Fi0hjmiBAzPVp3UmvJs9B+pVqdpEuWD2wBInS
	p2zR0m0wEqWfsbEQ/fSqijufblgFv+OLYVhOxkkDE/SaDy/ydDcKEHEvRcUlhhmTCfNcul
	3PdMduGzOC9JfcAOW0RG0fi3MFGgvU9uWur2Y3y6si8GrHb7OQLG4qW0txznL5Wt70N5GF
	i1hyBBcihri1YMf1ccstAjNAStP7xzgvIMLJowyLUasNDOQHdHH6NgMginleemvth1Wz2B
	wSTYtqb8fHGm1Svf/R8ftUz5aaCFiuEee4z/fGi6VTSU9JgGGfytL3nz8eFdwg==
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
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v13 06/10] PCI: of: Use fw_devlink_set_device()
Date: Mon, 12 Oct 2026 16:28:20 +0200
Message-ID: <20261012142826.159178-7-herve.codina@bootlin.com>
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
X-Rspamd-Queue-Id: EF15C11D7183E
X-Spamd-Result: default: False [0.55 / 30.00];
	BAYES_HAM(-1.95)[87.84%];
	DATE_IN_PAST(1.00)[27];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	URIBL_BLOCKED(0.00)[fwnode.dev:url,intel.com:email,localhost:rdns,localhost:helo,nvidia.com:email,bootlin.com:mid,bootlin.com:email,qualcomm.com:email];
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

The code set directly fwnode.dev field.

Use the dedicated fw_devlink_set_device() helper to perform this
operation.

Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Cc stable because used by other patches with Fixes + Cc stable
---
 drivers/pci/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index a51dff91b196..0f45c5b72458 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -882,7 +882,7 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 	 * bus. Avoid any new device creation.
 	 */
 	of_node_set_flag(np, OF_POPULATED);
-	np->fwnode.dev = &bridge->dev;
+	fw_devlink_set_device(&np->fwnode, &bridge->dev);
 	fwnode_dev_initialized(&np->fwnode, true);
 
 	ret = of_changeset_apply(cset);
-- 
2.55.0

