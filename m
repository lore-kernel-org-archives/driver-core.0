Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419863;
	b=h/KEfnC4p9YSEz1LRGbQe/vMoy/FvkRvqVrZlU9Ysf3j+yTgS0KigqLB2VyEZ0pgktQn
	 aom4yDx4dPTkjjiDqwOVv4+pWWtmZ5qLu9zc006htjDTd6b668BOwCxZF3EhSW5lNxuA1
	 uPlJwLCAFT0EhTDlnPq2IH4F0R9DAPJa/MnY89MCHM/qJbIc93ipH2z/m7PgMklRMw6Cz
	 5vTh3PeWeU0TnnuAV4r9mXwIEgIzy5UdLAdCa83Qq+aGzNSXEwbsuH2cWaFiT08aXtvRh
	 ygssQvvH18tryM5TbQ5BPfI+7gox6XB/rCnP9bD7ez4AKggzhz1Guny5mh7OD0kJIlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419863;
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
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hXWNiXSly5mGE3xAhl9y+VqDD4Aj8QlqtUyLuYAl1v8=;
	b=TK9BVltTp2shYuhD8aq4hVKkAYPUQBepi9vfK3/iwK/XoMcZZa/KCae2cnAHOkhDZlgB
	 ND1Ij/ZbMkwVHYGys+RGUv48DuFBFLAnfYpV+FdcErI4NeKRADgkkKjuW+tfsDHGhdt8v
	 GPF9hb12HrlqS98MmQgcve9jzCOLxqJCJwH9I534voswYACOMYYpM5YLr6De61IJlox5h
	 nlqcAZ/4mDkqpUuCV6kcdJH5V4QTQP1uWtfYhq0/K7txIQdWrSqfDqwxjnA/OjOm7Wn3a
	 S24hACei1QeRtdaZ1Z01nse77yA8lDsE/lCu/ewTJCRNTsOZlVY6P3UBkFXi4pHlWmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=CyQIu8Kd;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kZbxOlYU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAB260A2637;
	Wed, 11 Nov 2026 17:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAB260A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=CyQIu8Kd;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kZbxOlYU
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHswW4553525;
	Wed, 11 Nov 2026 11:57:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hXWNiXSly5mGE3xAhl9y+VqDD4Aj8QlqtUyLuYAl1
	v8=; b=CyQIu8KdzPuzwJ569Hy7tkO9o9A6KU2wEB8LdYGIXiF2AwfzW5mLvKyyP
	07OBysUz+aleA/dzgvyE7b/WI5VVUehv9ECLfjy0yVFuJngc73+Zxnc2lO2l1Anb
	laXKtWvG7/NvF5c2v7U28IMm+rKEKgN3BwV/vW5ZtDfgMLRpcH2mrot84/oOexKd
	2btuZdo2HY5fUgzS3CgPNF5Av24JajbffBQHcs0D3Pg35Ur5uzFzK8oXj17ML3t5
	zbpxnr+HlHHcx1b0Cv9BAm1RFmTSpm1dmb3ATEIUnl9jCKXfXxUun8/cu/BmCinp
	hJaFD6Xz9ikhpmphpSmVTcKYre4OQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013028.outbound.protection.outlook.com [40.107.201.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsymave-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:39 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkoParQ9k8Ch8JP1CJmIffnw5pSfTe++3XW05jw0cCsAXWDTyWETZdB0Dh7iwGsWbEum9fu+2iA89p4WBbQzuc98YDHW4KMJToihpRd/IYE+HrF9Q702Ru5SnRtFUMyqdNjzsq4iG9EL/8Rro7vmixPvnKQXenMuQztnJOHy3W88KGBZDCG3cOQEgH/IxU8YAMEFtV6v3R8SangB+jtJgJQU54cvDEnkEAk+pjvzUIcTSZVqrQtPVw2FTxf9jDxL/LeQQweZqJcYinJvixGYHjsijgI09DiE0B3Lxtt9xJAOO9g2WrinhxpssnINNQM/lfFQVIsRcZC/LntHLZjcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXWNiXSly5mGE3xAhl9y+VqDD4Aj8QlqtUyLuYAl1v8=;
 b=PNceRHukt7lEl7t/JoVCnMMtTeGBWDFqPl7vJK62q9Cr1eOgPoh2lqXJtIUindYc5ntVx0E0IXBhmZxuBwEV1M27XJ9rSB2FQMGZxm7MZnX5fo1VAJYCtuLpNUOACjD68IQejpLFEZicFwJTZSc1rC4hQYTCgH8kAJ+IOfUve1X9Ip5hvdmhTn8+XnhzNb8c8j6K9LrPfv+DQSFgc0Y2i++1FeNegONU9j4pZsER9oLSuDvhf4CjX6OLEjWLYtwwY+gdESx3g+9NHKDJ3rJgo3HY6EdD5UZkxxpE3Imw7bJOYgJtSYh+CWvRVfTwhy/5xRNDGwwaRMklBa2iwkCgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXWNiXSly5mGE3xAhl9y+VqDD4Aj8QlqtUyLuYAl1v8=;
 b=kZbxOlYUnHEbdo6NptwuZqtEHPI8SkqiCklqKScUZnkcuXQuqe0/jNP0DsKTk5jiptIR2FGEYN/1sRicRYEm3wzIZTrzKHSmFvR3NBy3aRSTnBbHlkmI9pTnRsHORM0i62d6jo2qwDmLCaRo/zWhYvsN/Uv8KCK251ENuwAuNMk=
Received: from SJ0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:a03:39c::12)
 by CHAPR10MB997697.namprd10.prod.outlook.com (2603:10b6:610:2f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:57:34 +0000
Received: from MW2PEPF00014673.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::4b) by SJ0PR03CA0337.outlook.office365.com
 (2603:10b6:a03:39c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 17:57:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW2PEPF00014673.mail.protection.outlook.com (10.167.249.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:32 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:13 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:13 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBId193504;
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
Subject: [PATCH 04/12] soc: imx9: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:03 -0600
Message-ID: <20261111175711.428824-5-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014673:EE_|CHAPR10MB997697:EE_
X-MS-Office365-Filtering-Correlation-Id: ec184ec7-5c26-47cf-cb71-08df401d4269
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|22082099003|18002099003|6133799003|56012099006|261102123227099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261028144727099003|10067099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	So1EatDFQ6FpzaopIoItWW6GR3gWWK9y1y9Uea9B99h5t/sSdMaksqwMbH2E4jqyrPhRCjIkZ/2FzjvH2IwJY0j+EDoLtsbbEjvTTZoJEsiJr14k1hfYq6bv/+g3N+qJbYfnjcEUbSG4bJqkc5SvKb7No0ic/eIP81zMW1SjqMqK12tZ6ukD9Pb96eepvxYQNMgGpxf3353+ErAfO7/Vsb27Lh9ymehePDGe7o/CzJkA9xnhywMbGVmsnaPO9h2mGdoJS3XbKs7t49NSuwi9GM/dCEXJmrWUeBlKJBCEhdpJIQ5R+xenacZqbeHmpD1AOuH3GgBPBPT5Ea3t/xMJbNC7n7LO3slUBMexGYXp2PheSQ/59rMSQsUIHLWvSn9BNtlktYbVMh/T3gxBO65b6YzffT5/muLsrC8Pm/FHls76jY15mChySBjOGwaCzlw4h3hVkIW3QRZ3S2O9MW3+XnycAWjsUvyaMNwliAFTWpY6HZuS6hGtlESTlMvGFBjI3WiMW/8alNtXwedWX/ljWIQ9m2NcqtostkDaCirURuxtpGGneHNVZcWd9cJrOP2vCnjKZfer6Mw6YRLgHxY2DM7jdq6P3L/nEt+EFDymo2TYi6wKs3aKBZzVdB0lwV5+kEFDEYo6uLn1mEF0HGwtbow1Ia6r9wZo1ykCZR9RmWHx5FmUZ0nfCZZcwtrd4mVjq9bYcJ3gvBYtLR+0y0Kraw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(261102123227099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261028144727099003)(10067099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HPKMOmrOcJ2+maAUA/Y8Ht9YtR12gEQec3H7flpoghuMHm9t6RMx9hGjV4xCHKz8i5xp11jBh0rSkM1KIDgGpP2qE0dVRbBFJDmjKnV30UAhjyWfr9dkOLl5uhW8RcUx5Y/W3jZL9pO1hlC5wdR2icPbylZLDRtv8jNLhJooikqw7h+KqkRhnTh0CrA12JPf4xW7mRpT/AvVZSURX0cGuiEpXbJnlesXJAEq/7SQyitadSXVAARsOo+v/kP7Dx5nZQAspfCrrmYIB+5eDhvBvXSXKECLDfklSCI5OkOi5M1M3C6rUqLjda/bus9Lh2JivTRXJhipZjWUaSMokUycxtn+NWML9WnPQ/yceB/QVuxlLaEbS3JoSlOgCGMUP27csoT4vfMN8Jxwzi/Nd3IktJsNclkJzXl32cTcitX2Wj2HOd4hZ+edIq6Ub6mhfvPV
X-Exchange-RoutingPolicyChecked:
	G4WdnVHbZruU4PU1vVlFN6NvvBpnUQUNbKz0BAToEmYl0Eicn1vy1iCbStC2LFBAX12UnAVrf/hW0/FVc8EUy72/Vtem27icsnnj4XcNbU+27zc75uGyZRBVKOi/Yh8xj6KDXUKH70CqrgiB3KE3te8trCA9KMnizdYjFVOwR8Sk3tx15ON6nFssbD6ggNI5hxAp92a8G0l3yK2X9ZXI6ty/YmdZ15Ne7NNwL9E3Lh2WbWhkY963Z593yv7D7dZzyLEKCKl4eweST7GhPkkr/gyoA/YaBxqF9eCb+4QZWfyu9vw47D6Fgwh48WaVdFC81DrlhxmOjr0UJuKF8K2QoQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:32.0948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec184ec7-5c26-47cf-cb71-08df401d4269
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014673.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997697
X-Proofpoint-ORIG-GUID: 7lp9MiyZIhC_yoUbn3oKh0-R3VVY13lS
X-Proofpoint-GUID: 7lp9MiyZIhC_yoUbn3oKh0-R3VVY13lS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX2QnkZ2nWRC5A
 ulrJR67y8U2u5TEOpTe/DOFpcw06r8dI6kGpCFeXD+gj4GWprQW6h0lSIMXsroIn0Ba9zHVj3+e
 3UvwXH8N9pHHaCEjbBPpqKn5/P8+DV6oEzjF45OFyYZNg4n83FNF3aUA6QfdDJrF995hnuVXvp/
 nVzYU32x6wCKM+b1ra1HaY4AH1Umfh+ptUk5wpYImTKTngBGczlJrfB5U5tttgm/PSNFuG4sKSp
 1jBd+47uI1QLoBO51EbbnQ3mPemLgHYQEJO0kz/lzABmN4Q/rg73q5tpDCnoLc+GPczF1MJ0nhZ
 uvlxNwK7TPY5Idwi6i8DgRGFcWjmn5VjG4wMhhYBv0WXtyxs/s/+muuMlt7KA8wmDr2LMDQZ2vt
 V4OGmk1+6C6B5c4XF0muIjDNApGfY6tcHfWGIoekmPHtFJZrHCmg3bHMzFO5MvCfhrdGWHFnA+g
 li+b3QZLB6fV6/LpkXQ==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af4ac93 cx=c_pps
 a=bKR93RD0qenpecP8xHJc8w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=_xq-VfNkQHoUXNa7gIkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX4LPx2uu4T48C
 VLE7Fl1VfIrotEDbXlL4ctZdgiaf1GB3vYRqe7+WWLzePv6ybElKVwhmAj2DwZTcDcm/LEAfpXT
 zn4QlY5ggWIE7iyNuX+vgp/lLyUOTaM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/imx/soc-imx9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index cc8f3b7d39e6f..a4101dc590d55 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -67,7 +67,7 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	if (!attr->serial_number)
 		return -ENOMEM;
 
-	sdev = soc_device_register(attr);
+	sdev = devm_soc_device_register(dev, attr);
 	if (IS_ERR(sdev))
 		return dev_err_probe(dev, PTR_ERR(sdev),
 				     "%s failed to register SoC as a device\n", __func__);
-- 
2.43.0

