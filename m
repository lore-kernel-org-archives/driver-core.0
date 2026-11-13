Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583949;
	b=VjiZ7RTwFbP7h+tesM5oj0yLMcPSCJrQ0HpTI4xoYC4Y9/hVvnE4SYNQSJRPG+OwNxaF
	 hY6RvTLv5UwDV42mUgTt6D6XnjiVH5CdzvB/IYNb80ENV/XZ+REt2Ejw9oYLmS3fOyReO
	 bQ3JJnGmWr5ktIo4L6rwoNYfq2AwNAyhFo1IcEpuh5Obd7LzUlOdgiZed+optIul3Lpuq
	 ZG9VSNSi1HmFidcnGrupgAWUtep8Ivyllw2/CZqvxlGBaWZc+TOFyxsj9VxR6v5uH3MW9
	 fhDMxM934v48PuMD74xBwCmUKOzhNPDG9MFPBp+vODp1UAeajinO4TisM9lqs0SgZew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583949;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=qGZOexHAsmLP7sOQKMVbtdoZtQ5oYYFvAfxYEJxkGvE=;
	b=IEVIXc9kfwusGCeDoVcUi7sXArXKeyAkxEH+Tw6fUZbqQnZzaYOzeqM2Spu9xUCA0noz
	 JxXxgWCkM+FGPBWeu20M5uOu4jwVV4EmmYeuRcNtPlXJ36HiQ7Pa9+4ImBPPeyEAkETDg
	 Wyt0Zk6MSnw5LJMjhlAMMEtmeGkH6kiTp4MMxX5c10C73W2pWbWv/iL6b47FZlOyy7jA5
	 JtCh+vOFvs/OqFuoC7PPpVNi5yD9oYi3dy3NlPH84I5xAsD9/7POu0lpO6jc4ADih5r1E
	 iewycEGyscAdTTi/l08f+s9iIjU2bK/+o0JQDB9OQxtHTTzFwOXep51cYS0O7Hgnnqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MqIDjjKG;
	arc=none smtp.remote-ip=91.218.175.77
