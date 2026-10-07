Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921B049A3AA
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374896; cv=fail; b=XniWH4cDW19EiJe12xpIfVRtvnxH4cOA8+UiJEKvC0ZyUar//b/DqB7UySK1ZKE0thUTZ6MNu5GBtzod8ty7YdpRWWBDT2xCDUY62Zlz/ttd+CwuHEHLyd5b5n6brG79rhPUIgw4BVpvvebAjnovnBC64TZMuoksKa4/LcRV8V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374896; c=relaxed/simple;
	bh=tnZ3aFt753MSvs+wDfXPtPOOrmnjmwDu+JmJwVedtwQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iJAU6VGmzvykWB1xhCmL6IgAAzVjUzRN3004Mi0leEPDln3IXotIeGrIk0WfWonoxl2U7umCQ4a4T3UliqWVlLEfBZHGC4Fhodyun9UBMclb6TcVRUXvrNaxbPSvZnTwpCK+PV9b7iLKLht2wMzTHbWSeV12BGVZsPU24wHadJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CPz02RoN; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CPz02RoN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNhxOt7J2sEnRE9vP8XaTPfsDVjzwQFa2L2+/jiZpr7VD3Iu7j+j/kwkXHGkuOpZXoGId1kYZXfRmfPydiA2WSEPxkAggBygQGnEAg6ZwaQds5NHvWg4JC7qrvat/eh4MXoqvSMptUFAxw+vha398nuwpP6CXYUDc5WP7LaOM8YF9c4M+epocimEtM6LxbRe5gGF9MGvGaLcbyOzKKcLhZzxubPfL7SgqHyPuQNBL+xEZzYH2uhD2s2bGqCvVwyGLKSv65j7q+ZnS2WqCNsRuECQKOLNrnwE0XLL31EUT8JQXLHXiXh6lGgeWydcB1LH/vO5l2YCeN9gVs8PyFhn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuiyjZRIhwHzDwxh84fKBjXZ/NgalFSonxRhOSK6Uy4=;
 b=w6SgYE4qYlefidZM2kapeDmdkSUtByeioNrjS0qszyc4O1oY2GtcTaaMraYk+0G4TgE5AoPdAgIHAM3A6n9U2cQtN4MrtRtILcfdNYlZ1rAkl7kjhcm6y3f2SMeORV5Rb8B0rks6E6o2TSiqOxoT+qmMa8GXzpdFe8f0n+S1QLgYvUjcT3srEQ3inFpL+RNr37PWJkqF6rEixEpd9EYXkNDnDFEKc8CSIllxPEvLeP0xbFYewCexEE3LqiG6D63bVBHmWMtqtWi9YrOkXe0qzvfDBELGx7KzlGLbyIDzpUcbIG2fTdeWAFBi34hiHyh3fl/xNTJooQzcM77Uqn9Nrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuiyjZRIhwHzDwxh84fKBjXZ/NgalFSonxRhOSK6Uy4=;
 b=CPz02RoNKtmJvX23Z17gEvxTVhJpvK/oZgo4VQQwLa0aH1gxCUsOmdzbowBgHFaw2sieeRB2N2bCqhcHrXHYbi8oCC4R+QoY1Rb3QgmWci9eHnQ8eIHcqQnooR2DWNq9kLxzutwn8JyNxKuVMSblW2eZwwdLw5KB3hJDjLVqG5GV8GwpJNUUVYivrpaKHCwFRquF5nDImB0G7/jiQqM9Lp27Sv+3gIRpf25z9OZ/PGtxVBv29jWOJmLmg164x23QpDQDaTtKwQJXGBs6wtWlKz1Qhw49vn74SKlbMv8XYFafZL1+hOnVsPzFLLSmS0+zajYvWRCj0eSe6pU7yTuXjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:07:26 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:07:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 20:04:02 +0800
Subject: [PATCH v3 6/7] regmap: debugfs: Use __free(kfree) in
 regmap_name_read_file()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-regmap-lock-2nd-v3-6-0e590c4125be@nxp.com>
