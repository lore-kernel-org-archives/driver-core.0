Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA91F3ECBF5
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761828; cv=fail; b=e4o/c48P+SKRDD1zdu8c8Dr/GN4OMJl4lF4bD2swrbj0Q/NJtivlhOWA8glEe/sCWEd0aoyci2FcDFYeuFyza5xTN8d1vF1ugIsIDpECSKjmjkP8MAiUim9QPCzlFEgYBGfkfX7COmHpayHwGeQ/85cJzgfKONpSKikwfzdZM6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761828; c=relaxed/simple;
	bh=u3jDQ3RaV+vSKAfN41dfYjd+t6AgDfJv++4JVOuuQMU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gBMMlJBsk1k8RRrDKrAOyJokWoK4dRzyysF4nFuGRDgkuJtDEoA5WQ61prWCC94zOQYkmVfZo61c5+9bBBtlN0zQYseCVLytSjUhOyiehRt05lQPAPYvpDiMWMZOPc7nIpGOqQTRFlQ+HNSN5IV7gaYT56sc1T4WYUajCJFYYXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dNgwcctu; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dNgwcctu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+vhyTrm8xurc3g+tN8NKqs6zFQMKvh7i/Pm5J1MU393z1l2XSol1fsJB2eIjgFpSrQLR+LvhilBxTZa2B/KFaKOi3h4RNtF5X4/hTYGWglPb2o8oE8vqCA0YfHkiODVpnzU1j1Jatw/TO76c0jkB2jWkHJUxLuwrK0xMTXSpoz+TJ8KMPxU7XBjuk4UyfFxVDKn/KK1NxkY7P4nTHmlRGbw/UvRn7XNT2kJ0W4j0XUOyNTwuQ3Id22okjblHa2sClpmExmngqMslIV2AUlfYFp8cEuQsBwy+PVCtECPT+/p1mzX7JoKAEe8Fxz9cXAmOzH6Su0cahqTbB2DiU01bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTfelUeHozNBBeAkdAcrCachzf3cDlbu56cvpDf3BlY=;
 b=X9jpvTWvObr7EVhzKfGW5ITAbWdzFx7hHc3j5Zjvjkoj28X3eZP78mv3R4gCynp9L8Cgr0mGPVmHf9ijRur7YfMqbzHNHTEA1v9cRYqtWH/NbfyGrOTfy6mE1bSLo/DPLV2oNTXLYGQ9bLvT3z/tohCDVJW1RYs64vy/FyZsAlZh1edxPLPebYXlGdw5EY84t8BGpkTF6mNZVbm5iJ458meW4CHzY8HBGI0KLMW/JeKO2zvhCVF18FAv/ljrtPKEM5pIZKAqIM9T1w+icLCbDA5v/3EEdPoiyseVuzafHyCP7yHjPaVDerLPCnwVeNb+sfTQwqbVPIcLcksMvIBajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTfelUeHozNBBeAkdAcrCachzf3cDlbu56cvpDf3BlY=;
 b=dNgwcctucYhXOTcSYqQTwGjmHPRWU0008Z6guU+8ipBRKWNUbaSb6skGl+X6xTMD4xnJIWt3xL21eK1Us12s9jgUwToh6hvk64sEvim1IyrzdmXpM/rdAI1PAPx6DzSrqiADZD1mD8HjssHdz/jzMWHM/m0Tb6exmjki/ylECWP9T2iQmYiufMms4Gw9uumOk1iCZXEq1gzABIbglwxxOjq4wIeuMJrFb1CHdOWAfQ+IDYAoM9p995WmH/IrxM8Rdyxl6D5yP9ng3EYS1oJC21497fWsr50odseMVCWz8nWnwwNvbFvit4Y1VH3w5LYQ9MQ5RziPcJ+MDUdizWQl1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8714.eurprd04.prod.outlook.com (2603:10a6:20b:43d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 09:50:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:50:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 17:47:00 +0800
Subject: [PATCH 6/7] regmap: return errors directly before map allocation
 in __regmap_init()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-regmap-lock-2nd-v1-6-33a8a482f9ae@nxp.com>
References: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
In-Reply-To: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0353.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::18) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ad479f-339b-4888-e777-08df1ed83de6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|22082099003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	JCatcq7ZsyymiPi6YAdcAyqnN8P2tv/buiTReGPQtotgAMBoTgyesK+GrIrKt5mFCvzFzOzpj/Cp/h8Qm7PktndGxHNbofwCxfDpJJgt4AfcLw0P14leJSqGdxsep3bvDVZzSolsAfG789Ca/Tkq3ieYINsuzUA78IKPe5jYv6vJDksmjEHzPmOmwNwbUsL3ZOM/Ui/GZzDMclOh32soueskdjvaZSiH0BL9g+0Zd3vQ/Uif9W/oYJCLasrWRNe9dLex5Mo7t8sVcl7UkXAh7VaWbovH5EkfXB3S8CF7QshgKYbZGzJtvfni5sIIkySW0++MLnwDy5GbR/y0JDP9kVCVGMc4j1tPkhXh5t4K5D1FHbdFIabejy/MWkhm1t+QtZ/Yk+Hb7jEr6bUGZ/OLy+qTwXdd48I+LzUcRy0PHXkOKgCpZUCxepVgqQNAjl+O0tR1MgRaInRktQkMx+k1nj//ZOF6ZBZ86ErYlVpLRjQvstbmtNpzqIYYcOVGgbbQm6GoPTArTw0qCcTThqA00vxuvF/sEJnv0beNF+htInmXHmDi52ibm+MX9lSQtKTgCYQj9h5zXiILchlfaIljFoX/IqH5JNxyQN5X65fMzep/74pshT+SazPV1809zCsezrF7N/Gi2xcy4YbVV3rpHh1qFqSzIEMP949ZF2qBB+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkU3d1NqZHl0K3N3Rlo5TTVsVUd6eWFxamVuYUlsTGtFcm8xWUZvVEJVVkx0?=
 =?utf-8?B?Z2k4VWVvQ1c4YXQ1cVNqU2FFQ1d5djNGZVFKRU5hdVpsaHArQUp4dG1Fcm1V?=
 =?utf-8?B?VTZ4SC83NGZjUktqZFpJTHFOUmltMHdOZ2NlOHcxd3JGK3RSNkQwYlFyL3BJ?=
 =?utf-8?B?UEp5R3FOTElEMWNBNjNabXk1c21Na1NyM0g3dU9HeCt3RTdHdGRsSXlvSnp0?=
 =?utf-8?B?Z2pNYkJPcDRWckRtNml2Z1JmWDdCaXVDcHV1ZklvTFN2Yk52QUo2aW84NFJZ?=
 =?utf-8?B?M1N1OGNiaTVxWHhnUTIvS1l5dUZ0eGM5bVE4WGJvazZtTzNTV1hydHp0SVFy?=
 =?utf-8?B?VmJKbDNqT0FGNG9ybk96S2RCUjB6bFZCZFEzU1B1MnVqZzNKZWlDOGZ6SWtT?=
 =?utf-8?B?R3UrSDg2QzFjRU0weG9qRkJQaFJ2UVZBditkT1FkbCtrMlRPakZuME5ncmVz?=
 =?utf-8?B?c2xxc2dyTVBja3ZaUHlvN0NUWXhyQmo0RVNvcExaN2NJeUU0dEdzYWJpTjBX?=
 =?utf-8?B?SVhSMEwvWDBiblBtc2RuSXNHeTM4eGMzcmpjTFVDaWR0a2h4NFpINk5uWDFh?=
 =?utf-8?B?Vk9zNEhORURoQlkxYUFoVkMzVkEvTFg1TjJrWC96Q3FJMWZ4Rlk5UEUwT0pU?=
 =?utf-8?B?d2tic1NzVmtSWGwvK1BqU2FFUW0zWVFIOVRzeEQrZ0tzY1hUOVJld293YVUv?=
 =?utf-8?B?MU5IMEVZM29vQk1YRzNSNzQvVEZvdFU0Z0xqczJrVjdsOG1GVUF5MC9Tdkt3?=
 =?utf-8?B?TmM1amFZNHNDRC80a0d5eVZ2N0VjcCtibXQyTlhyWHUwdEp4SHlwRW9xVWl2?=
 =?utf-8?B?VFhtYVdteWs0Tk1vU1Y1SmYxSngyTWtMZTBHOHNYa2R5Q2hLMFh5QlJPR3Ay?=
 =?utf-8?B?cCtKanFtemxuUXVtdXdMbnlSSEFZN3BuZHFGVzJsUFNsdFd3MnJpemgwMXVK?=
 =?utf-8?B?MTR1NzFtZUlKcVQ3dDNPLzNzZWZ4WnFQZE9iV3VSR24wY2FvTFR0c2NJa2cr?=
 =?utf-8?B?RHl0a1NsWFE2OGxhbEJXeFg1VWJDeEVHWk5wU1hVTGZicnFQNEhtUjI4QjBs?=
 =?utf-8?B?UzFDL01GZjBqcVpEQWdXUXVUbExkRlB4ZnF5Mk5QR0UyNVpSeFJjakk1NE9k?=
 =?utf-8?B?Nk9tMjdZTUQ2NUFiTXlENVAwR2Y5cFl3YnBxM0FQWnR0V2Z0bXM0Ty9IY3pm?=
 =?utf-8?B?MXpNWGtGOVVGY3NvRGVzWitjWGt5ekNzcXh2MWtnVmVTWVI4UG9xeUdzVVdq?=
 =?utf-8?B?aVhMSElqOGdPaWtFRlZEYURqT1NuekkxSk1BcVJSbXJBQlNLY1ZCbFo2TWoz?=
 =?utf-8?B?dHBDRVg1c1pybmhrcmhIdEhjUlRCUlM5V1RKeWJwNGc2ZmlBMjJlWHpFVEh4?=
 =?utf-8?B?SGxKRzY3cFdFUDNlSlFuS0ZLem5BV1lvandkclJvSEFKMmhRWEMwUnBSSlZ1?=
 =?utf-8?B?R2JOK0VaRkQrY1R3WE9MZkdIVk1Nc0s0VkRHTFFnSjlSbjFlRjVqVmMyZVpH?=
 =?utf-8?B?MzkvaWlRVXB0VjJCYWNrTFRaWE1vYWZ3NGUzcWtXamEyRnVRT3VhQTBBMXdE?=
 =?utf-8?B?bjcwOHJkN3BSL1FUUzJTTWxac1h3M1FUZVgxV0VlQVZqOFZLQ1lQTkRpSHhn?=
 =?utf-8?B?amhGc25uelhpME8xL3RaUDZpSi9VQWlkR2Q0SGpFeXRCOEliUHQ3TCs4Vldn?=
 =?utf-8?B?RVRxMjZwVHk3Y3IxekVqWVBwY2V3REV4TzBIUHdJRnVkRGxrakFKbi84aURP?=
 =?utf-8?B?R1FUNmZmZlkwMWpZWEs4REgxVTBDZ2QwUG9Jc2JkNHJSSjEzT25nSDJBRTRo?=
 =?utf-8?B?aUNKWGZlTi8yOEh2YWI5c3NwbVlaSGJlQlAzYndpRGJVMFdsOTRrSm52UWhX?=
 =?utf-8?B?RW5Rb2N5MWg3dlBSWlZTdEd6bWdRZnFCb0Y4dkpSRWhVczBaQWFIRVRMM0tv?=
 =?utf-8?B?MWFMbzkxZ1VXQUhSSmZXNmk0VHBLd3lka29BVVRSbWZ6Tk9aUlpSODhmSW8w?=
 =?utf-8?B?QUg4MHg4OEdSWHlKZ09hVmlueUpGdHI2WGNMdGhHUTRrWTlucUZlKzJqZmtv?=
 =?utf-8?B?TnRZQ0FFNnJ4bjZTbXZOZ3I4Y2xtRTl4VWF4RGFoWWU4ZTVDYk9zWFRTRXZp?=
 =?utf-8?B?SjlGMTZhTU5ad21QUFI0WjEwaVQ0dVRuQ2M5SUUvMW1DUGw3L3ptSVVWazFj?=
 =?utf-8?B?QjlqZWZDbmxnQnJtQW1xZjNOclJHREVBbGhxb1NWV2lZUXRPMVBXQlE2QTVr?=
 =?utf-8?B?OVVib2UvNDk1WDBtT21JZWN4MW9UdHVSSXB3enkzNEpKR1JBREZ1Uk9LZllU?=
 =?utf-8?B?Sm1PTkpvOWtCZ2RvM1FUZ1FzUy9kYitwTmR0ZjNUQkZ0ckt5eUNZZHBzVHdE?=
 =?utf-8?Q?dBHLQAiw+zH95EMDq+zlwBmmFfP6akXHn1g8e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ad479f-339b-4888-e777-08df1ed83de6
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:50:21.1262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nPXFFcvsz/os5oWulPnCu/8tBrE6E9sfL2jFB6CPiwzNlQ/nonnqgf0KlX2zg35TnMvFvAa5qaCRv0fQEIE/BEc3SyYahRJgFaWXS/dRj6o4Ag8C5rDD781LldsDCWpG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8714

From: Peng Fan <peng.fan@nxp.com>

The two early error paths in __regmap_init() - a NULL config check and a
failed kzalloc - jumped to the 'err' label which only did return
ERR_PTR(ret). Since neither path has anything to clean up (the map
hasn't been allocated yet), replace the gotos with direct return
ERR_PTR() calls.

Removes the 'err' label entirely and the pre-initialisation of ret to
simplify code.

No functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index bb5553ce58d1..88000d535985 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -681,18 +681,15 @@ struct regmap *__regmap_init(struct device *dev,
 			     const char *lock_name)
 {
 	struct regmap *map;
-	int ret = -EINVAL;
 	enum regmap_endian reg_endian, val_endian;
-	int i, j;
+	int i, j, ret;
 
 	if (!config)
-		goto err;
+		return ERR_PTR(-EINVAL);
 
 	map = kzalloc_obj(*map);
-	if (map == NULL) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (map == NULL)
+		return ERR_PTR(-ENOMEM);
 
 	ret = regmap_set_name(map, config);
 	if (ret)
@@ -1174,7 +1171,6 @@ struct regmap *__regmap_init(struct device *dev,
 	kfree_const(map->name);
 err_map:
 	kfree(map);
-err:
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__regmap_init);

-- 
2.51.0

