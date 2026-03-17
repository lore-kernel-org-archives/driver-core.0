Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E1C3F7AA5
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774029; cv=none; b=Xn0IzgVkD1k+0Y938JR+ytHfjQUVhIUEZ/vRtQgsRvqBX0V701mr5nVXCsWxud1SHezyff3Fnqj9pf/1yra4tJdGrUN5piSXkZlCWpGLS4k8e0Qdi06MuOHRBMyA4/op5JIKZ0umfDL9265DJawUew9bFV9OSNLd1Jx3UgPJFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774029; c=relaxed/simple;
	bh=IMmJ1Uxode6XtjAurdNk51CWF8bJbOqEiTkikuLK0kA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZA3lMlVFlASysKG056I6qi+z5bs4bht0y7ZKz9LPR7hxtHk+Q/tLFUeOmisWeg+KB20tz/lthIj7ksWNZdiaPZ8B0SGNTCwbEQmm332fIJSR+aQfz6ylKBxyK76qZKmUFLJtMrEOM6ro5LB6b3KXt3T8ksHf8jgBQc28mM0eWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPVD7USf; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPVD7USf"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35b95e21ccaso101524a91.0
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774028; x=1774378828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2RhT/UW1C987y6pJfFZ8RN5SYowSBt72Kbbj9XR2UU=;
        b=KPVD7USf81UaSfLbVyIhsNAmVvjQHmhcL3HuaOd786Ei2TnKqyky4YTyurHSXVgMeO
         eUAHYDQRqRtDVcVLKuUkF8sCGYzhW/Tie9QR70M6NadEztRGJVVpowUTArXhsXD+7dY7
         gx0pPj1AdZAlo8Je39ydCm1deU+xwyqkMVt81ntGL8TRSE+sGvHfujjbpTKSZH0O8ng8
         UzKv0qE3npdjziJgl2euSKT1ZhhxcWHuaVLc/3JfgOSO4aMZFVq7rDXBIVjfcHGdWrh0
         nCXiEuZF+QiMP/OprI9BwaQyxlEkSWk1e8R1sJJuVeCXPwMtIhFgjdJtYKws4p+mI/Df
         g98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774028; x=1774378828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2RhT/UW1C987y6pJfFZ8RN5SYowSBt72Kbbj9XR2UU=;
        b=gYSh5k+S14vP+jmFasBjvcy+axnbjqQmYJF8y83+y6LxIlnnCMgzVso5NumgDkDwUo
         ajIAH1KK8+mZLqNivT8tyUYmFMlU0JDv8vj5HD+ztyOH5R8vIuHThpz+FNfIag5WvTPk
         eEmrAlAbDJOpkvv7cqSE7tv1KbOSBjxMXmcGCuPKrPGJ3GcSB+HtGcGjvt36ZFQ3rQxS
         WenSNSK4dOsK08Bg+wQ0GHVAzNq2x5u6HevvzkgH5AJV9ytnOojn3VaHACRn1+YKKOp+
         /AvC5AFP0lkjCe9+aerqCiZWzhIrBOw6MoUkFnB1SZiYMVcZhbcQLM9CUy9XguQqflUy
         jmqA==
X-Forwarded-Encrypted: i=1; AJvYcCVxLv2TOHrZOV/G6Zka9aTxhiZviIdUZisV1nwUcUVASaupx6VCV7ZL4YEmAm5oWAqqhWkj2avVONXXLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/8liF1wcHDtjUfnCaq+A01MxefFJb1x67t8gGq5T9YzND3Bxf
	6dvOxMyrsM60RMiLHrPQldR1sFYpe8SA1qXyHO9ZodcRynJpgrz2MuTZ
X-Gm-Gg: ATEYQzx83wyg5xwyp6XY9E9lapeBr8eONizOXqse5SZIfLWAftvJ/9elbtvAZGNpuB1
	uOeP4yG5d+4whAOFEpYrPAfogNJyD+hCBZwPjLS5aqT5ysiIiz+k+qm+p+XVWwi8mSlpcd6q48v
	zCGVyZthFBO6WYDvB7MsCYzOzpweTGX2TgXlhA53P0koTaTzWLH9Pk6G07EmWLGOn+0AWSw45yF
	TrqeDTs8/HomgDPl+6J0GB3tBXQpprKGL1OnQt5ic+7A+Eh5LXY3pdQaNVk58tl+25JpCH5gqSB
	WesMxCD4T60/bZhFicWgGCuKz4aC1aFmzTGD6AQ/sUK70GUC23+AZe9zpl7kT1gje8Xo5YDrpMU
	lw9n2vX5WkHhg7Ol18Mg/ApGQKoxrNA5W8EIIKJ3GXau/ks2GyscH3dIXgLSuSnSaHhtsSpKhrm
	/M64EbCOUoWap/5JlLK1tj/aLzfaLA4xozdp7xNv6dIT1kRnl/Ybbygeo7VH7rldbDh+y3R70BA
	YPvPFJnns4Lx3/bYuCu9KRcHw+VlMfBLDnz1KJDbOOXc7z9hyyQhl/R0fus+yKHCwqVFA==
X-Received: by 2002:a17:90b:35cb:b0:35b:92ba:66e4 with SMTP id 98e67ed59e1d1-35bb99b2ce2mr555490a91.7.1773774027874;
        Tue, 17 Mar 2026 12:00:27 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bba5a2c60sm196240a91.9.2026.03.17.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:00:27 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>,
	yangshiguang <yangshiguang@xiaomi.com>
Subject: [PATCH 1/4] debugfs: check for NULL pointer in debugfs_create_str()
Date: Wed, 18 Mar 2026 02:59:10 +0800
Message-ID: <20260317185920.43387-2-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317185920.43387-1-hanguidong02@gmail.com>
References: <20260317185920.43387-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing a NULL pointer to debugfs_create_str() leads to a NULL pointer
dereference when the debugfs file is read. Following upstream
discussions, forbid the creation of debugfs string files with NULL
pointers. Add a WARN_ON() to expose offending callers and return early.

Fixes: 9af0440ec86e ("debugfs: Implement debugfs_create_str()")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/2025122221-gag-malt-75ba@gregkh/
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 fs/debugfs/file.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 3376ab6a519d..a941d73251b0 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1127,7 +1127,7 @@ static const struct file_operations fops_str_wo = {
  *          directory dentry if set.  If this parameter is %NULL, then the
  *          file will be created in the root of the debugfs filesystem.
  * @value: a pointer to the variable that the file should read to and write
- *         from.
+ *         from. This pointer and the string it points to must not be %NULL.
  *
  * This function creates a file in debugfs with the given name that
  * contains the value of the variable @value.  If the @mode variable is so
@@ -1136,6 +1136,9 @@ static const struct file_operations fops_str_wo = {
 void debugfs_create_str(const char *name, umode_t mode,
 			struct dentry *parent, char **value)
 {
+	if (WARN_ON(!value || !*value))
+		return;
+
 	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
 				   &fops_str_ro, &fops_str_wo);
 }
-- 
2.43.0

