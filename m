Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED548A2B1
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 18:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151101; cv=fail; b=vFV7WqpWJlvNI0oY4p1aDujeanqxnkk4lqhGKYgjog8PYV3Is5c4/Nc08470Awx6y96h3R/71PggDWmu7deLlN/m33hqbQIAdOAlef3Nhm8GIAVUxE46mFcgp2wa4TkX4HIPCSMLtA+9zcURz+kjblbYKtersiyk1Ji5uP9+b/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151101; c=relaxed/simple;
	bh=hRzUKpM5If+WKL+T7QSkfVTGPRcaZhySMUf1bNGAYZ4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p6CCFIE8Ph+othB+gYvGYCQT4JSgX0jJUKHvydwe7lRkgmHFGsjiJXKu0CokVfn1RrM27WdR5iVgE36JdgaM+DwfZd7dIs0e95QUHM92jMkKoidXY19dZpqnfN1pkGwiS1+ds5/FTQ7h7K4frVWcAiQlo+MjMRw695ZI6ThB/4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IcizSlzI; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IcizSlzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789151099; x=1820687099;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hRzUKpM5If+WKL+T7QSkfVTGPRcaZhySMUf1bNGAYZ4=;
  b=IcizSlzIT4mgwNNQizOqajRPnZKpHxhJO+Uoc0MCJcGBl8XEGcrVa6u6
   phpysTc+7NlZ1RZK4UfQMQo34rbpN+S+uzBE7dDiSxeU1/pxqg6tDjxOP
   cgoRKTzynf9H3pTBnfC3hXRGJL4asAGWS8QxNezX2aZGofE1jyOJpIoCt
   yc0AcQNpCmMiY+IKovY5O/wohlHIJN5W6OjPE4lQbXAgLedksuHmh136S
   ZJmE5qvWNYrXHZtMitBpDo4Cz9yEALnlqU0wlKh6WM7WOKAefvcEfjZyA
   tVMtLd+Du4Oa3jN35LxLT5N4PV5hnCWeVklc6+Zpc51GLMWU2auBDaRyW
   Q==;
