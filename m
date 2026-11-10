Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305658;
	b=EQlgnBGe/d8f69t7E+1xynViKPBJNm7T1HzNvdMbCXZ4dQS2MKPO5h99UmVGQKEgv2dI
	 QUQk1H1HFvl2THo5N/3lUnCED7TGeMZNAHEDac+1m4dJ7Kiju71p9mzqxbqRaHkb5am5R
	 jNCcjCBuBJQG0o86LAjFWRKsUVaHiXoZAgYmwFFOXM+xx4bhveI2BwbKKguUCgI3Wbuic
	 LCLIzrjmmi5G1Y3IHcH4gtW4OkZ4Nm00j29MgyUdP5pQDhNYsL+r/4mzxNe+VeSa8H6gs
	 WeYIUNE9eyCaLi76k1jHPUiwyxKOIRS8fhTj2Uxg80RlgmTXrACsuNyBPckVBFkbG2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305658;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=pdazbLYdUIollDnqICevUxDXNcbujtCWwOdn9i709dY=;
	b=1VyXtXbIJ4tD+dCW8hE3H4r/s4thPQNpBXpnBTEegDFWHr0pNee3BCyiZ4woZA00IyU5
	 TiaPWSJoVTO6yrCdQts6QO4JVRPD9vR1PTShgaV0dEyoYsidGmDnkp+3fhLfnVMIpEduT
	 yxIXXkLdOJM/3Nd+CB2NgEqRuaJX10MC1P72m/eWAVbehRPMyAx7vaRysC/pbQqLFwbjs
	 WItAw82QbfFJKQMcHLZspF48rDoPFfTzsZETQ/3p95fSX+JNEqZOtg4VY4uxC3NafJpJ+
	 g4WeUq7DECXHekWM+aWSvD2BrrlRU/xAAKLbN3XROigemUaxVSikj0FSs37o0j/muqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OzWJlWaR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.25
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A1606AA76
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 10:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693A1606AA76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OzWJlWaR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVP0cwmSyDR+TvV1S4LgI7uLIDVGDKSw/fiRFUOb5J6rbAfK7cgOzU0vmQ9xY602acIR9ztXx/TXG6ZdUwx02iXNsEF+wFpO7OFMWewdAEi9akTHgyO4yi8Jb7qZfotWkKUfERXEdBLGcGLImey3Q7E8mN/E2aqJPUDjd/1k7SoNK0Z7/FlUpqsFI0aj/6gI9A/L6zNdniFC2pr3T4gRqqwI6avwxC0c9SnD9F2XdILsOC8wRzdotNXSAMzFg6HRoiI2IygYpJiFGuq96Pctk6BiyiikjuszCLhZ2RDxn3NB4R/H7+5loDu9EslUVnnemeSYgZ5ltM/Tngro/u14ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdazbLYdUIollDnqICevUxDXNcbujtCWwOdn9i709dY=;
 b=JBoI4rOAvzwWNmwY2gHdYa50QR+S0i+1v54NP25JoY0MMqkMOWgBqoCzCMJbCGlwuvLRIF1NUiYIDL3Z7LfX3r4p94acl7YiO4LlpWCT7wRSssiULg4PfJGPfRaoT6+IyHBgb49vBYrT/jZmw4jLGsEo3aXDEz+6eV3CC7h58Psp084O4/f8xhDharCHQypnh4wmIaYI3SFUsFBBTZ10MRreF8iuOfSyXOAIpI/6NeEeekkYoT11PwoNTHPycAwHZ7il4V+iZ+QabzYTgjg1Ruhqe3w5DMuBWBVN8guSNCIhERFo2opFVC/EedvBaO7ooV415O/oJ0lRDB7WYdD6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdazbLYdUIollDnqICevUxDXNcbujtCWwOdn9i709dY=;
 b=OzWJlWaRwUCfISheuyk31mVHEd7C9NkyBN7kpuE7YemvIReOCCNszuMaMqNh0DpZlsrYrnXJMIpqs6K5mm/+KEvWNTkR9SivGwAP9/g6yF9AQqo4J0ZTXzoyuOpnncDMW4oYM/cwwoL7ARrnYW43uUDhPNix6hAbu2PAjFrmaDTbEsFWMY9ShLdwJEjW8Dv4ERTdoPWWpEYQ0j4NZDHeUYNdRafYoqF/PMGnM7BbPBayIi9jmzhm7SemHDvwOoC1I/HJvpoKWsQbgm0uv/blJyWMxE5Nj5c9/9PEgsFlrWDzG3+alyodtcPBRNvOBtw2MwCUiKPKulAPself6owL7Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by CPHPR04MB612808.eurprd04.prod.outlook.com (2603:10a6:380:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:14:14 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 10:14:13 +0000
Date: Tue, 10 Nov 2026 18:19:08 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v1 2/4] regmap: Drop never used devm_regmap_*_free() APIs
Message-ID: <avLvnK8wViBbft9J@shlinux89>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
 <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To DBBPR04MB7883.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::23)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|CPHPR04MB612808:EE_
