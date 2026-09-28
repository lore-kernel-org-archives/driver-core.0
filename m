Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12345FFAC
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582195; cv=fail; b=Xg/HCoCHPCNfSMoxs5sQVPZGhWEPa+QwCBk91Whe1BYilbSRlMcIOByW5VAj5EBWtgxtk/0AVXM36+yUSZV8HIV3MjeTGt6yB0ShJTv8yT2/FFARIgDCIYqJREENURhgg60L2KwH02z0EZlRH83gQ+92+lRGF/PzwBz+VZz/g9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582195; c=relaxed/simple;
	bh=7agn32814r9jDrMoz6lWihSWIDOlnMb4u9rmO4G/+PI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MAVlxSxzPsGoSXaC/OZk23ksFB8Zh8IjRl7gbwvvOwhNcE7csp4qRbubb1buDRkz7xDRzB4a2c6nwhYTh5QcMza3piQQgUfuzCCuTzIfW+YseMr9t1V6nFvL3nTLAh5fCJOClxsexrBMaV8NKh+4qOErI4zSCS3KrA4/j16lXj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mk6Dev5D; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mk6Dev5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790582192; x=1822118192;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7agn32814r9jDrMoz6lWihSWIDOlnMb4u9rmO4G/+PI=;
  b=mk6Dev5DIkG3XmpVqiIkmV6OZv1qixGlws1lRsQk1pn1Z0LBtDb0Tz/A
   RZCGNBDUuLiIfa0R3/wBjt8MOXKKQKUg4hwLf0XKKkkc880ZWPbac0TJd
   TSRMPwnesVRySsbNRjiMMX+mpXqxOSfwFQKYG6h5N0M2XhQTvrUr1nA+T
   BBN9QXGTE6P2cerl+a0+CSrk//FF+5jvy0Xb/3iD2Y+WtqUgJxS+eZmsZ
   +RQ3Fn5Gu+1XnJaES3KlULifG6ogxTBXcxT1HpgQoeIeoB8xYXuaQELYZ
   WTkW+C+NPY6EmGekiFkFVSrLmj88WV9lVjRYwtghPy5x646zkNCk0emhj
   Q==;
