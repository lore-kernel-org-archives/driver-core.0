Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519F8424D6A
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378846; cv=none; b=T5d8AEs6LE/cQ2mDHPEvV6LyAw7UqQhee4zDKyvzP7i7djMWBDv/L/tVfoQ+mh9WFD9z6OnxaBeGEeBRdpRTs2ccvn1Yg8I1FNK4Bgf6Wf5bUi0B+QdHmEOeXzarthuQxtYUQ/NG1FplJkR87iFCpZjJNhPUsI2ny0VrorT8S+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378846; c=relaxed/simple;
	bh=/QMjM8kIgdElOSlo+HE58P/0O+m2y0r6yoGjhktem2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hv9DvtIBrdsqQk3espGTw71vIRV1xZxvm3GoeQDPipwODVxs8MlDY6uglJzG2d7EJieY8qpsz/OjpXX+ZmhtNkoENImshMLvCpbPb54hkMuniIxleBUqr2E9A+XcB5n0pbAcnLkMb1nWbLflk9Z9J5e+4RzicdlGy+fv6RHNCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IOzJuVlX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuFIT2Fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IOzJuVlX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuFIT2Fo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5inQ04057533
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=; b=IOzJuVlXZwQi7EQx
	u3HlG79Z5W8Y2MZkriR6SxnBX7PotKni36qWMwYPLal62jZguM+M+gzPLGI8D+hU
	eg6QnTaGq3P6ntTOMcki41FXQ719ph54t7T2/C2UMxxQx0shE5TASJv2ImSZrkLG
	ko2BjoJNR89p6lZTfFKfmBVP4Jd1oZA8b82SM0nH1A5+Lo9+mVMXqqUaFWDRWkKx
	A7qJVJa3tmXjq+7YDHBo21Rc1mZD7aVsfTC7ATleaOuer+PH57sHetaMDfeE1H08
	SZLKvQSLjZhrcy5X1F0Vx9NmVrxdjlGApvuBHeo0J4ITDSr75aCCLk/B8sjL/L+4
	dOz+vg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hsssmq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so6718592a91.2
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378842; x=1789983642; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=WuFIT2FokLjmHaiJgGbVvxYn1ykvSVR4935PGksWCrBFAyGpKBGUJJlVkwmaxbBU69
         /9kcly74S2bUC4NpmWnvFHybDnIeFP6jfZQeVddx9v0iWYYyZguF51nig6EpIysHs2FH
         XGWC9icNDQftF0c/3MHzlEClZ96e4frppUA2QvNjkWklzFsif7SLTFrnGbXthmFgwlf8
         Q86yVy4zhvxbprdPgypclhg06ZT/TBJ8EsP7vzIIDg3gBs4FAnAqWCPJyNuXwICgnk5/
         +k3tB3PJpiZYU5DjMYPNARj4VZ6xNLMkc8PK5Nl5krTOB0DOcpCN2Osy3R7Y3iHSJYC3
         tW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378842; x=1789983642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xUOv7CaofSadg3VAAhDqr9l7s5Rpo1MskORMDmWB7lw=;
        b=WZuQBj11BpRzClr+JILpeBvNIOB7dkCtpve3n5+l0NCyFet6Wz7wQJO4GcOBhgyi7l
         KVEAqf9o8Fqwt90W4zuPGtB8PP5lq4RlDuawkBj0ionFFWloEe+gestcUfM9k3h3RlsK
         NsaEbOEWefhccRdqELHq4m0FxyHHAeNdqzQnEvPsUC+qiokWy+10Vq+jH0TVzzl7v2W4
         /aDL+Q2hZ/ZHx/GjiN9cWDJj6Dr7raB1qcXOKoSzt8Qzu7jfUxaDs8N0cKIMHMbVdz1s
         jh3gYOpwR5G8BcgDDCAaBLwgXU7WudpAHLzGzfaYFcn7xxd/v0hyVnB1VrzV8iVzYIt7
         ef1g==
