Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082F64252AB
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378864; cv=none; b=KyuYdR3dXHm4LM38lmI/v/BXjm3+6RsuJubzFarW819/Czt1J50VFZ0eRHbvYZaZ3UPUHGhabLiADYWu8VTG0TAfFW14IrUjQn7kkAG8DuPcXyn/5ddD//1G6ahUKJsC723U6C/UrqNO5mA7KWu+vzfPjSLrJtPgeDMkqp6iQyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378864; c=relaxed/simple;
	bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/dzIF9pgIN5exE3U9ccdcsmGSLEFrZp+D502XG9dZ5qx5ZgLkFNXiMf0iQxuQAlI38q5BsmRjl5AJVQcjGVygH48//0/hBfN/kR8sXzzkqJ2lTz/0q8yB+b7bgQsnc6RGKUaXE/QE6zVLNQ1Zs23eC2sGuNBAQi4rI2qn0R1K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m+b2/amV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNTnzbz9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+b2/amV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNTnzbz9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ilSk3369254
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=m+b2/amVz9FkEIbJ
	/ULA+M9LSdAis/Bav/3U+xzPZX90vK7+E0zGrfazoAclybv76wHGyJHTnYolQdrQ
	v6fnvNmI498SjqvLj5pzVUNXfCwGj4Eo9CSvXecXjQB+9XNSLdkysi9Qi5tHVsgs
	NPGJnNYfWUheSW6/de5jZbSHN5XT5RNU6ehp7/Agx/zkOARLINGQVisWTdo+3yD+
	ApAqxKdJhcMV/YIDKB4YvuOFEw1F8YUM9VxPNGUyJXrqb2z35fXp/yvZhQOn+VEK
	eDWvDy0+6OGyxnWuS7aBe5HwzD0oGUM7IEbgz1MCqbGa/YFNUfEwpg7byThpp/Ra
	OwdQ8w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd603u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so3468783a91.0
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378859; x=1789983659; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=KNTnzbz9ful0Tzr7YOSCRGG8a/ckuGKANe44Z0m/q1RvbEJjf8ei4x5KbHthDY+pDZ
         iKkw22XH0mFoOJGGC3w5G32rrfvEjz9QfUzsq8xC2K3ZPXxuYZQS+MMBK8qVAwn4pfUs
         20Sd1+QpXgZ8vPQpl3SkYu2C/VmmZxqBrgcB3uQ2zC5+VIUAxFGubtA85/LA7KGw0N+0
         cuv9cjxg3cBibRNTcLTgLTF53XKI0gn+yfcdhvTJsxywItUtwhpjC0Vw9QhBeTPQm4N8
         9djilgdPZRmz9dOsOVuHUwQW/YBkEE9q2QH0ptXcSTRWOfJfmS1WdRhyoWrI1M/aFRco
         8riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378859; x=1789983659;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=DeB5cRCHTc1RLfa12kT6ASPmvRCSwuT5B4HMemwoNkndetRHnOR/WWQB2O5U2spRxf
         7YZGACmNEDt7Y6T2+c9IyuTccGrM6YgP+tdEhATVXteBh1GBiK+MkbHxRxxxyceCclMb
         r5UtFxUuooxzovJbeSIj3p4o55ZFR7VJ9E9JbmN5VAXTTFJjkqxkU8a2n0R7yHQPNIxc
         JCRHe7HlpCxOVmxvUz/3UPPBbRJYh05laz5Laqs9RcUU9BPozMNEZiCi45pA9/BS7wDf
         qjULrHfRQY8uly8Ee/giWBaFUYgEJXpc7Zls0mhJvCD0i15Rp0A5UCDBj2ahZUj35EoF
         ljFA==
X-Forwarded-Encrypted: i=1; AKwUvBzbGP1sOmZCkK7NNZgvU6hg2ogweZeTE36Yqq1nXtPrE/pYszhDDCtuo7nV1u45KIY/KsWIU7vZBoy7Bg==@lists.linux.dev
X-Gm-Message-State: AFuF++krUpTkGjW6Y9j+tYQlMtlF2M2JOiuwg35ME6IFtpEtsKoSPwhM
	5Lx+H6bivfPpfSPlVAP+T1Gl+RtLMLTwv0Msc5D1zgTFnz77p+HD40vEKmHC71XsZJVSiAw61CV
	kEEdqr8xxEjR+nJrf2qZskoJ3+hlheQnJ2lLlhQw6osSDnTeXZnANKIgGZauYL/+X4Q==
