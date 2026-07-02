Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A72492199
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 13:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997771; cv=none; b=NOXDYVxu4qt7N3wQtCJ6RKRgVsYLZQgBhhQKmHWBmRDD6Cq/b+tv7yFPvylE5QRJGHv0q7fiku1jzhHlF3OIeGmrDUWPi6dN7NfDCBJR940Ipjrb/ZYA4ABnkI/biYT9MquMF0fFJPvX4DnGSwDPtt4ciTSAVfsmTH68WnNGnMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997771; c=relaxed/simple;
	bh=M7rclrRdFprUFT3CMVU58irngl0mj+ZduTFpMAmONNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9lA6mQnzJol0G+a+tcWH4/HcdRaM9flj+6ocBeYRTKSxSx4PadLoEZE1KuNMjultjTWC0/o7THOdTzt51Ryk3EuRePSCPFZckk5w9MSTtquRyiOzuzVzt2N7jkHD0cib0RDv10vcwIin91F8Iwvr911LbsBzOYXu8/Eslw8mug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu0RZYp/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu0RZYp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997770; x=1814533770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M7rclrRdFprUFT3CMVU58irngl0mj+ZduTFpMAmONNU=;
  b=Mu0RZYp/84i/nQpADNxQHGgJZkS2hFZeMi9ObGkoYW2zYiDudDROlEpW
   Rz8rQs7r15X1qGef+hBtQayynD2pVdszc4A2rmVyl0QDcdozTP9yh4lLQ
   ZjgVpFq28fppemf8jcvehqxLzQ5J3F1y8fkRjjpT+EZyPYyttSgHytRY+
   AzDEAiCK1i85IGyU86bax/TCg6PPPJzMWxjd7OLzpuRS6ydQBDkwi0wR4
   6EsAFWTjmYSW2huYymchicFfh51XxSr6wI0dVAuFCrcpaWDbMqtjoC5z0
   tuw2k3opbUoQr+Q7Hj/jVugC+r0rGl2od8w0UvhXeqdUtD5OyFwd/wAd6
   Q==;
X-CSE-ConnectionGUID: kQy3sMmZRX6sUkCNf0xkJA==
X-CSE-MsgGUID: CEe1wBVuRVOc19ALT2/gAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95256362"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95256362"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:09:26 -0700
X-CSE-ConnectionGUID: kOE+QZ9WQm2Chck3i01Zhg==
X-CSE-MsgGUID: xrKp9MFEQkKrMpaUZVHIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251140489"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2026 06:09:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 7B66898; Thu, 02 Jul 2026 15:09:21 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v1 1/4] regmap-irq: Provide IRQ resource request and release callbacks
Date: Thu,  2 Jul 2026 14:42:54 +0200
Message-ID: <20260702130903.1790633-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
References: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The users which rely on regmap IRQ to create the IRQ chip may also
want to have an additional tracking of the IRQ requests and releases.
Provide a callback for them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap-irq.c | 22 ++++++++++++++++++++++
 include/linux/regmap.h           |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 07234d415b51..99b55b1053ee 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -296,6 +296,26 @@ static int regmap_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
+static int regmap_irq_reqres(struct irq_data *data)
+{
+	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (d->chip->irq_reqres)
+		return d->chip->irq_reqres(d->chip->irq_drv_data, hwirq);
+
+	return 0;
+}
+
+static void regmap_irq_relres(struct irq_data *data)
+{
+	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
+	irq_hw_number_t hwirq = irqd_to_hwirq(data);
+
+	if (d->chip->irq_relres)
+		d->chip->irq_relres(d->chip->irq_drv_data, hwirq);
+}
+
 static const struct irq_chip regmap_irq_chip = {
 	.irq_bus_lock		= regmap_irq_lock,
 	.irq_bus_sync_unlock	= regmap_irq_sync_unlock,
@@ -303,6 +323,8 @@ static const struct irq_chip regmap_irq_chip = {
 	.irq_enable		= regmap_irq_enable,
 	.irq_set_type		= regmap_irq_set_type,
 	.irq_set_wake		= regmap_irq_set_wake,
+	.irq_request_resources  = regmap_irq_reqres,
+	.irq_release_resources  = regmap_irq_relres,
 };
 
 static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index df44cb30f53b..370baa19db87 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1770,6 +1770,8 @@ struct regmap_irq_chip {
 			       void *irq_drv_data);
 	unsigned int (*get_irq_reg)(struct regmap_irq_chip_data *data,
 				    unsigned int base, int index);
+	int (*irq_reqres)(void *irq_drv_data, irq_hw_number_t hwirq);
+	void (*irq_relres)(void *irq_drv_data, irq_hw_number_t hwirq);
 	void *irq_drv_data;
 };
 
-- 
2.50.1

