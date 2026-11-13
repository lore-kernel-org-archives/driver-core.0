Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583953;
	b=I9Pr06/o3GeZOImXZqlVbQeb6XWSCvvt4f3R9iZhmkEbRy1cT0nfy5IssRQ39WQmll55
	 Lur0uYy+JLdRkeSBxVzvgxrdUrgcvpBASvwthfYyA6OdcTLMsOcJ7arDtHuZR2uze9JnZ
	 RutlWgbuMvqnWVAJsKIJWtcePGmd1vHEUCPSkeHPMJ6GiqmrdJcxpaIUdYuqc9dhqxcFw
	 r5pslkZXOv2CmuTPc3efIdF3KM34HD0aERPeBBkVXG0fbgCrMCII+fB6jtIOlaS+xMzjB
	 r5EGY0/6Z4iFJW/Pj1nJyMfgpzioqIS7f9yDf4NnQVLXicpwmo1UF9kAbgNmr2WBKvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583953;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=kbraa1Oo2k9WPuG5q/cG4uVfKcbAhsiQ3/8iHYpQje0=;
	b=tCoRHS8WUtlNYJMuOas+0Tbgl9g0A3wzByWkrjeuWSl5GvPPUcZS4hNX0zQvDiX/nId9
	 Jdn3ZW2OSBp3wxatjsCIRF0RBwG5hIfe5wmvyRDBCxLu0FAY/t/h8477j34ugQkMApaVk
	 LQWhhGzGkzeS/q8wr+qKqwHow6CTBof4qS2BgxQ78Kmw2GiQEbhVP35EObmvNydhfE+wi
	 qiIkvILl1yEdu9eoFXzXqeGMyXObLgBLqzhqA964VDhBHZCtOQvCm/8a40BDNJqj7yG+e
	 Vm6Fr7dFn4oDc8MehyZJXL7StrXeu60FOUZF8Ymx5VFUPqIqJwd0OWTQY8iOKxm/nog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xwsD37ln;
	arc=none smtp.remote-ip=91.218.175.81