X-MS-Office365-Filtering-Correlation-Id: a234ab32-d959-4ca7-cf8e-08df3f135ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261022105027099003|261022113327099003|261021135927099003|261021130227099003|261021121427099003|261022075727099003|261022115727099003|261026130827099003|261021123027099003|261026121527099003|261026140227099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	PApwUTyyomojouWsKf+cY6KT1Yjb+yweCKe1caLk0wPzqbHghVjilkncADsEHaVceAogzTicaE69fgiBBrVGPhDZzShjNOv3n4Qdr8PKwFG2TpZv6sTrYOftgeS+Kd9w9ZZ41QP0EIu8MDqNFiNXeXC+0+1d5LhKGjT3NgehTA9H4tGRekaqwexmUWHk7UssZDbNqd0XyMBjjhBoCxyAqOxFikllnHCVMAkJOWAbgPT7hzzaFar6QuR0bmNIexwfadyOqX2OsbZUb+Qtg8ovCyLZmaFi37s2Idrauoc2EhcW2zDRchiLKZdB085/d+EnvVjMnKjjv3WcmptuFg0MFBdLWA1JAZoaZxfbG51pAZbUNM/C3q9T9vWjYtwBcrRkKO0d3azRVJGpUcB5RdQRqJbYTH5oEPZpY8UmANEWTXu2tpPCneW1marsEU0qf/AgcOZxdixU5pW6gmImV6hqxVDIExMvq3jxKa57RG+UrTn9AEgXn6PIOYnWUuUSDveZLkayFU+geTqmZ+6A2vJjlmBm8hgL/jQhLYB91MAiyoR6ZdgV21ZCa627EV67IMSLChSkIyw8GsLrQ7IPCABL1x+6NMXdodgrq0/otvJmI8xXvnW3CKFAxBHDvos6kd6Vjys8jNhB/dVAJQK5F+BBg+nNG72/opryR/7CoxCHdg4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022113327099003)(261021135927099003)(261021130227099003)(261021121427099003)(261022075727099003)(261022115727099003)(261026130827099003)(261021123027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vK7rEjRjUOutTwv5A3S0PoDC4z2VR4Ndyca0rYXqp5LiuAsRTEx3era6c2cd?=
 =?us-ascii?Q?qC4H7OWOWeAKk57EOVlbosfA9mva6jfSb9uO7PJIVlbV+13ob5MZ/+A2mnFP?=
 =?us-ascii?Q?ocOxAOA7Kfr2s/OGlBHZw9HPktg73fR5mWsGVrVmxtsyK2zxgmk1rnbPhe0p?=
 =?us-ascii?Q?e4+Zg4pLeOKhOojz8xGj1MjMJ+VxauQ6oEkRnCP/nW5yCtYqbRW6gOyDY5Wa?=
 =?us-ascii?Q?GoVRkUknM9aHAC3QOx6NbMc5zN20m+Iq/+yq8BJ7+4sFa8yMnXwbFpAXlDN4?=
 =?us-ascii?Q?xMy186QSfZ7jdUw1qnU3SYWRhIypmjKhDVE9+Dc6IJ/Xpn0VyYP0UGTZsYPi?=
 =?us-ascii?Q?OZNQopXUl36kcGOco+SZDVrDpSymwJh6BOGPz+P5HX6fsF0X2mupTkSLuVTG?=
 =?us-ascii?Q?/EV6vxWp+dLx9ME4+STkbFXDoWXSWAZBhLn6yVhf9xUwT1MhYb4CHPAYTMto?=
 =?us-ascii?Q?3/SWCGLPWEiAjhYtkZNNH7UNn8vDyIv6MBBfIhlwf0GDAVwjQg/VHytofKuv?=
 =?us-ascii?Q?UqVCO427Lsn9JmlauuEhV6j8Z/TbFr2ho+lK8/Qj3bFs5VX6RWyoPYfOj1sM?=
 =?us-ascii?Q?KpqpnwaofTzLBtlmqcRpKZyw34EU1J7CZYkOhEnUudhHyjDmumg8d1MVsgO0?=
 =?us-ascii?Q?h4eG+90DlxuEAMZd9bi3vKz3ekd0QVmgj8fi9aGndV/YpF6PZaEE9wg0sTsH?=
 =?us-ascii?Q?14blVIpsk2s+OSiWVEalyEVVHnGAzANwU6z8ebSgZp9Mrr7nIm+QLL5asA8q?=
 =?us-ascii?Q?KFgDs+g+GFWhqM19Dns9BrHcnibnLl1RdeDZvJDyiz1tEzOjnugUXqXLz52z?=
 =?us-ascii?Q?VUU1BatIObF2sJO6nNxzaVjU3bVDB7yrC+f7OIAfurtjOakfGC02eaeTwkzG?=
 =?us-ascii?Q?/JuXVGk94NPGUkYkyvNCERDiA4BbHCSpzJXHGiGjj5UOwcTev4sYppWczWw5?=
 =?us-ascii?Q?FZdJUCO/1ORlaS/LyerQxpf2W6xhQZiYRhZqnR05Eqcd4V8JmRoh8S5gUUtG?=
 =?us-ascii?Q?YWcPVG1OLGNhPr0RI6fjPrruMnTjkQDtFLOPj+7NnecRsYUSq9pZDHckO/Qc?=
 =?us-ascii?Q?HPNlJ/Csl1kUuvi1FchjUl0L+5SKNFXzWlLMszS69vU78x/tIBQRiF5eKLsl?=
 =?us-ascii?Q?/h5JNyuGjnHkY4UQtffpxJvU5p6Hu3o62qNwQhwqd8tIXO/nHwZL1H3DXPF1?=
 =?us-ascii?Q?w99mK+PlgEh4W338xsxXy19ML59mPOkjkaeRIXhfz7tmmiuazx+UquPJp3LY?=
 =?us-ascii?Q?9zbpc+M6evnkty2dO7sHqQAXMWq5LKiXBVfoGZ9puiSxpjgGL3uep+8uhaZh?=
 =?us-ascii?Q?KfOgbUnshG43YK29+o5jpzqkAb8gKu3OHiSA6EzA1Ivcd3bEQcFrrny++96l?=
 =?us-ascii?Q?5z4f9V3CHIcnfjQXUAl2l8G4orOGp+O4FolwH0Plit27wRJEU3ZjDvv9Zo6d?=
 =?us-ascii?Q?pLvp1OIbx1r/oHj8m5nkWq6hqkNr9p72zkiQrgGqDbUHJsSlR6xYFuGrJI/s?=
 =?us-ascii?Q?hw17CLzNCALRWGGsYQ4oFqlDH+qIHz1hkesaRMxyjgFwgLMz38mdopmONpmz?=
 =?us-ascii?Q?m8g684g+6R7YMkJY1mHdCvl4szxS4A+H98hptAAfL9ISYjCU9J3ghcCG6h1u?=
 =?us-ascii?Q?/MK31zOc6Fwjp7JjfaihGfidOJ8FS7VvzZOyCBmnTW41soN+PHCBaMBKZ9w/?=
 =?us-ascii?Q?Tud11ASVLh251LoMiUPPWQbUG2LtSnWQPfr7Lc3+5DJdBGtjyU1kXWoNCtyd?=
 =?us-ascii?Q?8IFjOsDdt9uX2eKdaFWvvC7Rzm6Krdq85AyHlvyh9MdkqI0grA1l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a234ab32-d959-4ca7-cf8e-08df3f135ebe
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:14:13.9023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FBTxrnZoSm6j71nJmubSaMFtsYUIo4a1bcAYvBTxGGayfDfRQ05mHCaiVZHVGBRUKvIvGVkDFfeeYu+JY5g4dSD7Qxz3hL9uT3rzAbcByPBIslmpKkNh9aeeAj0RE/9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR04MB612808

On Tue, Nov 10, 2026 at 10:37:00AM +0100, Andy Shevchenko wrote:
>devm_regmap_field_free() was introduced in 2013 and was never ever used.
>devm_regmap_field_bulk_free() was introduced in 2020 and the same story.
>
>Drop never used APIs.
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
