Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218860;
	b=K8Jc8Q8rowSyiV9bP55p/1xl04uGe/aR12mm6LtXEv4y69FTMgVy5zIaSl4n3AGLBlET
	 suLr1gpEQ2paSoJkpZfo5EoZQkqKg13XDl9AISuI5BmpLI95eNwHC6/tGhin4XCrzdiV+
	 8vxrPJcclMuofUch8eIb1cle1jGvt9Kqlgen2TxLnOflXB20KAA0y94KfpCeIGKrdGC1/
	 HHuB7HxW/3HTHBjZylmpNYmVeJIlresxsLNS5+1FjXdU39mGE0CnbIFzU+cLnAOCCIkRv
	 Zjy7PPmkxC6gKcs7NmcVXVspkmXtpyS8bQqz0wfTZKDHXOdr15ORuNSaaDohInRI7mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218860;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
	b=VFTKMgqMmzHuwXpO+9GnjqjWmYrvMhGE9KFt92j/vVyQ8r9ZNSX3JykvL8ZzIPXHEXEM
	 YmQBzCZvbddjNpfZ2SNMfDRdZ3ZgIEFb5CmBDT31EIUnrT5xjL+OaUeoAf/6QCGmCq8UI
	 iVdakhB9xnSrYtD/rxj99BfDmCjz9yvKZmSuMa7tJjC0lNfC+a1sPPmrr/ajnCcaPaVU4
	 LpCywBk6eWP7nFSxqTAZRVP0et759bcTmc3nr34SEkDt3dgXXPWsd3DSdxHDx2b4lOHOM
	 VOYoJbzdiGBtgjENeRrDZVnTpkjrdhCa54O9OzjId54U+YVtzu/KzRYzYNDFSjTCAnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpxvYk38;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KbUPkLnO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D88C606EE9B
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 10:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D88C606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpxvYk38;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KbUPkLnO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ukMG4130899
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 10:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=; b=BpxvYk38WwQFit5t
	MFSedYMf+M6QN4cY9tsRoTLUuEXXXias5NIYNgQDZSK4bjL9AGt9QMCGHJtab3tT
	kKWv7cFCV5TNdR0TcWWXQSUW3skkYk44cvXZAb0116+e5u1BNU4CENqYahNCZ2ji
	cUKyDGbgikgxNQ0kIsK2o4/cZf/KExK8EdAZjI9V5TgoMBv2Y5BvkEP0lQvaT5Ic
	ZdcVD4VVLybnO1Jp7a6gm0zL3lOQ7hvAD/AAVb3B/SD5cqBfImo61qjJv8k8ZzMv
	qmAKRsKYbSP3/zQejqt9G8pc4vkwDLpHIc6h2rUKD+ndJqJA5ZGplkMvz6Sj8Yy3
	X2x+Lw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hu6x2h5u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:07:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1166940a91.2
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218858; x=1794823658; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=KbUPkLnOmMG/CXTrAPqK0rg6JUukTH5VSktDQGfA30E1BYfiANM2FcG6faORzdOFLX
         4Ps/ZSdUzJaTp9yr252Kb1GqjuTgceMcg69IYFNTkYwiXhywuBETOkhd/BZy62AD1R4g
         mVUVE/qwG3I8L00Uh1ueqK0Sko2oauUNJ/OlBkn+rSFzNo0UK/7umOsqVfA3ZoCa4i8k
         +h/gGmla1yIn7D5TZWsKfb88UQKdy4kgGw2skcgbySxCqK0JaBbn1DkHdG44qosdD1PP
         ASHgymoZQYqAk5XRwMYRnv0a0zMAiG3/Mk5WgFnP5mI4hx2y3+XTUNm/CL969zkrHcMO
         qZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218858; x=1794823658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=f9KrM/DXfHbQRN35meNGXmcPCMmcXJhAOoDKp4HfEqtWcznZJ5sChOyLN0tCdkAhdp
         UvYJ8gJeZJOfnUzLAsG8N6LNYjMNDqlXkyHBIEzdlEVwXLi5tbKgtDmGpYFgGF5VuaNi
         e/+t6CrucqGgaqm6xbsOajO5O6asUu+xVZ1WJUybqhQ6xHuSZ7j8jbRi49xmv2qoFSxU
         Hh0px/6e995RsRQYq5e72SD6YkId6Ud2kmzPvyN0iu5Pat1CR3p/YhksKyOkTLLSFe6K
         +KFyxOCYujgJx5dvCAj7IZ73TNCdFGCVgTK9aFE+I3t+fRMAVL2HHNkuX6j8fypOJlo9
         uNSg==
