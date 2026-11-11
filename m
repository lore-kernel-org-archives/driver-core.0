Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419875;
	b=dK/XL41hbeI0V5p12O8UaPpp+AGADXlk/VjUfJfaEhvHEFxnflT8KOFNaGoOUcv2LC1u
	 drqZuTVA229Mcoz1pyxPMlFq3HBb7TWnIIH5id5YX7KtczxmpdxwaA080C6Tvw6lMpY7P
	 EVe95cwL25Lov2RvfjYT8F5+9xjPs4etVDtr1MbfWi12XGGn6AOwASkVi6RkTHIUpH1JF
	 DTNWnUCpLgVpjJnBC1RnYfFayHuRWIrysyv5/q2qNfNxGtlUqGIGp29NfDvsSIqN38p+w
	 TSHNZ7Q3Mgvo9lnhtMkEAGWH7aVkj76ypneZJz3SVeYECrOvaqg/exkWnwlFIXsXE5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419875;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v83AuuN6QuJMBYHCfLsf1kJ5lWUg6NlPb+X4wC9YHm0=;
	b=j3mLRPxJrmsg1cRR1HjchSHnpEF/YuOyALRxNtQSp4QpvQodie5kEojD9SbSL28RW/54
	 dQ+jAY9Lzn0yK6IrNHdNxTwKhHfRXuzOkO6z2lRjVNELFb+bkzwLKhiF3y4db827XE4Ls
	 gelEWp7VTRHRhUgfdAfhMp79gi2+/EfCOtnvPYPvERpnhAGgtkjzer7MGUytxALGxbtdb
	 o3hGHMZsyAxwxvSn4R5rpPOBSzp4Y8JeNgilfigCWY2gmtmF+wY23sVzOm6muRglBt/x2
	 xaYaUNeuTtwfRnudhVfILNflT3QLXVmNlbhTxr1NMrLPx9H6rB57x7Vit94LpPzCcGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SQ2ZQd7t;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=DY4pDbMu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779CF60A380D;
	Wed, 11 Nov 2026 17:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 779CF60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SQ2ZQd7t;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=DY4pDbMu
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABHt6ZM2134480;
	Wed, 11 Nov 2026 11:57:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=v83AuuN6QuJMBYHCfLsf1kJ5lWUg6NlPb+X4wC9YH
	m0=; b=SQ2ZQd7tnXBaQAtiazlR/fAx+fE5DvksdM8uRZZndf/HOtEmo0X8IWuIS
	H1hsdUiwrJILM2c97ANEr7c/sBOCfkGZOw86Fxz85YjQgpZce07eKs4pHHscbhKJ
	qDY5POBVdC5HQNxAiRHTSBMUEw0+T1toHXe19yBDwK1/gON9gvsV+/RhK7R39r9L
	UWfARYZUtsD0CA/EwdrP4k9QQc8BJaWtlqLRZr1ZPfC2Dc9V47RxwX7jJuaU5jMm
	xOAgGo4edHm33MJZFxmz0ZV5ImJI6nkNhhM76sZQxXPDFVhWSQ34VqzUWR7ERkC2
	RrO0uEyoHce6aDLzOOryyJ3n4R0Sg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013014.outbound.protection.outlook.com [40.107.201.14])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygvw8j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:52 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzMjPrXodEKy7tpz27lDTY5p5eqUB8SF0mVRDLfcR+5Wb8KdwVZ75VQkWN/pLIVNh9+psY1Vv9ZWYyK5scjzMTIMuQS+Rop+XYEE+N3et9vbH+6yP6gLW3mW4e2v9VXWgQYTtbfvkjLYjn9k3F16nk60xq6xr3N8Xda9NEMjmuKSgChmMpZ8yFx55oWs5c1AcuhgxY4I6GQh+2l1XeWKxf3yTn6Q5TQVyLGh3nSNu5EXp1797pBiMN9F+Yg+y4PEVvai7LJi+cujSlhLBzlVADNP7Wv04GgX00rofaTwJlQ+PkO3CMEid/ahZPwVKANTL5y8yloTN5yAYoshsrp6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v83AuuN6QuJMBYHCfLsf1kJ5lWUg6NlPb+X4wC9YHm0=;
 b=RrSTMlr4z+FFs4OX9mu5SIgzx4rcN8Zcf14hqd1h8QL+5KzAArNt/f/I8SVtFavx4XRIe7SlXCyYvccs2FIXdrRliPYy7L6pvkFvZkpwmqqrrt08SJklCApRPIQ+OSy2yu17S5d4UkZgFmUcbMCLDi1U5+4c9Ths+D4Wp/MI7kn3RF44JW/57Y2iryq6W855t6JiTJppf2ZpAYVaLSyM5zJiZ4JXQ3DxPWN10P+LpqU24EYS0WuSbDjzaSL/Fg9HG3zCDZKAM/5bTFQUvoXFSAHXA4MglVx1r9QZ5bzI/AQkA0ladgKMgensqlvwKW7f1vcIhx2LUZLMB0B5jwIumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v83AuuN6QuJMBYHCfLsf1kJ5lWUg6NlPb+X4wC9YHm0=;
 b=DY4pDbMujK6I8pV4CBoJwzh+dQbODlWA056VXaLc5G69Ln9NT9RAkPoAHWvna19hSSuCJ3+S7QFkTFBTrDcS54nQNpzPgbCzSEf0EZQEElyPjN6uydZMrd3JnPTdLwmCcTD6Nz8lYwW/RPkquM7AgcET2MHVRuiNXv0Ud5e7oYE=
