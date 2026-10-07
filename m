Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0EE481FCE
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374906; cv=fail; b=INKMqThqnMZk98mSUyq+rDG7SsWc39rVE+ZUKYisZ9QPn/qWEDymH5ZQbIjRS/+J+c/gHbhwiQWX0oe7+QGvlbreVIJoCz4hOCKoRBUy+FGZ3uqJMu6Darbr+LqYl4jOssZ08jbHOmhU11iNQyeA1MpCbsqb2GCJL6ODWFter/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374906; c=relaxed/simple;
	bh=8jHbr00+x+Co3Z2+HbTi3B71tSTrRo8HfIJrvwhCxoM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eR7JJwvhJcZzVO1IdrLet75xClsgQOWWn9aAfBLqJg2nj3HkSDDHj2hUqvD4dsndhgZDM2EMttyKHoA9N0hCZL0xFEvkMLjk1E22Nj4qJxNiAc1r9XIEV3WFZ4mMccDSboNbapjtJN/5jxExgvWMc1Q7jHPd7ByVuUXWs24ZTQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ogA/+nI6; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ogA/+nI6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy4KGolBmI0L5gM/8Xhl/XxNBPtew7pdxogcuDw90s0EZ+a+wwevXPCza7cTsgdRfop3lTEHcqOWxQEInBaE3VX78ohUK7N6N1O2wZNTlR22CDkRyeKGUpmIV1Ir9B2InyRxUVkvgPtp2sCE40U2mcqiuUYd/1oxoiFXf1+vjNkkz1CxchZj/wIKogt310f9HQPwv1vk41kLK4iYm426hmdQ8VaGlzxeJdnakCpzcUGmEIk4UOmx/fA0e9BJY8dJ4GxWrRzT3kf0kF6JYFY/F+fZ2lMFaAhw326GqQ/swg47q1jwHBtbtnQbePTZ7vX4uDAJM+76gd+lUTFvDOfqzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/+25q04YJCHBdtku1QNzX5HAoUY9Rg4TpE2d6yX+cE=;
 b=U74VsvfVAZ+cA4K3gugIUhvLnAro0rj3xTSyw4lwlzPccRtK5V7/ThDDcqUZZP4qGK8SSkroP8+m1JQN65TywRExEa0lcmFJi5G6M/kgOE0Y8JK1zZH9YD7TzfaUrTCxOl/KY0n+N4ylZ35lnDXfl4totikRnajDBmynOpFzDHA0SHCxqHopw+tUUPKfp8fFjyq9QHa5f1nzSq5RyeTx3RtAXYBIEHlGCQLCDrGn9F5nKnQo27VyEiGIok4enWTvD3TydLbhlce7x8sDzAjAQnGZAtblkrVaL2q3U2NdgU+SrnJnn/L71E0UxYVes4nZnjo2fIEerpivzcNJiSxp7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/+25q04YJCHBdtku1QNzX5HAoUY9Rg4TpE2d6yX+cE=;
 b=ogA/+nI6b3c7Q6yFEiTA0fRS9/8xkibYhZdIYB08xE/kZomG9Qkns+Dk4beHUjm6+O3UNPo7KClJfyFIEpm+FRCH+y1irxD6hzuq3yVZuJAxX6TymWnYBhOrQRaHvba/yw867qMtkTh0tM0vjEedutA5ryNmI5l1wOM0xGQKWZ4HQ9fhQ9WLC2Snugj/Z623Dr00BaNtPlO73QE8alZFtNsnwwkykarVhS7DhAnOuShJGQvRRwfG8B4gDPWzPDmoCQpax8AZ8nSndEtDKHnfl69oLOq/xUv6NfbOBViJbveiCQYmyhUGDuCIw8X33HcCNlPAnPiYvkeySMFbor9pVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:07:34 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:07:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 20:04:03 +0800
