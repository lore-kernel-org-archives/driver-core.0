Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305729;
	b=WJtoPgt6dOUimTYuHT1lPLc7+rsLx5RdK9M98DEAoH4HxZCVYj0YReiflDTl3T1uAJN2
	 4t97EkuiFv2MdkiQMM+LUGKuGrRsgzDLcjk5JiCM6ZE3o67x2ai83oIbKA53VIC28/OD6
	 3DBQbgXMxTVJ5DY82Z9QF7NCLjF6E14j0omjfAqU7aQhdZ9593nLf1aZsNxE3xINCvIIn
	 oy4t0J0GStjWngE9+THC2+/QCAli2UdLli+N7g4gS9S26fxRKpBcYr4G7Dg6aA7d3z5Ei
	 Amu88RlaMlEl7OqugyCq3FZH24vo8hSw4JpWS91vc0N13xx0HBXMnYW48KRQgEF0xxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305729;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cOTm3X8M/+Qyb4IQ4z61wg10cEVAQDZww2C6jwKUOmw=;
	b=Dqk0dbX7tfz1nn6wmIRBrUfTH3VqSmFJGz9ex5Jt6LPkIRB1B2IT/ccsjbVZ0ULMRBSW
	 fC9zjV8m1RkRkKXpYe38B4F8IWKowyEu0jh0aM08hEtCloP5xewJXLami4ug4o3ca3hZ6
	 aiQFdf3/yAvU++FZ8hFeL3Pgf8iLa1jCcDUgcD6W7i4UFQGx3hQOxRncMZ/5CgkBtftbe
	 CtJHna0zV0gqUx0aTDIC/uM5bnNNIVh9csagP2jH4bi2ailc09m84+4rs9ZTca/pYWeRw
	 XkEUnunq4x2eHmLEGpsCg5MZaLUJqCdWYkkcHbVwWEaxqtPZjjGSdNJIF0g880ETDXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mWunchVu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.28
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA7F606A321
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 10:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FA7F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mWunchVu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8lE73YLTzA6N6oVoeU3rnlGlCXeOfOKdFNFCsKAUCJx8MSY38n4d9fco+JwpAFuOqjv5uAL/u1+S+fiUn1S7eJEsmXng0eRgJFEBojIRchHmhDCAvGbh9/h8O6asuB+N6Cl0ehgjTufgsmSyZ/UPPWXC+D0m2hD5D71jGS/ZsWK0hsqnnS+pRVPvg9j4Wy2thu6HldB8UVqfjQKPHk3e7QBmG5eaKCaS9qh1Lx5hNsj4/kuhZWXHNfkc5cr56R+iC8Y2NFGJrf2d3oEFTm1VSPPbUYvG9jB//U7PNm2/BG9P6nFp/8BNvruY3w6R9+wC1IzjEv5akRLsbq9gR0bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cOTm3X8M/+Qyb4IQ4z61wg10cEVAQDZww2C6jwKUOmw=;
 b=y+jEgla8hEVkKFYkp5Lkt173ahGrTm5kgZIh/R5VlCPOxzX4slbbuwyLpgALAbS+1kT9e6h674UcDl2myWzrg9lUq+4+sUmsDeZBxMPPk1o30XqKNFVHUBAmz+ABcqWJumT6MSepbaNlM7COkuQwCn+fiIed+/hlnE4slg6oTYDKbYi7JIqmBygNYD43tiFAau9WJoOm2xUvV9wVQexufOg2mWZR3/T/QN4Y6WYMuKDXGfu+t7V/yWUVHhVOqbDdoSPTi1i7svUDKuDBtcQ2ioFIPBk99FGUBDeTsUTK9WNvazspCvev9lM3hUfMwOXfceZQNLcBEjsejK/Jm/RMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cOTm3X8M/+Qyb4IQ4z61wg10cEVAQDZww2C6jwKUOmw=;
 b=mWunchVuBJ185ew2OVHQzYNYO+czTEgUkM33OBvTGlRDUSpL7c1eA+H7nMH/D4TFzt1qf90Imgr0qVfyS/9Zo4rFWTMscymlDYOPpQDmJJwfQTO4XC41AEhwkrqsy4txNaZRXRRPsWiACFhMTRWoH5a5lsePjGvSXHOogaXwRZvFFIRvBpIhtTmpuK8pUjsMhoqWDkA50KIGyk7Ti+s9XZWXB6RKKRJ3u/mMhQMwu8ncL5dxD8VScmQ5c/TKpZ1dIQpbMr7IeneH1h5yK6qF3qgJPOzeFOWBtmJu56gg0zsjErq/O2awfCxOEehdlZSx7yAjWJbwnYqT+oNXXI6XeA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by CPHPR04MB612808.eurprd04.prod.outlook.com (2603:10a6:380:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:15:26 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 10:15:26 +0000
Date: Tue, 10 Nov 2026 18:20:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v1 3/4] regmap: Defer assignments to the later in some
 cases
