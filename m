Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583960;
	b=mWVXPAZX7wrTDaKrpUa2X+jLiQzrvdDvbAxbkLqQlORQB/8zgG5Qo+ArmqDuqRNAvG72
	 TwKqi/RpbvRPldyHhS+mYCRupzAKyYKnKbDEgZ1Hi7k23pwdIJ5w34o9zQaq6OyxrByK0
	 YZSC2kzZMo7S/cTr9fqyhBCEOuTyPV/XL52TVO5GPtqc1d5/4Jt3KDdkGl7TFfRt1Qz+4
	 zgBx6J2EDJtk8VzTRyhVI4XaqvRWPDTtMPaotpmiz69WEZXTo0WEfkeedAGh6Ey478vgh
	 3gA1H88UWEwQA4dWrXuU2e5M28b3JCAaE/y2lBmLHkfiuwRO14ZAOjhvt4O/vq9rUNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583960;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=00CVNfr5ILprZDbVXQqeSmMNoQKMXyjEyCoT9rZckPQ=;
	b=n3QtaJdtgooxKRaHxVusghgRNU2mX91e/YE6hyVCHlBl+mG+nTJHKLsELro/HK8+0L2E
	 qGarDBFzgE1RXAs+EhRNm2tOEm3zPkI1F/YU5ulGcI+siBnMclbnszEjgQAPLJmlxOLpt
	 cUhtJuBorjnhe9S4rfJLmpgbsnmLTW3QNv05h93u7G+XEP6A9Yjeprkg+wA6e+PpDxpZH
	 DwxLHnBtiG8ywunE4bSIiNzrCEHr7XuQI705KHPNAnqmQdi9vFLpdT7pJAfRE2O7R8ruV
	 aeTFsmEf36V+LbiZSvWAYSyYZ3IadfbEyglTXBhbHR4ISziv00bHtAiLoNUswXIogIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PVeIJmEb;
	arc=none smtp.remote-ip=95.215.58.52
