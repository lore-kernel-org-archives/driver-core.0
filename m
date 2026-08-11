Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4E8446842
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455473; cv=none; b=I+iYxCAXJi6jtLxdTjs88FY65I3G/p/juS7Ux7nodxNo5S0fndQsyCfM3AlY+zEVIOoLOzJgQZ4S0Y1DHBzjTuf95RcK6PSBmhgoEKwSlCoGPEunOQCS6vR185SH6RDzJl3H3MqGHutuHVVN3CqzA6eDYMRXIoGc2g5gaLNmehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455473; c=relaxed/simple;
	bh=Q2g8rNQTl5/Mdbyd7uWKNI40mnuBoQ0th/Z4yqlIjso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIQuewLPYv8q9PaAq01fxApGI2Z7VzYzmXtFJZB1l9skONs092jqCFttQCoTHXkYGGsPJfHWjeLwRzCDOAUd/rvPO4n53xZro0qCn4ZPlc4zek+JiOxrYq3Fa9PvY4Q8nMTzqGWVBPAL3LsnFdKHE2tLba2A41uEkH3R+cjNZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VA1SxQL1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HSz75skp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA1SxQL1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HSz75skp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWtxv462122
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=; b=VA1SxQL1VJOPQG1n
	+1pjJUPFvJwWAPLUYS2z9S3oZdJLw/GuXjlF9NQKBVqVPns6gPc0l9QadbH0xhv4
	0AdUEEVSNCm+Q2uJRPdl8RW6YX+zC71BER4VQHJoqMlESPjVBUKcdocfb2xXa/Nb
	VcA/ocmYVMVLs2fiv2mBh7kDpuzzMXnvcKS9+DcjqRKKo/jb8agS0d1JH6sw1c7J
	lpPST/RQTNp5qvTTFYQTWWfv3CLb/7Xwd5F2N5/XzdNKj0pIc4RVgXgmAEmIvPu8
	1h8JYDjUw4rmxxcdUpI8ftH3MYJZ8iQAIZm/hz5iNSg8+oid0m75YmkuC9BV6aoR
	SjGLAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049mg5f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cacf17c7e0so43546735ad.0
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455445; x=1787060245; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=;
        b=HSz75skpRjmZzX5vH7FdAxsLXIX7whsX04bDryWYOoQ2nqMP7x+eMy5JG9kEinumzU
         DiFYfrf6Hgr5lTijsyVKEaiyEjcyWpnTOLFHGb4I4nqXscmsNWfyOX7ViHmNw0f5GJxd
         sL/Q/CWsLB8mvFLTDb/4/79S6jNeQfvAqA7YdTg0okNSsUjmb9LUrddfVx/3bPmur1Oe
         RVCi20xQralubQkLfJgrE0o+Vh8kZ+tFADJvM1JxZuDhhmTrv7Sq8/wnNiiJRn36zjM+
         Fi0V1SDeBiu+jG2Lt6Bm2yTckkdvXItKOMeqWbM2wB3i0whxvZYDmkCYI9fPAU1RnZG1
         +E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455445; x=1787060245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OvZUgSUI8jko8+2U2sHOzfKGKXNhZbu+gmqY3GBbvWc=;
        b=pyyed6at9Oz2ReMWBFKvQ8YyHhZMK+f8fbD/cOymb3D3VUHkhYIkghz2sz+NdetX6C
         C9NSCpE3dfRYSYhbnwGotMkw2z3H7N6DivjEJH0pcrGFIrXZ1eneL360G1sXr/qjptnK
         lLG3TAGFsMrDLfa3IklJtG8Jn47zV1/+xDSRxFwRX/IKg6eulvnrM88pPGCOzEdYd9pF
         JvxZ7GWKgx3bni2VFXW5WhCGS7evez+lWsnqtQ/EHfwOZktnf5x3lNjGUcztxZX5d/m2
         EsUXEz7a7jdWDKWOUtXpCQ9JAppGIAZGgyAPenb6CHQeFdt8ryTEzRrb3DrJRdWTJ28Q
         FZYg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1qPKTq4F6aC0HGdchQ/DcGfmmWwsvbjGTPFj2XbtxYo3T0HO+/i0zIF4wyx+pvIh7/dqbL57UG8vrsA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8rSM1SbGfLM1qWwLFqCTKZBqsChqZhw4rp5s1qG6SbT9q7hhR
	uLEoj8na9VrmNFQqgZm0icfBPACc37FltKx0lgdRyookceO1IcPzXIkEdfSOuNkm3bBokiQLne0
	vNLnbh297iRYQn1j6ZSLFgD1bsXm/7T11g8zyBA9EFVRbUKcad/4/0U5T+8Nz2P5oog==
