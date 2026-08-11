Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0E414A09
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455416; cv=none; b=XH8SbhzqYmDu7JhafWIujyARhIDxlGB6lSxF4MhM+qKKES6gHKhZ729HbwOXDXXea1oGx1HHNwY8SuUYdbbTd5AowKklo9+nfyEgAgAP426vIqZuNQLfEuhuAV9SjtBhhYhOtWoJRqA7MCAP+0kob8TPAsAwe1hf8wrQ6KUe72U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455416; c=relaxed/simple;
	bh=9GwUwcDp0cWDqPeRNSC1o7QWenpp9qsp8edoOzPBWBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y4XhYcctDrNoFmKxcnE5kDiVg9jxANm6TWkAtnRIgu0rxLx7a6hMhC+UgQ7WZJtdud9NgbyLjHAoYoNRXhmg2YshNleQjkbtOtPENnVuatnyQMs8k4OBzuC6eK53EKjFKDUWwarXg9lgOtYkJy6QJcj3+hKvWIn3kP1FKUZubAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yvro932y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=db8IvUtW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yvro932y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="db8IvUtW"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX7xV767044
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUCwiqYDeDo3DpzREtnih6+/Yo4qtRWcBfYiTDr4db8=; b=Yvro932yHqkvMT1m
	3+gCaZ2H59ADt3GeMp951oEZozTD//PaugBhwBC5YHps+vot4dybaDHKPB7y78B2
	mIdif1PvSvf+WhdXlCXrBX3pQdjGwporE+eYCBwpCTMg4rhK/XvcKD0QBTyYM7I3
	X1JhrLeCQjeRYwdC/oe4MFajOFLW86RDgGWKwQuIf4O2TkSiThJI80374k4t14GH
	Hy/JEzyEk6wGjL2EZB3ZIl8azAKw+53oZSRC8Spa0t4/msi7jFaAP83T2kr7c/YP
	74D15u1vAHGPkQ7vs2Qs8wMgTy21OkBER/mlD9PVhZGZrP78g/RhgGtrWHuW353b
	YCskTg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0r2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso707106a12.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455398; x=1787060198; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oUCwiqYDeDo3DpzREtnih6+/Yo4qtRWcBfYiTDr4db8=;
        b=db8IvUtWUxBHAbL/SYuw82dqcc3jh3hG3kAC3TdxCi9smxHQIG7O2glbcZOyns9q43
         KnTqm6kGDP9b7zyvPHYIw67FwbGWZCkQ6fSFof4ngGdEqHhiElfheq/lvQYi4afQTRHQ
         yKpR/cDyod9NtlTYR/FhLx6tSHwgAEa7MBVaE+zRfBlpjaUVT4MacrxDRFMMjwfPA0Rb
         BnyPUfOPEMc0hVtkGi+/Mafw0v0TKadGQryt9Vqu4h6WLjxiLyYgOzzgAgr+xObhV6hm
         IWa0f0BXTTZwzwI6d25vNW2kS6e1EPFS0F6QcSNyVBsAPkk8KEiI7wi7cDoInfzPCu53
         YgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455398; x=1787060198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oUCwiqYDeDo3DpzREtnih6+/Yo4qtRWcBfYiTDr4db8=;
        b=PaEHKCBc2tLC24ujlaC1Ge6U/wry2MI8lVmERi9mLlpA/qH8oJxgm7s8RCR+irNlqK
         5oMxgia2HqMVVMGgsmVg/4Wu8w1sx1HRfUzBjJFvYystB11wkzu+lItbyr7cjtYOcXoc
         ywCA+2ORYg6JSsr/ve+3quDyyjgIrhvaiac+rY0I37jejYTexce1ZwntPt8tBdzLR1KH
         hpFy30Krzg/bh9lXTLdOLrz0CVYaAfrJ/E6O62jdO8DVB01WfevpfF7Y8N5Oi0OdakzM
         zvcP/h6+6zAPhLSr/DzDwn6lVm+p9C23fphJPHdnE9/w1FnCc+TLVKJVGzmKlyqcROcq
         UbBg==
X-Forwarded-Encrypted: i=1; AHgh+RqCmMWa+V5vlbf1eudLM32mAYXezCRPJObqg+UdoXNSkshTHtPvFDNKUsJfWIggETYKw1NXRdLqGpRqQw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0yH2Y3i8gNEXAMs1ugBinuJ5jSaBWIH6JXLOauEaEqeySuYbc
	N732HPZtkLrL7jeyaECjQA3UDYZErSYjlTwJGbe3rnMrx2Y6v6SRhQ4Rd+4qiuk2ttvus1z22/j
	E1053lWweOoQp60YGSSv/N4A+cNOnGvpfuZzPkCLDxYXfjf74MVFrqp815qXMdeKr0w==
