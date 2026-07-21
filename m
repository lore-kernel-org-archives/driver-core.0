Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0080F3976A4;
	Tue, 21 Jul 2026 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784644212; cv=fail; b=aFZqvXim0sA1ZF5TEz9sElvFRiZDbc9on575sKVJrVi7IrkBTkN7RCoaQPqudu08Ai7oqvdbODIHcJpk5VDwTHf6/+tr2kBGRfkfaSl71B5YI9p/dwwlAuyJNZqHX1ZnkSqUZAOC9P6wwlKeVZZmYtPwmp6wqgJNa/sDjRqpMs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784644212; c=relaxed/simple;
	bh=NnJi1cVMdrvusNpShf7tFlBYuNQA+45QFtH5O8JfEDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ocIDkmUsqPLl+ZurWM6zJ2O4KF3brl5F23jkaAwGGjv2e11CHLMXhr6RpAljw6XKewkgQd2lPgs9oaowM+cKgNH/ePJPDgVobBFMeC+BltP9jH9zmJWVI89IRDlgi71vqXkABOkV1QbHxBq0vQ/yeb9OqySlsONIeoyZBdAzoV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tcRbZmBX; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tcRbZmBX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvnHqq1RgqFiU2+9kcBM7at8m6pxxmfqX1mDW3sdzRGeB9uejI/EN2XwHhDPy2JfH0OThgJ7B3sNzxfo1l+PDK7+VcGtJEMMQUcvXEmrMokGiz7VcgPRSN1zW7rqJYN2f/opP8DToSWNbvKPXtxm/n2g5P+4x+lgbEJtamImUcYKnBpAExSglj0q1UmngijC6LBiaNxDSiIWNGah/xDbnW+pSooqDFuUKIjV7JfxZGqYSdDQkIvv6qO4+ZZLYr1wKCDhe4Q2L7cs+zR6q+SS8dNkMFs8rqROAP5WMWgx+9Ss0ZJvbj1VPgEE1RfmeioWeyDp6CdrSz3Di9CVqXEjNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVexdu6bba3sx0y3uINfUoIryn5k6OIx7QjcFFc3qfM=;
 b=MMY7q55TAGBq+CU+AzPt0I6JxedQgfOZX0oNTC+kSz7ClB1TNEnxLxVjnVfN+IkhCU7qc9JQNn162Ue3/x65/i3Wt6vV2oJCkfcvDM/taARvksBMMxB6sgJL8gLZqVJ++eS0smAWYdAzHxplW9QdAc6w9cN+P6O2qUitMyTY4yoE04JOytcRtBcDiQMHYwVQD4SFE4URn6EP67yA6qov8ZCiJzhGjWKMj+cNL05nIyLonLmO/hShzfCraO9Uv1Mno1E75gYJ53UpUSSbDX6Z3EoWne/T1+lFI0AYm5oPs22JspTvm9aiU3MvIhNQDM9aqKk2i/79dOrDjMu/UA/XEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVexdu6bba3sx0y3uINfUoIryn5k6OIx7QjcFFc3qfM=;
 b=tcRbZmBXXWYQ+QvYuQZH9nWYHLb2emLB5Cs+fllBgbN29MWL5WIihF0kOTOqsdeJA26dq9crb+e05g/gXV6/OJBo7H7JZyAsRPjpOlO8esoIDwrkcW+BSQEShMh5awFMZoLWbIV/xBNEP/VFIL17srheksNCdD4iHb9ticHPf1u9tsdanP/HkSQhtLepkvf3/uCXIpFvyRlrbFWhzoMPdbQUDgiDxg3VpcIXBteGnkDsQjK2xEDAMpe7RlXcyAfZvUwIzoS/0EF5tL+U5WTjVh9zn8mHgoKcA3V9RVJcJXIZwshNPx/z+OEaz0HKuKigqFD0+Fkvbchb/r0pN+9bqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by PAXPR04MB8960.eurprd04.prod.outlook.com (2603:10a6:102:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 14:30:07 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 14:30:06 +0000
Date: Tue, 21 Jul 2026 22:28:40 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	robh@kernel.org, saravanak@kernel.org, bartosz.golaszewski@oss.qualcomm.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH v6 0/2] device property: add test cases for
 fwnode_for_each_child_node()
Message-ID: <572onftjydncuwbel36x22osqckmydxcu23dkijltdg7k36rly@z44ahzeb5ntn>
References: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
 <al9UykqJCXLPbwJL@ashevche-desk.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al9UykqJCXLPbwJL@ashevche-desk.local>
