Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791B225B0AF
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055935; cv=none; b=FqrzuF0TJz4bxwldUb015c0oySAPt/ugDp5/IVeJXPu/YcFkqnC4s2v8yTDnWYxh1urv+MF8QG691bsgc4P/aUd1NW8AjGsD0fPy3DfJTRb/oLdV2AbrvwMDfB6f9tfoTTVm5YykMMm7VtPhzLp3GpwW3lyOGxAP+9zi8sx2cA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055935; c=relaxed/simple;
	bh=4sYbgZwb1U/p/3IGEKZuZew3SdVOQ/dtJWsbll9qF74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FoSSBxtKz1bwRmTG1VPVRv2mj4QDBuNLIddnQ5eEyGbKudMkv2Ct9PHi85+G5Ay7BYAkjRVtfOpZio0J3qMzQd040btmOfsk9rjWVFaomqt5xYCs1DDVn2eBYt8lY6Vui8juL815IMuI8B5cumdb5bQW2+EBjTiSIm2/B/GnEKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=n/SOEf5R; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="n/SOEf5R"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-517a5cafc3dso41983751cf.3
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 18:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781055928; x=1781660728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gl4zUdnSUgFHr8LaDjpI8z4535X92CpD1xacM3cbN54=;
        b=n/SOEf5R8RMFEzD8lngE9GwIRSLN0+zCj0Ths10zaP8rFNjpTptEGr+L4aGCiTUGHG
         wrUjG4Oa4/Gs7r1AgNdQ5rQuos5zeekp4j7ocfC17XGQlmq+mFCerJ9lBBgaH3DXDJsS
         cmyWsIdSg+hBNBio4A00jcaVU5bSq1sNP22HNick5DcA78mldcn+innbs7LI36gZCFC8
         0EzCrlmFQceJjD0Qsj8w61bF+RWhcVi8r+bS43SV7sVawQyXcIq1bxqIQWbVD7Myn5w2
         FOO1BbXIAbsFwmT2i981g5vspD1ihBeCm3xBSLtKd/dcQ0ZbJUqX0AC3EZO50x8YZEmB
         dcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055928; x=1781660728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gl4zUdnSUgFHr8LaDjpI8z4535X92CpD1xacM3cbN54=;
        b=eflChIHsJgEiUjFJ7RqZpFbsikzCxrlssee+cUylCTgAV/tX8xdc9Fmo1n3mST1poJ
         DisCCVE5bi2DndPZvDB/m+EZH6wM923QXqTkikAjFhipVFP1WNuojnCGGZbgKe+kh7go
         kCouwdoJF+Fz4m//qYq9osF+uNBh8efpOjemHV/U6lNBDWwRt12aD1ZVeCnBZ/nxKwFA
         AK0/pPDp8pc3HrS6ouR1x5fhAmxx6Ac/hP1PLWcJEwjqrx3OL4tEFGsKIeENfpJp6VZJ
         9pdzqrT2DKF7hW9CULEOVfJobO8hu51Sn8ynuxYw7kehjJATuA2GzgxI2EX79HHcIm/6
         pY3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/tUMYHq2DYTx5hAADDigXWJTDEyI1IvyxtUmn/EDLdGwIzGvYDbtCI1ic5SqIOJyCya0dx8p8OSMjjvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRTiiyLom2bHE81/s/eTrwNX+86NUU3h9zBH7dExcm4brjTLVm
	KgO1g15lSB+U35mItq+HrntZH+OfEqFygqWJ+Dm25MjD2V4/rBaNlwEs1TEmrNmwJpw=
