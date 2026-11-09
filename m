Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245493;
	b=fpbyagW6GGcTgaT1SvtkaxIrM0XNkau7Aw4kKfxusRBHFZ7Y7f4FYOx1sBTxYaBtXTMB
	 sp9XYH93Y0r2QLoWXGk+yhpY5DehIBQr//WRXgicftSybysoeE6r12HPY+Xnm1/NwMXm4
	 NGA0ffWBOVMANkHmko8QcX/ie+/okFVrrONd68O5I7fqk+1R5IlfYZhZ3C0OKgpvbPywf
	 fsEvx9DrjO8kemSMDoLFCWTIF99cFlZ9JTxYUB7Mxx20aFFuXo3VG7Kuvgm8kbsQmnVck
	 RM7JnjHwskm4AOyvze+n9BtWyhRbdDtKKVpYlZK0Dh/X41ZF167TE44YdWSODysCXKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245493;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ed/IHz3PxJm5ZNWBaZpu1Eskyyp5O6m7B7gIGFQDSLo=;
	b=3BGx7UjoE5fb204yW10KPZSC1MAkNoqLmVjLHgATXeFnNwJCrOcvygc022DELJ6x8e+v
	 cNg7SZk63RMJjwBiUEVcIeDhEvNe+4eFVxsh9EDNbMv2o19V+uv8w0dDCS2Ej/3pNV8Jw
	 t9klv3yY21eItodqAnOMMdHCE5sncTLxLft4jb0vB2efwlLxRyENYlaC+SeH5sqfCTVHZ
	 GNG4+VV9NcLnKz8CqN2B1GrzHsO2pf3ORr/vsAGWytVDz1OWVVAqtZqyQQ+xU3jaP/OY8
	 9swBwO1tYsK8FS203DwXx5jIIQdr98Nw3aptJB1UWjp7PupfOhRYUFHRKOmyerAzuSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5F6wgcl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF045606A330
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 17:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5F6wgcl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952D21F0089F;
	Mon,  9 Nov 2026 17:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245492;
	bh=ed/IHz3PxJm5ZNWBaZpu1Eskyyp5O6m7B7gIGFQDSLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T5F6wgclxB5afeJRV8YfvcWhnn9ZruTPWuCVPoXSrAk5J0GRB1JmqhpVlxgAfEpF5
	 m5YNC47UWcmrLbFBdhQF+TNI02wbhmPVz3yoSwg+YJ0f7G8ziFpQROEvuadewivLHd
	 UCiAkPTQYXYhXWSL1UH1wLvufvA1Oj9+m0dEiI+LO+7/IgqLw5ndqC0P9zhUos7Oy9
	 NmidetAIjSesjjgFSh8AJqiFKZRHi/DRRYd1NavE+jcUmrzHo+Aqc30RyV7TK4Ar4d
	 mZi/6K3EXzht8Ji9eRi0/5jomMnJujsnhT/IOhESWfF7x6H9ZThgOFBhzFoareQO72
	 xl7Tn1IFhgvTg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: driver-core@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v3 3/4] arch_topology: Reset SMT state when topology is unavailable
Date: Mon,  9 Nov 2026 17:31:24 +0000
Message-ID: <20261109173125.1734847-4-sudeep.holla@kernel.org>
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

If DT has no CPU information or cpu-map, parsing succeeds without
notifying the SMT framework. A later topology validation failure can
discard parsed data while leaving the SMT thread count set by
parse_socket().

Reset the count to one on these paths so the SMT framework matches
the topology that remains available.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-486a8656-d962-4966-8d90-bbb2ce276147
Fixes: 5deb9c789ae4 ("arch_topology: Support SMT control for OF based system")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/base/arch_topology.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index eea4c4257d08..c439fc91270d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -662,6 +662,7 @@ static int __init parse_dt_topology(void)
 
 	if (!cn) {
 		pr_err("No CPU information found in DT\n");
+		cpu_smt_set_num_threads(1, 1);
 		return 0;
 	}
 
@@ -672,8 +673,10 @@ static int __init parse_dt_topology(void)
 	struct device_node *map __free(device_node) =
 		of_get_child_by_name(cn, "cpu-map");
 
-	if (!map)
+	if (!map) {
+		cpu_smt_set_num_threads(1, 1);
 		return ret;
+	}
 
 	ret = parse_socket(map);
 	if (ret != 0)
@@ -951,6 +954,7 @@ void __init init_cpu_topology(void)
 		 * arch-specific early cache level detection a chance to run.
 		 */
 		reset_cpu_topology();
+		cpu_smt_set_num_threads(1, 1);
 	}
 
 	for_each_possible_cpu(cpu) {
-- 
2.43.0

