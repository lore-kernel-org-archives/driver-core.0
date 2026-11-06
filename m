Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793983468;
	b=sEwBniGiRHW6dJuGjnc0ryDXJuSsgfFBAfPAdnd7Mf+St5zJDPAHSoK/AAmwNF4IuCnH
	 xLz+vctcncfpV/avpNHMJmRefEL77DwilbqVRqeDWT9ENkHi3bU1/47HeRcaMRJ2gdKLv
	 We/H8GImAmS8MycmRJAL4sqxxVDb9jxDR2DUxbg3BxXfLN5QmQd7tDw95FJK5SV9o+XT5
	 HKBUu8HE1r20tTQpiGz3oV3Xg47B1v8bZZI+kPjqcEseU+pWxtWT9Jz9lokyeyHHc5pHE
	 y62a4ePw5TRa9KAAlUnVKJEkEYMOUeyeEKI0a1Hz0rB24lRysHNQH18ZfibvcSWFvsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793983468;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FSgDDhw/ewGxcuZpcUMaj5Bdd1cKfQIraAHp+T/emc8=;
	b=ftgNAA5UijwkMa4kRiFaH4ad1oay/660uoDuU/Ag3oVTNkeAFdaDq/hKpwtwUOjXo38K
	 JvdKss4y7Vm6jS8cfYDYLViGiMDkEIcjKifq1KhVi2/1xfqRKEmkQMIE+QZxGfPcxmOxv
	 uDy0FSGRi8b/aIXe8V6F/8rcv1SIV5YjrMWnzGD30wJkIOp77H+4SqaqhwyEpm9Jm+4K+
	 Y3g/+VmJmFGi9cenpbi10dK1+3PudEHMeXcmCinlQt2hHFk8w9iwW4WqOjvtzqrCPe32P
	 /UdpppuUtUwIAxY1xb5cHBigi/Q9y3ox35I9o/dwnbsVnYBfNXxL+3ba8wcanYdaALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDwpIlRj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BFB606A326
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 16:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDwpIlRj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F971F008A2;
	Fri,  6 Nov 2026 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793983468;
	bh=FSgDDhw/ewGxcuZpcUMaj5Bdd1cKfQIraAHp+T/emc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bDwpIlRj/fson+bxhdayQJDfKtBRx60qhzonFY06B1o0eB4H67sWCs9vGeEcRi+mA
	 +BfV0UmGD6X4ZODzv1eIr8vEcg5rguWYDJpGi/4WJIasUAhg4LymI4fQeuJNLXH0zr
	 4IvY9M5QcztMTLA4pXuxKrwwN4Hez4knjM5kTtZ9FQCGkHJsVKmcbeiZKudUK8iy76
	 FJ0p0ogrA5E4cTa+zbEb2mhjC/1rxuPzMXkZBKcu0q7lyL+bV7/htcdP/wWellANxG
	 7BOuAzsw/Gcea1V/dR4tTtEoIYnP1KniFLNgFyX31sQM+CNDBaedxOhNcvZVRWlALv
	 t+r4CJabhPhkA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] arch_topology: Free ACPI SMT entries on lookup failure
Date: Fri,  6 Nov 2026 16:44:08 +0000
Message-ID: <20261106164408.158337-2-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106164408.158337-1-sudeep.holla@kernel.org>
References: <20261106164408.158337-1-sudeep.holla@kernel.org>
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

v1->v2:
 - Reset max_smt_thread_num to 1 on failure similar to parse_socket()
 - v1: https://lore.kernel.org/all/20261104153413.2786066-1-sudeep.holla@kernel.org

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 1569ab3335f5..9033a9b642e3 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -860,7 +860,7 @@ __weak int __init parse_acpi_topology(void)
 	struct cpu_smt_info *entry;
 	struct xarray hetero_cpu;
 	unsigned long hetero_id;
-	int cpu, topology_id;
+	int cpu, topology_id, ret = 0;
 
 	if (acpi_disabled)
 		return 0;
@@ -869,8 +869,10 @@ __weak int __init parse_acpi_topology(void)
 
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
@@ -914,6 +916,7 @@ __weak int __init parse_acpi_topology(void)
 		cpu_topology[cpu].package_id = topology_id;
 	}
 
+out:
 	/*
 	 * This is a short loop since the number of XArray elements is the
 	 * number of heterogeneous CPU clusters. On a homogeneous system
@@ -925,9 +928,13 @@ __weak int __init parse_acpi_topology(void)
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

