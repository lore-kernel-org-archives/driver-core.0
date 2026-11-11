Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419921;
	b=Johbk82ukOI+M+BFXrhe/vt9csS5d4JVRwF81MV/vgFhQtqh6NpX97fwL0lO5vYA0ECI
	 d3H7+YuTXEF7ciSD1nEeIpR86uIcCBq74IEvqa9GguePv+qIRik69W5gRvqzEQZRlZ9I7
	 zWRBQ50Zp7Y3r5rx3SMSBN6XChxeWTU/U16/tfO1LKmbSEM0sL6wqq7MtXhj8qkIHo4NX
	 7OnttkLRwAQFZo8H35n8UDwf+qNEHzBAZuaIMcuWt2UMyM+18bj50hNUaYEK9lhuwlZ91
	 nnNiKjA171xSDT1zDhdzdptz6nRrKuiYVnLFG2MM6WIrkfoISph0Q28Ajo8957VC0aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419921;
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
	bh=4Z37Gvk4VksJLplqjXQIQBCNPesuRXmuuWvYbKoafM0=;
	b=xq2xKVOh0mfVFv+G/5Uaa2OABD6la7kPdznFy2zIXK+9qRdDOTb3GV4+pwqGsO2/8Gwo
	 I//dZYG2JOeZ6flU+fzpdNY9rSje9pGmUHE78dSwuKho6Gbd/SiezCSDJueutIJBsgRWN
	 kD3orfdbEW41E+w9A4nbhZqf5GojUNzVqnyaSgmFZEUOeqXuQ0FqnLQGY1XB6LCaaeweA
	 DfMbcwKA3o/pkcnCmzrimySa8yHq3lkp2Bc2MiQpQ0PlaXr5wWYAsYj6JIpMdPjnXJRWi
	 m597mwWYNFSrKqWVe7HZFCDD+hCmI3FonCDFzNYhK56bP8y1pIXb1YXIm4KivwhshFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=O26fvzmk;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kR0Rdv+4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3B606A33F;
	Wed, 11 Nov 2026 17:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE3B606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=O26fvzmk;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=kR0Rdv+4
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHshX11314315;
	Wed, 11 Nov 2026 11:58:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4Z37Gvk4VksJLplqjXQIQBCNPesuRXmuuWvYbKoaf
	M0=; b=O26fvzmkeqMdYyjf1uMpR7hoO9uLWmmUJcEFdvdQh4T6eaXLmUMexcSNl
	/ekRg1cx2+ls510TQRj7I4BTBr5Moxi/UBs4py1eGhwm0mOY3N6g5yNqlR1bmyvZ
	/2C9UW26mjGZ0aS8put5swv/Rh18xNRwMeLfEy+f9oO1CoIhgjgMgnxenVTf0asO
	ufW2XZUPa/1MBA0JAyGy4/LRnLfnalIME3h9IQ7jJgIQJ+NqzL4hCXGpX9ttglN9
	FIVi2vCJsMjYrpo62QeyE6NnAVeralahSCLqUzFW69gS8Ny/ITuxOaYOsNkXSZfC
	nhjFAyMcRQhlnnAEiZ3F/snNNWotw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012031.outbound.protection.outlook.com [40.107.200.31])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvvr6r6x6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:58:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iilZQkge9PF+Alh4uN5753TID2T9jkd40mSCgZtDkEilVZtM68i3cKkIghzTMRfWpZ78Oi7YVUEnZyCKGdcx7oOcdCJ7/t1gqtX3caDm1/46xdZKJibKCLXqwGhoQyz+aVXlmSJ+BdeFOU+OODbPC4ljntO9XRFA0ZmqFbDaqsLgZUxA+9SP2HTyivXim/kDyZwcg1dp6XcuG/sWCknToVkibksnXBJc2hUFeYDaOVgerZL6qovMq/mwN1xOxj35X/8opzkJoDy8GiGOOBTDpQBkcVnvXenY6tVp4BYxH1pltRDvPOqrqqanOO+260CqLnMNrGeC3Ie8YxQR9LQk5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Z37Gvk4VksJLplqjXQIQBCNPesuRXmuuWvYbKoafM0=;
 b=n8K6WFwChr0fmAYxksJXhZFQjuxe+gv/EzGBOtKu+ZeV9O3yz0UeRDAoldyybbwt+hctWLTEvWzVHUDzTDq/1426sI7bmAlkGSkMYSZynxIugt15712EwacnGS1oZzXk/EsDgsAoFA/qXaThqgMpoaeMoamXw4UZWY72ozCjzRb76UmZPjg+HC2WnQffV7kR+wOufTTd6Z6B9ei9IjJEerc00s2QVep5wnbH+9ZvhTw/sFm6KdfE6/18Ygv4WtSwjpRUpY2jxxNJ+wQBiX20hcIfhBtrk/TGOlf+lnycgKdPSKDusfKwRJUd909tC0Oilm9E35y5BVZsMvU4WeRVLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Z37Gvk4VksJLplqjXQIQBCNPesuRXmuuWvYbKoafM0=;
 b=kR0Rdv+4OXI7dOHrY3c6Ckq5Xw1AqB2C4WN8Yhi9ZCZeLU+uRZUwG/5SQ7j2mtLraZtUvMz3DfTgduSqQLshV/GcBxV1NFEH/nrBg+ECSImPQsr9H4soBLDp2fkj2ElpJMWlhrq6VUF9BqoHK/L3B7kmXx6SXT/lPgMdBirhm6M=