X-Gm-Gg: AR+sD12g6V4TN4IuLuk6n2Jb9B167Nd7oy9JeNf3It8xJrWeSBDYqU0UVgVNSwTIlZi
	9qUxh5PYGNm1qeHOVFFmTbM+Te6/eVrt/AWrIwfud/gw7TZeSNM9SM9Do9FNaPC1k0xjsF0sOS9
	1d5WaDjQDoo3ZsVu1CawT85+hmvEyq/LmtvlvX10kNUQ7erkjO9K65A3dlxXgEzIHpR6f7SrF0g
	4uIqu8lOCkCbrQtty5P5f6z8pXeqS0Btw3wLkRpHKby1IRyssWLXkRxEr6cwIvtw8mZTGX3p3Kd
	+ti0oi1MGkiBAcK4yV1/yvn0lsJUMBxAag0vOpV9660LokIWUi1ERUup/MjjSJetCBEMOvBpsy3
	Wsv1djzTcs1d2C7YhT5t/KhQOh1d7XzSe/1MPsMLC64vPk0ZMyPdZRcsW
X-Received: by 2002:a17:902:d485:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d31788ea53mr37192715ad.12.1786455445025;
        Tue, 11 Aug 2026 06:37:25 -0700 (PDT)
X-Received: by 2002:a17:902:d485:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d31788ea53mr37191715ad.12.1786455444454;
        Tue, 11 Aug 2026 06:37:24 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:24 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:40 +0800
Subject: [PATCH RFC 11/15] arm_mpam: Fix mpam_dt_create_foundling_msc() to
 create MSC platform devices
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-11-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455327; l=1946;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Q2g8rNQTl5/Mdbyd7uWKNI40mnuBoQ0th/Z4yqlIjso=;
 b=vzTRB0AF+pFRMYnNgKH1uIlaFES33p6mQJ63KtCUkA9LHR/5oZRPDKE0Ofkrx5KGIM9a+qDlN
 SnmgFirBDTiCoGBGz1gdykNdFv19pfZ8PtUHMkd8dmJ725IbaGko1ND
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: IWHiH7kwHuGVmX79mmnM_UjOhlwTWFW5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXw0Mbb437CvVk
 ofHuP3zDKJR9eAfH5iJkzX3A6i7h1WnA/wiq6e4l8u9OnsYWABu9ElXkZ0nYTZdaFUcfMYz2DJI
 GSoypa11yXrbIpYc/R0L8EhdWNTJDr3ERDv+mPEL+4GMhrGqk6VZcsRc+BgAt18/gxDJVlKijo0
 rpQ1UhneRyCMVMNrQDjGRWyNaE93mD+Z8/3T8dW1uiLC2pG8u9lFHKbRx89o7LB169HbsTsBbIr
 fBI8sOgdK52/N8dMfz1R4Zz13sAHW9xWFoF+G75Gl6Fwtsqv9vrX4zovMdj7If5pfhNW/7AWEoT
 SdCZkkWvVlZtl6Rphx87Uvu4vh/RcoktOy/GOsY0uXv90DAgyVKI3uEW5wIItF3XBAOW6R7BNaH
 zO5oBT9AIAlWuRQ95Pa7kNV0ZonxbsxQyIOBp6VkQvAotIPtRbUaUbQKDHFkkdxnGFoIQyn3rox
 5qTOKQzABsLBzo8JtmQ==
X-Proofpoint-ORIG-GUID: IWHiH7kwHuGVmX79mmnM_UjOhlwTWFW5
X-Authority-Analysis: v=2.4 cv=FbkHAp+6 c=1 sm=1 tr=0 ts=6a7b259b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ksFOqbt-pGiEIAjTAq4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX5Dr9cioVJ01C
 kP3oWng8vhaNQLS7EEhN1wGzxzWACVMQzU4CWSexh3Moe7MpV0qZh1L198FaViA3ZrfxRbUtdaV
 T98CNiCbygr+t1R8jZbBzHQjpMEt0xw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

The original code created a platform device for the cache node itself
rather than for the MSC, so the MSC was never created. Instead, walk
the cache's children using for_each_child_of_node_scoped() and create
the platform device for the MSC child node, skipping cache parents
that firmware has marked disabled.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b0e67c8349c7..eac3bc695fd1 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2358,23 +2358,20 @@ static struct platform_driver mpam_msc_driver = {
  */
 static void mpam_dt_create_foundling_msc(void)
 {
-	struct platform_device *pdev;
-	struct device_node *cache;
-
-	for_each_compatible_node(cache, NULL, "cache") {
-		struct device_node *cache_device;
-
-		if (of_node_check_flag(cache, OF_POPULATED))
-			continue;
-
-		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
-		if (!cache_device)
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		if (!of_device_is_available(cache))
 			continue;
-		of_node_put(cache_device);
 
-		pdev = of_platform_device_create(cache, "cache", NULL);
-		if (!pdev)
-			pr_err_once("Failed to create MSC devices under caches\n");
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
 	}
 }
 

-- 
2.34.1

