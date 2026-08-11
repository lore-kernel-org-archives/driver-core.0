Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155533002D1
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429764; cv=fail; b=c5QjdCESa5woOTOmqtwovZ3mPO9tTI0WW0nWIrIrMGcljR+b8Ec/B9+6ai//HDCRaBIE9pIWi/v3ysx6B0HLDSZ5yD9RiXMqmo+9sl69tIrTxKyyo1tteDXqjIQ2TvMAHqT8ufdrQzluHLz/HAiUCoyyKVtBy1cR8hyrf0ig7Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429764; c=relaxed/simple;
	bh=KPwoBfPzCcmkFzyL/hwo3EZ27Ir7yVbghsYxH9yNi+w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MlrMS49tCIFkSlNOpChLpyBZ/yiVjZAV1ujecxJPy4pePGTqpL7B+aw/uwghVjVsYSVsT43NeTJVx8aQDyh5NV7mBVi9OiazaIIfTT/0YP7AXx/pHJxv+i9EB9IJHUFDTrC2NC2hbuopYH2Jks5ZV+f8mQrf4keJW/hFzd1cM3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=SRnXtXW0; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="SRnXtXW0"
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpnJm174354;
	Tue, 11 Aug 2026 06:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=KPwoBfPzCcmkFzyL/hwo3EZ27Ir7yVbghsYxH9yNi+w=; b=SRnXtXW0pgsg
	hlYXlJ4JodfTgHbuyGGexhkZM2OYX1BFW5vfUt4Ke3sjxo4ACoVeOIeLHu+MFV6O
	SlX2yzwCLHQ8Qp6QXoqz+tQ6MBTIjaxpjjGEopoQMbnIDeV16essfm4/mQoOUDS8
	jsDL/57ofCSzeOqqRqVI6r3tAptGX2sw0C6dvSr2fhBgidu86YipLbMZbyPWs1hT
	CgttZlQjWgDu3BFCf2Feq7GtiQ6cXA1k9ykdZD0+7mPKC9DndcGXARM3ZvTTIwFr
	y2yNtSPdwDf4U0BsD1OB2ntzYl70AsACFqpe8ra8SIYkqT+OO8ui7XW9IVsp5zMh
	T/lnxlyi2g==
Received: from typpr03cu001.outbound.protection.outlook.com (mail-japaneastazon11012059.outbound.protection.outlook.com [52.101.126.59])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fxjyekhpe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 06:23:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DV+QzHZq81rXsR1CAtPllT/eVVcmVDHuni+XOIiFJXK6OHW9sXO6GrfWnhsNq2cqOjvW47cPAi5zu/Jsklk7fSmAa0qPWyv+2lRwNoupqmjWpIMopRscxjZG10ypbXorkB5QNpq+z6AA65DwybxgVYiqd+cRiU5rvLUq+FFRQcu6ETSErS2w6m7aVy38hhfkM9Z6qbugpRFt7zsGSjhUW5kLQR6krCUmK4HkA9zAjeULmf5p3I7W7hqPDrC0T8v/28U+Hk+UNIEWKX5OELngjfQMrIouWQNEIfcVmU11cQt+3aBwoRp+kcw4gnnZ0ZiCwC/viEyGbqiSD0ZKjaeRcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPwoBfPzCcmkFzyL/hwo3EZ27Ir7yVbghsYxH9yNi+w=;
 b=TPXewFBKyQoLXBIsPzj7hnIlOlYotTk7zFORG5E4Cu6O5XO90x6OVUD+elhaycETtxNpytfTARnXm/GBPbGXazPa8Ry5nCVI/vYOh0Zqg4O2mIQU951Y7qO86t38mkGWp1bNbAL4bECOlkWu25SJZfGTx2RqRukY6qqCtkPHutad6JcBJpFrN5WPf1TsV6vENu+FOvowqqJeo1B5EC0LioER+XkDHqPDbK5Li5PD/acu/7xwZ9oR+/5WVuKRK52xj3Ou5xwd0K5QHbSowj5rL6NW4tLdDEswcFng5mNLpcBcWD3vkVFxm7aWTo7EQfyHrpJbBYo/+/oBW8VpGuv2/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com (2603:1096:4:1eb::14)
 by OSQPR03MB8641.apcprd03.prod.outlook.com (2603:1096:604:29c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:23:51 +0000
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477]) by SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:23:51 +0000
From: Sean Wang1 <seanwang1@lenovo.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "rafael@kernel.org"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Lifeng Zheng
	<zhenglifeng1@huawei.com>,
        Beata Michalska <beata.michalska@arm.com>,
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
Subject: RE: [External] Re: [PATCH v2] arm64: topology: add source check in
 arch_cpu_idle_enter()
