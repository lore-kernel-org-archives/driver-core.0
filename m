Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F636920C
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379014; cv=fail; b=ufi8xzqW01MvI4hHNzNaPcTU78EM6IbQP8jj7eV1UMgzh755rRZXKkqjjaaq2GjHyxuvICHHj0OEToqqM6nNTUL6fV1PHzy3WXVsGHIbeHehub4aH9k80YYQnF/ier9ZW3cCuzvx9UyT2xI4zyLOmCbOkCdkaoK7oV4+OouniTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379014; c=relaxed/simple;
	bh=Y5byCdw2i7Z64zZKb25ldmn5YDhg6Ep6DvSaLcu92WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dE4CkYUW6GuTcSIwMEzfMTpzGf4wvPocYnkKg1GvRchOtKMM+3pyTaMkBa7jukNRf2JQ44xCMhHWjRXdHMDGvCO/qpCbjBZ7Fs7PUR8QPPPSH3GQHfIiBO/+FsH9A9V5j8R0CYkIi3I4bnb4NxL9FPT/YHYu3k9cSRHByFzz4k0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R1QxvX5V; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R1QxvX5V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf/GKKCCp1cNFobd41doaP7VzKAhiqkeUSoEcjRbOa59ZRRO1nVJF3sPGZ0TwKGvkRT6WpBMAQtRYBEOw7CncquPwdCv+McbQOtbgfL0HRGprWr4TFiC6SMPQuPE6ONX6+RVobzSrWM2B5LETgGmKjHgemUNriFtxmJjYofq1+36wJ9ApGPbZRnatSiZGwspBiswuN4IgnQ8Ff4jmNSqK1aXUL49CS8AREzH5OGKr3kV8x/syhRvRSCnSqpv0LbFzXZCHSWt4fYcREQiTzAJDteIWFhIkwGG5OSG0XjltGQOggZqnKy3f3bHna9EtolyliCxRPEB3QTn8togkR7eMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INgOwgAd0nY3XQH5jys9nDaWgQkFQsUsa+mNRd1cucI=;
 b=SY7js/7IWtTPPixwoc43hN+zxWiKD8bUvg5HSdPG5Tf7wpj+AgQVTuGRYwqSHcBcUdzBYBFdJjS+8rCHJ5u0hrwm0e3B4gT0zWAjEojXTkyZSu4i0SGYEU2kW9NjjlMz1TwKAJeksMkKS6ZjBfIWa7pIjpuCgh7gBYifdwXujV59izcp7yx7jtS0G/fRl+ViRPmKprAWdmSN9f6OJ14d5nb7QMh7J79PcwmtwRMe+M33/1MeP5uBIp8r3jHIFc/zFzy31WsZqWHFEmSFxlJdsodc4k5jU52rne5JenYAnOCUlf5tnyjRN4vSZXZGBxIUkJzCHTi0wovSbT017sW3kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INgOwgAd0nY3XQH5jys9nDaWgQkFQsUsa+mNRd1cucI=;
 b=R1QxvX5VpvJKnwKUYow35YGf/pTxo/F60ylld3x1TYtE5k0TnkjH+f7haN7UWXPoCV3rh/hLFF03hMHYmxG2nLu4FM4eoz681J2GG/7jJKIkzzoI/SvbihZF+WXaOZa/GTLpqhUfkSmFbcJNiK8ojvvVzKVw90L1t6Zn4MCzCvKMsZWHfBtkwmL46wcymf+n/rE60RV2vhCwt6r4f9bgrCvr/ZE6CV3dADy9MDNdO2dLRN6jXjFchjbDuULg/NuL3vJ1PahjoTRY00UTNoKVgs+cirkrZKblgOzqH7WuZbtOhFhd80JqUEvDE5RR79ugYi2c6VwUbnatVjCk+IY5vA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 13:16:42 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 13:16:42 +0000
Date: Wed, 7 Oct 2026 21:21:13 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/7] regmap: cleanups for regcache and regmap init
 paths