X-CSE-ConnectionGUID: 7lUW3CulS2WfGNVnNzQzGQ==
X-CSE-MsgGUID: jliO1tmhSGqm2OFVQ3f1jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="93446904"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93446904"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:24:59 -0700
X-CSE-ConnectionGUID: E0jSXLEBQHqKtfgJ+sA0LA==
X-CSE-MsgGUID: aaCi5sufSNi6Kyt7dGchZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="267699488"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:24:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 11:24:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 11:24:58 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 11:24:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxpxVc1akaG9BqWl8oHuoGkTghBdR5VO9R/OW1o8nQyzPuDomk755gBNAm7Ka2foxBvBmpHnansRKQ0+X+Rpvr893lGAvJrYltrqOnO7p2cWb5z1tbK/W/lrPgdqE9HG/e4Kss9y7Igq05L4qEEO+0TxhJMshq5D3fSceJunfFMSEFJUFAIisAWe55TRdZI++9eTKxE6RzqaBc5+wZR9Chtiv96C9a0fuDu0lu7DodcggA7ZdvEZREQ8H6hHE/Lx2eSKtPRhznxbo0aZYsK4AwFi5M/RS0DImn5Msx50U22rIgty2LSvFpM0mFm2vL2QwRPacT3u8b7D4G+CGEfFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TA9/k8ye7E8vo+3KDvVXaaMdhCSt1AIgVZxsNChQw3k=;
 b=wKu1XkA/XVufNxE+3qknnnLGOVoruE1w4wyEYR1S00QbX1tVfew3TzflYDbpan5AYdaKBq+XEOlLKNcEKpuQ7pv5xGqZQ1pOCTJ+Vx+OW5xmANjiPE8k0gLa15vF1CSCumNCdkCcvcsRvFFedmxIKPZXlohn0UIuUx9/J8EXN9XjsnciffcOHEys8yzSdRaZ8JVwR235W/t7al2E1E9hpBj9gs+5ciXJjjPTP0rtvCi11Xa8+/Wjc/OfzY0P8V9ZF2Qrz3LlZ3L/TIcieVfCvPu1wlf7QmtNT6oYNtUERliX8I3tbX6OJHC9UCxb7OdTv8mCDCUX1L8sTTA71P3jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN2PR11MB4694.namprd11.prod.outlook.com (2603:10b6:208:266::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Fri, 11 Sep 2026 18:24:50 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 18:24:49 +0000
Message-ID: <a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com>
Date: Sat, 12 Sep 2026 02:24:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/cache: Refresh LLC capacity across CPU hotplug
To: Davi Chaves Azevedo <davichazbh@gmail.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, "K
 Prateek Nayak" <kprateek.nayak@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	"Danilo Krummrich" <dakr@kernel.org>, <driver-core@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Tim Chen <tim.c.chen@linux.intel.com>,
	"chen.yu@linux.dev" <chen.yu@linux.dev>
References: <20260911134825.420748-1-davichazbh@gmail.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260911134825.420748-1-davichazbh@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KU2P306CA0015.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:14::10) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN2PR11MB4694:EE_
X-MS-Office365-Filtering-Correlation-Id: ca8cef3d-fdfd-4457-2666-08df1031f71a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 2Ly3bZSW4yW0WoehaMM/BuQwM8c2D0BHvDnwNdnma4RpE5LTT50dARILpMetI1y6xS1WHQ5we7Xh/9yflYxN0v8lcHrMFmGNspiPvqYeN5cfeLAiN+Hbm7nf7z84L69ACH1APllXk9PVDFEZUrDNHQe7cJ5L2kS3wOcP8F39RiUCNtwAQfklFPY41mSjHnojav9DaP7nDl2dmn62PWy/qMoaQ+rggs9zAt1npyjG8GnpBw+DHWAPPFf9SpPMuUFNNzdmH7GT2HfqSBCMQbpZKgOvCGVg4lMa4A7bRsx3UwXbW4SwVxFeiznZdvMEmqI1UOLXjMEAWEevBIUTuoitjUrrRqHVfTyELpT9SlMqHyVXLHi1MX0Zwefvwhnz13J0sv/pQ2QApDlo03RGKGzHNib1Inr/xXqZhCqbCz5dYAutxe6YjKXJWQbEB0ZrSAXugo9bojGyrgPUrX4TOGmR5Mz5nYTX8L6ggjeek5pKGh6pj+ZjtUBHkJcCvwQYFS3kibKhnhaDs0IKkozwE7BXwnYQGM5Dl1bpTON9QRjJ5Y0gpHBfSEbLqt6OPic0+T57O7ekaP+kdNTX/rjv9jWjzugPKdH3xtBxaMjunzS1WfQsJwtkKBEpP3u57V0ZtFZG/ThX75Nrc9B4Lh5UBQpah2QVAAOrd3mcLRFdw0PRcV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGZWbkE0UkJET0dwcHh3UFNPb0xBQmZ5UzBUSi9vZFYwUHZobWhRbEJWVjBR?=
 =?utf-8?B?ZUZjSGpzMmxrSVkza21ZZGdrZlJ2NjNRdk9ZM2ZWdDJwRGZuSlVBTUJEZU1N?=
 =?utf-8?B?RDdZbEJPZFk1VTJ4SVlaSHY2NjIrYWhiSHJleHVUN1FQVS9zZERpd0JLczhl?=
 =?utf-8?B?bGtab0FOY3RLWUYzQWgwTGRpa0oxVFBhQ1RCTDlpaFE0MVRkb1FLVUxRY2pv?=
 =?utf-8?B?bHBTc2pubXEwMGh1TWFNSG81ZGJHdGJ4aUh0YUFVSHd4YVJHMmhMVXh0dnh6?=
 =?utf-8?B?NXFTbEVYYXk5dHZYai84S0p1OERYMVI5c3NWZHB0TVp0OHcrYkk2dkZnbWt0?=
 =?utf-8?B?ZUhVdzVLQU1GQmhvalNjc3M5bFZqdlljaXA1cnVYLzhsZ2tjTzh5T1NicjJN?=
 =?utf-8?B?L01YdkRsSEJPbzBUWmV4dDBGZDNDalM4MzdDS1hNMzNBUSttMktVbk85ZkRp?=
 =?utf-8?B?bFovWktXc2lqRW1EUzNIaExneVBwamE1OHFaT3F1czdVZ3JtTWZoaTBHSGpC?=
 =?utf-8?B?WDAydzM3ZjVWaCsyNzhUbndaYUI5WEtyWmZwM2xLbFNaYzZkU09yMGhGcm1U?=
 =?utf-8?B?OWJyQmVQc2dRL0tNRGp4WW01eG42WjNrSlZ4STVGQldSdXBJaTliQ3BBRVpD?=
 =?utf-8?B?d2NnR25uejRMcjRiYjJQaXNvcFZ6VmtmUjF1WEd3VERDNlkxNU1IYnl3VlJT?=
 =?utf-8?B?WUsxdjBYcDlzZm52SzhlZGlLYm1XM1FDOTk4cGU4blFoMHlPbXJDUWJmdWVD?=
 =?utf-8?B?ZS9rWXBZZ1ZEYzZMNEI4aW93c0tRaGRHdE1Uem83M3ZnTW1ocEV5SVFqQnlL?=
 =?utf-8?B?RVEwY3NUcy80ZmpYQlc4dU4vK0cxcHUrVGNsNWVYSUQ2eEVuam5jUW5nWkVN?=
 =?utf-8?B?OEVhMWt2d2MwYW5SRmcyQ3RRZFNic2ttdDh1eU9iR2NLdkpWQkpxTWpkQ0dO?=
 =?utf-8?B?RUtyV0VLMXZ4Y3cwZFdzRXZQYVZqc0NyUk9Ta2IwTUFFTUdNT29wek5qR24v?=
 =?utf-8?B?MFZjRjhJZWpyVkJaVGh2MmpoNWM4NmdNNHM0OU5kOHZ2NFc2Vm9KQkhidXBv?=
 =?utf-8?B?UmRmRWNiS3FxR2FadWJuUC9raWp3azI1RC9lK1B4RW1jSk9YdTNvUWNwSzc4?=
 =?utf-8?B?dWs0aFFQSTdXN2pmUW8wS2tJb2hLemdlOExTL2lJZEhxdGwxTTZWb2VYdXNE?=
 =?utf-8?B?V0FVNXMzUDNVNTU3WlVqalRJT0Vic0Z1Qm42Zk5EdDkrb0lyOVB1S21Fa1Z6?=
 =?utf-8?B?RksvTnpId09pWnFYNkkwOTE2NkJPWUlRVlZ5VEg3VUx3c3JYY1o5MUFscGNV?=
 =?utf-8?B?VHB5bUcrNmdsMFpWQkZmQTl0WkJydStQaDdpekx6TitlRzJnV25ZUjFYL1JD?=
 =?utf-8?B?dDhLeTV0RVJwazBEU2xWZDNLSW5uSmwxakE3SGZqT0dGYXlzZEEwdDlyU3A5?=
 =?utf-8?B?bGw4YjllNWRlYTl6VXp6WjdPWjlHWHJjU3g4bXg1d1ZmL3ozYVhKZm5LYWtm?=
 =?utf-8?B?b3Rtb0x1SGI1QmYzVmYrRFZLeW1vYXREcm96ZndERDJxNDNYRGl2TFVnTE5k?=
 =?utf-8?B?MENiU2hzRitJcVNKWk9rK3YxaXI4QVIxbmJ5dWNRbHB5eGNJNHhOdzRPWGpy?=
 =?utf-8?B?S3R5b3kvTGx2SEk4NjJ3b0hZeVhicGpMbEx4NVFZbU9nTzNRVHN6NEo5SzIr?=
 =?utf-8?B?bFRrdnN1cUVzQlIwNVpFcW5ROHo1WWNiQmliTm8zV1VmNC9JY2FPd2lES3hi?=
 =?utf-8?B?cUtDNXJtSnVhWWRmWFR3Tk8vMTQzUU5wdGdzRFhWWCtkMTM2OGZXKzBkbWdm?=
 =?utf-8?B?clU1RlZXRmxtZHZ6N0hGbXRtNDA4dkt1ZVJtaE9jcjI1VDRkdkYra3lReWp6?=
 =?utf-8?B?WktpRkxlUndlSEhtT3RRWmVobzR0RTdCODRTbzB2VVNMd1IvUTJ1dzM0L1NM?=
 =?utf-8?B?NVAvaTYzWEE0Q2w0UTRGWVlpOEsvMFJreHhZNTJ5L3oxdU55dWs2aWlOQ1g5?=
 =?utf-8?B?WmF6bEQ1TDlpUzRhbVpWR0Y4OUNsa0pwUi9STWN5cE5UcDV5U1NSUjlFZVlm?=
 =?utf-8?B?U0JxTllUSkV5amxyamVBRmVjZkk1MFAyQ3huNVVrSFZBL2tzcDhDWU1WZkZm?=
 =?utf-8?B?SThBZ3hLWjkrTkYrc0daNWxqc2xBTXVJZklOYTUzOW5sM3JRM3FHclp0VzNq?=
 =?utf-8?B?RzBmSFlJQlVsMmFYd2pXM2ExWFpKeTFQRFVVNFR3NW4xTTNPYTVGdkNGcjFB?=
 =?utf-8?B?ajk5YWYxNGlYaWZIWjd0YSttNjZLeHZiNzhpa05BZEZ0SnVYUm5iZWIwYmpC?=
 =?utf-8?B?M3kvN0g0SWc4ZWliNTh3SjVFMGh4eU5VUzRIT3pONm5iNEFBYXNyZz09?=
