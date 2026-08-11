Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA5C37A84F
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455482; cv=none; b=bUWNqh/JPxFvEwUWcddXhnB6iHCPpk7oTrIlZ+a9WiEHGmi7Rdf+FLIaDx0orNYIuTNtlZrz8MVAPJyCuvC+oQqEsOoIte9vPqM40ngWepwmmxc4+NHEf78MxWuzG0afpKCwnspuPuakE8Mz6OVYx5Xjf/olIC34BKRMT9BVtbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455482; c=relaxed/simple;
	bh=zaBYwdzqKnPLChk0jQdmpN+Gtk81dvYuluYIJGNKYNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WL5nydWJMuwh5DBzVuj6wZQ2MV/QXWawkFAR5rfcgwzqA3LW8hK0dO35tkxOxjUCwhxycvmU3fYIFeOVMdAKK/ZvAeIqrTg+AOKhg+DVbIugqSkCG8bF6WF7Skb3pQkvWuGITkKd1FemYHKhqF8SpNshAdtwuBsoAVDmWrzGTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDczr3y4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sxo4K6Zt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDczr3y4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sxo4K6Zt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWb3L453549
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4kViRm3sAJ0GJ6v9v6dra4X1/iqxcX9YHvXUBsWd+A=; b=PDczr3y4UfA6V3mF
	PFx885SU/ZyYi5BkDXvlppu8bxwdcpIIj2sMwbaDr6hf932H6gUKX47rljXynaZy
	QazBr6mWnvLB7KUIBkTH5MFalUFpCfBTIPA+n45GvRd0JhZb8fFL1W6mrgotaQ8w
	t45NZ3x8Oe39x53+cI2LrAEoWD3/6Dsmi0NP447K1F2G9I5CmPvsl5+zmn+D469A
	9ADWL1QZdL+B37znuAySs4iKw5bo/DrJOyFeFQK13z4N0T5JA7+Uc8AOuiDNY9fb
	yCGoW/E2LdaEcTU334w9+4TjZx0LxYA18/1GdmJsuEaW78eGqJGv8nWQffBsSHm3
	iKkB2w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kg5gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so5094534a91.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455463; x=1787060263; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4kViRm3sAJ0GJ6v9v6dra4X1/iqxcX9YHvXUBsWd+A=;
        b=Sxo4K6ZtSeHuuYnzMkySlZMGAAca6ncRzKajdr4Q/jA3ynuR+v48YzEYjFkb1Mav6F
         WHaAYwsrs2Ehndm6bSe0cWUK7pSKCIhMrp3BiMASmYiMLppUN4ze0OCginvsE2DzfeZN
         P+obQUohpmwtjIbyL2A52VTkBCHA81cHKS9lE3XP/SyPBajo/S43JQIj+DywGhC9Ug3O
         fbx/K/jD9YmSAREyVRLncrAQ6/WdfF1usPqKKXSFoLPUX0/woJ140Bb6TexVlzZmVozJ
         RBZFEtTZiQaMQKkIKzbt19AUC+OxhNX1T3s/CdJI+7W+Xb7GNBGQlJEvmMjbPowBPoX7
         iRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455463; x=1787060263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I4kViRm3sAJ0GJ6v9v6dra4X1/iqxcX9YHvXUBsWd+A=;
        b=bUAu3QhWCJ8p4fnzOR2zDfQvKOyvAGSU7IYOtLQeWmAZAc3zKia1fb2o1412Glf3Vx
         gIbRQSGOpg+dlJj9ZXOG2G0rUB28gdP9ojpL4nCLpB/iY/9nIKNur/+VV5Qm14xCqBLy
         Ftg2B9rGrf7JUMDodGnO7IR042ygOQwE8zOK/ZIv1v2D/l9/DuxyR9wN1gEWrXSILYjV
         AiE19pbsHIWIDlSJ4C5M9/hvuZkOey7TYAhmBXR9j+6pEqrDkt7OIiPjNUkxDJxNuJz+
         j258pWNU8BjsZwtCz7seAoW4LX3Tu3KeiD6LjFLGxPLzLwkPOlzc/KYSmrwniy8brN/I
         Qtvg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+oCR24cexTLwv5gyO7zm5exNZf9pxhpMuC/S6zQT/K2bzErrhtKzw+VNuC6OgI/d9aX5gJvgsnLt8DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YythAnafXfgZKGYh8L7Mc5tV7IKDfwpEluMmU3yW0rKikkwKmzZ
	TIv2hDcZQfueyVbUhkvae7389zo/fQCIvK3+fg62mdVc7UwkOHQNnejS8fSGAK3FJPB6b0inHn2
	Pdo6EQeQRsAxkWj8HLZiDa6umLfegGWed/eZ1GXA/A+vehbzBwcedgYlE99tl+PQuRA==
