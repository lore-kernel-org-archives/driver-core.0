Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0126D3E1D17
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761807; cv=fail; b=pz5Z3vZcDb5ATiILwswB/GbegxI0Z8G7FXQrfF7/Bks40wIQ2m1Y1I+PN0oGqtl92ERpeoOoTZdWKDyhIY9toDFI7Z93k5ktcZ1jnGUMkZwPpuclr7HEeQN+Lr7U+ag2Y+ek0BN2vq35siHFUS4W6UGfmra2wQh9Kq9Erujyc+E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761807; c=relaxed/simple;
	bh=oiktoNQkD2EKDPMr2Z4Kbq3xflzqqkiUbMaMOpEkf4o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yp9L0vlODzeVYj/YIkoJOk/l1RSHFyiAE9OmgE010gHq7leUglSAzHgi+tfUrFGRkBks1iMHG9mES2qyi5TijTvdGsU9nph1Sq/aK4nLxPfwI4uxOUlOKGEqiOZJSuHx7ubaQi28q/1cdiIyZEL09FqNv54pgV1uZzMdS39Lbls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Qa2ZJipq; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Qa2ZJipq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O3ya9F5woRr2aMxrKz5KYdMKvqUQZM2u74Fs/o/KEtlk4DAU1GZ+FQ2OTY7D+kz85zUYHw03OtRLMaZzeSbWrjfy0y1gydBSU0VIhMhGF7lprI3LhGl1vIA9+ExRZIRI1rXYQPGLOyfDamGkHU9U3qmxR7CsBYi3qCsfT5iXPxUH7G98sxYWEutHmUDxUTMWpQ0WpOkoVDT9kIiCr2Cxs141yPSyPbw3O9a0M0Sn9/gb9vQ6U1MLJbI8mINRonAvSjHBXpCb9HfXXGhMiEg/mCCCOQKWdj3sOUaiN7E82Gda3q1W2Y0flnuLJmzemfGgrkxelCm+3vQch/qEzbnygQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9JHuyMeymcIkNSx/WVNQpMTFXWmiB2b6I+HUytvPg8=;
 b=u90lQAvYkNEVxF059USm4nw6Cnmc9fr+42i67tnGUKkuZ8Ud/vtpUX3NIwUBsnPhRakyKFgVe8b5bou5t0BNMgOKkg1Oq68BzYwi0D7fl6FDx8K323ovXFc9hibs6fiqeLCeFQyKkUjDAi4mD+PSK5ylIdZyi7Vs4tg+0zZcS+6tGVp5RBCqcaqssGb3aQ99GScTffuHdSnDcnvHaDb7V4iD99onwfOAMfxOoEN4n4ID2WWNDm+BDaR7nhY5cuX6Wn2jdFOfJa+txJ0u5SiKvkP0CM0N5YczxEKp9cZM882iFfXr1MRDOlFp+ML/DjrVVCd11S51C9dvTbm8gEzF9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9JHuyMeymcIkNSx/WVNQpMTFXWmiB2b6I+HUytvPg8=;
 b=Qa2ZJipqaEp37P15XmWeikDhWZNNj0pf0PrVTG3mW8aSErK9KleCvfmsYBF+6fzwcEQyaNcg2T9mPTCCxZEwofuuRV0RqHJ0bXdnORgALdZcvag4hJ7wrbBLt5rvpuCbKZYQu2l7qtwCKCg/BsBGc9nRifjg+sfxlypuTQ/Npo1QMnujqhYdv7/dwFw5k4JBjaLEVYhaJUUMObrdqfNu/oIHS5AgfYy1NuulyF6hMmggg5Guez9XBur6Xd64DxMoC/L3LFj+iwqhxTw/1UfXxLqoud41b+2jsyT4w+mURhqgnYy09wkVSjgvBygm95voVuZ+glyJMwFLUZn0jdDuRA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 30 Sep
 2026 09:49:58 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:49:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 17:46:57 +0800
