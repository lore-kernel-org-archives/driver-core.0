Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419857;
	b=ru93AdcS3Tscadgou+FCOQ4zQ8t11acJ2jvTLdi+HnO9zSvb8e+7DQiWWYwaYFJYe3bA
	 gP3T14q76HYdk/J1mc1FVQ4rY3aEv7dUG3/b+xNlRD0whgmXFl6DW9mls/cLCg8ta7hoN
	 bWVYqynRa4oRp2vz/+d4M+LVD0M+l3Y5EfQ8e2SQpOYgSeguuUR4hN3Z3za/ofkbFagLU
	 lnaRlFVGTbZEHl1JPj584gYB5IP5AcWxduP6IPs/WEPB0yTjtlCMceLbxEXqXwsVC1vnz
	 fWSCzNkN28PdQcKp7qy6oa7BezVZLHm1SH2kIqkPyRRH6QjCnJihjBixAHituXOiU9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419857;
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
	bh=79wvvQ5+MXLrGT2mNtW8t9iO5Wu/Yxvis1U1xnw1FnE=;
	b=rSigdLSOGeqN97iOil2hITfWqIHpNTCdL4bwGJqXZS3ifF4pfL2ax3bb+Zx/hIRG5Se2
	 Bdl+0DxobjNFCR+gNRp1hU3lScBmppYMwVv6auQZOJ1HWZlZ0pVlsbBV2xB/SJJhZ8ceD
	 wIYvxT4eis4X5DO5E5NEdKglBRW03N+08G+J+cScX6R8h2UJy+tnXM5wPT23ZAWO8nsOn
	 NRKLic1nDy7TEpOx8QpLznlxvB4kv+Tfvm/KPJhyEErHgWesBqdHjSLCAJSdDYe+O/8L2
	 ioyqOVzpcfpS7SO8+31Bm1u3WjyZ3DolE7v7HIW/2cQPFQ3kU6n/pgZihpDgddUvhcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SpM6iGz+;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=D0794GRw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31526606C23A;
	Wed, 11 Nov 2026 17:57:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31526606C23A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SpM6iGz+;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=D0794GRw
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHshxu1314324;
	Wed, 11 Nov 2026 11:57:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=79wvvQ5+MXLrGT2mNtW8t9iO5Wu/Yxvis1U1xnw1F
	nE=; b=SpM6iGz+EbAh4INMMFXxRAiuiAG3R76xI1yn3p2WlgFlKhWu9oAPkIzP5
	aLzYP9qRQLZ1k6V1pUnczc1B5tCn9k533vrr+WGZoJH/23Kjn5NE3lkTFyYd8ASa
	pnwaKO3P56j/kSQIo/PyKqAcoygqmY8FUTbl5fnrtpYAKZS8dr3k9fr0K+SRKA0h
	NPlPIcwWJR1UBKrK5rl8dJMB183nXnoGSzTN5SnDdG1ErVHIY/tqT0h41/GMaTA8
	5DyisybptziTvHswWLkyBykr3JoL2rZ2bU2EayoTSR6/74mUp7dHAbsVdzDRzv8O
	EwKmfNjCnjsDooqWwYF2s+apZdT7w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010051.outbound.protection.outlook.com [52.101.201.51])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6r6sj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBqgIi/Hz5BI3QyxjdMvCfh0xuT07rQrILEv7vwnbK1Sr9HUPZjj332ODcihkm7a8QIb7R4SYQ8VOOy1OPl41stXlnmIv0o7LjK0HalMF26eohwNKQSX9WBJnEHOEM+x/W8mTgC5TPKHENXH9Au+CAkhAM/c59uNUYD7l0eKcb8NOqxPqWt5nrXWL8vmJX+sWS5qbxWuuiWAPoXcHmAsI61v/hBfk9IHnS6GQYVo43iQ6jonjacSUV8thci8pf3+eOo8cWhmWL//EP3bDYHbEQQOsT42C6s918VSf+zUou35XNXkNYwGVvPvqotsPkQKuGNF/mM9FCwFDhZj1Oh2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79wvvQ5+MXLrGT2mNtW8t9iO5Wu/Yxvis1U1xnw1FnE=;
 b=r3ST1Si8Lxf1ikFgAn6Lv0BujK57eXfcEVGcHLqVz7yQKwhISgNCNGDllTwi64Z1PJzU7SnUlYXdGkTE4cPfpC8f/t215DDzjyj4JP47d2/epCY2i8mzV88O6/l5Uw02s+vToKiZ4gXVtmphprSIEbvI8j1II7VOswBrYvi1DL4dTrxvieW5PDYqVRlcETRLs9ub2tLpobI+ghDUTyPtavQzY2uFfFjsLwOkXz3ZIQRU61U21zezaGU5VlUBhcs8EXKLYCToJWKenJOhnmnQmgaWCyg0jbNkP8KAErI/V5A+5MOwD401eajTWxQW63jK/oCarmEnAfL0OH41ku2qVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79wvvQ5+MXLrGT2mNtW8t9iO5Wu/Yxvis1U1xnw1FnE=;
 b=D0794GRw2VNi5deDIDAQwIvUdincL05EE3cf9F7kGO4MxIC6TcOSCJuG4QLHGWujZ4vkmIPe+U+ZBZr1PpBIV0HTyT5sneKL0UIM5lO7iL3IsR8lJjEIB1s3Ty6OKcGh0tgabLXOzhIsvaD6/yE+Ri2D9zQXbEb+8KOmcZ0Iglo=
