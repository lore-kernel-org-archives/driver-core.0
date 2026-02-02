Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73C35E544;
	Mon,  2 Feb 2026 23:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076349; cv=none; b=FDhIjvdYAARiI9zxVtsCbSfeyhR+G8gmLFdGD7fF3uLip+S1J5OCUD0M0KvJitqLJ4IP51FziGNGmuFgYpK7dAYl3nj9TfoYRhBhMOFDt2tJruxOz9I0kvbtX0rx5GeSQsM7fQ0ebE1qakqI7RqQZyyPeg4YpQnBKeIyFQ/DHJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076349; c=relaxed/simple;
	bh=Fxomvmj+N/kLOprt3owdSgn1glSM+8SyIrcusS///KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDkjUlfHeSc3/Sj9xxHKWV6VUbjcmUmkLFIxV1Z4W2LFGZmnfpiGZfoeh4q9yAtz9LdIhPkpnUprEp1gP83ubDlgVQjvkGu7rC4yuJUTWIJ/vnyQaWoitfEUb2Y24vg1OuR8I8b7Rhn2JoKzIDnpCd5puRVNWxuw0O+DB3tu+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qR8Xju/R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qR8Xju/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6E3C19421;
	Mon,  2 Feb 2026 23:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076349;
	bh=Fxomvmj+N/kLOprt3owdSgn1glSM+8SyIrcusS///KM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qR8Xju/RGTmClw8Pf3o9CH4wf8LbP4rM0toHGZOoxHQyTuN6aL9xs4JTT5p/z5TCr
	 +4Bssi9T5fWb1pO98i3XPy9OlA/muP7Tp6K2zUWI394nMZGFRq43gK7m8JMvG0mJMw
	 HyiMoo9Mha1OeaZA+vOQx3CdcBzTg6ulEMcxFkn8K+K252ACUnNgFLUuOMx6UJtfxy
	 t999H95bxtWAM3u5fTIoYnEDIo06gXERmj+AiaQUt6zIR7DezgBvjG1OOkNDdCigNM
	 vRpMQr71kOievADE4kaAVHWfn1Xw/fmJVVjjvU+hRjs4myFR8prujOfPi/xO46AXqw
	 7dZpKq3DH5dUQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 4/7] devres: don't require ARCH_DMA_MINALIGN for devres actions
Date: Tue,  3 Feb 2026 00:48:17 +0100
Message-ID: <20260202235210.55176-5-dakr@kernel.org>
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

Currently, devres actions are allocated with devres_alloc(), which
allocates a struct devres with a flexible array member for the actual
data of the resource. The flexible array member is aligned to
ARCH_DMA_MINALIGN, which is wasteful for devres actions that only need
to store a struct action_devres.

Introduce struct devres_action to handle devres actions separately from
struct devres, analogous to what we do for struct devres_group.

Speaking of which, without this patch struct devres_group is treated as
struct devres in release_nodes(). While this is not an actual bug, as
release callbacks for devres nodes in struct devres_group are empty
functions anyways, it is a bit messy and can be confusing.

(Note that besides devres actions, the Rust devres code will also make
use of this. The Rust compiler can figure out the correct alignment of T
in Devres<T> itself, i.e. no need to force a minimum alignment.)

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/devres.c | 147 +++++++++++++++++++++++++++++-------------
 1 file changed, 102 insertions(+), 45 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 7cc46aeae792..df015ef155e0 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -16,15 +16,19 @@
 #include "base.h"
 #include "trace.h"
 
+struct devres_node;
+typedef void (*dr_node_release_t)(struct device *dev, struct devres_node *node);
+
 struct devres_node {
 	struct list_head		entry;
-	dr_release_t			release;
+	dr_node_release_t		release;
 	const char			*name;
 	size_t				size;
 };
 
 struct devres {
 	struct devres_node		node;
+	dr_release_t			release;
 	/*
 	 * Some archs want to perform DMA into kmalloc caches
 	 * and need a guaranteed alignment larger than
@@ -42,7 +46,7 @@ struct devres_group {
 	/* -- 8 pointers */
 };
 
