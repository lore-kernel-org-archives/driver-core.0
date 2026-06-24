Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96636302742
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313079; cv=none; b=NeCqGMKiNznxKf5aloRj5IMTQl+D2AKzSheFkJGht0FkV7T0ttmVz2uVZjWOgi5dNtik0kA9Gg3elB9xfst1+uBaJZzKKWJm6dqCao9NvVxQ262oyZZupSz9rmCFmsj3VpXFmajZPxCkZGg8i7HVkXtC69XfKWtPFFNnXL2PFWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313079; c=relaxed/simple;
	bh=OELpNeuF4o3uKPmDaZimCE09x9LRfZSE6ZhO3qoWDnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L/hT95UEFj7vVsXrPOEergLyeoncV17UfvMm13RIMErA7lfJj2up75BEwnk/KaBGw5t3fIAfsl4r4/q30/aeR0KGeXboQqBHp6u1LAwJMkybp7mR6uS1lmf+Ha9cHTuKVEXqtyebad/fFoVrVtx3p/lpbwpS5YX59lz8PXI+h1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=O606fYZl; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="O606fYZl"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-517b1f2c6adso9593671cf.2
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313075; x=1782917875; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=342v7Y1wIc5Ucn3x8pxabI10RJuF4OR+Mw4ajKzQlTY=;
        b=O606fYZlHDDozlbBMfyw2rY7qi+gIiLIebSdoTGtgmHYnA+En8hD/78AUIVCsefS1O
         YFmN17xy2MbwLK0x70MkGxO3zEkRGZfC5+EWzWImEnZdP8P/Oj9X8ZsNP7y4mfh4jwci
         nsrFJ20+4RCC9I4dE1fI+DKs9H+Cl7P2Ox4LChEvt6d8xek8GNE35GYmU2BPzk1R3zTu
         TDj4b+7SvgRNgiQSp9nUIKZJBvN1r3hIapkbcrrTOh8ASZHmHhVy1IaiTK6SzRt/b+jz
         AHl6KmDW4v03chtcwmswXYKZgQuyyq6bXQFh6Ecye0pNHqe11iByl+8pmpZGt5gq3AGy
         SyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313075; x=1782917875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=342v7Y1wIc5Ucn3x8pxabI10RJuF4OR+Mw4ajKzQlTY=;
        b=mjVd+28U8OAyeOo6+AfwKjILuVv3Iq3h7d+Zfa1WZBkrjxzLP4IEuI/BK8FH6RXUdb
         PYlagK/c8+jD/nNJy6XN6nH568AM4u1f/saovoW49sVqIyrbvNG9bSsUvGfjkWGx+3jx
         UXCjCkKfDaGKlgNUanDq0TCzl2UKd67e1KE1xdOYLtiZOE752glo4hROwSaMUvuGYMMV
         nPa4siFXBWUT2JVJVJ2YKqHNyOlbdDu78QmvQF13h5mQMD01qAPbE9rG44vZAG0REZt8
         a86MlUDY7r93XMxyCuNQE2awsnnLdtYR2K/2o1Gg7TyNhDQQ2p7vbVt2nr2Hb1kayx26
         ANfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Izw5sGB97tvRXsUtto5zsE/QbgaTET+1L5X9ZEVJH2GlexTALt5Oq4BwlnVm2eJXNTyG+eGD1Ng5QYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxRikpIlPo+alQxoggSswT+eSC+Bi8R/oJhq05VHM5OBCST1R4H
	pe1Eg7CVwUmPMTfFRwBRTnTIR3ysGfEAGptbmuWljwr1Jm4RqJMo2yYH6AfHv/hOFjY=
X-Gm-Gg: AfdE7cnw4SszUgvC364DnfZvELxbUdU2l/OlRehbgFbstwF0C5BOOBGWCKagLEhABvJ
	Zw9xVrHWbxD+y1JijKItPgbtrevfQ8Nc/GsawpcpkG9KRN8ST6AUTU5fLLqLGciqfZs/1wq3FJx
	5ZlrV3Tgy/RBC6J5IIvmsOq22iFOspEvyj0vfEIdQoFx8JAvIADx8/RzxYlr31txRJxfMpvDNyi
	Z5grdz3AxJYlNT22s75H5RxCBY5zv42jw9zar/Z7edme+7lctYootvEUQT6K4ZRLa7xGdv+czWJ
	WugZhXZ2z/6fQ17k9EIrMbrcwlkHE6n9Fs5L4B4fGXkXu4RPgoxIBBr9t5lFdPdJYxfyRJqjfs8
	dEpG9kUsKjpehx8GMHVBvgxYvTXUPyYfdxI+GMyOfe7JC+1KjdaI51udK3h6jedS0ZMWFl5wyk4
	IDeCRYnO3r9qOgNpyAVTEbqF955aqEdI1idYEXZahM+tlBWbNz9fHavsI+mn0g3lcaYPVPEVh32
	g==