Received: from CH0PR03CA0363.namprd03.prod.outlook.com (2603:10b6:610:119::32)
 by CH3PR10MB7929.namprd10.prod.outlook.com (2603:10b6:610:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:57:30 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::66) by CH0PR03CA0363.outlook.office365.com
 (2603:10b6:610:119::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
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
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:29 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:14 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:14 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIf193504;
	Wed, 11 Nov 2026 11:57:13 -0600
From: Andrew Davis <afd@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 06/12] soc: mediatek: mtk-socinfo: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:05 -0600
Message-ID: <20261111175711.428824-7-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|CH3PR10MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: f939c950-c518-4df4-cb3a-08df401d4117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261028144727099003|261026140227099003|261102123227099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|22082099003|261009223027099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8GWznITU+jbz/cRfDYrOaO1l7iaGqcZVLXJAIA0BlcdgdpcAUEnAkKj/blqtKHYUoO3sRqKXqo1WAtM4jIuCmVU/Yq+vjoqZZuPVN2/y/ddhOyG/B33EVRSMYJhJK9EyhYNSL+eZvJaTRx2UXHFSmmXK4TgEdKavrbt545QeQC9KQBNIPzzfUkeyhdirv1VW2l1UYIcR4YdgkIAezVGh9vL//joRu2JjzXAuBXvHxzRO+AE2/Bwf8mWSmmjXxOK4ZCTrqNUtHnWbyxL+5DlWKgWuCeOhxLh5waypmEA2xiHolHc9o8hMDfpxVK6AOYGQCJIrlRfNLnMMrV6IWcKQAsTL0IXKV2N+j63GZMPA2fnyNB5ggo6AuM9nSkltbG3IvJGhUqfXKwECGCMG4NShYLZoT8jBHVhDmZhYey4M3RNZCdk0gbqGSRDy6SpfwhVMisYFEtn0FvzrKkeLX9JUeSVB5RsS53//p+GXqHbwJUmc7BNZg+0TDnU3r52C7hGE8AdEjJa1aeOfGGsLh/MQmQBsYeac2KnJ2fXTakiULfSuATncTWmJMEncHoQ2+BYZH/USGNArvL4Y103sQOnM9x7/yRj5vfBFs1P7gWyzzzQQKazm+nDZ2ZKSTjfILJUWLVzgmkJrm7xZwxB1hmbV6YY9u2UvXgdRg9h7tB6mMZfTHL7zT5/V2IxWbm8I4dltTLa9lzfFWajTVGg/FOmlyg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261028144727099003)(261026140227099003)(261102123227099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(22082099003)(261009223027099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	54IeT62evn9OujKsyHzHrCWODWtpv0l9QRpQweFqGLeupT77/eIff7jZMtl2YadTimXQVD+1vLUMklnO7jgod8X4FFK7E6Kc45G2GBxkelutUDnvVAuqu4Dopkp/9cLQolXepefB3RrNyHAKr0gb6xUeEucJHv98VJybuHBAv0X0mLpEYbVJR7FUwg9w+WqRKfRZFbwwYL/etRf7FDOqDN0nLzeJEHHpbOwGQm3rzfcf1zgjvt7n/hcp4etBLUIWKsTl2MygLDCslGvf2U84jtpoMSfvGm6FVBN+P9Iol1AizIPFIvP75X+66I/5n1D0zAq/IdDLMGFmg7t6Zg3Yg3VZPXv/LxN8aDc6hJLQbNlgkuezuQqcEITnUQc03rC96SCT9eatcjLonJoCac7SK2JRcac9bO+IX+yPoWttC2KKs5CkTKT5AQEpezBGi5B3
X-Exchange-RoutingPolicyChecked:
	TncNR2F0B8onyc4k+yh7kJAGkHtLx9ePCTl1UvM3e9KgxOIxKEyuJkIMr4y0g41BcYmekWUYd57Pb5vePE1c2lh/i0ZDrHPf0zGL7xfWIsfpRS0XJgwG+12zmgnELmEzSZo5zXx6VEwbu6VYjgXPI7KXQ4XbsEu+ByILNUGQmfonwzu19W2lPACUqzU7zkLW33h0te8jmtT8Ki4VAvq4GRlgS9oE1cp5MhNIcGNPGadFvZM8vSd8emjvvGvM/IW6NK8JL3eQ8clzmaC1P90a7fofcJmwOJa/xJdHqIzflNYq2JW0ZdR+vOI8FHSAna/f/VbA/0Nbd8UEFocaPVvINg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:29.9088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f939c950-c518-4df4-cb3a-08df401d4117
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7929
X-Proofpoint-ORIG-GUID: p6yfykqnma4djDaU104ZR6rihW5Gxizb
X-Proofpoint-GUID: p6yfykqnma4djDaU104ZR6rihW5Gxizb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX6XMcXoCwZpti
 zNZgcZgMUZA3/rAb6uHQIR1W7/ytDjY5OQ6frYYAK5yzybBP95eSZ6EoJZl8VTnRIA4jkg8u7QR
 spJVmso/tjEx2GFRqEF57LjMXlFpNE41p2GnxR8y/ioZhBY42TzCvjvxvMCKgCJDKu1hP/R5u8+
 nQu+j35hv49yptknen3tJTZ+h4gtS5cmTd3l1hIUWLuj+bH9JC0ZXQ/rK+OdyTzdp0V5SBmv0uE
 scPDtByFhuYaE4es4gzc9WJY6wIAbRpZbZAMwIyeuOeyaBaVo3sALHBv+NwC9s0NZx+KGydiZvo
 TFjh5g8NCmY9V+CzXoDFEXT4ysdsPS3Y9nwiOwct093NffmDl/2q5yTamsropdKwktfkR1m6ySe
 pgPnaLo4gTkPHZlnQXTZzOMKthlR4vpT+6FiRuIWcAlVvsd3MedLeDfGPUmS9xsvb1GUA6GIoq9
 uFPLQm7WfKfcL/Qdyog==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af4ac8e cx=c_pps
 a=f0OpuPnQRmDrWRgsA3vZMw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=2DkLrCKPgLEEsFRI77sA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX46+AXZ3HTBkc
 5eI28cpvLhxgctWZSLtHoSOd6eeCIhN3EAJJRHNCKwb4vNXiNGTMfbOHBJrHzVPx3sJu+TntNHB
 gK3vRbKPXzvmZIl4liviOjJ3HDjlva0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index cd14706c2f28a..7bee9c04293ac 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -30,7 +30,6 @@ struct mtk_socinfo {
 	struct device *dev;
 	struct name_data *name_data;
 	struct socinfo_data *socinfo_data;
-	struct soc_device *soc_dev;
 };
 
 struct socinfo_data {
@@ -71,6 +70,7 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
 	struct soc_device_attribute *attrs;
 	struct socinfo_data *data = mtk_socinfop->socinfo_data;
 	static const char *soc_manufacturer = "MediaTek";
+	struct soc_device *soc_dev;
 
 	attrs = devm_kzalloc_obj(mtk_socinfop->dev, *attrs);
 	if (!attrs)
@@ -91,9 +91,9 @@ static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
 	 * name from board DTS (if available).
 	 **/
 
-	mtk_socinfop->soc_dev = soc_device_register(attrs);
-	if (IS_ERR(mtk_socinfop->soc_dev))
-		return PTR_ERR(mtk_socinfop->soc_dev);
+	soc_dev = devm_soc_device_register(mtk_socinfop->dev, attrs);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
 
 	dev_info(mtk_socinfop->dev, "%s (%s) SoC detected.\n", attrs->family, attrs->soc_id);
 	return 0;
@@ -191,20 +191,11 @@ static int mtk_socinfo_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(mtk_socinfop->dev, ret, "Cannot create node\n");
 
-	platform_set_drvdata(pdev, mtk_socinfop);
 	return 0;
 }
 
-static void mtk_socinfo_remove(struct platform_device *pdev)
-{
-	struct mtk_socinfo *mtk_socinfop = platform_get_drvdata(pdev);
-
-	soc_device_unregister(mtk_socinfop->soc_dev);
-}
-
 static struct platform_driver mtk_socinfo = {
 	.probe = mtk_socinfo_probe,
-	.remove = mtk_socinfo_remove,
 	.driver = {
 		.name = "mtk-socinfo",
 	},
-- 
2.43.0

