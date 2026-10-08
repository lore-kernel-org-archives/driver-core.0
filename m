Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791D3C4169
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442063; cv=none; b=QUvGO0msFVDQZ/Bn45JGqbxYz6tvzUPTW3oTUi6YZP/R21ftt8HGCzx94mqLcRmMij0juwagbx7YxwQXwkQrO7WFAXa5o4Txmb567i8VVGNUUTMsCJb2nbAD6iNz8ejvkULDXayTD1fuxXvCAoaTcXeVk++sQaLJ8KsNR9HkI1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442063; c=relaxed/simple;
	bh=E+esblg9glXlDI5Gc75GxNxdOWu8vG3UzOZCx/Uj7KE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIFJDLZr8X6uBoCMYww9pHXQrvAok0W6Ba3EpCtTUrad3Hvhj9J8B1ROPseV+8WfN1W0QS7qzHizqvb1FZul6TO+pbm8Z2LhJj42kToKu0WU5yy89dJmtuNJ3pfX5dMMeUbAnkGk/hyB6EwJ3R/JnlhNTj5RnmJnPYYNjq/XCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NrF1ZJ6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hY4fVW5s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NrF1ZJ6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hY4fVW5s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUsR2895413
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=; b=NrF1ZJ6iZNzELCe+
	n3pL0uNC7TTGnVOz3igxCW7SFdPuCn8oSMRtiQVq4biNTBfVfWIuQB9OoErnqsVR
	Z/mKHuc24eAUZLaVoY+FGC2kaDGxHNiuQ4OCpG6SD9eueKBimA+KRXH5NFtuCSvX
	Sh3ItMO7hlu/5bAdlGwsDTvTmjrfvxBLUbaXg/QxX6OTjOOKaVY5w51yJiqnFKfb
	C2fvXRq1DfV458pHcsMh/BMeaIjdjptKmZ/WAgvoyE/Eh4XN43OGZaLD4qJsKd34
	xhMn3650qNKqLqwxs+oeLGUp/ppUWThJgK3nV/IzK5h5b7aAOlB4EnDUf6SbElee
	Ly5qNw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sg93nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:47:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5858634a91.3
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442061; x=1792046861; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=;
        b=hY4fVW5sflW1ATQRRuhNk/L+BmHArtqaHv5S29W6KH8kW4V64t8pxkktSEA2uK3xIr
         o/z+wdvmgHaag4PnG6/8//eH34eTn0d9ihZNEmD5Y3khsYNP34FvWtQ/5FA8JhR4xsjM
         hq/dsrICwFa95SZrY3cwJAn2fLFbSdc/aF6ImeCuzlqpUMPWDySE9bglLoswMF9UgSgx
         qu07YfkoN/xgiHIh0FUHRg76OsLTQUBxd69xdRBHJCU8Mz2743qcwL+pSDeWo2vk3vfG
         9BfY1aLWSgPRaQKKYq33i7LK84dY1nONG/va4TQo81lgLsk5yS789eUlSMdM6Db92MU2
         C8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442061; x=1792046861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=;
        b=jNwpu3bvbdHVMxR3mhh7NruyPvPwEcD81TlzPa3g568YbXrro2tTuGq9DuKekgJxRQ
         7GGpZZmgrOFV96uFgdV1/+YT2+YgQf0h/9sQOvjof7ssBguk7SFMOrQDndK49N4W5Mqn
         OMJE1Mr9ln4jey5NQdvgQP9zP1OkGmL7BNo8kLpXwZqjQ6sahm1Lu9WRMjLV5h2YCWwV
         +qwMzawSX/eYO5WJQdExnMwOSm2Bn1bjxl8P+tfXd3wuoa8v7sWo/tuAy7hWAqp9xw6H
         Wu1k6HtLD39xetpmbjwJ8/MEH+IFodRZFR0j3SpqjUXOjwtZ79Uc8cTmtgWKP43w6JW/
         BWCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhwPOA9y5t8E1snLagxESwYz1q9KpcGesHoGYMRkuFVkLnB+I0n1cytAsxO4ZkwiryT+kzAJQLQwez4A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJLoCao7hAPJ+0BVxyixnB2jpQ8q7Hw7lUgz4tpGfGaJr+tpARR
	6BCxBuopj46noQAItxlwdekHVS/pmAx+tipCwh9TmxGzfcnx3o2H2cETDDFYkmOocUPHHkHPMok
	wZ9HvxRRIDCFhaJf/0edPamlNlowYtKKddhL/fBTjmK+xijqxAq2HI+x/ZrIPmKL3zg==
X-Gm-Gg: AYBFou3nDSiXdq8t8w53pXAavtoiAts1CGa60IdpF4nA9hvUqWwnQgHVw3WORkiBrSo
	8X2jSmgvnEX/MMZOmmn84/CXdZTsYnyerHqd1BlKOdpKK/j8mgaXg/enEok6/+OdxPo8bl5YV19
	lbdX6LGPg+YwL/X9NMOeWdsr/FeJsW0sVLTeGC5OOl/pVFfQazurr5IhX2rW26aoNmyMu2jMuYa
	bZJaTnVXjTfX6Ly/WSW4Bm5GkhbeAXsFHJZ9EKcatwHE++vKKunyaovvK3rVYCBM0lc2hymmYPH
	8S5DMIlRCL8YAwhbVT9wxOhBPBVNf3IcSk4ySwLNk7Nxb7uPPkEZ6fPrj6o1kLPjNqqZy02Ndon
	SrWvyRNbon2HKpGqrCOvyk7GTH2ZlpMvFLc0rDJ41yspMGa1AEByBKAg=
