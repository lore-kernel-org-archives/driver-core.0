Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391421;
	b=sgv0kfpqh6/z/lw22N/KKSQArfQ5txmGPT446/6ar5UeKGZ3ZkfqNnp62vpfdvQjMojt
	 E/tRFWnjlHGnU+f9upOC+r6vN+JMukLuRkh8eaA9gevh1dCqZytetTcOknEzEHc6y/iR/
	 XIcLAFcqYgqUpUwyQ+CfXfubGCzeaKb1exvRX2P0bwR/cd60QeC4hD664BkfVMTOooe/X
	 Z3es9MSlAnhWeOGrVsOXQUWBeAFK6dAjfHHPaTisAPlGmu4RcbMPVPFGrZvfCCrNxGDgC
	 b94/Tu/arrXdTv8AtThjb1BNnkW+dFML6FJi+Dl3LzZRaJceJcwpHTFkSIjtZArNghw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391421;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=V7eM2wyexXDlmlz0kzw9nI9J5mtD0TkmCXwynuXm4ZE=;
	b=eY9SMVHhHWj7reR+ANr9EUH/Xo1nurv7U9T05Xy0uL6xSZyY3qwza/sQcOCnjnm+D9bw
	 y34i11Jfo5AOo8QRb1TDl0zdnG9vZnwcVVuHpOkyCBYCXcDyKsK7RdivpyiYAvwGAeGID
	 hEGwbyIJDiUtcSqSL8s6dyNc2ArXFVreq83De2FGieVodLyqjfgPyu8JkmAU4B/DHU+rm
	 wOkP7VCmjyeNHM9Uk4+RBQyrWXsyVeL94PDQC0vWEs6u22614MZGXTC2meY5cnJmHz2QI
	 QLfIdX6kkX4i54ppYCXsja7RG2yDai8eeol4qHocK/LVmaumDTFs3COXweLr5zBPhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8NCpTtg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7269B606A899
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V8NCpTtg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 702C71F00A09;
	Wed, 11 Nov 2026 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391421;
	bh=V7eM2wyexXDlmlz0kzw9nI9J5mtD0TkmCXwynuXm4ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V8NCpTtggd+LgJPv64ITgToO8uBagIHq3ioMUuXV7VDIkbjVlLO2XnZd4iW8e6ikK
	 AS+ADY6jzD6IdIOk7DNiQPKIP5U5nwwdRR7RHJW4+vAYa/cj2CEc5HhBtVx8Q9OB47
	 7t+6H0JKuLXdmsJQKLq71menCsAWIfLbQEuP9iLBsn+JkC56v4mx8PMYklkqxjJqt4
	 heWNnGplNVsOSrxVuQiG7E9SMaDXUv0ZpFo3dEUgZw6aCv8rfvFPl+oGERAFaWLFNd
	 /+dCski+5NkyvWBI3zELI8BtWe9Gpq3x/K7ADBMkbnGtElFoD+eQfx0eCdKYFvnQw2
	 nI68u866zkZ7A==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 2/4] arch_topology: Free ACPI SMT entries on lookup failure
Date: Wed, 11 Nov 2026 10:03:29 +0000
Message-ID: <20261111100331.2945297-3-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111100331.2945297-1-sudeep.holla@kernel.org>
References: <20261111100331.2945297-1-sudeep.holla@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A later CPU can fail find_acpi_cpu_topology() after earlier threaded
CPUs have populated hetero_cpu. Returning immediately leaks the stored
cpu_smt_info objects and the XArray nodes.

Send the error through the existing cleanup and retain its return code.
Only update the SMT thread count after a successful parse.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-f41acdf3-9470-4de9-b497-d5de16c8e7e8
Fixes: e6b18ebfaf63 ("arm64: topology: Support SMT control on ACPI based system")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/base/arch_topology.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8ed29885dccf..eea4c4257d08 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -858,7 +858,7 @@ __weak int __init parse_acpi_topology(void)
 	struct cpu_smt_info *entry;
 	struct xarray hetero_cpu;
 	unsigned long hetero_id;
-	int cpu, topology_id;
+	int cpu, topology_id, ret = 0;
 
 	if (acpi_disabled)
 		return 0;
@@ -867,8 +867,10 @@ __weak int __init parse_acpi_topology(void)
 
 	for_each_possible_cpu(cpu) {
 		topology_id = find_acpi_cpu_topology(cpu, 0);
-		if (topology_id < 0)
-			return topology_id;
+		if (topology_id < 0) {
+			ret = topology_id;
+			goto out;
+		}
 
 		if (acpi_cpu_is_threaded(cpu)) {
 			cpu_topology[cpu].thread_id = topology_id;
@@ -912,6 +914,7 @@ __weak int __init parse_acpi_topology(void)
 		cpu_topology[cpu].package_id = topology_id;
 	}
 
+out:
 	/*
 	 * This is a short loop since the number of XArray elements is the
 	 * number of heterogeneous CPU clusters. On a homogeneous system
@@ -923,9 +926,13 @@ __weak int __init parse_acpi_topology(void)
 		kfree(entry);
 	}
 
+	/* Reset max_smt_thread_num to 1 on failure like in parse_socket() */
+	if (ret)
+		max_smt_thread_num = 1;
+
 	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
 	xa_destroy(&hetero_cpu);
-	return 0;
+	return ret;
 }
 
 void __init init_cpu_topology(void)
-- 
2.43.0