X-Gm-Gg: AR+sD12DNMvTnTWDGiM78YSFZyJlBYbkREJcf519SK53mkQ0AZa1IzcI5MGWcUBJn+J
	2V+iCHBU70Wkue8vwF3Wcbg2fJQPsKQlqst8ekatzZNertbneU1j2bhXP2OOCscxd3q6AWd+CdY
	V/DCuTM/qPcZdbEmDudbKkQtfospm1g0VXiB1vtUMzCjJnMb8ZG/uHg/YMX1kHGgYAiUckuDtUT
	rNiSlnOnfXIj8lsYXHwNXnNK5m3RBuyfKlQUBeaI+YMq4NEsB8+IMbXal/x9ohbMsQKTHCAWfrA
	AXphRyQl/GoPs+nMMCzEoS7jJY5n2uE0sPYz+4n5ZEKOiR2+c2/RhOwmPKMmbTY1xMcvSTgZ8U6
	5KtE6ePCPqG6YpjW8qrCLmAhjQ6jJ/X8mw5IcfdJZrj23v1N+M6Ot7/gY
X-Received: by 2002:a17:903:1b50:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d32da4e721mr2351285ad.9.1786455398008;
        Tue, 11 Aug 2026 06:36:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b50:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d32da4e721mr2350165ad.9.1786455397461;
        Tue, 11 Aug 2026 06:36:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:37 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:32 +0800
Subject: [PATCH RFC 03/15] arm_mpam: Add device tree support for MSC
 probing
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-3-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455319; l=10154;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=AIVi958hb81+X2XXSx6u7qKrjD/Y0gF/f2A4aVpO1ek=;
 b=ORemnfVeCvtL4ULCuUmX6ypKtKVB807gbq6pY1leXIdClYwxfOjqVHk7u7/pCuRso8hPJfwlk
 i20w8+SYdoNDwXxKa6eLAsOAsiWDPtxv6Tw4VRw731kXCjZxhmF5nfl
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX31uisLrPButk
 54gSs5kpLw+XMZ4YTx2QW/j0AQnJQii5OZ1xqKwLvq5I7l59Gn7eZAR+azwPDmPMYh5VU4m23aq
 0hEwPuvcWEwqnd72zltNfshlfs3eKh4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX60amx7MT0qHx
 5nXB720kf3PfnyUSJhIErT8+NXjqbFCfvg283mGRwmEjlOdlgrvs3fLvTuGxayDuowCab+ywJ3r
 yRZ+kGd0ndwop9OKAQVLSOcVPmrfHFJUBs8Qc1sjdonRwwy+BBh/smr9t7t0CfJvg/gTh6yVnyv
 H+RAO8vYsTgQpFtYjiEYTGVifAjf7zLirM3HD8BDE72ud5JyiZAyD81SdudBEKyeewT6KPL+Zp1
 3Kgs6KXXSO8SsZfhp49Dv6TnYL26vta9YbKInU/AorYKrcIdISg5Z88s+I/jABFS0gr9xD/6MB8
 xN09KxyLFYHXw+0519E3OFEuHgQuMH8UBDO4VP1+3K9xRkK544zzU4AnF0J/iPetNKz8yuEiPSw
 /91SulNV2PekODO5ayHq5twJ76czQ7MU4jCzxlUlIabQc//REXx4k1BAkuZ8C0pDJNgySUQpwK7
 QYpg6qFO2IdOY395H1w==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b2567 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=EV56-oaTeUzE4PAi_sMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: r21FwYqDCHBP347PORdVgMikqHeesXax
X-Proofpoint-GUID: r21FwYqDCHBP347PORdVgMikqHeesXax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

From: James Morse <james.morse@arm.com>

The MPAM driver currently discovers MSCs only via ACPI. Add a device
tree path so MSCs can be probed on DT-based platforms: parse MSC nodes
from the device tree, compute cache-id and affinity from the cache
nodes and create the RIS entries.

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context conflicts; drop the existing ACPI-only stub of
  mpam_get_cpumask_from_cache_id() which conflicted with the new
  implementation that supports both ACPI and DT; fix
  update_msc_accessibility() return type conflict: drop the existing
  void implementation and apply the int version from this patch ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 256 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 238 insertions(+), 18 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6f2854fe08ca 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -20,6 +20,9 @@
 #include <linux/list.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/srcu.h>
