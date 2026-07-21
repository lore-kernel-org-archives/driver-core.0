Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547A5480325;
	Tue, 21 Jul 2026 10:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629489; cv=fail; b=jYHko+7oZPUq6OileXz0Ye21JzDmjEvm8SO1XbALWVj8xMTYqK9cKaKIvBKeKQ7IrbjRY+YpfuG0a6/W/BBx91bgFhcojRuH3oaAXRHUpp9sUWc3z8nUc4tgmDXM4bBm1P4zN/eluySI9ofbyQgebNAilsGLj0opXHHlG/iGAf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629489; c=relaxed/simple;
	bh=9RPKraXocvfMmZIOPyIFjndoqeh3VxOOa+FrqYp1oUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oqK67j1UkLw+nRr7SmpCdCUlCkJFW+rv6ZK3y7EYeLRN3QGybUG3q3XtYBMbwalth5mEcNKrDeuldrA19bYd6MtG7yyz3x1cLan5goKY16pKse3Z5gsCeOb0RwbnhGdDeseRi8PsaBOMdaRCx41/SiElJh7TRYpcP0LWGjJxFZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=yJtuueLK; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yJtuueLK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n8kSnQVvyCBlPKgn4JU9LY/R7wn0LZeHVOYbY1xYIci9wyFtPViSbZ7/ZCQzhunxHlPv8Bpw0AQlc+C3IuT/BRlA6HFAzCllfYDwCz2HgB0MjRxYw+I9OQMJBvNScD7bMU+Py740H4bWe/lbyVwYSFardJEI12BmUKmyNoIF7prAlCjV3n1y/gdJloJ6kajKESwarO6TZkHTvSPLjgdNBACCty1tRUbi0spbjyo/3IHculCDLmuJXDA2pxu3wvVh2ca79eQ7vIbkkliHjGRd1taCUNPMan+OZSrcxhWXJXb+Wl0jstnmgVRowmKO9YqcxN/+vZsmulytVb5uI/ceGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDaRxnOqW4U+XybQw4uIVzVMuQw/MEWsC92pL5ay5Vw=;
 b=uY38QafZhG15ZEzxz97bqSgE3+f7kOVwB3zC+YBsJjo1/h+wDezm8y6z+V2RmLjLWqaB6b9oGae3i9L22iyZDJXypfmdqY40aedvE+iQw1LiDjxPhre7TcuFnDkhqvlsTUxzoySGNa5RiKVF3w5dqUpcr1QB+i+/VKRSBYPifO/2Jrza9FwVlb4OnErhG2gFj6xse8ibYCoZB0vLBCECkygn+qHF1vItH3t1DU9kPlHOtZj1WLZv51uzVbjTgOyqmMNnXN18XmLvoULcX6uood3FI4DKx0iK8lu18EFcqJa0ROdCYLno7BJIntUtLY8GhUTj0Z31UFkXfzNOZR4QSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDaRxnOqW4U+XybQw4uIVzVMuQw/MEWsC92pL5ay5Vw=;
 b=yJtuueLKC33/p6nygtSjYsG4c6UAnQ8Ixz9kPE7GSUDBdvU/JIqWKwXia4sAlDgr3v2O+s9KNJ+FUm3dhksntSU8LcXHRPJICXxUphR3gmZY45gfzHI0TKBsWv1lYrZgvyLvhc804zeNA/futGRZLxmbW94E7tWPDnduSzSFptYGOH/Md0MKbOgYFhNQ4lXj1ILPHq3x9CRwh+0IvxslFqz8ovXrkTmQkw4SN9eQJF4WcWf7P+a7TMtcNyYLuWEoQivHfCxTeYDyyW0kcg0GtBqYRFsXA+Tmb1xlPAn6+AVeUg6Vg/GahwdI7hVnpchPHLFT6FtVMJgWDSaMIk+/qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by VI2PR04MB11097.eurprd04.prod.outlook.com (2603:10a6:800:293::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:24:43 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:24:42 +0000
Date: Tue, 21 Jul 2026 18:23:16 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	robh@kernel.org, saravanak@kernel.org, bartosz.golaszewski@oss.qualcomm.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 1/2] of: kobj: export of_node_ktype for use by modules
Message-ID: <cugdaqe42gmq73s4aowxyce4oppi3zi5r6jrq3xmbo3qdjrej7@u4wsvtyxj2vx>
References: <20260720104730.1285552-1-xu.yang_2@oss.nxp.com>
 <al4C4ETj1KZOjOlv@ashevche-desk.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4C4ETj1KZOjOlv@ashevche-desk.local>