X-Exchange-RoutingPolicyChecked: XxpYW0w/Nhw9dGWbVi+WrgJmPGj6mJeqEIdqBPC3pG4QSPB8FOmIS8j7hlZ66xa6KoKVX0fHGCxEmCMpwL4oyxUCS61qynq0fpzhoYSzlXjPfSyGwIH6sePgs9zEdqcC2EBp2NFYOKeznTxyzbXr7mPN66G3WXgcGcY4YxcDWvQBpJQ9yANqKJcAxeRKW5NzVS03bjyyc7xKj4EayZ4By1UciOWYWamHY0Nwy/jIyi85jLFRKXA2nx6d4u5azuhDlll0T40BMo7WxJgzeADpnQQYqmaxd5Ksd9cwNJmO3wNDg5Tanv87LGNQ0HkLhdg6+roxW43M+lNlq7HigyMzAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8cef3d-fdfd-4457-2666-08df1031f71a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:24:49.6394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wd59wY+m2mTSGMdFlSiPH8tx9FMilH3DJb5VfuNLu+GKGQul3Dj3xNaC2fiAgqrTZRdgPSITTBKT7parOv7r+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4694
X-OriginatorOrg: intel.com

Hi Davi,

On 9/11/2026 9:48 PM, Davi Chaves Azevedo wrote:
> The scheduler scales LLC capacity by the fraction of cache-sharing CPUs
> covered by a domain:
> 
>    llc_bytes = cache_size * span_weight / shared_weight
> 
> During CPU teardown, sched_cpu_deactivate() rebuilds scheduler domains
> before cacheinfo_cpu_pre_down() removes the CPU from shared_cpu_map. The
> new domains therefore use the old sharing weight. The later call to
> sched_update_llc_bytes() looks up the departing CPU's sd_llc, which has
> already been detached, and returns without correcting the surviving CPUs.
> 
> On a Ryzen 5 7535U with twelve logical CPUs sharing a 16 MiB LLC,
> offlining one SMT sibling left the remaining CPUs with:
> 
>    llc_bytes = floor(16777216 * 11 / 12) = 15379114 bytes
> 
> The correct capacity is still 16777216 bytes. On systems with active
> cache-aware scheduling, an underestimated capacity can cause
> exceed_llc_capacity() to reject aggregation for a process whose footprint
> would fit. Unchanged cpuset partitions sharing the physical cache can
> also retain stale capacity when a CPU comes online in another partition.
> 

