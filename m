Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188085;
	b=ZqdY5MoETIQ2j6eWPscigioUnceR5yRlRi3Pz34uFKz3KHUPAvxY0ZlVeyegwGojrhZb
	 567Ko+PPEf4zN8Vcrurz5/tRl6auPhxI+4Htb8jdzmr++5H91L17B1BfBdZjJHkWL18sF
	 v3biLSjcXsfStc/i7qa1xHpFhVdmxUbRKRpEpZXC7F3c/i8q9ydLO9kHoI9LnYMxH6RVX
	 jVLkxdh3rlBX/nzkBVmrqBZJfFfmvPUaXj2lczEV1gh4wIpaceWMcw13YKfR0lXWeszva
	 xl6rT7fDyhwSGyFdIsPlBx0kSBY9IOWWpRI8W1nhC+fT/yHTqDzI4ycH1cqB6h9GUHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
	b=AvBp7z12UTKDQjRUBAeQIGSnj1pF6TjpF87Zsq/Wg4OeXr7KOLEIaDWJa0oKQDo5NOGj
	 1vBG1bsk75Zewe//EbFPxmRmsLujtpOVkeZX4Rpe2ST7MG+AAj+LdUj+4aLTmN7M7WABf
	 /KLVI83VuM08TtbFT2pzVSjI5KWU455FwuTKKqZkrLs5N5o/FMIA/GG6FdYaLnvxtHKLN
	 V7A6dCjh6umGp8bDUsYwsgqfKEqP7Tx98KE5VHS1O3DravznbU6z5Kl28UJ4q2uIH+1Mv
	 gaQB1dDwPppynttehAITxpM/G9zAKwgCi/DJBnjWixK35NrkWagFXksyp+5Z32+NmjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eE/UL6xg";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6CC606A31E
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G9EIYHDe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eE/UL6xg
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdvwF2082338
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=; b=G9EIYHDewyZC9pXP
	3ju6CGwJZw7Ujww1sHYT+7aynqaUpNLbRZGPsv8Tvphc+FWzrHLfL2hTrN2KckI3
	Oszeg5JA/y98c7nOsW3wXj7f6I+CFMreOCcM8TaPc/lg8vF7HO8WrzxPgdc7bve4
	AiwMrBA6PCatm4XTdvgsmU0e/NJCFU4yA9k6D+7gbtzTSPTsl3KMoIG5Z++jQC80
	Rdp/2OBbHcZvKxBmx2y74+SWfwPvAJVW6zYX7ny3q0Shr8cvTOA/8UuYPjjQ9GqW
	FHsT0qT5Atlr9KEjg0Yq0Cb4J6Zr4z83MwZIE0nZKKFplvzyBA0UsxBPXL6kdAUV
	fPOT1Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjputpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e832c03576so13533455ad.1
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 04:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188084; x=1793792884; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=eE/UL6xgqAy8EH13z4XtqjIuMF8A2HL4sX++mC+XP6hm/p+7nSnGuyPAqOCwjwMInU
         1l32fEP2fFJjpY8q3RKr1tupKJivkmxauYF77hCmOm2VRblknpn3h4VNbGKJxPhjUhmg
         /FyCO9V0EJvXRrOT/3VPJF65NsLYl5fBZgPLWM3k9E7Ko82eT7zh97C1L/nYH0wYK3Zz
         oZBsdqX446M33GaFom0QYhSPSo/H4VqjwxNMtGklAXzLacFVVB+0pPTXHlr7FF6Izbg+
         trmLjcURkh63eGIrf5J7VtX+Sb9CK5F5WHL81ANCWJm8kP9H7WppD3OfRTVj0DbOS5id
         IG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188084; x=1793792884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LswZd/ASoQRrZpqIJhj7fW6h5DTUVttYSjl6IDr3+oc=;
        b=vmosCO8M0JyvVG1pvCPHjbgDC9IWLia1Zfx6EkjFNHazV2hc8p6dkOVUPSBiAPQj5L
         jng9OZ0k5vd9dXOf1okzzukE7KjEhCHtaJZ76SNdBOA/cekx9gxSF9FyyWZAs5tmj9P9
         09TtmljMZdasK+VDDKLDgoEwW4x7+rFgnGsjR2dI5jZOsVecoaktCNlNHEFQVu3nybiv
         9xMFvrD4I85/Eg5ZQWjVtiobuhN3Ya6fFqryP1zhTKpEHaMeQjhQ1A2RabmVhYZ9ivKs
         dmRroCAo1tzsXk08eaTKZlWeUolgCflPgDkFCcr1tl4+zM4/a1GOJYRYWdpc+pR+St6j
         uJLw==
