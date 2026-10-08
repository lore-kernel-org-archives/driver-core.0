Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BA3C8700
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442105; cv=none; b=FBt+GOJTN111DB6k8jfgU8VbWlHuxCFRKI6ubpnDznmRsBxs7ljU/VsdYmSlX+SgvpDxvkJ4n3kuBy9FXrmp8NOTjSuYJjzTRmscVqDrlgxF6nLwkU6pqjpI8sUdjNvri50ktjfOepRy1S2MZJqKFtHuc6vqOvXGkyCFuW+V9aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442105; c=relaxed/simple;
	bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uqaeJ11DKnIZz9gm7H6pm/egoLBGUEWvtfDcp3f0lpgbDQzE/in4wjbVeZmBJrwfrwoV8LJ0Si5fRqpHlIRaL2ILnu38JFsQcAJ1KpbiZBKpwUjlmlLBzayt2OQ1ch6vqqyzCVcPpyFlorx8TqydzPgxqeUseMa7xtcp3vxXdY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JkJ22DvO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUX7enWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JkJ22DvO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUX7enWy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BkUJ2775613
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=JkJ22DvO8oYEI9db
	0B+z8dGhLGpInzRKRkSHIF3hcNwLqKjhtfCw0Gwqv/4bnorvEkS5gWqqjNOKXeAD
	MredqkqKwcSXc1hmp2jqMTkRRB8WQkw4a4S5RgUY4M14LTqXBzvh3m1eUiKNIO5r
	hkR51OaFpAq9qp8x1pHtcIG+Ovl5mKpyyUllWCLvkQoHtAWihXTBh2AvaChmBjDx
	p2tj4mrZ+n5p9eHgtk+dtFhTa1F4rQ4johJyQPKrkcw6TAPBKsXgmbWJGvw0b24n
	fQw/FZm4WTb6Owbdr+wXkdSFGY67GNwih5WGiumbkPjynC0ALe8Z+XFVzf9WPlcO
	uhslNQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe69hxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:48:21 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3947285a91.3
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442101; x=1792046901; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=LUX7enWyu/J703HzBnPmmlCTCHw2B2NjGyeWnjx9HQMC30lEqdAY0/cwethR+OygCr
         mjdHj/qW4IUAHvlamI7rmYQba8XDtVhgXC9SxGMNjh0/YDDvLyFonv1z30byi4mfjBxT
         6BOEzAf0/pjVaIHz6OyItl4Ne8/cT5AMk71tVqidAU6BzEbVIaClQC8s+VEwPmMakqU+
         LHR7HXtVa9AyyZQPlUeLvq64CYWldnrniNTUIQdHd+E/L6R3aeanrBFRkRJH9hh1gPXI
         MuOZBEeOm6fSpoL8MiyBmHGxjZGArYhZcmg0rEmZsOfbpTw5bg8swPaHVJiOKqMVVUt/
         XThg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442101; x=1792046901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=CYbFZBCATz5/XBE1yMQdIUQxoLufLJrS8Ga/xhWJY/1PlAVw8COdpSVO9/jMglv7TN
         K9eSLIsnCNvvflOFx70FEpSkZdMASGDzJwfZ5Fz5HATlPGrYELroZLansBvg+btht9e2
         x/HFyYpo8JWd3ybS6K0QaYRJWeGbd4HFNUrKENhT6Lno4z/c6Qhsel/ankaB7Z3bWXt0
         Wqf0FOiFkPJaKgsuGDIKifnQuR5Aqle2XZhxCq7sSxrlH8JAwLmUDbMohthBhOht3SwC
         qFPpQhMhFOpvaRlMjPcq69LeDc68sAZ4BN1dncbDl/3FdgXNvI3IJUNokbrlwaVn4Ulx
         k82w==
X-Forwarded-Encrypted: i=1; AKwUvBwlQyYQ7TWWIhMw2te9al5c3ZnTJ29mgqIvENPEuET4OoHsIrxvAvIHVVQJspyJ8NZCMIoApTE1+/MeJQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJBX2LWaiCv1VJoDNMOM+Wrd0cNicPCRQvDX0cGbtH8bBBVWiel
	9tjFdumdCbqViN0/qc55CvrynBMxKsRDlkFDgBYNkcWgRkfvonnnpBrvWYH9uINm7DvEFieftAT
	HekWcluMDKdIGTlXzB6k/rhNSNOSY8k2l5C0s9RMqbLBa6IrmiWBJ8gaUh8EuFvm/0g==
X-Gm-Gg: AYBFou0co4zmW25VPPFiu92AZ9x5fEDWLXpZr8tfFj0RYMvrP8OcAgmnw+/GuKCmju+
	o0+2r9ZL4tRM5D9rIMeKG+XM4W4RdE4j7/8jCXbnj7CZ7VbpgCxVx0cufZDaftJdDMePeSFhojz
	uflyGbJK+88m82DnKKS4qIOYUOTlVI9KZI/sV28taxo0lUNboITOtAWBO0pOWq09m4P0eFl9nSs
	JBM/G1c7C9bRGuQilt3RXhojML+9Ip8wi/qEbyCBXa0dPOirqPQpx9tSOQIYOKWKViB07dD9Lsm
	VwIvEaXblm18B+kunAvN1SfcCBh9KxClVXQx3E456NvtkKbJdv3pPhYQ2FFECYYLCOUyfxXTHIi
	GcbP7J3adx5ycE8SUhaL1htldFLREY9YSa8LTcQsv/oVztgDI3b/0NtM=
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612830a91.49.1791442101177;
        Wed, 07 Oct 2026 23:48:21 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612810a91.49.1791442100559;
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:17 +0800
Subject: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442027; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=jIgf60idSKurGrTwCMA9BKGAUgriAqwNO8PbOAveqoTDDZq6G4MsKu4HZfnyczcUiu9e6p/BR
 wz4yxrP/o4uAotz7CeHcNhJZpBpJj0web8KHZ7xhaaTIlilAP1GYCON
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: 2uBKzkI3I1VW4d69CCNE7EZMB8K-bm31
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac73cb6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 2uBKzkI3I1VW4d69CCNE7EZMB8K-bm31
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXwp1z/coHr1bk
 PoQsT9JsflCCPRusGk89wHCG0gQgktgHkokwDTTc4TgG9r7iPqeyRS1DRfXHoh8B3kmFfX3+4PB
 bqGfSYxSKhheGHe4p5rad3Mi3KZix3qVtW0QY9p1Pq3/JCQWam0mT7xqux1UK78bjUT5a5OAF/m
 VB4fvcLOHqexe6htxxdyHadI1MBeFrdO+Lj4EoAyYXAfA6U2pC776dL0NeE6O/3bcdhgmQCqNSs
 B70Hr51ok247SaY6muN6JSSOyVRWvu1jUmjqQzSOAF7+2nfWiGE+zuPxe1oCMeVmcbq5YLR02ov
 zKf+hpPhpKr7kuDUtUrJV3PaXB2tgkkSTtGflTa0Ajec/qkKxKovp/s9+1+v68ifg3Dt+dHrDWk
 sZ0PZ5KeRfqcAsVQnvIM1gbX+hwkURNMBthoI9fDHtCPsauX6ZvrEzVquvxKXOMR18fy/qbuDgI
 IW4el88nuzDT1Obixqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX6EdLAn2/jlVg
 R2fBwbYxit1+dIlFxOYfWFhfhFhTDBCqpEtx9B4RfY5GwmDip2jnUVcSXzYEIZDl4ZHTtPd9/J/
 ZW19r+/y3c9YUMIvAEGdNohVDB3xsKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080026

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

