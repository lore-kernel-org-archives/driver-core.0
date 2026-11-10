Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794305837;
	b=Oj4iK8V74pcQ2dOC/DfDvCMG9WzsxmzSAWGxKRZIjY3z+MuHjaCn/AeMVxIxfh/hHeiv
	 cz5x7/nxB4NZUo2BPX5wzdhSG/bcpFyzq73qFo8z/DEeBJhTMeLfdhlaVurIMGIUiPKJH
	 hfmoVSngXrVKcuXIQeL1MEBRR9aB+nPGl5qDI6awWKk6pO+1vlLOkblY0/8oAhtdbb3FO
	 aEooFO9hdAKDT9ZzvpIE+MIL/V3jO2SNFq9w9XpxVwLn1BCs8o/fc4vRVafFqj8GwbRdJ
	 wXZQp3sauV7DRo2Pos9n9ZJHVW2ImxjkA4yrWQvOT9fQUCy+jihlkBUmrljSPYYTT+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305837;
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
	bh=R1FBgshJK8MLquiQLUGZJILFFphnD5SRNyBeYs6tNjk=;
	b=BgD27f1NTJgROEC5e/mYiKVxzcPqbYNcwsOirLiFAvw1csnvOJNImQt2sy7yEGze0kLh
	 K7ceihBGBFX9UoVGhETwRQMTbQ5KD24/by1fF9FSVv7PBpPuan5VKgkHyQXxQgGP4YiRN
	 GEHskIaYc+KKU6W3/OM/Ui9pO6ChkVqLwts1N5iRzsoq1EO22hKUsOwigIk3yKyb67/69
	 necqi7rYQ7Kkzn6lQvRQQ9dtb6GtfrqrjPcttw8vS4Df0RgcWB0U+a0GPF4cIyXlwoNmR
	 pXp2j2aUH9Crh7LJFauRRML0f2FW3dMx6UrvPZNwmC/I67gFw98qtantfhMzNZkDYsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GLSmfUUm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.42
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E644606A325
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 10:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E644606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GLSmfUUm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1T67ctFKumzjpzuLVnJKkss0AASoMQOg9NQqWiwwaiVSqmxTxtfS4b6uDJCJ7rv76wVoQi9PDt/8qqhpjgsjOmLQ61Cz3K6YYP5CCJiFH0pAsXhf31912ONAFyT3wW3z18QwxYypFcktw7DrkBJBVu1k6z56X4wH8F+Qhfo1lJqwmPvHU13LEEivBX6ygjTLhPy+X9ALHByRP5bTdubS8mQmAunIqtvz+pAlkUZt+HdMHcblbCvzWnryjKYyhdLlg9LqeQtkqZurjN/77nEK5KjU8r62i9d2IanlalY1JaZas18x2zYNOY+19O9OWoAl/uQROqFT3vEAUcm5FBE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1FBgshJK8MLquiQLUGZJILFFphnD5SRNyBeYs6tNjk=;
 b=wFGGfyEBEA6CJhEcItWB5o1VlgUkpVzEkGDPHGyAvHhyHrry/rOxePmW/7eLp98VZ80Ld/8x6FrnUR8iHklj1aiQWW6ZpC7Ms+ujoNQoJ/MJNYPkpROXbnURC9KYjOwAtW0cmFBgib70iwl3i0aGX5pfqp50mlYPBa0uLwaA9/JyQtUIz1IWYG8zp6hxQxAIdm77a1UNWT5nAKdI2Pk/+fMNWYHD++qzlDDHmlQbhEwBb1LbE7eNa5xrO4ovoo/GiBL/Rt00wa4bytZKAY+iu8OtYpF1gRXPGT/dMJylU69oX2XRggvnOQbnzP4ZHkpaOPRQ/RW5HvrSyf4EMvHkhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1FBgshJK8MLquiQLUGZJILFFphnD5SRNyBeYs6tNjk=;
 b=GLSmfUUmqGg57fkMPG7Oqaagwz9TPL+bqvA6B4ODkPmoGa2SRmn/yMYXRHMM01JZJ7ylgT/UedZ4f9ba8bTcpZhuapFYG/ImZYkrhsyoxDnjAwI9XL7zsu2aap01rQYHxQTnq1/mQMuKCXsvHQjwNoWOA0PGZJa+hLXBEbPbwy3IH8Hdi5we8FgIEjTtKyu+dO5CNYPBrVi75F5GvGPaAPCnqovuOo3tP+M6Yj4D4YItKsoq3RLmd1/EjV4dRh9yrd8UOHeBNmIlqNZVphFiWYAenvmj9npetEj3XQ95H7plB195F2gKn15Cy78rqShckbj1mx4YbMIIZOrvdoVQWg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by AM8PR04MB7443.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:17:13 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 10:17:13 +0000
