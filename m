Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419853;
	b=hs9k+Sitjou+roBS51jEVBcQWybOzjJ8U171QEL4VKtt95EJTDk5o/mrROAJWJZserWJ
	 mJqdqsk1MemJitfVFuku/q24W10WPs7RQDF/n5A6PGLjtwKlC4z/p+qmXXnkqFAYJN7LY
	 JfTqxXz6mqoYW7kIJ7YuUS6n+Ed1opswkjCrB6IMC0/tSNRl0Isud6z05TJVKVzH8xY+y
	 RdeHgGVtGguXa+uM3tLzz+SveCMe3WeJU+ogx8F1ONio7RyzbY0cVYBymvfk9EIX/U2WC
	 5aJ4IJmFOQnq/oypdRzU+PDoOPhHMlWiTrWPfKnjr+zLB2fz5+ElVoQD/77NpUjjlVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=wp7ibEI6HQyT1dW/2ILJJdzBkeAJPLogt/wh+EahPUk=;
	b=tF1uys2PdGXsErtcwunDix7EW20OfUmnczhMIr+izsZtCkM1iqcgeb8c+F0q6QIo3VTY
	 GSx5jibMdtBQK+L7gvgd0l2J/Y8zK71DDPf06uGjSMGEkbJHWMB6TTVcDo+h2X+Eemn2j
	 TA/iPM1DB/udL51gWS6OZOQXmEhBGYr8ALQvbOFLQxkguXsw6gZ/SmIyQZhuXITQa+0Tt
	 fa8Tj4b07xyKSCqvwVgXv2O8BZk0PHgXxvF5LsmK+HN6bfmrIVv78xrakeX6I+wr1k8WF
	 sjV026AcCZIjRtxEjcWrb5/ij9SbXu0jB/1CEhj33Vd2qMDoFnHB37jllyiWckraMOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DKDcjGal;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PtuGuUkn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3157B606A326;
	Wed, 11 Nov 2026 17:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3157B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=DKDcjGal;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=PtuGuUkn
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHshWq1314315;
	Wed, 11 Nov 2026 11:57:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=wp7ibEI6HQyT1
	dW/2ILJJdzBkeAJPLogt/wh+EahPUk=; b=DKDcjGalyTrTEqnI/UaEFkPUpQJw2
	hnDE3x3Ovyg3FzYO50FJDf5IRTmXCqCssNA7vAu/FIiaUWkFMYu6gBQh/+iJ+rkd
	BFz59Wjaqu+O+SEsQmdy9YiRgZOXDaatY/YA7nDnMcMLFE//DHuE/k4ikAnFrSDb
	KwTG0Q6il3A8tQyqKtG6bW089sjW4MaH2cvNqm/VGKLhL1bHGc+6HqDZzT1SLXFo
	74ORl+y7leSC41XL16+BowsQDEcvWlj9NnWFbudLOUAGjpTEbVj6dTKQOO3wbPy3
	60jKr6cpkXqz+EBmHgoHTtLkH0PT/LRmeWhlNUyT1ChYzl9ch8/692qTA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6r6s8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:28 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4KRyV2ccAffdnr/qEP0yGnMChOzZLXc7y/RGfwwGpuNCgsM/ekY2rXRPyqqwisfdaMd/rD80qq+EvLvV1KWo8kyBAKE0KJ+LdNCT4/KSg81AJpkSaXiPFGsFMSRjekOTe11cPudcpZCVAoT9p3qJe9LO7mpH8eNheRemz2QV3iuCTHX9dQGzo/MSB2VhwcUsDmWQm5qBZAzMsBawjki0oyAc+BPaoTsfaCVhGbv/jzrzpzHhYzRFLACB6QnNrCMQ6IozUXPqPTmQondvr5t5zcUOMXVd2ALtcpC4fVY1azIzl3mPFeMuXMzr+RLgJCKJ3d0DnUlJ08a8cnaSXwVww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp7ibEI6HQyT1dW/2ILJJdzBkeAJPLogt/wh+EahPUk=;
 b=DGPdKgW6hw01CnoWEqj3PNYf/gftfc8uTBfz4o6WbMvH/D3TVqIEN7ZWWkzBcfd2AS3+N455/T6/R+3ffKhxaBuuWmRt+85RE40c8yX71z+hIsjYF4OETV/Y3V7N7Zg7KH1sVgS9xsSRga/hBGubwJTyVESWyN8cCcsAKLDFuU9uuANHFP7eD8I9wrj0gbo2W2n57oucbJHxsIKh//pEsI0/qyUeFDgHRa8HKgGYKai3TQLJCJfQ71vFZjUkzfH/OmeSHPuakP//l6SDt4WKNUcU7T5r17/qfK4Wc3OuSKQvOf0A4Xvmwis6zrdkux2fGdp9zmnA4lVbO6Cy1QtuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp7ibEI6HQyT1dW/2ILJJdzBkeAJPLogt/wh+EahPUk=;
 b=PtuGuUkn0LT9nlzSxd1/OrJy9kdLmTbh1DPfTfp+TkZ0lFOX6Z4bTfTKIY0rSMdFi3Y3pP5EHJsTU9p+LO+52FEzF4hdFzRidBwCiZMWqMgEpGs6uqXf5LzXbZPx5Lsc2/Z5ZjDuUVMQ+OZIjPbQD62EJvUbE31PWm9vDFxUzD0=
