Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1925448095B;
	Tue, 21 Jul 2026 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629714; cv=fail; b=Kppqk9tMz2GIi63F7Elu4ZtDJkzS9kQBlgrxgOXoOczK79iLkqBdvDZq1vdTi7rJoSeo3zEm0UNgpi4+wftFVaFhwIF/D/dkWcT9FtA8uVnPh6trNXlkTfIMikPgLIRlwEt8mo3iOtXPQtQ2S04+a97lUYgNjGLzZul9RJWcY2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629714; c=relaxed/simple;
	bh=wIPH0xTR/PiXx2kBQdRUwP5WJqazfqz7WxMCNc0pIcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MKW2xNTe+ax+KepbH2oRwLZPyEwddJX5sQkP3Fmz2aRa4dPDxuz4V0plgwv+stjGlZ1W5uAp2dG0J12hu5F7TC3/UcK9VdTuf0aIhd3jeb3HzB8OkJrW/x02MsKPHQ+A5HostrWDXxXhiPETFrb/QcLHtk6iZFrbgNSScWuoJwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dDmBTVHT; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dDmBTVHT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWAojXS7jc6WX1lkmrObFqJVN6eENN0W+Uv3/0sEn58KrKfLHPL/sjTw3wYXD51Cmj0xK34zpxAvpWSIEVkIbfB57Fx5Ih7OkFNGGZSZpjd4lZyw0Ea8RygOVzve7mPeCmTn9yCkv14PhY3N22wO2qGkt1wNHooJVhtgJnOl3LGejPt8tCSBRT8pyM4cJ062Oj1PJ8zla7Srgx32cDy+bQswxYSTm/h8TdFrB9El5BrjGpTl/rG3lLgRt2wC3msMzo/xRi11mKbVlWvHfJC78h3MAQia2b+/BwtgiE3HKVaafY1CGoCsBao6dNcINi9TeMlwz1vUUYvof4cvH5Aefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rbAG9vuHnMT5tC/vJU9WDZdehGnWGr440xrysdrAG0=;
 b=SVxE5GFQy5kmH2AstDtSerLDnirTuMJNsoG672D6m4/5QGE8Hz0Q59795siap0bKYnkJU2Cia5/cIvYnt/UBlzZAr2hyifBmwATK+xBV0FV7d9wd4gl3V/EQcM7d6Y8SUpUmHdsudSGShzGwMRbVIZ7RF6evvBFuGEPSWE7O/7sbzFgRL0fNAD9uokla/PjsSWzYuZgFJ1o+lDSQg/U423QdeIZ75842DkI4F9uJC9yItkG/KchykjOWlCk/wjenliJErUGbBwUZaz272FYh+hTD9XfRNCLWo2TkfsHcCiG91HqdnvPHZMzf+vH5Gqbpic08sOgVIvfBMSxfE4d7fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rbAG9vuHnMT5tC/vJU9WDZdehGnWGr440xrysdrAG0=;
 b=dDmBTVHT2qHWV2XGTm+0WH7ewOdP5ANpx9psSt+AOqSXX0JfMOq5Icfiq/bJdayhx40fciozGE8J3WVTjUh+iXyoJ1E0MV67JqPVDGhBh2qfTNvHByLrewL4Zu6mbm4yhGBm1GbfT93twouoqCgIMUuSyz4E4jthI2Zj0UH+rJVqf1cuNTERE3eurCgNScWetRmKVpw5C25aGno8id2uvIAOfWF0r3T2LKtIoKbSc2x7dYdAzh6N7Q/AfRvbkNff+Nu5xFnIl3zB7q6LZ1XJ5JjkAjyRH4ouR+rnI4+K+fgGsk96fiVNmiGY/KMcxzQfBsvGxPnqUtJjXH0Yomr9AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM9PR04MB8572.eurprd04.prod.outlook.com (2603:10a6:20b:437::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 10:28:29 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:28:29 +0000
Date: Tue, 21 Jul 2026 18:27:02 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	robh@kernel.org, saravanak@kernel.org, bartosz.golaszewski@oss.qualcomm.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/2] device property: add test cases for
 fwnode_for_each_child_node()
