Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.117
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829657;
	b=KUIIZ6/PQIFcgG7hLImNh1fImeJNarz+dCcix3uwR1nS+rKK+ENbMwEPgl9ANgtr8cg3
	 zT2pd8M7BFqkOkOaKQiA1FKWU6WPE3d0KZYB61FC3KUysud7Jp41H8LXAgcAh0MONyLvN
	 NWXP98ckb8M6ONB6WcIuAc1Tkdg018sm1e/YzdbnzXSkQ01LC4A5qmpc+yh80yjpNPA5s
	 MP7csUOLB8CEI8KicU4ZOdLOfxFhp2TH5HCbGXhVDVE0rZSs49MZUsM20QbN3nQpNN8jZ
	 zwbrTQbo4JC+vd3+6cUXrpVnSwuSoDqDzee+IVK8k35eD9kg+6I/ZoNgZCjOUjw7/Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829657;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=h1w+09XICpGZVY73YRjzypuM/a/9g955LASAkAmecj0=;
	b=oakSIWD+bYpT8R8xb9Li9Cu1jpcpw8GCJLtibfNtwZRMBK9DHu1psTXmd9hXB2DH4XPN
	 4RuRZTDfuS0mAzC/6I7LWvzbeCUzRZrJW8WQ6YZJuRnSAIeCkPc+awSK58rGFzRpK009s
	 bOMUx+46dsdhMv6fstfPnVcJEyn8HjAgMmpgF+iP7T9WZWH+ik6bvGCsO8WB1+SUa11vt
	 yrSNznxOuj7eNDucqptlDQ50y8BMZgSlcCOGn6RKf84Qz44pPf3ZZc6ehM5R15px/sZPG
	 PQ1gig94rJDXWjbR4NNM3c2EXcg0C3v+cX0w6bkOitoBRwJl6RHem0EFX+39SxaQCCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b="a9TyW/Ti";
	arc=none smtp.remote-ip=79.135.106.117
Received: from mail-106117.protonmail.ch (mail-106117.protonmail.ch [79.135.106.117])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B2606AC3A
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 22:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5B2606AC3A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=a9TyW/Ti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793829652; x=1794088852;
	bh=h1w+09XICpGZVY73YRjzypuM/a/9g955LASAkAmecj0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=a9TyW/Ti3JLQD1G2+3aYQTDmNEBI/dSjUJQ68YdRastiHEie5cvr/jzbpqQAg7wDI
	 yPU8r9GM5w8jPOnkczd+LD1NsHjwwMnsWJcZYzdK7ba2GdN30SNd9+Ef1MlNiIDIn1
	 KSyepFag3NVw5zynjg88kEObOht7KCz2dK/Y/okW+KpRieM0MWav8skTdH8QLdsywW
	 84918h8h8O/KaCovaQafKl204tpyU9ygMJtgT2B1IQA5GvSBfWfuyWk//brlhXBfkO
	 UIDQBaj+tsl4jknl0R6VEgnvY4XTHoBIVtPWP1hsb1cXUbi7lQfpLYnO7y4HxWC67w
	 gMdM3k99573aA==
Date: Wed, 04 Nov 2026 22:00:47 +0000
To: linux-kernel@vger.kernel.org
From: Chad Aldreda <ca@modelmiser.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, driver-core@lists.linux.dev, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nick Faro <yux50000@hotmail.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [RFC PATCH 2/4] devres: add DEBUG_DEVRES_REFS to warn about managed memory still held by open files
Message-ID: <20261104220041.3994559-1-ca@modelmiser.com>
In-Reply-To: <20261104215546.3990950-1-ca@modelmiser.com>
References: <20261104215546.3990950-1-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: fbc14db344336f3ae2e638ecbdc0378f15aedf2c
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Memory from devm_kzalloc() is freed when the driver is unbound, but a
device node that user space holds open outlives the unbind. Driver
state that an open file can reach, such as an embedded struct cdev,
video_device or miscdevice, must therefore not be managed memory; when
it is, the next file operation, typically close(), is a use-after-free.
The pattern is long-standing and is still fixed driver by driver. In
mainline today cx231xx allocates its state, with four video_devices
and its mutex embedded, with devm_kzalloc() against the USB interface,
defers its release to close() when a node is open, and devres frees the
state at unbind regardless; xilinx_hwicap embeds its struct cdev in
devm memory the same way.

Add a runtime debug check rather than a static rule: from
device_unbind_cleanup(), with device_lock held, before
devres_release_all(), snapshot the device's managed allocations, walk
every thread's open files once, and warn when a file's private_data,
its inode's i_private, its inode's cdev for a character device, or an
object a subsystem names through a small hook still points into an
allocation about to be freed. Such a pointer dangles once the memory
is freed; it is a use-after-free if anything dereferences it
afterwards, which for private_data is any operation, for a cdev its
release on close, and for a debugfs file a new open or an unguarded
release. One WARN backtrace is printed per allocation; further holders
of it get one line each.

The cdev route works because an open non-O_PATH chrdev file holds a
reference on its cdev's kobject from chrdev_open(), and inode->i_cdev
is cleared only when that kobject is released, so the pointer is
stable here even after cdev_del(); it is compared, never dereferenced.
It only helps when the struct cdev itself is in managed memory: V4L2's
cdev is a separate cdev_alloc() with no kobject parent and misc's is
one shared cdev, so neither leads to the driver's allocation, which is
what the hook is for. The next patch adds V4L2's.

debugfs files need care, because many drivers remove theirs through a
devres action that runs inside devres_release_all(). A hit on a debugfs
file that remove() already took down is decided at once; a hit on a
live one is recorded as (pid, fd, file address) and looked up again
after release. If debugfs has revoked the file by then
(debugfs_file_revoked()) and its release callback is one that cannot
touch the data (debugfs_file_release_safe()), it is reported at info
level; if the release is the driver's own it is a WARN naming it, and
so is a file still live or removed with unguarded file_operations.

