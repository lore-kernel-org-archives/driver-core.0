Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90893361642;
	Mon,  2 Feb 2026 23:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076347; cv=none; b=SITft9ZqofUp9BCLDGUk1qeoWeQKHcsIwRcYhxdTtjpTpEmCWG5ogPH3WENEJlkA3hWdgRctRUzpyAdc/dXTOlXaU6RGEnA5YfPWd8vAMdmlwXBEtrdiFVGZTgb2NIhvEAUFgp0m8pfiDTwftnl0Gdr/mPkwg3lVhK7dGX9z4lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076347; c=relaxed/simple;
	bh=kEX3eqkgzlCrubTYxKOB2dvvY21lQFf1NjRpb/cL21E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qx+N59JI+76S7nPffnFV6EjSQJ0aK/aWIEOF7S10BRDPUc4x0mK/tSfJtaT255s82Y578pfi0b/Fa00UahpoSzYafo6Z0nAwvCVk3Q2KpNLw4Yh8iFxXaItCuN1ZuvhrwTlBM1TEJChKAmmEGhDMvwXQIG9EGJPHRNVyBR06R24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqN1xnMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqN1xnMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35BC9C116C6;
	Mon,  2 Feb 2026 23:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076347;
	bh=kEX3eqkgzlCrubTYxKOB2dvvY21lQFf1NjRpb/cL21E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cqN1xnMdcXrcTCoajXm146vlGn4R2w/Aj9HNJMc4zMAgKgfM66uJcpvYowbZJVs2f
	 Qa3bbrxMDrc29fpJ7T0znKI21FspuKUPxRvEENkn9izaqPe+q9MrN5uPc7VsWA7gkv
	 6PIxotpzFuCYsobCtGiKZw/LNiri/i5Df6HLqdlkXfRzKvmAYOPX4hw/N78/QSSIc1
	 Lnhs7p4lmGCC/gyPq876Gn7+5uwBM70VwSNAFNw2CsZvUIh6H9P+9RAuR72quxHUE7
	 F1jos2TnMMJj+C90hu/WqMrLTIoM7LOLMpQ+3bj8awxRhbeK8QqQKK8pE4FvbRc+8F
	 mQhe8oxmA+65Q==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/7] devres: add devres_node_init()
Date: Tue,  3 Feb 2026 00:48:16 +0100
Message-ID: <20260202235210.55176-4-dakr@kernel.org>
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

Both alloc_dr() and devres_open_group() initialize devres_node.entry and
set devres_node.release. Add a helper, devres_node_init(), for this
pattern.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 0061c6564469..7cc46aeae792 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -42,6 +42,12 @@ struct devres_group {
 	/* -- 8 pointers */
 };
 
+static void devres_node_init(struct devres_node *node, dr_release_t release)
+{
+	INIT_LIST_HEAD(&node->entry);
+	node->release = release;
+}
+
 static void set_node_dbginfo(struct devres_node *node, const char *name,
 			     size_t size)
 {
@@ -124,8 +130,7 @@ static __always_inline struct devres *alloc_dr(dr_release_t release,
 	if (!(gfp & __GFP_ZERO))
 		memset(dr, 0, offsetof(struct devres, data));
 
-	INIT_LIST_HEAD(&dr->node.entry);
-	dr->node.release = release;
+	devres_node_init(&dr->node, release);
 	return dr;
 }
 
@@ -561,10 +566,8 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 	if (unlikely(!grp))
 		return NULL;
 
-	grp->node[0].release = &group_open_release;
-	grp->node[1].release = &group_close_release;
-	INIT_LIST_HEAD(&grp->node[0].entry);
-	INIT_LIST_HEAD(&grp->node[1].entry);
+	devres_node_init(&grp->node[0], &group_open_release);
+	devres_node_init(&grp->node[1], &group_close_release);
 	set_node_dbginfo(&grp->node[0], "grp<", 0);
 	set_node_dbginfo(&grp->node[1], "grp>", 0);
 	grp->id = grp;
-- 
2.52.0