X-Gm-Gg: Acq92OELSD6buhFcWgH92X20vN+wFK0pYebFlWn35eKQfRiOjYDnrw7OgcQch85RRaX
	nfImO5j9rf7AqSCGemj+2UvuysWxAkIwRmiwYM0HRtBvh94JTNmcU63g6nxIFcLs7yrtuWPmhSF
	6EDW9P/OV6IzxEnjFIFmUp3rMcSCsRTb8X2Qk0fFZtbnHndROitQgNpF87WVytyQULwBwyWq+JC
	sU5oNw1l5eTVaRSYUVz/VlSYlnnDvkvesuLvKYi/8qfIUYylrP80nc0LJ6NKZPJhqAij4uMTR+t
	LeA3uXHhmLBTmD+nnxsHxRwlZ+n8+NvHNAQraArJmYslPc0lqcDxWkXYzOUw+/LfbkL3EwNmagj
	/axPn+pITmPK7U3v9ytDDZy/mxB924lQwkWahOqCJtrA8tU0U7IWV48SjfQoPIhvro4U+O9Lc+Z
	I6sTvGuXxkBAGuXz5l9XcrrrfFMdIxrgEsMIw93P2iuLAO23GGV/tTE8es1JpyVcr3fyLVM0b1m
	+MNYTDsMdIpXwQSyOwsjb9WX2muaVilJA==
X-Received: by 2002:a05:622a:14d2:b0:50b:29a6:8696 with SMTP id d75a77b69052e-51795a486d9mr312786111cf.7.1781055928126;
        Tue, 09 Jun 2026 18:45:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm205923261cf.4.2026.06.09.18.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:45:27 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	rafael@kernel.org,
	lenb@kernel.org,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	rdunlap@infradead.org,
	feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com,
	elver@google.com,
	kuba@kernel.org,
	ebiggers@kernel.org,
	lirongqing@baidu.com,
	paulmck@kernel.org,
	gourry@gourry.net,
	dave.jiang@intel.com,
	jic23@kernel.org,
	xueshuai@linux.alibaba.com,
	kai.huang@intel.com
Subject: [RFC PATCH 1/3] mm/numa: add exclusive node pool and numa=standby boot parameter
Date: Tue,  9 Jun 2026 21:45:15 -0400
Message-ID: <20260610014517.253609-2-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610014517.253609-1-gourry@gourry.net>
References: <20260610014517.253609-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It can be at times preferential to logically split up hotplug memory
capacity into more nodes than are described by BIOS at boot time.

However, if nodes are not described at __init time, they are not
possible to add later on.

Add the core infrastructure for reserving empty "standby" NUMA nodes at
boot that drivers can claim at runtime.

Introduce an exclusive node pool with a runtime claim/release interface:

  numa_request_exclusive_node()   - claim a node from the pool
  numa_release_exclusive_node()   - return a node to the pool

This allows drivers to place hotplugged memory on distinct NUMA nodes
without requiring BIOS-assigned proximity domains.

Standby nodes are created after numa_emulation() has finalized the node
numbering.  The count comes from the numa=standby=<N> boot parameter
plus any requests by init code via numa_request_standby_count().

Creating them post-emulation avoids perturbing the emulated node
numbering and keeps standby node ids from aliasing emulated nodes.

This also pushes off assigning node numbers until after all PXM mappings
have been created to keep the system view more consistent overall.

numa_init_standby_nodes() rebuilds the NUMA distance table (using the
same method as numa_emulation), this way standby nodes have distance
entries. These entries may be programmed later via numa_set_distance().

As a result, it is also possible for drivers to use these standby nodes
to change memory tier membership and fallback ordering instead of being
tied down to what is described by BIOS / Firmware.

Additional Notes/Concerns:

1) Can we do dynamic addition of nodes?

   Not Trivially

   Some services utilize num_possible_nodes() as a static value to
   calculate the amount of resources to use at runtime (bpf, md/raid5).

   Example: futex_init uses num_possible_nodes() as part of its
            hashsize calculation during __init.

2) Does this create phys_to_target_node() ambiguity?

   No.

   Every present user of phys_to_target_node() either uses it during
   __init to set up associations, or after __init to associate a static
   memory region and a node.

   In neither case do these additional nodes create ambiguity.

   We do at least add a comment to phys_to_target_node() to note that
   this should only be used to determine the affiliation of a memory
   region statically configured by BIOS (i.e. not hotplug memory).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../admin-guide/kernel-parameters.txt         |   8 ++
 arch/x86/mm/numa.c                            |   2 +
 drivers/base/arch_numa.c                      |   2 +
 include/linux/numa.h                          |  14 +++
 include/linux/numa_memblks.h                  |   3 +
 mm/numa.c                                     |  90 +++++++++++++
 mm/numa_memblks.c                             | 118 +++++++++++++++++-
 7 files changed, 236 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 23be2f64439c..5410498c97af 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4765,6 +4765,14 @@ Kernel parameters
 	numa=nohmat	[X86] Don't parse the HMAT table for NUMA setup, or
 			soft-reserved memory partitioning.
 