X-Forwarded-Encrypted: i=1; AL+hErGQtV4L505xRhKpWrLMUf6sLnsC6tvZuWxe7JCGaXJZNzsXwspENiZnVc1DyPcYbwPG/W/qKZMqucRlDg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8y0k1WPfLVezYLJmhvOahj4XftJO6HEdB9gcKUNz7n31tMP/BA
	yYx2HuVI6Qh9M+uSI3E5eWepyrhFBG4WlMCkDUPryzo/SYnCcIGquWyGvjC/8X52Hqx+kxyBrjz
	kHfACLlwjTcZFyDdVFXgZg5nYEI97B2FmlYL6hxz8ipvpiBIi8jooHmDT24lWIFudkA==
X-Gm-Gg: AYBFou3Me70KpFz4URwtTg/fQnhqOBZf6GYT/q4rWQp028HcR4Zt54PknAgenPihBZo
	Af7OFdZbzd85+qoLMsGxExBwTsFXCfToBNuux0vEjHrnyGdcHGpVxCmwYKOCldFpT21k5gZ18bn
	Bpj1B1NulRnLyvnLjghDDS94FgskVCg4uC760bOpCDaxlFM5U7I5TuJNRGjtJhuHqvYndxqGmzt
	O2mtmoxVfl+d9ja2yXO7KgOKE5/TXvgLkiUmH26f1MkFAELQvD7Z+xb6fw6wrrSPSw4UE6NVsya
	V2RhoMVKyajlz/wAvuxeTE7E4gDUvMGUgGr0FDAkAskIlk2TdbRRlo4298f/+8IPno40t3EvXbt
	NLc38qrT3vy5Pq+W6sMPC1dthxqm7yiudvmKogQ9fyHA78Ipc11LfjDA+pAwz9+AgfgZ6hWJlb0
	de4SaZvQ/C/gJMGokc+DpgMnG5qsco
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421389a91.36.1794218857985;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421362a91.36.1794218857503;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:36 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:35 +0800
Subject: [PATCH v5 3/7] dt-bindings: arm: Add MPAM MSC binding
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-3-150335a79381@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218816; l=3700;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=e/4WBMxVgry2cHgimqp2+MIUEtdd8lkn+3G7LQuRoRM=;
 b=f7oXCWEU+g/ZNdVHeD/l8+NR/IDH0Sl7swroTY77eRl2qzAAyGazVFI9LO/ffeLo635HtNwpP
 bhjjbeLvUOUB7vajoa9VGVl80HYysz7epaRiuR2ArhXChsm7QQ/KZhH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=TMjQ2Fla c=1 sm=1 tr=0 ts=6af19b6a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UiIo4169r_Lw2UoxLg4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX2v3N9bdDOamD
 fOEdwcJ1koO8IjCp39Bd8HgBwwrEv1lQ30xPz1q0CXdYSmgNZAaH1F6SW3o+EMUcnyauMtHeu28
 iQuvle+rUBQmmXjOLyaoBmpPpXaGf+ztOOtfR8v9e7CvfGvZLdAzha28AAhc80o8ABa05u8HFr9
 d2oN3MWXeWPCKZKuxuNtiS0aqIxy3xd7O+PuamOxYFjtGJ8RoFE3bNXxzGa4a6PaU9neg5mZWs8
 0HIQszjrLNb6FtRw1YTx9UQF5yzYMSrsVIoO4GTzG+Axbv20/ubgZ4vWMZlB6CRXpIKRDpH+pyF
 SGxzo8uZcISa/PwzlRAbl/jzZgvcDckanYlVzxkGKrkXvtgePbYo/Zweeq1xprs3FFWdLZGhio4
 FlYq5q8D4VZwOj/i85Z6EE1PUaDOzP3Nvz6mu+KYT8s21SOvxTLzXydnmJtvwL/cygZ0EFEjsOp
 YcRkNVgWSV1qO2WwOPw==
X-Proofpoint-GUID: HRqnaExgFcGTpHg_yruQyItzNtx9TlRE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXzQh1Pbo6t02H
 KWPNcfT8NzXmzZUxHHVaKAeOT41Bp8wspIq+HV3AMR9mUjTTzGQK+Iky5ux2glftuCQDgA7cZ2+
 BZ+GjAlzPeup9lCyffeLVO0totAz9as=
X-Proofpoint-ORIG-GUID: HRqnaExgFcGTpHg_yruQyItzNtx9TlRE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will usually
be a sub-block of something else such as a memory controller or cache
controller. A memory-controller MSC may also stand on its own as a
top-level node, without being nested under a dedicated controller
node.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
  standalone arm,mpam-msc and the two-item combination; fix schema
  field order and yamllint spacing; reduce to minimal binding covering
  only properties in current use, dropping RIS child nodes, the
  explicit arm,mpam-device phandle form, cpus and interrupt-names;
  replace the memory-controller example with a new top-level one,
  showing the MSC as a direct child of the root node ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..b52599b47a1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,62 @@
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
+    ddr_msc: msc@40000000 {
+        compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+        reg = <0x40000000 0x1000>;
+        arm,not-ready-us = <10>;
+    };
+
+...

-- 
2.34.1

