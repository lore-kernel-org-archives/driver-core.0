Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD084302FC
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455395; cv=none; b=M3+chsqELsnr2Wtg3gspVXSGvAknc2nHZIouA4POqWvRcHDl+7HZQwxOEzJ5EdsBrfLWGVdYkZ28B9BrwOeJxxzr8EOP/ksqVQuhStDB/UbFrhK5a26wwxcT5DKGURHnIh0bjue/VbCCN1JPOaUiRzkTe+E1ODG7Wltht6o2pRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455395; c=relaxed/simple;
	bh=Q1SO6EtCR75JXe3JpYCv7OaNJuuMIm0WdKd+5Zw+RCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lh1kgJ1QQ2igjzGFhHTuidYPznQ/7FW9mDCgQ9J8cUxu27P0+sIiKERWwvhKbTmiwpwOVaI95LMHFeE2viXRID4x2smjlbSl0JrYIGyXqgOg8lXW3khrEeOfZ0uytXZfK1Bp8lElomewSazErn3coZVEFGhC6SEmde+nPUg37z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2gkZ9kT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jDUz19ub; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2gkZ9kT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jDUz19ub"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWlUq3718178
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=; b=U2gkZ9kT4fXXVfKB
	k6aUBJ5qg9PHk2L+Hg8bzEgMuFxRbvXBD75KVzXlwX0rCVxDKm4gwIs4BZS+CEqV
	nqCi259M9RdF2zdZCAcoSxUXcvIRYJuzM6dsaGgxF/SEzOxrqCOfjPTYaFeoKbfC
	UKc3RtwCKvfF/Iiy2Mt0ZbiiR+sMvngrUxkTiXwDwVWnIX+Ai8OfVd5vPsHJgUaf
	I70lZH80TiUtd0jSTdVhPVYiAtlEANm/KEoCQc3djJI7wxxoiJqSQ2wduRc9J9Yx
	CgRX1V/ptQIDhvZNOgnjHVvd2JTIJBIzCp+jDR4gfxVsiJv7pVSYACuglCDRTu4R
	VA9syw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwesfhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d02df2bf09so44590505ad.0
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455386; x=1787060186; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=jDUz19ubxE/gcSoT9dKHw/9+v4ylxQZiWSG5TYy259wrf71MaGr3W9DM30uQbpwymd
         +qFQpmrKmwcWSp7uD/EBIUdtjd5u855ZkB0PvNvf2E+qJMDJUcI6obcRoh4nsS2T6rP9
         fnzMewK03kIvjZeE3Ixwgf/9bVIu22vSwvxcb6tV1LMvbvG8a7pREo6V5ePyFgBB870X
         vZbmwv2ykcrhQcqr1U7dRkyyVKipfazMw+LUsa+7RTHGKe4MpHaUDLM3DCRHyVkHQT9w
         UGcb2OS3wwU7nn7Iyvo9qCxCFeKlpmk0709NF5eZd3l57asiuYqd4UjFf65D8hyhCjNw
         s1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455386; x=1787060186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=oTqIb9yuesKLzVHY0gVlXSYzUuxmh2gv9T0HzcwtMxtohWlpLjYqz22q+vECcHpmVG
         1Wu5vmydht2DH1lFU7dNUPZRTiMsm7lR8QdoWOZATnV++xNecQL7lLzVT6CUVEeb2TNh
         vpDQk3E8Y3tR4KV7N6mugKZV30s1NN52IckP4TSUd+eMrqKtPSYPZ/kw2oR89DXKQ07a
         RbJBEL7An/X+zAor0skgMILd8VD1yMmpwGn6TGdgpCFcexIR2slbQ7RyVwHdi2Dge5Vs
         Ax/lX1mXG0JfWI539D1ndsV10KNZh2pRXacshAjePivdbTOaXHakazUny8D2DkBv15eE
         I5qQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQh/dPSIE4MWR1as8WvAEErFVVckqEQV91erWxoxyiEVxo+ky11v4Vu2IytepvfH6QLtsR7fQWg62yoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXN0mJBSqiQiQJg8e5VOS4EMfclgInqImq1Ov1Ts3fsyniX2ge
	z9nc4yqNWzEs6g0NZ5ssmnSgDOUN9rvpIed0JlQn1RvnmRZMdWdZgf3AifUr4ZJtFFWV0PpP0s6
	S3lIBgk0a90+hm9WgH+xl2lKC/kTa/H2V/XzmwE7LIOVt9TtZVICJabeDu33ROGSjLw==
