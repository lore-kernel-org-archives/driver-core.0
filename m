Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853337;
	b=dNS+WwsXQncqmwDy/YrfxCJ+Qj4GQEn6YnhYWpHO5C9svghCEbbxDNHNYubW0yU8wmw/
	 OVxyb/g1u8XKYBJGPHislErJvViM8SwiiTBXNE9oo2HsmQSZ+PqUpxlRj91bOoJp/qkE5
	 n/w/0VkutucCUOnG65I0Kra18TD/M/0sYj7ziFGpti8CFgW0z3uYPx2VsMQqaHiIPz7av
	 KAUwa2I6znyfiHN+A81GaETLMyFrj9UB57/rHpkCKOeRC/EmoCfUYr3CQjtOofMvmOcGY
	 jNbm8k8tMK4N+OJVpMgd4b0BZJgKT+zYdbMgwF8aRQZR9FNq8BfIoQDbqtLqTKSzyEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853337;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qgJtD7k0pYtF6kLtArBNu5iinKiZ8C5Hb7dGhNEKYS0=;
	b=a3lVEIcs4HFpHz37XQToF26CD/Paljl2amTcLI+FV5Ah6lGuY5DjlLQhQUulegD3dCLM
	 8HIIJ7HZf6sssCf58vUDh80Y53LDIz+2x/5BhDk7aeMrUW0gOqvEWlmymIGkNWJinqBTh
	 IZhQ4iU1b8BokbwSdW5b17nK+0nS+2E5g2rlPtI5YXYv0A/YqDQbSQGmBPadJ/IROpyAt
	 Opz71jMlKOirG3DjxSlZeeDUFEkVx68GaOwzqe5fPvNW7RahVWPnH4cMe3kHWmgYyOmzU
	 kmt4/7ncoqaMdVG6CgVPobJgFVUpME3Fc26+wMFjMN5x7H0onEUio0ELBvzJ2bYTJUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HZQxEtRh;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8732E606A887
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 18:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8732E606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HZQxEtRh
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E87D51A25;
	Mon, 16 Nov 2026 10:22:12 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBE803F632;
	Mon, 16 Nov 2026 10:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794853335; bh=LE3lHzxkAxNsqvYPhRB4V4ZgUQLoc0JigYQ9w7GJjIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HZQxEtRhIVKsZTGe9dxcJMHfUG9J5xXunM5HnAip9s9e1mocJq9un0lyxkxoUdGxw
	 V80/JBBvD62zB2+26kWFbr+vVGYMtS2A0NaDHVtwcrtuAacbZGf3smh3wO3qYezxJy
	 XaIS5ouqcsPTtMe1miU3HPe/0Du7PdeD5ee54Plg=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 16 Nov 2026 18:21:28 +0000
Subject: [PATCH 1/8] device property: Add firmware node IRQ affinity
 callbacks
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
Message-Id: <20261116-acpi_arm_pmu_registration_hmp-v1-1-0371d4eca626@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794853327; l=6475;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=LE3lHzxkAxNsqvYPhRB4V4ZgUQLoc0JigYQ9w7GJjIY=;
 b=HlcHbMLjXrzwmD8GtjKwIedLgekz+Q6fr4lHVcPl1qBjwFqVFTYVmUVMWV2n9PSBzTzz1eTsZ
 HY3o1VLbDL2A0vpKccjSxjolrv81ha47g0v2reTJHzdTJZICgEhGJEF
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Platform IRQ affinity lookup currently selects the OF or ACPI helper
directly. Add fwnode_irq_get_affinity() and an irq_get_affinity operation
implemented by both firmware types.

Use the new helper for platform devices, preserving the existing fallback
to cpu_possible_mask when affinity information is unavailable.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/acpi/property.c  |  8 ++++++++
 drivers/base/platform.c  |  7 +------
 drivers/base/property.c  | 15 +++++++++++++++
 drivers/of/property.c    |  7 +++++++
 include/linux/fwnode.h   |  5 +++++
 include/linux/property.h |  2 ++
 6 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 8ee5a1f0eb4869114c5d282f5808974687d46f5c..558de77bd4442fd7c85797f41b84c13f8fc27c67 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1735,6 +1735,13 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
 	return res.start;
 }
 