Received: from MN2PR07CA0024.namprd07.prod.outlook.com (2603:10b6:208:1a0::34)
 by IA1PR10MB6075.namprd10.prod.outlook.com (2603:10b6:208:3ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Wed, 11 Nov
 2026 17:57:49 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::6a) by MN2PR07CA0024.outlook.office365.com
 (2603:10b6:208:1a0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 11
 Nov 2026 17:57:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:47 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:12 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:12 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIa193504;
	Wed, 11 Nov 2026 11:57:11 -0600
From: Andrew Davis <afd@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 01/12] base: soc: Implement devm_soc_device_register() helper function
Date: Wed, 11 Nov 2026 11:57:00 -0600
Message-ID: <20261111175711.428824-2-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|IA1PR10MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1ca887-8312-41f5-9acf-08df401d4bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|22082099003|18002099003|10067099003|261026121527099003|261028144727099003|261102130727099003|261102123227099003|261021121427099003|261009223027099003|261022105027099003|56012099006|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	pWpw7bw1hhHM06l6lOX04pUQGCHBlIzVEaD4K1b37pNNRq1Rl9PAd0YxFyVovPR5fG0NJOlPXOp5718pJKSLL4BV1vbV9+8NMq0DcJD24J9H6bwWEbJVkeQO/WAlcgeOusRJ1l/uLOnFqx1OU4VFRFVikNVWtqFr3BPv4/jD8/IZjvDJsnRdJ7PUSHWfs71toi/QexFdlWfbfoOnVnbCj8ya/Qdk2ZvpFyXBMd6lWHyFICaH8Np+SM+Cs7tKE3y6/BNolfGknYbE/WX5a4MAdyr7onmgMURUgWVt4GbcVMBv+OsjfT11BpwCFCb+qkVg3xFXQGK8gG7oeB1Ewrn6WQKjmZyvsAt7CTx/FAitDbFzoU6F91EQZMLpwGSugKRK/RLIlzFvfOX6kBPd+UbWzIom1UqelOKUYEvlFS/SqOmrYKdk16+JDOonAQCHYtsx9ATmzKeSBwf3KbKTqAqXXoRptLATqWgtpR1Wd72bKAHMHUqs1Fb1zHg8+esUjdYDWG9bYfzvDwDT0ks3hVNenevSK/Fl+B+0Q6BDTm+DqRuWK7pZlUGl6xwIw2T4CuDh9Ea/UgL5MxOuTPzvIzXniAITyNZLGaFA9gMMOol6PNTpXhFTOSREsfU4QH+mIYx41t8I9CfA6btQJ9J0UXhcuJLUusd6TP0I3DoGjybDaPI/QPMjs6lq5lg78o2epB2bqgpyb8UHywLnXNzXKNax9Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(22082099003)(18002099003)(10067099003)(261026121527099003)(261028144727099003)(261102130727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261022105027099003)(56012099006)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vP/qwyEZxwbvZQ8Le/AOXBwrx1MmRr7rU+RtDEgWwZK4t9k18cTInofPeb/l4RG00O+fu8UmZ3CYCu++9A6NyBYnjtwpPzroDXmd1AGJvigwmVqq3PLTubgka1H+XFcYNq47Tjz40C5trusxXh2/RmNAPZtwuWAe8BsrvNkYMyrAukWk1teUHzAUJ2+OsLao5+GWHEKSk+MyleMlvKSt7KZTv/XZdGYj/G4k9vGIPTQMkFLEPIU8VFXz8ilnpgZIMRLiOHIjQ4TMNGAhAauvZcUqGs7MUc7QuPhzQG9GeKTE9mkvSrV3K/XizuBjj/Ds6Q+yjR5hizL19TDY3ChVgiIvP3mIQbxYNyiLDY0jHcxqUoSyueL7jtC5u+ZoaN6I2SjNy1V3vgokXl1b1l/kxVc8tg4uLwkbTaswk0jm73mvOTzzZijdYn5Q5m6KrOPe
X-Exchange-RoutingPolicyChecked:
	fYEiu6b2SoX9TORIJAZMcwzuiNtVGSktzc/u+6aQL6Va7xXPwUg0gued3tZZ6C+LZG1Q1nCl7vcqSWSy5FJPr3oCvOMfvcdr/uv+2FbCO+9f44hIS2pooS3cKjq4iOLeEIm4LnRwmqHXhd6sH5Qqgn0Zeap7ta5LpBidwcTgxK1pmOrcs5HRBd9uHYGrzRU51+O/0h1SfE++MbXpf8yxwXRltiStROI/o7h8Jmsk7ldeiZSKN8xOr6qsBk7oTqeV4jv1If7STq8OCxFA9CE7ZHhzKxf8xzdKwaIgWR5ERJ/XtIVgVWLh5GUZ0m3mz9RG6v+9+qKLm1dNjjYJ0V4AUw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:47.7363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1ca887-8312-41f5-9acf-08df401d4bb8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6075
