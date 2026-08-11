Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0738B261B8A
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.152.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429162; cv=fail; b=cDNjOcZEluWYHvF87ZcCUK/IwRtE0ia6e5WYSz46dWeHLIL+w0HYO0Jui3Wn+t6SdFe+mxIqW2aq1cZhIv2a+VV9mJDx2yK0NAg5ulXfatzy94VLXFCIX4lRc5oWqw+sT3vbqxoX3bySe/jn4HmnAggdSeuHsgWY8phRkof887Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429162; c=relaxed/simple;
	bh=1WkHUl5XiylJC7uMb9IAX/O/twqhuyeLMPO3k00PdkE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GeSGPj6z0xYdhlkehKbOrZ0lLU09yCxf2jPtkigG7L/aKPTmWTZ0GJcY9Spz1ie02vzdvskxvSW6uy6KzMt75tNXXuDr49mWB78fBVIYVxfLORVZc32/XLgylDnOlxM0l29O1uWvdVzWC3V3uLwxj4zWDJ4YNroHwcqcc5CIxqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=wgJPKteN; arc=fail smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="wgJPKteN"
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqPTC2971078;
	Tue, 11 Aug 2026 06:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=O/AG/tnSA4+jY/yLBHaw/OyhUh5whkN6blndG2s0m3s=; b=wgJPKteNal55
	do/TxwTsZ8+7OfQq+Ou1QN6QRD1sKDxi+w68XavRjNHFX9bf4tEEQRQyadt/RJoa
	Fzr5tziqnKmd4decxRdKnlHqjkLxG9o+t9QoMA5rdwQz+HWTb9/gnaSMyTrjlCBz
	fLw0bdxrYfOsc+a02N+7w3YDOMyewfN1LYUyMtTZ+lowS7vTqxhbBIYEOUvvLRns
	jEbz6qONLLcHZEjFiipgBT44QdRk5KHGMIlye+gOB2xCW6D0LFqk7DiBfKutyAaW
	rO0SBjPeZFxAZ9t+XrkU8xaYkaELzvJ3ysziZWUjObIq8YV8IQZk9r4TuX6ETQWC
	HSQ71RME/g==