@@ -161,6 +164,163 @@ static void mpam_free_garbage(void)
 	}
 }
 
+/* Called recursively to walk the list of caches from a particular CPU */
+static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
+					     unsigned long cache_id,
+					     u32 cache_level,
+					     cpumask_t *affinity)
+{
+	int err;
+	u32 iter_level;
+	unsigned long iter_cache_id;
+	struct device_node *iter_node __free(device_node) = of_find_next_cache_node(cache_node);
+
+	if (!iter_node)
+		return;
+
+	err = of_property_read_u32(iter_node, "cache-level", &iter_level);
+	if (err)
+		return;
+
+	/*
+	 * get_cpu_cacheinfo_id() isn't ready until sometime
+	 * during device_initcall(). Use cache_of_calculate_id().
+	 */
+	iter_cache_id = cache_of_calculate_id(iter_node);
+	if (iter_cache_id == ~0UL)
+		return;
+
+	if (iter_level == cache_level && iter_cache_id == cache_id)
+		cpumask_set_cpu(cpu, affinity);
+
+	if (iter_level < cache_level)
+		__mpam_get_cpumask_from_cache_id(cpu, iter_node, cache_id,
+						 cache_level, affinity);
+}
+
+/*
+ * The cacheinfo structures are only populated when CPUs are online.
+ * This helper walks the device tree to include offline CPUs too.
+ */
+int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+				   cpumask_t *affinity)
+{
+	int cpu;
+
+	if (!acpi_disabled)
+		return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
+
+	for_each_possible_cpu(cpu) {
+		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
+		if (!cpu_node) {
+			pr_err("Failed to find cpu%d device node\n", cpu);
+			return -ENOENT;
+		}
+
+		__mpam_get_cpumask_from_cache_id(cpu, cpu_node, cache_id,
+						 cache_level, affinity);
+	}
+
+	return 0;
+}
+
+static int get_cpumask_from_cache(struct device_node *cache,
+				  cpumask_t *affinity)
+{
+	int err;
+	u32 cache_level;
+	unsigned long cache_id;
+
+	err = of_property_read_u32(cache, "cache-level", &cache_level);
+	if (err) {
+		pr_err("Failed to read cache-level from cache node\n");
+		return -ENOENT;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0UL) {
+		pr_err("Failed to calculate cache-id from cache node\n");
+		return -ENOENT;
+	}
+
+	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
+}
+
+static int mpam_dt_count_msc(void)
+{
+	int count = 0;
+	struct device_node *np;
+
+	for_each_compatible_node(np, NULL, "arm,mpam-msc") {
+		if (of_device_is_available(np))
+			count++;
+	}
+
+	return count;
+}
+
+static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
+				  u32 ris_idx)
+{
+	int err = 0;
+	u32 level = 0;
+	unsigned long cache_id;
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+
+	if (of_device_is_compatible(np, "arm,mpam-cache")) {
+		cache = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!cache) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+	} else if (of_device_is_compatible(parent, "cache")) {
+		cache = parent;
+	} else {
+		/* For now, only caches are supported */
+		cache = NULL;
+		return err;
+	}
+
+	err = of_property_read_u32(cache, "cache-level", &level);
+	if (err) {
+		dev_err_once(dev, "Failed to read cache-level\n");
+		return err;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0) {
+		dev_err_once(dev, "Failed to calculate cache-id\n");
+		return -ENOENT;
+	}
+
+	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+}
+
+static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
+{
+	u64 ris_idx = 0;
+	int err, num_ris = 0;
+	struct device_node *np;
+
+	np = msc->pdev->dev.of_node;
+	for_each_available_child_of_node_scoped(np, iter) {
+		err = of_property_read_reg(iter, 0, &ris_idx, NULL);
+		if (!err) {
+			num_ris++;
+			err = mpam_dt_parse_resource(msc, iter, ris_idx);
+			if (err)
+				return err;
+		}
+	}
+
+	if (!num_ris)
+		err = mpam_dt_parse_resource(msc, np, 0);
+
+	return err;
+}
+
 /*
  * Once mpam is enabled, new requestors cannot further reduce the available
  * partid. Assert that the size is fixed, and new requestors will be turned
@@ -481,16 +641,6 @@ mpam_vmsc_find(struct mpam_component *comp, struct mpam_msc *msc)
 	return mpam_vmsc_alloc(comp, msc);
 }
 
-/*
- * The cacheinfo structures are only populated when CPUs are online.
- * This helper walks the acpi tables to include offline CPUs too.
- */
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
-				   cpumask_t *affinity)
-{
-	return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
-}
-
 /*
  * cpumask_of_node() only knows about online CPUs. This can't tell us whether
  * a class is represented on all possible CPUs.
@@ -1985,17 +2135,42 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  * corresponding cache may also be powered off. By making accesses from
  * one of those CPUs, we ensure we don't access a cache that's powered off.
  */