+	numa=standby=<N>
+			[KNL, ARM64, RISCV, X86, EARLY]
+			Reserve N additional empty NUMA nodes at boot for
+			runtime claiming via numa_request_exclusive_node().
+			These nodes have no memory or CPU affinity. Drivers
+			can claim them to place hotplugged memory on distinct
+			NUMA nodes for memory tiering or isolation.
+
 	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
 			NUMA balancing.
 			Allowed values are enable and disable
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 99d0a9332c14..e4798c43276b 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -33,6 +33,8 @@ static __init int numa_setup(char *opt)
 		numa_off = 1;
 	if (!strncmp(opt, "fake=", 5))
 		return numa_emu_cmdline(opt + 5);
+	if (!strncmp(opt, "standby=", 8))
+		return numa_standby_cmdline(opt + 8);
 	if (!strncmp(opt, "noacpi", 6))
 		disable_srat();
 	if (!strncmp(opt, "nohmat", 6))
diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index c99f2ab105e5..8526be1da69a 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -28,6 +28,8 @@ static __init int numa_parse_early_param(char *opt)
 		numa_off = true;
 	if (!strncmp(opt, "fake=", 5))
 		return numa_emu_cmdline(opt + 5);
+	if (!strncmp(opt, "standby=", 8))
+		return numa_standby_cmdline(opt + 8);
 
 	return 0;
 }
diff --git a/include/linux/numa.h b/include/linux/numa.h
index e6baaf6051bc..4621af407ec6 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -43,6 +43,11 @@ int phys_to_target_node(u64 start);
 
 int numa_fill_memblks(u64 start, u64 end);
 
+void __init numa_add_standby_node(int node);
+void __init numa_commit_standby_nodes(void);
+int numa_request_exclusive_node(void);
+void numa_release_exclusive_node(int node);
+
 #else /* !CONFIG_NUMA */
 static inline int numa_nearest_node(int node, unsigned int state)
 {
@@ -64,6 +69,15 @@ static inline int phys_to_target_node(u64 start)
 }
 
 static inline void alloc_offline_node_data(int nid) {}
+
+static inline void numa_add_standby_node(int node) { }
+static inline void numa_commit_standby_nodes(void) { }
+static inline int numa_request_exclusive_node(void)
+{
+	return NUMA_NO_NODE;
+}
+static inline void numa_release_exclusive_node(int node) { }
+
 #endif
 
 #define numa_map_to_online_node(node) numa_nearest_node(node, N_ONLINE)
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 991076cba7c5..7d7b8307e267 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -32,6 +32,9 @@ int __init numa_memblks_init(int (*init_func)(void),
 
 extern int numa_distance_cnt;
 
+int __init numa_standby_cmdline(char *str);
+void __init numa_request_standby_count(int n);
+
 #ifdef CONFIG_NUMA_EMU
 extern int emu_nid_to_phys[MAX_NUMNODES];
 int numa_emu_cmdline(char *str);
diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..9806cdf2f998 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,8 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/spinlock.h>
+#include <linux/export.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -59,3 +61,91 @@ int phys_to_target_node(u64 start)
 }
 EXPORT_SYMBOL_GPL(phys_to_target_node);
 #endif
