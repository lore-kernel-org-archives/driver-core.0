Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B4A420486
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378806; cv=none; b=kWgtrynKT84YEG66J1+5Q6b54/JAt+YTpY0R2Dx2D8Ii798113B43VfhSL4kWsilUki0pCn7pUdIcFqIr5p8NPoKRpluGC/+5nBp4qEov/7YUOl3don3olIf4UnrLTfyPfI9Fo15H9GgsUD495C/MJdazqlE7QiKZzz2V194aHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378806; c=relaxed/simple;
	bh=Q1SO6EtCR75JXe3JpYCv7OaNJuuMIm0WdKd+5Zw+RCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z/uUftdKu0rpN07byVV7eD1+g23Cyx+h1uDYgnsDOMoz+Lptp2Lt7sdaecpODGmA7wTH7rg6rriojrdHXpKDE/h/kf+t3G2WqBXuFeuEtYrlgxQ8F4zBEcoavmF+dMNmiW7jD8TnEW45otpUufV+c8tDCf09yzteCC6szn4Udms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHJFoUe0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=csNoMpxY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHJFoUe0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="csNoMpxY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikD72626945
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=; b=aHJFoUe0U4P6bmfz
	PX35JjrmmrCaMDJgrPYCM8t6MqWgKnVtZPZn+ElJXhrlO2zDuLHzlyv9JwvQtS9/
	DZJJHAFDfsDnOZhZHqdoiBd2GVHn2436wVZ72hME2o+Rc6q0la07TWZy3DXCQIQR
	Tnz03X0XVhws0gEWvgmHAB5wZZutMe+Raa1d25K5eHh7mMYrwFO9nv76rWfdOizH
	5t8LiOnQamEB9AePp5T/yUilh4s+s4nW8OW9AzfQ9RSzWJmijeL6r1KAuHLyeB4x
	Z41s5ONEZtJdHI9oxmVyYAMPYEQ+2Qur92p54RJ4GY6bMuGS4dvdBIOZvW0AMalj
	Wj70ew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5u35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-395543dc382so4193921a91.0
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378802; x=1789983602; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=csNoMpxY39+55hKYlj4ps+6vcnVitGkIiOHdZ+P/H5AHIt4PJYXClLdP4uKPFzeCMo
         Nw3x03c/EjkT4PJS4Ix+rEp39ufWgiFgBM7zqBWqtYKwiSMHnO5D1rExMQ9ZcBeUDQtO
         2SzZK+k9pp6YpYp9/oUBMEr+rJ48CFp4a+uxiPyV4f/t51r/ovZM1UkQP9uPnecMtX0Y
         0mY/mI1UN+y8yV0aB+haLbq8dcnXTSF3DhtWl71io5IpdjNHEDfhQZOq/JN5/LXRgELq
         LWqf5ZyjVxafy9+YLSq5dJP3qMBukz4A1m9+TLAaNHYuBoB2v8G0F6+cbIHSSx7b+CLA
         mfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378802; x=1789983602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcHuExv7ntKhJgMZFmAB7i1tSGwudIpTtAVbjxinbE8=;
        b=AkzecYT8sEpJBzqpfLrBrs9Ha0ZThppIeKzZ2W4NVpCVmtfuMNPbW3KOVPMzrSNWmI
         LqcQpQcww0atRHhx0W71R1wyHEG7t+nAQnw+EQN4E0NvMnprtEKcRBn+kPsJs5Iy7py6
         TD7Rcqml0kbmYiAOU3D49J8DgELnjUCqILFM3jJwEe5ybOjoog9DWeLa29PUN3s+x3QV
         UFcZrdOW97ou9jiVHuO/Xy2ZZR0+Jke0fHjt2G+mnbv1Tf+fJgQJa4pnQTAZ0nW8G6mR
         o2CgXHutHoLkcTs8lrHbzPQ9woh6yvGM8mJjuhBYtkn+eTFya0LG0v2T/z4skDcIszOa
         jHNw==
