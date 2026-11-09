Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218895;
	b=5jbPLxy89veSbp2pg4eTNkQ39CYBAkbFHuXDUqHzH2uClSz11F1sAIa7tg7uZpBnLDCr
	 TTLc/UodtNbydWYecuOTaiHMzPjySp3CzO66eNCw/AP84PcwtE1bDKoq3hfMho7JN35B9
	 6YihPoYQQ9j/aCHHhM0XjS6Wqf3wW3R2cMfS1y36Xta5ATBGCMHXEn/cOr6cnDstiAbdS
	 84hl8SkxW3DaDDeGs8JWf3kubWRVXn1iFT0L2QC6Oqt7p84RWr8rNl8kblnPKIMnsBCxY
	 +lR80w2yabHR1DIUjzt/szTW2NYe877ahiLD+7BN65nE3ga8vhWveHWYAIgNXT5NT/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
	b=rzlf9VeY7/Trnx+4JTYy/KOXZBZbW8wilUSxh4hvzatx183AwgeXrPFvU+hhFQQlvIbY
	 840URLRqCOT1q1TCyp0ZrS5aMM86D/o+Bd4WJyiSdouit9c87fTLuBrBr/iJzG9RPYybD
	 0QuaUqAC2NsGtFq7I8S9mJCEtICCsXmMADEFosSZzNhmUmyuBf4bIJAKX2JW+q3egSvl1
	 m2fGoDzKxKsKaPnhFaZsRvX8WB/09S38Jloc8zRESViPI2p9oOuI2c+jX18Tw/FJZeSE2
	 0oWGwjibEgQVxh1yYtgg9id+gJDLzpjj04L2iyeO372Nya3FFxSkHH1VRbxOMSIAt/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppeEQm7r;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8ZGvEPU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7D7606EE9E
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 10:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE7D7606EE9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ppeEQm7r;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z8ZGvEPU
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vEeg4107927
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 10:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=; b=ppeEQm7rR7p7BPUY
	Kci1Awb2YtMG6qsDnCfqu96oRFwOLHYtJLPkvgpzGGfzZEUlTV57uHLKpJZuDuoN
	nuziQeeLPEGNJUcu5wVZ7Ak9UPkqcFjg+4wpgLM1iB5N27yVBhsuTgxs2nAohKvl
	7vuMoeQ+4Rl4YJ7VCSWIYenx5vzTcLsNTzhFbsalA872sgdGVqbq4QAFeXwAjWkD
	Y59JLLtaOH3YT8vfM7pNHK11/2dwmskRorfkisn15MO/TEFfS8V4vRVIubQh48aq
	M64iHku2DIagIPfFSqPTQKytP77EUo4iw/d9r9ntQaaSpbd64FGifcgJw2KrT7Ml
	BV7B2A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx83y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:08:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea71803effso8115345ad.3
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218892; x=1794823692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=Z8ZGvEPUrnXTPwX+SsY6xjlJSdbwlKt1FvZKkIYOirsY6+OpxRIX8yf3rNChtrrJTR
         3aKCH1wVafifQfBLUQNe6gzsnmY22GeRYLiQTTvI2zhWi1t7ZY35s+Zn5o7BZ/toA4G0
         bp31dDoAzrrvT1ocIW7IPPOxr1ien/lPO6O72FaihXgMEOxoWQBKCGS/cdt/Tvwz2qil
         ZAIqvlX17zJRcBQXBkoFby8iWKtwhyxx7frXG3Y5Dzw2MCemODL0/v1flafDroGna4ze
         TKjnnop068X1aQijCOoCaAs01xqeycIfs3EGtjsFZ1pI8dTkEs3DKJpm6Wjm0EtO5/gA
         Bq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218892; x=1794823692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDSOUSQM9GLIrvCsvZZiq5SNqpo1e4NgIoTy9VWeUjg=;
        b=mFCnUQlZkZxEEhYVAJhJDWiZir4REIT3Q2WgY/0xW+DyurrjKFgu9BsmlmNXug35JA
         emDNc0aNSCkcQIZzI2Dg0N9xV//kFp3jnTFymqAS8P/eYrtN9wmr+5Fc9ySDfXx1yVfF
         c6wXK/iDM2/F1FsA3jwWPkxGTMerFCWLWX7444K/rj3C96Gyp2Ht73Fz9d15X9aGcQfO
         fmcS4DBKTFHnuIT5/Os3YWougBLUWf77nbyOmOTg0Cq3X13OFnnIlJ74m4DfGQ09wrRz
         HoZugKHoUCn2kwY/NkCzXur58R5gvyXZYnGUXH+zGm6hTMlXLUleRWZf4Y6vjZhHftXS
         zRag==
X-Forwarded-Encrypted: i=1; AL+hErH9Qw2jMixi/vP0EiO0kgZZ480NKp7wUFdrMXSSAR76LYgrX0FqPDx3SnS6qTH+0nwUY6u6RNux/xnfDA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9wshhPyOtkroJXshIVWMlSd1A5vGtd0CrgVCI/rXVwka/pRL7u
	opdQleu/AXkB+sDUL0d+7RSAX9n9Hwuf4Cd3EWXpX5YLe//4O1XFZASrhtN4eq/24GTmiqtZd2S
	JXfiBfdbJdKar+9UT5vv1x1aDcKbW+VZMiM46WFDkle1wXr4BI1G8UV+8cd59xgx15g==
