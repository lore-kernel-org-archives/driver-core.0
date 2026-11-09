Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218887;
	b=QQpKi5FvNwa9e98rK6gZu3IGoKZIxInHwMBJu5tX/vFIQuIxOFpnMTkWXNC7g7gtOhEU
	 29/wjGpZLA0+rL/wSg3xgp//HtBzwUG3rc3rWMvOkctouakC4MkbE2ogeBdUY+2wSMzMj
	 due2s1VwBoxFYDSIzFRKvjE87A1kz3wxVUphJa/gCvhRs7d6wviyR8YnT6yi1NAIIQTwu
	 bwYVhoXg8teOewXQ8PA8yBgtwyyguIWcmM8baAUKvNS0LzGMmtjw7HpfzU61Uo6NEWAIl
	 dyKmluB2JHQD5WlfyqjT8whYqf8OGNzyK3bIxQTpa2yYVZKu/WS1uN7zcuak30MveXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
	b=fF0xmUeU0gncv7fvtsOt9nSpicg2RHLfsR0j3spSXfhuM7sIdlNNd0t8qYDdoazajmdZ
	 j/o+2LEVXXbhlu3mz9SjT6sgR4bxx1lXqdTC45D0/elIl+6+j6FXl85n/jAriOZb0oLZz
	 57Whwm3dUuRcuqKKvADuOTK0uxJe/2yuWOixH7MOUuUmwBxb5kpI0UuqKEbbGhFsKJLLM
	 uTh9o/okpOOwLKWcIzkYjPNOxSbwZpc+QAu67c0iXdiiXEemBlvUGprg1K9yX6PKs7smV
	 AYgGY9pULr2ZBBk830Cyf14X0uGRPCJg1E/lMf4JfEg9Vi/mkP3SHcsf5qb2yJ+qVPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKXgB7yE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsuAhX8a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E366082BD9
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 10:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E366082BD9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GKXgB7yE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jsuAhX8a
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99vOQv3035891
	for <driver-core@lists.linux.dev>; Mon, 9 Nov 2026 10:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=; b=GKXgB7yE4Mv1oFqh
	ygUrAW9IFXSMTPxl6YO+3eOOH0fhJAjY2hxHMaWH2FRvPjt8nsMCa84XY9v4WXaZ
	9EYp/3/XAsDP9/0RVEYAv0+Hs+rcTiM9eOouFGiH+VUUSPGh3prb7aZTwxOWNFd6
	AlGpj8YGcp2FJ7uEPL3Upt6vwpa0obnzZ0dOISjdmvvAapVDIVn/aRv5UinkfnB/
	u218ecYj2GtQCrJWBayTNGT/3bri9VotkQE3/hfV8UadgJM9DJMX2HHPSfc98zYw
	3RoCav7d40LsJJq3L7eXccu/7K2GYC7eaXtq9Snh/n1zKo0Ray9aOwHvUs/o1eF1
	1Zsv5A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvc6nrgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:08:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b09b223c70so533330a91.2
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218884; x=1794823684; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=jsuAhX8aypYY5POSBwOoOYk4di8+qt+icqHTX3uSHqy3J9mGn52WjJzmY1cC5db+bw
         wHmxOhiW5vtzK/23u+Hlg3DT0BiBg9h3HWmZjnwknjvs3zf5+gAs1g/wyl07dDyz+LSS
         yUKboVwAOinuPbf8ICYg4fcWAww7yyt4NiaQpJA39tjDg8hOfB69AUss+V/PJbIR8jFH
         JQrO+pIbjKERp4gmRcZn1bX6clINejR/Rv+A7c5l1iYO2yLVhx6RNn8x8H+HXEp8IygF
         KKmmBKtC4A/5q3Pr6v1ryNHYSUh6FZtbykkrdhCvQwmn1O01hDCr9/TvknBNrsbGennQ
         uH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218884; x=1794823684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ee9HFL3sXLWOGy9+2wILhca1yG8CtTePaf5ROxRYkv0=;
        b=fAcCsxqcCslD35sBnha1AJPRVxsytObUS99gUpOAaaJPbqGnf1MCOASo7qPrxfbWXi
         IupnuW3VTiOeymB4Y/ZewTdaX+vsPjbD+6DaP4bPBgcrpG9HxPRMRYcSXGFlJPw6j7HG
         6KC5ETeqV8vOWH2kN+pGC0xwGtmIGjEm2aNRa/wFyZ+2B0rMprXoA+WqujoheW04zX1M
         wNO8Srvr/VY9Q3hsex1Dgn7c3375J8tGMfz3VGjK9N5psM1kb0i3CtGYV5nIvgDBmO8l
         CjcMo7vZ6VcQ7K810Q5GtvJd0HwX33RlOksvK0uwKL3Sc1Pq8qpjPu1oeWIwX8LgeqJ8
         Tb6Q==