X-Forwarded-Encrypted: i=1; AKwUvByJh17BDgpgIykH0JMbjM4ZV5C6UJT1jPsVkZv28n2Lv+QCI9lomiSdO0Wvhf+bZ75+Y6UdXom1l0Htbg==@lists.linux.dev
X-Gm-Message-State: AFuF++mQfaEFeJ50FcB1A8MuXbryGnW8LEUcw3gYfuEJ9JYFAoEp58V1
	hxbReEteNgklQmMr5WTUWJoebSkQiOVbjglRUsiXh0Hn4iDPKs5P0zuVPblyrAjwT5dv/u9n76m
	mOOQTNJOx/8Lfs8l2Xv7u3Pn5Aqx8YLPIjKIsocKiPxYouEbAtI4D2YV4DIEJpqgKZA==
X-Gm-Gg: AYBFou1hrpYJy6KhCzyHwnX+X/LS89hKYs57k+bFovP7JJIX0uxg/BsJxM6SqOuPhyU
	aL6i7FNIMAMvBTvNVm5ou8bdLa1/bZeY/sViBTc3fkTQQaP/uwTIxfpk3Z832xJY8FwXqMhNcbN
	FboQfcVIISlsADoV6iRut5TQF+vVHsJC3HC1kt6HdPEf7ejeTYpMQkB8Q/Tn0ufu1XdeGJeGaMt
	hOxi+odNm5L+lpTYskVuifeKYelhYN6sGILc/TGF6xXziCgB8W5eddAwXWYkNDNzgFU+QK6Bv2t
	3jQ2A/MMm14ZuACVDzefiwYuj6r8VJTAaHeEAwmcl7RvcX4+WizBfUYwJEEDHDguO9gZwzb2Z50
	Tphqm2tI9fXjMezsCCT2z4MGMJl+32stuJ3A5nb1+O7sd1aWLojid2l9G
X-Received: by 2002:a17:90b:4d0d:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39defa9dd52mr2252563a91.2.1789378801896;
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4d0d:b0:39d:efa9:cd25 with SMTP id 98e67ed59e1d1-39defa9dd52mr2252522a91.2.1789378801416;
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:01 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:51 +0800
Subject: [PATCH RFC v2 03/10] dt-bindings: arm: Add MPAM MSC binding
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-3-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378760; l=6447;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Ow6nsjOKfT1BtZK/wCsIgEjpwtBp/p95hFXIvpOx3ZI=;
 b=x7FrWzfyQw20XZhZOBNhfYnWn2cwebvQR9HvUByeGHDRQbXH5+wbqauX7T56oAUlGWmLaBnLR
 7FCUZSHVECOBeI4oK7kfIhrK3ztCkPOMmNwOfkX+ArlwVuMcgKU+H3j
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: PQwIUsifdfewJbqNHA5e8Q3o0m7kV8p-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXypaNyBbxKpOq
 m5QbGqPrDo/PfFb9QN5G793Cp9gEQkvwCvCn+8ufOiiSKDW4V8l/W4p7kaaLyHBXh9zFXF2raei
 OTZPiFXifmIbyE6TvFA3hxoDgRZ1rLpksVM2joxGeUrcu20KKGIjaIEcgMV82pAwsIabm91bW07
 vmf+noO54lavTpS9fa6IrUkNhhjHC58nc98R2qSK+WRFc3WAWIrmOKhk+IlZMclOdJ8nxEdeZEQ
 CjmhUEd5ZqmllNEdX6RKkGXWnkf/us5H9DSCGb7igWftch2evkMIf6B62Bhv5Q+fSB/ZHFMpp+K
 dTEW6yx8IneKeaLcEtzzNJGcbAayDW11aZbx0OmDJWwddsMKpJG1zCs2+2AhCbcIcvRmJnrcTmT
 36xw5B18Zx0Scdi13LlXHM71pgrSV/hLKszghoTpHge+sZAoncC7E5XAAgHuqDHPMx1g1f1emJq
 aS3NlaHvB918GdnCaCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXxAlPtR/6Xjpd
 hqJN1D/7lgjeXtwH7T3tNFGfDQPgjDye+iv5xiQOWajPXFyNft6VtUXyGPcOzwC10qdK2y3wLOV
 TQp+fVls7XqX/tX2aScYnOCNFa46uHM=
X-Proofpoint-ORIG-GUID: PQwIUsifdfewJbqNHA5e8Q3o0m7kV8p-
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa7c0f3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FqHZ4tX-ONj_CKorFbsA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

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

