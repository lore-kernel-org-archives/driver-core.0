Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD093859E3
	for <driver-core@lists.linux.dev>; Fri, 15 May 2026 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856283; cv=none; b=PYs0tqjxeFnrTMCd2vsssjxDaDgWGICFN2HuszmAk1llh3sHhHavMVV+/SEQcVFTY9jBkKj2cWBtu0K7v/TLtcmhEoYfLqEGy+U7BhURk8IGIswOcPED7GkLDw4hnYG7VmSRsqZiKP+EgbYr4FtKp3HGQ5bw1tkV1X643IKRCCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856283; c=relaxed/simple;
	bh=Q2s8RPuCzod8gsXwuzHOHa0G2E8cuX6/xEA9NUejrV0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FzTZdkqpJJP/I0UFigrXNyY+YwEwdvS0b7HgutOI32e6aJxS8lFf8QlodctJ36Mc29K+9gHcMB2czopkT126jvA3ea+R5YuUh+4F7GlgEbneysMaubSqXXcz9KMEWiIYZ2V+zvuOkslU43PWOX88bIztu2/WkOS5T9GMvuB+Td0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=DWMkgBV2; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="DWMkgBV2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1778856278; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DL7F44OH8y8J7eSZ6O1ahv1+YYDMT1VIWhNSA/0/RFU=;
	b=DWMkgBV2WY1YkeoXYUIOM0v04Es29CvYwqEqioq9TeONEA9MlOmQlSlVmtP4kbkq3fW3kpKRCvCds8as0P+tG6ov6NT5BVvwOW17NvBESYfKAn778dWXZ/jNp4LC9rHG3WQu3Gev6aRo8NXd/jHyzSQOAmqV+Q4pBheqFe0pQTA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X2zmueG_1778856276;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X2zmueG_1778856276 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 15 May 2026 22:44:36 +0800
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
Subject: [PATCH v1] arch_topology: Introduce nr_possible_packages
Date: Fri, 15 May 2026 22:44:35 +0800
Message-Id: <20260515144435.93035-1-feng.tang@linux.alibaba.com>
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
get package topology information by parsing ACPI tables in boot phase,
which was verified to show the correct number of packages on some
1-socket and 2-sockets production arm64 servers from different vendors.

Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
Changelog:

  since RFC:
      * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)
	  * change the possible max package ID to 2047 (Greg)
	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)
	
  RFC: https://lore.kernel.org/lkml/20260512150505.43871-1-feng.tang@linux.alibaba.com/ 

 drivers/base/arch_topology.c  | 21 +++++++++++++++++++++
 include/linux/arch_topology.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..d799ba808b43 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -830,6 +830,16 @@ void remove_cpu_topology(unsigned int cpu)
 	clear_cpu_topology(cpu);
 }
 
+unsigned int nr_possible_packages __ro_after_init = 1;
+EXPORT_SYMBOL_GPL(nr_possible_packages);
+
+/*
+ * Assuming silicon has a sane package ID decoding method to not have
+ * an ID bigger than 2047
+ */
+#define MAX_PACKAGE_ID	2047
+DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
+
 #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 struct cpu_smt_info {
 	unsigned int thread_num;
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
+	pr_info("ACPI: System has %u package(s) detected\n", nr_possible_packages);
 	return 0;
 }
 
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..960045e6ac05 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -105,6 +105,7 @@ static inline bool topology_core_has_smt(int cpu)
 	return cpu_topology[cpu].thread_id != -1;
 }
 
+extern unsigned int nr_possible_packages;
 #else
 
 static inline bool topology_core_has_smt(int cpu) { return false; }
-- 
2.39.5 (Apple Git-154)

