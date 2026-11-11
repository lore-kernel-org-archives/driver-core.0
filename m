Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419860;
	b=IFL96jLnpIua0IlzNtbMyQOItVbntfw1ei51b+zA/K+RL5L60UcsYD5VEIrJTJ79prIK
	 26Vv6SZJ65KLpmBMMPPkra/5WPNwmAWSsS3rCfc8giJwrjViMn5vpFCA9aK774XYo0sAT
	 lTOndL7mSVGhNxc3JBlaEO4s/YRekw/rxY+rvjG+L47yKjNn6ilMGXV5HgTWRKzJzU1cw
	 UZzdMTWsGrTmMVTqorxm41jHeNjY5fFWzcltHiOtcgfbfsm5MHWkWcKEcBdESnkNh5HXc
	 4TPoTKOEgoJIZtqRc8Mg8dD9BadD9fSsw1QnU1a6n1smtsGxcwCgKk1skYIj4moYcNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419860;
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
	bh=hPYZY/A4DXXEp/I2CnLJaTqAR8+IzoJPWTqLwW59h9I=;
	b=qjPdHbhFwZtOiBf4nrObNO+G3WWt10YWCu+EfAHJhW838v1u7Fgmw8N+TK7UfEjymtRT
	 qrDT5xTduoC6ctFCnyGFByJ7GjUJo2eL0l3YJ8Nyr6WCvlGRFmZXfldrrfCUEepGf81ua
	 l0hC5EChH0bEm4OSALfcR0+3lAYHmB3eXGl7ZHfUv4iFTgLcsRkKBF+AnIqlJwd5u3LJQ
	 EKNlecQcayBlEBXgYt0MWu1VHiUqFBVxDD8dMSSuumT8TNMl/R4RQXnFfUu1M+V9u7QqJ
	 XvaM/lY8x6g8cMkp9og4YO87Ozanep9HyLveQ9/kDNFwUgEhZuU6OVUgCRWH3nqVmZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GLga8jHP;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=GImZxiQX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BA60A2617;
	Wed, 11 Nov 2026 17:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705BA60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=GLga8jHP;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=GImZxiQX
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHsv7A553514;
	Wed, 11 Nov 2026 11:57:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hPYZY/A4DXXEp/I2CnLJaTqAR8+IzoJPWTqLwW59h
	9I=; b=GLga8jHPbUJaIoSoK3B6PHLAT/4qafQ9KJKeWkEpPa9tHpDZmHqQdi+Jl
	SKURAfRR+t9Gchuxogc/hW7kYQUO4A/mllv8OrOLZRgPCr+OJzA7fqHlqc2d8Ftr
	0DbD5eQClwl7lcFd9irsBaJ7WykGaXXM5yG5eD7TmuxH8RNQZe0RTJW4UNrPMVhs
	5UE6l+avC3urKcKjUToFNWqkvH2dgQMvHzsqmVYOMsCl/tVnG1W7DFOf9HfTLnDc
	9KQAo/wwuavyCuzW+OPP4pbCv3AIi0HPZPRAzQ24j0aJA1LhHgRIV8Fr30Bnkyno
	Dq3NeXcZg1RSz16KoemKwHP7rTX/w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010050.outbound.protection.outlook.com [52.101.201.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsymav6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMzDObJGI13FPMqnJFRcq1VfLR6oa5Y38WSJyGaRKiapxEX0Xw5ELiHuzTs0cVtBEzUaJRX1h4DsB8qs8amR9s0pT0n9xLdx4A/WKOHuJBRjuyLJ9jcgejf4YEi3QZABwkKIulUz0xAsDIbBFaWj1jTWtdbwrn162d+/3nDMbz0aqsaeUtimKTItT6O3I+igv137QNh9ETMM/KOE6IV5jr8SuRB8fJl21NoUoLfpUHGFFqZGq3NqShog+OaESR9vKb6OltvzZ36EiTUOrwCKDpFyPSUav62XeeYuz7Tr9s8POEmldcuAH63JuW5E5Bg8/HNF3fPuKSkN81dtJwiuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPYZY/A4DXXEp/I2CnLJaTqAR8+IzoJPWTqLwW59h9I=;
 b=vx+WNcUtEyDhjmkJ0+ivo7+tRZx1lBrf72RDYwFIDQlBAzIsr2xWckYSggDj38ydeV9sw6FeaSx5qcXF5yv0OeC93z73lv1+7JN4TeKKvO5raawCNboa8/GbH/VyO1IFqNKcDFBhjldG+rtmsDt4+MML6/bHxApCNoeYKN8KVADquxVU6pKCZe0LF6PG98AWXIPY3TViw+CDzSHXeJqJ0cmMzLf+togmUOqDt/aGg5QRUajOuhBGv0Mci3LYclCWBmNOSApXzBduQc/qy1P0DhO40B4nrYRXOvHa2c+C/Q6KnO2bLc9HLMJNYJ21dEpM3thTmPlrvGAaSgrMwxOevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPYZY/A4DXXEp/I2CnLJaTqAR8+IzoJPWTqLwW59h9I=;
 b=GImZxiQXo53OXywkG1XmECrf6m5YTvNymuaOgNa1oyNUYG0ab823hDFGOGx/IJEQz6stHEDgOEm59Qbv2U/OB1OkN3NbqnHw//HuaV3x7YVpwjBdPRmsvxmfvc85T/FZZu4tjzUQawVvD0AgHlYJ/GPXYPBdKbV6L1TfSb7SEkQ=
Received: from CH0PR03CA0383.namprd03.prod.outlook.com (2603:10b6:610:119::18)
 by IA4PR10MB8277.namprd10.prod.outlook.com (2603:10b6:208:566::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:57:30 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::9) by CH0PR03CA0383.outlook.office365.com
 (2603:10b6:610:119::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 17:57:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:30 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:14 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:14 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIh193504;
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
Subject: [PATCH 08/12] soc: renesas: rz-sysc: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:07 -0600
Message-ID: <20261111175711.428824-9-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|IA4PR10MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0468ca-bc02-461f-b83c-08df401d4168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|56012099006|261021121427099003|261021123027099003|261102123227099003|261009221727099003|261009220027099003|261009221227099003|261009223327099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iGORxDzdSafHUDWDI4Rh/bNyNP6nvmokOOsUYJbYY3efO7qYAXiwmv+pBM4ibwN1ochH7WD4nbHSVZGoQy1f9iKGx/mKnD9UILcwDRE/MwcEGyUsHJaPvNxfmZrrBKdd/mjMZs2Y7YuQ76PtKFH0LQWAwHmQHD2ek/Xl6wWqLvIQ+i1IpyHT0n86E4sXOyN7JTElS9bEj+grCMPfx2xlQ1Tx7P78ijYEnem8m1ZcU8MhQm4ilyWrxv2km92yTAjf9R9e9B6cKLxhnBIDhpHUPuwXbqK/hpCSsNls9wkjNThdBHIcTLi5ww2gtku4bUjySmDyd45S2rhnbuFgYGdO4WJszGQWGT2aIgWHJ/G7CdksOJBVqBs/DEQ+H3sitreQD72Bqo3eOAeYRGTg1EZCkgPsEdZ/6otR4MuMRDADsHPQ9WKT6jBrnzb0h3OIh6SIKDbEvWZ8sTVML7PP+5NywGoQeZD70Q9wYE+VsLrQhZA+EOK0vc+9ustBFTfHk0M71lwCBIRYg6tsD1Xdo6i1XgfByR5q4A69bdB2eeAVRkfsioW2MrOyooAZ6MoMeKvZucGsTQvInZbZofzwTuo0sWPy07Z8iD4041NgtxKrjI0TFg4mxLO+i26LVfImCZFRTqhdN/5vtONeMuU5Be2wOfM5hFOno9zgStCeNUae8KLlGQSRO8FcFVt6CCYudHC1sbigoBMxEWLDC68Y/gtkuQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003)(261009221727099003)(261009220027099003)(261009221227099003)(261009223327099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gId7l4QlOnLfGrWaCzzDUt7j0YHvLuANSJSnpdmWjMiMPA7t/JWJ+5Jhk4WnN4c6VGmAxI41GPbai+XuxXlYySjQdJdSqeAUYUWFrxPTnCpJDiYOfdXf21BO51VXd6hCMYZT/ofbxAstm8tHwtn8bB8agh18VN+fIaM9vQcomyN77k6YVPB3GqSSWZQ8/DUMxm0WDvAOwBJekuqgM72rQIJqCZ/uxMcty/kPaAGvo99yOr6dF5BzqJzffUWnS2Q8u1EBirETmbqh8onZyW7O6qV79T9j35WwFxZyV9fwZSljUwdR8q3ROIY81W9qx1z+F5T60Y4PNvEc1TMFEDvrz2O9MiHIeDknmDbIVjlas7YpQZGMGRhN845NPV4pBatpg7fj247nnbI/XG6lA/pKcj+TZlhJgeh20tOhkr8+beE7pfYPfWJj31pG1pisB41A
X-Exchange-RoutingPolicyChecked:
	5gaKjI+ONiEV6oWcPxK6PrNjTMiUfLo+DtfrmugGYr9zLSasAqHz2pm9yeNRtRvxLUUuFZ5PqFZ5+ZR+0EytC8nuxWw8rHgxxU42YdMtd4bQNNIVL0HPB82FhnhaPYrF6a/MwI0+4+0FjDi1FSf/H92AhEDJxfkBxTXIE7AT0+jdVKDFiwbVLBQXdtN3U7isDQHO3BoVZRXeahzTTQjR4ctZapHZ1YqmacHlcA4XYkaN41f8s+AmsRk2q6gz2c5Ve6YAFP18U2VFODjBt0v5dd/INpoNWfyT/ZKwMlYDq1tJrHdjO7ENYvox2275uy6xeKa2t/MxnlrwL7gYVhScqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:30.4336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0468ca-bc02-461f-b83c-08df401d4168
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8277
X-Proofpoint-ORIG-GUID: Qrg1dgBGyJEEY4SBeAzMzBvBz05r8gOe
X-Proofpoint-GUID: Qrg1dgBGyJEEY4SBeAzMzBvBz05r8gOe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX9xXXGEawOxC9
 mmitThvXGuIRf5KRaD8gFJr+b/LiEQ6/2J64f8IkJ9DTcn6vQ1gCiyS4ljZLu8yFfvhlA0M/uZR
 P1+KtRYqBkbhnyNH6IeS6/qiKWz/xIZ2w8jBXQAU+wE/4uIPm5v1q2Tb2Zw6GJM5AynmbtTFbmQ
 RfVuNsPIAneI2BR6EjqtNIzN298aCKxSyvCnKLAfQyfgHh/8b+Io8Ejjuhmixz/N4XoTEwJpHTr
 lel3k4mmH9HJOs+87DS8DznwjbX00EDTvKGw+k0ElRF2BfH6NZJfmgdUYvO/tCG8/7DV9njDWuE
 xpRpIO79wPIf7FBKnIzYsVyDMKC1Jw/yvKFDcy4QSRQVRk69BdkrVz6VO5hF6eb1u/Io6M5rILX
 XnNJ37MPeTrbxQQ1Ud0qh515EdXmgSeVlGy3Ly+UPwkpotDSSvXXERAA+QLqK8DDh1k43g4c/IC
 0dlwyOeessi5xFOTfqA==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af4ac90 cx=c_pps
 a=zf46e5KlnE+iQYqYCeD52w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=_xq-VfNkQHoUXNa7gIkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX7Qcl2vN3JBnK
 OvdrvodAKLuMaqGG+Akcb0g3MgBxuC6ZBgv/Z3KAAqRyIrp63C2v71/F/XuWIAt8cJyJBvKhkYr
 cPAoOYK8ktyOT04X/GrA/bYdxMcJ6b8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/renesas/rz-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 987f826ef09d9..d79e9eee2ff18 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -78,7 +78,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, const struct of_device_id *mat
 			 soc_dev_attr->family, soc_dev_attr->soc_id, soc_dev_attr->revision);
 	}
 
-	soc_dev = soc_device_register(soc_dev_attr);
+	soc_dev = devm_soc_device_register(sysc->dev, soc_dev_attr);
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-- 
2.43.0

