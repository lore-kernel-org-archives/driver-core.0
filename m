Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF203EC817
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761823; cv=fail; b=nvvA3UOnee3hD3q3vEnOQ2vNH9POJofJfxlXyQwA4lwnHa7aBw8eD2nNLSQc6UN0bojAXRnrsvzwWbKjtM9I+OsflzyQbS8anBymkxafu61J9qqCskCSVv7avRxzrdczqDehXXUD1VpU2tzkseqB7ktU0j01fL/BkJEO6FgZ228=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761823; c=relaxed/simple;
	bh=UiQadtYFLjcUf2p+eoAC2sy91TnxmRUA7IJpjsdJRjc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IT/a38XK7vURiTDljO62Yw95hKobSLfs134JidwJ9394rclrFuaXZwf+tK3X1AQqVQcnrR66nfxyAL20jg738uiGU9y5zdOwRyUUiZPc5VsbHekAkmt1s8yeCF+C4UPytIkcMcN5z0UcE4aU23CxtT8zd6sQPfLxziPcR/+CHb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mzY+jQB8; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mzY+jQB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJNwRvvnmATCDpGdOaQr8sjNjUXCW4SI2Zhohd+3tflsDr51LFkojYgcs6W+vgllLhfy8Zc5zrViNUcwsi5c3QpUSxNKQUgx7bCNoA+Q2Ij9Wo7dlXoPqu8I6i14r0MyA02mGdiHrlzTEKWb9QEstVzjvhXQvBe0OWcV41X52NC0Myw1gev+XjRluxl+938o0yp7NDoKtlJ2D5W3AojJy4Ed1GlobNsRI0tGjcxT2o/JfXxSp2XuY/C6et91ZSVOV9b6EsgTU284BS31eKAQlyyeuqe3ZBPr74Buo+cpz5SupcgkL+eh5wvbpUZdWZ1jxISSGAYukNpGQ9+YskK03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxUFX7Q6bVpoXiw7gpjbQ9KtmJcUFE1RbThS+kgH9Do=;
 b=yxdeeE0dOuSej5MP3p3dCAOxQ8mEAqoCD+WFlEOo+Ds9Z3akODrWrpWZPM2y3xTtbNHlVS01n8EUVy5X5CsKfYCyNizCVzu9f9cYMlX7Dsq+3bevl4yGgxr6Ttt7t1LZUEE+u9hgPJ1mSlNXu6iCVhI/PXuK+PKbTxBBeKm1zs/7lRPEANU824EUjZW/wQKAbFYwzWYtG2s3+gyR8u9YTd6oOgDQX+OLy5+Fv9LSSqEzXPpxvpN4vNlgYmBZFztSqjzOPfZLdUZF0xZDiUBc6N1yN+c+K6m+WNOK8qZ66WeP/o+C6kdtv8ByiymOB9mSH697AVW8aG0a5ClpNQsYnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxUFX7Q6bVpoXiw7gpjbQ9KtmJcUFE1RbThS+kgH9Do=;
 b=mzY+jQB8KRoym6gJTlsLNQ0laM3wH8d7B5w53WSMAbME7kzT4kktpgNM7e/w/T0R8K8q/b2HRmOVORHlnZqg8XFW19V7TD7z7Bz7rqWF3mWydIfdveYZ/ZYOJry+RNGWH+rXdjLUeDVJCbb3kl2PL2r+a55QyGHp8MUzZwWXEoxagYUlMVUMxlcmI0Jk13feTvTIXae9OTo1lzvfoZT0H0jqjNc392LWFdYtOVJ37rCC0HgVyXllRMFtsUxclA971Had0zepXc5qElVFUC79VmVsnEuuIeDLva7ipcI1Sxd6QzyIh+COfcoRB31qQmEJHMqVG7HVQ3Tro91W38+31Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8714.eurprd04.prod.outlook.com (2603:10a6:20b:43d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 09:50:14 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:50:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 30 Sep 2026 17:46:59 +0800
Subject: [PATCH 5/7] regmap: use devm_kmemdup() for bus copies and remove
 free_on_exit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-regmap-lock-2nd-v1-5-33a8a482f9ae@nxp.com>
References: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
In-Reply-To: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0305.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb6f02a-5bde-466d-9901-08df1ed83988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|19092799006|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ublREQh/E7AVVxxdG8XThjKC2B9twjXSrClxr2AYdUY2O1JAOqUpT79WC0+LTLIvhukXDKubsUtn9z1u/ZDBUiVu+AaSWsJ4ECau1KIwiwK2/xFykMlBvc2K7MTGQPa7fHMj/x3oKZUzT6pq2WrnX9CoiSZdeRHZGEP4WXQXhMkzYzW675MYLITzmgFduHoS5TpNBL41DjbDbY0JjS/T92fbL/7IaEtbp9Uz166ac5CMysNmLQBmCcdGevrSH2I4JPCZz7rk8ZSHODUnvb7BFkGBDEMlf1pplsAJQxAc2ppQ14tzATKLHzqQ1vBraKgiuD55KELQe8RMN7elogmTgM698Os53UizUDgUtZXoVmsGuiSkxrA1Y8t5ULpKfUL/2062587yCn93+/DrnXkUcAxNfRtj5pyT21nDVyaGRRT7XuzbKxY+ebLvEjmm3bfGkssF9LhSC/4BQAQqGJxvYkbtxrL6/wHHA5oXG4OTl/5PbunWmhSAJxvXCAYN6LVY5bB3SouR/id9L5zTUOJiI4Y6dyN1VJBSv8cwtnJJUPxrpykoDTr4QP2gIPHq2E23lGZUcJ/mXRpcv49EHvPqUKjM5DFe5ylDmWoe/H2RprtAgdEB+NAtscmalrpzba+GPe8Dy2+722Kdg9rU2WBF81AJhEz6Ui33Svf6fVaPAtE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(19092799006)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OElOOWdVYXl6UkxqYzVmK283SG9QekExdnpVS2FnTUpvbzlndk41blpNSUZ3?=
 =?utf-8?B?ZmxaaGtEN2Z4VXo0TWtzaHhRbHdQUjkySXVhTWZvSHdmSDVMSHMwVVRKVHpL?=
 =?utf-8?B?MlpibUs4bDVIRDlvVmpUQVFXb2RJR1J1Vm5PK2t5bFhYdWI4TWpLMEY0UjJ4?=
 =?utf-8?B?RDNlTGNBbUdFYmpISkdLNHlldjRGV0lURG5SdUFKa0ZxaUlUdVMxK3ZtL1dj?=
 =?utf-8?B?UFVpaS96SmlYZE9kR01QK0kyVkhDUzNiQ0lnYmdqVi9aWERXNU93VHZTb1lv?=
 =?utf-8?B?N1hhNXRBQzB4Nkx4RUtLa25oc2N0OExTZ292WHYyZGpiYVFUcXJHMngzVjZ4?=
 =?utf-8?B?bExRTlIxdjc4OTlJRnYyZmpVRUVlOS9CdXlJK3BvWnVleDQ2TFE3M1ljc2dH?=
 =?utf-8?B?M2toSFZzTVphdEJLb09QWGgrODgyMVdVRWRLYmxieFFyeEg0S3hqb3lFZE1F?=
 =?utf-8?B?ajhBNE01OWtkaHR4SmtMUnF6TExzNjJCdXRHNHVDK1RRZGExMUtjLzNOZmsr?=
 =?utf-8?B?RWttamJGQkQraFM0QmplZlFDUXQveXVsQnNJa2tydkVGZTFtZUkxQ2c5UEdz?=
 =?utf-8?B?L1pJRDJvYW1rV3FzT1N5SjNLOHptUDdYaDhUV2t5NXZLTE5MWVVaSjhWNGN3?=
 =?utf-8?B?UGJsTytsWG8reVpnVlBRK2FHZG4vMUFJM0lqUFgzTEtaRU5sT0FDbGRxRmRu?=
 =?utf-8?B?U0tyRkpGSU9IV3BPMGZmVkh4eVUwdGdQYXJoSnRhZXlESGNDdkFzZW9lU2Jm?=
 =?utf-8?B?b3I0K2phbFVFS2kzM3FNb1hCYzV5akNsOWk1dEJ1NXllODJCeXYrVU5wQXdE?=
 =?utf-8?B?eHU2N0k4YW1vNXdNNkY4MEwybEV5VmM4Z2k2Yk95NGMzemk3Q05FQ2ZsRStz?=
 =?utf-8?B?SFNLQ3dCanQyeWNkQ2pMY2JZQW4wS1NMd1gvb3c3clZEZ3RGVWY2WTArY1l0?=
 =?utf-8?B?LzRLUG1IcVlScytkQSswSUwvOWpzTzFPa1RLRmRIZjBsZjRjS2xjMmVnMzRm?=
 =?utf-8?B?T0FvWUNETFlwdFplUUhhQkVLUkpjTnZwNWdoU3g4bm5kT0w0WU1nbFB5aTVr?=
 =?utf-8?B?bEQ4VGFzUTJqcEJCRXF1bVBybkpNSUl3R1ZJWEd1d3FUc3dQQkF4RnBMNzdZ?=
 =?utf-8?B?cEtOaXZlTzFPcTFlRmJMSm43QWhhSHR1cHV3cFphRDJwMFdYNnBSYkNGY0JQ?=
 =?utf-8?B?NFZPaGY3TCtPMXcyZzJsaTNHVTVPMFJSa0ZXS1RwK05GeE8zT3NHQU5JbjVi?=
 =?utf-8?B?T0pNK2pPek1PUzN6YXk3SkFYMFJYTjArc1l4c0I4MWI2ZEd3OHFHWkNQRFQx?=
 =?utf-8?B?NHRMS21JUUtFaTZjbnVCK1huT3EyOVN0cUxVclI1T0llVGgyNlphaVJoOURQ?=
 =?utf-8?B?TEVSRy9DSG1XUTRSbThla1htLzdFMndrT1cyQnl2Y2JDbS9ReEJGNzFRT3Vu?=
 =?utf-8?B?ZDd0Y1p6eFR3azdiQllKTWdHNVlyRVdPZzhreVVHcGlBclRUZ3BYZlJtVzFn?=
 =?utf-8?B?eXM0Rmo0elAwd2h4VWJmUmZvVXNxRTFjTGpVbFVOZ0xBYzY4SHVaaWlYZHQ1?=
 =?utf-8?B?aERuRTc1KytsNGtpck1YNURpc0kwRWIyWWhJSThPclVhbVF2Qit1akFTbjU5?=
 =?utf-8?B?YndhdUhJa0RFamxsK1VjR2d2SWRJSzNZOUZubTNpbmFOUVVScWZhYVcwdzd3?=
 =?utf-8?B?UEdGUzVPMzFIckJ6d3YyWWZzYTBiSVQ0Q2djcXVhQnRPTzc1ckR3alFQQzZm?=
 =?utf-8?B?ZEJ1WGtwWkR0QVlzZW94ZFJuSVlrLzVzWll0SXZCL1VnZ0p5WWdNR2VDTUtQ?=
 =?utf-8?B?T0k3STZnNXd0SkQyNnFkeUE4d2ROa2NBdy9od3R4YlByeTgrWlA0YnR5T0Zk?=
 =?utf-8?B?RnRhcG9wZk1ENVBNVlpkZHhxQ2E0Vi96UWk4YSthbjNBazRNMVpMUjF5TFpm?=
 =?utf-8?B?dEhZbFowTkhwSjRjQ3orVldmNGhheGd6Q21vZlV6RklNbTdYa1FSQVVUUEN4?=
 =?utf-8?B?U1BydnFMZ0tLYVRuNmtLTFlSMjJqM3d5c1EyTFRqMFE3L2RRTUY1SEtEYlpv?=
 =?utf-8?B?RWZXOFdWNmRLTkRJZjBTWjVMUXRHUEhwWVhucE9zblovcVBMMTZNZS9JRUxm?=
 =?utf-8?B?S0NrSjNiZ0FMNXMwYXErNDVJdmN1MWxJbXdjYitNeTQrZ1hIWEk4K3RxK2hs?=
 =?utf-8?B?dHRlR2NZS0VMQlkrSWlJVXF3dWZCNnBIelcyM3hwS2xzZUVibkovKzlFQjdt?=
 =?utf-8?B?MnBLcHczc0tnRURFZlRmb2o2OXVGaWV6ZUExWnM4aUYvWVBKS3lKRFIvWnhF?=
 =?utf-8?B?bXZ6QlNoVHc4ckM0RlJUUDZ0QVVCNkV5QzNqRkI5ZmV0RDNhREJCYVN3clY5?=
 =?utf-8?Q?ae5CaZN9XALKXHbh+FlU43JZK6TEmq1M5+EJM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb6f02a-5bde-466d-9901-08df1ed83988
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:50:13.9337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kIh+7CuxwN3SOSx46ZB8ohrMjhqYcp6Q5U6gagdCGj0s/iX9d6cZvbOU48alldYlZk3hnTbOUYw89vMpgB7w8s9CWEybf3QPay/K2EK+zcht18rU15fW5AWTsr4CsvEg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8714

From: Peng Fan <peng.fan@nxp.com>

regmap_get_i2c_bus() and regmap_get_spi_bus() duplicate the static bus
struct when the transfer size needs clamping. They use kmemdup()
and set the free_on_exit flag so regmap_exit() will kfree the copy.

Replace kmemdup() with devm_kmemdup() tied to the parent device, which
lets devres handle the lifetime automatically.  This is safe because
devres cleanup is LIFO: the bus copy (allocated first) is freed after
the regmap devres action calls regmap_exit(), so the bus is guaranteed
alive while the regmap references it. For the non-devm regmap_init
path the driver calls regmap_exit() in its remove() callback, and
devres runs after remove() returns, so the ordering holds there as
well.

With no remaining producers of free_on_exit, remove the flag from
struct regmap_bus and drop the corresponding kfree() calls in
__regmap_init() and regmap_exit().

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-i2c.c | 3 +--
 drivers/base/regmap/regmap-spi.c | 3 +--
 drivers/base/regmap/regmap.c     | 4 ----
 include/linux/regmap.h           | 2 --
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 51a04961faf7..813e8b407a0f 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -403,10 +403,9 @@ static const struct regmap_bus *regmap_get_i2c_bus(struct i2c_client *i2c,
 				(config->reg_bits + config->pad_bits) / BITS_PER_BYTE;
 
 		if (max_read || max_write) {
-			ret_bus = kmemdup(bus, sizeof(*bus), GFP_KERNEL);
+			ret_bus = devm_kmemdup(&i2c->dev, bus, sizeof(*bus), GFP_KERNEL);
 			if (!ret_bus)
 				return ERR_PTR(-ENOMEM);
-			ret_bus->free_on_exit = true;
 			ret_bus->max_raw_read = max_read;
 			ret_bus->max_raw_write = max_write;
 			bus = ret_bus;
diff --git a/drivers/base/regmap/regmap-spi.c b/drivers/base/regmap/regmap-spi.c
index b9fec387997e..8b5a3fbcb18d 100644
--- a/drivers/base/regmap/regmap-spi.c
+++ b/drivers/base/regmap/regmap-spi.c
@@ -117,7 +117,7 @@ static const struct regmap_bus *regmap_get_spi_bus(struct spi_device *spi,
 	struct regmap_bus *bus;
 
 	if (max_size != SIZE_MAX) {
-		bus = kmemdup(&regmap_spi, sizeof(*bus), GFP_KERNEL);
+		bus = devm_kmemdup(&spi->dev, &regmap_spi, sizeof(*bus), GFP_KERNEL);
 		if (!bus)
 			return ERR_PTR(-ENOMEM);
 
@@ -126,7 +126,6 @@ static const struct regmap_bus *regmap_get_spi_bus(struct spi_device *spi,
 		if (max_size + reg_reserve_size > max_msg_size)
 			max_size -= reg_reserve_size;
 
-		bus->free_on_exit = true;
 		bus->max_raw_read = max_size;
 		bus->max_raw_write = max_size;
 
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index b9830afa6d8e..bb5553ce58d1 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1175,8 +1175,6 @@ struct regmap *__regmap_init(struct device *dev,
 err_map:
 	kfree(map);
 err:
-	if (bus && bus->free_on_exit)
-		kfree(bus);
 	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(__regmap_init);
@@ -1479,8 +1477,6 @@ void regmap_exit(struct regmap *map)
 		mutex_destroy(&map->mutex);
 	kfree_const(map->name);
 	kfree(map->patch);
-	if (map->bus && map->bus->free_on_exit)
-		kfree(map->bus);
 	kfree(map);
 }
 EXPORT_SYMBOL_GPL(regmap_exit);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index c8aebd148e08..f8334a37bd0e 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -579,7 +579,6 @@ typedef void (*regmap_hw_free_context)(void *context);
  *	     to perform locking. This field is ignored if custom lock/unlock
  *	     functions are used (see fields lock/unlock of
  *	     struct regmap_config).
- * @free_on_exit: kfree this on exit of regmap
  * @write: Write operation.
  * @gather_write: Write operation with split register/value, return -ENOTSUPP
  *                if not implemented  on a given device.
@@ -613,7 +612,6 @@ typedef void (*regmap_hw_free_context)(void *context);
  */
 struct regmap_bus {
 	bool fast_io;
-	bool free_on_exit;
 	regmap_hw_write write;
 	regmap_hw_gather_write gather_write;
 	regmap_hw_async_write async_write;

-- 
2.51.0

