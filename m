Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BE0428475
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378824; cv=none; b=umb5bnakikMIVpIKLUBJUVeTbFO9pU4BgSTwllUrQgYgVHCwFlW2ILTvzmRNc781ie9kxMjx0Lj6aVf97PSntYRywXJL6J81y2KhM73TflaZ18Vsqq7XsMoX0Vo2OG/p2RmVFez+pKr+TtKEs2DVZ+BRp6q/k2LeOcCaMLZMtmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378824; c=relaxed/simple;
	bh=QnBi/UGDsxqyOz/1fRBQGHMXTdCzbXKx2F6q52cJQpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mKKQ85fBJw2dWYwFib30QnVFVpVFNG8IR/iqku0VY7UEorMlt01OaURcIEbXMAAsrrrgHnTP81L3LhWZR6PDb1MKoKb8FPkpQ9iT0zXn55741O3oMCHxBSzx9ELO6xD2pDEIS7Ux9ycVfTeKXtKxd3lklkJBPtw7BInB1tFN+oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmH3qdeL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwGvH3zM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmH3qdeL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwGvH3zM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E803TK3490518
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9cD0JXX8OKU/IsVaFbZJY79RcROcfNSM94/DgawiLE=; b=cmH3qdeL6w9I3sMo
	RCAdIaxkDYxiLcjHsi1Y4f56PpegsPvEhDicbwJ0ASSp9GIdYYflnzWCpxAGx/YL
	KY5AI6cymNIalqfamOYsVv/sdYbaFBYjDLj5v7B+WYo6yRFMbstrG6DKBO1cnHdh
	NoA+WUvvpxxxWWe9Z6Wg0ytK5OvjlH0b6kp2Vq+YCK9y8hqjCIOQq23x0O19/bft
	1W/rswoXtbjHKkuC4yVL8xDvE13IXeL30b9fWlkW1jM/6+T80F0qMQf0MyfBlg0Y
	TGw0adx3XccJoqD8yUcE09X7Fx78BgWwO2KQwLx8BmSTwU/eRRe1XqZ5axD/Zq6x
	470hfQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0b5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de1f85cb2so932078a91.0
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378819; x=1789983619; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9cD0JXX8OKU/IsVaFbZJY79RcROcfNSM94/DgawiLE=;
        b=NwGvH3zM83fF6TRCntq7Byw0ury/50hdEcXVQWM8eIl8jJ4QPUJmramXq0T5EBLNqg
         Y2WH/eXlp5sMCN+3FT8Jj7mWowk3LjSnY1TmBjfNPD2HXMnhAmqo9YrDi2MWTnlq0fjf
         NGi2YniMtQPIRzOvMsIulf7wvaT3WB2LeqUKGuIwbDSfSBpDQ2kEQLvCvF9algOlIPAF
         YUhNNvuXC4LHCh3GSl5Se/SJAb8GbNmJ2gjCeCCjq+KWpU3rjkjzOF06eKlQVldg1SXP
         KuuwgMovIBUb5QWvM8bXnVga0jsw7XtH4UUz2B8k05l5WABbQ6v3xv73nIAMUnVdphuA
         3ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378819; x=1789983619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9cD0JXX8OKU/IsVaFbZJY79RcROcfNSM94/DgawiLE=;
        b=NN402E13/61V0hlFvRihu8lNAs9kfwif7VTMDM7+CtQGuGyhhZLYDJUSeigp3mHTsK
         bjLRvdxFZ/Ji91wRSufcxmY8wNNQQI0JhP+tzfJdH+/M0mLPhREEfnWWmQniLVKRuQ9g
         fqhXi/9PbTJ3PFM5FH/ZZVCDI/BfaTUMwVjRbhcI2GLDH3frne0Ku/LuXvLsZ2AT4Ypg
         BGmRcBAAaRReceTlmyKnTfFq1mrSL5s2x5vhGi8f6qFOqom3h3JfcKMVvB+OKjrjuUGT
         8UaPS4TegbQFmdeRUbklJInuZLA3bt3Do0xBR1IFiINPCaCMAVo7E3ukfpNwJ+KQTHk/
         /YXg==