X-Gm-Gg: AR+sD13pIpABPMZr34pqwe7cm/5LqwychBcBHXEVceNXEmSvX5ns8vcjnh7mgOyDqX7
	pRUGhjQ/pO8VpXBUCEhlRR2+Ol08L9rdsPHpx65CDPk7mi2wVIWuWZE6gHoRmdZrKyF5+9xh974
	FaayyfLt0m7xXP4Hhf6vx9ffozbQyOOAQj/yMyoqa6HMS7jYkSeVFAAd4q6FNSStxsTejiG83R1
	RH7ongClDb65lrDlSTeksxVNtf4rLGJTIT0za5nz1iTrKcAlA92lX7ZCBUkerv3D7k9rYxojG22
	EofplZNYfC+HEaCk7D6nVtInkKbxX+W0EXwu8ChUBSiZ3gX+G9rcLc30lTKiRpCPUM8fMaVyBiw
	y3dWFbH3q4Fnp8kZeRaWpHUVGpHUN1Pe/GDlWCw2B76uDna99z4KynGWf
X-Received: by 2002:a17:90a:d44f:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-392ec56723cmr3831998a91.14.1786455462828;
        Tue, 11 Aug 2026 06:37:42 -0700 (PDT)
X-Received: by 2002:a17:90a:d44f:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-392ec56723cmr3831909a91.14.1786455462239;
        Tue, 11 Aug 2026 06:37:42 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:41 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:43 +0800
Subject: [PATCH RFC 14/15] arm_mpam: Support MSC accessibility derivation
 from RIS nodes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-14-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455330; l=6269;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=zaBYwdzqKnPLChk0jQdmpN+Gtk81dvYuluYIJGNKYNY=;
 b=CV39+MeRob0ID7MiE7jf2uDLS4vl9pceQh1lYO3+4YumI0OMEhNB+kgFUsxGLLVZH/eFQ8uUZ
 TwwYwdYH1sRDRup6i6/E7LtiBUJ6IfZkeWEDOEDdh9iGFcT/tsNokle
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 61toRpixQmdZPfyHkzvudXApnPs70TT-
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7b25a7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=DmVZOekaPyhSFRrspXcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXySG8iF2nJoBP
 fN2HsRNVV0CPqqjzXxNmf0dkW9frYwaKMsfxHGHdEtEO8SFmkZVtk82UG0w3MWvrxpXRjtRgcFU
 ucskgqvVnx0udcRuDt/yDjESDOsMy9hh38Td3uZECYcgeUnCQf5idKw1BEhWW2M2Zl4TkLMu/sW
 1CGRKqqPBA81+ODDmlshRE2qdcTOnrF3keqrEAak48kIDyaP421crrkCX3WXwiX2H4wi/gV63gW
 nQQKpvizmPvCaCTwCe7Wj1cSbS2QhWwy+tqqLo79akBkf9qz/WcXHErE7bRbXbbqseRWL1TGehA
 R3ssz2/ItWC+JGeOve8TtiXW0xi7/nsKpXKRDsUmute9NPGxYSmIvtZPMMMw7knR4+QznOiUG0q
 Kjeamdzw0DBa1n7Vw6DrSOJPwt8FyvvaCinhmdKy3GNOWfIG/JyvQwVeIFOYfO3+g2fDcE5oSDR
 DrhQKtB/7kTbRYSKfgQ==
X-Proofpoint-GUID: 61toRpixQmdZPfyHkzvudXApnPs70TT-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX6thnBKtQq3f0
 WUSTcKA19j6X7fbLPE26bN0Q1brk3zNbWlVOeGD8dq6QIG9L+LpuAiAUqILWiziijb9uowSRBPb
 8HTr9IEIumjZTBE63ezwkfDVUsiw090=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

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
index d8856864e89a..d0462239deeb 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2156,6 +2156,136 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
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
@@ -2165,8 +2295,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
-	struct device *dev = &msc->pdev->dev;
-	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
@@ -2182,19 +2310,7 @@ static void update_msc_accessibility(struct mpam_msc *msc)
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

