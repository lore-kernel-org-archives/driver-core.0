Received: from mta0.migadu.com (out-144.mta0.migadu.com [91.218.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB2E3C9EF4
	for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 03:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789874320; cv=none; b=h5xU5bDGUi6KsjDSiCy2+HNO2aMWIu1T3O3hpQ2+rWVr//do9fqwApM3G2ZEq1ceYjtTrvsZRDUmHJnYkrFgPq5Cw6LIrVIzmwSbjK/8rIeFtlfZ8Klp/ZCruhgHmIaOEEbBTBBbp0ylxHrqsUwc4nJAOUzS0QwjU816f3Lwlug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789874320; c=relaxed/simple;
	bh=3W3O8094sWvs6XA3nq+JIrIy9/nDGCyklWmUxuJkhHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYzITr8VMGkwlvf9/AqiEr+osNjPEJ9lSRZbguF0LDZ2P585YjbBOrYotE81KuHNF/ugIlg9VIEeUa/8AmulOJL+LVV8BNjTXuIPRL5PcI0HkywAKPg/FOaNnAMpuI6A6s6YPbXQiEfbpxAkY7l3vSoUvVfkWRs+x5tm9J5U/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qgs0b/yB; arc=none smtp.client-ip=91.218.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qgs0b/yB"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=3W3O8094sWvs6XA3nq+JIrIy9/nDGCyklWmUxuJkhHE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874315; v=1; x=1790479115;
 b=qgs0b/yBrERYTjY5M8aM853MXHKXuMqTl3dC3nGJMra6awJnuuNkeTJrBFzelN51nvSJTBHQ
 SfWWd0IcxpVepjPqqp7TQ0SWF3DZPpWcvVKL2egnR6cK454XBInldUz8OEcljDRkRrcaxvussnG
 1jXddu+UWhjRUMr1Ceabtk64=
X-Envelope-To: driver-core@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 4239474afc06c193;
	Sun, 20 Sep 2026 03:18:35 +0000
X-Mizu-Trace-ID: 4239474afc06c193
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Sun, 20 Sep 2026 11:18:02 +0800
Subject: [PATCH RFC 1/3] arch_topology: Add a die level to CPU topology
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-riscv-die-topology-rfc-v1-1-071c0bf61d5f@linux.dev>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
In-Reply-To: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3769;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=3W3O8094sWvs6XA3nq+JIrIy9/nDGCyklWmUxuJkhHE=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnrA+oZbvrfOL/008GwqU1e10rnnEsruPKnx6tZjXmD7
 9yzsq83d5SyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWwIF6cATGSDLyPDV4f1J8QTD50JTFnE
 Pbeoz4OnaDZT4+/5xVPzOcQUDz/nY2SYWXIuevPUK6q3tHP+mr9bIRFpt9jxzaX2FT9tmBn4Luj
 xAgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

The generic topology model records packages and clusters but has no
representation for a die between them. Systems with multiple dies in one
package must therefore either report each die as a package or flatten
clusters across all dies. Both choices lose part of the physical hierarchy.

Add a die identifier and sibling mask between the package and cluster
levels. Initialize the identifier to -1 and only build die sibling masks
when firmware supplied a valid identifier. CPU topology paths without die
information, including the current ACPI parser and the fallback topology,
therefore keep the die unknown instead of inventing die 0.

Scope cluster sibling matching to a die so each die can number its
clusters independently, and maintain the new mask across CPU hotplug.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/base/arch_topology.c  | 20 +++++++++++++++++---
 include/linux/arch_topology.h |  2 ++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a3..ee82827be3351 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -766,6 +766,14 @@ void update_siblings_masks(unsigned int cpuid)
 		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
 		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
 
+		if (cpuid_topo->die_id != cpu_topo->die_id)
+			continue;
+
+		if (cpuid_topo->die_id >= 0) {
+			cpumask_set_cpu(cpu, &cpuid_topo->die_sibling);
+			cpumask_set_cpu(cpuid, &cpu_topo->die_sibling);
+		}
+
 		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
 			continue;
 
@@ -792,6 +800,9 @@ static void clear_cpu_topology(int cpu)
 	cpumask_clear(&cpu_topo->cluster_sibling);
 	cpumask_set_cpu(cpu, &cpu_topo->cluster_sibling);
 
+	cpumask_clear(&cpu_topo->die_sibling);
+	cpumask_set_cpu(cpu, &cpu_topo->die_sibling);
+
 	cpumask_clear(&cpu_topo->core_sibling);
 	cpumask_set_cpu(cpu, &cpu_topo->core_sibling);
 	cpumask_clear(&cpu_topo->thread_sibling);
@@ -808,6 +819,7 @@ void __init reset_cpu_topology(void)
 		cpu_topo->thread_id = -1;
 		cpu_topo->core_id = -1;
 		cpu_topo->cluster_id = -1;
+		cpu_topo->die_id = -1;
 		cpu_topo->package_id = -1;
 
 		clear_cpu_topology(cpu);
@@ -824,6 +836,8 @@ void remove_cpu_topology(unsigned int cpu)
 		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
 	for_each_cpu(sibling, topology_cluster_cpumask(cpu))
 		cpumask_clear_cpu(cpu, topology_cluster_cpumask(sibling));
+	for_each_cpu(sibling, &cpu_topology[cpu].die_sibling)
+		cpumask_clear_cpu(cpu, &cpu_topology[sibling].die_sibling);
 	for_each_cpu(sibling, topology_llc_cpumask(cpu))
 		cpumask_clear_cpu(cpu, topology_llc_cpumask(sibling));
 
@@ -969,9 +983,9 @@ void store_cpu_topology(unsigned int cpuid)
 	cpuid_topo->core_id = cpuid;
 	cpuid_topo->package_id = cpu_to_node(cpuid);
 
-	pr_debug("CPU%u: package %d core %d thread %d\n",
-		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
-		 cpuid_topo->thread_id);
+	pr_debug("CPU%u: package %d die %d core %d thread %d\n",
+		 cpuid, cpuid_topo->package_id, cpuid_topo->die_id,
+		 cpuid_topo->core_id, cpuid_topo->thread_id);
 
 topology_populated:
 	update_siblings_masks(cpuid);
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f969..2a5591bb95075 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -63,10 +63,12 @@ struct cpu_topology {
 	int thread_id;
 	int core_id;
 	int cluster_id;
+	int die_id;
 	int package_id;
 	cpumask_t thread_sibling;
 	cpumask_t core_sibling;
 	cpumask_t cluster_sibling;
+	cpumask_t die_sibling;
 	cpumask_t llc_sibling;
 };
 

-- 
2.55.0

