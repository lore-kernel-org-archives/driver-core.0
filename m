Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92A93B5DE9;
	Tue, 21 Jul 2026 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644250; cv=fail; b=eXKXJOtCSoLMZHeJAH3YuQdsEhhYOhLUaFT686FCnsT0zmtOPLs1jfgzNEsFhrney8n00ljH40SqZYO3fhhu2q0CgHYuUNdZhorEu47kzoNjiOQiDgSAvCYjLgKwSOBDrFBr6ZVl2sjZUGucvAz/gsQyiDb8X00UdKHrtF03uLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644250; c=relaxed/simple;
	bh=AN+uzahDwQAI6aTj9jyGypA4XD7YW4OcA+KcPL01qRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fzNQsLVkF4JtXlTKxjEeSlZW7rQ2fVAJGrCVth5KEiV0PsHDAWmrbPFQxcW+80GmadMM9WwFs1PO3XOT6AIPzK9R6UidW82Tttcbjssaxrq0fiHLBkZ6vLn1K3YslUypE03NL4/EM6wUOlF9wn1oS23qz2yQkJmfMFyWKEYdfQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rKeCbKER; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rKeCbKER"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pU5k9EAq/SIl2KMqqrRHnGw0jdjcRBHoXdng6JDoFRInnFCrA8OTglCZJU0N1jB7CHjOvSKAT7tIhSmd3abIc2Fb2MCSrXt0hDr9P58/Rk/6lto173ASsNKWOkgDciEoarE92Wrr6yrvTH579wkCHVBEzTI+R/QGKBByQRHYgCc1ww+7piRyzeAlWKB04XBm0JcbNjVF38KoF0ymeq6klVVLZIsMRCCSCXljvWhmHj7cbZHvUJYPTeqte9Hs8lmRqRYDc4skKQsM+K3TrnxNF4OFq6ybs12iyuxy4aXyQGMSk7dr/5AdhHV4wYjgBRw3JPodOkIHWfnXWGIIb7IpuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCl4VojMo49dp8EetAjiJWnYodK4Pdj/JcP0M5r+70o=;
 b=pD8YkoKCC1mv/QipbT0ZP6YGlIiKfh/5/eZzrF+0SeOCx2zigX5Y9Csa7c75tGvsbwVFer2IVedEpDHdVcDuAMPrX9kJox52+gNfLiw3lKJ6rv3VRApv5zZAuVS7ZsDGhtHKr9FXIiVq6mAaB9w27ttqujuM4vHhiipk86kK3djmn6aVSfvO1xx1IBpZSm4+Ago+3U+5A44QZsnCYEO7ORdEzcfPBS4oYeLh9NovSDRiMYbnft3uNbcuNTUaMnwP7wwJNlqpJSPU3JkW1RytXqkntk9ZTndnoycqXPW3/1SviwBV9j/iGR89B4d6HOhL+9boX91g9yB/tb6/2CG+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCl4VojMo49dp8EetAjiJWnYodK4Pdj/JcP0M5r+70o=;
 b=rKeCbKERVRBz5iozJ/FfPY8mubJHGn6nySk7sdWh2nQF7Pa//ETuXIz3U+DVQPGZgEsEVD6Uib9Kfqn9/fIqGvxW56kNJHbmvTjM2/918nhQklhVqmrMeAuTfZb8+URp6OasfWXgAveiqjwdIJzTnWO2Mz5iJWMoArVapyc8HzSSCg4K6EAclcTkljWHt5Z7F5qzO7inImq+83p17OUm2bPUPBrwKuzRyzgQ9A+ntwa7m3kES+txxbk8O30cAaQargo98OHlE8lYbdskXUXEEqcxnJLlyvO8W5BRTDGVN3y7oJ8TRuzIWE5A/P4QNa6c6Xoy4DjBguQvL7Kn3K+HaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 14:30:46 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 14:30:45 +0000
