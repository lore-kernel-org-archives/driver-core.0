Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9656E255E43
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 06:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552200; cv=none; b=EntfcWt7+LFbFzJdIW2tSXtQn+3EYaovx/yJXiTDAHbi8B0RVLdn1YWL7H0t7RhBrA6Gek3s/C7AYjqOcb/DmPhWzbpgWgNzSlavg0Mbt2Vgqz/Etz3Idg+E7p6D35JguOkUFjUZFXS5HKZwP8u8BkvH4ynXDnIc75XBOIWOGtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552200; c=relaxed/simple;
	bh=hCifVbDGqOxrFUw4MNslGn68BFtV8IG53qEmLcBRpUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDWoVSNvJ4+2TIgGMeYDsGyYbgSPg+t+c5lHQoAmy2DO5Cb2DmNNJ1a7jhJnP1Zd83xeYW01vvyU7cilycDOdV2nKwVES84WKPKyTHBmEZCBm9Euf1gH6AEdltyhIelMdROl0WBRi270TMCaAbiwP6c+KMyWH/pUskk0fxXNjkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NwExFoCH; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NwExFoCH"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca7c1176317so2575243a12.1
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 23:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787552197; x=1788156997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gC1jlPM66qYJRvbEK/CdgJJpi3r0DAb/vsWww3jhyUc=;
        b=NwExFoCHg8VrUit3TU/tNkBiC9+STz49qDl4Ba/aQtOWuzRyLvBPm8+u5VYFZQ4j4U
         U0b0JZRkb1k1HV5/1xpo9e1SKcE9hA00+Bj4AE3Ku5UKZlFktp+mL5NJzefTiqQ3ZVYA
         QM0F9n12uk5xBMjZw6E2WkXSrTMNdk7BrOBMm69cYrUmtKbySTKISGhNnJWf9r/0Js5d
         BrbJqJsoIv6HcvjvordBF5vAYO84ixKO0y8Mv9hiwNF/sSsMRtoqzJfjG2sY6cgzH3Xc
         B8FKvpgV7Km8zuutDvfVyjxl8BhK5Y0Wj4d6EDfInhGXe6a60A8jinnCuk7INNa9n7eG
         fXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552197; x=1788156997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gC1jlPM66qYJRvbEK/CdgJJpi3r0DAb/vsWww3jhyUc=;
        b=geWK7l/Qcch00kdANH1rg+Pq2kyj4z3Z759CUsb0WwCx2N5gbvtIm5VEkKR9gpqh7Z
         Stq8K1XrbIuhTapcEmjgURsvIsKskkQDA9zHdfIPHFkqaQ1kuiKxjW0kKCO/ZKfTIyql
         2hchkOeTq69NNiLaq23kDmHox+E5Mgk/jBzp0aF+91I/VY2vpV3A+9x5sSaXQ97CTZPI
         j9YIckQzFtXtVknxVy/SMhKKxqhfRqwVb+EXReL5s/kR80u2sNKWcZWiBdqLl+TscQwu
         GgjqLm77M83hVZN3I8rgsA3P2ZA+ZVuyUTnrkFMM3Msw/AxZLgYdW4KRqlCpAvuMoEvv
         gIOg==
X-Forwarded-Encrypted: i=1; AHgh+Rrk3jHY0BuhyDJjzfxpUgDFB+W2QlmIwxXlUrm3mDjxJkv9QGGrOlHzSyZXjC5IFukj0KLsXNdGNd6WAQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mfXqeFO8cqOjzOPyqz2gZ1bdL6x6rX0dVHUGzro7zlS/kHpEUF
	DiBUfLRfNFtWrhnI2m943qEWFwMrdR2/AHL465M75hdAc6EAb/oxTER4
X-Gm-Gg: AR+sD12hvRP5DTsXkRovjWwjraGO/UjLMQroMpoeqoGaHcmP9UcrL0MXtn7xZ7DbMhu
	eJdxF+WxIvhab3x61rPzll+6vl3tFMoPlGjp3utEf+IsDAjSHmyRJRQtMLg94QKHjQmEX7EDeR0
	4Aj74PWRFzRGSOZxFK4Kq88GiPK5gDFQmhjiHbMgT7FwFXst8BdZBTPoTz5CzOi2flcQkh74HHt
	vQJcAKgWwORCW8xwqnlx1HOb9+ZhufPO9zVJlz+niz0+rzbKfrDiRJfkv9wDm82f4LOqzqncalq
	KwHp9YqtIrlyOF/wXDcUt976VZhiHmOcyGUf02jt9pEV4T5gtEXaj9Sz1ZtJG1QJuFQM6PklfZ9
	EwJjiA0X9e5Sy8nqYdfAnO+P/lHRCaazsKKIEF0q9M5raC3lhGowjTahRnkfzF+u2Z72Rs6XBnX
	tpg+WLIzwSqZ9t2YPDAdWAZZhHDnqUlCOVJGOIwxPCap92VNXrsUIwcorMU4wHZOBZ6aL32iVwu
	g==
X-Received: by 2002:a17:90b:5867:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395df4dcdbcmr32028018a91.15.1787552196838;
        Sun, 23 Aug 2026 23:16:36 -0700 (PDT)
Received: from Alone ([2a02:6ea0:d33b:6282::14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e42cc144sm8514697a91.0.2026.08.23.23.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 23:16:36 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: rafael@kernel.org,
	gregkh@linuxfoundation.org,
	dakr@kernel.org
Cc: lenb@kernel.org,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH 2/2] driver core: power: Fix "sucessfully" typo in comment
Date: Mon, 24 Aug 2026 12:01:21 +0545
Message-ID: <20260824061621.356483-1-yogeshdangal66@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Chhabilal Dangal <yogeshdangal66@gmail.com>
---
 drivers/base/power/clock_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 59bb37e82..3b8ba2780 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -250,7 +250,7 @@ EXPORT_SYMBOL_GPL(pm_clk_add);
  *
  * Add the clock to the list of clocks used for the power management of @dev.
  * The power-management code will take control of the clock reference, so
- * callers should not call clk_put() on @clk after this function sucessfully
+ * callers should not call clk_put() on @clk after this function successfully
  * returned.
  */
 int pm_clk_add_clk(struct device *dev, struct clk *clk)
-- 
2.55.0

