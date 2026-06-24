Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090CD3D9680
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 14:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313085; cv=none; b=uXesx28Osnz/asOTTcWKU1L9chr15JnmBsjfglVI9CxVtprVvNKR5fIfz8x2Kpy12/PQpQnyQL3bqe27s3uWffywgcgiido8gfdV1vReguX9iB0ZG2ItcZhvG8TMCi+z28DNA8ewpNcGHLZ8Nuy5gShJy+qaAGGVT+drRV1msck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313085; c=relaxed/simple;
	bh=3B8VtuHDttocoBEXnRQc2TVDPQuIEtvmBb3CoQ024FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHbu1yaWWbAH0xpb7FdFO30PoiMA0/YiZfY4INSFXnFEJx25mjxRLVmAoYnD0pIHJoRzWvIugzUKy4g5dD/F89nsNSbDjVkOQ2/tl2Ty5wXHyJcNAtcMfJyWmAvOBifVT19LjoILQ6+oBKJRE3V8+YjklVU4iGV+/VZz4H1DX5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ZReQ87sj; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ZReQ87sj"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5177945a22eso7807401cf.1
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313083; x=1782917883; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+5ae8LUmAy5WSGBFjad2biDCNPqlKGypmJhGythNzI=;
        b=ZReQ87sjlkXpIdHyxNdBCUWeolK6JI15y1k+fZFaYH9tK3e/2uh8zAAh/YuEIF5r4w
         VH0N09jbLLrywchA90aKcs2ztykbg2SuZl7BFJLFgw62bYUydmltDmRYFHJ/5UoLWkau
         VkOZcoXkZidO7mIIPI+NhyX/lRM+xiosdQjGlBJ5pv3j1gMzafKgzjggJwgUwxTKTB42
         caWxJG+hRsMJbY6dAEkN9RRD+txMXr5jizvn73s5j9F40xQsLr0UTdgrZx58bjAOh85X
         +gq8U+uzOvXK8Z59e2fc0NVem413H4X1vTeGYdYfrkKKikJBoDwsWC175DvZl7tqeOZc
         9t4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313083; x=1782917883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+5ae8LUmAy5WSGBFjad2biDCNPqlKGypmJhGythNzI=;
        b=gurvQEkPn2zOr5NCp9BbQl2gPH662rlO35VlORR9aX8dK9x2+cXOOvAHQqH9c2QI2u
         GfxjXPwtjxWYe56rCml6m8+SaCuYuYPpxGZyyFgF6PeFa0BOPaLkkEcNn/veB8X4Vc4C
         m+mIJxduinKe3fPHiDUE5NeHuzXpl/RdSqABUZCrs/209ZNDQ2fUZHUDpfz6MOwGx9WM
         xad8RtWxW8eRuJ6xvQCeMn3MmWvB+h5iogtVKjW9CMi1cKk/z9XEolY6y091T1YR8yKe
         U4idlLbs/kymI1hDLDDhUQGRMdY0OH34H/dPRSsr0X8b4CHPM0mPt+TBSrl9PYaGyL/8
         PjBw==
X-Forwarded-Encrypted: i=1; AFNElJ89jaAhqCqyd9mUCrMxWjRqLdbzEvNsmNL1+85zjrHAb7O3pDeHipCgI5ErBRUxjwAGUjuf8W8F27jZmA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxikCTj0YY4yJkO+AyfbUNl4+N6ZFhpNhwDdZ1E3at57vRIzbDw
	2MDpSXlu6iyruevOpwv8MAOIJLTBzGha7/g1NCV1JwTPRTduWuxBTZ2c628j8kVi53o=