X-Forwarded-Encrypted: i=1; AKwUvBwhIdWFgb7rwr6J+I+9G14zHYgIo1rp2md9fW/wmEq3JOZIqJ512KgvHdWweMjbE9BQPoR7MW0clNzDfg==@lists.linux.dev
X-Gm-Message-State: AFuF++nY2Orrg5FjJC2k+z85n0zISJlu+zNbBTXrsiVtkxNwS+J5Qc9T
	Z5/BLCwQ48/JB2xAqfXCjotN7fTn1FH0SoEHhJnb72myF+/qIzSzPjzm+Y+HWiWSsEUgK/Vr3PK
	/UUKDYEQLo686Dfk4x031Xcvm3qLS7HiUFfX0XX6bHYaSosNlVAMSWfzWmTt6RhMBXQ==
X-Gm-Gg: AYBFou1wAV2PR4r7wBpsWQyclXlyODxfWe9S2sfEXgZze8C+TqH97+a23IG0zEmmidp
	J7ntVS8PJXgFWtdiUI4mruVGOXzP9JUGjQ88hqsKrJq/7ieQJcaubaMUwtp7Wt37UN0+ArZsjZJ
	KnWggsZxqQgI6rEhCDVc5fq6AwuGUAaPXySLWWX8vynXTCvNgG9SXBa7ZCiAwDLX/V9IfhPGDqO
	C7ZJDpud8FiWzeNV5vtPHYvZLoqeJ3+xLEPKiEGVRUpUo3YRpCNVS6C3KeDrS+OGh6TAqIb6E0t
	MvUoef27QA3qS0SH+X6TAo+bR7g2Do4rCTCWL05DQTvfLVFahOxt9VwpA1sijVpSP/9jwvo+t+i
	IKtpImwArzkw/hk1PYeGfgbnf3fiZ/uARWQjczl+um1tJ5137xj/SgndV
X-Received: by 2002:a17:90b:3ec8:b0:39d:f351:8f0c with SMTP id 98e67ed59e1d1-39df351afb2mr1213614a91.13.1789378818336;
        Mon, 14 Sep 2026 02:40:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec8:b0:39d:f351:8f0c with SMTP id 98e67ed59e1d1-39df351afb2mr1213553a91.13.1789378817677;
        Mon, 14 Sep 2026 02:40:17 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:17 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:53 +0800
Subject: [PATCH RFC v2 05/10] arm_mpam: Add device tree support for MSC
 probing
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-5-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378763; l=10822;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=BcWl24kUBo4jlXFvaZjSoBg9s5oXMsoQB5GA5ArXSw0=;
 b=GfZGzJQQgYFsRrmmOz4w7923BaTZu6EWN2viQbE8Y3Xh0muuEF6CpzkAtZhGx2BqBUeVOX4OG
 ap35yV4OwNpA7JF01hap0OV7PxEW1WbzmEpoeEaS5MXY5p3rs+zAht6
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 2JMHPitPwgzpAcs0kNcgAzPElhvhN0Eb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXxT2apiH8tFwh
 vRaRPb+4xPbOKlm7u/NOH0WJ7Rzvwh52URdkMK8Lgu+HM0w46t8R8g0Pcf2I1AJqVcx32joyqAg
 4JsmFlEg24aGKbmVg234ZW/Rm0ibqiE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXzV+VmtUUt+cM
 95CKht5HrO7Wu0Uy+Af05yjBKZnEZ8WUd3GoXYqcWT8t2jFAta7q4LtwhOvu2fLh038RzbmFw7k
 F1V+UVP83SxxHTEUk0y9BgkjQuYMkYqTw47rUc/4uKDD5hjjV32JSB1wDnqqa49Zf9b3yJiqZX4
 cpwya2VHnVWpySPz5rs2d4/OvO9bDtjIhJmWJCbyXW9+xckvS11dtPJ7h0OGs1l5Ve1QlkbJ9Fx
 j3ejTBorCxWIvrZzy6iIW31/2q8+V+hJJ836L+KHVw/nDrajeVPHqSqRVaQKC0VzqDpjZTogf7y
 HYny6EN8gxRmZ7jWwqA10N5YMtcA8CIzKNMYR5hvKLs9JaIBUbhXd7tjBXN7YlzZ3maUHD7WRsM
 NTeNjVBWq4heltpD7FtzPLpsyhG6HgCjPMNEnpxx4IvjGSVxhNoRKTJ8i6Y8F8KRFQys0ZxZSMb
 irDHqNySgGX8QajKQ5g==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7c103 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-Bf8dWPtDk6FBw2lJ3EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 2JMHPitPwgzpAcs0kNcgAzPElhvhN0Eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