X-Forwarded-Encrypted: i=1; AKwUvBxB5gNzgbtAGyHCMmXU+Pj/U1qOzFxJY17hz1W9zk3dV1SPYaZvsW9MLXVVLKfRQ52yC9HDIPXbgZ6lsQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLfZ0VByf2ta3SDHof2gMu0C61ToJBFSoZubS86Md1VpP5wvm0Z
	hfEX1kUCfwaHbiTw5qYlVxNGA8xGGgZ2gl7jCCvPYydJqgQJuZbxuna1YOyUNSPqS3h37xcNT0W
	vs5GbSy5UADaNlYkUMPyBxUYgL10AAzEsOE/ZQge64xNmGJrWbC2TcygYp5POsLcHng==
X-Gm-Gg: AYBFou1Oy1D6H4Zvb7ZLvrcYL51HDNMYeyo5Qp9h8HHxIZmcZhvyJ/YL0zDfcKXCPnV
	ndc8Ev3cvULx+QkYHRF447MmswsCfAdvgrq9yYkRtBSiXvch06B2y5fHAFXQFt1DPUKb7GsoRm0
	dKMdE9KqUlQpwrI/pCTZmoU/SakImRX6lgZzv0UIezfawvw0I9QFGIvT06Quy0UY5gJqJyv6nKf
	r0Z3DNKDF6zpp6E2JUrKDBnJ2X8A7KH9oBghRa+gDlHJIsvECwU2sNpAp0d/5lquXcrUdojFe7N
	RtpL4DKmkot5nbtygUhZfqUBAo2XPfpauEMalLZGzZPsMkQCVag4SrxdLCBqURcAostY8aKylcT
	AXamm3gNu9OcSrfgX7paMA93ycemJMjISegDnKg6DtQzSomXWfHLASlueiIlV9k8FmGS6oKmzGJ
	X36t43FkzQTpxbmKEC81WiMhkx1vSz
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174805ad.59.1793188083556;
        Wed, 28 Oct 2026 04:48:03 -0700 (PDT)
X-Received: by 2002:a17:902:d4d1:b0:2e9:6645:e9a6 with SMTP id d9443c01a7336-2eb005a650emr19174475ad.59.1793188082951;
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:02 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:43 +0800
Subject: [PATCH v4 3/6] dt-bindings: arm: Add MPAM MSC binding
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-3-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188046; l=3009;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=8PN3jSMZ/mskk1bxkWM3cKZzjFP8ZqH1EBcyaOMTbg0=;
 b=QWyVLshjnniVm9WIuAHK9RFKC1Ym/nBG3lrXTz4mbtssrfXDgAXVJPOmpEbKpFuCoaLZgBk2I
 SFDmSOAvOcGBmxG5nLAbhKzjZmoTp9mAxYBABXBUI5GwlvpR6riun1H
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX3u+IwyBFuPex
 YKtH2QTbk9Tb1adGiu8hY2t0lmzWwEcuPvOeGz+JXYJLvKiZit1cfAw5QZJQGdUIs/dPxXJJQlc
 0GGGSE4C5Zjk59oJWFmEPFfVpFR3wsS7miQ5Zvl8wx1zR6dQFGD2DXWXZPnoLM0hEpeZTiI2qIS
 mOwVPGqtWQE0pglLXhbDub7WvEO2DW+Vir6iGHWvtWVFk4fmQOx9gC2jCFkJr/b0eq/cYE+YGP+
 uraWLFlk45oLVWjckPBhx72Y0pNdsiob1uA0cssSVN3xxVQVP5DMBhQbjaYtHq2Vt8lPGPJHkPk
 lGHzuk5LqKnmkUXe3MRml5DTpAUpk8dqas6h3Sivib1/munUDGo/FxofOuLdS807nq3aVX25hd+
 KA3x1Dr90UAbzFg+g12h1jBdW6PAoqrGrrEvd2ITxfHyb7CAY4GZO/Z9Q+Qsv7Wo1sNp+IwP2vR
 L3LszsfOfa8DjDtuzGw==
X-Proofpoint-ORIG-GUID: D72bwmfQ045quVoCwCaXQ-4mufAokIFv
X-Proofpoint-GUID: D72bwmfQ045quVoCwCaXQ-4mufAokIFv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXxQiZNOooI+/K
 bNizCnIBcydMCwFU9aF95XlY9W+BZTH3Ifkl5helFl++99zuCCR/q6ItBSPwW1y9BvRaiLHXOLJ
 Uhycth7Mp0gXRfEiFVCnluhPFdk1qaU=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1e0f4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Iyi0AkbGYOnUpVGOj9oA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller or cache
controller.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: fix schema field order and yamllint spacing;
  fix example reg addresses; reduce to minimal binding covering only
  properties in current use, dropping RIS child nodes, memory controller
  support, arm,mpam-device, cpus and interrupt-names ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..523978900d3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,52 @@
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
+    const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+...

-- 
2.34.1

