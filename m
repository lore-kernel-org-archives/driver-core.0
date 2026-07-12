Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FC4288AD
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 00:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783815363; cv=fail; b=gcdfJ82/476oGNDchu3DmCloOtaTWrqoWtjgPTKcLo2LEUzzbAiGeLLhrhjkkaKDzirLnf72w8jXYdMzVMahLR+lvPfeULGXWgr/3NY7uBFTzCvkRaMzW1Ls2/GtqRsCITyzuedo8sLQ11+DgVKr22igjcqfPmyFBkmAK7hUO/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783815363; c=relaxed/simple;
	bh=76P2/egAxZTK0y1/v2DwVgInyR9IUb6dTl/vo/iphbs=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=AyI5gdbH8ROejBruPBXFksq8Ku4VhVuRjiGVjn0aGkt2019xArXcid0MeJmLb9bzk4idxawaMbc7KuGuPjg8ONDPO5WLwmZj8amSf5GiMWpEd6RY0qls64H6JNBeep2ADxonQneu5QOU0W6uS8Bxq6tSwDKb1u84z4DCU/gUQI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ifWC3/6k; arc=fail smtp.client-ip=40.93.195.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ifWC3/6k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5vFYG2YQkoTBA/9G49Fr4obXec9q4hkJW0LND76NOawREnqmWJuEX+1VHwG02VJd1V8v5/C8fw4+xo4ORF3g8g2Mue/GK4RGkrofrKtCjysjKlRm80sKK1DjMDMLo7B83vdE0MFrdywbCMtdi1fsP6/fgY7mcJS8GCFzrD5YOh5hjvHQNz88WEmJq1zRqZ4gDPbOugsw75/DtG5jkij7GhdYtj11XMpfFcjD6fERAO2j4ZtE1+8jJcalRFIo/W9yKrASjF1mWQEfYsqMvWkslSA32Qk5lY6vxtlDK/UTutPkbcZMX6SIEHtWeerPIU/9tRtMFUj1jeWXB+S+VWy3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=76P2/egAxZTK0y1/v2DwVgInyR9IUb6dTl/vo/iphbs=;
 b=hi0TlAg7yGihoWsLsVo2qgGHf+/iQkjFv+848dksoX7vatFKgfsuzweA6AxkyrdqCTggHifstYwJAYPuAKosxZSdIGVIaLPenenyPi87DdcXfwmpcTmZSQcLh1V31oVHtQDbFFGtk2iuDs9Ww8a4aH+w5TN0ckPDrAXINXKocsT+gluR9GxHVgE5B4zm5rT9B17wK+Al87K/zfZGRtxd11XBMAyI0ecVuc+PJ2jDDecB39LJ3CSILkiKpbKCMgWzZlDO75Ho2mhSYH70fwqPNkl0HpZPOOMhIpQ9QoIDJ5+IP8OA2Fu3dEPl9obXU035IswOo/TS85dR1CfErnK2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76P2/egAxZTK0y1/v2DwVgInyR9IUb6dTl/vo/iphbs=;
 b=ifWC3/6kcf4pOl/9NO46aqtsQilnXPXcg9EPGocBruttd3xGJFsTdFonGk/LcesJq0POYlM5uc7AOvTMEAboomSlGeEfO4ReVIKH6VY3+Ne5tf9TV9VoKjMDoXgaY2iAvsh9T8yszrF3D3UJcW6ExyH5u6Xhl3XWPoFu9bnxjxbWCdC3/M8HiAnUH8iFriNsio7Z6XuPwhnjECz3PZorRODJkwvt78OKrj0Nj6zYu1oLE2LrBI6xWE1yTxk1DCP3GwxxNDnKepa4resBpXRYwYoM4k70Oyl6JBGvsgsuzKZqaNMiHt+L4C/C9TysF4jJNL9eJiM9UwVVJy+mZIgvYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7924.namprd12.prod.outlook.com (2603:10b6:806:313::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Sun, 12 Jul
 2026 00:15:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.019; Sun, 12 Jul 2026
 00:15:57 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 09:15:51 +0900
Message-Id: <DJW5RNOQ9D3H.3D1LWE1LDEMNR@nvidia.com>
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Danilo Krummrich" <dakr@kernel.org>,
 <driver-core@lists.linux.dev>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: firmware: avoid UB in example by passing
 parameter
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <ojeda@kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260711180231.229525-1-ojeda@kernel.org>
In-Reply-To: <20260711180231.229525-1-ojeda@kernel.org>
X-ClientProxiedBy: TYCP301CA0082.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 913dac06-3c08-427c-db6c-08dedfaabe9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|366016|1800799024|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Vzg47sff0OVMhnZ9zK0iTtn/fqlF7Nz8NFehyO6OPlgJXlOJx9lHaVEp0fYfWh1UdbOXX3DerQ+4U7MbJyS0pCPbXqdGIBIaN2/Ph0Rd1GHISQCRaDfY7Eg1Ai1yHsGVyhdCaRSbfdNGt3uM81sg4TFqKFVrag48yBhDIchf2jPl7AcWpD4S/CSmRlZJfVcp+xBjy9JinKUy7Pzcj/tjfdOzB2gy3v7TTIVRFiI+UqFEMfAZx6r2wxvzL6x2A9OXhmUWzCHxyuMKzjG5MhPB+6HKoe7aHHLSRbv7p8OfCfq4qQIDv+jd22dZlqkk9yrclvFDlMcGw0cwpSgR5O4l0l+Je+lY8SEEV6axO43hfgqKRmegrMBNKbZU34ArplCD3DSOVaX7TGiVPEOORNjwXpmjEObCp23GvMq3RJteYcaJRrUcPD0HtHOvaS74QRyiHTsKknefIZAyubhoTgiikyvI7b8W7ZRo4JREMgk2CO+00Z1Y/6O3aWLjqe8XW7J0K/b1X4+pEYkZMM8IrMbCMChR5Ft/xq6NuclJtjq8tr0ggIriITlNE7z8cmKQskyGt+lGbhdXtZpJIxtYJdBtMftMSJ3FYLItrTwhyy6DC4jSR1FUJEXsomvPoP/x0sajrCXcZBFK/WLNy4H0LpEf8G/mFgJVtP54F3MZLfA9ARw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2R3U1gxb3NvWWtxNy92cEVHeXFRUVk4WFZROE1SNjh0VVBPbTQ4bTdWMXcv?=
 =?utf-8?B?Y2w0ZHppRnNTTXpmZ0pabHo1KzlpdWZicmFEdHF1V0VZNU1IVFRtMHhuem5v?=
 =?utf-8?B?bjJxWW5xWmpNRzB2bWgvbTF6T3ZYV2pHMHNZTlN5OC92VWFWRG9GenZWMjg5?=
 =?utf-8?B?dzBrUTZHeVNsYUxDaFJVZXhQbWpTc0lCUi9YSDZvMmdyRmxnVC95WStYR2lk?=
 =?utf-8?B?anlHQ0FPc2FDUVRVWWxNVE9jakNkbWp5MG5hZm9qSWNLaWtIejNJMkZpQ2ty?=
 =?utf-8?B?MmNVTCtWbGwvRXBrUFpZOEMyQkZMNEo0aFhpYk1EemJkVjBIWkpVWVpZdGFl?=
 =?utf-8?B?WlBDR3BWQVZVQlp1dldTbWVEcXdkZS9jQW9DVWJPaXdqZEJzTVN4YmpwaWtB?=
 =?utf-8?B?N2QyWDBJQVpQRUVFTDNpMmgvQm11QkNsdlo3cWdQM044Rzk5TnRnVFl4YXF2?=
 =?utf-8?B?eHFhdkRRS2NTUzhuNHhGNm9RUWoxWm4vODRwRTZ4NXlwQzdUeC9ISjQwMHpD?=
 =?utf-8?B?Z1A4akpra1FzK3VLZ05uV28wcmxtM0VZNStUNUNkWmV0Qzc2R1YrZGw4RTlm?=
 =?utf-8?B?SVkvSWRlSHMxdVVIV3pGSVNjV3dPTlBOdVFDOWJ0OUptUUJXOWlsWWI2Zytr?=
 =?utf-8?B?N0JSWFlrcUhOOGtxZE9VcFNoZ0w4aU5hR1F6MTVMRFcwN0F2amU3OW5kMG02?=
 =?utf-8?B?RTBsdi8rL1Nuc3pRQ0VUZWovTytMVXQwZElGVEt0c1EzK1JwdDE3bFZCSVU2?=
 =?utf-8?B?bmg2TFdLWDFJMS85V29GMVRtaVF6bVVmZXk2Q3BKZlpzZGZIKzRjYmI1dm90?=
 =?utf-8?B?SEtXR1pYNjlPR0NuT0Q2VEQ2NFZVNi9xRDlCbFVndVBqUjFDTW5qdG5XcUJl?=
 =?utf-8?B?bllWY3BqRVJHSDlNbUlJQ2R0QVBSdk9QbGozZjdHWS9pTlpPZ3owMVNuWkNP?=
 =?utf-8?B?YTlHZURvaG9DQjhNd0tLdVRvanE5YUtWaVZzaEF6RW1HT0xKeGN5RERLSE41?=
 =?utf-8?B?UFRraHY1bHZrWFNpWXVwYnFDdGp5cnQyL2tvcWg1ZWZjbyt6UmFrM1ZZMmNa?=
 =?utf-8?B?QTJEL1JkQkFSMERSM2tqQXhGSmszR0VpQkNDWU1sdmt5L2tETVNIeTRia0V5?=
 =?utf-8?B?VGRYYTZvL3E1SUI0eEhGaDFZeFlZNXVUeS8waXJCRmxETW4vVEgwdm1YUmJR?=
 =?utf-8?B?Sjl4Syt2WGNIQ2Y5MUxjUHhoWGc2RG5UNmsxWWVyQ2FhS0pXa2pKbFNsTUd4?=
 =?utf-8?B?UHFTRlNJc2JFaGwyVDdGK21VTzFkVzBuTW9BaFJkVHFnMk8zZHM0YUpiL1kx?=
 =?utf-8?B?QXdkTkVmRnJCRTJPY1FINm9ZdkwzaGROdXZOOEhTdWUxTUJZNjN6UzRtRzkr?=
 =?utf-8?B?Z040RUQ3ZHpzaVIvUnB1UFRnMWtvL2wxY2V6NWNKV0RrRDEzZWxNc05rSzFV?=
 =?utf-8?B?cDZPek9wY0t3Qm9HSGNLMVN2cnJWOVFjR2I2RGRzVkdLWjhocExZYXJhN1JH?=
 =?utf-8?B?NldPK2NZWXlJRDZmb1ZzSjZMSWtFc3RNN2ZLcE9pc0gvUXhhelNnZkNmT3pK?=
 =?utf-8?B?UVdTNXRyalRsZ0xPdFY5MmIyQjd0Ylg0WWp2QTl5OUhpS0FyKzJodDJTMGw5?=
 =?utf-8?B?YStPSmVmUm8rRjQweXkxUHpNSzFkZkw1R2hBb3I1bjByVXR0SUdjNVVFS3hM?=
 =?utf-8?B?b1owcjgzY1Y0RUxQL3dldUFhK2J2dkJEb2hzalAzenpzem8yaW53eDNyNEJs?=
 =?utf-8?B?WU5MQ3RPaVJTZXdwa1BNb0QxQkFiOXR6ZUZSaVNSTlFBY0xFL1k3dGppNEZZ?=
 =?utf-8?B?U1FmMXMvNU8zQ3RuZzlxek5VQVFNVlB3VUltQ2kvbEJTc2E2aFlueHY0MVlu?=
 =?utf-8?B?YThETnZoRm5MS29FSFJJb0JIR05MSXVLZVBWdytacUUreVUxM2NGZGo1QUo1?=
 =?utf-8?B?UnExSjcvaTBPZ0ZFd2U3cWcxUXR0K1UrQjhhVm04cDlqTjQvNjRKTmhCeDI5?=
 =?utf-8?B?VzB4dTZFWllQL2lyNktjRmFrN0lkSE8xT0IvaXVlR3pIQkhhNmIzTWNZeUEx?=
 =?utf-8?B?QXF1eVY1QzNyM2RrZ0RuZ2JjZ1JMRjMxb0hPQ2FvMU1hTit1bkd2TUtPNGZ4?=
 =?utf-8?B?MUpTWng4UFQzeUwyejY5UDFDbjJZc3ZPNmhkc1NuRmFkTDkyZnhoM2l6MVVu?=
 =?utf-8?B?d01rbWxma1hiMGtQT3FhMXNHdHdSZUtaeCtNOWEza2lVSUFteWNTbHlUaDdt?=
 =?utf-8?B?TW5pcXNnYjl4T2dQcDhhRUVSTlhRdDNBeWlLN3NUSWRmTjgvU3d1OTd5TjhP?=
 =?utf-8?B?bC8zOVNybVhmaUcySEJhU3VOUGdTVThJUFdVcWROcmltSG9rNjArSDdiSFpQ?=
 =?utf-8?Q?Yu1xhGJaBPGS1NmyEZoG6877sEYMP044X87S4lR5sT/A5?=
X-MS-Exchange-AntiSpam-MessageData-1: qGBqZP30hwlVwg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913dac06-3c08-427c-db6c-08dedfaabe9c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2026 00:15:57.0432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43sS4XRNbutm0gusF4QyM90caBYAYIPwLqKv2uKxl8XEClxBzglEy1NsDEzod8uDOn5efkbWHue81f5IY2XMtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7924

On Sun Jul 12, 2026 at 3:02 AM JST, Miguel Ojeda wrote:
> The `Firmware` example crafts an `ARef<Device>` using a null pointer,
> which breaks the safety requirements of `Device::get_device()`.
>
> Instead, pass an `ARef` via a parameter, which is simpler, avoids UB
> and removes an `unsafe` block.
>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
