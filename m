Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419881;
	b=QlbEsUMkWcyZPmst5cpp4qlSwbGQ1qM0qNxtmKeN+4X38Kf8mj9PrzTYYbUFXbHxE2fk
	 ncAVUvSazwoL6W/vk1D7pq/sqKye6x0ILcU0uzxAXBbJjOr3BcbpQO9CDq7oR8bQPFrdv
	 NOhjxxywLqjcIC2Kpvm3V9n0LzuHNqxTzCO7lDbTDSysWyPG7WLDeAEA/50Km/BLd1FQL
	 xIHLvoj6v8z9CZhHP16eBDilX5gYrJNjK6RHhWxp+BlRRlB4BDYf6N3FvgOz5MnuNQkqf
	 PSG6+7v3hcXZUUwcyAiYRvdnea39xOte0n9/IX0NZm9a/NA0u6RfjPcEBK2/MMIjKBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419881;
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
	bh=ar7cVzqDalMCmDS962dl5AZ6ZIKGY9mZnxVBD1zfdpg=;
	b=mxAY3i7DYk1zUJMv0iNcjN3IIUXV7vGQ/QF9tpn/WTvlBsyCzRcpOlRQH7n2WIRkKV0x
	 4KP71CS/pEtBFHCiX9EUUS+YBmD8CiPGPZewJXyToIRotKQk86/zjgN2o7BMc4gSoNQdH
	 SiqGE8m8kZMoEjKzjIPr1yFNPISmii0+oDmVKq/y/Y3FhfGbdoEfolzB4y8FV7bFTw4Hm
	 JtD6Lqn121d3avjebmwfkvkuT7vgkCBRInRM6j+d+SfGiTwyrMQiORWBn99XBXXA35wYh
	 M8+KktGykWLJRMqDb9bFvwaDM3314QafcWK9UXafH4BolmyuIRFR9IgjhGfKb9bHcbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fTGaDowF;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=a1ahSl5G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4ED60A5BEA;
	Wed, 11 Nov 2026 17:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4ED60A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fTGaDowF;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=a1ahSl5G
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABHt6ZO2134480;
	Wed, 11 Nov 2026 11:57:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ar7cVzqDalMCmDS962dl5AZ6ZIKGY9mZnxVBD1zfd
	pg=; b=fTGaDowFWDX06Q14DYzrPBo7s8cZNNuSi/6inZDAafjxbzpKaFOw//fbY
	b/hbt+tcGj5Yf079f8XucikgVyQPSyh51kSSCkALU+F9RorZP0GYciDNMLF4MGsG
	SMSgDjp6EootGIo7vI7Yqv85jXDfGmzjWj4NYSbn7dXIT7KBpaAd2M3hmGh1wyDG
	mHgJbXrlz9QfOiD44uL0JWbyiZ/Fkf5DkWlypXnIQbBMJdllDbVT4pxOb/ry1CHP
	6uQYCmRu/7llQjQZVRUlv1fnMZeJHzJXAymCuIiuTGa1IofotSxbvBIAqMXnWwiK
	ogsZvEeB7LB1gLGNHtuQ0riKrSDxw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hveygvw8u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxVCc7e7vGTU5Qqb3V/PaxLStnlA9K3rujs5Kqg0q5r+LvYf6ZDOXrUX+JlrertcGLtZV17Jwary8M0ZiwxmsNTHAxgyuGsyavnt/uoHB3yHLCbcdgs5HRfTrBeJMuAjWKUFX/Uyq2U6fAGU946NH5BCD7sctiCHu1W4qbMTCcv9vwn09hyL8CH/qt5YUrNsvrXXSNYIUSdtikGQdl2s2dWxWFJI0mHUJ/pmuo8W6jx43M4hZWI8BhiqmvpYpIpoDdh9uWtqDwLoCL0lC6NFYZjyJUwvMqcKz9sUZYU78CTw577qU6lzJyT7yKGn/32mab+ct5fiFlh/lpBQ8w6XQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ar7cVzqDalMCmDS962dl5AZ6ZIKGY9mZnxVBD1zfdpg=;
 b=tIL51aZyO/2Y54/ZLwwTtgjqPNJs6xOUANc3ZKowC6XboFug5i8yaU9v3LMcsY7V4qFKOL3GyIwLRk99tGR6AtkPKFIV3qc4oAd3Z4tjQ3EbyBgDF7IQhrDAO+LI3Hpu4RrbgYX9Ath9L/F26Rd8awRo8JFgm3YZ+sCFIHqNZaCMcjr1h+PRzhJslEahG81t77mNN9JYqzsgCWtYI7vq4Vl3p6twcbH4ujiga81ETABELixvq48RYXyJRmNOD2dpDmjMUEbZHeUOPiF0m/j84E+lcd87+8qqZW82EcFMhVBdyJfR0zwwwKQyzU6Jz0SjmWc/Ez/FgyHuPshn8oYvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar7cVzqDalMCmDS962dl5AZ6ZIKGY9mZnxVBD1zfdpg=;
 b=a1ahSl5GGtpqdOgwZNs9riHc5Ctb22OQPf7ZBexaoZ9Vhq7cfX243YvAzWBJjVpZo+HixNC16CBR4M4uhRtTNnMe4tQ8+ZX10qycgfM+1ad4bQ0MwkEnnHLo9FO8KJtS08WKNRDuOdBXE+/Ad78JMsm37egQUN0kfqTNhkZrz4E=