Subject: [PATCH v3 7/7] regmap: debugfs: Use guard to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-regmap-lock-2nd-v3-7-0e590c4125be@nxp.com>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0287.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b10cad7-3426-4793-babf-08df246b91e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eS/c222TSFrLIPoGz0NvuQ1myAaZ6om2exC4FY4TZ5C1OC4CcRsdX/lkqZ78aJvnGdOUlM8DBcaf1Is8kr4pu8IF/E9fEXGHgmM6vA8hy/DWtrCLkxV9SGx2Y4ENssgoq+RCr0pSdesVSCP4qyM9ci8L8gjZb2ZYxg3LCUPyKexuDEwSaWdlQxwyI3mNoOHAmhgKQRw9ftza7xVKYhl9EWo7EnfkcnY41aq8iRZqiqyU0WxjHQ+5GF0v7AcxDkkzZCDB3juhdq6SpvVHLHh6JK7+2FpeoR9Undlohzm7hAjKyHrLPjrTuPOSsZcY3WGo55Mjxs7hlqcghRa/HJz3PdsITWzFB/qIvo8CmaB+4/vaUvt2+26C5Lsgxcjha3NnOfL+wUxNOH8FIP/vp0SgFb8VLkj3rLNZj0rzOACdy+j4jNIfwnlYIFObR7FoVGlQ5NMCtEb3ZxzMBf+c1Cj2/69mb+q4riQr3AMmFdELomYiqKLttMx2HErPKWK273wNx7ZUf10pY85jpu1MNFLJGMIKbASPefysAQhafSVbBakR1Ry0hvsqwUp9uN9b2TJEJdyEiR6fxnHKN4Z1eXjOmw2ZZIgGwTHXTG13LaTNvYPRG9kXGA9WFHTFWEN0oYWMfHYtBrJfJpXPIbpjrMdg2DfnFi9GsBhVlcU8GZlpbwE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmovM3N6Y29sMjRQMG9kU0RPNnY5V1ZzK3FUTXhISzhwMVlHUmhoQmI3aG1S?=
 =?utf-8?B?ckZmRVV2YzdnNVVrbDd1SE1renoyUjd0ckJINmlJK2pFQTBpcEM3SndMSFhV?=
 =?utf-8?B?K0k2N2xoWmxMclpOS0Zuemx1OXlBK016cTZTejRuTVo4VE9BQ3loeUF5dzZH?=
 =?utf-8?B?aEFSUEczVkwzSEd3M1dka3JZWktUQmJXNVpOUU9EczZrOTByWG4wWDRPQjBY?=
 =?utf-8?B?dEliYnBwTkpCSW9uVWFJdDM4UE5KWGUvVzlpMFk1Z0RZSzBIVitMYWtCTFRk?=
 =?utf-8?B?c1lGVm9KWHY3VVpZalFtaXNZNWhUOUxidFh4Tkl5MkxsNDJXMC9jMGpqTnRC?=
 =?utf-8?B?eGoxcUlSdWlXMkJ0QThyQlhNbzVrVmRadXVMMjB3TE9BZkMvRHRVdVJSWEJ6?=
 =?utf-8?B?aFc4SXV3RkRTVjN2c1NvSmNjd2lEdW1ONERsb3F0ais3SmFiNWNvMDVPa2pV?=
 =?utf-8?B?cDdqbXZ4aTRaNFJMbWkxVGt1eU9aS0xYQTYzMmhyMm9oRjZoY2pvQVBoSG1a?=
 =?utf-8?B?a3ZNbHNIK1o0Y1lkODhKRkV4eThxVjM5eDVYS004WENTTlQ2RXFINWRIZ3Zn?=
 =?utf-8?B?eU9QYzQybzJnT0ZmRmQ2N3NNRjF0YlI3ZjA4TWRCc1hleStVYmVaMDZrTW04?=
 =?utf-8?B?QkNrbjQ4eGpac09ydHdsa1F0Y05Pa1JVNWhTTXpxMTB0NUh2WnJjYk11VWVI?=
 =?utf-8?B?WGd6NndQV0pRWGV5VWh6dnhhZTNlS1ZwSjRFY3pyWmVuVXRKUHpia0FpaWND?=
 =?utf-8?B?VTFRSTkzeFZpZlRxOXVmVnp2bERpcnlaOFVEUnVTWmdjVkZBVzUwblBnU2wr?=
 =?utf-8?B?a2ZiVngrUXd5RFdQblVPV1J3SlRoTndIVEFCaUlTVHhJbWtsbzRRbXVNd0Jl?=
 =?utf-8?B?S3pvbmhmL0E2WXpFbVI0bkwybVNDZmExQm51eDkwVUxLU2RIOXpnYjZhZVlJ?=
 =?utf-8?B?OW1Lc0l1eFUxQjErVzRjUWIxTXp4Nk5hc1BwYjgycTRwKzVkd0U5eFhXMjRu?=
 =?utf-8?B?OVZIMTBVSENaRnlZM2d3YUhOTDlQOTQrM29QS0lqN29MbXJHU2JOanVuc3RR?=
 =?utf-8?B?dXV6RmtNeElJYXp2SzcwbmZIcXFKK0NIRm9KK1ZTbm9UZmZrR2dXdDdVc25p?=
 =?utf-8?B?VWQvN1RiL2ZScjE0ZVFDNEpleE9VTit1UWpKV2UyWU1CT0RIcEUycDlXbDYw?=
 =?utf-8?B?UW1SanhPRHEzRk81YmJvTDYvTENpQXg1M0d4Y05pM3JadzlTV0ltRHhvazQz?=
 =?utf-8?B?OXpSekxCYkU0NzJ3bUZ6QzhTSTJybk5nRWxRQ0p2OC9PbWlQa1FXZktDUGRk?=
 =?utf-8?B?T1RRbkVoekFSQ0pnUzJsSHB0TGxwTU9RSGxDMXR1OGlRQTdLRmtHaTV1L1l0?=
 =?utf-8?B?KzIycEtxTlVyVThISnBFdDFmSFR1QjQ2enQwOU13U3ZQc2kyVC9MSU9XeVFx?=
 =?utf-8?B?MkFKQkM4ejlvQ0hUVjFCY3p6NFFqeU5PR21rWGx0bThONklTekxMSENJbWti?=
 =?utf-8?B?ckl1MUV1MVBoQUhDRmtBb3QzeGlMMjdodlM4ZjVvUjc4TFVrZEo0TEZkRCty?=
 =?utf-8?B?b2RkQ0xrbUp6Z3lDREI4ZzArNDl0Vy93a0NTY091bFpGYTA5cTFibnAvQzJX?=
 =?utf-8?B?QXowd0VSTnkzUlp1c25qL0hmNTExV01aTld5U0dkaDU0OFc3RFlDTThlSXFK?=
 =?utf-8?B?akFnUExobTFYRkpNYlF2VEoxWTNVNkVHazRQLzFBdkJxSmo2d3NtREpOamIw?=
 =?utf-8?B?Tkd0OWE0Z2NRU1Y1QnhrZnBGRmpJaWIxQnlhNkdjcURHaUd0dm1lUDYvUVdi?=
 =?utf-8?B?TFlWSlZrc3JxSzZEaWFSK0pKeUxZUVJRT0QzTTFTNzVKeHFIY1Fpa3U3UEdX?=
 =?utf-8?B?L2FOdTJPSUxhbFhWWE5zODZWb1VtdUlNU3I1MXc5Y054RjJSa0ZEaG9hZUw0?=
 =?utf-8?B?bW9XTXlIUUtWVU1EOE95K1FZMkcvRitFemRhV056Z2psc09raWdwckYwOTd4?=
 =?utf-8?B?SFIwYlVDQmZHNFJveTVxMGRDaDQwQzhZVjMwYUJJb2dQOXdTUjBNaDc5WHh1?=
 =?utf-8?B?SHJzMDRHaEo2QmxCV1JnWitRNWJWV2lrRjVvUWdqK0RvMEtuQ3k0YlJOcVln?=
 =?utf-8?B?NHFWME8xM1kvMVhwa1QvZW5QaTh2S291VXFnRGNYUGQ0OFZmaWk2UjNtOWlP?=
 =?utf-8?B?Nk02SFBobVFvaE4yMk9zTTNCOWZGejhRMWNUZmtxY0xnOFlaMW1mcDRSRDd5?=
 =?utf-8?B?QlRoUXBLOHpaYzJmQ1dTNTdOTjIxRnd2LytyWmdDQzA3ZEIySVNhQjFtTXUy?=
 =?utf-8?B?NDZIbm1PTXk4NDJISVZHYUlsb2I4dk1NQmM5VzNDeDVKRndQVVlpSnV2UU5U?=
 =?utf-8?Q?yBlyeXckVSFdZwVmYDgwc4FheXGBk0BfteNfJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b10cad7-3426-4793-babf-08df246b91e5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:07:33.8794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9TiuomnMi9OIrqpp+J3IXXNuYEcGOuxL9HkJCr94UWdoBmEd+xSyy9gg0NT1XJoV+d3oTwciRhO07aBc9f9WH5ua/Oslemgh+06Ljb2YkuoVFRrUH2AOeKGODlz2LMW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

