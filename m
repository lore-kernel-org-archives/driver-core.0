Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F215D3B9DB3
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455346; cv=none; b=jtn1gA0UMXlk/K0J4qVgUBi6LuPd8dRtXn6TXI4FgunaGypTAWYaPLI/Zxp0TRDnsXi7GH4eAAzIqLmj8mthSHr1QcUHhron2/G2ss5t1IcfIxdq6hSQubCDa9vMVb89Z0v8LUVeusYBTz6AeW2cqDbxiNA7Nx/YugzVWEC0Y6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455346; c=relaxed/simple;
	bh=RUZzE80gtVvvkAkJlCnTKKx+nhfsj8rQXX0K4QAia18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R6pZANjfTdgLlZOX4z16rJJnDWPl8IuLtFd2cqq9JvRoYDz1wHqX/iWawxgqdSMdA5iPTEJYl8nLhuZImvs1gzL/C748cAg4IpeLarR9MqYqSp6tPQFj07tLkjrXiFbudh1cFqCuTGKY++68PqJ4ACpcPKB5WtfDV69SC0A46Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RTXX7qpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kou26u0W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RTXX7qpX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kou26u0W"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWU9I409825
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=412pm8dqTDIKSdNF0kcjAf
	v0w1eHHlDSVxenAfymG7U=; b=RTXX7qpXbkeJLjNmSLOW8jYsZAnrRUtsA3tPg1
	iQlKM+UT9vbCmTZT3rLdfNAv/hh9JJxszHw8kpR+bYqt3N61ONRuDFk7E5FU0k19
	vtyFNtwJISJVSrx+i8jLIJ2IrP/bjtgSLcyIy3g0+4c1Co+aGOwIH7+HxVbgEghn
	8LXUI7gt7IXSXGUv4kqN9mtDgHVg+ItKkqOSPrrM+TH76N4t0VVymhmSax9fU4+l
	xKefrJic5RiC9++xwWRE3Qe6k5aPA8c9J6sNLG2gT8w0T6G/PAYfz5RCPjynC5XU
	JMb0nmYARc1bD/QXAwtGIHDqwsvyuG9IPLaK05wIUz0fCPKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra1wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:35:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so30906985ad.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455339; x=1787060139; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=412pm8dqTDIKSdNF0kcjAfv0w1eHHlDSVxenAfymG7U=;
        b=kou26u0WwH38CPu4b2ahNrlT+k8Ea0qsFneB0kB7gxmbW/dDdr9usFWnE7WP5lfU3v
         K7JPgeiVIHyBMlzNDJFj+Z1BridEYryCgPZ6aGsW4BcwkI22IRajKokJuXQW7ezKGv9O
         j55BKmatoSmXD9+awTJzNOOvA2U9qXyDbVbu3SA4NNScsHIOAOWwah86V1IyeVIbCn/Q
         6AbNeNxBnuYjryb/U3JE18tV4tOOevwStAFPPCuJDg83yDWqgKsF0OvGIUDiXa+l7HCG
         GbaaSi/gjb3/dumszEHNsFu0uX0SVhPAJ62AJoaBQ0hxkG1CcqGuihD09cvMiYQQx8p5
         Ojcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455339; x=1787060139;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=412pm8dqTDIKSdNF0kcjAfv0w1eHHlDSVxenAfymG7U=;
        b=qIhvgLRFRYojbwIUUWiBfvx69Vjr21BVVzTcPhRS1Z9ogHlhM20h2QvC6Z2T+b5uwj
         LRgunTdXMhdGOS7RqMg+IbAvbDxU9EZFk0zs4HAPKS/+P5owUFjSaCvYTfIg4pRc37NH
         Z70DOcNVek9uouJne8eYCTuHsQnOaGbpodFoN1HkeWvFAynd+qo075axEol8be6Ntu/U
         gqyFj3AuVg8womT2r3S7/TwFrSNIQsMlJ36//pyAp9wkvz4k54L5wyap64RFdL4uf/i9
         bgkPTgc4grmIoYi23Gw8cH9Su/LWeqagg5tqKYMsWk9HgrkU0qjvs5yE6nJV36EdEx+U
         JbbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0sCuezpWzFqWxIqC8X0Afm3/z9sUmBto+TDX/xWZEhWG3ZKtU11oEZ2/otG0F31VKLfcqyTO1XOT5Uw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi6fQTH6S3NZoAgNYItRUlwhQXPtnRKGeFIEJynw/VnLVh3fWR
	lZyxEsrr/7hQiQliCWVvbRfCQ+8zdG3ihsALhZxr9l+TE/ttCLb8B9bnuJrLxm15gDPM9AAeJUW
	xkFCX2xqaa3G+0QDeksOT4OI1OtPeTnj2KEoH4N5kaVYSeZ69YP+XZBIsyD4xt24sAg==
