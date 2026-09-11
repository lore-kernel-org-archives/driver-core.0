Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123133D300F
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147073; cv=none; b=NwiA1iMfSERL1SvUQLYSqU+OLMVI6VRtYu04kKUTBkJ3NxGRjOuMkSR53ssibJzZ84aGZ4/U3dA9wEKn6XgEj930+bDCezZ3bOJSB4fz4K7VxHrAyniXYEyw3s/wcM3Y/jCAzu5FwDXmOoVWyfHX93y7G2LO0xbwVb3+VGam+RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147073; c=relaxed/simple;
	bh=6eHgi83v9qPMcs3muNJF7xI66eIbdWFgKXoKbLz1C0k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jNgm8Q9mzgrnRF7W01FXKllLhBhaXb0658ov0GdJeq2t8AusVt18CYO4aruO2OqFEPQ5qp8OtMAwbqbYZySMjElkgOKOhAkf4ROGS4bGaoSlacbjJgq+n3goR34lcmFICn7GPecXgiagVbzMrChBZ+zV5QwV30pliae/3/dUAFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=aH0Fvd3K; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="aH0Fvd3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1789147071; x=1820683071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iz3UIKuKgg/vAUFdXOtHu6Bz716lOnkmGUHC//0Ac1s=;
  b=aH0Fvd3KDsYA1rCQIbck8cYfr+kD5cx/YmKsWxNvqADLVy0/pYa8i9Er
   RDgRU5MlCLgrPKTCnbROLQ82RzMGfiB1b88SqZq79g94Lmz4M8zubtIbj
   N0YMYW1NV7wTWpkUt2jG2D+BxrZUvrYt02jiN/SQbxpKhREFAq653bdbm
   3OIsEdnyWXvpT2npT4zoeVoj26DlCtvWmWRzb6oKyf0t43EAgDrTswWPM
   8543KB3oS2CElOUkJwf8l8KPlpm4dgGBK2oBPQUXDJ7boYd+XyOPGVVsP
   7DDn4kuBbYjebN0zsmT5b1vnLvt6ezYYPJifG+mbVCbM1r08v6pBmO8sd
   Q==;
X-CSE-ConnectionGUID: hdj3LaKoSiqVWpMNQIg4Gw==
X-CSE-MsgGUID: N+x6nyktSNiNdEgllYIAYw==
X-IronPort-AV: E=Sophos;i="6.27,97,1787011200"; 
   d="scan'208";a="28232775"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:17:50 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:3649]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.54:2525] with esmtp (Farcaster)
 id b475305b-8201-46ad-a870-6b66f98f0d89; Fri, 11 Sep 2026 17:17:50 +0000 (UTC)
X-Farcaster-Flow-ID: b475305b-8201-46ad-a870-6b66f98f0d89
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 11 Sep 2026 17:17:49 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Fri, 11 Sep 2026
 17:17:47 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo
	<tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Xu Yang <xu.yang_2@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	<nh-open-source@amazon.com>