X-Proofpoint-GUID: X2gjKT7Hx4w1GvYT326SMVh03U3dAUwM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX7bWAA+QSXTNt
 3kYVdEjcDuz7xRZQhSDEOw/ILOBPAlbT4w9xXTmvA6IR2MeWFx9AjylRrTBNHiOiyQx1msOm9Ou
 33e3XX2iDorU7dJkzGHnHjjp/29oIL0=
X-Proofpoint-ORIG-GUID: X2gjKT7Hx4w1GvYT326SMVh03U3dAUwM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX4WTOEFy5sMQI
 XtMpa/sZ+IBP45QLl17HB9rBy3mNrbadgifj93oQrVPF+3UyF5ALFi2CAmaSTaNVkeIYk9n9+ow
 Q+0PY5x0cSzzw59/6i6PerqpZu52Ny9iz68OjoqQyLIsz6t3jawrx9xoRkNJtjYuxIE8psqcbr1
 VABRP1ZAO4BeN1X7CK/KVj8TPAl4oU0Q1UyES1rX4SYUdbt7B8JK3GRoB1p2w7K+JMrbrecXYPz
 n+HfmSSRaIvPpQGqmhrmF+MWTuUeoq336KW18hdHKf5PZ6ky2E16Y5IBC7FpY91GZxWjSwLDEB/
 TvPJkDn4QojIL74cYC39hGXN3jUOVlM8E8akt6u3H8ykJ8gnQAUu+l7OdMCUJof6WciLRQ9kweH
 G0/F7pu8QQP1PP4gWGiqw4rOeBkrgsA6cW253lJqm/mP6p3IRZjuLkAJFH+mPknUNsel3OSCKvL
 DQQX9swx9x6nszcgD0w==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af4aca0 cx=c_pps
 a=qO1H+kaF9sbjJIkK6g+tnw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=2GYa-wstaEmj2l3eeXkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Add device managed devm_soc_device_register() to automatically unregister
soc_devices thus leading to simplified SOC driver code.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/base/soc.c      | 23 +++++++++++++++++++++++
 include/linux/sys_soc.h | 16 ++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index af7d71393774b..81a96e56fbc29 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -189,6 +189,29 @@ void soc_device_unregister(struct soc_device *soc_dev)
 }
 EXPORT_SYMBOL_GPL(soc_device_unregister);
 
+static void devm_soc_device_unregister(void *soc_dev)
+{
+	soc_device_unregister(soc_dev);
+}
+
+struct soc_device *devm_soc_device_register(struct device *dev,
+					    struct soc_device_attribute *soc_dev_attr)
+{
+	struct soc_device *soc_dev;
+	int ret;
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR_OR_NULL(soc_dev))
+		return soc_dev;
+
+	ret = devm_add_action_or_reset(dev, devm_soc_device_unregister, soc_dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return soc_dev;
+}
+EXPORT_SYMBOL_GPL(devm_soc_device_register);
+
 static int __init soc_bus_register(void)
 {
 	struct soc_device *soc_dev;
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index cedabf177f470..02b22add818b3 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -36,6 +36,22 @@ struct soc_device *soc_device_register(
  */
 void soc_device_unregister(struct soc_device *soc_dev);
 
+/**
+ * devm_soc_device_register - Resource-managed soc_device_register()
+ * @dev:		Device to register soc_dev for.
+ * @soc_plat_dev_attr: Attributes passed from platform to be attributed to a SoC
+ *
+ * Managed soc_device_register. soc_dev registered with this function is
+ * automatically unregistered on driver detach.
+ *
+ * Returns:
+ * - %NULL if the SoC bus is not yet registered;
+ * - on success, the newly allocated &struct soc_device pointer;
+ * - on failure, a negative error code as an ERR_PTR().
+ */
+struct soc_device *devm_soc_device_register(struct device *dev,
+					    struct soc_device_attribute *soc_dev_attr);
+
 /**
  * soc_device_to_device - helper function to fetch struct device
  * @soc: Previously registered SoC device container
-- 
2.43.0

