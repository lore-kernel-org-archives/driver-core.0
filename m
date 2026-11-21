Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795265078;
	b=K9nQUhgeI6OotcRsfDopQAQaXjsGjpnOWp3WatDxMMdrn5C8My8K+7WihCbW+dvokTZs
	 I46BV+46gMjL+mHD6tTyxY1val7V1VSxiS6l7S6BMKdlWIXmEV+5AqubXGCEfRd/WDrbQ
	 Gw4T7zMpUfKKeRu2028a1IXdnk1Ects4YVnfH3da3Z5A8sm9JY++K/v4jAWL0lQorf1YO
	 VJ1pEdu4vCeYpIdmNuiP77u6z3AAJ0tbUBVq9TuN/G5CJ2OWrPcArssmO5c6elTXv9ZmI
	 8q5xjNvPMmkSFbez8MFVhR86Ta+iqVrE9XqQCEtIltTe+qzIpjEC6hMiVe/uZe6gYpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795265078;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=73hb9cJTV4X5iRA+X+UwpW7GEeGRoQGgBp3NqNyu0ss=;
	b=lXkEWPjdJ7Gs97EpojOWBgk7i0/RNcMReRmD/4K0HUU1EXqXQqfxjk/s0+plSeCDqDsA
	 wuv/SR4N71SurH7GfhIm7LDYsGtNn2XEyLDaeGEmX5JJLOBM2qzkSRFQbJDegtI4nN+Ws
	 L/aGcfTjGvbvZb/PY1ymjOCAmG31nsG0VfUJYPWh7THnWn26oo8xE0g1Gpirzk3M/svL4
	 QsUDRWZjzWnmgfXoqcOZmgBKG7H/sHkdt4PiTPdAEt7Vh56qF3uHkQRBgssfaH1UBoK8J
	 SjoVlNUQ8fk/qgM17DCfWanTuJYsWVRSsXrC1t8y5gYBBndjkXgYejVuoZSITlOPVJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LvsPaDwt;
	arc=none smtp.remote-ip=95.215.58.188
Received: from mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6FF606A320
	for <driver-core@lists.linux.dev>; Sat, 21 Nov 2026 12:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E6FF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LvsPaDwt
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=qoxexT6zRu1lnU5SnH8V+5p2T0HRBIZ98E82iNqStMM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795265074; v=1; x=1795869874;
 b=LvsPaDwtGXYgXIFlUds4nEgIhDqFzShp+PGWP+o/flLb9h0OYhTctSZHGXLWClomqbLs6tuP
 Lev7g9wpGRvv9W4Ig+QpuC3fmtaxOCs9oDZwN/3LrEwrX1DD0Oq8LqsTnSkDhwtDAAxxgYiVlGD
 NPA/njSQG/0gRhqmOhBj3CZs=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d0e7d80b74f8c9d6;
	Sat, 21 Nov 2026 12:44:34 +0000
X-Mizu-Trace-ID: d0e7d80b74f8c9d6
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sat, 21 Nov 2026 20:44:19 +0800
Subject: [PATCH 1/3] regmap: drop regmap_bus::free_on_exit
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
Message-Id: <20261121-regmap-improve-2nd-v1-1-6b5fd59451ed@nxp.com>
References: <20261121-regmap-improve-2nd-v1-0-6b5fd59451ed@nxp.com>
In-Reply-To: <20261121-regmap-improve-2nd-v1-0-6b5fd59451ed@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

The SPI and I2C bus helpers kmemdup the static regmap_bus to override
max_raw_read and max_raw_write per device and mark the copy with
free_on_exit so that the regmap core frees it. This is the only user of
free_on_exit, and the per-device limits can instead be applied to the
map while it is being initialized.

Add an optional regmap_bus::init_limits() callback which is invoked by
__regmap_init() after the bus raw I/O limits have been copied and before
the cache is initialized. The latter matters for maps with raw register
defaults: regcache_hw_init() reads them from the device while the map is
still being initialized and uses max_raw_read to chunk the transfer.

The callback takes the bus context, the config and pointers to the raw
I/O limits. struct regmap is private to drivers/base/regmap, so passing
it would make the callback unusable for bus implementations outside the
regmap core.

