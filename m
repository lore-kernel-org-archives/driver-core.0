Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F4544885
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 11:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953367; cv=fail; b=P25ZMR45UmEFGEjGOK2B9j6nXEmZWh5Znft4gt0iPOxd28FziV6m8v6Zshjd01mQ4dSutV2Aje1plY6P4E8saywFxSY5ZrFg21OZcFPImc67n8XLAqqgmfTaLN6IaujLekqHEnF4UqvDM4XgkNKTr61mQU+J6E6D42EIufjWI6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953367; c=relaxed/simple;
	bh=HQQ0l8Fhf/pL4ZK3adoLUvTzlJ+ab9OVsHDIt6KTdPc=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=BpSm38wOdTov84sBlXaCSRIg6E5iepzNujDL+sXFP+r/fd9r16DDnbDmdlx95l9wuW7CYN+gHzLnYLWkRF4buPxtQGmcdBhO5mHwl5Njys5PhNsmB6DEoAbYKSfrXxASfMvnP7I5hfkVnQ7fMOxtoZvfzWH0hf3pzp/tPXJcllg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mnyi4/Mz; arc=fail smtp.client-ip=52.101.48.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mnyi4/Mz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXarlo7Hub022IRn7JfdWtheGPdIKNIOYYtqI/WUoFfYFrZwP49BygsPvUZjqcpolP6MlnA+aEsdQU5lmPeXww/0g7g/VdKBs6xTC2ft3dKS5nZimY7e/+1rLbrVrjxg7dEpMZxW+kTC2b4HLIw4Td2GtxXQwhijfUnp3lojjeB00xJk/Tme5KzqhO7+IJTimZR8PZY3RYP3x8GD3AWogDNexcg6BzjpQTRuQPKVwSQtklrzF458sQPn0p668vNqeHCSPnEZP13nc55Z1dOQMIYKN5N3ZeB7ftwamI8wILBfrvzRdrNiMvjVqfc1YLCVPi/YzFizSydHwGZ8gO6VUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0hh/SoqUmmUZxqi86+iX1cyqtermT4wFXZLqpi4LSs=;
 b=IO48soccWvG+OI+wpRJYQZQUEoOUgVF8DLO3u9lZeyTzlssE1Og96bNhQnQ64XoDVRUj3yvYdf6AnZOVTKKaeKuzR/Pyl2dsrdIWtFO1Tm59qVvDal0JdmzB5x5DUwRSq0D8TbmJnOCKAJlK6OyEXG3wkbuvQAVSSRX0nl7MhjtCB4haGwmg0IvNqpJnGAKSzdE4WT9JXxd1IxFpzMRK1C+R4f8B/S3nhaJXBbY6nvY9RMD1JjDPGDV3RhUOLPqX156T6jGLIy8OIGayoGJs8X13zqdMbe8PrwYb4PMa7BruYD1+ZH5RJQ76vDUgnEoJ23j9c4DahmnJBpEYNDeBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0hh/SoqUmmUZxqi86+iX1cyqtermT4wFXZLqpi4LSs=;
 b=Mnyi4/MzSr20q/UttS6CW8fuQF3iLYm26+ShEP6uOz1cjJP70XkHfVknbIhwRaSlCzrI7aEuV9H4PydtzsvjZ1YxSASkQ6tNRnXWQPEh/lJ48zCGcKvI+9riimvsjSLMtFlFZ/fqb+SjpRNgjyHeG82HMmb+J9ho9KoZ8uoqtjyrj/erMY8Tfb3Y3CsEJUy9OqqB5aFlJ4IrdDwdXSW8hNBbhKqD2z1AWlR6KjcDSPNfL6Pnh2Tloai2kQ+U3bUHbvLf64sgcGIVRleJdLLBCu9vUtHy5LHaB2i1roAW6r9mBkyMTVj6uO4U0VSYL0qr+wtwhS9KT4TZ3+hpXqvK8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 11:29:19 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 11:29:19 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 20:29:16 +0900
