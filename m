Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013057.outbound.protection.outlook.com [40.107.162.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EDF3955EC
	for <driver-core@lists.linux.dev>; Thu, 24 Sep 2026 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231639; cv=fail; b=F1Y0oqDkpLGdVZUYaLevTxs/x1k8GuigZ1gjQedCS1u5ISFqFVMir9gv5yPVHTQKajmEftphLqtSJO8jgymxyqUoR8+sCWFPTSXLHrL3aps5uOMR7yKRGFVDVz4uOPbd/zMhtzon2hUgfzBGF4OAgputosFjF5THDU6Q/wc4l24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231639; c=relaxed/simple;
	bh=fbGH4/hT//gXKi7FJcfsZ5ubPtWsj+6tG9bWhj+bDxc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hJTWx4edd3vVretLwmSRpU0drP2/uXtjJAV4wu1vxv405zTO+6diHKNA7wr5SJhXIp+tCOgDd/qi+sX/y59n9eNU4c6fR6XcvcbBmDqOF7WMdHgrAFj/F3Wa1WxTDBCxwsuwv3qWElYETE4hOSamU2uS591FZEkHMyQzK11Jho4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iMVklbxM; arc=fail smtp.client-ip=40.107.162.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iMVklbxM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwvmPhhAOlifiXozJKu00DbkbxjDv7ZtW8wF9FRZ0LTwSHqfSYzxWCQjJi6VLVKWE2PQ9nK+i6iEatx14HR9ryHGcWoG69A9gbRL7niRcoQcnuy2W4Ke0QnTvnyjePzTJqCVjxBMoZ4L3vOv6ne8PX5pHDa5Zr+j4QQRceT1THV/rj6ohqcDaRV0C9Sv66S+ikxIfWMQMDL8tR4U0x+rS2dQ4zBSFDU6QfMxvOsX6j7UGxTa/Fx3oKpWX9FFJFqm/GoniPL+UFyFDiHH1bb18lcyNTjhUhiRwrMfiep0Bjo7SKyCe8s4FfYUXGKdZEAI7H1sKwLrSVy8q5B5B8dVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5Nmo5Xx/hmqKfA9FTuycbJU3oeYmMGuJiS41KZCsz0=;
 b=TAjb8+22XjCI2vU/zK0Aef/k8u1QCPoaKeov7f6SXy3CeZizq2VPcHXTOiyz+EVGaoy/eSlqba5CbJ/CaTFYawJ/Oeexa1C5r+pBT/H8ovs9h/eI1WgHo1CgBNlQoE2oRIJVeQXmPaXMiJVAQSZi6eEGFT6NXYDd2hL9JyAGYUcf1i+Kp2Jp33lY8WHN165OHkGpqmTMM2ErjKCMfb8kw90QNkE5G2ORl2Rc9nbqlysEJWQ+yQbAoSHjfcW7ILKL2rR5xnwiuztnezIkBxadfGOcdp8OAj15K1uZNGvsvqsiKMoubz1adkgCkf6DHMLgftXAL7qeL//rEAvzP5b9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5Nmo5Xx/hmqKfA9FTuycbJU3oeYmMGuJiS41KZCsz0=;
 b=iMVklbxMfklaZzzRoRzC2BXaiM+Btc7THojMkR5sVFvQ4h5WuoWskROgkh7SrVR4TrwBF1GWwdH36hxJIjev+9wUqa2K6b7lRpWuGtpOiSqgvNMRsWQiriNreUO2gAxOkNW+3+naYKf4YsHe+g1K/zXWA3OL3YunWkf4fxs8a/8stTz0tRlYl133UlSCbI7xfyuKV6kDGkGW7tQE9v+AkBuWFPg5oeGAGcqTqc2JnI3Wrd8R7Z4qPuhb8kK5pZN+tPfO7rNHRcHuVoWay6iYXz+jDTSkG7IGxktewuBzc+emByUW0ET3qcisibomXAoZRsR0cVS7OR870cmf5lwc2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:33:55 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 06:33:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 24 Sep 2026 14:30:54 +0800
Subject: [PATCH RFC v3 3/4] regcache: rbtree: use the regmap scoped lock
 guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-regmap-lock-guard-v3-3-8a6127223c16@nxp.com>
References: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
In-Reply-To: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 601b618e-85fd-412c-e156-08df1a05ce4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	k2ruUbbP8W/IakTaf/2ex45xsdsKf3NOPERfct3UfdkNnp1HP1zstI/aVuLm5ljE4UxpxLVu9WLYUuMF49G3pfSdSN4QLItsIYXpfVLikSt6oAN27wqO34Ug9s8TgHdsZWfbryFSazoPImfEdcEPHKTt/+zKScSwXzVut76w/qoS0FxwGyapwjhFDRb0ohal0Z8jQ9ueDljv7lMxlQqgD1iyw2Hu9XC3aZNCmIfGKDIMaLGGG9YBos7bRuF+wcX4PBlb2zxmb2UMlWbh5SnoobNiYnOrp5ycKBEVnS56a6CSvsUHTVepk/KdBLV3kaaSzChIXF3D8m5rS/Aer9C+xERrKkYrXXDHFE6kY1J4IbUxPly0ML/c15XbG3oi36+Ux8Ksu1g6ZWBYpsCGLjeQqbUofIGwp9APvDSQdl6i/aWV8vpUPFSBiZIvczfONl3Nnm+8AKuEX6W/nS90m2YMw/DUtNEhRYU3ZvPBRYKE8xJQtQKCG+WTMEFSlqlKNeiISEQ0Y8/u3zhRF3lyPfDmGoBgz07HyyaRLLszEoqyh9YK9kjG5SXkCjkMRJHi9Df/O2WYPSLjg11znkQeWLe8yWvauZVVHnRqIffSvAYFNhXLv2DiqW6z5fCc6Pb/Yb90NBQfK/99kbHS/+N72ynmipjWLT6GXM5eC+vSEHtVl/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVJnM2ZRN1VKckVXWmR1U085K2daamxKdU5NZDlLeTZhNmV1VUhuZUVDUUtp?=
 =?utf-8?B?THdtc2VwWnhhSG5FRUdnSGlRaEFtZFBlSStDeExrcFlKcWw4NGVramh0NHp5?=
 =?utf-8?B?MG1udEZDSlNxejEvR3l4Rlg2UmxiZFJXU0hvYlI1Z3U1OU5wb0VnbHFYMHVs?=
 =?utf-8?B?K0RzdmtBMkJ5blJUTmhOYU5mRmdlVWRFd1JTY3U5ZmpGbTBwS1VpZ1FOVzlE?=
 =?utf-8?B?Mnd6NC9EdnF0NTJQeEllRW1TMWJ2Skd0WkZKdWZOUlNndXBkcFBkS3ZpNGFn?=
 =?utf-8?B?YkR3QWFvcURhRXhaTnJUcDJXZGVVcTJkSy9wMm5kMUhwTDdhM01DMEpDWDlk?=
 =?utf-8?B?ZEtnQXpJRHRjVnVBQy9yYjEvbXp5NTA4SW4ra3JTK3B4a0tNTkhJY090QVNq?=
 =?utf-8?B?bDdkOFU4NDRLN05LeVd6U0JHVVZlamFqb01SQ2tPVGJZeHIwU290QVpIbnN4?=
 =?utf-8?B?RlV3anJTR2E5WmZkQjBjTWZ1NGRpRklMblJaSmNGUEJZUThFRzV1cXdPTlVz?=
 =?utf-8?B?MncxQmVoN2FXbDVUNnJGUFVQWW9HUUJCWm9MZ21CM0htUmJQTjZTMkV6VzRo?=
 =?utf-8?B?U3RTS3YwZlBIOUhHSUpFdTFHNTA1WGtFUVpDTi9LYjd6OEhnWHB5K3lHVEVl?=
 =?utf-8?B?RUZ5RlFSaUxlbzlrYmU4YXFHUS9BL1Y3YjBhd1dSK2cxWHNpRFR4KzNidVVp?=
 =?utf-8?B?RExyRWVrcU1QdnlGN052Rlp4bGZCN1dFdWhjMlNWSGFqS2hyYU5naDB1SVYz?=
 =?utf-8?B?UVdVSDRjMnA4bDdVY2EzdzFZaFFNTUhGaG5CdllJUy8zbkFOS0plU0JBSTlR?=
 =?utf-8?B?UjBKbkw3cndiajB2ekFpeXZ4c1BvNFpxdlFqVXFLcENsMW40cDF3Y3lJdHZJ?=
 =?utf-8?B?UnF0dGQzbFJzVGV3Q0tuNHdwWkRLL3RtM2x1VWprVUJJVGw4NG1yQXBLYzJE?=
 =?utf-8?B?R0hZQXYwcEpPSFQ0WUVWRGhRYTVXdVNES01sYnBJSDFEN1JVUUZFWFlIQ25m?=
 =?utf-8?B?clFiRWJPRDBWSWFUdU41ZUlWNjNmeTVDMXE5SzVIMFM5N25kS3FtUDBMZk02?=
 =?utf-8?B?U2FEbjZOeWY5eDFoZmpVUjZ5N2NGRk12SVdQTy8wYzc3VlptV0FSL0tadDd3?=
 =?utf-8?B?VzdpZlY5di83cmYzNysvTDhOcDVHckhKTWFpcU5qeGkvRGhYQ2RyeUh0Q1U5?=
 =?utf-8?B?ZTlrWkRnYVhma1diZXk3cVcvZ3U0eWNpNEZHWStDbjJqZmxTUEtQZG9DV25T?=
 =?utf-8?B?blpLZDRCUElScWdIeFQrYUNicjBZN1RGNDBZMWtHZ0hGRWhZblR4VHdkbks4?=
 =?utf-8?B?VWVWNGpEdERBMHVlVThWUDZ3V1J1RjE3WGVnSVBQNThPMWxieDJQdk14QVow?=
 =?utf-8?B?VGZKanFndHI0YVhVRjdCWklwajgyeXU0bVdlY3doN2Q1MHJneUVtem91eTNp?=
 =?utf-8?B?OVZPU0p5ZlhnZ0pOTGxjU3ZvaHhubnI2bnMweGd1WjNzZnRHMTJjU0NSUVdX?=
 =?utf-8?B?SjZuOXdlcXRnb29HTGF2SFV1Q3NmMVVqSWtLdi9SR2l6bGtjcW9VKzlEa3Zt?=
 =?utf-8?B?SlBodzhpTHhiY2R4T0dlZjlFUU9ESVlFRElubXRvZGFyZEEyb2Zha1Riek5i?=
 =?utf-8?B?LzNUZk93ZFAxWFM2TnF3ZDdUWUpTWFY3RmJBd0gvcDBIODUwY0hNUnUxNW9D?=
 =?utf-8?B?MFpBdWZiZExlQ0poS0MxSWF6OEFqMU0ycUZWOTZmVk1YT1NoQ293UHFCbXMy?=
 =?utf-8?B?YVBnbVg1VGRMVjFPTWxJV2N3NVZFWGk0N3czVHYrMmJaTml3QUxlWWlyc25P?=
 =?utf-8?B?ZGRUK0JrQktCNXFEMjFDeW5CSTZtRCtsZXdnMTJBK05jSHJmMzh3eTdUdzI0?=
 =?utf-8?B?bW03SWhTeVNxUmRFKzFvRVFjMXhYaURNZDBiS2dNN1lYVjY1YjNFekxJNGJD?=
 =?utf-8?B?UG9SanF5Y1VveG10UStkMDBtTGxKV3VYeG9NbGZrNm1GWXVQMy81TTJHek9D?=
 =?utf-8?B?Q2ZabWRpOVhWRThZYXpJZE5PY3JKYkE1eml2SkE1UVdabGliM3VCbTVwcWFP?=
 =?utf-8?B?eHJ6Rzg2aW9lLzh4elc0UC9OMm9kVnhkWVFralFqdTBlNC8yWGwwT1cyeFZQ?=
 =?utf-8?B?anhkY2RPTTIrM3hhcEFOTk5GRERKMWZJc1hMcFlXdGdRb0JjdzJKWXc1M1N4?=
 =?utf-8?B?RGI1NkZ1UmVrZUJWTXhGTGtDRyt4YlorMUo5SDhMejUxT3dHM25pK2dLOHZ6?=
 =?utf-8?B?a0RSSXoxWlBEVjZVSGI2YWVxejQyZDM3ZjUycTdJbytWV3BEeVZjZzNKalR1?=
 =?utf-8?B?bWN2WUd0LzU4bmNSbGNiWGdLVjZqQytkRE4rODM3OU1PSVE5TC9HRk5mNzUw?=
 =?utf-8?Q?Ymu5ykx8SXR0Uq1EqacXNuAXLhNpkjqh/m3id?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601b618e-85fd-412c-e156-08df1a05ce4e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:33:55.1294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL91ZvNbBz79I1jqkWz7TWuQ5SOyVY+6BLQkRPR3WTeexJT6azHxEcOJYYkDHP2ykn4kotNOi4zi0730T59gKeQVrlwfR5fC98O00T+lixPJ3Kb2+ulcz/rYxTbJYNO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() pair in rbtree_show()
to guard(regmap)(). The locked region spans the whole function body up
to the single return, so a function-scope guard drops the manual
unlock with no functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache-rbtree.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regcache-rbtree.c b/drivers/base/regmap/regcache-rbtree.c
index 520d5f8ba3cd..e2feed6dbecf 100644
--- a/drivers/base/regmap/regcache-rbtree.c
+++ b/drivers/base/regmap/regcache-rbtree.c
@@ -141,7 +141,7 @@ static int rbtree_show(struct seq_file *s, void *ignored)
 	int registers = 0;
 	int this_registers, average;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	mem_size = sizeof(*rbtree_ctx);
 
@@ -168,8 +168,6 @@ static int rbtree_show(struct seq_file *s, void *ignored)
 	seq_printf(s, "%d nodes, %d registers, average %d registers, used %zu bytes\n",
 		   nodes, registers, average, mem_size);
 
-	map->unlock(map->lock_arg);
-
 	return 0;
 }
 

-- 
2.51.0

