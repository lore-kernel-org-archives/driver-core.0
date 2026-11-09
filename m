Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218877;
	b=o7NGb3I2mCqA62yX3gpd9LacaXKqHub1n/2Gz9QRtCExIiOwjkTUdh5goWDdyEIl7Nzd
	 AhgXf4KPdsKxAPsXO6ZNNRz0XEcis7ANw6v6emVa6uofhRt80P/UVNtB+bTt5lPpDZ9Zx
	 hO0SIMIzkjoNm9jH9GKnBNIsiJV+jQ3N4YQckYtytrGibOXzTPk2tXuJ2GCzaaKS3C95z
	 GU2+t9+mBoUdVnWma2NQfKxJ7RrjFXTSiRRjEko4UPtoNS/7rEqDExap31boSkHwlOwJ2
	 mVsAnPax7v+nC4Bxw34hl+YR/eLd1YIyZlkZjFJdiZwJh5ODNs4nawM3rub5h9ddt6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=;
	b=lIzB0AXRnXZVkLe+DGJ53MZ9f+uglz9HVkWzPHr3BOHe9Lozav48cAhwaetIx8kL7pax
	 +sU6t4w55cU27X4tfsE9YIY94fqkvzLyyHJjkhClW8JPlanVwhq+gIqeRgmMx6KnqT82a
	 PxQPYwxWUetHA9+5uE+tAh/N6YyvSRoBHUFjr5h/+70gCMf0gbosA97wlmeezTEusKOEy
	 XjWOVxXN97osktamFlr8MvmKISfbTV8+pqc1cSqO0IXegllsFLizx2Rmbl23Vyu0Q7rk9
	 J+RKWU6rKe1nb4TZc+fatzN6ovKV0BBRR2Yky9U15VsKJVuMIPTU9JeI1/l86WUuHAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUgCcZ1Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoXBQQBK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A526082BCB
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 10:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A526082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mUgCcZ1Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoXBQQBK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vDKV4107887
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 10:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=; b=mUgCcZ1ZRWoKvmHO
	j/Fm5YaB3IJT5WlIYk8idCUh0iMklsVJ1rv59FcS7XRV41k91hpDwOLKyVzAZt3p
	Hlw4kS2TpwDDRUZQK/2tvRwhOazkHNlHkCpeuLopG1uSeTQxmS/fKx2FWdv8nR2T
	fvV82pQX7JpE70T4pGSzQh3DKk/BqxElC/w/P1D3JwXzFW6P17GtiKTe2x0maBkl
	iH7zHB73rB3D4RgtSrQv4sisXwU/TT//s4l9Vv/ASgUlkxm/DHo/+ipajS1/iEF3
	z0a1pRYQ0cEDNLB3lQCa+ds7670p3AOHd3DQyAEXZd+SNRvlMpvrXZ6jf0bGvqoR
	BCK8Qg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx81w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:07:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso573326a91.2
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218875; x=1794823675; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=;
        b=UoXBQQBKjpv743DQuu4hipSapDlaIVBbemKGAPUgPbINW9k1UxVtR59Dj780VrTL4O
         QYh0/UFR7OBFrV20qiT5CYS5ze9M0gyf5K5KH+cYOJV60B63Nqou5LjhnFaTzBQYy/7t
         TWiAw/BbZYoc3uYUY1DOXnXM5vAUYjYSWZjB9vdh+TbKf/oFwriEWYkAJ5DnI70+u4ni
         1PWAn4LXquB6MjG787Vc6/ybqKLYS72pnNY+ajABl7uq7iYpe/1afch6A0SvcK95AU6R
         p51/8czUedIvkCs6y8JMIpsee+0u9PiTfe5VMvlKc/euEieOOrtI5wxhCbYNfYCNOLPR
         1Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218875; x=1794823675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V5PvQ547tCbmN/8YeX1jE2VPCAQUuSRfUS1P0am1dBo=;
        b=WSOMbNQbgxhdMJgwG7gumSxqBCLJ/+Na9gT6IUbYoy7RytOUxWYEAMwRJo+ifPgthm
         s2HvO97zvXnUbWxKMHNdGAwCQVf8AIpU4qlEor7EKh1qGjuq5wgkMAHCoB10mGht//9E
         8Ewl0Q3z+9vLj3va+UFeLVJeUf5eu6gWmgAcnJ6M9D6rlv6ZEUiCXXzTj4jCY6kuaemV
         U+9n0fIo4VUtpV5DfU8kuze6DyH6VbMUiHAFojMr5JnuzfZoi9mzbcfN5/k/a2klqBQm
         jbOmtTb0Jo0blofBTc7O4Sf+78jYm29X0ljLhhuH/MTvfjl4VNmpUywgB7KV9pe48G7l
         UWUA==
X-Forwarded-Encrypted: i=1; AL+hErGS27hbIcSd6WR0EXs/TI9mG23bFfI6rxNHW97wraRmZXjBmK5mVyM5rNnQ6RNousResqSy6wfgbExA7A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9E5hP3ti2R45YkFc05Z9B4fBt4GH8SfaLYUx30SWvI8Z1M11p9
	x+mXsD9G0JLANzOJzqocW6DIcTW5c6DVT50FRUWICu6PpMW2MsRV9ne5AloIVPj9DUvdXzrHz00
	DvYXWDcceVsheYhhvE4dqiH6HxjRRTCZH08ULmV8N/XqQfNdmUB6P+MLE+ASch6HvLw==