X-CSE-ConnectionGUID: j8eR3IMJRJeAorVmpBmXCw==
X-CSE-MsgGUID: bFHBBuu4QfGslBKkqRqXGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90401969"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90401969"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 00:56:31 -0700
X-CSE-ConnectionGUID: swwTwZwUS1KKonOR9iat9w==
X-CSE-MsgGUID: cTyTGe4+R4OyG2cdbKnk3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="272781183"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 00:56:31 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 00:56:31 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 00:56:31 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 00:56:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sL2A+OKZbz62IgklAvQJ0sB6IMi6C9NYU3nqJAO+dSJ8Apvk2q9M0Fgj+YD0iIOWY8rcb/Q5AZhF5HHwTDZ+qMGACkpjRTvIbl63aKTGWxn3x5z4OBS/CMgZ7KwVwattNjE036nFieNnrPCg7bRNf3vf9M/DA0t61Pn0aeWu2bFl9afZrbjN7mjBBWx0MLh4Y1F5snnBd3wDov2kwW9WI8kGLL9L7xKQs9OPQkZvm1UC95VCnqQpLe8LWlygISAuJyIk9uF88j7wz+vzGeM/E9HjWZcQPlCQM4BUDnbLaie8LwR+TYNLwtK8t+GkejQ+6jZOD9NPLXx/ruz31rYNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEAXIeG/6+8TU6Xmj2TwXlCjqMYVR6Z7edrHpMVfpoA=;
 b=kpls8kMV8zzd8+8KXfngp1ZsBtVTK9jdggu2tzELATyBX5kK6b/45YP8vIdNAPuoh/gURPXaW3VOkNH2JFUqou8DZAOhwsX954O4+DlxCU5T8r3pz+DjVwHh1Ih40FqvZ/oIj9oqhA4uCcdBDnw05vKQiZVeONBdnIMY/IobvxtAnWl49f5gtfjCrjMfHJkZBca+Do5nV4TxdkSe0RjFkcKF2IfQXvxbZWWOr0qa1k9G5kigd8H9kLvUu5+PNgGIejlATDt+BeHt0vNwcsaohnHL9qskKY2pkgwn8alTJmsZSZrtSN4NnwfXcBQQyNBWYKYaViUHbj1hsHDueaSvsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SA3PR11MB986170.namprd11.prod.outlook.com (2603:10b6:806:52d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 07:56:23 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:56:23 +0000
Message-ID: <b82f156b-debe-46f9-b7b4-6917d775cb2a@intel.com>
Date: Mon, 28 Sep 2026 09:56:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: platform: Simplify platform_device_alloc()
To: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
CC: <driver-core@lists.linux.dev>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
	<dawid.osuchowski@linux.intel.com>
References: <20260925093928.3765486-1-cezary.rojewski@intel.com>
 <arZrOu36s26e-mPq@fedora>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <arZrOu36s26e-mPq@fedora>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF0000097C.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::811) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SA3PR11MB986170:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ecb3d3d-7bce-4d4f-c441-08df1d35fd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mnxBmrd0Dtz2QubK1wrIhbbC5YbftCsT9nSqAfFQyns8DZAISil6UpI09DJ7iJF6m2Js4HsH7zDbNYQc1Dldutg9Ah9I2S4BktjU2wvet2rhkp1wl7wsV9PkB7FzAZdifLj2pjFqr0hy+ZLmftmf5Fa4ox4crxJYDOMwFp/6IDVgpt8zv6s6EINI9q0YdPQywQFQYdEEKtb1a6/sY1LdXCetcBHAXcDyh/fc/UP8ZjO2VA/p9DfKpS2VJ855/eHRS3V78AB3Jzy+O9KzXFloBlskfOwWvhLNwosHbDWG6MPyS7XCWx/4gGZhgepxk1g0d5O4zOHJff1FAa16qnuNVev4q2V3A6s+ms07/epdF6YA7mzzD+jkYegGk/fCJHtyrpfGdWI2N5XhAlVyBqR82nX0NpyAiOxV1smJwV7iRmKG90811mpW2x+yCWZZhOfodX9v3I1Ow1RPnfkK/QuPNZDD+aNGvMtbezjZ2t70ci80njRn3BnO2MuNpFraLkNcfY6UOS4YC+dGCSYhe7v0qRifBQTj/QjkHLKeSsk6Kj7g2MOQXDOAqiMwvK0pgjywBZ/QM6wbo0ldMP1SHO7D6M8ZS5Pf8NvLuAPqtbXRzOoCMw8XOEtdNqejhzbBRsy703jLCiCiavdNzVJ+Woth+mhP+tFLMPxFthHlWv5sBuk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVRiaTZHaXZwUkRVSUFVUE5hMUF5Y3V4Smo1YWdmQnk1dXhLOHoxMmhxaGNw?=
 =?utf-8?B?aFhMUFNGb0tPdE5FYkdRN2w0MVUxamhaaEdSVVJXa2QyanlXOUthVG9lMkV0?=
 =?utf-8?B?ZDJFb2FiajFhOGxHMEg3dVZ5UG55KzJqQkRyakFLOWhjN0xxaEsyeVVzWkl1?=
 =?utf-8?B?L2FjQXBSM2t5d3U4YzYzdFp3eEYvdHdFZDI5bXMyRnRxTzVWTkQ2aWdTaXly?=
 =?utf-8?B?YmJMWXIwdWZYVlZObnVJeWVLUHBIckdicC91WDJEN2JhNGlhb2FpVzVVMk4v?=
 =?utf-8?B?Q1MybGFZWnFac2NxeXdsRWZnWVlhMHZsdHAzZ1ZkWjJQWit0blYvNUZwNlZJ?=
 =?utf-8?B?WDJ1SFdSTEYrcVBVQjlFZG1ORkxZTk9Mc0NOT2VlYVlYeitERXd6SnZKV2dy?=
 =?utf-8?B?TkY0QXVrRldaVkZ3WEU3WjdSSm5hNE1yL1d1UkdEU3paUzcweUxWODN1THlz?=
 =?utf-8?B?UmlUcktYNkxkdzFOUityQ05WV3V5Y1lncWd3dG5zbFc4aEFJRFpmZWhmaFlN?=
 =?utf-8?B?WktWN3FvVjNLUW4zZ2tCYVNQSWhUc2tnbGVNNHNvUEo5OE5hYXduencwV3pE?=
 =?utf-8?B?RzhNTTVwNE1KRnJaRFVnNHo1Z3NlVkhjaEdKWFh4aDZFczNMS3ZYL2I2QTBT?=
 =?utf-8?B?dXdWN2t5NFBpcGJsNFVXWkY2bC9FbVM2di9aTUYwcmc1d0tFZ081VXF4TGRp?=
 =?utf-8?B?YUNwYzJxVWVlYmw3WVo3TldERVZ4dTJvUk94VGxldWljaUMzSE1MOHY5d3Vq?=
 =?utf-8?B?K0xqSGJkZ0FDNHVXTHp2UThSaGlxUDUrczFmWGZ1S0w1czJzdXRMMzFkUXRB?=
 =?utf-8?B?a1B0ZmczUEcxeE00OFh6RXJuNjdTdzNqSlFMTDVadDNMTzJvSjNHc1JiOXJO?=
 =?utf-8?B?dkoxMktWRE0yOExRZ0hjMUtJYm5tbzdlTTdpRUpSbzNWSnRYMFdtSGZFLzFu?=
 =?utf-8?B?dWw0UXBxelZCY3FXc2YxL1ZIK2NYMnB5cnl1dDVnVWtJeDlEL2VkZnlIQlNZ?=
 =?utf-8?B?RlA4bkFCQU9HdGFLR0c2TzYrWDdBU1ZWa0N6bnp5RHlieE53NTkzRHl4SWlL?=
 =?utf-8?B?WlV5WHA1ei95c2FUU3pDa21mRzBGS0c2STBBQ2Q5cFlNN1VKM0c2N251T2Zh?=
 =?utf-8?B?ZDMzSlJyVXh4VVV5SVV4Tmo2dUVYdUIxTHU0aU5HamRJQ1puOFJQeDExU2Yw?=
 =?utf-8?B?RFVEMU16NnpyMzdRSGo0RTJIUVJEbUgxQUVtY2tZU3VTeGlHR2ltbnNkWXpp?=
 =?utf-8?B?YlYyTThXcHQzNjdRT1ZpVGNZMEpvUFE1ck40OEdHVGxGd09hQ0djQlA1UkJF?=
 =?utf-8?B?WFIyTTJBQTF3Y0diRTFlOWZFelNEMnpFYnBqaCtQcUtlS25zQXQ1VVJWaVFV?=
 =?utf-8?B?bG5TKzJCVzR3OGpmZ09nbHhxWUYyU0YvVlpuVEtNc2VqRmlZWDFkWjE4Vmx6?=
 =?utf-8?B?TG9UMHc3bFU1Rmt4QUpqL0tZRGtXbWdBMjc0OXJwejVpbWRjQ01oY21aM3o4?=
 =?utf-8?B?SlN4RUFkYldkMm5INGxBbDQ0Wm1yL1VTNHZsbGlVbm8yTDNuaUQxRHA0cTJP?=
 =?utf-8?B?M2d5dHB5SkF1QXliN2FuVEUzckpNaGJYV0trWWdlWG9sMWFjUlF3SVhIMFBI?=
 =?utf-8?B?aWtXbzMrWCtxa2NYWjdibEpHQ2tRNThuTWsxVGdxTFdtdytGRlRaQndiU2c1?=
 =?utf-8?B?WGdVZzdOci8ydjBrLzlFV2NZUk13cXc4L2ZZUzhncVhZa2JMaUVjaGxjMFdH?=
 =?utf-8?B?NWNac3N5ZGRYNkthZXRBUDllOUh0SndETW93eTVzR0RhdW9WRXpHZFpMUzVI?=
 =?utf-8?B?b010cE1LYitMSkt5UFF6eUxwWGx5akdNTGFDODQwSVp3bDdLczlRQkJodGM1?=
 =?utf-8?B?MTdTL3diMGtacWdDVVlKMnRqWFRxdFlWVDFSbWluRzlRRnVrUDlQN2MrSTFR?=
 =?utf-8?B?VkhQSHZxRmZZVTI5SVJDZi8zR1kxYktLcGdxVDlPT3lZaHo2aGViVVZ3K3dG?=
 =?utf-8?B?a1h5WVdKVWhPdm5CdFlUekdma25pVkpTVmtXdmZHcTNES0RtZW1ZVDRBUUkz?=
 =?utf-8?B?VzgvRkl0cmlRd0dXOUZSVmtuc25vZ0F4UFZKdnpJb1ZyaTh2OVBuTG85K2VZ?=
 =?utf-8?B?VC9HNWJ6Szh2cWwvWHhvTVZDdWtpWkxyRTZUMEcwa0RJb2dzbkJ0dDN5bWg5?=
 =?utf-8?B?elJhWS8yaFhoN241RlE2MFQ1RmZ5R1YzYnJ4Ykc1Tk9RWUxxT2ZlQTJUSVYv?=
 =?utf-8?B?YTF3TUp4NFNGd3NWcXFkamxuRUNOa3VUOEZITmtadXo2MzNpeHg2bEFDMDRE?=
 =?utf-8?B?b0tLcU1sdTZQbGNZUW1iSW1YWmpDd2tDbGltelRqSndEems3S0FNbGpxQ2FC?=
 =?utf-8?Q?FSWkq42LyzoRT/70=3D?=
