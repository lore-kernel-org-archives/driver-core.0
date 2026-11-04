Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829665;
	b=uTwxRfEFiO5MAGj9BSyC0Hmu9ntMoMyDwKPKKp53gAG+3Yrjy48C+bXKLLw7URBDxy+4
	 LIot8JpK5JYgE+Sv46aTNfCWX+x0+6gSMdg9Pvxz+Y0kDfWdJcs1cFvPtmm4rj62jhlLS
	 L8yMsCzpVJML6v6hQQi+sJIjzDFBGOP7IY8M8b7JAVvPfKarkw4du4pQYuXyEqLBDt0kd
	 z7XRSpjk3BP5ikjG4r+KUcuRyz7TRWXtCwV15pD/B1CZDb1QemW+NYVDJM6fdt3bou0TO
	 cWfz3doIH/rcjDQwaRFX8NeTnGdH1D0M/Lw/u13yMqfKz47xWmTnVpnMkkoKEdDDGlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829665;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1sjaakE+YA9fNVZvjX29YflKzzv+s4AfE0dYZK0O3I0=;
	b=mpljLV1M47Mym9snVmS3FzmVj0H6hsK2c9LnufkzjCZp2aqNPWxNaSvOHUwN7RNUyOdJ
	 btNZqljOMT7x2jwjFkFv+C+3mTffvLjcDvdoBgFewU2d0ScNfVt1k9gZZc5M+x2/Q2Bwq
	 4ExX1hT3G2VLOAb299BOrBoDq7p/0TF7uHpkKYls4o9K6BE02N5joEsWgQ0CvY1ww7kxt
	 TBoB9loP1S8STLhPPoWd4xYLYdTpqdRK8tWVYrNzHUHjlwS9rI9he3dktzR7BQ6dSaa7/
	 Yuo/Jy4COBGO/GSMfhKRCU9F1Z3POGmFezwUSx6/YBc3MGkOE7bPHlUeVmwIsvTYe5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=Tm0mxSNd;
	arc=none smtp.remote-ip=109.224.244.22
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96270606BA24
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 22:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96270606BA24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=Tm0mxSNd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793829662; x=1794088862;
	bh=1sjaakE+YA9fNVZvjX29YflKzzv+s4AfE0dYZK0O3I0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Tm0mxSNdG66gOSDdzIcR4QCJb83oraYEHAZjDHnH57rKNyshrcJFQajRWUvLmetWd
	 o7e+s3MtWPdg/7bPxeZmB2ePi+vahDpbu8pzsPNJbc7tgkbmDw5mTvAh4R5AOX6XpZ
	 ow8f9hzAZz0CLxtc9T3qaq/AgxFDa53AWovxyzVT2RAhmiWycq8zZiMaZcEeX9EUBv
	 Fa/8q/FYm3InPDUFCHRxiote6KRdhVSSYN1PqmddPENHcVZPfUIAfh3EO3kGn+7Nuq
	 lVuOJh72lCtG81C4iocWS9eHZylKuhmcvr6gUiZjnHQVXPc3KwRpPAVRzGrA4DwCuW
	 LwiM4rRcOs8YA==
Date: Wed, 04 Nov 2026 22:00:57 +0000
To: linux-kernel@vger.kernel.org
From: Chad Aldreda <ca@modelmiser.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, driver-core@lists.linux.dev, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nick Faro <yux50000@hotmail.com>
Subject: [RFC PATCH 4/4] drivers: base: test: add a vehicle for DEBUG_DEVRES_REFS
Message-ID: <20261104220041.3994559-3-ca@modelmiser.com>
In-Reply-To: <20261104215546.3990950-1-ca@modelmiser.com>
References: <20261104215546.3990950-1-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: d16a27c94a5e8d4ddab9719659d532294fb0e54b
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

