Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7174570CF
	for <driver-core@lists.linux.dev>; Wed, 23 Sep 2026 12:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166451; cv=fail; b=szy+6HPkGab9P95zXStikqciWoyOgUWtOs5oznF269HpZyqD6/84iGcCH3RHngXnfkLaekEv2CEgDkZC0w+DxvVfXy9iZI5BVDMsxexzAH2gryJImxyVv1AM2Ln8zYaemr09O0qgP8XiMFxbkrSO9LPfQsLrM2lc1H/+trYi8Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166451; c=relaxed/simple;
	bh=rsOqpE8WfhWWNP9wcabPrYxAEecyDyL6pN4iHofBpgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OL8DllQAu+QyRwiIEot0vg1a8mI31SYImmf+THJDD3PpaPb2/GVpWtaS6lpynSYsccqxfadwv2DdbKdfcWZJAZEt+HIOrQBI9xt+kjOFvg3b2GRgkkmSqqcS5FDBFfgUq9B1wfybymfwKRqo6o79YVQIw3S23oFJR5Z5yNoci7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hTCcLolz; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hTCcLolz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i8jKKUhu+JFOMuYfFtKm2Tkm3TjkFRy90dzXyA657SfdQCYTvm3XrZahP/TPaDlDPXBcj/EVzNHXIenr6sryMKG8agpT8J01OLvhlI9uGkFKdH2JLFlwaEGmNW/9xxBfWikn/+c1MoYS509GxKfE7yPGgorDNoKtAGnO7iTrY1TKk8AH8mPv6jcXefAmPf5FB+9S0cjsAXH/a1jzGzp2GkGc2zAbobqanQq+tUiKkukSdai9E1P0Ni0KYARIDSfLyMR0Ios+GHZ8G+uURxU/ByYhewJ7IT5adNIlO2bah9xI4WHNhb8iVS4bmgxQ3w9OSIIcvyzCHaAhwE4XuLmVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sw7m9ei6+Ro/6Aq4X7DE508umiDrDH1wYyODwHzDvXk=;
 b=gZmr4dBpxWHqwxcIp7qALwgysteOwuDkhsjvDV2RJPC8bcpUjSx7YKHaXP2Zun5jFoth3pgqL6MlKdxmlvCX7y4+Jj9GEqeB7eITvh4bkoCFQ5GuUEQgsOGf3RfJEM9uOsqes5R2KGTNX1vXXpoE2cRxRkec2+RJbXvtU30NPlntSG7NgTkoPfq31fbYsoXKth0RZeJQLWiADb3FOjYp2JD3ItziMrKaBZXXrNnmdieLlvbvbwjkdpucdEsimBp3/RZkzW+FG5S2rvZW9Cyy10FiPeG6KJ/kOyN+ibRfwmZtpUmHnyTsaM0NGjckF84CUcaELfmATglXHsMH0M/hRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sw7m9ei6+Ro/6Aq4X7DE508umiDrDH1wYyODwHzDvXk=;
 b=hTCcLolz1nHmJ+yEWvyCvhnewpXhLscwPEKg1mBdtFdKIdoxTJCaA2tKZ7yLzDcZh7DppiL4gcejtdz93pNDkzx7gKKXQbI/ba1EBoCvXUvo3e5d3SOK1eN5V9vt+wbURacdjccU4TEYzzEHmkp06qhZfT/80O4fGYoCC3ay4Tw3hTUoUIWOHiog8c1uCKXe/9PBSnrd19KBQNEgcNc+rrhqWg4plh8M6jaXuBxzxNUp83ji3L+vcB/RVCmmNTOZLqVU1beHGpFivtTb7i1bUFFJUKY2XSs20ezVAhc6Rg+qVtJdGo9h2p/ftDaPIJn/TxphKhCqgCGU27Po87aEaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 12:27:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 12:27:26 +0000
Date: Wed, 23 Sep 2026 20:31:47 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v2 2/4] regcache: use the regmap scoped lock guard
Message-ID: <arPGs0VioH17XEr5@shlinux89>
References: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
 <20260922-regmap-lock-guard-v2-2-0c9d426427bd@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-regmap-lock-guard-v2-2-0c9d426427bd@nxp.com>