X-Gm-Gg: AfdE7cmJlVTGc0GqAZUVGfjieJCUlmH5IizbtqiBIh4SWouGsV1K/RcJqyuhDq5Xvne
	Pd5asOhZQOAvi1hvIK5uxICJaUMf604VdS/bpwlOvvlrnqbnc6YehjgOtjRv0SCJHwBoO/ihifs
	hCbd4vyHrl+GyrDAy0Yb3UrkIWVqCB5IchKAeb44nTCecL/5SBJn84bgzuvfGK5GIQEh9TwK2VW
	gQJ5LfEgA0C9QlM8/qTLlaq8zOyTFLv0lZvGFAlHJYJnn8gE+ium8GrwgpWXPy91GwyWQk/vwdt
	ZmTAJy8fNSdTKyH5JOxm/3yv9nWiLmcWqiJ/IiLVsjeK0HnT3JiubLuRyFQl8JjnfCN8ymsNVrW
	2VUA6OcEjPKf5tH1ME5Yp45Ypg5y4im/Jiq3SEO0isHRZ02KaJofTYPz14G7OO5zeyq0sVeNjA6
	TP6j413nbE0ncFHL2D8x3S5X/RCa6E3yw0zRgCmTzk9OQO5Pba2pM4mCZ85gz92mirrl7J15Nkd
	A==
X-Received: by 2002:ac8:5fd4:0:b0:516:e74e:cc51 with SMTP id d75a77b69052e-51a61f3444dmr55235611cf.51.1782313083037;
        Wed, 24 Jun 2026 07:58:03 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:58:02 -0700 (PDT)
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
Subject: [PATCH v5 4/9] mm/memory_hotplug: add __add_memory_driver_managed() with online_type arg
Date: Wed, 24 Jun 2026 10:57:39 -0400
Message-ID: <20260624145744.3532049-5-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>
References: <20260624145744.3532049-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Existing callers of add_memory_driver_managed cannot select the
preferred online type (ZONE_NORMAL vs ZONE_MOVABLE), requiring it to
hot-add memory as offline blocks, and then follow up by onlining each
memory block individually.

Most drivers prefer the system default, but the CXL driver wants to
plumb a preferred policy through the dax kmem driver.

Refactor APIs to add a new interface which allows the dax kmem module
to select a preferred policy.

Overriding the configured auto-online policy is only safe for known
in-tree modules, where we know the override reflects a different,
user-requested policy.  We do not want arbitrary out-of-tree drivers
silently overriding the system-wide onlining policy, so restrict the
new interface to the kmem module using EXPORT_SYMBOL_FOR_MODULES()
rather than a plain EXPORT_SYMBOL_GPL().  Other in-tree modules (e.g.
cxl_core) can be added to the allowed list as the need arises.

Refactor add_memory_driver_managed, extract __add_memory_driver_managed
- Add proper kernel-doc for add_memory_driver_managed while refactoring
- New helper accepts an explicit online_type.
- New helper validates online_type is between OFFLINE and ONLINE_MOVABLE

Refactor: add_memory_resource, extract __add_memory_resource
- new helper accepts an explicit online_type

Original APIs now explicitly pass the system-default to new helpers.

No functional change for existing users.

Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/memory_hotplug.h |  3 ++
 mm/memory_hotplug.c            | 61 +++++++++++++++++++++++++++++-----
 2 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index f059025f8f8b..d3edeb80aadb 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -294,6 +294,9 @@ extern int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
 extern int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags);
 extern int add_memory_resource(int nid, struct resource *resource,
 			       mhp_t mhp_flags);
+int __add_memory_driver_managed(int nid, u64 start, u64 size,
+				const char *resource_name, mhp_t mhp_flags,
+				enum mmop online_type);
 extern int add_memory_driver_managed(int nid, u64 start, u64 size,
 				     const char *resource_name,
 				     mhp_t mhp_flags);
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 494257054095..a66346def504 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1494,10 +1494,10 @@ static int create_altmaps_and_memory_blocks(int nid, struct memory_group *group,
  *
  * we are OK calling __meminit stuff here - we have CONFIG_MEMORY_HOTPLUG
  */
-int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
+static int __add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags,
+				 enum mmop online_type)
 {
 	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
-	enum mmop online_type = mhp_get_default_online_type();
 	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
 	struct memory_group *group = NULL;
 	u64 start, size;
@@ -1585,7 +1585,7 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 		merge_system_ram_resource(res);
 
 	/* online pages if requested */
-	if (mhp_get_default_online_type() != MMOP_OFFLINE)
+	if (online_type != MMOP_OFFLINE)
 		walk_memory_blocks(start, size, &online_type,
 				   online_memory_block);
 
@@ -1603,7 +1603,13 @@ int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	return ret;
 }
 