Message-ID: <d4xb7jok2qczhl4f4srlpyppaabndhps26hkludgd4aco44m5b@vakdv5rp2zpa>
References: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
 <20260720104730.1285552-2-xu.yang_2@oss.nxp.com>
 <al4Ep9smi8lmgCzF@ashevche-desk.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4Ep9smi8lmgCzF@ashevche-desk.local>
X-ClientProxiedBy: AS4P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::11) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM9PR04MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b7c7b8-a532-4219-6cc1-08dee712ce9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	bwCrQIt20/vy8X++E5m8NuABcZgS/SSz9uEWdKg7QDKHujAngwpZkTRzamXx25U2zXTwUZF9ve94izt4n/L/Vdmh/s+j/G9YzxC7bh49xfKU5sAv2Du0JZCANQf3U40AB0kKSwyLKJoe/LHjFXQ8r/x0gJeiyRYa1M+rVchlCWeRfHm4GHZurdSgbsRvEZ2qfWQHCAMoYDVqZ+KhpDbK1TC8fAs8rwi8yNLPDOhw2ysVtrEgGvn4ft3VLg+xwMgLK5dRHCIy+KcZMP1EfT2GXWZH1F+03whG9IC9NwFvZIxU5u8UzP7S4FLfH8wpdRdzSg2O3fngnkCGdDf8uZyhvG9J/d0k05gUPHb41v3+k1qRWGxSIbkdpKefY0B6r41mAjaMT9ok0jZU7Jal1opsUj0ruRS5LshoaO+m+kzpezUMmTMDwk0/bvwftp/Ya5o5Nf/6GisEWOZbP4Y0yJlN+3n0PEsCLvlK/4V9mXQVetLufawBQdVRcvjIWUdFqFYDkGdZuR9Iyk19vwz7ZibHRr230HP6Q98o+jP62KKfk4jJQJn3IxMoPguUZKETPp9V0gUWaYNOPJ2wQgoS32yJicvqMI+cIWssDtxnLq/nurKojs1HydmQc9V2PSCyC+DoSIpqxs9uoOnDTD9rfFfWDJTKVQzjBWbboCqDTX38/6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HKtkqrLmaEFZk8C8YpraPQ+s9EZNtYwVJVHDHT27rSIAMGJZ7lT2ef0olHT5?=
 =?us-ascii?Q?6xfWtd7KT08b5pLmgRq/zpG3fU1XgS8fzFglNGc8srZoWN0JiCXkU5sBE/+V?=
 =?us-ascii?Q?MRb6dM0ewO5vnQKYIgWBSfRXu8LFSdMlsMLQZ/oXCRsEBFIE061mxmKnJqdW?=
 =?us-ascii?Q?SSWke1X9H77b1rRe6fTWKiZCLubAlxaWuotBVspfhkB2TSPs6WofKQnxRLgQ?=
 =?us-ascii?Q?5Q5IJVc+CJeJFApXfNVWBF+frovbvRVSt4CbrMgISLJR4GUUHa+4luYhSA2N?=
 =?us-ascii?Q?vrvzYm5hgII0IGLTkbjIbepRLzRVqfhmwrDDdoJqMudEY35yWatS9eR1ZYKi?=
 =?us-ascii?Q?yzhZoSX7m1twgFYXE20a0gSlnOo/SG9lqNwMSicNI+6BQw3O8gEeeHTnfe2a?=
 =?us-ascii?Q?V+2l85i0ii685eYO4YIOqW+SbwzsrViTFBHlLbFP/3ep+Xu10tVAhl78L0B/?=
 =?us-ascii?Q?LxiOzWGDWxkzxvLNKnDCcj9sxBUVeuNu7528AVLeSVJx0hxorLSVisszt7rE?=
 =?us-ascii?Q?idmBG8774RGoBYrPNmB3QOw56bTzl81ArHWC8qvisRWeT497dnu5/SDikjRs?=
 =?us-ascii?Q?u2b+5i2Ig2aRmTDTGgnCVjFxw6/Ys+TYfyvovLCPbLOvo+qRIuvCq4e2/7wb?=
 =?us-ascii?Q?mB2t3EDuW4pNrXVAy3sJtP6P6fhDm9Di1Ot6E1nzZKwBzjBuCtOGdRxncAKG?=
 =?us-ascii?Q?vavP803xQch9Qj13YmnJ8PyC/tPGwlmtpmnaGAzTlkg771kSLIgIh7mOpZM9?=
 =?us-ascii?Q?rVJcY6HxXJKsmcf8DTjLOimtctqtsCHwz+STQesSZlnNqnJqSXfG70NdmhBo?=
 =?us-ascii?Q?QczRk9KYKNH1pvOrFOA07puMNA1suN2B8z2iCvXFo8b2X8vq2tjNXMjOvLH5?=
 =?us-ascii?Q?77nxqkJ/6EZtukEBnkLbAGlpHrn9GILiWE650/TtL1jw18vy6JJz2r3bA4hq?=
 =?us-ascii?Q?EwMnfIiFNSPohZU8bHG+YxQwWhnYanC3vrePlijLc6EZvVZk9jM08TLgPmAJ?=
 =?us-ascii?Q?LdwhJFZxRSfYCTM3Qf6SUegLYeyysKDcuAXJ71ALd5+/hO67XhOGKKV8zn7+?=
 =?us-ascii?Q?/Q7wJQy0Z07ieWzBfW7mBmD1y3X4goDcRZPKDYZkMkpMfg1QpToacxDndRY6?=
 =?us-ascii?Q?qTF0X/rNIZcchD6qZWjmCTstfFWaGMr+BqA8QR2GQWYbQ0fNAVyQ9Zs+Z2zl?=
 =?us-ascii?Q?zLAHfzlbf+lUXu6xRWpUt1xCSXrKEooWJLTopk1OdbUN2+6rnUN6tLw+byY/?=
 =?us-ascii?Q?P3fHvPv1hKHlEUzCMamLrqqqgPjR5GVqT5xFGqlclvh0yg3lHj/L0uRoUHJF?=
 =?us-ascii?Q?Ujn0WcTRP0bY+xmaAovu4XElpWB0ZStMZi5YI18g9tHdDinVISyx4O3rTsRl?=
 =?us-ascii?Q?9rHOgoWjcBSDTUpoi2ja+eZYT1CoGWHvIfa+83ufoFZSjbgRGy2Kg4jyvqNj?=
 =?us-ascii?Q?d23MdDB9LpH3PEiT6pDNifwOehmFynEN6EeJhCczgHSNdFG1vGxPlcCgN4OU?=
 =?us-ascii?Q?9Iw6tzBBQ5haEhR7OXKtp6XudrnqKPyA91tntU1kKbdQHbhBtgdSM+L0MWAO?=
 =?us-ascii?Q?NlFEgtmZ0jxMgzq+zrL4KTRTQ5wTW01rp2NA+aWlYli7SmViqw4grqNjJP01?=
 =?us-ascii?Q?wm6q6fC8XRH25Wavu0Jzt4WWB+kGNCnLEo82rL5+OBh+yLOcXx+Qf7U9NEFN?=
 =?us-ascii?Q?d0oc0FEl+El8j0KajTyeV3CzSEk9ufi6LdOYD8lhNkzVm4LNSrk9Y6nUIgUr?=
 =?us-ascii?Q?xkINRWgH58w9ycJ8b/hOCDBiBwljO6KvdYpHux2xJ99GLFbRhSbe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b7c7b8-a532-4219-6cc1-08dee712ce9a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:28:29.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iJiPHD3uuab4fZ+FhnEHUH1YoOUKG4JGom1tQyPHKFTjXFCHFXoJZI48qW+yLnDa82HD3FLSMjVz6l+xs/UcwtsoC8uxrw1Ymrnyi9Tmb2zn2mYWvKC59reu4Hb2D/fe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8572

On Mon, Jul 20, 2026 at 02:21:11PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 20, 2026 at 06:47:30PM +0800, Xu Yang wrote:
> 
> > Add test cases for fwnode_for_each_child_node() API.
> 
> > Test command:
> > $ ./tools/testing/kunit/kunit.py run property-entry
> 
> 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Nope, I haven't Signed-off it here, it's your new submission where you are
> the author. I only made a few cosmetic changes, if you want to give a credit
> you can mention that in the comment block (SoB+Co-developed-by here seems
> like an overkill).

Ah.. I just picked the patch from lore without modification. Let me remove
it in v2.

> 
> ...
> 
> You have a series of two patches but I haven't seen the cover letter.
> I use this script [1] that helps me not to forget this.
> 
> [1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

Thanks for the reminder and the script :)

Thanks,
Xu Yang
