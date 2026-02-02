Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF8361DB1;
	Mon,  2 Feb 2026 23:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076351; cv=none; b=qxmH/MkBULL1/NLLYtenMX75nzSF9uPj1upMQwHYdDmYkrSy/zkWuSN16PTy28zgSS7lB96LXcEsKmFE0d64yXnRndXhkQ+UHUGhH4qcThSyjjTYJw8r0BdlnTUpDyl220Ia4tKBFJtV0jMbKde/ZTCWb0JSL8ZSgbPvlSbw39M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076351; c=relaxed/simple;
	bh=lMGf0GNzmrgT+ma56cUd7lv7R6Miwyn/31/UTBxrMu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKsl3niOkOAKE9Di0YOM1TJ9ZqqhlPoZxqhnCaZ5BLJLGyJ7Buau5DB6PEL8uY8cZfMitXeXFYJ0i1qoJIlQDxx9Q30dMP2BWf5IyfYQ1GnCpMumI+kUsw8J5N2Ba/UtQXrUlHx0rjj/M/xv/T7AvUtbemJKI3Hqp4D2FVAEYso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7jT/EJg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7jT/EJg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACEAC19421;
	Mon,  2 Feb 2026 23:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076350;
	bh=lMGf0GNzmrgT+ma56cUd7lv7R6Miwyn/31/UTBxrMu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n7jT/EJgFLnJIzI67HwPf6ca/bVg2pabJYIypB5zrT+S2vwer8Tk1I9loESJGCxyG
	 RwxIZC++aRU/t19eL2DgdGYLzWPNLYGe4rwj4vtywqWqOjbWT+my8dVsu3njGgToQU
	 0pn8nK3GLC5yh4qE+uynQEVTSUOp5ogYgxFMKok5M5wMaI9Q5qK6oYN6v4/B44us/I
	 A9Hr54jq5NalFH+Z/8yu76dWkZKd7ONlye3h5NpwUCqHKyP+48701xaC9pjTgvGMrl
	 MCmYzqt8PodGYLk9ujRwqx54O8w/aeg0OM/o7L27V32T+AdgifO7cPXtXi8nkhChnW
	 Sl02PGKKJVHzg==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 5/7] devres: add free_node callback to struct devres_node
Date: Tue,  3 Feb 2026 00:48:18 +0100
Message-ID: <20260202235210.55176-6-dakr@kernel.org>
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

Currently, there are three "subclasses" of struct devres_node, which are
struct devres, struct devres_group, struct devres_action.

release_nodes(), which only knows about the base struct devres_node,
assumes that for all "subclasses" struct devres_node is the first member
in the structure and calls kfree() on struct devres_node.

While this technically works, we can still improve semantical
correctness and type safety with a corresponding free_node() callback.

Additionally, we will need this callback soon in the Rust Devres code,
to allocate and free the required memory on the Rust side.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c | 57 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index df015ef155e0..2006fe411b49 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -18,10 +18,12 @@
 
 struct devres_node;
 typedef void (*dr_node_release_t)(struct device *dev, struct devres_node *node);
+typedef void (*dr_node_free_t)(struct devres_node *node);
 
 struct devres_node {
 	struct list_head		entry;
 	dr_node_release_t		release;
+	dr_node_free_t			free_node;
 	const char			*name;
 	size_t				size;
 };
@@ -46,10 +48,18 @@ struct devres_group {
 	/* -- 8 pointers */
 };
 
-static void devres_node_init(struct devres_node *node, dr_node_release_t release)
+static void devres_node_init(struct devres_node *node,
+			     dr_node_release_t release,
+			     dr_node_free_t free_node)
 {
 	INIT_LIST_HEAD(&node->entry);
 	node->release = release;
+	node->free_node = free_node;
+}
+
+static inline void free_node(struct devres_node *node)
+{
+	node->free_node(node);
 }
 
 static void set_node_dbginfo(struct devres_node *node, const char *name,
@@ -124,6 +134,13 @@ static void dr_node_release(struct device *dev, struct devres_node *node)
 	dr->release(dev, dr->data);
 }
 
