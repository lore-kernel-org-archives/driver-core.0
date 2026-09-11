Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010059.outbound.protection.outlook.com [52.101.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63428B4FA
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103953; cv=fail; b=VV8UyUnxDNXl5WNGQCW/67wFPCLV6gx+3bp2CMBBtN3vbUTfUAK6ooAgPuli/4QwyBwuaJmYccMSNaBt3NyhWYhE1b0gFNOUGAIoI9z2FtXAER27cXB3gKT20QPxfxHoCYN2OQLJ0whfcSVgCRMb1BMC23jSqf3kR29zdpKKPZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103953; c=relaxed/simple;
	bh=OYWm0yuc1e5dZeCoFZmSc2vtbUBaKxmgAAKPACEiSzU=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=ewOVk2+XEDxxqMP6E2N8+EJg+n69eKwEB3dJ39ovX+ZA9UfW8V6f75DqFX9RtvA54VC9NrF0ezsl0GdRnKVY1Hh/F2n4qv7DP31mlOyHw9s9BT4JL1eSWqzHcb44GgyZ75Xf8W4tQ3C0smMPhuxiCUtf+3sGByMQLN4NspG4WQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ME5WaYTe; arc=fail smtp.client-ip=52.101.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ME5WaYTe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqsS380ga+/QZOdS9FgkvOj/lfarWcTcKazpDd8Le3l1S5bfq7iEqR9/gMYWwKn966mOAaPFhCizkzZlnfBEAg1p13qFxWDjcWfllmPhZ6kR5LJurC3YaXRmIbQQ5gbNNlCuCSYgFMa2CwN9eJ44ddeiUZXGx9p6YsIvl1KjVVZz5RZE4GGu5EHTNb9Oy/a0/aXzyFO32nkO2EJRsaswYr55JB8ocpcFqDtGRaAql80LZ1a6Svrb6HMUrKAqkA5/XN6WZpKnc++vpbQkdDwusn0dv8KnSfvkRrC1OPQKpJrg1anm8QvBf6WmNXL6PA7JLnon41X2oCA0O+8uazDYPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYWm0yuc1e5dZeCoFZmSc2vtbUBaKxmgAAKPACEiSzU=;
 b=gG4nDcoDujX+3z2tIWU0lTGkdhBDerfj91n9S/LExnn4o0cjwr7rjn6BUJOfJXNw0Lals93DxltCHr0ghN5bQYT1iLki8UEPGBG4kNUTgROL4MMq5DzbWnirqk6ljDWxLcheBwUeI34wqnXbXFCJOPr2bIf90QO2POUBWckfpd5Gac5fhnJYvvYRT7K3EMusH245OBhyXVNoFFV2c1M+2bhtX24dxxxyjuvAZ1p89JiREcWFBYvuvIBITQNUr7Tc7ysIF/WGao9x/VqCWXmKVrIFKQuFEY2PFurkDP7vJQzTHLcJDPzjMbdmFOGTTLMcXJE545/3ldN7LpZlHlQh7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYWm0yuc1e5dZeCoFZmSc2vtbUBaKxmgAAKPACEiSzU=;
 b=ME5WaYTeeRT4QTJ8NVUjINhzq7Hq1OX9COGBmz0R6SyyMa4cvpKA4GyhzlcSTZE8mtQbCsqS7UthXCuxyh5zpASGBWdu7bskjrOO97E2qDbQFKWBmwUYPptvYuNOG771zY41tdxMPPElvjUO9NODb6ZIUFBvmCsyd3iabGw3lz7AtOLX/UyWw2Or2TDzA98BZvmbw/HX5lQoc/KogRe506yvyAwQG8YelA++dTm7IXR65VWge4TEFRJeJ+GVFi6CO7/tgJqQxbq32+r9C9JeZtLZjblEttUxsuxMhiN2XR0jWCfPeoHHhwHuUNsICZTE9RcukcIgO1agqx3NVa9zOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS7PR12MB5814.namprd12.prod.outlook.com (2603:10b6:8:76::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Fri, 11 Sep 2026 05:19:02 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 05:19:02 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 14:19:00 +0900
Message-Id: <DLC8EZJDCFY5.15IEPAK1M7ZW@nvidia.com>
To: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Dave Ertman" <david.m.ertman@intel.com>, "Ira Weiny"
 <iweiny@kernel.org>, "Leon Romanovsky" <leon@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] rust: auxiliary: validate DeviceId name length
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260910153844.3987791-1-georgeandrout13@gmail.com>
In-Reply-To: <20260910153844.3987791-1-georgeandrout13@gmail.com>
X-ClientProxiedBy: TY6P286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS7PR12MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4d40ac-10d5-4fbe-47a1-08df0fc4313f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|23010399003|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	eW2j9BRSpTix0PXc9LIo5BwYFrN0DDmQvHJNyh4r1EWxdBjHVXLZOFmawUbbOhnitaxapioEF/5O0PVp7MU2BOpWbORdQRL88Vb/ExLml9EJL0SiW9wxnaQNvBuALWIk0jwyY3+cNoAlxirNGk5/YYmJu9vB2ke37isWFF0P7mO9bkvdOyZN4/kz2SYTuqYuosMB/AnBMNgsx3+QQyuT4sq/LYQ1E1kUnUhWi3sMEZUWnumYNNm42spLbz7bXQMypH4ZjRzuP+NjLo4R8ahddnP4p0gMzFMB/yAqlRDkysdTComayuExMCvjxnue6fiYlMHPpnsTychVOM/JOXjisp9ea+IRb68ARFOZLj+VK+k9tRkbPtxLrHN9IFD73IssPqxkBoWhpwHP+LjV11wDDILaqmY8wPqmA+3vm8nBD2z5yEWmjbar2DGmO8qBdWLq0YT4x3pL+m3yWOpLtSO28chXZy8GNpQrvD9XIoeRzU8aQJIwdx9OfeBtsPS2KNJtcV/Me0l1DoeDhgsWFH2rJlMY87F7UI5ZeLN0VGt0JHtoTRiKZa5+o3O2imT7YXO/jHPQ5DOeCo1Yrn5R7DFLV1BvVvQrKDMqgGv8vZX3NICVMZ4lzuJemi9iLePpKMR+WIDvVXRvd3lI6OlZKxycDNhzJWOGEKPdfBdhVpE99WM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(23010399003)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enpzajliSE56TGVmcVNMZVZJWHJCWlhMaUdhMEZ2c0ltd0h5QmVwVThZa1VS?=
 =?utf-8?B?eEc5RzFPK1NoOS92TTgyTDNKSFRvd2ZERy9EK3VoL1lBUlJXTlVYVXdxNVBG?=
 =?utf-8?B?MjhLU3U0MmY3Nk50TGJscVpTc0J2ZFJwZTltTnZOVVNNZHRNT0NBV3o0Mnlw?=
 =?utf-8?B?Z1hFdG9FT05HOWRibGxyQ0FzbjNnOVV4UGwwcjZobjRhUzMzTFFLZWlTaWdG?=
 =?utf-8?B?eG9VZDlFR1RvT3IvSXlZZy91bElwdkx4MmJJWE85anFQZU9kNGQ0Mk9kWGQr?=
 =?utf-8?B?c0Z3YklkWG0ybUtIWitBamtTYjUvUGNreU1pTSs3Zi84YXYrZzJIUk0vazJC?=
 =?utf-8?B?S0w3RzZia1E1cVhMVHJmTUJRaVpUMXB2WnEwLzZhZWN1YUFpb2pMeWZSSFRl?=
 =?utf-8?B?VmlFbUxIaWRoc0NnOXFHeGVTMllqNWVjOXgzZ212cmlvYnpoWkd2ZmFNSTRj?=
 =?utf-8?B?bklXTzdmQ2ZtaFQ5V3BudytqS1VScWRJMFBmUG5TTXNsdE9RdkE0amRLeUhm?=
 =?utf-8?B?ZXFRVDJzWmc2c296aVhRcnJGMCtjYTdFaGtLK0Zad1QzRVh4cFRua3JubXcr?=
 =?utf-8?B?Z21zaDlubWxiRE1wK0Z1UkNZTFE3eTZrcmJlWEtSMjJVS0loNDZncXRqNThL?=
 =?utf-8?B?QklBREplUFJ6MHlQVGlGT3dHaVAvcURvb1Bid21rZFpVc09LUGkrempBU0gw?=
 =?utf-8?B?OUFGRnRiejNtdldJL2twNzg5Q0lKWXpJL0I3RmlmalJOL1FWOVdUVzB4Zm5h?=
 =?utf-8?B?L2Y1UDdUK3BrWGo2QUFmKzZyMUQvTVp5T2JlanR3SkZLQlVSd1dJTzBJR2FS?=
 =?utf-8?B?VGdXT1ZNM1R6elF1VmNwUUxWRXdrQ1I2bi9RRTJzaGsyaVFnVEwvQk1ubXpq?=
 =?utf-8?B?WVZXTGpFdlpGTDRIRVVSalAwTWZPS05UVVo1S2UrVEZSdGtGWjJQZGpwUkFh?=
 =?utf-8?B?bHdkVU53TElVWHdiVUZwZW5LQ3BlTjJOaHAyT3RES3UvU3BuclJrb2U2bXVi?=
 =?utf-8?B?bk1nenM5OGFLMGZpYUp6OHZCU3pyY0RhZWdHVk94YVl5ZVpRQnYyKytUVlZI?=
 =?utf-8?B?Y3EzSk1neEs4dDVoSjJSUXJyUXhhMFNDN3kwRFpTelhlS3dJSFFYR0dTdElt?=
 =?utf-8?B?V0JMQlJJMzhPNHpYN3hTYUJNSnZERkxvZ1pZdWJWUFltOVY1dHJLQ1Z5WVJm?=
 =?utf-8?B?RkhDSytzS29NbjhMY292NHBYajdPRHcxL29tSkZqMGFNcldxTHFjMlNRVlZn?=
 =?utf-8?B?Qy9NaytNREZFcVFEWnRMRXR1WWxLbXNOOU55WkJTbjN3NXgyK21HcnN4d09l?=
 =?utf-8?B?ZkdNdDBJVXZscHdzWk5pRy9UdVZXb0RjazVDRk1teG9FbFFUdmFQRmc4aFBm?=
 =?utf-8?B?RmRCK2hwa01qQ3d6SEdiTUlaSmlvT3J1MVRCVjQzVHVFMmxqeU9aUEVBNDlm?=
 =?utf-8?B?OE9WTUpGUXJlZzVQT0xuQUtXNHA5V0IzVFR1TDRnTFY3V21UcXR1anZvVVdt?=
 =?utf-8?B?bDNlUmpuRk15K0gwV1FpS0JtbG1BeE5YT29oWjJPVy95cFFxYXZLa2FTSE1h?=
 =?utf-8?B?QkNiZ1dTekRTeEF1ekFaNlBPMTJ6c1BCU0owUG0yUmJ0aGVxYzl2cWUwdFdM?=
 =?utf-8?B?dE8vMXRld0s5ZkRYRm44Y3NNVHFtUXFxQlc4bVhBUkI3YU9iaVVsSjZSSHlB?=
 =?utf-8?B?MXN1SmRlZXd2QmIxeDgrR3ZLN0kvNWpBWlhZdEtVdnZtUEs4Z0JzWVFPbzA5?=
 =?utf-8?B?alFzN3pzQzVrM1EvL3p1cVYwdzd0ZHdCL2tLSjBwbUhzZWF2WDlOWEZzTGgz?=
 =?utf-8?B?Umh3VUsyc2ZHcFRSOGpiUDJCc2lZRWx0Q1E3WTBEbXEvSS9nS0Y3c0x1dytk?=
 =?utf-8?B?bVdZWUNKbStrbkowVTc5WEhwS1U2eHpldEVwUGtXa0ZvMVFUeFVWcjBZcGVy?=
 =?utf-8?B?V1dBUGNQWU5iMFpvaWludlgzQkpTOHFUUXg4WXI0UnhSSldTMm5pRFh3ajlD?=
 =?utf-8?B?NkFrL2tpSWpWNkZkdnZ3R0VPK2RVdUttOEVFRGcxU3RsSlVJdGNPM1F4c1V0?=
 =?utf-8?B?OEw1TG9UeVJHSUg4V01WKzY1R3lFMktVeXVBYVlKMlZqUkJGYVY0NnRSc25l?=
 =?utf-8?B?cVdoU3JqeDFqTitrejFrVm94eWNxV3MyaTVOT3pRMThQNEViVy93Q21udzdU?=
 =?utf-8?B?L3FSVWlZUDQ2c3FIOG13cGJSZmhsME1ZbUVSYko5Q2kxSkFTdVBjZ0p4MkhB?=
 =?utf-8?B?OFdqbzQ4ZG9LeHc0ZVJtOEVoOG1sZ2ZGazJvR2RJdzVCNm1QMFlmbS9ISFFm?=
 =?utf-8?B?WFl0T21wREZpQ0IvQ3krVVpSUDBINHo3YU8vZWlsSDhyYmVFZHZkWnFYWHo5?=
 =?utf-8?Q?xSOB+rNuySxEwzJs7iNW2lsgzh8gPWLtkH7cDBzRC2jIW?=
X-MS-Exchange-AntiSpam-MessageData-1: BM1lOK2VV/Dd2w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4d40ac-10d5-4fbe-47a1-08df0fc4313f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 05:19:02.5129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: npk5VRwKAVuC037P4sB6oAsMim6L5pk0+9ywIXqWjk7s6Z7GaoF/6Nc6wGRAfmwIm29Z6PkYa+xZFtXjNQlC4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5814

On Fri Sep 11, 2026 at 12:38 AM JST, Georgios Androutsopoulos wrote:
> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
> `auxiliary_device_id::name` array without checking that they fit. An
> oversized name is caught by the array bounds check, but the error
> reports an out-of-bounds index in the copy loop rather than the
> constraint the caller violated.
>
> Check the invariant explicitly instead, so the failure states the length
> limit rather than an array index.
>
> This should only be reached when constructing a device ID table, so the
> failure is a compile time error. Document that intent.
>
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

That's not an essential change, but its concise and helpful to some
degree, so:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
