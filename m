Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583946;
	b=jRnOvycO0OXINtLuTISIHkHwD5n0r8CJl9c9oruUDTu3rsJcyt6rG23EkCEMG2Z5XM8K
	 RkcyAYxVZmY8798qfd6a+N3zVjopPz7Ao2oVxoQhco87IBnb7WPdV4j78MnINiYXsmSbq
	 txsdb+AyRng3A7BqP4g4ZXkVyhComIoXh+k4FFu1gcjjFa4vKIBc0EX6zlnd/P8rUd+TL
	 UI2mQwjf5zBOxd2EQQNjSLkvQbc3naySwBv8KrZmott5U5Tql6m+hNqQov7T5DEyTeu35
	 0KpaXKHwKWer3ciOLvuBsNlzNsr7hb4Ai4+G3saN2aghDjQC3XhpfPzqZn7XrJQiIKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583946;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=/iTXvqqf7shOJ6B0nPb93+NtEbE0DtMUlczEezHt9nQ=;
	b=0hV/m0RljBtxsjlF4lXZzLZtcjEoWlbNJUG6RoUpXY7SbHf50/EAOXkgoGkpUra5ONs/
	 sRBWPQPPJOahSZMqTR1yNN/1gQicnVFt8+8ARJ08OC0k7cdYVKnyJSH69RSyvBN7j3q3b
	 mh6rdQ8aqqZMIKdmrHm+DqfqU/S1R+GITRBKDKS8RNeFknrgHVpitXioR7HlbRpITOOKQ
	 JY12azRgCszwxHkCI6VfEC1aydEipnXSnlBH2IRCvx9EwuXIt0s+fRvO2G/c2Cv793Qbv
	 so0BSygQ0QyRBCmBLBr7CdmWB5uRkz8XSb4iKFC6ncsLJvTDX1uyvmpszpaU1FzipqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Viiy81Un;
	arc=none smtp.remote-ip=95.215.58.32
