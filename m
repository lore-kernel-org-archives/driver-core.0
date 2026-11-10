Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303506;
	b=zB34XowhvVgW8cgjEVZI0RnTuff97W7yj5MT0UdzfjLYIpZfmIxerpzMlioWo9YY0A6q
	 KzZDPvgXyYwitPAqXqRSFDsLbUSz2u45dO8wQdEf9eCN12ykXeWfSji+z/sEG0lj821xn
	 +pQzw0C7fKysJolXFcQrCaEXKqWt8SVMiOEncAgHTKshk5I61Yx3PlAYQ8Fr4xO7fCi3m
	 X26lzTUAE9BMTUAAFTEvrdlXfclvFItbpmrWhbkwLcIAREjrw6ATsGT7Qkv7oJnEr3qss
	 K1Ec0Zh4GgwpxbQj9/Igb1EdwC/o6DPBzkVwKg2MWfUza4/f+UmgdRONdDMI/WO6sgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303506;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xRFK0NjvqexN9qtG0xXNjBU8Sm7PsKnRlfsVTrtnvYg=;
	b=sJxfXfdhAvsanimdrRqvc/IZs6b0tBOf4en3hF89/ZXlyInc1KLoIIZtv4l9EWWTK8kc
	 XHr2QK2f0lK+GBZ+25uQOKt/iVUJfFM2MB8Np+s+38E155jenrrGhk8wETqHIwqbY6mIu
	 IvQuzBXvbjeIAT6CWP6HP0sQtGJRgNfMyJz4/B9rtHIlgBOsFdjp+dBub9rIvvx8tLM20
	 NA7hVyHvN+ZB1YIlnaipxX/odAeNLojFAKuwFHgEORLNJSSbcrNyvGAVJ/CPprm1l/9TH
	 AmaGHS6I3dXUVIRaiOng2vyiTQtYrYMwVSVjW0rZ5zAcKAXeRh9RGXogSzTYHgsnyrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BLZoMkFo;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C78606A932
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 09:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7C78606A932
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BLZoMkFo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303506; x=1825839506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bG+3C4D5k+4+5Er2rP9lAEwFLc3mqCQq0AeBaM5Wurk=;
  b=BLZoMkFoGdP4UkGJwCvOElneyrKYtwYIgnE4BmDpYhkgvSB+wdFztztz
   NIYOEGTp3J47pYFnE3BhCG4P/E+ED8k1Lt5fsUgqnkflZSp2YUFzvLGf1
   jnc1Kb95ZbTV173WMrjxVGnaICWRAUlJWYyRJ6t3R6EMqPWL0FIyWakez
   gkTOV4ymVht1ideK+mVxMd0XM+ZMQ/RtCMk2HYtAi/NSgnGgWUyCnpn1+
   QglnUKwPsTSz4XKkq4/32+0ZIBuaKOwiRqJlCP5GBWQDqX+J7R1rlGpoC
   VJAenbSJx8AhuYivYxd/4hORyYRFMM7qaqN/YhZL8ynqboyEI9+3tYewu
   w==;
X-CSE-ConnectionGUID: B4QVXR/eQZCeU4OFTuaGxw==
X-CSE-MsgGUID: v41EtfFUTxKlvRNVxYPjGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3143997"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3143997"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: Z5JWrOJBSPWebxELcSnWhw==
X-CSE-MsgGUID: esdzWfqrSwKX3s1ju67YPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8225906"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2A30F9E; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] regmap: Defer assignments to the later in some cases
Date: Tue, 10 Nov 2026 10:37:01 +0100
Message-ID: <20261110093820.454682-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
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

In some cases the assignments at the top of the certain functions
belong to smaller subset of the functionality and may be located
too far from their actual users. Defer them to the later.

This makes code robust against potential changes that may lead to
the corruption of the respected values.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 0617a957559b..1855b5fc76da 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -681,12 +681,14 @@ struct regmap *__regmap_init(struct device *dev,
 			     const char *lock_name)
 {
 	struct regmap *map;
-	int ret = -EINVAL;
 	enum regmap_endian reg_endian, val_endian;
 	int i, j;
+	int ret;
 
-	if (!config)
+	if (!config) {
+		ret = -EINVAL;
 		goto err;
+	}
 
 	map = kzalloc_obj(*map);
 	if (map == NULL) {
@@ -1604,8 +1606,7 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 {
 	struct regmap_range_node *range;
 	unsigned long flags;
-	void *work_val = map->work_buf + map->format.reg_bytes +
-		map->format.pad_bytes;
+	void *work_val;
 	void *buf;
 	int ret = -ENOTSUPP;
 	size_t len;
@@ -1688,6 +1689,7 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 	 * buffer to write.  Since register syncs often generate raw
 	 * writes of single registers optimise that case.
 	 */
+	work_val = map->work_buf + map->format.reg_bytes + map->format.pad_bytes;
 	if (val != work_val && val_len == map->format.val_bytes) {
 		memcpy(work_val, val, map->format.val_bytes);
 		val = work_val;
@@ -2291,8 +2293,8 @@ EXPORT_SYMBOL_GPL(regmap_fields_update_bits_base);
 int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 		     size_t val_count)
 {
-	int ret = 0, i;
 	size_t val_bytes = map->format.val_bytes;
+	int ret, i;
 
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
@@ -2302,6 +2304,8 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 	 * single write operations.
 	 */
 	if (!map->write || !map->format.parse_inplace) {
+		ret = 0; /* Later error paths rely on this */
+
 		guard(regmap)(map);
 
 		for (i = 0; i < val_count; i++) {
@@ -2739,12 +2743,12 @@ static int _regmap_bus_read(void *context, unsigned int reg,
 {
 	int ret;
 	struct regmap *map = context;
-	void *work_val = map->work_buf + map->format.reg_bytes +
-		map->format.pad_bytes;
+	void *work_val;
 
 	if (!map->format.parse_val)
 		return -EINVAL;
 
+	work_val = map->work_buf + map->format.reg_bytes + map->format.pad_bytes;
 	ret = _regmap_raw_read(map, reg, work_val, map->format.val_bytes, false);
 	if (ret == 0)
 		*val = map->format.parse_val(work_val);
-- 
2.50.1

