Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9BA4825B2
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374872; cv=fail; b=ij9wqRXetPejdsQga4oPxA3Xar30Eb8op3j27HWE+K3lJLH13ntmz8Fm8VykOwbe8XfuZRXiqpQNjNFlRH0NiXQENyyerN/oEVEAw6QR7/8yqGEO8EcTtFd+qXfZlhaAD2Q/yGhLIG9Ur7179KxNj4f6ItJ0ZgqUAaNhVDAVJDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374872; c=relaxed/simple;
	bh=FrvFI8cjkwU2nwRZmTrE2jdMqK9bne/uhLwoorH//7w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rb9LrSVjy029MVszxQx4W/aCQ0m8kfPTOiL7x3nPTPuF7U6j8+HDEAhuudvaeQdXEL1ByHmegG4xlQOG3gPNEHAuvHjDs1jEwU+DUbLwvLPz/YaE7gRGsaoFydF9lp17Jt87xb5bBY6/Y9+AZ8p9bPcQDrwtu8uVku3nEO8Rj9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iFp672R/; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iFp672R/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xv97Q7Ybdm1LlJPHdWArjuoEkK/M00/rNd6aN0zkvRQs+GxkNVqPaXWGmqQ7WGqmTD+emcVmn7BQQhGYZJTCh8uogID62nxZDDRMJyXRwOglpEajf2diMrQDy857mIrQziG7PYhsOhIoynhJ/DdJ8jkQMPeNzsOqg83o96Q6LQiXeyFSecGxIdxf2H4SWcHsBWQqD1sYTtNPTjKn9v170avmDbwH4ZcoU6mtph3nCUYQURZ30M0qRVMKdoe/lmikujtYHjBA+c+i157cx5bicF7TRvskaU3i+a46SnpEEZwiLNjElLvKmn+FQvrvFs44VZQj6zCpEQXhuyMRi0Ss9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VerTmCDCyJ9cwrgk7kisEHGSGbWM+DkVZyBozFqm9rg=;
 b=fhWYA2Qj1LXH7oSOmlVNlNy7urbkb7q24aGnb/I6apHPyBQ35uUSXporBEATtgN2iXqac1lFakpyJHl75qdjiEoZgO4O9RS9d466s8TI9Y8j2C8VIhIfctJrIf4djkmFztLdw8BJHylVHX+lC18NzAKIvC6+Vh9iBWc1eQvvcA6p7koThn+VSL21ymn3ICla1EkgM3k7IfCWpLOGseNzsPExgCllc3Qnna8CHDnslVrBu+GB7UOfJQFoHOIwo5g+IqIPTlyZW4O4lq2B34O1m7wYiv/Z6HVQ3svL1Vfmtmqx5hVB0cdq6dLvUQZEOdFUjvIYe+Ywt1LCGnTTVnU3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VerTmCDCyJ9cwrgk7kisEHGSGbWM+DkVZyBozFqm9rg=;
 b=iFp672R/s1s60/aRE0ftn84x5e0ZC2Ji2CbxRuF2SUD1ASPwBktpWWjIJHfrVEJ2wTjFnATsVvN+fm4TjdAyqofKtd7l+0qToANSr8VK9J8oAIvnnuXl1ckcxei8jn1d/x7CwchKya4aEOBND5ZvaFDyTheRAHc8n5Y/zpmPRpKA1W5riX9RXLHt12wBWhSLgG6ArDtCbGnUJLXqDdoTmDUm/hMHR5Fesrw+4tNntlImEaxMBLjsAl3l7qLo074LQyoxyIj4KpJ3xlTRBT6zWFzjsgovTUwIRYp93YoNcLr4xmXAbJWi3AsJkiUYXbUa29s9OJnguxIud3P7jtzrhw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:07:13 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:07:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 20:04:00 +0800
