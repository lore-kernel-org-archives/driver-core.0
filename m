Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CD13AEF26
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 11:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029954; cv=none; b=EMIFrZnCjdNtLspNiDrxhIJxZ6iPg8rxEmisTgUVatHMYpZ2iF7tNj8BDyleHaYoTrjKAVPZz/llci0OCK2SiHtaPUEKGo2YjOWPHzHkoeLcn6jWEAPWphLu9+DFg5LlsKG/Fr1u1D06r81tUOOHniTdZn0lFSgg+aNQqYwLgxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029954; c=relaxed/simple;
	bh=lABDuFnz+YwQcCiLQofnNy8gDQ2d43kUKsMbKEpkLwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WWLUonqrOiLSI3gdeLte9BaX2wpaI9nMcL0gskl5e3sh8uusrJA9UWwduD6P9kXw/zi+8t2mn6gaGPV9fVG5GiZDW7ZhCbqRWPyqbLEZNG+OaoTUM4kfZa3W/PxkT36O6hmepuLK6+7WxE3S4d47o2Em/GeBVStdl9ML+3BkD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pucQ+uaV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pucQ+uaV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso61861425e9.0
        for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777029951; x=1777634751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMNZYVpC/xQvt6usePtF/pIytAbShuPrQ+BZzTgAqEA=;
        b=pucQ+uaV2T41NE28kpgawXA8ZJNdrltlZviaHMhi1zYlx7LpcL2An6gibXBgZcU6zl
         L7GvRxkSwZDT7j8R0FLOnco1cQ8l9vhE5t9evYLFL0b1GwiYuKpB/biqsol+dixoRBhA
         2jhHrv6KSNsNIp8JU6/yccBLp5q/ER+2/4KFSHuDzXd6++ZFMOtAULg6ToiTL1K0H+FM
         w05v9a0hdgTuGzCuo44/QPdkT5YTq+gGPvHfDRfKF+YCwVc9hyuDfGr4a5RooXHeObbM
         zgTcBp9z82WAkYMhSZ1/YKPiEJBjRfhVw4qYTOkdmZXw5ad9jzx/a3X+epnrKS7D273Q
         BxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777029951; x=1777634751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMNZYVpC/xQvt6usePtF/pIytAbShuPrQ+BZzTgAqEA=;
        b=N0kh7zDYbnKl8EnSrnAJRm7YvXOlUf9T2SLBFG5RduUP5epgFXoQXSyCepQDWKzU4C
         Jw0WRFg4uyLvH+8pqD/OyWxVKmy6D4DxcadJN++9BHTnxODPUaBlRML5yR15LJYRonFT
         1iBvOyhTEJ/YP4FqcycknhHS4PjXdxMuebvztZPS0VkXkIerH0k6UdZo62vSpGh7Q96E
         ojhRJWi0406/NxHwKyoDnwkpLSlFxmIZdQnqFlweJYC4ps8WH5oY4vBLRagmxE1Yd+p+
         s4GvyazlXpEl8OHhpns3GT+J2JKZzjjGBffLKfU/MYoKfMwWCLrgYmAI6xCwmB88Dw1W
         bjQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CvA1bu0MJUAxYb9fX0U52EK9jI19Hir0YiHPgG4OlsKzRo0aKb35QzkoVubM6xmdCSy8lTKSAQoYGPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyll/J0qxY6cJhpPOBjOKRo7jOjc55RXQ3fvVGY7bcY67O19Nrs
	olAtaYrM8RDNB+xXQf/Vaq7CMSQeMmcSrx9ZyC0kqzpajQVu5EXXTEFHF4n6w3Iw
X-Gm-Gg: AeBDies8bexbWj7iVJpyEPTiU98xllUWSIA1vX7jo7nTD6oWynQZ9I2XSkc4QvZ/TEB
	gSHftIoOlbrqPg+NDF4LFrHpdKL1g35IzfZMOjK9Fzjt4EnNPuBcEgBu3zB56xtoxc4bUGIWedD
	UuD6fFivF27BbSYJSPrMzSUpl6MFhNN0cDunDa/TFyhmze17uAbBQpIO3uIXsKlYhBOtm4meTUZ
	wTnpvGJbWhRW1xcwv3tAP9ihYGxYYgp6B/aazuz5dd+lPRpV4m9VjPrqJovmwd6x2EQO94G4aM3
	DUbpkrNwtrW3gwUXp2fWxA+jKdK+bxacsjNi/zILkLhrl96D45x4Wtykn1vV6si+p5Qx9SyxJkp
	VX98Fn3L0OkRMX8Tt9LEQxCU7hCyO9fqujw3wsuUgh7iaSQQPZq1SJ6SHnhSu3I5yCIdkmZjGrJ
	u7aZcnA2fF+AQ2I39tvuXBvcFmlwXC/drH
X-Received: by 2002:a05:600c:8284:b0:489:1f3e:5f69 with SMTP id 5b1f17b1804b1-4891f3e629bmr296268375e9.18.1777029951134;
        Fri, 24 Apr 2026 04:25:51 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891b46cffasm406834355e9.13.2026.04.24.04.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:25:50 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] regmap: sdw-mbq: Fix spelling mistake "undeferable" -> "undeferrable"
Date: Fri, 24 Apr 2026 12:24:25 +0100
Message-ID: <20260424112425.32129-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/base/regmap/regmap-sdw-mbq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 4533fe793c5f..2585933d4946 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -172,7 +172,7 @@ static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *va
 	ret = regmap_sdw_mbq_read_impl(slave, reg, val, mbq_size);
 	if (ret == -ENODATA) {
 		if (!deferrable)
-			dev_warn(dev, "Defer on undeferable control: %x\n", reg);
+			dev_warn(dev, "Defer on undeferrable control: %x\n", reg);
 
 		ret = regmap_sdw_mbq_poll_busy(slave, reg, ctx);
 		if (ret)
-- 
2.53.0