X-ClientProxiedBy: MA5PR01CA0290.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 9505f6ad-9e42-411b-c139-08df196e06ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BCLdvEFzgR5Cz+DOzfCZdGQoADEluNJcSxQIhyk0LRNqfG4KszLsNFsC/JmDfCIJIdiLXkkhv8qnUVKMMDynZWmwmVUPgtqElJjF+c2VbPfCLccRtXa7uI/ufgy6xduU6ZKP+tUpMoITHFK8UjddIBhymSVBd0CvS1hpxCrq9YlWYuVXNAayFTtKduAG6DkJvViLooxPLLRc3/E4ho5ktIisd7q/x/mNDdnvF3ibDm5IgSvYj6g/tSK7II+UFdz/1dC/mN1ufWbdSfTTUlb8S+GLLRfkfyMjsI0iznMrvGQvvJIFvQhuJ/4EmadRbkvFeDPRGQ2GmOr5kr+3rusXxGkgUQJY3t+C7X/BbJWRthJDowQ/J3f9xf1InVrl5lBenUqvbXiVF/eX7RS8hi7T6MQrJTxasyN5cl08RK7x/6D1vRz+c46JS2TBLBKbBBsW//Jo5cu1Z2Si7CRly1jInENRRfUk0o6wOeR+tCm5Jp+G8e181KaBneHkVjnrblnxEwhsjv2WALxHM+tJwHOVBDUitfgMBMNSEUDn+0n9Xp7ktGMzuBNFj3pKqggJ2jvCseSUfYgoG6TjKc8JXKikIjOBg+05g2y3yA0qoSnMNFYBA9hGKCsDhzZYxmc89OKiezhEA+sLje01GQKhWwvTPxHfzgWuFpTHXqpRPT9i95s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0gS36ACWKm8PhFDFfhzDg3ERt9eYFGa1a8QA+TTxv0dTLaTM7D/T/WsxrFWW?=
 =?us-ascii?Q?3errdqlMSQTZyuKKWrkRSH2OnL+EPRuA78s9reXkNjMfB+ADGlW5nBeQFIRN?=
 =?us-ascii?Q?BPc3ZT+88HDt1EQn/PXJ2PhKVx0StjvHAMcH2viUMlT37DqcByru88pdb49s?=
 =?us-ascii?Q?qL2Nkz6ZczztCHGwFQ8pMgyBPiNTkXrwKo3Qw/Lew7v17xikdAaRFuVDG7TJ?=
 =?us-ascii?Q?U8QQEWZUGHV5rzMPAnjvifpkMDe+z2B8rAe6NQfhxFZeNilntTC3jZNJke8O?=
 =?us-ascii?Q?nA/07VwdDGhohZGF5aPADPKw76Bg6HdvwNqGVyX209wmen67V9BddTKGiRmb?=
 =?us-ascii?Q?7sNAnX+RtMqEqgzi0JNXhGnjKTtHLTmHcWvEkQuASctS4StK0l2gWIyr2WMV?=
 =?us-ascii?Q?4D/QhUuH6PaYunbTyg1ndggVYSCh11uBBNjaXcVU7s9P16jpFyrZQzmMfaOp?=
 =?us-ascii?Q?nJ14ymDeJbm1gyEw4RqntBuxGUJLHr0X2+MTFptHrGrjkGhRslxeL7aN+jyX?=
 =?us-ascii?Q?yFtQFoETEnTLvcJkcSJGlpILnOSJFjlnWiQHT9ycd+83Dt7XT9DCzngdlp0x?=
 =?us-ascii?Q?/AF8zgr1VzgdJFol4bkAkkQ+aF0Jto7hRibxauzn9yrOf2BIxQ9e4Tn04qHj?=
 =?us-ascii?Q?EC7baruErX24eU7e+ZFCSPR38qso+tnMs+Q+tInfNEcZdeDHFSVVIvmVpJHx?=
 =?us-ascii?Q?bKbRwqH7gL878nKUap7wEha18PP6JqRSMk2Spc7foXuvrTeyC5zqKrPmQ/5U?=
 =?us-ascii?Q?7O6pXAx79EMlADJogPwuW0lCGbYl+7p1a4XKGzqY+9DsoHmmkQETx2H8EUxS?=
 =?us-ascii?Q?Vy1UBV2XldIPTGbBclDZq41e2+DPBBzJ9XvTGONmB5PU31MN4s+JRXiDzfaa?=
 =?us-ascii?Q?UnBGsyr8gpCVPDzsXJCZuKbh9gT3aaW7kBkWPTA1d4X2hjZnA4D7hNP/ZNbt?=
 =?us-ascii?Q?sWGJMbDyRRqpVsZb/1ExWzc2ig5hSjhHIvd6BbdNt/1o6rYZ6nkXRJEY/lpu?=
 =?us-ascii?Q?Q7Kk+faRK7ycQlvZQ7LcLnb0mxe37WzMRtqWp+kgxeZ/NBbZcTqrQjkIrKvo?=
 =?us-ascii?Q?9qGDVcTH7/9Th/pfFjT/JAxXMmvC5aB5cbVOF2DBbKazZIVI8n77wUd+OwWy?=
 =?us-ascii?Q?D9nW370oqZcFzJwz6O6IMCYagDCfEAjqeI6RcBBfHbk2dhmh3vgQtvImLZO6?=
 =?us-ascii?Q?Nc8RbEXjw1q6b6gpsBMMAinNmpJkM9W8zst02ENPVhHqW8KamX/sRCaYyhTl?=
 =?us-ascii?Q?U6MdO2jicwO1zX84IGeMb9T9UCkgli36m9ffR2Ea99nOXZymxslZTxoDacum?=
 =?us-ascii?Q?MdvWtiWi5t9c6i/ITJtV47b4UgCpvXJEvbGcp7d4SzHvdkUwH1v3IDRtGaFr?=
 =?us-ascii?Q?S1hSXQbi/VVK9Xl5qvJr7Xj0Rk50EiO5JlXOdMhdOzXL5QTSDPOPVCc3dreh?=
 =?us-ascii?Q?T9df3tPch1bMQfkfuQu6mQ9VP/1dAqc0a5yaY3+vh/I5l+dRYRUTPkqzQIZ4?=
 =?us-ascii?Q?kYRm841emnHLyTeZbw4m9yir/87eEH6z7FdMZG7NBt3SG7nb/vn31dtYSWBv?=
 =?us-ascii?Q?TCCwUwzLT6Gh6+MnV0hniYHEogLxVVtubiXJxVLHTiRL7rrRqyC3Ya2iYknF?=
 =?us-ascii?Q?mF5YuCYQc6f7B4nf8Wp2IFrFgvONOe7KLuWAFJeN/VwNYOqjr69GiJWcWZRI?=
 =?us-ascii?Q?81acLT1Sy8DvKIhA2IavBgmx4QV9TTx2TEhg1OIos2aBBhWC9pOwTzCUWgBC?=
 =?us-ascii?Q?cgtakJhOYXUh2PcLJaDRFERF3l+VVAbxfilaRYu5pxVSuqgUB4TL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9505f6ad-9e42-411b-c139-08df196e06ae
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 12:27:26.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZUcCIFzZvX2D+VGoCWY/Ac1p33SmozWusHH6V7Fu3Bj/rlwhdy59hvp9P7eCAD0KFgX6GryrVYiJ060+cXc0vxg9RYCslgrg6BUrax+M+/bzupR28QxRU5pOCR6SHSe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510

