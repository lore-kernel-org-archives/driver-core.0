Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59B4330668
	for <driver-core@lists.linux.dev>; Wed, 12 Aug 2026 07:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.152.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520135; cv=fail; b=LbHGtGV4HTzPtiqc4Q+ar4ojoAjVnoUgNT1/Wzd4A50c2Tx7+NlIDFglDghnp+HuXXTnD47tGj3FJ6DBtFdYgzhdrzdctM++Ux3eyNRFcE2Cv/OJdmOgxFjY9PJ4WzFbPH/hIgBNiTinUnjhEiUv5ArUvlViu+dUvCQFmLfIdOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520135; c=relaxed/simple;
	bh=iGXY9dCfFUDU/asmbwvFenYeiDdRTjePzdpLu8FF22g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jbnfO9Gsf4rPEYgp2d6nbn29CemCXRruZD3ODLWt2rmoeu0s7/A2z3hgnQ1YVJI1o+5vV6R2TGpIAgs8hTw+E3EZEjDHF6kwbqzTHJs83PEVHUtRvJiZ8gkHwMCP5DXy1R6NuTmBP/DxuLmVcSfANZk3xXaL8Wm4vg6G8j8hii4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=2zakPLLS; arc=fail smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="2zakPLLS"
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67C66ktp2650622;
	Wed, 12 Aug 2026 07:34:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=G9Ug8udOqIOOCaC1/rUTRwJz0mfUjUVclBKacaVe4mM=; b=2zakPLLS4CtU
	tmpOkWqUgUNitAvtREVhz9i8ndf98IrmfZISiNIa2KrgpUGQlo6fHO+JFcpmEzX4
	ENchYjIzvVhJLm8GhA8NehDEtKfuU1XkPftBKJjJFKo3WiGJHuE5JqTaXi8Rvwj+
	0WEnLy0Yi8DDbcMaA0dwydxOkq79AUFgNqqbUFuIOY5kdsT/8RwrIVB7bXLlDr4l
	vhxtjkoo/6HRkfxBOEAjTPkTnAy1FC3hBRvR3ezyyv5hjfbmq10WAxX3JO1sD5zy
	t1ngG4x1EGcZhoikoi8sBYwQuehx7GD7cctUfhaSOlA/FjGs3tzAr+38GemD4V8O
	y0169A1/vQ==
Received: from tydpr03cu002.outbound.protection.outlook.com (mail-japaneastazon11013069.outbound.protection.outlook.com [52.101.127.69])
	by m0355090.ppops.net (PPS) with ESMTPS id 4fxfsqe5v6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 07:34:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQecRp630w+uX6a/jRxQHRG1US8HMcRq2nv+bnfGhpJqC/1MaUtDwiRMnlbggnhwP23zNiNgJ3xE/iwzuo5W/auBsc5EvfTOAszdr1ohTLlxyBjs1HHICdYOpRYFH044uSRe4hYUE1xzQoDQ/AeRnleNrjk0kBw/6UMgSqezkO+ZY95GPtwaozHhH2QBe/LvvMbdXwv2KQhdPHcVQAueY7gep1ZBFdIALJX/Ap33lXNN1etVu91VKVtirlwUQ1F2D+K8nbpxHH9wszhgrG41mciISCYhJ4km2lZJO/ZClUn84SLA/MNKpY1VOB4xdbJYpd5/J9a0EAPDutZpme/phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9Ug8udOqIOOCaC1/rUTRwJz0mfUjUVclBKacaVe4mM=;
 b=iDQhaeJNwEuxO0Gt8cKp21i25SvnAi/mqt1psRAvbdtAXE5fzpPPOEOvojBuikeMgT9E5Fsius9bJkoOFIK6h7n/drQbW3kpAuwNDhnH18Kn+yquDkxUSzftXbPDQYmpZfpxUx8nizhB/Ri8aGMUiCIaEJnG3y4xdbVyiiIs0OgZyQKZm2gsApKSOu4yUuv3wqMQ9DKueEaZxIBHSozpIasKWmaH8wtQPdEEC/G0KD8NQ8K9fvbEPgCGRniW7w2IHn5lrjHleS6eKYnp/n8Lr3mvfkcG6kfsHMNw+/nsmwDxwxjcMzcjkAWIjKTmY51EKeuvL34BPMGtqsI35FI3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com (2603:1096:4:1eb::14)
 by KL1PR03MB7407.apcprd03.prod.outlook.com (2603:1096:820:e9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 07:34:52 +0000
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477]) by SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477%4]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 07:34:52 +0000
From: Sean Wang1 <seanwang1@lenovo.com>
To: Beata Michalska <beata.michalska@arm.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        Danilo
 Krummrich <dakr@kernel.org>,
        Lifeng Zheng <zhenglifeng1@huawei.com>,
        Xuewen
 Yan <xuewen.yan@unisoc.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>
