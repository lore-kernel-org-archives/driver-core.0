Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738F53B3BF3
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 05:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092888; cv=none; b=IHgGh3iyrYYzHmSOpwTVGT6010ljxydzE+vtO/ZKBZiYT8YQ4NpAKpkARSWg5YlSGeDF833mow78//yErL1AddzKoO965tElc/ayqVWdQDi6Ip6P9tShr8H5478tnZwlogVXvOQTde+F9h6QuCIIBIkOJ6je32y8lFwCp7UphtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092888; c=relaxed/simple;
	bh=QAy3B3MklhFRzHR5NCSvyukg6irF2NiZNYxJpFKqBwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i81GD2jAibT3BDvksWUqjqx3cK2U254fndjB8pn9MBNEZf+TMJ0M39k4Ek8/DJfaEEnA/jM/dbqhY1fOFcC0PMQrSllb+1+HZi3+UBljFriuwXpa/8L8dhKClNpGOqJq+Y4pJTH/6GrvOdwhb86s8x7NwiNeoK4J9eW1B83rhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OiWkIZT5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiWkIZT5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso4942685a91.2
        for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 22:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092887; x=1784697687; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xva9OEHtElI637gwa1y8PL7T5tTmT5JPvH9nn3h7WxM=;
        b=OiWkIZT5nWXJB/qNMmTyQ7MLvERGvfH273t9A6MgJEC0R7YafTVbQlFhtGihpqOkEM
         wso8DAuRWq9o2FL2be6ziz7xv2tJdrEiYAIMQ8zE3pEMhWLluO2GH/nhl4IUQYCtu2Gx
         Sua6jVUw1ivsVUsV50Ed9jXeXPGDakBa4c/bQlYOJhzAE66mlUoeinrXJOR9WjV2b1eF
         4a0Mx3AljTOatx4mZM1aNArzxVVTPn4iWolCLFcHrBslBQzwGqtVQZsh04KLP+m/nbLP
         jLP7z9QMwHvItb0zlRtDXPrBmIptcFlHtSfzg3Ypf5eR34Vegpe7ok44Wb/SxNB+4kg6
         T7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092887; x=1784697687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xva9OEHtElI637gwa1y8PL7T5tTmT5JPvH9nn3h7WxM=;
        b=hua3F91mhz1UXdrlaVRh4yLzmKbbEoyNO1u8FZY/g03/4fWO26URibn4A8qsqwkBQa
         FLgeWard/UdE+gye6q/lH7NzoHcEba06peZQyQ5VKe4kBmr/zo4AwKRiTm6RszDR7MH3
         dsjmaxg1SKOtUuaUWmH63JhBxW8IH6SOkh0F45CobkJq4CUHjQLFoU+Dy69LIacMti0s
         ayuM+RfVTVWfPZSConMj+5veogaIQ3uwWvBXv3352MedxLStXs65J29iDYH6AqwRbaWF
         B6Vyhz12n3LKtPjhhdIg170FsUfqedUeC1ZOFBilMUD9UxzvH2b3v71w828TcGppWK9W
         z6Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rp0EgE3U5glNE65xL8gs2iCVqYUY1y8remCpR2IGx2CBTYbATMnXcdCGiKP9CQco+rzXBDS5EesC85p1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAYc3MYgNv4H/dR/YL+800SdN/ZBnisdjCIWcd6iqvsNbk2urN
	jdJbpMqdflyXXFwxqR7iG/NLwxZP7k4ELDqfSwnrj9DAPDPrDec1kF9l
X-Gm-Gg: AfdE7ckVU3BOkG5p0S9SYIXehwYKboZ2Yl8ZUP+wO1Ime+QiKM1VTE359YJ8FhN3Gsb
	pH6EGm6kRvZ+M6LYGdW/tKyKdPwKTseO6DyeincuyK5TRG2JTh6igEeIWd8JvhT4FVxR3d8jgXX
	+6uFT46DmhZn2X+Bqi3wFTyvOkjmwy/4Fun+VeXSS8zpm9b+aL+w7guNZuJLguLBSRrFWMEKjc+
	Yb/NIc6CMyzAZvIDeDkG2z8KsPCuGXqyJqwlfuPb1IEY0b1838brdCwK4OkG88EWxOCFAdSD6hg
	pCtjIvfsA9lGjpM7Do1kX35VZEMnvNSrpERzktckmyE+8pipECHKI3N3IwLhn5DcO+SzQ50mhJT
	gRdWGDnWwOo7wnn2sF+3QwzGDvijH8QFyimz8iXNOeaG7LnXTvVPK5QVuQwVYqelettRzd6VkoA
	wO/SoNnzXtH/di80bVEh5VfTVofad/jzDF2I2AuZ1vfqjSrwQ=
X-Received: by 2002:a17:90b:380a:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-38e2a0016a6mr1302665a91.19.1784092886758;
        Tue, 14 Jul 2026 22:21:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e1730acfesm2419782a91.14.2026.07.14.22.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:21:26 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] regcache: Warn if regcache_sync() is called in cache_only mode
Date: Wed, 15 Jul 2026 12:21:00 +0700
Message-ID: <20260715052100.24983-1-phucduc.bui@gmail.com>
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
 drivers/base/regmap/regcache.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 96cdae25b9c4..d786cc8bf4d8 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -397,6 +397,10 @@ static int rbtree_all(const void *key, const struct rb_node *node)
  * volatile.  In general drivers can choose not to use the provided
  * syncing functionality if they so require.
  *
+ * This pushes cached changes made while cache_only (e.g. suspend) down
+ * to hardware. The caller must clear cache_only first, or writes will
+ * only update the cache.
+ *
  * Return a negative value on failure, 0 on success.
  */
 int regcache_sync(struct regmap *map)
@@ -411,6 +415,9 @@ int regcache_sync(struct regmap *map)
 	if (WARN_ON(map->cache_type == REGCACHE_NONE))
 		return -EINVAL;
 
+	if (WARN_ON(map->cache_only))
+		return -EINVAL;
+
 	BUG_ON(!map->cache_ops);
 
 	map->lock(map->lock_arg);
-- 
2.43.0