X-Gm-Gg: AYBFou2P9EzExcEX8wjpSWaCsc6579iz0WrhuOKqaPuSvZ4hI/e0zakJXeC82tFty1g
	rnhIAR+2tXEZsZsp8wbx+rbcVFtfJd3G6W0laVU+uotsY/dU2SPEdD0xUSG7MI8iDJBKwGiiMnZ
	K4T9h7jIfd+407XGtS4R7e2UKWLMD6Y2hRv/VPZtIDjk6YjoRoujX+8ClPEBhuUpja6SsaggrTv
	osgL9z3qlg58XrFk6GTLL5k7UaCaG+c0TpCaqJB5CVNVVp2lNjhnu4wvLzE2J85fT4wZuSzjtpx
	DlNQ2XKbd9K/K6MpP1p2EdiS8nEZjUTxPaYVeKTxgBXNXvl5/QWRuR3Fn6+d0JR2ThUhsS7vj4K
	uw6IZfKsMWcI5fGus37eOxyArVEeMIfGl5QPPXTjKfEAW/AA/83SniFnKFJMwJ28fcLQ8XpHFEg
	eL/fWzlggEAbSFSAycDqeYCw+KEdRN
X-Received: by 2002:a17:90b:3c8d:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3b12d2bf30amr3000920a91.20.1794218874734;
        Mon, 09 Nov 2026 02:07:54 -0800 (PST)
X-Received: by 2002:a17:90b:3c8d:b0:3aa:ff61:9504 with SMTP id 98e67ed59e1d1-3b12d2bf30amr3000904a91.20.1794218874240;
        Mon, 09 Nov 2026 02:07:54 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:53 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:37 +0800
Subject: [PATCH v5 5/7] arm_mpam: Add device tree support for MSC probing
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-5-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218818; l=10837;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=DgDf8h8LQcisx9TI34NkwE8vhFdiwEpuzjsJQeN2wKs=;
 b=3EOoCA4OU9fr+HUGLOhfRR5EZ5OIcSoBpJ76+97c6bZDTgeDR+jmWFAHyHQr0j3982CHwbIlf
 rT93f/U07JkCfXgGZN0E8DrRKu7eVeJwFtV1gIWHidE7Dx4yxyfOxw8
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: 0zLeoBDsoxp_toGwKm2Woohu3VJwj7RR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX2ylVQxcmD7gz
 rtUs+mhevjqN2Ppt9v0iIj/h127qdKL7oIsoIN6SLmQZBmJL4F+VZvmnx/V5ZXXfCOvN/iPUbaI
 amcyl4WXzSdCOxGGFWRBaf7CEKoJ40obAFKBf1eAnTBC5q4Ez4ClyrsnhH4UN0QCgjY/Psi1rvy
 L7hnBS7OY8xsMbts2vjSVVVrU3aIeUjoMjf4rL/nTjEt3ARrje480K6+C9IqzlLpppXalcHZ/gC
 FA3Sli7pR6akhFjF6Hd0msMwdzRbplX8+iaxhVY17Aa3GR34PKsfGAdsDrAFQ1/PPxX51xfz3nq
 +yPXQPBw/VH9YtHszKRKcPyQ7r7k8s6n0bVwmF13utEmPbx1ZpO2CcgXgCjrgcjTrnwMYd4WLHA
 v2Ep8mEw2qwLeeUi8jEl1pqoVFjmc2is1HLAmCHv4S0iWDU6Xqyh7XnxyBOBBLkf9UJuxeYK/CZ
 ECmNxQ9mCI/L+W//qTA==
X-Proofpoint-ORIG-GUID: 0zLeoBDsoxp_toGwKm2Woohu3VJwj7RR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0pSzzw3+C2f3
 +aLYuxNdrivm3aigz+eQmHcoJDq9+gueWPQMpUxTXA9rKKA8e8xzwMeuy0gHyyaUfZBlpYOx0LD
 lnvbN70dCWnKFQioafAzT13WMIMutac=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af19b7b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=-Bf8dWPtDk6FBw2lJ3EA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: James Morse <james.morse@arm.com>

The MPAM driver currently discovers MSCs only via ACPI. Add a device
tree path so MSCs can be probed on DT-based platforms: parse MSC nodes
from the device tree, compute cache-id and affinity from the cache
nodes and create the RIS entries.

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: drop the ACPI-only stub of mpam_get_cpumask_from_cache_id();
  use of_node_get() for the cache parent to avoid a refcount underflow;
  reject out-of-range ris_idx after of_property_read_reg() before
  narrowing to u8; use u32 instead of unsigned long for cache-id values
  and compare against ~0U; fix mpam_dt_create_foundling_msc() to iterate
  MSC child nodes rather than creating a device for the cache node itself ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c  | 250 +++++++++++++++++++++++++++++++++++++---
 drivers/resctrl/mpam_internal.h |   2 +-
 2 files changed, 234 insertions(+), 18 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bea231dac7e6..78caa8ae1349 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -22,6 +22,9 @@
 #include <linux/lockdep.h>
 #include <linux/mailbox_client.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/property.h>
@@ -263,6 +266,171 @@ static void mpam_free_garbage(void)
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
@@ -629,16 +797,6 @@ mpam_vmsc_find(struct mpam_component *comp, struct mpam_msc *msc)
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
@@ -2392,15 +2550,34 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
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
@@ -2561,7 +2738,10 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
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
@@ -2574,15 +2754,45 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
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
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
+	}
+}
+
 /* Any of these features mean the BWA_WD field is valid. */
 static bool mpam_has_bwa_wd_feature(struct mpam_props *props)
 {
@@ -3455,12 +3665,18 @@ static int __init mpam_msc_driver_init(void)
 
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
index 1f86cc158100..cd122f308eab 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -519,7 +519,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
 void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
 #ifdef CONFIG_RESCTRL_FS

-- 
2.34.1

