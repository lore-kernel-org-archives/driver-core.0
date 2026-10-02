Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013041.outbound.protection.outlook.com [52.101.72.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E549F106
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946886; cv=fail; b=no8KByNoyp1g0YkWGWcKBbrH62ih/AD3vJFzbC9QI/5aJ8/v0DTY6FBhh64wmpAQ2uhKGhZxKwnQsBPcoLbT2DENQwhgOQ0AZKdTlNosj2eO8tQqYnqA7B2zZ1+aMy2yhKZjQ7WIbCSlpyTP9C1rokEGxRLKROjYVQN4w5KN09U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946886; c=relaxed/simple;
	bh=tnZ3aFt753MSvs+wDfXPtPOOrmnjmwDu+JmJwVedtwQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FQS70FPbshfjhkaqiOx2zuXPiA+fr7M8lDFUVKsGKSi2MnpA1bagN6zEiUyFmc9WehN1c8mVWw63IqO+zbL7KRgbxnonAYc7gXyGO3241io+4tXDrO6Z5jVRzeWAxoE91yQlH04TD38tCTXAJ+8LT4bFbgQdWFQdqpAX7SGx5pU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yDigzdYV; arc=fail smtp.client-ip=52.101.72.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yDigzdYV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeXKD+MRm8p6cjqqxoRvfy2nvXF+4BfrJmbPRnvPrYPmJ/BVQ0XKewf0HRh1ARdmyAY9TzRfkj7afX/p87N7Q8HMT6nptk8LHy1aGi+1dpVzJKo2K8ahvZSd/sHWhwlpQgsmBhUdAJLp78zynjxXA1FN2SyHxPKQZoCmJUyW3aZ5ahlLlrUY1h/3LieeugUJdEWqaWJGpokR0lMgKLbJQoRS2IHn+aGQX3OMD4bLurLz8akbLh5wwVXbKNSAUain2BM3sreIr+Azn7YsBdFAy5U0fcz/eJGp/T1wfPjMJy41LQXcvndh6FtCwO1EYFSbw4VjgakK+FZ0Rt1bH9rvAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuiyjZRIhwHzDwxh84fKBjXZ/NgalFSonxRhOSK6Uy4=;
 b=mC90t8mSgiGI4iIvEpS4n+3sY4FJ8pTNqdC8Ogf/FjV6ynpzanTE4rozsr4NJlb3u+93ffgySbU7ySxO+JiOSSAHjgqkfUXwUHMc69G3O7MqL7Slw9Qf787XSi5FX7VojSxcRk/iSZOlFKm5LBo22VJTFx4SMh2jwoaDRhgh13UoWKRRP86SnPIoPjHxVq00Vdh6Ek1tMBrP+U3sONm3B5Lv0Z4Y+rJen1fjxr4F0pacBufZ0IsKbBPi5KvsfwnGzWmSF9RJ/gvjUQMLdKWEkH9H3aDSn9XdcEng+JLhQUvJIjAupLKIQ2cB2sQNY9zY4Zba4a+qTNvIpsaOnGCFBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuiyjZRIhwHzDwxh84fKBjXZ/NgalFSonxRhOSK6Uy4=;
 b=yDigzdYVUETaQP/08tVpZIuVU1RkzUj4uXBE96qnStuFch/zgaXCcUIkpIDIaogrZMZSVF9G/GSWvz7AdkuU7etuyafFWSTjcka/ryhLC6w9TPom2bzjKCnUN4GeuwHH05NppTHWPx1SqN0lG0zq3iHASmQw/+OskU91prIm3NP0E0NYr5+S1lIanAAwIWhtHGnsUV9GFoJ1q+NGuuape7Sh4Ac4nFaCkOaO3Uh/nJXTBvf7B2LtllUJPQQl/D6rZexeUsz3tvfaVdgDV8T6SiY1f2//7RHWW/kBSFc8M4ZAtQVqXCG/BSVLjdv85A8OKniRKTxzMcTxo2pzqepBZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 13:14:41 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:14:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 02 Oct 2026 21:11:22 +0800
Subject: [PATCH v2 6/7] regmap: debugfs: Use __free(kfree) in
 regmap_name_read_file()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-regmap-lock-2nd-v2-6-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 650b0578-90aa-43dc-ebd2-08df20871ea8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|23010399003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4K3Hep7Nnl1ghR+4ivov2IMtTKp275uy8Obbo6hk2qr7M1y+NkpQhKJlVEmTg/smNr0taW+j+oMEK5TVhgyjhg940a/R5iJHTCuwNY7cWHzhT6nE72A84NIOfBFdQWa0DxGYUmwSrDP4tWikc09KWkrxS3S568v6qEK/fbWdvQLxlSRtnbAGKn+2ZgeisRw53FLCguXNZQJCXgt58tYLXUZLHO06vc2s6mg6chGIBOpKvDChUTlLScMkSafLZZVXEGK9MEPNG1KPfMCP7mLatl3XLLXjXSMWUrwhnoZ/KkrqJijviJQOUOjjJS9cEbas7YSQ6kxo6U4DbA6B/ZoUrNfBh3D8WO1nk+4XlIzsJIG7GqyrF9ymikAUFKwJAdQSwqgI20EVLJyteARcv80D6HErVrmMFzu0mYjFJCI4nc87hgVQ1yfXsroL9mjHv2TDvh9JzqMhAHl+sI0wR1fArFbQHI3n8tQ56+BzH22O/qp5ecTuaGOvbH3CGageN0rBG7TKzf4bFW51egYGQeOGj6cC+gSnLBmUnzOJeAtlaFMqxgjGflnOvpfzLS+owhGJRlqrdVFdVjJvheGN8rvchcj2/9Cs+0qEk9oIaDqSka04ILyw/ZLUfqQ9PKN167LCqswkAmR03CjKLy9/VwEQZ5LD8YhgbPOB1m8Nw5jIfRg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(23010399003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnMxcWhuL2ZlSVZHOE9DT29DU2VMQytGZFJCQ25DdU9BR09ITnJ6VkVCb3lz?=
 =?utf-8?B?NGs4Y29VQlFwK2RXRDh0TXhjZXVHZWc4V0VKM0FqYldMVzlPb0FMdmhSNWtT?=
 =?utf-8?B?R09zRkdjVW5NZVJjemwzM1d4ZHJ0ZHFwM0NIbUg1N2FzU1JsZnJqOE9MVGY4?=
 =?utf-8?B?K3lmNGlPNktOZkZVVXNZUFFkS0dBZFlBN2Z4cFRHOHlkbmkxajBaV1RCNG04?=
 =?utf-8?B?N283blduUzJLWWduOExZOXFRY0FiTy9xb01UODVyRUw1K1I0TnJGNHpWYmlz?=
 =?utf-8?B?b1FlQlRMRjBuNmdjenNGMGdJWXp5ZlJZOVZuZG84TnJnNEJIbXFCSzMrQVlG?=
 =?utf-8?B?MDUyUXRsMlZyeXF4ZlhkWmNYNktoU0J4L3BuMTlxMXdIM1FaTFQyR2R1SUhE?=
 =?utf-8?B?SllUVGJKTWxGUzEzbktEcDA4RFJ4ZXNkeWxPMzVZNGlmY3haemZ0c0JGaDN1?=
 =?utf-8?B?Zkc4TXVDT1ExcFZQZkpZeDlaMXlxZnlxYnJ5STVSLzBnZ1NnZTdzMytIODR6?=
 =?utf-8?B?Z1IyQkFMaWg2RjBST3g2M0lFaFFRakpNN3FZQ0duQ016YVJJOGdsRm82OFpr?=
 =?utf-8?B?SzcwSElDN0JmdFQ5eUZ2STlMOWlxbXY4L1pXNU1SRm5pc2I1L29iRVgwR0Yy?=
 =?utf-8?B?WGtoZVNlN2VGWXQ3Wm4velBjVzRWU3Vxa01qc2M3ZmJoT3VKWk5EcVZiWExJ?=
 =?utf-8?B?VGtUOGx4bEFpRmJPdnZISWY3dWUzekNVQ0NuOXR4S2NtNzdtdXJUSFM4cEx0?=
 =?utf-8?B?dVdlbmVaSVdPdS8vQlREM3VRRGMvQzhhaGFNYlZTQitMNlFkbm1JdWRwZnNX?=
 =?utf-8?B?K0NIelhUd05NOEZld041RGF2S1hXdEF3WTZ0eWpLNEoxWWEyMDlYSk5QeXVj?=
 =?utf-8?B?WXd5UGtwZHBoWU1Sa3BUZUJOK21LQUo2U1lQWUlxQUU1VXNtKytoTEpaYmFM?=
 =?utf-8?B?Um1vWjl2V3VCVEZSTG14SXV4d3BVK0xTVGIvMHRLZittdTBSM0d2T2ZYbzBP?=
 =?utf-8?B?bmxEWWZTejZXUXhyOVgrNGt5ZENmZHl6SU1ESG0xcnNoazFnQnJOaU4ramd6?=
 =?utf-8?B?azRiSUZzaEtOb0J6bHNlclA2SnE3VHVtWFg5dGhOK0tobzhYSXh1NXRnaXRN?=
 =?utf-8?B?V2FTUHQ0WjZ3R3hmcjRweWJMQTFPZVhGOFE5bWZxNm9QbHlMbS9PaFl4Yzla?=
 =?utf-8?B?aXQ0ODhCVm9wTHBtM2lmbHlua1NBRmJ0QmdsZ3NmOEZzM3dkTnZWVm1vY01n?=
 =?utf-8?B?RVBNclJLTzIrZTBvTVBRcTNWcFNEcm1SWkZ1U3Q5QTQxcDFRd1lWNFdCR01r?=
 =?utf-8?B?YWttRVZKTi8wL21oMy9WazFyd0ZJb2lOMStNVldQWVJKbndCOTR3SytqcWdQ?=
 =?utf-8?B?Mmk0NjJjUTNpWmh5Sjd0a210YmZ5Tmx3c1hQL3NnNVlqMUg5d09PWUp2ODB0?=
 =?utf-8?B?R3N1VUhsaHlhSC95N2pwNDBBZndPSzR4Z2Rvb3lmQUtJR2s0Ky9LaWRnQTZr?=
 =?utf-8?B?V3BrcnpGTitWcW5kRTJETkpPOHd0blhxazA3ZmRjV2lwT1NCdkdVQXl3d3dh?=
 =?utf-8?B?eC9KRlJwZzlORTF0WnJRUWJoRXJPOFVmQkRWdUczME91TnQ3UXdzcytJcUZZ?=
 =?utf-8?B?aTdsbFhoVzlBY0dNb2tDdHFiWWk4dGpKNGpxSEs3czcwRGtaWUJtWlo3NDda?=
 =?utf-8?B?T05pOWMrbUdxNmtJRFF1U1BBUXhvNGhUK3FhR3ZEOW5qNGx6d2UrU0xTN2pT?=
 =?utf-8?B?YW85OXh3NG50ZmdsVG5yZVZSV3Q1WVRtWWNybUdkK0E3a2tyN2psSUgwTzl6?=
 =?utf-8?B?L1dKaElkeG9CbEpXS3p2MVArWnNmTmQzM0hlZEYxcWM3c3BXQndQeHl4RVN2?=
 =?utf-8?B?aWlyMU44c0lvMXE4RDEzakg0QmFxbGxiUUdwLzZZYTUzeGFVMUl0bE8xWklE?=
 =?utf-8?B?MFBhWk1lajVreERHZGhFQXVjcTQwcWwzVjVBazlqcDJGZGZabTBsTFhkSm9I?=
 =?utf-8?B?cms0ZUt5QjUvSHBMNmNhbnVRWG9yR2N2VTdwRitNZXBVQk9hc1JucWdIdTJB?=
 =?utf-8?B?bGFpazJzNEpmcDlSQXpLYUdQUkhFcG9aYXBhcE1xWDduaVg3S1czNU1mRXlZ?=
 =?utf-8?B?ZXVRNnd6T3Uwalh3WVAwTVkyLytXd0hnUElPY2tHbHNJKzVLTkp4bk9QajF1?=
 =?utf-8?B?Y1V5RkovOXcwWHo2VkhGbStTTkR4cGxUbkN3cUZiVGpmZi9aWHhLbVRBQStp?=
 =?utf-8?B?ejlFWXNWdjBoNVRoQjU5UFU0bmFaT3VUb21iSTRSSDBTT2wzU09HWXRIenpp?=
 =?utf-8?B?SFE0NGpMN0wva2M3dUFnczBGZHRKczNXQnFvYSs4Q3R5d1pxQ2JPVTltdlJ2?=
 =?utf-8?Q?e1pSLI95xLKi1QbGBgb0tzGsPuub2fs6IYdRC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 650b0578-90aa-43dc-ebd2-08df20871ea8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:14:41.8074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lbODJTzBMh5IWgKxrvbXFz/tfb6MaxqY5xN5kXOkRF4QFhC4TA/KkUFx9S1PUEwSykk+wBIssS/Q1Pk5cVyFZodr3XO/NnolEusemxOmPrChCnN43RmJ/1eyg4OAfaI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

From: Peng Fan <peng.fan@nxp.com>

Use the __free(kfree) cleanup helper for the temporary buffer allocated
by regmap_name_read_file().

Remove the explicit kfree() calls from the error and success paths.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap-debugfs.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index ec207548a6bb..0a9c27426f15 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -38,10 +38,9 @@ static ssize_t regmap_name_read_file(struct file *file,
 {
 	struct regmap *map = file->private_data;
 	const char *name = "nodev";
+	char *buf __free(kfree) = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	int ret;
-	char *buf;
 
-	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -49,14 +48,10 @@ static ssize_t regmap_name_read_file(struct file *file,
 		name = map->dev->driver->name;
 
 	ret = snprintf(buf, PAGE_SIZE, "%s\n", name);
-	if (ret >= PAGE_SIZE) {
-		kfree(buf);
+	if (ret >= PAGE_SIZE)
 		return ret;
-	}
 
-	ret = simple_read_from_buffer(user_buf, count, ppos, buf, ret);
-	kfree(buf);
-	return ret;
+	return simple_read_from_buffer(user_buf, count, ppos, buf, ret);
 }
 
 static const struct file_operations regmap_name_fops = {

-- 
2.51.0