Received: from mta0.migadu.com (out-77.mta0.migadu.com [91.218.175.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A7606A8BC
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 883A7606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MqIDjjKG
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=y85iK7U/g3/76IgKwKOS2Ane24vkf/ElHyE3uSBtt1g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583946; v=1; x=1795188746;
 b=MqIDjjKGp6dbMQcS1EBpvjkTJ/q6k3rVHh3CkjO3jLU0ols8TBmH1LqfLr5wvWXw76/kbHzC
 kSfiJYbNT4OPm1XiJslyIUq11gRQS892aEtZliFUMqafYxH5bR9ACqAFH9zPTrVP4AbBjMukrhu
 BdY5xj3Kd1a4LyRte5ol8c7o=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 15dd34a88933f3a7;
	Fri, 13 Nov 2026 15:32:26 +0000
X-Mizu-Trace-ID: 15dd34a88933f3a7
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:54 +0800
Subject: [PATCH v2 06/10] regmap: factor out regmap_init_ranges()
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
Message-Id: <20261113-regmap-improve-v2-6-5dfd6a89078f@nxp.com>
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

Move the register range validation and rbtree construction loop out of
__regmap_init() into a dedicated regmap_init_ranges() helper. This is a
mechanical code movement with no functional change apart from fixing the
block comment style of an existing comment that checkpatch flags when it
appears in the diff context.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 192 +++++++++++++++++++++++--------------------
 1 file changed, 101 insertions(+), 91 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index aca63b0d03e0..eaf7555f9765 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -748,6 +748,104 @@ static int regmap_set_lock(struct regmap *map, const struct regmap_config *confi
 	return 0;
 }
 
+/* Validate config->ranges and build the range rbtree. */
+static int regmap_init_ranges(struct regmap *map, const struct regmap_config *config)
+{
+	int i, j;
+
+	map->range_tree = RB_ROOT;
+
+	for (i = 0; i < config->num_ranges; i++) {
+		const struct regmap_range_cfg *range_cfg = &config->ranges[i];
+		struct regmap_range_node *new;
+
+		/* Sanity check */
+		if (range_cfg->range_max < range_cfg->range_min) {
+			dev_err(map->dev, "Invalid range %d: %u < %u\n", i,
+				range_cfg->range_max, range_cfg->range_min);
+			return -EINVAL;
+		}
+
+		if (range_cfg->range_max > map->max_register) {
+			dev_err(map->dev, "Invalid range %d: %u > %u\n", i,
+				range_cfg->range_max, map->max_register);
+			return -EINVAL;
+		}
+
+		if (range_cfg->selector_reg > map->max_register) {
+			dev_err(map->dev,
+				"Invalid range %d: selector out of map\n", i);
+			return -EINVAL;
+		}
+
+		if (range_cfg->window_len == 0) {
+			dev_err(map->dev, "Invalid range %d: window_len 0\n",
+				i);
+			return -EINVAL;
+		}
+
+		/*
+		 * Make sure that this register range has no selector
+		 * or data window within its boundary.
+		 */
+		for (j = 0; j < config->num_ranges; j++) {
+			unsigned int sel_reg = config->ranges[j].selector_reg;
+			unsigned int win_min = config->ranges[j].window_start;
+			unsigned int win_max = win_min +
+					       config->ranges[j].window_len - 1;
+
+			/* Allow data window inside its own virtual range */
+			if (j == i)
+				continue;
+
+			if (range_cfg->range_min <= sel_reg &&
+			    sel_reg <= range_cfg->range_max) {
+				dev_err(map->dev,
+					"Range %d: selector for %d in window\n",
+					i, j);
+				return -EINVAL;
+			}
+
+			if (!(win_max < range_cfg->range_min ||
+			      win_min > range_cfg->range_max)) {
+				dev_err(map->dev,
+					"Range %d: window for %d in window\n",
+					i, j);
+				return -EINVAL;
+			}
+		}
+
+		new = kzalloc_obj(*new);
+		if (new == NULL)
+			return -ENOMEM;
+
+		new->map = map;
+		new->name = range_cfg->name;
+		new->range_min = range_cfg->range_min;
+		new->range_max = range_cfg->range_max;
+		new->selector_reg = range_cfg->selector_reg;
+		new->selector_mask = range_cfg->selector_mask;
+		new->selector_shift = range_cfg->selector_shift;
+		new->window_start = range_cfg->window_start;
+		new->window_len = range_cfg->window_len;
+
+		if (!_regmap_range_add(map, new)) {
+			dev_err(map->dev, "Failed to add range %d\n", i);
+			kfree(new);
+			return -EINVAL;
+		}
+
+		if (map->selector_work_buf == NULL) {
+			map->selector_work_buf =
+				kzalloc(map->format.buf_size, GFP_KERNEL);
+			if (map->selector_work_buf == NULL)
+				return -ENOMEM;
+		}
+	}
+
+	return 0;
+}
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -758,7 +856,6 @@ struct regmap *__regmap_init(struct device *dev,
 	struct regmap *map;
 	enum regmap_endian reg_endian, val_endian;
 	bool fast_io;
-	int i, j;
 	int ret;
 
 	if (!config) {
@@ -1078,96 +1175,9 @@ struct regmap *__regmap_init(struct device *dev,
 
 skip_format_initialization:
 
-	map->range_tree = RB_ROOT;
-	for (i = 0; i < config->num_ranges; i++) {
-		const struct regmap_range_cfg *range_cfg = &config->ranges[i];
-		struct regmap_range_node *new;
-
-		/* Sanity check */
-		if (range_cfg->range_max < range_cfg->range_min) {
-			dev_err(map->dev, "Invalid range %d: %u < %u\n", i,
-				range_cfg->range_max, range_cfg->range_min);
-			goto err_range;
-		}
-
-		if (range_cfg->range_max > map->max_register) {
-			dev_err(map->dev, "Invalid range %d: %u > %u\n", i,
-				range_cfg->range_max, map->max_register);
-			goto err_range;
-		}
-
-		if (range_cfg->selector_reg > map->max_register) {
-			dev_err(map->dev,
-				"Invalid range %d: selector out of map\n", i);
-			goto err_range;
-		}
-
-		if (range_cfg->window_len == 0) {
-			dev_err(map->dev, "Invalid range %d: window_len 0\n",
-				i);
-			goto err_range;
-		}
-
-		/* Make sure, that this register range has no selector
-		   or data window within its boundary */
-		for (j = 0; j < config->num_ranges; j++) {
-			unsigned int sel_reg = config->ranges[j].selector_reg;
-			unsigned int win_min = config->ranges[j].window_start;
-			unsigned int win_max = win_min +
-					       config->ranges[j].window_len - 1;
-
-			/* Allow data window inside its own virtual range */
-			if (j == i)
-				continue;
-
-			if (range_cfg->range_min <= sel_reg &&
-			    sel_reg <= range_cfg->range_max) {
-				dev_err(map->dev,
-					"Range %d: selector for %d in window\n",
-					i, j);
-				goto err_range;
-			}
-
-			if (!(win_max < range_cfg->range_min ||
-			      win_min > range_cfg->range_max)) {
-				dev_err(map->dev,
-					"Range %d: window for %d in window\n",
-					i, j);
-				goto err_range;
-			}
-		}
-
-		new = kzalloc_obj(*new);
-		if (new == NULL) {
-			ret = -ENOMEM;
-			goto err_range;
-		}
-
-		new->map = map;
-		new->name = range_cfg->name;
-		new->range_min = range_cfg->range_min;
-		new->range_max = range_cfg->range_max;
-		new->selector_reg = range_cfg->selector_reg;
-		new->selector_mask = range_cfg->selector_mask;
-		new->selector_shift = range_cfg->selector_shift;
-		new->window_start = range_cfg->window_start;
-		new->window_len = range_cfg->window_len;
-
-		if (!_regmap_range_add(map, new)) {
-			dev_err(map->dev, "Failed to add range %d\n", i);
-			kfree(new);
-			goto err_range;
-		}
-
-		if (map->selector_work_buf == NULL) {
-			map->selector_work_buf =
-				kzalloc(map->format.buf_size, GFP_KERNEL);
-			if (map->selector_work_buf == NULL) {
-				ret = -ENOMEM;
-				goto err_range;
-			}
-		}
-	}
+	ret = regmap_init_ranges(map, config);
+	if (ret)
+		goto err_range;
 
 	ret = regcache_init(map, config);
 	if (ret != 0)

-- 
2.56.0