The check runs only from the unbind and failed-probe paths, not on
probe deferral and never from devres_release_all() itself, which is
also reached from device_release() and so from any context in which a
final put_device() is legal. The walks run on a kernel thread the
unbinding task waits for: a file reference the walk holds becomes the
last one if the owner closes the file meanwhile, and dropped from a
user task its release would be queued to that task's task work, after
unbind, where a devres action waiting for the close (snd_card_free())
would deadlock under device_lock; dropped from a kernel thread it goes
to the delayed-fput work instead. What remains: that work drains one
global list last-in-first-out with all its runs serialized, so a
release there that needs a lock unbind holds (a usbfs close takes the
USB parent lock a USB interface unbind holds) stalls every later
delayed close, including one such an action is waiting for; without
this option that close would have run from its owner's task work. No
file reference is kept across release. Fd tables are walked once each,
de-duplicated by (owning task, table pointer) with a reference on the
task only; no reference is ever taken on another task's fd table, since
dropping the last one would run that task's file releases in the walk.

Limitations, also stated in the Kconfig help: only files in task fd
tables are seen; the check finds pointers that are dangling at that
moment, not teardown races, nor whether a debugfs removal action ran
before or after the free; a managed allocation whose release waits for
its files to close first (an ALSA card) is not about to be freed, so a
hit on it is a false positive; and the walk is linear in threads times
fd tables and costs every unbind and failed probe.

Written with Claude (Anthropic) under my direction; see the cover letter
for the disclosure required by Documentation/process/generated-content.rst.

Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
 .../driver-api/driver-model/devres.rst        |  18 +
 drivers/base/Kconfig                          |  64 ++
 drivers/base/base.h                           |  38 +
 drivers/base/dd.c                             |  14 +-
 drivers/base/devres.c                         | 667 ++++++++++++++++++
 include/linux/device/devres.h                 |  58 ++
 6 files changed, 855 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentati=
on/driver-api/driver-model/devres.rst
index 4f0b90e7e1..62a70cc9ba 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -221,6 +221,24 @@ in lib/devres.c.
 All devres interface functions can be called without context if the
 right gfp mask is given.
=20
+Managed memory is freed on driver unbind regardless of whether anything
+else still refers to it.  In particular a device node that user space
+holds open outlives the unbind, so driver state that an open file can
+reach - a struct cdev, video_device or miscdevice embedded in it - must
+not live in devm_kzalloc()'d memory.  Allocate such state with kzalloc()
+and free it from the release callback of the object that user space
+holds, or from a refcount dropped on last close.  debugfs private data
+may be managed memory only if the file is created through
+debugfs_create_file() or one of debugfs's typed helpers such as
+debugfs_create_u32() or debugfs_create_blob(), not through
+debugfs_create_file_unsafe() with the driver's own file_operations, so
+that debugfs refuses operations on it once removed, and the file is
+removed before the allocation is freed: in the remove callback, or by a
+devres action registered after that allocation.
+CONFIG_DEBUG_DEVRES_REFS reports, at driver unbind or after a failed
+probe, open files that still point into a managed allocation about to
+be freed; its Kconfig help text lists what it can and cannot see.
+
=20
 5. Overhead
 -----------
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index a9acf4575f..4b1adf4a06 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -159,6 +159,70 @@ config DEBUG_DEVRES
=20
 =09  If you are unsure about this, Say N here.
=20
+config DEBUG_DEVRES_REFS
+=09bool "Warn about managed memory still held by open files at unbind"
+=09depends on DEBUG_KERNEL
+=09help
+=09  Before a driver's managed (devm) allocations are freed, on unbind
+=09  or after a failed probe, walk the open files of every thread and
+=09  WARN if one still points into an allocation about to be freed:
+=09  through file->private_data, the inode's i_private, the inode's
+=09  cdev for a character device, or an object a subsystem names
+=09  through a hook (V4L2 names the video_device). Such a pointer
+=09  dangles once the memory is freed; it is a use-after-free if
+=09  anything dereferences it afterwards: for private_data any
+=09  operation that uses it, for a cdev a new open of the device node
+=09  and its release on close, for a hook object whatever the
+=09  subsystem's operations do with it (for V4L2 any operation and
+=09  close), and for a debugfs file a new open or an unguarded
+=09  release. One WARN backtrace (which
+=09  taints the kernel) is printed per allocation per unbind; further
+=09  holders of the same allocation get one line each.
+
+=09  A removed debugfs file on which debugfs refuses further operations
+=09  (one created through its full proxy, or through one of its own
+=09  guarded helpers such as debugfs_create_ulong() or
+=09  debugfs_create_blob()) is reported at info level if its release
+=09  callback is one that cannot touch the data, and warned about
+=09  naming the callback otherwise. A debugfs file still live during
+=09  the walk is decided after the managed resources were released,
+=09  since drivers often remove their debugfs files through a devres
+=09  action: removed and safe to close by then is info, anything else
+=09  is a WARN. A file created with a debugfs _unsafe variant and the
+=09  driver's own file_operations gets no guard; it is deferred like a
+=09  live debugfs file and then warned about.
+
+=09  The walks run on a kernel thread, so a file reference the walk
+=09  turns out to hold last is released from the delayed-fput work and
+=09  never from the unbinding task, so a devres action that waits for
+=09  a file to close does not wait on the walk. What remains: that
+=09  work drains one global list last-in-first-out with all its runs
+=09  serialized, so a release there that needs a lock unbind holds (a
+=09  usbfs close takes the USB parent lock a USB interface unbind
+=09  holds) stalls every later delayed close, including one such an
+=09  action is waiting for; without this option that close would have
+=09  run from its owner's task work. No file reference is kept across
+=09  the release of the managed resources.
+
+=09  Limitations: only files in task fd tables are seen, so references
+=09  held by sockets, epoll, io_uring or kernel-internal files are not;
+=09  the check runs from the unbind and failed-probe paths only, not on
+=09  probe deferral nor on other devres release paths; a V4L2 driver's
+=09  state reached only through the video_device's drvdata is not
+=09  named, since that needs dereferencing the video_device; it finds
+=09  pointers
+=09  that are dangling at that moment, not teardown races, nor whether
+=09  a debugfs removal action ran before or after the free; a managed
+=09  allocation whose release waits for its files to close first (an
+=09  ALSA card) is not about to be freed, so a hit on it is a false
+=09  positive; a driver that keeps freeing devm memory after remove()
+=09  returned can make it misreport. The walk is linear in threads
+=09  times distinct fd tables and costs every unbind and failed probe.
+
+=09  This is a slow debug check intended for test systems.
+
+=09  If you are unsure about this, say N here.
+
 config DEBUG_TEST_DRIVER_REMOVE
 =09bool "Test driver remove calls during probe (UNSTABLE)"
 =09depends on DEBUG_KERNEL