Subject: RE: [External] Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Thread-Topic: [External] Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Thread-Index: AQHdKWMV98wMlqnYdUuX7xi9SU3GVLaYnmKAgAFhwGA=
Date: Wed, 12 Aug 2026 07:34:52 +0000
Message-ID:
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
 <anrzT-ez3b7uYaCt@arm.com>
In-Reply-To: <anrzT-ez3b7uYaCt@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6688:EE_|KL1PR03MB7407:EE_
x-ms-office365-filtering-correlation-id: f63f1077-b770-4fe1-3ab6-08def8443272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|38070700021|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 FkarHUsXohMXCCzAOEWsoQifiESKnmZUYhhmQJ61DrWtdwdBCd0j9//7tDWMjgGS6E/n3ZzoZTTMvPlDqIxhsMb3k8CVdT1H+aNbEelrshQrG9PwXP3VQnWKV3+n/DPBR64TsF9g0bgCbza2dZF6vzrkXd07ZdKjJSi4ICnu+KA+pMKALQBxiJ+NekCQ+pHJFP768onA7CLJ7cjBLe32jsBqNUEEHQ4gJhsC0HFa3MOAfpeXqsXzSza/bx8vXHOyUlE4cjgICMFSnS5kMTt9In3f9nUvNZP7RBAiR26j1YA6nSBEvTxs6Ghu6Q1dSdeDHZNm/XRiNnGpWNtCaD4IOOZE90Uo4bDxXWkdiEbJv3EVBvPRxN//6y/LaBooHivdhGpfAbnj4uRIbXNEjBi1VZvwdXj2dGuoulJNNSFeC6qHTWbWIRZrJE1mj0yY2pwB2AYCYyezszOPt4xlxaJ4mFVT1YBFiM/h3Tw6P4xtuzff0CmIwaQKHgwI4oPUuNAaxlTc+eDDDFHQreZ34QL0Axf3l5lYaXaC4y29uLvg7OubqdTkt6bJOYkpmzM5FTfVijeNXczHwAlB5UCmmBRGZecSWlSVHZO2pARvTTXInpFaCYewjpDMlz3/EmA6dDuSPpM6+W+03y9GPnHzKrnwoWyNYihyK0cEeIO8W8tOsqUv5P6m5S/W6oBsyyXtOAnlcZ0iY5m3itO2B5odvFHjgjmKvhCKXkrWUrSP+W2lhhQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?EgH0/UG3hTGdMefw7YIZtpgzArvAFhubAsl/Q5WZlq7bVnsn5P7HMJG+Ht5C?=
 =?us-ascii?Q?daQZsbBVmFqK4E1WCCmO2sUktpPAg5sXQkFZFwJ2vEmZP/8aQ+ekGiJUkyxq?=
 =?us-ascii?Q?n7r3aZLPJCaHn0rdQgBZwM8XXIPJRcDqA3E0BEysp4BOP4/lNYCgwg3sBVn8?=
 =?us-ascii?Q?GpH+TQu8rZC5JxztY2bmWUJvbbNpIwMMVWIiPDSrMLGeheporVoLrELNPjCx?=
 =?us-ascii?Q?bKeylAClrd92WPpZUNJd06RKMfwBDK3ab/mI/mTxGvWx2ud/RsiIdj4Uh+Z+?=
 =?us-ascii?Q?7I9DLh3woatQIW+SHaG4RWXWfetWBuhxuN2q5Svpnk/AEj8PBxX0Ln8JNrel?=
 =?us-ascii?Q?CzZUTGQ4e+rQZda7jgBIXbQAmTuWnHL7yWnAcPbju2GgIqRiJ4iRMBA7L7Yq?=
 =?us-ascii?Q?YQbOlUL8ZExWR/mt+ASD/6Q93voBQhwALfsb0NMclfVsk35Gc4OHUmAE5PGl?=
 =?us-ascii?Q?77Yy0AT10NP5T5fQ4J6uigIZyzaNrgOHYCCTIRge3DpDv658ikZJP4RODKzU?=
 =?us-ascii?Q?k18Ov/RBAslCLX9pqaMtwPUg3CvJQqIPq4iW3Ox1riXGtbH3kr/cBZ8eDs/u?=
 =?us-ascii?Q?u05QklNxfzr0WLQGDUaCHQFPR5dkcWlwe3y3Kf84qooab0TJ8Hix2bLR5ZC9?=
 =?us-ascii?Q?5/j453Ey3CgFLLy64CnhLC6R4C+XzzLkQUrgX4lQOnwlg34Xw/ESE5Im2h1f?=
 =?us-ascii?Q?qIQg592Ifteg/d+XZcAlioxWNlGZJtLT3wNnfiIQPd26ApH0vWz5cNK17Fdi?=
 =?us-ascii?Q?0UQP7EqBYh8N5QOLgIaEO5SMD+wVIAitLP8RUYncC5iRh4mblb59olLCv+Iz?=
 =?us-ascii?Q?uCA/bF5Ey5+NblHeG0wEfgPyskR9MlxQHnxaYHVwPuzJVsg5uTiTUjCBkYlA?=
 =?us-ascii?Q?jm17YBfm2Lz6YWMbmhECiyonKp/9WyqV1cY3Wx33/gPNuIIUO+sKbYV+gnkx?=
 =?us-ascii?Q?g6KaUoBtE5vPzfug2ZE5F4thUhy1Gj8xVZYYHOITmUOQiuGCW2Mv8TuOMZDJ?=
 =?us-ascii?Q?368IZ0iFu+wLWfZ6uI1AZd+sLe7cRGbadUmMc2zFu2M0WDrDz5bkB/YpGzu3?=
 =?us-ascii?Q?KEjm0uAiMzpFICuHxn9NMf9+pfGDk5+VT4tfSIFOdJqOGleLhO+pmlvC4bbE?=
 =?us-ascii?Q?uW1jo+WrDIP97ApHNY9jMLsLqO9tBUUqtzheoGQGCc4uVnBXbC7be1KMMUI3?=
 =?us-ascii?Q?8/1nVr+R6fwkb/OPpXiPEcsCnpT638wsiaZqapzn7nIzx8FpBJJSDrCHqc9E?=
 =?us-ascii?Q?b9lHafA6fURLoGpqihPcroaLAcYez/6cx0lX3+gGb38d0vPkZIYGTOnjGbFZ?=
 =?us-ascii?Q?aQ7gML3WN/aPTN4Fau2Oc8feMT6XwU1SfpbhZVpMX9TJ8Qb3+EVrOfP2OV5p?=
 =?us-ascii?Q?8acL+zi/V+dGPuF9R2n4fX/7jhHQ45I9FGQomFiI9qV2guUmlvEiWuHfMzWs?=
 =?us-ascii?Q?OzIrXs1yL0Fik8hkgu6eRx5I/xssRziHdrZl2wYJV8vYKEydKwrMaykJ7uuX?=
 =?us-ascii?Q?FinOgsaED3dWdCQ1pTJltBj57z0iTuxjhOypI4uofOW+PVKjmctvRDPgPoID?=
 =?us-ascii?Q?2g47vavf2DK3MUH6k4pxNwg01OS4PTjG2EsYDLBF28lbXlx2HBtCjjcOUELQ?=
 =?us-ascii?Q?hs4+/DTEpn0ZDuKGCz2eU6GOSf4Qmq1ph/LKujG56qI6UKHeOCNIitat29rK?=
 =?us-ascii?Q?xftLi2GP/g4kzjDkHxe0fqGayC+MP+SJaix7/mto9DZvvguxClINk64svdrL?=
 =?us-ascii?Q?tSgudmJXtg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	SsFdqfyO/IDrkKRK1rL9FSwa1fg9r0yBub+6aopq1lmmy3Y+x7SM27doyVq5UUWI7F9HKVeDt7sBJvj3yXkgkRbEgi3IHipQJQE5pIcY8zFVMHQLQkkKRGDqdW/aBL4C8EBYAvIi4x2XkmOa/n4yAeqJM/YplbDU6yZyFIV5DcJDiXXxH/eWtBpmKvGG+u43bjEfagoSQ/OJOsVoPWcC7qDnxYGQUEEC9yjoFXIg3hy7PrVYRLfWyWGxrezQ+bA46rsQRtoO9O5CUV8vmhO/k545sadhYk0tKBu7mO4Md5YGSWn/54mZfeV8X9SVH4Atwe4AG0knh0dYxsBwvxd6Iw==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63f1077-b770-4fe1-3ab6-08def8443272
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 07:34:52.0444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /20lJB5ef/1RyJeGgGC09QTRDQt3KVkLnkJIDLuHLkODFb+Hrcbu/XsgKIi0TdVZlxEGUO4s01t307CcWhtsJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7407
X-Proofpoint-ORIG-GUID: DjkgKny0FMhSClUNMtVfXVfYwd-Cm3a4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA1OSBTYWx0ZWRfXymYTBGXTGpiJ
 uiR8qppoqSC3v0Yos4/UbvmTwjhS59Oed3OJJx+2q6Dw4VDgo9U87xdhcU7+aNM42xIMw1feb6W
 wuq2iSBLBhp/cPuGwLLio2syaSj4iZI=
