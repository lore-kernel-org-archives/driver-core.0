Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB6448D00
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455488; cv=none; b=psfUo3gdZkvpVdixegETb9tKLScprDUp57g4gF8hqbrNpyVaZfVFq45mA12ECuBUJveeBElbzzr+a96uMYWwm67EeN9bTM8UEwHUW2pKQaX7rKV8BSNm2lkzegNXq0U0XgEZ6WU3nnQvYgTN8YmGZie3YusA07kjGC2thPIWMcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455488; c=relaxed/simple;
	bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r/ZYGAsbYmgIIEG+r/bi/sGZoHh67PQ6ICoMHOI/UlT4PWgUX1IXx6IGxhxOGwPT5f7CztwaaEAoCKgP+ULNVVUpTqvc4EXxNi03fBUXPn16fssyybiUtntFKU218y6x2rgNvs3hpTTpnFiQIDSE5RnhVZh2GDuB7A1HCVu/AFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5WHwFkd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3ccvOpS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5WHwFkd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3ccvOpS"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWjkn1317223
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=Z5WHwFkdf5S9C+hL
	ZK4XBa8N3GnKZ6wZkwd7kGuCmMOrDQQCA9nzHFx+t24aRyZEe1FHNBQMLiuQ/lQZ
	fDvuhkucPTCvNbSoitqLYl2T3gNp5gHE6W3Q25lFNBFqS/emsRZsOZYTyzymk53U
	w5nmnnfIDrAwTCXEb5rO1Hnagxh2OvJf5LP6VB36+GIrrC6TY1bxltFqSYSKeDi4
	cFwPhWibosteAk7/+p1yOsFwb+3W1nh2RUB+1/wfPkGWkuWe10m/1mMI4BkJDIIT
	pBZQThhPqvPqxVxIzVZuCyATkNx6yvjz2/x4I1REUFj2rfR/HWEGpZj9qLcEEhAf
	KwXiGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk2yfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so46168875ad.3
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455469; x=1787060269; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=A3ccvOpSQemZ4C4o+7Y9B+ZJo6vnGmCf3cGuYrxRxA7SJYnwKeYgjKQK3clYBK1ecR
         GrSMLAneUkT/LudnE2SbPmDyaoN6DNE6dODrSJEr1NOIHzEwsdDxOJsn9aKfgD/gG0Zg
         ujar4MZ+nk3rqkUnCtaa8JY7gBgnPAhg81mp2Ud6qVhlU5NYKFLCWvJFINItrdLWoDu5
         9CE6TY+iRfikH5oe7/3qxstE7VmXdjDIfiWbQosMGsJL0oGo6K6mHVYzHfNmLUygtVap
         9xrBKOS+PXpNC7QX2495v2jHC7mrMxvm10hHbBqwaLcXNM5/7ob//QvimlpxCi97PYBW
         B0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455469; x=1787060269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=CjbilZhFjJ46YBMnYSrAKFXAL69kQ6ii5V3mchH+faaJqagXi8C4PGb+6+eGNJYMQV
         EirUmmeEb/W2PLmKLob5WcLafbz1is4jE8riE+BR8mDogzJoIGFPcIQtzyxibXONAgdQ
         xCuve/6jRR0VzDoWNy9w4O2/cSHXL9uB5vjll3VSFnjxgNpUeaES1E64RY8wOaLNjOGB
         V+xglGzmxmCD5s+JpoUWOia38lhja0zs67vGOO3biihsLxFSSu75q6fH1BUiVXOVC4Hl
         /vScW7BCrUucLDGUSfWMZ7mJAum/HV9QFSX97tRlZTmkXjuUSglFkxgE/GFVuyGSNDlg
         C/nQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMG//stB+LiD5ci0CUqkn/+80a8JE8vtl5mz2y8RSzaWNzRclFQAJkXqQdyn1esgwm6QC2eFwNLXXBvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpcR+29KnWxwrtXrXvj0gS5LI2PobTxcq8AKgA9QFt8GPZtqxk
	TAjc7qm9LXxFp6INQLg1Iy0/ZtIaQIdCEt0czukNVnXF+JJEkYrC0FYKYZCUhzQ9g669pE3nHPj
	AMRml0/8gdO//XXQd+2Q7W75n0UdEg7JqtV8W4AXAK+epHdG9e48HN8Vg/T4zqZ21MA==