diff --git a/drivers/base/base.h b/drivers/base/base.h
index 866b2beb6b..89802070c3 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -10,6 +10,7 @@
  * shared outside of the drivers/base/ directory.
  *
  */
+#include <linux/completion.h>
 #include <linux/notifier.h>
=20
 /**
@@ -242,6 +243,43 @@ void devres_for_each_res(struct device *dev, dr_releas=
e_t release,
 =09=09=09 void (*fn)(struct device *, void *, void *),
 =09=09=09 void *data);
 int devres_release_all(struct device *dev);
+/* CONFIG_DEBUG_DEVRES_REFS state carried across devres_release_all() */
+struct devres_seen_table {
+=09struct task_struct *task;
+=09struct files_struct *files;
+};
+
+struct devres_open_file_check {
+#ifdef CONFIG_DEBUG_DEVRES_REFS
+=09struct device *dev;
+=09struct devres_region *regions;
+=09unsigned int nr;
+=09struct devres_open_file_hook **hooks;
+=09unsigned int nhooks;
+=09struct devres_seen_table *seen;
+=09unsigned int nseen, maxseen;
+=09struct devres_pending_ref *pending;
+=09unsigned int npending, maxpending;
+=09struct completion done;
+#endif
+};
+
+#ifdef CONFIG_DEBUG_DEVRES_REFS
+void devres_check_open_files(struct device *dev,
+=09=09=09     struct devres_open_file_check *chk);
+void devres_finish_open_file_check(struct device *dev,
+=09=09=09=09   struct devres_open_file_check *chk);
+#else
+static inline void devres_check_open_files(struct device *dev,
+=09=09=09=09=09   struct devres_open_file_check *chk)
+{
+}
+
+static inline void devres_finish_open_file_check(struct device *dev,
+=09=09=09=09=09=09 struct devres_open_file_check *chk)
+{
+}
+#endif
 void device_block_probing(void);
 void device_unblock_probing(void);
 void deferred_probe_extend_timeout(void);
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 5212325196..19a664feb9 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -591,11 +591,16 @@ static ssize_t state_synced_show(struct device *dev,
 }
 static DEVICE_ATTR_RW(state_synced);
=20
-static void device_unbind_cleanup(struct device *dev)
+static void device_unbind_cleanup(struct device *dev, bool check_open_file=
s)
 {
+=09struct devres_open_file_check chk =3D {};
+
 =09if (dev->driver->p_cb.post_unbind_rust)
 =09=09dev->driver->p_cb.post_unbind_rust(dev);
+=09if (check_open_files)
+=09=09devres_check_open_files(dev, &chk);
 =09devres_release_all(dev);
+=09devres_finish_open_file_check(dev, &chk);
 =09arch_teardown_dma_ops(dev);
 =09kfree(dev->dma_range_map);
 =09dev->dma_range_map =3D NULL;
@@ -744,7 +749,7 @@ static int really_probe(struct device *dev, const struc=
t device_driver *drv)
 =09=09driver_sysfs_remove(dev);
 =09=09if (dev->bus && dev->bus->dma_cleanup)
 =09=09=09dev->bus->dma_cleanup(dev);
-=09=09device_unbind_cleanup(dev);
+=09=09device_unbind_cleanup(dev, true);
=20
 =09=09goto re_probe;
 =09}
@@ -770,7 +775,8 @@ static int really_probe(struct device *dev, const struc=
t device_driver *drv)
 =09=09dev->bus->dma_cleanup(dev);
 pinctrl_bind_failed:
 =09device_links_no_driver(dev);
-=09device_unbind_cleanup(dev);
+=09/* A driver's own error arrives here negated (see above); either sign i=
s a deferral. */
+=09device_unbind_cleanup(dev, ret !=3D -EPROBE_DEFER && ret !=3D EPROBE_DE=
FER);
 done:
 =09return ret;
 }
@@ -1359,7 +1365,7 @@ static void __device_release_driver(struct device *de=
v, struct device *parent)
 =09=09if (dev->bus && dev->bus->dma_cleanup)
 =09=09=09dev->bus->dma_cleanup(dev);
=20
-=09=09device_unbind_cleanup(dev);
+=09=09device_unbind_cleanup(dev, true);
 =09=09device_links_driver_cleanup(dev);
=20
 =09=09klist_remove(&dev->p->knode_driver);
diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 9d9842fc5a..5e28d6340a 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -10,6 +10,17 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/percpu.h>
+#include <linux/dcache.h>
+#include <linux/completion.h>
+#include <linux/debugfs.h>
+#include <linux/kthread.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/magic.h>
+#include <linux/pid.h>
+#include <linux/pid_namespace.h>
+#include <linux/sched.h>
+#include <linux/sched/task.h>
=20
 #include <asm/sections.h>
=20
@@ -537,6 +548,662 @@ static int remove_nodes(struct device *dev,
 =09return cnt;
 }
