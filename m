Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011007.outbound.protection.outlook.com [40.107.130.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3663AF657
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761809; cv=fail; b=FrpuIYSsQ394wCtU7gT51ajcJ+7401Wi2yEk0TMG9b56+KofspufdzAukPxG7KIKscCwHa+VENNlytEXA8mgvpIHYu+J6D8o9ve6fr0uEHMqQAZlC+T04YEo3MOPMe6p3VJSy0otfox2C135NFK9xHEoKdMXnETWlAy8J//AWQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761809; c=relaxed/simple;
	bh=FrvFI8cjkwU2nwRZmTrE2jdMqK9bne/uhLwoorH//7w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ahEIyI5QSRaOE/plkb+9sPToqnsmfv7w5pRy3X03g/d8DVRE86I5JEX/jOY7RwMs7/+Z4RqZs92Ey4qkm3AXgvyFqCylXx1xOFGaiSDYNT3Xtpz6txdCh3Z0dc5LOM5DRZ9zdoRnVXeoMOy/ggRibgd3I0KK5CBv8CZQl/Kr3gk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jvlE1Ysy; arc=fail smtp.client-ip=40.107.130.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jvlE1Ysy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpR95pr6uQA+KQvUNUGyr2wmwHFFUbY1z1i5F/v9OX5pURpOk0Il5czxh5PS+U4QwIk/GPP6i4m498OtZpYr9+lrikFj7n+4kZBA/WxdSWAtDBzQMQFgAsnKoRrfL1XrmcH5j0qXCzjgt1qCFNNloaNfEXr9lszaCNtWfGSKowD7OI1pjSrrT0Qu6eOwPkulkX14UcM3utunrTXKhlWCCHktuzwp2IHgnUvVKZwGicBsRegHjHHXf0cL6hzDpgXP+M2aOaCsFXViXY3eyHTKvWPKEVymNnIIF0MmwLjTOtc/kIoa4hpKZqwCn8NaCGzpbHXoSxHgJxlUy3WvAhRmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VerTmCDCyJ9cwrgk7kisEHGSGbWM+DkVZyBozFqm9rg=;
 b=XUDPj2tbMtiUkD4jSmMuC6Qop8UQV1QmOi11zTF5skqA7Tjeb4XiV7bkYjkuyHO0ThqnJQBwPD7n/OvRYNjnEyzUw+yr3RfbEWoTjybAJks3IKDMz7bh8DS+LMnbMI+k/xyvv4SxnQwWuCmSbNltODdA0eQNRTq/8090j/UI/H1xXN5OyrS2KBFN2iK4h3pLm0XUdzcE+8uaw4f+TkALeSIUE5RLjMsrCIZWHco+asf5mneXUznVdpKexGjIA10bBBzFfliRMc9f+P4T97ppt5HuXxE32++epeT16yUdHED2bl6BA5kMUZUm7uLBbfgqqhJtMPO1vdpxj3is5N2pvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VerTmCDCyJ9cwrgk7kisEHGSGbWM+DkVZyBozFqm9rg=;
 b=jvlE1Ysya6rGYdZWljXNlo6rjnKI4Nanicg5jIr88mUR7taawmuaMKHtPe0DHiiX6hCWIJWrNgDrtV6ku8SnGCHuIj+MuwxsYpbp7DAqNHZQA3kUPW5u5QG+VAfg+DtEaEtARuqd3RL/82N99+8LW+WifwrPlhM08R9ABCu65TyPHCs4RsBd/+bhh8ppu/ueHIx6zooGjWvkU4o604Bb2HaYXMOybsKqQQFYpGmKBFmKQ2KR8OOE3T/90UpHB18jL3w766z5SMiZ89toHNlo3FF9KGSXL3CA8Gw5WApsWLhNOrSFFwDy8ztQfYMteZf2hulE+CAQ+qGFUCfHatQjPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 30 Sep
 2026 09:50:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:50:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 17:46:58 +0800
Subject: [PATCH 4/7] regmap: use krealloc_array() in
 regmap_register_patch()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-regmap-lock-2nd-v1-4-33a8a482f9ae@nxp.com>
References: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
In-Reply-To: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: ce16f371-362f-4646-f87a-08df1ed834a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	IAzqM08OtfAqIYqzx4D2SGu0TuOguxtmWQeOAoiAXrNx+QRiEvhBEX/5eSgLA4A/8KZ2W74B/F8ZLUwWPN2dxCReu3Ns2BmrQp9scTNFAhrOyzgW2LjWeyq8v/xP/KM2+vd4vtE1L3oLr6YdlCZIJLCMGtYbeHhaK5O+Phjji4W9uIAEtUtwdWNhSYy/OLOarVfzF18dtDJp2kY57CeYQrAKeX/6nt4YApEwj0Beo5isRbDUZ4xEksoKpUHOmFqIWCRENyoCThIS8LegZiGgFD7/ngm/ol7GlRimL1exCycZuEvRNzmnX6RMLRegTt/2bt47jrA6Yoh7TrZDTl1CaEN5yi8zu45aQnLiDMX3V2W/KThRRDYKR/65RNNSECq7s8cv+yYaCURNdEtwSPoi5NhFlvtmLhcNMozSRSNIkRutPW9UKVrHLvQPTvxbByw43tZk3uqcUzg0hQ5VDNJiautI+vACyO5wEuh2ebMQFvuV20o9YQSyIYYVHaYGMY66xnwqEBUJ7gB7rIT0JFZJMTyWp3jvI9icEhRFideBtbFwX2plMt189Ums4ZThptS4fwPVnIIoIBwRBVuw6iWJ+jw26UCF+CTcrDdQd4OePJxegw66cJYkBJ4/W+PcKH2dmrhlMiKjbY/xo96KvEZphZFumn6BvDrQgNkScbkvNUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnpVbjhpUVlhUjNqdHdubzlHaC9xVW4ySzhoV0JpRVNOdWR3NXd1UkRQbXZ0?=
 =?utf-8?B?NFlwUWgrWmpld1NCc01zTVpSbjFoRHV4WkV4TE5zdXlBbVBsR3IxQ0ZCdDBK?=
 =?utf-8?B?UkFDMWRoWkxaaFJlNjdMRHQzbXh2SEd6ZDBNU0FVRGV3K1ExemUwL3ppMG9O?=
 =?utf-8?B?MDAyVlNrL1RqaGhweGRFcmpaWWdhT2dmSzZMZkNnU0pBTUU5ZGs5ZU4zNXNa?=
 =?utf-8?B?L2p5OUIrd0NISkRjRDN4Vm03RXZCNjhhYmdVQllWNUNIcHN4NnFDK2gvUnZZ?=
 =?utf-8?B?d3l1eFNRVGJ0cS9wcTArbUVTZUtlSGxKVDFOWGVQR3RZckQ1VG9LL3loUzVr?=
 =?utf-8?B?L1NVRjk3SzhaME9GUFRrM2NkRVU3Z3VuVWNUc3k2U2xTTk96a3lzeEVmcDZq?=
 =?utf-8?B?YU1BRlFrdk54WUZibEdPWlRFYnRGN1B0RnE4eEFHZEVwaW05akR1ZGZkWjRL?=
 =?utf-8?B?UzRqZFE1L0VXcytsYXZuYUVDS1k1TEtweWJndWYyR3RzRnlEV3VXOS9Ha1dr?=
 =?utf-8?B?V0F3dkFIeWNQK3BWTHFkR0IreG0rK2RXb2lWdzB4RmRCMks2QU42QVRWSWdU?=
 =?utf-8?B?dVpzZlBXSFY4dlQzRy93elZHaU9lZVpYblNGbllMOGlsSEJsUC9zeitLWG54?=
 =?utf-8?B?dW5nWkxlSkcrVGVHc1dIYXpadExvUHNwRTQycXJCbU0xSUR5d3QrOGx0R3Fr?=
 =?utf-8?B?Y0lubWpyOEFOR3NMMmtrd2dPMkI5aDZnQUt1NTFqcERxM0xORkhzTHcvYmwr?=
 =?utf-8?B?NUowbzJOTEIxVENXSGd0U2JxVmgyZ0ZqYmlHN1F5QnBNdkk4bENIU1Y0ZXN6?=
 =?utf-8?B?TWp0R24rdFU4c1hVU2tTL1h1eTV4dmRtUzlOaE9FaG0zdzlGUnJBQ1NndnBs?=
 =?utf-8?B?Zklkd1dmN2hOSnp0cFozNlhmZXBGeW1WekhlWDlQbERrWGVVUnlzMjFnNHJO?=
 =?utf-8?B?SCtrOW9JRmVIWFNBVlNXa3pkblE5L0xWYlhDVDR6WHU4elBhdjAvRTdBUGR0?=
 =?utf-8?B?czE4SWZ5U29FRnFacGwwVzl4M3BuT2c5NlZIcDhPSEdtelI5YUJVZkp3WmZR?=
 =?utf-8?B?aFlIM1NYZDFJSkxwdkJ0Z1A2Y09PVitGS3A5TW8rVE9xbHFYRVJ0WC82K3RK?=
 =?utf-8?B?WEpXQmI2cHZKTDBDK3oxcnM4Qys5anpGUzN5Znk1Q3BzU05pV2djM2hxclJu?=
 =?utf-8?B?eFNNSmRDeFZHVmhMV3lHQjNjOTNXQkR4Z2orSFZBTVBoaFFBWk1mL2l1UVNa?=
 =?utf-8?B?WGpjZEQ2Y0lJaWsvU3FjeWQ4bEZUQzR5aWR3UWVWSU5HTnhwbVBBaktRL0hZ?=
 =?utf-8?B?MVhUSDR3cmQvNmpEVDlnQ1o2S0FQL3RQYUdPWjA2dmo0U0x6dTZ5QUdqdkxq?=
 =?utf-8?B?dE9DQy8xUE5sdmVFQVk2eHBrbUFPMC9GdEQrOEQ5Y1gvN2M0eEJSTTVMWmFZ?=
 =?utf-8?B?eENQU1pEdGNxb2lVQm9hTHByMHZ4VTUweHRsK1JBY3pJL1NaZ0RKQ1VoSEFE?=
 =?utf-8?B?MHBOakREZUR0WFZSaUlSS2FWK3l3dDA0R1RGTG5ZQ3M5ZUF3REcwWXpTYjQ5?=
 =?utf-8?B?ZGhGM29HS0E4TExMdHJGSGtyRkk1T1JiSElTZnFXcDJ0SHlSazdrNUMxSUhH?=
 =?utf-8?B?ZGx3ZzFMSXArMzh6YkNpajVlei9HRnpUWE1ZS0dNMTBObDdWLytuK2l4T2RH?=
 =?utf-8?B?Mmo0VUY5bFBTQmltV0loZnRobHkrNXRiczc3VG95L2xwZXpIVHJQbjZoU1pH?=
 =?utf-8?B?MXBIVVVmWE5UL2JSNGhZRHc4akgyS2t1dlJDbFVFR0xHSGIzMmNCTXBhNjUv?=
 =?utf-8?B?N0NBK0ZDWDV1OHAxYnhrMzh4emxYb3RWTDdkVmpMd3B5bzlFeTh2c3ZxYjF4?=
 =?utf-8?B?Ymlmd0NrN01nQml5REVDT2lmU2ZFSThJQWV5VmVOaDg2UEtMRVBhSzFLMFUx?=
 =?utf-8?B?eXA3V3FDdzJQNGlaTDFTMzZzNFlpdzliQ3ZIVUV0RE1JbWNMQUlEbEF0MGs0?=
 =?utf-8?B?Z3E0WEhBL2RITFNpQVBld3J3cXU1WVkxQmpsaVM3a2Z3NXczQWpsNHM4OUZl?=
 =?utf-8?B?N3J1VzFtLy9waHRLSnQzejBieTFQN1hLTmRPMEJEZThwbDByZjd6NlpaVGNo?=
 =?utf-8?B?eXluNVk1RlJ6bmxnYnlmcTc5M1V5aHMxVnV6TThPcUYwbUFVd3R3UHJaaHpv?=
 =?utf-8?B?MHEzQm54UTZNTmxkdi96T2d1N2ozVzNXUEpSTndjcmcxTnlZVFFHZFVOZ05i?=
 =?utf-8?B?SWJuRmpQNDc0OUVnS3p3eGJ6aHhqVUJOY1o0OFBuTU9rOVlvNlZPMUltajB1?=
 =?utf-8?B?RzFvcHFTR2dtN1BGVVVnV1UxVjZVVlZxRmpnczdQcEg2aWdzU2JoRVFoZDEw?=
 =?utf-8?Q?rIvCxPtM2bO2gupk/NBn0fDN2rO6tsF9ay7Sx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce16f371-362f-4646-f87a-08df1ed834a3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:50:05.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFH0biI7xOAg5xj+0JhuZZerI+LUoywt5QkBxWc052GZ67jbKDmHyDeTFeomjTIwlzoldvG1wkfx52InKlOTioxqjZ/LokbDiAGPBg4zDbPYg5/Z9UogJQQ3GBx1VIp9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

From: Peng Fan <peng.fan@nxp.com>

Replace krealloc() with krealloc_array() in regmap_register_patch() to
gain the built-in overflow check on the element-count * element-size
multiplication, and switch to the early-return error style to reduce
nesting.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 0b40e1e7817c..b9830afa6d8e 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -3379,16 +3379,13 @@ int regmap_register_patch(struct regmap *map, const struct reg_sequence *regs,
 	    num_regs))
 		return 0;
 
-	p = krealloc(map->patch,
-		     sizeof(struct reg_sequence) * (map->patch_regs + num_regs),
-		     GFP_KERNEL);
-	if (p) {
-		memcpy(p + map->patch_regs, regs, num_regs * sizeof(*regs));
-		map->patch = p;
-		map->patch_regs += num_regs;
-	} else {
+	p = krealloc_array(map->patch, map->patch_regs + num_regs, sizeof(*p), GFP_KERNEL);
+	if (!p)
 		return -ENOMEM;
-	}
+
+	memcpy(p + map->patch_regs, regs, num_regs * sizeof(*regs));
+	map->patch = p;
+	map->patch_regs += num_regs;
 
 	scoped_guard(regmap, map) {
 		bypass = map->cache_bypass;

-- 
2.51.0