X-Gm-Gg: AR+sD13zXMVv+1mBqtwDcMpfS/W2FJ/xsogDEkXPF+Y2gyrYyOOb3O1sr0xHRRi1pqB
	G7nhXBSUwzjYQf0X39AtKzxBumqUotbuj8J5u3lgGhx5HxnQWMy4Bud2O+UjGPUSG94eDYehWKa
	hvmMmOUIbWp4OyKzdIHwhrkVfBdTprELQfsYSMMInOE5CuxRedqxyoRxub9HCRa5AXrykpK2VFG
	Mgojh++fuspriy42ytkHMGlpBtVF8yk3B9Xo/dpMC/94WhbEOZwRCBJVdi6BQkScc/iqcv1Qh5p
	qxqtKm53hRdu0bKxO7o97rVDQx7BYq/TlU8fg2aQ8Lr3Hzu9g6EbA/UmNohjd5cxXg4gDIZ/tLP
	xt0DeRT0FerbQiI8dpCgmCdWoc+B6dLijpTd5NqoUktHkoFGe+kCagEmg
X-Received: by 2002:a17:903:2445:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d3179466c3mr35015885ad.23.1786455338570;
        Tue, 11 Aug 2026 06:35:38 -0700 (PDT)
X-Received: by 2002:a17:903:2445:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d3179466c3mr35015155ad.23.1786455337969;
        Tue, 11 Aug 2026 06:35:37 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:35:37 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Subject: [PATCH RFC 00/15] arm-mpam: Add basic device tree support for
 resctrl
Date: Tue, 11 Aug 2026 21:30:29 +0800
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQke2oC/yWOywrCMBBFf6XM2oGm9b0V/AC34iImo422TZhJR
 Sn5dxNdnsPlcGcQYkcC+2oGppcT58cMalGB6fR4J3Q2MzR1s643rcIh6AGZxETu0UZ8jgFlCsF
 zRKNW1phWL/VuC7kQmG7u/auf4XQ8wOUvZbo+yMTSLbPOSfT8KR9SSl8PIRoQkwAAAA==
X-Change-ID: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455316; l=6574;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=RUZzE80gtVvvkAkJlCnTKKx+nhfsj8rQXX0K4QAia18=;
 b=EJHp8FCtiS4H+gXCqeU4Td7FyQZ53YvaptkKZ5SxxZoTzqGZUhAssZfnE5WF7jBVUMeQxaF2g
 GtIKA7it10jBMJriezveb3oioCA1Bl6k+2IYA8daYgygt3UyclZUt2k
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExMyBTYWx0ZWRfX1bVSfLPCyftZ
 rKRw+yQjMO40bLBeIB+F93A2806bNtmBZLR064Gt/K1DJp7HU+KRwD83dzdU8mWmF7JD6MSYqRc
 IQ0w6Xijkj8u+0A9lgg+QCNkkqLEfCAmE29nHW6I5hzask6/7ZC/kFijQ4xFe7DfOvnqnxfWdyj
 DUv0/AxR5QwO4vDlao3rCV/VVZWqIHir8sHytig64ta3vkjV7iGbJAE3btF/cbx4GhBAzDMHR7Z
 BLfu+6SH8XkODEhUUdZC+LI+X5z52zZafqnZpBGqNoSQkjQ1gcbSkGFb440RKmQOdsVLqYWewJP
 NIwecXon7vehbrMzpmkx6vQWzFU3jiUDxxwEhFPnLqmKumANNt4QjCnoGuDOO8gfrs7Dk6/S5oP
 IW67+Xi5zcuccli5dqGPaSs/cdLBnyhJ+jRrhC88EGSyLHHlZn7QbiIwhaQfdsFcWU2/+HJV2WU
 UBcwMGwd4gCi9f9fm4A==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b252b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ag1SF4gXAAAA:8 a=QyXUC8HyAAAA:8 a=eVJKr8h0iHB_2sIDOaAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: GPT8wtgQknyzEXcVVAkBs_rgnIFEwEf_
X-Proofpoint-ORIG-GUID: GPT8wtgQknyzEXcVVAkBs_rgnIFEwEf_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExMyBTYWx0ZWRfX/QHx8T1lMLRs
 ywuHXRsctrMIkZxkNUHdIrECb19Pvgwue5UgFtxqBshswwd/eKjMp5tqkB0yPxaFwDD7CBohq9m
 hK58eb7WsWlrc4gephRb5sSSUfUibDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110113

Notes for James, Shanker and Rob
--------------------------------
This series builds directly on your not-yet-upstream MPAM snapshot
patches from the mpam/snapshot+extras/v6.18-rc1 branch. Two things I'd
like your guidance on:

