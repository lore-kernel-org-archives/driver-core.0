Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A7322F388
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951037; cv=none; b=YQtp1+r2QOOKCVomTpJ5VgLG9z+MTdr8Pav1pWf2EnYwApEvfVFpoCgQdcuJ+AwWtj1aD/Q6hb9QngpIu8wIruyh6B69yHzGlHgYCb3Sk/fGC1W0tEFQ0SN4upiHgib12FpWgt2FX2m6VWrElW+/nuZtKPPYJjckCRrpeiNKKKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951037; c=relaxed/simple;
	bh=EqdrZDhwbeUXkKMJ4KC0f5Nf+jlPc2iG/3BjVoOnKh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMBHrMJJ9gX3hzskQDDLElSaXMDFxgfmSm8g6spktG1WS2aKISCKyyQzpBviRqg2JgS+vh2JoSGsE1nbhV0+qYVPHiw+438Ch7xu1WTMgn+8F0/Wx44b5+uiK8j2opNSO2oPHp8fNEUV8kUsEn1ZKpAQ+tDzpVI1+khuMJk0B50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkLmNkn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nk5KIdsL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkLmNkn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nk5KIdsL"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NBwiTA009885
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 13:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxKnnpsONYWDC/UdxZPj9n7rzpecjTFOvlyc5AqI6kM=; b=WkLmNkn7VwC2zF0j
	9ru9bL+9hZNmCUHDzpAlo2Vn6XYfy+gkgR41grcxb7bJdvzCwi51w1XV0W/wtl+N
	shW4kos8aog2IE6eW1ybAJP1ARSFsI0MMaVfJ3UVXkxF40n/SxKEnUOr90WqXPkf
	HS/MCCPo0JJhVplALEyPr7pSWKOpRYXR4mBLhL4O9xlO7yQW2QiNiZwyNFHY1D3a
	FcICWMhTqPq3HbZbI4Yeifgu13M9KBUTGgTcmZogzKQlHm7EUXOy1oxk/PP0D9Bb
	3ag4FFzVbJsanDg7iIN2SIaOgyoVgSRn5Sdhb/sO/uaPlPkITZl3a4mRR5CrtbQI
	JtVVsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk178a7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 13:30:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b250d3699aso136953565ad.2
        for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951034; x=1777555834; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxKnnpsONYWDC/UdxZPj9n7rzpecjTFOvlyc5AqI6kM=;
        b=Nk5KIdsLpAqNil6k+H/8Ke5EkO3g9zTQzaVfUt5qA3rAS+7OzYTWVk0yLL/ZWS315D
         FuWDExp5G1Ik7ps7iaLu61ImbEUdPEWFVsHimfdQzdaplbBvRbjnxyaarHKpsydABEZu
         25V61D89LfhyvV63e4OHDLq/DOH482HHKQPMkWKbZ0Zl1v2WcFvJhu85+gW0YX/0X5Q3
         GBNvd89BAMkDViKEH9aXTSnX1nwOBATwFNu6lDCH2aRP9p+ttTLkhqm8EqH65u5pfLCM
         W3aEENsZubWi2VriEsu5kUiloT1MjRUjzQAu6CT19SumsUbzwOVL/gnvm9mGSe3x9nIv
         uJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951034; x=1777555834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IxKnnpsONYWDC/UdxZPj9n7rzpecjTFOvlyc5AqI6kM=;
        b=aHqcV15IUAy3XcJCiE2zdeusKx2V0CwlD0ew5/TfbyXDO3ax1Se0QzKbcfNk4W9rqR
         TX5kvSA4eU9wUTTiRdDHNi9Vxtqyz4tTznVpRpRwSjprKiVV03G2ROCjm8b+KpLcc738
         0XRsLxO0PQyz5G8fgiN8K1Ybyj3S1QYpy8Fy/Oikqtb+YATtgHlF3hz7RDjOrozw480v
         B7PqAVqOF5VNFA9moF1ONJ9SesW5qq4O3NpaRv+x7EYq7LCFeriMj6VKLIFL8XZdwHyV
         C7Gm4m1mdGZD3tR9laNUSzqpzacZM7ZytG0hZSLuEm2BaqLCud5tagGMD8gxGYN2q1KJ
         sD2g==
X-Forwarded-Encrypted: i=1; AFNElJ+rjvBlGWnJn54iUlu+9o1UwqPvfiRYTFfG2KZDk4zI9pLuyr798zWXF2QX4XfN6WwzoT1kkxyl0GRrhA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6nUOgEvNJeYsIbc2WLlzaGTbs3My1aUTOjaL7c3/j1h6Jdi4s
	4HXhw/VETLU+q1Xap9qJ/dqbz8VM+gOQbf/miKIieFLMwNNd48zOytDF3Egv3SgI0DWeuWWt9rJ
	mU11Buru4Na3JzYz2tdi7VwRZ3J8lPi2t2+d9pnvoYnLylRsMC3Tkgp1deTHboc+POg==
