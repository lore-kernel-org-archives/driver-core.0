Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51276340D90
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783871119; cv=none; b=nx3ewyly9++qELFobvE+9lT7iHBBncpCrnNpJwgDcL5eQ9sOpnyt20lfBvaPhsemOlNtgQCPLguv54Gp44gJKLJ5g9bUF+MUUHD6vQmIGYbV8sPeo/TN/TX9jnNrwi4nSvQKTh+4yZ9CbyrzUCrfoOE91WLpkl+KHcR50dLNrTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783871119; c=relaxed/simple;
	bh=c2rTynvZmw41AyQtdN492V16tvCPLmmOtTp42guX71k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rtj/Ao4rMUbAuiue9p458TwjsuA21yhkOD33Rd+as9dTTShni9ogr9YkpJCFMazox3OhuRIkJ0HAf7sRYKfdmp6kNzaoD1Rg/SEOojtgtNvjjXJZBcqOWUDuZfDStc6Ha9mlmsIBK/8YVfLWTYIhJhGcV9D0UCBaGq6qeIxxeRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qcgrVNLI; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qcgrVNLI"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e5d6f35c1so193410085a.0
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783871115; x=1784475915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sA+zg3hun+tcy2tg/tGGOKyNNSW3ITFRulSJiyHuZ8=;
        b=qcgrVNLIqje6/GQF6bdGZOzBAs1KEmZIqDVcNdS+hS/u2C/bLgrdmIuKTEP2UQlBj2
         Vi8/RU0pXQvsYtBCTtrV78+OC3y9JBoXmLlvKkl5WSth0jecgJoX4J9CToZ3MFqdv3kB
         mpgUS0oJvdtKzKvBZ9qlDnj84xL23oQ5Zr+sYRYPHlmDEGORFHar5GxnBySEyQU95iZp
         YMikNAcqss1SK2T+dix14T+p3jFw2TgGel6KaJdgR3mSXoTB7KyU5QkJq+DyKWXAyiIS
         srQmYEDf7IRGmF4zQYJUhXdq/JAZWcW5PWBEf84eNSE3aeIkPnmjtQKsD1/5f2SB8z2S
         6SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783871115; x=1784475915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sA+zg3hun+tcy2tg/tGGOKyNNSW3ITFRulSJiyHuZ8=;
        b=PhAEfOILPa7ZIRAYEJE+YTpBNacyqEUdJPvNmyccOxdXjQGlOAozikb8+fSbL0YGuK
         Ta550q8U0na4GQrwISP9RCBnuurPs0Oc43tnl2UZIzK6nKJ5U02/NPAL/WbbWs5v/vxb
         DTQkGfumF3ZHPhHXWRPwzTAPqxs27E7z2uBVLGO3RXnDA6g0PJdeIqUx7oSCfWzaoAon
         icGIX2r/EZg1lcBMLwpoy2SJoeZoW/ZUD0lhoaFfZJdc6uI60wqunmuacpFtdKdKrCRM
         RVRboi/3Eg3zDXzHMvfZSZV0a3WQnubDoq4gDrAhHldxuAVeJYrLYrkFxb63Z32nFxVG
         JKsg==
X-Forwarded-Encrypted: i=1; AHgh+RpM3zzl3RL0IITd/4mh7tcFQIZoB74jev61OfjQtjRooiUB5ls86HtBF1ASziwmkLOSfekXGgWOwL3Mxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzU01vGzhqOxOuFoUlgZ0ogksvhwjS5YAQlb/rtwFyj6/TNQ2TE
	bHGOEWiD/mox30RH9iMmBk2npJKn3K4kaWl7EQ1y56JVwVsjlqZKFOkkRxpBWPoNbj0=
X-Gm-Gg: AfdE7cnoA7fBFn3jAf1NjWjfJlOIK0kSHwdcR6lA0WmjqBHe5QotGfI+3Pe2EXo/88o
	I5pQawq9TWVi+F/vsnsuUCSp09rFmUt68azFKBcG55jTbrAYb5xlhILkz0mFirnuxkUUgazfAPV
	N7PbjEdi/RTddtA0wMn9b9scn5Iao0J90McHPO1KBnKE80I27uLkTYGPay+qCQTqPbukWrYbpBT
	xsK9wpw+kRoCG2D8SQ5F54ImujfzTjrDYY2geqJ2erXqSprMoslJ8opJbuN+Wc6jzBG9qZBn2A7
	BwOhammuwIh17tKORFw2ix9xsp88WYJ4DxkviN7RabsuFCd34aXhypbWZmlj1iKpEwxbeap2Moq
	DOc6Qx5IO+tLzl3D6EabTR3RsfZfF11QE12qBh1PAJt5f2kWq6txOunv3ZZ2rjGBJh6NpKtchl/
	crOsaLgCJJR8RPU0mul4imf29ymylPz4hMtT7NgWWhRcX2Q4dWZQEX2pte3nHvfXZhvliZkSrDH
	y3YxgDN0EH8
