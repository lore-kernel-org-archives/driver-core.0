Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FB73B3BF5
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 17:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147043; cv=none; b=YCODuVSDPo2A23zllvOaZ6IN3KGTf4dowrK+/FgXOFti2ASJRA/Azan4jZd9yoHMeKqfAh4ILxY2Y1gwv+IPFBaXv7xTMthneFLE1VEUL/vBJkhq2i/eBj+KkSp9vAurLXhmHetN/YuE3hy/KW9yfPLSrcJV3eUZUsoEpbHgBV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147043; c=relaxed/simple;
	bh=kLNiqQkL7GeyIfrtuT1kEdX2QS3tRVpouEpvcL+cGfc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UwFMGyr5amVqXNvNoIZD4vAyAKwnhVcEYUDug9QEGVl9CX5jFpE18WE71yO2ucfnTuNLAHomeUYvSPvWovBrDjNl8Z1fPeFjKocGAWuOfpKd96hAwc55oCWM5NnJrQ1fa0pwW65P3lQa6yWIjpSCKd/QGazITTZQBPa8MsnAvyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=bdX21DXz; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="bdX21DXz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1789147040; x=1820683040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4iQ+WKggqfUEWjoiQT0+l7crgD37MzywM0ZRkluxbrI=;
  b=bdX21DXzRVuH943u5tKTb8yyMbkE8ZF2vtr7Xvn8lbmrfdJK4kJmWTcJ
   J0wNW90LvwPRLcy9wqmBPIOg0WUONg0rt19itbg43hsP4K8iLBJ7N6bqw
   vYT5jNG8VXHPn96LVCAhnnMtEW/yq/k9CNTPROtsZ/p7iaqaR7PSXdHBz
   1dE5rdXbVhvi2KmMR3gSVMnrxCkBQmHRWHQvksCDIECAQFfjpWEffb4Gc
   TZ6uA2Yx7eB5hrhWQov0rNUUQlg9UFX9wg5IotdVrEnIbUL3T1RqmCOMD
   wKZrDDuIXLJwmoMuYMiCTv9El8dqLlCxYY5UnTwyX6RkOI4J6SVBxgE3Y
   g==;
X-CSE-ConnectionGUID: jQd18819TDuC11y2i5oNqg==
X-CSE-MsgGUID: Rg0kZR88SDy93PnDQIAuFA==
X-IronPort-AV: E=Sophos;i="6.27,97,1787011200"; 
   d="scan'208";a="27945836"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:17:16 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:22032]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.34:2525] with esmtp (Farcaster)
 id 238411d2-fc3c-44d3-8c12-737f824f9dfe; Fri, 11 Sep 2026 17:17:16 +0000 (UTC)
X-Farcaster-Flow-ID: 238411d2-fc3c-44d3-8c12-737f824f9dfe
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 11 Sep 2026 17:17:16 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Fri, 11 Sep 2026
 17:17:14 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo
	<tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Xu Yang <xu.yang_2@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	<nh-open-source@amazon.com>
Subject: [PATCH 2/3] driver core: Index class glue directories by parent kobject
Date: Fri, 11 Sep 2026 19:16:04 +0200
Message-ID: <20260911171639.68348-2-sakacpav@amazon.de>
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
X-ClientProxiedBy: EX19D036UWB003.ant.amazon.com (10.13.139.172) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

get_device_parent() finds a parent's glue directory by walking the
class's glue_dirs kset list under gdp_mutex, so one per parent, as
vfio-dev needs per SR-IOV VF, is quadratic.

Index them by parent kobject in an rbtree embedded in the class's
subsys_private, which dies with the kset list it indexes, so no
per-entry class check is needed: two classes below one parent are told
apart by tree selection. The key is a kobject because a parentless
class device hangs off the shared "virtual" kobject, referenced by the
glue dir while indexed. The rb_node lives in struct class_dir, adding
no allocation and no failure mode.

gdp_mutex serializes the index, as it has glue dir lookup/create/remove
since commit 77d3d7c1d561f
("driver-core: fix race condition in get_device_parent()") and
commit e4a60d1390609
("sysfs: driver core: Fix glue dir race condition by gdp_mutex").