Received: from CH0PR03CA0381.namprd03.prod.outlook.com (2603:10b6:610:119::16)
 by PH8PR10MB997931.namprd10.prod.outlook.com (2603:10b6:510:3d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:57:27 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::31) by CH0PR03CA0381.outlook.office365.com
 (2603:10b6:610:119::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 17:57:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:26 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:12 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:12 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIZ193504;
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
Subject: [PATCH 00/12] Add and use DEVM soc_device_register helper
Date: Wed, 11 Nov 2026 11:56:59 -0600
Message-ID: <20261111175711.428824-1-afd@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|PH8PR10MB997931:EE_
X-MS-Office365-Filtering-Correlation-Id: c0913795-0a36-4675-6adb-08df401d3f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|56012099006|261102123227099003|261021121427099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	vxBc9QFIGYf/OzTiLaMbLpABNRRwTLdwyShl2Oq2fMoEVDKkYdfFNs2Pd7o8F2fer+i4fXVZdQ0Vi0pT60vX56izSgaOikbkZ+HQkJLaDk0qQNnDPeQWGQqp3k79+i1Kq1iSfipULMdRz+oRij31o+mVogPDQuDyikxIkt2HEBUl0gdJVyebxx4N1GmmTyyI9PTF1hg54oBsniEBJNh0Hh+LSAYp3o1AFknkDJ2V37udy92LuvF0O9V4J+BsJ1RrI4F7w3Q3A/ahfS0uHMuIzUp5+kGIg+RKLkFcy0SxPOmiN4LbXriGvGQKhhtOzbDE3sjhy35tACJgYyI8qjs4vS7RCgghhqYZMHPFmLu2YjKeOcU35VH3b/D1WUM/l4Q6RXbA9hCU5rlXAvLa+QyXmyYfVN9ja24CuVHeFR+WfrHSaS9hZkntC7CPfGFcJa/vSi5HqeSq5WG29NiZOqmm9Mz5lehw0L1+uv0MS2TwRZTrQNCdN7JXql19LYp8T0eSJROULxEPJ+2xKJ52FlCVsSu9GB1A08An3INsGmulrpIIgPNq3vRe6SDVESotsa7zHNoRjNEAsHQjQRfFKIeBb8PVVkpRicetL+8Nyij1GacLAHDjTxYREBW/v1dq0mbLeSUh9OghaajqR8mJwJbUokgPLfY086x3Whwf5xwQ5uyNWb1alNHypyy34xwhEwqz
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(56012099006)(261102123227099003)(261021121427099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7hsBVpzkp3517lvuzMaL8/GzUszBmPUJbaOyukxgihO8NKzsTvhtwJqj6WrRu3OWRw5R+PENcJBu7OneB2JjuRX97X2J+471sBT11oXXYutwcj4FM7d2z41t2FOYckhTw5yPYiqaYcxZRbVzxkSGvFaZZx9CXv/1LrOthDE81arq1Jywe32O2/ZZ+d2VfOhVRrp46Pz9wNE0inJ+S3gacYtg0U/MaxwqyQnhlgJIES2qZjlma/n2AyvEe46iMTIMWbwjSb0/s1Rnbw9yfCDnk3runAYVYq3xSGrX69aADiLnja+7wud4iPGWgcHG5YHcrUc1l7BrFJobNj21jDEzYGFmtjeLDWG3/gsNNjNPk5xamJKZjQH7RD09jfFFB1FMJ07Z2KZqvRezd/nxgOs7DkC6+HdJTRBn5kdxjJq8MgvJnEXBPPJuMFGYmgmAOmqC
X-Exchange-RoutingPolicyChecked:
	l2TMz1bECNpWJNAGHUy0I2fYJ10wvYiwDy1inZ5u9E6P4eJfSSAjBp3oBzaHR5ea5F2HHoD9kpEvFFndR+GJw780NlkY1QxmxiPj2/S64+x8x2x7Ccb6PltP1cNElzFOt01A2HvOXrXEOT6DszdP3muRia8buzlGTQf2XYUVnn3J+ME1NNO0KiNS5D1hiXtx73TR+kpZoT/DJkX1hLUraRZtotZ6H3HYpLrWPaFRQOgqClpcwuBAdHTG7w7PRBogl5vgGeS8O23dzEHroPqmRFhnLlrI+elpCMSj/1xZXsbn9paD3jVYyFdp1/jKzhZG3ounHEUMRQSRKL4bQdWyEg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:26.8355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0913795-0a36-4675-6adb-08df401d3f44
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB997931
X-Proofpoint-ORIG-GUID: hv8GVM-TS5tGrXPqiaOA5oS3-zQh3F2h
X-Proofpoint-GUID: hv8GVM-TS5tGrXPqiaOA5oS3-zQh3F2h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfXz5sljokfuzEN
 rgW+lyTzPb0XK6UGAaxQ9sAgreUshS5YRK99vT+bu4O2CJ9vStpUc/7DV6rnQ2wOp+t9IOCXevG
 1cYkYhtoWrsFa74hd/R8YSKOLYGXYx11s5jMz8fupo87UtGpSCG82pbuuKc9TJXPb3Jzxn2o7qH
 6j/9LbdzrAdKTFYAI60ooamovz/o6zGx18+YMulQJYVSi9nPAN3RKyTfEz6DQlBW7gkCECknSSn
 BBx9oXEtRwftCFpcQIYrRPboYq45Ugj6qKPKMJpRID0Apia/+zJYkc0PAL06lof/tCXKwTrp4HQ
 66zpVaz9lOWfQbDN5ZXWharbvPJE9IG/ineyCFJcAxDY65HD3Ta00ZrGsDua0U4aupa77ORxq7Z
 gcNAG2HKb8iDdXLB9417CTDKhYIy/e62MAnN09awmZ+Ugkgoy2e81EaD/Vro17+Du6xhORToMpN
 5hFebGf4UFfQjd0iIyg==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af4ac88 cx=c_pps
 a=NwWuzY5ekLRC++Nx77IK4w==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=exjrkxdRuffDQygP8YYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX9qc/B2Arhe5x
 IlXBpQKjgJlvxEcY9oTBc6C0GAvo+yYk5+UAYRNqCpt5Qkdx6k2tJh48orSm4yy33rciU+rmEto
 0/1EeAJJ12SXriwMxCyD2YdvHaXOYwY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Hello all,

Add device managed devm_soc_device_register() to automatically unregister
soc_devices thus leading to simplified SOC driver code.

Use this new helper for drivers which currently unregister manually and
have a device to tie to this new automatic unregistration.

Thanks,
Andrew

Andrew Davis (12):
  base: soc: Implement devm_soc_device_register() helper function
  soc: ep93xx: Use devm_soc_device_register() helper
  soc: imx8m: Use devm_soc_device_register() helper
  soc: imx9: Use devm_soc_device_register() helper
  soc: loongson: Use devm_soc_device_register() helper
  soc: mediatek: mtk-socinfo: Use devm_soc_device_register() helper
  soc: qcom: socinfo: Use devm_soc_device_register() helper
  soc: renesas: rz-sysc: Use devm_soc_device_register() helper
  soc: samsung: exynos-chipid: Use devm_soc_device_register() helper
  soc: ti: k3-socinfo: Use devm_soc_device_register() helper
  soc: versatile: realview: Use devm_soc_device_register() helper
  soc: vt8500: Use devm_soc_device_register() helper

 drivers/base/soc.c                    | 23 +++++++++++++++++++++++
 drivers/soc/cirrus/soc-ep93xx.c       |  2 +-
 drivers/soc/imx/soc-imx8m.c           | 11 +----------
 drivers/soc/imx/soc-imx9.c            |  2 +-
 drivers/soc/loongson/loongson2_guts.c | 10 ++--------
 drivers/soc/mediatek/mtk-socinfo.c    | 17 ++++-------------
 drivers/soc/qcom/socinfo.c            |  4 +---
 drivers/soc/renesas/rz-sysc.c         |  2 +-
 drivers/soc/samsung/exynos-chipid.c   | 12 +-----------
 drivers/soc/ti/k3-socinfo.c           |  2 +-
 drivers/soc/versatile/soc-realview.c  | 14 +-------------
 drivers/soc/vt8500/wmt-socinfo.c      | 11 +----------
 include/linux/sys_soc.h               | 16 ++++++++++++++++
 13 files changed, 54 insertions(+), 72 deletions(-)

-- 
2.43.0