Message-Id: <DLAR1ECFC1WO.8NOBWPL6WM8E@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Dave Ertman" <david.m.ertman@intel.com>, "Ira
 Weiny" <iweiny@kernel.org>, "Leon Romanovsky" <leon@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: auxiliary: validate DeviceId name length
Content-Transfer-Encoding: quoted-printable
References: <20260909033246.2779303-1-georgeandrout13@gmail.com>
 <2026090955-lustfully-fanning-33f9@gregkh>
In-Reply-To: <2026090955-lustfully-fanning-33f9@gregkh>
X-ClientProxiedBy: TY6PR01CA0012.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::17) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 84db5c63-d154-43ef-72c9-08df0e6596ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|10070799003|7416014|376014|366016|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BVn2RvHS7czb8TSOOkzvXAfEShZD5HVHx0V81ySlQ0mQ57I9+ji4XA/wBvwLhajOLStCUdYmjIWtB5OvF8Kw5UQpWTqZHWqDxVAcbRV6vGbAKUqYdCut3PbcVPsshKrPqqGD6wwEJtsbgQuUECRhB2lC7R2PlDwRLMGpz89jzFO1ims7k4/CXRXksvxZWpmdtaybVZzd+6pIIyFPtrHdfJ1ldgOapDmlKc9p2noVMxZSTZsnex/hPmx5zkmwUHcCdhxZCSIx/zA/eV5EF5mj269f6GeaB6HIet90wv5JSOFdYPpjd/0hgJeMXMwpAWoq/1fQ8l0x2XTpZ/N9ghGK/4+xqxwbNQMAwd/voIz75lCGYWNdTg8Rzf/oJiJd7qiiezJFks2YXzOO28/Tv5dkyTyIiwG3uuAJrPGC9/KTeTON4JBEVECGNmD7rgBcp4J6Bztol1oZlncPunYjIbXKBfLb0f7OL+NdWfG0SHZV8W6qc2NMAdMH2TRf+i5iky7VmpnX1kQvy1ks7kN7qsqEBMA9ojEpTXk4jwl8K0jlYJUhGTgZPK5UAmDnhcqk/PcvBez2TTm9Boa8/c8aDxDCMrzEFjTe1ZE6HvnhPycJEX/qt386Pps6pfM00/SMVwmZIgh/AlHeaxYdPDlD2xtFl9hTHYvT5TTDlQfyyp78RE4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(10070799003)(7416014)(376014)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjZPdUp6UUQ0RlJNT0V2TDk5bHlLZE0rNVQ1am5FT0c2dlZiUi9VTlN3d1li?=
 =?utf-8?B?RkpEWHFvUm5Xd1MvR2pYdlAxU1poTWtxZHY4azVVTkVqSXg4WUhCUGFNWE8w?=
 =?utf-8?B?Qjh3R09pVkEyNmJpM2ZVdzVxUWVnUXIwWnhkV1RqUHE5NXdQNnpRSWxOMDBn?=
 =?utf-8?B?aDUwNmIyK0dtbExqdkdPNCtlaTFmbXU0NExsU2d5MzB5Z05mbitsUEJ6VldM?=
 =?utf-8?B?R1BBRHp5ZUFtZ1N1RUpZRWdqOFZ1Y3ZNTDExbVNuWWtTNGRlV3lPRE9WbzNE?=
 =?utf-8?B?Z29TRFZuMEZqV3dxeGlDZHdtVWJWSFBNT24rck9pOFVCQTJlbGhmWDQyb2xJ?=
 =?utf-8?B?N2dvem9qUDRybUhZaE9QNTNVbFNPTEU5YUJrNlhSaC80bUd2QlI0VWh0ZGMr?=
 =?utf-8?B?QTQzbmFOVkVwdEplV285bVUzcDZkanhxNjQ2WVc2aVd3N2o5MFBDMDAyZzl1?=
 =?utf-8?B?L0NVU0NMLzVPUzRxT1g3a1kxV2V5TXhIbE5wS0d4TWwwSTZjWWlKbTYrUFVQ?=
 =?utf-8?B?OS84Mk93QWd5bW8yTTlMQk5RUldoU0VlSStyV3lub00vTzJnZEJRT29FQm01?=
 =?utf-8?B?dVMzd2VIWlNocXp3TWl1c0Vud1orcURpdE9Vd2dFbDNaaTY5SFdTZzdNa2VU?=
 =?utf-8?B?dHVZSVR6N1poUkV0M2tjMm9kTTJwck02YXBaa05aak1MdjQ0amdpem1YNXBy?=
 =?utf-8?B?WGxpQm8rV0ZXRkRtU3BlWXhCNUFqZGZpVFdxYmJBSEFOR1F1YWRnMGgrNlpS?=
 =?utf-8?B?R3YvYmd0TForNFd1UVpBVFVvSnNrOEV2TzRQR3o3ZE53cmpIeVREZ1NiWEdt?=
 =?utf-8?B?U29KZmt5SWNGRUVvTHl2KzJ2WGNMYk1JdGpmTEQrQzVQajE0dnBxNHNOVEgx?=
 =?utf-8?B?blBYRnl5b3ppVEc0NklROVgwbFZaQVl3QWQ5bWVlZ00xOU9GQVMzYTlobnlY?=
 =?utf-8?B?K2w4VDJ5NkY2Q0F1aDFSR0RBTEZMdURNSW1EUnlOMFBCVU1SSWRuaVIxYjV3?=
 =?utf-8?B?UDJGOFcxejNiZzdXem9xUFdDbTdTN3VkVVd0anM1SW0vRkFoQ0pwMFd3NGFG?=
 =?utf-8?B?bXRIWVB5YjlPNUQwYkM2THlYNmpLS21kYVFSRC9Yai9BVitZWWNlS1V2ZDhp?=
 =?utf-8?B?U01TMHF1Rld0bG8yV3R0NEFDV1M2REpmTHJvSDdWZTZ1RFBSRHdrcFgxeVQ4?=
 =?utf-8?B?ektVdmQ1OEQ2czFLaS9YNjhadkttbWRKOHdNcElpLzNtTnRnY2hFZU12NXpZ?=
 =?utf-8?B?ZnUrcTQ1SE0xL0grWUhQdlJxMDUrMWlROEpBdEExd01CKzNERUVOYkg4UU91?=
 =?utf-8?B?SDJzSExwM29hM05ablMxUkY4bDY5ejFSa1ptNHRZQ01SbEtpQS9LU0pCV0Jx?=
 =?utf-8?B?MzlrcU1HbFRuRmJ5ZXVGRnBTVWtQekFQcW5XU0FDQWE5djQrcTMrZXozT005?=
 =?utf-8?B?TllnWmF3NWx5YXNqMkxIMHMvak1kYVZIZHZ0SlFwcU4zVFVBbXhYbnBkMUxk?=
 =?utf-8?B?T1NQMnRYSnN0N21FdEg1M25rNHpFQS82dWhBWWdFbGp3a0VmZWlMRjhLczJz?=
 =?utf-8?B?cCtWT2FqUGpZTTFtam1RTm1DRDBSNEQ3dStOUnR4em56bUlZSjJHcTlWa0pM?=
 =?utf-8?B?T1NYdnFjTGZCT3k2SG5CWlF4RSt5QW1CTlkvQkNDdEh0NklJamVJTW9mdytQ?=
 =?utf-8?B?ZkZqNHplU0hiUjFWa3BoeGxzWlBaN0p2bTlKcWFFZTQwMDRCUlJiR0FFdm1G?=
 =?utf-8?B?TlhleG5JUWZXb0lOZlhjSFE2cUZkblh3aGtCaGFxU1VoMU15TkY4ckNkUVBR?=
 =?utf-8?B?VFE0QkRqcWdFbGtwbmtQVnJVSGNiZFJIYkVrNFR3QjFjNCtIelk0a2sxZVQ1?=
 =?utf-8?B?VjRiUUxUeTFKalpUR3Nudk5rQy9XMWttUXNiSzQ5SEdLaGtVbVFRUnkvWVM3?=
 =?utf-8?B?Y04yUHdpd3M4YkJFL2tnTkFIM3c5NkJmaDVidU5Ud3FCR3BnME1TQ3ZRbUd3?=
 =?utf-8?B?WURhNTVjVkNDeitDcndmRjJ1Y1Jid3d0V0ZGSDBDcGRNY1pHbjhoK09iNDA2?=
 =?utf-8?B?c2NlQ05maitKUzNCK2k4aUlUY1JXNEo0bXpJc3EvckdONUpRUmd2YmoveXNn?=
 =?utf-8?B?dGtHd0JTQ1praU5LL3BRZmdvZzVzVDdYZ3Z4N0FLT0V0U212NlBHbGZQYnJD?=
 =?utf-8?B?Ym1MdWkzdVpNNXZhKy9sKzdUNkx6Y3IySm5HMlJLOUZ4bDB5SXhQZXdSbWh0?=
 =?utf-8?B?bFRmSGlXbWcvbVdVaTB2Z2lacGpQY2xTNXZkYjA4dS9jZ1Z6S1llck51OFJn?=
 =?utf-8?B?cWFXWkxMZlUyaGlBcVNBSXJNR1Y4My9lRytEMml2R01pWTgvbStlcjBNcUhI?=
 =?utf-8?Q?Ty+plVCprLJyBraEnO3Oycv5bWyk9ygnwLxEUwWWbUyB9?=