X-Received: by 2002:a05:622a:191f:b0:517:79f0:ae3d with SMTP id d75a77b69052e-51a5473239fmr101461321cf.21.1782313074271;
        Wed, 24 Jun 2026 07:57:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:57:51 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
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
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v5 0/9] dax/kmem: atomic whole-device hotplug via sysfs
Date: Wed, 24 Jun 2026 10:57:35 -0400
Message-ID: <20260624145744.3532049-1-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
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
userland controllers that interfere between the offline and remove
steps. This was discussed in the LPC2025 device memory sessions [1].

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
we are trying to solve (offlining all the memory blocks in one atomic
and unplugging them in another atomic).

mm preparation:
  1. mm/memory: add memory_block_aligned_range() helper.
  2. mm/memory_hotplug: pass online_type to online_memory_block().
  3. mm/memory_hotplug: export mhp_get_default_online_type().
  4. mm/memory_hotplug: add __add_memory_driver_managed() so a driver can
     select the online policy.  The override is restricted to in-tree
     modules via EXPORT_SYMBOL_FOR_MODULES().
  5. mm/memory_hotplug: add offline_and_remove_memory_ranges() for atomic,
     all-or-nothing offline+remove of several ranges under a single
     lock_device_hotplug().

dax/kmem feature:
  6. Plumb online_type through the dax device creation path.
  7. Extract hotplug/hotremove into helper functions.
  8. Add the "hotplug" sysfs attribute.
  9. selftests/dax: regression test for the attribute.

DAX Kmem probe still creates the memory blocks by default, even when
the default policy is "offline" to preserve backwards compatibility.

Unplug (atomic offline+remove of the whole device) is the new
capability provided by the attribute.

I downgraded a BUG() to a WARN() when unbind is called while the device
is not unplugged.  The old per-block toggling pattern is still used by
userland tools and disconnects the 'hotplug' value from the real region
state; until per-block control is deprecated or restricted in some way,
WARN() flags that tools should move to the new atomic pattern.

Changes since v4:
  - renamed 'dax/hotplug' -> 'dax/state'
  - refactored the work into a shared offline_and_remove_memory_ranges
  - reworked MMOP_ helpers to re-use code
  - fixed cached system default online_type regression
  - nits

Gregory Price (9):
  mm/memory: add memory_block_aligned_range() helper
  mm/memory_hotplug: pass online_type to online_memory_block() via arg
  mm/memory_hotplug: export mhp_get_default_online_type
  mm/memory_hotplug: add __add_memory_driver_managed() with online_type
    arg
  mm/memory_hotplug: add offline_and_remove_memory_ranges()
  dax: plumb hotplug online_type through dax
  dax/kmem: extract hotplug/hotremove helper functions
  dax/kmem: add sysfs interface for atomic whole-device hotplug
  selftests/dax: add dax/kmem hotplug sysfs regression test

 Documentation/ABI/testing/sysfs-bus-dax       |  26 +
 drivers/base/memory.c                         |   9 +
 drivers/dax/bus.c                             |   3 +
 drivers/dax/bus.h                             |   9 +
 drivers/dax/cxl.c                             |   1 +
 drivers/dax/dax-private.h                     |   4 +
 drivers/dax/hmem/hmem.c                       |   1 +
 drivers/dax/kmem.c                            | 475 ++++++++++++++----
 drivers/dax/pmem.c                            |   1 +
 include/linux/memory.h                        |  22 +
 include/linux/memory_hotplug.h                |  13 +
 mm/memory_hotplug.c                           | 162 ++++--
 tools/testing/selftests/Makefile              |   1 +
 tools/testing/selftests/dax/Makefile          |   6 +
 tools/testing/selftests/dax/config            |   4 +
 .../testing/selftests/dax/dax-kmem-hotplug.sh | 207 ++++++++
 tools/testing/selftests/dax/settings          |   1 +
 17 files changed, 806 insertions(+), 139 deletions(-)
 create mode 100644 tools/testing/selftests/dax/Makefile
 create mode 100644 tools/testing/selftests/dax/config
 create mode 100755 tools/testing/selftests/dax/dax-kmem-hotplug.sh
 create mode 100644 tools/testing/selftests/dax/settings

-- 
2.54.0

