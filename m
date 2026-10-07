Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CC3A0B36
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374885; cv=fail; b=DJS4RNXdm+RCdyT1lw+UfedFRGkce+QpEhP52EWV1YOz3MEoAApqrJ+PZ35O8bKBcR9F3bOYPN6DjFzcw60QIQXlEVkHhQvpoNoNn9c/BqVWBTLNMQ9mqFfIvTnWSEdp5ddZLbcBWFVb2K8UY5liruujlygauAyayyXsVjFnsTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374885; c=relaxed/simple;
	bh=a9/baVfgkn0LxEG4DMhRd4xaihZZGdB0jry0D1y3e50=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lSYXJ4Pf7LW8pW6+D5CpgWA0XVGHL7+RCp69sRRQFH9B02gAo2GSBrod2B052MOR9sHRVhA2mGbgrwK8bz1MRH2jgk/lwxC1+JSNciSEmZ/pNbJaO4ovftO5ok86qFOxcpXbnPC2S2XZJcgeo6F1OZm5SdsrMoGDdVGILS2+94s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vwo3ZcGW; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vwo3ZcGW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zffyv5JprEya+pbNhsQSF7iEvepJ3o8EJ5zM9q6s6dqV7l11isWY++oTajVUtWq+z2kV8Wvo/8xZOpoQLxtMLec4He72B9/hNZR8C/Gj+A7F4GIb9ejGHbXDrHAqRT28H1fR7TAkFdD6T2UFmEQlLxqdesgE1ZdMttSlNSHsj7dAPhn+9+6/ULeiINAuDPdYnP1Os29K/1sfWDcHko3TEiX9QPmJ/T8IVORJss2U6vp0MQJ70Roy6eIiLmUeXkH9cUQBwX3DEMkJxfLx3dvkGPMP31Q3lc94UAIqJB1ijpi8r1uJI0riayUCi8Xz7iQqI24TT1lpakzZLK79eOd4zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuwgMWqMBQAB+uJUhIewy9RvZ0l8eqbGT7BWfcsUfiU=;
 b=RKdGVahSinUbxs49NdmT75WX3G4w2I7accf9G+QYe3LAAjKo7/luw8Hozg+4FuktAm72ZOWxjSvda0rEk6idn0kNnfWjjq1bDaKEa78lMN2gVh9csT3zsriSbXedMaeuY8qA34x0lSzI9oy5L/TMVICcxXrk0kw+Wfb5jTyv/PsIugRrsqqKGBjS2QM3tCSOxWYykL84sNsPUou0zHplqKw+wwwMVP/taiLlsIiEXaVeYiOxYo1Hvk1uxXJ2C6IZ4fm5gKPXAth41lqZ1IwuC6t3PuYAxBFmyfKUxo/BOmYHopqjxi3XcGAxUg+mZY16jqewM5/w/s7CpjlJhkCLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuwgMWqMBQAB+uJUhIewy9RvZ0l8eqbGT7BWfcsUfiU=;
 b=vwo3ZcGWQ5ax8VSPZ8Kbtlq8QB21bBxkAScokKsYdRgTjcAbx1skPj9JvwM57fsixVU76BDxx6Bs4bOJkIRZctNaUsVBvBNSGxFe+RUKG4qEAeg1C50k1wF9t1u7a38A6+3k/mbJBOvvO0noynvLOXQkxXFcOFM98K3A42142lsZb87tVCPlSIPXcNBezqUDdS6GG52LupvVUDdRa5iEnbga7b0Olj8sdexhYgnoQvsD7KD/Gp3fYLBGgAiOUjSzuZ93XGbyTIn9kbyAC0w+6tFvSsnqa5GB1wKNWvDUZXs0fEziG2a4Clk39PlAgs8NAjmplMgnTToW/SdECxZu0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:07:19 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:07:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 20:04:01 +0800