X-Gm-Gg: AR+sD13UhztiXDi0YyNsDDP2+7eU09ErgHHXvZo5F+qcD7tO+MskJPF2/+6s9LyUrd0
	uEjDVplOCqmtnuyrI4acxFmHkMQ2KAoFotwnnQOcOEQ680lMHGOkQUVFSMPl7WKaexSd+m9xJFo
	vsXvMX2jQ+Tj2X2jIrb1ojVvJv1QlAPE5KlYdjVZQBt2ARJH8K+EqR8VCnuVcRpAX0FY/FjBGe1
	71eRjUfTBaqhtAqZ286b0/LOIXv50iPLnC9gEPFVLBGVPo0TNiy71sG486oNFnX2X7HtUdhkdsT
	HyDL6wCCYET3HpnNQO275rje5xPePw5cQEKUORzrW37pli+euNjgePguFEcCNQ3hqJvSXKOPOPb
	uUd22o7y4BWrnTcD800Orv6yT+H5iMgSSOfAitjwJQqMiAeNxsVZtjCYZ
X-Received: by 2002:a17:903:2c10:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d31792672fmr42113415ad.21.1786455468755;
        Tue, 11 Aug 2026 06:37:48 -0700 (PDT)
X-Received: by 2002:a17:903:2c10:b0:2cc:307c:51fc with SMTP id d9443c01a7336-2d31792672fmr42112435ad.21.1786455468060;
        Tue, 11 Aug 2026 06:37:48 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:47 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:44 +0800
Subject: [PATCH DNM RFC 15/15] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-15-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455331; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=aJaoYrw9W+mA2/V0kzVcJpwauWAIFZKYoqSpfelZhQsRlyjmZPL3F7nE5RXcGdIQV55guzjjc
 nWbnib8y0S1BXytBv8z+28xwewiHOvt50T4FGPEVTHOjsarfwWb3E4a
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXz8VIDiMQkcdJ
 hFwOO0RqZSSvPGttY4ysybUph627Zxuag3xU/T3ebJOC4Xwg5nQBo3xYSVR9IUS2hu9blUFXRgx
 qlvdDndhsjmxUpohPqN8of5diEHRjkyZxYnXXTi1DapLIujSxMm/kZLAny/9doJDC4G8b81E2Px
 2d/jsM6ZSoH6/8hwDRaL6wo4XZFslYgPPyXizr2rjBPXuGD2IV8oysjabBr0UWoLqE9UaGA3FyJ
 2QHGk3CEAR8xXdYmvjW6O98yJkixqboVq6c5qO7NA66guDesJLwMQVXWmHKFS+YYeZ2TRLcrXu6
 lzHdqbIHdKYTqAvx0MZRqNNWFfS+wEGEzwCpVbqD6YHoHj2uLQH7jztpQKB36J5Q0ng4eGpIMwD
 NRYj//YCE7eWz0KenObVjT4j9HxE24jhlLfHr74SoVNqEpHUpXUcipyNUSJc2o8DnINTHS7mQPC
 sTujWa6s82OruQSqsuA==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7b25ad cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX9w0zLuDHF7hH
 dHIZKs1K8OAmQ+C13oyQb140RvNwzt4Qnac1WzX/a5rNsQgYmKsL8/ujhkch30VXMEKaOzjwdAD
 NPMc7PME003DweQtHNu5pd0bTrDI7/Q=
X-Proofpoint-GUID: H2E5acwQLXZkHns8UukovByKEZfcpQOX
X-Proofpoint-ORIG-GUID: H2E5acwQLXZkHns8UukovByKEZfcpQOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

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

