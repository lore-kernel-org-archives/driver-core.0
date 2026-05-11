Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EDC2ECD32
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515154; cv=none; b=s5t/lbmwPfnyHDXxRhI7aojanrkuHQe7ZlSUkHAgOAhB0+EUU8WghfpIdY+OEsnIPGz8Wey4+t1z3k/JSorobo1ogEYRGBU/ZU8zkBgA8B7Yeqdzw1izDM5QFp+mBIoP1WrYbH2UuRgb5AVVIyrsgWa77uMzIBILq28SokaR2Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515154; c=relaxed/simple;
	bh=zNz+72mronL8xi65Ve4VwrV2WLO37h5vtN/4YLQXjrI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TGIPlfSWJc97qG/R863WROkoytwrmZOZibKIHBIFRJ1jVNmy6v6KAk4WNZ89uYYhAEXoO8DtGevrYzJR/WPQgimes1X+QG0t8h9XZvBXoYG7512YphA0jXBaZTttKnQJzj7cbg7W+zF491lu1pyVu45J4baaeG8aOudydbzh1DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rHX2MfJe; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rHX2MfJe"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 671B11A1DD5;
	Mon, 11 May 2026 15:59:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BC5E60646;
	Mon, 11 May 2026 15:59:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9F9F11AF9E9C;
	Mon, 11 May 2026 17:59:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778515151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=3ilf3PIdNIBxgEFgzbpGU4XYlQFsaFxql6CNgMkJTac=;
	b=rHX2MfJe7SFDHSh6qzNNgTj+hD31PHMjfuMQD21vWry8ibphbrC5tRB41KahIwEK3XqrN1
	kdFPiIaUoW8hRnFgH/Hv19autnC35vuBoo8ASHU7TjL/pTk/j6acHEm2l8vTACoMZngxXd
	L+4riejGXnyImM4Ld/5Vw7hj2eEBSK6mcWBjLbNhT3c+BJfrJ+dv7DSPQYkMwmfXshpQI8
	AX4WrBfUq7L1RThlqWaX0ZvWqY4oP7mD6oQCoVJP+XCh53nYfuPXc9/VHcO/zrw1i06PDH
	AWCQDuYajDKa8jMIuf2YuS1POUH7I0nyzCE6ft4zxONm+PSEAO2EzUuZ7d1Lew==
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
Subject: [PATCH v7 0/2] lan966x pci device: Add support for SFPs, simple-bus part
Date: Mon, 11 May 2026 17:58:58 +0200
Message-ID: <20260511155902.34534-1-herve.codina@bootlin.com>
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

v6 -> v7

  Rebase on top v7.1-rc1

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

