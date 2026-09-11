Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEA34A6CF1
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789146977; cv=none; b=mne1/yJ5IEJd8SQKG50aw3400w05EuCQy76tN7GP3GAMkUmv4ppaGzueWjQfzRfBluvNkHwie8DGu+L91jN0i0r7cQ++UQhL04xr31dbKhAylIkfE+ZtPtZHDMvAzHiOhqlbrF8IuQ81TlpNWA+Ayqf0OHALVLcxmoW31zomu8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789146977; c=relaxed/simple;
	bh=yB+ItLzWlbPERpOrkWuof7cPgdxc63+FGmhcfwra3fE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AD4BjxLod8fqUNYMSpucpxNtpwthO7e66yyHjW/c6RExTep0rDX7sXT1q6m5WvW4PPF9qgCHU0qCFUrRzbJJMno9Y0A8/Ahy4Di61x7ztCm7EtUW6WLFobMIplWnVi9aHKAUP0Lc1me0PfSj2+PsbybcOmUdMvnT4r+yXfCq8ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=QXdNomoy; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="QXdNomoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1789146973; x=1820682973;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j5Kqb/RUyMY4Nz6pGMPYL0q3ntFXYLXjxg//I1YmKB8=;
  b=QXdNomoy/vp1qzpwotJxXJvT9yEvLKaW44OoG5+6EGv1cSVJKU9fZmAz
   mjA8CsFWyDfDp9EnrnIh1Oyp3eaUAc9gO8nnHPQ4L5+CD5c0Mrscjlfj3
   OuStAGx5BxkuriM1tQdHjuqktd8ujHWeEKrr8nt6i/L2MOGqg4cKnQP5A
   z5zdy0eUPJ2evbh80+1yeKLiaSuMVWzBZWI56YdCoIKOS4Qe1elI6+DP7
   +eAx9lPoe4TY0uxeERd6/D/z5oEBuI9/GwqkilfmTPD4jgp3l6KZscX79
   HJiOmkVBi5in9lWVETw8QeCbdRnCLfHVwS+/66SoI4MTP3c3M+nGXNMD6
   Q==;
X-CSE-ConnectionGUID: bB0ZI/mgR6q73bo++5gQ5A==
X-CSE-MsgGUID: jHIt/5KMSDy4C2WAuSnDHw==
X-IronPort-AV: E=Sophos;i="6.27,97,1787011200"; 
   d="scan'208";a="28232612"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:16:10 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:6049]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.37.160:2525] with esmtp (Farcaster)
 id 2562d9df-1979-4259-ba7c-82e5f8929071; Fri, 11 Sep 2026 17:16:09 +0000 (UTC)
X-Farcaster-Flow-ID: 2562d9df-1979-4259-ba7c-82e5f8929071
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 11 Sep 2026 17:16:09 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Fri, 11 Sep 2026
 17:16:07 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo
	<tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Xu Yang <xu.yang_2@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	<nh-open-source@amazon.com>
Subject: [PATCH 0/3] kernfs, driver core: Cut per-node lock traffic in bulk registration
Date: Fri, 11 Sep 2026 19:16:02 +0200
Message-ID: <20260911-vfopt-s3-v1-0-66e3602f76f7@amazon.de>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Registering VFs in parallel, introduced in [1], runs into three lock
costs in kernfs and the driver core. Two scale with the number of
sysfs nodes created: the kernfs root rwsem is write-taken twice per
node, and every inode ID is allocated under kernfs_idr_lock. The third
scales with the number of devices: get_device_parent()'s glue
directory lookup walks a flat list under the global gdp_mutex.

The glue directory is how the driver core groups class devices under a
parent that is not itself a class device: when vfio-pci binds, each VF
gets a "vfio-dev" glue directory holding its vfio-dev class device.
get_device_parent() finds or creates it by walking the class's flat
glue_dirs list under gdp_mutex, so with thousands of VFs each
registration walks thousands of entries - quadratic work, serialized
on one global mutex.

Patch 1 (kernfs) activates a new node inside the same kernfs_rwsem
write hold that links it: one write acquisition per node instead of
two. Patch 2 (driver core) indexes glue directories by parent kobject
in an rbtree, replacing the linear walk; gdp_mutex still serializes as
before. Patch 3 (kernfs) pre-allocates inode IDs in batches of 16,
caches them per CPU, and installs the node pointer with an RCU store
via idr_replace(), cutting kernfs_idr_lock acquisitions 16x.

Lock statistics and SR-IOV init time for 4x PF (NVMe, 255 VFs each), on
the reproducer from the parallel VF initialization cover letter [1]:

  lock_stat:
  Lock                     wait: Before     After   contentions: Before   After
  iommu_probe_device_lock      10471 ms   9154 ms                   841     783
  &vfio.group_lock              3614 ms   3823 ms                   736     730
  &root->kernfs_rwsem           1834 ms   1285 ms                116316   55459
  &root->kernfs_idr_lock           5 ms      0 ms                  4580      77

  iommu_probe_device_lock and vfio.group_lock are shown for scale;
  neither is touched by this series - they are addressed by the
  IOMMU [2] and VFIO [3] series posted separately.

  kernfs_rwsem write acquisitions  168302 (2/node) -> 84661 (1/node)
  kernfs_idr_lock acquisitions     83641 -> 5229 (batch 16)
  gdp_mutex avg hold               18 -> 7 us (2040 acq. both arms)

  Stage                 SR-IOV init time:
  S0 (baseline)         3027 ms
  S1                     999 ms
  S2                     995 ms
  S3 (this series)       991 ms

Reproducer disclaimer:
I lean primarily on lock_stat numbers to defend the improvements. In
the reproducer, the residual iommu_probe_device_lock dominates the
window and masks the later series' wall-time gains; reducing that lock
further is out of scope for this set. On real hardware the five series
together cut SR-IOV initialization by 65%, more in [1].

The staged sysfs RFC [4] builds on top of these changes (mainly the
IDR batching).

This series adds a KUnit suite. The lock_stat and timing figures come
from the public reproducer. The full series has also been tested on
current datacenter server hardware with thousands of VFs.


[1] https://lore.kernel.org/r/20260911-vfopt-s1-v1-0-693271dc0226@amazon.de
[2] https://lore.kernel.org/r/20260911-vfopt-s2-v1-0-fff3db7e01c2@amazon.de
[3] https://lore.kernel.org/r/20260911-vfopt-s4-v1-0-98ba1d2ef7ab@amazon.de
[4] https://lore.kernel.org/r/20260911-vfopt-s5-v1-0-fa4cacdb6ca8@amazon.de

Pavol Sakac (3):
  kernfs: activate nodes while linking them
  driver core: Index class glue directories by parent kobject
  kernfs: batch inode ID allocation per CPU

 drivers/base/base.h                  |   4 +
 drivers/base/core.c                  | 112 +++++--
 drivers/base/test/.kunitconfig       |   1 +
 drivers/base/test/Kconfig            |  12 +
 drivers/base/test/Makefile           |   2 +
 drivers/base/test/glue-dir-test.c    | 466 +++++++++++++++++++++++++++
 drivers/base/test/root-device-test.c | 215 ++++++++++++
 fs/kernfs/dir.c                      | 139 +++++++-
 fs/kernfs/kernfs-internal.h          |   3 +
 fs/sysfs/mount.c                     |   3 +-
 include/linux/kernfs.h               |  13 +
 11 files changed, 930 insertions(+), 40 deletions(-)
 create mode 100644 drivers/base/test/glue-dir-test.c


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.47.3

