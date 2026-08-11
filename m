Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A35414A09
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455475; cv=none; b=CmjTUoe3TWeal8PNq7hjCwuYoNE4YtLZg280auU+YK6KnJFbksDMCU3W8XgYgVpIh3805QSQ/O1tn+qOlWGbWkO1rB9JZptbum2AcjO6zQor5BofW7HFmjpijPl0X13A0uRZwG0v77K60sgM8aeFAEAG9Bnw/GooeAxtWsoyMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455475; c=relaxed/simple;
	bh=/QMjM8kIgdElOSlo+HE58P/0O+m2y0r6yoGjhktem2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+C6bUsINFnUdzC05shaA+0wQ1lYrkJcxFgS05jWjBQjFGu3LuqZdIFooKQaRjPC4n1IVVkdvKW2QnVAKOZmfbFPbTfe9gsFdDXeoSAEwrtme+7HnVRohw6bud52u/fWYdey6Xu+k1thzVaLoIBMlUrw9Hd4ArCeq4PFgzlCGC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bRuo4s64; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kYzXgMpb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bRuo4s64";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kYzXgMpb"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWveg766913
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=; b=bRuo4s64WeTRMdD9
	7oT4flosl/yxL2Tb9565hragWw/8XNWYjl7b4a3X3oe42sAdQGO29cJJCpn1UTmd
	KAqys3CT8+/r9cXZThpeW07S4TP3xcG95ubNVZYJUYlenS9+MtVqH41BMxI2XIkz
	qdsRFy3ys/XMr0iZi6lCFJUF3DUGo/aSwt9VkJaPT2c7m1twQhluqHL39RdB0Inc
	1MQr0cI2xuEhNNgV9j6vuM9T2mfETqWmDHXncBxsvqyWd9geCgq0cBwrwz6/ZC01
	Trxhb1XxqE+Yw68vF1FLJ7gnz9wUukRYY3661WQdWUOt9kfHgbf/7iwyunrKmnjI
	qG/1ow==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q10qdv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedc1899f7so219078a12.2
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455457; x=1787060257; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=kYzXgMpbXiD4erxLOzkzVLak1kBHyA5pG09G/hdF9OjB/lA6f/iJ73jTyJbmiIyDo0
         P85+kYvHEMzmpDm8N0G3Ibih3qKCtFxECu1bf16vF8FTKsUv8bCOTYcRgac2lr7w1tjg
         2Z/lQpwDftr26JuUs00iZSrwauvH+o5oPAPiXHr01Faf7hHOjCNBadGFOoFb8u9SjWO0
         pU3AmxcZIFFlct5fifgc4Mt2W3YGPWMPNTv7spAQMr9a/XCUAaWDjU6fYSfpRNZ7FjSl
         lyMMNuRqAvJrEUS9RjQKqgZpXbLuvGG4iieKGWoj7mskghqxKw3m/YERdogT9NmRJGvm
         84iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455457; x=1787060257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=pej3ifrCdYO7pv2cCOj8wfa8AbVragpjq0WeGKHSJlGVxtiKrmkZ2gkHh8QgEiOABL
         hBkhmvH9QZ6QfX+dnfXwjIC2jqkM2IxiQ5YLkLEbB3zHCSTys16MoBFu4JXDLLcNdgie
         7Fb4X11H99fE19+vUlIiRm6IYSqj4BlpJ/dhBiDBIcYSk/HMPqyvHz/6fcEaUy+tZLs7
         U18j/mcZnmObbsq7pds7i2pwRRsCE3eSYR4yyQFi9ZqpO7TMsR+I3CfYUcIno598LzU0
         38QODIpATg0vgh221rtVRLhgPi4/JR/9H4CjzAYtDawJMqOTE9cKy82tUMLwzDfjn21t
         raGw==
X-Forwarded-Encrypted: i=1; AHgh+RpYIZ1XwkFpTB+DK0YdzW9O2F2VT77TMXhXH780Y49WtKLVK//pNva9wST+RXc3b08U/RL66tEgkf414g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUtokho9FKxcM1kgTa7kzwzWA9oRVWn+wBAtiZzk7YkI1SUKH8
	vRgfqzGLliCEfRuM9h3ioczdtEXqmAYRbo10eKco4ESCz2D58XBtNysISEz35a/JR6nGv8l+mvZ
	RW+uuS3J+8D1vz7PewFZ1fqeRMvNoLYJ/e5/8NTi8SmVZvDU0hNuVCdrf0lHYelu+Ag==
