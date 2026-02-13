Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3C4303A01;
	Fri, 13 Feb 2026 22:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020458; cv=none; b=IuJ1jUCWPGS0HgVqz/eUZ+fa4mPmneZDJ9smnkE115ckmwwJTXNpemEn1/zqTZlRepqLp73qS6JWlfLnb1aebi1Wnh1ottizhDdOil8uACfhK3O311Yl9TwTNSYCQ36cvxaGdWFG4Z0Fw2hrNzFf/7WV0ID767lhnjcc9tRnXyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020458; c=relaxed/simple;
	bh=xTZQEObhLQk1t7qft0AgT5jc/nmzg9hJRLdW3uNk2L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ct+3pwiWMeNVPwopMnzUo4QHrHBPFxzPxU3cQfsTCfQF0zHP8EwgwciT5xTD3WIT94o9lKh1paTKDDGDxgzCEqKCP7yOjWupqZP9x7kv69vcJFVyzrO/mN/7/+hnut57Z+ox1/97qC+7JluZ75LwP2T4Q9Cfy3a8VUIB51yrHDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eH9YiW5u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eH9YiW5u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35069C116C6;
	Fri, 13 Feb 2026 22:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771020458;
	bh=xTZQEObhLQk1t7qft0AgT5jc/nmzg9hJRLdW3uNk2L4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eH9YiW5uG+tD2D/0+GjEb+a93+CdXhkw+OxvR+jNbq/eM9pzSnC9NTuSjm85lGvhT
	 9JwWxseWpVRwK47GTjrycnVyDjKdnd5jFIFhIlki0zUsUNh77MQm7iUqRcacmIP5/r
	 96mSQu4mGEYfmvS34wZ/ipDJqIKPCziv2CPAvAqSM8RReaOgQN5v+I3NJk6/oN+Uwc
	 IuBff638i1qOs1FvNst5IB5pbf8tTumGLxcq5+F7P61XaM8JwDy/fygbYhjF7idKCT
	 XA6TpIzq/CNODWgPc9mZDQ01Mc00m6amtZ/pQwwxPmzrxELhZzKRf4mPEoiuaPFA3/
	 7DmkJKIJv5HIQ==
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
Subject: [PATCH v2 4/5] devres: rename and export set_node_dbginfo()
Date: Fri, 13 Feb 2026 23:07:14 +0100
Message-ID: <20260213220718.82835-5-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213220718.82835-1-dakr@kernel.org>
References: <20260213220718.82835-1-dakr@kernel.org>
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
 drivers/base/devres.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

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
index bf51404e2bf4..e36d2cc7723d 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -50,7 +50,7 @@ static inline void free_node(struct devres_node *node)
 	node->free_node(node);
 }
 
-static void set_node_dbginfo(struct devres_node *node, const char *name,
+void devres_set_node_dbginfo(struct devres_node *node, const char *name,
 			     size_t size)
 {
 	node->name = name;
@@ -189,7 +189,7 @@ void *__devres_alloc_node(dr_release_t release, size_t size, gfp_t gfp, int nid,
 	dr = alloc_dr(release, size, gfp | __GFP_ZERO, nid);
 	if (unlikely(!dr))
 		return NULL;
-	set_node_dbginfo(&dr->node, name, size);
+	devres_set_node_dbginfo(&dr->node, name, size);
 	return dr->data;
 }
 EXPORT_SYMBOL_GPL(__devres_alloc_node);
@@ -603,8 +603,8 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 
 	devres_node_init(&grp->node[0], &group_open_release, devres_group_free);
 	devres_node_init(&grp->node[1], &group_close_release, NULL);
-	set_node_dbginfo(&grp->node[0], "grp<", 0);
-	set_node_dbginfo(&grp->node[1], "grp>", 0);
+	devres_set_node_dbginfo(&grp->node[0], "grp<", 0);
+	devres_set_node_dbginfo(&grp->node[1], "grp>", 0);
 	grp->id = grp;
 	if (id)
 		grp->id = id;
@@ -792,7 +792,7 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
 		return -ENOMEM;
 
 	devres_node_init(&devres->node, devm_action_release, devm_action_free);
-	set_node_dbginfo(&devres->node, name, sizeof(*devres));
+	devres_set_node_dbginfo(&devres->node, name, sizeof(*devres));
 
 	devres->action.data = data;
 	devres->action.action = action;
@@ -953,7 +953,7 @@ void *devm_kmalloc(struct device *dev, size_t size, gfp_t gfp)
 	 * This is named devm_kzalloc_release for historical reasons
 	 * The initial implementation did not support kmalloc, only kzalloc
 	 */
-	set_node_dbginfo(&dr->node, "devm_kzalloc_release", size);
+	devres_set_node_dbginfo(&dr->node, "devm_kzalloc_release", size);
 	devres_add(dev, dr->data);
 	return dr->data;
 }
@@ -1024,7 +1024,7 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 	if (!new_dr)
 		return NULL;
 
-	set_node_dbginfo(&new_dr->node, "devm_krealloc_release", new_size);
+	devres_set_node_dbginfo(&new_dr->node, "devm_krealloc_release", new_size);
 
 	/*
 	 * The spinlock protects the linked list against concurrent
-- 
2.53.0