References: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
In-Reply-To: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d5947f-e49c-49e2-22ef-08df246b8d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hJrxNrgT7pzC9E0XpcwVIoBJmoVq5MTSE0MHTRSq6ZlXaGiOSSfQiq6K3BNFPJ+2d7O6XuGoz82koHmC2VoTAybHcFAzpsoCsGdw0D7mGP40ZLfTh3jjrMg3MMYPuulRv+/bSlexmnrI39/5aMRd/466873dvYVM/qAGLZYlfYFXeokCno1eQMUSEr4vWm4NMPNgwZ3Ngb+u7oRa/9rEDOPEKrnUI+qJGYS0/RPA/NmnF7Fu1IKGe/ny6pi8NdUnaBQEfVAmIiBI1xo+1U60q3m/193LBdF9j/vyRQajo3fqsJEXDthm6dzJqPoQ/NUSVXSs+tm7kEcjoyK9Sj3DXEfaPBPwbYXIBly/U8H9f6ho5QqQCTBrBJfGznCoXsH3lJ6Gbx45hMJOGZ6qKM/IU+c3yWOMic+WfobQIrT0epLMxdxmromLTYB/pQpPe7eJjRelsE+ca+cS+mtz6vUPw4NzeWRkptKHFZCrvAtKwMDT+uEpC+g57bQHZWKAiJcCAuf9YJfv4uejp+4CtdnTxr1N/ZXrK9YsTQsr/qBuCcA5gOUBeYQsh8t6i+LrytvMP7eCMYpA3OCBSkG4bVaR2u8WCBy831eggQhck6Fl+zXbhsmFRWfr0BiZHkTKD/Sc8WNYrmT76+gqVd6J+z3XAgulNHAjnUxcmfwfMPYeV/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmJRYmdPZUxJdVBNNzh5YktVSHFKamdjOG5oMWJsVlNubTB0ZXgxb3YwRWRh?=
 =?utf-8?B?endMa1pCNHVSNjlXRHEwN0RRd2Y4alcrMWs1L2FDaTlJRFNybDN4TjEyRml3?=
 =?utf-8?B?aEprWlJTSzVzRnRZYWV1UHVxTTFrQmVwM2pyQXdzQjkwQ0VCMnIwQ3g5KzBn?=
 =?utf-8?B?dmVFdGhWM0pmMHZTSmxSQm9CWnAwRzJzQ2sva3NkNytJUWZwWktObWllM2VN?=
 =?utf-8?B?WEtONnphR1hoQlExVWtkc3RtSHUwQzNvY0hxRUEwOGE5ZXF1akZiSXZBRzVo?=
 =?utf-8?B?SDVhT0VOa0s4RFRaQXdhSzFmZzhsNnN6SU4wVVp2UEFoMzdPdGkyakMvK1I0?=
 =?utf-8?B?OHVyWEttckpuSlY0R3FwblF1VURKbXlyRUZKaEZISzg2bGxUcmNRQWV5dDM0?=
 =?utf-8?B?eXFzUU5PVmlYOFkrMEpGR2J0eUdjbUs3djdlOUNMRHc3U2hwd05rMTJCMlBY?=
 =?utf-8?B?UUlZNHNTenRmdnhRVjFFRWo1bUdsRUt2TVE0YmQ4SThvaGwyMnVuV09scTds?=
 =?utf-8?B?ekpGdlAxV0JTMUFVN0lCWnBQemhnUFdpakFjQ2cwZ2hTOG4wSVJDQXFkWmRS?=
 =?utf-8?B?MkUxYTNuWW9NNXd1c2ZlRW4wUURrYXNpZ0tsM3dUNXZ1SklrUVkzWmYyMW5X?=
 =?utf-8?B?MlFja3NKcEJ1Vm5uYzVsaUltNTljV1pFVGNUSmZ6RitiRXJibjc5ZE5rREFL?=
 =?utf-8?B?Rk9nMG1VYVgrUGtRSkVTN1ordldhY1R2VGMrb0ZBeGdHMm1iQUZtSkZqTGlI?=
 =?utf-8?B?RVZFZ3hCOENiQ2ppUXEyV1lOQzBod0U5L25vdjRQTmVsQzV2NnJudEdzZDd0?=
 =?utf-8?B?d2lDT3c4QkZGaUZoZzBvQTkyMHJWWHVmancrNkd0d2FORnlhWm8zS0d6bTlY?=
 =?utf-8?B?OWN5MDhGd1Z0TEJNVDNBcE5zcVZIQVVCWVhHbmlpY0RYZjRKUHVEOStoSW12?=
 =?utf-8?B?cWtvYVovNXcxNTdhRWNtbkJsOW84Y0o4bFBaR3FoL3hlUW5FRGZyekNNNVAz?=
 =?utf-8?B?UWd3c0VCODJzSUZEdEJ4VDlOUGgzcmNjR1hoUFB0M205RUUxMmVVeUU1TlM4?=
 =?utf-8?B?eTVSV29GbVFWV1YxZDRzUnJJMGplTDFIUzV2SThCQTk2ejU5ZFNRNzdveW0w?=
 =?utf-8?B?emRWTmxVNVcxT0tITmF4MU82S3FtT1A5a1ptRFFTVW5qc3dDT2Y4N3czdHMx?=
 =?utf-8?B?Yk83cGNwQkhlRDQ2aE5XN0Ryc0JXeEpGaUNVNENNdG80THo0ZTkvMTNrSjJk?=
 =?utf-8?B?U1BMS0cwYUtNWjJtZUx4WnNKUitraUlUM1NuTk1sdWV0eWlzeDhyRWlhKytv?=
 =?utf-8?B?OXR1eldpV1JHQTVEazhlRys3MHZGNTExNVVmamF3WWRmZEFYU2xxcTNkei9G?=
 =?utf-8?B?QnhqU2FpZU9OMVNFQ0RRZThMeGRmOUtCM2x1TkdXZmlZQnVuME5Bc3E0Lzh1?=
 =?utf-8?B?aXZWRVUzOEc4VkFYVFh5bm1oMnBLRFZLQm0wcmowcXFDemZEb0dpQ2kwRERU?=
 =?utf-8?B?aTRrU05CK3R6eC9leVV6eW5IS0Vua0orYWlJek5saFp5UzNOWG1kMzhLdHZS?=
 =?utf-8?B?Z2VSTy9DUC9kWGlsYWkyY0hLTENHVlJVRGRIbEQ2QTI1ZnpZbjFPaU5ZMndC?=
 =?utf-8?B?WWJacDBsTEQyanNBQVkzSzNHUkphTi8yY0c0Tncrem14c29lTFJGUnZMazFO?=
 =?utf-8?B?YUZDUnAxSjhSQmJ0Qzc3QnNEMm56cGpkbTZ0UkYwRm1BdXhYSlRaaUVCcWVV?=
 =?utf-8?B?bStpQVVaZnRudmRoYzdJSnhYcUxyUXNrRTBHN1NsM3JmMVdsNGRRV1dkSlk0?=
 =?utf-8?B?UkRhNWhNNjNPMkF2UmlWUW9GeTQ0MXdQSzdkbC90TDVsM1c3RXBPclBrUVo3?=
 =?utf-8?B?Z0kyOWNrT3pXM3g0MmV3SkJTNUluWmFsVm1RQ3dONmU2V1RldEI5cGI3bmRz?=
 =?utf-8?B?THhuTTl1Ry9pTUFrV3dKNTBvLzhzOEE3MkZRZzkySFZ2dEZkdzVERjJEVTRk?=
 =?utf-8?B?OUQvaittVFkxc3BNbUlreWtmMngrL2VxVnNpRTdFTnZWZkhNWGJ4YzZ6TS9X?=
 =?utf-8?B?RVhmK2ZUTE8vam90WGxTbEtObFQyUmFFQlFtbFBxajBHYk5TMkhRMXFzQ21B?=
 =?utf-8?B?dDY5aDlQUUgwR09RM0ozOGxNMno3dTUvMVlvWnBXbFMvK21JRnViUjlHbkxJ?=
 =?utf-8?B?TXJyZWdMRHp5SlJJWE5uNXI4M2NDZzFHZTRLYkpqQnErUlNHbUpyeG9FYlB1?=
 =?utf-8?B?RGhUMGI2VDRVd0lNZThwRUlZSUNYVjJiYUJPaXJXVzU5RlNXY2pGR1JNL0tp?=
 =?utf-8?B?d2t3QW1jamwxaEhkcjVCMjcvc3ZIZnpuUGN4RVRDMWhOdXNFK3NHZGpJMzFa?=
 =?utf-8?Q?r3Nagu+FNTbx9oKHVF9CGpQttNqzLIcbmcOaX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d5947f-e49c-49e2-22ef-08df246b8d95
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:07:26.7890
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbRiUGI15HM+zfQyDNFs9Nm5T3zduOFKrFoSy6BpNJ6xlOT4M9Bj42+xUe19J5ilCeN3dmYTqdG+8TOBccuVBArM7zFz1nC6j3ZO9SCwfn8aI81uNBY5Yc4pF4TxmwkY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

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