X-Received: by 2002:a17:90b:2804:b0:3a7:eb0:119e with SMTP id 98e67ed59e1d1-3a8a19270c5mr3450681a91.21.1791442060745;
        Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a7:eb0:119e with SMTP id 98e67ed59e1d1-3a8a19270c5mr3450658a91.21.1791442060236;
        Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:39 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:12 +0800
Subject: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442022; l=7058;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=VRx8aZC4+R/lliq1ecNgi7KxlRqXWCW+Hr/b1wE9+y4=;
 b=Mp0GCgrijdwOmFrCyPUiLdPtAuQDzMPXaDHW9ovkFNm/ztl2jH1wiOts3kOy//givHCEej4ow
 MjqX6aZEUHbDubSsRQvpbaHHPZ4REz9iB7HhWVRY/7qezHXcBgEaU4w
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: ALtNVXdYjNOWhDzT2iT5d7jdznzffOvy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX3sv7AQQZLfx0
 kV+tRPoDckFiQ7B9xAmPXOr8X4HI5zbAJ8bG34RlJoKEGrSFwZAKUihhLHo5kP8fKMLnsKIlxO6
 0lCqSKxlgXfa2/6Or4ngzihnoYUbEPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX1jSZFwUQB3Uw
 PqrWyT+tWogAbCQt/J2cotiIMCdX3OR1m08S9n57ezoglL1EYpEhroUdl2hTPv61vJafFx38i9m
 5jF83SAwQAD6NX0N9t4GPDZbAOqu7VNQ8ZsAtW9yOaQiCofEMdN0nU10rM+oj+BaKSyHgTtKv20
 z6ZOlNpyyDJRIDQ4gRO5ROVCXUlB/uBpspt/IvRNLG1fmZyAxkXUQytCDasbSw7DEnr2n4upIxj
 Bh7JIGXvX9zlVzqMC1rPBHr3pdp0OEOLRtvAbhqBXlxVNu5rjFgoaetCMQeJhT/CPl7cdQkixhw
 noiWJEUSJOVDSsBUxnSpLyt9oYXAS/X6/02zOgbftM/K1gfTPdJxXFS1NyUwhTOwS4nmSb7g490
 j5whvHghyXyMkrNUza8XNcZBc4AY9SBvPD2OLvh9lGqS0KlkMOvCCB9L1Sb0lPLMOpTMEFjFRjw
 D4+QZa2pzAe1PGK6UVQ==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac73c8d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FqHZ4tX-ONj_CKorFbsA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: ALtNVXdYjNOWhDzT2iT5d7jdznzffOvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller, cache controller,
or IOMMU. However, it's certainly possible a design does not have that
association or has a mixture of both, so the binding illustrates how we can
support that with RIS child nodes.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
  standalone arm,mpam-msc and the two-item combination; fix schema field
  order, type constraints and yamllint spacing; fix example reg addresses,
  add arm,mpam-device phandle and remove TODO comment ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..3c7b13a23ff2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    oneOf:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: error (optional)
+      - description: overflow (optional, only for monitoring)
+
+  interrupt-names:
+    oneOf:
+      - items:
+          - enum: [error, overflow]
+      - items:
+          - const: error
+          - const: overflow
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+  numa-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NUMA node identifier for the memory resource this MSC controls.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^ris@[0-9a-f]+$':
+    type: object
+    additionalProperties: false
+    description:
+      RIS nodes for each resource instance in an MSC. These nodes are required
+      for each resource instance implementing known MPAM controls
+
+    properties:
+      compatible:
+        enum:
+          - arm,mpam-cache
+          # Memory bandwidth
+          - arm,mpam-memory
+
+      reg:
+        minimum: 0
+        maximum: 0xf
+
+      cpus:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
+          parent device's affinity is used.
+
+      arm,mpam-device:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          By default, the MPAM enabled device associated with a RIS is the MSC's
+          parent node. It is possible for each RIS to be associated with
+          different devices in which case 'arm,mpam-device' should be used.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  interrupts: [interrupt-names]
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+
+        ranges = <0x0 0x30000000 0x800000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x10000 0x2000>;
+            interrupts = <1>, <2>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    mem: memory-controller@20000 {
+        compatible = "foo,a-memory-controller";
+        reg = <0x20000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        msc@21000 {
+            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+            reg = <0x21000 0x1000>;
+            interrupts = <3>;
+            interrupt-names = "error";
+            arm,not-ready-us = <1>;
+            numa-node-id = <1>;
+        };
+    };
+
+    iommu@40000 {
+        reg = <0x40000 0x1000>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@41000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x41000 0x1000>;
+            interrupts = <5>, <6>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@2 {
+                compatible = "arm,mpam-cache";
+                reg = <2>;
+                arm,mpam-device = <&L3>;
+            };
+        };
+    };
+
+    msc@80000 {
+        compatible = "foo,a-standalone-msc";
+        reg = <0x80000 0x1000>;
+
+        clocks = <&clks 123>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x10000 0x2000>;
+            interrupts = <7>;
+            interrupt-names = "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@0 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                arm,mpam-device = <&L2_0>;
+            };
+
+            ris@1 {
+                compatible = "arm,mpam-memory";
+                reg = <1>;
+                arm,mpam-device = <&mem>;
+            };
+        };
+    };
+
+...

-- 
2.34.1

