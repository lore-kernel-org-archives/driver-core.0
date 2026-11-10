Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299376;
	b=SmwlzU57ZK+SDGaG4swRPr36/yqMPuicw160O7NCth7Zprf/Z/fIVUHFbmc6P3ljRSr1
	 oJfCNnrY1VQ2daiSfRvyLxGzdKUXS+8id6U+VX+H3zUjcTAXg+wJg2IaPOTy4Iul5lgTU
	 0YWUuxuJjDl0ybZlFL7me5kBq6IWd8IHJLi/jdRQAL7sUxvu35JDrEYNJ6hqhpHmrQqZl
	 9jceVNp+fpOsgJ4RFBxrsinrR2OJfEIY/lSjqFwT+vrt6MhX1atweGIRmUnH84XKB+M+Y
	 6oyaxUPsGhjkiIDOZPgG2at7+K1jvnkRXC8zorZ/0t3bfyRth2NKvWKEvsQFtC0fiHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299376;
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
	bh=sMM+T5GEhu9fkfAwXt62zQyOIJEcXYyVkwTeWLursjY=;
	b=A4zD0cOi9RMiDfEBD4DwLrhuSoXlwsAMyJMkJccBhtK9AWF1J1aRNRJkbT6Xf3MaLFZ3
	 aVkI4FhZaJCIerY8RXRTgwWsrjFQvT1yeTiaimfJF7NAB7F0EJRkLMt2MRE2dti6mckKO
	 2ZxhD1iDyiisFAW/7NTeiYlB9leFenk92o38jijwAHGIP7M3348011HtnHPuLWd/Qf0a7
	 /ggyEE2zvIcaMNeerw0RDn+7ggM4gLMGxgba34tAOgQ+Zn89Y+83QHya00DqHaJMtPgYk
	 ESigopK0W6KCM1fAr5gysSm4ODC/kN9W2UrcOx4kU0qTW7yKtYVH1foUniz2fEyt4/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nYroIqpW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.44
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013044.outbound.protection.outlook.com [52.101.83.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9D660A262A
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A9D660A262A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=nYroIqpW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/FJGPpC4JO7aTUvKwDlBnv5qj8dbHAw8xmJb2HKuSmVYrKcK7uM6/w7lEj20c2+T/PuVnDGgleVpUcx30DnhgLrnX5ACicvb2iWSclJKSvBZ2TuxQLaZiB0+elRuU1WWCpJhART36bew38rO3qeKBn9+E+vDg9UH5t6mn2R/k80N8YBP714smo6oxewgHclLrPhqSMgK3SWRZXFEkjzP85nMwcgBZ7F8cpvDikWRQRgQht8+guVwEYHOMqsUXim5j4b2YJOb2XTl/xqOg/lmov1Eem6LZ9gm6fvv2JJoJ9y99khFtJuUmJ4d1FBSRGmrBAiq8otrMonGC6dU8utkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMM+T5GEhu9fkfAwXt62zQyOIJEcXYyVkwTeWLursjY=;
 b=zQOZwRnyC0BwzjhWQOdqxRVxkFImjvgnu5eudWtDOecSdB/463tkcCjAGZYbY+7+1FWj+fseYmy3vlmXK0IwdjLeJo+JnScXTDKtCo02MhKjeLgtJCNQsKPlXq7j67Ar7F7QvgXNactyiCNixhb/5jP9N6aocDJ7RNLDE+ITvl4l2trmIRd75YuJ7lqJPoR69JhOKx0NwyuqJ4H7CISADfZ2ccurk8iUvljojYLz8pFh2zCgw2o864jdjjSVj4wBdOGsZdR4J37tnrpJIEZAZmt7MTVxV8FbE0Sg0tZMj6q9do9uJD4lNn7b0zV6QZdK1Tyb+N0iCrV7xBpKt5LKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMM+T5GEhu9fkfAwXt62zQyOIJEcXYyVkwTeWLursjY=;
 b=nYroIqpWTvhnnOK91+DNKreUyfeFPu3Aeth4fUea/lQPQ9+CioB0uLJ2GIjxf1f98n8U+P+VZKF9koiRcnvXL+34egWYWMOLUQKmIHogwr6l/yBI973HZM4ZXN6FhwLZnqhzvAPhfkYNu+Fv3hJyxQSS056VJZZmnHyk5lFKPG+1e71VNFMo25CcIfCj2yTQVtR70g6JqS13LL1++m74JKNZauj8v7mD5fJfEVwTRiVQSf5xjrsyMB3hYw04pYGLoZ/ZOfuQwapE59gZzpRIxkDC1sUYmltIkGW1z/RvbGLRc8AaSqPuQ/3rdN3i8ULNG0n5tcePFgOe8IbFf3M/hQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:32 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 10 Nov 2026 16:25:28 +0800
Subject: [PATCH 4/9] regmap: factor out regmap_set_lock()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-regmap-improve-v1-4-3a76b6c10ec6@nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::11) To DBBPR04MB7883.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: afe7f740-994b-48c1-1b5f-08df3f04bec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|261028144727099003|261009221727099003|11063799006|56012099006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261009220027099003|261026121527099003|261009223327099003|261009221227099003|261102130727099003|261102123227099003|261102124527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5VGOHVe8Jj40hVVfuPg3VtdBP6Ug/IewJ0UGT6cWtrarQoso1jpXjGTCYxxYFPQuXqTKmraCDkEnyy6GCG4hACs9wx0b+iXAV9iox2covohzxLsWHP5VA9D8Qa7EcKnYg97/I2SkVNaIPwto1Vv5NMj/vJS1z6iX9fxCdsW5Pu2yqwrAS1Buty3HhFxt35BWUqJ3CR8NLPSNltZhazP/VgGO4A81fF439Ku7M80uiKHmlqMJos1mhy412bVuz7L4wzqn8joJVT64NEu9/lgQb9BvjunpJc0+30psYBARIAAUiMKuGul+KvZ1HsLgJR5lCoHEPsiAG3PvmuEXOLnPc2ehvgcXBLkvRlAUq/PYjq4gHcCIyWSNrMghXgJdqrE98C/yF0eeWprhIHYE0YH1vE6HkC6TGsGSKpRkAJHnUgNDWfNV/LoHf0WOJJi5kjplL2sVrAZWAZOKU0PsAYJipMGcQOvqKWluM1Jcgx5zuK6h3mxKCM9eUqXK/3PtnDqkvoByTPIsrAAew7OEBN3kcscMIUnRzy3ntf3dUiR+keb/SsrQ9w2oxB7N/JJBykWLjtOi3Nt6uUQ+gvfssmKM9xMApVLS2zFR/MRIuN41RYsoQysWe4cNbQaUZImyJLIgU9qdCPNDQ88eGyVAuUUN70AHVLjAwtt6nr2WUmiCkPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(261028144727099003)(261009221727099003)(11063799006)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261009220027099003)(261026121527099003)(261009223327099003)(261009221227099003)(261102130727099003)(261102123227099003)(261102124527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aC8yVWg4VklyTk00eTFsbU5vODdCUk12d1hIcWlNaFU4NVNIeGJjQWNWOWZO?=
 =?utf-8?B?OXZ1Ri9RUWEzM2VzVGNvMnhhUFBEMVZEVllyZEp5ZFl4U3RQNFE1UjZJc1k0?=
 =?utf-8?B?TC9BZ2lKMDY0aEhsdDZrcm9nd2ZzcXdLQWpaOXF6NE9BYkwvSWpsamlTWEpL?=
 =?utf-8?B?d3BMWjRqWG9PcmZIVjJWZ0JKQit3RDkxeDhCd29lcWNDQWxOTmt6NUp5MEFU?=
 =?utf-8?B?Ky9KdGRRaEZGVnlUQWFvY2FuT3kzT01rSWhxMi9LOWM1SUN5RmJ4d1JXbzIr?=
 =?utf-8?B?RkRtbmtITW0zQXNKS0NObFoxR1pPNXBKNlprb0hIRUI3VzVSK3laSWJzZFVB?=
 =?utf-8?B?WHJFSTNSb1FlOU9vUUlMT1NvUHZPcUVsYWg3VHlvMWllZFpxaUdvUThTV3Nv?=
 =?utf-8?B?MEJqVVdNOE92QkZNTlBvdHh2b1Nqci9Nbm4rTWpwd1hxNzE5VmRiZ2F3cUNZ?=
 =?utf-8?B?dzBSMk9QMElqc2x1d0hoL1FWOWY3bUVGc1ZEcStWWmdDRUk5bFM1U1lnR2ll?=
 =?utf-8?B?S3dCd3pSOGhzV2lMcGhWNzBCTk8zVDV3VlV0VjBZZFY4ZlNOcm90YnZ6ckIr?=
 =?utf-8?B?VVp0QU1LV3NPNExVdGh2bURxcWJNdWQyeC8zQ1FWamYwU0hiR1ZvV0dCYWR6?=
 =?utf-8?B?VlBtU1EzWjF3dmxGa3F3aGw4NXhVd295VXIySFZqQ1QvM1BEdkpva3FQSjBB?=
 =?utf-8?B?WGtuY3JKMkNxTGdGbDd6VlVPeW5lL2lKaUQ0YnI1eG55WjRqcmhHK1NWaDVu?=
 =?utf-8?B?UW0ra1dzQnl2c2tiWWprNHNwRHVTSjB2bFhMUGpuY2lvOVg1cStFMXA2QzZn?=
 =?utf-8?B?blpLdjVwYUlaNmF5QkhjZnVqT1FXWWdCTjlYbW1mNXRiRmQwNmIrL0VxY2tV?=
 =?utf-8?B?NlVON01qaGR3d2ozcU15a1o3c0hLbGZYN09vcGpsdnFHQ1A0NXVrWVRGejhQ?=
 =?utf-8?B?dklRQjR5TjBSVll4c3pRSkt2MGR3UVF1VDM5cm9GR0RlQzFhNG1NQXNmS09Z?=
 =?utf-8?B?c01sWldyRFJTWTkrZkVZSmpML2ZtZ2lrQWFZM3JjNHdXanpYUFhFbTEzeWdy?=
 =?utf-8?B?MFpxNVlvRHlqUHJuUG54bVgvT2xDNi9QNFUzTWI4cS93WU13YVZTMkFRT2Uv?=
 =?utf-8?B?dERyR0Y1RXVCNm8zL3ZIMWN1RnRvL0ZHT0tnWU9GNWpHRjNsTmcvdFFPVGxt?=
 =?utf-8?B?UDdwWEtFRUYxMjg5TkxqNG95bE1PMjNNdnQxc2c0UFhGNnV6N1MrbXJ5bDFv?=
 =?utf-8?B?T1kvNXh3cm9sbG1jZ0s4RHhxeTBzakNjUVJDVVFaQ3lVWFpWWFpHcTF1bTVH?=
 =?utf-8?B?MjA1UHBNNTBlbjEzMEx2SXRuY2doZytqSk9Wc0o3QjBmTHBMNzAxQ2p5a0pG?=
 =?utf-8?B?ZEE4Mm5TakJ1ZkNHbHpuL01vWU5iSkg2L0xSY3VvTS81blhZcml4eTRZODFC?=
 =?utf-8?B?Y1RJamo4K1VDeVloVy9GeHMzdTdJR2pPV2VvbzV1WStFeHVtTE9ld0d1Z21y?=
 =?utf-8?B?K05HcEJsemJDckx2UFBKTkR3REhwZUdMc2t3NFc3UFFGNHo5Z0lRbGdPU1NT?=
 =?utf-8?B?QlBhdzlXR05sTHZoNE02ZkF2ZVl3aXZJcHBTa2lmVVVnTk5KTVpFMTJYSW5E?=
 =?utf-8?B?YVVwazNmSDdyOWk3NGFFZjczYUFudkRKS29iNXAveU1NOFVEL3VwTERDQkMz?=
 =?utf-8?B?OTlVOGRjamRtTkQrcDZUZmhLbHpFOXF3ZS9EbllnNmt5UVdDQkthNU43S09a?=
 =?utf-8?B?WkY4MFVpYW96eHFkczQydkRKcFVTMndTR2s5M0ExcVJBTjhvU1Q5bW1MUVE0?=
 =?utf-8?B?VXcySldqd0VPUGVINk82dUdzSHhOalI3eWI2S3ZTNG1ZQXdkUFR2NEdBTnFE?=
 =?utf-8?B?TGhuUkljY0VISUE2aUZvcjNNNEVvQVpVMUp1aG4zNy9xWVpJKzVZY3ArWkJS?=
 =?utf-8?B?WFU3OThnd3h4ZHRyQ0VDek91dFVjR2tIZ1Jlcm1nWldVVnd6KzRqWkFMcENF?=
 =?utf-8?B?R3UxVUp0WW5DZW11VmdXbHBsVFJ4U1FWV0tJUTBBNDFpQkh3aFRMQUlKZnE5?=
 =?utf-8?B?TGFDa05lMmo4OFVzb3FvVkVSRmZsVWFaZjJkdG1ZR2lnMi9Xb3Z2MWw3ajRy?=
 =?utf-8?B?MG9YQm9XcUNhUC9GdWVVWjFqZFBwNmo0WDRlYXBCMmJCWGN0NldMRkxHblAv?=
 =?utf-8?B?MHRHbFYxL2cvSnh3enVEOHBvamJMbWorWDJKZkxDZG0vZUtiRU9oT0VjTHJn?=
 =?utf-8?B?OWV3S25nbmpwdHM3SWZlUlRITGhHTGpHR2FlVldSZllybzlPdk1WSk83WDE5?=
 =?utf-8?B?Z2NybzYyU3JTYW4wbnlWR0w0bGN2K2t0MGhTZElCOGFCNmZpbkxlUGwyTjA4?=
 =?utf-8?Q?pvOX9+zRWOFnzNnvXfxGmEzcP47FHhtmbr+S0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe7f740-994b-48c1-1b5f-08df3f04bec9
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:32.6674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVMF7cc3WjHVJ49FaFQkUdPhrw60d8uEnaZBGnk0IfrLSNZR+jvaAIH6heRntkyamUJA/uU6fu8sBARNAlDltGNwUvp220Ex5HBJUCgPq801sMfYrg/OQ88f2lSPcX/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

From: Peng Fan <peng.fan@nxp.com>

The locking scheme selection in __regmap_init() is a self contained
~60 line if/else ladder covering six cases: locking disabled, caller
supplied callbacks, hardware spinlock, raw spinlock, spinlock and
mutex. It has no interaction with the rest of the initialisation
sequence beyond the map and config pointers.

Move it into regmap_set_lock(). The only error case, a failed
hwspin_lock_request_specific(), now returns -ENXIO to the caller
instead of jumping to err_name directly, and each branch returns
early rather than falling through the ladder.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regmap.c | 134 +++++++++++++++++++++++++------------------
 1 file changed, 77 insertions(+), 57 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index dff6511ab50e..b079921287c2 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -673,51 +673,33 @@ enum regmap_endian regmap_get_val_endian(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(regmap_get_val_endian);
 
-struct regmap *__regmap_init(struct device *dev,
-			     const struct regmap_bus *bus,
-			     void *bus_context,
-			     const struct regmap_config *config,
-			     struct lock_class_key *lock_key,
-			     const char *lock_name)
+/*
+ * Select the locking scheme for the map. The fast_io argument tells whether
+ * the map has to be usable from atomic context.
+ */
+static int regmap_set_lock(struct regmap *map, const struct regmap_config *config,
+			   bool fast_io, struct lock_class_key *lock_key,
+			   const char *lock_name)
 {
-	struct regmap *map;
-	bool fast_io;
-	int ret = -EINVAL;
-	enum regmap_endian reg_endian, val_endian;
-	int i, j;
-
-	if (!config)
-		goto err;
-
-	map = kzalloc_obj(*map);
-	if (map == NULL) {
-		ret = -ENOMEM;
-		goto err;
-	}
-
-	ret = regmap_set_name(map, config);
-	if (ret)
-		goto err_map;
-
-	ret = -EINVAL; /* Later error paths rely on this */
-
-	fast_io = (bus && bus->fast_io) || config->fast_io;
-
 	if (config->disable_locking) {
 		map->lock = map->unlock = regmap_lock_unlock_none;
 		map->can_sleep = config->can_sleep;
 		regmap_debugfs_disable(map);
-	} else if (config->lock && config->unlock) {
+		return 0;
+	}
+
+	if (config->lock && config->unlock) {
 		map->lock = config->lock;
 		map->unlock = config->unlock;
 		map->lock_arg = config->lock_arg;
 		map->can_sleep = config->can_sleep;
-	} else if (config->use_hwlock) {
+		return 0;
+	}
+
+	if (config->use_hwlock) {
 		map->hwlock = hwspin_lock_request_specific(config->hwlock_id);
-		if (!map->hwlock) {
-			ret = -ENXIO;
-			goto err_name;
-		}
+		if (!map->hwlock)
+			return -ENXIO;
 
 		switch (config->hwlock_mode) {
 		case HWLOCK_IRQSTATE:
@@ -735,33 +717,71 @@ struct regmap *__regmap_init(struct device *dev,
 		}
 
 		map->lock_arg = map;
-	} else {
-		if (fast_io) {
-			if (config->use_raw_spinlock) {
-				raw_spin_lock_init(&map->raw_spinlock);
-				map->lock = regmap_lock_raw_spinlock;
-				map->unlock = regmap_unlock_raw_spinlock;
-				lockdep_set_class_and_name(&map->raw_spinlock,
-							   lock_key, lock_name);
-			} else {
-				spin_lock_init(&map->spinlock);
-				map->lock = regmap_lock_spinlock;
-				map->unlock = regmap_unlock_spinlock;
-				lockdep_set_class_and_name(&map->spinlock,
-							   lock_key, lock_name);
-			}
+		return 0;
+	}
+
+	if (fast_io) {
+		if (config->use_raw_spinlock) {
+			raw_spin_lock_init(&map->raw_spinlock);
+			map->lock = regmap_lock_raw_spinlock;
+			map->unlock = regmap_unlock_raw_spinlock;
+			lockdep_set_class_and_name(&map->raw_spinlock,
+						   lock_key, lock_name);
 		} else {
-			mutex_init(&map->mutex);
-			map->lock = regmap_lock_mutex;
-			map->unlock = regmap_unlock_mutex;
-			map->can_sleep = true;
-			lockdep_set_class_and_name(&map->mutex,
+			spin_lock_init(&map->spinlock);
+			map->lock = regmap_lock_spinlock;
+			map->unlock = regmap_unlock_spinlock;
+			lockdep_set_class_and_name(&map->spinlock,
 						   lock_key, lock_name);
 		}
-		map->lock_arg = map;
-		map->lock_key = lock_key;
+	} else {
+		mutex_init(&map->mutex);
+		map->lock = regmap_lock_mutex;
+		map->unlock = regmap_unlock_mutex;
+		map->can_sleep = true;
+		lockdep_set_class_and_name(&map->mutex, lock_key, lock_name);
 	}
 
+	map->lock_arg = map;
+	map->lock_key = lock_key;
+
+	return 0;
+}
+
+struct regmap *__regmap_init(struct device *dev,
+			     const struct regmap_bus *bus,
+			     void *bus_context,
+			     const struct regmap_config *config,
+			     struct lock_class_key *lock_key,
+			     const char *lock_name)
+{
+	struct regmap *map;
+	bool fast_io;
+	int ret = -EINVAL;
+	enum regmap_endian reg_endian, val_endian;
+	int i, j;
+
+	if (!config)
+		goto err;
+
+	map = kzalloc_obj(*map);
+	if (map == NULL) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	ret = regmap_set_name(map, config);
+	if (ret)
+		goto err_map;
+
+	ret = -EINVAL; /* Later error paths rely on this */
+
+	fast_io = (bus && bus->fast_io) || config->fast_io;
+
+	ret = regmap_set_lock(map, config, fast_io, lock_key, lock_name);
+	if (ret)
+		goto err_name;
+
 	/*
 	 * When we write in fast-paths with regmap_bulk_write() don't allocate
 	 * scratch buffers with sleeping allocations.

-- 
2.51.0

