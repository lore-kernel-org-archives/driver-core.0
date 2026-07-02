Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7688237A83D
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014817; cv=none; b=k8H03NMFvNBv+9/50tgDKpEHYp5nbapNCfsiv3LMziEMaQ3+SgeXR6+WQWg7e0veDXUzNJPsNytzZhggRY7AApbzKxCq/Zv4zqFDLrCiLbXN7pplNLbvMLjySAW1Bb9bYooeqrvx9yvR7//c4j+QmC6CbrB1iqgFlUp3kBtF5oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014817; c=relaxed/simple;
	bh=oqiP4f7xsbtTJQpWuwHQBPke1GQ6/vLyoL+clDJ79hw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZF5G2a7odcrsfpc5V1fRDe+1mJsEFsGXPvZaCsk5GrD8ud69YNZtnzzovIix35P4o4ftd5tTamPvnl1ijoBa9XmDFyb7zrXPpORNaVVGPFg2m1IXkjBRBGWDduY1Ghgd0LBbEoCUKAvGzrYfxUThtPW3lXzJiGLCFb4y9kmLIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=pOZPFfra; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="pOZPFfra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1783014816; x=1814550816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sSlTPPRGfH8uX0Q/+Vq9kwU7nczCfGQ8R9eS8+/KnEA=;
  b=pOZPFfraULR+slR6F6oKFO5Hp/Z6JgxhxJ0tx5Xs1L/6v0avndVIZNAW
   rl1RtG6GqRBiPJocSVSCeFOAUpewFPZyTbyubL+nIzHWqc7ICAIIRXxRG
   e+BO22LUeqelDA0cLEVCdi16F+lwzxMBYR2E8iwACmKXVC9+99WsXFDzL
   tnXccwtjQ+kifZ/jdwnWYowz3/W8rDftQEpcrI8KxMnLWa7y+/kNyifOo
   uWfbjPbtb1yp+ZTHZ8IxCVJh6zyJ4kqKbJ2YVAAb0xF5pPG3vWEzaD4oM
   2Rzqmfv5I+7EQqLBpAfuwpWdB4Gy7/8GzCKjG4lGFnwMUFq5wCDSO0gu7
   A==;
X-CSE-ConnectionGUID: pOZNzN7bQxC5C5HyldoDbQ==
X-CSE-MsgGUID: gb9pcWjVSPGNDOJgrRcVHw==
X-IronPort-AV: E=Sophos;i="6.25,144,1779148800"; 
   d="scan'208";a="22717676"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 17:53:33 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:13460]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.112:2525] with esmtp (Farcaster)
 id fd164244-2329-49ff-88a8-fff81b2dba1f; Thu, 2 Jul 2026 17:53:33 +0000 (UTC)
X-Farcaster-Flow-ID: fd164244-2329-49ff-88a8-fff81b2dba1f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 17:53:32 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Thu, 2 Jul 2026
 17:53:30 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tejun Heo
	<tj@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>, "David
 Woodhouse" <dwmw@amazon.co.uk>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, "David
 Matlack" <dmatlack@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Alexander Graf <graf@amazon.com>, <linux-mm@kvack.org>,
	<kexec@lists.infradead.org>, <nh-open-source@amazon.com>
Subject: [RFC PATCH 09/14] iommu: lazy-populate iommu_group reserved_regions/type attrs
Date: Thu, 2 Jul 2026 19:51:09 +0200
Message-ID: <20260702175114.24659-5-sakacpav@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702175114.24659-1-sakacpav@amazon.de>
References: <20260702174033.32116-1-sakacpav@amazon.de>
 <20260702175114.24659-1-sakacpav@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D036UWC002.ant.amazon.com (10.13.139.242) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

iommu_group_alloc() eagerly creates two attribute files -
reserved_regions and type - that are read only on the VFIO /
iommufd ioctl path (VFIO_IOMMU_GET_INFO, iommufd type query).
On systems with thousands of SR-IOV VFs each VF typically gets
its own iommu_group, so deferring these two attrs eliminates two
kernfs nodes per group at boot.