X-ClientProxiedBy: AS4P195CA0035.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::19) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|PAXPR04MB8960:EE_
X-MS-Office365-Filtering-Correlation-Id: c3a64e3e-144f-40a7-84de-08dee7348f99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cPpaUvoKgGNZo/G6VYXl5FxGT2u3ITC+6mJ+E/ONZb3Ols8C7ybGW8quw4ttmvv24oD4Zogi0Gi5cPmcxLS+7GJPjgoxI0HV8WKmX5cNwyrRpkzC4oToT0RBIZ6Nke6piDvdcyo3sA0r1VNbkgB+3IyomTv3FdQYJgqX4CUUFZ4S8GyV/WJodZq5pUyz82vMjdjdR41Ni7TVjYk2tqZP0pSStryZr10LPpC1JOE1jzuSUlAEfOQuGyWuZbbW+4OM22h+0TSRCSoZRFlX6CHpM2+2kiqO4b3tO2zn86zUa7Mrm21naGcxKCnwNVjo8gA4F2O5zCUBXWKSCkiStDEZgNb+OsB7Y7BRXEtG+nFAieITliPxviXaoBcHGFYAtd1xO+nN3yCfa8cLEOTtKNWV9qrdugmYNOfExc75zPCHpqNt+d/iqpOY35HbYGxHNzAeYkvY1beMzJUc2QiPAr31MqokP/S79GKmHBM41SNaJhQXAvgStXRkicq9BAMx5PGu9dzJy2Asy35rMcvIKChmC5iH7WHR7cnbskHH0JcHDmqpR6ewi+7ddU31RaGyy9zOcViLeZdAhmpXEBUT4RdHGeuGi5zi0JuxpkWPZfKNMMhOOds3EnSFTGRWmda+5iDMQg3DHhHLW++dM29z33GEqtt61Iq/ubIC9kGJQkQOIzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZMhKBC5yFgJ6NykCp/6uPwDg/qD0mRw0KMSalkrC1L7Tfnr/GxCC9FvUydCi?=
 =?us-ascii?Q?f4nmrT8n2aO/1tf1ZytUh/Bn/s/0e+1XGiu3NU+H5G0+Ov/O0uc4lRKOo7rn?=
 =?us-ascii?Q?BhKHYEtZsjnbpqhZmJ7FOB1lFRx/TKlqjNW/vI5ohW+pAU7qukoYWUTZmfW6?=
 =?us-ascii?Q?KJmYFvUnD4jbke97JFcAglUitlBob3Jk0zGsHJx0L6VQl+33qdIiecLxHp0r?=
 =?us-ascii?Q?0z4bO/OHTnowX0oGAcc0nPAq1I1QKWFPu6mO7Q6KedReit5+d40zrpL/ZVLO?=
 =?us-ascii?Q?SGRkzWWlZ9N6c582HEJOdzzlyGVNRdXFszq1O/hf3C5kJ+olKB56uVfDCsQ3?=
 =?us-ascii?Q?5kP4CSaDug1ng98qUc7hgWplyC3c7T7P1xKoO/VsWcm6fRTkJTOQpoUGW2wj?=
 =?us-ascii?Q?pUKT4mTQT3pOJFfyLbkMDiNEy2rK6yZD5ebWaAnELZLTuJIGl9iC1v8FA/P1?=
 =?us-ascii?Q?giX8JPWzVCzfISga70dPulahMIgwZ5lDFzUT5RONFkesrrSq62rkyGqPJSRQ?=
 =?us-ascii?Q?PKG3vBuC7GIa1Z+nVM3a3Jillgzv+TrG3aZzX+5fxS6aCOO48LAqvG9PCben?=
 =?us-ascii?Q?MRnA3San19g6D6xUmYzmZEOsbbmgb358cVcrSHNMjf2D8eHrwnbnv+3OVrH+?=
 =?us-ascii?Q?E6SJ46upBv3r2hSpOvtnBOsBj/4OO2gCZMIfkSwJzEaZ5xCbBBF4u3pPZ8nO?=
 =?us-ascii?Q?y5Mu1NdCWY7SjxmBD9Ap+ZQze/5EkQ5IGbtbW1+Ba/tC9XE6uSQ6/KCbErPI?=
 =?us-ascii?Q?6LKyGg+o08MANVlrN7dZqxCHTeXHsoFaf+tZKLyd93Pwgd+dlhu6Tu260Kk/?=
 =?us-ascii?Q?izBl4OD+xjRvkZ8/uEIMMTDQ2WPFbj3hNHm37e/wZ8kYz5vj2iEAKUt6RQ1i?=
 =?us-ascii?Q?BRcKGKI6ASGrf4EUkWkAwRawzuaRiiHWrF7TAHtCtH1b/whL+s8dqoSLRTS5?=
 =?us-ascii?Q?kVFby+Wk0tGX4L8FXAuVtR1lm0UZErK9SNN2w5eUanwQSyCuQg4MP9Z9h1Nf?=
 =?us-ascii?Q?GDmvAXm0G9rQcsdFa0lpmpHLfkyrjEQmFBt2YwmxVptbTG+Hc++2tmPWtigL?=
 =?us-ascii?Q?+YuaK204808IYvNv1wOxlnBe5D2f62ZC56+DcUf1ScnjG5ybDPDSbvqtzTUQ?=
 =?us-ascii?Q?SthoD1CGOcnBm10v0Yf8jLa3G1I1hxK76pdyJGLaIllccejZUEVcptxz3N/6?=
 =?us-ascii?Q?f6tBuCqhE43V2vYjNAeoP7k31f/ZOXXdQ3dmOdgs7pOs0UppzAVC3t/aD1nj?=
 =?us-ascii?Q?uSwI79QMbLP2Kc2XbkaxUo9U7kKNrhld3Uvq/DiGwRKXPpyLZ6jw+hXGrcZD?=
 =?us-ascii?Q?tmAROKOWZ89xWdkNCpInHFyW5kIv3yb4Ba+epZhQQdLax0Fpy67oHTZ6E0Nt?=
 =?us-ascii?Q?0eMejiQKFdE2LifQXwGr35wqrpHVa6CwBfzKA7w1oxZ0trRg2wIsOH1LoZXK?=
 =?us-ascii?Q?CtSipKXW7L6koofEel1BYdoDBQDNt8g9QB/We+Qo8NbLzKWmr9x6zdJnRrJg?=
 =?us-ascii?Q?XqgIoYlkpbDCYZDbxN6q+j6A97HPKXdKvnHCdfiFl0GaBep9f1sKCUX1x+Km?=
 =?us-ascii?Q?gXzlPzEIdDTvxoDBvDhLW20DmfKxJcup7d+FXqGwLUxG0K+eatOF9yZvF+f3?=
 =?us-ascii?Q?qO8L5B0QqH2qkrANStBfw5iPS+N7LdxyjuMGYqCoGDTXGddSZjNDOm60NvBj?=
 =?us-ascii?Q?RdPE2dC+zvWyunSgwYnjASOcDOGnEom+lnDxknUUfKTCCEJ/mMlOx/bFx/PJ?=
 =?us-ascii?Q?gTvBeeNMRTRTPev8XW8HUuYIaU5mObhd5eMEj8OEUnXdbizj5Hpu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a64e3e-144f-40a7-84de-08dee7348f99
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:30:06.8835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmruNY1zT94aq5PwsJAdYXG3rMAB3N5jzt0maDgEt4zHtdzJGb/ftOFmhbx8FEQ7MvEhBeS9SNb73LvScJD7nfEGsgRVvIqb8dqw/YXKMO3WiZvQbdGFW6D7xXiiT8ps
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8960

Hi Andy,

On Tue, Jul 21, 2026 at 02:15:22PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 21, 2026 at 06:54:46PM +0800, Xu Yang wrote:
> 
> > This patchset will fix lkp reported issue when adding test cases for
> > fwnode_for_each_child_node().
> > 
> >   ERROR: modpost: "of_node_ktype"
> >     [drivers/base/test/property-entry-test.ko] undefined!
> 
> Why v6? Where is changelog?
> No need to resend this time, reply with missing information added.

The previous patchset was v5, which I created by continuing from the
v4 patchset you had pushed.
So I continue v6 here.

Changes in v6:
 - Use EXPORT_SYMBOL_IF_KUNIT(of_node_ktype) for kuint test

Changes in v5:
 - add EXPORT_SYMBOL_GPL(of_node_ktype) to fix the issue
 - Link: https://lore.kernel.org/driver-core/20260720104730.1285552-1-xu.yang_2@oss.nxp.com/

Thanks,
Xu Yang