+
+/*
+ * Pool of exclusive NUMA nodes available for runtime claiming.
+ *
+ * Published by numa_commit_standby_nodes() from standby nodes staged
+ * during __init. Protected by exclusive_node_lock at runtime.
+ */
+static nodemask_t exclusive_nodes = NODE_MASK_NONE;
+static DEFINE_SPINLOCK(exclusive_node_lock);
+
+/*
+ * Standby node candidates staged during NUMA init.  Committed to the exclusive
+ * pool by numa_commit_standby_nodes() once node_possible_map is finalized.
+ */
+static nodemask_t standby_candidates __initdata;
+
+/**
+ * numa_add_standby_node() - Stage a node as a standby pool candidate
+ * @node: Node ID created as an empty standby node during NUMA init
+ *
+ * Records @node as a candidate for the exclusive pool.
+ * Callers must also add @node to numa_nodes_parsed to mark it possible.
+ */
+void __init numa_add_standby_node(int node)
+{
+	node_set(node, standby_candidates);
+}
+
+/**
+ * numa_commit_standby_nodes() - Publish staged standby nodes to the pool
+ *
+ * Registers the staged candidates that are present in node_possible_map
+ * into the exclusive pool.  Restricting to possible nodes keeps the pool a
+ * strict subset of node_possible_map, so a later claim can never return a
+ * node that was dropped (e.g. by a fallback init or NUMA emulation).
+ * Called once node_possible_map is final.
+ */
+void __init numa_commit_standby_nodes(void)
+{
+	nodes_and(exclusive_nodes, standby_candidates, node_possible_map);
+}
+
+/**
+ * numa_request_exclusive_node() - Claim an available exclusive NUMA node
+ *
+ * Exclusive nodes are empty NUMA nodes registered at boot via the standby
+ * node interfaces or standby= boot parameter.
+ *
+ * The caller takes exclusive ownership of the returned node and must
+ * release it with numa_release_exclusive_node() when no longer needed.
+ *
+ * Return: a NUMA node ID on success, %NUMA_NO_NODE if none available.
+ */
+int numa_request_exclusive_node(void)
+{
+	int node;
+
+	spin_lock(&exclusive_node_lock);
+	node = first_node(exclusive_nodes);
+	if (node < MAX_NUMNODES)
+		node_clear(node, exclusive_nodes);
+	else
+		node = NUMA_NO_NODE;
+	spin_unlock(&exclusive_node_lock);
+
+	return node;
+}
+EXPORT_SYMBOL_GPL(numa_request_exclusive_node);
+
+/**
+ * numa_release_exclusive_node() - Release a previously claimed exclusive node
+ * @node: Node ID previously returned by numa_request_exclusive_node()
+ *
+ * Returns the node to the exclusive pool.
+ */
+void numa_release_exclusive_node(int node)
+{
+	if (node == NUMA_NO_NODE)
+		return;
+
+	if (WARN_ON(node >= MAX_NUMNODES))
+		return;
+
+	spin_lock(&exclusive_node_lock);
+	node_set(node, exclusive_nodes);
+	spin_unlock(&exclusive_node_lock);
+}
+EXPORT_SYMBOL_GPL(numa_release_exclusive_node);
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index 3c3c4eac3514..9ba243fd360e 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -6,6 +6,7 @@
 #include <linux/memblock.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/topology.h>
 
 #include <asm/numa.h>
 
@@ -442,6 +443,104 @@ static int __init numa_register_meminfo(struct numa_meminfo *mi)
 	return 0;
 }
 