=20
+#ifdef CONFIG_DEBUG_DEVRES_REFS
+/*
+ * CONFIG_DEBUG_DEVRES_REFS: before a driver's managed memory is freed, fi=
nd
+ * open files that still point into it.
+ *
+ * Two phases around devres_release_all(), both started from
+ * device_unbind_cleanup() only, i.e. on driver unbind and after a failed
+ * probe (not a deferred one), in process context with device_lock held.
+ * The walks themselves run on a kernel thread the caller waits for. That
+ * matters for one reason: the walk takes a reference on each file it look=
s
+ * at, and if the owner closes the file meanwhile the walk's reference is
+ * the last one. A last reference dropped from a user task is released
+ * from that task's task work, i.e. only after unbind returns, so a devres
+ * action that waits for the file to close (snd_card_free() does) would
+ * wait forever under device_lock. Dropped from a kernel thread it goes to
+ * the delayed-fput work instead, which runs on its own. What remains: tha=
t
+ * work drains one global list last-in-first-out and all its runs are
+ * serialized, so a release there that needs a lock unbind holds (usbfs
+ * close takes the USB parent lock, which a USB interface unbind holds)
+ * stalls every later delayed close, including one a devres action of
+ * this unbind is waiting for. Without this option that close would have
+ * run from its owner's task work and never touched the list.
+ *
+ * Phase 1 (devres_check_open_files) snapshots the regions and walks every
+ * fd table. A hit on an ordinary file is a WARN at once. A hit on a debug=
fs
+ * file is decided by whether debugfs has revoked the file: if already
+ * removed and safe to close, info now; otherwise the verdict waits, becau=
se
+ * many drivers remove their debugfs files through a devres action that
+ * runs inside devres_release_all(). No reference is kept across release;
+ * only (pid, fd, file address) is recorded. Phase 2
+ * (devres_finish_open_file_check) looks those files up again after
+ * release: gone, or replaced, is nothing; removed and safe to close is
+ * info; anything else is a WARN.
+ */
+static LIST_HEAD(devres_open_file_hooks);
+static DEFINE_MUTEX(devres_open_file_hooks_lock);
+
+/**
+ * devres_register_open_file_hook - tell the open-file check how to reach =
a
+ *                                  subsystem's objects from an open file
+ * @hook: static or zero-initialised hook with @fops, @owner and @holder s=
et
+ *
+ * Return: 0, -EINVAL if a field is missing, -EEXIST if @fops already has =
a
+ * hook.
+ */
+int devres_register_open_file_hook(struct devres_open_file_hook *hook)
+{
+=09struct devres_open_file_hook *h;
+=09int ret =3D 0;
+
+=09if (!hook->fops || !hook->holder)
+=09=09return -EINVAL;
+
+=09mutex_lock(&devres_open_file_hooks_lock);
+=09list_for_each_entry(h, &devres_open_file_hooks, list) {
+=09=09if (h->fops =3D=3D hook->fops) {
+=09=09=09ret =3D -EEXIST;
+=09=09=09goto out;
+=09=09}
+=09}
+=09list_add_tail(&hook->list, &devres_open_file_hooks);
+out:
+=09mutex_unlock(&devres_open_file_hooks_lock);
+=09return ret;
+}
+EXPORT_SYMBOL_GPL(devres_register_open_file_hook);
+
+/**
+ * devres_unregister_open_file_hook - remove a hook; a no-op if it was nev=
er
+ *                                    registered (static or zero-initialis=
ed)
+ * @hook: the hook passed to devres_register_open_file_hook()
+ *
+ * A walk in progress holds a module reference on @hook->owner, so an
+ * unload waits for it; the hook itself is never used after this returns.
+ */
+void devres_unregister_open_file_hook(struct devres_open_file_hook *hook)
+{
+=09mutex_lock(&devres_open_file_hooks_lock);
+=09/* Never registered (static zero) or already unregistered: nothing to d=
o. */
+=09if (hook->list.next && !list_empty(&hook->list))
+=09=09list_del_init(&hook->list);
+=09mutex_unlock(&devres_open_file_hooks_lock);
+}
+EXPORT_SYMBOL_GPL(devres_unregister_open_file_hook);
+
+struct devres_region {
+=09const void *start;
+=09size_t size;
+=09const char *name;
+=09bool warned;
+};
+
+/* A hit on a live debugfs file, looked up again after devres_release_all(=
). */
+struct devres_pending_ref {
+=09const struct file *file;=09/* identity only, never dereferenced */
+=09const void *ptr;=09=09/* the offending pointer value */
+=09struct devres_region *region;
+=09const char *what;
+=09char comm[TASK_COMM_LEN];
+=09pid_t pnr, tgid;
+=09unsigned int fd;
+=09bool via_i_private;
+};
+
+/* Beyond this many distinct fd tables, later sharers are walked again. */
+#define DEVRES_SEEN_TABLES_MAX=091048576U
+#define DEVRES_PENDING_MAX=094096U
+#define DEVRES_HOOK_OBJECTS_MAX=098U
+
+/*
+ * Copy the data regions of @dev's managed allocations. Taken before
+ * devres_release_all() so the walk never holds devres_lock and never look=
s
+ * at a node that is being freed.
+ */
+static unsigned int devres_snapshot_regions(struct device *dev,
+=09=09=09=09=09    struct devres_region **out)
+{
+=09struct devres_region *regions;
+=09struct devres_node *node;
+=09unsigned int n =3D 0, i =3D 0;
+=09unsigned long flags;
+
+=09spin_lock_irqsave(&dev->devres_lock, flags);
+=09list_for_each_entry(node, &dev->devres_head, entry)
+=09=09if (node->release =3D=3D dr_node_release && node->size)
+=09=09=09n++;
+=09spin_unlock_irqrestore(&dev->devres_lock, flags);
+
+=09if (!n)
+=09=09return 0;
+
+=09regions =3D kcalloc(n, sizeof(*regions), GFP_KERNEL);
+=09if (!regions)
+=09=09return 0;
+
+=09/*
+=09 * The list may have changed between the two passes (a driver still
+=09 * calling devm_* after remove() returned, which is its own bug).
+=09 * Growth is bounded by @n (extra nodes are not checked); shrinkage
+=09 * leaves @i below @n, and only [0, @i) is returned.
+=09 */
+=09spin_lock_irqsave(&dev->devres_lock, flags);
+=09list_for_each_entry(node, &dev->devres_head, entry) {
+=09=09struct devres *dr;
+
+=09=09if (node->release !=3D dr_node_release || !node->size)
+=09=09=09continue;
+=09=09if (i =3D=3D n)
+=09=09=09break;
+=09=09dr =3D container_of(node, struct devres, node);
+=09=09regions[i].start =3D dr->data;
+=09=09regions[i].size =3D node->size;
+=09=09regions[i].name =3D node->name;
+=09=09i++;
+=09}
+=09spin_unlock_irqrestore(&dev->devres_lock, flags);
+
+=09if (!i) {
+=09=09kfree(regions);
+=09=09return 0;
+=09}
+=09*out =3D regions;
+=09return i;
+}
+
+static struct devres_region *devres_region_containing(struct devres_region=
 *r,
+=09=09=09=09=09=09      unsigned int nr,
+=09=09=09=09=09=09      const void *p)
+{
+=09unsigned int i;
+
+=09if (!p)
+=09=09return NULL;
+=09for (i =3D 0; i < nr; i++)
+=09=09if (p >=3D r[i].start && p < r[i].start + r[i].size)
+=09=09=09return &r[i];
+=09return NULL;
+}
+
+/*
+ * Hooks are used from the walk thread without the list mutex; a module
+ * reference on each owner keeps the hook object and its holder alive.
+ */
+static void devres_snapshot_hooks(struct devres_open_file_check *chk)
+{
+=09struct devres_open_file_hook *hook;
+=09unsigned int n =3D 0;
+
+=09mutex_lock(&devres_open_file_hooks_lock);
+=09list_for_each_entry(hook, &devres_open_file_hooks, list)
+=09=09n++;
+=09if (n) {
+=09=09chk->hooks =3D kcalloc(n, sizeof(*chk->hooks), GFP_KERNEL);
+=09=09if (chk->hooks) {
+=09=09=09list_for_each_entry(hook, &devres_open_file_hooks, list) {
+=09=09=09=09if (chk->nhooks =3D=3D n)
+=09=09=09=09=09break;
+=09=09=09=09/* An owner that is unloading unregisters next. */
+=09=09=09=09if (!try_module_get(hook->owner))
+=09=09=09=09=09continue;
+=09=09=09=09chk->hooks[chk->nhooks++] =3D hook;
+=09=09=09}
+=09=09}
+=09}
+=09mutex_unlock(&devres_open_file_hooks_lock);
+}
+
+static void devres_release_hooks(struct devres_open_file_check *chk)
+{
+=09while (chk->nhooks)
+=09=09module_put(chk->hooks[--chk->nhooks]->owner);
+=09kfree(chk->hooks);
+=09chk->hooks =3D NULL;
+}
+
+#define DEVRES_REF_FMT "DEVRES %s (%zu bytes) still referenced by %s of fd=
 %u (%pD3) in %s[%d]"