X-Forwarded-Encrypted: i=1; AL+hErEWacE+qie8SMVbvkcJSYVJsBn8g4Y82754dBRgahB4tu/qwhStQYUFdYQG54XzXLyuxeZmmXvP01z4nw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+5azrLcoFfHrV4w/W6uaAiZPIYHHOz8vK9A04FbJHG61zpvAZy
	0a0nBGDOaiLIJDd5S0tAWsBcQZ0wNkLGKsDOgwFZTCZgnDGOK6LhrcGBva0M2uyrDWSXtlVWqdE
	WTnMR32Kx8iBm2IGC/Oe051nnVgq1sqSRKzqAiytWTrKcVVVigHTeTe5+00HNRPS1Vw==
X-Gm-Gg: AYBFou1HcDzjTYmOaxgVOE6gRHlsoRV0mT+uVdam3KtXxpXySmeYeb3tNYbYEw8+1iF
	9F+N9S8lY+R5DlbzMnAIBPMyMaTO00T1BiioHaUBrMHHW7ZkxUhYZqI79o/fZDfPT98pUS0RbpU
	lUTFZ59epSY/JNqL/vC+PA2Ll8/Zz2V2WUzF3KWj21y42PCkeSG13NEVoEibrDB53ClwQ2DCZZY
	tWStZLWB1D0ULtZ/OSx1fJ+8YTK5pjK5L/3NE8yWEurAanPJDeU9lCjNCsIj/eKEbPaPJaeq4T/
	6CPf9ZsKzMpLwjfhb2Ozb8vkGZxWTlZAnTsavVBLYFOuSzzFtOgIKKsML7f7crlXYzu9fgguCRq
	vgAbUDOion9/hh5jgvGMAAqrW4wyCKJ08YoTbpg5wUoOzgNPxnN8/sHzY/XwPs3/gz1KV3UNf9s
	0iiL/mRcbPJw033vzrCUPrpOFLptjg
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3115054a91.44.1794218884271;
        Mon, 09 Nov 2026 02:08:04 -0800 (PST)
X-Received: by 2002:a17:90b:54ce:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3b12d57c488mr3114999a91.44.1794218883733;
        Mon, 09 Nov 2026 02:08:03 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:08:02 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:38 +0800
