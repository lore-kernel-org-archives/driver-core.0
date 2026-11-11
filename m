Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419877;
	b=FnKgXQBBm4tRxwew8FekBtmkLtbq5OhfOYzzfVxiO852XgGr4sNMYjL6sXjF/TI7ND+n
	 ZoStKZVU9/PEol3cOIHZRIdO4t69WsnWX5RnYXBaykbLa7J7CvRuhox2q/so1WuBgdLFC
	 RsIH83pYOn/URkdRMFx7MzFjxzYncQVTSQGHZqAHk9Gxv2FiGnx6UwIrRf9HnZm3YzOiJ
	 bHdf5qGBYw4FxUyZTXr/pVXtMz8ehuiBMItdiuTVOsBJ/m24itIn+7/UuT8q9r3TiSNFJ
	 MxLLISWTET/GJbvvAGRAQBRXd8+qeS0GcZtih+yPZijXVSgXCDvgrSC08JJBhTC1qyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419877;
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
	bh=jJGbLKtHGiq2vHHUeSGTp1p3LfGB4cpdpJw4rZ/MxZQ=;
	b=3Abwp/1k0oalLhT7ETd2zXeYJ/UYN7DxOL/rBlnP3FGfE9y+E+I8SOywsCPlRc/HB3Hc
	 VmTq8bsiys/AEwWjnAqAiISVw+j4/0XJ9wupR4WJQub7cDv21lfbu6k8pvPWmubWNumvQ
	 hqlg7viks6kXEVv5Yv8/sjWcqh1OVvdv+mf0sxrYD4nmO53EzbH9MS/JbMBXSMdizjMVx
	 BXB/lHABy89d5v256cmUZFSjD55eNJ8y5vZg/BrYK/gxmW6XDc/8es0W47TlZHP+fNicQ
	 hbfp2wCiYpInzwKJXakFs4VwdAbKlrO+2sdbKNuWDqHjsC0q6n88qnadg93sfdllHYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NBHhlVPL;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=mRpURAUF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0793B60A382C;
	Wed, 11 Nov 2026 17:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0793B60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=NBHhlVPL;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=mRpURAUF
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHsgM81314272;
	Wed, 11 Nov 2026 11:57:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jJGbLKtHGiq2vHHUeSGTp1p3LfGB4cpdpJw4rZ/Mx
	ZQ=; b=NBHhlVPLiZpWr8NF0RebEj02emb9jILTBnuOOw8hgvUsmoqRsC5Df4uR0
	3McqV/gvg4tR1+Gt4cDUXqE+a3RpHMu2yVB/7OW8XGSKMvu+gib001MCps2LPxYL
	Q2KKuYTMQux8IaYWJd95xlupo+T5C7BGM0JeESi6RFFIC3M5awThOXTr2b5Y6DWi
	kIARzDJ9+DgJNd6wPjA7vrKcLLIbJCWJLPgLeP+7yWUtMxabzpYTYIk/nYLK/WQR
	U1B/BZT/CehxKXEzJPP4MRUpl1w9+YQH/q2cSo+W6PfsTot5pQqP7rc61GZ3dhzM
	pPc9IHLCL+9hq5oKNCY3dRHhLRdwQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010059.outbound.protection.outlook.com [40.93.198.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6r6u4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:53 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHAYkoKA6StRvCIuiibtaZxTXYeaHx7A7bkkZLbrLqGOhhAMj0K7XwywZ3mP1RtJ3SfYq67EnIJNJYNG+t1V0vVnABIMfH0Rz2/X8YO0tFmiIjn+day5MnBmzWy+/q1JRqAxVMjGapfGha0ODHlB/b+nWza7jJhfBj0dfrP/ygAOqv5yyKYv4kXFqTxeKoSlxJzU6biGb6z+yEBp0yECbr+0YfIE4S+8bnYsQl/z913xtEMZvl+jSmU8h/dRfm/9z6a1tx/yPOagDP5jS3udXJL6rgNVIqn4j/bbI+HWs9o0rLYgCFPDL+eHvyBtbmk85kAJsYttLnteWQq99m1ClA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJGbLKtHGiq2vHHUeSGTp1p3LfGB4cpdpJw4rZ/MxZQ=;
 b=mEpV3GiMjrTxNNYiP5dCStL+arw2lfIbSGLWGsdJOtDtIWnBRUJP2BdUo2Up/EpKl1NclV3Ge/gTM4eOTRuA9PdMAtSNHhl5rFW0kaqsiAfP/VrPrW2fi/kuwifn9dnFX1WiQSy+m09Ub6NBQMAL+D96GKw/yQx5exIcUk9wOxm94JmWr5lp6EXLe0esTCWnZVd5yUmuTIeQuQld9mvsEorNyeT4cYppdczhWMJNWvP3Ep2ANLZ0hF932v9DutFw4vU/roxfXvCyClOgybrTNL6SCX0G2Zl4MUAv6CosQByU4L4/yZ8ZZn8PzMdgZJQepD+uuI4zj4G+Z99yPP0prw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJGbLKtHGiq2vHHUeSGTp1p3LfGB4cpdpJw4rZ/MxZQ=;
 b=mRpURAUFifGBoga1s7vRHA4yUaplfqjxB2OREkacbof0x1cAdsedmPFqLOVhDH4qbZ7okv/OpiTbxh+KLe56SaAswebnmfe1hCfgNxGZKXUseEvVeJ+YSUDUyYnIsqHRoO3YQTfH87DQW5jrnIsw4M54JJ1/q9FlYULPIX4gMiU=
Received: from BN0PR02CA0043.namprd02.prod.outlook.com (2603:10b6:408:e5::18)
 by SJ0PR10MB4605.namprd10.prod.outlook.com (2603:10b6:a03:2d9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:57:52 +0000
Received: from BN3PEPF00022BC1.namprd04.prod.outlook.com
 (2603:10b6:408:e5:cafe::9c) by BN0PR02CA0043.outlook.office365.com
 (2603:10b6:408:e5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:57:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BC1.mail.protection.outlook.com (10.167.248.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:51 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:15 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIi193504;
	Wed, 11 Nov 2026 11:57:14 -0600
From: Andrew Davis <afd@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 09/12] soc: samsung: exynos-chipid: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:08 -0600
Message-ID: <20261111175711.428824-10-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC1:EE_|SJ0PR10MB4605:EE_
X-MS-Office365-Filtering-Correlation-Id: 29eb10fc-6245-44c4-80f6-08df401d4daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|56012099006|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	puP9JEiFhCdgul7a0PbfCNz+kUchd28AgV5uJCrOd0458XaoRkZ94wEmySlXpLBJgag0a0PugpksNt8813z81z5rWeDxeEx90GNTwvsu7XILbd5bUaM2wvxpTs82ntLuFIQ28J0xlJwCtLHJdtaxcyBlWW79GXGee52EYbSV14EB54rfY6Vfzo/aQEg+I1//ZJk8fdhL0IfsfU4L2c/jMWK1cTIziS9fXOI0WC8UOZ2vgOw9S8dWl9okwGkct+LRuVLij9/Jw155YX2vH3kHjw67DhU5DxZp6QXjtQRx7T1MQxUowv7+Z6C9dIWVjlb1nj6F/mKS/Ya9KDnaJbskd8ymNXUdxJqj0OJXZKrHWW75BsGn0ThMkrqmP6QqgBYVDK14Pm1dCPcKxA9xB3mLgYzNKOu15Vdct5bqzuxSgDMkLpLYNAvIFbn9Z0Sve1UZ4kCwm7i13R96Ju/iYmfzVf1BFanBz5bu0BSK0Dgxb2WaFPWfcRmSte4YMTSMhci4fnFJLFkaUqglMWtZVrBf65wssLnRCKzQglPmTKxP7A8dlKGW3pgvF9WBZrY17+Im9NvDABun9v5Nc9IPQX1flLCaWdNqYc1Q9tBZxFjNVha0eomUKXecf+yZi/GKb80XwdJKqidMJa9beAMKULgFyYaLtTRx3mAWauPToXsihhF3Z1uELrJH7h4vP8BTBFa+V5r1nXE7heQl1dz1bv/T0w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(56012099006)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7mAAl+zrdRQup9eDtf7HSW0ia+4XYbMbqwV9Dc7hli00ZibjLAL8b5kApqWKTYz0NgoCkzjZcGK5Bg0kkawxBIrXhj+hIIAaHXwR7qAIl+5k+2I+GKTK2fm6B3yTOuDhnrCCBAm5i2VtYkiK0dYC3dBne159f9LeexcO53c6G+KvudB0VlGl3tGPeFzDj+OJX4DMMnliDuhQo/eqQL2J274nW/E/uNiOci0kzdXUYGqtmHwFjl5c2MpvPd+gU9xDVAOQKe4E4nqdtn0Zf/EN9i6aiX9+pusmzELcqVmkfPRfKEEdDSAGANEi3vMWyzaNTm+HuFu11MaQccd/t0pBaa5Ay5+e/3VYf5RAwAdhFLKs3UrSBuRI/KzRlFOnLnguIaUiOixTo1knlzJqU43hzIylyGEWi19CH85QZFnjM0fnx//eTq23HsWS3lklZTzi
X-Exchange-RoutingPolicyChecked:
	Ldo2Ndlr+j5oEO7Qu/VHSD27MsRcEa+34LQcFFDhm1QqgRZLNAAKd/bfcjUdQRHUYcI2soeNtWZlfW9Cwtn9ZM+Pn/iWGVOtEktjv+ef6OOTc4f7YFg4FN+kfJAsiLVFdCx5R4lXtOwU0Noedh23WrHh0sSZqq5rxCXHI/YvDVkwEfiuDeMxZE52GtMmna8AFXNnOoocXPoZqyQgg+VSogTISnpXpF4AjO7FV0ognxGT+Vf89Y85krk9LljAxv9iGf9v3fdVvSyLGq0dlkXCxF5QWKavs7vHC2IhdSfK4vQnIi8eXE9/PPLeF4RUBbo2Hw0n280SdOMDtHpsXDWS4g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:51.0349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29eb10fc-6245-44c4-80f6-08df401d4daf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4605
X-Proofpoint-ORIG-GUID: moq4sSUxqA7m3JMGiZO9QonUgrNQ0On9
X-Proofpoint-GUID: moq4sSUxqA7m3JMGiZO9QonUgrNQ0On9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfXzHNA/QCuza76
 QLC5OzhzEGpvu7omNPogY5KdK9gf7dxQ/VBtMGnoQiSV0+l9KL1Oq4sq7liqJTTof5dAMoBQK8s
 0kLJ9V40AbVw++PluJ2Fi/XLqVe8jq+4RA9BpCMZ2jVIhB/ucAHleLANYEiFONigiAtUj6ZXs3Q
 hhSOcWbqs97bOO3FQisovQm4Thmb8G7vD/Xkopbtwn7qWVuBb6/y7ggIYvfYET6cQpzuYGw8kAq
 AAqpxuAjoow3+I82GGGnB+wvm8P6t2KSyIqOeQ1Y5ddsYEqU80fx30FDBoZNQhX3GjcEjob9bzT
 WRH5NIRNygjIoLEcw53w//aGXyNJlOn/HRjQ/A6aF/fjPbyQuDXsvIa9yLhG8cjnkCoxLMkwZi2
 RaNerqvotdlG6ae+WuUiissz88NpsY46EGpe9/JKJsttwccb0pmf00x/B7HvmicxEv98pq6PiSG
 W60rFUBfx4sIFYZ/B5w==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af4aca1 cx=c_pps
 a=iByqbumfC+QZNsSPXlDUmw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=UslMFxaEpCmXj0yKSf0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX3ICIB+34AVkv
 Y8p5BnH0/BCiPEpQz0cTONcyoH1rKCjo+BUUBsOGD3ejQBMfskiYgBBgPg5VWCqSvJ+1H1+FCoS
 MluyiDKx2HMIICoNChFfw+c3eLwZThc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/samsung/exynos-chipid.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index ad41691cfee87..34ce8a3bfd85a 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -146,11 +146,6 @@ static struct regmap *exynos_chipid_get_efuse_regmap(struct platform_device *pde
 	return devm_regmap_init_mmio_clk(&pdev->dev, "pclk", base, &reg_config);
 }
 
-static void exynos_chipid_unregister_soc(void *data)
-{
-	soc_device_unregister(data);
-}
-
 static int exynos_chipid_probe(struct platform_device *pdev)
 {
 	const struct exynos_chipid_variant *drv_data;
@@ -200,16 +195,11 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -ENODEV, "Unknown SoC\n");
 
 	/* please note that the actual registration will be deferred */
-	soc_dev = soc_device_register(soc_dev_attr);
+	soc_dev = devm_soc_device_register(dev, soc_dev_attr);
 	if (IS_ERR(soc_dev))
 		return dev_err_probe(dev, PTR_ERR(soc_dev),
 				     "failed to register to the soc interface\n");
 
-	ret = devm_add_action_or_reset(dev, exynos_chipid_unregister_soc,
-				       soc_dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to add devm action\n");
-
 	ret = exynos_asv_init(dev, regmap);
 	if (ret)
 		return ret;
-- 
2.43.0

