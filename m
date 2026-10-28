Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188111;
	b=AGjIGEpg8q4t4JU35YH+g4nNQMR5GohtDDicyxOE+zYHch/Ug5Rg9JfDw0f1ZMTK9BNH
	 Oymw01i6PsvFKvkGmWmMhOJQ9DWu+JWSA8ltxLh1pyQxZqFVz5Hdhgu4pv4L3qTs/vD1a
	 KVKqU7hbGWDw87YokXTsgTS8IA/LZ2UUEi1Uv5AoH1QM2Xmg08HCwWlSusswegzG7yZsa
	 QPkz0hOC4Eg7u5fjkSCzBO2MJxGxWbLDRrGcRLBWsrOQzc6P4ZBJvKcTh6PJsTYKtcz5Z
	 YauafKnlDPcIwDYuCQph8yx9sm7aU3AXUEt07l9Aw5h+LDFctSHivafkQp2X+tBkQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188111;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
	b=xEjBTybVzeKlrC99c47XqxirYAdt/bbsuQbt+aiE43jvIGgA/6oOa0mRB6TB8P76OpLJ
	 cY3IdRlo8GJRDBzhIRAsoVNmz+H8pDfhyxh2/G69WGrg79WD6JBOs5ZXKosN00MyOEXn4
	 9X30rQBg83NFoVLgpc5cRXD3Bpaq8R8eEyHm3QBkZYZL74ZlzpnWkFezEWEtsr/1l5D4B
	 W0pF0S1LFJCVSqeFm4Z6OQGmvmNfWtZAvVhbWmz0qs7B2XjW4ceGYC3vQYJEIwzG5lLuq
	 qZJxCIDwpdRBTRuPBdoMtK6VOQJotMyA/k6GbzU4BxCS0iOjp3CC9llKkCs2IKUQdvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLHL1vWM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307E4606A31E
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 307E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BPCNdJwD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VLHL1vWM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeAG51606932
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=; b=BPCNdJwD35hChuwT
	JQOnqjp4G0M2tcP2sveGVgO1bOK0Bi6WszVbz4yjet+bzzstrO+Ga2YJLSteeRj8
	zCm42pWeQz72IU8i+1ECjHGVVZNtf5PwqQyYDJtMfes91o39rKJijOyGDco56M5c
	ogvPLGrZdMsmdhqKBAHevYqq7Jk4f+rjk1ThiBEwpAPPnQcyoCUJGE7t7Afj6m/N
	D4R4C0yWpbs5VzefSQuBsgs2ggSgQKBi5cJctkqN/ZcdugzgaV6IUGLI8Ad61d9u
	x8JtSyATjx5267hYSLyKBKxmrERSXui9G+D2B3OU1FZ9jO3U/BOjx5raAkVnvOHh
	VSY5GQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j0ee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 11:48:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e987ec84afso8673325ad.3
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 04:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188108; x=1793792908; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=VLHL1vWMq6XUAI6DAaLlI77imLo88OP8zA8JiTcfszEhjajQcJ0pa75S2A9lWpgLZg
         /OnCRA/y6UwyHWLSirzPgD1+mLfb11dEKopXBIelJ3Ud58aS3nC9/kD1Z4gCA6mq420j
         TZKNRsQv7GuSxHZh/i1T/JBW1/mhWNEIwV7iKK2jDDfDuC5ZbiGyQPj4yeZZ3q2XAcrf
         OEwKL2mHXL+gJLnAWL55EkrSVrhaUzMTV9NR/tAx0WZmfla4URV2KtBRYeiLFYTpN0B6
         Zn8fRMAB+qr7fWwJMiPJIO2F7qmBJjdrhXVXzr0FhTCVJAbbTizU4VXz9eAugM0t9V/6
         FYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188108; x=1793792908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gk3Y1DE54vx+474+Yzmdg4fyyjQx7MEGk73ueeUupgo=;
        b=P/DvpgZ0e9u84kAS+RNIvtr2mEDyzG6BZM19WAM1wIOfeHNmYR+KlprBdwwuRIY15H
         0FqgOQMvJ/8Khp0902A21D5HpdIyjEaIX4YKSWfR24XSYYA+RuzQ47rgZDPRwiFZcxOo
         wC5botBH5+Da5S9dx0y/hhjGbJhPG52lT0RUE0bJ+WhmmbNisLEaKrqL6YjwIetOzvcu
         vhIijjr7w+Z0P3LZM9KoaVxWW9Lew3jADFvHXbQLTOOHvQXnCAFs20UzJMqOJ/6o6nQk
         PKQqXj241AuMrhWFWzwcPz5fPkk6+LtNx0GjNpfDgYc9lmXsR3JvWpkyp6Y8hpYCxCaa
         qUqA==
