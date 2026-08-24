Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF29D223702
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787542290; cv=none; b=FrH2OfUbSwnYj9YhQbrK8vzhgLls9txN8SmksyutmV4g9dx4JA+G+qL8/rUuJ2BD0ES1G7RhSMTBq/z9e7CaVWPCG3eHEv6r302Wf9tpDQeNEGyd+p4MWZWQEDP2CVbissaxqSTrMnEu7nDykJSaGsSjG8QmX3xt4X3a0otthSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787542290; c=relaxed/simple;
	bh=CZCKrxXEgvdkEh/Sae7MgTomn3ZPrLlEG1hbRDak20A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J9fT6oNop/AGP4TliThQNckkTmKWaPwpnUWD3cdSqETJATcQzd8U6wj6DJ6fg8hR8dzG7beMyAgEU1c0HT2gcEOjpEidNVlrJXx6HMKRwFG8BWZ0uo2bu56JG/HDjaTTbgRv+iJ4OcrW/jhv1oWFJLdn6EBDU8b9o/cvTqsB8e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNqSt7X6; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNqSt7X6"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d53197d8b5so29280785ad.3
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 20:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787542288; x=1788147088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFrsmmlSYHb7sUcLIy0ALhfjp7FP5iWgM32VwHTY2aM=;
        b=gNqSt7X6X8do0WC1UqCzkp3AP9awMvLxJkx5GoIyY2exbKcwA/mZdSgyp6G4nU2zVH
         i3xTotXnOyG7c9+n1IYgQklbdBY6j7/7fJq9WR5+DZwVpvCh66olxPxRd1XnsBHi2p4v
         BO2p/ZM2s8FghOmqXXwhDXtLJ+IJZqTdxH6jnc4OxZxKxnRd2fSXfzSs0e8koZq+K/s0
         Da3p+7racZHz3EOxKGErjujUDM45Q4ksg5S61MEYt5q0isN8lUUqwu3GJRd5cTK9pphW
         ANW5UZ1WZhTqz7vi/0uo/2AokvhS0Scy/a00Gp6Fg90uZoQqFqdjfdlVlFUN1RA+5jAG
         8RUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542288; x=1788147088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFrsmmlSYHb7sUcLIy0ALhfjp7FP5iWgM32VwHTY2aM=;
        b=IBhwSdnmJU/DK7cmXa8u6WkJalK1KpggGDYs9w5lXLT4zccNPQTW/Uqg07PZ7Sirc/
         jqykbWWE1cXP6bTG4xtd0tVgeQnSpd2ZtQSWc3ELX1aebSpw2fKjwy50h5mvHiXEaxCH
         +O5Rz7ebwl0ttafEBFvRmIWCaqrVuPY9w0OfqgcG+6XOGPLi49TKxL2F8MU8KGxqf/8V
         Y9Xt07+kG2v8+hyjNXNkOW9MMtCOe4KqE6poJeCO2l9To2nxrbKOko7tnw2DEBkHMURd
         FmxyBpK0TfaFatJE63MluoflWdXUUbqhaJtcFweXubzRfSx+qON9v7ALKhgpZmrHLWLB
         3PYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLp9LU5Q6Kb2+0U6dK7uuK+zQfRZbB/Td7vnN0XCIfh3lTQwXjHevUUdnkELIwS0f8IryBuJ/1ukRTmQ==@lists.linux.dev
X-Gm-Message-State: AFuF++m60Ha7zqsdNPH4cnaWZqZXGy3nmoy9oG5q17lbY8Jc4XuC5ugj
	bGL/06ISd5802B3KHQo7Pw3VFjpO3uBRBGa2zjPtgcczpOXlXzbCYG/I
X-Gm-Gg: AR+sD11t4E3685jOHX6ipoKADBdLOE+Mc989nqUyGrmIqOPyn12OmUZ+WOxrRaJxGgY
	1LoWuIvu4FkiyR7xxLwNYrp4lyAQ5cs5vK6xa4QVB2qLVsAykCUn5d2pr2JYJOCpgReYQ0kKB4j
	HdF5YG+gvHuezPBU3o+Hpq0tEt58NJvN8yP/wJxmC1+6iJqdfUVXU68Upm8p9Va3m8aLg5wP6++
	3sQcOb+KLJM6G2GXOsg6OF+ywVErMBCfchpGpJXXixqnXoEFdNsrqcXeEyP69TQUWnv5GLOxXQq
	4HTrmRmGfnz5upABwKxrwck8WzZ0aFle44UKcKgDGf6ukgyF8qOesg7EXE2xIkTy50Ub2aMgori
	LB1ESy4voSuZnqHd8YD8oqndnsAsnRRTOG5zOJobN8xs4aUQQMU2tkyvqwnya3BBpoYrbBC2pUI
	TC2bkCsQ0y0HDkw2wEqqCXqbAFy2Zdp5POApMsfY8G1XggmraAGbKgIxc04/eRq4hYP9gXrXTzZ
	jZ41TFY+lqz3KfyryTxHw==
X-Received: by 2002:a17:903:354b:b0:2d3:2e86:647a with SMTP id d9443c01a7336-2d64af6f896mr448583275ad.5.1787542288096;
        Sun, 23 Aug 2026 20:31:28 -0700 (PDT)
Received: from Alone ([2407:1400:aa0f:29d8:c1b7:3f39:4ae0:ce0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923615asm21037150eec.29.2026.08.23.20.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 20:31:27 -0700 (PDT)
From: Chhabilal Dangal <yogeshdangal66@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	rafael@kernel.org,
	pavel@kernel.org,
	lenb@kernel.org,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	Chhabilal Dangal <yogeshdangal66@gmail.com>
Subject: [PATCH] treewide: Fix typos in comments
Date: Mon, 24 Aug 2026 09:16:07 +0545
Message-ID: <20260824033107.347011-1-yogeshdangal66@gmail.com>
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
 arch/arm/kernel/cpuidle.c      | 2 +-
 drivers/base/power/clock_ops.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index fba1f8bb0..784457ac7 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -79,7 +79,7 @@ static const struct cpuidle_ops *__init arm_cpuidle_get_ops(const char *method)
  * cpuidle_ops are tagged __initconst and will be unloaded after the init
  * process.
  *
- * Return 0 on sucess, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
+ * Return 0 on success, -ENOENT if no 'enable-method' is defined, -EOPNOTSUPP if
  * no cpuidle_ops is registered for the 'enable-method', or if either init or
  * suspend callback isn't defined.
  */
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

