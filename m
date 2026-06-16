Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18E383C65
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610274; cv=none; b=A55gZKzV504nCBd99/srIdrhp6GJiEuxYVE/qJy72LpAEaPElcdRoJVgjd20f/LeooRt0QR0PLOr/f/icXwLt8nlK5/Qzk131ffrfhYVOqqroTYKQlZatogEnhh69nVAldLzBWPblnefQGPMmo8kx81RRgEwzfeqvSOFictyBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610274; c=relaxed/simple;
	bh=aQAERmJfPCm5nxIOgdlfK4MBzHNE5MLOfzqcJBP0AZ8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=LbWVc+4Fo5iV3eID6wA4YvPeq5Xsu3lyrzIiBFKhXwbHIM5Js0m+yNbekSjKjLNMRnjkGGoB7+D4W7Paqi3NTeQX56tBcG8SeubhoC/G8+wfCkZQmNhO2aMGnRYm/AZ9S657LI8/mkOrDAT581sZLCHdK7uWfo6IlqhaJXNIRKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jeb+c6GX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jeb+c6GX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so30975765e9.1
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 04:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781610271; x=1782215071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PveeYdI2S8spK0O7FtsUe3Gj1929XE8sM0pQ+0MZALU=;
        b=jeb+c6GX9FaguD8qSUWvS792Oo4SimbHmKJt12M571CSCY8BktCPhcsW3poIk9gCSE
         06G/mZi+vU6uGhr7e3XiyjOWzR8H4ppw802+/NZjIf3h1+uQON3rXT0uMz+HL1qSaWIZ
         EQgx2VZqeOJVdqthnQfwpotFq+CKn/r+Uwnzi6Ad5LcfqVQwNnSWi28vb00ZO9sjMY3F
         UfDTpRym3NLvUnAUjYCoR7X9N35E/PAfk8mQrpdqqtV+acAFzle9iUkPQAiMhC5SaMNS
         T/RJssaYcD1QtzM6CKgVUky+eSz1FSS7SpYXkM29A4ZT8Be25i2SgeXJ/rto+78faZmk
         qAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610271; x=1782215071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PveeYdI2S8spK0O7FtsUe3Gj1929XE8sM0pQ+0MZALU=;
        b=nxR5jZuzFOHRmgKtlbn4ELL1I3wtCBoUAbiR5cJEvcxx9n/kpf3OKE7MbrTMwAgdK4
         AkUT0ODPq+UrJd94h1eHkrWzdnpk9QDJCOldiUL3XWMrUnxCIajWzSXKtKIz36NwQ3ae
         POM2fq4vHrPXe4iEk7eFi3h2qIT63/5EDxyglH/djdRucctGSvVpB9/McQrqiqxrHOjQ
         uyrpNDt2WN074i4qWsfz8/ROR02M5gsizn0MrAdotgBT/5bTwmO6JqrmJ5nsUWQ378pe
         LDjWCG2EYUYf544kUNKdBgTy0NjjFNJ9OkzTYlT5cx+6H6dW4Ovp6PW02w8SAc/uPwvy
         lL2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9WmLM8qOAo6vscL9CTzsk/uPgxDnaITQvat8dC1U/bObRkgVIMMlotJmaAoSTLPjyc9v2tbIOehWUdtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdeEM0qWvXlRO4STQC4mtpx499B79oD0XKoce7UdvsIWmAmOtS
	/83Bh9iFmP1aZ1D0bzdKQC5R7oZs8cm89Gk1E+caeHjVkz2IHxybavZrNp3fcphzdVo=
