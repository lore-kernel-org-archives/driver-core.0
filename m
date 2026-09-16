Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B883ACF17
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 01:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789522493; cv=fail; b=XwE0k3rREkyAO8RApwIJ58S1ScpNuW12atugx4BqPbX7LDhLNCbZnV8uZeL3ES7uzITRDOC4eEgJ/GR9M+RE8BaNykYJ5DvK9GRQ3NzbVfXNyN8GXwFveeydBE5ZZVbVIYQtsXTPXhOBmNFQjWEUpjurZq5+xSXercjyayQwWco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789522493; c=relaxed/simple;
	bh=7yhLYzLiWtQw6InsVT7sC5vEFgErz8e8Aq79GGgwTFM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dwKqlnmMjXBGgDenNkswyauVlVWl0UHaNA0SBffhtPeULB+7L1dJ2zZyYa2sTucWBrFeJJZjkwPsITSs/NI+gMtVWDYsSoS9JqAVe/4kKiinhOgN0lLkcaBk4trpT4+aU2nNNYGePbi36APjPCtQ+DSHAdgYiugr9CsLONpOl88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBA1FRrO; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBA1FRrO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789522490; x=1821058490;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7yhLYzLiWtQw6InsVT7sC5vEFgErz8e8Aq79GGgwTFM=;
  b=aBA1FRrOIxCNMCd2gQNaGs/pVvLNGjlFyzLY75T7ZVGroZK1ScwLdTlG
   Z6B2ShFnKSBHkreqiGw1SEBULfhSUChQvktHM8vyviWl7XTh/c2g2bHkM
   lNCL/Srmd0CXBZCkTNHQOMdGnQ2+ZAzKVYNAWlL1ULYLuFlZRyr810uwV
   zd0kSWqKP4yFFbsinjkyLVqsN2fWfEQHtX/fPJve1w+UExn8KpXwW+TOh
   fhQBzQ/ly7T2fno5bHkuocKIs+WVDRqs64RbnQv+pJsOutDi/4GiJLVYx
   yNxX7vM0RgKNUhpTRuetHXro8NZzcmuf3qDKpLTREHe8GuLoKSnR8M6HE
   w==;