X-Received: by 2002:a05:620a:6f05:b0:920:4f78:3d7 with SMTP id af79cd13be357-92ef2b4b7e4mr642033485a.3.1783871115261;
        Sun, 12 Jul 2026 08:45:15 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5d61facsm862186485a.42.2026.07.12.08.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 08:45:14 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net
Subject: [PATCH v7 00/10] dax/kmem: atomic whole-device hotplug via sysfs
Date: Sun, 12 Jul 2026 11:44:54 -0400
Message-ID: <20260712154505.3564379-1-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The dax kmem driver onlines memory during probe using the system
default policy, with no atomic control for the state of an entire
region at runtime - only by toggling individual memory blocks.

Offlining and removing a whole region therefore races with other
userland controllers that interfere between the two steps.

This series adds a sysfs "state" attribute for atomic whole-device
hotplug control, plus the mm and dax plumbing to support it.

Transitions are atomic across every range of the device. The state
names mirror the per-block memoryX/state ABI with one modification:

  - "unplugged":      memory blocks are not present
  - "online":         online as system RAM, zone chosen by the kernel
  - "online_kernel":  online in ZONE_NORMAL
  - "online_movable": online in ZONE_MOVABLE

"offline" (blocks present but offline) is reportable for backward
compatibility but is not writable because it entices the race condition
we are trying to solve (separate atomic steps for offline and unplug).

'unplugged' (atomic offline+remove of the whole device) is the new
capability provided by the new kmem sysfs attribute.

dax/kmem probe still creates the memory blocks by default when the
default policy is "offline", to preserve backwards compatibility.

mm preparation:
  1. mm/memory: add memory_block_aligned_range() helper.
  2. mm/memory_hotplug: add mhp_online_type_to_str() and export the
     online-type string helpers.
  3. mm/memory_hotplug: pass online_type to online_memory_block().
  4. mm/memory_hotplug: export mhp_get_default_online_type().
  5. mm/memory_hotplug: add __add_memory_driver_managed() so a driver can
     select the online policy.  The override is restricted to in-tree
     modules via EXPORT_SYMBOL_FOR_MODULES().
  6. mm/memory_hotplug: add offline_and_remove_memory_ranges() for atomic,
     all-or-nothing offline+remove of several ranges under a single
     lock_device_hotplug().

dax/kmem:
  7. Resolve mhp default online type at probe time
  8. Extract hotplug/hotremove into helper functions (refactor).
  9. Add the "state" sysfs attribute.
  10. selftests/dax: regression test for the attribute.

---

v7 changes
- picked up tags
- dropped !data checks (Dan)
- re-defined 'DAX_KMEM_UNPLUGGED (-1)' (Dan)
- converted `state` to static ATTRIBUTE_GROUPS (Dan)
- dropped DEFAULT until later commit with per-driver settings (Dan)
- state_store now frees reservations on total hotplug failure (sashiko)
- kmalloc_array -> kmalloc_objs (Dan)
- unbind reworked to just remove_memory() (still never offlines, no deadlock)
- added memoryN/state and daxX.Y/state desync test
- gated destructive unbind tests behind DAX_KMEM_TEST_UNBIND
- added DAX_KMEM_TEST_DEV environment variable for target dax device
- added comment in offline_and_remove_memory_ranges for clarity
- minor spellcheck, whitespace, doc fixups

Gregory Price (10):
  mm/memory: add memory_block_aligned_range() helper
  mm/memory_hotplug: add mhp_online_type_to_str() and export string
    helpers
  mm/memory_hotplug: pass online_type to online_memory_block() via arg
  mm/memory_hotplug: export mhp_get_default_online_type
  mm/memory_hotplug: add __add_memory_driver_managed() with online_type
    arg
  mm/memory_hotplug: add offline_and_remove_memory_ranges()
  dax/kmem: resolve default online type at probe time
  dax/kmem: extract hotplug/hotremove helper functions
  dax/kmem: add sysfs interface for atomic whole-device hotplug
  selftests/dax: add dax/kmem hotplug sysfs regression test

 Documentation/ABI/testing/sysfs-bus-dax       |  24 +
 drivers/base/memory.c                         |   9 +
 drivers/dax/bus.h                             |   2 +
 drivers/dax/kmem.c                            | 500 ++++++++++++++----
 include/linux/memory.h                        |  27 +
 include/linux/memory_hotplug.h                |  14 +
 mm/memory_hotplug.c                           | 162 ++++--
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/dax/Makefile          |   6 +
 tools/testing/selftests/dax/config            |   4 +
 .../testing/selftests/dax/dax-kmem-hotplug.sh | 317 +++++++++++
 tools/testing/selftests/dax/settings          |   1 +
 12 files changed, 928 insertions(+), 139 deletions(-)
 create mode 100644 tools/testing/selftests/dax/Makefile
 create mode 100644 tools/testing/selftests/dax/config
 create mode 100755 tools/testing/selftests/dax/dax-kmem-hotplug.sh
 create mode 100644 tools/testing/selftests/dax/settings

-- 
2.53.0-Meta

