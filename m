Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583932;
	b=HrSpC/G/y5c6dWpP7Y2G6ratLtfy6vC4dJwYDy9SxfMmq3ONXGPGD04Sr9tss2b3HElR
	 Y1Eban/ARHp5cW9Hep1iQ69sclJd+7lCi4wK0I8AoqjKo1hdUVq3dZizfglxhqjzUVptI
	 jiGNeoVif7c+nb9q14IiSeV9+qDN7XHDdyGgg5Ke4O9UsgZslZysvQRROHYBsb3KCHk5J
	 HB8X17JKh7ptCeHQtuE0NmGG/maahoSNcQ+HKOTCnNGovCleJsLSe8WPe74HRa/t/r9im
	 16bCWMY/9vTv2BybCbVTIy+OMaWUsnSgzASp3BAUs0fapqj7eWR6HxFKoJqhxQrRuAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583932;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=+AF8rxrVs5leS4swff53I33rqYcRZ3ybrAATN/A0bvc=;
	b=wKwO4NyYm0WI+CdEQaeC//GblpLfwYH+5hYk4GSMkDWbemrG9uxcKfA6oc642kWT5Ciq
	 1BDxGMJ0c5jOH00cbJWLGECqma2wykLpQOvYEYaMQJ3y0xTxM+z0puECI70FoaPsk2xE1
	 qfBl1y6kEUXkVgUU/VHC8vdN5ZTdPD3SQ8/gQkw9da1wpFFJA7MZySfLAQjPHG9oAUJx2
	 kpyykk+Ibb9OK7Rlzz3jtuG8IHSlVTZ+lRXMK+PDu/rL8kjtBWyOSjeGSECCsNmNWhHvR
	 r9zpFnW38xqQgMtgLNLphp8KCrYmgUsvo/Hi6n/v3bnJ3hIKxEkt9KWNnPBKZ0/m4CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EczKAdfS;
	arc=none smtp.remote-ip=95.215.58.17
Received: from mta1.migadu.com (out-17.mta1.migadu.com [95.215.58.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA9E606A333
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA9E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EczKAdfS
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=h9vDUcTlFuZv+2e04iwT1Nc5kh2/0YVX+hNUDjF9CFs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583930; v=1; x=1795188730;
 b=EczKAdfSPltWxI8Q+E4I9tdXwY3q/iE99vqBkcooj/HVM/fus0YlS7ihYOy8iI/fPKL6PdDj
 cOf8FU5M1pLI7WQz/0chgSgC9sMw08HdnqZzx6Aq3P2GLFU6uBkOQFk9zktmyMZAHsn0YcCvn8B
 5+KalmGuOiJCRrfQqfiCKcyI=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7149c44fd578d60a;
	Fri, 13 Nov 2026 15:32:10 +0000
X-Mizu-Trace-ID: 7149c44fd578d60a
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:50 +0800
Subject: [PATCH v2 02/10] regmap-i2c: keep bus raw write limit when
 applying read quirk
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
Message-Id: <20261113-regmap-improve-v2-2-5dfd6a89078f@nxp.com>
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

regmap_get_i2c_bus() applies adapter quirks on top of the raw I/O limits
advertised by the selected bus, but it starts from zero-initialised local
variables and then overwrites both max_raw_read and max_raw_write of the
copied bus. If only one direction is clamped by the adapter, the limit of
the other direction is dropped.

For example, regmap_i2c_smbus_i2c_block sets a 31-byte limit for both
directions. An adapter that only reports max_read_len causes the copied
bus to advertise 31 bytes for reads and no limit for writes, even though
I2C_SMBUS_BLOCK_MAX - 1 still applies.

Seed the locals from the selected bus and only replace a limit when the
adapter quirk is more restrictive. Also only allocate the bus copy when
one of the limits actually changes.

Fixes: ea030ca68819 ("regmap-i2c: Set regmap max raw r/w from quirks")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-i2c.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 51a04961faf7..8663a4ec0a3d 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -353,7 +353,7 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 	const struct i2c_adapter_quirks *quirks;
 	const struct regmap_bus *bus = NULL;
 	struct regmap_bus *ret_bus;
-	u16 max_read = 0, max_write = 0;
+	u16 max_read, max_write;
 
 	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C))
 		bus = &regmap_i2c;
@@ -391,18 +391,22 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 	if (!bus)
 		return ERR_PTR(-ENOTSUPP);
 
+	max_read = bus->max_raw_read;
+	max_write = bus->max_raw_write;
+
 	quirks = i2c->adapter->quirks;
 	if (quirks) {
 		if (quirks->max_read_len &&
-		    (bus->max_raw_read == 0 || bus->max_raw_read > quirks->max_read_len))
+		    (max_read == 0 || max_read > quirks->max_read_len))
 			max_read = quirks->max_read_len;
 
 		if (quirks->max_write_len &&
-		    (bus->max_raw_write == 0 || bus->max_raw_write > quirks->max_write_len))
+		    (max_write == 0 || max_write > quirks->max_write_len))
 			max_write = quirks->max_write_len -
 				(config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
 
-		if (max_read || max_write) {
+		if (max_read != bus->max_raw_read ||
+		    max_write != bus->max_raw_write) {
 			ret_bus = kmemdup(bus, sizeof(*bus), GFP_KERNEL);
 			if (!ret_bus)
 				return ERR_PTR(-ENOMEM);

-- 
2.56.0