Received: from mta1.migadu.com (out-32.mta1.migadu.com [95.215.58.32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3025606A891
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3025606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Viiy81Un
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Msfb0E+31WsQsXbg9uBbOzhcb5X+io24f0jMsqxOdIs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583943; v=1; x=1795188743;
 b=Viiy81Unb6Uxb6ZMlk9MmROa7FoU5kK6j7mALCUnByVJUfOUhfi5mTbsCLrcThYpRa5jw+Uu
 vlC5Fpehg3xv+FXL4n59ZJaKX2s2iJ2GmTTXgrxcHpwzyeJlvE0UjgSnDnW8kTu8MDhEqJYncmi
 rHSsfXEBcD+Nbxx2MxI/LQ8Y=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 215f0f4793e4f09a;
	Fri, 13 Nov 2026 15:32:23 +0000
X-Mizu-Trace-ID: 215f0f4793e4f09a
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:53 +0800
Subject: [PATCH v2 05/10] regmap: factor out regmap_set_lock()
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
Message-Id: <20261113-regmap-improve-v2-5-5dfd6a89078f@nxp.com>
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

The locking scheme selection in __regmap_init() is a self contained
~60 line if/else ladder covering six cases: locking disabled, caller
supplied callbacks, hardware spinlock, raw spinlock, spinlock and
mutex. It has no interaction with the rest of the initialisation
sequence beyond the map and config pointers.

Move it into regmap_set_lock(). The only error case, a failed
hwspin_lock_request_specific(), now returns -ENXIO to the caller
instead of jumping to err_name directly, and each branch returns
early rather than falling through the ladder.

No functional change intended.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 138 +++++++++++++++++++++++++------------------
 1 file changed, 79 insertions(+), 59 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index c123bae8bd66..aca63b0d03e0 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -673,53 +673,33 @@ enum regmap_endian regmap_get_val_endian(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(regmap_get_val_endian);
 
-struct regmap *__regmap_init(struct device *dev,
-			     const struct regmap_bus *bus,
-			     void *bus_context,
-			     const struct regmap_config *config,
-			     struct lock_class_key *lock_key,
-			     const char *lock_name)
+/*
+ * Select the locking scheme for the map. The fast_io argument tells whether
+ * the map has to be usable from atomic context.
+ */
+static int regmap_set_lock(struct regmap *map, const struct regmap_config *config,
+			   bool fast_io, struct lock_class_key *lock_key,
+			   const char *lock_name)
 {
-	struct regmap *map;
-	enum regmap_endian reg_endian, val_endian;
-	bool fast_io;
-	int i, j;
-	int ret;
-
-	if (!config) {
-		ret = -EINVAL;
-		goto err;
-	}
-
-	map = kzalloc_obj(*map);
-	if (map == NULL) {
-		ret = -ENOMEM;
-		goto err;
-	}
-
-	ret = regmap_set_name(map, config);
-	if (ret)
-		goto err_map;
-
-	ret = -EINVAL; /* Later error paths rely on this */
-
-	fast_io = (bus && bus->fast_io) || config->fast_io;
-
 	if (config->disable_locking) {
 		map->lock = map->unlock = regmap_lock_unlock_none;
 		map->can_sleep = config->can_sleep;
 		regmap_debugfs_disable(map);
-	} else if (config->lock && config->unlock) {
+		return 0;
+	}
+
+	if (config->lock && config->unlock) {
 		map->lock = config->lock;
 		map->unlock = config->unlock;
 		map->lock_arg = config->lock_arg;
 		map->can_sleep = config->can_sleep;
-	} else if (config->use_hwlock) {
+		return 0;
+	}
+
+	if (config->use_hwlock) {
 		map->hwlock = hwspin_lock_request_specific(config->hwlock_id);
-		if (!map->hwlock) {
-			ret = -ENXIO;
-			goto err_name;
-		}
+		if (!map->hwlock)
+			return -ENXIO;
 
 		switch (config->hwlock_mode) {
 		case HWLOCK_IRQSTATE:
@@ -737,33 +717,73 @@ struct regmap *__regmap_init(struct device *dev,
 		}
 
 		map->lock_arg = map;
-	} else {
-		if (fast_io) {
-			if (config->use_raw_spinlock) {
-				raw_spin_lock_init(&map->raw_spinlock);
-				map->lock = regmap_lock_raw_spinlock;
-				map->unlock = regmap_unlock_raw_spinlock;
-				lockdep_set_class_and_name(&map->raw_spinlock,
-							   lock_key, lock_name);
-			} else {
-				spin_lock_init(&map->spinlock);
-				map->lock = regmap_lock_spinlock;
-				map->unlock = regmap_unlock_spinlock;
-				lockdep_set_class_and_name(&map->spinlock,
-							   lock_key, lock_name);
-			}
+		return 0;
+	}
+
+	if (fast_io) {
+		if (config->use_raw_spinlock) {
+			raw_spin_lock_init(&map->raw_spinlock);
+			map->lock = regmap_lock_raw_spinlock;
+			map->unlock = regmap_unlock_raw_spinlock;
+			lockdep_set_class_and_name(&map->raw_spinlock,
+						   lock_key, lock_name);
 		} else {
-			mutex_init(&map->mutex);
-			map->lock = regmap_lock_mutex;
-			map->unlock = regmap_unlock_mutex;
-			map->can_sleep = true;
-			lockdep_set_class_and_name(&map->mutex,
+			spin_lock_init(&map->spinlock);
+			map->lock = regmap_lock_spinlock;
+			map->unlock = regmap_unlock_spinlock;
+			lockdep_set_class_and_name(&map->spinlock,
 						   lock_key, lock_name);
 		}
-		map->lock_arg = map;
-		map->lock_key = lock_key;
+	} else {
+		mutex_init(&map->mutex);
+		map->lock = regmap_lock_mutex;
+		map->unlock = regmap_unlock_mutex;
+		map->can_sleep = true;
+		lockdep_set_class_and_name(&map->mutex, lock_key, lock_name);
 	}
 
+	map->lock_arg = map;
+	map->lock_key = lock_key;
+
+	return 0;
+}
+
+struct regmap *__regmap_init(struct device *dev,
+			     const struct regmap_bus *bus,
+			     void *bus_context,
+			     const struct regmap_config *config,
+			     struct lock_class_key *lock_key,
+			     const char *lock_name)
+{
+	struct regmap *map;
+	enum regmap_endian reg_endian, val_endian;
+	bool fast_io;
+	int i, j;
+	int ret;
+
+	if (!config) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	map = kzalloc_obj(*map);
+	if (map == NULL) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = regmap_set_name(map, config);
+	if (ret)
+		goto err_map;
+
+	fast_io = (bus && bus->fast_io) || config->fast_io;
+
+	ret = regmap_set_lock(map, config, fast_io, lock_key, lock_name);
+	if (ret)
+		goto err_name;
+
+	ret = -EINVAL; /* Later error paths rely on this */
+
 	/*
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
 	 * scratch buffers with sleeping allocations.

-- 
2.56.0