X-Proofpoint-GUID: DjkgKny0FMhSClUNMtVfXVfYwd-Cm3a4
X-Authority-Analysis: v=2.4 cv=JK4LdcKb c=1 sm=1 tr=0 ts=6a7c2220 cx=c_pps
 a=D4TVgLWKYpTCXR8XIqRWmQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ZyEuT479hi48zPIlagN0:22 a=VWe-AeaDbOxPGCuMFt8A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA1OSBTYWx0ZWRfX/qmcLHYbCxJx
 an8jSw+UQeIFlQJJKOwBUBS45AgOvNVQyN0DGlXKil+Y9NTOVu3yALLk26rkaLYAUihPmZLyuTe
 1SdrRK/Gq3ZR080DjG2k5Wa4EEy6PcioopXqEW7SxbnCoi1nwf1IaI0Qms5fXIscjJCO3UEzqVV
 QFSq3kRZl26WWZPbysRvoc10uh7q/FyuIkbiO+Bp4pASBZePqkhrdm0hY+mOXOwy/BuceCxOPwK
 kQd6zUw2lM6t/EBnwJNUqtdVH0MfsQRgizfyeENdA2kFFoMNlkFXsM8fn5+Kpv5887T5dHKhSYA
 CIYOmmoFTDGPHtES4mmFjuyH4IAwJVGDq7FXnTb2Xt3wiB7F6JRkJJQwhJDaNHX6h64g5dtq3Z2
 rD0JkBnuu19XhngFvsjVsgO3bZIPssxcNlpk1Ops7QtKvUMMOzBrO5BA/z68cMBcMNeyZy9bg+O
 y2ZiSb5oGWfjx3rDYCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120059

