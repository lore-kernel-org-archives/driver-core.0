Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD9F2580CF
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782453878; cv=none; b=QjOu7V25Eff8meAj/rufUlwNufYNVbB0TMFiI4MmbAVvtlw7HJOhUyoTnN189VqdK+GHXlRUdXuyy/twRzF+XTtsNWqJczKnCTRXdtXNmJaVgD6x/QSqdl3cjaZnLL2V4bb9CAm9i/Tchu3Q+BWTMNYRHggoG+Udk7d7k6VRQA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782453878; c=relaxed/simple;
	bh=ShdVa5fWWKPn743dwOzhbW/tUEH/Tbmsc+RjNqdZTDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DX384ayjNjkjgXyWT4lmWjuD2i73aphtTjNiHBeZOZoCk0/GII2kp+9JcpQUjJyh9YtTpFxpEd2quZ8iCn+DCMqn8UgaxJyy5e8Mw3XaSKyA3p5UdI1+aKDUp7D0Myu6zA9vnbFW0W2UPoTIK8tEmDyzTGEqcW6KEvvQ77LulpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=no9ikSFY; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="no9ikSFY"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49249707788so4649925e9.2
        for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 23:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782453874; x=1783058674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lz3PQMovg3lHiCmYmQyRHMZ4BhmAXejzx4VOUB8Gj3Y=;
        b=no9ikSFYznyPOpDZKVobrsJf+hmATeHk5fqwE0sbuoQaQyATwSyQfznehiUMZHykHx
         P7HX7xX3IHx3EAUX2aoL9bdaAGCPHDw+oClAOdm8cc3zkRv5wK6H6Fj7txiSdftyDzWs
         gztILli94fwAE+tI1IIEhaqLe47O0f6GHsX1TgLGku+gziw5sitn514mlkQVXrO7Moul
         H0t1A7zoAP9HoTDWI06rA9WP/tLnogBAu2fEv5t0Copt6C81poMpxKooEIJa7zSZjPE3
         4eu4tQ78AoIdOnQVAQVwtf9PQlnH1vuK3IEIS5LgwJUb9atkw5kyzSEPfgF5LaTKVYie
         tgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782453874; x=1783058674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz3PQMovg3lHiCmYmQyRHMZ4BhmAXejzx4VOUB8Gj3Y=;
        b=phO5nhM+IesYXumzJSN02Vgv7foCOuH9ahTCxaczPpEBEpBfHJtOEBJ/oNGdUJExnS
         UPqUSiIMORlbOAej1jjuuGMavubztqaY4d+7ZqWiiRVZPmX8GmFUOzfACmlnG1oZAD/0
         wO0f07BeSVuqVJIxo/rAJWh4i5IWjVCwvYaAs6Gt61JFEi7ebaM2F0b+keg2VSNWn2bZ
         fZX79EgDS36PI7o8M++MBIZK1cxTqFRwlDhnymSigwN03ShaVnnTHwoUfYUqYoxQkyLC
         kJDZz236YyAxsdwvHa15/neUBr9YDf9Wi2VEV5LZsrLZCo180OhhiiWOBoBDp/c718lv
         wHwg==
X-Forwarded-Encrypted: i=1; AFNElJ+QhAQsQFHzaIEsRgGCHMeYCO83Orv+KIdCgV3faMIYAcwOPGPtY0ZWGqaBfzrkdbolIOnvWQkTfYHaXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6u/Fy2INEJ/cT/jRy4d0Ju3raNjUeXMAtqX3ztFCqiTaIdNI0
	gicCg8uqFhXmywfckGeECQgsBKh2xEwz6mLhd9CHpn3mPYl8M/ak1fXWGaeVQyORAAWA95vwgts
	NUvlA
X-Gm-Gg: AfdE7cmVL2O71UCDTl2G8T2U+aZUulLCUI0P2jOzcvlm93LBRkxfgLg/ww6t4ZF0hS/
	pQWRKqG8HAExXIXPyU5JYTTDPNEithM/94F9lyGHYq6JNa1C04L8aOnljYSDoc0VJdZqUufCzJv
	XX1OpWLSWIZWa7jWwor6scgmcyM/1kqeehqIkH3ISF41A4XBUze4QiFkcL8HU5hINKf+F+XT/Sa
	9zPqIAcLqOeKMgh59mk8JRW/6ni7Z4kjlhh/ptpF1cCKuB7/Nu1iRRiKasuoku6ZRle05n+hoa5
	JLcfBBuhGhIoXB1tytK/f0uM7MLJA05lWxYztELRwwF/hUY7M+fyFdlCFmjMGgs3vU5fL9xrcZi
	XtmL0Xc7dnTr54DolpL9Zfn+nX3HRMpgIeEhyf0DgKgkpDFhn0jv5za8REshTjOeqsbuJ3eqddu
	2Uzktlz6VxBw9h4pRREA==
X-Received: by 2002:a05:600c:a012:b0:490:b9c3:6c48 with SMTP id 5b1f17b1804b1-4926689bf23mr65222575e9.29.1782453874280;
        Thu, 25 Jun 2026 23:04:34 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46c1b754471sm21215623f8f.0.2026.06.25.23.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:04:33 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH v1] regmap: maple: Workaround for another false-positive compiler warning
Date: Fri, 26 Jun 2026 08:04:23 +0200
Message-ID: <20260626060427.2548578-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=ShdVa5fWWKPn743dwOzhbW/tUEH/Tbmsc+RjNqdZTDw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPhZrcKbpXLhdWjIZH62NMMTuummOFm3Med1I2 2WU0HQ8x0eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj4WawAKCRCPgPtYfRL+ TpwEB/9B9r3JRupzizaiaEdVuc1ShjO54mFa/LzSfCABLwuZ9uoETcY+QSUTGrKBcJy+mL2RVXA z8Fw3TMt5GY5oAoyd9fT5JQe/m8id5dDfNC0BTYHmvJUsqH9oL6Minya6RK96Adz0zQDoAUV+9s mM+/9YvivFezvGVO6svkrcX3BUdP/hgm2loO7Q8khMs/f/aZLFBzBLTjZ2j/YpIfHkg9KtU8Tsy /Zc6CN61JRyYcIiQvEvESGX0ms8irY+W4s9i0hj1UmMJq8o6HJlwqpJkNEj6OVwuxugLszsNZ4q 0ag3VdjQQDLd9a33JFF4MwNYDtJc9M+UsazTjBr/1xFEuHAK
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Similar to the issue fixed in commit 542440fd7b30 ("regmap: maple: work
around gcc-14.1 false-positive warning"), I see an uninitialized warning
for upper_index and upper_last.

Happens with arc-linux-gnu-gcc (Debian 15.3.0-1) 15.3.0 on an
allmodconfig for ARCH=arc.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/base/regmap/regcache-maple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/regcache-maple.c
index 49ba7282e4b8..598616f7aaf0 100644
--- a/drivers/base/regmap/regcache-maple.c
+++ b/drivers/base/regmap/regcache-maple.c
@@ -112,7 +112,7 @@ static int regcache_maple_drop(struct regmap *map, unsigned int min,
 	unsigned long *entry, *lower, *upper;
 	/* initialized to work around false-positive -Wuninitialized warning */
 	unsigned long lower_index = 0, lower_last = 0;
-	unsigned long upper_index, upper_last;
+	unsigned long upper_index = 0, upper_last = 0;
 	int ret = 0;
 
 	lower = NULL;

base-commit: ef0c9f75a19532d7675384708fc8621e10850104
-- 
2.47.3