X-Gm-Gg: AR+sD114sDBbXrM1BVjfWnZUavw4CWlRpl9LZy7vb1qPGSRZdn98z1O1mMGqUDD8vg9
	FbNoYi8Nj4NXDwYCid1Re5TNBzs3wRrugHmJ0rSr8Oa+vajAd6qCrwIrq41kfYHFgBXMXNW5TcV
	qn8bcESZY0J4oY3C0FcZdB+VBznV6EhIlaDerZVw/Hdk6/PxHmpu87hYVoBkc4RzJaU/XFNTCwo
	RYH6NhhVNtfh1eoWO+KoXft57xVqHSbMrL9Kxnv3EzYX4NyVT+WZYDpFNriZZgOLJrDsHV6R8r8
	W5scS+0KmeqBVZBU/q02TfywfLY1bInoLuVmn0k6Ed1hNVidK6ZDnaB//OK0C+19lMFIpQhaBSp
	1NuLMp2rV65bF9Wa2gSVEIu0jI++npmYtkwft8NRVNzGKEzYzUQPc5hEV
X-Received: by 2002:a17:902:e948:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3178d4294mr44249705ad.13.1786455456866;
        Tue, 11 Aug 2026 06:37:36 -0700 (PDT)
X-Received: by 2002:a17:902:e948:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2d3178d4294mr44248795ad.13.1786455456276;
        Tue, 11 Aug 2026 06:37:36 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:35 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:42 +0800
Subject: [PATCH RFC 13/15] dt-bindings: arm: Fix MPAM MSC binding schema
 and examples
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-13-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455329; l=5185;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=/QMjM8kIgdElOSlo+HE58P/0O+m2y0r6yoGjhktem2E=;
 b=zHAvC4moxJN8hRDa9ArcM/sZ8ssDY1BUQR/2sHtpgm1ryjno1fmUcd8GWouH89DHPDZIjtyi7
 gzFWdhCQImsBCq7KbI1yxzYO2OQ4kXv8dCs3BD4up6aRqZhw0aaFIiw
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: JPmBb7PnibibuDTbS-LTTpwbzA9pe--b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX89VJ7Sh3N54g
 q1hQfjt+UTaGGWHv1yyWx8q6x6Siaif9AIS3ATfVG0CU3ynt3d2HaZyzHzguanea75PbhUKB1no
 j+nCR/4kxD2+SBw66sl8OrtJnrl27rdYeSyiBEFj9a4pE9/uJH7wTEoyJJMKPl2HqayzkDDfdmd
 Y+SpGV1Kt6fcgyVqUJWQ99huM9R7G0beR/r/lxLAz4w+uhEfDsOWE4ewIlBjJlyCTPhmsXPLDuL
 cSgGV2q9mRPSQ17sdqw3euPnVemUUlkqv9S/G0sXirdzN24ZlE9aJ+uP8n/Au1fRls45+PfCmro
 tOrNC07bNm7MlJ/Fiuczif7xpDwC0HeoxDz1eVM1Oi36Au3gNONaZqYyvg9WW/aiRbaFdtvJowI
 XP70kLZaho1CA2auUNYSeeZYwsdTC9U/FApDnV8F4rog5pPF+lGM2ed3evclAl94ZbhMyxFKyvN
 6GzL9PeoZBzK/LOQI/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX87YpoOb5D+F/
 ak/1yMqhVBDciIWQHm9143qZZxOHSdMJH3XDxcmEJeCvwc1ZeZotYBDCqTL/Yknc0e+HBAqC0aT
 6cLOP+ogUYovLcYMOiCnpe/FqA9hZy0=
X-Proofpoint-ORIG-GUID: JPmBb7PnibibuDTbS-LTTpwbzA9pe--b
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b25a1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=d9rEuZw9YcPYe4YaNdcA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

