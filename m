Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9262B35F60A
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 17:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147012; cv=none; b=dw5J/TwQS3n96P6c6klZOyLkkfPkO/DUxbpaZdVyK+lkaQ/s5jYwEZ26pUsUy55uHFKplFT8z2FXIKTlui36vYEGZFUoPXzpgOdE62qv2ZxIv+g/of8bErg64p0CbPFnNO7tsW+fYNeQw0tJ+DXXDWDrkQxzdhdfxWFI+YZipYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147012; c=relaxed/simple;
	bh=OOmYs78njMGAnSGfJaQ4/fl+J5yhJV1OC69mnehpDKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kzfL75URCqwBf8GdBmV3ffnykrVj6GGFU3v+xzJsnaygoSpXyTjPwjMCPiK69aSAOr3U2NV0rnd9Ops4rbdwUXjnrC5Ki+15+Dl6+IwOFRzGHHUXgIY9GdsGV6DpH315ILtM/kV0UhtFAmOh1SEMUPrS0NyQdGoy0kUhRIqu4jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=f8mlXy3w; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="f8mlXy3w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1789147008; x=1820683008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VJ/Lv9xzHTgJ/YWyMhQoHx3nkzCch6+KqzX45lY2slk=;
  b=f8mlXy3wXqymYLQ5P9/vahnXaqA1VLpzKZjF0lmHntNjTnBXvTiU5wZu
   z9/vqGCcgE3EXa+r6bjDAOB89Lw10GTwilafZvMPl402VtJ79E9axQsS0
   Gfb6r/f68d4KiXRZQeixqTlJgLG0R9ztFGQpFzVZMPnPOkhZJKmVXxeyg
   8JuFUyh8n1POgcP6ilCBbmXyl4yjttkUGaz5L3tOoReEVuOQ4QI1EOnap
   EZUv14EVdGNZ1bDv3VCP/L7N/1Mc09J55kCn7uOPcnW3jl/Vcdjleit1M
   v1qNVoW4+2BjftZTIS1z6ZvvduTXdbT/DRtuFrMgxmpixkObMS3MMLCp5
   A==;
X-CSE-ConnectionGUID: wnZGw2+gTWyyM6NOlrh0MA==
X-CSE-MsgGUID: c26vrvdhR2a+LgWs/qLU+g==
X-IronPort-AV: E=Sophos;i="6.27,97,1787011200"; 
   d="scan'208";a="28474596"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:16:43 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:14607]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.22.113:2525] with esmtp (Farcaster)
 id 82d1ba25-0aa1-4a52-9a0f-35e693a3abce; Fri, 11 Sep 2026 17:16:43 +0000 (UTC)
X-Farcaster-Flow-ID: 82d1ba25-0aa1-4a52-9a0f-35e693a3abce
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 11 Sep 2026 17:16:42 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Fri, 11 Sep 2026
 17:16:41 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo
	<tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Xu Yang <xu.yang_2@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	<nh-open-source@amazon.com>
Subject: [PATCH 1/3] kernfs: activate nodes while linking them
Date: Fri, 11 Sep 2026 19:16:03 +0200
Message-ID: <20260911171639.68348-1-sakacpav@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911-vfopt-s3-v1-0-66e3602f76f7@amazon.de>
References: <20260911-vfopt-s3-v1-0-66e3602f76f7@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

kernfs_add_one() links a new node, releases kernfs_rwsem, and takes it
again through kernfs_activate(). A new node has no descendants, so the
second hold only activates that node.

Activate ordinary nodes before releasing the linking hold, removing a
second write-side acquisition and the linked-but-inactive interval.
KERNFS_ROOT_CREATE_DEACTIVATED roots retain explicit subtree activation.

Removing the unlock-to-lock pair also removes its publication ordering.
The in-tree lockless ID lookups use CREATE_DEACTIVATED roots and retain
kernfs_activate(); unsynchronized callers cannot rely on observing a
node.

Assisted-by: LLM
Signed-off-by: Pavol Sakac <sakacpav@amazon.de>
---
 fs/kernfs/dir.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 82bbaeb326aa..d68bce0b0b41 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -41,6 +41,8 @@ static bool kernfs_active(struct kernfs_node *kn)
 	return __kernfs_active(kn);
 }
 
+static void kernfs_activate_one(struct kernfs_node *kn);
+
 static bool kernfs_lockdep(struct kernfs_node *kn)
 {
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
@@ -855,17 +857,16 @@ int kernfs_add_one(struct kernfs_node *kn)
 	}
 
 	up_write(&root->kernfs_iattr_rwsem);
-	up_write(&root->kernfs_rwsem);
 
 	/*
-	 * Activate the new node unless CREATE_DEACTIVATED is requested.
-	 * If not activated here, the kernfs user is responsible for
-	 * activating the node with kernfs_activate().  A node which hasn't
-	 * been activated is not visible to userland and its removal won't
-	 * trigger deactivation.
+	 * A freshly linked node has no descendants, so activating just @kn
+	 * under the linking hold is equivalent to the kernfs_activate()
+	 * walk; CREATE_DEACTIVATED roots keep deferred activation.
 	 */
-	if (!(kernfs_root(kn)->flags & KERNFS_ROOT_CREATE_DEACTIVATED))
-		kernfs_activate(kn);
+	if (!(root->flags & KERNFS_ROOT_CREATE_DEACTIVATED))
+		kernfs_activate_one(kn);
+
+	up_write(&root->kernfs_rwsem);
 	return 0;
 
 out_unlock:
-- 
2.47.3

