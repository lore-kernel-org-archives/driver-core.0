Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ADD395AC0
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 03:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518379; cv=none; b=BvCb/8AwG92w4BnoNCjYIV7sXcJ+vmwEZlZmbBaaFch4ZPBexMlMc8n5VgE9LdFma/AIUPUNIrvGKh7iY7tL21uFjRiHlhkCMuGE95Yo7oaqXj6bE9eRCuNTk9YwZ8WSvvl3J5JjwyMoiwm2Iy0I0yw/aIrIen4zQBzp9N76iao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518379; c=relaxed/simple;
	bh=koBUAjPYIgyckiO9BdYJrlAgfeT4d8j66JaJZtde5+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iiKsCmY+iaJXnEKZRzYaVg7/iGhj9v7RivGeYXM8hgSxRzKT73FCs0+c9w7XJYtqVNQn2E0pZfxr2q+xtQaWaBHg+VL4pkwzYRjh55/xbmp+fZz08olCEzLAtJ8or94cocgyjVMjDCHjzlEMdQslQDkaRtRKR8k8R2E0O9k5Y6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipi7BDeq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipi7BDeq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84864086bfeso10229185b3a.1
        for <driver-core@lists.linux.dev>; Sun, 19 Jul 2026 20:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784518377; x=1785123177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIHCEHENMeVKqU/jM7yNT58okou7A+viaNW+Npjyzrw=;
        b=ipi7BDeqVRBynOdNJQ8gDfAP/AeWlQ73yqEsFFiyL7WgEIwMAZtwKfszWxZc6fNUJe
         AK0yGMzIpVHrN8ElG7bs6q8RWwM25fTx6EvdE39vDlAopcSw4aGGxfR6iASRf2yPiI0z
         c4fCaMb7If0AvuQDIiZhFBjSPh6CU1l6HJbl7sIhWfXLByZHUBnsS4pvvocvSrqDZ71c
         aNubZNSUoKoem+AFi1ZPLNa0HFRK+r3ErHPNrX9qRCJ1roqdJf4W5/pZYT6FYLNTanzG
         ROR8WDjn1aDuEkjxVFv8uWEKBmWO5gzF1bMWz+WxHFZtcOtvKKhruksqFHw66e/TJS1i
         JIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518377; x=1785123177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OIHCEHENMeVKqU/jM7yNT58okou7A+viaNW+Npjyzrw=;
        b=Mu7zJdu6KXNlcXfvd4r6ZthAGsATWY+e1U/lG8e+XjN22B8/EQdJZePFdWZwr2fQuo
         CW3LEB6ZzmA3Kq1grgExpmB/uiGT5t9xw5ePU/1ZJcMQTAmAljFwzyBJMs9ZAxE22gVW
         5VXS0D6CWCp4n8sgDC089xyTADjJazrebuBuJsTH2G+65sFJWg3l+aXBqkIdZ4Juob86
         XXOQ34tJuN4r+UuqCBQMeUR9R/fQn6Ch03OFQBRy/anvs1HUPhkAA3ReZx1ajbgvYUsp
         GgQrlUpo0Q8MlE1kyTnXApp558R48dS0o8hYAERXbF28ArBi6NA0A3ZbGg1doGH75Bzt
         OdwA==
X-Forwarded-Encrypted: i=1; AHgh+RpWoiEMSKF7csXf/OCa9QkGIGcs/CunGavwXJe5X4CYCtbiomhVrNqTGNzuO4haMH359MZWgvATR/yJPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCTAfxwLi5+wpuVCJRxVBuLJz3PKyWbbC22qvgXPuqCN72/qbR
	vJIrGXHLxla4xGWX+6je/dWDvMHaEGwXqZ2zkvr1A+J9DgY79y+CVECy
X-Gm-Gg: AfdE7cnzY7ttssd9bSHTj8OgSdVCuq96dipxDcL9x/6J+xRhG/51KcmN2c0oakU2GeY
	d1QdtW2PCrbXvZqiuzD5Hqk+EXeqe16ba0u7fj4A6bjglH9w3kjjcFYHai5zNdeUOtok9K45+dA
	FDllWSOc0xFPDihfZdx66T52wcO0mC7ke/mBDTv5GzL7k4zsEMwz1oFPEOpL7Lb9UaUC4E1eOMg
	DhgQX1i5fG/LF9p8c/bRgwoJpI8bGMzcCivAPSFyDu+ODqkzFoORdHRPTBtAciIKDXJm3oEoGsu
	/6ia+re0WQYpUIid3oa1VovMzAe7pGC2NUR2nh18bk0COYuCglder4Loho6UDpAhtgfSmtO960i
	bbYlEeKHu7O7juQvQ7VXTwTHk/3yFHBKLbL8cSZ8sQtx3sB9i/RPZ4nyFipqm0DFQMnrJGszI+e
	QONNS0vI/Wytsn6qmwb9Z9n+zdqiRJrRdcMBdv
X-Received: by 2002:a05:6a00:228d:b0:847:e791:d5c5 with SMTP id d2e1a72fcca58-84c2948a367mr12437904b3a.35.1784518376744;
        Sun, 19 Jul 2026 20:32:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e9a3sm4811729b3a.41.2026.07.19.20.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:32:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] regcache: Validate cache_only state in regcache_sync_region()
Date: Mon, 20 Jul 2026 10:32:38 +0700
Message-ID: <20260720033238.52479-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720033238.52479-1-phucduc.bui@gmail.com>
References: <20260720033238.52479-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add a WARN_ON() check to ensure regcache_sync_region() is not called
while cache_only is enabled.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/base/regmap/regcache.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 20e0641d21b2..be167ee6f57c 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -518,6 +518,10 @@ int regcache_sync_region(struct regmap *map, unsigned int min,
 
 	map->lock(map->lock_arg);
 
+	if (WARN_ON(map->cache_only)) {
+		map->unlock(map->lock_arg);
+		return -EINVAL;
+	}
 	/* Remember the initial bypass state */
 	bypass = map->cache_bypass;
 
-- 
2.43.0

