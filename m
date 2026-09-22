Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA06C280CD5
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 00:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036895; cv=fail; b=BOW34Ztyms4ySuufVJN0uk8huLGRZ6IfrxSBKER2Z/DNTPvLeF2Os9a/i9v5REqBeZfIefvwTcPtMGEOvdsYrPlmB1BqBKuy3J59L0QyT0b7xAUYM3Hvz7JqrBK2LXm8/Z2OTyR1b8Qc0USHpYCr4LOgxsSP18pWIZWNd+NwmGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036895; c=relaxed/simple;
	bh=Fs6qdhX4M0mIUJF2Z7ruBi4CBID85azuIbemdiN9l/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XOOpcD4W1Pb5zw+/7h3FDPNvavAmAau1r64t9sMra++uBF8V4xxP1Ep7Ul6GSMlluYi62afb683DPHf3HxpmC8Oj9cqvg2JNzQOKYrBU8xCIrd+9qZ8iiGvmihr/RQVH4Z5srN81KZe0co/9kAImbtCuhQgM+Dy2c2EnAWTwxuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ka+VSywY; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ka+VSywY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x0bOU5wWfFOUAd3/u5ryahs5K02zhGJfW6AQQW/Nt8hrr2xQ89seMVV11YyPPAhVz7xiC7Lr0t18676El48INOkzBvCPIrctyRZTma46EeR19TOyGsOY9m8vKmSOn2poXr31/4zSufM3d4z3/6+Upj/dOjXCRzdNJ5i+tCTZsBPbGsVEgJ+pLfKeF7tUaTuW+4yvZdXrIVlI1bj3Gm9etIvGcxYr3j2fKg92+LQjxD57ZuHbzEuhrtxyOS9iPnqsYHWTNEA9gi4LeVe/fv6KG+rLbxYhRm58usxD9QpXYNKOhnoiwHwAiBGMspGes4cwtQV68WcVNEmPzGB+hQ1FCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNlPmiI2ZmbAlh2Ju6v9DU5hKUNDFnc4wuKy02TBO4c=;
 b=JLxVQgEnJF9cTCFkyBbT4AQAtzCT0B9fySligcO2O1GYtJ9nddHctdTvNx8E0LD5Ij9kRj3SQfpxaB6oWSl7RsoqfNgKUv+xRNmHjEvvNleqlEocQvu4DmY82MP6dK1JKNgkF39JH2ZeJFfHlSxvEdu5lQNZJblfBaHyPYHJgfEv5fmAVVRLUBswPxNVI1PUCRBruUKU2pV9nmiWh/fHQvEKHpFvFsV8JVc6ES1WrRorqehLw75fq9nakeCETk3Uprh7K7OmQpGF85HLV+9pKBnhceZfusVWsk1JhuCkqMSRxZWeV9x6IuXR2Bay27S2MVN3YVfnpKGuKa+7XXk3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNlPmiI2ZmbAlh2Ju6v9DU5hKUNDFnc4wuKy02TBO4c=;
 b=Ka+VSywYF0c3uBY6V8hiAoQU5sB6IXIiTsZ0PhcgNFEA74g/vPH9lyyo9pgfXD7M5OkXaPHMerT21jxtXE0LdUrMrFKamjitGYevje19Epvy+mxL6UGFyQm1Af6NQVqP99vo2vMTMuoG4JA6FUZmjF9iZeon7klp/am8bDKnLMAbsU5v8uS1P5/XsOwcR7Gq4vEOaxWHj05oRYVwpHSUyauvlpf7jcCf8PoMbXzHjWA2EckqpAiony6Tn2E6+ILzV2oS0Yd+BMNoQzvbozQTi3j01KfZE+nPbKydk+awM4QgxRSsowLt/LOUZiLDX3OsTpkgOhua8zr1IhC5u6sUuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PR3PR04MB7418.eurprd04.prod.outlook.com (2603:10a6:102:8b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 00:28:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 00:28:09 +0000
Date: Tue, 22 Sep 2026 08:32:30 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 2/4] regcache: use the regmap scoped lock guard
Message-ID: <arHMnmeRbOqSeIQ9@shlinux89>
References: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
 <20260921-regmap-lock-guard-v1-2-cdbd97b46074@nxp.com>
 <arD2oclSWsFo551s@sirena.co.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arD2oclSWsFo551s@sirena.co.uk>