Subject: [PATCH 3/3] kernfs: batch inode ID allocation per CPU
Date: Fri, 11 Sep 2026 19:16:05 +0200
Message-ID: <20260911171639.68348-3-sakacpav@amazon.de>
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
X-ClientProxiedBy: EX19D037UWC003.ant.amazon.com (10.13.139.231) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Every kernfs node allocates an inode ID from its root's IDR under the
per-root kernfs_idr_lock (per-root since commit cec59c440a05c ("kernfs:
switch global kernfs_idr_lock to per-fs lock")). sysfs is a single root,
so parallel creation funnels every node through one lock, and a
registration storm acquires it once per created node: even
registrations in disjoint subtrees contend on that one spinlock.

Let opted-in roots reserve a batch of IDs as NULL IDR entries and cache
them per CPU, so node creation pops one and installs itself with
idr_replace() under rcu_read_lock() instead of taking the shared lock.

Each call stays within the documented IDR contract: idr_replace() may run
under the RCU read lock concurrently with the idr_alloc() and
idr_remove() other CPUs do under the lock, and installing into an entry
reserved as NULL is the reserve-then-replace pattern of
Documentation/core-api/idr.rst. The property relied on beyond that is
concurrent idr_replace() on distinct reserved IDs, the normal mode here
since each reserved ID goes to exactly one caller; it holds because
replacing a reserved slot (NULL, IDR_FREE clear) is a single
rcu_assign_pointer() store and nothing else, and calculate_count()
returns 0 for such a slot, so the transition is count-neutral, writes no
shared radix-tree state, and cannot interact with a concurrent replace of
a distinct slot even within one radix-tree node.

Refill failure falls back to the locked path. An opted-in root must not
also ask for KERNFS_ROOT_SUPPORT_EXPORTOP, whose fhandle by-id lookups
must not meet an ino that is allocated but owned by no node. Enable
batching for sysfs: with batching, a registration storm takes
kernfs_idr_lock once per KERNFS_INO_BATCH-sized batch of nodes
instead of once per node.

Add root_device_ino_uniqueness_test to the root-device-devm KUnit
suite: it registers devices from several tasks at once, each crossing a
batch refill, and requires the IDs of nodes that are all alive at the
same time to be distinct.

Assisted-by: LLM
Signed-off-by: Pavol Sakac <sakacpav@amazon.de>
---
 drivers/base/test/root-device-test.c | 215 +++++++++++++++++++++++++++
 fs/kernfs/dir.c                      | 122 +++++++++++++++
 fs/kernfs/kernfs-internal.h          |   3 +
 fs/sysfs/mount.c                     |   3 +-
 include/linux/kernfs.h               |  13 ++
 5 files changed, 355 insertions(+), 1 deletion(-)

diff --git a/drivers/base/test/root-device-test.c b/drivers/base/test/root-device-test.c
index 9aea23c9123e..f3370d53f9d4 100644
--- a/drivers/base/test/root-device-test.c
+++ b/drivers/base/test/root-device-test.c
@@ -3,7 +3,12 @@
 
 #include <kunit/resource.h>
 
+#include <linux/completion.h>
+#include <linux/cpumask.h>
 #include <linux/device.h>
+#include <linux/kernfs.h>
+#include <linux/kthread.h>
+#include <linux/sort.h>
 
 #define DEVICE_NAME "test"
 
@@ -93,9 +98,219 @@ static void root_device_devm_register_get_unregister_with_devm_test(struct kunit
 	KUNIT_EXPECT_GT(test, ret, 0);
 }
 
+#if IS_ENABLED(CONFIG_SYSFS)
+/*
+ * Inode IDs may be handed out from per-CPU batches (KERNFS_ROOT_INO_BATCH on
+ * the sysfs root); one task's loop only draws from the CPU it runs on and
+ * would pass unchanged if batching were inert.  Hence several tasks at
+ * once.  Per task: more than INO_BATCH IDs for every online CPU, so a
+ * refill is crossed even if a task migrates across all of them, and never
+ * a whole number of batches, so the run also ends mid-batch.
+ */
+#define INO_THREADS		4
+#define INO_BATCH		16	/* KERNFS_INO_BATCH (kernfs-private) */
+#define INO_MIN_PER_THREAD	200
+/* one worker's registrations scale with the CPU count: ~0.5ms each on 4 CPUs */
+#define INO_TIMEOUT_BASE_MS	5000
+#define INO_TIMEOUT_PER_DEV_MS	10
+
+struct ino_worker {
+	int idx;
+	int nr;				/* devices to register */
+	int created;			/* devices actually registered */
+	int err;			/* first registration error */
+	bool joined;			/* completion was waited out */
+	struct device **devs;
+	ino_t *inos;
+	struct completion done;
+};
+
+struct ino_test_ctx {
+	struct ino_worker worker[INO_THREADS];
+	int spawned;
+};
+
+static int root_device_ino_worker(void *data)
+{
+	struct ino_worker *w = data;
+	int i;
+
+	for (i = 0; i < w->nr; i++) {
+		char name[32];
+		struct device *dev;
+
+		snprintf(name, sizeof(name), DEVICE_NAME "-ino-%d-%d",
+			 w->idx, i);
+		dev = root_device_register(name);
+		if (IS_ERR(dev)) {
+			w->err = PTR_ERR(dev);
+			break;
+		}
+		w->devs[i] = dev;
+		w->inos[i] = dev->kobj.sd ? kernfs_ino(dev->kobj.sd) : 0;
+		w->created = i + 1;
+	}
+
+	/*
+	 * complete_all(), not complete(): this is waited on twice, once by
+	 * the test and once by the teardown action, and a plain completion
+	 * is consumed by the first waiter.
+	 */
+	complete_all(&w->done);
+	return 0;
+}
+
+/*
+ * Registered before the first worker is spawned, so it also runs if the test
+ * aborts: join every worker, then undo what it did.
+ */
+static void root_device_ino_teardown(void *data)
+{
+	struct ino_test_ctx *ctx = data;
+	int t, i;
+
+	for (t = 0; t < ctx->spawned; t++)
+		wait_for_completion(&ctx->worker[t].done);
+
+	for (t = 0; t < INO_THREADS; t++)
+		for (i = 0; i < ctx->worker[t].created; i++)
+			root_device_unregister(ctx->worker[t].devs[i]);
+}
+
+static int ino_cmp(const void *a, const void *b)
+{
+	ino_t x = *(const ino_t *)a;
+	ino_t y = *(const ino_t *)b;
+
+	if (x < y)
+		return -1;
+	return x > y;
+}
+
+static void root_device_ino_uniqueness_test(struct kunit *test)
+{
+	int zeros = 0, dups = 0, descents = 0, ids = 0;
+	struct ino_test_ctx *ctx;
+	bool results_valid = true;
+	unsigned long timeout;
+	struct device **devs;
+	ino_t *inos, *sorted;
+	int nr, total, t, i;
+
+	nr = INO_BATCH * num_online_cpus() + INO_BATCH / 2;
+	if (nr < INO_MIN_PER_THREAD)
+		nr = INO_MIN_PER_THREAD;
+	total = INO_THREADS * nr;
+	timeout = msecs_to_jiffies(INO_TIMEOUT_BASE_MS +
+				   nr * INO_TIMEOUT_PER_DEV_MS);
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	devs = kunit_kcalloc(test, total, sizeof(*devs), GFP_KERNEL);
+	inos = kunit_kcalloc(test, total, sizeof(*inos), GFP_KERNEL);
+	sorted = kunit_kcalloc(test, total, sizeof(*sorted), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, devs);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, inos);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, sorted);
+
+	for (t = 0; t < INO_THREADS; t++) {
+		struct ino_worker *w = &ctx->worker[t];
+
+		w->idx = t;
+		w->nr = nr;
+		w->devs = devs + t * nr;
+		w->inos = inos + t * nr;
+		init_completion(&w->done);
+	}
+
+	KUNIT_ASSERT_EQ(test,
+			kunit_add_action_or_reset(test,
+						  root_device_ino_teardown,
+						  ctx), 0);
+
+	for (t = 0; t < INO_THREADS; t++) {
+		struct task_struct *task;
+
+		task = kthread_run(root_device_ino_worker, &ctx->worker[t],
+				   "root_dev_ino%d", t);
+		if (IS_ERR(task))
+			break;
+		ctx->spawned++;
+	}
+	KUNIT_EXPECT_EQ(test, ctx->spawned, INO_THREADS);
+	if (ctx->spawned != INO_THREADS)
+		results_valid = false;
+
+	/*
+	 * complete_all() is a worker's last act, so only a join that succeeds
+	 * orders its stores before the reads below; a worker that timed out
+	 * may still be writing its slice.  The teardown action joins those
+	 * unbounded, before any of this memory can be freed.
+	 */
+	for (t = 0; t < ctx->spawned; t++) {
+		struct ino_worker *w = &ctx->worker[t];
+
+		if (wait_for_completion_timeout(&w->done, timeout) > 0) {
+			w->joined = true;
+		} else {
+			KUNIT_FAIL(test, "worker %d timed out", t);
+			results_valid = false;
+		}
+	}
+
+	for (t = 0; t < ctx->spawned; t++) {
+		struct ino_worker *w = &ctx->worker[t];
+
+		if (!w->joined)
+			continue;
+
+		KUNIT_EXPECT_EQ(test, w->err, 0);
+		KUNIT_EXPECT_EQ(test, w->created, nr);
+		if (w->err || w->created != nr)
+			results_valid = false;
+
+		for (i = 0; i < w->created; i++) {
+			if (!w->inos[i])
+				zeros++;
+			/*
+			 * Batches are consumed from the top: IDs step down
+			 * within one, while the locked path only ascends, so
+			 * one descent is evidence the cache was in use.
+			 */
+			if (i && w->inos[i] < w->inos[i - 1])
+				descents++;
+			sorted[ids++] = w->inos[i];
+		}
+	}
+	KUNIT_EXPECT_EQ(test, zeros, 0);
+
+	/* every ID belongs to a node that is still alive here */
+	sort(sorted, ids, sizeof(*sorted), ino_cmp, NULL);
+	for (i = 1; i < ids; i++)
+		if (sorted[i] == sorted[i - 1])
+			dups++;
+	KUNIT_EXPECT_EQ(test, dups, 0);
+	if (zeros || dups)
+		results_valid = false;
+
+	/*
+	 * The batch cache is best-effort: when its allocation failed, every
+	 * ID above came from the locked fallback and no descent can have been
+	 * observed.  Make that visibly unavailable coverage rather than a
+	 * PASS that never exercised batching -- but only when everything
+	 * above held, since kunit_skip() would overwrite a recorded failure.
+	 */
+	if (IS_ENABLED(CONFIG_SMP) && results_valid && !descents)
+		kunit_skip(test, "sysfs inode batching fast path was not observed");
+}
+#endif
+
 static struct kunit_case root_device_devm_tests[] = {
 	KUNIT_CASE(root_device_devm_register_unregister_test),
 	KUNIT_CASE(root_device_devm_register_get_unregister_with_devm_test),
+#if IS_ENABLED(CONFIG_SYSFS)
+	KUNIT_CASE(root_device_ino_uniqueness_test),
+#endif
 	{}
 };
 
diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index d68bce0b0b41..1938edd39eff 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <linux/security.h>
 #include <linux/hash.h>
+#include <linux/local_lock.h>
 #include <linux/ns_common.h>
 
 #include "kernfs-internal.h"
@@ -28,6 +29,96 @@
 static DEFINE_SPINLOCK(kernfs_pr_cont_lock);
 static char kernfs_pr_cont_buf[PATH_MAX];	/* protected by pr_cont_lock */
 
+/*
+ * Cached IDs remain reserved as NULL IDR entries until they are consumed or
+ * the owning root is destroyed.
+ */
+#define KERNFS_INO_BATCH	16
+
+struct kernfs_ino_cache {
+	local_lock_t lock;
+	int count;
+	u64 id[KERNFS_INO_BATCH];
+};
+
+static int kernfs_ino_cache_alloc(struct kernfs_root *root)
+{
+	struct kernfs_ino_cache __percpu *cache;
+	int cpu;
+
+	cache = alloc_percpu(struct kernfs_ino_cache);
+	if (!cache)
+		return -ENOMEM;
+
+	for_each_possible_cpu(cpu) {
+		struct kernfs_ino_cache *c = per_cpu_ptr(cache, cpu);
+
+		local_lock_init(&c->lock);
+		c->count = 0;
+	}
+
+	root->ino_cache = cache;
+	return 0;
+}
+
+static void kernfs_ino_cache_free(struct kernfs_root *root)
+{
+	free_percpu(root->ino_cache);
+}
+
+/*
+ * Refill this CPU's cache in place: the free space is computed under
+ * the same local lock that guards the pop, so every reserved ID lands
+ * in the cache and none is ever returned. Lock ordering is
+ * one-directional: idr_preload() returns holding the radix-tree
+ * preload local_lock, the ino_cache local_lock nests inside it, and
+ * root->kernfs_idr_lock nests inside that. idr_alloc_cyclic(GFP_ATOMIC)
+ * does not sleep and is legal under both.
+ */
+static u64 kernfs_ino_batch_refill_and_get(struct kernfs_root *root)
+{
+	struct kernfs_ino_cache *c;
+	u64 id = 0;
+
+	idr_preload(GFP_KERNEL);
+	local_lock(&root->ino_cache->lock);
+	c = this_cpu_ptr(root->ino_cache);
+	spin_lock(&root->kernfs_idr_lock);
+	while (c->count < KERNFS_INO_BATCH) {
+		int ino = idr_alloc_cyclic(&root->ino_idr, NULL, 1, 0,
+					   GFP_ATOMIC);
+
+		if (ino < 0)
+			break;
+		if (ino < root->last_id_lowbits)
+			root->id_highbits++;
+		root->last_id_lowbits = ino;
+		c->id[c->count++] = (u64)root->id_highbits << 32 | ino;
+	}
+	spin_unlock(&root->kernfs_idr_lock);
+	if (c->count)
+		id = c->id[--c->count];
+	local_unlock(&root->ino_cache->lock);
+	idr_preload_end();
+	return id;
+}
+
+static u64 kernfs_ino_batch_get(struct kernfs_root *root)
+{
+	struct kernfs_ino_cache *c;
+	u64 id = 0;
+
+	local_lock(&root->ino_cache->lock);
+	c = this_cpu_ptr(root->ino_cache);
+	if (c->count > 0)
+		id = c->id[--c->count];
+	local_unlock(&root->ino_cache->lock);
+
+	if (!id)
+		id = kernfs_ino_batch_refill_and_get(root);
+	return id;
+}
+
 #define rb_to_kn(X) rb_entry((X), struct kernfs_node, rb)
 
 static bool __kernfs_active(struct kernfs_node *kn)
