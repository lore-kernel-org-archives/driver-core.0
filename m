Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860073955E1
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 03:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518375; cv=none; b=huZUHUZD6IVW5tsyNbcBkNv8aeRhc3NpXVEz/veNXrBISCIlZcOyMrpheUrXYbe3bUhfnmPUxwGh5DTddbn6AQf1SeDl/TKwz7/tGt1OgXMz82VRv8iMQ01Fhl0/Pgd08PYEMDiGTusctYkrmPaP3hXEKvjwVU4ipQXGQq66Blk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518375; c=relaxed/simple;
	bh=MMy/vbVfr3B+dLM0u9wadbYLIA0z/pPtdHxj4yVCYK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1Q+sxzi8m4CNHj6ocXSUTEJE1PRvma8xRq09Sat6bfM80hA72HrunIvo+Yi8WY7itoqUW5Whv8PKdC0y/FtMs5jFKB3gV8Mjertz0buDr2RlyO0JHwIBdBm+KtHrowQUcKIW5X/C2Asc6qF2QFvO8qmkSNl5qULgplBXHmLNOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibl6GtqV; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibl6GtqV"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so3157124b3a.1
        for <driver-core@lists.linux.dev>; Sun, 19 Jul 2026 20:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784518373; x=1785123173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCrjcYtOPFBhn0Rr/jxmbqZJ8NIIKaPa+hJYbn3tcVw=;
        b=Ibl6GtqVmuvE9KvUmGUqFd9K0iz72p6Y63J1D6Jb5yj6uii6sPAoiuNpQZO0sJzeGw
         RN0AA42qOwLBoFFU0Z5U6WowzZeKJSNeNnAp3lAuMJXjHlDa7ypY3ayxPQBctk7LzkTk
         7ZL73ZcUVw9FrlbgYe1IhRXS9n8hQKoKmzLaHzNz4kkRchjnniPxEUoIhY8d7QO0hHo2
         /gvlRPruvTxvOXlcW2q90u5PWY3o63x1xoLfirA//jMD+DwYEf1TD4orvVKpkCn4PjKS
         Rkiq0TuDsIX9ok9Phdrm63p2A6jojuwOcvjFn/MElRVWYiSXfg4/iZ9SERmEsVmZ9NGA
         3Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518373; x=1785123173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCrjcYtOPFBhn0Rr/jxmbqZJ8NIIKaPa+hJYbn3tcVw=;
        b=N5Z/WmVnt1WCcdOItS3B/ObiakRmrK/UDP2vY8/Z6Esj24tugWURNz47PCV+ZRZA8y
         LxWAZ/pZbVtWQtos67qrBCdzxmldCq0HNMRgH7pFdvlhozqmOaFeneU0WH4T/d3skTqi
         tedCoYuOjb3/k7WAf6WInXvdE/2JwYndQSn5ALY0djtiWm0eKBdGqGVw9SBULZB8gzEY
         RlzsahqXFLKWQJD3+y30WfjrS29dcvCPviYte9A5kSs4KEU/UWZ3h0qHxzfwo6DawUHQ
         d8ugWECk8HX/4wn/9DZObBiLo7fwFqqb1+3Eqd5DpEPkNuNbXAsh+dTk017hzkJ/Jh3r
         zPAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAcNgs2jFico1NLLJiX6VkbbgBLiAivjzezaFP5Vjqq4TMah2uaGikgtBmz/Pm4azXfxFDQycOG8CYyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2ege1UiRA+YB9nh8ZLca9yHhkRYG1LmAyUKWPj+Qh+7Nav1ml
	Ul2HKbGy/2NcuE/zIyMmK8r4QZw2NyzP7KguIa/ODTYDy+2iA2Q+WAUS
X-Gm-Gg: AfdE7ckEw80/ZL1pXmtbOuOYuWyR5jVPm6l3Xge8HQ3EV3WvF8BUx0AA36j6HjkST/X
	S5aT5lrhHG+ChaiKzIe7/o4xNIWYtoYLywND7ZKtBPtujoThBnvGQzJlJP0ZuQM21HFsU5ZLlBJ
	ZaDV4Z1gldgtNCDvFDtEB7K5QFPUZAgwP76nqEKEwrgqLQ4AdwkyGrEe0J8z/5Ek+yIRoix/beB
	/EjLQxv2mBNnDyHIvAJ5Zhk0YhnJIVmNc3orZBi9GlS8RPvkPpi5zNeZ9uYjq+S+X/zsHFXJSCT
	Zc6UhNY+FTL5s9X5k9Oas9S582wQb2eoYZVULqqTAiUVmiHlI1zsinzPEoTbCSfOGV1aVeIvFya
	9H3aO6I8ojbhdH4W/6W7xnytPmLLAYp+v7DHNnwPWgqR4GHd/ucFUdmZ5y/QpTi/GyGAzyjvza4
	ea9TXTKtcTVEu7Wt7vaiVnH35bz7/66FTEblWR
X-Received: by 2002:a05:6a00:a91:b0:84a:29af:a0eb with SMTP id d2e1a72fcca58-84c285874dcmr11327626b3a.9.1784518372637;
        Sun, 19 Jul 2026 20:32:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e9a3sm4811729b3a.41.2026.07.19.20.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:32:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/2] regcache: Warn if regcache_sync() is called in cache_only mode
Date: Mon, 20 Jul 2026 10:32:37 +0700
Message-ID: <20260720033238.52479-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Calling regcache_sync() while cache_only is enabled is invalid API
usage, since writes are intentionally kept in the cache and cannot
be synchronized to hardware.
Document that callers must disable cache_only before calling
regcache_sync(), and reject incorrect usage with a WARN_ON() and
-EINVAL.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2 : 
 - Check cache_only under the lock.
 - Update the function comment.

 drivers/base/regmap/regcache.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 96cdae25b9c4..20e0641d21b2 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -397,6 +397,10 @@ static int rbtree_all(const void *key, const struct rb_node *node)
  * volatile.  In general drivers can choose not to use the provided
  * syncing functionality if they so require.
  *
+ * This pushes cached changes made while cache_only (e.g. suspend) down
+ * to hardware. The caller must disable cache_only before calling this
+ * function.
+ *
  * Return a negative value on failure, 0 on success.
  */
 int regcache_sync(struct regmap *map)
@@ -414,6 +418,12 @@ int regcache_sync(struct regmap *map)
 	BUG_ON(!map->cache_ops);
 
 	map->lock(map->lock_arg);
+
+	if (WARN_ON(map->cache_only)) {
+		map->unlock(map->lock_arg);
+		return -EINVAL;
+	}
+
 	/* Remember the initial bypass state */
 	bypass = map->cache_bypass;
 	dev_dbg(map->dev, "Syncing %s cache\n",
-- 
2.43.0