X-Gm-Gg: AeBDiet5vUpaeD4xCKvxlBIy7IK5UETU88TzNqx45ouD8DeBTYTgfzIv1PX1l2P3fxU
	TrJgPbnIoQkM1QIerEexfABFofghcxaGB4kU/kFAa39ZZqL/GkDnB7rONV+wJZwkKSoav9mBzYk
	uVZs1jU9M2y+XAdl68BYePLUPW4Icjv1d/IiHgZ7vuL1SnHLErGcEoSsc/b6CO6UrCP3KdCvEPu
	Roozg/7Vn7N3o7Nj1cwqCW+1Yo8KSDVFWXCRnEadG1unMcKfX7hgukPRZha6uLyhL8wE+01Ah0Z
	r9TkdYJM/SPq+sHrlYtokhPUhxoN4Pl2brRHMiggCZ6OauZVeR/wPPie2LN4/s54aArWfXCXN6k
	m0q2PTfIBMoX07AAzhAnJ9gD7azSsId+1/UVKzi+/9J6YVZ6RdU+Cu3EGeC9KQJucTA==
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id d9443c01a7336-2b5f9f3a802mr308921945ad.27.1776951033398;
        Thu, 23 Apr 2026 06:30:33 -0700 (PDT)
X-Received: by 2002:a17:903:2acb:b0:2b4:6398:6aa2 with SMTP id d9443c01a7336-2b5f9f3a802mr308921065ad.27.1776951032700;
        Thu, 23 Apr 2026 06:30:32 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:30:32 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:33 +0530
