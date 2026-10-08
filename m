Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC753C3F41
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442095; cv=none; b=bRoOnGVNVlAHyWQNYltoh0SSnTPUNGv4caJoQyOAzXWd8KoJ7UMKVAI9VA01tWli9/qdW34p3lf9D1me5jhP9U1+cxlhhwnDB8WUigW4hojIH7Hdoz5T0m4zhCc8JJDhPZKXlpkE62laCL3B7gkJqbkSqn1dPJiGI+HXkp/L78U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442095; c=relaxed/simple;
	bh=GSIRP3BmhQS7xYPGeQGpseQQlGc9u4TA3Qjw1cKATeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBSY/3UhgoCnSbVuf2c5xV3Iq2T+ZNMsr9lbflwq6Hu+7Ien64bqdQoJHyT19Hv9A0igongagv2FqRNatgZe57DknqubwoxUG+KwhMK+mnuEUO2APF0Ri8zX1fsF2fewU2Zf70HOZVmfQxLLpQlhCNxPWhiK6XtYQ/K1wowzPKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A91KisAz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdsPauMq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A91KisAz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdsPauMq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BtJS1776297
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=; b=A91KisAzL9Ic6XEs
	T1O3BK9fJAUCSmhrtkEql5NNbRwhtWpydIAQo/6oo8FMalBBEabWIGoT3k/IQfpI
	pSzzV0gClBEHnrgxDARbRn+Ajz4SF5JJbolRiJ5TE9WJo9BhbRMer/mDMlarl8i6
	DaRyyPBQL+2ls+CrNlQFtnKQGNKIrkwNkj65wY5r4vPzbvLWLi2NNOWLhiEbzPMe
	BLp3zJg1u3X/6aQ3fJPYMG7aKSqe/oWXd6lgJu7s1uDf39238/zVwgRQhKjZxadq
	RE2RKFygOyq4OfgxFp0wDaFK9b74zHTPRYUtDk/A2+WqmaS2fGA3G5ByWfWnU82l
	CHaSDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe39fy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:48:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e605efae40so20183735ad.1
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442093; x=1792046893; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=;
        b=YdsPauMq7pv/QYuIB6nj4XG68JK7ewZK02q5qFlCy7UkA6WBUzLpkif4fAZU37A2XM
         7qiMCXWlJaN4meVP7ZaoIJD6+zJLtUr2eWjbruaDuDwKyMqP/RyYXMAVnQ01nMJdc+Vz
         gGQwjiaZroZ2ChjV+wdC3m4Pvb2uF3aQWasJroiImUvz33QQkAfeMue36CJVbusShv1T
         Pz+PeJ5bkItKG+qFts8r2+X0zMAkXc1z3oHU61AsGsahOWYFxQ4WtbQNFjoVMCMZcFe/
         V/zQcWJ98dTSwQ9qwYRf213M+DYFdOBkZ5kYYC+gXeMGNHqEWtTHlPaHlaGqZQJ0hEoy
         P+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442093; x=1792046893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=;
        b=WiNnjVuLchBJa5oSmdGVZHJsTQPw1f0vBaxp7t3gP+JnyjY9maJtmhJY8qzx42lXyL
         OIq4hutxY4fwLV54ZZGBuNph2QfZR0/e9ZrdJK/8DEpTX9Pzb43c/Ljry1+M85WZwEgA
         bK6gybdFiGiE7uTCGAioMDr6k0U1NGU1Jt3x/xIiPH9Al18tfjE1e3n+uSstDOLbFFSw
         kHwD8rWkgLyLLPN4Eg5nvH3QC9Re60eBXpgONE/Q36HgiNCfH7XVBX2i9iXpHQZD7jnB
         YhtACqe8USPWiuLYbPSS17BVoH//O76CADNQo5/ILQ6xWALpr1sG0uLEC78BXNlIHwCp
         aJyw==
X-Forwarded-Encrypted: i=1; AKwUvBxyot0oCXNf1RFGEaOGhp4yc7vHGl6WDH0kBW87yKQGmEx7j14sTNPwDDn9LJgjruH2zmFmDevG4vhfbg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKzdJJPMdBKhx+pojHU3ICZ7YzOBKhT7KIBfrLaZW/XFjInpLQJ
	NRthmxGnuDtMIY2rgA5wmm2liIRO7GpY5Ac3TIRcTUi7VcT7MfKDLPPAbEI3FywvoHBfLbWYtkq
	v/i1FFQbOqmJ6iL3XukJOBQg6Hq4M+oljyEViszuBEV3wctHJGCcWj0Ns8vXuFk3TDA==