X-ClientProxiedBy: MA5PR01CA0304.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::9) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PR3PR04MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6d786e-f347-4086-97e4-08df18406105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|10067099003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	tYokICJnGY06lj087dFWYrOrOPN/fVXYCvLxiUpCYBSN4H85NduBWPXUNCUL60vNaKYG3EEjV99ysPmYDYBGl3iRQG6z8+GdUT6Qm6BrQYOTLb4RtGIOAE+Z54dxRapyxDGLZl3BSMmgpbwg7bd43Ld88TbrnirZYdtJVt67Rj/ZfxrH/XN6MtGVMEA0Djxgg4z9eiomUxuBa/raoZaBS9hLYyGVSfwqAU9SCyDmmon/0BGrK53a9VtDeUuGlq8tX+cZEeCuJdu/8lbTYcpEI09puezsLfXH48dwZJxlGX2jnHabyJHhtio2i9dN37SeIyIV1ellJOasNA4Fh5Lwqshf2pFAI8H1roMLJrXf3ISQmM7yOeP5OmcCjqUUPHANLkGLCPqOYyZkpFtQHn2kAMjGb0tectEhncVh+l4Umg1gXvxQZ/eQN6660cY4mlwmu8F7B6gmcU1KzX+vmYmvgz95kpS8wmHtN7LUuESasit6Dhb13b3hgZ9BCtElskKD2zgE60Ds/vNewx8g4+T6a4SC69FGjZK5z1C961gnrbWtWWXofJAIsT8bzUZX/AKcxgOTKg91Pqu1nghtlRmGlI3Yu7jVFNRANOfH7ahZKB0HYgkI8rUIcjX+9hget8kXt9I3uJRQDwJ8+bl23kyeos6RnCR5LW1a8/9oUAtxDuk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ARvOzaTqZIFrMaeu6Xx47hWYH1S2/GTR1ZQScVf3zlx49vU+6Jm67Ff2nrvy?=
 =?us-ascii?Q?l+zBY8L1u1Io/plD1d68TBFLdu3hmCqNyeCfVNAeClHbDXl+wc5+rdrUkMOi?=
 =?us-ascii?Q?ansq/DiGO9RqDEOuTLMj6wr+1bmj6mH1uCVBBDuCON2Bhc4O11yhYByGtWZJ?=
 =?us-ascii?Q?vJE4cMPE2bnqBuvy7sYgIAd5Zcz6tdwXQCGdhetPYI4Aei06B1AvrN/oQYYh?=
 =?us-ascii?Q?2iE/bYm8VtCeVA1ZVge7nK/qRwGcRUQKDu+JRhIYgx3KDqPoOA8UopnpXTO2?=
 =?us-ascii?Q?zgdBcJf/Jwq5qs/FngzwP2J6m1JOlpIB52WcdGYsKA1/IPs5U2ODeIfMKENn?=
 =?us-ascii?Q?SR2AKNCNpLdlSASNjpyCG9y2Bhm44qJdFjLJeh8Mof9qbrE6sbl+kY2lSAG+?=
 =?us-ascii?Q?2BcdLcBpOp9FQHv0ZLqF6lf8kq7baEDfdnBNqSU0kNElN8m3m7YSAoyEd+uE?=
 =?us-ascii?Q?bEcqjkqybD5dKJMS7y5AS8DnnCVrFdui2Wf/nDLvnyqsjdQj0We/HfS7fBFL?=
 =?us-ascii?Q?rWyIhZa9fO3kVu++oJH254bLgqm21o5zCGYVVIr+VsFQp1t/tAhVqmjwUnIz?=
 =?us-ascii?Q?1HrNZ8P1LWQkbyKmtDkyOZO+0NQmiEf74ia/4/vMbJbptRHq6jNv/pLfAclh?=
 =?us-ascii?Q?8El9vXCE66SwHZCGYCqkOhy6K70YtJcN6oRS1/xS4ythXxHwJL7C66QjWjXG?=
 =?us-ascii?Q?0xorOoQQr/ihdkPJordLAJwT03rhzl3/xtE6MJ9ECVhfvejEserL43Jloozk?=
 =?us-ascii?Q?G0c5tQYyOPO+TOX9OU89a32DrvZrMAbW5P1KUHjuyzNTn6I8/VdqQI3LdrbI?=
 =?us-ascii?Q?D+mybAX4RxzlygwTqqFJCj+0PVWJwJ3CQ8tquXG5M9B3kEhf1rZQz1j+cUpl?=
 =?us-ascii?Q?miJY0n0ZKbzxXT3S/4He5Y+R6A1iPoGgUgHksFmDHgYE9C8ijFSm1+hn92k3?=
 =?us-ascii?Q?9pHiK60JaR1bFpG+uG7WziH3xNl/U6DOTm3uAEFgc5Qq5GEgBAQb2rzIx0Eh?=
 =?us-ascii?Q?OvnwYmNWk/586nZ8Fsxl7vg5zourmHjhxN8ofIDxdPtsFVMS6OrExPITQJNb?=
 =?us-ascii?Q?Rf8+5O09Sfg7PBosL0oBRgZvCLPl74o+KH7psZnE0nB9ZcVLIPg93vze+Qlk?=
 =?us-ascii?Q?Ru2tXOljF2H53xJG3llkbZ0XSVMZpfBt+A7t/p1tWlnw3x8+dBWgyUxGQ2rl?=
 =?us-ascii?Q?a9EFNovYQZ3VtZZhaysBo5tPVqCbaPgeKRsI/Ob4GK87wNz6m/1Pk4LRqO1i?=
 =?us-ascii?Q?V7t9gDbbgtaauEroieDvm2odN7gFLW6PZz5+fWh/Trv0ND0CCzJJsiZqFLTX?=
 =?us-ascii?Q?pMHk2v/lqFL9vwotbCxAfAyQMsw0obFUT2wgVicw3GwRWHwi93cHyJL4rcEA?=
 =?us-ascii?Q?fEOPMbhjKwQCwz2PpvZXZiyDKpMuiEckBVMod0tF0Hk73I/vrS/cjaDMnFnl?=
 =?us-ascii?Q?m4siUw9QVwliIaUh6VmIGoYLflCIreqtEaUMa6OYlB2DuIBIdSoWbQAd2S+T?=
 =?us-ascii?Q?Kpy6+oH+lKNb/+HmSuP9VMIXAK4AzrKBOM5Y+1S7pMDM63I5zjYNEY5Va9Ni?=
 =?us-ascii?Q?cxX/Lnf2OSmqULiLTpijDuCeMQi4X49lZjqZOKJgjejpl6xYvzSGe1aLKIWh?=
 =?us-ascii?Q?8m7oekzC4H23kqUadO4JwKtzUEfKPYdRZV+sTWunhKo/9Wa4sG84SKk8/EAX?=
 =?us-ascii?Q?pDnIBTtYJVNaadfy6U9J3ULlnBGIsNvVFCzVGfYzWNgmTP/d/8LVrZJlWKvt?=
 =?us-ascii?Q?j9sifQeqgb4+ABKtw2yTXgJazUo//7qHTWLVyfdinmNKKGOG5DCr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6d786e-f347-4086-97e4-08df18406105
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 00:28:09.6367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anjQUAhHJMCzpWGBwwS03k+6UInFOzBg4zvg51mBYRVn+j2unbIEXTfMOh1MTnyDp8x0qVIK40dTwg1A/Tslotn5gRhOpXjR9qgMaz5d8nOFnlOnGHhGaFENWr5a/guQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7418