Message-ID: <asZHSfGJMqlAT5MD@shlinux89>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
 <179130291324.150114.9760230237322324458.b4-ty@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179130291324.150114.9760230237322324458.b4-ty@b4>
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AS8PR04MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f7ba10-8574-4baa-4037-08df24753a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	98ySUOSYF2E97T4Wkzf3hzM4owCrdEXrv9v0P0wP0zX5cUVBY7sZlbOiiUpZWMd2YPZpSsOF00MR/MH2knYtCOxZZ6yeLdusnJ97SY8Uwtg6r/cIfd+6x8KN2LutZY2tZmYZmCtEx5YCMpXMtgrlMGX9JflG9W09uATltjqumcKSwM1m74rrVhO8U0e9BdTDMYC/ASN4Kx/orJXSu9e/vwG0vXNr58V1tkAWNbGz52fp/apUpGeYImKMIkzqM8KPzhfXT5ukwi4pxfywnBuWgAR/1MlQEzL23qVtkvuuzwNmGeOjzlxOfuoVATqd5GBayW4OuJbQ0GqOO37WCksjztsNiPe9QzUYDV4NGJmktynAAfaWknq9/WqqRAxL4Ml4Tu15IucJ0QwIszaPAOXEroELv6X6H7whIT8+CwX0OHvYFgrS634ah9nTolNdG0K0TVLJbZrl945FTtqMd3q45jaE1qVSod6pN2Dn4uczzakjN19fmAChgG6E7num02qK7GudKVv81+jfAPcQpaUgjnI+4ihL/lXAchaTMdGvWTVR1qxuhvqDOMuFzjc4nUfA4ZkmsR1QQvor1ooRZO2sBEch4GMHJ0ubLM94JuDjYSs//Z72CGnw6H97qLVs1QOO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+MpJeU7D3SbFWW9/0iWQZs5zN9a2M/scM8agmFoB5n5UNkrS16/0CVd4tKQM?=
 =?us-ascii?Q?fN8wC9ExPXt6A4zZnLT8VAwvITsKBAw0gzqj6REcM0y6zAxVvfybprrAuJ7r?=
 =?us-ascii?Q?MDA8zeJUuOhe0bMwSPQY3+y/uYZBglkQQNA+U/x4TESkV/+Txrl1QBJyBVIW?=
 =?us-ascii?Q?psXbQECEoRMQpNqXNN9Rwa8ucsl8fi7SA1RoI6qjNOnQVecQAhhGB34jC0kn?=
 =?us-ascii?Q?6EOLMM894tBNl2YWkDSkwUi4/e+V1n6fHFZ8RFBqFjHyMsYIXQBzjwFSXJI7?=
 =?us-ascii?Q?PofLaBIEetTEHfrz2UpEltVUJ4N6IWY6fbcR7z4QxSxLhSxDaqNR+K/iaV5M?=
 =?us-ascii?Q?xzVUiERUFpXaA5NNViBEGKlfOCddDD0KB1f+l3jDFMXb868br1MjVbFY173p?=
 =?us-ascii?Q?F25v2g2pWofjt7r9VMRW7buKXBgZINCLtWATtYkiGf4vQOTwQ7QK4YaJ0nJq?=
 =?us-ascii?Q?nRAAU4ZpGHQcpqoYUlCesYnWx0uAv2KFIaOuD4dlfhHFV4zxVVZNpb3zaTVE?=
 =?us-ascii?Q?O9xqmfAQmYYeGDEvpYW3aMhG7TVFGerL2eR2lwRyv8PF3DWvBViML9c3IcKB?=
 =?us-ascii?Q?XUBlZKZXFvYfENrleGU8sZCaBLTDHcK7sqUnY59f4WsMZ+43exW/t71sY2Kw?=
 =?us-ascii?Q?ujHerc876TZpXQN5NaP2y5lVw/t0krY5weoCLPiV5XV2ni5vWfRbQJfRcxud?=
 =?us-ascii?Q?W3YZbtzclxZKdOj+EtdRtoZBSiHj0+djLQ46BBGDq7XgHFFx+sbmkmPoGX/p?=
 =?us-ascii?Q?5WHTplsNnk7AwZ4tHaaTqynl6bWiuV+4vYOMBSf1L4K00FvwIZrNGTbyLoPb?=
 =?us-ascii?Q?2NpkHhiD6OLaG8qUmoRUPDgrulzz185324Y4/i7obELTLhFD+zWvkDfga8Hx?=
 =?us-ascii?Q?13NbRv8j9pFtEUbKDFnvF6NaQW3Cb9FAgYBUzQ7c7W+LXKFfWNtlO5hVlcYw?=
 =?us-ascii?Q?T64FuuXOpQ+8eR8E/868jd8u4cnxhpN6r0CpJusT5aIuWYeQfTIhk4WPz9cW?=
 =?us-ascii?Q?GLHI+MREU5mL65Vqbmz9vsOwkdimIl6NPFQXBTJKM3CBAak31DtlXnASEfsf?=
 =?us-ascii?Q?4iboq9Zrktkh0R+trTIlyARv9X4VCVv1cUD7Fj8IlXYR0rLtxD0/3f/GzJr7?=
 =?us-ascii?Q?pPt3gK23+BBBhuViOZHFk1DFq6js4hsf2WsClZEDnBsv5EWnZlvNZJz9DYJC?=
 =?us-ascii?Q?ezQjt6ACD26W4wWAXU6Lu19+lXK1Oxwxk7T8cCp0kw8qR3sA7JOgRFiqI3mI?=
 =?us-ascii?Q?56Mon1hBkiaGOhkZFUmtakeeYzqgJ+hIdLPdruUDe4GM7OeoY205WQHhTgw7?=
 =?us-ascii?Q?XEAVStzlEwAodkplVOyY1y2WpOPhQKt2gMlrhKf3eDyukkBbQGdnmOYg901h?=
 =?us-ascii?Q?2WC2fc3COubneunVX1p+6jg/OV9N5Jy4fcRdB6RNih7LctKR/1fmit3Ppnda?=
 =?us-ascii?Q?I7dHhy4YnEDzTDD4yF2f+WRk7XwmCySMDZoOSERG6Tm/nJK1BvrXcGxVHsRM?=
 =?us-ascii?Q?h8bvNyXeIwrF2x1D/xyu37SQyWnEtIKH+OTbDnjI71aRiMeAxMasxk2Ptq7A?=
 =?us-ascii?Q?5GVEolA0dsT0XJdo58mmeGsTFBkV9mLjLlNzzZyRtaS5S8oD2lPvW7UncYap?=
 =?us-ascii?Q?GxilbX1dMRlkLp3rEb+pwQ8XcdgrFCD7ZLEPaQHGYziJjZvkaaXKUE3e80JN?=
 =?us-ascii?Q?mfMsP0Mz8A6NzsTsHd1W6xDQb6bFTdJzFQKKjQR1Dqooj7KgrRim7KKPRFle?=
 =?us-ascii?Q?0oghBPzfxDKFKCkjki21PVgnFgx7lv/FzNXESmiLU+a5uSI4NBqI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f7ba10-8574-4baa-4037-08df24753a72
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:16:42.1672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNJlTtAcM/HtLDiiO8s1allHYaZthsQ8+6atngfrXoG5US7QK3zofmoKfncXRNJ+MlWIlviKwBt2Mb/SqDRIn2ZwNh2cQyMVf9YPWg8YpW1f+r5VDO7oz78PxMu+Lf1l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7590