X-Gm-Gg: Acq92OFIW2e9scjQtY012EBKFzsY84JaWp3S9Wj7IWONjMc/dwO58SqDnVmmR5sNvdz
	VFy8A7fR14f+qkdhkJvxr7Xl8sdqQX2OAjWkUt0AkU4sa/s5RPmJRL4JgSEcEn/pyekSHzHCguz
	phG+hee4CnwXLmBhkjeh3z+tc35N8ix6PFo4wx7fgkjtVLZqG0YuHTZkm5tjuDHNH/hNasAzRVD
	Dooj9tKhEnidb8wNJ8QgUGZgTGbsoAJBQ6JeV7tjtaQ0+36YTJw6CZTQWRVL5xf2d44n0fFFXbM
	XNg2/yumFAWnfatqy25jq64HdBLqsGWaZEWV7tmRWnV92E22+2ygDYxFWnT8od9rJ0hzuysY3rr
	AUlznTYtBD8mwD8sJmVznqgsMebjHG5mosbv0rqRXppKJxTyPMYJmmKUjKSVxLnQuAH1kzXoEwk
	FjRxYFwjE/tyrefW2PMbxCI/oH5lrtQsdqxhEqYDuu7BHvkdEA
X-Received: by 2002:a05:600c:4fc2:b0:490:5cb3:e94a with SMTP id 5b1f17b1804b1-492200851cdmr203396395e9.2.1781610270949;
        Tue, 16 Jun 2026 04:44:30 -0700 (PDT)
Received: from localhost (mob-176-247-49-54.net.vodafone.it. [176.247.49.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0c10sm44070018f8f.21.2026.06.16.04.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:44:30 -0700 (PDT)
From: Francesco Lavra <flavra@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH] regcache: Do not overwrite error code when finalizing cache after error
Date: Tue, 16 Jun 2026 13:44:29 +0200
Message-Id: <20260616114429.1852456-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1171; i=flavra@baylibre.com; h=from:subject; bh=aQAERmJfPCm5nxIOgdlfK4MBzHNE5MLOfzqcJBP0AZ8=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBqMTaoDL/q8qsVYiJUR0Tm4XZsgXBFpOQbfXOdu lMbKGi2DpWJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCajE2qAAKCRDt8TtzzpQ2 X99FC/9ELJGz4JvqSBCCijiYlefO7sOebTCyBuCrnprgrQjTOXihE8QI0cMdX6MTs6bDTNAxSgz J9jDBdsb6QkZs+k75dVAFtHaDN/xux/upKXLYmZ8kNsEX0Jot5jg9qQ/01+fkGHIvM+VrI8VNgJ mS4KQqJ6w/dDdtBAXtit5mS/jABZmRuzuFGK1RJC1/zhYGFwzjcF2XW6gUSVdXWRk2+SbqkJmNu Ps27hC6kLlfDa2XtZor2uKSa0RkK2tGbM0Ue1QQfL/JeMDX4xPDkUl+VKIqKGbtNVwhqfPZvva2 fZSOksw8zLGj+w6nMftUF87tL8b7QzxEDeWdNpw3jiZwfRU/PTu767HN2Zh/dSlNyTcqN2ckcLN p1C5YehtMXxS4p7U7yqUks3WDOoTUPwYlSR+sJdI4CyUHMVkCkllrhC/xY41UjGYIrADlS0ny5V zkD3t0b66qEgDnm24YJeLF0FHqjke9uANP3PZPJB7Vbiphu9q5wtEN0VHO7KNEsNcTMD0=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

During regcache initialization, if an error occurs in the
cache_ops->populate callback, and if cache operations include an exit
callback, the error code from populate() is overwritten with the return
value from exit(). This hides the error condition from the caller of
regcache_init(), and can cause NULL pointer dereferences when the regcache
is later accessed.

Fixes: 94a3a95f0315 ("regcache: Add ->populate() callback to separate from ->init()")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 drivers/base/regmap/regcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 27616b05111c..aa8f2efed779 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -245,7 +245,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
 		map->lock(map->lock_arg);
-		ret = map->cache_ops->exit(map);
+		map->cache_ops->exit(map);
 		map->unlock(map->lock_arg);
 	}
 err_free_reg_defaults:
-- 
2.39.5