Subject: [PATCH v2 04/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-4-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=7570;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=EqdrZDhwbeUXkKMJ4KC0f5Nf+jlPc2iG/3BjVoOnKh0=;
 b=DWWeTu5sHeIIPoCMxxKeKnUf2R7cu3pGbQ+jYfdVZkIXigbOi/ygY3cFzpTJKwEs98YuT397d
 803RuZl0G89C1d1JcfrPcKhpHAcQX1cQd6AXFddmyDniHzZlnyXOdzi
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: m7UufYRFqOD4mPHEVEuEPCj6S1yPYHO2
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69ea1efa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=17OVpTNTOV0qq6DYWkQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX3plCtVTs9wXp
 ylYuotxfQ5sfbiGF8h6RouSnOht63W8Y5KRzsIXoRr42fQ4dQkgqN5DHzTFBBCWNxnD6CLaBevw
 KdVex8NOBAGucLm4gESOidMyRj+T+JhGOqbwJpFscChSe/eMW9g1mYcI3LpwvT5L1nc6gAPh7S8
 opwA+NE6r9OfRF6YIOrdFBEXiIljyY5flSe3Rp4ylOCrAWv1VmqLtZtOSpk4Zynd+1cz/bsgO7/
 Z6E2wX2iDOyiY2F1IClvsK5FWExXPMuWFrJlgvHw7NCqB+RmxWPnQAd/GSQW8Pu+gBeWpsF70M3
 3IS/dBetGP/kTEh9iTkuten7cP7dTegJ36s41mxb4sbbvACnP1GpczV1mNOn5++KKCqAtoOgZ38
 uHtu+gIGHppC/GyLOE+t4MiQuXNVzvlkJpDLnMHKPs9bIL/7yTUkJ9lW+zJoF5QtUispMwLiQsE
 bvrMT7VmO5yBp0yplXA==
X-Proofpoint-ORIG-GUID: m7UufYRFqOD4mPHEVEuEPCj6S1yPYHO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230134

Add device tree binding for the Qualcomm Glymur Iris video codec. Glymur
is a new generation of video IP that introduces a dual-core architecture.
The second core brings its own power domain, clocks, and reset lines,
requiring additional power domains and clocks in the power sequence.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 .../bindings/media/qcom,glymur-iris.yaml           | 220 +++++++++++++++++++++
 include/dt-bindings/media/qcom,glymur-iris.h       |  11 ++
 2 files changed, 231 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
new file mode 100644
index 000000000000..0fd8a8db01af
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -0,0 +1,220 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,glymur-iris.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Glymur SoC Iris video encoder and decoder
+
+maintainers:
+  - Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
+
+description:
+  The Iris video processing unit on Qualcomm Glymur SoC is a video encode and
+  decode accelerator.
+
+properties:
+  compatible:
+    const: qcom,glymur-iris
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 9
+
+  clock-names:
+    items:
+      - const: iface
+      - const: core
+      - const: vcodec0_core
+      - const: iface1
+      - const: core_freerun
+      - const: vcodec0_core_freerun
+      - const: iface2
+      - const: vcodec1_core
+      - const: vcodec1_core_freerun
+
+  dma-coherent: true
+
+  firmware-name:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: video-mem
+
+  interrupts:
+    maxItems: 1
+
+  iommus:
+    maxItems: 4
+
+  iommu-map:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  operating-points-v2: true
+  opp-table:
+    type: object
+
+  power-domains:
+    maxItems: 5
+
+  power-domain-names:
+    items:
+      - const: venus
+      - const: vcodec0
+      - const: mxc
+      - const: mmcx
+      - const: vcodec1
+
+  resets:
+    maxItems: 6
+
+  reset-names:
+    items:
+      - const: bus0
+      - const: bus1
+      - const: core
+      - const: vcodec0_core
+      - const: bus2
+      - const: vcodec1_core
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dma-coherent
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - iommus
+  - memory-region
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/qcom,glymur-iris.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    video-codec@aa00000 {
+        compatible = "qcom,glymur-iris";
+        reg = <0x0aa00000 0xf0000>;
+
+        clocks = <&gcc_video_axi0_clk>,
+                 <&videocc_mvs0c_clk>,
+                 <&videocc_mvs0_clk>,
+                 <&gcc_video_axi0c_clk>,
+                 <&videocc_mvs0c_freerun_clk>,
+                 <&videocc_mvs0_freerun_clk>,
+                 <&gcc_video_axi1_clk>,
+                 <&videocc_mvs1_clk>,
+                 <&videocc_mvs1_freerun_clk>;
+        clock-names = "iface",
+                      "core",
+                      "vcodec0_core",
+                      "iface1",
+                      "core_freerun",
+                      "vcodec0_core_freerun",
+                      "iface2",
+                      "vcodec1_core",
+                      "vcodec1_core_freerun";
+
+        dma-coherent;
+
+        interconnects = <&hsc_noc_master_appss_proc &config_noc_slave_venus_cfg>,
+                        <&mmss_noc_master_video &mc_virt_slave_ebi1>;
+        interconnect-names = "cpu-cfg",
+                             "video-mem";
+
+        interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+        iommus = <&apps_smmu 0x1940 0x0>,
+                 <&apps_smmu 0x1943 0x0>,
+                 <&apps_smmu 0x1944 0x0>,
+                 <&apps_smmu 0x19e0 0x0>;
+
+        iommu-map = <IOMMU_FID_IRIS_FIRMWARE &apps_smmu 0x19e2 0x1>;
+
+        memory-region = <&video_mem>;
+
+        operating-points-v2 = <&iris_opp_table>;
+
+        power-domains = <&videocc_mvs0c_gdsc>,
+                        <&videocc_mvs0_gdsc>,
+                        <&rpmhpd RPMHPD_MXC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&videocc_mvs1_gdsc>;
+        power-domain-names = "venus",
+                             "vcodec0",
+                             "mxc",
+                             "mmcx",
+                             "vcodec1";
+
+        resets = <&gcc_video_axi0_clk_ares>,
+                 <&gcc_video_axi0c_clk_ares>,
+                 <&videocc_mvs0c_freerun_clk_ares>,
+                 <&videocc_mvs0_freerun_clk_ares>,
+                 <&gcc_video_axi1_clk_ares>,
+                 <&videocc_mvs1_freerun_clk_ares>;
+        reset-names = "bus0",
+                      "bus1",
+                      "core",
+                      "vcodec0_core",
+                      "bus2",
+                      "vcodec1_core";
+
+        iris_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-240000000 {
+                opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-338000000 {
+                opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+                required-opps = <&rpmhpd_opp_svs>,
+                                <&rpmhpd_opp_svs>;
+            };
+
+            opp-366000000 {
+                opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-444000000 {
+                opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_nom>;
+            };
+
+            opp-533333334 {
+                opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>,
+                                <&rpmhpd_opp_turbo>;
+            };
+
+            opp-655000000 {
+                opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+                required-opps = <&rpmhpd_opp_nom>,
+                                <&rpmhpd_opp_turbo_l1>;
+            };
+        };
+    };
diff --git a/include/dt-bindings/media/qcom,glymur-iris.h b/include/dt-bindings/media/qcom,glymur-iris.h
new file mode 100644
index 000000000000..dcaa2bc21db5
--- /dev/null
+++ b/include/dt-bindings/media/qcom,glymur-iris.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+#define _DT_BINDINGS_MEDIA_QCOM_GLYMUR_IRIS_H_
+
+#define IOMMU_FID_IRIS_FIRMWARE	0
+
+#endif

-- 
2.34.1