-/* requires device_hotplug_lock, see add_memory_resource() */
+int add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
+{
+	return __add_memory_resource(nid, res, mhp_flags,
+				     mhp_get_default_online_type());
+}
+
+/* requires device_hotplug_lock, see __add_memory_resource() */
 int __add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags)
 {
 	struct resource *res;
@@ -1631,7 +1637,15 @@ int add_memory(int nid, u64 start, u64 size, mhp_t mhp_flags)
 }
 EXPORT_SYMBOL_GPL(add_memory);
 
-/*
+/**
+ * __add_memory_driver_managed - add driver-managed memory with explicit online_type
+ * @nid: NUMA node ID where the memory will be added
+ * @start: Start physical address of the memory range
+ * @size: Size of the memory range in bytes
+ * @resource_name: Resource name in format "System RAM ($DRIVER)"
+ * @mhp_flags: Memory hotplug flags
+ * @online_type: Auto-Online behavior (offline, online, kernel, movable)
+ *
  * Add special, driver-managed memory to the system as system RAM. Such
  * memory is not exposed via the raw firmware-provided memmap as system
  * RAM, instead, it is detected and added by a driver - during cold boot,
@@ -1639,6 +1653,7 @@ EXPORT_SYMBOL_GPL(add_memory);
  *
  * Reasons why this memory should not be used for the initial memmap of a
  * kexec kernel or for placing kexec images:
+ *
  * - The booting kernel is in charge of determining how this memory will be
  *   used (e.g., use persistent memory as system RAM)
  * - Coordination with a hypervisor is required before this memory
@@ -1651,9 +1666,12 @@ EXPORT_SYMBOL_GPL(add_memory);
  *
  * The resource_name (visible via /proc/iomem) has to have the format
  * "System RAM ($DRIVER)".
+ *
+ * Return: 0 on success, negative error code on failure.
  */
-int add_memory_driver_managed(int nid, u64 start, u64 size,
-			      const char *resource_name, mhp_t mhp_flags)
+int __add_memory_driver_managed(int nid, u64 start, u64 size,
+		const char *resource_name, mhp_t mhp_flags,
+		enum mmop online_type)
 {
 	struct resource *res;
 	int rc;
@@ -1663,6 +1681,9 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 	    resource_name[strlen(resource_name) - 1] != ')')
 		return -EINVAL;
 
+	if (online_type < MMOP_OFFLINE || online_type > MMOP_ONLINE_MOVABLE)
+		return -EINVAL;
+
 	lock_device_hotplug();
 
 	res = register_memory_resource(start, size, resource_name);
@@ -1671,7 +1692,7 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 		goto out_unlock;
 	}
 
-	rc = add_memory_resource(nid, res, mhp_flags);
+	rc = __add_memory_resource(nid, res, mhp_flags, online_type);
 	if (rc < 0)
 		release_memory_resource(res);
 
@@ -1679,6 +1700,30 @@ int add_memory_driver_managed(int nid, u64 start, u64 size,
 	unlock_device_hotplug();
 	return rc;
 }
+EXPORT_SYMBOL_FOR_MODULES(__add_memory_driver_managed, "kmem");
+
+/**
+ * add_memory_driver_managed - add driver-managed memory
+ * @nid: NUMA node ID where the memory will be added
+ * @start: Start physical address of the memory range
+ * @size: Size of the memory range in bytes
+ * @resource_name: Resource name in format "System RAM ($DRIVER)"
+ * @mhp_flags: Memory hotplug flags
+ *
+ * Add driver-managed memory with the system default online type set by
+ * build config or kernel boot parameter.
+ *
+ * See __add_memory_driver_managed for more details.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int add_memory_driver_managed(int nid, u64 start, u64 size,
+			      const char *resource_name, mhp_t mhp_flags)
+{
+	return __add_memory_driver_managed(nid, start, size, resource_name,
+			mhp_flags,
+			mhp_get_default_online_type());
+}
 EXPORT_SYMBOL_GPL(add_memory_driver_managed);
 
 /*
-- 
2.54.0

