Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419898;
	b=M/HdyH1NFof09hqrTpPG6RkcYWZ+RRB4Z4UwnIKZf2cLie6fWxteSAQx7DUl2vdo3EcS
	 BsK4o/5EC7vAPKfQMaPk4+fw42pLqIfEcR2V9f6PTwQG54nYhbRgBpykdQsIuG/o+nefi
	 ihLXCLSFLoSo19pR/OMdRB3kiqjHdRP3hOsKwcT6zww/IcngheyBT6wCNxRMTql9u9enl
	 0Lr458kQyVg+ZsxZIyHVDe5Viz2mE8LrHoZ0MtsNO1ZijqJH11dSgPH1B9XUdENczOu4C
	 sV0hZJ4g2cPx4id+oQRKETs7IAHUOFIQZ5UHjErfND6p2AyxMnkLdJmRkcdwpYwagqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419898;
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
	bh=Qy0+tzaQFjZYCQrk8bu2DngPE1Ei7fDbGOzGCOcKhYQ=;
	b=lZv92zHCr2IaqAQSS9iypYrBAIxzx8Zd3Rwql/zZSbyADhLspnhVz88xprLRXb8i3UWd
	 /NlPjrF6EOIzByGp2X2m3JG3ga10EV7kXmaYVQSrODXWjIdHRt80+X+xmiedn+eB3fHam
	 c0BBWSpbiF/weDg9TruycvpqGq9Xki4upvjQCuoLtCuKUwhyZf6GEYZnnGTMGpFJI4RxM
	 WJXvWjID+w1bIwfoOvUy0FVK4B5h2+eCg/1yI68GR6n3W2byyJ9adTfKlLGsoYfJeNXLa
	 MbldOeChiALn5z2xinQfD+pgW4ZFk2kSA/smYBK8DypSiM6fh2UyVGgkUNfLlj4WdJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=hsAZQH2j;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=SEzB+N6J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1F4606A896;
	Wed, 11 Nov 2026 17:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE1F4606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=hsAZQH2j;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=SEzB+N6J
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ABHsivv948469;
	Wed, 11 Nov 2026 11:58:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Qy0+tzaQFjZYCQrk8bu2DngPE1Ei7fDbGOzGCOcKh
	YQ=; b=hsAZQH2jqCL9vX6d3R9UkeI7hh/btNzJvYbXxwmgNHjVO4r9p0g8EcjLi
	OEzA7nBcx7TFUnMVpjpKwEnBNtdySZVOsX2UiHoAedYvGXAxoRNERoqnG/pvXcAT
	H08GTrGMiEdcliikCbBq6h0N/L76lKmehBoZp+iR3/FiBWzFs3MVD8fZtq7KzePz
	ksm/0FtDJoX59xXX2Ur6g3FuLfGHcojucFJhXuFBaNWKlMzmtS5U6GgagVkr9E18
	TkjJq8ZZuBfWJxpiQIBNtLt0xUpUFLwbGAB1EYppLxpkSsVO6XmQ8/+GAxu9+ytB
	nNZSWwuRfqr6U5MHCg5KZ2su/NrGQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010039.outbound.protection.outlook.com [52.101.61.39])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hveupvyyv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:58:14 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd0uo5MOjHQna3/ZmokYJAd3/xmC6PKsgnmNZ3YwOoF2ZPDrqlJ/IbfUF1KUJ71udwdnV8zRRsMXHRxcxvKEKz0D4kV1Gz2ykz5UjqNawrDVxM0JfENmuOBySJgKgGGMARHBk8HAbllaavz2FH8gZlyr8+ha66TUssq7peRHGViDOl/cWzclaWMce5bZKqegu/SzBW7JOCk2CN5xhNUQbFvJ2YO/fJ5K96G3qgvUVSv2C4R7vDDR6v8IGnUzeqvPhozTAtIwPtghK7/MNoiZNdaF/+Tze8uGZrJ9L9eBteD+MfELgIX1goG9H89wnGnENE3m+5ObYuQ3x4yMeHo0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qy0+tzaQFjZYCQrk8bu2DngPE1Ei7fDbGOzGCOcKhYQ=;
 b=LoYvDJ8S/kkc0neAMYc2ptzACFQuL4cUMy3azOo7j09m6rMCNSgK9FbqSM3tFA7gTg0S9tyqW9na7dVr5cH23VVpoM62U22z6LdgdPC15WM3H0OGGguVqjjL4U0IK2M7Q7XiMcp01FHve5mxDNN19JjMQzY692g0R71NCFmd1mHhosMoKHKim7SKc+ipww5CnKnahUYU7cAWq0A+PGKn2Rlpck841vHCQE8zqc1WKt+kSsN2417O3Vn2j1JaRbSCpDItPecJ36ZWfnd3XvuU9M2vBhPtuO8WvhstmY9Qmgzt2k8PaVCxH6cI13L4OCIW5NsoudwNkgta0JTKiupK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qy0+tzaQFjZYCQrk8bu2DngPE1Ei7fDbGOzGCOcKhYQ=;
 b=SEzB+N6JQnYaUZ3w1auW6i4w+IwFD52C1ownQpH0DTY2YFxL/4y25r3r22Ct+sIn32rJeAzDAhN4ssbqshBXZ4N2TSJrk7qLD4bRgUzkqCFMiISPbCHGfnGLLvNIRrUIPvGLmGcnVZkzw8UdHDA1XLdsBj2fazwd9es+5LmU30s=