Message-ID: <avLv4/1OulkY9FkR@shlinux89>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
 <20261110093820.454682-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110093820.454682-4-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|CPHPR04MB612808:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa8bdca-a91c-411a-700c-08df3f1389d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261022105027099003|261021121427099003|261026140227099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	893D0CjHtaw2gjFaHy2msj87YEzOy3VsgRjBL9rufYprDFD+g1zrH9ETJT7f3eRpGriAmNJ8j+2WlFxM+0lc/BAZ1jKoPpcNsR39Rm6rVerTmqvuH4jrZ3CNcYUbz910Rgx3ibUJvaVPzdz7ed1+dSWehJ470bp6mMRopFAUxr6FMOdq/wYS9fMZ2lisfQAnISmtdADgwK6NkqGoOpKOjeD4Ld6M9VT+69Si6Vi391g2+57nCmB4uJphU1NOvwxIAssdtxZeCNyGj5i4Sm3Kak8Y+v/dTcYcnahtRvF6+CELcx9/lpAoM+vGtEmhHRd79hYxYdO4Gfx9EhTJCDhN6Eaw3Sk57l4rIWbS6117CjJKmEyYia2KVQnzpf+7P9NaCmLX/zxgtxwGvEhQpWDMIJ+/GnsADsSFnoYi0iYiLXx7br2nWA4jSetN1eaa8THUSLCYlJ4e0tovudyXualyDpAgJlJezjBY0H/e3qPlC/CD3pTt5s6o6kViUGeY+O3Xd9KpZb/dqN7PSoQ1v/OgwHyW8xMpoTS5TvhInwHocMaepsGtoUkdExDUpNJhRw8AJD6Ec3UifhnRBfhOrv8h39YO3vN2mHTEyLL25z2Lu0OWXBTvnHmFmrxKgLeusKYamfQg/Qw8vGh0Nu/6nbPUThN9HsqNnKd5MwWuIFcqSoM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFlvlKOr9xY0J1WCq3TV/ZzOxfviRIl97QHdg4aHBoxUb5ugvdEFyvAVg+/1?=
 =?us-ascii?Q?bu6K3r96f3jblm45s0uIe3SyTmfqnu6jD5MOyESViisDK6wbW+YmD2uvjWUR?=
 =?us-ascii?Q?TNDQHe/VcqRgSaph6i+b81VmMMW/bkfwY3VKvvi2qLHqe3DcC801dr+hz9mV?=
 =?us-ascii?Q?Nh5XPv1NmUOpGdLw/LSBMIcatmbcT/LuMVwaLWr/Aj8OEVX5xyXeC0Y6GWMI?=
 =?us-ascii?Q?Puk4mSeERxdvA6VLkNwCrIA8H3aM6Hj5ZeROfRfOJe9c7Fiyr4kcjRemtP6a?=
 =?us-ascii?Q?hdq2CQphNFOcU1b2m7f1ClTgWJiSiF7gianvC7QAyLvC0zwf4xTlj7FqNq9U?=
 =?us-ascii?Q?wa1ETBSrPfHfsxaCvX/GxN9DTc3/Q1DRILt9kjBpozqmlCEHkJQZ/K9uSkur?=
 =?us-ascii?Q?RPbx6JS7sjZ3sIYdhAu0X8oegcF4KOX9AVDLQ7gigSdDdEMFVOqjTWUD/aR2?=
 =?us-ascii?Q?tMnQCdQKJBRvbokGBPi/6yOybGsQq/isAd9NwKCu0Ry2NRDHSwVWHNzVSFIg?=
 =?us-ascii?Q?TrdlPAr0dK7LJA8Wd5ooMZkF3au0BHd2oAVc6GNX9ABFFV0Ozd4RTnBjTsSD?=
 =?us-ascii?Q?QkhaxmveT48Gv7gDXnWHkeXdPcD+cCCgC8KcprEFOtUz2pLCVx+4Fn6iaV0Z?=
 =?us-ascii?Q?LRQVQXqugdMhVRieAc4XuKLQJqxwZYTo+zFwes2d1UmfzA+XnHYxIB5Ri+l3?=
 =?us-ascii?Q?ivfWiqSbCF+OKjE1OtVCiz8LJG3rDGT+XAOZXKJ06WMTc7Uzq+9QDcqEFC3D?=
 =?us-ascii?Q?+OHnXVAUkr5AFBjYhCemIQkGOcj+7bOdC3T7uEkg+Rj7vAKRSkDgFb5crAUk?=
 =?us-ascii?Q?ZbuEl+JDGGYZI5n3chTtu8GRLptz3vk0cWtrywr7Igb+PqYF1z0f0Zfjo2q5?=
 =?us-ascii?Q?JfZPP1EgbXhzvY1enzE5mvT/5hXl5XLGUeb0g2gstRdPbGi4l5kw42k46psp?=
 =?us-ascii?Q?uybOzfxyYDKETT3HA3eppoUgxR2uEEY75BbBN6Bo9iFldhncoWcjZAgIrsP4?=
 =?us-ascii?Q?OjMmguwMa6xiVCRcE+9zHOC/qkwGujPWK7g2u0teXaiJGfNLesPFudOgfOjF?=
 =?us-ascii?Q?dYrmnrf97rF0UPrW+HOa3FAJNNbo+X+48H6s586Xpn5vf+pUCTQ75CIR6HhR?=
 =?us-ascii?Q?zqdDRr81OyhAGF63KLiEViR5a0peXxkHSwBlD3qPcuVtOeV6WlJfy5LwASCt?=
 =?us-ascii?Q?4DMcRyn6tS+J0e+UjZiaToevJp0TeduGYsAO+zHSq0cUkS3aUJN13w8uwtuO?=
 =?us-ascii?Q?L8fsJg1zBCMPaVHIz12RUeaomtF5S2RXj4B9cDCORG9jW1Iv8gUmYR/uxijf?=
 =?us-ascii?Q?DEgJ3UAiNf3AmEG+JOwUUgYKWVDkfnM1in3x2ABU/F5wDs//QbpoZFuY573D?=
 =?us-ascii?Q?P0a3BOTsO/qATV3FfcXXS56PNq6vB8urScAIB+ynewtaEP0ARVYq7UjJjoLs?=
 =?us-ascii?Q?5oCXUHjxnC1uG0irPOWeDG2L0h1JhHU0yu0swdORQvKJEntpLLIkbIFrYy4y?=
 =?us-ascii?Q?Hxd/GxkxKJFuaRn6/wLIGx92EtxUJCRSMPWxZHzXMVN3L6Z+R0QRxbqZp3lQ?=
 =?us-ascii?Q?uaWBj6maY4WjzmWTmCBkQh4tg1C/eFv1a1cFVwal5K+PNqTzhgu1qQs9yFnx?=
 =?us-ascii?Q?STo6fOfNVB3kb4SzQi/i1hF9SQHcUpiEEFN5ODM9DqTTgNsj759lwJL0d7F6?=
 =?us-ascii?Q?P++i3lKMdT4TNtRApKhm3K1ty9ScLD/C/OyrM4TcsLHHSXBF3Q1gQeR5UA25?=
 =?us-ascii?Q?frA/fvx2IP5HhBlIBlzizDHZb11uGMGnAueR8TZxFh4ceh8GVAoC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa8bdca-a91c-411a-700c-08df3f1389d3
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:15:26.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e/yAHXtCFuXz5DpORBJ2dZva1L2EZJOzIw3rzLFGO0dLndSoLTV8wPFQ+NzuSkHSk4fvIUPwWchxEvn/Emo8Z39UOHA+h+5vsP//VbANHAuM77c8oUSP2oYS2s5+1LpE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPHPR04MB612808

On Tue, Nov 10, 2026 at 10:37:01AM +0100, Andy Shevchenko wrote:
>In some cases the assignments at the top of the certain functions
>belong to smaller subset of the functionality and may be located
>too far from their actual users. Defer them to the later.
>
>This makes code robust against potential changes that may lead to
>the corruption of the respected values.
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