On Tue, Sep 22, 2026 at 07:10:56PM +0800, Peng Fan (OSS) wrote:
>From: Peng Fan <peng.fan@nxp.com>
>
...
>diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
>index 0d58d900a2ca..d030fcbe11d9 100644
>--- a/drivers/base/regmap/regcache.c
>+++ b/drivers/base/regmap/regcache.c
>@@ -225,9 +225,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
> 	if (map->cache_ops->init) {
> 		dev_dbg(map->dev, "Initializing %s cache\n",
> 			map->cache_ops->name);
>-		map->lock(map->lock_arg);
>-		ret = map->cache_ops->init(map);
>-		map->unlock(map->lock_arg);
>+		scoped_guard(regmap, map)
>+			ret = map->cache_ops->init(map);
> 		if (ret)
> 			goto err_free_reg_defaults;

Sashiko reported that goto and scoped_guard should not be used in one
function per cleanup.h.

Actually goto does not break scoped_guard. Anyway, to follow cleanup.h
rule, I may need to use a helper saying:

int regmap_map_cache_ops_init(regmap)
{
	guard(regmap)(map);

	return regmap->cache_ops->init(map);
}

I will look into make the helper to support other cache_ops in V3. and
avoid mix goto and scoped_guard in one function.

Thanks
Peng


> 	}
>@@ -246,9 +245,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
> 	if (map->cache_ops->populate &&
> 	    (map->num_reg_defaults || map->reg_default_cb)) {
> 		dev_dbg(map->dev, "Populating %s cache\n", map->cache_ops->name);
>-		map->lock(map->lock_arg);
>-		ret = map->cache_ops->populate(map);
>-		map->unlock(map->lock_arg);
>+		scoped_guard(regmap, map)
>+			ret = map->cache_ops->populate(map);
> 		if (ret)
> 			goto err_free;
> 	}
>@@ -259,9 +257,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
> err_exit:
> 	if (map->cache_ops->exit) {
> 		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
>-		map->lock(map->lock_arg);
>-		map->cache_ops->exit(map);
>-		map->unlock(map->lock_arg);
>+		scoped_guard(regmap, map)
>+			map->cache_ops->exit(map);
> 	}
> err_free_reg_defaults:
> 	kfree(map->reg_defaults);
>@@ -281,9 +278,8 @@ void regcache_exit(struct regmap *map)
> 	if (map->cache_ops->exit) {
> 		dev_dbg(map->dev, "Destroying %s cache\n",
> 			map->cache_ops->name);
>-		map->lock(map->lock_arg);
>-		map->cache_ops->exit(map);
>-		map->unlock(map->lock_arg);
>+		scoped_guard(regmap, map)
>+			map->cache_ops->exit(map);
> 	}
> 
> 	kfree(map->reg_defaults);
>@@ -584,20 +580,14 @@ EXPORT_SYMBOL_GPL(regcache_sync_region);
> int regcache_drop_region(struct regmap *map, unsigned int min,
> 			 unsigned int max)
> {
>-	int ret = 0;
>-
> 	if (!map->cache_ops || !map->cache_ops->drop)
> 		return -EINVAL;
> 
>-	map->lock(map->lock_arg);
>+	guard(regmap)(map);
> 
> 	trace_regcache_drop_region(map, min, max);
> 
>-	ret = map->cache_ops->drop(map, min, max);
>-
>-	map->unlock(map->lock_arg);
>-
>-	return ret;
>+	return map->cache_ops->drop(map, min, max);
> }
> EXPORT_SYMBOL_GPL(regcache_drop_region);
> 
>@@ -615,12 +605,11 @@ EXPORT_SYMBOL_GPL(regcache_drop_region);
>  */
> void regcache_cache_only(struct regmap *map, bool enable)
> {
>-	map->lock(map->lock_arg);
>+	guard(regmap)(map);
> 	WARN_ON(map->cache_type != REGCACHE_NONE &&
> 		map->cache_bypass && enable);
> 	map->cache_only = enable;
> 	trace_regmap_cache_only(map, enable);
>-	map->unlock(map->lock_arg);
> }
> EXPORT_SYMBOL_GPL(regcache_cache_only);
> 
>@@ -639,10 +628,9 @@ EXPORT_SYMBOL_GPL(regcache_cache_only);
>  */
> void regcache_mark_dirty(struct regmap *map)
> {
>-	map->lock(map->lock_arg);
>+	guard(regmap)(map);
> 	map->cache_dirty = true;
> 	map->no_sync_defaults = true;
>-	map->unlock(map->lock_arg);
> }
> EXPORT_SYMBOL_GPL(regcache_mark_dirty);
> 
>@@ -659,11 +647,10 @@ EXPORT_SYMBOL_GPL(regcache_mark_dirty);
>  */
> void regcache_cache_bypass(struct regmap *map, bool enable)
> {
>-	map->lock(map->lock_arg);
>+	guard(regmap)(map);
> 	WARN_ON(map->cache_only && enable);
> 	map->cache_bypass = enable;
> 	trace_regmap_cache_bypass(map, enable);
>-	map->unlock(map->lock_arg);
> }
> EXPORT_SYMBOL_GPL(regcache_cache_bypass);
> 
>@@ -680,12 +667,10 @@ bool regcache_reg_cached(struct regmap *map, unsigned int reg)
> 	unsigned int val;
> 	int ret;
> 
>-	map->lock(map->lock_arg);
>+	guard(regmap)(map);
> 
> 	ret = regcache_read(map, reg, &val);
> 
>-	map->unlock(map->lock_arg);
>-
> 	return ret == 0;
> }
> EXPORT_SYMBOL_GPL(regcache_reg_cached);
>
>-- 
>2.51.0
>
>