+static void dr_node_free(struct devres_node *node)
+{
+	struct devres *dr = container_of(node, struct devres, node);
+
+	kfree(dr);
+}
+
 static __always_inline struct devres *alloc_dr(dr_release_t release,
 					       size_t size, gfp_t gfp, int nid)
 {
@@ -141,7 +158,7 @@ static __always_inline struct devres *alloc_dr(dr_release_t release,
 	if (!(gfp & __GFP_ZERO))
 		memset(dr, 0, offsetof(struct devres, data));
 
-	devres_node_init(&dr->node, dr_node_release);
+	devres_node_init(&dr->node, dr_node_release, dr_node_free);
 	dr->release = release;
 	return dr;
 }
@@ -231,6 +248,11 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
 }
 EXPORT_SYMBOL_GPL(devres_for_each_res);
 
+static inline void free_dr(struct devres *dr)
+{
+	free_node(&dr->node);
+}
+
 /**
  * devres_free - Free device resource data
  * @res: Pointer to devres data to free
@@ -243,7 +265,7 @@ void devres_free(void *res)
 		struct devres *dr = container_of(res, struct devres, data);
 
 		BUG_ON(!list_empty(&dr->node.entry));
-		kfree(dr);
+		free_dr(dr);
 	}
 }
 EXPORT_SYMBOL_GPL(devres_free);
@@ -518,13 +540,10 @@ static void release_nodes(struct device *dev, struct list_head *todo)
 {
 	struct devres_node *node, *tmp;
 
-	/* Release.  Note that devres, devres_action and devres_group are
-	 * handled as devres_node in the following loop.  This is safe.
-	 */
 	list_for_each_entry_safe_reverse(node, tmp, todo, entry) {
 		devres_log(dev, node, "REL");
 		node->release(dev, node);
-		kfree(node);
+		free_node(node);
 	}
 }
 
@@ -557,6 +576,13 @@ int devres_release_all(struct device *dev)
 	return cnt;
 }
 
+static void devres_group_free(struct devres_node *node)
+{
+	struct devres_group *grp = container_of(node, struct devres_group, node[0]);
+
+	kfree(grp);
+}
+
 /**
  * devres_open_group - Open a new devres group
  * @dev: Device to open devres group for
@@ -578,8 +604,8 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 	if (unlikely(!grp))
 		return NULL;
 
-	devres_node_init(&grp->node[0], &group_open_release);
-	devres_node_init(&grp->node[1], &group_close_release);
+	devres_node_init(&grp->node[0], &group_open_release, devres_group_free);
+	devres_node_init(&grp->node[1], &group_close_release, NULL);
 	set_node_dbginfo(&grp->node[0], "grp<", 0);
 	set_node_dbginfo(&grp->node[1], "grp>", 0);
 	grp->id = grp;
@@ -750,6 +776,13 @@ static void devm_action_release(struct device *dev, struct devres_node *node)
 	devres->action.action(devres->action.data);
 }
 
+static void devm_action_free(struct devres_node *node)
+{
+	struct devres_action *action = container_of(node, struct devres_action, node);
+
+	kfree(action);
+}
+
 /**
  * __devm_add_action() - add a custom action to list of managed resources
  * @dev: Device that owns the action
@@ -768,7 +801,7 @@ int __devm_add_action(struct device *dev, void (*action)(void *), void *data, co
 	if (!devres)
 		return -ENOMEM;
 
-	devres_node_init(&devres->node, devm_action_release);
+	devres_node_init(&devres->node, devm_action_release, devm_action_free);
 	set_node_dbginfo(&devres->node, name, sizeof(*devres));
 
 	devres->action.data = data;
@@ -1012,7 +1045,7 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 	old_dr = find_dr(dev, devm_kmalloc_release, devm_kmalloc_match, ptr);
 	if (!old_dr) {
 		spin_unlock_irqrestore(&dev->devres_lock, flags);
-		kfree(new_dr);
+		free_dr(new_dr);
 		WARN(1, "Memory chunk not managed or managed by a different device.");
 		return NULL;
 	}
@@ -1032,7 +1065,7 @@ void *devm_krealloc(struct device *dev, void *ptr, size_t new_size, gfp_t gfp)
 	 * list. This is also the reason why we must not use devm_kfree() - the
 	 * links are no longer valid.
 	 */
-	kfree(old_dr);
+	free_dr(old_dr);
 
 	return new_dr->data;
 }
-- 
2.52.0