Date: Tue, 10 Nov 2026 18:22:07 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v1 4/4] regmap: Drop duplicate ret assignment
Message-ID: <avLwT14rAoVO1oJW@shlinux89>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
 <20261110093820.454682-5-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110093820.454682-5-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: SI3PR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:4:297::15) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|AM8PR04MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 575578c9-90f7-4ef8-0fd6-08df3f13c9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|11063799006|4143699003|56012099006|261022105027099003|261028144727099003|261026140227099003|10067099003|7136999003|22082099003|18002099003|11062099010;
X-Microsoft-Antispam-Message-Info:
	8zl2gfS7R8sHkvwZYoiL/KEnk8ks2Ul4a0cozBKYcWlUUe1MteA2WUsAjsGcuEWkJXN4urgXqEw/4oxJ+jb2nnALnHXr7TMr7b+YTVT9Y3DHTQCAiXfjY+B12hMT71CmT8QobhIkGVsrVAu5ZRp3cBlKUqcCggVympLXt8+l5U8c9Rr6NUBJtzyL5qoLLjGIex42lYGzvq5TxoOYTFy+1CDN/QZWWT3mTnaktJTHFmurXv2++7j9ImfjljJmohaE2smko/nTciY0sqISGsOi4QmejT+j23s3O8z/LSGf3okq5rNAFtmVSsez0RVfFTKuOePJ0o1Y5V9GdDR7+ZyHxZlVnSsS+rMVDj4rLNNPBtgxlQbfRq0sBjo3xwN9C2L5alKfoXb3qnFhMqvEuoaGrc9ryPk0DcCKR7QlEe6lz7t2vseqnRW2UIhQiMb9hRP4nilo69nwNQABgk2JPmjppkAXtr6if01JICYNdGzNuUrkB6wNicoCBzwOFpolaQCLvF7TM/P8VcoKZdzUefUpi7P8YCEMo8Me414m5kFM8tFUD/eoToGQRbmbXeuXUcYLzCtHebRf3jxmuFxvdmtByRPSInOijT3pD+RFS8P6Cz3HITNrvED60q7/0CtBPg7AHNj5M8O5mH08h2Ljd8RE8ROtp4xsA+Zwm3VJ9lsqzN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(11063799006)(4143699003)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(10067099003)(7136999003)(22082099003)(18002099003)(11062099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RYL3KGQKxbZqcjUCYciT48k20JYH67n3QMRbgbPSm8LHOkYdRMoR2Xrq1Wjw?=
 =?us-ascii?Q?Fj7+GopeAPLUa+UKjeqRG9I5MKOYIc4qvAbdmU+PhAhvSXAiO9G1cbISixST?=
 =?us-ascii?Q?XXvMFPaxpH6UsfdoPG8VfuSYL+TVU6rW3d1sQKC0ksSWchvrv2s7MZxK683x?=
 =?us-ascii?Q?O4ORySylhth6P4htUAsFM2S2AsufQZOi5qGENdOjY+eLiMUPe6Ts9TkHD2H/?=
 =?us-ascii?Q?jVc0sYdQesYZoewKwKYZPDRU456qO2tbJ+vm/W0S+VA1a1o9Os7HmLHdZGh9?=
 =?us-ascii?Q?MXeUzHHdxx5FfWmv3NcDvHsrE7afLOM64KQiOCrwYKq6UDeM/lyqPMh+zF8g?=
 =?us-ascii?Q?mA+Hhs4dwZEB1XeTE2LGqUbBohtEsASIus+n1DZW6lNnZhHiyhi21FDrnCbh?=
 =?us-ascii?Q?xlQ1rVx6mzRm1X3ZR6IEQDggAfqMV1YrCk559L/coQbS4ZZVgOCBW9X/EXuW?=
 =?us-ascii?Q?k1RjSedp8qXT0dHAldZsz46PtuGoJkeuEU1EcDwf/dHwlUGPBpnKmHS//Fm+?=
 =?us-ascii?Q?P+EzF1D81fkLLEXWC1MNtLn6kYUb5GBfEAIm9ABld8JxakLesgTcl6yca7zU?=
 =?us-ascii?Q?VDy3/rOon+J3/vRR9gOHqNrTG8bjD7X4FBzYNpLfX9nNGx5l+TKjVskpwor/?=
 =?us-ascii?Q?XoQHPjr1ByxmW38b27SIcU2SA7K+yU93zRpzefU8/+nR1rT5Y1zk0OFqG4c1?=
 =?us-ascii?Q?YscgPnWPHc683/nyer5xWBhXYB4nQhyX1bevZbeH/uDjhfiBSTWlkR7LnySn?=
 =?us-ascii?Q?Jb+eyTU28ROMKLm+PTD6zVNPCYVtO35/V9gPQiPl0vVKGCNnLIDBdBU+jCIO?=
 =?us-ascii?Q?cnQr8BkX89YUqHWT6SkNqjf8YR86TPJne/wxB7RFLnVGYoklJUmPe+JtRoAX?=
 =?us-ascii?Q?6Ox/MlHzs94zl+GBwyIQxWRUHAXYj1ErJRYDv7j8TOB816+r20ZCGmG2mgRR?=
 =?us-ascii?Q?9Sl48jFPKND6H8cFAQ+LwwJhBaju01xlqDsQ4mXlixtduhnzkbWNszANaMde?=
 =?us-ascii?Q?TZvedNplwX2cVi5bkm3dFS+1m2RA0TkUVk2FV84aJwnlMsrCbrekQEED7VV6?=
 =?us-ascii?Q?NcWBBvC//n6DqbP4nFWmME6/IucXl/p4QJmqiuyxSBVfuxOILVR8Y24qwjy0?=
 =?us-ascii?Q?7pQ8Uj6OGF9WsQ7bgHdBrH2J8C1yQktZZk0uO64jbXM36zBC3Mx+7iXPbWW+?=
 =?us-ascii?Q?Er9RjG7573mqFvM0awkaRp/ZsmwSdvrRjElHST/2GI1E+H7djAfuQpBIqFwL?=
 =?us-ascii?Q?NoGosYmOuqu2PZMt4r/vwpzQYNcySmKPsL5xBhw8zdVm9euSSILRDpPGs97V?=
 =?us-ascii?Q?coH+e9S4Xu4ThUUUkjmGOgaa5NNZzlUzANIDM7JHSqRxnj9VAjtHGzY/mWTG?=
 =?us-ascii?Q?hCz/4uQktQDG6t2d1QFsIDCh3y3D5NgeG1yrmKLyQvniMrsKcSgXnDpnpfjA?=
 =?us-ascii?Q?7DVdNAdmiD7gig1xl7ZKOvH9dXZ0qzj7Gbxi64IWnroOCvdL/Z2czh41FS2o?=
 =?us-ascii?Q?t9k+j4n7OSMqxXuBcnkupYeQ8c9EJ+56UU1AJJFeoh+1V4xZag/6rKIBDVrj?=
 =?us-ascii?Q?l+NyelcQfISszoqlsn67W9FBlxpLPzMRTuLWKL1x06lA8LQLKBu9sIF7SZJa?=
 =?us-ascii?Q?GNQzRlFhZSPLA8aVAW1PGVLxQ7UNU5ioAzM+lOY1ulbPjGddjEqd9NNLFnuF?=
 =?us-ascii?Q?4QoE7hM07WM7PeqQzoehgrt7rj6cKuYGse+Hu7gAKY+ue6kd/RDjCyJOyqUp?=
 =?us-ascii?Q?8bxmtCJKyQPemzn04c0A3ji4bE+4qH/+xbNr+aNrWov94OsbJUgB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575578c9-90f7-4ef8-0fd6-08df3f13c9b0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:17:13.2049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2gV+8lWxy4AZk9CmvLDinhByIDt5uan7A9F/pNry5uR/ErXZ55qcTgnz0OzaxhrM1dCOcrRZMq5AB3Wpd+EVNCmjagM9sSeW2j3lgwxTcG+v27xA1MW8zZqZrK5Hkml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7443

On Tue, Nov 10, 2026 at 10:37:02AM +0100, Andy Shevchenko wrote:
>In a one case the ret is assigned at the top of a certain function and
>gets reassigned in all cases after that, making the initial assignment
>useless. Drop that assignment.
>
>Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