Subject: [PATCH v5 6/7] arm_mpam: Add support for memory controller MSC on
 DT platforms
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-6-150335a79381@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218819; l=4036;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=SVcR+hwi7W8WiyGR/9ZEtnITz44WeNpESQ+Zf8I0XbE=;
 b=JjDWgv0VXlw0PJfE0V93nb8oTc37DPPbjQTjoe3GHNpeRdv9e8sfXmLcZGGjGPiF9B66D54dx
 GKk8AyJt6vPAL351yRRkOtyss73IJPxqfW8q0RujnUA70L6H2N0pH+l
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXzpybwNG7otE9
 PXjvowjHEoiTimhFSG5u5zMdDnWoH7klpU508tBKjdKUGgDVqzIQwHeeB4SrjG3ip39+vVfNjYo
 lcoHHWPtOuyMMP4aZ7lgv1zOvjlboPSN0OC7P7CX0qKZYmAolGzxMahQNbLxxgWCqrqAS8jDFp1
 xpWaSZctLLeRF92M1em99XZZmpOPQK3EhOqpk3MUoeoh2CBZWLiB7vTwgHqzKurlYITwD4ugdF4
 pPaU9Vy5jkjYGgok/Xn5F3kZERj681+ret4X811Ecikx51EjZGkZzRlXOo23E1E4pME7TjTUpbP
 RM8N0MOByx3WLSNuATErgr6YID0LOX4RhVeEWkWF6L9tLrjlPyZQxwgCH/zmiy6uCB8xabgF01H
 EKevNIz1r0mIchE7IBG4QDaeyW55yuM/kYQ73yCW/j5wr5lB5n2216Gc9BK9SxxhWySSYfqhtbF
 oUfuroPH6KltfBOdDcA==
X-Authority-Analysis: v=2.4 cv=WOjqzXsR c=1 sm=1 tr=0 ts=6af19b85 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX0hVBO8uSPCqU
 RL9QDANWp8Rf7Ig1SuCIvw0mvfUftbB1yE/Ec57LRaJkwohfk0TSnSYzrrU/ClQstula1ba1OwM
 yMZAQaJHcLGacYcH3sqJBTA9/k5hgdk=
X-Proofpoint-ORIG-GUID: N6Gg6xiw9M_WX5t1TRtgnujoMgmRjPfg
X-Proofpoint-GUID: N6Gg6xiw9M_WX5t1TRtgnujoMgmRjPfg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use u32 instead of unsigned long
  for component_id and compare against ~0U; remove the unused memory
  node reference in the arm,mpam-memory-controller-msc path ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 54 ++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 78caa8ae1349..e0ac6ef83d6e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -365,10 +365,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u8 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	u32 cache_id;
+	u32 class_id = 0;
+	u32 component_id = 0;
 	struct device *dev = &msc->pdev->dev;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *memory __free(device_node) = NULL;
 	struct device_node *parent __free(device_node) = of_get_parent(np);
 
 	if (of_device_is_compatible(np, "arm,mpam-cache")) {
@@ -377,27 +379,47 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			dev_err_once(dev, "Failed to read phandle\n");
 			return -EINVAL;
 		}
+		type = MPAM_CLASS_CACHE;
+
 	} else if (of_device_is_compatible(parent, "cache")) {
 		cache = of_node_get(parent);
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		type = MPAM_CLASS_MEMORY;
 	} else {
-		/* For now, only caches are supported */
-		cache = NULL;
-		return err;
-	}
-
-	err = of_property_read_u32(cache, "cache-level", &level);
-	if (err) {
-		dev_err_once(dev, "Failed to read cache-level\n");
+		/*
+		 * For now, only caches and memory controllers are
+		 * supported.
+		 */
 		return err;
 	}
 
-	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0U) {
-		dev_err_once(dev, "Failed to calculate cache-id\n");
-		return -ENOENT;
+	/* Determine the class and component ids, based on type. */
+	if (type == MPAM_CLASS_CACHE) {
+		err = of_property_read_u32(cache, "cache-level", &class_id);
+		if (err) {
+			dev_err_once(dev, "Failed to read cache-level\n");
+			return err;
+		}
+		component_id = cache_of_calculate_id(cache);
+		if (component_id == ~0U) {
+			dev_err_once(dev, "Failed to calculate cache-id\n");
+			return -ENOENT;
+		}
+	} else if (type == MPAM_CLASS_MEMORY) {
+		err = of_node_to_nid(np);
+		component_id = (err == NUMA_NO_NODE) ? 0 : err;
+		class_id = MPAM_CLASS_ID_DEFAULT;
 	}
 
-	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
 }
 
 static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
@@ -2574,6 +2596,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 	} else {
 		if (of_device_is_compatible(parent, "cache"))
 			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
 	}

-- 
2.34.1