-static void update_msc_accessibility(struct mpam_msc *msc)
+static int update_msc_accessibility(struct mpam_msc *msc)
 {
+	struct device *dev = &msc->pdev->dev;
+	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
-	err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
-				       &affinity_id);
-	if (err)
+	if (!acpi_disabled) {
+		err = device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
+					       &affinity_id);
+		if (err)
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
+		else
+			acpi_pptt_get_cpus_from_container(affinity_id,
+							  &msc->accessibility);
+
+		return 0;
+	}
+
+	/* Where an MSC can be accessed from depends on the path to of_node. */
+	parent = of_get_parent(msc->pdev->dev.of_node);
+	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	else
-		acpi_pptt_get_cpus_from_container(affinity_id, &msc->accessibility);
+		err = 0;
+	} else {
+		if (of_device_is_compatible(parent, "cache")) {
+			err = get_cpumask_from_cache(parent,
+						     &msc->accessibility);
+		} else {
+			err = -EINVAL;
+			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
+		}
+	}
+	of_node_put(parent);
+
+	return err;
 }
 
 /*
@@ -2123,7 +2298,10 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 		return PTR_ERR(msc);
 
 	/* Create RIS entries described by firmware */
-	err = acpi_mpam_parse_resources(msc, plat_data);
+	if (!acpi_disabled)
+		err = acpi_mpam_parse_resources(msc, plat_data);
+	else
+		err = mpam_dt_parse_resources(msc, plat_data);
 	if (err) {
 		mpam_msc_drv_remove(pdev);
 		return err;
@@ -2136,15 +2314,51 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct of_device_id mpam_of_match[] = {
+	{ .compatible = "arm,mpam-msc", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mpam_of_match);
+
 static struct platform_driver mpam_msc_driver = {
 	.driver = {
 		.name = "mpam_msc",
 		.suppress_bind_attrs = true,
+		.of_match_table = of_match_ptr(mpam_of_match),
 	},
 	.probe = mpam_msc_drv_probe,
 	.remove = mpam_msc_drv_remove,
 };
 
+/*
+ * MSCs that are declared by the firmware as being part of a cache may not
+ * be created automatically as platform devices, since there is no
+ * dedicated cache driver.
+ *
+ * Deal with theo MSCs here.
+ */
+static void mpam_dt_create_foundling_msc(void)
+{
+	struct platform_device *pdev;
+	struct device_node *cache;
+
+	for_each_compatible_node(cache, NULL, "cache") {
+		struct device_node *cache_device;
+
+		if (of_node_check_flag(cache, OF_POPULATED))
+			continue;
+
+		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
+		if (!cache_device)
+			continue;
+		of_node_put(cache_device);
+
+		pdev = of_platform_device_create(cache, "cache", NULL);
+		if (!pdev)
+			pr_err_once("Failed to create MSC devices under caches\n");
+	}
+}
+
 /* Any of these features mean the BWA_WD field is valid. */
 static bool mpam_has_bwa_wd_feature(struct mpam_props *props)
 {
@@ -2963,12 +3177,18 @@ static int __init mpam_msc_driver_init(void)
 
 	init_srcu_struct(&mpam_srcu);
 
-	fw_num_msc = acpi_mpam_count_msc();
+	if (!acpi_disabled)
+		fw_num_msc = acpi_mpam_count_msc();
+	else
+		fw_num_msc = mpam_dt_count_msc();
 	if (fw_num_msc <= 0) {
 		pr_err("No MSC devices found in firmware\n");
 		return -EINVAL;
 	}
 
+	if (acpi_disabled)
+		mpam_dt_create_foundling_msc();
+
 	return platform_driver_register(&mpam_msc_driver);
 }
 

-- 
2.34.1

