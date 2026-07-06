Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465583E7BC7;
	Mon,  6 Jul 2026 06:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319488; cv=fail; b=TBOFOvCwgsPKxuSIODG4/q0A3w7QTFNUd+o00rut5u8wO4tz6lMUQ8w2AenkSO/75wx4oVh0ze+axLJk0PXwghgDa0qq3kFlBglwk20Q99j2nGaCwKlFr8pxLkLOZ0SzuvT2j6fAnk8F27XPMSqeVD7JSDbanX19/KYti1AXh7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319488; c=relaxed/simple;
	bh=KQp2C7UhqP2f/cFsdd/mxukql3MEIT7x5AmljGVdGaU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=T4+lhvd/3cdOZGhrTROJuXRT/Pf8Sd/9QrUPQDCeb1PVaw/y7RGpmCeQqsrc1bTSl8FW3q/5CLQSlUJBHRD1uc/11UKyEWXpCtFoA/LprEeqG06THzIIX+3T2n6gmpyz7Y5YV3Sa2EZx9Wti2okIZ5YGdenxpvEEBNihbNz90K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LiSdPd+Z; arc=fail smtp.client-ip=40.107.201.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LiSdPd+Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZqFgsG/0MYt6TNpQH2fcjLMzXYzbMrP37dtFdk/hsXaYB4YYuQHU3KaCco1uVI2c2Z60YA5yL1CTykwJf9tBZ4Kyz3FNsv5+i5dUHbmdyvkxcO2c5NxfhNoGs3UuK+NYs0TnnCcWQENRc37vXi8CuG9biXLpNN6RlEAQ5RWJSxZH5+tg2LEaJfajeocSBHHuj4H83gFEfLnuG8/Q+Wyl5o0BBiqvHU4DXBlm6hoET/GMnHIfmbizdVwULBWXZ9K8K/XdGCaZ7S2kgJyAJ4zk1otjpB14avwi13ZD2KShKXnJ7iKKFjC7HwriVl+fXLTIRfaXQkyxXTUxCZ3miV3cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6/LWlcNxGtYFtNImfJdalfoz1zzj49qMqWnHXZUq3w=;
 b=vHNhmP5ve6KJcBqtqFFD1eh7AF1ey62aBto/uNByDPEWHI/kNleuLs0/IiPV2XmZqGmrj52ikr0f1DBoB4rBJvFvpvkLRf8zOFvmRtLSVp4dhOPuBiiEbQc0j9slQiEjdSrw2yiusaF4YX3yn1CMyPAc2dEWjznqAsB8vCB33dc6ElYmYOY6RngtjRfGIOkEUnfMSaEPk5/VNIOk8WioTMoFJy9SGovEWJFVUXLt25jsiR05Ux7Tz8oX5GSS2quyi34ALvX3igsYc7/O6pikE3hmbA//3y2eNrBEe2q630+WyW2ct5MYIU2vk92a3qWxV37g9bkYppGHG0w/Xfr3Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6/LWlcNxGtYFtNImfJdalfoz1zzj49qMqWnHXZUq3w=;
 b=LiSdPd+Zf6b4ykPYpAzIvy+0yoSEpinC/OW79gMtrO6Fkbxc6AJzt/wmC4AK/HnakwAF0rrTihnWAkdQ75BDE5kJmWhrpHCiEeIl2rcdme3LZxUnVh/iQ9ZvU+zM7RfrD8N0a/ESWE31lUBnEE+W9zwBBY/E/yWAoC27TmEYmrlpmBuwScqt+L+x0M+F1cCcwAjT5q05+af1s87bb4Q3mWSTVgujQSCIspQEvXyxn56CkUznItf/jDc9VPCI2x5Osk3a/BIubLiDDrPh4t6YaljLYRqQBifaHdty6JGm5B3fypSc9BuY4LJNigTWrHehE6lKoqBOK7otJl1wUzKBGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 06:31:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 06:31:09 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:31:06 +0900
Message-Id: <DJR9ZP56YXX9.P8U6V298X5RW@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "dakr@kernel.org" <dakr@kernel.org>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>, "driver-core@lists.linux.dev"
 <driver-core@lists.linux.dev>, "russ.weight@linux.dev"
 <russ.weight@linux.dev>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH v3 2/7] gpu: nova-core: add TLV parser for firmware
 files
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-3-ttabi@nvidia.com>
 <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