Subject: [PATCH v3 5/7] regmap: fix potential double-free of
 map->reg_defaults on cache reinit
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-regmap-lock-2nd-v3-5-0e590c4125be@nxp.com>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: cf1d6710-8287-42f5-7a47-08df246b897b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QnH/uD6qAgy2aBo02LQNI3xDKtpN0O1uKyevpFPuhPlEQ+sXsBgv74K+EK0iaANykzUZEjyZt8NV23GGvSE8/PsG0wzyfDUIWnV1bCHPdAnCtlTr0CiwzBmgsx0GdMzC1+J3prgYWecC5mdvbFQ2iS1srb7DlgGz0iILcCi81uomvPv6nzMFWT2XzNoGwAJPwdOjg9qeG9j0COaIQEezeREIZAoCoYIA7XkYj3Bnvh7ms8a0MBNvaftIR0Yp2AZ8/tfy+u0dDlIm5mnTgXKiw2ne2wlgFyNQl/YlU5UpsC+yTKMSfYSSmQO6HYsaF6pcrsvKJwkZZk2SBsjP7bNflSW1X9NienVwAZzAN72FdsW3PAVnJ/3wArTow3fSfSir7foXCGcrRfrl5DrnjGD3d+Hw6rhXw4r7IZqP20f1519D67bE4zvuKXw6S74eWVESUI46KtUlnYbePFYZDnuQ3NsUSeD0ibu8O4cXM/Bj8KBQf9wqbJX3Nq2aiwTH31bdLsecUDvM0hqoRlAitSDOkUZOj/4p9v1b1TfvuZHSePZX3yqkt4XGVEPwmQ6aQ4gAcQT8sAq/g8yRM+H4on+CDjWNdJ370Vst6zQ/bSBuN3w/sNMflB6s9iEuwy0rscQWg3R1yLtOWJheJ7ImdnxXrrN4bmDgG8Z6ZzwYtvwLrh4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0wzTVNtNldQalQ5U3I3UU1IZUgxUDRMcW8zOWZBMDdpdHBXODc3WGcwZkxL?=
 =?utf-8?B?dWdONnhwT00xR280TFhVNURBWkZVWFJFVWs3aGh4THZZb2RodG4xQk1qcjBi?=
 =?utf-8?B?aFNQYklsWVJ0eEw0N2hSM00xenNxUWszSmlaSElBY3M0MnFlSnhrbHZTSms1?=
 =?utf-8?B?ei9TemdjWFdIWDVLRzllbElGbFAyQUlObEMxV1JzSWpDVmhjZnE1MzBMUTlE?=
 =?utf-8?B?R0w2MTVhTklXNnJzeVg3dSs1aTJkUFNTQ0p4dzlNZEpaOHZrZDdEQ2ExQ1Fj?=
 =?utf-8?B?OTRwMkt3RmJvbW41YzVWTU5sUUo5RWV0Q2cyWEVUQlErK0haMzd6TjVaU2N4?=
 =?utf-8?B?aVBvbXd0d3BpZ3lxbUtScHZoc2M1N3V0UUNySmZaeHhjT0F1MENsb3ZKNzlX?=
 =?utf-8?B?SmpYc2xSQXFxeE9Ddno0TnhFWHdCSUxZcVhsUlBucWNnZ2l2a2FOWnRqV3h2?=
 =?utf-8?B?Z25Bc2wySHBZUzlQeFJDWVZ0d1RxQUJJSk1oclFseUdGbGxCVEtvNkJiTVdY?=
 =?utf-8?B?RENiSC9EWlVMcWxOWmhwcE1OUjErUFhTYzVlSUY3Yk9EbUV6QllHR25GNHVI?=
 =?utf-8?B?cW1XTDJCYnR1OStDYWlhSUEzRlZIeWtFRitpd2twbktlYXZuOCtvMEhRT2dV?=
 =?utf-8?B?L3FjK0Q4eVFFWXNEcWIwdVEwZmwveVcwb1VUMVVMcXhJclg3ZHNQL25pdnBj?=
 =?utf-8?B?TFZJT3V2eE9CcW9SaDJFbVZuekZaaXZoa2JsbmVNa2MwaWxXemhDa2F6R1ps?=
 =?utf-8?B?eS9DeE8vTHgwUmpRMzB3WVF3Wk4yUXR0cVBMUk00OWo3b3UzSDFOZkE1eDdh?=
 =?utf-8?B?WVhUMkhqd3hyMVNyUHkzRERKdERVclFESGZtTjM4T3R3S3ZHV3NRbmdCZjhk?=
 =?utf-8?B?NlBmK0xMOFRKTHFaL2VQV3pTbExPS0dIVGN5dTJrWXJ3TDFqRlkvTGg1Qlg2?=
 =?utf-8?B?bHFac2Mzak1pVFNGeTlwcGI1dE5VdlpkdE5UMU1iMXVxZVFhaDYzelVVQzBk?=
 =?utf-8?B?NHY5eGlmZFJPTU5VSlUwaDNaREhvUVR6UHhTcGVWOG52V2RyOTFxMnMwSmZT?=
 =?utf-8?B?S09zODNDMEJCdUJTT3VmZ3VDUk5TNW1sb3dKN3ZDMUo5TXRESHhoMHVOcVJx?=
 =?utf-8?B?SndNTUJ5SHJCMEF6ZnpLT0N4Yi9ZTllOMlJvUkNMb1F4UWh0SHloRzJEd0dJ?=
 =?utf-8?B?OStFMm4wcGppTUxIZis0eTF5MGhBRUMyUHQ5R3Q2NUZVdGNxOStvYWlaQ3Rk?=
 =?utf-8?B?VXhpZWhFTUJ3TWJNZUxWRElmS09rMjduK0xLcFJHa2hHcDhqT0UvZlIycnpI?=
 =?utf-8?B?eHdHS0FxNVI4VGxpV1U3M2pVM2lOVGNpSnpiMndXQm8rTWVDMTgxa1RvNmZr?=
 =?utf-8?B?eXF0N0Y1UnA5REFLZ21Zd2YrZC9YblA2YzhYTCtGUHA1R0ErVUx5VnovUGNI?=
 =?utf-8?B?MXlQSzNleGZ4eTVsTlczNTUxU1dKN3Vtd3BvRXJjUktMUEM5dnpQYlR6SzlD?=
 =?utf-8?B?My9HbXhCSGpuS3JqWVlzaDRkUlJJYnkxVXg5YzZndm1oNnJBSTUySUJjWDls?=
 =?utf-8?B?ZUNPcUNtTzNNelVtemN1UFBWU3ZiZnR3ci9IcUsrWGkyd2ppQUdCTGdzcStm?=
 =?utf-8?B?WEhVSkg2M2VuaStMeDV5V0U3cWNCeFZJU2NiQTJkR1I3SnRaUmJ1Ty9OT2wr?=
 =?utf-8?B?bWExaGxIR05SNE4zTTRqSjZYVmFoczB0Znl1WDJ4N1NFVnNzWTFiaS8zcUJ3?=
 =?utf-8?B?SUNVMkV1NkcrQkEwWWpjYXZwMEZ5WmFRMWVFT3BsVjdOYlgwb2dQejJObGpi?=
 =?utf-8?B?SWlsOEJvNldUK1lqaDhiSkMrekpwWmMxajBFOStvbHM2Z3hWNUtsWlk1dlZJ?=
 =?utf-8?B?R2RQMk9VZGRlaXQ1SUF0aUdoKzRsc3g4MTJQdDlUL08wc3pJT2NDbmxhM2Zt?=
 =?utf-8?B?VjJHMGJ6bVppMGRadjRnbDFhdWFzeXRFeDZyK3ZpWVRUQ3IrY2c0V2xOOEtZ?=
 =?utf-8?B?V0RmTFU2NkpMTzdadGtvZjlsOVBMeDY1bVNJcWZacEVTb3crVFdNc2ozdzlX?=
 =?utf-8?B?cFZtKzJESW15RktSR1JOZDhIQVQrVENZaXU5bi9wY3NjcWhrWUY5OTQ3SXA5?=
 =?utf-8?B?VkYrZ2dER0FoMkxmdThOT3pxMENMU0xUbEpiS1R6bmtGeUREWGpmSVdjd2sx?=
 =?utf-8?B?N3lXWUV0RHI3WngreHFxUDR5OG01RGFIUUhCeGlKNCtnRjNENTR2OW1mZ29Q?=
 =?utf-8?B?Snh4NTQ4bDRKVU5GZmdsWnZ1U2pySnVHQ09SWnZRdTRjWXJ1ekc1OXY5ZjF2?=
 =?utf-8?B?dXRRK3VtbTI5dC9nSTh5Q0FhY1N2QklzSHB5TmkrcVd1M2R6MERYT3BZV0lm?=
 =?utf-8?Q?zlwAHZIG433asQKr1aPdqj2fxYs9EuApAG5lL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf1d6710-8287-42f5-7a47-08df246b897b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:07:19.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: isil0iqZ9c+g9nWeozAqOBFSV4BCdhvbisHIs+Y0Q86WWCKyKGOiLImk5aouS8nczCyptIcC6mTk7dRNVQVz/247iOAdV8oyRwBfNzEdTWtbDsvAUToyuOTbQyjFDS3x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

From: Peng Fan <peng.fan@nxp.com>

regcache_exit() frees map->reg_defaults but does not NULL the pointer.
If regmap_reinit_cache() is later called with a config that has neither
reg_defaults nor num_reg_defaults_raw, regcache_init() skips both
allocation branches and leaves the stale pointer in place.  Should
cache_ops->init then fail, the err_free_reg_defaults error path calls
kfree(map->reg_defaults) a second time.

NULL the pointer after freeing so the error-path kfree() is a harmless
no-op.

Assisted-by: LLM
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 136d6adf3120..3b1c2f28d585 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -294,6 +294,7 @@ void regcache_exit(struct regmap *map)
 	regcache_locked_exit(map);
 
 	kfree(map->reg_defaults);
+	map->reg_defaults = NULL;
 }
 
 /**

-- 
2.51.0