@@ -625,6 +716,7 @@ void kernfs_put(struct kernfs_node *kn)
 			goto repeat;
 	} else {
 		/* just released the root kn, free @root too */
+		kernfs_ino_cache_free(root);
 		idr_destroy(&root->ino_idr);
 		simple_xattr_cache_cleanup(&root->xa_cache);
 		kfree_rcu(root, rcu);
@@ -668,6 +760,28 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 	if (!kn)
 		goto err_out1;
 
+	if (root->ino_cache) {
+		u64 id = kernfs_ino_batch_get(root);
+
+		if (likely(id)) {
+			kn->id = id;
+			/*
+			 * The reservation cleared IDR_FREE, so this
+			 * is one count-neutral rcu_assign_pointer()
+			 * into a slot handed to exactly one caller:
+			 * nothing can concurrently remove or replace
+			 * it.  Publication matches the locked
+			 * idr_alloc() below -- count==0 makes ID
+			 * lookups refuse @kn until initialized.
+			 */
+			rcu_read_lock();
+			WARN_ON_ONCE(idr_replace(&root->ino_idr, kn,
+						 (u32)kernfs_ino(kn)));
+			rcu_read_unlock();
+			goto ino_done;
+		}
+	}
+
 	idr_preload(GFP_KERNEL);
 	spin_lock(&root->kernfs_idr_lock);
 	ret = idr_alloc_cyclic(&root->ino_idr, kn, 1, 0, GFP_ATOMIC);
@@ -682,6 +796,7 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 
 	kn->id = (u64)id_highbits << 32 | ret;
 
+ ino_done:
 	atomic_set(&kn->count, 1);
 	atomic_set(&kn->active, KN_DEACTIVATED_BIAS);
 	RB_CLEAR_NODE(&kn->rb);
@@ -1058,6 +1173,13 @@ struct kernfs_root *kernfs_create_root(struct kernfs_syscall_ops *scops,
 
 	root->syscall_ops = scops;
 	root->flags = flags;
+	/*
+	 * Batching is best-effort: without the cache every node takes the
+	 * locked path, so an allocation failure only needs to be visible.
+	 */
+	if (IS_ENABLED(CONFIG_SMP) && (flags & KERNFS_ROOT_INO_BATCH) &&
+	    kernfs_ino_cache_alloc(root))
+		pr_warn_once("kernfs: inode ID batching unavailable, using the locked allocation path\n");
 	root->kn = kn;
 	init_waitqueue_head(&root->deactivate_waitq);
 
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index aa784b540b36..6e12233731e6 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -30,6 +30,8 @@ struct kernfs_iattrs {
 	struct simple_xattr_limits xattr_limits;
 };
 
+struct kernfs_ino_cache;
+
 struct kernfs_root {
 	/* published fields */
 	struct kernfs_node	*kn;
@@ -40,6 +42,7 @@ struct kernfs_root {
 	spinlock_t		kernfs_idr_lock;	/* root->ino_idr */
 	u32			last_id_lowbits;
 	u32			id_highbits;
+	struct kernfs_ino_cache __percpu *ino_cache;
 	struct kernfs_syscall_ops *syscall_ops;
 
 	/* list of kernfs_super_info of this root, protected by kernfs_rwsem */
diff --git a/fs/sysfs/mount.c b/fs/sysfs/mount.c
index 88c10823fcaf..86288c5e34e8 100644
--- a/fs/sysfs/mount.c
+++ b/fs/sysfs/mount.c
@@ -86,7 +86,8 @@ int __init sysfs_init(void)
 {
 	int err;
 
-	sysfs_root = kernfs_create_root(NULL, KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK,
+	sysfs_root = kernfs_create_root(NULL, KERNFS_ROOT_EXTRA_OPEN_PERM_CHECK |
+					KERNFS_ROOT_INO_BATCH,
 					NULL);
 	if (IS_ERR(sysfs_root))
 		return PTR_ERR(sysfs_root);
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index 351a5101c862..6440882b7d58 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -156,6 +156,19 @@ enum kernfs_root_flag {
 	 * Renames must not change the parent node.
 	 */
 	KERNFS_ROOT_INVARIANT_PARENT		= 0x0010,
+
+	/*
+	 * Reserve inode numbers for this root in per-CPU batches, taking the
+	 * root's ID allocation lock out of the per-node creation path.
+	 * Best-effort: if the cache cannot be allocated the root falls back to
+	 * the locked path.  Costs up to KERNFS_INO_BATCH - 1
+	 * reserved-but-unused IDs per possible CPU per opted-in root, held as
+	 * NULL IDR entries until the root's IDR is destroyed.  Must not be
+	 * combined with KERNFS_ROOT_SUPPORT_EXPORTOP: reserved IDs are
+	 * allocated inos with no node, which the fhandle by-id lookup must not
+	 * resolve.
+	 */
+	KERNFS_ROOT_INO_BATCH			= 0x0020,
 };
 
 /* type-specific structures for kernfs_node union members */
-- 
2.47.3