In-Reply-To: <3e771bfc6b0c89afc7969755e340a5fa863bc7cc.camel@nvidia.com>
X-ClientProxiedBy: TYCP286CA0263.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: eebe56e3-5722-4b5f-9fa0-08dedb282ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	1Dy1OrH3HWAVsErg2YosFmca4Fai73HvhqQgXE110G+8rfrbHt3VsfPlKKiYrcCHN5Djg2d4OJmI6UaC5Yx/pUo0eMA4WIFTJ3A+VIELmVov8Adu4V1cOrxxOK6Yij/L2C7C1GvL5UBnXqUfgObTbqzylMJ278DLNeecDIqUFuhLov+2bWhywVF/PSbKMcrWO1TDNozAz7gzFUEhXI3rUvKoeI0TirnKchsUUGkFhhiiQo9kY2NiOldr2N89sw4RFVLSi4Zdz8PknQZuNHIJETfZ9cGZxhyNh49tQe7YHgL9pmyyI55E8YHQ/4U0YI2m4vB06s7UWbzJyG0LN9RZBaCmcvy6+BsL2sFopEdpzUBukdjhOYj2hDxeR5zkHLpNafMof6WNlrT+u1FKlqLyYK6E6YHiH/apaqDFO8DeqeZqF5ATiB5AJqhEkjTlo2T8XIw4cEPB8P36RpP8xiHdMD3xbKR0W+BR2HrDLM34gyjCptY4nQpF8Ym1KysPKSRphAOvuF70gYEnYFFO257DHH1L/SAgZC8BIrhUxFAHJvHJZ1j9H7s4+GFf7yi9arEJAkTTfq1db7OnN0qiMDKXSUkg6qjqZid0qmaMkui3xLZgZCRKUrB8k+tB5nGbBMYnacdMSP5OmUtgrJWByPYCH/aLTzA4YtOy+LkQjIEIeL0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1I2RVQ3VnBCZ2kxL0dNU1BmVlo5MFpWQjFsU2NWR0d2SHEvSldmQXRLZ0ZU?=
 =?utf-8?B?SVZkMjVrYXM2U0F3S3p1SW1BRndYNWFURTZwekpKQjZ3Ymp4N2xaRTdvODRl?=
 =?utf-8?B?c1NreWtsNENOQTFRaXMzWldiY2lHRUp4dzFNamxiM0wvT2lvdWpyeHdHSG8z?=
 =?utf-8?B?Z2w2M0IzYkZBeEdiM085cFVoL0JyWlhwZ0xDMGdHb0p0YlR0RFhqd0ZFWmJ2?=
 =?utf-8?B?UzZXbXNzTFFFV3lyVUdoUVdCMENtdDRxb3k4OE9UN0RvYjhUNHJ3eVltR2k3?=
 =?utf-8?B?bkQvanF6cWRSRTFCVDNWbWVRSi8zdFk3KzVKTlhDdjRwOVgxQXFBL2ZLNjB0?=
 =?utf-8?B?SzdoN1dqeGFTOXR5RCt2ZWlza24zWGh1dy9UMUtQaER2YmV2d3p2Qi9TanpT?=
 =?utf-8?B?WFBvOURMVXVadGNmQkluNThOSzFBZDdKRHY0M1ZsZlpDZjR6RWhLYWxmNFBS?=
 =?utf-8?B?Y29yWk9VazJpQUVHZ0wwNkRvQXNPMU9PRWxjRHo1TVBwMDVzUmdEZzVEbEU1?=
 =?utf-8?B?SjdXU3krVWhzSjY5MGdsZWJGT1Nva1hHbitPTi82K2VvMlU2NW9RYXAwWWpF?=
 =?utf-8?B?YkQyY0V0SWZ5TGEzSS9PcHcwWU5WY21ZT0JtdVRYODhybnlvK0wwK0tjbFBO?=
 =?utf-8?B?bHFpK0FmS0k2cWZkYm5OOTkzZncxbEJDNktjZlJZNElKSTlRVU5WSHNSWkRa?=
 =?utf-8?B?ODJ5U1AxMjFCNDFCbCtkbzVXeFg1QnhvWENQdkVhU2JnL2JGMEF0NlB6U1lY?=
 =?utf-8?B?WUZBOVpUdHNtdG1NSC9FK29jM0xiYmw3M2lZSzFIYUVEUlRhelF0RDBDVEg1?=
 =?utf-8?B?VzdiWVBDUWY4blIrR3hvcGthRVBoRFloTnBFR0tWd1o5M2ErdFZUcGhWUUF0?=
 =?utf-8?B?MDNTVnVZRmxHRU9NdUJ6ZS9iaXEzQzgvNXo3OXJwU29nUVhUM2c5NHJDWVUw?=
 =?utf-8?B?Z3lDOFU2NE5DWjh1Z2xkYWpzdS9hQi9DanA5TG40Ynd6UW5OZWdUSldYbmVH?=
 =?utf-8?B?bGdWK21DNDZVZWhqMU9ORFBuUFBsSXRLdG1icTFPcGJYQ0tBK3owbDhYL0tW?=
 =?utf-8?B?MEszbW1UQ24rSU45ZC9obnYwT1Q3dStpUDZuRnB6Mmdka0EvS05ZbkdaT3Jx?=
 =?utf-8?B?NitIRnBiT2JJemVhNnZ6SUdTUDQyS1NOeXJaTVRtdXV6WFdtVmpBNmdxOHBn?=
 =?utf-8?B?TE94SkY2dGRkN2NuWFNuWVZERzVsenk0bVJ0S0M1VjZjV0Z0UzBSd1lIYmFm?=
 =?utf-8?B?eitSU295SCtUVktJbnlwRGZUdE9SdDA0Ly9leFR4bEFCSVVjMVRGeks2WUk2?=
 =?utf-8?B?ZGNiUnh5OWpUYkJMNTlJUE5idlBsb3BzT2tiUFBtSDEvaktvcjZsK21RWlNN?=
 =?utf-8?B?WkRwRHB0TU55ak5XK2o0Qm91VktKQWhhQ1QwNWo2QnVVU3lRYXBFZXYwR0hn?=
 =?utf-8?B?cHNxSHdUb0VoQnZaNlFKUWNDdU1jZXpIeUc5ZEpoL0VydW96bWxiYlRLLzZa?=
 =?utf-8?B?VVpRUXIwMm55L0hTQmg0V2JhOWNiZE11N2ZtanZsRnFycWowa1hHWnR3ZGQ5?=
 =?utf-8?B?aUpPcDRWVndGSDBncVdpYzJ0UHdvWFZSQm05akR4QjdJaHl1aDUrQnVzV001?=
 =?utf-8?B?eGluK3FZWUZTWnVtanpTM0pvSWlDeEN6bzB0MTdVWjhVQmFhSzAydVVyYnRY?=
 =?utf-8?B?emFaMkFBRXRVZ3NLVmJWZktITlNxV2FCK3R0T1hUbmxCa012ME8vWlZkbkQ4?=
 =?utf-8?B?UDY3RlNTOS9DMFVtVXBwT05HRlFCLzVCd3ZvVlZzMVFZZzhueVdMM1JSNURs?=
 =?utf-8?B?NDlzQ1U2Y1RCUTMrVkFIY293OWJ4WFBhcngvcjJaZkcwVWZ1Kzk1ZE0zNXNX?=
 =?utf-8?B?NDhFVU9IajJRMlViVm1EL2Ntd05tUTlJcm9qeVgrWnlwQWZ1QkRPSWZkSWNX?=
 =?utf-8?B?eHlZU1BXZ29jTXRWSU1kUVVRVjlKN3lVbGRNdEpuV3ZTaW91NkhnYUlJdVBW?=
 =?utf-8?B?aktNbFp2cjFzekI0S25iWUxyVlRUazQ4SkxOTzZOQngxOWdsWnBqMlRVMXJr?=
 =?utf-8?B?YW1VeHk0NFl3Sm9DdnkvajcyNi9XRktLMENRRU5kMGwzT3h5TEl5T0hFdTZG?=
 =?utf-8?B?QVRpT2NGMzZ3cDN5d2ZXSURIeGlIVDFOZFJKVXlmUVRMQlBwSFZRTEF4dEQ5?=
 =?utf-8?B?UnloU01mMU1DeFZBNmVndTlGM1d0QUhGRWNmaHhycUx3dEtldkFod2plNWt0?=
 =?utf-8?B?akdwSkZ3U01Fc2w3dU5BeXYrQ3FCbFl4d0gwV0d2QXVLYWhyYTN2MTl5SllV?=
 =?utf-8?B?Q0tRVXJEVUY0Ymxya1NVcWhMWUR3VzJ6Y2I2QTlDRVZvK1ZkcDkwTEVGWHRM?=
 =?utf-8?Q?+VKZKR9jvsfTmw7n0LkKSK9bHBMfGGaxuISxKriB8y0/x?=
X-MS-Exchange-AntiSpam-MessageData-1: gLyrFB6JBxbg5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eebe56e3-5722-4b5f-9fa0-08dedb282ada
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 06:31:09.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okQFlJphPy4KOhhANM2F/7+lI8ijTc+8R7nrtuVdM4UftPyJ4r+GhtaS6FgShWLGVG6qKhHSgifIclw4QUJ4rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

On Fri Jul 3, 2026 at 4:45 AM JST, Timur Tabi wrote:
> On Thu, 2026-07-02 at 14:27 -0500, Timur Tabi wrote:
>> +=C2=A0=C2=A0=C2=A0 pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Res=
ult<&'a [u8]> {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tlv =3D self.find(tag)?;
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(tlv.value)
>> +=C2=A0=C2=A0=C2=A0 }
>
> I forgot to update get_bytes() to return an error if the value is empty. =
 That should address a lot
> of potential issues, including the ones that Sashiko raised.

The spec says that

  Lengths of zero are allowed and indicate that the tag is a boolean.

though, so we probably don't want to return an error in that case.
