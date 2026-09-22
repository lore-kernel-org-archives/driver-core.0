Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF353A39E
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 11:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075616; cv=fail; b=KaLykgnVg8Rk1OXA4O7QXUnwOgE9A1i8hky+aU8TLiyHLto6hICTfkEz/9eK+sUCYUikZuAkVR1B1eIAVM6Hdsu0z8UYIRV0+W65+Wrujsy0iwbNdtH6nbvJMBV9qWbQ5PnIipotLFpwwcXoxTd+vqT5i+eXPUiKsvxtguDusUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075616; c=relaxed/simple;
	bh=CdIeNDPEXLSBvz+pU+72+hSlHgb2rQCvlgbq8mxx5X8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lz8hUU/qP9qfwT957C+9TuYWvww1XcRpOlm6xgkPZqIsjgbzy6Jj/Gw+PGY14QQOe/m9mlq3mGGPLet6sWEFYw5q6UBtd//7FNCXaUasivrMrzOb/eWOwa6OaxZx+6sFx4w+OT87psXP8ih8nr1713uBkG0FLZ8qT8J9DRqV7g0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZhjPY9Fl; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZhjPY9Fl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYh4oNzzQZGHKsOC07i3Pb+3ElFZHueGyUo3tnfSosyCPiFx6GjdClktISpJ+DdrE6deChHBPQkFGSXW2EejI3RXPPWJRAp1ndNZfyx8e4l0atTlCRHOOqeiLsGA6sSSYOQi06IqjEV+ENQiyLMxhYXd8PZ6zqy5xK5n5vkgjTDOVL3KksgE3YwMs20jCQDDWo8Aks5c57l5GWnKekcrWrlT+UNSQz4s8/GlnNCeNXg6eMhz+qXJRmTInK2vAuLbK05xbV4gKy44TWVc+rF+mdP6GyQkL4RtGyDh/CTRGv25a/c6bw+q8yInVAlTbJvHeyqO08rIUFXTcZOB7Um03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af0wBRm/nK9bxqnS2sNyNYOeuy8hrr82YRXNkSpc3P0=;
 b=l27axVypll+/ECG8O+/zAOagknE2mLSdJ1uQwOvt/4Z0bqz5YeX7cmZdn7I4qBEz78uQoHJKpCCMDJY7XActC8Bg6iTV0MQTK30FuGhm3Jrr0E+R6Rv4HjaWvleRR81setS82/BFoYDdKqHWjRN3FJsMjnm6SlrCXVcsdXMJIPeA5ZUt58vkivwySUAUxqscjizVx8yynD4rYueIR4p0lSXT3QZt9j5zbVRAVJf1VtP716NFl3Ez1udOiTkGgzlvH22NGETEXL7lxGNCc9/dpl+20GD+yct6ozCWEl8SYPiomOMlLttMjDpEOWNdlXSwOK2+s1L/t6gN6NJYF5R3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af0wBRm/nK9bxqnS2sNyNYOeuy8hrr82YRXNkSpc3P0=;
 b=ZhjPY9FlEWdxAs2Sai6hyPY8hhooIw8Z3uexF45KriU2hVRwO47rzBy/dU1eKf/vmqVwpDX/iY85pkORVpAqp/AwVi1ol+3+htl6XuR+xZrRxyIC4fAuItlJLdevd90QF9EpnvgHcCxobA3iA841qwqtRg3HpojrK+8/9rKLbmNRAc9MP4SHIecbopiy0yE/JilpeTmHWFJt9KJwEE24UAsdqZ81L/ey3HDWBkQPmHDV1dTQEWZEOedKbuNiRx0DcImrZQzqJMOFGmDj0icnWpUkXYvl6KbR4Ty8PYYhuK528nddPSD0Ulq3yr2YFv4FaWdr9w8q4ausqkAQ1cnD5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11191.eurprd04.prod.outlook.com (2603:10a6:150:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:13:30 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 11:13:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 22 Sep 2026 19:10:55 +0800
Subject: [PATCH RFC v2 1/4] regmap: convert lock/unlock to a scoped guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-regmap-lock-guard-v2-1-0c9d426427bd@nxp.com>
References: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
In-Reply-To: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0029.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: beb27282-d699-4f8c-e830-08df189a87c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|6133799003|5023799004|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	3+Z9scOr6pT4tXsa/9Rcu/R7zRUL0oLwA18ywuYPlP6dMNO4sKa5ZqS/EIrX5bSXp5k0bGyyScO7egBHeKu1BJxZWGXciVqfyMA8IL5naENK5gl9gbmyzn9LJfUdVj0JvDi8lioYSktUk3hW9KSFhq/nKSTjyuakIfuurPZpq5q/74M+ZmjmEUtddrMENMsfQcg2Jv2EQJ5Kx0uG83/7DcVuMjLzu3AP7pYBzOsQ87W4AoWfTw2ncKCT2az8ZjsIXDawHT3CPv+W6Nr2op1rMk1MdXe7eOpD5KQ1GZkL2kGXf9975QBjwsBP5noZT2ZKOT/ViaYiA9o9Xwu7XIrUJ6ZUCuJnvWSA6bqT4QLzZd96UiXMOyS1Xw6y9mgfqA5dKfCIeIIuWG2SWf94XXFmHkot/l2UkpZ/Xtrj3KsGCUjbIEu26RXDpeHOwUPTWKiHX69lLm9iJZApAEZ6rB78uAbOAZ+JmY++ajRUiPv4mXZfjpPHzJEZJPFJSqrH9FxMPtqXp/pG87g7ff91+5SbzOtKsmUe1182R4KYIA8STMH0fNNFYeecifM2gYKs9Ujk1JnZamABmTfDroZuuME6KPjfWbqrSw004GSDONMXoLS3F6zUHrIB01/vBKdfyw/eva58FeBt72k9KjizGFujCsX3l1KpV2wCw9D2V0j1Xaw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(5023799004)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFpFYkJYeWNjVUlGUVFzMmlYakpCcDhPVzNtTElGREFPU0pIck8zK2RVUENZ?=
 =?utf-8?B?NWt2ZnVOeS9BeWlZaTluZFpJU1ZNa0REeUl0UDVLT0JybW5SdUZQbFBlYVdp?=
 =?utf-8?B?bTRjNXNxbW9BdFNUa1d4YW1xTUpod0JqcXZhWjQvMERIdkorWHpZTy80RC9Y?=
 =?utf-8?B?M3hpQW5QWXBPcksxKy9EczNabkV0WXJTMCtsSWNDVU9adHd5VTk4cFExeWRj?=
 =?utf-8?B?SWRnL2pRSDF5MmZzZnBOMnYzUW1aOWhlYy9jRHFKTzEzOWFlSmYwOXJNY3FR?=
 =?utf-8?B?cENMRlRFZVRvdmhiTkVsaXVpWDhzdXJRenlnZjVScWZvZVlaUEp0MmdBL1Zh?=
 =?utf-8?B?TEFvdDNQUlEwamhNNFBoSWY5NmlhNTRBc2srYUdwWFFvYzhDL2YydXFOTUpN?=
 =?utf-8?B?V0pQTVZJZUFPRlIwUURPcU0vV1hWN091TjcrWEloeEZ1c0psbTBwUnVpWjR4?=
 =?utf-8?B?MVNlMlIycFhmZ0kvajBncjNtMHdHdE45aUZiNDdzWnlVbEdZalRob3VwcnUv?=
 =?utf-8?B?VWtFMnlEZ3grRU9OTGo2SXJQTlVzN25JSE9KRm1ZWkwvRG8vV1NuUVl3WlV0?=
 =?utf-8?B?dHBvK2I0UTVMK1EvNndSWjZVQ2ZxK2FJZlpqN3hHVUZYMUJVUlA1TnJFVnRK?=
 =?utf-8?B?dWtzbmVNWk9FOUVHM3V6SjExQTNRSlBJUmFwU2l1VkVya0dERy9QL2Yvaits?=
 =?utf-8?B?MmZnVFNqQVZ5d1Y0N1l2ZjRNaXc0MU95MHMvUSt3QUZCdlVrbjRROXBnRHNp?=
 =?utf-8?B?UkZ3R1MvUHBjQVNFeUZQSUtHSS8zbDRzOWlsSkdLS0FxeEFmSXhWKzVKS2ww?=
 =?utf-8?B?REtoOGRIaWk5MEJ0ZEVtanhvdzlmSyt3S1RWck9zZ3BQODR6ZlRERW91TXYr?=
 =?utf-8?B?MUdwTG9Mb3pwSEpUN1RSZWFmbkdCUUd1U1lCYWNFL3FpNUk1Q0M3NDFjNS91?=
 =?utf-8?B?Rm1vaVFvZ2gwMUpab3FiOTg4bXFUTUZ1UGNpL3pXekE5b2owMTBYMlFCUC9K?=
 =?utf-8?B?MVgwZ1RHT0E2aGkwdGZZUFJvYUtMRkd4WGM2QXVGbmVuSDh3V3pOTUI0VjZt?=
 =?utf-8?B?S05NSEtEN1ZSMlhVOWxmeHZmenFDNldzaGJTejBQR1o3bFNuK1J3ZnV2T3Ju?=
 =?utf-8?B?ZzFMc1VWbHV6blcxbEgvbDc2SXZGM1BPQ0I1TnVzVC9XeWQwNm9UWnJnOXJv?=
 =?utf-8?B?aXFUczltcGtkVUR4NEZlcWRVWGJsZXFyc3RsVm9zMERhdENLWkJYR3dPT01j?=
 =?utf-8?B?SWplMmhrTm9QaGt1M3ByRm05ZjZJYXZ4MytmeVdUUmdpUUViUU44SHl5b0w2?=
 =?utf-8?B?Y21CRDFiVE1Edm5PMXpMaDU1ck1sQ1BBK3VtYTFXUkZqSWJQZDVmem5XeWcx?=
 =?utf-8?B?OEw4cVV6TFVxeldYY3NqMXBxRFJNUWJRUk9DLzdNOUJUbmV4MVNOaEs3K1FQ?=
 =?utf-8?B?MDlhaFU3YTVTaXFDa0dEWmRUM3ZhbnFPdGtCN2RpU0p5M3BRVTFScU82TEhw?=
 =?utf-8?B?Q1hoWmhvL2Z3U0dOcTVZR21WeDRhcExCYjBEQmZ6OUw5a3dDT2JIQWhNSkJL?=
 =?utf-8?B?blhuRU9NaGR0ZERlcUg0a1l4ak1DSThFc0IxRVkwM2JNcTdHVFhDdnp3bHNU?=
 =?utf-8?B?bzZBZmE0ak5BUFZ1WFZ5VHBsTndEdGVOUmRUYjV0ODRmVmltVVZTUEJKUjZY?=
 =?utf-8?B?TW9DN1JuajJWQWJGNHhjWGV6TzhQb0ttTVl5bHUrS0ZyaWNHaE4xbnpRYndn?=
 =?utf-8?B?Wmp1N0hEejQ3YWY0WEdyNmxXMXd3elI0b3hyVzhQM0FQZ1NuZ3luajNkeHVt?=
 =?utf-8?B?cEYwN1FtMXZSZHFMdU9seWRKdWFMVDhHbmw1dkFZUHBNc2JCSjBiZG54QnRp?=
 =?utf-8?B?a0p1MzF5dHRFckpzbVJwdGVyK1JsM2pCeUVtVjFuQkJHN0hnQnZHMVBKMmJB?=
 =?utf-8?B?eGlqV2FpdUtIWGpWRGlGc1NCbGZaOUZIU1Yvb1RNbmxCd3lxSjBKQkhLOE9v?=
 =?utf-8?B?d2ZmVThQM2MxWG1RczdKcFhxN2tkN0FManVHU1ljNDZLSW1CMmtNeGF1c2hj?=
 =?utf-8?B?WS9nZkRyT0gvZnFEZWFmRUU2Tnh3dTI5UHExeFlYUHRkdVJPRldMRFphekFw?=
 =?utf-8?B?YjFsUzBiQ2JzUVJOOWlaQ3BXSndtVHdXb2VGOCtpVXc4TjB1d0tKU0t1WUZY?=
 =?utf-8?B?MitOMnRKWjUyeFFheEsrRkM0dG5QT21jek5WbnZ3R0ZSTDFBYVcrd2lXTUEy?=
 =?utf-8?B?UXRTcTNpOG1JN0JSQ0JDSitzOFFMUENMb2ZYUm42TitxQk4zMUF1S2lNTGJn?=
 =?utf-8?B?NVZNZHFqemw5MVdHRGRyK0ZuSzJmSmk1Q29CSEdSSVpqUTNvaU81TXF0cU9a?=
 =?utf-8?Q?OkG46IE30CcuSYpyk0oC66NdyugtV1FdfB7us?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb27282-d699-4f8c-e830-08df189a87c3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:13:29.3482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jk4U5HGzb4043ecnztk1/Q/QGdq56DroA+WJaOxAZpQPuk8AspPjNj1LS1TCgkxLAIg/JGWjVI8waHI6llNbIKv3rrdWM4RcIT8HkgSAsEpuQC1VdOXniypeDaq1rLB9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11191

From: Peng Fan <peng.fan@nxp.com>

The regmap lock and unlock callbacks are invoked directly as
map->lock(map->lock_arg) / map->unlock(map->lock_arg) at every call
site. This open-coded pattern requires manual unlocking on every
return path, which spreads goto out_unlock chains and duplicated
unlock statements throughout the code and is an easy place to leak
the lock on an error path.

Define a scoped guard for the regmap lock in internal.h. The lock and
unlock callbacks are chosen at init time (mutex, spinlock, raw
spinlock, hwspinlock or none) and return void, so an unconditional
DEFINE_GUARD() is sufficient.

Convert all lock/unlock users in regmap.c to guard(regmap)() for
function-scope critical sections and scoped_guard(regmap, ...) where
work must run outside the lock (e.g. regmap_register_patch() calling
regmap_async_complete()). This drops every manual unlock and the
associated goto out_unlock labels with no functional change.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/internal.h |  11 +++
 drivers/base/regmap/regmap.c   | 182 +++++++++++++----------------------------
 2 files changed, 70 insertions(+), 123 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index c73036744468..ea375cc8ae87 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -10,6 +10,7 @@
 #ifndef _REGMAP_INTERNAL_H
 #define _REGMAP_INTERNAL_H
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/fs.h>
@@ -185,6 +186,16 @@ struct regmap {
 	struct hwspinlock *hwlock;
 };
 
+/*
+ * Scoped guard for the regmap lock. The lock/unlock callbacks are selected
+ * at init time (mutex, spinlock, raw spinlock, hwspinlock or none) and never
+ * fail, so an unconditional guard is sufficient. Use with guard(regmap)(map)
+ * or scoped_guard(regmap, map) { ... }.
+ */
+DEFINE_GUARD(regmap, struct regmap *,
+	     _T->lock(_T->lock_arg),
+	     _T->unlock(_T->lock_arg))
+
 struct regcache_ops {
 	const char *name;
 	enum regcache_type type;
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 98184a00097a..0b40e1e7817c 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -115,9 +115,8 @@ bool regmap_cached(struct regmap *map, unsigned int reg)
 	if (map->max_register_is_set && reg > map->max_register)
 		return false;
 
-	map->lock(map->lock_arg);
-	ret = regcache_read(map, reg, &val);
-	map->unlock(map->lock_arg);
+	scoped_guard(regmap, map)
+		ret = regcache_read(map, reg, &val);
 	if (ret)
 		return false;
 
@@ -1977,18 +1976,12 @@ int _regmap_write(struct regmap *map, unsigned int reg,
  */
 int regmap_write(struct regmap *map, unsigned int reg, unsigned int val)
 {
-	int ret;
-
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
-
-	ret = _regmap_write(map, reg, val);
-
-	map->unlock(map->lock_arg);
+	guard(regmap)(map);
 
-	return ret;
+	return _regmap_write(map, reg, val);
 }
 EXPORT_SYMBOL_GPL(regmap_write);
 
@@ -2009,7 +2002,7 @@ int regmap_write_async(struct regmap *map, unsigned int reg, unsigned int val)
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	map->async = true;
 
@@ -2017,8 +2010,6 @@ int regmap_write_async(struct regmap *map, unsigned int reg, unsigned int val)
 
 	map->async = false;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_write_async);
@@ -2080,20 +2071,14 @@ int _regmap_raw_write(struct regmap *map, unsigned int reg,
 int regmap_raw_write(struct regmap *map, unsigned int reg,
 		     const void *val, size_t val_len)
 {
-	int ret;
-
 	if (!regmap_can_raw_write(map))
 		return -EINVAL;
 	if (val_len % map->format.val_bytes)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	ret = _regmap_raw_write(map, reg, val, val_len, false);
-
-	map->unlock(map->lock_arg);
-
-	return ret;
+	return _regmap_raw_write(map, reg, val, val_len, false);
 }
 EXPORT_SYMBOL_GPL(regmap_raw_write);
 
@@ -2211,21 +2196,17 @@ int regmap_noinc_write(struct regmap *map, unsigned int reg,
 	if (val_len == 0)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	if (!regmap_volatile(map, reg) || !regmap_writeable_noinc(map, reg)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!regmap_volatile(map, reg) || !regmap_writeable_noinc(map, reg))
+		return -EINVAL;
 
 	/*
 	 * Use the accelerated operation if we can. The val drops the const
 	 * typing in order to facilitate code reuse in regmap_noinc_readwrite().
 	 */
-	if (map->bus->reg_noinc_write) {
-		ret = regmap_noinc_readwrite(map, reg, (void *)val, val_len, true);
-		goto out_unlock;
-	}
+	if (map->bus->reg_noinc_write)
+		return regmap_noinc_readwrite(map, reg, (void *)val, val_len, true);
 
 	while (val_len) {
 		if (map->max_raw_write && map->max_raw_write < val_len)
@@ -2234,14 +2215,12 @@ int regmap_noinc_write(struct regmap *map, unsigned int reg,
 			write_len = val_len;
 		ret = _regmap_raw_write(map, reg, val, write_len, true);
 		if (ret)
-			goto out_unlock;
+			return ret;
 		val = ((u8 *)val) + write_len;
 		val_len -= write_len;
 	}
 
-out_unlock:
-	map->unlock(map->lock_arg);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regmap_noinc_write);
 
@@ -2357,7 +2336,8 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 	 * single write operations.
 	 */
 	if (!map->write || !map->format.parse_inplace) {
-		map->lock(map->lock_arg);
+		guard(regmap)(map);
+
 		for (i = 0; i < val_count; i++) {
 			unsigned int ival;
 
@@ -2372,18 +2352,15 @@ int regmap_bulk_write(struct regmap *map, unsigned int reg, const void *val,
 				ival = *(u32 *)(val + (i * val_bytes));
 				break;
 			default:
-				ret = -EINVAL;
-				goto out;
+				return -EINVAL;
 			}
 
 			ret = _regmap_write(map,
 					    reg + regmap_get_offset(map, i),
 					    ival);
 			if (ret != 0)
-				goto out;
+				return ret;
 		}
-out:
-		map->unlock(map->lock_arg);
 	} else {
 		void *wval;
 
@@ -2653,15 +2630,9 @@ static int _regmap_multi_reg_write(struct regmap *map,
 int regmap_multi_reg_write(struct regmap *map, const struct reg_sequence *regs,
 			   int num_regs)
 {
-	int ret;
-
-	map->lock(map->lock_arg);
-
-	ret = _regmap_multi_reg_write(map, regs, num_regs);
-
-	map->unlock(map->lock_arg);
+	guard(regmap)(map);
 
-	return ret;
+	return _regmap_multi_reg_write(map, regs, num_regs);
 }
 EXPORT_SYMBOL_GPL(regmap_multi_reg_write);
 
@@ -2690,7 +2661,7 @@ int regmap_multi_reg_write_bypassed(struct regmap *map,
 	int ret;
 	bool bypass;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	bypass = map->cache_bypass;
 	map->cache_bypass = true;
@@ -2699,8 +2670,6 @@ int regmap_multi_reg_write_bypassed(struct regmap *map,
 
 	map->cache_bypass = bypass;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_multi_reg_write_bypassed);
@@ -2737,7 +2706,7 @@ int regmap_raw_write_async(struct regmap *map, unsigned int reg,
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	map->async = true;
 
@@ -2745,8 +2714,6 @@ int regmap_raw_write_async(struct regmap *map, unsigned int reg,
 
 	map->async = false;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_raw_write_async);
@@ -2863,18 +2830,12 @@ static int _regmap_read(struct regmap *map, unsigned int reg,
  */
 int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val)
 {
-	int ret;
-
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	ret = _regmap_read(map, reg, val);
-
-	map->unlock(map->lock_arg);
-
-	return ret;
+	return _regmap_read(map, reg, val);
 }
 EXPORT_SYMBOL_GPL(regmap_read);
 
@@ -2897,7 +2858,7 @@ int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val
 	if (!IS_ALIGNED(reg, map->reg_stride))
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	bypass = map->cache_bypass;
 	cache_only = map->cache_only;
@@ -2909,8 +2870,6 @@ int regmap_read_bypassed(struct regmap *map, unsigned int reg, unsigned int *val
 	map->cache_bypass = bypass;
 	map->cache_only = cache_only;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_read_bypassed);
@@ -2941,22 +2900,18 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 	if (val_count == 0)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	if (regmap_volatile_range(map, reg, val_count) || map->cache_bypass ||
 	    map->cache_type == REGCACHE_NONE) {
 		size_t chunk_count, chunk_bytes;
 		size_t chunk_regs = val_count;
 
-		if (!map->cache_bypass && map->cache_only) {
-			ret = -EBUSY;
-			goto out;
-		}
+		if (!map->cache_bypass && map->cache_only)
+			return -EBUSY;
 
-		if (!map->read) {
-			ret = -ENOTSUPP;
-			goto out;
-		}
+		if (!map->read)
+			return -ENOTSUPP;
 
 		if (map->use_single_read)
 			chunk_regs = 1;
@@ -2970,7 +2925,7 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 		for (i = 0; i < chunk_count; i++) {
 			ret = _regmap_raw_read(map, reg, val, chunk_bytes, false);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			reg += regmap_get_offset(map, chunk_regs);
 			val += chunk_bytes;
@@ -2981,7 +2936,7 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 		if (val_len) {
 			ret = _regmap_raw_read(map, reg, val, val_len, false);
 			if (ret != 0)
-				goto out;
+				return ret;
 		}
 	} else {
 		/* Otherwise go word by word for the cache; should be low
@@ -2991,16 +2946,13 @@ int regmap_raw_read(struct regmap *map, unsigned int reg, void *val,
 			ret = _regmap_read(map, reg + regmap_get_offset(map, i),
 					   &v);
 			if (ret != 0)
-				goto out;
+				return ret;
 
 			map->format.format_val(val + (i * val_bytes), v, 0);
 		}
 	}
 
- out:
-	map->unlock(map->lock_arg);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regmap_raw_read);
 
@@ -3041,12 +2993,10 @@ int regmap_noinc_read(struct regmap *map, unsigned int reg,
 	if (val_len == 0)
 		return -EINVAL;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
-	if (!regmap_volatile(map, reg) || !regmap_readable_noinc(map, reg)) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
+	if (!regmap_volatile(map, reg) || !regmap_readable_noinc(map, reg))
+		return -EINVAL;
 
 	/*
 	 * We have not defined the FIFO semantics for cache, as the
@@ -3054,16 +3004,12 @@ int regmap_noinc_read(struct regmap *map, unsigned int reg,
 	 * written value? Just avoid this by always reading the FIFO
 	 * even when using cache. Cache only will not work.
 	 */
-	if (!map->cache_bypass && map->cache_only) {
-		ret = -EBUSY;
-		goto out_unlock;
-	}
+	if (!map->cache_bypass && map->cache_only)
+		return -EBUSY;
 
 	/* Use the accelerated operation if we can */
-	if (map->bus->reg_noinc_read) {
-		ret = regmap_noinc_readwrite(map, reg, val, val_len, false);
-		goto out_unlock;
-	}
+	if (map->bus->reg_noinc_read)
+		return regmap_noinc_readwrite(map, reg, val, val_len, false);
 
 	while (val_len) {
 		if (map->max_raw_read && map->max_raw_read < val_len)
@@ -3072,14 +3018,12 @@ int regmap_noinc_read(struct regmap *map, unsigned int reg,
 			read_len = val_len;
 		ret = _regmap_raw_read(map, reg, val, read_len, true);
 		if (ret)
-			goto out_unlock;
+			return ret;
 		val = ((u8 *)val) + read_len;
 		val_len -= read_len;
 	}
 
-out_unlock:
-	map->unlock(map->lock_arg);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regmap_noinc_read);
 
@@ -3149,22 +3093,20 @@ static int _regmap_bulk_read(struct regmap *map, unsigned int reg,
 	u8 *u8 = val;
 	int ret, i;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	for (i = 0; i < val_count; i++) {
 		unsigned int ival;
 
 		if (regs) {
-			if (!IS_ALIGNED(regs[i], map->reg_stride)) {
-				ret = -EINVAL;
-				goto out;
-			}
+			if (!IS_ALIGNED(regs[i], map->reg_stride))
+				return -EINVAL;
 			ret = _regmap_read(map, regs[i], &ival);
 		} else {
 			ret = _regmap_read(map, reg + regmap_get_offset(map, i), &ival);
 		}
 		if (ret != 0)
-			goto out;
+			return ret;
 
 		switch (map->format.val_bytes) {
 		case 4:
@@ -3177,13 +3119,11 @@ static int _regmap_bulk_read(struct regmap *map, unsigned int reg,
 			u8[i] = ival;
 			break;
 		default:
-			ret = -EINVAL;
-			goto out;
+			return -EINVAL;
 		}
 	}
-out:
-	map->unlock(map->lock_arg);
-	return ret;
+
+	return 0;
 }
 
 /**
@@ -3310,7 +3250,7 @@ int regmap_update_bits_base(struct regmap *map, unsigned int reg,
 {
 	int ret;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	map->async = async;
 
@@ -3318,8 +3258,6 @@ int regmap_update_bits_base(struct regmap *map, unsigned int reg,
 
 	map->async = false;
 
-	map->unlock(map->lock_arg);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_update_bits_base);
@@ -3452,19 +3390,17 @@ int regmap_register_patch(struct regmap *map, const struct reg_sequence *regs,
 		return -ENOMEM;
 	}
 
-	map->lock(map->lock_arg);
+	scoped_guard(regmap, map) {
+		bypass = map->cache_bypass;
 
-	bypass = map->cache_bypass;
+		map->cache_bypass = true;
+		map->async = true;
 
-	map->cache_bypass = true;
-	map->async = true;
-
-	ret = _regmap_multi_reg_write(map, regs, num_regs);
+		ret = _regmap_multi_reg_write(map, regs, num_regs);
 
-	map->async = false;
-	map->cache_bypass = bypass;
-
-	map->unlock(map->lock_arg);
+		map->async = false;
+		map->cache_bypass = bypass;
+	}
 
 	regmap_async_complete(map);
 

-- 
2.51.0

