Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010051.outbound.protection.outlook.com [52.101.69.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A735328E0F
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 00:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791420757; cv=fail; b=RZWM1FUM93bdi4BYNxkLwtsmzZg6VMPKft2omT13IRIxEl+etW5O3g3NlwxI9Rl3sorf55SBCQfssBmHKrlnOWYwj3xs728bno8lpBUxRKa5Ntv9cppxM9qnx1TGLdOgBfvuctcblt/OzdqVCRpU/diL0iNU/AY5/GtsHif2FSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791420757; c=relaxed/simple;
	bh=yZRGMJpAKh9graZUFBvO9MXhfwMfQregGNgfGGA68L4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=gq+Hj0eMJYM75R8mrBtJQ+7ux0b1qH7FupxMmgtFfT16SMx0drUfF5Eb94wVozt+01sP1q07BBL+BmVSlCFljCcvIWZZTE/Q9IiEm13KvxxW2RPmT/XjeeI6T41Y2mX+7FsQjrrnF8/3cFRyBtAiqnG8WEPkB8NRREB8pfDOuk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QXTwKeVP; arc=fail smtp.client-ip=52.101.69.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QXTwKeVP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwZhmdyGf8RheFNYxr0oL25apZRzvIZxb1D+YV7yBfMQcAbfs8+IsAzmgD+WiOujyDx/Awmw4d++RbWgdoJOZMphiguhuxOkHjEFDG8FOyJ1tRDapr6WcnQ31r2JkOkr0BtcfrHCAKXdKQHTj7bPJb7F0CA6UFXo76g6Ku8nVxJ2cYF4aStmqbf9+twacu3ZLKnfcNzdf2HEwnKFkanf1dfsr7jcT7BjqHH2Cn5z5n3JAvrF+MRkbFm5pZC2GgENUAW1LWKa7Vh12dDeQckwSbHXSg33+Q7CLQD/u3KOalBDNIh/EPmdSRQmq5AIz7QJoZbGL90GI1WeJOnQ6mn1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGfI8Pqnwac3oIqJ8T2hm14Fe4CdDO4R2BzWkBt1BTA=;
 b=sCubC489C7jv7zV31aiQDSg30NdlhnCkekq6wg4PhFQIcdZEXU0spTXgR60d+Lh+axOslJWD9Arfg5Dt7pLQdMSXpdNK9wxkwGbM6zUMoki8ObbL8WcIwzN/hGNOvAgiqWEET/1WSeEEd/e8LmPWjpk+I7Ttaw3RKqQC0Q4TJC8DLP1Ju2SW7/bcJEHo7O6v6DUV4vVpeRaHbHi+rPSRxGwMb0sqEZBotpe1mEkQM6MFr6Sr6f9hedxXI3jdSUddurriXBW0JWhSCXytkgX+hpJDbAE37GswxOFGZgwDIMUH5JxVhXcqtV94HmiTiiYM7FS66rdvWGbmDRcBfbYJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGfI8Pqnwac3oIqJ8T2hm14Fe4CdDO4R2BzWkBt1BTA=;
 b=QXTwKeVPpV+ZaLLPoBufh7jJaPCkZkiTWdb5bTX7eza1vZ/ElIQZP7zjdksl39xcQKm3PPWuzvnOMAmEz+T4jafxHRVKqO6TfGqnUXOddBLO9yVIMU5K/1WbQjcggmcSeZhYUB/s5o0xLRrAOvGaFc5Gaascl2+SmAvDGkAY2kf5D3SzRQ2X5EBDZ+htrTL7oiTZ49w1GQuOgqRP/B6Bjt3T5DbOgb59FhaOHWiXJ66gx8ar7NKr6wTQHA4MG7UxU55CUIzMTmDqj1wp26BwoqJ/6fGGKqkRow9SQ7DMtdExgHvkJYhjTQLTPIFZiDE/78/sz2v/cXjMUGPQ6bzfPA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU2PR04MB8967.eurprd04.prod.outlook.com (2603:10a6:10:2e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 00:52:31 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Thu, 8 Oct 2026
 00:52:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 08 Oct 2026 08:49:45 +0800
Subject: [PATCH] regmap: debugfs: Use __free(kfree) for
 regmap_reg_ranges_read_file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-regmap-debugfs-fix-v1-1-3df2f25c01b6@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKjoxmoC/yXMQQqDQAyF4atI1g1kZmHFq0gXUTNjBKcyqSKId
 3faLr8H7z/BJKsYtNUJWXY1facC96hgmDhFQR2LwZOvHVGDWeLCK47SbzEYBj3Q18xM5J/MDsp
 xzVLmX7R7/W1bP8vw+Zbgum6cMqTwdgAAAA==
X-Change-ID: 20261008-regmap-debugfs-fix-26aaa0027aa1
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU2PR04MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: c80ace1c-e9c8-4afd-f67f-08df24d66ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|6133799003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	EfO6Kf26GV7F2SNXy9aWTRHi3hAn3tkeDguI1xFXgG3BAwkg1fpH/1YjTL7/4YLKDD6KeekzhZ/n7C/mawe+1TeusNRRr/6OXqLUPsYySUvby1C4jD0fhpJOi69s4pxJ8NBzQlTgz9M325QK/Wi+YZg7BRVmRYoNNAHYVZxywQS21l2qij3XMLxlZICys8VnOTN5jOuS8s/H/Xin/SaHux+UVc/1g2CWlrZbp2erq/83IDBwDvWZqNom+tPS9A/Taengxmhx07+RHPnSkilhwvqKQlk31Hav+D+3vRa8v9rvBPBUbp/qwsLYfxGCncUv3Yr99stlSUXufAe0z3Tvflyr9sperObCrX2V/phYom2uAe5byfL7PI+kcayNZ/PVbf8lKAzxOUkfju6idIT2TPxKySdE9PVTVxLaGME17RRCT62ccK98WfftnDt9a8h65Mz7B3IXG0j3VS9rf21jHhAIw3dmYt5Zimb4Y5RTt0snRCHmyqei/5mzXF7iBrQvFePpRbZswUiyefDDWCbgX3bomObu/E7MwHHERvbLgfgehH3fuvzFUrEwbMV5PEhEuCqVjm3bnp5sCXwkJDMtb3SUCkTuYvohnwp9WFYvTwlzF7/0GnYabyQzHtGjdigsj4QQFJQDhdhglf/8b4gP9+sVh2ht4AmTvLp/iJaIqRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uld2MzlLWVB3Q09tSTFBYWt1TnJSUEpGRy9ZcnZpeWpaWFM3TzNNdGpPTDQy?=
 =?utf-8?B?T0RsdkFMWjM3U0NNb2wyWTU5R0o4WEx2bXNGRlpmTm04SmZYZHcwb2REYTgy?=
 =?utf-8?B?dC9OeWJUVU9lcGliT3VLZUh3M2JUQTZ5aWNoSnNaemE4Mk1oUVY1VmNhL3dj?=
 =?utf-8?B?QzVhajR5YWpCTDN2ajJTVFc4bnd4akRNTUhidS8rb1g0Mk9QSEhHLzF2bEI4?=
 =?utf-8?B?MkVLeVgvUWlHM0MvSWxrQ1NWNUdtUWR0Q25udEpTamtMYlkrN2h1YytFMVcx?=
 =?utf-8?B?WG4rS1orYVFMKzZvSVJRMkY1dzdtK0dzakZHS1FUVWFmQ2l6VkJkbEJLa09s?=
 =?utf-8?B?RndZQVV5enl0cEczdWhtaWp0NGI1MjJYbytDQzgxRFNwZTQwRmtDU1Bpd0d6?=
 =?utf-8?B?UGVneUJTRytjU2JkZXB4ZWNUV0VJaFRjSDNvaTlqbnJPTlRtWkVqS0NiVUtI?=
 =?utf-8?B?NU5mMFJ1Rm9jQVBONjBYT2ZkQnhQNEthdzQxV3F5cWZ3T052N0h6UHQ0amJy?=
 =?utf-8?B?QmxnMXdibk5tSnFuTjBueXJkUDRzS3pFSTRmaU9iK2xGc1lyUHlmYi9RZXNK?=
 =?utf-8?B?WkVUWHJuNENteGg5SUU3SDNQUzFJTVJQeUNxM0hVTWpiY1RURnZTbTJpSGFE?=
 =?utf-8?B?LytXSHkxd1NaRytSVnprRENjbzNDMUwwTWlIM1NqQ0xaa0laMjZXc1hiTzd6?=
 =?utf-8?B?ZitUVldZSU5VajN3QWdxdVNhK3dhMkZ4a0VYb0V6bXB3TlE4eCtZa2UzQmpU?=
 =?utf-8?B?UjdoZFNmdThEUFZZQ09id2tTRGFKdEFZVjlJZUJJckozenJzM1JlWDZxSFdh?=
 =?utf-8?B?Z1NmSGwrTGU2cEhuSk12VEVxbk9XcWhCYzU3WEpsNG9wMmkxUWx3b0JCWUxE?=
 =?utf-8?B?eitBR1FVR1FrSGZvZmZDbGM5a1JEVDltUnRkbnVUUUJIVHNHbmpvSHRJR2Vx?=
 =?utf-8?B?MGR1eFR5Z1h2WXpnVmR0UkNDbnQxUVZtMHI5TlpJYUJpM3Fyb01LTnZsTUpa?=
 =?utf-8?B?czZEOWRvOWpUM2ZxQWhOQlliczN1enNXUXhRQUdiZE1hYU1ManVnWmVKYmd5?=
 =?utf-8?B?RUFzdnJ2SlpqVmFaN2gxR3ZQYUFwYUtNTmhRTWhnZWRuam5SYlhaS2hlMEJi?=
 =?utf-8?B?cTFSOXRZZUtqVUlzeHJsck94b0xVaTl4N1lHb3JKL1ozZWlxdjQxNi9HeVl5?=
 =?utf-8?B?OHIyZnlHTytxREdyb0FsZXZqUUp2Lzc2OUtzZEw2ZnpLbllnTUxhVjZLRjk5?=
 =?utf-8?B?dEx4WThVV0hmaVc3d05BTHZNbDhFUSt3cmFhUk9VdXlxdk1iV0liMVVocEVX?=
 =?utf-8?B?UVZDU0dlTFA5WnRZMndic0lEeG1ic1ZhV0ZEb2s3YUo0RXQzUFlHdlB2eG5P?=
 =?utf-8?B?SkVuMGFqbEpyZVBoaFpaOE9VR2NUTzNPcGdsSUJsVk1SZkZkcjE2NGFLUXNH?=
 =?utf-8?B?QVNTQUJZRXpLMFV0T0p3Ymt2Z2pMY2pMRmkrdHc4aDlZK1BqVGxGZUgyOHpo?=
 =?utf-8?B?QlRMS1NGZEJtODNON3E2dDRHRnZMNFpZZzZPN2FHb0w1WjVyaitwWnBmZWxS?=
 =?utf-8?B?YkY5Z1BCVExRN2dNOUtOQTlUdVp5dnhlZDRmcDZodnZDR2lEa2FqMS9oOXVE?=
 =?utf-8?B?Z2ZyT3EzeW5yRFpkRmE5aHZtSGY5a2pxSVNhUnllZjczLzVhWW1XYWJwN0hH?=
 =?utf-8?B?SkhYOFkxb2RsL1ZVOGdjMk91MlJBbitqa2ZlQTgvaERVR0tUblVReFUzSkM4?=
 =?utf-8?B?dUpSMzZlZUZrZUEwdGhPMWwxN3RoY0RWRnhOOW8yWG5NeDRmSHYwVEg1eEdX?=
 =?utf-8?B?amJvUW1SUGxQVmRkamV4bGRiUjlQREt1UGRrNm4yQ2lYd2dLdnhEMWl0NzMw?=
 =?utf-8?B?dWIzM2tRYjJna3BwQm1rUVJDTUZWWkVlSHFUQ25oZW1zL1Fhakp5SGYyZThn?=
 =?utf-8?B?V1FEMm5zWlJtWFRMaUhJRlNvVzFjQi92TEVya2pOd2dMMVdLREsvNUNUdzl1?=
 =?utf-8?B?Y2RSNGM0QWlNTG1VSUplSHVkQUs3Zjd2WmdrNnVGZHNVTkx4d3A3T2syODJU?=
 =?utf-8?B?M1NURDFCZVV2eWRjdit4ZXZtdWtwV1JFbm5iRWhnRnVFSFNCQ3NaNlFyZ2Y5?=
 =?utf-8?B?S0dzRkJSTWhKRWNEK1lDS3YzallaK0RpNjZDaUZnQ1k3ZXpJcExzWTVydmNB?=
 =?utf-8?B?VUZxY0lWK0RyV05TNlFkeCtxdmpraGI3TDVRTG44VFJWOWM0TXl2dkV6NUgx?=
 =?utf-8?B?UURET0hRejN1T2pNbzI4UG9Nbk0ycDBGeWdSdFNwRHFQU3ZSVlBTT2k1QUJm?=
 =?utf-8?B?WVJiMS9jODI5b0IveSt2T1BOWkhqd2lKSHJ0YXg1YmFPUm95cVlSS2l3MmFP?=
 =?utf-8?Q?CZeZ2BOvOlgAr1jW0cpzWZUnoXakl8P/eL1Uk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80ace1c-e9c8-4afd-f67f-08df24d66ece
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 00:52:31.2220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9SWGt3R07cceaS2ZW8n907oc6S1GfXzxQdqC+0zA7B5gAmEew3ZrpW5Ot0i7KSNXLfaq9KgCAQVl1MEXPoe8ud0ZqYppbVxajjl8lNWsD0dH65R/E+Y554gNP2jhPX2p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8967

From: Peng Fan <peng.fan@nxp.com>

Convert buf and entry in regmap_reg_ranges_read_file() from manual
kfree() to __free(kfree) scope-based cleanup. This eliminates the
goto error path and the manual kfree(buf) on entry allocation failure,
simplifying the function to use straight-line returns.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-debugfs.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index b2ae52a21331..b62a5dce027b 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -358,8 +358,6 @@ static ssize_t regmap_reg_ranges_read_file(struct file *file,
 	struct regmap_debugfs_off_cache *c;
 	loff_t p = 0;
 	size_t buf_pos = 0;
-	char *buf;
-	char *entry;
 	int ret;
 	unsigned int entry_len;
 
@@ -369,15 +367,13 @@ static ssize_t regmap_reg_ranges_read_file(struct file *file,
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
@@ -404,17 +400,13 @@ static ssize_t regmap_reg_ranges_read_file(struct file *file,
 		}
 	}
 
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
 

---
base-commit: 5ff1a5ca9f58681f870501ac58c4293306fdce0e
change-id: 20261008-regmap-debugfs-fix-26aaa0027aa1

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