Register a platform device whose driver exposes two misc devices, one
character device and one debugfs file: /dev/devm_refs_bad keeps its
state, with the miscdevice embedded, in devm memory; /dev/devm_refs_good
keeps refcounted state freed on last close; /dev/devm_refs_cdev is a
struct cdev embedded in devm memory; the debugfs file bad_magic points
into the devm state and is removed by a devres action registered after
that allocation. The driver depends on DEBUG_FS for that file.

Unbinding the device with all four held open must warn exactly twice,
for the devm-backed misc node and for the cdev, and report the debugfs
file at info level after release; closing the bad node and the cdev
node afterwards are use-after-frees that KASAN reports independently
(the cdev close reads the freed cdev in cdev_put() and then writes its
kobject refcount in kobject_put(), so run this under KASAN only).
Rebinding and unbinding with nothing open must be silent.

Written with Claude (Anthropic) under my direction; see the cover letter
for the disclosure required by Documentation/process/generated-content.rst.

Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
 drivers/base/test/Kconfig          |  15 ++
 drivers/base/test/Makefile         |   2 +
 drivers/base/test/devm_refs_test.c | 323 +++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)
 create mode 100644 drivers/base/test/devm_refs_test.c

diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 1ecf079124..e04dfda988 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -23,3 +23,18 @@ config DRIVER_SWNODE_KUNIT_TEST
 =09tristate "KUnit Tests for software node fw_devlink links" if !KUNIT_ALL=
_TESTS
 =09depends on KUNIT
 =09default KUNIT_ALL_TESTS
+
+config DEVM_REFS_TEST
+=09tristate "Test driver for DEBUG_DEVRES_REFS"
+=09depends on DEBUG_DEVRES_REFS && DEBUG_FS
+=09help
+=09  Registers a platform device whose driver exposes /dev/devm_refs_bad
+=09  (state in devm memory, freed on unbind while open),
+=09  /dev/devm_refs_good (refcounted state), /dev/devm_refs_cdev (a
+=09  struct cdev embedded in devm memory) and a debugfs file bad_magic
+=09  whose data is that devm memory and whose removal is a devres
+=09  action. Unbinding with all four open must warn once for the bad
+=09  node and once for the cdev, and report the debugfs file at info
+=09  level after release. See drivers/base/test/devm_refs_test.c.
+
+=09  If unsure say N.
diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index 9ced7bbd56..556b9d2635 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) +=3D property-entry-test=
.o
 CFLAGS_property-entry-test.o +=3D $(DISABLE_STRUCTLEAK_PLUGIN)
=20
 obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) +=3D swnode-devlink-test.o