Received: from mta1.migadu.com (out-52.mta1.migadu.com [95.215.58.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90E3606A884
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90E3606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=PVeIJmEb
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=9f1XSy3BPkKq6c8MJeVMthJXgZnAFR2KD4RdsfZAoGg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583958; v=1; x=1795188758;
 b=PVeIJmEbNqi2IW/ENSOXlcZkoYYimOhIVrGgVRDJHhHjtdmYN/mHnFjxfFn4WpbyUCEbHkJ4
 o9v/DyGt7W76ZcqmEMo7n5zpKWDkETX5FZTiSlFyaFITjxwpADD8zEhCB3Vm5nl6HaEM3MeKlHr
 jeTVzKvitkPVgZg4fLigoaKQ=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8d0a250d954252d7;
	Fri, 13 Nov 2026 15:32:37 +0000
X-Mizu-Trace-ID: 8d0a250d954252d7
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:57 +0800
Subject: [PATCH v2 09/10] regmap: use cleanup API in __regmap_init()
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
Message-Id: <20261113-regmap-improve-v2-9-5dfd6a89078f@nxp.com>
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

Convert the error unwinding in __regmap_init() to the scope-based
cleanup API and drop all of the err_* labels. A dedicated
regmap_init_release() helper unwinds a partially initialised map in the
same order as the old labels.

The err label only returned ERR_PTR(ret) after the per-device bus
allocation was removed, so the two early failure paths now return
directly as well.

regcache_exit() requires an initialised cache, so map->cache_type is now
set right before regcache_init() instead of during the initial map setup
and reset to REGCACHE_NONE if regcache_init() fails. This makes
regcache_exit() safe to call from the cleanup path at any point. Nothing
between the old and new assignment reads cache_type.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 69 +++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 36 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 04cbf15adcb0..8a68c9bcebc8 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1037,6 +1037,22 @@ static int regmap_init_format(struct regmap *map,
 	return 0;
 }
 
+static void regmap_init_release(struct regmap *map)
+{
+	if (!map)
+		return;
+
+	regcache_exit(map);
+	regmap_range_exit(map);
+	kfree(map->work_buf);
+	if (map->hwlock)
+		hwspin_lock_free(map->hwlock);
+	kfree_const(map->name);
+	kfree(map);
+}
+
+DEFINE_FREE(regmap_init_release, struct regmap *, regmap_init_release(_T));
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -1044,30 +1060,25 @@ struct regmap *__regmap_init(struct device *dev,
 			     struct lock_class_key *lock_key,
 			     const char *lock_name)
 {
-	struct regmap *map;
 	bool fast_io;
 	int ret;
 
-	if (!config) {
-		ret = -EINVAL;
-		goto err;
-	}
+	if (!config)
+		return ERR_PTR(-EINVAL);
 
-	map = kzalloc_obj(*map);
-	if (map == NULL) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	struct regmap *map __free(regmap_init_release) = kzalloc_obj(*map);
+	if (map == NULL)
+		return ERR_PTR(-ENOMEM);
 
 	ret = regmap_set_name(map, config);
 	if (ret)
-		goto err_map;
+		return ERR_PTR(ret);
 
 	fast_io = (bus && bus->fast_io) || config->fast_io;
 
 	ret = regmap_set_lock(map, config, fast_io, lock_key, lock_name);
 	if (ret)
-		goto err_name;
+		return ERR_PTR(ret);
 
 	/*
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
@@ -1119,7 +1130,6 @@ struct regmap *__regmap_init(struct device *dev,
 	map->writeable_noinc_reg = config->writeable_noinc_reg;
 	map->readable_noinc_reg = config->readable_noinc_reg;
 	map->reg_default_cb = config->reg_default_cb;
-	map->cache_type = config->cache_type;
 
 	spin_lock_init(&map->async_lock);
 	INIT_LIST_HEAD(&map->async_list);
@@ -1148,7 +1158,7 @@ struct regmap *__regmap_init(struct device *dev,
 					 REGMAP_ENDIAN_NATIVE,
 					 REGMAP_ENDIAN_NATIVE);
 		if (ret)
-			goto err_hwlock;
+			return ERR_PTR(ret);
 	} else if (!bus) {
 		map->reg_read  = config->reg_read;
 		map->reg_write = config->reg_write;
@@ -1172,45 +1182,32 @@ struct regmap *__regmap_init(struct device *dev,
 					 regmap_get_reg_endian(bus, config),
 					 regmap_get_val_endian(dev, bus, config));
 		if (ret)
-			goto err_hwlock;
+			return ERR_PTR(ret);
 	}
 
-
 	ret = regmap_init_ranges(map, config);
 	if (ret)
-		goto err_range;
+		return ERR_PTR(ret);
 
 	if (bus && bus->init_limits)
 		bus->init_limits(map, config);
 
+	map->cache_type = config->cache_type;
 	ret = regcache_init(map, config);
-	if (ret != 0)
-		goto err_range;
+	if (ret) {
+		map->cache_type = REGCACHE_NONE;
+		return ERR_PTR(ret);
+	}
 
 	if (dev) {
 		ret = regmap_attach_dev(dev, map, config);
 		if (ret != 0)
-			goto err_regcache;
+			return ERR_PTR(ret);
 	} else {
 		regmap_debugfs_init(map);
 	}
 
-	return map;
-
-err_regcache:
-	regcache_exit(map);
-err_range:
-	regmap_range_exit(map);
-	kfree(map->work_buf);
-err_hwlock:
-	if (map->hwlock)
-		hwspin_lock_free(map->hwlock);
-err_name:
-	kfree_const(map->name);
-err_map:
-	kfree(map);
-err:
-	return ERR_PTR(ret);
+	return_ptr(map);
 }
 EXPORT_SYMBOL_GPL(__regmap_init);
 

-- 
2.56.0

