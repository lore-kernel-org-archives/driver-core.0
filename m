Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299403;
	b=rpe+vnUEWe67QV/dbUnaBGMwYBmuSexphUpbkN+jjaDmbOh9LEkBbcE/dDhCGMXv3F6j
	 yRhi1OlfzfFafKjj0hMZuke2ek06lh3gaU1ms/pA5tgTLJIwEdVYv0uSKiJglDhAUJ8zf
	 6Etk62knp7Sf8NaUgCZj9tXNQZa3LGbtEOohxw/KzvqV2atwzX9ToQ9MkWGPkQAl/dPhM
	 LAqQlc+VcpSj1Z9curxIIshvGFKFsaA2jQKCB3KxGzJMjRWObgui786iEXu8JrkmGOsh0
	 lihHtYvi4zyBQ+Q/6Rye+7jaJfrTmStFcLnSknGeMlKlXC1misNPauyoJgmWu5VAh/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299403;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=xtEy/9rvbQtIeonjmJCLsn0ll/Gg3WNxJSsuqISZ55c=;
	b=aSq/zwWCocGUBVCgFS/qSmd5G0wP9Ao30OgZzurKFU9h5PH59EUh1qdKgb9eatZxnf4l
	 a0bQJLxApGD+xOaT9Vzkzgxsbj75zcKNVug4daD3Nw9OJ2Ley4XKSbHEdLrATUH7c7YMh
	 aTEFgD8qPtE3uOwNBr0a7uQfZ5mUXksWL+zzI6r2a+Txpd751o4Q2XziLePqJGKOUh5FD
	 ZJDz1XnyIBOlQasiqI2RDaF7edez5ekpc6gcJsZ9CushofGc6yEK9yMmoH7ZkMJL8GVYo
	 55pZEGBr6Jje/jhfDUnXMkCiZq9ym58Npjc9OeFnWLAvMHNHEn+zS+QoPjhPPbThRpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=n+DZ8dqW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.70
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012070.outbound.protection.outlook.com [52.101.66.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2A0606A333
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D2A0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=n+DZ8dqW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPAHRlRjXptrHxWjXrCe/1x0nierLqzLYvRxdhLvfRZDMIY+5QS+4GIaKXJzgvHr+eTTObU1mQpRA6dIRSGONYGOxYJxy4dF3sp6t1cldJU1C8w1nhw9/VcVK4DMIWfgYF78JCRHwdLS3wRrRo8v9sJsid0J67BHxsuGPTztqjPIlXCShrem8ngibBBK725A7kMllAn/AC005bDnZHT13nLHp6xUjJP7BYCZ309aR1OkYUr58hBt4A+kCCGlJ0U5d5SI9lTGCZDev4hg1sRqfTrFzyBrv5mhf9sJBMt06uHxj88T1kkShuwLcB6yB9Tclxjf9q5Gvb29urgsGJyW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtEy/9rvbQtIeonjmJCLsn0ll/Gg3WNxJSsuqISZ55c=;
 b=mmQNiboNtK/2Nv/aWxzG5DTw7dqrc+kLHA+TgvCS3BEDIlcTk+1PxsE+B8yic0EKvQC1GGod78PQ9uLkaDO6slmectAWCpJKLlmSig3oUiW6dBotjXmjzxRuCWxaar9PRUkeTnhkVeZ/KEfr9EToh69LkGrp1+rCwoiaGUq8PE+0mYLX7xKQ0fKcWffX5xM7aOZ4cPraVtqSut04Si9Boi2AD41OREgmrkbX6ihKtZGh9en7lQ65U7Q3nY1zJe2Z6MrMJa4YYlOI+gvdR2hrr6psa9Ag6n7fX7RQVNqAqpkRiAuAxWAi0foOUK0G+QmHfaXKN9m/D1IM9GlQCB2FOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtEy/9rvbQtIeonjmJCLsn0ll/Gg3WNxJSsuqISZ55c=;
 b=n+DZ8dqWS6+cxf8YSKCAMVHihQV5kv/7WIQG4qNb8S1lEEbIT1L1Z90jECbfw/0fKmP6Anr/N7l4pjVEP6bawTNlU1Y/wV4hnzJ1kNYzUfJyaPyD7x848MfYIwEpaIhic1GkjpfPwMLRd1Yyii16Qt+r/ATbbctentl7Ar6EfF1HmQLpjh9FjnrY/g5FIloFOeSQTAcHf12Unb2kBD0K4jzGl4vfbftb+B4CvE6O+3hXOqi1z++ssZIs9cbcOwcaZW31yb8HVZL3j/UR5orz3npd/qteFCFUk9u4KGtNktnFVSTSVk1jA4xOgkfInrPqKDrzt8NApjlP1Z88zzMpjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by AMDPR04MB200793.eurprd04.prod.outlook.com (2603:10a6:20b:749::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 08:29:59 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:32 +0800
Subject: [PATCH 8/9] regmap: use cleanup API in __regmap_init()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-8-3a76b6c10ec6@nxp.com>
References: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
In-Reply-To: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To DBBPR04MB7883.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::23)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|AMDPR04MB200793:EE_
X-MS-Office365-Filtering-Correlation-Id: b88a1e0c-368e-4d57-8da7-08df3f04cea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|5023799004|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261021123027099003|261026121527099003|261102130727099003|261028144727099003|261102123227099003|261009223027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zM6c7h6oXAYe6e/w7NogQ4p95zaiKpPyF/UajYEx1cwsjpTsO1CS1RTS90SGtVGooDgOE5iU7vixddHQPb5fSliXUg0/eWE1hd0Aey83+D6aXVpIW2ZAY8JNorTJYjNKFyIjg74Oz3sRqpT8Kp832GJVzhyTIdgZm6iic5Go4mVW5jZSYdmSq4ZY1LjNJGXb+hUKocG1S9QjQo5GTfuSgMKUnFVGAZvqnByb78qWAHQLNIiVRcdQt1iupkxUvYmVs2nThRMfMfkdeJ7PD+EP/fNBN1d+gD0B5q4FptwX3TqmJBBxdVpciUx32t3FzcNdxxzwxTLRu1iYtSLT3AC+pi625AjKNzzgRw5zTwOk0y2QJqsvBLvk/W9U1z4LHFaQaURh9kQMjDiUiVGqeOfV5ExRHQ76WvPA114bCcSgzaKWOFvOA0iqnI5p3rXlQ1C0vXw7E+hP48tHcWOfR0h5e7tue4I113tz8fhwsT+SfMxDp79o8YQal7DH2Eb0OcBmcKOfPmIMt/blCUVQ2O6uOj3vfuhr315kVwZPmhctWsBkcH1xgFBkXIseGhteLY5LMg1ADHLPqOiZfVCOHGs48z4NHHmAZicBq5Jonj2EJxvKLDF2/vZDCKX5vR68vvqEQ8M7J8ruiBlmUykidKSvqVUfoB61jK5QvEjjxgqyb2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(5023799004)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261021123027099003)(261026121527099003)(261102130727099003)(261028144727099003)(261102123227099003)(261009223027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjU4SjhqWEMzZFJXSytYeW91ajU5emNVZms5S21RV2J4d3hiWTR4ZmFFN21X?=
 =?utf-8?B?V2tRUC9peXA1REtyVzdWUHNQZ3AvazBBUWVIMjFTenpyL0JHRVEzcTQwZjVh?=
 =?utf-8?B?eEMyZElHNDhZRzFNbGpJUTlqWkxUTHRxc0V4bUYxVkZUYUVmSUtrZ0RwOGw4?=
 =?utf-8?B?UmN0T3FUQ2g0Qis4a25wQnNwT0d4SUEyQlhTL2ZiYmV4WjByTUhNYlFTVmU1?=
 =?utf-8?B?c0k2NzJYa3F0WU1VUHo1akduTjFycytxcUhiUVd4aTd4QTQvVHN0Sm5GTzdx?=
 =?utf-8?B?enhvZlR6TjVQeTZvaGhOc1lJMzFTNHE4ZUVEZjBSVDJIc0tnYVhXN1ZkZThJ?=
 =?utf-8?B?SjZGS1RSNEVZR0FrVGNTQk5xRng4eVB5QVkzd29BSWxZdmE4TW8wM3dndEcy?=
 =?utf-8?B?ekNlcTVZVDRYQ1VZaWJGY1Q0c2FjOC9Sa04vQjNSTE53MDRnNy9xTmxySC9P?=
 =?utf-8?B?bjZiTFdQYnZseHU2dXRTdXFiUFRocFNGQXNRenlyR0N1RkVtS0dSMFZ4VEtv?=
 =?utf-8?B?Q2UwNWF0ZEZYaXBhVTRXeW9qeldnZ3dJN0gxeTIxSExGV2JsQUFkR05sUFhG?=
 =?utf-8?B?RC83aHVNYVl3aTBJekhGd01YUHJwOVVVNWxTUm1YVEFKSXlGdGh1ejMxMFFO?=
 =?utf-8?B?LzQrbXNtYmpWT2NpRlhKRlBONExXeEI2L1dzWmJPVWdGcXhSUzJrMVAvMkho?=
 =?utf-8?B?TFIrQlpqSVdQaWZwcGRjUStrQUxEdHVNa0pPYUE3VzU5MWE5QTlCNFZUK1Qr?=
 =?utf-8?B?UmFjTWNmQzNqZDBpOWFSTkkxSUpCNzRralBiMis4RjhIbFJpMDhkYTN4ZDQ4?=
 =?utf-8?B?MHI0WEo2bUlDWXREdUVFUXhFSENJRXJGWmN3bklwVTloZ0FDN0hBMk54SVlS?=
 =?utf-8?B?VlpIZzBlRDVpY2VXZlQ5MXlmUkpDSnVJb3Q4OHJWZ2p2bWdlMWRuYitqTUx2?=
 =?utf-8?B?ak5JWmRqbUs2M2hFMVF4RUVhWnI0NnJCdG8zRGQ1Vm9CZVIydVJWb08zK3RK?=
 =?utf-8?B?NTVvMHN4akRWVW55M05YdkM3THVvOGRnU1FuOU5mYzdUdzBJdFlmMWhKNjFG?=
 =?utf-8?B?OVhyWGprVGR4TUpSUlJTRXpDU2t0RUtXY1FhbTlBL2JBZmxpajFLcHJvKzU3?=
 =?utf-8?B?VklvOVpLV2ZuM3JhQmppZ3hQdForTUQzS2NMTzJPdTRLa2dMU0piWGc3Z01K?=
 =?utf-8?B?clBEZ2x6b2dvWFI0cWFNQ0lCZS9zYTdHS1R4OWhJY0doODJhR25vVUxLMU1Y?=
 =?utf-8?B?am1PTmxhZFFHZ2xLSTJ2WkhhdXNaQlZRclRLQnZoL28wQ2sydTg0RTFrVUlx?=
 =?utf-8?B?akxJbDE2VUcwSHNQZys4aGRGbndsVDR0dkFDSGdSR3pkblE1U0xTOXpMVHFI?=
 =?utf-8?B?WUs0TXNPaWxWN2grdDU2YXJqTmdiS255Ti9zYVRiS3B0L2pzTHkrUXlXenJ0?=
 =?utf-8?B?SGEyYXNaUG50dmJaRnVqZ3RZZXJpS0pmNHhYSDR6MXdPSEd0cStja1YxdThU?=
 =?utf-8?B?ZXBXQlNicERMdmJKS0NENVNzclB5ZXRiS1BpZDdSa0NKWE9JMUlDcUlTSHB2?=
 =?utf-8?B?eU1pdWxQbzVhT21MMHdRQ0xBQ1A2MTUyUXNHZXBjRGdoU3RRUmJMOFUyQmxm?=
 =?utf-8?B?NkRiVjFjQ1pXK2owOW43aWlvTExJTGlsb0hLT1NROU5ROFVxT3l5Y2RUZkpS?=
 =?utf-8?B?S3lLdDFray9KbHp4TGJqZTR3VExMUEkrWlVZcXY3M1E5dUxjMnZYZlNUcFNI?=
 =?utf-8?B?SkQ4TXpWWERXWWFCOGVVRDBmVUNPZzE1cGxRWWxtSkZYVGxRbEVOR2paK1Fi?=
 =?utf-8?B?UWZOd0JxeVR5ZWJtNzNzNEFRa2IvSnprRVJUcHU4b3k2SjRpQzNiTTU5M3ZW?=
 =?utf-8?B?ZGtjTE9ZcklOelo5VHJxeVUxa05HeURDT0l1MG8reGhEcklBbWExTWo3ZDNx?=
 =?utf-8?B?dEplcEc1R3hTSDFEV3lCTzB6V1ZjeXhER2l1cEdoL2IzeWdUdFFTNy9aMFpX?=
 =?utf-8?B?aFphV2NnRlZxVFAwYXFJVisxblZLa1dqZDZaTmpBRU5IaEVzbE5oSVVrYnpn?=
 =?utf-8?B?MUZhL2RTS3lqQTMwemF5S1JndU11dXlOenpHNXR2dVZlZ3UrbUJ3bW5Zdjgw?=
 =?utf-8?B?VS9sK3NqKzBLWFlJcjcrbWJQdzFvMVZISGtacm5UZ3ZuMGNpTGpBV0VTR2VI?=
 =?utf-8?B?U0REdmUxZ0kyK24vZVFKMTEwY2pWM3FSTGFjTHlCMFpRWHU5ZlhUMVFaNHEw?=
 =?utf-8?B?REhuc3lPTGVucjMrTW9RNndlZmN3am1wdkJFQUgvNUE2d0lrR2JzdkhDc0V1?=
 =?utf-8?B?eHkzcXgxM0lIc1o3SDFOUEM3ZjBKaHBEdmoxMzVoTnFrblkvZlMvOFFKK0ZO?=
 =?utf-8?Q?7gcpWQ6HjQ3KrV75Z07U8oKEF+EofDDr+YJ8n?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88a1e0c-368e-4d57-8da7-08df3f04cea1
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:59.1946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAjbUVFBOeWkeDWrz/lOMGoTzHiZZiSLxg0lTO4Arg39QuYhNFCm+verYecWtH83szWuKxfDoL/eek2tbbXp05iqYRNl8Lm7WgbQK87ZVcPViMOG1jinOUb9t74u9Ilh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB200793

From: Peng Fan <peng.fan@nxp.com>

Convert the error unwinding in __regmap_init() to the scope-based
cleanup API and drop all of the err_* labels. A dedicated
regmap_init_release() helper unwinds a partially initialised map in the
same order as the old labels.

The err label only returned ERR_PTR(ret) after the per-device bus
allocation was removed, so the two early failure paths now return
directly as well.

regcache_exit() requires an initialised cache, so map->cache_type is now
set right before regcache_init() instead of during the initial map setup
and reset to REGCACHE_NONE if regcache_init() fails. This makes
regcache_exit() safe to call from the cleanup path at any point. Nothing
between the old and new assignment reads cache_type.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 66 +++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index c5acfe687d9c..fdd538afaae4 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1037,6 +1037,22 @@ static int regmap_init_format(struct regmap *map,
 	return 0;
 }
 
+static void regmap_init_release(struct regmap *map)
+{
+	if (!map)
+		return;
+
+	regcache_exit(map);
+	regmap_range_exit(map);
+	kfree(map->work_buf);
+	if (map->hwlock)
+		hwspin_lock_free(map->hwlock);
+	kfree_const(map->name);
+	kfree(map);
+}
+
+DEFINE_FREE(regmap_init_release, struct regmap *, regmap_init_release(_T));
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -1044,29 +1060,25 @@ struct regmap *__regmap_init(struct device *dev,
 			     struct lock_class_key *lock_key,
 			     const char *lock_name)
 {
-	struct regmap *map;
 	bool fast_io;
 	int ret = -EINVAL;
 
 	if (!config)
-		goto err;
+		return ERR_PTR(-EINVAL);
 
-	map = kzalloc_obj(*map);
-	if (map == NULL) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	struct regmap *map __free(regmap_init_release) = kzalloc_obj(*map);
+	if (map == NULL)
+		return ERR_PTR(-ENOMEM);
 
 	ret = regmap_set_name(map, config);
 	if (ret)
-		goto err_map;
-
+		return ERR_PTR(ret);
 
 	fast_io = (bus && bus->fast_io) || config->fast_io;
 
 	ret = regmap_set_lock(map, config, fast_io, lock_key, lock_name);
 	if (ret)
-		goto err_name;
+		return ERR_PTR(ret);
 
 	/*
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
@@ -1118,7 +1130,6 @@ struct regmap *__regmap_init(struct device *dev,
 	map->writeable_noinc_reg = config->writeable_noinc_reg;
 	map->readable_noinc_reg = config->readable_noinc_reg;
 	map->reg_default_cb = config->reg_default_cb;
-	map->cache_type = config->cache_type;
 
 	spin_lock_init(&map->async_lock);
 	INIT_LIST_HEAD(&map->async_list);
@@ -1147,7 +1158,7 @@ struct regmap *__regmap_init(struct device *dev,
 					 REGMAP_ENDIAN_NATIVE,
 					 REGMAP_ENDIAN_NATIVE);
 		if (ret)
-			goto err_hwlock;
+			return ERR_PTR(ret);
 	} else if (!bus) {
 		map->reg_read  = config->reg_read;
 		map->reg_write = config->reg_write;
@@ -1171,45 +1182,32 @@ struct regmap *__regmap_init(struct device *dev,
 					 regmap_get_reg_endian(bus, config),
 					 regmap_get_val_endian(dev, bus, config));
 		if (ret)
-			goto err_hwlock;
+			return ERR_PTR(ret);
 	}
 
-
 	ret = regmap_init_ranges(map, config);
 	if (ret)
-		goto err_range;
+		return ERR_PTR(ret);
 
 	if (bus && bus->init_limits)
 		bus->init_limits(map, config);
 
+	map->cache_type = config->cache_type;
 	ret = regcache_init(map, config);
-	if (ret != 0)
-		goto err_range;
+	if (ret) {
+		map->cache_type = REGCACHE_NONE;
+		return ERR_PTR(ret);
+	}
 
 	if (dev) {
 		ret = regmap_attach_dev(dev, map, config);
 		if (ret != 0)
-			goto err_regcache;
+			return ERR_PTR(ret);
 	} else {
 		regmap_debugfs_init(map);
 	}
 
-	return map;
-
-err_regcache:
-	regcache_exit(map);
-err_range:
-	regmap_range_exit(map);
-	kfree(map->work_buf);
-err_hwlock:
-	if (map->hwlock)
-		hwspin_lock_free(map->hwlock);
-err_name:
-	kfree_const(map->name);
-err_map:
-	kfree(map);
-err:
-	return ERR_PTR(ret);
+	return_ptr(map);
 }
 EXPORT_SYMBOL_GPL(__regmap_init);
 

-- 
2.51.0

