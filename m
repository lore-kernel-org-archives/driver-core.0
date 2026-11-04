Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806463;
	b=UzXFBF1HyJshf373D7l3t2IAwg6dTAwNdG53l5/vmNz+sL6Yff4Pnlk1eJxj4HRYONez
	 Nkz/P6R8JKvgddKhHFC3M+2EOCB2dzK9dVkWc4871eWhAIx9JNF78LP1e7IB66b9V837w
	 KnXg/ILt7ja0uWfEAuOYBRkb89md/TXa1za/MrCK4Bh7oG907NSIXG4bHwpHZ4K3XMjfy
	 T6CrkB8VxuPjvUKRMJ7KKQkEDNojLUXzVY3dC+eWvJ00pEeHM1JA2QrgKUacpdarCoTCo
	 1KjP7iVB1D5Ggq6xGX0aGVpCssr9fzEWSLq7MdG3kg29br3NNfMVJ9MX+0kPQvjd2AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806463;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UamPzjgHNC9EDz/ZPCd0mIF2xT04a2fF7dmPZhBcCd4=;
	b=WscpauDvoWu5YeYc3Jazz+ApcVKQud2MKjrxq8ShsxgQmTMufU36F/RnHmyrCAJ1bhLR
	 OQn1OMclXlTwwes+63wwSZNc1Lz9zDngp8LLLYz8dDX4/SP0gWNpTQGQ8lOaVE5j3X+fX
	 qTPqtPlTmVjaazo9I6gbakQsO/nqcPhKHkRuAwt6QzjyH3fvO16BusMmnphBWsWrUBlS8
	 u+ZXhzPlhr0gm8cqg1RqREWutaOLEVrYKFjarkEO8SCgTbh3XgdWQHANfJtJn9wzG+Yw3
	 Zm/yhp7o99/Tlf/wxYrwbHAYMwMjHfuj78/PxjhW+03ExFFdsVPblO6g0RG3DQmUg6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nzgLDpTx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA19606A326
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nzgLDpTx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384631F000C1;
	Wed,  4 Nov 2026 15:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793806463;
	bh=UamPzjgHNC9EDz/ZPCd0mIF2xT04a2fF7dmPZhBcCd4=;
	h=From:To:Cc:Subject:Date;
	b=nzgLDpTxacMFRFMNfvKKxQtLVXnmB98k9hxKYhBwjRXoyhWs3S8d2q8Kdtf3VEhX8
	 OFzqN5lqAMwACpwOh8Kguyce5Xwwwbl09RBf70zeV3wrFveSW1XmK6J5W/fVzhjJCx
	 /LMcnRhGSWdWj2dv8B2EkYen4A7uxOoFeiRTWYf/r+v/ZAiTLuk8BpLAl4+KHJ4AX3
	 l9Ha8lCyi09pmqIa+qKaizFGoLvIEnsKL58uZjmNkKhe4RfVEe4f8xNXDiZoXFZGdK
	 SKPoJGOsKuZFEhTdDUbB+sX8lhneR9b4FfU9+mVOOcqtuSglNQQ+ZaqT0hf1iXcxCl
	 I/mBWTaA00r0Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] arch_topology: Free ACPI SMT entries on lookup failure
Date: Wed,  4 Nov 2026 15:34:12 +0000
Message-ID: <20261104153413.2786066-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
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
 drivers/base/arch_topology.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 1569ab3335f5..9a709bccc13e 100644
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
@@ -925,9 +928,10 @@ __weak int __init parse_acpi_topology(void)
 		kfree(entry);
 	}
 
-	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
+	if (!ret)
+		cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
 	xa_destroy(&hetero_cpu);
-	return 0;
+	return ret;
 }
 
 void __init init_cpu_topology(void)
-- 
2.43.0