From: James Morse <james.morse@arm.com>

The MPAM driver currently discovers MSCs only via ACPI. Add a device
tree path so MSCs can be probed on DT-based platforms: parse MSC nodes
from the device tree, compute cache-id and affinity from the cache
nodes and create the RIS entries.

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context conflicts; drop the ACPI-only stub of
  mpam_get_cpumask_from_cache_id(); use of_node_get() for the cache
  parent to avoid a refcount underflow; reject out-of-range ris_idx
  after of_property_read_reg() before narrowing to u8; use u32 instead
  of unsigned long for cache-id values and compare against ~0U ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c  | 256 +++++++++++++++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |   2 +-
 2 files changed, 240 insertions(+), 18 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index c68135ee0ffc..7a5b27e87759 100644
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
@@ -161,6 +164,171 @@ static void mpam_free_garbage(void)
 	}
 }
 
+/* Called recursively to walk the list of caches from a particular CPU */
+static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
+					     u32 cache_id,
+					     u32 cache_level,
+					     cpumask_t *affinity)
+{
+	int err;
+	u32 iter_level;
+	u32 iter_cache_id;
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
+	if (iter_cache_id == ~0U)
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
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
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
+	u32 cache_id;
+
+	err = of_property_read_u32(cache, "cache-level", &cache_level);
+	if (err) {
+		pr_err("Failed to read cache-level from cache node\n");
+		return -ENOENT;
+	}
+
+	cache_id = cache_of_calculate_id(cache);
+	if (cache_id == ~0U) {
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
+				  u8 ris_idx)
+{
+	int err = 0;
+	u32 level = 0;
+	u32 cache_id;
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
+		cache = of_node_get(parent);
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
+	if (cache_id == ~0U) {
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
+			/*
+			 * ris_idx is read as u64 but indexes a 4-bit RIS selector
+			 * (0..MPAM_MSC_MAX_NUM_RIS). Reject out-of-range values here,
+			 * before it is narrowed to u8, so a large value cannot be
+			 * truncated into a valid-looking index.
+			 */
+			if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
+				return -EINVAL;
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
@@ -481,16 +649,6 @@ mpam_vmsc_find(struct mpam_component *comp, struct mpam_msc *msc)
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
@@ -1987,15 +2145,34 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
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
+		return;
+	}
+
+	/* Where an MSC can be accessed from depends on the path to of_node. */
+	parent = of_get_parent(msc->pdev->dev.of_node);
+	if (parent == of_root) {
 		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	else
-		acpi_pptt_get_cpus_from_container(affinity_id, &msc->accessibility);
+	} else {
+		if (of_device_is_compatible(parent, "cache"))
+			get_cpumask_from_cache(parent, &msc->accessibility);
+		else
+			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
+	}
+	of_node_put(parent);
 }
 
 /*
@@ -2123,7 +2300,10 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
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
@@ -2136,15 +2316,51 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
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
@@ -2963,12 +3179,18 @@ static int __init mpam_msc_driver_init(void)
 
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
 
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index def0e3a65c23..aa45d00bcd07 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -470,7 +470,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
 void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
 #ifdef CONFIG_RESCTRL_FS

-- 
2.34.1

