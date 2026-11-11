Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419857;
	b=hazKh3ZulUvcnfZY8sIb12dgf+uQoemGEoBYOTglvyCklXiz5gyI+u/1bljwg+SGLAic
	 LZ/GQRtgj8CKKVJ/lSKiZN7G3lNGp0oyH7TZ3wqPojLpTlNCj07zUfxty8D/hjpqSZRyX
	 Cn6W+dTXltsicbEO8sirZ7EurUsBnKW0NlgD/qE+RFgfQSxXeg4ZPx6luvBuJhml+ZPcr
	 vZrWMqeWYMySJyYANxS2W9fsh3mJftroQKBgCC9MfuBlKzyt80clt9HVLF6xe+nvRfoNf
	 vGw/yD7y6twa/fz5J3UJIXpl7z7y0kU008nYZaAuEtaHSLmlk7N1qX8nrd1lY+rULJg==
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
	bh=K3xsxmHywz4HgOxQZBVidRqzw7DtEzIfFnVsg3HIZlw=;
	b=XNhX0P2z2ZrckeCU2E067rExsfoicesHnm9iBjOoPUz1mBf93LruAt/IFyHmEOYWgZ40
	 Vvmpjq5mDy9pOzOy8AiyU110JjYeLyPOHA44BGUQgWwsA7Odz3ekzahHHush8x2KEDpRS
	 veMUyCxYIbUbFrIyfQWweC/YoAcLRiCZsMpdwIzbI4NSxLeUNprKkTnK6FQ5SGk9fVNkr
	 m0bk21aG3art15tj3HJQPG4L2aV3uHLH3ula97Kuhy2B5v/+FnliLaeyYCe0vOTRR5AET
	 g66sMVaffg+NryHdCONT62f7DmH8UGsG9DoqclgTSTxFTkdTVUYRTTW+j1Cjv893wXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SgqhTU4E;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=LJRkD7CI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C68606C236;
	Wed, 11 Nov 2026 17:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6C68606C236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=SgqhTU4E;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=LJRkD7CI
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHshWr1314315;
	Wed, 11 Nov 2026 11:57:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=K3xsxmHywz4HgOxQZBVidRqzw7DtEzIfFnVsg3HIZ
	lw=; b=SgqhTU4Emqn7ZI487909vQ53FT+qh5t/H6y4ZbL09mWFMDwZX+QyJAld/
	Me6OM0cF2qhAmyBR1MfnF42kov7Zo3WUcc9KGz4FuIZGN0p+5vvdQOyuLLPZrcy4
	rXCHYZyLjjEU2y/QUUnpqWDiupqY0p1lHPxWeU8zMeFqk5/WCAOO6dX/0yaseBUp
	Qx8UU4WDm5RqR44fMqjIvjD2ZGlFY0c9nCd1mYexzD8aHZGFUn8Jumzl1KNrDNC5
	HYRtG0eJgMbu/AU9yNbS5HOTQ2sHgqvPZMQORInxH8hRhDHsH5jiPgmLnr0rtIPz
	/msaOaGNeahFaL65uAovMYtTt840g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6r6sn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:33 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Si6wqCi81e0w0+aac1CgJKEBr1iTIg0TkqnQ0yFUDLpkCKkKxcgqthWmzkGy6QF1Vr3j8gV/O50YMRkOIlaxv/ezaqSb502W6+hhbSuVodnqUgjnUfo9azV5LFc9D9/5m8yjj66nVtTs0KkWo73+UqNgkIGQgQMsWg8lQg77IrtQq8KBpQKVLij2D8Nq3sCUlSUFXI15+g+xu7/vmPuGxC4VV1ZFxnHh6fgfu0YMrkVmvWTEoiBlHxMGff3ZC9MHHEuTxquqhsmBwOo0nJUENKdtMn+VpCSt6i97RjqYQbDHU6iwuPxSX1+al2Xx0AerzK2jfT1ts54RkoqdhI3SUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3xsxmHywz4HgOxQZBVidRqzw7DtEzIfFnVsg3HIZlw=;
 b=sKfA+IHUXEpHJs5cWB1gSYAFfYHtQK7srrv7oRJG4CMWT31FZrSeFEOSs/0Vuip4RjdrzkcOu8VuShbOXvtSgTrp/wQfxPs2D30AnmfZ4EvZcmsG57WBClGLeYaLR1OTjEp3GMEIn9f4pCwPdIwaoXkD0ZKRUoCsNo0eVov8+6/fPI002R4qX6/cm02UFs8kuXtEyoZA1q2puDobPAlAFnIsnaGOGQSQbCJ8kRuww/nAa0uige//yKpcmVYTYlqx14Gc4NGe4xSY8tuVeDmnGP4tvdcIM/KgdLp9bLqreQWRGx4YnxgPdEg/uPSeucfxi6bywGmrDXJh9e7nDROE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3xsxmHywz4HgOxQZBVidRqzw7DtEzIfFnVsg3HIZlw=;
 b=LJRkD7CIpkLWeHTS3SEc2Zj1VSwjv0vGJG1Mc2feZa05h9lDtPQZ3/ycMNyf7KFMPcYAzN70RTDbDqd+Ozv4w/zyVoLgrDnigzMXAYuQnGROi2co64luXBYM33LWt99E/eJXTFNnJjMmyQfQ6JSUlB50y4vJzmfbQfeTd9NJ2P0=