Use the callback for the I2C and SPI buses, which allows using the static
bus structures directly. This removes the per-device bus allocations and
lets us drop free_on_exit along with the associated error and exit paths
in the regmap core.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-i2c.c | 85 +++++++++++++++++++++-------------------
 drivers/base/regmap/regmap-spi.c | 66 +++++++++++++------------------
 drivers/base/regmap/regmap.c     |  8 ++--
 include/linux/regmap.h           | 10 ++++-
 4 files changed, 83 insertions(+), 86 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index a4a259232980..7635eca2cbee 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -13,6 +13,43 @@
 
 #include "internal.h"
 
+static void regmap_i2c_init_limits(void *context,
+				   const struct regmap_config *config,
+				   size_t *max_raw_read,
+				   size_t *max_raw_write)
+{
+	struct device *dev = context;
+	struct i2c_client *i2c = to_i2c_client(dev);
+	const struct i2c_adapter_quirks *quirks = i2c->adapter->quirks;
+	size_t val_bytes = BITS_TO_BYTES(config->val_bits);
+	size_t max_read = *max_raw_read;
+	size_t max_write = *max_raw_write;
+
+	if (!quirks)
+		return;
+
+	if (quirks->max_read_len &&
+	    quirks->max_read_len >= val_bytes &&
+	    (max_read == 0 || max_read > quirks->max_read_len))
+		max_read = quirks->max_read_len;
+
+	if (quirks->max_write_len) {
+		size_t reg_reserve_size, max_payload;
+
+		reg_reserve_size = (config->reg_bits + config->pad_bits) /
+				   BITS_PER_BYTE;
+		if (quirks->max_write_len > reg_reserve_size) {
+			max_payload = quirks->max_write_len - reg_reserve_size;
+			if (max_payload >= val_bytes &&
+			    (max_write == 0 || max_write > max_payload))
+				max_write = max_payload;
+		}
+	}
+
+	*max_raw_read = max_read;
+	*max_raw_write = max_write;
+}
+
 static int regmap_smbus_byte_reg_read(void *context, unsigned int reg,
 				      unsigned int *val)
 {
@@ -47,6 +84,7 @@ static int regmap_smbus_byte_reg_write(void *context, unsigned int reg,
 static const struct regmap_bus regmap_smbus_byte = {
 	.reg_write = regmap_smbus_byte_reg_write,
 	.reg_read = regmap_smbus_byte_reg_read,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_smbus_word_reg_read(void *context, unsigned int reg,
@@ -83,6 +121,7 @@ static int regmap_smbus_word_reg_write(void *context, unsigned int reg,
 static const struct regmap_bus regmap_smbus_word = {
 	.reg_write = regmap_smbus_word_reg_write,
 	.reg_read = regmap_smbus_word_reg_read,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_smbus_word_read_swapped(void *context, unsigned int reg,
@@ -119,6 +158,7 @@ static int regmap_smbus_word_write_swapped(void *context, unsigned int reg,
 static const struct regmap_bus regmap_smbus_word_swapped = {
 	.reg_write = regmap_smbus_word_write_swapped,
 	.reg_read = regmap_smbus_word_read_swapped,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_i2c_write(void *context, const void *data, size_t count)
@@ -204,6 +244,7 @@ static const struct regmap_bus regmap_i2c = {
 	.read = regmap_i2c_read,
 	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_i2c_smbus_i2c_write(void *context, const void *data,
@@ -245,6 +286,7 @@ static const struct regmap_bus regmap_i2c_smbus_i2c_block = {
 	.read = regmap_i2c_smbus_i2c_read,
 	.max_raw_read = I2C_SMBUS_BLOCK_MAX - 1,
 	.max_raw_write = I2C_SMBUS_BLOCK_MAX - 1,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static int regmap_i2c_smbus_i2c_write_reg16(void *context, const void *data,
@@ -302,6 +344,7 @@ static const struct regmap_bus regmap_i2c_smbus_i2c_block_reg16 = {
 	.read = regmap_i2c_smbus_i2c_read_reg16,
 	.max_raw_read = I2C_SMBUS_BLOCK_MAX - 2,
 	.max_raw_write = I2C_SMBUS_BLOCK_MAX - 2,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 /*
@@ -346,16 +389,13 @@ static const struct regmap_bus regmap_smbus_byte_word_reg16 = {
 	.read = regmap_i2c_smbus_i2c_read_reg16,
 	.max_raw_read = I2C_SMBUS_BLOCK_MAX - 2,
 	.max_raw_write = 1,
+	.init_limits = regmap_i2c_init_limits,
 };
 
 static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 					const struct regmap_config *config)
 {
-	const struct i2c_adapter_quirks *quirks;
 	const struct regmap_bus *bus = NULL;
-	struct regmap_bus *ret_bus;
-	size_t val_bytes;
-	u16 max_read, max_write;
 
 	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
 		bus = &regmap_i2c;
@@ -393,43 +433,6 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 	if (!bus)
 		return ERR_PTR(-ENOTSUPP);
 
-	max_read = bus->max_raw_read;
-	max_write = bus->max_raw_write;
-	val_bytes = BITS_TO_BYTES(config->val_bits);
-
-	quirks = i2c->adapter->quirks;
-	if (quirks) {
-		if (quirks->max_read_len &&
-		    quirks->max_read_len >= val_bytes &&
-		    (max_read == 0 || max_read > quirks->max_read_len))
-			max_read = quirks->max_read_len;
-
-		if (quirks->max_write_len) {
-			size_t reg_reserve_size, max_payload;
-
-			reg_reserve_size = (config->reg_bits + config->pad_bits) /
-					   BITS_PER_BYTE;
-			if (quirks->max_write_len > reg_reserve_size) {
-				max_payload = quirks->max_write_len -
-					      reg_reserve_size;
-				if (max_payload >= val_bytes &&
-				    (max_write == 0 || max_write > max_payload))
-					max_write = max_payload;
-			}
-		}
-
-		if (max_read != bus->max_raw_read ||
-		    max_write != bus->max_raw_write) {
-			ret_bus = kmemdup(bus, sizeof(*bus), GFP_KERNEL);
-			if (!ret_bus)
-				return ERR_PTR(-ENOMEM);
-			ret_bus->free_on_exit = true;
-			ret_bus->max_raw_read = max_read;
-			ret_bus->max_raw_write = max_write;
-			bus = ret_bus;
-		}
-	}
-
 	return bus;
 }
 
diff --git a/drivers/base/regmap/regmap-spi.c b/drivers/base/regmap/regmap-spi.c
index b9fec387997e..e095e0bba10d 100644
--- a/drivers/base/regmap/regmap-spi.c
+++ b/drivers/base/regmap/regmap-spi.c
@@ -98,6 +98,28 @@ static int regmap_spi_read(void *context,
 	return spi_write_then_read(spi, reg, reg_size, val, val_size);
 }
 
+static void regmap_spi_init_limits(void *context,
+				   const struct regmap_config *config,
+				   size_t *max_raw_read,
+				   size_t *max_raw_write)
+{
+	struct device *dev = context;
+	struct spi_device *spi = to_spi_device(dev);
+	size_t max_size = spi_max_transfer_size(spi);
+	size_t max_msg_size, reg_reserve_size;
+
+	if (max_size == SIZE_MAX)
+		return;
+
+	max_msg_size = spi_max_message_size(spi);
+	reg_reserve_size = (config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
+	if (max_size + reg_reserve_size > max_msg_size)
+		max_size -= reg_reserve_size;
+
+	*max_raw_read = max_size;
+	*max_raw_write = max_size;
+}
+
 static const struct regmap_bus regmap_spi = {
 	.write = regmap_spi_write,
 	.gather_write = regmap_spi_gather_write,
@@ -107,46 +129,16 @@ static const struct regmap_bus regmap_spi = {
 	.read_flag_mask = 0x80,
 	.reg_format_endian_default = REGMAP_ENDIAN_BIG,
 	.val_format_endian_default = REGMAP_ENDIAN_BIG,
+	.init_limits = regmap_spi_init_limits,
 };
 
-static const struct regmap_bus *regmap_get_spi_bus(struct spi_device *spi,
-						   const struct regmap_config *config)
-{
-	size_t max_size = spi_max_transfer_size(spi);
-	size_t max_msg_size, reg_reserve_size;
-	struct regmap_bus *bus;
-
-	if (max_size != SIZE_MAX) {
-		bus = kmemdup(&regmap_spi, sizeof(*bus), GFP_KERNEL);
-		if (!bus)
-			return ERR_PTR(-ENOMEM);
-
-		max_msg_size = spi_max_message_size(spi);
-		reg_reserve_size = (config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
-		if (max_size + reg_reserve_size > max_msg_size)
-			max_size -= reg_reserve_size;
-
-		bus->free_on_exit = true;
-		bus->max_raw_read = max_size;
-		bus->max_raw_write = max_size;
-
-		return bus;
-	}
-
-	return &regmap_spi;
-}
-
 struct regmap *__regmap_init_spi(struct spi_device *spi,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name)
 {
-	const struct regmap_bus *bus = regmap_get_spi_bus(spi, config);
-
-	if (IS_ERR(bus))
-		return ERR_CAST(bus);
-
-	return __regmap_init(&spi->dev, bus, &spi->dev, config, lock_key, lock_name);
+	return __regmap_init(&spi->dev, &regmap_spi, &spi->dev, config,
+			     lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__regmap_init_spi);
 
@@ -155,12 +147,8 @@ struct regmap *__devm_regmap_init_spi(struct spi_device *spi,
 				      struct lock_class_key *lock_key,
 				      const char *lock_name)
 {
-	const struct regmap_bus *bus = regmap_get_spi_bus(spi, config);
-
-	if (IS_ERR(bus))
-		return ERR_CAST(bus);
-
-	return __devm_regmap_init(&spi->dev, bus, &spi->dev, config, lock_key, lock_name);
+	return __devm_regmap_init(&spi->dev, &regmap_spi, &spi->dev, config,
+				  lock_key, lock_name);
 }
 EXPORT_SYMBOL_GPL(__devm_regmap_init_spi);
 
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 910f66bcff40..7968c30bd09a 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1180,6 +1180,10 @@ struct regmap *__regmap_init(struct device *dev,
 	if (ret)
 		goto err_range;
 
+	if (bus && bus->init_limits)
+		bus->init_limits(bus_context, config,
+				 &map->max_raw_read, &map->max_raw_write);
+
 	ret = regcache_init(map, config);
 	if (ret != 0)
 		goto err_range;
@@ -1207,8 +1211,6 @@ struct regmap *__regmap_init(struct device *dev,
 err_map:
 	kfree(map);
 err:
-	if (bus && bus->free_on_exit)
-		kfree(bus);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__regmap_init);
@@ -1521,8 +1523,6 @@ void regmap_exit(struct regmap *map)
 		mutex_destroy(&map->mutex);
 	kfree_const(map->name);
 	kfree(map->patch);
-	if (map->bus && map->bus->free_on_exit)
-		kfree(map->bus);
 	kfree(map);
 }
 EXPORT_SYMBOL_GPL(regmap_exit);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 8f3034881f8a..a1809be66235 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -580,7 +580,6 @@ typedef void (*regmap_hw_free_context)(void *context);
  *	     to perform locking. This field is ignored if custom lock/unlock
  *	     functions are used (see fields lock/unlock of
  *	     struct regmap_config).
- * @free_on_exit: kfree this on exit of regmap
  * @write: Write operation.
  * @gather_write: Write operation with split register/value, return -ENOTSUPP
  *                if not implemented  on a given device.
@@ -611,10 +610,13 @@ typedef void (*regmap_hw_free_context)(void *context);
  *     DEFAULT, BIG is assumed.
  * @max_raw_read: Max raw read size that can be used on the bus.
  * @max_raw_write: Max raw write size that can be used on the bus.
+ * @init_limits: Optional callback to adjust the maximum raw read and write
+ *     sizes for a device. Called with the bus context, the config and
+ *     pointers to the limits during regmap initialization before the cache
+ *     is initialized.
  */
 struct regmap_bus {
 	bool fast_io;
-	bool free_on_exit;
 	regmap_hw_write write;
 	regmap_hw_gather_write gather_write;
 	regmap_hw_async_write async_write;
@@ -631,6 +633,10 @@ struct regmap_bus {
 	enum regmap_endian val_format_endian_default;
 	size_t max_raw_read;
 	size_t max_raw_write;
+	void (*init_limits)(void *context,
+			    const struct regmap_config *config,
+			    size_t *max_raw_read,
+			    size_t *max_raw_write);
 };
 
 /*

-- 
2.56.0