X-Gm-Gg: AYBFou2kABuJ76/bigVvBldKYReHNqR8EA9Rmy5ypT9UApMoWxhvgLcQy+s+UMobsqT
	4HVtFwe6pYIHB5zDgEdC7ESlxiUbEImLf9Wh+YvSKVYbQ+Ec2Anx13xAzKaQ4iA7PqOHFWyVF3h
	M1f0R/sXf0N/k7MpNneGEinHXX5L4ciN6a5DjRMFdjFpNZGCfKmS3iFu8psNxqOdOJQU4o+7Xji
	H3RsVjJoVWDJfIMhaHmfolK2egpiGFNQaEMREGlOKC3WEo1NWb90bh7b9ij5+uDmGOEvQLIrYNw
	d81tCPCUFDaZtyc83LPtIqZVn10qmw5vbSHDminlVTaOAow+H+7ArQnFCjmq7vGDL63aGx4tQRS
	GP5YBVgw/K/Ltt3Lob5f9BOACaEx1Yu3MqjXKzrHMZlKIRf/D0uYmw0UaM5wP1q465ZSueMeaUK
	TiV5AEnZ/92aEo81D4dZ23rBKvkqNS
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185577a91.11.1794218892336;
        Mon, 09 Nov 2026 02:08:12 -0800 (PST)
X-Received: by 2002:a17:90b:4b0f:b0:3b0:9984:18c9 with SMTP id 98e67ed59e1d1-3b12d2cba5cmr3185541a91.11.1794218891857;
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:11 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:39 +0800
Subject: [PATCH v5 7/7] arm64: dts: qcom: nord: Add MPAM MSC nodes for the
 L2 caches
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-7-150335a79381@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218820; l=3176;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ZaVhC2MFnbu/kTiLZ4O2AmrSppiPduQJFEif++uRdyk=;
 b=u/FERFaskIqPAl5lMELjNtPiriNj3T5fZ59uO++4QSA9Qs5HQiSwNeAUgh2JrMcmT6/6c/Rgg
 YM83twlxNzsAGhVgsRFiHTCDFOBHKzfQ5hgK+cLg1j86Sd6luy6L9KF
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: 4OiRfQ7yUhWfb7S6zHr1wXLtgtxgpANz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXyDfCYNOPehlS
 TVCdLLKyl7bEWb8kbMo88r9aw3Tvk7Vyl0Rztb/6uhYMMnSa7CgyKsNIf0WIcOn70Tl1LmZKm9o
 fu4oC6YeCnXpkllyZxDZcJNXVmLsRYUZp54UNWrepbo3CSLBylkF0zPcKubcoURfs/WK3jv98cD
 UEX1yOSrsH4MhmCr7/OLk5Vz4GEk5AjtbnKcKCwLo/AGD2X7QS7+5KRnpJ47eIx9ULWXMk4TJv5
 /I+BXi5Vq0RLrNceb/ehKyNGE5lv0hI3uH7iF7RDKXgoPJ49uAOO4Av5rts5caVktMMOdypx6D/
 5YZpQ4gNUbxUB8cUIioJ5g8GvUNv76lHL276rj9I8h0DdQGKic/98RMQRdQ3gpIXbfGRDJdSRVO
 s5f6F/vPKumdQH+DxgGn9yjzJjpfXwXzzIvxnQW/Bev33Q4bxCAQomMRVAyx4bLr3nxVQW5px0i
 XK3EZFXNfHvdyLF/8vA==
X-Proofpoint-ORIG-GUID: 4OiRfQ7yUhWfb7S6zHr1wXLtgtxgpANz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0M0MiTf7/Ewc
 8dSHZJwVBnQCALKKwRovF+IDz7cFvpitX3UCCimOcL1VByAOp0Uj9tRvPe6FeioB4usj5iT7T7v
 kueWNR++V7nFZb+xsNiqYfzm6VRpgUc=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af19b8d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SOWVPGG40zWAznzFnVgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node rather than
under their CPU nodes, to allow the MSC register region to be mapped:
CPU nodes do not provide an MMIO address space, so an MSC nested under
a CPU-parented cache node cannot be mapped.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 72 ++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index fdbe290350dd..285c6a3e5cb7 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -23,12 +23,6 @@ cpu0: cpu@0 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -95,12 +89,6 @@ cpu6: cpu@10000 {
 			enable-method = "psci";
 			next-level-cache = <&l2_10000>;
 			#cooling-cells = <2>;
-
-			l2_10000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -167,12 +155,6 @@ cpu12: cpu@20000 {
 			power-domain-names = "psci", "perf";
 			next-level-cache = <&l2_20000>;
 			#cooling-cells = <2>;
-
-			l2_20000: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu13: cpu@20100 {
@@ -907,6 +889,60 @@ dump_mem: mem-dump-region {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x19870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x19870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
+	l2_10000: cache@1a870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1a870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1a870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
+	l2_20000: cache@1b870000 {
+		compatible = "qcom,nord-l2-cache", "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		reg = <0x0 0x1b870000 0x0 0x2000>;
+		ranges = <0x0 0x0 0x1b870000 0x2000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		msc@0 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x2000>;
+			arm,not-ready-us = <1>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.34.1