A kernfs name lookup in the parent's directory needs no new state, but
takes the kernfs root rwsem under gdp_mutex, behind the writes
concurrent sysfs directory creation generates.

A KUnit suite covers the index: reuse of one parent's glue directory,
two classes below one parent, the parentless "virtual" cases, reap and
recreate, name collision, many parents, device_move(), and class
teardown.

Assisted-by: LLM
Signed-off-by: Pavol Sakac <sakacpav@amazon.de>
---
 drivers/base/base.h               |   4 +
 drivers/base/core.c               | 112 +++++--
 drivers/base/test/.kunitconfig    |   1 +
 drivers/base/test/Kconfig         |  12 +
 drivers/base/test/Makefile        |   2 +
 drivers/base/test/glue-dir-test.c | 466 ++++++++++++++++++++++++++++++
 6 files changed, 566 insertions(+), 31 deletions(-)
 create mode 100644 drivers/base/test/glue-dir-test.c

diff --git a/drivers/base/base.h b/drivers/base/base.h
index a5b7abc10ff0..f5d608f4aaa5 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -11,6 +11,7 @@
  *
  */
 #include <linux/notifier.h>
+#include <linux/rbtree_types.h>
 
 /**
  * struct subsys_private - structure to hold the private to the driver core
@@ -32,6 +33,8 @@
  * @dev_root: Default device to use as the parent.
  * @glue_dirs: "glue" directory to put in-between the parent device to
  *	       avoid namespace conflicts
+ * @glue_dirs_index: the class's glue dirs by parent kobject, under gdp_mutex;
+ *		     zeroed is an empty rb_root
  * @class: pointer back to the struct class that this structure is associated
  *	   with.
  * @lock_key: Lock class key for use by the lock validator
@@ -55,6 +58,7 @@ struct subsys_private {
 	struct device *dev_root;
 
 	struct kset glue_dirs;
+	struct rb_root glue_dirs_index;
 	const struct class *class;
 
 	struct lock_class_key lock_key;
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c0c373998a1..5dea641cbdb6 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -26,6 +26,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/rbtree.h>
 #include <linux/sched/mm.h>
 #include <linux/sched/signal.h>
 #include <linux/slab.h>
@@ -3263,6 +3264,8 @@ struct kobject *virtual_device_parent(void)
 struct class_dir {
 	struct kobject kobj;
 	const struct class *class;
+	/* in the class's glue_dirs_index, keyed by kobj.parent (gdp_mutex) */
+	struct rb_node index_node;
 };
 
 #define to_class_dir(obj) container_of(obj, struct class_dir, kobj)