X-Gm-Gg: AR+sD112znYeHtmlZtmSfj9pqZs63hj1Rw3Yzvyi1WHP8zwcYn4M+L6tKjvyteybf/k
	RVuatFLySu+JNeFt2rW58BqAZp9/OZvFtzw4c6TDfstIofSYLaKVfoz7dp8/buNs19Pq57AFcCq
	fvU5o9uS0WsjcbmweqlMha6/Ui1UIsT7T1ih1tgZh4Lou/aBCzY3ESVHnyeP58vR+hk6Nt3tYb2
	eTUqAnYJ/VeBhMf/J7TuJZMAmzt+ym7oWLhfb0tvoNkbtLlb0VlMHBT/9OvKCl7q4qBcd60mtxe
	V/6hw8/ZmO6qp72FTAGPgqf9f4NvEZ6p/v7Ds109l5+vHH3oPWSrPoFHSCezeqTEis2O3e9m+PQ
	aVjZX2yEhPL6oefXhgHLs1AydMzRD+1Q3G6g/aTjAtIgSoahX/5BAwq95
X-Received: by 2002:a17:903:947:b0:2ca:d151:383a with SMTP id d9443c01a7336-2d32c0cc361mr7438375ad.20.1786455386130;
        Tue, 11 Aug 2026 06:36:26 -0700 (PDT)
X-Received: by 2002:a17:903:947:b0:2ca:d151:383a with SMTP id d9443c01a7336-2d32c0cc361mr7366555ad.20.1786455343945;
        Tue, 11 Aug 2026 06:35:43 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:35:43 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:30 +0800
Subject: [PATCH RFC 01/15] dt-bindings: arm: Add MPAM MSC binding
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-1-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455317; l=6447;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Ow6nsjOKfT1BtZK/wCsIgEjpwtBp/p95hFXIvpOx3ZI=;
 b=EdSUjmcrYtIFf72Wox7OPHGBvrR9StE8yFfxh9fmh0idDUwcfqgLknc7J1AmdnjMfVXof7Ltl
 H5g9SbLwKLUDMzkG/puZnPQsXNTSXdUJ8eozCOIenLS2lVhPtG/cR70
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: d4bHVJiG9-D-FbZ5tMD_NHolsU3uBPN3
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b255b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FqHZ4tX-ONj_CKorFbsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: d4bHVJiG9-D-FbZ5tMD_NHolsU3uBPN3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX+wuc/yO50sY+
 FVqYv1I5evhlnDlfSGwzfgWRBI4d5ejou83+/US58wWe7KIe/JyD6QOWUMv7Qg24xURwrGqABU2
 DvjajThu5/wt9PAGoydvHkwLJl6BXU8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX8rBcqZkUY3xV
 qyzG74430RcMjBEU3I4su+BPGZMA4ackf+6NIZOPKR2KVXNmLbOOR+036NPDKR4DMBEPWJUh/vv
 dSqzc9+rWFxvTCitG3nUFDqlMor/QUGArm3k90D585pwJf/MIlAUxrAMM/gqMyTcVWy9BT25g8x
 AzKOhl7NormV5MygCJz84a1l/PnwevheTEopHySS7kfhPFwqFBAV+y6BYW8Hm2AyvWb9UA6Ii5I
 oT0Vjajlz+VRD1ZWuJd6g7kPgjWFSZQKq+Wom4PMdrp0p/iu9V7gfNITJHF5jk7YscahmfM+dSA
 uPVWvwr04iqSHwJNH9Sn3X0AQsd/OMKb21QMR/VJZlEbuEA9LKdgfJG9T7aukJbJ/0L6CN5HYz/
 6xQRSwHLkWGRbJpoHP/1DZDmSS/0mwwd8d+NR9WIHGE3aiFjtvuJNuUlElbsa0nUGWY5y/cgOHF
 rMwaXg+LZUu7J3Z+YeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

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
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 199 +++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..53a6fdbbf05f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,199 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    items:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - const: arm,mpam-memory-controller-msc
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
+          - enum: [ error, overflow ]
+      - items:
+          - const: error
+          - const: overflow
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+  numa-node-id: true # see NUMA binding
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
+        description:
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
+          device's affinity is used.
+
+      arm,mpam-device:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          By default, the MPAM enabled device associated with a RIS is the MSC's
+          parent node. It is possible for each RIS to be associated with different
+          devices in which case 'arm,mpam-device' should be used.
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
+  interrupts: [ interrupt-names ]
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "arm,dsu-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+
+        ranges = <0x0 0x30000000 0x800000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+
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
+            reg = <0 0x1000>;
+            interrupts = <5>, <6>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@2 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                // TODO: How to map to device(s)?
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
+
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