Received: from SJ0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:a03:331::35)
 by LV1PR10MB203416.namprd10.prod.outlook.com (2603:10b6:408:501::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:57:36 +0000
Received: from MW2PEPF00014678.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::17) by SJ0PR03CA0090.outlook.office365.com
 (2603:10b6:a03:331::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.8 via Frontend Transport; Wed, 11
 Nov 2026 17:57:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW2PEPF00014678.mail.protection.outlook.com (10.167.249.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:36 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:15 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIl193504;
	Wed, 11 Nov 2026 11:57:15 -0600
From: Andrew Davis <afd@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 12/12] soc: vt8500: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:11 -0600
Message-ID: <20261111175711.428824-13-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014678:EE_|LV1PR10MB203416:EE_
X-MS-Office365-Filtering-Correlation-Id: e7558216-b80b-4684-eb80-08df401d44bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261102123227099003|261021121427099003|261021123027099003|56012099006|10067099003|22082099003|261009221227099003|261009223027099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DLAXj/ye5cJIGEBr/cXHKnxUX2A4eFivu+8EzvlahqQ0Xz18aSPGMZwfIfAqLh+aoAyzXCPMrKtV/xfe6U7CvYza1nQIORA4/fz2/mYVC2cwctU9uOT592wjvxyhdAcWl5mnStMVMuLhib/rcgGolPOErS3jPNLaQgtNaQbRoVgjxfIsg62KeF8lREe3bfbdm3e9Tom9xcAd5DgwTMdq+OgDJwRLJSVg6eXd0Kkte2QUdZkqYFe4uGFERMSiA4r7y4ynZ9+mhy2/gRW5+cgnrdAdEw0IZp5XnE7xSNMJEeojIHCZcQUfPiQFOXGJHaWwY4WA9esR8TVdrZWvxjMSLyaQkyK2RIdC2aGz6c/gOycUjLxYBT/B0t9Ph88w3pv8YYa4r6/EDDYMf3DGA6kBKgxoenRmUHwpV/odBr9adaRTSGO/X6kH0NA89f3sKAdAXANx81bDOh8tFtLpf5kU44lLPykXMXtVGlXTqejyhDiOOd2c2Ij5evCHHzLFqBW/Of6b966NaGFFq1UaTeJlr90QbVWpjlWmkwnFIGRabX/5huIih6kr47/2wYB0+Ut88ij9wOlY9e1PWRwWxUFufOQbEMhTf+K1cXEg5GUzeIFfH5oIFpzvS0bfkzyce8XuZJICyBc4z5Mnvz8WlYNC8U61BizzpMfmf1bxwkTe5m+n722o+COpc27FtbcTxfb+DWBsNe5uWxEYgaKesBbxtg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261102123227099003)(261021121427099003)(261021123027099003)(56012099006)(10067099003)(22082099003)(261009221227099003)(261009223027099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p3zfkyNX4OxaAgABMVkzw4iEG9IQ1ux4UBbJl2d/3xbKvDBpwhASth5q+VfFM09vnJqwATB+R96QPQ3HBH7QwQEtb16ppcjHZYm1ZzURB+Z4dcPVt7OAQHo/ia+YvPshd5cfK8rDJ2MK03vY3nZqKP5RtbEU+q0JO60mz6vTpyvzRsIBoy6RXybU8aMvFei1cI4Xe3yOIhGKmnB2L80OfHHq/Vo/Dd0cNxTncpblQcotvnM685rJoY18eCpq8b1Kss2Ob/HMW4B3gDW7pEIQt8xZJQw0yzTagHxMDJQYmZ/KlqgfiAHdkXiTwPv+r9D+h8TNqAHtVf0JSp9d7Yf6q7fYNon8HF3KlmwOfGl8NatssLskm4B7YK9dzTcFfDdipxKoe/3jNfheZzD7BmZwGEIVYZ2r6uKNXY789m7z8QMS9yANw+B0Rb3s/ZxM1EqS
X-Exchange-RoutingPolicyChecked:
	CHx0dUNXE4TfLlJsf8UYS1zgZ7c0xieP4jhRaVZaiNmvwfI5ICK2S8iqqaZGSZIV2faf2G3I/t8K9ruCwOl4cgW1PxZ0egmjbHSwrv5JlN8kkHmucPA4GL1pq4non/F/RcVHaZf+qHUuVxPVo9f5GqLcJdUNJ1ZuIE0NsTVdR3pJxHFQozsJgJoMtwj1V9+wYIKNYykhX1gWbsOzFYPT8LzkKL01LvvrHBEoiyN1GLEkJ5qckY3x1xoE6WBpaUdkXTTCH/59UC7lCQIt+vNyD0ZIHMswGfOyhdEJMF4ptUPefXEOlWwoDtR+2z7NHXRFsQu3VszUb8gQU+qvDkSTPQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:36.0067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7558216-b80b-4684-eb80-08df401d44bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014678.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR10MB203416
X-Authority-Analysis: v=2.4 cv=KeRHIgYD c=1 sm=1 tr=0 ts=6af4acb7 cx=c_pps
 a=gUoplhyZVfsoAH38zi7lgQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=9bvxoRI6gNWU0uyUhagA:9
X-Proofpoint-ORIG-GUID: UU4uBw97psWEIBUR2xlLNJvFSlfHxqtJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX/gs6PHv0RQNV
 1HMqKfFxCLdgwSlsPjKGIQmi/SbnwPA8txgoQiDD5c1kLvGesZyt4igbsQ5nWYba03kaU1ieTIc
 8lN+rdX87OwtVFlbmnTMOQHpMBznJ6ubugPK9mw5B+PjLrPY24859MF3uHi6/qpDBTrVQnOQcEs
 6XwL+xY6gx2pPj2UrHoI2xjie16Ne9rj85DiZ+bb4enqNXTxuk4aRpYeSrYIvgaDq6hzdG7ayZa
 MLC5C2w3ZNxsOKvzjjwcJXfM+zXVAd8y+RNNWdmh45fcoIzpTlSDfyqtwJkU0a3C1gZyia6C+Vv
 jhgU0qllmah3VD/lJmT1XbI3boomFHORLKV3tcglzP5gtenFU5+ytMC82KeM1Xz41xsLe3TlE1H
 jy9NJIpykvSyf5foWw5/F3RnFmjs9CMtpCnt4418Ci4T2enWKoDv1sseoBFolvBfxhwHyDC8uXM
 pcHQS1kRjb0J1HCANXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX5diJlzLmJ/Iq
 ovKl749ozIovVMG8pzVHqzQ38LkxtIMyDbmprXfBX1njnjzNfe+YromFUxQHWnD/25ASrmuitYM
 VMF0iIl/J3Dd6XtJbRn7vgbFTYdiCGE=
X-Proofpoint-GUID: UU4uBw97psWEIBUR2xlLNJvFSlfHxqtJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/vt8500/wmt-socinfo.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/soc/vt8500/wmt-socinfo.c b/drivers/soc/vt8500/wmt-socinfo.c
index e514c98a796fc..49c92e993a45e 100644
--- a/drivers/soc/vt8500/wmt-socinfo.c
+++ b/drivers/soc/vt8500/wmt-socinfo.c
@@ -84,7 +84,7 @@ static int wmt_socinfo_probe(struct platform_device *pdev)
 	if (!attrs->revision || !attrs->soc_id)
 		return -ENOMEM;
 
-	soc_dev = soc_device_register(attrs);
+	soc_dev = devm_soc_device_register(&pdev->dev, attrs);
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
@@ -94,17 +94,9 @@ static int wmt_socinfo_probe(struct platform_device *pdev)
 		 attrs->revision,
 		 attrs->soc_id);
 
-	platform_set_drvdata(pdev, soc_dev);
 	return 0;
 }
 
-static void wmt_socinfo_remove(struct platform_device *pdev)
-{
-	struct soc_device *soc_dev = platform_get_drvdata(pdev);
-
-	soc_device_unregister(soc_dev);
-}
-
 static const struct of_device_id wmt_socinfo_ids[] = {
 	{ .compatible = "via,vt8500-scc-id" },
 	{ /* Sentinel */ },
@@ -112,7 +104,6 @@ static const struct of_device_id wmt_socinfo_ids[] = {
 
 static struct platform_driver wmt_socinfo = {
 	.probe = wmt_socinfo_probe,
-	.remove = wmt_socinfo_remove,
 	.driver = {
 		.name = "wmt-socinfo",
 		.of_match_table = wmt_socinfo_ids,
-- 
2.43.0

