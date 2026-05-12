Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E63A4249
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 15:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598314; cv=none; b=QyqV4FlIqsxIc5Rc1wmipIDuGLMF+n3NJeHtI5lGCgMgdl3nMDd54dUIMGY2lJhU96VMaUw1LPL/uhVIZr71dgWJneHx0TT2kp2Yfk7HcvDnKs/yBi1HBPAfQ4f7r8JOZ9v4/9hJZLCZ2lTacqrOHWH9YJaKGnHPXtTZElO8SAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598314; c=relaxed/simple;
	bh=109/fxCwRRLT51ItLgbteNfJwo5ZPAV1GjX+pbqhs5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FmaYGCDB6YOqbmgyl1lVX3WnsChAe5olpJxVHMf88UvAjg98OkYMTNYjGIktmEiyeG6MgUCDnApfO4cVvFtg4HFx/IXlfjmSxWt6KeU4uhIB/kKClz7FDY6drbo6GYeTk6D8v10Yj7qIA/oWRgCzdXREUm/+FMCZfVZL/YSrZXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=uzni/aTn; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="uzni/aTn"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778598307; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Jn2fMGP6e2PWk5hCdOKU4Eg7aUqrhAvFB47aAiVuU+Y=;
	b=uzni/aTnV6FvkOET5pKzZdLBA7G94dggopKn3OoqipCC2iXcKdMU4WG7hvG0Wk7J3X2WZgTNNq6yeJKUbU9WetIdRHstNZb5NaIYGEzZOfgrkQgGOZ6D1wHSXr5cOY26tlp7oCpnDucqF2cAiwGPJPrMdlYjajw9OLwP9j/GDVo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X2qqTT8_1778598306;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X2qqTT8_1778598306 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 May 2026 23:05:06 +0800
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
Subject: [PATCH RFC] arch_topology: Introduce nr_possible_packages
Date: Tue, 12 May 2026 23:05:05 +0800
Message-Id: <20260512150505.43871-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In multi-sockets platform, kernel or driver code may need the number
of packages for chosing different code directions. Some architecture
already provide such kind of interface like x86, which is being used
in some architecture code and drivers.

Add similar interface 'nr_possible_packages' for platforms which can
get package topology information by parsing ACPI tables in boot phase.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 drivers/base/arch_topology.c  | 21 +++++++++++++++++++++
 include/linux/arch_topology.h |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..796d8a7aceea 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -850,6 +850,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
 	return !!is_threaded;
 }
 
+unsigned int nr_possible_packages __ro_after_init = 1;
+EXPORT_SYMBOL(nr_possible_packages);
+
+/*
+ * Assuming silicon has a sane package ID decoding method to not have
+ * an ID bigger than 255 (1 byte).
+ */
+#define MAX_PACKAGE_ID	255
+DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
+
 /*
  * Propagate the topology information of the processor_topology_node tree to the
  * cpu_topology array.
@@ -912,6 +922,13 @@ __weak int __init parse_acpi_topology(void)
 		cpu_topology[cpu].cluster_id = topology_id;
 		topology_id = find_acpi_cpu_topology_package(cpu);
 		cpu_topology[cpu].package_id = topology_id;
+
+
+		if (topology_id >= 0 && topology_id <= MAX_PACKAGE_ID)
+			bitmap_set(package_id_mask, topology_id, 1);
+		else
+			pr_warn("ACPI: abnormal package ID: %d !\n",
+				topology_id);
 	}
 
 	/*
@@ -927,6 +944,10 @@ __weak int __init parse_acpi_topology(void)
 
 	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
 	xa_destroy(&hetero_cpu);
+
+	/* Count the number of possible packages in system */
+	nr_possible_packages = bitmap_weight(package_id_mask, MAX_PACKAGE_ID + 1);
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

base-commit: 50897c955902c93ae71c38698abb910525ebdc89
-- 
2.39.5 (Apple Git-154)

