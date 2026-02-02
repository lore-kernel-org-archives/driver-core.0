Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21AD361650;
	Mon,  2 Feb 2026 23:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076345; cv=none; b=ClT6jrFHecDpRSat718AqJZ+fe+dXiHoEPr3Zk+9kgup+d2HJE6NV2ryEh+3nfPurwHDfMwAL6KNK4Bhj0hf+aVzJnE28JfLI807oLiHrU7HmFoDsQ2MiQl5WW2R0Cp/mChokUGSR0HKF46OVsJ+3y/3s+wvHO9ucim45CyNHMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076345; c=relaxed/simple;
	bh=Ks6rrunQRP0qbtAVunnS+WmB4noM4QsRlKAiMCdyh40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFbe04dQbJcyFL5/MzGSSYHc3q/lJfea5NPNhWNLmYgycGCkX7fb+KrSIt+RU0UCENK6HCWrFyUEUX2edTmi29fMrdejo5eYQIo64n7kKrhs4DYXQI0Tw/TwmVXFqVd3kM0BDqLTSkCz1DGMzZMG/lByeDyJm5bjPpdJn8kV9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G4PyTXr1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G4PyTXr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6B5C19425;
	Mon,  2 Feb 2026 23:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076345;
	bh=Ks6rrunQRP0qbtAVunnS+WmB4noM4QsRlKAiMCdyh40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G4PyTXr1y3fe66pzD+sY1tVWPRYHB3uik6pdmg97OqrhE0zktIMIV0xl/2qMeH32x
	 kcr3iRjEj0HujRKFszFF0pKCx2kJBfiFiApz3Nz5i4DVMIeMQJE672bi3akQHccoAg
	 PEN+5e4PI6j2uidrJ8wHqKuywVAQBrwTiLrzihEf3yE/CIfog5YY3xjYi8Cbz2OIBu
	 GKIiUe5G1YLGG9fofJ411Ioivl/T28oos0VEJd2PqZRWyHtXfc+aCfnwvlccITdq2P
	 5NmlkBgA/UhNerFYKpsDuMiNspx9waiUxjMG1b/0tSYY5RxSLZZpLugKQtC2R0CY2O
	 Lmd6buiZVwCsw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/7] devres: add devres_node_add()
Date: Tue,  3 Feb 2026 00:48:15 +0100
Message-ID: <20260202235210.55176-3-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202235210.55176-1-dakr@kernel.org>
References: <20260202235210.55176-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both devres_add() and devres_open_group() acquire the devres_lock and
call add_dr(). Add a helper, devres_node_add(), for this pattern.

Use guard(spinlock_irqsave) to avoid the explicit unlock call and local
flag variables.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 1a972f47916e..0061c6564469 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -231,6 +231,13 @@ void devres_free(void *res)
 }
 EXPORT_SYMBOL_GPL(devres_free);
 
+static void devres_node_add(struct device *dev, struct devres_node *node)
+{
+	guard(spinlock_irqsave)(&dev->devres_lock);
+
+	add_dr(dev, node);
+}
+
 /**
  * devres_add - Register device resource
  * @dev: Device to add resource to
@@ -243,11 +250,8 @@ EXPORT_SYMBOL_GPL(devres_free);
 void devres_add(struct device *dev, void *res)
 {
 	struct devres *dr = container_of(res, struct devres, data);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
-	add_dr(dev, &dr->node);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
+	devres_node_add(dev, &dr->node);
 }
 EXPORT_SYMBOL_GPL(devres_add);
 
@@ -552,7 +556,6 @@ int devres_release_all(struct device *dev)
 void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 {
 	struct devres_group *grp;
-	unsigned long flags;
 
 	grp = kmalloc(sizeof(*grp), gfp);
 	if (unlikely(!grp))
@@ -569,9 +572,7 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 		grp->id = id;
 	grp->color = 0;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
-	add_dr(dev, &grp->node[0]);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
+	devres_node_add(dev, &grp->node[0]);
 	return grp->id;
 }
 EXPORT_SYMBOL_GPL(devres_open_group);
-- 
2.52.0