X-Forwarded-Encrypted: i=1; AKwUvByIsG52Km80CQkUT7qA0yGqRd/4PD2bo0UqcfnvfFJA2pipr7yJiNH2emr/IsUeYVxdCWloDLduvR62AA==@lists.linux.dev
X-Gm-Message-State: AFuF++l0XwLAOQPKbhdm7YSHZtD95QhJEf7/+HrW3kJSqunP/FQsmuu4
	LzNrxPsvGHi3/+CHvBU/F0j6yAMvMLgLYhw5KhA4N0g6236Uv6f/hfFRSy/3JgHRvh2pc1FFrb8
	OmusjooqJaGRBkdgyNkkvrDYCG3ZIO9z53dlatesP3gK4x/tJbs1RFN/6J/tYoctBOg==
X-Gm-Gg: AYBFou2pa7GXK9PcxlVwkOpPJgFxB/W+4U1qxDTeAlmqKIZxVLQktqHiijPnCoc80ii
	3MuQTGK/QQ9VaIS9RboRGP8SLo9gAvbTMb1HnoVVswLROUk1LuuqHHp5THRrOEQxi3szwUDxvZP
	qaVkKVCM2Jg4s8w/qTU2NEjj9/rtFF8Ef+AhI/81MqoL5H41K5r2oE4/DZKPrmO1fpOr0Z5Ig3/
	Ixlv9/DK+hkccdzBgtz0JTmigNvLuRFoCKa1S6GiCnwDo84XV193IIZHDeThwrqVW/2WDF0o8gV
	bsBbDLB444ERHFSxYMEMwnxI8qhis5g3StSp1taLDWwrohRzV8MwEgGBwXFrINuHMIPh9/Iihoo
	RCH7LUnyrf2YsYSuz05OxhzL74SXCZ0J5ImiZ8Ah/OU97ZtDMF6PCy0Z0
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr799677a91.15.1789378842262;
        Mon, 14 Sep 2026 02:40:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4984:b0:39d:f61d:7ca6 with SMTP id 98e67ed59e1d1-39df61d7d1bmr799596a91.15.1789378841750;
        Mon, 14 Sep 2026 02:40:41 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:41 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:56 +0800
Subject: [PATCH RFC v2 08/10] dt-bindings: arm: Fix MPAM MSC binding schema
 and examples
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-8-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378766; l=5185;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=/QMjM8kIgdElOSlo+HE58P/0O+m2y0r6yoGjhktem2E=;
 b=8GP+/eE1ihxpjc1D5+JwaI40o3SddpMHij/oEBZPzRJi9AlEFwTF+xGKazd6CtDo2ECYdzsxk
 ayDwgtPlrNbByU4vyLNxTZ4wfQRSS3cI/irRbXp9iHYlbYInj/lLwdR
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX24FmlEB4xioN
 TSa5SRtXsftW/bqF9aNU4db4IqukM/WbcQlp8m2T53ApJOmsc8TKJ0LXZmTbgnUxICKr/Oh5xkw
 LWNURIrMh0nVWza+YvDrzGL6+TlOPihg/lTSPA32DTpivMCO2EBvC7HYiQb1XJ/DHjvUWzwA6/s
 VyIv8HWayV+7VVoNb7JcMsquCQ14zT0C/txKLm+Y/WITE2AMRpCZzZH4Wlmmlqo9BbcIJU9Tq6v
 CiiKPMWuK2v6HGWJ6aRQUW5+z7AohwBxmEdF8DHqKwQc0RaqoDXSPt33v2+dtYxe9bNavU/TUZz
 g2kiB2vWsS1miLRuJSfridXzCZUpS2Oz15V8dgTs7s4H4dW4dNIvJejp/86uvFR43Cl/x3TQbwY
 xzuxzQX0agnT+uZ4uyb2lJXVDYljx02RMBABNg/cYteDj0UxwLNo3+aPBiJQ0uf+WNJqbLgl1ah
 xCTpJFMccY1wEvyMnrA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7c11b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=d9rEuZw9YcPYe4YaNdcA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: KpTk1qMLaSCI3Kr5Q_2uncMptPY91NAN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX7zGsjNUWMDVZ
 B3U4z1y+YKaTz4OYAbfPNUiQgsJhxeTDyxMsT46qUhhaXtZrhvqzDfHeULmI7emNzpGxNCOv4US
 EJ2bEp7YLvp+rxz56RD3S6LhJlKM+0w=
X-Proofpoint-ORIG-GUID: KpTk1qMLaSCI3Kr5Q_2uncMptPY91NAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

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