X-Gm-Gg: AYBFou3KMXvmktIO02fC3r8yWLxIX1Ki598lUlX7Zi7G2wb41SzWEDHKkkpfiVOiwwZ
	RCtR8m8GbsBglQckAIM3TaFr2gzbuvBV/UJ3lC/dqS8o9dAT+2MiFH3zak/L8XHrinHRmQQeRdV
	XaCQwORcRR2GL3una/uKrIzBRLQghWSVMtkhxXPNklfdA0o8JM9xK0eFQKtQZA7WMXjUMkgH7Zl
	x2gqGHj34U/1EAizVcbue1DW8dX5ttcF9PKe5opkBb8a6xZyvmSpTztivf9JIebs8GAmp40Z5x+
	wkH8qRN2LGv94WU8k5g1Nw4CjtIFc+w1yTI9azd32PTclbuEa4kWRjNRfZcOnISKX45seOWYPiE
	vOC/Gn704WuJGy4lQ9BXWm0J7xln676riE9OZIqPC79vRk5i+ByAG60U=
X-Received: by 2002:a17:90b:4d:b0:3a4:c52e:8126 with SMTP id 98e67ed59e1d1-3a8a1b5f732mr3689935a91.40.1791442093036;
        Wed, 07 Oct 2026 23:48:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4d:b0:3a4:c52e:8126 with SMTP id 98e67ed59e1d1-3a8a1b5f732mr3689923a91.40.1791442092528;
        Wed, 07 Oct 2026 23:48:12 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:12 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:16 +0800
Subject: [PATCH v3 7/8] arm_mpam: Support MSC accessibility derivation from
 RIS nodes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-7-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442026; l=6269;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=GSIRP3BmhQS7xYPGeQGpseQQlGc9u4TA3Qjw1cKATeU=;
 b=pSl8/bn/WvXEY9gArvtq+8Qd8w/Wt21IFdtyi1T8yoyytSv7O7alTH6LoIlk1qgFoHuKki4TF
 6YzLk24JMNMApzvcekAGDjpj5g1Acg1hbG9TYdHhAfXVOWF15GLvzRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac73cad cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=DmVZOekaPyhSFRrspXcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX94ZLvx9tLi8B
 Cn/dMERIrhmABrux7Ejd5OztnAgOHZnu8cq84RfxH/vYBoeZjMuKMfe+rSvbYVQuH8C3h8tb/6+
 PGB+EnPbKUDxG9kYVDJiTpW6jUUwHNM=
X-Proofpoint-GUID: hHae0Lr0HhTHCIsXTmV7EC98Rqz2s-5X
X-Proofpoint-ORIG-GUID: hHae0Lr0HhTHCIsXTmV7EC98Rqz2s-5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX4yVZYivR+8T5
 mL/g0v0feGmF3ZR3XSMhXjTUv/QwBxfGMtaTKK7TotTiBLfa/zCth/lOvN0ymrARzxnkkkgy0Y0
 Es2Hg9gN0PRsAg8r/X112WZ3I+pdy9vsVMNiMbA11hvzKQqdh33j70AHVdSaOeLTtzzS6lNtlnj
 Ct4yXdII2gNF1Q0t77bCSRJBNCvTRHwnnECSxEkOlj9C/H3tsBsZ8N/cEPBTa1XMh+zpt1xWwO5
 h1EPCbXiGM3GV1Um+VA7r4sEC6DlJTSoAqJjSgw29HYij7uTIxV34Tuw7VMnsS5f1u561gqiafe
 NGd/2/NWuRfbyFsznMhd+5Sgb3++H7LISiiJbaQTf8Pw7BdP/pXXyyqs66eN0Rhny0s5D7sQfsX
 H1LBLAwx0yydvOMDA+5lIu2UmAvdw6voPDd9NybMTcwYdroBo42gIZQuwQUZz3PVLX1K9ZvL9FV
 wUUqULonn8NuJ4CLfwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

The DT accessibility derivation only handled MSCs whose parent node is
a cache or memory device. When the MSC is placed under a generic
container (e.g. directly under /soc), the parent gives no affinity hint
and there is no fallback.

Add a per-RIS fallback path for when the parent node is not a
recognised cache or memory device. For each available RIS child node,
affinity is resolved in two steps: first from an explicit 'cpus'
phandle-array on the RIS node, then from the 'arm,mpam-device' phandle.
The final accessibility mask is the union of all RIS masks; if any RIS
fails to resolve, the mask is cleared and the MSC fails to probe rather
than come up with a partial affinity.

Factor the DT-specific logic into mpam_dt_update_msc_accessibility() so
that update_msc_accessibility() dispatches cleanly between ACPI and DT
paths.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 146 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 048d32e69f55..80157b819c3d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2159,6 +2159,136 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
 	return 0;
 }
 