Received: from mta0.migadu.com (out-81.mta0.migadu.com [91.218.175.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73B606A337
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF73B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xwsD37ln
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=wigmDGIoLzGp/BFVFhke9A8S5TPOzYnAbLU2MuAeWHQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583951; v=1; x=1795188751;
 b=xwsD37lnK31WiwkfqkUlWAABnIGvkBNBmbMNQ+PkbZ4QXXh15eGNw1U8ayV2HZxbQdoVdk/Y
 AFkAZHl7RxDDtmFzxA3Q11t/TwN5Hdhn9bin7ZySumgoNWb1G4wugD2+j4GBXfcixns0eGootcJ
 PB3uRvQ/Rj362dHPKWWDHXOQ=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 9770b19fa137c42b;
	Fri, 13 Nov 2026 15:32:30 +0000
X-Mizu-Trace-ID: 9770b19fa137c42b
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:55 +0800
Subject: [PATCH v2 07/10] regmap: factor out format initialisation into
 helpers
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-regmap-improve-v2-7-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

Extract the two large nested switch statements that select
format_reg()/format_write() and format_val()/parse_val() into dedicated
regmap_set_reg_format() and regmap_set_val_format() helpers. Wrap the
entire format setup sequence - format selection, endianness cross-check,
work buffer allocation and bus write callback selection - into a single
regmap_init_format() function.

The two callers (config->read/write path with NATIVE endian, and the
bus->read/write path with bus-derived endian) now each call
regmap_init_format() directly, which eliminates the forward
"goto skip_format_initialization" and removes the label entirely.

The implicit "ret = -EINVAL; /* Later error paths rely on this */"
contract is replaced by explicit return codes in each helper.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 399 ++++++++++++++++++++++---------------------
 1 file changed, 200 insertions(+), 199 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index eaf7555f9765..ae313a8e4ffe 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -846,6 +846,197 @@ static int regmap_init_ranges(struct regmap *map, const struct regmap_config *co
 	return 0;
 }
 
+/* Pick format_reg()/format_write() for the register width and endianness. */
+static int regmap_set_reg_format(struct regmap *map, const struct regmap_config *config,
+				 enum regmap_endian reg_endian)
+{
+	switch (config->reg_bits + map->reg_shift) {
+	case 2:
+		if (config->val_bits != 6)
+			return -EINVAL;
+		map->format.format_write = regmap_format_2_6_write;
+		return 0;
+
+	case 4:
+		if (config->val_bits != 12)
+			return -EINVAL;
+		map->format.format_write = regmap_format_4_12_write;
+		return 0;
+
+	case 7:
+		switch (config->val_bits) {
+		case 9:
+			map->format.format_write = regmap_format_7_9_write;
+			return 0;
+		case 17:
+			map->format.format_write = regmap_format_7_17_write;
+			return 0;
+		}
+		return -EINVAL;
+
+	case 10:
+		if (config->val_bits != 14)
+			return -EINVAL;
+		map->format.format_write = regmap_format_10_14_write;
+		return 0;
+
+	case 12:
+		if (config->val_bits != 20)
+			return -EINVAL;
+		map->format.format_write = regmap_format_12_20_write;
+		return 0;
+
+	case 8:
+		map->format.format_reg = regmap_format_8;
+		return 0;
+
+	case 16:
+		switch (reg_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_reg = regmap_format_16_be;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_reg = regmap_format_16_le;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_reg = regmap_format_16_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+
+	case 24:
+		if (reg_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->format.format_reg = regmap_format_24_be;
+		return 0;
+
+	case 32:
+		switch (reg_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_reg = regmap_format_32_be;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_reg = regmap_format_32_le;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_reg = regmap_format_32_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return -EINVAL;
+}
+
+/* Pick format_val()/parse_val() for the value width and endianness. */
+static int regmap_set_val_format(struct regmap *map, const struct regmap_config *config,
+				 enum regmap_endian val_endian)
+{
+	if (val_endian == REGMAP_ENDIAN_NATIVE)
+		map->format.parse_inplace = regmap_parse_inplace_noop;
+
+	switch (config->val_bits) {
+	case 8:
+		map->format.format_val = regmap_format_8;
+		map->format.parse_val = regmap_parse_8;
+		map->format.parse_inplace = regmap_parse_inplace_noop;
+		return 0;
+	case 16:
+		switch (val_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_val = regmap_format_16_be;
+			map->format.parse_val = regmap_parse_16_be;
+			map->format.parse_inplace = regmap_parse_16_be_inplace;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_val = regmap_format_16_le;
+			map->format.parse_val = regmap_parse_16_le;
+			map->format.parse_inplace = regmap_parse_16_le_inplace;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_val = regmap_format_16_native;
+			map->format.parse_val = regmap_parse_16_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case 24:
+		if (val_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->format.format_val = regmap_format_24_be;
+		map->format.parse_val = regmap_parse_24_be;
+		return 0;
+	case 32:
+		switch (val_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_val = regmap_format_32_be;
+			map->format.parse_val = regmap_parse_32_be;
+			map->format.parse_inplace = regmap_parse_32_be_inplace;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_val = regmap_format_32_le;
+			map->format.parse_val = regmap_parse_32_le;
+			map->format.parse_inplace = regmap_parse_32_le_inplace;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_val = regmap_format_32_native;
+			map->format.parse_val = regmap_parse_32_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Set up the format/parse functions, cross-validate endianness,
+ * allocate the work buffer and select the bus write path.
+ */
+static int regmap_init_format(struct regmap *map,
+			      const struct regmap_config *config,
+			      enum regmap_endian reg_endian,
+			      enum regmap_endian val_endian)
+{
+	int ret;
+
+	ret = regmap_set_reg_format(map, config, reg_endian);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_val_format(map, config, val_endian);
+	if (ret)
+		return ret;
+
+	if (map->format.format_write) {
+		if (reg_endian != REGMAP_ENDIAN_BIG ||
+		    val_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->use_single_write = true;
+	}
+
+	if (!map->format.format_write &&
+	    !(map->format.format_reg && map->format.format_val))
+		return -EINVAL;
+
+	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
+	if (map->work_buf == NULL)
+		return -ENOMEM;
+
+	if (map->format.format_write) {
+		map->defer_caching = false;
+		map->reg_write = _regmap_bus_formatted_write;
+	} else if (map->format.format_val) {
+		map->defer_caching = true;
+		map->reg_write = _regmap_bus_raw_write;
+	}
+
+	return 0;
+}
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -854,7 +1045,6 @@ struct regmap *__regmap_init(struct device *dev,
 			     const char *lock_name)
 {
 	struct regmap *map;
-	enum regmap_endian reg_endian, val_endian;
 	bool fast_io;
 	int ret;
 
@@ -879,8 +1069,6 @@ struct regmap *__regmap_init(struct device *dev,
 	if (ret)
 		goto err_name;
 
-	ret = -EINVAL; /* Later error paths rely on this */
-
 	/*
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
 	 * scratch buffers with sleeping allocations.
@@ -956,22 +1144,23 @@ struct regmap *__regmap_init(struct device *dev,
 		map->read = config->read;
 		map->write = config->write;
 
-		reg_endian = REGMAP_ENDIAN_NATIVE;
-		val_endian = REGMAP_ENDIAN_NATIVE;
+		ret = regmap_init_format(map, config,
+					 REGMAP_ENDIAN_NATIVE,
+					 REGMAP_ENDIAN_NATIVE);
+		if (ret)
+			goto err_hwlock;
 	} else if (!bus) {
 		map->reg_read  = config->reg_read;
 		map->reg_write = config->reg_write;
 		map->reg_update_bits = config->reg_update_bits;
 
 		map->defer_caching = false;
-		goto skip_format_initialization;
 	} else if (!bus->read || !bus->write) {
 		map->reg_read = _regmap_bus_reg_read;
 		map->reg_write = _regmap_bus_reg_write;
 		map->reg_update_bits = bus->reg_update_bits;
 
 		map->defer_caching = false;
-		goto skip_format_initialization;
 	} else {
 		map->reg_read  = _regmap_bus_read;
 		map->reg_update_bits = bus->reg_update_bits;
@@ -979,201 +1168,13 @@ struct regmap *__regmap_init(struct device *dev,
 		map->read = bus->read;
 		map->write = bus->write;
 
-		reg_endian = regmap_get_reg_endian(bus, config);
-		val_endian = regmap_get_val_endian(dev, bus, config);
-	}
-
-	switch (config->reg_bits + map->reg_shift) {
-	case 2:
-		switch (config->val_bits) {
-		case 6:
-			map->format.format_write = regmap_format_2_6_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 4:
-		switch (config->val_bits) {
-		case 12:
-			map->format.format_write = regmap_format_4_12_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 7:
-		switch (config->val_bits) {
-		case 9:
-			map->format.format_write = regmap_format_7_9_write;
-			break;
-		case 17:
-			map->format.format_write = regmap_format_7_17_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 10:
-		switch (config->val_bits) {
-		case 14:
-			map->format.format_write = regmap_format_10_14_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 12:
-		switch (config->val_bits) {
-		case 20:
-			map->format.format_write = regmap_format_12_20_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 8:
-		map->format.format_reg = regmap_format_8;
-		break;
-
-	case 16:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_16_be;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_reg = regmap_format_16_le;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_reg = regmap_format_16_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 24:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_24_be;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 32:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_32_be;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_reg = regmap_format_32_le;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_reg = regmap_format_32_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	default:
-		goto err_hwlock;
-	}
-
-	if (val_endian == REGMAP_ENDIAN_NATIVE)
-		map->format.parse_inplace = regmap_parse_inplace_noop;
-
-	switch (config->val_bits) {
-	case 8:
-		map->format.format_val = regmap_format_8;
-		map->format.parse_val = regmap_parse_8;
-		map->format.parse_inplace = regmap_parse_inplace_noop;
-		break;
-	case 16:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_16_be;
-			map->format.parse_val = regmap_parse_16_be;
-			map->format.parse_inplace = regmap_parse_16_be_inplace;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_val = regmap_format_16_le;
-			map->format.parse_val = regmap_parse_16_le;
-			map->format.parse_inplace = regmap_parse_16_le_inplace;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_val = regmap_format_16_native;
-			map->format.parse_val = regmap_parse_16_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	case 24:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_24_be;
-			map->format.parse_val = regmap_parse_24_be;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	case 32:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_32_be;
-			map->format.parse_val = regmap_parse_32_be;
-			map->format.parse_inplace = regmap_parse_32_be_inplace;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_val = regmap_format_32_le;
-			map->format.parse_val = regmap_parse_32_le;
-			map->format.parse_inplace = regmap_parse_32_le_inplace;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_val = regmap_format_32_native;
-			map->format.parse_val = regmap_parse_32_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	}
-
-	if (map->format.format_write) {
-		if ((reg_endian != REGMAP_ENDIAN_BIG) ||
-		    (val_endian != REGMAP_ENDIAN_BIG))
+		ret = regmap_init_format(map, config,
+					 regmap_get_reg_endian(bus, config),
+					 regmap_get_val_endian(dev, bus, config));
+		if (ret)
 			goto err_hwlock;
-		map->use_single_write = true;
-	}
-
-	if (!map->format.format_write &&
-	    !(map->format.format_reg && map->format.format_val))
-		goto err_hwlock;
-
-	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
-	if (map->work_buf == NULL) {
-		ret = -ENOMEM;
-		goto err_hwlock;
-	}
-
-	if (map->format.format_write) {
-		map->defer_caching = false;
-		map->reg_write = _regmap_bus_formatted_write;
-	} else if (map->format.format_val) {
-		map->defer_caching = true;
-		map->reg_write = _regmap_bus_raw_write;
 	}
 
-skip_format_initialization:
 
 	ret = regmap_init_ranges(map, config);
 	if (ret)

-- 
2.56.0