Received: from MN2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:208:1a0::15)
 by CY8PR10MB7122.namprd10.prod.outlook.com (2603:10b6:930:70::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:57:53 +0000
Received: from BN7PEPF00000092.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::a8) by MN2PR07CA0005.outlook.office365.com
 (2603:10b6:208:1a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed,
 11 Nov 2026 17:57:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN7PEPF00000092.mail.protection.outlook.com (10.167.245.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:51 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:15 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIj193504;
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
Subject: [PATCH 10/12] soc: ti: k3-socinfo: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:09 -0600
Message-ID: <20261111175711.428824-11-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000092:EE_|CY8PR10MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d585520-33b1-42e4-89f1-08df401d4de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|10067099003|261021123027099003|261021121427099003|56012099006|261009223027099003|261009221227099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	mraB9OyjYK9oq7/6jMCeA4paxg0YjPNrp2XxFhBRbfrXznhtt035/BW4SGlBoOU41PHcjYduyNC1bfwJGkt/9H0z0OXfAvgUEzbrqcpNrJezbbrY+CjAekMLGuuHFgpDcwIMQHfPU90TPM9sZelfVu1ifunPWd+L90Ag5Bnc/AicQ82j9obvKaV9pVQC2j+Ybin63t5YqDQnF01b7M1XrlSf1po4xMcMiHwtZVaQ8pUxidPJfkrtFSEh+/iSLPSSiSXYw5/7K1TTx02ZFDpib2lq6xt0S7HWtJBcvsP5QAKu2oic12oCCD39ZIAi/MjWD/NHdlYXOY8pXwJn+isbjrfQMqMFmy12BoLvDTyxtrhDvoXR/ka1n+dZrWAcyxBnIY8n/WmB9tfhqMDIC/HtVIXcuJHmpkwZshq2wtWzu7+wM5+AefxMHQEYxUNVG9WcBJ//bDEFI7Yr7rOl8qlrt0qe5+/M8UOU1T9ZJMYGFoLDDadXMXRHk+b7aX6qInuk8/UP90Sd0jbCbplLhfc9+PRh875ydaqDCYMlXDQ/6/poGhvt919bFJ4P9bYBwbaEVPcDaQqKojamGPv/Uc+hOdxszYkx4GReTQUxaKMenelMd7gB4oaSrkfH6JrqQepWBW4W56DsIVQyzIhfKcPDoDolsfcPEIijr7BAM8mRkhfLoxzonF2ZpHXpj4gPI3iaMXowP0yilVoGvz3uRb/M0g==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(10067099003)(261021123027099003)(261021121427099003)(56012099006)(261009223027099003)(261009221227099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0xpXsvxz8COnXbfvBPDACv+95wFVqpX6vjpHnNxZibKOsli1kv5m2VvG5FC+gEdbgtSWXIg1d+h77xf3FMKR6C48osJO04qnkVTwpvWk6/y3eIvVM6ldUTpmQlzCZ68HqsHMhoZawmJOg+qvWtyJk8mRf8VURvmpDkFRRct6aLY0nlc/r2gPEdcJtInajjETvLj91HHSHnPzwfrD9SNP+BhftIl/hne/FwXN/BcZ7g6+VUuSvvNDmSgQLLemXX44YH5tDOj4woxT8Etq6ACcE4C98tFfD7YMN7fpXSEIxmkIwKLjRlRH1o5yQFuQmiSB41G2Q+jdxmUGClwDFmjBbVS6uXJSUlQyIeuaq1AFmK9+v8drmoG5dOmh7SQ5tNqFrSkNi42swQIEW93pllzpYCE2vx6RYsmVjuVH+EjjNDtyqA0calDtXulp9h6M71UN
X-Exchange-RoutingPolicyChecked:
	l4aXH5qqhiLeRpHfVsf6WdXalNYxoIkObm+gZRott/gLRtlNT08CxfKC5PFElkh2FKlnNEK2WvVGQfKOB180Ia3x08c+MFxiocgocwCagylOn81Yy1KpdhFrqrMXvP1g/+MuKpxScwSWmOynYkOgS/9HdXL/xNNUUlrq7Czbyj/C7+wjzA3IZvpUpbw2awr5aMR3IHdSKVa7ZMirJGBWFhLYoDyDSp/R/tXHZCa/2ghlnGy9djQ09jstKU0uiAhB0aVFm2Bmn/XiAqmOSaNUav2dIFMFFg1c6GK6bSg5pCXqf39oi4oCbgV1ujeRwt9w4VHWEzlICGFIZMWiYtjgnw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:51.3575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d585520-33b1-42e4-89f1-08df401d4de1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7122
X-Proofpoint-GUID: OVhiYo49I5O8_B7koJ3D1Wci763eWJq_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX0zTS1s0u/lt+
 NUcaCAt0l/2brvqueDAUJ1k93c7iwBRaW5OCBza1cHU7F272A27oG/ZcDDaBJjIthmaPGNAo3Oq
 IBGy6MbdOqOl4IHJF9/AB77CXaeNV98=
X-Proofpoint-ORIG-GUID: OVhiYo49I5O8_B7koJ3D1Wci763eWJq_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX73kdj1ZYfiMR
 5Xd+LRL7idcnAh3KQXMr86GtixxJ5tmaeMB46YPMlabs3gA0gpyTHf8vhXrDBsIu8MuCtQfc83R
 Oyfs5POcKzHtkGQqdlxODBCRz+ta1FyF/V6KfCj37fc5+Qi8TkY1UjIoG8bAlLavR/rj9XiFUeR
 bHeSWbHHRBXs6WuJA2XxsDw/6uO6h4iHMK+NpII96vXVhPflQAA37eVYFbpk0mS/O2MIB+Kp1qL
 KDGDML7SMl75SF3KpOYM3QHTogD+1AR0oWXPiPO88R3uqbH9iUcpj7/jQZMfay/GrTexXQirqPu
 aFkbIY7RR3kjWZPjE1lTQQmAC+puFNM2LYi9akm/CDB5Sl1teL2sEM6ev5aoI6BAj3G/4N5+SrP
 FEA4aSnmO/3ueKGNs7Tp+SUnKU5IFYPBd+zOcKOP8231D6oek9W61mh5lQql4bvbIex5Ffd+B/y
 qXY7/2uXtY3exbl942A==
X-Authority-Analysis: v=2.4 cv=FpaQbGrq c=1 sm=1 tr=0 ts=6af4aca6 cx=c_pps
 a=UZZKR2DsB1PZv1vhPkDPDA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=_xq-VfNkQHoUXNa7gIkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/ti/k3-socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
index 48dbef3acceb4..01bd6702c040d 100644
--- a/drivers/soc/ti/k3-socinfo.c
+++ b/drivers/soc/ti/k3-socinfo.c
@@ -218,7 +218,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
 	of_property_read_string(node, "model", &soc_dev_attr->machine);
 	of_node_put(node);
 
-	soc_dev = soc_device_register(soc_dev_attr);
+	soc_dev = devm_soc_device_register(dev, soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
 		ret = PTR_ERR(soc_dev);
 		goto err_free_rev;
-- 
2.43.0