Received: from SJ0PR03CA0339.namprd03.prod.outlook.com (2603:10b6:a03:39c::14)
 by LY0PR10MB609396.namprd10.prod.outlook.com (2603:10b6:404:22f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:57:31 +0000
Received: from MW2PEPF00014673.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::67) by SJ0PR03CA0339.outlook.office365.com
 (2603:10b6:a03:39c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 17:57:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW2PEPF00014673.mail.protection.outlook.com (10.167.249.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:30 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
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
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIb193504;
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
Subject: [PATCH 02/12] soc: ep93xx: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:01 -0600
Message-ID: <20261111175711.428824-3-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014673:EE_|LY0PR10MB609396:EE_
X-MS-Office365-Filtering-Correlation-Id: 789f9b0f-6001-4891-cb91-08df401d41a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|10067099003|261009223027099003|261009221227099003|261102123227099003|261021123027099003|261021121427099003|260925021311599003|260925022911599003|260925021911599003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pdERQJYh3NtACkS/CdX27yr00DfdOMuvXOuRKmT4ZcEnmIsEUSSAsPMH8Fww9ROaMmQB3jXQ+2GDs+TgW2g5pRHlsvSOoVaZyN/RMGjmbywkp2qeG0NAO8SX/7UFHBuzOzZToanhSwaxNnTzltv6wByuRVuuwP1MrtTOqKLZO4es5Y3U86mvf2mSCaEkQfR7qXmZRB6X9v1FZhXE9+qas0rOVqv4FxKuajnRjQYJ9M52fOvRzj+s5Ud43ykkk9MVdAiY0jgpcA2Fy5qewCMpM77CDMlTFl16kzNkbCul9t2wNMHQteZTf7tb48U1TOW2J/BOPC1wOv2ph/FoO6xBtO+mFV4mpXZmppZkTSz2W/o8GXuCl/WiNi1DQd1RHylIxZgRJHvU4a3bSSfTm9VC+qRLISy1AR3vO32liMaLGjnBTiYRuymRaU2r4uTHONNEWyAS76/InQ/3oZHlYXMK10NVADM1Y+6rZ7g1z7Ud+97tfm/jsF430KfmMagEB6qvxddfb9qPUYxZAaNFJyzmkQtwT8kylXiS4kVHrrlPNGG7mFsSs2Q35Nv9kMDlAw6baqer5KQbMOZJTwXiOs0mpNoALDSZOlebyPZRLEkCiNjvARetjYm1IBzxrPJQpSGkvqWWNSrUFgLVXfNfSckM7KEEjxUcW7RIJhsz+RP2OmB6eeZM1K81HaAoi3fQ37BdF13XB2u+QygLfg69bT78Ug==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(261009223027099003)(261009221227099003)(261102123227099003)(261021123027099003)(261021121427099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	StTdKx7ltB7fCn+cXDQb5ndWAbftqI4jCLfkMvV0i1z4H9LS6sh8c32kA2RebGpWs6E1IGpE3dVVFGaDcEY7XhD1sDnbwHLrm6KuvYsVygh+eQVLtSQ78bMf920D5hhZYQmia/IVC4u2D+FOWnoVxMTWCArG0SGx9dRgt6LpAErq9audKrktULLDx2Qmj7BkaAFooKVaitLRZ+eJXMD0YlY1qwpJhQBpqKFak/H9yJBRcZBGzETcX7a0HU3AoF1y1b2HS1EWreg5ApvSVi9UvKAqNo9FHYRlauaRxKiFAXR5hZMFLul3WCseVvqOjhFHW8ib4RJ8fbljmyKVJBO6HCLEinoxoEtrqmstKbYWPF5Hi3122BLlDA20R7VNiIK7HHwakEhgIlGbl3zuNESIr+BGAP3pVpBmi7DCCBqzVGnEmo5pZ/spTMuBlvUyhQny
X-Exchange-RoutingPolicyChecked:
	cyoo/WdEBTJ2A7Uxq0ewMuC4AnzDp4mzXzE/J1J5+dSFYFYNtBjeTX/rNtJa+Yia85Xh1iIgUIuvaAU1eGyGU6Odxudxo0sNSqyIZUGLSaKaBVibUtFfizrwQVogOzFqEtAyieTD3H+5sOJ3BgbwZTkfRG/fLGnWIDFwEO+4pK3pabtDytiZ2T/MIKKgIoowB+6d7zmo/BTyuB18SWTMAVm5ZfDcb+66foFhjarpHbGiiVs2nIqztaFvqpHjELAWgEDi7n9pFA3TR/o7c3MPSvo75Yyu43jP5CQ2FIalNyVxpp45qxiEusvV3X+kKUu2brv0QAXdHfLwss7DdbIISg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:30.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 789f9b0f-6001-4891-cb91-08df401d41a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014673.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR10MB609396
X-Proofpoint-ORIG-GUID: atXRJ1m6vXcokU3rni0EiaCzVnAW8dXm
X-Proofpoint-GUID: atXRJ1m6vXcokU3rni0EiaCzVnAW8dXm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX9/2j/iZ0ITYe
 SnLEkXdiIx/VrFONUKh7ekxNeN0QNvBqDAXjzPjzKpBOtMbGGsOXz+2JY/YgZWHsbGjnIkZjY9p
 cZeLianlI6y99cOEPi1Hxu1ufYzdJfRQXCqCiai00iRbm4iadBOETBP2Re79ZbqjHXotTkwwhMc
 TY8+wNe5oskyEE/KUdk9Dh9kcwqauxtxjCNoW0Ej1ansoWGTpUvnvPdcxbohhvmgDzXgnC0RZEI
 jDDfQ1EEtT1wWYUbD4QOy4uOysiC3nGX3T6vSzpwgsbYHVJC00gi9iKFCudvM15X2OtHlAnC9c5
 c83e68MDTdh0l3QKYVHTR97MGTCX9mWZjTiyB3gw0/tRCS1g80odspetbW/uuQlvEtfuGE5ot8a
 cqbpMlWqGcZHqmITQ/0j5L35QmTbSeDWzeSglg+Df6llwSTfsh4NN8Xct+3M0DpGOn2Dhy/GlaA
 YlRa6jDNk1xGYewWoJA==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af4ac8d cx=c_pps
 a=6O9SViV89A8ZJb2Gg0v8VA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=_xq-VfNkQHoUXNa7gIkA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX55YFMb2tHJXN
 lczr5CYPY1zzIgCLNjgQk8kP2FheLDmZf1bpXpVjVEFsFPXsOXWmFwayZ2WZTvlMciWw6IWalL7
 tFb74AMEhyuS8Nw/IX8jBW+SLSP9UC8=
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
 drivers/soc/cirrus/soc-ep93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/cirrus/soc-ep93xx.c b/drivers/soc/cirrus/soc-ep93xx.c
index 5f6820925040c..2352bb76b6383 100644
--- a/drivers/soc/cirrus/soc-ep93xx.c
+++ b/drivers/soc/cirrus/soc-ep93xx.c
@@ -199,7 +199,7 @@ static int __init ep93xx_syscon_probe(struct platform_device *pdev)
 	attrs->family = "Cirrus Logic EP93xx";
 	attrs->revision = ep93xx_get_soc_rev(rev);
 
-	soc_dev = soc_device_register(attrs);
+	soc_dev = devm_soc_device_register(dev, attrs);
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
-- 
2.43.0