Received: from os8pr02cu002.outbound.protection.outlook.com (mail-japanwestazon11012018.outbound.protection.outlook.com [40.107.75.18])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4fxhjeugjh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 06:18:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4woM6IELOuTkf+ofaWG0r/lBAvk3m5+Hpj3iwvrve/cvV+l0uLlkUGY50DqZqkAkuQedG+12TF9dzOKDQrGFgZGKJQpSmNkUdWl/NAGy+3p7i78CqP2khA4MUFLDcROHvw2TAs4SeEDDLYWjqXBa6HNb84L+uMrKmBX7ha6AnvaGPgtT5JALIHpJQ8KYryekIjc8z2sr8gkzRDgh7OlBSKuyrRiLZCZODqLcYm7RaSBvm13k4XcIQyzchx4XdGFOOBISRARd2fIGEC1SO5WRdRjKkjKVfwSJJvHGB4YwCWni7G2Ph8TwEjkqjg82qD3rriYomS7722lPGwS2Xb7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/AG/tnSA4+jY/yLBHaw/OyhUh5whkN6blndG2s0m3s=;
 b=j0U3LQKiq3vXrr+YoLAMDgU/I7ZIoY5b7bZOVttyy5vsuyn2yffMiksLA6jJFDX/6+B1V8YBVq1VS4u9XJTNmj0/Hn2HyIxEKcpyHPUAQDb4RY5K++7kx68ctYTcvNxRi33ekGXXuiamZ26IYONu1nPqagEXH3fpTwtSLJwugzheciBuHKqge7bnO34kfLV9GXx7UZp//2vqXOHrpTsx40eQk4XuajikpF4IvHT8BzDguvSJE2YweymbskTvkJ4X9tAWJ76qlOaM1gmkvaZdXJv74a8x2y8wrSvipjSGXp8GSpBS/k9D5yuP/Nba4UJYgHu5/oXpho84hP+WMElJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com (2603:1096:4:1eb::14)
 by SEYPR03MB7986.apcprd03.prod.outlook.com (2603:1096:101:168::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 06:18:35 +0000
Received: from SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477]) by SI2PR03MB6688.apcprd03.prod.outlook.com
 ([fe80::7943:fe42:e5e5:f477%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 06:18:34 +0000
From: Sean Wang1 <seanwang1@lenovo.com>
To: Sumit Gupta <sumitg@nvidia.com>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Sudeep Holla
	<sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
CC: Lifeng Zheng <zhenglifeng1@huawei.com>,
        Beata Michalska
	<beata.michalska@arm.com>,
        Xuewen Yan <xuewen.yan@unisoc.com>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
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
Thread-Index: AQHdKLHXHiTL4ZWsYUO9LbkyEA05VraXYcgAgAD9Y/A=
Date: Tue, 11 Aug 2026 06:18:34 +0000
Message-ID:
 <SI2PR03MB6688AC0AC5010552642D82C093DD2@SI2PR03MB6688.apcprd03.prod.outlook.com>
References: <20260810102006.9986-1-seanwang1@lenovo.com>
 <02e5d090-ec8e-4f73-a298-3439e2a9ba37@nvidia.com>
In-Reply-To: <02e5d090-ec8e-4f73-a298-3439e2a9ba37@nvidia.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6688:EE_|SEYPR03MB7986:EE_
x-ms-office365-filtering-correlation-id: 8b99dc19-ad6e-48de-dd79-08def7705fb2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|22082099003|18002099003|11063799006|56012099006|38070700021|4143699003|10067099003;
x-microsoft-antispam-message-info:
 Dw5aIeCvq7lWlaAOzPSy2Ounm3+vgFwp/TFZZnXuQEsqk6QB7UHzGUrnXjQB44Pm07Wa8nPLH2OIJD3qwPzaO+Banm2dRtGYbEmpv4UsYpEvpTsNStWXM7JSo3xU2tU1ACIPH6Y27yZLuWPzixQey7lzq7NHLtCEBSw1deuoKc+dvroVw4PYK/6Rlv45QTTFp2R04F0Z8ZHKLa8zND1/bXu1xZod1+ffAqf+Fon74MlCVRsGWcHxmx2PlxSiD/baGwNkxqqGCT7NKFKE67VpbhiZEyNL6sskrBydeKhweSnQ875AhbuoxBOd9fx0YV8b9Hevh+3frwhX1stspS8ak4AXfmmOOvdILInel+uHuAiTS9G8n4NehGIM4KvUAwAICw+WuUjW/v7RLe2Ojfk07D3IxC11t1XDv1WOT6t66+yJXeBlFIdPzRe6L13lG4T6GJfige1V9RmAdZQ2BcKkbTWG1cEHk2q5lUi6byEzNVy7BrAY/75593H5t9+Rgu8DeXCto0c/2L4hcRobd9Pt/ZGMq5LH68PENRVXlpDQsWpdYMu3J4Aue+aU5X9dPUE+CJkApchvGiZOF9Ew+UhVwVwsnbbO+ZPBQaSWwW2mUJXi4XBEUHsjD1wEreSHXeyeAfD/OOhwbK8yIi5MiNHds+8igximYs5FFIPQmFR9kkjbwtY7dwE4Ttjl9HVgeJ0aj6b8MRsIUOWAuIaZq6a8FXkwUGMd63ugmZpQQmzQNoY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6688.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(38070700021)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wOk+XwQ1miV/THS0lTKlBScsro77JHtR28i+Rg+B30IHjr006TJDyxckfK?=
 =?iso-8859-1?Q?jix21+zI/0X8+2Havou7pgInT0dpfBQsXBr/bkJY+tg0IAGQW4ZAzwpAt1?=
 =?iso-8859-1?Q?Tl1g9ghLqaALv5HkOmDggYBwpYq5+KYa6BPKIH/h7+1ixEd/fg02KKT3OQ?=
 =?iso-8859-1?Q?0fTNPISKjPjkCjD68tfP514p/APFvtQdUs9lgZ9dnFInnUfkiObJWLyJZN?=
 =?iso-8859-1?Q?L+794pHPzAfNQq7j4VNe8Y0kp0nulffCKFW5vrY46DoC3XzlqWiDT4/Fdk?=
 =?iso-8859-1?Q?ho3zlSwAL+h1WPIHN3rrTTqdbqAHbdtBWjZ+miSIDnS33Tku9oLllQ0taB?=
 =?iso-8859-1?Q?mceOOtiX05v6QydF7QheNBNjpmgUpxc2VRWjmi2pVCHeSY/GfGB2X4ENNy?=
 =?iso-8859-1?Q?+a8YhbZdh8cWRXkTlTNNpHYssu9XG4T3VQchZdkX1jgQrAR3kWHjHxiLmI?=
 =?iso-8859-1?Q?ubFt7ePoGqmNdwnJfQV0SwxvdIcIfvIx8+Keuw9b+QUICNAFRJsMDwPtgU?=
 =?iso-8859-1?Q?5GjsADNi7BhEVf0tE72Ybp69Ok6Bswrv8AzTWEbrL8RArFwxrjO0bLNaF3?=
 =?iso-8859-1?Q?uoEKhHhuHa2B0bDkEDI4zqH3Xy1wiycpIAayrXRGFAlWGykhSr+xgG9TEf?=
 =?iso-8859-1?Q?KPJbCHoH94uF6npUwAnar4G4Yq15vpAakjHzRBH7jQi6vgjGqmMCX7uEKf?=
 =?iso-8859-1?Q?HStUsO9n8JNPQT2p7ejtxN9I2hXBQgUSqwSlWtjqWWpNWgoecKmPlzox6T?=
 =?iso-8859-1?Q?es53faRBBDdtusV9vyLwFhxyL7HAGQuMavAp0njK5Q6fWplYWrNTtCHb75?=
 =?iso-8859-1?Q?p43fqI+4HQfxI9Cwpq+C4FZAo9zuaNJsg8pwXD7VxZGfsxF6sWaYULgxpf?=
 =?iso-8859-1?Q?+SkrqMx7SBoyULICSjq+NUwyd0EAHoCm0jndAshIJ2MJ+GuuMmYV5ddHPb?=
 =?iso-8859-1?Q?MkfAvKgumDtsFNFklMYXhEC7Q2S5tsd+mnzCM/D+5Db9L2tOUpc+dyj0ve?=
 =?iso-8859-1?Q?ae5Bpearu7Xvi2z046MI0rkyA+ebuGN1B4lmPRIy1C101o6hQSTXBYhUmS?=
 =?iso-8859-1?Q?5tcTwL4bz0GnPpTCI0pKOWCGdoggUFXSFQN0EA6fCA8nlvDWYNyACS4tQr?=
 =?iso-8859-1?Q?+x4rJv/JtdlWWmG+wpCP2JMGJR2HpgnKv+N74y+0N2m/uLMgSX1Avpspej?=
 =?iso-8859-1?Q?AmK/9DR7FN2sEPyijmtyAUsXpTM7mBFz0haBoxiN9aWCwFtKRe9cCXtrXo?=
 =?iso-8859-1?Q?ZQogtQ0xvepXTtnmArspGUvCgG1HOPIJ2/lC7Jmxjf0ROPzUbKS1N4/uk5?=
 =?iso-8859-1?Q?CWPYlxLFvvyjpB6vv3W3LFyzS2ZW1+PnFdIx5HOcQ7LVnBILM7JcXGdyUW?=
 =?iso-8859-1?Q?6OQVpKdGKnfOhaZY1tGVRG349SiofmiPPa/7tbcgZcA/JZncsP962NDY3F?=
 =?iso-8859-1?Q?uEWL2HuWDPj2B/HxKJz4bf+U8hF/wKJr76ERSgSfgRrMJ0DsBlZAL4/mnU?=
 =?iso-8859-1?Q?D5wIonqUf0T40/Ddlx6LwK1hflDZmOevpiGhLZGgD9uP8/iVpbhfQpLGPC?=
 =?iso-8859-1?Q?HAbKRb6mYPHJvASrrIt5ajtw12a5d3n2+VDgzycht/rJB8yiWHqnAmofCJ?=
 =?iso-8859-1?Q?C/g57zo8hWFqQAICoqrXfHWHiJ7PEv2GNN7pf77O7AtxVhNw+j52psJP8V?=
 =?iso-8859-1?Q?sHQMPINAs9hJyDpt6fUjr67AN0bsZSiEd6wMn2UgzswjXSdFmSo2v5cjPQ?=
 =?iso-8859-1?Q?pDuMb+7z/YYa9y05nwvh9rT8lFRxeI1sPjmi3PxnhJYj+9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	rnu8BaB5G770mt7SsD85SatjqqBmNsFNAkjJD6twdjff9KYtW6tARrECTmn0PB39Cw4VsmJ3K2Bda7h40r5lR+8AFxU6hLU6o9cj6b3l2MkGoHX8r3SYrMdC4Q9VEHG1IxQxgDiSK6cHwRVRZH5uwJX0Xks/15qf4Xz7o7+CO9HQOJgElazxh1Empi040Ms6Vf6d61pdAvEzkHrVtf9kwga+kSgqOifYK5OF+C7u1o8jSr0qlxRsLaQflfmV6c+AxGBSNKAdmHFPDCt1uTRMlCqQlafdB55M+u0bhqDvkIWJhmWqyVxPf8C9YRm3rmI9mwjL7uIpklAPzeGgg5ol5A==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6688.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b99dc19-ad6e-48de-dd79-08def7705fb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2026 06:18:34.6784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eHXxygpLAzTPJtAI/uIdUvSvXZR+1zsWiUorD7rVizn8uouM4garFHswbjQ1bilLItu2VflqWWzgwzZFUoxskQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7986
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a7abebe cx=c_pps
 a=S04CvH6IhoR7DMoStbvzrg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=faLMhqsB0ZTpFNi-tw5Q:22 a=8v4uuxd770zwEpo6-OgA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA1MSBTYWx0ZWRfX38X/H9scNZvo
 yNeJzdeZ5t2d1p74uvgy2q4MsW8yopudiZypehxreIvTfetwcMyJYNtptYYo6zfc5Ddlm+rVAVQ
 LgUS+17bZd+t7g9pwLuQrbQESMuv+hvvFhPokIx6OuaP5swnFATV5J0yprsvOC+dN40UWAE5hGB
 2yWnRP7Qpg3V5vaH6FVPT4sTK/p2wWHobb6DZME49Sb3mmPzHOVSld69FT4NKtcWRmtBrMYsUvi
 aaaHcNExr8iTU4mOlQEyPFIweiSUBgEwRjcyW6bOFpjip6RSPfWxt4uva4gCeWe2Ge0iL+GXUmC
 J0Ap1wZiuc4AwDcutLxruwxuf5ttazXjyWz+ar+p/Hyff7EUyKfW71MFQMir2B5UO3G9HbZnbMI
 8JQXoXniLPDcg1OP1ZPwEggBbHXqhgrDXj99NFfagsS3c8E/9tq64LSMjmaf2GA3MEZKo4m93Sa
 LhoxutbJ1lPI5T6vCaA==
X-Proofpoint-ORIG-GUID: l50_JNbz6Bjd6NoUNIn5gjuWjZ0u3Qw8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA1MSBTYWx0ZWRfX2jVX09RM33iX
 TohBrXF2RFa4acpr4yLlwzNZ5Rbm8obtR+tSOa9saUmmF6M4XFrTLbDYoU/wl1dPjObaOxt9Beb
 W2Fg1zMk1YqC4kHeNcmE6nyoAYVESHg=
X-Proofpoint-GUID: l50_JNbz6Bjd6NoUNIn5gjuWjZ0u3Qw8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110051

On Mon, Aug 10, 2026 at 11:05 PM, Sumit Gupta wrote:=20
>=20
> > diff --git a/arch/arm64/kernel/topology.c
> > b/arch/arm64/kernel/topology.c index b32f13358fbb..cae5da68d5ec
> 100644
> > --- a/arch/arm64/kernel/topology.c
> > +++ b/arch/arm64/kernel/topology.c
> > @@ -173,6 +173,9 @@ void arch_cpu_idle_enter(void)
> >          if (!amu_fie_cpu_supported(cpu))
> >                  return;
> >
> > +       if (!topology_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,
> cpu))
> > +               return;
> > +
> >          /* Kick in AMU update but only if one has not happened already
> */
> >          if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> >
> > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update,
> > cpu)))
>=20
> How about moving it into the condition below, so we only take the RCU rea=
d
> side when an update is due rather than on every idle entry?
>=20
>  =A0 =A0 if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))
> &&
>  =A0 =A0 =A0 =A0 topology_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
>  =A0 =A0 =A0 =A0 amu_scale_freq_tick();
>=20

I agree with you. It's better to move it into the condition below.

> > diff --git a/drivers/base/arch_topology.c
> > b/drivers/base/arch_topology.c index 8c5e47c28d9a..dfc2574a5588
> 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -127,6 +127,20 @@ void topology_clear_scale_freq_source(enum
> scale_freq_source source,
> >   }
> >   EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
> >
> > +bool topology_scale_freq_source(enum scale_freq_source source,
> > +unsigned int cpu)
>=20
> %s/topology_scale_freq_source/topology_is_scale_freq_source/ ?

Agreed, the `is_` prefix is clearer for a boolean check

> > +{
> > +       struct scale_freq_data *sfd;
> > +       bool ret;
> > +
> > +       rcu_read_lock_sched();
> > +       sfd =3D rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
> > +       ret =3D (sfd && sfd->source =3D=3D source);
> > +       rcu_read_unlock_sched();
> > +
> > +       return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(topology_scale_freq_source);
> > +
>=20
> Do we need to export it?

No, the only caller is in arch/arm64/kernel/topology.c which is
built-in. I will remove the EXPORT_SYMBOL_GPL.

I will send v3 with these changes. Thanks for the review.
