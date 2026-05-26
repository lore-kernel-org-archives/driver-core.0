Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735483DA7EE
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 12:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796996; cv=none; b=pd8NFOSzuw0+zBeEIJUBBbalW84gjWaw54VYbHtwbA/VSj3V80XRg7oYo6JkAD2539LWBllsBwb1skgYmOIlM2wcnrCZ4oiFxB5aAJwf8/CmWlfMzfEe/KtgEtXR+KQgAKSGLvZggAk7QXa3o6UXY66U0w2hfyKo/EYeR/J7HdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796996; c=relaxed/simple;
	bh=60FLVjS6344cww7v7mVjQdFT8z1gUGwaOUCCd0QViBg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDr+NoOsBXZIkq1/6u2NQwGxrkE+cR5gp94XkLyEq6xFYkr092VTm9IGuxKmaN9LEWaKQkHZ5g7afpqcq5ZkjwtIUuRwtEQb9HgpvMYbLHufx2g5PEqR015qhKslJCkJ6hYpTG+Xpa9QADqDBhO2WHue4yj+w/5E4PEIcNjlJJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMNCwxt3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMNCwxt3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso41099565e9.2
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796991; x=1780401791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ey2Ry8WOYcw1uJXmD55b4eg3Hgx3KA8mNUuxhqVi/k=;
        b=jMNCwxt3m8BPLmzHk10BoGJw989eSOEzPszl4nqaVuNtHp8bsh1p9IC8Y9AKVGN3IE
         WArVYX+dB9OOIOD9hcXLnwdXuJq/fUz+RS0CAe/IOlUmdraBReHCTdwo9JhqUCJ+KA5n
         Y1/8y6ALUsVaV/c4Mqe2ek4q0rOeDQ2WhKALU/oLch8CBWiMrfPOkJUX+XDJH2mperd5
         sy424ZHXx5pISzgpHgNvaR/uXyO+4PowDpk+y+dSGR7MK4ZLS7PN92sWiQaYlt07CVkM
         GoMVlWXwBITb90tM5cO8lwBiY9ZQ/hd6xYoy2cWFqYB+drZs/gtnJFJGMmObCLcWuXoN
         WkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796991; x=1780401791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ey2Ry8WOYcw1uJXmD55b4eg3Hgx3KA8mNUuxhqVi/k=;
        b=kczzI5eMWOn+TVazc8QfPSFLH4ZmynJmDBuBwwJ77/eVRNdGYs5bbkJpx2IDAGdeRE
         sUaw+AKrd4A5YvYIE6dytU1ogZ74VKhFlw8i9EGiVrQNB7rLE4HxRvBBCcoL4gb+efXg
         EPr8XRSIXUrg+tWTcRBHkLeCySn4KpybqIbsissrM18Sb6HxckY9Y92yX/8XBpz6HsP+
         r4LYyczXYB3MNKQNjQ99pGJxFmcz9Bp2SymTO07H89CwdlMSJvSFQ3nQBaW+r3PTzjrs
         a5LyHMTI1cVGE9wTLesHn27h1GT69h87JQ4taQnWMDeKJXs05wGgH9ZOej16vi7o0LKs
         RvTA==
X-Forwarded-Encrypted: i=1; AFNElJ+RBzk27NCM7sPdzTj2jRqcDC3/JR1VUyaa7ifSHgh4ZTAY5u0mLvQE1puXhGu9gY92Db3+tGy1htShzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnyZJOB8Tw9kWCE4iXloIyi6iBBMShGuPmY1FBYtLiUc2GxRiG
	O/6rcl9FV0V8jF/mpKdrkhTABcNdhyzXMKc/iJv/w1Qm1qMrgJHPVI1rllv6xA==
X-Gm-Gg: Acq92OGNHMI7sdO/qXwpXOwoPYMhA0EPmva11fK60hpBCl8gM1tCnQ27APeio+Fnubi
	1Vy4oi1dCku+fW4uCwhj8h3EI4N7AHUdHh0lUokaWcb6TPiOjPD1CWSxXIdI1Hi6Jf69YoiIZTi
	1gWQg6zm6KQO2KTobZ7wzZs8SG9t5xpr/0A+8hk/bgoMcpGmBVXABKu4eavYO1nZkhd5yMgcr97
	GgrQCRMKz4ydO3pmV88q5fDE/SQNtILHIn89BoCsDOxQ89A//1MGZ1lQDw5sH4hdv9Hq6BTicJ6
	1ryAasUHliYd0tEsrUCR3s6inO4GikMm1l7FAT/5QVYLF3UYeLXu7W12NDx7F+GwSZ2EXcxe+oE
	XNmGGlRft8wHlzfTNdlS8x2o0ngoqkOsEANOzY62t3wmKXE5qqZ8upm6T1T+tzeJye8nX+UJ7no
	IoRXKAsqwpVjayYYDdoL50kisJBESfM4YjVHwUrbHw7F02G8dR
X-Received: by 2002:a05:600c:a402:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490426d3f95mr215913035e9.24.1779796989573;
        Tue, 26 May 2026 05:03:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:e748:e762:2da6:e1a0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49041787932sm144370845e9.1.2026.05.26.05.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:03:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost deferred probe work"
Date: Tue, 26 May 2026 13:03:04 +0100
Message-ID: <20260526120306.184283-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
deferred probe work") introduced below regression on Renesas SMARC RZ/G2L
EVK:
 class_for_each_device called for class 'devlink' before it was registered
 WARNING: drivers/base/class.c:415 at class_for_each_device+0x12c/0x13c, CPU#1: kworker/1:1/26
 class_for_each_device+0x12c/0x13c (P)
 fw_devlink_probing_done+0x58/0xa0
 deferred_probe_timeout_work_func+0x5c/0xb8
 process_one_work+0x150/0x290
 worker_thread+0x18c/0x300
 kthread+0x114/0x120

Reverting the commit fixes the issue.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/base/dd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 172a02a438a2..5799a60fd058 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -323,10 +323,12 @@ void deferred_probe_extend_timeout(void)
 	 * If the work hasn't been queued yet or if the work expired, don't
 	 * start a new one.
 	 */
-	if (mod_delayed_work(system_wq, &deferred_probe_timeout_work,
-						 driver_deferred_probe_timeout))
+	if (cancel_delayed_work(&deferred_probe_timeout_work)) {
+		schedule_delayed_work(&deferred_probe_timeout_work,
+				driver_deferred_probe_timeout * HZ);
 		pr_debug("Extended deferred probe timeout by %d secs\n",
 					driver_deferred_probe_timeout);
+	}
 }
 
 /**
-- 
2.43.0

