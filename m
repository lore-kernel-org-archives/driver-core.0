Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299390;
	b=kurxCx++kLdEnVG89Q6vR4wxDJuo12rGLDE9OaZ6JpALzO8ZNdB1zf0yteMJ/MJUL5c9
	 GWmmUQQau7N7S+AfZe8S5z/pQwIboN/wWsVuWoUmDxA5MiHMcz8oUFLYhww/rvTf0Y2oZ
	 s4fM7QC2HdvrHS3g5RPYSmKWKEe1U6lpkOEat13ub+rgkDaHNPnuu7SZtKPervica5Sm5
	 HrTCRvnyYq8lJQNZi7io2xmLGqIaPdIhFpHDYAGgjO76PyPfoOaXjw0ojcWju6xyo5yUW
	 LKk9AzcNeT7jPfddl/DBca7DzokZu+hETL+wStJPYtiNdgnNen9YTdK1H42rPzHOxTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299390;
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
	bh=JMuK+U8PPfvGUEBA3srhP7KUZLvN6AL+8PVRQZQs2ik=;
	b=tBk8U87eACuM5EU8/WDeypPPnIE2qjeGg1Z8G7qZ9t8KmOWvGQcqd1WivORUQaH/6kFM
	 lyFv5aCEFGHNOUa5SJOJ5oYfWQnm1M9vmfBCCxHZl8EzyfbDq3BrR/T5AbsIYE0g8t0cf
	 o9Q7Bl8DYEn3tLNxm1RKxm4zA96MrqDXJnHii8269OUCcQE/WGRXTSObjjY6d7Ab3YbHb
	 hnUgfukyT7r+JCB48PYtNVbbiP9vG84j6vL4QIOiQ8S40ytoj3nKg3GeBfhogVeCU5Zcp
	 6EO3mvAJcNaaWXoF72tnB/TdceoWFy9SJ1UwVFktoNeYeNB141YxXWRTIB6ic9tUeGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=stmShxRG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.51
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013051.outbound.protection.outlook.com [40.107.162.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05194606D023
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05194606D023
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=stmShxRG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wo6gH8+yj6kzH8DhkE5QjT6dR7SYG54dDsY3oxo0OsCDQMbxYOZ3Nkgaz1fullFakbk7xPI5wTGXhwb/biwkEs7t/cbdlgNsnpM2UMxFYomDWNttaPyUkDxlFoYmK2Sj1xo1XDcn6BxYB2l0qh6aAP7/2yAOeXyxEGvNpdDc/jlF8fwcmvkGgWL1cXDGAuKJqn1Apc8EtOZ/zH1sqnKj3fj03EQImQiEHcTaUvZfmzs18RlgDel3buOzBHsLdvNtFPZ34aLT0JEBtDy8ugBro26oOUhkJeyGNFxuSRcZCWPw89fJvySPXj76DLTvKMxCmjg+SIWyX5TJ/paRl7p5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMuK+U8PPfvGUEBA3srhP7KUZLvN6AL+8PVRQZQs2ik=;
 b=JSb/eY0GLzYBayidAmksFVEgEiRxGz4ZeCZNaPAbvjZdY9cdKfMOk3zgM6rG9nQgl4J1S/oXRSsNsdk5cKLbAyyFNW3kAIlwQbsIzSKefkIdlFUsdiBN48P7w1flYovXoBJnYjvSdVNbYE+BUOrq53Mx262v/4SfHkxV0UO4HF5rip8R5uaTCxNoY5ejgo0wGZgZEagjzV424LNW7mKUDadRN3RZ+fDiaY/T8JORWRO4Eg445oLjL8MJ1I4hklHtWwNgtoaIOyvA13KDnPKuYjfWVo7f7xCKmPIMzVo6PN1ki/AycojWrd/pW5sTs6YeU7+gdHHI6frgF5027IjPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JMuK+U8PPfvGUEBA3srhP7KUZLvN6AL+8PVRQZQs2ik=;
 b=stmShxRGK5R1PVuofiF07FEy7SubCm8eu8wvBLBOVSJzphegsj6iIVNYSYzlbOru0S9d1cVwVRtHLpxvKm6J0I8Vk855ym1LUc0OnfASUUO2Dhd1ttWacMJ33JyhOKai1K95z6VhjjoBQAjUYwYvIYFLYdedHcwSr7/SnPFIRe+vNfKai7BlaLNUFd3InJoC5H5g+6UE8oBAIFyXSPRiHZP21aJcrEJlEpy6cQQxGwKlPlsgxzGhlcAZIfTEVT+4e7pyOWH4Whf4D3Y5LR7MjGgG4gjM35b6XLVxmp1NTPDFiIAxRAU37vS7HJauFLZqABMAzEWvl6vmM4zi/EH+nQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:47 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:47 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:30 +0800
Subject: [PATCH 6/9] regmap: factor out format initialisation into helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-6-3a76b6c10ec6@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|FRZPR04MB12430:EE_
X-MS-Office365-Filtering-Correlation-Id: 0573a070-a6c0-4f94-c9ff-08df3f04c7ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|11063799006|56012099006|261021121427099003|261021123027099003|261102123227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	+XTNAoAYHWsncPoMyqYMJHoltGiH4Ff/sp5GNC0KhXE/C4t8Qs+dkqr8mvZOIquJMo4SVu1osJP2HAfxlcKEPzGso5zcb/DIRJxU1cw/rSiUCmEckkxZf7sc6PJEdmUMWz9Z5JM2ZnY1jBKqUbCfaKQH8ADkyWDmrrFhXokMxVlPwzOlMELV6wQriWBCJJ35fn+PBJ3dsnbtrmijIKAu5HhDDN38sGKHT5aAmpMjjzv2OICEqzwhzzF9anPPPOGdpzdBgCJ55rtx8RkkiJF7DkmCbo29eBbvTFUC7pJ7LNCToawNKV6KZgOut4Y4TMvF9zAg9G3ZHttdZ5rs5QUygSM+0WJDjjt+QSpLYML7taMs9pVr+QScniYqiCcAlNyU6TMu2uGMuCQsWYYW/Bnosz2evOBek2TaK2E9EWA57i34vQOr4T7NKK7mG+Um87A8iRpvkR4KXG1tQqBJDw5v4tvRVUxR3nN/VWW0Ue6sZEjqyLlbOhGz4KcatMlQt2JAwuV/Es1ZVBSi5ewO8db7PMuwF+8GK4tyqhynjAhDOvFz/1kaf+5z2543+cQumXthOAaKgIiEBruU5Rj4Xyl4JrF9BPqTEr09GxuA5Ej5Sj0nSOZczpkC/mucFfqfe4zKKkpT6gvA/u4zGFrqayiYkMYKl/mrLUkqQf246FJDk4M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk1scktkQXg3UzlHZERmRThac3JmZ0tTT2VlT1JVWG9OUnlYeENzeXdkRXFz?=
 =?utf-8?B?aWZPbVhEaHpxbVRWM2puNVgxYUVQMUo3ZDI3cE8zZ3NDZWloRzFnR3M1dzZQ?=
 =?utf-8?B?eTd4VjY0N3g5UVZoemVPVHdiNFhLdVBKT2M1elRQTUF1cDVrKzNwY2phQzZY?=
 =?utf-8?B?N2Z4Z1V0OHJSUzV6MjN6Uld0WHhIUEIvQ1UxNXE5WnNuVml2T1pnK3YycXhW?=
 =?utf-8?B?MUlkVDUwckpoZW1Ybm9YT2dIdzR6cGEyKzlqWjRQV3hJNG5ZQ1NpeDhOMWdj?=
 =?utf-8?B?amY5dWVVdk1yVGtMMUc2bTk1UjQwOUdlNThHRkJtNXgva281ZVY5dXh5cmRJ?=
 =?utf-8?B?Q3dSWnNma0hzT1l6L0NjMlBINGRjWlZGNkNiR3lwZUFPcmh4aStiRkVpWnN1?=
 =?utf-8?B?SDNUTXE0UzFodklPeEhqVFE5RGVIa2cyRXJsd2FsOGgzbEMybFhSd3RvamVz?=
 =?utf-8?B?RnJIQ0hWa2NvTk8zdjV0UCtCQm8zM1MwTW1ZY0xLUmhiWm9rRHlPenFjQWF4?=
 =?utf-8?B?TzFTM2lvTUw2bXNpTW1nQVFRVElMVzR3UlB5QmU3ckZ5T1o2bmtEaWVjKzFn?=
 =?utf-8?B?T2VJb0k1VTJyS1hzZGxZMHkzeTg5TjdIYlpYYkhNYXAxSUt5di9nU0xEQmRt?=
 =?utf-8?B?d3MzWDVJUStJcE1Qb2hiTERTQ0NjTVZuSzNZUzlqLzFLd1orQmQwMFdpTmpz?=
 =?utf-8?B?b3BTL2grVDRRUnQvYlNhTDB2ZlNGYk9QRXBVWFFEUTRZU1BYU28rRkNKUm5F?=
 =?utf-8?B?eVpKRzlBZE9MaWo2ZmVqdmNQcXR2WXVQOXNkaVYvZ3BuakFNQzRrVmx6RFhG?=
 =?utf-8?B?enY2RVJDdW9Vc1FyaklqRVc2LzkxZXlTdVBqN1ZBZ3dWQTRYTzVKcWhWU2ZZ?=
 =?utf-8?B?VnpZL0ExYmdLMm4vdFJGN0VQekJTZEpqNEFVby95eDlvT2RCWXFGQzVEMkx0?=
 =?utf-8?B?ckN6RHZEd0ViZnNaSzdLQ082NVo4MDB0SzZEK0xsTnljT2FSR1Q4Z1ByYWdx?=
 =?utf-8?B?bFYybDZXUFJZOHRFMm8xVHlBRUhvYnU1MmhIZmMzMmduT2s5VEkvcS9OcHZ3?=
 =?utf-8?B?REpENUVrZkoyNkpXVVVoVmdBaTVtaWtwN2xHL1d2Q2trUVZWWkdpaWRkTk9M?=
 =?utf-8?B?WmpSRVpWY3F6VjlsZkhxZ0EwTWsvOVZudUJOd0VZT2REUXNTa2tiNEJZVXl4?=
 =?utf-8?B?aWRRMmxBNFh2bkhRMnRwVnpQajZ2Zmk5NmRMY21RSVFmQVBFU3p4ZngzK3hM?=
 =?utf-8?B?WGdBV2RDVmF2YTJ4M2NucG9IRndCZXhSTGdiMEhqbzVkc2FxV1hRK3JrWDIy?=
 =?utf-8?B?ckRKbm5vZ1doUzZ5NmJ5dXhrZnl4WjlONm03WmVjSVQyUmFhd0VjRFI0MTEr?=
 =?utf-8?B?Y0x6UHNPRjFJUXk2TzJmRUhyamtjYmlOZUNnR0FzbWFPYVNnU2JHRk1SdlRa?=
 =?utf-8?B?ZmYxYTgrRlhJOUxINWJqczNoREtZNjF2aWliNGtlK0o5R2o5cGxhRVZPaU9j?=
 =?utf-8?B?WjlUMk1pRTE3RGZzRnRzY0MwQjJJUk0zak1DK1V1czQ4ODRDOGZYR2pmbVRV?=
 =?utf-8?B?clRZbnVvcEJzQjRPOVVaWit4ZDd0WFlqcEFvdWtoVHVEVmptM3ZwOW1JdFhz?=
 =?utf-8?B?bGZiRTF6Z2orUEh0SUpFK292NEM4VExoSDFtOFRvNFcwV2syMGo1R2VUbThz?=
 =?utf-8?B?YTB0Rm5FUWkwaGVJSFB1Yk42Z3duNlozd0NnZzZWU3hXSEhHNUw5aWF4aTkv?=
 =?utf-8?B?NU81MlVqKzJRM2Q5blRWYjRWSG1xRTVkaGEzRkhQakVGcE8vNy9VejM4TXdp?=
 =?utf-8?B?dkVINGcrbVJPN0lBN1BEdU1EZHlKNkZacGFYK1VGVVlxT0dEK0wrdndEYlVj?=
 =?utf-8?B?eEJyUER5dnhzZmdjSjBDNkdUck51ZnIxRVdCUHZWK25PV1Z5bzcrMElQa3Nr?=
 =?utf-8?B?enI2MDNVWVlKS0pXWE5zTGRSc3VHeXNQekpYLzAvVndtOHVoTXpCck1oWHQr?=
 =?utf-8?B?V25Lekc2ZWVkN0tLc3czT1YwVHhDOHFNdVBjWW8wRnhiVXhkRnJTcVR1UTlR?=
 =?utf-8?B?SzV2ZzQxdUFSUS9xSzdOZnZ1S0NEdzg1R2JKQ040Zlo3czVjWFV5cTdVVzBK?=
 =?utf-8?B?ckJnQnU3cis5MHAwUXZBUmc5SmZ1SnVLSXJTTDJsaHBFdHZidzhnbm81VXpx?=
 =?utf-8?B?Yzd5V3pyTFRCaGpEci9ad3crcEFaUHRrelFJTW12Yy95K3Rka1dRQmZlMld3?=
 =?utf-8?B?bnBtZGROUlpQTkpMTGZwUFFqRm1aNG5iRUxrTzF2NURFWVZwaUh6aUJpQlNT?=
 =?utf-8?B?dHFwdDd3VjRYT0lIQ1JiN1puS3pKSjBpVndyVTBkVWc2Qll0ekJFNENWalU1?=
 =?utf-8?Q?BgRkFamJzf74AUO2rRKcjvbRdaul7fTXfRBwO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0573a070-a6c0-4f94-c9ff-08df3f04c7ad
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:47.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hQWZLlWp9hNxkpn+Ev0gwkuMHLizZjUq+6xEe1VnotmwOhqVh7O78+16ebN1hanpY9aEWrurnPiUKjt9xC6L6+ltfqj2nvX39DYKuDHW8bdT2LF1WnRnJ2OKBAs4UMIe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

From: Peng Fan <peng.fan@nxp.com>

Extract the two large nested switch statements that select
format_reg()/format_write() and format_val()/parse_val() into dedicated
regmap_set_reg_format() and regmap_set_val_format() helpers. Wrap the
entire format setup sequence - format selection, endianness cross-check,
work buffer allocation and bus write callback selection - into a single
regmap_init_format() function.

The two callers (config->read/write path with NATIVE endian, and the
bus->read/write path with bus-derived endian) now each call
regmap_init_format() directly, which eliminates the forward
"goto skip_format_initialization" and removes the label entirely.

The implicit "ret = -EINVAL; /* Later error paths rely on this */"
contract is replaced by explicit return codes in each helper.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 398 ++++++++++++++++++++++---------------------
 1 file changed, 200 insertions(+), 198 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index c554079835f5..0a7f73fc1101 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -846,6 +846,197 @@ static int regmap_init_ranges(struct regmap *map, const struct regmap_config *co
 	return 0;
 }
 
+/* Pick format_reg()/format_write() for the register width and endianness. */
+static int regmap_set_reg_format(struct regmap *map, const struct regmap_config *config,
+				 enum regmap_endian reg_endian)
+{
+	switch (config->reg_bits + map->reg_shift) {
+	case 2:
+		if (config->val_bits != 6)
+			return -EINVAL;
+		map->format.format_write = regmap_format_2_6_write;
+		return 0;
+
+	case 4:
+		if (config->val_bits != 12)
+			return -EINVAL;
+		map->format.format_write = regmap_format_4_12_write;
+		return 0;
+
+	case 7:
+		switch (config->val_bits) {
+		case 9:
+			map->format.format_write = regmap_format_7_9_write;
+			return 0;
+		case 17:
+			map->format.format_write = regmap_format_7_17_write;
+			return 0;
+		}
+		return -EINVAL;
+
+	case 10:
+		if (config->val_bits != 14)
+			return -EINVAL;
+		map->format.format_write = regmap_format_10_14_write;
+		return 0;
+
+	case 12:
+		if (config->val_bits != 20)
+			return -EINVAL;
+		map->format.format_write = regmap_format_12_20_write;
+		return 0;
+
+	case 8:
+		map->format.format_reg = regmap_format_8;
+		return 0;
+
+	case 16:
+		switch (reg_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_reg = regmap_format_16_be;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_reg = regmap_format_16_le;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_reg = regmap_format_16_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+
+	case 24:
+		if (reg_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->format.format_reg = regmap_format_24_be;
+		return 0;
+
+	case 32:
+		switch (reg_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_reg = regmap_format_32_be;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_reg = regmap_format_32_le;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_reg = regmap_format_32_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return -EINVAL;
+}
+
+/* Pick format_val()/parse_val() for the value width and endianness. */
+static int regmap_set_val_format(struct regmap *map, const struct regmap_config *config,
+				 enum regmap_endian val_endian)
+{
+	if (val_endian == REGMAP_ENDIAN_NATIVE)
+		map->format.parse_inplace = regmap_parse_inplace_noop;
+
+	switch (config->val_bits) {
+	case 8:
+		map->format.format_val = regmap_format_8;
+		map->format.parse_val = regmap_parse_8;
+		map->format.parse_inplace = regmap_parse_inplace_noop;
+		return 0;
+	case 16:
+		switch (val_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_val = regmap_format_16_be;
+			map->format.parse_val = regmap_parse_16_be;
+			map->format.parse_inplace = regmap_parse_16_be_inplace;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_val = regmap_format_16_le;
+			map->format.parse_val = regmap_parse_16_le;
+			map->format.parse_inplace = regmap_parse_16_le_inplace;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_val = regmap_format_16_native;
+			map->format.parse_val = regmap_parse_16_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	case 24:
+		if (val_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->format.format_val = regmap_format_24_be;
+		map->format.parse_val = regmap_parse_24_be;
+		return 0;
+	case 32:
+		switch (val_endian) {
+		case REGMAP_ENDIAN_BIG:
+			map->format.format_val = regmap_format_32_be;
+			map->format.parse_val = regmap_parse_32_be;
+			map->format.parse_inplace = regmap_parse_32_be_inplace;
+			return 0;
+		case REGMAP_ENDIAN_LITTLE:
+			map->format.format_val = regmap_format_32_le;
+			map->format.parse_val = regmap_parse_32_le;
+			map->format.parse_inplace = regmap_parse_32_le_inplace;
+			return 0;
+		case REGMAP_ENDIAN_NATIVE:
+			map->format.format_val = regmap_format_32_native;
+			map->format.parse_val = regmap_parse_32_native;
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * Set up the format/parse functions, cross-validate endianness,
+ * allocate the work buffer and select the bus write path.
+ */
+static int regmap_init_format(struct regmap *map,
+			      const struct regmap_config *config,
+			      enum regmap_endian reg_endian,
+			      enum regmap_endian val_endian)
+{
+	int ret;
+
+	ret = regmap_set_reg_format(map, config, reg_endian);
+	if (ret)
+		return ret;
+
+	ret = regmap_set_val_format(map, config, val_endian);
+	if (ret)
+		return ret;
+
+	if (map->format.format_write) {
+		if (reg_endian != REGMAP_ENDIAN_BIG ||
+		    val_endian != REGMAP_ENDIAN_BIG)
+			return -EINVAL;
+		map->use_single_write = true;
+	}
+
+	if (!map->format.format_write &&
+	    !(map->format.format_reg && map->format.format_val))
+		return -EINVAL;
+
+	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
+	if (map->work_buf == NULL)
+		return -ENOMEM;
+
+	if (map->format.format_write) {
+		map->defer_caching = false;
+		map->reg_write = _regmap_bus_formatted_write;
+	} else if (map->format.format_val) {
+		map->defer_caching = true;
+		map->reg_write = _regmap_bus_raw_write;
+	}
+
+	return 0;
+}
+
 struct regmap *__regmap_init(struct device *dev,
 			     const struct regmap_bus *bus,
 			     void *bus_context,
@@ -856,7 +1047,6 @@ struct regmap *__regmap_init(struct device *dev,
 	struct regmap *map;
 	bool fast_io;
 	int ret = -EINVAL;
-	enum regmap_endian reg_endian, val_endian;
 
 	if (!config)
 		goto err;
@@ -871,7 +1061,6 @@ struct regmap *__regmap_init(struct device *dev,
 	if (ret)
 		goto err_map;
 
-	ret = -EINVAL; /* Later error paths rely on this */
 
 	fast_io = (bus && bus->fast_io) || config->fast_io;
 
@@ -954,22 +1143,23 @@ struct regmap *__regmap_init(struct device *dev,
 		map->read = config->read;
 		map->write = config->write;
 
-		reg_endian = REGMAP_ENDIAN_NATIVE;
-		val_endian = REGMAP_ENDIAN_NATIVE;
+		ret = regmap_init_format(map, config,
+					 REGMAP_ENDIAN_NATIVE,
+					 REGMAP_ENDIAN_NATIVE);
+		if (ret)
+			goto err_hwlock;
 	} else if (!bus) {
 		map->reg_read  = config->reg_read;
 		map->reg_write = config->reg_write;
 		map->reg_update_bits = config->reg_update_bits;
 
 		map->defer_caching = false;
-		goto skip_format_initialization;
 	} else if (!bus->read || !bus->write) {
 		map->reg_read = _regmap_bus_reg_read;
 		map->reg_write = _regmap_bus_reg_write;
 		map->reg_update_bits = bus->reg_update_bits;
 
 		map->defer_caching = false;
-		goto skip_format_initialization;
 	} else {
 		map->reg_read  = _regmap_bus_read;
 		map->reg_update_bits = bus->reg_update_bits;
@@ -977,201 +1167,13 @@ struct regmap *__regmap_init(struct device *dev,
 		map->read = bus->read;
 		map->write = bus->write;
 
-		reg_endian = regmap_get_reg_endian(bus, config);
-		val_endian = regmap_get_val_endian(dev, bus, config);
-	}
-
-	switch (config->reg_bits + map->reg_shift) {
-	case 2:
-		switch (config->val_bits) {
-		case 6:
-			map->format.format_write = regmap_format_2_6_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 4:
-		switch (config->val_bits) {
-		case 12:
-			map->format.format_write = regmap_format_4_12_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 7:
-		switch (config->val_bits) {
-		case 9:
-			map->format.format_write = regmap_format_7_9_write;
-			break;
-		case 17:
-			map->format.format_write = regmap_format_7_17_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 10:
-		switch (config->val_bits) {
-		case 14:
-			map->format.format_write = regmap_format_10_14_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 12:
-		switch (config->val_bits) {
-		case 20:
-			map->format.format_write = regmap_format_12_20_write;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 8:
-		map->format.format_reg = regmap_format_8;
-		break;
-
-	case 16:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_16_be;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_reg = regmap_format_16_le;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_reg = regmap_format_16_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 24:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_24_be;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	case 32:
-		switch (reg_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_reg = regmap_format_32_be;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_reg = regmap_format_32_le;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_reg = regmap_format_32_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-
-	default:
-		goto err_hwlock;
-	}
-
-	if (val_endian == REGMAP_ENDIAN_NATIVE)
-		map->format.parse_inplace = regmap_parse_inplace_noop;
-
-	switch (config->val_bits) {
-	case 8:
-		map->format.format_val = regmap_format_8;
-		map->format.parse_val = regmap_parse_8;
-		map->format.parse_inplace = regmap_parse_inplace_noop;
-		break;
-	case 16:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_16_be;
-			map->format.parse_val = regmap_parse_16_be;
-			map->format.parse_inplace = regmap_parse_16_be_inplace;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_val = regmap_format_16_le;
-			map->format.parse_val = regmap_parse_16_le;
-			map->format.parse_inplace = regmap_parse_16_le_inplace;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_val = regmap_format_16_native;
-			map->format.parse_val = regmap_parse_16_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	case 24:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_24_be;
-			map->format.parse_val = regmap_parse_24_be;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	case 32:
-		switch (val_endian) {
-		case REGMAP_ENDIAN_BIG:
-			map->format.format_val = regmap_format_32_be;
-			map->format.parse_val = regmap_parse_32_be;
-			map->format.parse_inplace = regmap_parse_32_be_inplace;
-			break;
-		case REGMAP_ENDIAN_LITTLE:
-			map->format.format_val = regmap_format_32_le;
-			map->format.parse_val = regmap_parse_32_le;
-			map->format.parse_inplace = regmap_parse_32_le_inplace;
-			break;
-		case REGMAP_ENDIAN_NATIVE:
-			map->format.format_val = regmap_format_32_native;
-			map->format.parse_val = regmap_parse_32_native;
-			break;
-		default:
-			goto err_hwlock;
-		}
-		break;
-	}
-
-	if (map->format.format_write) {
-		if ((reg_endian != REGMAP_ENDIAN_BIG) ||
-		    (val_endian != REGMAP_ENDIAN_BIG))
+		ret = regmap_init_format(map, config,
+					 regmap_get_reg_endian(bus, config),
+					 regmap_get_val_endian(dev, bus, config));
+		if (ret)
 			goto err_hwlock;
-		map->use_single_write = true;
-	}
-
-	if (!map->format.format_write &&
-	    !(map->format.format_reg && map->format.format_val))
-		goto err_hwlock;
-
-	map->work_buf = kzalloc(map->format.buf_size, GFP_KERNEL);
-	if (map->work_buf == NULL) {
-		ret = -ENOMEM;
-		goto err_hwlock;
-	}
-
-	if (map->format.format_write) {
-		map->defer_caching = false;
-		map->reg_write = _regmap_bus_formatted_write;
-	} else if (map->format.format_val) {
-		map->defer_caching = true;
-		map->reg_write = _regmap_bus_raw_write;
 	}
 
-skip_format_initialization:
 
 	ret = regmap_init_ranges(map, config);
 	if (ret)

-- 
2.51.0