+static int numa_standby_nodes __initdata;
+static int numa_acpi_standby_nodes __initdata;
+
+int __init numa_standby_cmdline(char *str)
+{
+	int ret = kstrtoint(str, 0, &numa_standby_nodes);
+
+	if (ret || numa_standby_nodes < 0)
+		return -EINVAL;
+	numa_standby_nodes = min(numa_standby_nodes, 16);
+	return 0;
+}
+
+/**
+ * numa_request_standby_count() - Request standby nodes from NUMA init code
+ * @n: number of standby nodes to reserve
+ *
+ * Accumulated during NUMA init and added to the numa=standby=<N> request.
+ * The nodes are created later, once numa_emulation() has finalized the node
+ * numbering.  Init code must add the count here instead of adding the nodes.
+ */
+void __init numa_request_standby_count(int n)
+{
+	numa_acpi_standby_nodes += n;
+}
+
+/**
+ * numa_init_standby_nodes() - Create standby nodes and rebuild distance table
+ *
+ * Called after numa_emulation() has finalized the node numbering.
+ * Creates requested empty standby nodes and rebuilds the NUMA distance
+ * table if it needs to grow to cover nodes added after SLIT parsing.
+ */
+static void __init numa_init_standby_nodes(void)
+{
+	int total = numa_standby_nodes + numa_acpi_standby_nodes;
+	nodemask_t available;
+	int i, j, max_node, old_cnt;
+	u8 *saved_dist = NULL;
+	size_t saved_size;
+	int registered = 0;
+
+	/* Create the requested standby nodes in numa_nodes_parsed */
+	if (total) {
+		nodes_complement(available, numa_nodes_parsed);
+		for (i = 0; i < total; i++) {
+			int node = first_node(available);
+
+			if (node >= MAX_NUMNODES)
+				break;
+			node_clear(node, available);
+			node_set(node, numa_nodes_parsed);
+			numa_add_standby_node(node);
+			pr_info("NUMA: standby node %d reserved\n", node);
+			registered++;
+		}
+	}
+	if (registered != total)
+		pr_warn("NUMA: error registering standby nodes\n");
+
+	/*
+	 * If nodes were added after the distance table was allocated,
+	 * rebuild the table so all nodes have distance entries.
+	 * Standby nodes get REMOTE_DISTANCE by default.
+	 */
+	old_cnt = numa_distance_cnt;
+	if (!old_cnt)
+		return;
+
+	max_node = 0;
+	for_each_node_mask(i, numa_nodes_parsed)
+		max_node = i;
+
+	if (max_node < old_cnt)
+		return;
+
+	saved_size = old_cnt * old_cnt * sizeof(u8);
+	saved_dist = memblock_alloc(saved_size, PAGE_SIZE);
+	if (!saved_dist) {
+		pr_warn("NUMA: standby nodes will use default distances\n");
+		return;
+	}
+
+	for (i = 0; i < old_cnt; i++)
+		for (j = 0; j < old_cnt; j++)
+			saved_dist[i * old_cnt + j] = node_distance(i, j);
+
+	/* Reset triggers reallocation on next numa_set_distance() */
+	numa_reset_distance();
+
+	/* Restore - first call reallocates sized for new numa_nodes_parsed */
+	for (i = 0; i < old_cnt; i++)
+		for (j = 0; j < old_cnt; j++)
+			numa_set_distance(i, j, saved_dist[i * old_cnt + j]);
+
+	memblock_free(saved_dist, saved_size);
+}
+
 int __init numa_memblks_init(int (*init_func)(void),
 			     bool memblock_force_top_down)
 {
@@ -451,6 +550,7 @@ int __init numa_memblks_init(int (*init_func)(void),
 	nodes_clear(numa_nodes_parsed);
 	nodes_clear(node_possible_map);
 	nodes_clear(node_online_map);
+	numa_acpi_standby_nodes = 0;
 	memset(&numa_meminfo, 0, sizeof(numa_meminfo));
 	WARN_ON(memblock_set_node(0, max_addr, &memblock.memory, NUMA_NO_NODE));
 	WARN_ON(memblock_set_node(0, max_addr, &memblock.reserved,
@@ -479,8 +579,15 @@ int __init numa_memblks_init(int (*init_func)(void),
 		return ret;
 
 	numa_emulation(&numa_meminfo, numa_distance_cnt);
+	numa_init_standby_nodes();
+
+	ret = numa_register_meminfo(&numa_meminfo);
+	if (ret < 0)
+		return ret;
 
-	return numa_register_meminfo(&numa_meminfo);
+	/* node_possible_map is final; publish standby nodes to the pool. */
+	numa_commit_standby_nodes();
+	return 0;
 }
 
 static int __init cmp_memblk(const void *a, const void *b)
@@ -567,6 +674,15 @@ static int meminfo_to_nid(struct numa_meminfo *mi, u64 start)
 	return NUMA_NO_NODE;
 }
 
+/*
+ * These interfaces should only be used to acquire information about statically
+ * configured memory associations made at __init time.
+ *
+ * This interface should not be used to determine the node a struct page/folio
+ * lives in, as it is possible for memory hotplug to place those pages in
+ * different nodes than reported by this function.
+ */
+
 int phys_to_target_node(u64 start)
 {
 	int nid = meminfo_to_nid(&numa_meminfo, start);
-- 
2.54.0

