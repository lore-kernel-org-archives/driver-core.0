Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012064.outbound.protection.outlook.com [52.101.53.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45938F92D;
	Thu,  9 Jul 2026 03:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569094; cv=fail; b=CBC/3a3tCkbTP6/w3RkDW9JVXVt0V6MGNZlfzVolNR3aMI71XXKZSw+OcAwnMU5sopYfDs/V5Vj/taT4I2sQ5fpZ9IgfAkdHGf0Gj9d1gNrJiDGdKXSuqU3DC7NF1kz+qz86NifUYlCkOlRQOPVsTW/MBFn3AZWewVTUZiBiSnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569094; c=relaxed/simple;
	bh=A4te7RC2i5cd+ig3pJr57Ehuuzr2yzELgCU6AsXa7+k=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=D2GrDGgBwEOUxAZgxX54ylHtzDkvTlh75O7pPf5JcYSP9Y9Ms4p+80EHtkBfHp9tcTl1Ja4KXgye7RM44ryIxgL5I+ZOI+wDVXPQo++bFvv4+11/zTQDdqwq59T4529yy75Vvma3DMlYR55TeBEnn9s+kACUInVhSl6/SoyVMZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N5TdmNqE; arc=fail smtp.client-ip=52.101.53.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N5TdmNqE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWzAyduPzWV01yDnPWnm/hh1anW0bQmnQrJ54evd3uFrXUWVl0/ZfekRCRAGefdOED40ZXb8qGSKPAmajzaSdOuV45jkssixe5q0F2P6oSbsUhJc5zI9xuzpc6YUyvLU2oApZp0Kzlq16cByh3zP9+fck6Sot5HufyjGjTuUxiDmTD0P0X+GxjBj0yAPwrxuLMMtCejGbgsR1Lb0StvcNuppwm5YVJV/vpNZPALPZhWbHZNmMuqtEfpcypDMavnK5neaNcZaIqeakRknO2JX44/cJjDE1MhSKq3h/C7jaezIlSScaQJ9UP9fQXIG+O02Zeh7GDoG9Bg0OKYLuyzI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fEPbl9ZxKj/oN5iHcB9l8qR6MOIi31TlTU01GOsyMc=;
 b=bK/fUSHP8EPY7NBKr4PFyFAF+x1yZrWSeA4FDRaioyXGnia9LFwaEnEfJkf/VVC5EdCyTIiK8yxIr1W0ITl/wLqlpmnW12SR2elAzhqR3zyosz8r7ZpxRsBlugMYwtzBCXtoeMAneV7b8qpfpWkgFhGrcwMTsY76E9LTwW/o0W+Jfr7RTchiLGHNb1mEmNokvQg5AMmcl0rRhoggGMdrGtgbrMqSH/V9uZ+7ApNxzdrIeFeRPo0WbCW3IKc0DTJBpY4HHmL1zPoLXYBvKK8K8qAkuNCCwCmlQHYrQlMP3qeWzN9w3dqbJJAEdi5SjMitNxYdoktS4qR2pjP58mPuJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fEPbl9ZxKj/oN5iHcB9l8qR6MOIi31TlTU01GOsyMc=;
 b=N5TdmNqELKl1Aoabqt6Ro3JyOaZhYeYLedqTUfJA+if7WhOG/Kr5KPEwKD4M7zD4FNxW2YMucy2mWCaDZ0gmz97AqgmkN2a5XEMWjjjcvhQb8smml1HoJX7zU7Pb4/Gxt/YVxPl2P80v0gGai8d5QONYO/5Wm9kw5sJW0DXJObPM8jXhjcjWxsvlS0QioFkyrjfWP9Z3XtzcfkRes01KsGrkySEnSp9kjYCUXmDxxjnEqAHL8ZFmQ57Ideg9zQMXR4cflsBRRmgBXIIUtQ5QbF1WJDmuE8axz2WgwFokaz2ASDoLn1/iWHkUJ6CLY1mKoxMtLjTwoRqvJ1rzVGCwpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB8984.namprd12.prod.outlook.com (2603:10b6:208:492::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 03:51:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 03:51:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 12:51:25 +0900
Message-Id: <DJTQH2CGKDMW.1LVUEN7V32OK8@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Zhi Wang" <zhiw@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "mcgrof@kernel.org"
 <mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
 <russ.weight@linux.dev>
Subject: Re: [PATCH v3 3/7] gpu: nova-core: transition booter_load to TLV
 images
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-4-ttabi@nvidia.com>
 <DJR9ZZLA72BK.G14HXKV5E8LP@nvidia.com>
 <a3b7dcc404d857531972ac52623e63620d117cc1.camel@nvidia.com>
In-Reply-To: <a3b7dcc404d857531972ac52623e63620d117cc1.camel@nvidia.com>
X-ClientProxiedBy: OSTPR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:604:220::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b4acd1-9f84-4b42-2770-08dedd6d5b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|376014|4143699003|22082099003|11063799006|56012099006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	SdJujON+ri70vAHC65TixkcDKrZhe0czjGLjWU40HE+2Bvv9gao/Tz+FT/4j4QPbuBj1dK69vKor2BzJslKPTWnHkW1JSSDMpfMcB7piWH1tnID0B1qMigPvANetP23hFltT9Dd+eHkUiDZ7P1GwhSAPVFI7NawN7Arzwq4qsnCS2hQWS2bgwyQRxzBhX2d1/YQUtH7hvP3Eb0GXHi9pkDVKWsYzwr0onPWB59EaIOPwKbrgITIMlBrevXXajm16GXafwTsMrDm9laOUerkU1SSEUgs9oLXbD+HYJZsJkU9S1Tlr6xDD8Tyd/0Y2N51UFhkf3m/yL4xhi7TDthpMyKZXGM4JeSNPSHiKBUV59peNfPeQ4PseMdgsqiqKnoXRkr2AldxcPHawRcNxt6QZTbCHXs4CEzInrfGRnzmjNIaETb9l9X7Jgwusd0DhOCH5z5BhS+96fLpfdPzrmPH0IeSc36r8k1k990sPfCM6FIi/lFVyYlqVY097cG3ET23Yr/yn9yNT9Bs+V7kFny/U3XugZR2InBZ+KlRuCcwrxFNoxcwSoa/MtuLpfmLycCrn7ugj4QS/w3QupJwDz5fkeTDsbxMRSvqbKyVBpM3E98UhEeuhWTdca6/tBEl6UauzBCWniXF6ZMHhS8PV35tINOwLfKyepIQP1lgYDk5Q4G4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(376014)(4143699003)(22082099003)(11063799006)(56012099006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWNkKzYrSTRoSEJOeGlyVWR2NDZIOEpUZVBBQlB0cFRnSnN3d0V0SWlWdGFj?=
 =?utf-8?B?KzdCNWdzVndzSE9acmhSZjJMTCtlaDdzTWxHKzgvRngzYzc0aGM3NnpDekJI?=
 =?utf-8?B?L1BtRUcwK2c2ci81M3Vxdytla1VIa2JhNnJrOEtPek1CMWZmSDdyMXphQ1Q1?=
 =?utf-8?B?LzlFVTVkV3FXTzhidFpsUEhSSGV6SE9jdzZJdzZPa3Jua3EraEMzWERFUFc1?=
 =?utf-8?B?ZE9ZQ01nRXF4dGZGcHpTY05QcVlrTFgxU2d0cG0rV3J4YnQvNE9mR3FuWUlO?=
 =?utf-8?B?WW5hWFk2OTl5a1EvL1VIalB3N0JpNFkrYmk2Y09tQUkrL1h5T0NYZENDUFhP?=
 =?utf-8?B?YVZVdUpCMEZXa0FEWFNzNDVlSHloZFFFa2NldGMxVGg4UXRncEdwYXk4S2pv?=
 =?utf-8?B?elVGRmhnZ2NSYUdlR2pnZ0ZHQzJWZVB6RUtDU0c0KzZyaWdhRm0rM0hTcCtk?=
 =?utf-8?B?eGhja3B1Q2VaMDRNQVArbWVadWlTRi9WN2dQL3AzUWlZcUU5dUREMHBXUEgz?=
 =?utf-8?B?OWszNzhwbVBRU2wrZXN3SW9nMElXNXdOa0J4TzlzUmtWM2kxY1QxUGJrWjdR?=
 =?utf-8?B?Q2FXcUx6S3gzenUweUFVTVhPRERrdW9uNDQ2a2dYTFlkM25rbVpTQ3plbTJz?=
 =?utf-8?B?VXdFUHpyaC8xcCt5Y1dNUU9wZTNkNzdHSDJFYTlmbStrdUpLSnI2U1JPYlVF?=
 =?utf-8?B?OWZ4Nm4vNmd4dlQ2elJQSkJaV1FtYVVKdE43UE5CUUY1Z0ZJZ1F3SC9pNjZu?=
 =?utf-8?B?c1JMWDZMekl0eFlLR2w0dlU1MTYxdld0R3pvMXpvaTdCSE5CV1hSdE95ZzFX?=
 =?utf-8?B?TWNJSGNTSGZiM3JlWnFTU2E0NGNtdDlsZE96d2ZvQUd1SDhaekRKbG9BWWtJ?=
 =?utf-8?B?anRpS0ZzUU1WWnFKa0NrNE03dUtTSUtQWDZ6MDZQa1RHWlBOQ2JLaHhkMkdQ?=
 =?utf-8?B?WkxLc2J1dmJoTzM5OXM3cEtQS2p0VXFheGhrUnBOUjVJTkRBRnJWY3RFSWlL?=
 =?utf-8?B?d2xnczlOUHFKMC9mQ2pHTVN3UzdzN1QvZWtrVDJjMmhxdENFallFTll5WWpD?=
 =?utf-8?B?cW9CbGU4Z1hQR0M3emxWS093a0x3d05GM0V0UTVwSjNRZnNFRzNLeWVjZjJC?=
 =?utf-8?B?VWlCZXdkUlBIYnVSblc1L3FQc2tMZUJveGFmNXNxT3ZlUzdGckpCZlJDLytM?=
 =?utf-8?B?OG1VcGROdmpKTlhic1JQSENCRGEwUTdZK0pPdzBTb21wNUdJMHZEcWtNMnBZ?=
 =?utf-8?B?Mm53N1RwKzJocG5TbGVLeVViN0F0NmF6OVRPQnFZRWVkT2RUbmpFUVpzbWhU?=
 =?utf-8?B?ZS94UEptT0NaWFE3cStrdjBMZU15c2xWRG05d1NiRzhla2ttbHpKQmFSV1B6?=
 =?utf-8?B?UXBoOFVOaWNnVE96RSt0QnNXYkxvbXNnTUVNQXY0K3BCdUlpNExkZlRqWnFG?=
 =?utf-8?B?WEdpNjZCTkxCSGpOeEt1cGs3d3NuU3lyWXhObDc3Smo3SGhSRHJTZTA3OUJy?=
 =?utf-8?B?b3h4Y2JvZ1U0dmQ3NkhzVEh6Y2lCdEU5TXQrSXpGK1UyRkUxNUYvNDVTamg3?=
 =?utf-8?B?SHJINWhpUkRMWFIzcm93cDZlcEpnZTByM0hwYjZjV1VnMEhqeUVjSWNudUtD?=
 =?utf-8?B?ZkllSlc3VjBNZnVSZ0s3TEFlRWxrck9KM29MT3RKVlpGMis5Qnk2Z1hxa0Jj?=
 =?utf-8?B?VEFaMmtRaTJjYTNDY0JrZjJLaUdJeUZzSVNtY2FZblNlL2ZjN2h0T1lTaVp1?=
 =?utf-8?B?c3ZONUh1Szl6VmpBUGJnbFdiTkUxdDZPTUxTa0xGMkJCOWx6TnNuM0NOVFFs?=
 =?utf-8?B?Rlphc2xxbzBvYTlTM1JYdnMwUitMWWtybjVXRWM5ZW9ianArWTBDRkJvQUdJ?=
 =?utf-8?B?QUpJVXBPMEpWcHdBSUY4dkx5bUluL01IRXZwbEg2Ym85bXVzVldCYjdZK3pk?=
 =?utf-8?B?RTNtZWZXQVpsVFlQdjFNa3V5elVTcVV0ZXZKeW9KOEVHcm93STAzQWVjR0xn?=
 =?utf-8?B?NFE3b2wxWTgvdEhYT3I4VGQ1VUFFM2wxYXoyUGJOYnRLbGNkS1VwMnhVWGRW?=
 =?utf-8?B?VFdDdnppRTBCYTQzeUwwV3huSDVPN3ZyL2w3b284QjFJUG5OOXpweGdVL094?=
 =?utf-8?B?Q3J1SUFYZ0JidUdTUmZDR0Zyb2YyMENoZFJKQWpkVVdWd0d3SlJrNmVEamR6?=
 =?utf-8?B?b043bjJhS3REeFkwZ3VvZVBqMDE5ZVRxckpsQmsrSm1HdzZEcSszUk1MdWZL?=
 =?utf-8?B?aGhVQ3FRRm5IUURFNFFBY1JRODA4QWRNMExhWWJLeVhBN1M4TWpWMWtGdmV1?=
 =?utf-8?B?RktzNkQxMDZ6QUlUWnovSW5PWVVRK1FmK1Q5Q1o1ZkREY2IxZVZmaWtrSVNE?=
 =?utf-8?Q?a4ZH6CFHYFd6BP/zEyI/TeM8FsffBchFoir7t0nbcqWr1?=
X-MS-Exchange-AntiSpam-MessageData-1: MmdcGIuNnwemCQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b4acd1-9f84-4b42-2770-08dedd6d5b67
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 03:51:29.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwB3K88yl2hE3vdkmelVOPSTkbKd7CL4njRjXBJIpmR2NiOUZX4KGSMHnQk8peQbEj8TiAjOHqpWamnjPV4B/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8984

On Thu Jul 9, 2026 at 5:46 AM JST, Timur Tabi wrote:
> On Mon, 2026-07-06 at 15:31 +0900, Alexandre Courbot wrote:
>>=20
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let os_data_offset =3D tlv=
.get_u32(b"DAOF")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let os_data_size =3D tlv.g=
et_u32(b"DASZ")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let os_code_offset =3D tlv=
.get_u32(b"CDOF")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let os_code_size =3D tlv.g=
et_u32(b"CDSZ")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let patch_loc =3D tlv.get_=
u32(b"PLOC")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let fuse_version =3D tlv.g=
et_u32(b"FUSE")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let engine_id =3D tlv.get_=
u32(b"ENID")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let ucode_id =3D tlv.get_u=
32(b"UCID")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let app0_code_offset =3D t=
lv.get_u32(b"A0CO")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let app0_code_size =3D tlv=
.get_u32(b"A0CS")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let num_sigs =3D tlv.get_u=
32(b"NSIG")?;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let sig_bytes =3D tlv.get_=
bytes(b"SIGN")?;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Booter is always signed
>>=20
>> The `.rst` file mentions the non-signed case though - we should
>> reconcile the spec and the code one way or the other.
>
> The .rst does not mention that Booter is signed, only that if the firmwar=
e is unsigned, then NSIG is
> 0 and SIGN does not exist.  And since get_bytes() now returns Error if SI=
GN doesn't exist, we
> enforce that here.
>
> But you're right in that it does feel a little off.  That's one of the re=
asons I had get_nth() in v1
> -- to streamline getting the nth signature. =20
>
> What do you think about adding a get_signature(index) method that combine=
s parsing NSIG and SIGN,
> automatically calculating sig_size and returning Option<&[u8]> ?

That would make sense to me, yes. The current ad-hoc code is rather
messy and having it in a separate method would definitely help with that.

Do you mean to make it a method of `Tlv` or `BooterFirmware`? The latter
looks more adequate for the time being, as AFAIK Booter is the only user
of this signature.

>
>>=20
>> > =C2=A0
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // The size of one signatu=
re
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let sig_size =3D sig_bytes
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .l=
en()
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .c=
hecked_div(num_sigs.into_safe_cast())
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .o=
k_or(EINVAL)?;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Extract the nth signatu=
re
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let sig_chunk =3D sig_byte=
s
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .c=
hunks_exact(sig_size)
>>=20
>> As Sashiko pointed out, this will panic if `sig_size =3D=3D 0`, so we ne=
ed
>> to check that - and whether an unsigned Booter is valid at all.
>
> sig_size cannot be 0 because of this:
>
>         if !(1..=3D15).contains(&num_sigs) || sig_bytes.len() % num_sigs =
!=3D 0 {
>
> Neither sig_bytes.len() nor num_sigs can be 0.
>
> But IMHO, this just reinforces the idea that I should add get_signature()=
.

Yes, that would keep all the conditions we need to track local to a much
smaller code block. Please also check my other reply [1] for further
potential improvements.

[1] https://lore.kernel.org/all/DJTQAZCXYPN7.3Q0B4NH8EA8BO@nvidia.com/