Hi Mark,

On Mon, Sep 21, 2026 at 11:19:29AM +0200, Mark Brown wrote:
>On Mon, Sep 21, 2026 at 02:03:34PM +0800, Peng Fan (OSS) wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>> 
>> Convert the open-coded map->lock()/map->unlock() users in regcache.c
>> to the regmap scoped guard introduced for regmap.c. Use
>> scoped_guard(regmap, ...) where the locked region is a subsection of
>
>> @@ -432,73 +428,69 @@ int regcache_sync(struct regmap *map)
>
>> +		for (i = 0; i < map->patch_regs; i++) {
>> +			sync_ret = _regmap_write(map, map->patch[i].reg, map->patch[i].def);
>> +			if (sync_ret != 0) {
>> +				dev_err(map->dev, "Failed to write %x = %x: %d\n",
>> +					map->patch[i].reg, map->patch[i].def, sync_ret);
>> +				goto out;
>> +			}
>>  		}
>
>This has the mixing scoped guard and goto thing I keep raising.

The logic is as:
  scoped_guard(regmap, map) {
      if (xy)
          goto out;
  out:
      yz;
  }

The out is still in the scoped_guard region, so no issue per my understanding.

But indeed, it is not good to have goto in scoped_guard. V2 will not have
scoped_guard and goto mixed.

Thanks
Peng
