Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E30E36214A;
	Mon,  2 Feb 2026 23:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076354; cv=none; b=TobOBVqcsjUCPIpbuTIgROkRI2kQFE1McF9Q3IQha7EfrEEAPxxYeYhlq+IZymkK/gjPnUuXaJJZA7iT05inhaMa6Hu/ZCr+JQnoPEDSVL6GY2Bll3NHKefjzEySKo2PZEpq0F5wbChpu+ohLgXiUEqTNwJCX/bd2dGnb0LVsK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076354; c=relaxed/simple;
	bh=i26uVIvYQxloE6fGrmb+wYZqzx176RUsJfLep0tnBkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UKji/BerR9gQUe+yWkOpgOL7M8ptRaEzGkei9xKQTQYVpW6OGeQplYWgBZDJFanGBS2S+R0kk4FuMp3u8u8U509RHYttlLvuhpCYu1IpQYmsQIOmly4sGlTsGsWOuWn2UhtfOaZWkozOJlj6CQLHKr9RZUVI1fcf58GRnAvbRKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtiOS0F3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtiOS0F3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31650C19421;
	Mon,  2 Feb 2026 23:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076354;
	bh=i26uVIvYQxloE6fGrmb+wYZqzx176RUsJfLep0tnBkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LtiOS0F3p/eOS6ysZY5OU99c/CS4WYkjMwuSNil0r/NF191JG2ocsX7OkmmvrAb9j
	 A9VhMZ/k3gQ0iNNp6H604aXIC36WnBNSnRelyv1qzy7INeDyprndKa2srfPe1MXl47
	 hx7OKa7IY9JYWK+LNMv9ZnVXRWPwmrvROMdvPZeJJXZXh+M0CHf9U770tv4Y2ZoPnK
	 A6/GCJcRWwjmlnjwSVJw2hDBC1gDO9eSLeRogUo5NcZIiRxHoBjAcw6NPVYTAH7Xa4
	 PchBqfoYkUCmKLhtu3uHeaHay1UJOIruk9xpQtFTnkxo7l+PiOYTnbSfTrBy74bDcl
	 un889UYdI4K7w==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 7/7] devres: remove unnecessary unlocks in devres_release_group()
Date: Tue,  3 Feb 2026 00:48:20 +0100
Message-ID: <20260202235210.55176-8-dakr@kernel.org>
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

There is no need to call spin_unlock_irqrestore() in every conditional
block, as release_nodes() can safely be called with an empty list, in
case we hit the "if else" or "else" case.

We do not use a scoped_guard() here to not unnecessarily change the
indentation level.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 58e2f82a30f6..0fca73b56168 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -708,7 +708,6 @@ int devres_release_group(struct device *dev, void *id)
 	int cnt = 0;
 
 	spin_lock_irqsave(&dev->devres_lock, flags);
-
 	grp = find_group(dev, id);
 	if (grp) {
 		struct list_head *first = &grp->node[0].entry;
@@ -718,20 +717,18 @@ int devres_release_group(struct device *dev, void *id)
 			end = grp->node[1].entry.next;
 
 		cnt = remove_nodes(dev, first, end, &todo);
-		spin_unlock_irqrestore(&dev->devres_lock, flags);
-
-		release_nodes(dev, &todo);
 	} else if (list_empty(&dev->devres_head)) {
 		/*
 		 * dev is probably dying via devres_release_all(): groups
 		 * have already been removed and are on the process of
 		 * being released - don't touch and don't warn.
 		 */
-		spin_unlock_irqrestore(&dev->devres_lock, flags);
 	} else {
 		WARN_ON(1);
-		spin_unlock_irqrestore(&dev->devres_lock, flags);
 	}
+	spin_unlock_irqrestore(&dev->devres_lock, flags);
+
+	release_nodes(dev, &todo);
 
 	return cnt;
 }
-- 
2.52.0

