Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D5175A72
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.148.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357247; cv=none; b=Fjhxf+lOJWqvSUlNfut6ZC5OrQOUZjaeORd/OlBZ7l1RG+SsIqP86op/zJ0enLwk6uKZSI0fAErIg8ChIoWOSu4d9/05kokB7PG5tQULWhWOO/1+WyhfYLRx1K/5yH1PtjJPmTlmkz7rTE6TLRaF7s2LzNbf3aqPoPh60gJgV3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357247; c=relaxed/simple;
	bh=ElRMXMqUlqHi0jslYTtvgShQyouMJ6RBkzwwYgftXk4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DJ5zWvgP2D5uAQZ3mJZ+AKhQiCoZXHWLvQyhj98ZDERnYq3ljRXejJ2MHoJr6JVvHPSAyoGrGO7/jaV5HdYvhc+NI8H4xgQSLl1yEM1FV7663c2P/ORkyN04EWLKoMKNS+rTu0zDzd3dsXyZS8Vvp0j2VjstUiK5tsWOOIaBtss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=tESWTj5f; arc=none smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="tESWTj5f"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9RosQ1833020;
	Mon, 10 Aug 2026 10:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=+r5sSmpWP/sQfyM19vW1yCiTY+KSCURxWh
	1DkUla0WU=; b=tESWTj5fmqUxM8KVgsPHtnowXpZIEf/2bnWKwJALgJFCica5E+
	CdSuUeldiaEdaacjhz00xzoVQJSo0LoNOiDbV7q6wJmRFalkBTWWZbOlyMcw9Vkc
	+mFeYbuQWNG92hFYsRob0abj3BSnDvFC6gPiLq0JX8hZsCxioRtuT48Pj7snOAYZ
	r6ClcgEoFDjEM4W61NoolOZkVUvKFVGdRTuMl57I9BlRAr3jRqw+Y24ae8ZP005c
	h6qdPcMuzgpfSLSjXQsPzGC03RgER1PQCnunKbLytnvuEHT9cE6vwRiH6bXw3S1G
	QT+rfmmmHbg0YtETzHBb46/7LRQ3z+p8CptQ==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fxfwfsun6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:20:16 +0000 (GMT)
Received: from hetlppfpool1.lenovo.com (unknown [10.196.132.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4hJW1y3mJsz1yfbbq;
	Mon, 10 Aug 2026 10:19:02 +0000 (UTC)
Received: from SEANWANG1-P5MFL.lenovo.com (SEANWANG1-P5MFL.lenovo.com [10.111.201.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool1.lenovo.com (Postfix) with ESMTPS id 4hJW3L2Nplz1wCTlh;
	Mon, 10 Aug 2026 10:20:14 +0000 (UTC)
From: seanwang1 <seanwang1@lenovo.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
        Danilo Krummrich <dakr@kernel.org>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Xuewen Yan <xuewen.yan@unisoc.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, seanwang1 <seanwang1@lenovo.com>
Subject: [PATCH v2] arm64: topology: add source check in arch_cpu_idle_enter()
Date: Mon, 10 Aug 2026 18:20:06 +0800
Message-Id: <20260810102006.9986-1-seanwang1@lenovo.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YvY/gYYX c=1 sm=1 tr=0 ts=6a79a5e0 cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=icsG72s9AAAA:8 a=8k6WQxmsAAAA:8
 a=r6UP8DDBqnObT9kPvYkA:9 a=T89tl0cgrjxRNoSN2Dv0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4OSBTYWx0ZWRfX36Jf6s0l/CjE
 L3AMC2NaKCMj7X7uVO5kBBhJ7c0kbNhmlPHC39YDkc2zk1CpRo4a+dgz/U7LHovKOrWtxLF1Umw
 Q3ePjoYHz+mohIjBl5szZMPQKTRnU5jtWWTOkiYga6dM6cX/QFpDT8a4cU/mWRQ0Hjx/2K/goV3
 lhTwZe1AubGVvRgFZZ3Fd7gB7AVgz3VDRzAmfxsgaSBUDWu/4aYw11pZhcdx3/1q0dwTyKHFzin
 rlq+yMf4FqgbAyU6QoNnMFsxps3QOsleqBnW4E0wGsxWEoM6NWnSx/EX1lPNaLWwZ9qjX22uPcR
 4j6owsMTzWOUjiK1j48WLjuWjlIBz6cnq0nVh/sA/qWIlzr4WGCT/gbKDUXbDmgxIbko7Kr6VrZ
 iYG8n0jleGhzaBObcQWYIhcQp0/fO+4bYKH8CO0YblEX/WO48+Ohs5ZSpkikRmCbl3h3iAmQlLk
 8NHdSEKkftqwZKPvh6w==
X-Proofpoint-ORIG-GUID: wLTvqhnOyi9YMhclmgyP9prPkAKBn-nm
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4OSBTYWx0ZWRfX69QvEiN0IDSI
 ef3Wjx9y91AgSIvjfFmmz41z8oSEph07ygiEF07M2fHEJFipzwHZ2qO13r3WL1LQwouiciIlDXB
 siuPDekzOVkUlDwzFeU2wE6ke5sNodg=
X-Proofpoint-GUID: wLTvqhnOyi9YMhclmgyP9prPkAKBn-nm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100089

arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
arch_freq_scale when a CPU enters idle. This bypasses the sft_data
pointer check that topology_clear_scale_freq_source() relies on.

As a result, even after calling topology_clear_scale_freq_source()
with SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling,
the arch_freq_scale value can still be modified by AMU counters when
the CPU goes idle through the arch_cpu_idle_enter() path.

Add topology_scale_freq_source() helper to check whether a specific
frequency scaling source is currently registered for a CPU. Use it
in arch_cpu_idle_enter() to verify that AMU is the active source
before calling amu_scale_freq_tick().

This ensures that topology_clear_scale_freq_source() properly
disables AMU updates in both the tick path (already handled by
topology_scale_freq_tick()) and the idle path.

Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
Signed-off-by: Sean Wang <seanwang1@lenovo.com>
Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
---
 arch/arm64/kernel/topology.c  |  3 +++
 drivers/base/arch_topology.c  | 14 ++++++++++++++
 include/linux/arch_topology.h |  1 +
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index b32f13358fbb..cae5da68d5ec 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -173,6 +173,9 @@ void arch_cpu_idle_enter(void)
 	if (!amu_fie_cpu_supported(cpu))
 		return;
 
+	if (!topology_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
+		return;
+
 	/* Kick in AMU update but only if one has not happened already */
 	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
 	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..dfc2574a5588 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -127,6 +127,20 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
 }
 EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
 
+bool topology_scale_freq_source(enum scale_freq_source source, unsigned int cpu)
+{
+	struct scale_freq_data *sfd;
+	bool ret;
+
+	rcu_read_lock_sched();
+	sfd = rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
+	ret = (sfd && sfd->source == source);
+	rcu_read_unlock_sched();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(topology_scale_freq_source);
+
 void topology_scale_freq_tick(void)
 {
 	struct scale_freq_data *sfd = rcu_dereference_sched(*this_cpu_ptr(&sft_data));
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..803382f599a2 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -48,6 +48,7 @@ struct scale_freq_data {
 void topology_scale_freq_tick(void);
 void topology_set_scale_freq_source(struct scale_freq_data *data, const struct cpumask *cpus);
 void topology_clear_scale_freq_source(enum scale_freq_source source, const struct cpumask *cpus);
+bool topology_scale_freq_source(enum scale_freq_source source, unsigned int cpu);
 
 DECLARE_PER_CPU(unsigned long, hw_pressure);
 
-- 
2.25.1