On Tus, Aug 11, 2026 at 06:03PM, Beata Michalska wrote:

> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
> >
> >  	/* Kick in AMU update but only if one has not happened already */
> >  	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > -
> time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> > +
> time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))
> &&
> > +	    topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
> >  		amu_scale_freq_tick();
> I'm not entirely convinced you gained a lot by that.
> It's one additional check per each enter_idle for case where AMUs are the
> source vs 2 additional check when it is not.
> Will try to figure out smth less 'invasive'.
>=20

First, I think that the rcu_read_lock_sched()/unlock() in
topology_is_scale_freq_source() is unnecessary. arch_cpu_idle_enter()
is called from do_idle() after local_irq_disable() at
kernel/sched/idle.c:340, which satisfies the rcu_sched grace period
requirement. This means we can call rcu_dereference_sched() directly
without explicit RCU lock.

I have two options to propose:

Option A: Keep the helper, but drop the explicit RCU lock

    bool topology_is_scale_freq_source(enum scale_freq_source source,
                                       unsigned int cpu)
    {
        struct scale_freq_data *sfd;
        sfd =3D rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
        return sfd && sfd->source =3D=3D source;
    }

Option B: Drop the helper entirely, check directly in arch_cpu_idle_enter()
If a generic exported helper feels too invasive, we can do the
check locally within arch_cpu_idle_enter() without touching
drivers/base/arch_topology.c at all:

    if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
        time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, c=
pu))) {
        struct scale_freq_data *sfd;
        sfd =3D rcu_dereference_sched(*this_cpu_ptr(&sft_data));
        if (sfd && sfd->source =3D=3D SCALE_FREQ_SOURCE_ARCH)
            amu_scale_freq_tick();
    }

This keeps the change entirely in arm64 code and avoids adding
a new exported symbol. Which approach would you prefer?

> Aside: I should have probably asked that earlier, but I am not sure I do =
fully
> understand the case we are trying to fix here.
> The topology_set_scale_freq_source prefers arch source to others. So if t=
he
> AMUs were chosen to server as the source for the freq scale - I do not se=
e
> why the sfd would be changed. That would require calling sequence clear-s=
et
> to get a different source in place. I do understand the issue itself, tho=
ugh how
> did we end up there in the first place ?

The issue arises when topology_clear_scale_freq_source() is called
with SCALE_FREQ_SOURCE_ARCH to explicitly disable AMU-based frequency
scaling. This API is exported (EXPORT_SYMBOL_GPL), so it is designed
to be used by modules or subsystems that need to replace the frequency
invariance mechanism at runtime.
=20
After clearing, the tick path (topology_scale_freq_tick()) correctly
skips the AMU update because sft_data is set to NULL. However, the
idle path (arch_cpu_idle_enter()) bypasses this check by calling
amu_scale_freq_tick() directly, so arch_freq_scale still gets
modified by AMU counters.
=20
This creates an inconsistency: the tick path respects
topology_clear_scale_freq_source() but the idle path does not.
=20
The goal of this patch is to make the idle path consistent with
the tick path, ensuring that topology_clear_scale_freq_source()
fully disables AMU updates across all paths.
