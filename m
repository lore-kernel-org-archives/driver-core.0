Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDC8634C
	for <driver-core@lists.linux.dev>; Thu, 28 May 2026 05:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946341; cv=none; b=RqoM3CYJb36yUk0rttDEqJG/LT7QGtBf8syvC4vFTxpt4W0GA8OgPJDK7jl7K/vw0YduzpPyt5FvhzMbCWmJXl3/STLIVh2FybAbxXZ+zlBXob2ePxQqkMBt2bVoEkV2pN5/j0BtVpflY95aW4ku+1D5VnL20zlpeYVePhtIkyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946341; c=relaxed/simple;
	bh=5QXLvT5Qaze0XfDinDuIPEU6u8HNpeMVVd/w/JHQ/90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8NXSSgEshn5bKH51iWScrZTsAGflrbYUP9GlVRDm9+flaOtyHIXSCFNiuOyA/0eZK2FJvmpRuq+Dzi1Z1cHT7/ywcrM+ZOC2Ioc3Rncmw1QwvmGETeLDzErpEvDLJ02qnz/4pM3x94g/8tpEGI/a3FqdLdnHF0qP+fJownJflA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCcnF9U0; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCcnF9U0"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c8026aa4d53so8996198a12.3
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 22:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946340; x=1780551140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QTFk96WD/mDvsuOxsaQzMcg9DBpgS3bUxpPfnb/QrVA=;
        b=YCcnF9U0PLoFf5dn6kXqLz1uVDSWHtlSTiboJswK+qQsCS1o86DbMvdk+Xx5Kj4Tm+
         L03cjr223W+cb1Sn28Wg9G7t3FYX+SYBqjmJIc8iZ9TRo21maQTyqFXll73x3ipJFpWv
         UuJAIXJ5T8NBCmicPWDcyPXtCwMtwhQe2wcm8tefbJnEYgsBJANPNf05A+yyhVMsPjnd
         BWqmZ8Uqu1PTg/Gg3Q2N7Hdi6sY6Qn2Nz/UTa8m0xYxR+WmIWX3edZ7ya5Ybbe3Zg34U
         yCgNfpPWl6zWNForB19GZaWM5R7AEFY7l7JD/orvHH9ee8RN76NpwtOnwOdoFtmU70bL
         aIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946340; x=1780551140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QTFk96WD/mDvsuOxsaQzMcg9DBpgS3bUxpPfnb/QrVA=;
        b=nN8Ba76IAFdvlU02iA4PJYpPudb1kqx5DSiv+Rp3mkcLe+cDSCGEZw9qwyaRF0JTiP
         YTldZ1UVwxBr6uptrfUWYlFaBdsoANdeLC3UA6XFKqEHBKXaT7gWypaACcas3BnnR4ba
         YqbaddjZoQPNosxN9Wb5Wm9YTz0bZHrpnjZuvaiqAMwT4EJNSst59GYDQOCQu9uAgQA2
         nQjHOX09O76OWyxHxBJKWRh89wMhDjiV8GEc/EEIgIJPWCXkp/YYR6uG63OiBPLDl5UA
         VJaE0bnzudAJcBK7OSttvHD3ZxERKupBpVYAQpWRHUDnNRZ6NSVnfgKuGg2/HXrL/bec
         7QIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ckyC8/24MStVOdRBVoGKP+nw1lI4GYwTFMryfNc4D58Pyprs10wtLvVqJLz/c1bPx6EHTkSbglW/YKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YydHmy5Xg0mWzeaA/DabnLQ2FSfEfXaFNbicEVmQhPYtV/7vHqi
	z9uFyJLo/v5X8x+2ecJ0QrE9LUPFdRxjEOZhmRbrNyuZkhfL0YgPZRiK
X-Gm-Gg: Acq92OHABNsqar5zVOXvgqDbEDLXidB5VcELFWkTUGobu7mW8PhfkmoQov9xZYkSTTz
	jySgtd8FSrSS1Kcwh0l/6EqQoqh+AXcJwIHX/rliGncHKUifSA/IUcXWLBwFgX6zJzFC92t5oLK
	69eemF0y4iw5Ua1uijcMhFwF3PKMk4iqbrjRpwCJXBD3cMG+Fi4rFgWkAWKUWsPy0KefT7pNmrC
	mfUfuTWlJzTS1KNfk6U/O6gM4Rc0Fg+QCmWHeGkpirvemMUvGiRWvFvmM2ejwhQNNucI/5S/Eo+
	IVN3cJ57qwPcojPd0bGnaJ+S9ZfSU1/JIhm55CW7v6fEY8XZmhFrwI5oiRdmfX7RlzI9matdEs9
	JevegsOktDaJszOhMcT/recqQmj+dPtW1blz/4o5ABjxeCXopI57ubUF0B3z5sO2hhjeE9pxW98
	ZJ3W2aJprfDO6pBOSpZVbUmnJ4a/G1jcKLxXsBcnBaA2TBFufmwUtcf3HRCSPz1/t072c0
X-Received: by 2002:a05:6a20:9396:b0:39e:f994:f697 with SMTP id adf61e73a8af0-3b328d15e01mr27437264637.17.1779946339907;
        Wed, 27 May 2026 22:32:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b91c6sm13929495a12.14.2026.05.27.22.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:32:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] regmap: reject volatile update_bits() in cache-only mode
Date: Thu, 28 May 2026 12:32:04 +0700
Message-ID: <20260528053204.46783-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Prevent _regmap_update_bits() from accessing hardware when the register
map is in cache-only mode.

Unlike regmap_raw_read() and _regmap_read(), the volatile
_regmap_update_bits() fast path bypasses the cache_only check. This can
result in unexpected hardware accesses while the device is suspended.

Return -EBUSY to ensure behavior is consistent with other cache-only
access paths.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Compile-tested only.

 drivers/base/regmap/regmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index b2b26f07f4e3..e6e022b02637 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -3257,6 +3257,9 @@ static int _regmap_update_bits(struct regmap *map, unsigned int reg,
 		*change = false;
 
 	if (regmap_volatile(map, reg) && map->reg_update_bits) {
+		if (map->cache_only)
+			return -EBUSY;
+
 		reg = regmap_reg_addr(map, reg);
 		ret = map->reg_update_bits(map->bus_context, reg, mask, val);
 		if (ret == 0 && change)
-- 
2.43.0