+/*
+ * Resolve a RIS to its CPU affinity from its 'cpus' phandle-array.
+ * Returns -ENODEV when 'cpus' is absent (the caller may use another source),
+ * -EINVAL when any phandle is invalid, or 0 on full success.
+ */
+static int get_cpumask_from_ris_cpus(struct device_node *ris_np,
+				     cpumask_t *affinity)
+{
+	int i, cpu_phandle_count;
+
+	cpu_phandle_count = of_count_phandle_with_args(ris_np, "cpus", NULL);
+	if (cpu_phandle_count <= 0)
+		return -ENODEV;
+
+	for (i = 0; i < cpu_phandle_count; i++) {
+		struct device_node *phandle_np __free(device_node) =
+			of_parse_phandle(ris_np, "cpus", i);
+		int cpu, matched = -1;
+
+		if (phandle_np) {
+			for_each_possible_cpu(cpu) {
+				struct device_node *cpu_node __free(device_node) =
+					of_get_cpu_node(cpu, NULL);
+
+				if (phandle_np == cpu_node) {
+					matched = cpu;
+					break;
+				}
+			}
+		}
+
+		if (matched < 0) {
+			pr_warn("MPAM: RIS %pOF cpus[%d] (%pOF) is not a possible CPU\n",
+				ris_np, i, phandle_np);
+			return -EINVAL;
+		}
+
+		cpumask_set_cpu(matched, affinity);
+	}
+
+	return 0;
+}
+
+/*
+ * Resolve a RIS to its CPU affinity from its 'arm,mpam-device' phandle.
+ * Returns -EINVAL when 'arm,mpam-device' is absent or the phandle is invalid.
+ * 0 on full success.
+ */
+static int get_cpumask_from_ris_phandle(struct device_node *ris,
+					cpumask_t *affinity)
+{
+	struct device_node *mpam_device __free(device_node) =
+		of_parse_phandle(ris, "arm,mpam-device", 0);
+
+	if (!mpam_device) {
+		pr_warn("MPAM: RIS %pOF has neither 'cpus' nor 'arm,mpam-device'\n",
+			ris);
+		return -EINVAL;
+	}
+
+	if (of_device_is_compatible(mpam_device, "cache"))
+		return get_cpumask_from_cache(mpam_device, affinity);
+
+	if (of_device_is_compatible(mpam_device, "memory")) {
+		cpumask_or(affinity, affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int get_cpumask_from_ris(struct device_node *ris, cpumask_t *affinity)
+{
+	int err;
+
+	err = get_cpumask_from_ris_cpus(ris, affinity);
+	if (err != -ENODEV)
+		return err;
+
+	return get_cpumask_from_ris_phandle(ris, affinity);
+}
+
+/*
+ * Returns -ENODEV when the parent is just a container (not a recognised device),
+ * so the caller falls back to the per-RIS description.
+ */
+static int get_cpumask_from_parent(struct mpam_msc *msc, cpumask_t *affinity)
+{
+	struct device_node *parent __free(device_node) =
+		of_get_parent(msc->pdev->dev.of_node);
+
+	if (parent == of_root) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	if (of_device_is_compatible(parent, "cache"))
+		return get_cpumask_from_cache(parent, affinity);
+
+	if (of_device_is_compatible(parent, "memory")) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+/*
+ * An MSC's CPU affinity is described either by its parent node or, when the
+ * parent is just a container, per-RIS inside the MSC. In the per-RIS case the
+ * accessibility is the union of the RIS affinities: every RIS must resolve, so
+ * a single failure clears the mask and stops and the MSC fails to probe rather
+ * than come up with a partial affinity.
+ */
+static void mpam_dt_update_msc_accessibility(struct mpam_msc *msc)
+{
+	cpumask_t *affinity = &msc->accessibility;
+
+	cpumask_clear(affinity);
+
+	if (get_cpumask_from_parent(msc, affinity) == -ENODEV) {
+		for_each_available_child_of_node_scoped(msc->pdev->dev.of_node, ris) {
+			if (get_cpumask_from_ris(ris, affinity)) {
+				cpumask_clear(affinity);
+				break;
+			}
+		}
+	}
+}
+
 /*
  * An MSC can control traffic from a set of CPUs, but may only be accessible
  * from a (hopefully wider) set of CPUs. The common reason for this is power
@@ -2168,8 +2298,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
-	struct device *dev = &msc->pdev->dev;
-	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
@@ -2185,19 +2313,7 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 		return;
 	}
 
-	/* Where an MSC can be accessed from depends on the path to of_node. */
-	parent = of_get_parent(msc->pdev->dev.of_node);
-	if (parent == of_root) {
-		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	} else {
-		if (of_device_is_compatible(parent, "cache"))
-			get_cpumask_from_cache(parent, &msc->accessibility);
-		else if (of_device_is_compatible(parent, "memory"))
-			cpumask_copy(&msc->accessibility, cpu_possible_mask);
-		else
-			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
-	}
-	of_node_put(parent);
+	mpam_dt_update_msc_accessibility(msc);
 }
 
 /*

-- 
2.34.1