Subject: [PATCH 3/7] regcache: simplify control flow and reduce nesting
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-regmap-lock-2nd-v1-3-33a8a482f9ae@nxp.com>
References: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
In-Reply-To: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 2222cf9d-15ed-4e31-8f40-08df1ed8301b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dUVrM+LnAkZ8NYRgdMpVinqQr6OQ4Moop1X98wn0SKNMnfBjq1aLWOEKBfgVmn8L4+zMGRPGUx/kGBxTM5WjSG0OUMase0O0sR9GjtuQSvBV3Zz1Ok7e6zr9DLPcUith3cofM4de7TXvgWWjKVe4bk/N+RyZ3k+7TwkdMfFwLhBb8UJPSiAJJXR1fyLKfPeZWvtqcBWjJNkCIYUrBzsV7VSDEBTMtCaU3R7SGIEoLO643m4KFgxwjHEF3OKtSHGqhTQG+oylKVwrjDboiUDKvTLjy+HE8Nh9EIGPWYo83rSJ1wjowc6djrRXknri5F9PQ46j1x6UUkOaaVBslAs5KMapXvYKnQfVpwgbDMlHelMQC2oeUowoDM1NYlqxGxLTg8hl107wyhL+ejFkUa+JWyn1MkiqRW8P2RlJ1RpdAerKTVBdIOdn9CtUttCbe57wLYvqZkZwmhWv3Xs7nk85GQ0iULMIkXdrJIiA7HGermY5Q8vvzmZHD7KtfUkYOkF9nziEPpVu5Zw7D6340n2pZei19IaSuCYV/h4t6sOyx6WAZEFHvIpmSaaowmvVtMYTEl4T1iyEDjf0U5Ks1uHhZkPuFtPW1tUihsdcsUXzGdHI7V1jUY6aMjE0u0UX6PPXUYbnpKlHj8lBsjouAjHI5ll59ovpsrPDqJZwEFiYuZc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3JLNGtxUm1UNUIyYmdaNFVUTzdLcmpnZExKZnBEclcrWjFPY1c1YjI5WEln?=
 =?utf-8?B?TVQ0ZjdkcDhjejNGc1A0SGp4SkRJTDdGWVROUXZQVmFwaHlRcE82MUpkcWUy?=
 =?utf-8?B?Y0dVaGpwY2h0eWErVTM3UFh6aEFUaW1adTA5UDM3clcwUGg2aW1oU050NlVU?=
 =?utf-8?B?UHY0ai9ZNk5GenBTQm5NUzFZSi9oV1RrbnZ4SXg2VXVNckVkendocHh6WGFU?=
 =?utf-8?B?R0FGbWtzMG96bjloZ1FqZXBvTHM0WEozVTdHN1VtekQrdzZHOW9DY001VmJL?=
 =?utf-8?B?YllBWHNwb0J6ejFrWTdJSzNWeGNXR1YxZXZvMzZKcGdDaGl5MTYrNWk5NWFC?=
 =?utf-8?B?ekJCaEJzRmhVM1E0SjlnZjY4ZUpBZktSK0FQK0xoMXNsN2lRbVg1VTBTcHpX?=
 =?utf-8?B?KzljOWwwOXNxKzNEbWZscWQ0bXgvNWFNbGxTZjVLQ2g2RHpFOHpkMVExNXYw?=
 =?utf-8?B?QXJrbkRTL05lWlI5UGZkNTVpK1V2ODYwYU1mZkxkNEVMZW9YbVVmRktLUjB6?=
 =?utf-8?B?YWVvWEFubldQdFh6M0p0UHFVRWwwUGE0VUkwRVdkenNnTmN1MzAzV3lDSlFT?=
 =?utf-8?B?ZjRXdFZsVXh5WnFOYjBmT3ljOWhrT3YxbzVOaWdGaEppUGQyckhoVU5KU3hw?=
 =?utf-8?B?VmJabjhmOTdpZEJLbEtkRHhjMzgzU1k0dHJNNlVxOHBERVBzbTJGUlhSUHdH?=
 =?utf-8?B?aXo2c2F4U1FSZ2tObkROS2x2QWFTaE1BTW1yUm4zSUFscHNXemtQUDdlMGlu?=
 =?utf-8?B?SVFsMVp2dHNqcXFSTDBSQlF0YUNaZE5BM3ltYU1tazBhN2dWcm1BS3JHNWlX?=
 =?utf-8?B?ejJ4Z05uUHBDcFNuaHhITVB5S0RIVDJjNkxibFhEZmNwTjVUZjY0dnRqZUlP?=
 =?utf-8?B?Z1ZoVlRsSXNEbU1Na1Raa1BqTHB6c1ZmVDZrT05iZExMcGRUeUdzclNDb0VG?=
 =?utf-8?B?aWdxT3JzK1h3T1RCY0plVCs2WkxQMC9OVlB3eEMrRFhad296RzMwUlpKaWJy?=
 =?utf-8?B?NVNscEVXVTBabzRBcmx5NWh6bnczK2VITlNVYlZwdHRYelFuT3lFSlE5YVRw?=
 =?utf-8?B?ekNaOVUzZkZFL2RndkZiZHRVRU5SL2Q5Ti9pdHdBbEsyMFl4VDltaUpadm0z?=
 =?utf-8?B?SDZuWmU5ZWcyVlVJVUs2VzkrNmJiNmUzY2YrQURTUUV5cDlGQWdpZ1g0dE1X?=
 =?utf-8?B?ZFVwMndwTWx0Rm1tL3NTbzlHRVdsL08vMXJ0YlF2cFEwOCtZL2lXYVV3UTFk?=
 =?utf-8?B?OHV2QVhjR2Z3dU9ybU1VQTMzc0FoYUxnUTVmRzVueGNZbFlSWDVVWUFWSkpE?=
 =?utf-8?B?aW9pTEtGRmpaelNUQ0lRNGY3NnpTQmlKOW9vZHFVRThCcTFzczdsRTZwQ1VR?=
 =?utf-8?B?UGNRa2RZMFpuUXdIMGpuaVVUZDZoL3JIRnlOV3djTFdtcC92VWN5enhsZkdn?=
 =?utf-8?B?ZFBiZ0dlNGVBQjdQUXBJZDMrVDlWUHdPNUJ5V010WXpFRDZWeFZhcHFMZ0FU?=
 =?utf-8?B?QUwzT1gwa3kzMlBSVDloZmtxbjg5WHYyTHBXZWFLemovSmlTRitDdDNiTDNM?=
 =?utf-8?B?V0xSZFFSM2ZYVTZFR01uTG14aUNJdWhGVHcvL1NYeUluQ29MMHJRRWUxaC9o?=
 =?utf-8?B?WHJTeUNFOSszdzJSS3NPMTR1bHZwN0xoakNrM0hFWllVRVdVbHl3QlNMVytL?=
 =?utf-8?B?L0RLL3ZWNHlLcVFReWlFUlVQZjRYQ1NaWG1CTEhwUUhQUkZwdVlCUWpQaS9M?=
 =?utf-8?B?dG5qRjNOS1h3UFZvRWJKZ3BqK0RFR2xrRmtYMmVDRGJoaWZXU0tlNTI2bUY3?=
 =?utf-8?B?WEdPYktqK2tncWRHZGFPVnpMVzlrRWlHZk1FUVY1eGx5NmpYNkZWektZOFhF?=
 =?utf-8?B?L2luMTZrS0pnNDJvYnBSL3RZWURFaGVZYXJsSjhkbnF4WkNucUgvOFF4Slh5?=
 =?utf-8?B?YTZQUDkvV3F2d3dyK3VlcmZCL2lTVE1RTGRyMmp6U1UvVW4vOE90RTRGRVlT?=
 =?utf-8?B?WGxuR3hHS1M5aUI3Z3M0R3NCellLcFA2MDZQRDdHaWFLY2pjNUFIVU1KalZt?=
 =?utf-8?B?T0p4Rk11c1pTcU5vaW1NejBQZUhjWWhhZ2hjM0lUWnNsa3hJZGRxa0ZzUTE0?=
 =?utf-8?B?c2ZBQllWYi9hY0lTZFBFeXMwQUtNZnNScDhCenhUYzdEMTBrODVxeU1Gbyti?=
 =?utf-8?B?cmRiZG5vMFVpNUxWalRPT0grY3k0bUc4b29JMVlqenViNEIxUW83TnAySXpm?=
 =?utf-8?B?YmtVd0lNZkhac2JDaEIreHRuV0FleDhuNEdjUlJLSFd6dTJKSkN1bENqVGxt?=
 =?utf-8?B?VWYwNXBlSTF2N3RPK1kwR2FuMWwxanRiMWluM24zWDdqTUVkcUZ6SmtTazRG?=
 =?utf-8?Q?x1IZ1bdzSmawzpLPgrxJArvYYkM9Cp9TcAMpn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2222cf9d-15ed-4e31-8f40-08df1ed8301b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:49:58.3037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n70T3LjQHmd+YjktcpKQfEHCGuKQtexN98e0zyhONq5KGqTnUHwrxm7/axESTUagV5YBoA+67HoTF7sn38ydTF2y0vbe/UhsXEWbdzkaZYR2i8cxeRYVJAL5/MEYVzSN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