X-CSE-ConnectionGUID: HyJJWceWTSaCv+vgxWR7lg==
X-CSE-MsgGUID: WYaMBmysSBGF28Cmvv1MDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89654912"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89654912"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 18:34:47 -0700
X-CSE-ConnectionGUID: AFqbcRRuTjCvaMtO9fDImg==
X-CSE-MsgGUID: K/yhXFd0TIeJ7AyUZ+f6bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273148864"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 18:34:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 18:34:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 18:34:46 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 18:34:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDaSiXT0MgEdCYh6R5hSwUVE+OsB8VTU8n1vVFG2vqSJKXIiSsJn7iow2GCjCQ0nJUpIKhVNiOvVawoJ914iEYzZSmaT3IItDT1hleBy8jc3HcS/TJ7GvZB/pyc5j7my8Nb4cSbqL16X/S7RTY1/Sn98Uo1m9JSX/ozGLgiklA3n/k9FWvjh6ccsyvuiGEV1Zrh8VCwox7DkuRJQd5oxhoW4DtTGM1yQy+hBw50z77GBuEUztMS0AYp9Bm7kepKWJZXQrhyHf8XrqifrOhzxpdZDC9Xx+4KMaRhEuOIRXY7XuvpMRqkM3sJVNzcTCkY2OGc5A2gBc46ucF5rUZyKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cKq4GNvS6/iShiTOudkvSl+xkxbkxIFzftI2ck1pxU=;
 b=opE37wMtaOLx06B5E6IhMRfz+Ry+GZ3ygkp677GEU49/f4JtavgsYI+bxwbrPbSs4cuGsJ6NKrIBm+C5BFISzKTBijzmYKBrY60VI5f/Qe0NT8oJWYTar7G/pGauD5SIV9U0rjyPIUJccVSkhWkVfoEZHu+IfWo4T+o3+kFgoIP/NmiFvD9tfmvQ9BFs/yu1NA43j+PO0hHoPnvZrEgj6OtAwK5YckT27EWMU2ltsnZok2G/pW9Wt0M0f2JmlFtDUYA0olP3LWGM5qkV7l9U6mU09v2eLH3jGeNH+jv3P/Z9Zt2oXuoxVoVMRAW3J4X7dOsaPi70k/s97/gE48Ws5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS4PR11MB349881.namprd11.prod.outlook.com (2603:10b6:8:514::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 01:34:43 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 01:34:43 +0000
Message-ID: <f0283779-63e3-455b-8d2b-147bf77a73fa@intel.com>
Date: Wed, 16 Sep 2026 09:34:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/cache: Refresh LLC capacity across CPU hotplug
To: Davi Chaves Azevedo <davichazbh@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Valentin Schneider
	<vschneid@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Tim Chen <tim.c.chen@linux.intel.com>, <chen.yu@linux.dev>,
	<driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<kprateek.nayak@amd.com>
References: <20260911220229.1368887-1-davichazbh@gmail.com>
 <20260915175714.2015751-1-davichazbh@gmail.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260915175714.2015751-1-davichazbh@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS4PR11MB349881:EE_
X-MS-Office365-Filtering-Correlation-Id: 656823c4-ecf1-4dd7-b969-08df1392aeda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 0dlJ+8IQ9cLlbRcpy6SQaWGah967HQAoRZzEvOoqurHXutU9ESZwioZvd2JPxrCzx3GGZaR3vj8WSrRWQWrgDsnHBQA9Wfh14hxWDfqZR3iukE8BDZW3RjH95lH/t9R2EzK0+gLswIY56s0tfeQ/Fh9Qb+AP0WVjA5euSWNUvHzdrZJYoIxvEEGUnehd6eKkoM/Im/ZwDAEIKtDIES9gQnsPjP4QJUrR3MX/fxzC8iWq17PhNpqGBgYD6VbvDS3Bh8sv8AWTTFLkUmef3V0F5lXowmQ+hMtIKIEODdVUygcOfGgEuMUyj9bD/+5+D3ao+wviYYupJ9BK1RilEF//6L/gYS0GzQHbzSOg5TDcflvPtVCAdvx2mGWrDnJJAXrR9HCUoF44jH3+xrNmYKtzEG0yMnkhhz/OlpkgFZCCFuqll/bUSjYXmu5K/pnYY0D+sjJbZUnbFdff/UPOyzehDIeYK7XAusfiTwIY4jxwkK2l1d7WDe6ipb97IOyoCPIcl7GlO5HhUxGpQEjlDLtB4J+9ViSr4qtaCm2IWdzp2fyRquMn9boBK+rJdDcyqanUkj0HljkDqolVK9r/3UOYZy5p+CkBce5ejQmfG48gCfU6azyje/4CQohsHn/1B5qZrWaoJhi4g2lHsPLbCXRv8ToolJ/AVJ6jWzekY2WfSgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEdOdkR3SjdDSEJmOFIwVVJWai9tVkNyd21IOXR2c1FKOGpuREJFZnU3VGNw?=
 =?utf-8?B?QzdEOWtQQkg5Mk1GdUV6NEtBck5rYkVVbHplRWswNEhINDY3UzQ4T0dnTkYr?=
 =?utf-8?B?OU5TRjQwWkw1ZnlYNHFlS1JOQmJWNHJENjcwY2d5cnJieG0vcndLMGo1NDVz?=
 =?utf-8?B?elpnV3g2TDY5VTA1ZlBJaTBieUNyY1d0ZW4vNWtuNmt4M2pjOW9WeWZWb0J2?=
 =?utf-8?B?M28rOTRMKytxSjh1VnNPOXlvV0paUDV2c2o0dWRINFUvaVpJZVd3UTY3VDh1?=
 =?utf-8?B?bTRmcWdKeFNZdEUzak90dUY0YU1CdVpySlI5b0dldGdLUnVEbExjQWtBVVBJ?=
 =?utf-8?B?S2o4OGVCSjBHZEpqVm9sZEpnUk0xVnFQdEUwSXdqTzRiZXByeWNEN1Joa1ov?=
 =?utf-8?B?Szl4Q294RjFyZDdEZE05amNodTBrcGNQd0IrK0xCRlgwSVJzejVsb3gvV1NI?=
 =?utf-8?B?ZXFEQjE5Vmd6S0lpcXRhYTdxVy9kNXovaTlGdi92bWg2bFJtTnYvdFl6d0lN?=
 =?utf-8?B?ZjlDTVQwL0MyOEwzbTZCU3NUM3B2ei8vVk1iSEp6WEJva0NjVUZQNENOK3VQ?=
 =?utf-8?B?R3VaYTNKRVRUSlBlcFRpeTVoVWpSNHlMd3dFcWY2ZVZ5S1VCVW9FaFFMK0pp?=
 =?utf-8?B?Y3JaV2krSzJLSW1mL1JhcngycitrdHdLZTFXYXJ1V3ZDR09TUWtqNytNZFRL?=
 =?utf-8?B?b0FFMHNXVnk0dkMxNDF2UlQvaTFDM0lyTU03NWFwRXZWRWxPMG9sdExmemFF?=
 =?utf-8?B?dkIzUURtSm5TalFWdlg2WW1CMFh0M3BFbit5OWpER0hKWkJDK0p6ME40OFZM?=
 =?utf-8?B?OGpWeHdVejhqT0hEaVh3Z3R2ZkRWZlNMZFJ5YTF6WUVrUG5NVmpBVTdxRzR2?=
 =?utf-8?B?YXhQR2pad2VFbCs1dHVCUlFmZ1g3QjVid09GYk1ZNlN6OEZYWWhLNiszeFlm?=
 =?utf-8?B?M1huSW1yTHV6QUl2eWtUYjd1N1E0bDZqbERoeWtuM2lKbXZMVTJUd1ZoT05W?=
 =?utf-8?B?M05aL3VaaFYrNFhxREVqbTRpT29hZkhnSlVWU0FtZUZaQmJNd0pvV2FZNjgv?=
 =?utf-8?B?VW95dU14Q1NoRUpuVkdCQ25kN3dlRlVDOTJiYnZEYXFyQVJ6RXpQOHJ0T09p?=
 =?utf-8?B?S2RwTzFQbGk1cHZGVjRHbU93aERMQzZjellNbUpxM3FYSEcxRmdVRnd1ekpi?=
 =?utf-8?B?MGpXQVA1clVMWjRacXdtRG5NbVhUQnkrdHFNdUhySkpaUUd0d1l2VEFLV3NQ?=
 =?utf-8?B?dUhpQjdQYW1VZDM3QXpnbzUyc0pXYXJzVkdrTU5HdmlCYThOZnI4WEFjeDNs?=
 =?utf-8?B?WC9YR0twRFhRcG54YWsxZEhTQ2QvUW5KNmdmejBHRW90WjBzNUc5eUg5a2hC?=
 =?utf-8?B?bi9mTHBmTVdPdE9JRGlDNTBveUVXM05jV2dQTEJnREduS210enJWQTlNc1lR?=
 =?utf-8?B?czZGbWhSdUlnTm9RMkxNd3ZkTjVySTNsWUZwTkl6a3B2aW5oT0xPMjVBd0pG?=
 =?utf-8?B?V3BUSGZzUldtbDcxMktaL3dDWkNPUmpXSG16UjhZek5uL0NZVUlFWEp1RnBr?=
 =?utf-8?B?dWFUdmxiUHhTb1dKZlB2K3kxRVZmMmxXM0RCd2l1MW1IZFNXVTFXVkZUZHlB?=
 =?utf-8?B?WWNBOXVhNDAzQTcxR2ROL0dORUdIMEwvYnJIOFQ1Ny9QWW5PaVBKekRlWCtM?=
 =?utf-8?B?TVVESVpObkJqM3FySkdLV0RrVERaNDk5SmZVamtGUWZuVE8yZTRiVk5TWmw2?=
 =?utf-8?B?UW02MHA4Rmo3WFNUOXpkenUvcjl2M1lBK0NyRHZYWG05cVlBRXVsRjZPcFY2?=
 =?utf-8?B?NWd5eHJma2tsZElRa0phQjY3bWJzOFdodyszTTkwWmMvbXluMGxqWW4ydksr?=
 =?utf-8?B?b3lUZHRjTzFML1JUWjVGZzNtVmc2amF4VVE1UW9kK2JPMTh4K25RMlM1MThV?=
 =?utf-8?B?U1BsRzc5MXFIYmtSdllGV0xSd255VUpzOU1jQW1rU2JtV2cwcjQ3ZUtTN0tW?=
 =?utf-8?B?T2c3MHRJbGJEZ2FIVjFNQUY2RjY4VmRwalRLWi93M1BVYkh1WWNQblhFMVVY?=
 =?utf-8?B?a0REaHNqWGVIcm56TXZTUEs2UHVuNVpTSS91UCt2RGxsM3pNa1lOMURJVlkr?=
 =?utf-8?B?Y3VzOXBkMm1EL1pRTUxPdzJGOERHZXBzSmFoYmhlUmZ1RER1OFNlYVJuTU40?=
 =?utf-8?B?VmxPVEJOSHNhRnhDRE1ZNG5iUkU1engxSlV6SzJWcjFHYjdQbUxHdlQyY0JR?=
 =?utf-8?B?TCtQWkhHY0ZxU2hQRDk1TkdzRFJXclFNMmUwQWV2RmVxZUVPZG95bDVKUWtB?=
 =?utf-8?B?ZzlkTDA2bDY2TG1KVlBETTBxYlpPUnVhMGVWaGxXdGlQSGFTSThkUT09?=
X-Exchange-RoutingPolicyChecked: BOcPzm6kpsgg9ckD0dg6RgUhggtDY7vtMYe/HAM7iFEC7m/ggkl7RKvFK4l/W/a67T0L4Byy66p1klJkQkNlz9fLiaLUpho+SRh+dIGjDoO45dlHOthKCgvJt2ZcXASjEftgtoF0twm/l8Nntf3Bqf2WWJNuxhlxg5p809BaLhzJwBkE5Xg/XLEn5TdBGKq/IcmRtnAfkTxCWyDnauznQblqfTW6POZF9vkXYCHRjMkCRfqeJSMsqyxmZQpPfHipkKLXvY0tmA9kuo5rht+8fCRqn5h0HYYzpdhmOppdWMEPzamDI/0obRTLmv+mkFYZkOUH7M0VvZB7O+PzUfumAg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 656823c4-ecf1-4dd7-b969-08df1392aeda
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 01:34:43.2745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsVCZ4yBk+Mwb4K/429/Gl43GYPeWWfGgYfjskoal+bsI48THwXSNGHyGJXkg1IOn+q5gsakQq79KJlGh/t6Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB349881
X-OriginatorOrg: intel.com

On 9/16/2026 1:57 AM, Davi Chaves Azevedo wrote:
> Hi Prateek,
> 
> 
> 
> Thanks for the review and testing. I've added both tags to my local patch,
> 
> with no code changes.
> 
> 
> 
> Tim, may I include your Reviewed-by? Chenyu, may I include your Tested-by
> 
> for the Ryzen and Xeon checks you reported too?
> 

Sure,
Tested-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu

> 
> 
> Thanks,
> 
> Davi