X-Forwarded-Encrypted: i=1; AKwUvBxJz9xPY7JrlDEnn77xOYK/bn2uWDqb+Zqbo6GcsG7IVL2wQJrK4Hzx//2UBtTilydR4W+3JXfr9vn3sw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKL7wiNCtUmca5kogzIztHTyU2iPjuDV0wWKFzO+xR6EpMx1ubG
	RUitK17ExRZep4p/OXw1k3+bp/mNg7NfT2sd3ANgnQbdOFVpPGUuhAMKjlzPCOqjiEbJc+6pHv6
	pXLOUlQqTnrcv9+7rlb9y5ll860qpWoYyiK5Ug/aFOKzE81Jkk4WsNBMCNGG/4dqoSA==
X-Gm-Gg: AYBFou3SQquUX+M6+CTU6oO3/HFc38iCcCS4e59LV5O54iPHfv5TXgR0osjNc3ibFaB
	BBWOozrbV+/Xn7O/rk86FlE1tI13y1FgEQjnV8nsa0TtM2pReW/sH4EFNHB5OCY2ARYt4jGGq/S
	0ZHJGWouGk+Ld6qb2XbJOnryW1auVvzz7u0FkEVVfAwxuoQJ0xK+IWTUvdnmRM8jeFRepdzVGCX
	uwDF9u7bx5kDQ7xyTR+No0gpIy2w2cPb7fK/aZsRnHyy7q0D6BVTg/zWSbbf1qYB54+nRCqozx3
	DWO6NAf61HSwG5nyXk1QD5K1h5iBg3QlouVHJgx/HLKgSeLqvoNxhlq6xtDRMju743O9VVGDEy0
	1QEldu8cI0zuCfjyBwrBmlTt5e1k5hH3U0ITeVO95W3e5hsvU1GP+lcmakEI/cc/aO/kVbNB81L
	4YsVfhUoLCqKmAwMR1BcWuovP7uwih
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19432875ad.5.1793188107980;
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
X-Received: by 2002:a17:903:2b06:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eb00156635mr19432715ad.5.1793188107526;
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c37551sm21207715ad.51.2026.10.28.04.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:27 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 19:45:46 +0800
Subject: [PATCH DNM v4 6/6] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
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
Message-Id: <20261028-mpam-resctrl-dt-knp-support-v4-6-bdda1e445cba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793188049; l=2980;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=EIpg2fIGRMBRydrB5ptmJ7TII/dpx+YM1XoZaljDCw4=;
 b=x/J3ue5uV1wMxc65LI2QTgcNRDwtcWB8n7h0nyP0eO1K1PUyDd6XfFsaaNBgUK2zJSIqu8/PW
 qhoFFd1vmHqBIA1YzSyn/HzTI0xkTspyTgNaiZf1+/H9UOE3fkw1nRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfX+6Y+FcobUby5
 BrgaLK83GwO/3sqOUh22jmRBKOFA8kV0YP+T78C812MJX/c5jqa5/dnPKQyVr32X0QLQPWyXHeL
 Lu/ilIB/GBuel9HhsSzzT0prLBQj8vQ=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1e10d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: R7WiBKM7GpacROfXS-DuoG7iE-K7F5qy
X-Proofpoint-ORIG-GUID: R7WiBKM7GpacROfXS-DuoG7iE-K7F5qy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NiBTYWx0ZWRfXxVPHRJGH8Tv5
 APseYHQyBS5E+u5VCKbGIDIZAi6oOqOtopp3K/HZaey3wQJF2eqXD+lkkTYdU04WsH18a8gTCri
 w/WXhThJuvUrhrGkeXsvzUMvVpL4PbAfgzQNpPOYVZFSFDGxQrbQT1RGNmwfEpoQDDVXY17HEeC
 8MpPM2M9gJ8S7YQX/mf1GZFdcmRkRhp6N+wAjjdrQeVhJQMBioMBzdLj9CG+7v9OM2YP5xedBd9
 CJ7U2iym0wRM//bgkIom2iOoT4cMdcMoNLeb34GaXzVvLPHikUtuvMdipht3viBHVqxAyPdkPg+
 2Fwz6e2I9Yzw9dixUHhRxcq4LyNzk+D8C2sUUDbYfqrXkA1nNNwbULy5QLfMH8E4EQrLdYuNU29
 XVyj07c0/Mz+/ETtGTBX9us7s8aEhjigPRL/u84R5Tj8pECHQRYcnp9cR9Xne6KJEkogl5nxGiJ
 urBofRca3rNCsO1knmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280046

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node, using
'ranges' to map the MSC's register region to the physical address space.
The MSC register size is 0x2000: the Kaanapali platform implements the
MPAM registers up to offset 0x1FFF as permitted by the MPAM
specification when MPAMCFG_MBW_PBM is not implemented.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..10aee29a1ba8 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -49,12 +49,6 @@ cpu0: cpu@0 {
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
@@ -121,12 +115,6 @@ cpu6: cpu@10000 {
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
@@ -532,6 +520,46 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: cache@19870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
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
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: cache@1a870000 {
+		compatible = "qcom,kaanapali-l2-cache", "cache";
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
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