X-Gm-Gg: AYBFou1hO3DcoPLdmVPXr+uPCchSLB6+RkQ4sb4OFUV0InazQ/GuXenkW2iya4d7GRi
	qd8fjJGD4sina6g+Fiw9p+dUug5b5xtHL3TCJyycv3KjNldBTrKxZ5EtA82yToLPu/TFg4knGYh
	j3Nne3bOfgvAqpcDmDwHIcpXRIptjL+IX4Xa7ds8VBOdwNrm2TWjM2VIGKrpVXd+YLLqFBBC7Hs
	dYeHgwJtAE5VkCVuiSX1Z+1lfojtAtrV6HpKkeiBzmch3r5QHMlyATf1BbW14TWzFbGdowoqsaL
	SnyGdWK8q146RpkNjSOBRfWGEHFmKJZ5O1Pb3pi6zXdsBbTo/TwjQvhW2nTlPxkwpbuvNXEDQWT
	zJETmPaedp7oeu3GPvnHcWdgpJ3bhpjmqL50XMkT6SXAmfcYXxZHFXkI6
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39debf89013mr4001324a91.3.1789378858474;
        Mon, 14 Sep 2026 02:40:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a47:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39debf89013mr4001238a91.3.1789378857857;
        Mon, 14 Sep 2026 02:40:57 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:57 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:58 +0800
Subject: [PATCH DNM RFC v2 10/10] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-10-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378768; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=iu7wOe3pfXWPmLd9My3slCaONNEzZNUVdCafaRu9tdHeskrAI1rGcPR5+/FkZ3oE4TQJB8zrM
 osqqskJa3ouAOWjaxKCGP0Lu65YlrgiKPPiqMAugS7iGHYIymBIDBV4
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7c12b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXzULuODrRVD5+
 5DJaBme9zy8xgS4uSRhDk6JWDNvWZMc6yXOlovq9UfOAM6ReLhkKL6OwDeHTiON0R/805ufboTt
 tU2xOs3JJfrPfoOXc6wZNdsA9yBMGQQcWSrrvm413ZNefS0eBsLGHXhrl1K6MNdEDtT1Z11i38b
 Dn3MJlsD1cie0estXd3lu5fgT9y5j+doEPlImwEFhC6Oi+T5b6BJK2/K5OMvWS3EdvYpMywDiMB
 fltCLzpNFrFOuDMHqhvZLJKk/qIvCbvmkn6lnr87Uj+NMSSNjXijlP+NHJw2+uslmPtEFlKNDwp
 5Is60MlkLoc2m8FGhXM6gJjsU3f6REpdDsgKzKo08zeKxm2T/3fPjArEWb2w6ABqj2MReTZjbZ9
 l7vRt66e9Gi9SGp155ZE2AfkhtVMhRKQE22os5YKMR8oUF+MsVQaXfA8SxGWeECV5Tgl0Y2UWbT
 GakGtzjXc8gSUOtW7dQ==
X-Proofpoint-ORIG-GUID: o2H_-rKxVPSbc1B8s8GgzVIR371ighTH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXyhNcF4BJnYre
 A6PrO3A8xS63ox9jooc6piQxlr0bLdTOpD1U/ii0iVKdq/aFGJnMbnFSF1os0vDYdnjB2VHQDxH
 7k5I74aYAOZSAJzpqwDTxUnXVwXKoyw=
X-Proofpoint-GUID: o2H_-rKxVPSbc1B8s8GgzVIR371ighTH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node. The root is
the root of the physical address space, so each cache node only needs an
identity 'ranges' property for its nested MSC's 'reg' to be resolved to
a physical address. The two caches use distinct node names (l2-cache-0
and l2-cache-1) since a cache node has no MMIO unit-address of its own.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..b1dcb1e9c570 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,12 +48,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -120,12 +114,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: l2-cache-0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@19870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x19870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: l2-cache-1 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@1a870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x1a870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

