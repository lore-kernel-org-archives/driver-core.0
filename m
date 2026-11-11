Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419878;
	b=AfVAWetG6EOCCZhwySwoZ6aThZJ15uyYqgTS+wAR+0vL9Yxv4AtXi+rqVXBUCCYjvkBQ
	 vEoBPgTw2oP+E45489jmXL/kmGCk9FYloarM8eHsYB9ENwVk3sl4vnyVT2Tvcoz+xnNgS
	 r8r9EYz32lyDPsAHEO8W/83LUvsqkMKnb+p6GmP6PiUdzVbVKt0Xumyt8idkQk850nzyt
	 y5mmojvbQpHyspkZdUm93q+NqXJbcBFi8zZhhImNPMDfaD6ZvTn4f2WiIrRIy/wZCS/VU
	 8VV8rZ8gI5AG4917YvayKLhDLMhNsvxkl7nqgtDYjz+0upbz/ACydcoMMdDYwBs2QdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=afCfMy3c2LZCarQ5JvteukGSNX3tE0NmJMOFnbdl/kE=;
	b=qgnYrSaLVTMGsMTmnq5cK2WcciUgNnuiUV95AebgVZGSe6pSUWgjY55exK2b8B+oz/SW
	 xUyAsG1raAO8nYDBaObYfGqkO5Ua0qoDgR/a+lNiW+cIyzUiURFmOuK+Z8xw4aJQZT3n6
	 YqcPCR94edjwha16H22Ohl9OQKVREUO+H4tbNwejvRUd4VUjtDZXxvvobxmXPAYoVqv9x
	 0shPHVlPv5VbP3iWrDVo+XiYSRT5hvw74O7Y7y5NJ/Tyypijr+mRB6W/12xkRSbFzveci
	 xBr6Dw6W6s/ki5ZYWSuiQUB8Tg+lTqRNW9smX1C+A8z9Z9q743QFdHnw6thiLA7edNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=qf1X8BVZ;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pSV1w88A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7060A383C;
	Wed, 11 Nov 2026 17:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEA7060A383C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=qf1X8BVZ;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pSV1w88A
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABHseIR948335;
	Wed, 11 Nov 2026 11:57:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=afCfMy3c2LZCarQ5JvteukGSNX3tE0NmJMOFnbdl/
	kE=; b=qf1X8BVZMLTJjMmOKu46KiCH+AniHpUD4+Q9rWENanyxDyDtf+zQQtPnq
	f5QvXGFguxaaSW4iItjPM4rvYIilRq7t7e88Ev1/JfvMJx9wpdDP1XKVn8rIhO6F
	Jbuhscbeu2hGqRmNUrL4BqBmEOfU4yABCS0YqttXCNQnjXA7Z6rzPDOtGHiuHdbJ
	hVs3vLGfxllRIVDqMSWJeMMqZDfLWARGapmG6IyWPLv+u7tpda9S+u9Rs8J6NWoE
	DIFEOY25/Oe8n01oouxJ9SeaSSDYr2xSY2pHHQbEOrzx5Q5wtdWj7X95mRuJ6bzT
	evodqferG247br4H5FVGYMjNU4zNg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010037.outbound.protection.outlook.com [40.93.198.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupvyxh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRTkOf2x1ACp2TYexRxyRMaAYGvbUeQjBX6mMiwV1VGFq9U3Q4zFR40vOOzmtBnigPtqfR4/OPkfpt0vwfRvQvzR9Ej/TOftLDlb5a2O/hpSzXcbzrQtNLu3ahaOiOcuqItvihWRxyumw6K9OmHgSefBaaH9O761Ae/eMzs8E3qSkWBKUtEzsA1+Ak4I9DwiwbxagWt5WiPXmOMOGTJzN7OzSfYZERcYpHYPN2DuhuOT8c78l0Iwf+Tpx7pTlG2JANCvVFEMzPIGp/ok9ZjjCBF2OJPT3k/DkzocdRMY2Fz2/V/hfYxt7nXu952Q7DFPzN8cl41PANdltoJZ9aVLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afCfMy3c2LZCarQ5JvteukGSNX3tE0NmJMOFnbdl/kE=;
 b=K2rP2HHEu3/+Vrw2uHtjvlAyZiSzSMoyeaDRk2397Eq7wCZbdTDIcZMTez/cLSxt9hd7vSh6qxctxO1ioKuMdd2R/dD2Mv3lTh7FbkxjcK8AokwOe84X3plHmU1ctnFC8Q5GtEX4S7CEfxrW70GAWlwuZKXHgNxqEQVamiUXnJWotgQsKJApTbIc4l7vKuoRJL6QX/eoOByVNcOzRf38LqFJNhwysVGMHgchy/MsWKQqh1RiB386a5jd0NiCZl4IA2s5bdSI/shqNRrts/gbx1I4Ef9rJnkmecvw3XlPvSV96Wh/Mp1DQmRvA465qtzd9lwJTwz5tug98Nj/rp9WOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afCfMy3c2LZCarQ5JvteukGSNX3tE0NmJMOFnbdl/kE=;
 b=pSV1w88AOae+XWMGVHQhmZBlgyGu3oHweM8vHSKMa7uERrbrrYr4oaSyoghFGrzGirq92eLYo4HdTZB1HM+16FQZiMDdRXdWmw5Q4XGndanXIeeHZTM+Hytfwz4w5Qlet509MWp18U3qgYtfobUs/bQx7Bo/dHKpQvRMWdnIDcE=
Received: from BN0PR02CA0033.namprd02.prod.outlook.com (2603:10b6:408:e5::8)
 by PH7PR10MB7839.namprd10.prod.outlook.com (2603:10b6:510:2ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 11 Nov
 2026 17:57:50 +0000
Received: from BN7PEPF00000096.namprd03.prod.outlook.com
 (2603:10b6:408:e5:cafe::66) by BN0PR02CA0033.outlook.office365.com
 (2603:10b6:408:e5::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:57:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF00000096.mail.protection.outlook.com (10.167.245.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:48 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:13 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:13 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIc193504;
	Wed, 11 Nov 2026 11:57:12 -0600
From: Andrew Davis <afd@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 03/12] soc: imx8m: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:02 -0600
Message-ID: <20261111175711.428824-4-afd@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111175711.428824-1-afd@ti.com>
References: <20261111175711.428824-1-afd@ti.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF00000096:EE_|PH7PR10MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d0da5f-73ab-4c76-fc00-08df401d4c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|56012099006|261021123027099003|261009223027099003|261021121427099003|261102123227099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	WljvaAw2rSmWYHzrUqlBBkq1m+u6dnLeMyW61P7lBVP7ZJBPIsn2L8bcBPx2QERbOEbL7se2wcW7bARauFsCH9XEzR9Fn8I9ZKt0azs5aI3gpE33iAVQSOVlR3du+3AD/ako+1Yk3KcWfVans/EqN4j5FsDOCVIddMZcpwB9t/XZPRNMs/dGSdG7Sy0Y+D+V2lbspdjPDEuhGhECKEY61faZgQzVITBQll6RZfCrUnT599aLQyp7zZ4BCbTJfzsOKmKSbYPBvQkGjV80WN+O/QzHN+vBeKwsGSYTsGweCwYJgbJ31sKjISPZt+oY1Q9JCKzmGsgiDJvxKcUd3owzO+i6uknWwg/4/J+yLwNmAwA7oOa/B3ajJK9wn72930fBgkmFoiCDZlicAt5c/Qiws/2yPvz9O6HFKe8rWsCijLsy7dqs1UU0Aui1XF56RM4oC1tZtN0XvYwrVJ0aRtIYI/QjlErB6ud0DGmVS9thFO5Svg9l0674RxYe7Dp4X27RYokBUU6LzAlz4+VDbIpuJ8SdUKVGqnwAC22yN8D2yJVVsh5SjqMJoY7a2A9hsAbLbj03eHjn/xtUNUp+S5OUtl6ff+G1W4i0Kts76Hv5pDqUddvDFuIwYc25pteU40ZrD1nvPR8a5+uQRuKStGwcQnTDEFU0Ku5tMSxow5YsZ58uNavKgzTviNQbBid+3x3o2T/sYMAlzs/zT7VuH5is/g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(56012099006)(261021123027099003)(261009223027099003)(261021121427099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RZiLgQeJKj/THxZLipLpqEZ+wc8vslOKicuNpoZ4WLoqZ/oRJtuKhepd7omZmr7/+XwB/dA5P4claFhWrL9INsDlF5ZnXhoItvy4SHqwf9FznMNlG8e4lSqSmFmMskpOImS2Su/GJcKTmpd+/6+n2DZeJr5wBtFo8oW4PPRZBAJ/T7ArJ1bA9pCWwzC1zsHWLDsy1EDWIURMFguhLcbzOYQDl0Ehl01p2pQ5XtzL7TzJ/qu6587rG17i8Oh90OzJgzshvK7hqFefNs362UJvhtlKi/s4c02Y8rCLqjAK5NEiAa+f4T/Ln4laegwAIbXhFlQnXpfgolAQPM/IlqHTW5/UZn+wGt7cDAL5vDniYbjNIZm5rwh71kWRm09e9nFX+MmlNnUBSJO1Wd3GT3+wumQ7vjPS5xdQof2B4555pzYfkhwiwuJx/0sHRBstiwrW
X-Exchange-RoutingPolicyChecked:
	MsUgxk0invMPFUsPbL3nEUrG0jhzutWObIWWIbuQs9hJM/iM9WHO5o/gRwqgo20pYwaoVVID3oggxz9xafZfIrnfgXt6xEarJ2RP5LkXSdnqKWaQ1RxE0aAZKwuCTvnx8I8IQZfhgJhXuPWooKbGZt/kwKWtSCgANyuwIFbN6F/JCgXSmUeML7ZgRyXFcZivwyJ3yLNBCtz3ps+abyc0Oux/faC4f5iVIJUtUnJLcwPxdbvyec2eoPJMX7M9tBZMWIUEtQihZa2VAq9EKsweK9/WD6o99H41TcvnEvnVDdOenJpyPGTBIC9nogAiDWjLb2gKUCwxGdlm0jXh3nVzog==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:48.7500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d0da5f-73ab-4c76-fc00-08df401d4c53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000096.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7839
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af4aca3 cx=c_pps
 a=HozCXiP24e1PxqS5ATOdRg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=OE-UzOn-GiZSVKNfR5cA:9
X-Proofpoint-ORIG-GUID: Cb6J-pMCG3ky4IM3xNbty1Mc4QXwhLED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX87Q4ePTdU17i
 Fdq8WJMtuPS3Ag69RrHwBtwOWfld4JPxIvOpGnKi2dPT1ru+/ePYQ/uCgiNphxhyYeDsqmQDO1C
 ZGGS/JH5dEWYG9A/Dz2/cabHO5VRbZL4mb6P+sXJeAFzlfpAs2lq8viEDc2jbSJAaXKE+LWgnDc
 k3PvdVwXaq1aAA9AhfP2UfW8o7iUgiK3jKSLDpTdxtiyjxeXiOQvZVnb5IbXZjITFyYeQBzFGi3
 qWFwATmgQ4tgpLm9nqtsMlEIl+aM3/6fJw9u9kFzEAppzE8k+PI0DQjxVI18y8vOA4fdiT7nArn
 J5nb6ViNm7OXxh/GZWv0WgQKTarWxXzvE7JvJ+COwgUs9DVPCmlcI1YRtUfCEsykEdOvHopFXmx
 Jx86lh6N5dcA7hGxACXQ6AyziMhT4kA3V0Fn9kK8FurAFVbkhOTXp8XporAs4SWijC1sIPdYb3L
 fGnxz4/Hqgwm9osZsRQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX7BdmPJsPCc02
 b6cikCFUIF3Np1h/8sASurn7OZljQPPy2K1j1ig2lV/U/mlp3jsmTrUcWqciDTfHXB7JzzCrK8E
 1dsQ5+PrIhARVdr4O50HhXTtgKQVfHY=
X-Proofpoint-GUID: Cb6J-pMCG3ky4IM3xNbty1Mc4QXwhLED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/imx/soc-imx8m.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index f0929916f0423..fc32336923aab 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -209,11 +209,6 @@ static __maybe_unused const struct of_device_id imx8_soc_match[] = {
 	devm_kasprintf((dev), GFP_KERNEL, "%d.%d", ((soc_rev) >> 4) & 0xf, (soc_rev) & 0xf) : \
 	"unknown"
 
-static void imx8m_unregister_soc(void *data)
-{
-	soc_device_unregister(data);
-}
-
 static void imx8m_unregister_cpufreq(void *data)
 {
 	platform_device_unregister(data);
@@ -284,14 +279,10 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	if (!soc_dev_attr->serial_number)
 		return -ENOMEM;
 
-	soc_dev = soc_device_register(soc_dev_attr);
+	soc_dev = devm_soc_device_register(dev, soc_dev_attr);
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-	ret = devm_add_action(dev, imx8m_unregister_soc, soc_dev);
-	if (ret)
-		return ret;
-
 	pr_info("SoC: %s revision %s\n", soc_dev_attr->soc_id,
 		soc_dev_attr->revision);
 
-- 
2.43.0