Hi Mark,

On Tue, Oct 06, 2026 at 06:08:33PM +0200, Mark Brown wrote:
>On Fri, 02 Oct 2026 21:11:16 +0800, Peng Fan (OSS) wrote:
>> regmap: cleanups for regcache and regmap init paths
>> 
>> Following up the previous regmap guard lock patchset [1].
>> 
>> [1] https://lore.kernel.org/all/179062150526.139547.3870545428656485907.b4-ty@b4/#r
>> 
>> This is the 2nd batch to do more cleanup.
>> 
>> [...]
>
>Applied to
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4

Thanks for picking up this series.

Sashiko report a minor issue that I should not use scoped_guard inside
a function has goto.

Actually it is not an bug. The goto logic and the scoped area are not mixed,
but anyway I just posted out v3 to address the issue:
https://lore.kernel.org/all/20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com/

If you would keep v2, I could post a incremental patch to address the
Sashiko's findings. Or you may pick v3.

Thanks
Peng

>
>Thanks!
>
>[1/7] regcache: extract locked helpers to replace open-coded lock/unlock pairs
>      https://git.kernel.org/broonie/regmap/c/81556a7aec22
>[2/7] regcache: extract __regcache_sync() to deduplicate sync dispatch
>      https://git.kernel.org/broonie/regmap/c/7ca8aa98e2ba
>[3/7] regcache: simplify control flow and reduce nesting
>      https://git.kernel.org/broonie/regmap/c/4e1b5ccf1eab
>[4/7] regmap: use krealloc_array() in regmap_register_patch()
>      https://git.kernel.org/broonie/regmap/c/8a889c83e478
>[5/7] regmap: fix potential double-free of map->reg_defaults on cache reinit
>      https://git.kernel.org/broonie/regmap/c/ca685a42b0fd
>[6/7] regmap: debugfs: Use __free(kfree) in regmap_name_read_file()
>      https://git.kernel.org/broonie/regmap/c/d64967dee82b
>[7/7] regmap: debugfs: Use guard to simplify code
>      https://git.kernel.org/broonie/regmap/c/a93de1d65c6b
>
>All being well this means that it will be integrated into the linux-next
>tree (usually sometime in the next 24 hours) and sent to Linus during
>the next merge window (or sooner if it is a bug fix), however if
>problems are discovered then the patch may be dropped or reverted.
>
>You may get further e-mails resulting from automated or manual testing
>and review of the tree, please engage with people reporting problems and
>send followup patches addressing any issues that are reported if needed.
>
>If any updates are required or you are submitting further changes they
>should be sent as incremental updates against current git, existing
>patches will not be replaced.
>
>Please add any relevant lists and maintainers to the CCs when replying
>to this mail.
>
>Thanks,
>Mark
>
>
>
