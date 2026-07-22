Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6997353A76;
	Wed, 22 Jul 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709828; cv=none; b=CJWlKo4dOImQGf6O5oXXwx2jFxAF8HnOhDDXW3ndSM2RI+qg5DVHaGkTbhF3Ctr3CgvJg0ijUXJ6H5OPrE4BQwYaBPdZ4OM4wV/LoGaBJlmrd4Lofmrol/EMDuGhvlD+TkEhDaj/0MeP0BfMpao6TiDepH80xbGnWvT7PKy6OX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709828; c=relaxed/simple;
	bh=FSQEUR5lT0QLgko7oEg3PWkGA9UVMNb6nFeAFck4zDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZtritWfxu7USvYD+J+PHroyH5t1da5gG/CXpMGYLvtZMSN907a61AKqtBq72fUtk+x8+jJ0qI05u/udJHFrFPr0HKBIz6S/yjUhhy92gekRh2t4+4cgSQ7gAOxA2aHu0OWdZp6wPClJ4QpPbH9ilw/XTWfQatUgtuCwMInmusE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X56yk58x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X56yk58x"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BEDEC2BCC7;
	Wed, 22 Jul 2026 08:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1784709827; bh=FSQEUR5lT0QLgko7oEg3PWkGA9UVMNb6nFeAFck4zDA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X56yk58xYujYdT/ywSAZ5CcXNKWfJTHNV0muNk9jT+THJDX9aS+78Ov2yxj3DyxwL
	 U9qyagSPk1H+p/bZ+7tPXBVyZ+SA9ouOy0Hzhoxnn6DSZzduqf8rid6Nt+Vu23Cp2L
	 DzqlfBIVUKWkLHaz+gT4KKIe5DPsY7OHdokHD/8A=
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FB6C44539;
	Wed, 22 Jul 2026 08:43:46 +0000 (UTC)
From: Richard Leitner <richard.leitner@linux.dev>
Date: Wed, 22 Jul 2026 10:42:47 +0200
Subject: [PATCH RFC 2/2] regmap: implement no-sequential-read firmware
 property
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-regmap-single-read-v1-2-aaaf31591669@linux.dev>
References: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
In-Reply-To: <20260722-regmap-single-read-v1-0-aaaf31591669@linux.dev>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 driver-core@lists.linux.dev, Richard Leitner <richard.leitner@linux.dev>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784709824; l=2027;
 i=richard.leitner@linux.dev; s=20250225; h=from:subject:message-id;
 bh=FSQEUR5lT0QLgko7oEg3PWkGA9UVMNb6nFeAFck4zDA=;
 b=yhW5fWkALMD91mWste1/aLkqZojp0RQkFIQWkzILzZZXVRUTbbPSSSLnD4VoDSvfUAdSzATdi
 9GEwKk+OvUdAYg8MHRD/hVLN4b+AktqlRnF8p1/PD/BIVsni8XiYVG4
X-Developer-Key: i=richard.leitner@linux.dev; a=ed25519;
 pk=8hZNyyyQFqZ5ruVJsSGBSPIrmJpfDm5HwHU4QVOP1Pk=
X-Endpoint-Received: by B4 Relay for richard.leitner@linux.dev/20250225
 with auth_id=350

Some devices are integrated in hardware modules where incrementing
multi-register reads are not reliable, even though the underlying chip
normally supports them.

regmap already owns a configuration that selects between bulk reads and
single-register reads. Letting regmap consume this firmware property
makes use of this configuration and therefore keeps the override in the
actual layer of implementation.

If the property is absent, existing behaviour is unchanged.

Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
---
 drivers/base/regmap/regmap.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e6e022b026375..ed08db764cdcb 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -674,6 +674,18 @@ enum regmap_endian regmap_get_val_endian(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(regmap_get_val_endian);
 
+static bool regmap_get_use_single_read(struct device *dev,
+				       const struct regmap_bus *bus,
+				       const struct regmap_config *config)
+{
+	struct fwnode_handle *fwnode = dev ? dev_fwnode(dev) : NULL;
+
+	if (fwnode_property_read_bool(fwnode, "no-sequential-read"))
+		return true;
+
+	return config->use_single_read || !(config->read || (bus && bus->read));
+}
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -786,7 +798,7 @@ struct regmap *__regmap_init(struct device *dev,
 		map->reg_stride_order = ilog2(map->reg_stride);
 	else
 		map->reg_stride_order = -1;
-	map->use_single_read = config->use_single_read || !(config->read || (bus && bus->read));
+	map->use_single_read = regmap_get_use_single_read(dev, bus, config);
 	map->use_single_write = config->use_single_write || !(config->write || (bus && bus->write));
 	map->can_multi_write = config->can_multi_write && (config->write || (bus && bus->write));
 	if (bus) {

-- 
2.53.0


