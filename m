Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C7E4963D1
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 16:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781714376; cv=none; b=Zar7SpWG7YSYcxkz5487lrI43BunSqSPjXIDBhOXd9vs+3wRdhLB2wAuc1QUVwpPzh+9A6EQiPCrd0h4cLVSKlAPDpcoKGjLO5T6F+OFmjTmIrEkXG7f17JCxgC70ncMgfCi7GeuN4kp86TLKaqJMjCUkMkHDze88/ZkNbvYj7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781714376; c=relaxed/simple;
	bh=VhSsrAM9gTdNY4d4xymVwlRhSHetErvRZVEsiHQznxk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUVm0XLETs2vnvjP6arDZrQOPtPfxQUgOQWGb5KyP6ozcfkfmHBDzkKBmmeq7MEg15KRavNpn96I7fkw1t1PzSwjr9lObKHrBBhiohWFssqbDWpnuknfGfIs1Q9u7aWkHmAaBUGjLweV+8diK2pXspwYoacpW3tjVyTtfJU1iI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3gYX3D6; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3gYX3D6"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b9033d230so769899a91.1
        for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781714373; x=1782319173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RzwjJirdKF9aL8pyYUOcGplzpLd9E6wSMPKnUXgb9XE=;
        b=O3gYX3D6kdQzNJGNWgiBAO74hTXFy6QhPZClybXD5Cb1ir47kdsjWm9TrEH4yz5oCO
         xUvQD+CffTA2X60oJ4Ul5JWoA6WOIaUw26kUd0Hra7T22SEoq+CMBZTEejS7jstJbbhX
         RRghahGzJoUXlOsYCVvgTHiHl41+A2rdte5wDkuBz4bmc4Y12U/Ez5DumbeTiWFDTMS9
         BT5to+k/gSmwcmOCdRkYDKPGVjBYTq/E9UxlsUKWIBry83tDliFwEZjeCrwWUYvhdJ/s
         m/FhcL8kPT/TTH3FRJSItDuT2pohtbZlNIjRSfEL3creEEVUikbEglk+HWwBsj/g5mTn
         lQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781714373; x=1782319173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzwjJirdKF9aL8pyYUOcGplzpLd9E6wSMPKnUXgb9XE=;
        b=hMFCeuYmPuVVXWht1VUAO3/QCiqGajicSjLOtsfZjTl0qGkcAoD2r6inok1RWWoQ3N
         m6DoYQLxayeEFTua1whxZR6oXLc5nYAHjRE2hr+mCeMf3C+SIHJfyt9CWOH5RIvUWA9Z
         qhdEtpkAvvco7gD4fGXbfn9eva6vrQKP9tPM09LniK2rMVafJZOax+Rc6NN5zOBMeRvk
         dXDuXDpB1+nu5Pp2n4e4If/+RiQt+V92H/R5wY8fHQDB6JCYXZpSoXgJVreLnQdwAauG
         lIE9QVDRndnsLpeV/2tKiioBBsOx6b/r/DuERz2edjOgXDRy5iFMpdl9PBic/8NkpJPu
         mNyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8c1TibgyibLX3qaUlDQkahv55yNRtvVnffaUxibBgA/5Srjc23pfj46IFyI/8vQauohS2srt6vNXrx7w==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywap6zt2FYs6UtvSLuvUMCjsCieKp8kBLHEotYyqCCryweseJRh
	61OdYWZ3VVGXhI0KleCLN3wn45jY9NChZD6LQNgncylD/Tq3YegyY88j
X-Gm-Gg: AfdE7cnd6NLlLWIYat5BKaScejlyUD4P/cssTY5mD8PpK4oXFyKsj8Rjyri4mfQExqk
	/OcuzK4piPDykBAQiDcdwIuO1QvktOBw/eQb35Z79B7HfHPuRJAHYms+5T+WEODoweyuobcjFfo
	LYaTIEdZB+8pY5CowNFoyx05vKXhkQNhCkn1noe/TCF91dTQ8t7VMkvpw6zuBDnJM11JT1VGfVM
	e29M/a7EjH40EtL2OuTSh0N5avMr56RL2jAaZW8bKahPNTlbMmjGGFf/rigk06K8S6xH7tUIq5/
	H/Tw0SdMqU+E0k/O6pkJxhMcA1wWl7IccXtFI9nDrNMpKE26EETjXNwJhXhxWzaZ5mm83ywStUj
	BraNgBnNuituwB3S5//QGJyGJIKu/FyuHsCLxTz2fuBDzcW1uSytDUG3LTglVAH6OZgUijJDqdu
	1Tvk2LIQayHN7Clpmnkw==
X-Received: by 2002:a17:90b:2dd2:b0:36b:a162:a1be with SMTP id 98e67ed59e1d1-37cdbcf285bmr183369a91.4.1781714373182;
        Wed, 17 Jun 2026 09:39:33 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37cccdf0923sm734949a91.1.2026.06.17.09.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 09:39:32 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arch_numa: remove redundant nodemask clears in numa_init()
Date: Thu, 18 Jun 2026 01:39:19 +0900
Message-ID: <20260617163919.2544899-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_init() clears numa_nodes_parsed, node_possible_map and
node_online_map, then calls numa_memblks_init(), which clears the same
nodemasks. Nothing uses them in between.

These clears have been redundant since commit 767507654c22 ("arch_numa:
switch over to numa_memblks") made numa_init() use numa_memblks_init().

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/base/arch_numa.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index c99f2ab105e5..442ea239bba7 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -231,10 +231,6 @@ static int __init numa_init(int (*init_func)(void))
 {
 	int ret;
 
-	nodes_clear(numa_nodes_parsed);
-	nodes_clear(node_possible_map);
-	nodes_clear(node_online_map);
-
 	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ false);
 	if (ret < 0)
 		goto out_free_distance;
-- 
2.43.0