@@ -3298,6 +3301,7 @@ static struct kobject *class_dir_create_and_add(struct subsys_private *sp,
 
 	dir->class = sp->class;
 	kobject_init(&dir->kobj, &class_dir_ktype);
+	RB_CLEAR_NODE(&dir->index_node);
 
 	dir->kobj.kset = &sp->glue_dirs;
 
@@ -3311,6 +3315,66 @@ static struct kobject *class_dir_create_and_add(struct subsys_private *sp,
 
 static DEFINE_MUTEX(gdp_mutex);
 
+/*
+ * Glue-dir lookup index: each class's glue dirs by parent kobject, in an
+ * rbtree embedded in its subsys_private.  The glue_dirs kset remains the
+ * membership and identity authority (kobj->kset); the index replaces only
+ * the list walk in get_device_parent() and dies with the subsys_private
+ * generation that owns both.
+ */
+static int glue_dir_cmp_key(const void *key, const struct rb_node *node)
+{
+	const struct class_dir *cd = rb_entry(node, struct class_dir,
+					      index_node);
+
+	if ((unsigned long)key < (unsigned long)cd->kobj.parent)
+		return -1;
+	return (unsigned long)key > (unsigned long)cd->kobj.parent;
+}
+
+static bool glue_dir_less(struct rb_node *lhs, const struct rb_node *rhs)
+{
+	const struct class_dir *cd = rb_entry(lhs, struct class_dir,
+					      index_node);
+
+	return glue_dir_cmp_key(cd->kobj.parent, rhs) < 0;
+}
+
+static struct kobject *glue_dir_lookup(struct subsys_private *sp,
+				       struct kobject *parent_kobj)
+{
+	struct rb_node *node;
+
+	lockdep_assert_held(&gdp_mutex);
+
+	node = rb_find(parent_kobj, &sp->glue_dirs_index, glue_dir_cmp_key);
+	if (!node)
+		return NULL;
+
+	return kobject_get(&rb_entry(node, struct class_dir, index_node)->kobj);
+}
+
+static void glue_dir_index(struct subsys_private *sp, struct kobject *glue_dir)
+{
+	lockdep_assert_held(&gdp_mutex);
+
+	/* Lookup-before-create under gdp_mutex keeps keys unique. */
+	rb_add(&to_class_dir(glue_dir)->index_node, &sp->glue_dirs_index,
+	       glue_dir_less);
+}
+
+/*
+ * rb_erase() uses only recorded tree links, but glue_dir_less() keys on
+ * kobj.parent: the dir, indexed at create, leaves the index before
+ * kobject_del() clears its parent -- an indexed node's key must never mutate.
+ */
+static void glue_dir_unindex(struct subsys_private *sp,
+			     struct kobject *glue_dir)
+{
+	lockdep_assert_held(&gdp_mutex);
+	rb_erase(&to_class_dir(glue_dir)->index_node, &sp->glue_dirs_index);
+}
+
 static struct kobject *get_device_parent(struct device *dev,
 					 struct device *parent)
 {
@@ -3338,13 +3402,7 @@ static struct kobject *get_device_parent(struct device *dev,
 		mutex_lock(&gdp_mutex);
 
 		/* find our class-directory at the parent and reference it */
-		spin_lock(&sp->glue_dirs.list_lock);
-		list_for_each_entry(k, &sp->glue_dirs.list, entry)
-			if (k->parent == parent_kobj) {
-				kobj = kobject_get(k);
-				break;
-			}
-		spin_unlock(&sp->glue_dirs.list_lock);
+		kobj = glue_dir_lookup(sp, parent_kobj);
 		if (kobj) {
 			mutex_unlock(&gdp_mutex);
 			subsys_put(sp);
@@ -3354,6 +3412,8 @@ static struct kobject *get_device_parent(struct device *dev,
 		/* or create a new class-directory at the parent device */
 		k = class_dir_create_and_add(sp, parent_kobj);
 		/* do not emit an uevent for this simple "glue" directory */
+		if (!IS_ERR(k))
+			glue_dir_index(sp, k);
 		mutex_unlock(&gdp_mutex);
 		subsys_put(sp);
 		return k;
@@ -3375,28 +3435,6 @@ static struct kobject *get_device_parent(struct device *dev,
 	return NULL;
 }
 
-static inline bool live_in_glue_dir(struct kobject *kobj,
-				    struct device *dev)
-{
-	struct subsys_private *sp;
-	bool retval;
-
-	if (!kobj || !dev->class)
-		return false;
-
-	sp = class_to_subsys(dev->class);
-	if (!sp)
-		return false;
-
-	if (kobj->kset == &sp->glue_dirs)
-		retval = true;
-	else
-		retval = false;
-
-	subsys_put(sp);
-	return retval;
-}
-
 static inline struct kobject *get_glue_dir(struct device *dev)
 {
 	return dev->kobj.parent;
@@ -3426,11 +3464,19 @@ static inline bool kobject_has_children(struct kobject *kobj)
  */
 static void cleanup_glue_dir(struct device *dev, struct kobject *glue_dir)
 {
+	struct subsys_private *sp;
 	unsigned int ref;
 
 	/* see if we live in a "glue" directory */
-	if (!live_in_glue_dir(glue_dir, dev))
+	if (!glue_dir || !dev->class)
+		return;
+	sp = class_to_subsys(dev->class);
+	if (!sp)
+		return;
+	if (glue_dir->kset != &sp->glue_dirs) {
+		subsys_put(sp);
 		return;
+	}
 
 	mutex_lock(&gdp_mutex);
 	/**
@@ -3482,10 +3528,14 @@ static void cleanup_glue_dir(struct device *dev, struct kobject *glue_dir)
 	 * for glue_dir kobj is 1.
 	 */
 	ref = kref_read(&glue_dir->kref);
-	if (!kobject_has_children(glue_dir) && !--ref)
+	if (!kobject_has_children(glue_dir) && !--ref) {
+		glue_dir_unindex(sp, glue_dir);
 		kobject_del(glue_dir);
+	}
 	kobject_put(glue_dir);
 	mutex_unlock(&gdp_mutex);
+	/* outside gdp_mutex: the last put runs the class's release callback */
+	subsys_put(sp);
 }
 
 static int device_add_class_symlinks(struct device *dev)
diff --git a/drivers/base/test/.kunitconfig b/drivers/base/test/.kunitconfig
index 473923f0998b..28322bad39a7 100644
--- a/drivers/base/test/.kunitconfig
+++ b/drivers/base/test/.kunitconfig
@@ -1,2 +1,3 @@
 CONFIG_KUNIT=y
 CONFIG_DM_KUNIT_TEST=y
+CONFIG_GLUE_DIR_KUNIT_TEST=y
diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 542ce07530a1..253b5bd96aff 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -24,3 +24,15 @@ config DRIVER_SWNODE_KUNIT_TEST
 	tristate "KUnit Tests for software node fw_devlink links" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+
+config GLUE_DIR_KUNIT_TEST
+	tristate "KUnit Tests for class glue directories" if !KUNIT_ALL_TESTS
+	depends on KUNIT && SYSFS
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to test the class glue directories the driver
+	  core places class devices under: that siblings share one, that a
+	  reaped one is created again, and that a same-named child which is
+	  not a glue directory is never mistaken for one.
+
+	  If unsure say N.
diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index 9ced7bbd569f..f13f0c399bea 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
 CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 
 obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) += swnode-devlink-test.o
+
+obj-$(CONFIG_GLUE_DIR_KUNIT_TEST) += glue-dir-test.o
diff --git a/drivers/base/test/glue-dir-test.c b/drivers/base/test/glue-dir-test.c
new file mode 100644
index 000000000000..fcdfdd3acd6f
--- /dev/null
+++ b/drivers/base/test/glue-dir-test.c
@@ -0,0 +1,466 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for the class glue-directory index: a class device whose
+ * parent is not itself a class device is placed under a per-parent "glue"
+ * directory named after the class, which get_device_parent() finds
+ * through a per-class index keyed by the parent kobject.  Every case
+ * drives that lookup through plain device registration.
+ */
+
+#include <kunit/resource.h>
+#include <kunit/test.h>
+
+#include <linux/device.h>
+#include <linux/kernfs.h>
+#include <linux/kobject.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+static void glue_dev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
+static void glue_dev_unregister(void *data)
+{
+	device_unregister(data);
+}
+
+static void glue_root_unregister(void *data)
+{
+	root_device_unregister(data);
+}
+
+static void glue_class_destroy(void *data)
+{
+	class_destroy(data);
+}
+
+/* Does a child named @name exist under @parent? */
+static bool glue_child_visible(struct kobject *parent, const char *name)
+{
+	struct kernfs_node *kn = kernfs_find_and_get(parent->sd, name);
+	bool found = kn;
+
+	kernfs_put(kn);
+	return found;
+}
+
+/* Freed by glue_dev_release() when the last reference drops. */
+static struct device *glue_dev_alloc(struct kunit *test,
+				     struct device *parent,
+				     const struct class *class,
+				     const char *name)
+{
+	struct device *dev;
+	int ret;
+
+	dev = kzalloc_obj(*dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	device_initialize(dev);
+	dev->parent = parent;
+	dev->class = class;
+	dev->release = glue_dev_release;
+
+	ret = dev_set_name(dev, "%s", name);
+	if (ret)
+		put_device(dev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	return dev;
+}
+
+/* Register a class device; unregistered again by a deferred kunit action. */
+static struct device *glue_dev_add(struct kunit *test, struct device *parent,
+				   const struct class *class,
+				   const char *name)
+{
+	struct device *dev = glue_dev_alloc(test, parent, class, name);
+	int ret;
+
+	ret = device_add(dev);
+	if (ret)
+		put_device(dev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test,
+							glue_dev_unregister,
+							dev), 0);
+	return dev;
+}
+
+static struct class *glue_class(struct kunit *test, const char *name)
+{
+	struct class *class = class_create(name);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, class);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test,
+							glue_class_destroy,
+							class), 0);
+	return class;
+}
+
+static struct device *glue_root(struct kunit *test, const char *name)
+{
+	struct device *root = root_device_register(name);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, root);
+	KUNIT_ASSERT_EQ(test, kunit_add_action_or_reset(test,
+							glue_root_unregister,
+							root), 0);
+	return root;
+}
+
+/* Siblings share one glue dir: the second lookup has to hit the first. */
+static void glue_test_reuse(struct kunit *test)
+{
+	struct device *root, *dev_a, *dev_b;
+	struct kobject *glue;
+	struct class *class;
+
+	class = glue_class(test, "glue_kunit_reuse");
+	root = glue_root(test, "glue_kunit_reuse_root");
+
+	dev_a = glue_dev_add(test, root, class, "reuseA");
+	dev_b = glue_dev_add(test, root, class, "reuseB");
+
+	glue = dev_a->kobj.parent;
+	KUNIT_ASSERT_NOT_NULL(test, glue);
+	KUNIT_EXPECT_PTR_NE(test, glue, &root->kobj);
+	KUNIT_EXPECT_PTR_EQ(test, glue, dev_b->kobj.parent);
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(glue, "reuseA"));
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(glue, "reuseB"));
+}
+
+/* Two classes below one parent: each consults only its own class's index. */
+static void glue_test_cross_class(struct kunit *test)
+{
+	struct class *class_a, *class_b;
+	struct device *root, *dev_a, *dev_b;
+
+	class_a = glue_class(test, "glue_kunit_xclass_a");
+	class_b = glue_class(test, "glue_kunit_xclass_b");
+	root = glue_root(test, "glue_kunit_xclass_root");
+
+	dev_a = glue_dev_add(test, root, class_a, "xclassA");
+	dev_b = glue_dev_add(test, root, class_b, "xclassB");
+
+	KUNIT_ASSERT_NOT_NULL(test, dev_a->kobj.parent);
+	KUNIT_EXPECT_PTR_NE(test, dev_a->kobj.parent, dev_b->kobj.parent);
+}
+
+/* Reap retires the index entry: the next add must not find the freed dir. */
+static void glue_test_reap_recreate(struct kunit *test)
+{
+	struct device *root, *dev;
+	struct class *class;
+
+	class = glue_class(test, "glue_kunit_reap");
+	root = glue_root(test, "glue_kunit_reap_root");
+
+	dev = glue_dev_add(test, root, class, "reap0");
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(&root->kobj,
+						   "glue_kunit_reap"));
+
+	/* last child gone: the glue dir goes with it ... */
+	kunit_release_action(test, glue_dev_unregister, dev);
+	KUNIT_EXPECT_FALSE(test, glue_child_visible(&root->kobj,
+						    "glue_kunit_reap"));
+
+	/* ... and a further registration recreates it */
+	dev = glue_dev_add(test, root, class, "reap1");
+	KUNIT_ASSERT_NOT_NULL(test, dev->kobj.parent);
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(dev->kobj.parent, "reap1"));
+}
+
+static ssize_t glue_kunit_collide_show(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	return sysfs_emit(buf, "\n");
+}
+static DEVICE_ATTR_RO(glue_kunit_collide);
+
+/*
+ * A same-named child that is not a glue dir must never be taken for one:
+ * the colliding add fails on the duplicate sysfs create and leaves
+ * nothing stale, so the same registration succeeds once the file is gone.
+ */
+static void glue_test_name_collision(struct kunit *test)
+{
+	struct device *root, *dev;
+	struct kernfs_node *kn;
+	struct class *class;
+
+	class = glue_class(test, "glue_kunit_collide");
+	root = glue_root(test, "glue_kunit_collide_root");
+
+	KUNIT_ASSERT_EQ(test,
+			device_create_file(root,
+					   &dev_attr_glue_kunit_collide), 0);
+
+	dev = glue_dev_alloc(test, root, class, "collide0");
+	KUNIT_ASSERT_EQ(test, device_add(dev), -EEXIST);
+	put_device(dev);
+
+	/* the same-named child is still the attribute file */
+	kn = kernfs_find_and_get(root->kobj.sd, "glue_kunit_collide");
+	KUNIT_ASSERT_NOT_NULL(test, kn);
+	KUNIT_EXPECT_EQ(test, kernfs_type(kn), KERNFS_FILE);
+	kernfs_put(kn);
+
+	device_remove_file(root, &dev_attr_glue_kunit_collide);
+	dev = glue_dev_add(test, root, class, "collide0");
+
+	/* and it lands in a glue dir of the class's name, not on the root */
+	KUNIT_ASSERT_NOT_NULL(test, dev->kobj.parent);
+	KUNIT_EXPECT_PTR_NE(test, dev->kobj.parent, &root->kobj);
+	KUNIT_EXPECT_STREQ(test, kobject_name(dev->kobj.parent), class->name);
+	KUNIT_EXPECT_PTR_EQ(test, dev->kobj.parent->parent, &root->kobj);
+}
+
+/*
+ * A parentless class device is keyed on the shared "virtual" kobject
+ * rather than on a device, so two of them still share one glue dir.
+ */
+static void glue_test_virtual_parent(struct kunit *test)
+{
+	struct device *dev_a, *dev_b;
+	struct kobject *glue;
+	struct class *class;
+
+	class = glue_class(test, "glue_kunit_virtual");
+
+	dev_a = glue_dev_add(test, NULL, class, "virtA");
+	dev_b = glue_dev_add(test, NULL, class, "virtB");
+
+	glue = dev_a->kobj.parent;
+	KUNIT_ASSERT_NOT_NULL(test, glue);
+	KUNIT_EXPECT_PTR_EQ(test, glue, dev_b->kobj.parent);
+	KUNIT_ASSERT_NOT_NULL(test, glue->parent);
+	KUNIT_EXPECT_STREQ(test, kobject_name(glue->parent), "virtual");
+}
+
+/*
+ * Every class's parentless devices share the one "virtual" key; two
+ * classes below it must still land in dirs of their own class's name.
+ */
+static void glue_test_virtual_cross_class(struct kunit *test)
+{
+	struct class *class_a, *class_b;
+	struct device *dev_a, *dev_b;
+	struct kobject *glue_a, *glue_b;
+
+	class_a = glue_class(test, "glue_kunit_virtxc_a");
+	class_b = glue_class(test, "glue_kunit_virtxc_b");
+
+	dev_a = glue_dev_add(test, NULL, class_a, "virtxcA");
+	dev_b = glue_dev_add(test, NULL, class_b, "virtxcB");
+
+	glue_a = dev_a->kobj.parent;
+	glue_b = dev_b->kobj.parent;
+	KUNIT_ASSERT_NOT_NULL(test, glue_a);
+	KUNIT_ASSERT_NOT_NULL(test, glue_b);
+
+	KUNIT_EXPECT_PTR_NE(test, glue_a, glue_b);
+	KUNIT_EXPECT_STREQ(test, kobject_name(glue_a), class_a->name);
+	KUNIT_EXPECT_STREQ(test, kobject_name(glue_b), class_b->name);
+
+	/* both dirs hang off the one shared key */
+	KUNIT_ASSERT_NOT_NULL(test, glue_a->parent);
+	KUNIT_EXPECT_PTR_EQ(test, glue_a->parent, glue_b->parent);
+	KUNIT_EXPECT_STREQ(test, kobject_name(glue_a->parent), "virtual");
+}
+
+#define GLUE_MANY_PARENTS 256
+
+/*
+ * With hundreds of parents indexed, every lookup must resolve the dir
+ * anchored at its own parent -- the case that falsifies the key comparison.
+ */
+static void glue_test_many_parents(struct kunit *test)
+{
+	struct device **roots, **devs;
+	struct class *class;
+	char name[32];
+	int i;
+
+	class = glue_class(test, "glue_kunit_many");
+
+	roots = kunit_kcalloc(test, GLUE_MANY_PARENTS, sizeof(*roots),
+			      GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, roots);
+	devs = kunit_kcalloc(test, GLUE_MANY_PARENTS, sizeof(*devs),
+			     GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, devs);
+
+	for (i = 0; i < GLUE_MANY_PARENTS; i++) {
+		snprintf(name, sizeof(name), "glue_kunit_many_root%d", i);
+		roots[i] = glue_root(test, name);
+		snprintf(name, sizeof(name), "many%d", i);
+		devs[i] = glue_dev_add(test, roots[i], class, name);
+	}
+
+	/* Distinctness via anchoring: a kobject has one parent. */
+	for (i = 0; i < GLUE_MANY_PARENTS; i++) {
+		struct kobject *glue = devs[i]->kobj.parent;
+
+		KUNIT_ASSERT_NOT_NULL(test, glue);
+		KUNIT_EXPECT_PTR_EQ(test, glue->parent, &roots[i]->kobj);
+	}
+}
+
+/*
+ * device_move() looks up against the new parent and must leave the old
+ * parent's entry behind as a valid hit: the old glue dir is never reaped
+ * (base behaviour), so a later device under the old parent reuses it.
+ */
+static void glue_test_device_move(struct kunit *test)
+{
+	struct device *root_a, *root_b, *dev, *dev_a2;
+	struct kobject *old_glue, *new_glue;
+	struct class *class;
+
+	class = glue_class(test, "glue_kunit_move");
+	root_a = glue_root(test, "glue_kunit_move_rootA");
+	root_b = glue_root(test, "glue_kunit_move_rootB");
+
+	dev = glue_dev_add(test, root_a, class, "move0");
+	old_glue = dev->kobj.parent;
+	KUNIT_ASSERT_NOT_NULL(test, old_glue);
+
+	KUNIT_ASSERT_EQ(test, device_move(dev, root_b, DPM_ORDER_NONE), 0);
+
+	new_glue = dev->kobj.parent;
+	KUNIT_ASSERT_NOT_NULL(test, new_glue);
+	KUNIT_EXPECT_PTR_NE(test, new_glue, old_glue);
+	KUNIT_EXPECT_PTR_EQ(test, new_glue->parent, &root_b->kobj);
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(new_glue, "move0"));
+
+	/* nothing reaps the old dir on the success path: it is still there */
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(&root_a->kobj,
+						   "glue_kunit_move"));
+
+	/* and it must still be the hit for the old parent */
+	dev_a2 = glue_dev_add(test, root_a, class, "move1");
+	KUNIT_EXPECT_PTR_EQ(test, dev_a2->kobj.parent, old_glue);
+}
+
+/*
+ * Removing one of two siblings must not retire the shared glue dir:
+ * the survivor keeps it visible, and a further sibling still reuses
+ * it -- a spurious unindex would fail that add on a duplicate create.
+ */
+static void glue_test_no_reap(struct kunit *test)
+{
+	struct device *root, *dev_a, *dev_b, *dev_c;
+	struct kobject *glue;
+	struct class *class;
+
+	class = glue_class(test, "glue_kunit_noreap");
+	root = glue_root(test, "glue_kunit_noreap_root");
+
+	dev_a = glue_dev_add(test, root, class, "noreapA");
+	dev_b = glue_dev_add(test, root, class, "noreapB");
+	glue = dev_b->kobj.parent;
+	KUNIT_ASSERT_NOT_NULL(test, glue);
+
+	kunit_release_action(test, glue_dev_unregister, dev_a);
+
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(&root->kobj,
+						   "glue_kunit_noreap"));
+	KUNIT_EXPECT_PTR_EQ(test, dev_b->kobj.parent, glue);
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(glue, "noreapB"));
+
+	dev_c = glue_dev_add(test, root, class, "noreapC");
+	KUNIT_EXPECT_PTR_EQ(test, dev_c->kobj.parent, glue);
+}
+
+/*
+ * Static so that unregistering under a live device frees only the
+ * driver-core generation, not the struct class the device points at.
+ */
+static const struct class glue_gone_class_a = {
+	.name = "glue_kunit_gone_a",
+};
+
+static const struct class glue_gone_class_b = {
+	.name = "glue_kunit_gone_b",
+};
+
+static void glue_static_class_unregister(void *data)
+{
+	class_unregister(data);
+}
+
+/*
+ * Unregistering a class under a live device is tolerated API misuse: the
+ * device's glue dir can no longer be reaped and is deliberately leaked
+ * (class_dir, kernfs node, and parent reference), here as in the base
+ * tree; kmemleak reports all three on every run.
+ *
+ * The case pins the index's placement: a dead generation's tree dies
+ * with its subsys_private, so the successor class starts on an empty
+ * tree and cannot resolve the leaked dir.  A global index would put the
+ * dead entry back in its search path.
+ */
+static void glue_test_class_gone(struct kunit *test)
+{
+	struct device *root, *dev_a, *dev_b;
+	struct kobject *glue_a;
+
+	KUNIT_ASSERT_EQ(test, class_register(&glue_gone_class_a), 0);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test,
+						  glue_static_class_unregister,
+						  (void *)&glue_gone_class_a),
+			0);
+	root = glue_root(test, "glue_kunit_gone_root");
+
+	dev_a = glue_dev_add(test, root, &glue_gone_class_a, "goneA");
+	glue_a = dev_a->kobj.parent;
+	KUNIT_ASSERT_NOT_NULL(test, glue_a);
+
+	/* the misuse: the class goes away under a live device */
+	kunit_release_action(test, glue_static_class_unregister,
+			     (void *)&glue_gone_class_a);
+
+	KUNIT_ASSERT_EQ(test, class_register(&glue_gone_class_b), 0);
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test,
+						  glue_static_class_unregister,
+						  (void *)&glue_gone_class_b),
+			0);
+
+	dev_b = glue_dev_add(test, root, &glue_gone_class_b, "goneB");
+	KUNIT_ASSERT_NOT_NULL(test, dev_b->kobj.parent);
+	KUNIT_EXPECT_PTR_NE(test, dev_b->kobj.parent, glue_a);
+	KUNIT_EXPECT_PTR_NE(test, dev_b->kobj.parent, &root->kobj);
+	KUNIT_EXPECT_STREQ(test, kobject_name(dev_b->kobj.parent),
+			   glue_gone_class_b.name);
+	KUNIT_EXPECT_TRUE(test, glue_child_visible(dev_b->kobj.parent,
+						   "goneB"));
+}
+
+static struct kunit_case glue_dir_tests[] = {
+	KUNIT_CASE(glue_test_reuse),
+	KUNIT_CASE(glue_test_cross_class),
+	KUNIT_CASE(glue_test_reap_recreate),
+	KUNIT_CASE(glue_test_name_collision),
+	KUNIT_CASE(glue_test_virtual_parent),
+	KUNIT_CASE(glue_test_virtual_cross_class),
+	KUNIT_CASE(glue_test_many_parents),
+	KUNIT_CASE(glue_test_device_move),
+	KUNIT_CASE(glue_test_no_reap),
+	KUNIT_CASE(glue_test_class_gone),
+	{}
+};
+
+static struct kunit_suite glue_dir_test_suite = {
+	.name = "glue_dir",
+	.test_cases = glue_dir_tests,
+};
+
+kunit_test_suite(glue_dir_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests for class glue directories");
+MODULE_LICENSE("GPL");
-- 
2.47.3