iommu_group_ktype is the first non-device_ktype consumer of the
populate mechanism: wire iommu_group_populate_one /
iommu_group_populate_all and call kernfs_set_lazy() on the
group's kernfs node immediately after kobject_init_and_add().
See the in-diff comment at the kernfs_set_lazy() site for the
ordering rationale (must precede kobject_create_and_add("devices")
to interact correctly with kernfs_inc_rev()).

Both callbacks fast-path on iommu_group_sysfs_populated() so
re-entry after the directory is fully populated is cheap and
cannot fire sysfs_warn_dup().

The name attribute is created on demand by iommu_group_set_name()
on a separate API path and is not handled by these callbacks;
groups without a set name return -ENOENT on lookup of name.

No userspace ABI change.  A selftest for this deferral is added
later in the series under tools/testing/selftests/sysfs-lazy/.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: iommu@lists.linux.dev
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-api@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Pavol Sakac <sakacpav@amazon.de>
---
 drivers/iommu/iommu.c | 132 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 119 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 61c12ba782066..7a8dd43f0a09a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -21,6 +21,7 @@
 #include <linux/iommufd.h>
 #include <linux/idr.h>
 #include <linux/err.h>
+#include <linux/kernfs.h>
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
 #include <linux/bitops.h>
@@ -71,8 +72,22 @@ struct iommu_group {
 	struct list_head entry;
 	unsigned int owner_cnt;
 	void *owner;
+	/* Embedded lazy-sysfs state (every iommu_group is lazy). */
+	struct sysfs_lazy_state sysfs_lazy;
 };
 
+static inline bool iommu_group_sysfs_populated(const struct iommu_group *group)
+{
+	return READ_ONCE(group->sysfs_lazy.populated);
+}
+
+static inline void
+iommu_group_sysfs_set_populated(struct iommu_group *group)
+{
+	lockdep_assert_held(&group->sysfs_lazy.lock);
+	WRITE_ONCE(group->sysfs_lazy.populated, true);
+}
+
 struct group_device {
 	struct list_head list;
 	struct device *dev;
@@ -1033,9 +1048,99 @@ static void iommu_group_release(struct kobject *kobj)
 	kfree(group);
 }
 
+/* Lazy iommu_group attrs (excludes "name", managed separately). */
+static const struct {
+	const char			*name;
+	struct iommu_group_attribute	*attr;
+} iommu_group_lazy_attrs[] = {
+	{ "reserved_regions", &iommu_group_attr_reserved_regions },
+	{ "type",             &iommu_group_attr_type },
+};
+
+static int iommu_group_populate_one(struct kobject *kobj, const char *name)
+{
+	struct iommu_group *group = to_iommu_group(kobj);
+	size_t i;
+	int ret = -ENOENT;
+	bool name_present = false;
+
+	/* Fast path: directory fully populated; kernfs has authoritative state. */
+	if (iommu_group_sysfs_populated(group))
+		return -ENOENT;
+
+	mutex_lock(&group->sysfs_lazy.lock);
+	/* Re-check under the lock against a concurrent populate_all. */
+	if (iommu_group_sysfs_populated(group)) {
+		ret = -ENOENT;
+		goto out;
+	}
+
+	/* Materialise the whole table (2 entries); cheaper than per-name dispatch. */
+	for (i = 0; i < ARRAY_SIZE(iommu_group_lazy_attrs); i++) {
+		struct iommu_group_attribute *attr =
+			iommu_group_lazy_attrs[i].attr;
+		int rc;
+
+		if (sysfs_kn_exists(&group->kobj, attr->attr.name))
+			rc = 0;
+		else
+			rc = iommu_group_create_file(group, attr);
+
+		if (!strcmp(name, iommu_group_lazy_attrs[i].name)) {
+			name_present = true;
+			ret = rc;
+		} else if (rc) {
+			pr_warn("group %d: lazy-create %s failed: %d\n",
+				group->id,
+				iommu_group_lazy_attrs[i].name, rc);
+		}
+	}
+	iommu_group_sysfs_set_populated(group);
+
+out:
+	mutex_unlock(&group->sysfs_lazy.lock);
+	return name_present ? ret : -ENOENT;
+}
+
+static void iommu_group_populate_all(struct kobject *kobj)
+{
+	struct iommu_group *group = to_iommu_group(kobj);
+	size_t i;
+	int ret;
+
+	/* Fast path: directory already fully populated. */
+	if (iommu_group_sysfs_populated(group))
+		return;
+
+	mutex_lock(&group->sysfs_lazy.lock);
+	if (iommu_group_sysfs_populated(group))
+		goto out;
+
+	for (i = 0; i < ARRAY_SIZE(iommu_group_lazy_attrs); i++) {
+		struct iommu_group_attribute *attr =
+			iommu_group_lazy_attrs[i].attr;
+
+		/* Existence check absorbs the populate_one race. */
+		if (sysfs_kn_exists(&group->kobj, attr->attr.name))
+			continue;
+
+		ret = iommu_group_create_file(group, attr);
+		if (ret)
+			pr_warn("group %d: lazy-create %s failed: %d\n",
+				group->id,
+				iommu_group_lazy_attrs[i].name, ret);
+	}
+
+	iommu_group_sysfs_set_populated(group);
+out:
+	mutex_unlock(&group->sysfs_lazy.lock);
+}
+
 static const struct kobj_type iommu_group_ktype = {
 	.sysfs_ops = &iommu_group_sysfs_ops,
 	.release = iommu_group_release,
+	.populate     = iommu_group_populate_one,
+	.populate_all = iommu_group_populate_all,
 };
 
 /**
@@ -1060,6 +1165,7 @@ struct iommu_group *iommu_group_alloc(void)
 
 	group->kobj.kset = iommu_group_kset;
 	mutex_init(&group->mutex);
+	mutex_init(&group->sysfs_lazy.lock);
 	INIT_LIST_HEAD(&group->devices);
 	INIT_LIST_HEAD(&group->entry);
 	xa_init(&group->pasid_array);
@@ -1078,6 +1184,19 @@ struct iommu_group *iommu_group_alloc(void)
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * Defer reserved_regions and type - both are read only on
+	 * VFIO/iommufd ioctl paths, so let the populate callbacks
+	 * materialise them on demand.
+	 *
+	 * KERNFS_LAZY MUST be set before kobject_create_and_add("devices"),
+	 * which calls kernfs_inc_rev() on this kobject's directory and
+	 * would otherwise leave a stale negative dentry cached for a
+	 * missing reserved_regions/type child.  WARN_ON because
+	 * iommu_group_alloc() controls all group kobjects directly.
+	 */
+	WARN_ON(kernfs_set_lazy(group->kobj.sd));
+
 	group->devices_kobj = kobject_create_and_add("devices", &group->kobj);
 	if (!group->devices_kobj) {
 		kobject_put(&group->kobj); /* triggers .release & free */
@@ -1091,19 +1210,6 @@ struct iommu_group *iommu_group_alloc(void)
 	 */
 	kobject_put(&group->kobj);
 
-	ret = iommu_group_create_file(group,
-				      &iommu_group_attr_reserved_regions);
-	if (ret) {
-		kobject_put(group->devices_kobj);
-		return ERR_PTR(ret);
-	}
-
-	ret = iommu_group_create_file(group, &iommu_group_attr_type);
-	if (ret) {
-		kobject_put(group->devices_kobj);
-		return ERR_PTR(ret);
-	}
-
 	pr_debug("Allocated group %d\n", group->id);
 
 	return group;
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