1. Do you mind us picking these up and continuing to extend them? We have
   kept the original authorship and Signed-off-by intact and documented
   the inherited-vs-new split below. If you would prefer a different
   attribution arrangement, or have your own plans to upstream MPAM DT
   support, please let us know so we can avoid duplicating effort.

2. The fixes to the inherited patches are kept as small, self-contained
   patches on top, purely to make review easier. Since fixes to
   not-yet-upstream patches would normally be squashed into the original
   commit by its author, please point out which of these you would like
   folded back, and we will reorganize accordingly.

Rob kindly provided some early off-list feedback on an earlier draft,
which this series has tried to address.

Add Arm MPAM resctrl basic device tree support.

Arm Memory System Resource Partitioning and Monitoring (MPAM) with
resctrl requires device tree (DT) support as a prerequisite before any
higher-level functionality can be enabled. This series provides the
foundational DT binding and parsing support for MPAM, laying the
groundwork for subsequent features such as MPAM Firmware-backed
(MPAM-FB) partitioning.

The patches are based on earlier work by James Morse, Shanker
Donthineni and Rob Herring, with fixes and additions on top:

Inherited (authorship preserved, with fixes noted in each patch):
- dt-bindings: MPAM MSC binding [1]
- cacheinfo: expose cache-id generation from a device_node [2]
- arm_mpam: device tree support for MSC probing [3]
- arm_mpam: memory controller MSC support on DT platforms [4]

New on top:
- standalone fixes extracted from the inherited patches (device_node
  refcount, cache-id sentinel/type, RIS index range checks, MSC window
  size, accessibility return type, foundling MSC creation, cache-id
  error path)
- dt-bindings: schema and example fixes
- arm_mpam: derive MSC accessibility from per-RIS nodes as a fallback

[1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=b38bed339681
[2] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=2af39084438c
[3] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=a6ab8b6c77cb
[4] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?h=mpam/snapshot+extras/v6.18-rc1&id=c1be40782ace

DT affinity model
-----------------
An MSC node is nested under the device it partitions or monitors. For a
cache MSC this is the cache node, so the MSC's CPU affinity is derived
from its parent cache; for a memory-controller MSC the parent is the
memory device, which is accessible from all CPUs. A per-RIS fallback is
also provided: when an MSC sits under a generic container with no
affinity-bearing parent, affinity is resolved from an explicit 'cpus'
phandle or an 'arm,mpam-device' phandle on each RIS node.

The Kaanapali DTS patch is for local enabling and verification only and
cannot be upstreamed: the platform is already upstream with a public
device tree, and production firmware does not allow the OS to write the
MSC registers, so this path only works on a local test setup. The MSC
nodes are disabled by default, serving as a reference example for other
platform DT authors.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
To: James Morse <james.morse@arm.com>
To: Rob Herring <robh@kernel.org>
To: Shanker Donthineni <sdonthineni@nvidia.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
To: Conor Dooley <conor+dt@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
To: Fenghua Yu <fenghuay@nvidia.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: trilok.soni@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com
Cc: ganapatrao.kulkarni@oss.qualcomm.com
Cc: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

---
James Morse (2):
      cacheinfo: Expose the code to generate a cache-id from a device_node
      arm_mpam: Add device tree support for MSC probing

Rob Herring (1):
      dt-bindings: arm: Add MPAM MSC binding

Shanker Donthineni (1):
      arm_mpam: Add support for memory controller MSC on DT platforms

Yin Li (11):
      arm_mpam: Fix device_node refcount in DT resource parsing
      arm_mpam: Fix cache ID sentinel from ~0UL to U32_MAX to match u32 return type
      arm_mpam: Fix the RIS index range check in mpam_ris_create_locked
      arm_mpam: Fix ris_idx type to prevent range check bypass on truncation
      arm_mpam: Fix MSC MMIO window size to use resource_size() instead of end - start
      arm_mpam: Fix update_msc_accessibility() return type to void
      arm_mpam: Fix mpam_dt_create_foundling_msc() to create MSC platform devices
      arm_mpam: Fix get_cpumask_from_cache() to clear mask on error
      dt-bindings: arm: Fix MPAM MSC binding schema and examples
      arm_mpam: Support MSC accessibility derivation from RIS nodes
      [DNM] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes for the L2 caches

 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  50 ++-
 drivers/base/cacheinfo.c                           |  19 +-
 drivers/resctrl/mpam_devices.c                     | 401 +++++++++++++++++++--
 drivers/resctrl/mpam_internal.h                    |   2 +-
 include/linux/arm_mpam.h                           |   4 +-
 include/linux/cacheinfo.h                          |   3 +
 7 files changed, 638 insertions(+), 43 deletions(-)
---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260731-mpam-resctrl-dt-knp-support-c15dcc3a4a98

Best regards,
--  
Yin Li <yin.li@oss.qualcomm.com>

