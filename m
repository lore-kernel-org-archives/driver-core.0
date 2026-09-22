Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F1553A389
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 11:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075625; cv=fail; b=AdbLc4XIjWUcL4YXqDhyGiAOOK5j41HIc5bI8KabFIcxlH08LovIQHFE0cHkDxqHG+qfqMaTGXtYIgUD7NryEMcAa9ETnUlKMjeDVna88x6DDEtrv7DKW5e4StiwpywyHAnL48dGLhC8haY0sG3oy+XC5kC+290qYtRTVwExNX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075625; c=relaxed/simple;
	bh=WbRDC37uig0N60EAsqxrvM4g0fQ/+Wp4srJdR3I18LY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=M8l9O5yx+kXsgFb0AIIUCDWfX7KLsDJmRnlATVwYnSGp5ripsSkVLkqAHVdHc2T0LAFqAgL8s9AgbE0SZ8TIAQV67n2TYXH0YKlyoNgEPcH4pUrbUDq63UofK8xqVRwpe5InUuRJ/KfygwEKXbUv1LSDdTWse9HXEOw6220SVN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bQd9ARqX; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bQd9ARqX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5SdsUyYugxCKRZgMfM/VaIdaOq2NhIe97PJFmZrFLVs0flQt3RB4P+5aaakYel0WLswLMwuNSzSh7oQraqvH21aM/3W9vp2J4eXAKe5oR7oAxM0vOFaqhely1xXF/A1nQOu8JKwBmeG4iETzJ6lzY+VY2J64O+ZKYtIrVarYWQ/ykZzDn3X9AOYjXBhOTXM56JgwzFM8Sz+/LGsnPhd2qDO8cZM18oWZH05PBWpgTiV07pc3R2a2hz7DRNVSpAebEcmamZqhmjqBEVflnHiR9c25nLZlnM3Ew9R8TyrG3llKYzbv2YrWsWZeiZMUkFl/oqjAosF4FafuNE0Vqu75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Vaxc4CK8aQcE3BPY0Zz4fTuSDePI6IScfYAT7hKa78=;
 b=elL5WFsgYEjNpvKp4bcgVSNSOR5LXhQ6NkyTzCC2d+NYf5/X1cZLPcRWJobxQuXtZz/DECJu2sfq/0I7uZIw3Xu/uRobRUl3snyIugu1JRf7aoC/+x5CD2HAq8mxTYrBPMJHPiXgo9Zzw9fdwQBprTPe4E0GHsEC3e6DxwcU7jlOV/GJZnancMpL0HtVB4nkLPZ7cCj3iCuwT/q9RWYMP0oLmIq9jZ55rQsIZqfeOW2xPB+mjJ/mDrrHeGgxteK2nxEOF5/IPjGMZx4zQ9XQ+XenbOFlSKtZZQT4swS1/yloXCUH2zl5tFQyYQ+5GJjvDpJffNi4kG4KL4PwIcQlqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Vaxc4CK8aQcE3BPY0Zz4fTuSDePI6IScfYAT7hKa78=;
 b=bQd9ARqX16wQKHwxRjsgp31k/H74NUqo++PabX5IZLezlS1bULmfpSgKa0iRaSgNPCDt14qHlOubjzCsgT4HKi6b0b1oH54RkGTp8H4PoJH9/Vr0XXxc2BTBhGptQSJr/qwpHO2bCH1m31bSYpmvkoOhO2TCCIR3sv4mLKvrj/2xWX7Bj2fgFNr2Hl7fR1nUJ8u09MOT/TPpnuDz54GxwcFIuwshJEd/tk+E4pwDo3kGbgSYg6GyktxUhVarYFamucxbjtnE5W0bkwvpvXJpwF+FXGq/oJZgH0gJr9Ct14T7NdcfwFRvazr3Jb4XLgICi1iVU71NWPGvIhnJ+l1E7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11191.eurprd04.prod.outlook.com (2603:10a6:150:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:13:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 11:13:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 22 Sep 2026 19:10:57 +0800
Subject: [PATCH RFC v2 3/4] regcache: rbtree: use the regmap scoped lock
 guard
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-regmap-lock-guard-v2-3-0c9d426427bd@nxp.com>
References: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
In-Reply-To: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 629efe1a-c9c9-45f6-8389-08df189a8eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fVlL5bywsOhNDF3xsLV1fyhbHPw8ip913yQJGNlTH+MlRp8Rec3z8TU6xf99oXcinOawCwTBvGLdbauHusgqAFzokeloIPZfKJEVy45ibR2GjK5UWKaB9eAl3tsZHTxNtVR5Ucgp4IU6Z6VEg6zkr+c/MTn3Bkgpuh6G2lcgpNk8twla44RD6082wsT+JLZFv65dEA4ecmVnKuL0Y2wvdESvC/lw6cLNmP0hUQ+hygbAfk2RDzhTQeQgL00pOYW41mc2JI4eMryEwVCH1vB3hxUWRz2FSLExOjK9bgzHDOCTmpvlcZBeuH8jlDaiaGa1a1Oypq04UPibtWa6dSiLqWdjsgg0zxALglIL+8WNBZ71cs62v8pjisTYQg1Y0wp2HbLWN/KCl+ia3Pj52V2JCcnJNOw6dzRzgFTNRBisunuint/gRZCTtHZydI8NoTivJf3nqLBJiO6yVFkeCN8Ms07us7Yffs4Cc3Cvy4tkknpMnk007x0gd5nBEVD418ozjQ0Exl0Xhme74CKoFyBztgLEcFaw4zTBuMAc0QLo9+AtLRUkhiBNhJnveNF0bUvZLmcBhUTVKfIgM5RSmNhgmggSGR0sNqJp1+sie2SRGxIYh3WLbVHs/F0tPRbtnz4YOB+AFIyl8cdvztudXN6pZgYAfeUKgL2b/xFZYAPW2wQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmZXaFNJYlpFOVVCRGNpWGhxc2VXVGFKRDE2alFvSEF0MmdnaGZRNlNWOTFS?=
 =?utf-8?B?SmpiN2o2Wlo0b2lhQm5vRnNvWDlmc2VGc1V0eU9Pb0pyeTBSeHJ3WklhQ25t?=
 =?utf-8?B?NVlzU0c0cytjMUtQRGlEakpmZkNuK0VYL2RkV2VqUlpWMzVqZ2pXNHdJRCtz?=
 =?utf-8?B?UEZFdlRZQkxmMS9KcENOL3pQOGFBRnFSM25EQWNYMDE0VnVOTlBzeU02UGJG?=
 =?utf-8?B?U3NMS0VJOFE0WC9XUnNjODJnaVJZTDA0a251MnVKNkVyL3FrZUNMYUpleUpi?=
 =?utf-8?B?NTJjdWdTNG95WDRsRTFxSkZGVVdTMXVPOUhKd3FZckliWEw2QjY1SCtWa0Za?=
 =?utf-8?B?YkFWZlVGK3ZBOVlUUW1xdzN1aHVQZUhEcUgrazBUVm04ME9LUmNxVHlNRlRs?=
 =?utf-8?B?Qjc2SlVCM0FXN2pRRzVWRFBBQkJLaFZYNmtUQmxwZENhalFaVjhGWlc2VUpV?=
 =?utf-8?B?MFd3aXU1cFU3Sys5TWlVc1prR2dBemFDZ0hVQlhidlBsYlpsNExjUm5mNnBp?=
 =?utf-8?B?c3Y2ckowdHU1YU80MEE2UzV5NGVQQUpHTVBiRmV5VWhCV29WbUFoN29zdHds?=
 =?utf-8?B?Vi80UHdvRHBLZzZuNC85YzhPK3FwMHI5MXdSM1FWM091YXhZa3hTbklmSFJJ?=
 =?utf-8?B?ZVlYc1dpZ1NBVUNuZm5rMnkvZkVXYWViakRaV1VDSmZEejRoaGRMLyt1eUFJ?=
 =?utf-8?B?am1NSFc1Ykxkb3hzenF2QTJmWTBVM0VwWEluQkRRRStSWUxzVkRvTUtCMjV0?=
 =?utf-8?B?T3lEbUFMZEpXL2lqcmVXdkF6Y1dJQTVIcUMwenpuU0xCS3lOYm82WG1RNHdL?=
 =?utf-8?B?SEZLa0o5YWFSdWNjVHhpeE15MFQzOFdOQnpkVEtNdGRGQk1xNC96VXRKTElG?=
 =?utf-8?B?cGk2UE51VGRwS2p1blpQNmR3R0JLU3lqQk96Z014VmRMcmxjWG9IaWRoZ2pX?=
 =?utf-8?B?VHFobU83ZG9kRlovdmlFVFZVcVBUSHJYMFFIWm1ydUZrdTdCVDQ1LzZNeXNY?=
 =?utf-8?B?NlpGRVN1YS9EUlhaTG1SRzN1ZkFSZmI4QTA3VEdyMldid09yZ3hLUkw4RDJl?=
 =?utf-8?B?cHg3ekJVdmE1VGdyZEd3Z29rM2NiRkJkSC9wOG82V3RtV3JvdlJiRmJXT2dY?=
 =?utf-8?B?TlJtQTBRUTJiZVZySURLb2RGenk1eWZjbGVuT1B3RE1qaTU1SjQ4c3Z3Z1hX?=
 =?utf-8?B?S0ZwQ3l4Z2VZZkZaVG5Ld08xYzhjbkhmVXh2UkVObFBRMDMrU1QxMjk3alhs?=
 =?utf-8?B?Q29IZDZoZC96YTJma1h0eVV1OGxsWE5MR3lNY1ovLysxaGpZa1RGVFZOMnJQ?=
 =?utf-8?B?aTFmVkJwQnh3QXZRZWtnY2g2bWgvbmU4cUt6cWM3OTRSdzVUQTJ6TDJIQkUr?=
 =?utf-8?B?ZjlPVHVJTlNGbnUwakVOOWlaaE8xazhBUmdLaURNaFlRWU5XV1VpV05xdUpW?=
 =?utf-8?B?NVpBV3hiTnp2MDlzM3ByMHk5Ry9KNnVVY0ZaVlJCUEZPTjh3eHp2NVVHdGp1?=
 =?utf-8?B?MUlNQjlhaXJva25wRXJBTHpHdjlQQkZFRlVmTW96TWdNMllxRGNKNU5EOGxG?=
 =?utf-8?B?ZGpqTE9rWSt6STNXWDB4Q3hwbHZVdEI5c25RRmZ6UnFZUHdMRW1jZkNBZXhZ?=
 =?utf-8?B?Z214ZDM4dEFoWmVjNE54UDNiQlRRWVhqZjZyb292d0Y5eDBKOHV5bXR4TWl3?=
 =?utf-8?B?OXVybHorall3ZDBzWW0wWnc1WGR0RENScTEzUUpNV1hGSlFyekdYS0tZOWhC?=
 =?utf-8?B?Z3NhNXZjNWZ2YjI0bGVpRGVOVjF2SjBadkNqdUhubldaWlVOc1pEVlRiRmE0?=
 =?utf-8?B?TEVTWmp3dlRPMFZYdlBTMUVJVkNRalBjOGg3dTZWcXZLMXdvdW4zUGZ3cnkr?=
 =?utf-8?B?Rm5mRzRaZXV4VjNKVFdCdVBWenpFMzlLeUJNZ0FBeC9wQmNaY3JxVXp5RjFm?=
 =?utf-8?B?QkVjNGZQMjlMekdjSzQ0RWF3a0FlNnd1NXlaWTBBbHFJNU1aVmJybldVNE1z?=
 =?utf-8?B?N2F2RE1Mb1BGbUJLaGtIeDFPbkJqaGg0VUZ3NHk5WjVIOCs4MVdtVytZTTlP?=
 =?utf-8?B?QmRiZklOMzRMZmp0dWJBQnVxdXRQL0NSODNZQmE0S2NXS0N3eUt4dHdlMm5I?=
 =?utf-8?B?bHhMQW5QTFRFZ3oxR2syVldNZzRkTWQvODQwazQ2NEhDWTQzWE1Sei9SQXFl?=
 =?utf-8?B?Wll2R0VvNzRCQkhRVkdrQm5DVXZsMjZEamdhY24vcXdvYWNFaFFka1ZLaDFL?=
 =?utf-8?B?OTJoMVV2QVZ4RUE2MzZGb2dGQ2puVVIyMkRNdnBrL1ZsenlqYzVZUFF0SWIr?=
 =?utf-8?B?aldONnVMVWh5YWNWOGtYZUVwUXcwQnduYmM0cTJJUUFYWlFjQWlodEF0Vmx3?=
 =?utf-8?Q?XamRBiI80mMuQTBZ7xt7YBsgKfYk/zORK/owg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629efe1a-c9c9-45f6-8389-08df189a8eb4
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:13:41.0705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L+k+/UYxq9KoadvX+qoBejVsgPNgYo9ZOD4VHE1/JlyO11MmfkyTLuosspVBEOh/h3LGymDQPUy8UgJE6POrKfDrfZ6yV9mIU4Qjod9TWn/UwNGHtLBbHftXjsS4RwQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11191

From: Peng Fan <peng.fan@nxp.com>

Convert the open-coded map->lock()/map->unlock() pair in rbtree_show()
to guard(regmap)(). The locked region spans the whole function body up
to the single return, so a function-scope guard drops the manual
unlock with no functional change.

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache-rbtree.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regcache-rbtree.c b/drivers/base/regmap/regcache-rbtree.c
index 520d5f8ba3cd..e2feed6dbecf 100644
--- a/drivers/base/regmap/regcache-rbtree.c
+++ b/drivers/base/regmap/regcache-rbtree.c
@@ -141,7 +141,7 @@ static int rbtree_show(struct seq_file *s, void *ignored)
 	int registers = 0;
 	int this_registers, average;
 
-	map->lock(map->lock_arg);
+	guard(regmap)(map);
 
 	mem_size = sizeof(*rbtree_ctx);
 
@@ -168,8 +168,6 @@ static int rbtree_show(struct seq_file *s, void *ignored)
 	seq_printf(s, "%d nodes, %d registers, average %d registers, used %zu bytes\n",
 		   nodes, registers, average, mem_size);
 
-	map->unlock(map->lock_arg);
-
 	return 0;
 }
 

-- 
2.51.0