Subject: [PATCH v3 4/7] regmap: use krealloc_array() in
 regmap_register_patch()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-regmap-lock-2nd-v3-4-0e590c4125be@nxp.com>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0193.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: 4db0e3c9-7c90-4ca9-51e0-08df246b8557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xh59BFNMgcUziRTUC6ORmkvW/+t/xyWYVFzvg+kCdn7x9so3vWjCBJ2nRPLg9MAFNQi7EC4D8E8kQ1lSfmMY1z31p6XVKiNNo6pH2fW3NGCR39R9oF8KJxMLjZ2dTGLpHygxhjqIAtZA3UsAxklYBO0d0Bw1JAAU3flOzaaqQYzaq6dJt4lYduy5Xz+P5Q53/l1tDaKuSfpbXLuqfD+YAi6f8albvQxdDXWlt53LvfaS4IxgJpWgMUE1AePOgjgHtCYntKiEm3I6fDMI01bnjX7PYbZZ7UtYL6UNJrA8krXHg7hcvzDZIi8ld/Fm8d3vT8eDolmIlgM/R6EAdsxEE6oiC/2wargJ8YZ6wpsp0oy5WXeQLYFiA18Qau5B2aUGs7eT3svSch4Px/is0ptBVybXyNCCnNjhLPLHmWqgRjBDBtCFs1kdooXLTF58ncpaevr37f8HvOX7EL5nyCoO5l748QX/s/Ufiey+Km8dKAy6i+hZ2DZB2sHbAdrQyesk9UEDws051R5xH6JUbAcpdQf4UAkqFZVlDBiElpQr79dfl9kh32KhahowLSuhDxRWG6zOsX+vHGp6EGkNqvrgpyWCEVxX1Q7nADoWIp4KoEM4fVqg26fvvAF8CbKTn9qNtIML+oh6Ehrm775MlOi7n/TzwIaBJJ0VcqtlVPIO/b0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBmYStjc0R1R25EL0VyMmZCbWtNZzJ4aHliZmtxaW52WlF1K2xqeU13emtr?=
 =?utf-8?B?M29HZ2IvcExCdGNGekFSTzZEeE16dTUvRitFUEtvWmMxRSt0OWVYRjNSNkhU?=
 =?utf-8?B?UjRGak9GMEdiYjJRdVFoWlBwZ2RzckhUNUVXZldPU2VLRlFWOEVwMlJzZ05F?=
 =?utf-8?B?cUlVamRIYllKSjRrc0lNSWY0WVBNdEdiZFBCcUZ2NEZacEpOZWgrUEpTZ0Jn?=
 =?utf-8?B?ZzNCZ1NSRXZpQ1NNS3NoTCt0anlRejBlSTV6dTNxdXVybm1VTktGVkVteXdG?=
 =?utf-8?B?d2pnZ3FIc2hWdjRhWUk2T2p0VXdpRUM3aXVJT1g1MEp4WDhWSkkvWVJYNlJJ?=
 =?utf-8?B?VUZObE9VaU1VQ3oyV1E5bENYS1NHR2ZuT2NXQnlmY3cxWE5xRjlwaWtBZ0VC?=
 =?utf-8?B?cVZrRGIxbDVvYmlXSXl4ekJPRU9KZnlvbnhrK1JJOUZHaWIrVmtMTFVGcmtt?=
 =?utf-8?B?YVhleENWQ2NrdVlnUysrTzdtczVteVFwOW42OXJRNnVpNEp0TzNqOG9RbWc5?=
 =?utf-8?B?NldhRm0wb05TWUs4V2NEN0xsZy9iKzJIMWxxcmdFZGhVTHNhMHJyeHJTODhj?=
 =?utf-8?B?aEt4NXEySStMSHRKZzRvbll5Z2FBTzFYTnZucVdtNzJrdXQ0b0l1RmxEdm96?=
 =?utf-8?B?bGJDV05BNUpZNzNTb0cvdUJkYUMrL3dSMUVIeWNCVmord0tNRUJJSXBwd0gx?=
 =?utf-8?B?aFJMMU9Pb0VWeVNVTkFEbzErQ1Z4bDdybk5Qa1R6a0ZtSTVaNWJTNE5GK0I2?=
 =?utf-8?B?UHpRankycWJFRHQ3YmlwLzFrY3lkSFJrcHdQRXRCZkJnaWZKR0Y0NlVnSFc5?=
 =?utf-8?B?TnkzbDNGZXhHdElZOVdoNDhtRGpiNHVNckF4VDkrVGlIMDhOVkNVa1EwbDNo?=
 =?utf-8?B?S0lEMCtwbW5tZWRNaEkxa2d0WVJFbzY2WkVqbStWbGtwQ1M1THYwSTBzSUpV?=
 =?utf-8?B?ZFFPL2pPdThNb0tnbjY4dUlodFIzYzhoQjQxOHdZc0lOa2dObWpzRHVvTjRz?=
 =?utf-8?B?Umd6YXNSYUF2VU5saGNaMWQ3ekp1WjJWY0czc3dVSDhaVU9SRStLcXlaUUlk?=
 =?utf-8?B?elFKSGI4SG1JbUw0bllCU3M4N1l5cllIUXdER053MVA5Q05vL0w3bU5Cb0JT?=
 =?utf-8?B?dC9nbVBkSmdCa0w1YnBKNlkvdkFwL2dnZHFWRGlJY2lPTFJGbE9ya3RUTDd3?=
 =?utf-8?B?TlFLL3RUakZQa3lyek93d2MzeFhLd0tNZThWOHJZK0RzV20xcklOcUtiQXVN?=
 =?utf-8?B?NW9YVGgyZVlla2VTWkFSSkxNREdYdjF5MnR3cWR0N3ovMi8xZ2ZrV1ZzZlRS?=
 =?utf-8?B?SThaQnNJdk4ybExsYnNpUnlaUEwycVJGZlliS2V4Ny9iWVU3NUNrSSt6OHp1?=
 =?utf-8?B?TTJNYzJkelZJK2QwUVZCNDdvTVNsUDdtZm9JZGxTVTMzVFlsZ0VnYUNxS3Fz?=
 =?utf-8?B?dXp2cFBaQWtGY3laRVptU2UzUmwzRXZrYXZqY0dwNXFhZldyV3FGbDZkK3VR?=
 =?utf-8?B?VS9XeWpOWFZZWVQ4TER2Mkt5cWh4SitOcVhNMXAzMG5oVGZoSkthbmU3dGhE?=
 =?utf-8?B?S3NUUnJZWkw5VWtiK0dKS25DTEQxem5YRis2cmlkbEtkc1F4NTBsOWk3SkQr?=
 =?utf-8?B?cUw3TktldFZndFBSVHFpZllOUnM1dU5IM2VnQ0NZNUJGalR6UEk0REwwTEFS?=
 =?utf-8?B?Q2p4dFBENUJyaWcxZEpBRlprNkE1STM3Y2VGc2tkeHcrT09DZkhpWGxvanIr?=
 =?utf-8?B?R2Q5NXE2bUN4ckRiOTh3Y3FSM3M1cU9vbUZBN2tDd2UrY3V5UlFua1RnUzZ5?=
 =?utf-8?B?ZVRjQmVETkpWTHc5SURIL3hKLy9qeHI1U3VlN2FDU3MwVU94VC9rWUVWM1Fm?=
 =?utf-8?B?U1hvS2RyMlZFMlM4dDV5bmxKTUFUQUlUd01VL2FzN0llaGNXMHhhTzFlR1BV?=
 =?utf-8?B?N1JqZnFUR1FoNmVkbXRBRWJhSEpRUkNmYUVaS1RWZUNSVDNUR3BramVJbm1X?=
 =?utf-8?B?OFJZTTRadUVvM1J3SGtURERxTFZPRUg1T25WV05laUsvT3NOUk8yekwrUDgr?=
 =?utf-8?B?WWlzNUw1Y1o2czhGcllDcXI5NHpwRWw0dU1kNGZtL25qTWNlenFxeUY2NW9E?=
 =?utf-8?B?VnBUdjdLSVR6WCtvSHhwajdjRmwwakkranloRWs3QUROV1dndzV2RFl6Q1VG?=
 =?utf-8?B?SGZHc2dha0ZHaGZvc1lESmd2a25hK2MvMkY0QVZ6T3F1WUFpK2Nqa3N0N1Qr?=
 =?utf-8?B?QnZTYU4xZVFEbnUvamhvaTB3MmZpNERkd1hoUVFxZXNWbmZUU1R4S3FzZDJw?=
 =?utf-8?B?OWp6ZWtTQ2wwcmVEMVRQaFZqdlFwSHQrb3gzNGk2Mkp6V2JJd3hLSk5keW9F?=
 =?utf-8?Q?uPktkj4o23RLdFrpqHab5yAXXWOyLklwBo96I?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db0e3c9-7c90-4ca9-51e0-08df246b8557
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:07:13.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pk+IMLk/3YApvBij6PXmDq+oGBTr0zxsGQuBBnBGqEqUNxUL3vt9yT5EiV5nSgkhJEgkiVun9wAXwKR40XFP0Ieb4tMNedKyKw/Zl9KuPFsL7x0HSJKzLaNHfaeM8QC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

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