X-MS-Exchange-AntiSpam-MessageData-1: ZSOgNCbxvsJdzw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84db5c63-d154-43ef-72c9-08df0e6596ac
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 11:29:19.4201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlsChohSNhVbYyasrzP+ohrDHWNOqGJJtvkESyBR9RdOVBqySrXEmW1eOpZNbEOPL/P8aOForKO9fBVzE3wh7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390

On Wed Sep 9, 2026 at 4:19 PM JST, Greg Kroah-Hartman wrote:
> On Tue, Sep 08, 2026 at 11:32:46PM -0400, Georgios Androutsopoulos wrote:
>> `DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
>> `auxiliary_device_id::name` array without checking that they fit. An
>> oversized name is caught by the array bounds check, but the error
>> reports an out-of-bounds index in the copy loop rather than the
>> constraint the caller violated.
>>=20
>> Check the invariant explicitly instead, so the failure states the length
>> limit rather than an array index.
>>=20
>> In a constant context exceeding the limit leads to a build error; at
>> runtime it panics, so add a `# Panics` section for it.
>>=20
>> Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abs=
tractions")
>> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
>> ---
>>  rust/kernel/auxiliary.rs | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>=20
>> diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
>> index 60dfbec8f330..1f3ba86d6d96 100644
>> --- a/rust/kernel/auxiliary.rs
>> +++ b/rust/kernel/auxiliary.rs
>> @@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
>> =20
>>  impl DeviceId {
>>      /// Create a new [`DeviceId`] from name.
>> +    ///
>> +    /// # Panics
>> +    ///
>> +    /// Panics if the combined module and device name, including the
>> +    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` bytes=
.
>>      pub const fn new(modname: &'static CStr, name: &'static CStr) -> Se=
lf {
>>          let name =3D name.to_bytes_with_nul();
>>          let modname =3D modname.to_bytes_with_nul();
>> =20
>> +        assert!(
>> +            modname.len().saturating_add(name.len()) <=3D bindings::AUX=
ILIARY_NAME_SIZE as usize,
>> +            "auxiliary device ID is too long"
>> +        );
>
> We really shouldn't panic, we should error out and fail the creation
> instead.
>
> But what is placing the constraint of the name size here?  The C api
> just takes a pointer, it doesn't care about the size, why does the rust
> binding care?

Note that this is not a runtime panic, this method is only ever called
in const context by the `auxiliary_device_table!` macro, so a panic here
translates to a build error. The current code also panicks if the name
is larger than the target array, but it did so when the array was
accessed out-of-bounds, with a more obscure error message. What this
patch does is provide a better error message for a condition that was
already checked.

So while the patch is arguably an improvement, I would suggest to drop
its `Fixes:` tag as it doesn't really fixes a condition that wasn't
already checked. Also the commit message's "at runtime it panics" gives
the wrong idea of when this code is evaluated.