Received: from PH7P220CA0084.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::7)
 by PH0PR10MB4405.namprd10.prod.outlook.com (2603:10b6:510:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 17:57:34 +0000
Received: from MW2PEPF00014674.namprd04.prod.outlook.com
 (2603:10b6:510:32c:cafe::66) by PH7P220CA0084.outlook.office365.com
 (2603:10b6:510:32c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 17:57:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MW2PEPF00014674.mail.protection.outlook.com (10.167.249.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:33 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:14 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:14 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:14 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIg193504;
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
Subject: [PATCH 07/12] soc: qcom: socinfo: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:06 -0600
Message-ID: <20261111175711.428824-8-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: MW2PEPF00014674:EE_|PH0PR10MB4405:EE_
X-MS-Office365-Filtering-Correlation-Id: e9559eee-400d-49dd-7c26-08df401d436f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|10067099003|56012099006|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2a57ITUZGVgF2+A/I1D8Iuo3Jn9ASJNWM8clf2b9L5UODxa7bK42M4rUaBJ/QnZvr3v2KZQ5LqrHN7/if1HtlKKKl6CrmaRP75Ats3uipX5JJzkKicPL1mW/LSh2/lh8kItznUNC8DE2bqhnaBF6dtiZEMh1u4ISCsg+/B0g02TR5GsYcXZ4QQjBCU3zqT74mRy33qzkgAVtwz6MRry4WkSZlgKc/QIoDOZycYXQ92IarNAiPtu0zPOmAFWxOl41rBARUfd1OHUa81tLXXJgBqL+UY18GwZg2goOrRSwOp/E1sCLdUz9W3warseJs/aghW/gdHFtIwQ3Nb3AIF/3WKfPLhYNsMdEyAdkDeR7SssU39p4kfeyvT50whS0OuwjjEsRM3UN09gEbal3dqHHQWJ0dHgulSL/WAci2WFKokoYC9pxnUimp4Pow+fYY9oQqSgCwkS3jzHEvNf9bqSsTCRipseuoKZAfdR4vMDvRBQuv8N9OZhyeQVj7mabnB5JXfjLBgyjMxXwRh5k/UXbN+Ugec6IQ5EP6wQG1BO+ux1lM1f8xY/EUzTKiIvhaVpAWR2RvQxcbr0Ibi6nwS1FryKv81I6WbRAU2xu+xxLfSyRNLNEHX4kC5YUaFL6JT6+pYltHub4MLzeG2/dXytFjatFCJO5YwvFL9XqGB+X52aBZP09bYL6pTsB2Sk4XeomQJzdrTXSaxYFvddetSQDpw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(10067099003)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U3sP8uBvXRwX+MVvOtulA7eTL2ZwcxfEXbMt2GS2y1zEp0yoFQMo6fukQRLkGax0vRZ5rUPtuqQbxopQaW/49xxLP8grBw1MoOI1JmtKuxUJbp7Y5LA5vqF0AHriocZ0bfxCC4kGbu74CABn6u/H0Q/6Bpof6vGxCMnaKvKUrlsh+Ig7QIY+msVaPuIA5e0s6VET1lVxaCrm9mfSEAJSKMwGhCxGYFKXIICzQJgI8u/ZCKyrhOAINbp7ma+xPzGJ7weE54iHRst1GgQX/qe+PpycDzW4qexZyybemZf4yrutw01/SWjGstp65NfxWI8PVVEoYMjEiAGRMF2hiYXVT6SomXrp5aPg+CfazCeTgjTUOil95hvkGdgxeiI9tW2LR2SClnkhl95YyH4qr/Z/vdYJqS6vbZX4erhO4FE6WmyGNF/hvUjHufqKOORkfGAn
X-Exchange-RoutingPolicyChecked:
	bRhxLOE0dhn7BntIqWKCIR/rtoL6yU8Ka3t01qJ21JCk2cJqoXKAxl9C/9C6LAwaP22nGE1aKnXfvJHsaqJ2aknftucAbr6LUKG6dbqym+0g1cJ2EOGSDvK9tIYMV7WV4JxH8zgww6i336PtOVey4d6g9lYTix8jXv5viz6p1U5ZPC+iBwzDMsCWA2KC0/EqgZ9utUONZN2Xq6XrEwj4zdFQ5BBFUScGLfUrrSuygPlivRRhMKhZ010+GbVTqafspi8af24XFVgvmZUIvP0E+2pNU6nsifbM2R3AORa9YwsmNexS6RQ2tBBeEM87BvBxWKqerH6wQxDobxChQt9Uiw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:33.8219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9559eee-400d-49dd-7c26-08df401d436f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW2PEPF00014674.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4405
X-Proofpoint-ORIG-GUID: 1Tc6RkDukQy17M5in42vhkO0cyAiNOCo
X-Proofpoint-GUID: 1Tc6RkDukQy17M5in42vhkO0cyAiNOCo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX31pCjbJR3KBq
 3bt5g5tsVcsXFqkk4Y0pd8M8AolL0WDrefbJM9jEhU72eIAs+PoDhZqkHU+fICSclM/+BwaGsea
 i/E/eS4RUUrHCYbcWN2UUU+wDKW9Hurcu+CBNGKdru8vwFQOMOdhU1aKDxLrHDBJz+mhJppcpqB
 mX56NK7nBrvdSHkaL+zGp94hwx+yjFmHkwIrSMq8oUkFNdAwFVM2F1en3W78QgSCmHvNJWV4Q58
 ozs0vp/vDLKVQc8W98vDuLmJ1AJ1RSEt063Qu0d4/oy0sTLHeWOmwtF9IPmzotEVkJ/7v/EeUMZ
 +sNR3FY/2KrXFc7S+H8AykxAuwu/BgVvPvb5DKbN2rARBZomqE+cjZRr9rgu+nzwFXhaPANzs+F
 RAq9PqwTirvf16Ztzg84lytNHgipwCYq2TUa3MyOzneT7RR6E2lDsXMvF9ZLSG9F26bYaag5Zuj
 5DD+QcXc0xk6OjJHA0w==
X-Authority-Analysis: v=2.4 cv=MpLHeGae c=1 sm=1 tr=0 ts=6af4accd cx=c_pps
 a=AUZ0YcNXPaZtx/MHT1IOUQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=pmKTAE2VAia47LBCF9QA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX6BfCFqAG6zxb
 qXL/EG1QUdxERavuPNwwP2/VuGmGk84u8eryjRHtBUx3tQdZSPZnQl68/qe6CkZ6GZyk3pHl2x/
 ASk6eqPxFuQS+RhjJXTzAkEwc+shRLU=
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
 drivers/soc/qcom/socinfo.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index b794ae3b18f56..2f452ba5d675f 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -931,7 +931,7 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	qs->soc_dev = soc_device_register(&qs->attr);
+	qs->soc_dev = devm_soc_device_register(&pdev->dev, &qs->attr);
 	if (IS_ERR(qs->soc_dev))
 		return PTR_ERR(qs->soc_dev);
 
@@ -949,8 +949,6 @@ static void qcom_socinfo_remove(struct platform_device *pdev)
 {
 	struct qcom_socinfo *qs = platform_get_drvdata(pdev);
 
-	soc_device_unregister(qs->soc_dev);
-
 	socinfo_debugfs_exit(qs);
 }
 
-- 
2.43.0