Thread-Topic: [External] Re: [PATCH v2] arm64: topology: add source check in
 arch_cpu_idle_enter()
Thread-Index: AQHdKLHXHiTL4ZWsYUO9LbkyEA05VraXJ+0AgAE52LA=
Date: Tue, 11 Aug 2026 06:23:51 +0000
Message-ID:
 <SI2PR03MB668892E97B453B5CBBF114C693DD2@SI2PR03MB6688.apcprd03.prod.outlook.com>
References: <20260810102006.9986-1-seanwang1@lenovo.com>
 <2026081025-rummage-rifling-982e@gregkh>
In-Reply-To: <2026081025-rummage-rifling-982e@gregkh>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6688:EE_|OSQPR03MB8641:EE_
x-ms-office365-filtering-correlation-id: 21456b14-99b6-422a-3337-08def7711cb9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|10067099003|56012099006|11063799006|4143699003|38070700021|22082099003|18002099003;
x-microsoft-antispam-message-info:
 1rMjpxAUzVgl4rb/CzBkyyvFENbpIFJj9Lh2tzqmihLbtS7lKURU/rdertG/8I6k/Wvyzg/190dOZ8/rtRs33J73LLxWy5y90pl19qL46g3CUDBijuAZR0T9/u1uqz3TMpyMKbF7czhVRRnKxK85bimhJbF1u935W0Z4Dgbv9Hz38c1sMmr+QnS8XDS9HN8v7g7NKDgxAblW+4IA1JM3wGYJBi2yKmwRITFl7w/B32txIzsLDSSgokfDyq35Nk0byNIxQPHC5p7qII2BhBmGmxVWbeRIf21ACgASw33asGL/SthaBVLFQ7eSJaGUpmDZEKbS0NJ/mYQLXHflY2PEAc13nNMFulk4L6CQKtbsI6w8Ux5wY0XTXdQI1MDTPy79rBHI8UlTRk8M9nIZBGSYhCbL+2F1+On7WOl8Sr6NqX8t60aUkJ6k/fkJTKvvL6cxUvP3wRXRS+vKXrHqgbGtrvsn+JT74flBFAOs30fivAjAfIX1KvleYGGDNxusSNO9qZ9KT/CCEa4iW5uasITd7SP2DPQJWneMdFscodA62rRiW0UjsPkXpYrY04golOtm6to3Y7biZ2DNHg3qrbmBcxhdeTyERkMWH5QENm2kBTj464SrdXleAbpnA6VLHe2wo0u9NOcEcvNX2OAUHw9BfqUO2i5mk3rI1Cif5+bhLVIDkFQdjgmzDGLUgyYYx6MgvHoOuvyGbThKP/oRvqi75ED9vT9J5mdhmzH/0nNvKu0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(38070700021)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Mx3ArxeK6Qexhkgckjab/ML6aKL/FPqAbzwaDAfxOM1WBcVTqV93TVAtmT1A?=
 =?us-ascii?Q?v3t9lXtFlg8H7XzAwYPkz6ijIBJP8544QcT55E0Zfil9PQ/tLmB8OpQti2Mh?=
 =?us-ascii?Q?+HTqVKwkSx7Nuyt0h4qbdyPLaxBhMvWqq5/H0XXaRbOHv+RQs/+G535JLTtZ?=
 =?us-ascii?Q?VM4ll21uenkeYLnMmuc1Z4IrZhuobdD1Ob/gB8t3LoolSM6SWn15m36Bv4Nt?=
 =?us-ascii?Q?zvkq+dqMpFepFshWh2lapSbMvBTKqVIhwPGckqpQT/11ukcD3Khhmbi8mNKU?=
 =?us-ascii?Q?7/GYLzU+E+xPLWFS8bZ34up2JxjyJZWE9IsN59LcULxZYgHY453fkr0CWKPk?=
 =?us-ascii?Q?g1oIF4u64qWVb8FYeIRoTjfsYYp1lVCGbPiEh4feC+02SO/gn7bS3OnYddwc?=
 =?us-ascii?Q?nwxkMEY6STw0YFr1atcl9o764f6EsMWJK7nyKsipkSp7QvwInT4qGM+2pADW?=
 =?us-ascii?Q?Pnc8917341RMKTlKEG3r2nil+maDeJxiCxll8rK9sBTO71H2J4fmAeDO5VxV?=
 =?us-ascii?Q?rqPl1IZ8LIutd1EV1IVxJ7Iq0kD7Fulnvdx1KyABX7Yt70ZAg3pYWQARFllj?=
 =?us-ascii?Q?+E0parngx5D2Adbv1UPsDqzS7KB1ONBWOBAJhf6TGUCfZMR0vpXaryCY0C+i?=
 =?us-ascii?Q?UB2PskqoWgKjeJojHF84P46EoAVHZJVXFz5sOc5cwdgECVi0XoXsDPK/so91?=
 =?us-ascii?Q?cWobP6f9AQfjQer3740oIR1AfCyGjP8ZQ3be2WkBS0L77Inxy+MAApscqGU2?=
 =?us-ascii?Q?NbjtOqjdEdNxBpGWWXjzEO0NpDQJAaJSV75HGIZ1uGGcVfr5yTT3tAfVkLxL?=
 =?us-ascii?Q?/BJ2j9xSICwqpuumY9Dc7DF7GGzpQDwMJU70mmSbSSs7VOPmXcllauqa9BXV?=
 =?us-ascii?Q?CfOKrrmvURDIfzenihaYnHUAgXToyA9KyORVY7Bhifw2ftavcdCVurKDxzBd?=
 =?us-ascii?Q?HxRXTEGpu1V32e71BFRZJS3lAaHSeACW94T/0hz1Ac2Akoho0vaRGg2Wlmy5?=
 =?us-ascii?Q?Kc799o4ZxDMmWt/Dvey6pb7kU2hYrkkepVxun5cPOyW01HyoyDw0rkO46f8O?=
 =?us-ascii?Q?UXX2dwFFNQm8A/I55MMsVucWByg16+eJcpYrTaUXJXS73YVrtKdi/1BxH3bI?=
 =?us-ascii?Q?kAIOhzlm459D3mVvIwUM/nhYRPy81Xuh6tKTna+v1sWbDk7HQzbZf7JI6kBQ?=
 =?us-ascii?Q?3lp2UQlTTYoXCTjJ6WGgZDtJNFsQ848Ffkxo1Tj+gOGz+/1NqMD3RntN//Sl?=
 =?us-ascii?Q?4+rajcybnp8P1dGRR0eAhYaUbZMjFS7Kf3vPVEogpidvmGM/bczORR9cFKmj?=
 =?us-ascii?Q?DL4/JCggYIGAkumbW1xGgbgIZxR0v+VHFgmBoRmLwxKcKsPDpMTQX+e8O/jv?=
 =?us-ascii?Q?ktozzbVrUFFVy/jOXhq6HFoA+GIa9CluznOuZyjSmvY/bhMna4yFisHRUG5x?=
 =?us-ascii?Q?qZ4DVAvPiZnTOqbszpDbfFNhMdfdqO4a0i/1yyJcodyJ/Eu86MqZ98+tiF8h?=
 =?us-ascii?Q?Hd8FIVj4Zdbu3BhUMt5TCZX/2rKx3+tgbBm/318P1/5L6iJdxnMIuge18rLl?=
 =?us-ascii?Q?bGsV25dNP6XOHnjDWKOrQYvgmjpAsWAf2nXNh24T4bNTkInJr2gbItDHWtfd?=
 =?us-ascii?Q?1qG7YKzY4RM+ZIhMlZggB6olXAT8NYbP2Ri3fBBOpCpgqb0u8PQPhF+ip+g2?=
 =?us-ascii?Q?cWwXo05W8rEpNiRPSDBItVLoejNeoxc89WtGiD+KtpgA3EyI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	grR0idL3MA8bisAMv82TYjedi/rrrpOQ4DDBNIhPSqlHYVwEI8JfAuxJPqg5KMf81UVypSDLQG3eJu7vDEOCY4/y0xK7p/krf2ZPGmEmrGthx3l7qwzE0PEMr+I/jGgOXRvU0MFbvICtGs0XW1BeMbKQy/qwRBANRpaJAW28rtb/gx9uZS8Sao+n3Tl3K6dLZGsTLb2R2Z5/l+KGy73t2RtL9ji5/6yJoulnmXsC2sr4pmJJOQTpSqN/3TNhVH8e8EeFbEsvuwt61f83V3OKp487nDW3PxaezhZ/zjOmnOw+UypcFrzNusHGuut0dNTnp8l6rs/JnkuYRcagyqpuWw==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21456b14-99b6-422a-3337-08def7711cb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 06:23:51.8092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 50IZhtwK8VtwXp+GwhWzvZczNfqTOFsHiC1dSC/8sjvLuR3wXfYpZUSN3I4ZJinKPvo4YEcPD0DElFdiNA+Wvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8641
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1MSBTYWx0ZWRfX3jlp/7EHcYnJ
 Mps7ixYzbdMCJ6f+lDpd0LguhV6Q7I9HrRWEIu3l+fYXzXMzz7dr3mE2RLx+BEZL/C8UGe9daeo
 je7f75zwhZnoV+0Cp9Qngv0sjvXb9JBWnsmL5MIC6+I0kRJzktZ2DQOUsJgctI0e449A8zzzELL
 YHyUadiyQB6kcXGvmUqs8suJph86pt5XGmyM60U4kNVAWzfaN/W9NGGPSVf8BKZniKU/W6AIJ2S
 tj70WIvHp9owRuRLB7nE+V57VIRYcpLF0h2u5655nMu2DIpIm6eEqUjFHq8ln0be6nwaSAo5kyy
 neeaYqX3ZKb8d7C82dbs5KtAdi18jcCSJ+2h+2uNXCrq7ufk2xJKqVo62KVmO8WZ3b/b+zLjdgm
 Mc6+rbj3lpZqvVj6jibfh9te1ODWg5YZjBIVZCbG+8j+kbyUFWWoBGqz9fJlsFN2+XFFmytYIKF
 V3V03zDsw7PgM4bQ4FA==
X-Authority-Analysis: v=2.4 cv=MPZQXsZl c=1 sm=1 tr=0 ts=6a7abffa cx=c_pps
 a=dWA8KMk3b8WE1g1edsQVTg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=1y2EEpdC1CS_LWKgGf4A:9 a=CjuIK1q_8ugA:10
 a=QYH75iMubAgA:10
X-Proofpoint-GUID: 2OACuZnGCtVGZQpxbAlOtt7ADQNrzFaO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1MSBTYWx0ZWRfX9i8qOH4DPPAY
 X2DdwooS3vKP4X8epGWnhCY1QJeFPpc1QpV9TWRp+VvmYQfTgkjAovmBnhLPfK63UMHGQwqZMmb
 aBZ0sPOL2ixqf+0g2xYn2t/wbDvdDfc=
X-Proofpoint-ORIG-GUID: 2OACuZnGCtVGZQpxbAlOtt7ADQNrzFaO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110051

On Mon, Aug 10, 2026 at 07:38PM, Greg Kroah-Hartman wrote:

> The From: line does not match your signed-off-by name :(

I'm sorry about that. I will fix it in v3.
Thanks for catching this.
