Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F29A3F1670
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782815267; cv=none; b=XqxQeFGt9GUrenAvjjlNjXyBefvoacKYVEkD2hfpOpFRSD14b7bm1Ep0GwUEODI1AUqL7yYN3uVJPcQnNOpIszfVUTuou7vc8chtY9mKoyxdvXwW61cEIq/UvgRaaGrHQt6/YS1S834Wy6z/oxhgS8RvUXmNzgvDYLAKwgccHio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782815267; c=relaxed/simple;
	bh=8bzUWhIDa9iIuUSeW9u3iBPqKTrOLGkOD0khSSiKvRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WAkZ6Yciso9+/tTWFxwb0wjF+NZZ7a5FHq1PaXoYpzaG6ZBN27/iqFq5X4s03z0CZfnXL9JS/SxauLX9iPlnDv31gvaLQkMQaMmQMWTddjKfXa4mPK4+NGieecCT4gW+dvpnLZeanO2l5BjT3zvwt50ZmtPX+2l5dVN5Yoriezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mtwSL4LB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mtwSL4LB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9FF31A0C75;
	Tue, 30 Jun 2026 10:27:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B45B56025A;
	Tue, 30 Jun 2026 10:27:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 04124106F1D67;
	Tue, 30 Jun 2026 12:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782815261; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=w4BPATJGU7K6PkdoXAa/bfEwTs5+MbuE+tXijyNTszg=;
	b=mtwSL4LBmPjRKn7lBcNSAMywLTZLkcZpnZAxEGqaobQC24ZOO3boKyLdKbxihln5wgtaBe
	aoMZSUgJns0jt1diP5bf0vPot5SJGrhuycaY50+Z0ECBpDjMzOAysj+8vfBU6kV2XsPaAO
	UbT+I2iQVsJIzrsCIIZaui99mMv353r4jvBLM2+5Z475+wQSjUub15m2tCljE8ejl68vwb
	K2tXWLlyo3ldln0S/Xxph5yVtj72aCB0OcAbTbsc5sEDquBih0uyRIuhjP+G6BWKfPlDJb
	0VIDawRm0ZgqN3oYvoLxcS8hoC2r5Soz2lwNf2tVy9WvBHiJEgsnxfox86AyEw==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kalle Niemi <kaleposti@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v8 0/2] lan966x pci device: Add support for SFPs, simple-bus part
Date: Tue, 30 Jun 2026 12:27:11 +0200
Message-ID: <20260630102717.413501-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Previously, I sent a big picture series adding support for SFP ports
available on the LAN966x PCI device [0].

In this series patches touch several parts and sub-system in the kernel.
Reviews have be done and it makes sense to split the series and send
parts separately.

This current series is the extraction of patches related to the
simple-bus driver. It has to be seen as a continuation of the big
picture series but related to this specific simple-bus part.

Patches 1 and 2 makes the simple-bus driver compatible with fw_devlink
expectation consisting in creating its child devices at probe.

[0] https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Best regards,
Hervé

Changes:

v7 -> v8
  v7: https://lore.kernel.org/all/20260511155902.34534-1-herve.codina@bootlin.com/

  Rebase on top of v7.2-rc1
  No nother changes

v6 -> v7

  Rebase on top of v7.1-rc1

  - Patch 1
    No changes

  - Patch 2
    Fix conflict due to device_has_driver_override() introduction.

Older iterations:
  Patches 4 and 5 in the big picture series
  https://lore.kernel.org/all/20260325143555.451852-1-herve.codina@bootlin.com/

Herve Codina (2):
  bus: simple-pm-bus: Remove child devices when the bus is unbound
  bus: simple-pm-bus: Populate child nodes at probe

 drivers/bus/simple-pm-bus.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

-- 
2.54.0

