Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED792397332
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 07:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.152.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433369; cv=none; b=Ml2FW4KZpQiL+KLDxv51hzmlOH6BdZgQzrAEnNl+e/kF6QIwKJf9ctLEWbosHklN5trOxxZa/77/yHcgZBqVq0G3gjd1hYc9Mjo+PaaNvrJ0muxjE2DkF9A1dcvUnz6Wg/WFMZvSPwKthOrLdWNKjeh1ikGVtInpVA+XFeZhRj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433369; c=relaxed/simple;
	bh=YgJXtj+ttWC8fU1tKrmsMhnNUIjNR1vQc75lf9zCh5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a0jr/edxc+z7NYVtSlqbpNlnxK2n5YfWWcak6XOyIghOGqJcqVYLPxPzr679izB4j3CKhubFV3TAVcPgRwum0atZ3FLVarN4iZDflt5RzjPv/ElYTVMMmUmiicHjg0cZZwfoyAMwfdIE2KZpSadHWTmS2MP/Emv1DRhp/miO5Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=cFOpCwCw; arc=none smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="cFOpCwCw"
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6TDvI2971078;
	Tue, 11 Aug 2026 07:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=fLnRuJFuGdy1GtQKk507tGXhGl33M4FPQ/
	a27fnbORg=; b=cFOpCwCw8r3P7CuL/0tfsFI09L8Zfta4v5i0+puIuJYeMfyfvb
	A+qQauDUjnvEgkyTWCr5/N1pjj/1ZFSX5g85e3HRlUwqr9/2MoehSLWYEOH8b3IW
	gw/BjrPAPi5bP6BATMSeAgH2syWutGHbhGl3wFIaDefGn4uZvoHl4PvNJIyQ2Aq5
	7gXYrHea0EIpj5nHRQIgWfI7JfWv4bJu0ceoGpYGvjAyAzYDcx6oslnCO1ND4Uzd
	vpO5yVFZDAIeholpKrGwENt2m8OEDDktBpopucXzcwwEFkGfwg/rHjI+6L5Q22RZ
	wS0fPWedLy9t8iu+LfOUgmeQYaEn/04VL38A==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4fxhjeuqdp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 07:29:01 +0000 (GMT)
Received: from shelppfpol1.lenovo.com (unknown [10.122.146.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4hK3CH275RzltBPK;
	Tue, 11 Aug 2026 07:28:59 +0000 (UTC)
Received: from SEANWANG1-P5MFL.lenovo.com (SEANWANG1-P5MFL.lenovo.com [10.111.201.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol1.lenovo.com (Postfix) with ESMTPS id 4hK3CG40tVzYlvJs;
	Tue, 11 Aug 2026 07:28:58 +0000 (UTC)
From: Sean Wang <seanwang1@lenovo.com>
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
        driver-core@lists.linux.dev, Sean Wang <seanwang1@lenovo.com>
Subject: [PATCH v3] arm64: topology: add source check in arch_cpu_idle_enter()
Date: Tue, 11 Aug 2026 15:28:30 +0800
Message-Id: <20260811072830.10028-1-seanwang1@lenovo.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a7acf3d cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=faLMhqsB0ZTpFNi-tw5Q:22 a=icsG72s9AAAA:8 a=8k6WQxmsAAAA:8
 a=0sY-ZtaHpH0GsPKVRdcA:9 a=T89tl0cgrjxRNoSN2Dv0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA2MSBTYWx0ZWRfX3tjiwvZ/tgoK
 iIVNTWZTvh9FVCVnLc/BNHpvCUyGaA6ROC5s4Ebs2h6UKV3APklBzyhHHUB9aE2AE1JQBZUM1uH
 Pi2/HAjIeKcndFoXKlYs+vnhZD3N+QM3+Z1BR3mYUv0Gy45Md+mst76GOX49oSIMc0U9SkoaVwI
 qdysQ4PGpofzxjrYvnTPP041x4To+Y3mvwb7gBLjSDcMIEDl6NabrR6q138VsPrclF3AuxDIpqI
 ddNUymrjz/PmT9ablXTu0WjwhPsizGHAt7hk2pvLgzb4vBFWoL5TjcDIyobBk2aGuT0qY330bfB
 WifyG9/Apb10uBkuPyah+2f5w34rOIY6wyt7a4thdOCopOVCt+gquXoEr6AgwzLtRu9MsQUynbs
 bGv0AhoZuEWfFf5SyN9AWtEp4+W/2YTp9oV7rnw2beaWSr5iB3s3r30vBoJNj4xziSgFshvZ40j
 6kyiIBIDGAqxeOIA3Ag==
X-Proofpoint-ORIG-GUID: 5kO4fnpnN8YRkIyrhasUgr7GaUQz81Vp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA2MSBTYWx0ZWRfX6XJGNzJACbGE
 +ktM2oU+ehIv87RvJ8100i6o/LPqG6iy1mlxgCCOASaBSv3LGz5WgS+nRA52VyeHFmQmigAJcMw
 HIWLR+Womv9pzo0h/Ms3sT/pIOK94P8=
X-Proofpoint-GUID: 5kO4fnpnN8YRkIyrhasUgr7GaUQz81Vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110061

arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
arch_freq_scale when a CPU enters idle. This bypasses the sft_data
pointer check that topology_clear_scale_freq_source() relies on.

As a result, even after calling topology_clear_scale_freq_source()
with SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling,
the arch_freq_scale value can still be modified by AMU counters when
the CPU goes idle through the arch_cpu_idle_enter() path.

Add topology_is_scale_freq_source() helper to check whether a specific
frequency scaling source is currently registered for a CPU. Use it
in arch_cpu_idle_enter() to verify that AMU is the active source
before calling amu_scale_freq_tick().

This ensures that topology_clear_scale_freq_source() properly
disables AMU updates in both the tick path (already handled by
topology_scale_freq_tick()) and the idle path.

Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
Signed-off-by: Sean Wang <seanwang1@lenovo.com>
---
 arch/arm64/kernel/topology.c  |  3 ++-
 drivers/base/arch_topology.c  | 13 +++++++++++++
 include/linux/arch_topology.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index b32f13358fbb..1dbd8f4c3178 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
 
 	/* Kick in AMU update but only if one has not happened already */
 	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
-	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
+	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)) &&
+	    topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
 		amu_scale_freq_tick();
 }
 
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..6049e77bbe1d 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -127,6 +127,19 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
 }
 EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
 
+bool topology_is_scale_freq_source(enum scale_freq_source source, unsigned int cpu)
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
+
 void topology_scale_freq_tick(void)
 {
 	struct scale_freq_data *sfd = rcu_dereference_sched(*this_cpu_ptr(&sft_data));
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f96..fb7c1fe74808 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -48,6 +48,7 @@ struct scale_freq_data {
 void topology_scale_freq_tick(void);
 void topology_set_scale_freq_source(struct scale_freq_data *data, const struct cpumask *cpus);
 void topology_clear_scale_freq_source(enum scale_freq_source source, const struct cpumask *cpus);
+bool topology_is_scale_freq_source(enum scale_freq_source source, unsigned int cpu);
 
 DECLARE_PER_CPU(unsigned long, hw_pressure);
 
-- 
2.25.1