From: Peng Fan <peng.fan@nxp.com>

Replace open-coded mutex_lock()/unlock() pairs with guard() and
scoped_guard() across the debugfs code.

 - regmap_debugfs_get_dump_start(): guard(mutex) replaces three
   unlock sites (kzalloc failure, cache hit, end-of-function).

 - regmap_next_readable_reg(): early return for the common case
   and scoped_guard for the cache fallback path.

 - regmap_reg_ranges_read_file(): scoped_guard wraps the cache
   iteration loop. buf and entry converted to __free(kfree),
   eliminating manual kfree and goto cleanup.

 - regmap_debugfs_init(): scoped_guard for single list_add.

 - regmap_debugfs_exit(): flatten if/else into early return and
   scoped_guard for the early-list cleanup.

 - regmap_debugfs_initcall(): guard(mutex) held to function end.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-debugfs.c | 83 +++++++++++++++---------------------
 1 file changed, 35 insertions(+), 48 deletions(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index 0a9c27426f15..b62a5dce027b 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -107,7 +107,7 @@ static unsigned int regmap_debugfs_get_dump_start(struct regmap *map,
 	 * If we don't have a cache build one so we don't have to do a
 	 * linear scan each time.
 	 */
-	mutex_lock(&map->cache_lock);
+	guard(mutex)(&map->cache_lock);
 	i = base;
 	if (list_empty(&map->debugfs_off_cache)) {
 		for (; i <= map->max_register; i += map->reg_stride) {
@@ -129,7 +129,6 @@ static unsigned int regmap_debugfs_get_dump_start(struct regmap *map,
 				c = kzalloc_obj(*c);
 				if (!c) {
 					regmap_debugfs_free_dump_cache(map);
-					mutex_unlock(&map->cache_lock);
 					return base;
 				}
 				c->min = p;
@@ -162,14 +161,12 @@ static unsigned int regmap_debugfs_get_dump_start(struct regmap *map,
 			fpos_offset = from - c->min;
 			reg_offset = fpos_offset / map->debugfs_tot_len;
 			*pos = c->min + (reg_offset * map->debugfs_tot_len);
-			mutex_unlock(&map->cache_lock);
 			return c->base_reg + (reg_offset * map->reg_stride);
 		}
 
 		*pos = c->max;
 		ret = c->max_reg;
 	}
-	mutex_unlock(&map->cache_lock);
 
 	return ret;
 }
@@ -191,10 +188,10 @@ static int regmap_next_readable_reg(struct regmap *map, int reg)
 	struct regmap_debugfs_off_cache *c;
 	int ret = -EINVAL;
 
-	if (regmap_printable(map, reg + map->reg_stride)) {
-		ret = reg + map->reg_stride;
-	} else {
-		mutex_lock(&map->cache_lock);
+	if (regmap_printable(map, reg + map->reg_stride))
+		return reg + map->reg_stride;
+
+	scoped_guard(mutex, &map->cache_lock) {
 		list_for_each_entry(c, &map->debugfs_off_cache, list) {
 			if (reg > c->max_reg)
 				continue;
@@ -203,8 +200,8 @@ static int regmap_next_readable_reg(struct regmap *map, int reg)
 				break;
 			}
 		}
-		mutex_unlock(&map->cache_lock);
 	}
+
 	return ret;
 }
 
@@ -361,8 +358,6 @@ static ssize_t regmap_reg_ranges_read_file(struct file *file,
 	struct regmap_debugfs_off_cache *c;
 	loff_t p = 0;
 	size_t buf_pos = 0;
-	char *buf;
-	char *entry;
 	int ret;
 	unsigned int entry_len;
 
@@ -372,15 +367,13 @@ static ssize_t regmap_reg_ranges_read_file(struct file *file,
 	if (count > (PAGE_SIZE << MAX_PAGE_ORDER))
 		count = PAGE_SIZE << MAX_PAGE_ORDER;
 
-	buf = kmalloc(count, GFP_KERNEL);
+	char *buf __free(kfree) = kmalloc(count, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	entry = kmalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!entry) {
-		kfree(buf);
+	char *entry __free(kfree) = kmalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!entry)
 		return -ENOMEM;
-	}
 
 	/* While we are at it, build the register dump cache
 	 * now so the read() operation on the `registers' file
@@ -393,31 +386,27 @@ static ssize_t regmap_reg_ranges_read_file(struct file *file,
 	/* Reset file pointer as the fixed-format of the `registers'
 	 * file is not compatible with the `range' file */
 	p = 0;
-	mutex_lock(&map->cache_lock);
-	list_for_each_entry(c, &map->debugfs_off_cache, list) {
-		entry_len = snprintf(entry, PAGE_SIZE, "%x-%x\n",
-				     c->base_reg, c->max_reg);
-		if (p >= *ppos) {
-			if (buf_pos + entry_len > count)
-				break;
-			memcpy(buf + buf_pos, entry, entry_len);
-			buf_pos += entry_len;
+	scoped_guard(mutex, &map->cache_lock) {
+		list_for_each_entry(c, &map->debugfs_off_cache, list) {
+			entry_len = snprintf(entry, PAGE_SIZE, "%x-%x\n",
+					     c->base_reg, c->max_reg);
+			if (p >= *ppos) {
+				if (buf_pos + entry_len > count)
+					break;
+				memcpy(buf + buf_pos, entry, entry_len);
+				buf_pos += entry_len;
+			}
+			p += entry_len;
 		}
-		p += entry_len;
 	}
-	mutex_unlock(&map->cache_lock);
 
-	kfree(entry);
 	ret = buf_pos;
 
-	if (copy_to_user(user_buf, buf, buf_pos)) {
-		ret = -EFAULT;
-		goto out_buf;
-	}
+	if (copy_to_user(user_buf, buf, buf_pos))
+		return -EFAULT;
 
 	*ppos += buf_pos;
-out_buf:
-	kfree(buf);
+
 	return ret;
 }
 
@@ -552,9 +541,8 @@ void regmap_debugfs_init(struct regmap *map)
 		if (!node)
 			return;
 		node->map = map;
-		mutex_lock(&regmap_debugfs_early_lock);
-		list_add(&node->link, &regmap_debugfs_early_list);
-		mutex_unlock(&regmap_debugfs_early_lock);
+		scoped_guard(mutex, &regmap_debugfs_early_lock)
+			list_add(&node->link, &regmap_debugfs_early_list);
 		return;
 	}
 
@@ -653,29 +641,29 @@ void regmap_debugfs_init(struct regmap *map)
 
 void regmap_debugfs_exit(struct regmap *map)
 {
+	struct regmap_debugfs_node *node, *tmp;
+
 	if (map->debugfs) {
 		debugfs_remove_recursive(map->debugfs);
-		mutex_lock(&map->cache_lock);
-		regmap_debugfs_free_dump_cache(map);
-		mutex_unlock(&map->cache_lock);
+		scoped_guard(mutex, &map->cache_lock)
+			regmap_debugfs_free_dump_cache(map);
 		if (map->debugfs_dummy_id >= 0) {
 			ida_free(&dummy_ida, map->debugfs_dummy_id);
 			map->debugfs_dummy_id = -1;
 		}
 		kfree(map->debugfs_name);
 		map->debugfs_name = NULL;
-	} else {
-		struct regmap_debugfs_node *node, *tmp;
 
-		mutex_lock(&regmap_debugfs_early_lock);
-		list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list,
-					 link) {
+		return;
+	}
+
+	scoped_guard(mutex, &regmap_debugfs_early_lock) {
+		list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list, link) {
 			if (node->map == map) {
 				list_del(&node->link);
 				kfree(node);
 			}
 		}
-		mutex_unlock(&regmap_debugfs_early_lock);
 	}
 }
 
@@ -685,11 +673,10 @@ void regmap_debugfs_initcall(void)
 
 	regmap_debugfs_root = debugfs_create_dir("regmap", NULL);
 
-	mutex_lock(&regmap_debugfs_early_lock);
+	guard(mutex)(&regmap_debugfs_early_lock);
 	list_for_each_entry_safe(node, tmp, &regmap_debugfs_early_list, link) {
 		regmap_debugfs_init(node->map);
 		list_del(&node->link);
 		kfree(node);
 	}
-	mutex_unlock(&regmap_debugfs_early_lock);
 }

-- 
2.51.0

