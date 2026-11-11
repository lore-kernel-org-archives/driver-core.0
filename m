Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419854;
	b=g66E/yHl8kagGu9VFGmO09fUXoTTqsPo4pWRklCa4gwIrhznerwAdlVmAxN6y536sVac
	 LQXOiInRF6xAYqXTi0Aqko1jM+NPJ/25RoOW0MWMsnE0Zmm5UiqbYlQGwa+rDYtQlP/1Y
	 c9Peqj8bh8VSAnx5In+a8UhiY7jenI/6+6eP25I/QC8BVJXcLz2Gpg9qv+4qvo/3JiH/n
	 kSuzgHVjtRHEs0dsRI+e/q88uYVMqNrTzjeT04zIfe/aFkJVQT1k9EBUXOZcNsWFduzd+
	 mPBWXlaZT9zsqdGUSQZbs+OYuoyWyZkU/6HKK1krF5TphkIIc6o0S8ITaUuFojGBLwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419854;
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
	bh=hbnYEKD31jA1iYTOhmHnPdATKYJkncNUSKnDidoQ8Nw=;
	b=mNOKoG77kMArHMjV3ve8Ai5jGi5uKsoXWjv7TkJFuqa1+NjCdjKpwNzw2D7FC8prZhgw
	 gyqdTGlY62n/YfblIdy2mDpxvZNWmisccMDPGu6gf2oDEBVpllCDOurkysiRQS9Yw9xT0
	 ajziJ3DYkDhZ4elQMvSoljsNggV61RqjTY3HFlnMrqBMcpwW8nN0H2jxfiHXfFM7BAwFN
	 dC+49XewbLPiTAghU1Na1MVtqgSZSLKl7NPDBB9RYYMaNTu6moBsD7tLtBod82WoKbo7+
	 EPSGrXxhuqDC76bHMmzV9ZQLHQmdJxODDzD2HOkKqa3uU7x22ucxSq4KZlx6BmCzr/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b="ahE/6Gs9";
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=owPi12hG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399F0606C220;
	Wed, 11 Nov 2026 17:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399F0606C220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=ahE/6Gs9;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=owPi12hG
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHswuc553520;
	Wed, 11 Nov 2026 11:57:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hbnYEKD31jA1iYTOhmHnPdATKYJkncNUSKnDidoQ8
	Nw=; b=ahE/6Gs99tsdJPu+w2N/PgVIrSDskq7B4n0WXXSB4Cff/jkCitd4rVkT0
	8R3qnyW3V0s0PBEKhg2D/8l/DEA4eWYOrflc4VYhKvJAY1rjimFmTzY878JkhMKI
	H3d9Cf31fMoNrzO5tUI9+KpxE9meC7t5lB++VDBv19cRmRURF+73sVPsWzlFyxpq
	4RYqVpNpIbSJ6qdJd0FjhjcHHwX/d5YRyf11AvoriVNtelo5N6tu1A2bYiGI6CYp
	/W25aOxDv3chl3kYPq3exDA8kIniEYIDS1ICx8SdrpDTFJYkIl6tbGcTCYuy+eyC
	/6btm6MY/fu8dEj6BU4Tjx5/CJNLQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010001.outbound.protection.outlook.com [52.101.201.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsymaut-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:31 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihLb4/d/RHz09MRR74VaCtMW8/vkHyE81ofQXpPUvowH9KILDp32VjfPltMbl6oMZDlSFu75v50rDKedPd6P1mxTvKzCyB+SeG976k6ugeK93UOlf3hoiAhRQKlVaAVbQuhdRQ0e5nzB3yIdJGq5lAtNifrZDiiqAjcDD4faE5eMt/TsFLmECodQQQwK+U2yHGH9yq/T6RyPl5a4VaHTwYSlWfpH+QjMs8Udo/Bz11VMOoRB76fUDWbYK0zGDQf22X6DyigIuxEo6bdwlUD3Pfw9XSd7tXAAlVfgNnVecaklzLGlvEpruHYSO5qv0Qflo0IqR5LioCb31elCSFjc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbnYEKD31jA1iYTOhmHnPdATKYJkncNUSKnDidoQ8Nw=;
 b=yyNfy5VpDw8ecFS8B+U+C8FuPuHgSdZAgsC91mSEYBy8di7+S7KO514ppDhv9Ce2tQRUHQ7Hd8kZaYuaIM+t9U93D1MIT9Os04cY5OAgNxx2sZDvYMwmwwX0vwEHkr+5S5AUhbtAYiS6QaDzPgQzy/0Syx96W1+kuuXYn1WE4zPuivHWYaji2KuSie7XAJe8bK071Xo3SAeBgFhaRaIEXxl6kcNnJ84JIiDH2QYzVKADIwRRMaeESg42CC+6+amIRogYRzmBkS5Ak2pNVcGcX9A+yoBjRL0sFD+Dpc4gTE5EDvdiC3CsMn3V5JcKQbRjOQq0Idj3cnkqzhi1lCqYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbnYEKD31jA1iYTOhmHnPdATKYJkncNUSKnDidoQ8Nw=;
 b=owPi12hG2n9CnOkvcw8vp7FZUmGzNguJ9GJSVp0Wdq8CQBI+kjd63fcH9tQf7TkjTQoh5rYQJ7HobnjZtbc0/hRcxES4+FQTaQwwqC7Jf5EzrrJ8whwI//oLPlkJmm95k2AkAvzJijKrkynppVzt+nAS+I0P2n0fbZUAd77GPSY=
Received: from CH0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:610:119::12)
 by SJ5PPF871418173.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 11 Nov
 2026 17:57:28 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::aa) by CH0PR03CA0366.outlook.office365.com
 (2603:10b6:610:119::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 17:57:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:28 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:13 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:13 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:13 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIe193504;
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
Subject: [PATCH 05/12] soc: loongson: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:04 -0600
Message-ID: <20261111175711.428824-6-afd@ti.com>
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
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|SJ5PPF871418173:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1ba46c-a3de-489d-85fc-08df401d4005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|261021121427099003|56012099006|261009223027099003|261021123027099003|261102123227099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	V3Bltaqk+cS3hAzkNAYpINEHO9Z60R7aSeY+ygo4GRplAfK6nAaydmJwl1+iSXeMXHDGn5t7IqAkR5UsXC4xa8fk5rM0m0kvzYbwbpJwItGpi//pMgOkNG9/gpBX3+VKM20YI3LTlZEbUdkbCSJjEEiq5tNlqVAGjK0BNLZdNK0ms+hHL1BB8CabWaWrVK60Px5PqnhtcBOYh918JOR/nw93QEjNKLf313KDaKX3mErazr4+RHCc1NQeP8HNDGBIgEsEh1vVA0W09P5We1X42zM9dfX02KTFymcEHOZ9i3dPqw+nK8xPuXjEkoOGZAG7S7eE4BFhaAwe4G2iP+v1wahlnovQna2CApaaGBC0DsosMYB1r7WyBpHrxrkiXommTB01XknVqUku2nGutUr+Vc6bLpoeQQOd5L0aYWsocfn0PBxqAg7c74Stte5BSXAq1XFaD2gIUp9kjiGkuYrnrKmFnVAw1BCDju7jQxnLq7u123FFkDhUFLWoQp6sbdtVaYuFe+xJvtbWdCyYpp+1vhXpuURrj2ujc+0UE1ion5L8BDXz90nx9lJIK5FoQEahwwhFhkFAN9kC6GJpAqqCaJuoM35KFJqA2f4jm/gJe+6v17LoproKQdcCT5Sd897TGlw0Pr4T3f9QP0I1KgK+JJqNQ4NjOHRUnLGslZzuldRgt70KpJoR73OWh3DGNGG2XGOHY1yoFuWznMQNyGLIWQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(261021121427099003)(56012099006)(261009223027099003)(261021123027099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3GzV8urem8Wu5HsHFD+Sx8VYAvLGZCqfPZwh1UgdauF4uIbYGPfuigZdpEqOH+MNo0hjJCs754YsDVawHnUtO89B9AqV0Ydfq/wGTU41tJtuO0gtKlf/kQo/Hr5aix6zsruMjBHuw19G0/+wuITAhxBsvwEYY6jDQZ1J4t1QWiUY9nT6Br37j6b9CTmS/KSh4b6pow9Vg0l6zwFBYUH6nYm6LeKLffWCdcyJY+S7U79weUqvfJof1lmiwrfrn2CbMYXxD0BlpkHm+rc/g0ixfAkSo1XAuyDCduYpuf18PJe0MJEXhAnA2fxoEs4Ae0xBhZ4gRnZs/M8TmW9uAPoixNo/mtutya0fjqjrGf3tPvcP/roXoAON/bnyfAT/4Ja8EhGGzqN3MXZ7M1QvbqI/tslRtliVxtL5Oj6SyFG4Z2QNKErnnbgiK2OeOHoJcIgx
X-Exchange-RoutingPolicyChecked:
	ns/lVwRW+J4jOe2+AjT6NjLdgiJuiQFyCwQGYy76f5P8nVbh5rmpMrRfvrQ/LLpyDOFrPsJdhShyh8boa5NDXbJNzmgiHIhldQiGuWHQpA2CtosB4Y4T7f/R+UdJM2HeKV77jU7VQKOdUhi47wSwyimWMYWLin8XzHpraHo8fRyDiDf7jZ43j/j6sRd38X1q7OBq5v3oh4/KY0JvdW/RMUhYgREWkwKeGHvPXLePvle/H8D2XeR0tllkFiAw5aKdzLBus9tiDR4B+ozzcs/2hYOzjjVGRcJEhUzpVZs9tY8zQhlZ24Ev/LAcZVXSEYN4OQ8n57pvke7G3u4wSZcvCw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:28.1020
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1ba46c-a3de-489d-85fc-08df401d4005
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF871418173
X-Proofpoint-ORIG-GUID: mPgRbQdEyqnNiJHi5YE3phRNjLmYo9YT
X-Proofpoint-GUID: mPgRbQdEyqnNiJHi5YE3phRNjLmYo9YT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX3ATA+x7ilTVb
 z9evrlqXC8uTh5if/HQ8n2BFTIQAp5QayAVYtX+OITQQZNTiILqGrruF8lrZTnNINzHJso7ufww
 +UOvU9UufUHifU9Ch5bBfyVcotknlGZcKKmvOzfkym9mjnfbabF9KNfsE9lpPNF6FEB/iNxBfwe
 f7hGJU5IUI8RV5NrbIEuxVKY3N64BGrw1v59Tk/h9MTtM4LNIKSXi1JfATkgKFtV1J33d27jbKa
 esfo2CHofZBT5WYzYKqemSK8S/oYK0xIFsK2zR9+oZNDWedoaesaE1zOE3cMqFL3GFbokYJVdm4
 8Cta+y7AzBvsACJzIQ5dSt8NCwxwR7vXjXcTyi2UGQ0GN+IUvcR4K/8aJN0TIfnCoJMM13uAtwr
 aiUFVB5VHt99PvrjLeIotUThV/7kMCxTFunyhuveNBuxW0xX7PG0d76nai9j/atYjAMX540wHvH
 ix/C7xkrJnUkSAQKwkA==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af4ac8b cx=c_pps
 a=k7JwuLoshMfzPsPeu96bmQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=9bvxoRI6gNWU0uyUhagA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX7VhuhUhUre0m
 SJO5QAkM+tYJoYQ00sAtR9CYbdaCf49Po+8TZ6sL/l7oQoNv36rHuWDAnCLNFXLZm6UmxUB2SQm
 44ea5dXfX9glPYaGreI57PcnD8i7rns=
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
 drivers/soc/loongson/loongson2_guts.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index b28d101eb110b..7543fee3caf19 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -13,7 +13,6 @@
 #include <linux/platform_device.h>
 
 static struct soc_device_attribute soc_dev_attr;
-static struct soc_device *soc_dev;
 
 /*
  * Global Utility Registers.
@@ -95,6 +94,7 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	const struct loongson2_soc_die_attr *soc_die;
+	struct soc_device *soc_dev;
 	const char *machine;
 	u32 svr;
 
@@ -136,7 +136,7 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	if (!soc_dev_attr.revision)
 		return -ENOMEM;
 
-	soc_dev = soc_device_register(&soc_dev_attr);
+	soc_dev = devm_soc_device_register(dev, &soc_dev_attr);
 	if (IS_ERR(soc_dev))
 		return PTR_ERR(soc_dev);
 
@@ -148,11 +148,6 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void loongson2_guts_remove(struct platform_device *dev)
-{
-	soc_device_unregister(soc_dev);
-}
-
 /*
  * Table for matching compatible strings, for device tree
  * guts node, for Loongson-2 SoCs.
@@ -169,7 +164,6 @@ static struct platform_driver loongson2_guts_driver = {
 		.of_match_table = loongson2_guts_of_match,
 	},
 	.probe = loongson2_guts_probe,
-	.remove = loongson2_guts_remove,
 };
 
 static int __init loongson2_guts_init(void)
-- 
2.43.0