From: Peng Fan <peng.fan@nxp.com>

Move the count guard into regcache_hw_init() so callers don't need to
check before calling, and flatten conditional blocks that wrap a single
call by using early returns instead.

Merge the two separate reg_defaults / num_reg_defaults sanity checks
into a single expression, and drop unnecessary else-after-return in
regcache_lookup_reg() and regcache_sync_block().

No functional change.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 50 +++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index b486cd826b3c..136d6adf3120 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -58,12 +58,15 @@ static int regcache_count_cacheable_registers(struct regmap *map)
 	return count;
 }
 
-static int regcache_hw_init(struct regmap *map)
+static int regcache_hw_init(struct regmap *map, int count)
 {
 	int ret;
 	unsigned int reg, val;
 	void *tmp_buf;
 
+	if (!count)
+		return 0;
+
 	if (!map->reg_defaults_raw) {
 		bool cache_bypass = map->cache_bypass;
 		dev_dbg(map->dev, "No cache defaults, reading back from HW\n");
@@ -174,15 +177,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		return 0;
 	}
 
-	if (config->reg_defaults && !config->num_reg_defaults) {
-		dev_err(map->dev,
-			 "Register defaults are set without the number!\n");
-		return -EINVAL;
-	}
-
-	if (config->num_reg_defaults && !config->reg_defaults) {
-		dev_err(map->dev,
-			"Register defaults number are set without the reg!\n");
+	if (!!config->reg_defaults != !!config->num_reg_defaults) {
+		dev_err(map->dev, "reg_defaults and num_reg_defaults must both be specified\n");
 		return -EINVAL;
 	}
 
@@ -215,9 +211,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	map->cache = NULL;
 	map->cache_ops = cache_types[i];
 
-	if (!map->cache_ops->read ||
-	    !map->cache_ops->write ||
-	    !map->cache_ops->name)
+	if (!map->cache_ops->read || !map->cache_ops->write || !map->cache_ops->name)
 		return -EINVAL;
 
 	/* We still need to ensure that the reg_defaults
@@ -266,17 +260,17 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	 * we cope with this by reading back the HW registers and
 	 * crafting the cache defaults by hand.
 	 */
-	if (count) {
-		ret = regcache_hw_init(map);
-		if (ret)
-			goto err_exit;
-	}
+	ret = regcache_hw_init(map, count);
+	if (ret)
+		goto err_exit;
+
+	if (!map->num_reg_defaults && !map->reg_default_cb)
+		return 0;
+
+	ret = regcache_locked_op(map, map->cache_ops->populate, "Populating");
+	if (ret)
+		goto err_free;
 
-	if (map->num_reg_defaults || map->reg_default_cb) {
-		ret = regcache_locked_op(map, map->cache_ops->populate, "Populating");
-		if (ret)
-			goto err_free;
-	}
 	return 0;
 
 err_free:
@@ -762,8 +756,8 @@ int regcache_lookup_reg(struct regmap *map, unsigned int reg)
 
 	if (r)
 		return r - map->reg_defaults;
-	else
-		return -ENOENT;
+
+	return -ENOENT;
 }
 
 static bool regcache_reg_present(unsigned long *cache_present, unsigned int idx)
@@ -900,7 +894,7 @@ int regcache_sync_block(struct regmap *map, void *block,
 	if (regmap_can_raw_write(map) && !map->use_single_write)
 		return regcache_sync_block_raw(map, block, cache_present,
 					       block_base, start, end);
-	else
-		return regcache_sync_block_single(map, block, cache_present,
-						  block_base, start, end);
+
+	return regcache_sync_block_single(map, block, cache_present,
+					  block_base, start, end);
 }

-- 
2.51.0

