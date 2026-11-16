Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853349;
	b=ENPlaqGgUy3kus+DLcNHQ0h2HgFzvvWw1WpbOCS1OIh71cBGpUffrTKezgtXvo8pQRqF
	 44RwWdeFZRCBpa9BIUFa0pOMrtvGjL6Vajc2wz3B+I2RNZxjYSLXVybcZVAjVp7vkfQq8
	 58gGRB8jwURmFmnsivbtUjhoKaDJ8zoDmARckUil9Y/f/sl9TZmkFGDqk+X6LQjqJdmBj
	 EkOzzziHErPeBWYBuzd+UHTykyonv5uL7SVgNa8EsTDDQGdv+78YEe2v7zgkUOMmU3yf6
	 XfNC5UEpn/2oGGo6SF+NI2YF+r7D6/1ZgNuAI9sxR1E5IQx91IxqAQYHgfm7zdiZt/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853349;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=V9fQ7V+HnC3+mZIkVBup/DL7T9dCFIK15XRUFub1Lqw=;
	b=TqeiNGIViAEzIRVJ+2gf21W/smF2e1X6sEG3GEAyM6ABDfoA9SeNYGh2evsr9Mtz0fV4
	 VLSKWV3MhQzJJ20lT98QC4yCB1cglz4vELJ1W3z1Gl/j9C+GqlwRJY1lzP+pJDY1uBZ/B
	 or8F0zTGx8QgXQAOgkgBOyGKdbC1j14rLBcH8R9pAIFw4Z206dovDI123ShLEx7AKBJBd
	 2CRiwEKERiIp2NqDmO2/wxPmhpF1Fmt5DmOB6+4DItoohr/VGTuYZthHMElt2M6WX6CZJ
	 3t5cdjbiozzL6oCL6vI6vMtVe0NKI84W0i8e7TSlu3e7P6HyLMRRdAw/A7/qYt7dJwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ft4tiibX;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789C4606A323
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 18:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 789C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ft4tiibX
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFDE81A25;
	Mon, 16 Nov 2026 10:22:25 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38EF3F632;
	Mon, 16 Nov 2026 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794853348; bh=S8CtYSrSSXMBTx69eeGqeydEJ6als+cClSEg+DhFsW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ft4tiibXYJqtmYg04qPoR27PIg/NV2mU5uMiLQaxae4LxwdRVGDClZTMCdgnWTilp
	 agSHCQ2E/WNtIfRc516klVJtSId+QJAKQpfzJt0hRHY3ZVRVaZLsAGtg6sWk22NI9U
	 Fp3V2wMcAleD6hUQn7oqdnXDwKD2D8HI2h/QeP44=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 16 Nov 2026 18:21:31 +0000
Subject: [PATCH 4/8] perf/arm_pmu: Prepare ACPI registration for per-CPU
 interrupts
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-acpi_arm_pmu_registration_hmp-v1-4-0371d4eca626@arm.com>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, Will Deacon <will@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hanjun Guo <guohanjun@huawei.com>, Jeremy Linton <jeremy.linton@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Al Grant <al.grant@arm.com>, 
 "Johnny.Fan" <johnny.fan@cixtech.com>, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794853327; l=3464;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=S8CtYSrSSXMBTx69eeGqeydEJ6als+cClSEg+DhFsW4=;
 b=PllKyyNoIOh6QzJ591v24YxRwvR//bSIPCuq5ofsE32NiW5U2NddFKqe6GVtK9iwI9jcvs/MG
 uKpcsFLYGFoDiLA7E8H8yMt+Lt5/eyabPuK65vp+6V6+3lzdK2cpFAx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

CPU PMUs may use a separate SPI for each CPU. Extend the existing IRQ
compatibility check to allow different SPIs in a group while retaining
the same-PPI requirement.

Extend arm_acpi_register_sw_node_irq_affinity() to publish a singleton
CPU mask for each SPI resource, using the CPU recorded in its mapping
entry. Keep the full group mask at index zero for a shared PPI or a
counting-only device with no IRQ resources.

Retain zero-GSI CPU PMU entries for counting-only devices. Trust
firmware to provide GICC interrupt descriptions as specified by ACPI.
SPE and TRBE remain the common registration interface's callers in this
commit.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_pmu_acpi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index 7ae291acb04526d820bdfb9640aaa8352449be54..6a7fa8d01f42b1b58e28541a374f005e1955598f 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #include <asm/cpu.h>
 #include <asm/cputype.h>
@@ -158,7 +159,8 @@ arm_acpi_alloc_pmu_groups(const struct arm_pmu_acpi_device_info *info,
 			goto out_free;
 		}
 		gsi = info->parse_gsi(gicc);
-		if (!gsi)
+		/* CPU PMUs can count without an overflow interrupt */
+		if (!gsi && strcmp(info->name, ARMV8_PMU_PDEV_NAME))
 			continue;
 
 		group = arm_acpi_alloc_pmu_group(groups, &nr_groups, cpu);
@@ -201,7 +203,8 @@ static void arm_acpi_unregister_irq_resource(struct arm_pmu_acpi_group *group)
 
 static bool arm_acpi_pmu_irq_matches(unsigned int irq, unsigned int other_irq)
 {
-	return irq == other_irq;
+	return irq == other_irq ||
+		(!irq_is_percpu_devid(irq) && !irq_is_percpu_devid(other_irq));
 }
 
 static int arm_acpi_map_gsi_irq(u32 gsi, int *irq)
@@ -253,7 +256,7 @@ static int arm_acpi_register_irq_resource(struct platform_device *pdev,
 		if (ret < 0)
 			goto out_free;
 
-		/* A group must use the same PPI */
+		/* A group must use the same PPI or only SPIs */
 		if (group->nr_irqs && !arm_acpi_pmu_irq_matches(irq, res[0].start)) {
 			pr_warn("ACPI: %s: CPU%d has inconsistent PPI in group, ignoring CPU\n",
 				pdev->name, map.cpu);
@@ -279,15 +282,28 @@ static int arm_acpi_register_irq_resource(struct platform_device *pdev,
 static int arm_acpi_register_sw_node_irq_affinity(struct platform_device *pdev,
 						 struct arm_pmu_acpi_group *group)
 {
-	int ret;
+	struct fwnode_handle *fwnode;
+	struct resource *res;
+	int i, ret;
 
 	/* A MIDR group may span several processor containers */
 	ret = device_create_managed_software_node(&pdev->dev, NULL, NULL);
 	if (ret)
 		return ret;
+	fwnode = dev_fwnode(&pdev->dev);
+
+	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res || irq_is_percpu_devid(res->start))
+		return software_node_add_irq_affinity(fwnode, 0, &group->cpus);
+
+	for (i = 0; i < group->nr_irqs; i++) {
+		ret = software_node_add_irq_affinity(fwnode, i,
+						     cpumask_of(group->irq_maps[i].cpu));
+		if (ret)
+			return ret;
+	}
 
-	return software_node_add_irq_affinity(dev_fwnode(&pdev->dev), 0,
-					      &group->cpus);
+	return 0;
 }
 
 static int arm_acpi_register_pmu_device(struct arm_pmu_acpi_group *group,

-- 
2.34.1