Date: Tue, 21 Jul 2026 22:29:19 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	robh@kernel.org, saravanak@kernel.org, bartosz.golaszewski@oss.qualcomm.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH v6 1/2] of: kobj: export of_node_ktype for use by modules
Message-ID: <llx5hq7g7a6ufrj2bcqixwe2uhzqidtzvb62pro2lu77zymkqy@basmt7hljird>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
 <20260721105448.2109894-2-xu.yang_2@oss.nxp.com>
 <al9VA_v8tcvS1hY1@ashevche-desk.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al9VA_v8tcvS1hY1@ashevche-desk.local>
X-ClientProxiedBy: AS4PR10CA0022.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::6) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: 8242b97b-f489-403a-52ae-08dee734a6d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eRVy22RjiYDZ3jrMKygXk9PdIkN26ZSzFhMtlRl81pe7baAw0b5GFKlcQOaL+RnXswif96XGJg55PYCOdYagvz2mTieaFagi7O929d5lBoSU6MMWGPv4PYQbTQ0weCDnDEdCj/0IyIf8g/IgHmeE46qNgZvwdzgGj46BShyV/W8xzEKQAHKIsH1pZig7/cqR5CytpJ649bHTQibqos9diyQBQBOjA7l0K9FEY4PmixZ0wX6k2BKxOlLEJ6GcdLtHEDQ0i0sJQgEWvBC61gDCBmNijZRcqpVvDqarEbOxonvHRd3Wop8p8uHuix+vQ3HpunuIzZZLQqpaIu7z6AegxBehIaOaVDAgZ3ygz1xwanJr4n87k6gMk4aYZukQsyc074MGj9f5l43tWQAMdljXqdfieIj0UnjMpxkIBEe/Tr3vqluxBbMqtdepsYXt/gvx0SHd5TsWf9Iv0mtKlvu87R6TzIWdcq6zNhHMuH1SvRLvkzpL3XGYV/Pgd0BNVg0Xokm0FPC+PTivbL8cncUM42RDx7DQ/LOgZ0jqbscaHAKQJl5KZXxFdKWik8oc5kBJ+7Gpc/v5GwjDElHHxlRTSl0QDLtux9R+Z9wkZ5pwWqMC2d1m0b4XU4HkAjtjPvCHg/XCvMADQ/8WlOBnA6viieabz5lZUcHlbyLL06PPEFg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PonDq2AOg0DEfGzMhCJrwELS/qPJNxCfssnXclvEGdWGRhB+LibZfisQPdV1?=
 =?us-ascii?Q?oSCRDICcRJL098Pul+7pfaRNKn92Je8aNjxhpzwPCZTGO5caYWnByGe9gvyh?=
 =?us-ascii?Q?uPYgOWFmYCHaz+2wQXyxq4fHLLdegHU+bJWpmyt1EiYFccfgkC22Deh5OVyp?=
 =?us-ascii?Q?0uxqwpj57QkHWnIzHX1yCEi6XU/gTijMyF31OpodB2kYnDdsCvyvnBfnZZJz?=
 =?us-ascii?Q?1+88AjjHW6iQU8+e35xHcO4REnnHlGyuuJ7BL9dpUnhPE6A+nGHg1kB3ODQ5?=
 =?us-ascii?Q?WDrkJpIRuMOPnrYdovNiajCf4hLFaRkHB7J2/1nA7+BKlMAMzOnCt/t3Gr5d?=
 =?us-ascii?Q?d6NQRrEhsGJZaUwShq/oYylp/1Q8wQEUuytw5cspiNPeS9NeWlZgItvI4OR8?=
 =?us-ascii?Q?Of+5vKoL8F/Zvb4+YCLZh69tmJEYA29lZG5h1EUbl4og79KNNuhdXDjtbZiR?=
 =?us-ascii?Q?dm+QIUzVAcBrvun1+an0sbvtV3OqlR6BCeD1ljk2daLTvUscbp2Lk4pDIXIp?=
 =?us-ascii?Q?EMFo3tCZ6CnanSwHuW7vOB1z9d98CIxQK/hITsZRKDGlt/7Z+CTqOycqQLCJ?=
 =?us-ascii?Q?jF/HDShm0N8wgEplB/ACSgR9fDYGI/4KvD3LlkF3Dn8gyCbvHzEQ4zHmH2uz?=
 =?us-ascii?Q?Auw4bDhaHGXs8PqVSmIyhkkpgfMuQrp7sLD1dgAeWAyl1EpARwbzQaetnUYt?=
 =?us-ascii?Q?gGqG0EBmKLvVcxZs8VRcbjcy+X5+6281O0V4cd49IOWhROD7ThHQcdvlys0m?=
 =?us-ascii?Q?ROQkz8yzwhocbKQKg5l96qt8FlyBtPQe81SE2kroyXALFgB/OIMW5IqQe0uE?=
 =?us-ascii?Q?x1RJA0bBoeIOg0n91AOi//zo6TODa76wQjmITKnQosKYFwHdnEZv0X2DzNhz?=
 =?us-ascii?Q?UtEjpSDgJrzafYw2oXOBnsPhuFXVvycqnCk28VNuuhMjl8/PVIJFSJwLOMtf?=
 =?us-ascii?Q?TYfbTHBMqtgtT7kxj4NV3D7emTBG8SyHaGtQjuhOebf/VrLDsU6Iy0qtm+7y?=
 =?us-ascii?Q?lMi/IMnT6xOdGlrj4SA+owdSsZOSX4ZLKtrrvz25cagTePsfx/ShaWaV3jR5?=
 =?us-ascii?Q?ij8Bi4V5WCObPrasFaUG86I2maidDqx3IeK7ue5b7Wz7e3FtJ8skmxrqb0+D?=
 =?us-ascii?Q?s5Y4WM4rBr/Y/y5tBm6c2gonl3N/7zWYVqlO0JYX4LUFmw8FSrMcB9TxuL+K?=
 =?us-ascii?Q?kWaecZEK0UiN1yhpuxfqPZyscjjJj+aVL90dBtE/i8wqY0KnApcZWf6a2c1V?=
 =?us-ascii?Q?mj9MIEe6jtR5JCqea0tDNxyfLWxd0UTh1m8Ljs/WfcIsIyS33DYwZI8NZqTM?=
 =?us-ascii?Q?Qphyx++tMpqdeWwnpx1M1d0WSZKXbEKqD41PMLQjqh59GkIx/TyTtWrqBeun?=
 =?us-ascii?Q?v+x19D8YqY1r1BvF2pBYEyqjsNgCUe1MeHbCuLeqrSjUdh0Eo+UPzI7k5pTj?=
 =?us-ascii?Q?zDKK9f7eKlkSP9SP1IqLKLtCnnmVfgw2DAkV4OBkcW2ZMvPL91E1mIXIB/wt?=
 =?us-ascii?Q?cB3VfzhMqcZ5qRxQhJpvu1VO/3BPM2bVyuhMNBNa4T6KN82hsEBDButO5F23?=
 =?us-ascii?Q?ZulPNho0YtUG14PE6TAsuaXjZlBVuDv2vgEHMnboJ92soXU4gNr+bvhzKzG3?=
 =?us-ascii?Q?oJDu3c0Y9oXvS+O7kIPPKF9HA1oL/fNdsR8X3zMGKMpVEzusg8uR18RkMmO5?=
 =?us-ascii?Q?ho8BRakzwphrwCbJjv1/1fQtRYcMqz3HLQotH2x1M+bKWdkVITTlhOrZ5jVc?=
 =?us-ascii?Q?bse/3YBXvCko1Wt5mBBw0QED4Z2eyZSZ1qvr+Kje+iMXyZkEMWml?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8242b97b-f489-403a-52ae-08dee734a6d9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:30:45.8329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WWVXfcDaS8oIdSuvhYlaYGK5/CID0rX3iTrWWKxg81wlGCei/r6R0C/1247L/klFTVsJWZGsNRcZpPqHCV76fRgvAGlYctar495XP3KzcBuiN24qQRcy87jnLAPM23SP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

On Tue, Jul 21, 2026 at 02:16:19PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 21, 2026 at 06:54:47PM +0800, Xu Yang wrote:
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
> > Add EXPORT_SYMBOL_IF_KUNIT(of_node_ktype) so that modules such as the
> > KUnit property-entry test can call of_node_init() without hitting this
> > linker error.
> 
> ...
> 
> >  #include <linux/of.h>
> >  #include <linux/slab.h>
> 
> + blank line.

OK.

Thanks,
Xu Yang