X-ClientProxiedBy: FR4P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::17) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|VI2PR04MB11097:EE_
X-MS-Office365-Filtering-Correlation-Id: 61fe069e-31e6-49ae-c922-08dee7124743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ogbfk04j9Oe3bJLGbKIsRocCcTB4K/5rgxhxm7PYECt76lFzce4RR9voK7lqRyAhGC5A53q3zEPEkixzxcXOiKPq8tNRQemQ472EYKcx/BIbKE5eYeu2SPckyFFJEY6iU2b2CrcyJe93yeG2KTc6B/CT8aarKnu1S/EQvTfDHDP9euIIKz0yRmtO3lFtySYqocadm+KFYh0nVQSJYqgJK0/m3yA7hylvYJDPsGcEyi/bCQJdshRBGruut09B/HYAz7WcDACcAzwRRtFshoHDgogCpcBDOdA6VSUM1F9JwvjEgdwgt4bnhqEVAwkOqxxv5jrhy73OUjgLvT1WyX03F2rlJLM9TONKCbldDBfZ8CfU9h9eu8TiVyltVZrJUqkpeU6TGzvclZ/KnfjRbDfXZrak2oOuE6ODCtG9d5mFpowrWOrjUHv64mN8dC73NTbsWuy5f0bD2+2EPXq/XuKBhS90foxtD2rRhwa5xwwLhly9rLuWg3GQhnCrTpgegCMNaaPqKSfj2YZ2LxTYDDeiRrvKQyBVv7BCplzZIk7HlSdVc/rLKF/zFlX5NuJQaOL5vAitGtfwuMysD/4ZEnMFNoh+tvLjeatZW7wLEbfLnJXwjbxSyv2RGa5I+vV5RwbjMKWlTNY/4e+Hp3IyO33c1/csTMIy4VqOEJLspzZinU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gJYW+gXj00puMGAT4vRYgC8l5g9MHNO8R9VAVwC7RqT+yYCMKYOYDHGGmSSb?=
 =?us-ascii?Q?ZtdLa3f3UF3J1zoSR/M/2CZ336k93+b3/dDvvWFeekpJtbo8UpGPgpw1aRDk?=
 =?us-ascii?Q?CXuO3CSNRuDb3wF1MsnbvPQofuclv4ZIW112J0j4Um3VEGG/Q6Qd3FBCgGqn?=
 =?us-ascii?Q?yg557quKU0xKbDKzNfik4hgIXe47IkiJavD8CnE2dtfFgYoOave16DIXyt/w?=
 =?us-ascii?Q?djGi/MSFN4L/veY5AxF5v+drLddjFQJYg1aaGAYE+qgFAE/oMqhIxQU/8Mgi?=
 =?us-ascii?Q?A9o3mfEibHnKjG1WzK8Zn7X6xHyT1+ph0c/uDXsV5UmoTc2s/C69KvoNjyTv?=
 =?us-ascii?Q?8WYfxbHEDe1hw1XuI+KQMrY6D8khjihOBtBnBgCdNNnLU6BMqs26Q1/sMyEJ?=
 =?us-ascii?Q?gpohF2BQ3Vo4AAtDcK7g0DrlCkJ5z7U2Lc2m2P59J0T8SkNpZDemHPZbVszj?=
 =?us-ascii?Q?1hxOEjPji3DPka5DV2E6lvkgcqK/vwBEcP+8YHBhmzbNYegFPEGRo7P+fXlT?=
 =?us-ascii?Q?mijdTDygmg00/fkIG7P1GoJxl6l3MMbXw/eHrgzSpRW/2+Cv9Kx222y7FkJO?=
 =?us-ascii?Q?bz8bjWYzMJBgEB2E5opIVLBdD0zzqFsP0bsKvB+CSrBK+q8lMTrZVIF4tuAt?=
 =?us-ascii?Q?onPhMf1LlTzOP5FuIVGlIXIItmVgf167jTQMGJ0z3/L7/5573oExPE9a759b?=
 =?us-ascii?Q?hSvza4n//r3bIfd2sA0xEkjXAqjyMpxI90cJWDBgsm/nO6Qa9Ex2L3lPPbvy?=
 =?us-ascii?Q?0v2eiKyPiH/f62jPjHkof5PsPPC1Z26/cOls1GY/M6FDrUvG5KDt5USroKQ6?=
 =?us-ascii?Q?YwA61CO11tLG+9nX75ofgYODvTDfClP6X35LRDbVyFdheSVGmt9saOHTQokg?=
 =?us-ascii?Q?4wiCq++VgFYmgYM5yhFIm8rbdL3UJG2fK96/lRHCjgXMNnujfZ9Z2Q4u9edv?=
 =?us-ascii?Q?Ru/wyfzYE5+5dXlM+nkkAAJ686GutBqSJOeS8OkdpAOX6wfld7SAIWNtuDWT?=
 =?us-ascii?Q?Tnn3JMaM+cAkVg2oVOArIfrU7xBifc+QU5pUjtzRJeJn675RM5nWxYNiWq54?=
 =?us-ascii?Q?fr/BtL82n+TH8fS/zbsAQT4SHFHRnc9wPMQk7ZEFm6XrL7LesqsjMMJyBvKq?=
 =?us-ascii?Q?jWRwtgbKbODXgxY9Om8Y8SdK79z2MKwQrvXKE/epvbLZYp1pACWI1wGlK58z?=
 =?us-ascii?Q?Kxd08Zr5J7t+79ZWICKyzkSWJjVsN91z+OYFPgGK/3uhDmF+p6+Dp8R5sbRw?=
 =?us-ascii?Q?98oTZUXHdJvbLZkxiZE74k/FRoP59yWoWdOD355VHzuLSoZreVCZ/ZuYrVwS?=
 =?us-ascii?Q?h9Vda9AzRRbaA95BgeEsxnIxn3NQLPYCls9f1+AFnH+eh5/8bYX24DQniNsN?=
 =?us-ascii?Q?6/dMiscr8vjMGyfXJyDhIwbL6rk8vRFszbi3jzX1HV68G+mA425iRfUgA0yM?=
 =?us-ascii?Q?I9xhXbDXGtepiVlt3xJJ5DEzF7IBlSO+3vdHoOQquW8KZSHebOT8d9J3ZSPI?=
 =?us-ascii?Q?u8q7nnW6lqUvI/xNxduBljXogPEJHdGyD0sdwNWvbBLCe5Aww0XcO3zh4Y8N?=
 =?us-ascii?Q?Gb/FkZZesRm9DmtBMZeICPQBaqTkUT21nSxhj+WbfsseS+CH7fu+lF1IzjNv?=
 =?us-ascii?Q?5QYjOk5YUoU6kATGS6kOrvLiKlK5dnBwxInjUw8CPS2+h4b9s5Pk0xK6UQxo?=
 =?us-ascii?Q?ctMuBsjBgeirK7HA/YhiiHwI2hzBvSk+pf3WgK83apvrqr7Wwh2Y/9RzxLEw?=
 =?us-ascii?Q?ca1oYI3JyW4iK7Zh3pEJVUO2IdzuFQQVapbzt6fjJnz02rQlx/wE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fe069e-31e6-49ae-c922-08dee7124743
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:24:42.8252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBe/QTO70dhIP6TFQzx+Xel3ldv+tPeQ6rgJfO5vl2qkJrfdh415w4kcPwBogJTMIgmddfdPDB5ABOMeUcM1HnxYlwFNoKXXXzbZHQkeStViaajjejVmlIRehSUMOg8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11097

On Mon, Jul 20, 2026 at 02:13:36PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 20, 2026 at 06:47:29PM +0800, Xu Yang wrote:
> 
> > of_node_init() is a static inline that references of_node_ktype when
> > CONFIG_OF_KOBJ=y. Any module that calls of_node_init() will therefore
> > have an unresolved reference to of_node_ktype at load time, because
> > the symbol is defined in drivers/of/kobj.c but was never exported.
> > 
> > This causes a modpost build error when CONFIG_OF_KOBJ=y and
> > CONFIG_DRIVER_PE_KUNIT_TEST=m:
> > 
> >   ERROR: modpost: "of_node_ktype"
> >   [drivers/base/test/property-entry-test.ko] undefined!
> > 
> > Add EXPORT_SYMBOL_GPL(of_node_ktype) so that GPL-licensed modules
> > such as the KUnit property-entry test can call of_node_init() without
> > hitting this linker error.
> 
> Use special one for KUnits: EXPORT_SYMBOL_IF_KUNIT().

OK. Thanks for the suggestion!

Thanks,
Xu Yang