Fix multiple issues in the MPAM MSC device tree binding:

Schema fixes:
- Move maintainers field before description to follow standard field order
- Change compatible from fixed items list to oneOf to allow both standalone
  arm,mpam-msc and the two-item arm,mpam-memory-controller-msc +
  arm,mpam-msc combination
- Constrain numa-node-id as uint32 with description instead of
  unconstrained
- Add phandle-array type constraint to cpus property
- Fix bracket spacing to pass yamllint

Example fixes:
- Replace arm,dsu-l3-cache with foo,a-l3-cache (no upstream schema exists)
- Fix msc@41000 reg address from 0x0 to 0x41000 to match unit-address
- Fix ris@2 reg value from 0 to 2 to match unit-address
- Add arm,mpam-device phandle reference and remove TODO comment
- Remove unnecessary blank lines for consistency

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 39 ++++++++++++----------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
index 53a6fdbbf05f..3c7b13a23ff2 100644
--- a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -6,19 +6,21 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
 
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
 description: |
   The Arm MPAM specification can be found here:
 
   https://developer.arm.com/documentation/ddi0598/latest
 
-maintainers:
-  - Rob Herring <robh@kernel.org>
-
 properties:
   compatible:
-    items:
+    oneOf:
       - const: arm,mpam-msc                   # Further details are discoverable
-      - const: arm,mpam-memory-controller-msc
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
 
   reg:
     maxItems: 1
@@ -34,7 +36,7 @@ properties:
   interrupt-names:
     oneOf:
       - items:
-          - enum: [ error, overflow ]
+          - enum: [error, overflow]
       - items:
           - const: error
           - const: overflow
@@ -44,7 +46,9 @@ properties:
       accurate after a settings change. For more information, see the
       Not-Ready (NRDY) bit description in the MPAM specification.
 
-  numa-node-id: true # see NUMA binding
+  numa-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NUMA node identifier for the memory resource this MSC controls.
 
   '#address-cells':
     const: 1
@@ -72,16 +76,17 @@ patternProperties:
         maximum: 0xf
 
       cpus:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
         description:
-          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
-          device's affinity is used.
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
+          parent device's affinity is used.
 
       arm,mpam-device:
         $ref: /schemas/types.yaml#/definitions/phandle
         description:
           By default, the MPAM enabled device associated with a RIS is the MSC's
-          parent node. It is possible for each RIS to be associated with different
-          devices in which case 'arm,mpam-device' should be used.
+          parent node. It is possible for each RIS to be associated with
+          different devices in which case 'arm,mpam-device' should be used.
 
     required:
       - compatible
@@ -92,14 +97,14 @@ required:
   - reg
 
 dependencies:
-  interrupts: [ interrupt-names ]
+  interrupts: [interrupt-names]
 
 additionalProperties: false
 
 examples:
   - |
     L3: cache-controller@30000000 {
-        compatible = "arm,dsu-l3-cache", "cache";
+        compatible = "foo,a-l3-cache", "cache";
         cache-level = <3>;
         cache-unified;
 
@@ -109,7 +114,6 @@ examples:
 
         msc@10000 {
             compatible = "arm,mpam-msc";
-
             reg = <0x10000 0x2000>;
             interrupts = <1>, <2>;
             interrupt-names = "error", "overflow";
@@ -145,7 +149,7 @@ examples:
 
         msc@41000 {
             compatible = "arm,mpam-msc";
-            reg = <0 0x1000>;
+            reg = <0x41000 0x1000>;
             interrupts = <5>, <6>;
             interrupt-names = "error", "overflow";
             arm,not-ready-us = <1>;
@@ -155,8 +159,8 @@ examples:
 
             ris@2 {
                 compatible = "arm,mpam-cache";
-                reg = <0>;
-                // TODO: How to map to device(s)?
+                reg = <2>;
+                arm,mpam-device = <&L3>;
             };
         };
     };
@@ -173,7 +177,6 @@ examples:
 
         msc@10000 {
             compatible = "arm,mpam-msc";
-
             reg = <0x10000 0x2000>;
             interrupts = <7>;
             interrupt-names = "overflow";

-- 
2.34.1

