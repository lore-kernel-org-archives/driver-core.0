Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245491;
	b=npbw9AWU1NmGjht3pWV3oMC8IX8BZinVPVYB4hTwgp8v4y/v+tNtre4oBwfg2PQBk08c
	 538Mt79QFrNy0MzfFOvAv47a2XnkM98gNET06jW0RawhAIMs67JgmvDvM4SDMaw+pBC3J
	 iC08EW/995z1Ri32CDzAuJtbRuT/ThgThi4jgzO4oGEypLEteyb55qBG9Zmg3V0SGyekr
	 oprkoEHvRm4i8Ir/N/UtHv758Dlr6g+thXIaXYVkA3A5jas3iiMEsaiKZik3rGKr5fzbV
	 5QdzwU2XJigbJgcojXazDeccxr1gEvKHXvLwbsCmdYEoYe0cNFJI0ROojK1vZhJgdvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245491;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=V7eM2wyexXDlmlz0kzw9nI9J5mtD0TkmCXwynuXm4ZE=;
	b=e6150cRWBS/iGOyJ4ZM4knBE62O6b7pTho6uA5MFSMMpWhJXFRCO+HuZDPGcvqhrl2bT
	 YbzfF7+9/8UdUJNkL4iG/7rCfnfZkRTLvy7TzcyF806ETG3s62/OUUQ9dZLH8o03Qprep
	 /G3vAYCbsECzIupet8ZqoICM72oNEoADijfb48JrqIIKaUyd0piyXxLFam2VFJAKU3BR/
	 +0Tj3133lrgwNbaOfEIBo/wf4sQ09DT32EjEDk51mqEuix1INZfv/nLadZHCjoDCaA029
	 llTb4QRl65s1mwShSg1Wq2uYtahEk/x0pPuTNooI6Aw551cDjUmaf+ULQV0Q4uYUzyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b6scQ/Du";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42C606A326
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b6scQ/Du
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641721F008A6;
	Mon,  9 Nov 2026 17:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245491;
	bh=V7eM2wyexXDlmlz0kzw9nI9J5mtD0TkmCXwynuXm4ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b6scQ/Dub8nG6rLwtJDYW9X70vFTRJ05zNNF2TPEI0pfI6S37VocmEXBcY7tpM/Mm
	 6kRyKmPEpL35yCvMQ+JTgZ99V8aFvfYlBeoL4FpafEkswXfYH5r2dsOPSRj8LFeeP5
	 Y/mbD+iBZ/NTYceNhZYqT9ejoWGVkdco9OTbxMt/Gg/Vrj8WaNSY6e+AobPMNONIHe
	 KT3qRAi0zbfTKRm/9re09e+sUK6pgFf92RMfABWcyHB+fD9ZVVccdPci666bZFa2eL
	 6qPbjX0peNbXBgxDavkyNFCOc92RnNvGz29x1hstzb6Ye9/EUobRjqKK22u0QfS73P
	 nYaPDdRsTUgfQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/4] arch_topology: Free ACPI SMT entries on lookup failure
Date: Mon,  9 Nov 2026 17:31:23 +0000
Message-ID: <20261109173125.1734847-3-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109173125.1734847-1-sudeep.holla@kernel.org>
References: <20261109173125.1734847-1-sudeep.holla@kernel.org>
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

