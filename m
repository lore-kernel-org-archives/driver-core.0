Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EDA389E18;
	Mon,  2 Feb 2026 23:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076354; cv=none; b=f3dF6vuBEpOrUP/G7mES3J7SJQhuGgIMD4TePj/AOrDuIKZ2qagQL/HaAS9dV3j8UtDvMIass0qEPMztpPdCQr6tmBZx+7iCoEzn56gCBmMpkIqLXJ0ussGZw45kh7pFE4vFouiDZAPyUp51fngC8IxbEVGUGtIgT4oZW2vWKZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076354; c=relaxed/simple;
	bh=3DzsxhwxxqvpiWXDrCXOlzBaztYaNn12ahMZeYHKzFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sC7a/HBpsSjyTYK1qm7KHOEGcIcHVf57cJyFH+z9ZFamyFzHt2FINACCxpNcFJMzDSStWeXhx4uuxj/m/Eq6aDvLnp1YoqW0ttzLMw7IssTmGKT9dbgLLWem7UBE6tKeeOqscCKa23V8P3mvzQLiFPjCwdSQsvcnjizMbO/GRJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mFUT8Kai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mFUT8Kai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C1A8C4AF09;
	Mon,  2 Feb 2026 23:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076352;
	bh=3DzsxhwxxqvpiWXDrCXOlzBaztYaNn12ahMZeYHKzFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mFUT8Kai53Dm2Sre98suEuAD7Of84x3eKNf3aotScnKW6JihNrUEnwe7LjbrLTclj
	 dMcAIPBfGMkpax5HmK5AcSbSOr1QuBnendeLuSNIeT8B0yrdzJSufIkS8ttj1qEwVp
	 O/oXRkDnv601Gu1+xqyGbRI1nVmC2f5wtWiv4lyF8eeZisYHWaGdUQ/CxEyjiE2YqQ
	 zTr2hRVx/AU/oyG0XGWsragOLJ/NsvOnUs/nCy5quYaroZCZ55ooRfKHiDrUn3hzhr
	 7rSV3MfcsJQ/8LfUe5CmAd0/ya3pewuy3Cg4cwpE+9Vbm6YRLDsJEk3J8KmwgAdplN
	 rDTrW3pHfiwgg==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 6/7] devres: use guard(spinlock_irqsave) where applicable
Date: Tue,  3 Feb 2026 00:48:19 +0100
Message-ID: <20260202235210.55176-7-dakr@kernel.org>
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

Use guard(spinlock_irqsave)(&dev->devres_lock) where it improves the
code.

Some places still use manual spin_lock_irqsave() and spin_unlock() as
changing it to use a scoped_guard() would result in unnecessary churn.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 2006fe411b49..58e2f82a30f6 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -228,12 +228,11 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
 {
 	struct devres_node *node;
 	struct devres_node *tmp;
-	unsigned long flags;
 
 	if (!fn)
 		return;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock_irqsave)(&dev->devres_lock);
 	list_for_each_entry_safe_reverse(node, tmp,
 			&dev->devres_head, entry) {
 		struct devres *dr = container_of(node, struct devres, node);
@@ -244,7 +243,6 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
 			continue;
 		fn(dev, dr->data, data);
 	}
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 }
 EXPORT_SYMBOL_GPL(devres_for_each_res);
 
@@ -330,14 +328,12 @@ void *devres_find(struct device *dev, dr_release_t release,
 		  dr_match_t match, void *match_data)
 {
 	struct devres *dr;
-	unsigned long flags;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock_irqsave)(&dev->devres_lock);
 	dr = find_dr(dev, release, match, match_data);
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
-
 	if (dr)
 		return dr->data;
+
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(devres_find);
@@ -396,18 +392,15 @@ void *devres_remove(struct device *dev, dr_release_t release,
 		    dr_match_t match, void *match_data)
 {
 	struct devres *dr;
-	unsigned long flags;
 
-	spin_lock_irqsave(&dev->devres_lock, flags);
+	guard(spinlock_irqsave)(&dev->devres_lock);
 	dr = find_dr(dev, release, match, match_data);
 	if (dr) {
 		list_del_init(&dr->node.entry);
 		devres_log(dev, &dr->node, "REM");
+		return dr->data;
 	}
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 
-	if (dr)
-		return dr->data;
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(devres_remove);
@@ -655,17 +648,13 @@ static struct devres_group *find_group(struct device *dev, void *id)
 void devres_close_group(struct device *dev, void *id)
 {
 	struct devres_group *grp;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dev->devres_lock, flags);
 
+	guard(spinlock_irqsave)(&dev->devres_lock);
 	grp = find_group(dev, id);
 	if (grp)
 		add_dr(dev, &grp->node[1]);
 	else
 		WARN_ON(1);
-
-	spin_unlock_irqrestore(&dev->devres_lock, flags);
 }
 EXPORT_SYMBOL_GPL(devres_close_group);
 
-- 
2.52.0

