Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32F28033B
	for <driver-core@lists.linux.dev>; Tue, 14 Jul 2026 05:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007807; cv=none; b=aKynnVYcCWny72JVUZRG1C6tNDzkjAKqQ3qiqLMOM3R9VvgnizCZf9ZWte53G2Ybb6N8WKiYT+hYO5gwIlud1ywKb7dF1rVvaF0Me9Xf+4mUEwUg26OS8XcZsXrQIEGtlrd33dv3T3ozAk72Ge3d5OAQPY7D6+CsuoQxQXXYywQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007807; c=relaxed/simple;
	bh=1Kjdkp8811fKw5naGE2/8gYtqAiRI/sQ9d6SG+xGVaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rcDPkT23fMZsaa9D+ugNlKpFpmIQkX06TizhFoHE/zk54REC4moO/QoNNxSmbOug12dw/4gzwLkSPAkujutkZR7GW8gYzfA1gAddME88VnUFhLHEHc7gG2gaZweOxGCKQlQuPFvmiFQTXrMMDzJhhFzd7VdFqAgvs/lQDH6eItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QJjtz/Gy; arc=none smtp.client-ip=115.124.30.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QJjtz/Gy"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784007799; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5OhUCYn4VMczeW6+Hs2qEVU2fwWtgY327gqLrGfDlP4=;
	b=QJjtz/Gyxf5BfYswxJlDth/oiNBXgRcyJfTciKo+Syz6RPlFSHkjGi3K/kv+vZsUoQwC5ntW3VZOLY80fFwBiR0s130t93bDJ1dPVkxyq+XbKOAAJ3B71vsOFca3AJALcBXUdwpKCNSFzKkSjMgK0HjKEf62jO8mXJltROeyzo0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X72yBLk_1784007798;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X72yBLk_1784007798 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 14 Jul 2026 13:43:18 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v2] arch_topology: Introduce nr_possible_packages
Date: Tue, 14 Jul 2026 13:43:17 +0800
Message-Id: <20260714054317.73219-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For multi-sockets platforms kernel or driver code may need the number
of packages to chose different code directions. Some architecture
already provides such kind of interface like x86, which is being used
in its architecture code and drivers.

Add similar interface 'nr_possible_packages' for platforms which can
get package topology information by parsing ACPI tables in boot phase,
which was verified to show the correct number of packages on some
1-socket and 2-sockets production arm64 servers from different vendors.

It has been used locally by some arm64 PMU driver, and cross-socket
timer-consistency check code, which are to be posted.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
  since v1:
      * fix the potential overflow issue for 32b package ID (Sudeep)
	  * add real use case in commit log (Sudeep)

  since RFC:
      * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)
	  * change the possible max package ID to 2047 (Greg)
	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)

  v1:  https://lore.kernel.org/lkml/20260515144435.93035-1-feng.tang@linux.alibaba.com/ 
  RFC: https://lore.kernel.org/lkml/20260512150505.43871-1-feng.tang@linux.alibaba.com/ 


 drivers/base/arch_topology.c  | 26 ++++++++++++++++++++++++++
 include/linux/arch_topology.h |  5 +++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..2ee27cc05b6b 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -850,6 +850,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
 	return !!is_threaded;
 }
 
+unsigned int nr_possible_packages __ro_after_init;
+EXPORT_SYMBOL(nr_possible_packages);
+
+static int package_ids[1 << CONFIG_NODES_SHIFT] __initdata;
+static inline void count_packages(unsigned int pkg_id)
+{
+	int max_packages = 1 << CONFIG_NODES_SHIFT;
+	int i;
+
+	/* This check will be skipped for the first caller */
+	for (i = 0; i < nr_possible_packages; i++)
+		if (package_ids[i] == pkg_id)
+			return;
+
+	if (nr_possible_packages == max_packages) {
+		pr_warn("Number of packages exceeds kernel NUMA node limits [%d]!\n",
+			max_packages);
+		return;
+	}
+
+	package_ids[nr_possible_packages++] = pkg_id;
+}
+
 /*
  * Propagate the topology information of the processor_topology_node tree to the
  * cpu_topology array.
@@ -912,6 +935,7 @@ __weak int __init parse_acpi_topology(void)
 		cpu_topology[cpu].cluster_id = topology_id;
 		topology_id = find_acpi_cpu_topology_package(cpu);
 		cpu_topology[cpu].package_id = topology_id;
+		count_packages(topology_id);
 	}
 
 	/*
@@ -927,6 +951,8 @@ __weak int __init parse_acpi_topology(void)
 
 	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
 	xa_destroy(&hetero_cpu);
+
+	pr_info("ACPI: System has %u Package(s) detected\n", nr_possible_packages);
 	return 0;
 }
 
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..dee076cc9c7a 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -111,4 +111,9 @@ static inline bool topology_core_has_smt(int cpu) { return false; }
 
 #endif /* CONFIG_GENERIC_ARCH_TOPOLOGY */
 
+
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+extern unsigned int nr_possible_packages;
+#endif
+
 #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
-- 
2.39.5 (Apple Git-154)