+
+obj-$(CONFIG_DEVM_REFS_TEST)=09+=3D devm_refs_test.o
diff --git a/drivers/base/test/devm_refs_test.c b/drivers/base/test/devm_re=
fs_test.c
new file mode 100644
index 0000000000..40b4211d52
--- /dev/null
+++ b/drivers/base/test/devm_refs_test.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test vehicle for CONFIG_DEBUG_DEVRES_REFS.
+ *
+ * Registers one platform device bound to a driver that exposes two misc
+ * devices, one character device and one debugfs file (see
+ * devm_refs_dbg_show() below):
+ *
+ *   /dev/devm_refs_bad  - driver state allocated with devm_kzalloc(), so
+ *                         it is freed on unbind even while the node is op=
en.
+ *                         file->private_data (set by the misc core to the
+ *                         embedded struct miscdevice) points into it.
+ *   /dev/devm_refs_good - driver state refcounted and freed on last put,
+ *                         so unbind with the node open is safe.
+ *   /dev/devm_refs_cdev - a struct cdev embedded in devm memory; an open
+ *                         file reaches it through inode->i_cdev.
+ *
+ * Unbinding the device with all nodes held open must produce exactly two
+ * DEBUG_DEVRES_REFS warnings, for the bad node and for the cdev, and an
+ * info line for the debugfs file after release. Closing the bad node and
+ * the cdev node after unbind are use-after-frees that KASAN reports
+ * independently; the cdev close reads the freed object in cdev_put() and
+ * then writes its kobject refcount in kobject_put(), so run this under
+ * KASAN only.
+ */
+#include <linux/cdev.h>
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/kref.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+
+#define DEVM_REFS_MAGIC=090x5245465344455644ULL=09/* "DVEDSFER" */
+
+struct devm_refs_bad {
+=09struct miscdevice misc;
+=09u64 magic;
+};
+
+struct devm_refs_good {
+=09struct miscdevice misc;
+=09struct kref kref;
+=09u64 magic;
+};
+
+struct devm_refs_cdev {
+=09struct cdev cdev;
+=09u64 magic;
+};
+
+struct devm_refs_state {
+=09struct devm_refs_bad *bad;
+=09struct devm_refs_good *good;
+=09struct devm_refs_cdev *cd;
+=09struct class *class;
+=09dev_t devt;
+=09struct dentry *dbg;
+};
+
+static ssize_t devm_refs_cdev_read(struct file *file, char __user *buf,
+=09=09=09=09   size_t len, loff_t *ppos)
+{
+=09struct devm_refs_cdev *cd =3D
+=09=09container_of(file_inode(file)->i_cdev, struct devm_refs_cdev, cdev);
+=09char tmp[32];
+=09int n;
+
+=09n =3D scnprintf(tmp, sizeof(tmp), "%s\n",
+=09=09      cd->magic =3D=3D DEVM_REFS_MAGIC ? "ok" : "CORRUPT");
+=09return simple_read_from_buffer(buf, len, ppos, tmp, n);
+}
+
+static const struct file_operations devm_refs_cdev_fops =3D {
+=09.owner =3D THIS_MODULE,
+=09.read =3D devm_refs_cdev_read,
+};
+
+/*
+ * A debugfs file whose i_private points into devm memory and whose
+ * removal is a devres action registered AFTER that allocation: debugfs
+ * revokes it before the memory goes, so the check must report it at info
+ * level after release, not WARN during the walk.
+ */
+static int devm_refs_dbg_show(struct seq_file *m, void *v)
+{
+=09struct devm_refs_bad *bad =3D m->private;
+
+=09seq_printf(m, "%s\n", bad->magic =3D=3D DEVM_REFS_MAGIC ? "ok" : "CORRU=
PT");
+=09return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(devm_refs_dbg);
+
+static void devm_refs_dbg_remove(void *dir)
+{
+=09debugfs_remove_recursive(dir);
+}
+
+static ssize_t devm_refs_bad_read(struct file *file, char __user *buf,
+=09=09=09=09  size_t len, loff_t *ppos)
+{
+=09struct devm_refs_bad *bad =3D
+=09=09container_of(file->private_data, struct devm_refs_bad, misc);
+=09char tmp[32];
+=09int n;
+
+=09n =3D scnprintf(tmp, sizeof(tmp), "%s\n",
+=09=09      bad->magic =3D=3D DEVM_REFS_MAGIC ? "ok" : "CORRUPT");
+=09return simple_read_from_buffer(buf, len, ppos, tmp, n);
+}
+
+static int devm_refs_bad_release(struct inode *inode, struct file *file)
+{
+=09struct devm_refs_bad *bad =3D
+=09=09container_of(file->private_data, struct devm_refs_bad, misc);
+
+=09/* After unbind this is a read of freed memory. */
+=09pr_info("devm_refs_test: bad release, magic %s\n",
+=09=09bad->magic =3D=3D DEVM_REFS_MAGIC ? "ok" : "CORRUPT");
+=09return 0;
+}
+
+static const struct file_operations devm_refs_bad_fops =3D {
+=09.owner =3D THIS_MODULE,
+=09.read =3D devm_refs_bad_read,
+=09.release =3D devm_refs_bad_release,
+};
+
+static void devm_refs_good_free(struct kref *kref)
+{
+=09struct devm_refs_good *good =3D
+=09=09container_of(kref, struct devm_refs_good, kref);
+
+=09pr_info("devm_refs_test: good freed on last put\n");
+=09kfree(good);
+}
+
+static int devm_refs_good_open(struct inode *inode, struct file *file)
+{
+=09struct devm_refs_good *good =3D
+=09=09container_of(file->private_data, struct devm_refs_good, misc);
+
+=09kref_get(&good->kref);
+=09return 0;
+}
+
+static ssize_t devm_refs_good_read(struct file *file, char __user *buf,
+=09=09=09=09   size_t len, loff_t *ppos)
+{
+=09struct devm_refs_good *good =3D
+=09=09container_of(file->private_data, struct devm_refs_good, misc);
+=09char tmp[32];
+=09int n;
+
+=09n =3D scnprintf(tmp, sizeof(tmp), "%s\n",
+=09=09      good->magic =3D=3D DEVM_REFS_MAGIC ? "ok" : "CORRUPT");
+=09return simple_read_from_buffer(buf, len, ppos, tmp, n);
+}
+
+static int devm_refs_good_release(struct inode *inode, struct file *file)
+{
+=09struct devm_refs_good *good =3D
+=09=09container_of(file->private_data, struct devm_refs_good, misc);
+
+=09pr_info("devm_refs_test: good release, magic %s\n",
+=09=09good->magic =3D=3D DEVM_REFS_MAGIC ? "ok" : "CORRUPT");
+=09kref_put(&good->kref, devm_refs_good_free);
+=09return 0;
+}
+
+static const struct file_operations devm_refs_good_fops =3D {
+=09.owner =3D THIS_MODULE,
+=09.open =3D devm_refs_good_open,
+=09.read =3D devm_refs_good_read,
+=09.release =3D devm_refs_good_release,
+};
+
+static int devm_refs_probe(struct platform_device *pdev)
+{
+=09struct device *dev =3D &pdev->dev, *cdev_dev;
+=09struct devm_refs_state *st;
+=09int ret;
+
+=09st =3D devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
+=09if (!st)
+=09=09return -ENOMEM;
+
+=09st->bad =3D devm_kzalloc(dev, sizeof(*st->bad), GFP_KERNEL);
+=09if (!st->bad)
+=09=09return -ENOMEM;
+=09st->bad->magic =3D DEVM_REFS_MAGIC;
+=09st->bad->misc.minor =3D MISC_DYNAMIC_MINOR;
+=09st->bad->misc.name =3D "devm_refs_bad";
+=09st->bad->misc.fops =3D &devm_refs_bad_fops;
+=09st->bad->misc.parent =3D dev;
+
+=09st->good =3D kzalloc_obj(*st->good);
+=09if (!st->good)
+=09=09return -ENOMEM;
+=09kref_init(&st->good->kref);
+=09st->good->magic =3D DEVM_REFS_MAGIC;
+=09st->good->misc.minor =3D MISC_DYNAMIC_MINOR;
+=09st->good->misc.name =3D "devm_refs_good";
+=09st->good->misc.fops =3D &devm_refs_good_fops;
+=09st->good->misc.parent =3D dev;
+
+=09st->dbg =3D debugfs_create_dir("devm_refs_test", NULL);
+=09debugfs_create_file("bad_magic", 0444, st->dbg, st->bad,
+=09=09=09    &devm_refs_dbg_fops);
+=09ret =3D devm_add_action_or_reset(dev, devm_refs_dbg_remove, st->dbg);
+=09if (ret)
+=09=09goto err_free_good;
+
+=09ret =3D misc_register(&st->bad->misc);
+=09if (ret)
+=09=09goto err_free_good;
+=09ret =3D misc_register(&st->good->misc);
+=09if (ret)
+=09=09goto err_dereg_bad;
+
+=09/* A cdev embedded in devm memory, with its own /dev node. */
+=09st->cd =3D devm_kzalloc(dev, sizeof(*st->cd), GFP_KERNEL);
+=09if (!st->cd) {
+=09=09ret =3D -ENOMEM;
+=09=09goto err_dereg_good;
+=09}
+=09st->cd->magic =3D DEVM_REFS_MAGIC;
+=09ret =3D alloc_chrdev_region(&st->devt, 0, 1, "devm_refs_cdev");
+=09if (ret)
+=09=09goto err_dereg_good;
+=09cdev_init(&st->cd->cdev, &devm_refs_cdev_fops);
+=09st->cd->cdev.owner =3D THIS_MODULE;
+=09ret =3D cdev_add(&st->cd->cdev, st->devt, 1);
+=09if (ret)
+=09=09goto err_region;
+=09st->class =3D class_create("devm_refs");
+=09if (IS_ERR(st->class)) {
+=09=09ret =3D PTR_ERR(st->class);
+=09=09goto err_cdev;
+=09}
+=09cdev_dev =3D device_create(st->class, dev, st->devt, NULL,
+=09=09=09=09 "devm_refs_cdev");
+=09if (IS_ERR(cdev_dev)) {
+=09=09ret =3D PTR_ERR(cdev_dev);
+=09=09goto err_class;
+=09}
+
+=09platform_set_drvdata(pdev, st);
+=09dev_info(dev, "probed: /dev/devm_refs_bad, /dev/devm_refs_good, /dev/de=
vm_refs_cdev\n");
+=09return 0;
+
+err_class:
+=09class_destroy(st->class);
+err_cdev:
+=09cdev_del(&st->cd->cdev);
+err_region:
+=09unregister_chrdev_region(st->devt, 1);
+err_dereg_good:
+=09misc_deregister(&st->good->misc);
+err_dereg_bad:
+=09misc_deregister(&st->bad->misc);
+=09/* Registered or not, drop the probe-time reference; the free runs on z=
ero. */
+=09kref_put(&st->good->kref, devm_refs_good_free);
+=09return ret;
+err_free_good:
+=09kfree(st->good);
+=09return ret;
+}
+
+static void devm_refs_remove(struct platform_device *pdev)
+{
+=09struct devm_refs_state *st =3D platform_get_drvdata(pdev);
+
+=09device_destroy(st->class, st->devt);
+=09class_destroy(st->class);
+=09cdev_del(&st->cd->cdev);
+=09unregister_chrdev_region(st->devt, 1);
+=09misc_deregister(&st->good->misc);
+=09misc_deregister(&st->bad->misc);
+=09kref_put(&st->good->kref, devm_refs_good_free);
+=09dev_info(&pdev->dev, "removed; devres release follows\n");
+}
+
+static struct platform_driver devm_refs_driver =3D {
+=09.probe =3D devm_refs_probe,
+=09.remove =3D devm_refs_remove,
+=09.driver =3D {
+=09=09.name =3D "devm_refs_test",
+=09},
+};
+
+static struct platform_device *devm_refs_pdev;
+
+static int __init devm_refs_test_init(void)
+{
+=09int ret;
+
+=09ret =3D platform_driver_register(&devm_refs_driver);
+=09if (ret)
+=09=09return ret;
+
+=09devm_refs_pdev =3D platform_device_register_simple("devm_refs_test", -1=
,
+=09=09=09=09=09=09=09 NULL, 0);
+=09if (IS_ERR(devm_refs_pdev)) {
+=09=09platform_driver_unregister(&devm_refs_driver);
+=09=09return PTR_ERR(devm_refs_pdev);
+=09}
+=09return 0;
+}
+
+static void __exit devm_refs_test_exit(void)
+{
+=09platform_device_unregister(devm_refs_pdev);
+=09platform_driver_unregister(&devm_refs_driver);
+}
+
+module_init(devm_refs_test_init);
+module_exit(devm_refs_test_exit);
+MODULE_DESCRIPTION("Test vehicle for DEBUG_DEVRES_REFS");
+MODULE_LICENSE("GPL");
--=20
2.43.0