Ah right, thanks very much for catching this. The current 
sched_update_llc_bytes()
only considers the bootup sequence for build_sched_domains() and 
cacheinfo_cpu_online(),
but misses the runtime CPU hotplug scenario, where it incorrectly 
ignores all the surviving
CPUs due to an offline CPU.

> Pass the cache-sharing mask already retained by cacheinfo to the
> scheduler update. Refresh every surviving CPU using its own LLC domain
> so that each partition receives the correct share. This also preserves
> the correction needed as cache-sharing maps grow during boot.
> 
> Keep the existing CPU-hotplug and scheduler-domain synchronization. The
> update remains on the hotplug path; no steady-state scheduling operation
> or persistent allocation is added.
> 
> Fixes: 7030513a0877 ("sched/cache: Calculate the LLC size and store it in sched_domain")
> Signed-off-by: Davi Chaves Azevedo <davichazbh@gmail.com>
> ---
> The issue was identified by tracing the scheduler/cacheinfo teardown
> ordering, then checking live llc_bytes values using the running kernel's
> BTF layout and /proc/kcore.
> 
> Validation:
>    - Reproduced the stale value on 7.2.3-arch1-3 on the Ryzen system above.
>      The patched kernel retained 16777216 bytes on every surviving CPU.
>    - Ten SMT-thread and ten whole-core hotplug cycles passed on the patched
>      kernel, including capacity checks after each removal and restoration.
>      The existing limited CPU-hotplug selftest also passed.
>    - Source-level state fixtures: five failures in eight scenarios before
>      the fix, eight passes after it. These cover partition changes, unequal
>      spans, sparse CPU IDs and boot-time map growth, but not concurrency.
>    - Full x86-64 baseline and patched bzImage/modules builds passed with
>      matched configs apart from LOCALVERSION. Focused ARM64, x86 without
>      CONFIG_SCHED_CACHE, and x86 UP builds also passed.
> 
> This host has only one LLC, so the live checks establish the accounting
> correction, not an aggregation speedup. No controlled same-version
> performance comparison or multi-LLC hardware result is claimed.
> 
>   drivers/base/cacheinfo.c       | 11 ++++++-----
>   include/linux/sched/topology.h |  4 ++--
>   kernel/sched/topology.c        | 27 ++++++++++++---------------
>   3 files changed, 20 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 9f9c72727a05..7a47a392568a 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -1040,9 +1040,10 @@ static int cacheinfo_cpu_online(unsigned int cpu)
>   	rc = cache_add_dev(cpu);
>   	if (rc)
>   		goto err;
> -	if (cpu_map_shared_cache(true, cpu, &cpu_map))
> +	if (cpu_map_shared_cache(true, cpu, &cpu_map)) {
>   		update_per_cpu_data_slice_size(true, cpu, cpu_map);
> -	sched_update_llc_bytes(cpu);
> +		sched_update_llc_bytes(cpu_map);
> +	}
>   	return 0;
>   err:
>   	free_cache_attributes(cpu);
> @@ -1059,10 +1060,10 @@ static int cacheinfo_cpu_pre_down(unsigned int cpu)
>   		cpu_cache_sysfs_exit(cpu);
>   
>   	free_cache_attributes(cpu);
> -	if (nr_shared > 1)
> +	if (nr_shared > 1) {
>   		update_per_cpu_data_slice_size(false, cpu, cpu_map);
> -
> -	sched_update_llc_bytes(cpu);
> +		sched_update_llc_bytes(cpu_map);
> +	}
>   
>   	return 0;
>   }
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index b5d9d7c2b8ad..f96812d71c51 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -281,9 +281,9 @@ static inline int task_node(const struct task_struct *p)
>   }
>   
>   #ifdef CONFIG_SCHED_CACHE
> -extern void sched_update_llc_bytes(unsigned int cpu);
> +extern void sched_update_llc_bytes(const struct cpumask *cpus);
>   #else
> -static inline void sched_update_llc_bytes(unsigned int cpu) { }
> +static inline void sched_update_llc_bytes(const struct cpumask *cpus) { }
>   #endif
>   
>   #endif /* _LINUX_SCHED_TOPOLOGY_H */
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 0248227d983a..a10eecc49d51 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -985,8 +985,8 @@ void sched_cache_active_set(void)
>   }
>   
>   /*
> - * Update the bottom sched_domain's llc_bytes for @cpu and all its
> - * LLC siblings. Called from cacheinfo_cpu_online() or
> + * Update the bottom sched_domain's llc_bytes for @cpus sharing a physical
> + * LLC. Called from cacheinfo_cpu_online() or
>    * cacheinfo_cpu_pre_down() with cpu hotplug lock held.
>    *
>    * Note: get_effective_llc_bytes() returns 0 on PowerPC.
> @@ -996,32 +996,29 @@ void sched_cache_active_set(void)
>    * and does not populates the per-CPU struct cpu_cacheinfo array
>    * that get_cpu_cacheinfo_llc() reads.
>    */
> -void sched_update_llc_bytes(unsigned int cpu)
> +void sched_update_llc_bytes(const struct cpumask *cpus)
>   {
>   	struct sched_domain *sd, *sdp;
>   	unsigned int i;
>   
>   	sched_domains_mutex_lock();
>   
> -	sdp = rcu_dereference_sched_domain(per_cpu(sd_llc, cpu));
> -	if (!sdp)
> -		goto unlock;
> -
>   	/*
> -	 * ci->shared_cpu_map is built incrementally as CPUs come
> -	 * online, so the first CPU in an LLC initially sees
> -	 * hw_weight == 1 and computes an inflated llc_bytes in
> -	 * get_effective_llc_bytes().  Re-evaluating every LLC
> -	 * sibling on each online event corrects this once the full
> -	 * shared_cpu_map is known.
Maybe the above comments can be kept, because they describe the bootup
scenario, with your offline case/domain partition added — just in case
in the future the reader might wonder why we iterate every online CPU
again and again during cacheinfo_cpu_online()/offline().
> +	 * The departing CPU's domains have already been detached when
> +	 * cacheinfo removes it. Use the surviving cache siblings instead.
> +	 * They may belong to different cpuset partitions, so use each CPU's
> +	 * own LLC domain to scale its share of the physical cache.
>   	 */
> -	for_each_cpu(i, sched_domain_span(sdp)) {
> +	for_each_cpu(i, cpus) {
> +		sdp = rcu_dereference_sched_domain(per_cpu(sd_llc, i));
> +		if (!sdp)
> +			continue;
> +
>   		sd = rcu_dereference_sched_domain(cpu_rq(i)->sd);
>   		if (sd)
>   			sd->llc_bytes = get_effective_llc_bytes(i, sdp);
>   	}
>   
> -unlock:
>   	sched_domains_mutex_unlock();
>   }
>   
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713

I have reproduced this issue on an AMD Ryzen 8945HX machine, which has 2 
LLCs
and 8 cores/LLC. It is also reproduced on a Xeon platform with 4 LLCs 
per node.
With the patch applied, sd->llc_bytes is back to normal. This patch 
looks reasonable
to me.

Reviewed-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu
