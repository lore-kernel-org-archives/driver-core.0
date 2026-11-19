Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795049148;
	b=KqrliWutUP88oX2Y8iSWfRA2pjsEY67eC7iE4gey5s2UKavkoJdyDtpKruTh/Hho0etU
	 KuGayhkJ8AvIE29PFoBfpzhYgEZeRVDyQ76cC27UaHhZvhYSk+u+r3UjaumQJ64kBGE0s
	 cHRhLVbplF+rMk5XbD3j9YGsa7lMrrUUA1/3dN/WJITme0qIlQZMpATICX7ImriRO1Y2g
	 PE46lhkPqhWmC5TGXryVzHTBpmASDdJShrwxbQp1BPjof0PJtsN3HyzOyfWh7qBk+SVsA
	 +UeAjxyOBw4GYacdXhxccRhIoYIhtbNEb5DXgrRZUksD+H4uaCn9fFuqwRdn6MWTPWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049148;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=42Ej4Jn/9VTN2WIDgCWGIOpupAkG/ZoQuOSyOKa5nYU=;
	b=H1r0Rww0C5ya2t2AdCy5D+5WSHG2QthIZ+x5ZLhRRtXYmALf4o7lCpnXZKR7w7Fv3Jfd
	 7ZZwY3Z96kTTJ7pT/NudhVvN2wpBfGH9LZ7TZX8L0z4kpmtbXT+Dxysps0Z7xtwBWtCQO
	 j6YzdBTxe3BHc7BHI71UGeGzEzgCmmf+QUQjMiP/o90ZByWOxiN+WfriJ6fNvyBGKlvXr
	 BKxwFfkF12MV5XFyq54rteTvFKEzDDBZw/OzgzCKfpdQZ+mCbpaoZngUoAzoCfgK6vjUA
	 0M/KMkRp/InbtJKUPkEbdkU3iWDJu/lJvhrlpkfp9d5Md55ZuY1MkmQXLRV77h8O3AQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mrS1tXNz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.30
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011030.outbound.protection.outlook.com [40.93.194.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC88A606A332;
	Thu, 19 Nov 2026 00:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC88A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mrS1tXNz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZ3PlO1rhZ1w5F65rdZlqWZZpZ9w4ypz85SvCHJMOrsi8p+UgdLxKzmOCZkox8IODXDtXlveMq/tt6LQl+AZCucshY8+mpvSddiDfmJ9rQV0XYJviC5SYbc+XGTz4PQvRKfBk1RDEThjjQgzXi8BR5inHm6TtsAAlTnYQ6iCYE6TNYUEQ0O+YjFN9McGomicjpSIQ47xSpPstqh3aul8+lQZ4AzhZIcTyfCDMCpFibK9gH4lbWZT7GkCw5/G9jclBN4ycvlnUBzfKeyf0qNavt69JD2ikc7lJgKvDvh/P67+sR3NLybSHIJbfoP33L6g4wGWAHqQcRpNlOy/ZUaw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42Ej4Jn/9VTN2WIDgCWGIOpupAkG/ZoQuOSyOKa5nYU=;
 b=Uhb81Wmhuc376yaJndO5bk4573dRG3der6ClHXao5pXR41gOvBbqLa0BIoJ+toFyj1oJiOC9PiK8txWEPXkBDzlkJx9FgKjYhPjSe0bpUWqoIknM0DWFVjRnkYwnl1FuRueA7k7AN40s+xiVwVHsiTb3t47wNNb3P+aUSgDY24HqEZJPjZk2pY9SHogQZf8lVCT4/Ed0tzjxTFJ2SVEAdRWdWe3qtFjwsYewVFt3+H5Tia9579d3Z84PYH7GJSdKSbUe6y7bMHelEz8mUaMmN5vN1OahI3ZiXvdGQV2Vd4qwnH4yfvuS48qo1TlQl/iHi9bFrFcOZCruQPx2nOxqxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42Ej4Jn/9VTN2WIDgCWGIOpupAkG/ZoQuOSyOKa5nYU=;
 b=mrS1tXNzW5ZPjLMBS5yhUOn4gCnORslmvRYj8ytI5uvV1UszF4mNPEyxcn7XllpeBSfmB47j0migtxWdo12MeqWCr/RBkIb+s7NwMMvoAQH5QWRE1cRX7REB98uTa5LMebkuOqB0dmk7/ecBkbnvMmu61TpyxhoXDlWcPkLsmocAWoXFzjOLLRXCMEaTFcgHD4igWFAiXz1/Prh4nkybjKBF34zZk8CaUXDFQQaWnpZ3lJtGpZ+WEaZ3e6V/WcgjFDBca1VbAeHIxInsk28RKbQUFhA+fCM3i8nJu96U1DFE+tYF8vOpQv51QLKJt/YpSCOalV5UqQovMTxd8SnO3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 00:45:43 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0615.012; Thu, 19 Nov 2026
 00:45:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 09:45:37 +0900
Message-Id: <DMYRT9GW7NP4.3TQ04DC3UBQ87@nvidia.com>
Cc: <aliceryhl@google.com>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: scatterlist: tie owned tables to the device's
 bound lifetime
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
 <DMWC45NN5L9I.2NUG81ETBC84L@nvidia.com>
 <DMYP9JMEAF53.13MHUJHT7J420@kernel.org>
In-Reply-To: <DMYP9JMEAF53.13MHUJHT7J420@kernel.org>
X-ClientProxiedBy: OSTP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:217::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: 396f32f3-864b-482a-ee4b-08df45d6701a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10070799003|10067099003|56012099006|11063799006|4143699003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|7136999003|18002099003|11062099010|22082099003;
X-Microsoft-Antispam-Message-Info:
	wulSlh1SvR0Nu3o/x96V9vP49MBuMCnrc2uz0HltXSX47KH9RZGUF86zzyIyxqTjHGdN5exx+qH7rIBL6VKUkIb60e6A0yzvhaEcPJjXc3ibgzikvOh9voLrn5GCT2jW2GN5UnMmTBgy/onz9TwrIwXD+gwX7urxasQobdRu7WEUVr8qmL3cueOLgt1QSoLKqIhtS8LQRRzqproXAgifWKvsedWk7tk785E44VP5KtNMhZZIzcrxNANQ52j3WX+0g7Ngr3OuukhtYLNrRyBSapQe18wPB7d3iLImDH//t5DnQ4/xsUUdGOsYSxybZpL5naac4rafWrb9JmzNRquG8MRnrX4BYZPoC0B6xRJUlytZiDRWvXatuN6e3lExxPadOzKNoQ8RHP+cPwapgxpFICph2tpP+peAGX35zqHPalrviYQdSIrDcPbCLPwF7kQAlWevXtRPfm1/3USTDINcyN5fPQJa7VGXlEybzao1aBBsFhcUaBWecrNlnqIlrRMc88qzGDd18vlLOReQuUqFM0IX/RgfeDoLvSoZJfPwsclFVm1Zi935hWjxgh83YX2xv06PN8pMxzL+7wCkURmXvqj2AJvoO2kIBdk+rWNovcO90wQJl+81BO5gUInYyHc7ko7GyeXFTC4V7blI0YEXXjjAmguvtbR9zEGxRytLIKQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10070799003)(10067099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(7136999003)(18002099003)(11062099010)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGlMRXZ6MVhSb0hNTEx1REFZenBMZTZJYVFYbVp5aHAvY3Zqckt4MkZrYk9S?=
 =?utf-8?B?UTZGZDRlM2g1dk9wVWF0NW81bnFZYis4cjFWS0IxOGxLaEYrSUVVV2VEcWIy?=
 =?utf-8?B?R3FhN0R6bmt2UHNWSmNHRkVTZHAvMmdkMXdvZEdqeW0raEp0VisydlNDbVpD?=
 =?utf-8?B?NnpVb2djVUFid3lHbDV2a2N6VnFMdUZkWjUrYlBIM0tDdjdUMDZMQUtSWlRF?=
 =?utf-8?B?Q29HZHJLN01hOUN4MVpabUxWeFJpaGpMekppckJPdDVkVEtGWmtOOFVyRUVR?=
 =?utf-8?B?MXpadFdianZtbHJjZ2JheUpRYlVPWDFKemNBbjhIeU5jS2xzNFN3NU1xVmNX?=
 =?utf-8?B?TmVUL2IramFmcjk0LzhuUmVRYmdFN0pqcUoveS9mK21xUmIzY0p4V1JLUEZa?=
 =?utf-8?B?TWpySHJ2TWY1SHBiMHJhNTM0eWJWWGNvZGFDakVzYmJoTzJnNWxhb2EycHJH?=
 =?utf-8?B?UVhaVHpsV2E1T0d4ZHZWdjgweVRQUWxnbmJYSS92NENuT1ZYODJmbnZVcHNr?=
 =?utf-8?B?U0xoZWVDY2VBZWxnemp0VU5ZbGRYQ2kvcm5ZR0VoRW55b3RCQndGUnQ5YjJk?=
 =?utf-8?B?WS9KMGhlQ3Jxc3orTkpJWndqa09ISHhPRmUreGJYaFVaMXRQTE0rRm1oNDlo?=
 =?utf-8?B?bUVwUE9uWUk4TFZsVTVLWE1BTlpWNkliWnlPVjkvdE13cll5SmpmMDk5bnFZ?=
 =?utf-8?B?RWwyNzNmcGpudVF6L3I2M3RNTWlIcjFsSEdPODhsRk5yeHArZ2NtcjlCdEVt?=
 =?utf-8?B?VHVlRzIwZE01a2tQUDZVTGVxOENlenZyWUhHcnB4SHhFT29GUzBTQ2dsbjNn?=
 =?utf-8?B?dWpVbkdabDlNMEprL3lvUDVQUjBzWVNjUG5jRjlrK1BmaXBBUFYzb3dVbkQ5?=
 =?utf-8?B?bGxraisxNm1udEplK3NRTTFybGNKTFllSWxMMWorVWRTV0F6ZUZYOXg5eHBp?=
 =?utf-8?B?Y05hYThiYUtHeHBIZ291V1gxQk5rT2FqOFFUNE44aHRVaUNheXJMNU50Rjlw?=
 =?utf-8?B?Z0wyZW5ITHFFRTVLZ0hVWjZ0QzFJNjdtTnY2RDM0N0lBWTBzZjFuMXZIbXZ1?=
 =?utf-8?B?VWZkaCt1OVAxZEEwdHJaWGtzRWlSaDk5dDc1MDhVeHQ2eFluS3VYdDE2ckV3?=
 =?utf-8?B?VXhOek4yTXRzVVFBL3U0Ym5zL2hYeDZwMFdKVlFabUp5YVRrVXdsSTN2RW1E?=
 =?utf-8?B?OVRYcS9XODlQMHpURGd4a0plbUt3SmpRN2dsQXl0Ylp2WnNZMHgvcHRUdDhG?=
 =?utf-8?B?YjVPOW5sR1BFMVNJYkNQelZtWEdBY0hxZFlzS1R1U21MWW92UHA2SUJBSzQ5?=
 =?utf-8?B?Rmd6L21qRU1VdDFSYXNGbW4zd2lpeElPMFRsYzlQajBmWmN1L1RvOHQwckda?=
 =?utf-8?B?a0xBamJkOUcvSkxsMWRvRUZFRGRUMnFUbVJyT1pYUVJzVnN2bldabFk2cUtH?=
 =?utf-8?B?azZKcUo2TlNFaUpzMUNmOXplMzFsZG5CK2IrcE5xTDZoQmdsU1lKQjBOZ2lt?=
 =?utf-8?B?ODVuZGJ4Qm45ZTBSYWxLT0VkVjNxL3Q1aUprSTF1bnlXUW8wdW5tblljQ1A3?=
 =?utf-8?B?d2t2cDdvSWFubklhK1hzNGhNYTA1djBRcDRsSzlmVVRORGtMS2pLL21PbGFN?=
 =?utf-8?B?MXE1UnY1cVNnSW1NWGIxajBhSUdPR0xnanJTdHZVNDdkTEpVa0JpQVM0YWgw?=
 =?utf-8?B?ejV4M254UEYwenVnRFJ0cHFYT1B5RVZYRitWNWQzaGE5S3ZtSGQ5UXAwZXpv?=
 =?utf-8?B?Qjlza0RDOEg5anlBS25jME9ieHd1aVg2dTdGcmhxWnlVZm4xUlFaeGR6MEFM?=
 =?utf-8?B?Umluelh4MHpWOU85bkdlVk8vVEdjYzJybFpzc3pRV2hUVzExQllEYXIrbTlO?=
 =?utf-8?B?azRkL21zNGo2ZTdFd0laWlVrNDFhTjZ2cHcydTA5YmZoY0ZxcWlMVVNlcnRv?=
 =?utf-8?B?UlovZWlUZ2NwY2x2QU1lOGM0OUYrT1ovTG5CUHBrQm1iaXdMVUVWTUVsMCta?=
 =?utf-8?B?SFhDaHBFYzRVQlh5bTlLT3BMVittNDVjOUZkdHRuOEdhRU5NT0s2a2xRV2Vq?=
 =?utf-8?B?eWl3OFFNWERYZUY2STMwYk9ycFFRSi92YzBwTHdnT0V0Q1VuZlQzSWI4UkZh?=
 =?utf-8?B?ZHNpRFU4dFNhK0pjTDZhUHdDc3gvOWtUMzk2Q2VUMnJRRktTRmVqTkdObnAr?=
 =?utf-8?B?YkhCODAxbXAxVjFCVnFxaGs1YTdwZFJXblF6NVhzRFEySjRkZWhZVDRvWFM0?=
 =?utf-8?B?UE4yNkhPTjl4VFh2d2ZiOUVzaDhnM0NmTzNMd1F4elkrSm1mYWZ0TnR2M3RN?=
 =?utf-8?B?UXNsOVBCZ0h4MUF0YjgvNWtaVTM1K0ZzUHBSbnFBUXhQZkJ0bWJ4dTZtSU42?=
 =?utf-8?Q?nms4q1vOj2N5UG8Q1sC1p+OD9F/fMCgLjJwxpdEMVnW+v?=
X-MS-Exchange-AntiSpam-MessageData-1: pxGPU/9U6hHvbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 396f32f3-864b-482a-ee4b-08df45d6701a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 00:45:41.9186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bLL/R6PwYtd+ddpq4bDSZde1XBF2hg+bvI/r0xyVRC7PGf38pG9wdHy9Bka/KmXW2Z4E5JiQaq77oVfEga/e6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

On Thu Nov 19, 2026 at 7:45 AM JST, Danilo Krummrich wrote:
> On Mon Nov 16, 2026 at 5:02 AM CET, Alexandre Courbot wrote:
>> The `RawSGTable` documentation still mentions `Owned`. We could adapt it
>> or (maybe better) just drop that sentence.
>
> [...]
>
>> `sgt` is removed by this patch.
>
> diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
> index 93f431d7f548..22d039f3fdb1 100644
> --- a/rust/kernel/scatterlist.rs
> +++ b/rust/kernel/scatterlist.rs
> @@ -214,9 +214,6 @@ fn drop(&mut self) {
>  }
>
>  /// A transparent wrapper around a `struct sg_table`.
> -///
> -/// While we could also create the `struct sg_table` in the constructor =
of [`Owned`], we can't tear
> -/// down the `struct sg_table` in [`Owned::drop`]; the drop order in [`O=
wned`] matters.
>  #[repr(transparent)]
>  struct RawSGTable(Opaque<bindings::sg_table>);
>
> @@ -282,7 +279,6 @@ fn drop(&mut self) {
>  /// A [`SGTable<Owned>`] signifies that the [`SGTable`] owns all associa=
ted resources:
>  ///
>  /// - The backing memory pages.
> -/// - The `struct sg_table` allocation (`sgt`).
>  /// - The DMA mapping, released before the table and backing pages are f=
reed.
>  ///
>  /// Users interact with this type through the [`SGTable`] handle and do =
not need to manage

With this,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