+static const struct cpumask *
+acpi_fwnode_irq_get_affinity(const struct fwnode_handle *fwnode,
+			     unsigned int index)
+{
+	return acpi_irq_get_affinity(ACPI_HANDLE_FWNODE(fwnode), index);
+}
+
 #define DECLARE_ACPI_FWNODE_OPS(ops) \
 	const struct fwnode_operations ops = {				\
 		.device_is_available = acpi_fwnode_device_is_available, \
@@ -1761,6 +1768,7 @@ static int acpi_fwnode_irq_get(const struct fwnode_handle *fwnode,
 		.graph_get_port_parent = acpi_fwnode_get_parent,	\
 		.graph_parse_endpoint = acpi_fwnode_graph_parse_endpoint, \
 		.irq_get = acpi_fwnode_irq_get,				\
+		.irq_get_affinity = acpi_fwnode_irq_get_affinity,		\
 	};								\
 	EXPORT_SYMBOL_GPL(ops)
 
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 3593d45f4a7ae8207286a7ce0671419c6de556d1..e6352ef63a20cb818d958e7e2a0a9c37170c1769 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -155,12 +155,7 @@ static const struct cpumask *get_irq_affinity(struct platform_device *dev,
 {
 	const struct cpumask *mask = NULL;
 #ifndef CONFIG_SPARC
-	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
-
-	if (is_of_node(fwnode))
-		mask = of_irq_get_affinity(to_of_node(fwnode), num);
-	else if (is_acpi_device_node(fwnode))
-		mask = acpi_irq_get_affinity(ACPI_HANDLE_FWNODE(fwnode), num);
+	mask = fwnode_irq_get_affinity(dev_fwnode(&dev->dev), num);
 #endif
 
 	return mask ?: cpu_possible_mask;
diff --git a/drivers/base/property.c b/drivers/base/property.c
index 51109794d7275ddaf4571584d0e77d8573ebb475..b6d9fd3c5bdeec9636e49d2319d2b43a55758a85 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1109,6 +1109,21 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_irq_get_affinity - Get the CPU affinity of an IRQ from a fwnode
+ * @fwnode:	Pointer to the firmware node
+ * @index:	Zero-based index of the IRQ
+ *
+ * Return: A borrowed CPU mask, valid while @fwnode lives, or NULL if no affinity
+ * information is available.
+ */
+const struct cpumask *fwnode_irq_get_affinity(const struct fwnode_handle *fwnode,
+					      unsigned int index)
+{
+	return fwnode_call_ptr_op(fwnode, irq_get_affinity, index);
+}
+EXPORT_SYMBOL_GPL(fwnode_irq_get_affinity);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/drivers/of/property.c b/drivers/of/property.c
index 45e55f61848801ed497702c6cfe501009904c49d..f1426533e7ec0dfdfaef5d1cbb2b6e6acc87a1d2 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1660,6 +1660,12 @@ static int of_fwnode_irq_get(const struct fwnode_handle *fwnode,
 	return of_irq_get(to_of_node(fwnode), index);
 }
 
+static const struct cpumask *
+of_fwnode_irq_get_affinity(const struct fwnode_handle *fwnode, unsigned int index)
+{
+	return of_irq_get_affinity(to_of_node(fwnode), index);
+}
+
 static int match_property_by_path(const char *node_path, const char *prop_name,
 				  const char *value)
 {
@@ -1724,6 +1730,7 @@ const struct fwnode_operations of_fwnode_ops = {
 	.graph_parse_endpoint = of_fwnode_graph_parse_endpoint,
 	.iomap = of_fwnode_iomap,
 	.irq_get = of_fwnode_irq_get,
+	.irq_get_affinity = of_fwnode_irq_get_affinity,
 	.add_links = of_fwnode_add_links,
 };
 EXPORT_SYMBOL_GPL(of_fwnode_ops);
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index a9dcaf7e70765637a0c33af2ae0ac541e15752ad..9f45a58fda6802b924cd67585e51e8f537e6d625 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -28,6 +28,7 @@ enum dev_dma_attr {
 
 struct fwnode_operations;
 struct device;
+struct cpumask;
 
 /*
  * fwnode flags
@@ -138,6 +139,8 @@ struct fwnode_reference_args {
  * @graph_parse_endpoint: Parse endpoint for port and endpoint id.
  * @iomap: Map the I/O memory of a given index for a fwnode.
  * @irq_get: Get the IRQ of a given index for a fwnode.
+ * @irq_get_affinity: Get the CPU affinity of a given IRQ index, or NULL if
+ *		   unavailable. The returned mask is valid while the fwnode lives.
  * @add_links:	Create fwnode links to all the suppliers of the fwnode. Return
  *		zero on success, a negative error code otherwise.
  */
@@ -186,6 +189,8 @@ struct fwnode_operations {
 				    struct fwnode_endpoint *endpoint);
 	void __iomem *(*iomap)(struct fwnode_handle *fwnode, int index);
 	int (*irq_get)(const struct fwnode_handle *fwnode, unsigned int index);
+	const struct cpumask *(*irq_get_affinity)(const struct fwnode_handle *fwnode,
+						  unsigned int index);
 	int (*add_links)(struct fwnode_handle *fwnode);
 };
 
diff --git a/include/linux/property.h b/include/linux/property.h
index 9143fe4f5c05179e595ba875aafbcb006a740824..08c901015a9ea4b9223a29d07749f88a5d672ea7 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -230,6 +230,8 @@ DEFINE_FREE(fwnode_handle, struct fwnode_handle *, fwnode_handle_put(_T))
 
 int fwnode_irq_get(const struct fwnode_handle *fwnode, unsigned int index);
 int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name);
+const struct cpumask *fwnode_irq_get_affinity(const struct fwnode_handle *fwnode,
+					      unsigned int index);
 
 unsigned int fwnode_get_child_node_count(const struct fwnode_handle *fwnode);
 

-- 
2.34.1