-static void devres_node_init(struct devres_node *node, dr_release_t release)
+static void devres_node_init(struct devres_node *node, dr_node_release_t release)
 {
 	INIT_LIST_HEAD(&node->entry);
 	node->release = release;
@@ -81,12 +85,12 @@ static void devres_log(struct device *dev, struct devres_node *node,
  * Release functions for devres group.  These callbacks are used only
  * for identification.
  */
-static void group_open_release(struct device *dev, void *res)
+static void group_open_release(struct device *dev, struct devres_node *node)
 {
 	/* noop */
 }
 
-static void group_close_release(struct device *dev, void *res)
+static void group_close_release(struct device *dev, struct devres_node *node)
 {
 	/* noop */
 }
@@ -113,6 +117,13 @@ static bool check_dr_size(size_t size, size_t *tot_size)
 	return true;
 }
 
+static void dr_node_release(struct device *dev, struct devres_node *node)
+{
+	struct devres *dr = container_of(node, struct devres, node);
+
+	dr->release(dev, dr->data);
+}
+
 static __always_inline struct devres *alloc_dr(dr_release_t release,
 					       size_t size, gfp_t gfp, int nid)
 {
@@ -130,7 +141,8 @@ static __always_inline struct devres *alloc_dr(dr_release_t release,
 	if (!(gfp & __GFP_ZERO))
 		memset(dr, 0, offsetof(struct devres, data));
 
-	devres_node_init(&dr->node, release);
+	devres_node_init(&dr->node, dr_node_release);
+	dr->release = release;
 	return dr;
 }
 
@@ -209,7 +221,7 @@ void devres_for_each_res(struct device *dev, dr_release_t release,
 			&dev->devres_head, entry) {
 		struct devres *dr = container_of(node, struct devres, node);
 
-		if (node->release != release)
+		if (dr->release != release)
 			continue;
 		if (match && !match(dev, dr->data, match_data))
 			continue;
@@ -268,7 +280,7 @@ static struct devres *find_dr(struct device *dev, dr_release_t release,
 	list_for_each_entry_reverse(node, &dev->devres_head, entry) {
 		struct devres *dr = container_of(node, struct devres, node);
 
-		if (node->release != release)
+		if (dr->release != release)
 			continue;
 		if (match && !match(dev, dr->data, match_data))
 			continue;
@@ -330,7 +342,7 @@ void *devres_get(struct device *dev, void *new_res,
 	unsigned long flags;
 
 	spin_lock_irqsave(&dev->devres_lock, flags);
-	dr = find_dr(dev, new_dr->node.release, match, match_data);
+	dr = find_dr(dev, new_dr->release, match, match_data);
 	if (!dr) {
 		add_dr(dev, &new_dr->node);
 		dr = new_dr;
@@ -504,15 +516,15 @@ static int remove_nodes(struct device *dev,
 
 static void release_nodes(struct device *dev, struct list_head *todo)
 {
-	struct devres *dr, *tmp;
+	struct devres_node *node, *tmp;
 
-	/* Release.  Note that both devres and devres_group are
-	 * handled as devres in the following loop.  This is safe.
+	/* Release.  Note that devres, devres_action and devres_group are
+	 * handled as devres_node in the following loop.  This is safe.
 	 */
-	list_for_each_entry_safe_reverse(dr, tmp, todo, node.entry) {
-		devres_log(dev, &dr->node, "REL");
-		dr->node.release(dev, dr->data);
-		kfree(dr);
+	list_for_each_entry_safe_reverse(node, tmp, todo, entry) {
+		devres_log(dev, node, "REL");
+		node->release(dev, node);
+		kfree(node);
 	}
 }
 
@@ -720,20 +732,22 @@ struct action_devres {
 	void (*action)(void *);
 };
 
-static int devm_action_match(struct device *dev, void *res, void *p)
-{
-	struct action_devres *devres = res;
-	struct action_devres *target = p;
+struct devres_action {
+	struct devres_node node;
+	struct action_devres action;
+};
 
-	return devres->action == target->action &&
-	       devres->data == target->data;
+static int devm_action_match(struct devres_action *devres, struct action_devres *target)
+{
+	return devres->action.action == target->action &&
+	       devres->action.data == target->data;
 }
 
-static void devm_action_release(struct device *dev, void *res)
+static void devm_action_release(struct device *dev, struct devres_node *node)
 {
-	struct action_devres *devres = res;
+	struct devres_action *devres = container_of(node, struct devres_action, node);
 
-	devres->action(devres->data);
+	devres->action.action(devres->action.data);
 }
 
 /**
@@ -748,32 +762,71 @@ static void devm_action_release(struct device *dev, void *res)
  */
 int __devm_add_action(struct device *dev, void (*action)(void *), void *data, const char *name)
 {
-	struct action_devres *devres;
+	struct devres_action *devres;
 
-	devres = __devres_alloc_node(devm_action_release, sizeof(struct action_devres),
-				     GFP_KERNEL, NUMA_NO_NODE, name);
+	devres = kzalloc(sizeof(*devres), GFP_KERNEL);
 	if (!devres)
 		return -ENOMEM;
 
-	devres->data = data;
-	devres->action = action;
+	devres_node_init(&devres->node, devm_action_release);
+	set_node_dbginfo(&devres->node, name, sizeof(*devres));
 
-	devres_add(dev, devres);
+	devres->action.data = data;
+	devres->action.action = action;
+
+	devres_node_add(dev, &devres->node);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__devm_add_action);
 
-bool devm_is_action_added(struct device *dev, void (*action)(void *), void *data)
+static struct devres_action *devres_action_find(struct device *dev,
+						void (*action)(void *),
+						void *data)
 {
-	struct action_devres devres = {
+	struct devres_node *node;
+	struct action_devres target = {
 		.data = data,
 		.action = action,
 	};
 
-	return devres_find(dev, devm_action_release, devm_action_match, &devres);
+	list_for_each_entry_reverse(node, &dev->devres_head, entry) {
+		struct devres_action *dr = container_of(node, struct devres_action, node);
+
+		if (node->release != devm_action_release)
+			continue;
+		if (devm_action_match(dr, &target))
+			return dr;
+	}
+
+	return NULL;
+}
+
+bool devm_is_action_added(struct device *dev, void (*action)(void *), void *data)
+{
+	guard(spinlock_irqsave)(&dev->devres_lock);
+
+	return !!devres_action_find(dev, action, data);
 }
 EXPORT_SYMBOL_GPL(devm_is_action_added);
 
+static struct devres_action *remove_action(struct device *dev,
+					   void (*action)(void *),
+					   void *data)
+{
+	struct devres_action *dr;
+
+	guard(spinlock_irqsave)(&dev->devres_lock);
+
+	dr = devres_action_find(dev, action, data);
+	if (!dr)
+		return ERR_PTR(-ENOENT);
+
+	list_del_init(&dr->node.entry);
+	devres_log(dev, &dr->node, "REM");
+
+	return dr;
+}
+
 /**
  * devm_remove_action_nowarn() - removes previously added custom action
  * @dev: Device that owns the action
@@ -798,13 +851,15 @@ int devm_remove_action_nowarn(struct device *dev,
 			      void (*action)(void *),
 			      void *data)
 {
-	struct action_devres devres = {
-		.data = data,
-		.action = action,
-	};
+	struct devres_action *dr;
+
+	dr = remove_action(dev, action, data);
+	if (IS_ERR(dr))
+		return PTR_ERR(dr);
 
-	return devres_destroy(dev, devm_action_release, devm_action_match,
-			      &devres);
+	kfree(dr);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(devm_remove_action_nowarn);
 
@@ -820,14 +875,16 @@ EXPORT_SYMBOL_GPL(devm_remove_action_nowarn);
  */
 void devm_release_action(struct device *dev, void (*action)(void *), void *data)
 {
-	struct action_devres devres = {
-		.data = data,
-		.action = action,
-	};
 
-	WARN_ON(devres_release(dev, devm_action_release, devm_action_match,
-			       &devres));
+	struct devres_action *dr;
+
+	dr = remove_action(dev, action, data);
+	if (WARN_ON(IS_ERR(dr)))
+		return;
+
+	dr->action.action(dr->action.data);
 
+	kfree(dr);
 }
 EXPORT_SYMBOL_GPL(devm_release_action);
 
-- 
2.52.0