X-Exchange-RoutingPolicyChecked: m/f4TivMJz0mYr29wUS6a8J0TiTdkM2BYrVQibrr3kE10BjMnCDtNik2dGusjClHqZtTbj7F/i0rJ4l9je7yq/lY8EBSIyv4OB5a815eiN82FcFP+Ajv4JdEZeq1oC0EZB7UowNAkPQkj3r9QzuhA0IKB3dfa7zK2P4IgPhoj5TOIkbBrcGZIkFFCzjlBWmQfBZC+viGpcMdKIdLhosJF3FrffEbcy7ODaKW+3ozAA7P9GMhmtv1Q73GI5dVWFBic5MRGanokMpJ3NM5sGH+zq5xD2VBqkixUxEJQy5IrqJCmEAGfowqyyFpM+VF7yaaW+qKgOEmEC+TLo/TCi38GA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecb3d3d-7bce-4d4f-c441-08df1d35fd2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 07:56:23.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iac7vn9E5Jv+gLt8e4hS04/v4m3/kf6PKAPGf3biossMa41lDNdPU6lcnW/FT3bGTB0akB+cs/xTjig3ZMXdtrQt4bY5KzCpBLdI/pIF6gY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB986170
X-OriginatorOrg: intel.com

On 9/25/2026 2:38 PM, Vishal Moola (Fractile) wrote:
> On Fri, Sep 25, 2026 at 11:39:28AM +0200, Cezary Rojewski wrote:
>> There is no need to double check the 'pa' object.
>>
>> Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> Minor nit: The commit message could be more descriptive (i.e. something
> like "Check whether platform_object allocation failed once instead of
> checking for success twice"). Although I imagine compilers are smart
> enough to avoid double checking anyway (I haven't looked at the
> generated code myself).
> 
> Either way the new code is more readable, so LGTM.
> 
> Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>


Thank you for the review. Given the current AI era, I tend to leave very
straight-forward messages in contrast.

And yes, I believe the compiler would optimize this out anyway but the
readability is the key benefit here.

Kind regards,
Czarek
