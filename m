Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967353346BB;
	Thu,  5 Feb 2026 22:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331684; cv=none; b=Kw6+Z9G9pQIwUv0WyDImXK57oCHfye56owAR6zZomuK1Dp8xNnRrhUZdJqARB4uT0Arz4O1ImNMunIqHJGlUrDjUFdh/jHhdBrRl9b3r1kTCfa96ODmEQLQX5RIeV0zfeG04Pbu2OA9H/ya9vUh+JCEK1KSGWORU8M63G1o9TMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331684; c=relaxed/simple;
	bh=VEdbtdw+/9sb6VaGFbTVQFlK6tbCe1e28MLlnk19tOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ngcl3KL4LCV39x4LGRGW8FYN3jdsUcdJXXF15prr266MQ5diAmpUnIZmlAzjjwzXeNi9xLA+9LsxclJScaD5BNBO7HCgZ2Yf0uDBzAn0CiJRJvOWbcsB7ZrsLJPwSIKuf2kX7e3pPnBpfYjH9gr/8edsRxrsG5TsLrCTy5pEMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cYYHPDTt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYYHPDTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A642C19421;
	Thu,  5 Feb 2026 22:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331684;
	bh=VEdbtdw+/9sb6VaGFbTVQFlK6tbCe1e28MLlnk19tOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cYYHPDTtFOpt4DoZNzAZiSOEQGMgvHCNnmvEJSDr7fixdBdGmKusCyEQigOMHKpqD
	 0OBpi2ABSxuP1bgNInajNS9CQLS6HBZmzOMdD9zpbrCA+MTArEnodwb1X53qyWArFC
	 RXcRTrSmKIAWIKxcMSPZ4j42z6Y8CK8e8HNNTfepNHEzW06hO9YIVXDTisxMHOYptB
	 kr0gdR3CppHxljlDJPQYaYaMod/lC8sFJLjoASTglvIeT2n1rWkXt6Ew/nsvCEoqnf
	 PPR46le33iDafdW1mx7emNbgmKol+SrUQbFblTfukeTjlxC/FSwu31+lj4fXZyvhBP
	 yM9DD1WEz004A==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 4/5] devres: rename and export set_node_dbginfo()
Date: Thu,  5 Feb 2026 23:31:27 +0100
Message-ID: <20260205224706.91996-6-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205224706.91996-2-dakr@kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename set_node_dbginfo() to devres_set_node_dbginfo() and export it
through base.h, such that we can access is from the Rust devres code.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   |  2 ++
 drivers/base/devres.c | 15 ++++++++-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 93b2020baa99..9aed7e2c78ef 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -238,6 +238,8 @@ void devres_node_init(struct devres_node *node, dr_node_release_t release,
 		      dr_node_free_t free_node);
 void devres_node_add(struct device *dev, struct devres_node *node);
 bool devres_node_remove(struct device *dev, struct devres_node *node);
+void devres_set_node_dbginfo(struct devres_node *node, const char *name,
+			     size_t size);
 void devres_for_each_res(struct device *dev, dr_release_t release,
 			 dr_match_t match, void *match_data,
 			 void (*fn)(struct device *, void *, void *),
diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 54a41ae599d0..89c7a2e3cd53 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -51,12 +51,13 @@ static inline void free_node(struct devres_node *node)
 	node->free_node(node);
 }
 
-static void set_node_dbginfo(struct devres_node *node, const char *name,
+void devres_set_node_dbginfo(struct devres_node *node, const char *name,
 			     size_t size)
 {
 	node->name = name;
 	node->size = size;
 }
+EXPORT_SYMBOL_GPL(devres_set_node_dbginfo);
 
 #ifdef CONFIG_DEBUG_DEVRES
 static int log_devres = 0;
@@ -190,7 +191,7 @@ void *__devres_alloc_node(dr_release_t release, size_t size, gfp_t gfp, int nid,
 	dr = alloc_dr(release, size, gfp | __GFP_ZERO, nid);
 	if (unlikely(!dr))
 		return NULL;
-	set_node_dbginfo(&dr->node, name, size);
+	devres_set_node_dbginfo(&dr->node, name, size);
 	return dr->data;
 }
 EXPORT_SYMBOL_GPL(__devres_alloc_node);
@@ -606,8 +607,8 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 
 	devres_node_init(&grp->node[0], &group_open_release, devres_group_free);
 	devres_node_init(&grp->node[1], &group_close_release, NULL);
-	set_node_dbginfo(&grp->node[0], "grp<", 0);
-	set_node_dbginfo(&grp->node[1], "grp>", 0);
+	devres_set_node_dbginfo(&grp->node[0], "grp<", 0);
+	devres_set_node_dbginfo(&grp->node[1], "grp>", 0);
 	grp->id = grp;
 	if (id)
 		grp->id = id;
@@ -795,7 +796,7 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
 		return -ENOMEM;
 
 	devres_node_init(&devres->node, devm_action_release, devm_action_free);
-	set_node_dbginfo(&devres->node, name, sizeof(*devres));
+	devres_set_node_dbginfo(&devres->node, name, sizeof(*devres));
 
 	devres->action.data = data;
 	devres->action.action = action;
@@ -956,7 +957,7 @@ void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
 	 * This is named devm_kzalloc_release for historical reasons
 	 * The initial implementation did not support kmalloc, only kzalloc
 	 */
-	set_node_dbginfo(&dr->node, "devm_kzalloc_release", size);
+	devres_set_node_dbginfo(&dr->node, "devm_kzalloc_release", size);
 	devres_add(dev, dr->data);
 	return dr->data;
 }
@@ -1027,7 +1028,7 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 	if (!new_dr)
 		return NULL;
 
-	set_node_dbginfo(&new_dr->node, "devm_krealloc_release", new_size);
+	devres_set_node_dbginfo(&new_dr->node, "devm_krealloc_release", new_size);
 
 	/*
 	 * The spinlock protects the linked list against concurrent
-- 
2.52.0