+
+/* One backtrace per allocation; further holders get one line each. */
+static void devres_warn_ref(struct device *dev, struct devres_region *regi=
on,
+=09=09=09    const char *what, unsigned int fd,
+=09=09=09    struct file *file, const char *comm, pid_t pnr,
+=09=09=09    const char *why)
+{
+=09if (!region->warned) {
+=09=09region->warned =3D true;
+=09=09dev_WARN(dev, DEVRES_REF_FMT " at unbind%s\n", region->name,
+=09=09=09 region->size, what, fd, file, comm, pnr, why);
+=09} else {
+=09=09dev_warn(dev, DEVRES_REF_FMT " at unbind%s\n", region->name,
+=09=09=09 region->size, what, fd, file, comm, pnr, why);
+=09}
+}
+
+/*
+ * A removed debugfs file: debugfs refuses further operations on it, but
+ * close() still runs the real release callback. Info if that callback is
+ * one that cannot touch the driver's data, a WARN naming it otherwise.
+ */
+static void devres_report_debugfs(struct device *dev,
+=09=09=09=09  struct devres_region *region,
+=09=09=09=09  const char *what, unsigned int fd,
+=09=09=09=09  struct file *file, const char *comm,
+=09=09=09=09  pid_t pnr, const struct file_operations *fops,
+=09=09=09=09  const char *when)
+{
+=09if (debugfs_file_release_safe(fops)) {
+=09=09dev_info(dev, DEVRES_REF_FMT " at unbind: debugfs file removed %s, o=
ps refused by debugfs, close is safe\n",
+=09=09=09 region->name, region->size, what, fd, file, comm,
+=09=09=09 pnr, when);
+=09=09return;
+=09}
+=09if (!region->warned) {
+=09=09region->warned =3D true;
+=09=09dev_WARN(dev, DEVRES_REF_FMT " at unbind: debugfs file removed %s, b=
ut close will call %ps on it\n",
+=09=09=09 region->name, region->size, what, fd, file, comm,
+=09=09=09 pnr, when, fops->release);
+=09} else {
+=09=09dev_warn(dev, DEVRES_REF_FMT " at unbind: debugfs file removed %s, b=
ut close will call %ps on it\n",
+=09=09=09 region->name, region->size, what, fd, file, comm,
+=09=09=09 pnr, when, fops->release);
+=09}
+}
+
+static void devres_report_open_file(struct device *dev,
+=09=09=09=09    struct devres_open_file_check *chk,
+=09=09=09=09    struct devres_region *region,
+=09=09=09=09    struct task_struct *task, pid_t pnr,
+=09=09=09=09    unsigned int fd, struct file *file,
+=09=09=09=09    const char *what)
+{
+=09const struct file_operations *real_fops;
+=09struct devres_pending_ref *pend;
+=09char comm[TASK_COMM_LEN];
+
+=09get_task_comm(comm, task);
+
+=09/* Already removed by remove(): decide now. */
+=09if (debugfs_file_revoked(file, &real_fops)) {
+=09=09devres_report_debugfs(dev, region, what, fd, file, comm, pnr,
+=09=09=09=09      real_fops, "in remove()");
+=09=09return;
+=09}
+
+=09/* Live debugfs file: a devres action may still remove it. Defer. */
+=09if (file_inode(file)->i_sb->s_magic =3D=3D DEBUGFS_MAGIC) {
+=09=09if (chk->npending =3D=3D chk->maxpending &&
+=09=09    chk->maxpending < DEVRES_PENDING_MAX) {
+=09=09=09unsigned int max =3D chk->maxpending ? chk->maxpending * 2 : 16;
+
+=09=09=09pend =3D kvrealloc(chk->pending,
+=09=09=09=09=09 array_size(max, sizeof(*pend)),
+=09=09=09=09=09 GFP_KERNEL | __GFP_NOWARN);
+=09=09=09if (pend) {
+=09=09=09=09chk->pending =3D pend;
+=09=09=09=09chk->maxpending =3D max;
+=09=09=09}
+=09=09}
+=09=09if (chk->npending < chk->maxpending) {
+=09=09=09pend =3D &chk->pending[chk->npending++];
+=09=09=09pend->file =3D file;
+=09=09=09pend->via_i_private =3D !strcmp(what, "i_private");
+=09=09=09pend->ptr =3D pend->via_i_private ?
+=09=09=09=09READ_ONCE(file_inode(file)->i_private) :
+=09=09=09=09READ_ONCE(file->private_data);
+=09=09=09pend->region =3D region;
+=09=09=09pend->what =3D what;
+=09=09=09strscpy(pend->comm, comm, sizeof(pend->comm));
+=09=09=09pend->pnr =3D pnr;
+=09=09=09pend->tgid =3D task_tgid_nr(task);
+=09=09=09pend->fd =3D fd;
+=09=09=09return;
+=09=09}
+=09=09/* Cannot defer: undecided, so a line without a backtrace. */
+=09=09dev_warn(dev, DEVRES_REF_FMT " at unbind: live debugfs file, verdict=
 not deferred\n",
+=09=09=09 region->name, region->size, what, fd, file, comm, pnr);
+=09=09return;
+=09}
+
+=09devres_warn_ref(dev, region, what, fd, file, comm, pnr, "");
+}
+
+static void devres_check_one_file(struct device *dev,
+=09=09=09=09  struct devres_open_file_check *chk,
+=09=09=09=09  struct task_struct *task, pid_t pnr,
+=09=09=09=09  unsigned int fd, struct file *file)
+{
+=09struct devres_region *region;
+=09const void *pd, *ip;
+=09unsigned int i;
+
+=09/* O_PATH files have no operations and no release: nothing can use them=
. */
+=09if (file->f_mode & FMODE_PATH)
+=09=09return;
+
+=09pd =3D READ_ONCE(file->private_data);
+=09region =3D devres_region_containing(chk->regions, chk->nr, pd);
+=09if (region)
+=09=09devres_report_open_file(dev, chk, region, task, pnr, fd, file,
+=09=09=09=09=09"private_data");
+
+=09ip =3D READ_ONCE(file_inode(file)->i_private);
+=09if (ip !=3D pd) {
+=09=09region =3D devres_region_containing(chk->regions, chk->nr, ip);
+=09=09if (region)
+=09=09=09devres_report_open_file(dev, chk, region, task, pnr,
+=09=09=09=09=09=09fd, file, "i_private");
+=09}
+
+=09/*
+=09 * A character device file holds a reference on its cdev's kobject
+=09 * (chrdev_open()), and inode->i_cdev is cleared only when that
+=09 * kobject is released, so for an open non-O_PATH file the pointer
+=09 * is stable here even after cdev_del(). A struct cdev embedded in
+=09 * managed memory therefore shows up directly. Compared, never
+=09 * dereferenced. i_cdev shares a union; only valid for S_ISCHR.
+=09 */
+=09if (S_ISCHR(file_inode(file)->i_mode)) {
+=09=09const void *cdev =3D READ_ONCE(file_inode(file)->i_cdev);
+
+=09=09region =3D devres_region_containing(chk->regions, chk->nr, cdev);
+=09=09if (region)
+=09=09=09devres_report_open_file(dev, chk, region, task, pnr,
+=09=09=09=09=09=09fd, file, "i_cdev");
+=09}
+
+=09for (i =3D 0; i < chk->nhooks; i++) {
+=09=09struct devres_open_file_hook *hook =3D chk->hooks[i];
+=09=09unsigned int idx;
+
+=09=09if (file->f_op !=3D hook->fops)
+=09=09=09continue;
+=09=09/* A holder ends with *what NULL; the cap guards a holder that never=
 does. */
+=09=09for (idx =3D 0; idx < DEVRES_HOOK_OBJECTS_MAX; idx++) {
+=09=09=09const char *what =3D NULL;
+=09=09=09const void *p =3D hook->holder(file, idx, &what);
+
+=09=09=09if (!what)
+=09=09=09=09break;
+=09=09=09region =3D devres_region_containing(chk->regions,
+=09=09=09=09=09=09=09  chk->nr, p);
+=09=09=09if (region)
+=09=09=09=09devres_report_open_file(dev, chk, region, task,
+=09=09=09=09=09=09=09pnr, fd, file, what);
+=09=09}
+=09}
+}
+
+/*
+ * Each fd table is walked once. A table already walked is remembered as
+ * (owning task, table) with a reference on the task only: a table counts =
as
+ * seen while that task still points at it, which proves it was not freed
+ * and reused by another task (the recorded task could only reach the same
+ * address again through two table switches, and what it opens after the
+ * walk visited it is not promised anyway). Nothing takes a reference on t=
he
+ * table itself, so the walk never ends up closing another task's files. I=
f
+ * the set cannot grow, later sharers are walked again, costing duplicate
+ * lines. The set is scanned linearly: O(threads x tables) per walk.
+ */
+static bool devres_fd_table_seen(struct devres_open_file_check *chk,
+=09=09=09=09 struct files_struct *files)
+{
+=09unsigned int i;
+
+=09for (i =3D 0; i < chk->nseen; i++)
+=09=09if (chk->seen[i].files =3D=3D files &&
+=09=09    READ_ONCE(chk->seen[i].task->files) =3D=3D files)
+=09=09=09return true;
+=09return false;
+}
+
+static void devres_fd_table_mark(struct devres_open_file_check *chk,
+=09=09=09=09 struct task_struct *task)
+{
+=09struct devres_seen_table *seen;
+=09struct files_struct *files;
+
+=09if (chk->nseen =3D=3D chk->maxseen) {
+=09=09unsigned int max =3D chk->maxseen ? chk->maxseen * 2 : 64;
+
+=09=09if (max > DEVRES_SEEN_TABLES_MAX)
+=09=09=09return;
+=09=09seen =3D kvrealloc(chk->seen, array_size(max, sizeof(*seen)),
+=09=09=09=09 GFP_KERNEL | __GFP_NOWARN);
+=09=09if (!seen)
+=09=09=09return;
+=09=09chk->seen =3D seen;
+=09=09chk->maxseen =3D max;
+=09}
+
+=09files =3D READ_ONCE(task->files);
+=09if (files && !devres_fd_table_seen(chk, files)) {
+=09=09chk->seen[chk->nseen].task =3D get_task_struct(task);
+=09=09chk->seen[chk->nseen].files =3D files;
+=09=09chk->nseen++;
+=09}
+}
+
+/* Phase 1 body: every thread's open files, each fd table once. */
+static int devres_walk_open_files(void *data)
+{
+=09struct devres_open_file_check *chk =3D data;
+=09struct device *dev =3D chk->dev;
+=09unsigned int tid =3D 0;
+
+=09for (;;) {
+=09=09struct task_struct *task;
+=09=09struct file *file;
+=09=09unsigned int fd =3D 0;
+=09=09struct pid *pid;
+=09=09pid_t pnr;
+
+=09=09rcu_read_lock();
+=09=09pid =3D find_ge_pid(tid, &init_pid_ns);
+=09=09if (!pid) {
+=09=09=09rcu_read_unlock();
+=09=09=09break;
+=09=09}
+=09=09pnr =3D pid_nr(pid);
+=09=09tid =3D pnr + 1;
+=09=09task =3D pid_task(pid, PIDTYPE_PID);
+=09=09if (task && READ_ONCE(task->files) &&
+=09=09    !devres_fd_table_seen(chk, READ_ONCE(task->files)))
+=09=09=09get_task_struct(task);
+=09=09else
+=09=09=09task =3D NULL;
+=09=09rcu_read_unlock();
+=09=09if (!task)
+=09=09=09continue;
+
+=09=09devres_fd_table_mark(chk, task);
+=09=09while ((file =3D fget_task_next(task, &fd))) {
+=09=09=09devres_check_one_file(dev, chk, task, pnr, fd, file);
+=09=09=09fput(file);
+=09=09=09fd++;
+=09=09}
+=09=09put_task_struct(task);
+=09=09cond_resched();
+=09}
+
+=09while (chk->nseen)
+=09=09put_task_struct(chk->seen[--chk->nseen].task);
+=09kvfree(chk->seen);
+=09chk->seen =3D NULL;
+=09chk->maxseen =3D 0;
+=09complete(&chk->done);
+=09return 0;
+}
+
+/* Phase 2 body: look each deferred (pid, fd) up again and decide. */
+static int devres_finish_open_files(void *data)
+{
+=09struct devres_open_file_check *chk =3D data;
+=09const struct file_operations *real_fops;
+=09struct device *dev =3D chk->dev;
+=09unsigned int i;
+
+=09for (i =3D 0; i < chk->npending; i++) {
+=09=09struct devres_pending_ref *pend =3D &chk->pending[i];
+=09=09struct task_struct *task;
+=09=09struct file *file;
+=09=09const void *p;
+
+=09=09/* The recorded thread, or failing that its group leader. */
+=09=09rcu_read_lock();
+=09=09task =3D find_task_by_pid_ns(pend->pnr, &init_pid_ns);
+=09=09if (!task)
+=09=09=09task =3D find_task_by_pid_ns(pend->tgid, &init_pid_ns);
+=09=09if (task)
+=09=09=09get_task_struct(task);
+=09=09rcu_read_unlock();
+=09=09if (!task)
+=09=09=09continue;=09/* process gone: nothing left to use the pointer */
+
+=09=09/*
+=09=09 * Find the recorded struct file anywhere in the task's table:
+=09=09 * the descriptor may have moved (dup2) since the walk. The
+=09=09 * address alone could be a reuse, so the same pointer value
+=09=09 * in the same field is required too; a reopened file of the
+=09=09 * same debugfs node satisfies both and dangles just the same.
+=09=09 */
+=09=09file =3D fget_task(task, pend->fd);
+=09=09if (file && file !=3D pend->file) {
+=09=09=09fput(file);
+=09=09=09file =3D NULL;
+=09=09}
+=09=09if (!file) {
+=09=09=09unsigned int fd =3D 0;
+
+=09=09=09while ((file =3D fget_task_next(task, &fd))) {
+=09=09=09=09if (file =3D=3D pend->file)
+=09=09=09=09=09break;
+=09=09=09=09fput(file);
+=09=09=09=09fd++;
+=09=09=09}
+=09=09}
+=09=09put_task_struct(task);
+=09=09if (!file)
+=09=09=09continue;=09/* closed: nothing left to use the pointer */
+
+=09=09p =3D pend->via_i_private ?
+=09=09=09READ_ONCE(file_inode(file)->i_private) :
+=09=09=09READ_ONCE(file->private_data);
+=09=09if (p !=3D pend->ptr) {
+=09=09=09fput(file);
+=09=09=09continue;=09/* replaced */
+=09=09}
+
+=09=09if (debugfs_file_revoked(file, &real_fops))
+=09=09=09devres_report_debugfs(dev, pend->region, pend->what,
+=09=09=09=09=09      pend->fd, file, pend->comm,
+=09=09=09=09=09      pend->pnr, real_fops,
+=09=09=09=09=09      "by a devres action");
+=09=09else if (d_unlinked(file->f_path.dentry))
+=09=09=09devres_warn_ref(dev, pend->region, pend->what, pend->fd,
+=09=09=09=09=09file, pend->comm, pend->pnr,
+=09=09=09=09=09": debugfs file removed, but its file_operations are not gu=
arded by debugfs");
+=09=09else
+=09=09=09devres_warn_ref(dev, pend->region, pend->what, pend->fd,
+=09=09=09=09=09file, pend->comm, pend->pnr,
+=09=09=09=09=09": debugfs file still registered after its data was freed")=
;
+=09=09fput(file);
+=09}
+=09complete(&chk->done);
+=09return 0;
+}
+
+/*
+ * Run @fn on a kernel thread and wait for it. A last file reference
+ * dropped there goes to the delayed-fput work, never to this task's task
+ * work, so nothing a devres action may wait for is queued behind unbind.
+ * The thread signals @chk->done and exits by itself; kthread_stop() is
+ * not used, since a stop requested before the thread first runs makes
+ * the kthread wrapper skip @fn altogether.
+ */
+static void devres_run_walk(struct devres_open_file_check *chk,
+=09=09=09    int (*fn)(void *), const char *name)
+{
+=09struct task_struct *t;
+
+=09init_completion(&chk->done);
+=09t =3D kthread_run(fn, chk, "%s/%s", name, dev_name(chk->dev));
+=09if (IS_ERR(t)) {
+=09=09dev_warn(chk->dev, "DEVRES: open-file check skipped, no thread\n");
+=09=09return;
+=09}
+=09wait_for_completion(&chk->done);
+}
+
+/**
+ * devres_check_open_files - find open files into memory about to be freed
+ * @dev: device being unbound; its managed resources are still allocated
+ * @chk: zero-initialised state, passed on to devres_finish_open_file_chec=
k()
+ *
+ * Walk every thread's open files and report any that still point into one
+ * of @dev's managed allocations, which devres_release_all() is about to
+ * free. Must be called in process context with no spinlocks held; it
+ * sleeps while a kernel thread does the walk. No file reference survives
+ * the call; a live debugfs hit is recorded as (pid, fd, file address) for
+ * devres_finish_open_file_check().
+ *
+ * If the owner closes a file while the walk holds its reference, the
+ * final fput() comes from the walk thread and the driver's release runs
+ * from the delayed-fput work, after this unbind has freed the memory if
+ * the file pointed into it: that is the bug being reported, hit one close
+ * later. A devres action that waits for such a close still completes,
+ * since that work does not wait for unbind, unless a release ahead of it
+ * on the serialized delayed-fput worker needs a lock unbind holds. A file
+ * passed to another process after the walk and closed here is not found
+ * again in phase 2. If the region snapshot cannot be allocated the check
+ * is skipped silently.
+ */
+void devres_check_open_files(struct device *dev,
+=09=09=09     struct devres_open_file_check *chk)
+{
+=09might_sleep();
+
+=09chk->dev =3D dev;
+=09chk->nr =3D devres_snapshot_regions(dev, &chk->regions);
+=09if (!chk->nr)
+=09=09return;
+
+=09devres_snapshot_hooks(chk);
+=09devres_run_walk(chk, devres_walk_open_files, "devres_refs");
+}
+
+/**
+ * devres_finish_open_file_check - decide the deferred debugfs hits
+ * @dev: the device, after devres_release_all()
+ * @chk: state from devres_check_open_files()
+ *
+ * A debugfs file that was live during the walk may have been removed by a
+ * devres action since; if debugfs refuses operations on it and its releas=
e
+ * cannot touch the data, the hit is informational. One still live, or
+ * whose close will run a release callback of the driver's own, points at
+ * freed memory.
+ */
+void devres_finish_open_file_check(struct device *dev,
+=09=09=09=09   struct devres_open_file_check *chk)
+{
+=09if (!chk->nr)
+=09=09return;
+
+=09if (chk->npending)
+=09=09devres_run_walk(chk, devres_finish_open_files, "devres_refs2");
+
+=09devres_release_hooks(chk);
+=09kvfree(chk->pending);
+=09chk->pending =3D NULL;
+=09chk->npending =3D 0;
+=09chk->maxpending =3D 0;
+=09kfree(chk->regions);
+=09chk->regions =3D NULL;
+=09chk->nr =3D 0;
+}
+#endif /* CONFIG_DEBUG_DEVRES_REFS */
+
 static void release_nodes(struct device *dev, struct list_head *todo)
 {
 =09struct devres_node *node, *tmp;
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index 7656c9ecd4..dd3f88fd8a 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -11,6 +11,8 @@
 #include <asm/bug.h>
 #include <asm/percpu.h>
=20
+#include <linux/list.h>
+
 struct device;
 struct device_node;
 struct resource;
@@ -284,4 +286,60 @@ static inline int __devm_add_action_or_reset(struct de=
vice *dev, void (*action)(
=20
 bool devm_is_action_added(struct device *dev, void (*action)(void *), void=
 *data);
=20
+struct file;
+struct file_operations;
+
+/**
+ * struct devres_open_file_hook - how an open file of one file_operations
+ *                                reaches the driver objects it keeps aliv=
e
+ * @list: internal
+ * @fops: the shared file_operations installed on such files at open
+ * @owner: the module holding @holder; a walk pins it
+ * @holder: returns the @idx-th object an open @fops file keeps alive and
+ *          sets *@what to its name, for @idx from 0 up; leaves *@what NUL=
L
+ *          when there are no more, which ends the sequence; may return
+ *          NULL with *@what set if that object is absent. At most eight
+ *          objects are consulted.
+ *
+ * CONFIG_DEBUG_DEVRES_REFS checks, on driver unbind or a failed probe,
+ * whether any open file still points into memory devres is about to free.=
 A
+ * subsystem whose files do not reach their objects through
+ * file->private_data, the inode's i_private or i_cdev registers one of
+ * these. @holder is called on a kernel thread with a reference on @file
+ * held and a module reference on @owner; it must not sleep on anything th=
at
+ * could wait for an unbind and must not dereference the objects it return=
s,
+ * nor anything else that may sit in managed memory of some device, which
+ * may already be freed; only what the open @file itself pins is safe.
+ * @file is not const only because subsystem accessors such as
+ * video_devdata() take a non-const file; @holder must not modify it. The
+ * struct is defined unconditionally so that a subsystem can keep its
+ * instance outside any #ifdef; the registration calls are empty
+ * stubs when the option is off. The instance must be static or
+ * zero-initialised, so that unregistering a hook whose registration faile=
d
+ * is a no-op. Unregister before the owning module's memory goes away,
+ * including on a failed module init.
+ */
+struct module;
+struct devres_open_file_hook {
+=09struct list_head list;
+=09const struct file_operations *fops;
+=09struct module *owner;
+=09const void *(*holder)(struct file *file, unsigned int idx,
+=09=09=09      const char **what);
+};
+
+#ifdef CONFIG_DEBUG_DEVRES_REFS
+int devres_register_open_file_hook(struct devres_open_file_hook *hook);
+void devres_unregister_open_file_hook(struct devres_open_file_hook *hook);
+#else
+static inline int devres_register_open_file_hook(struct devres_open_file_h=
ook *hook)
+{
+=09return 0;
+}
+
+static inline void devres_unregister_open_file_hook(struct devres_open_fil=
e_hook *hook)
+{
+}
+#endif
+
 #endif /* _DEVICE_DEVRES_H_ */
--=20
2.43.0


