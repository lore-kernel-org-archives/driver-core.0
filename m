Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995743D1702;
	Wed, 29 Jul 2026 20:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355755; cv=fail; b=QYyJpVF4oeqduEEjYI/MkB2QsCZlG6mUnqmEQ9mfpP+gnrMv8cOxCjT9GXV4IKFz3rVOIegbfXYivu7CQ26vJhfw+cvpY+QCSlTYHN5+8yMVOQlmc/A8HHwAJ8FQvpnUA0uxP5sOz24FdsZN1oqidxE1mhG52S2swqca9Ir2FRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355755; c=relaxed/simple;
	bh=6l6YDobMNbPb7E4bhRta+dK9Q0DlGZH4zju8a9EwlcA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ToEyD2M+UOUdekaZYgiySkKz0i0Ga6rRx7GMwVP7HSZ/iNPfdGslejxNkyNhIpMRUXDO+enc1hQ61J3iR9dUsZt3UHKAGKTTDIBeOXPgP7LXILD8lynYw532gn3oYAdUgIgqDwYqhK5gpGiX44vZnNxUirlKQrpRrA3lM1TU0BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P8WnHSoS; arc=fail smtp.client-ip=40.107.200.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P8WnHSoS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lG8iRYLJ/OkcsbS09KwUBMJp2/5yFJaF5HIQa0JS/8wQ+hDXIiTmyh1Y4bJjW/YggQIb1SFweOAqxV7mKUmNDRuAfMdbIsXqtQoGxhzLh8SglcduR9+D4wBBDskXYndz2QxuNtG1fvrwQAqpI9Ilq41WkgoinjqMrkb59tM98xNIb0ADmGW+2oweQ9iFrg8uxhuI3erFgFPn7H/3p2z4y+e/LXIdNWfTXn6OeHo2LlkDfxopXPd4Pw/g/70xI5MP9kdxc0epJxkJUPghCJCTd70ZfR1lRU5SOnVYxJd12tcu81cE2NyxuKS5W6cKsZAJpSvWlKLLVjhJCcU8/DVLIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JG65dMBwqkEpVPZIMJHy63z1X0idr6hzDXFMxg+Z0+Q=;
 b=W69E6bn9IFMC3b0sAHosGgOtjhQbN26a5GqVStxBO5pxl+DvauxuSBrFJ8lP4Cum94qAphSFrp6a1AmVQZstl9qW8awCZB/IdSWPgAGthu1I6J16SG1YQN8U1RwaYSs5OKhQEtCREfO4ImckDJ4+yqTb4WZ0Qpo/LKT/eacfTNkCTJfWDXVmzZoI2z/dmMehNf6kfeUmlgPZCtuo5BcS5HIQz04Z71dSA7E+zq9WWHPBno18boiRwYMzSbnPza/X0JL1JUqpIgT4NOQAEsPyW5LWqOZjAX0I8DJ0LSOjJKgPInl1PSaLh3pYWJNwUgo83OXmHjwz55475Kk3ya7i6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JG65dMBwqkEpVPZIMJHy63z1X0idr6hzDXFMxg+Z0+Q=;
 b=P8WnHSoSU+Xg4KSJ6vN14JwOEyVUmXxRrz1gQTKWAU0s1Yb5FOlcC6m/DmS8kCQ4BKY773KBrtu8lnzOFbxnWIdpJfN4WJZh0ZVtaMmMmFRkfdp41gy50tMc3LtquQVt+cGQAbrwThYjoekDxoKgXwg0xb8zIx8h1+aQtbTE9s1jw734Di3/hERoVPB1mF8XBRnZLwRHSXf821UPDjPZhl2PruOFFYMvt8Z5SJ2S5d+8hiWbpEP8pA1trSd0+Xl5MUM9Q2zBU689uSCw73kl+St5HdXCE44J0EiVJIuI5jlhjk92e0eUn6FxSeCtlu6zyk4ba4vHkkjh26+MgSZzyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4300.namprd12.prod.outlook.com (2603:10b6:5:21a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.13; Wed, 29 Jul 2026 20:09:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 20:09:08 +0000
Message-ID: <45a43838-0468-4690-b692-38500f4046e6@nvidia.com>
Date: Wed, 29 Jul 2026 13:09:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] gpu: nova-core: add TLV parser for firmware files
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>,
 "mcgrof@kernel.org" <mcgrof@kernel.org>, "dakr@kernel.org"
 <dakr@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-4-ttabi@nvidia.com>
 <DK9BISU6MPAY.EK5385QYWU90@nvidia.com>
 <ba791aaea02d5caf9254278e170b9deae5305e6b.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <ba791aaea02d5caf9254278e170b9deae5305e6b.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: 505ad648-65d8-4316-6a79-08deedad3f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NeXM+xgXWyzQbrInVfQOFbua4gGmdsZTruAwx1TGPT44mcVr4epQ8NKHxxbce2SRirf4/zCyHqsrNFgW3G6Re9T878xxF0+rPnGuLLN1hXj4voxEEDzCuGnqNGfwoeF9z0KOtVZDeFSDetsqTLoUBNqZe3yr0VNOKck4o/rw0BQRgNNsGGrrXcSSWxmrObiZ8SQVZxmsYTYTecHzTXoNlvK//zTkTmQdXyBOCJRugtf+rq6jkEVkr/9A4VuWWLcZzpimzCBJxkC660yhhGkSwlVeAhiWSo57mgGGjldWkTLq1Ocb2Xi1G21UT9js7lGe5tbOS3sAi/I8zxtMR68QDrfp6KIp4ViZcVjvBcD9OeZ4rrnaAgbiGTDE2Pk17DjHP43dDwYO/DrmJ3DiMZdgVlYR3atDwP1ntx1YsY2C5tH/lMU7k6Coth5287bJieE544DVF9lUXDfFvOIYnQ4mufWSnggsAStQs12LvYlvJTILd+vbs53ycwdylsYp0ejv2pND1FgCzpDNZnq2IhORZRvU1CLdIdIGyaH8HAPzFnc7DjpU0HOdby+9jYVrnbuTWwnLsvHcYnXlHxI2B+Fw9fKj0Lb1ps4wsXy03GD4CDwqeCwCipk5mvs/psUidFeNRbB8f6nZff/Z3A5610/qrUbgs7a0b0JYMn5WrvgfEtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUhaTUp2dzJtZWptVlA5NS81Vnh4clVOTkxRYythemliUThSZGlnTERZT0hQ?=
 =?utf-8?B?ZFAxOSsxdS9mNTYwM0tCcHVnakdCTmE2M1hrOWp4MzgybGoyTzB0NVZHTTli?=
 =?utf-8?B?T05MV3ZEYWdJRjhxU2hpZ1dGTkRaNHl4VGFDNlgwYU9aUFV6dk41LzBmZHNY?=
 =?utf-8?B?ZElTM0p1QzNMSC9nZm1lNFhIamE3bWN4bE9XS3NvQXNnQitEanlheld3Vmd1?=
 =?utf-8?B?ODRaZzR4aDBSVnpYRnltaHI3YWgwZHNhOGNoUDF4RFBwekdxUkpLTHd1d2FE?=
 =?utf-8?B?VGNTT1RFSGQ1c0NkSldLUWxsKytVYTdaa2FaVVhjd0hTbUdDeS9teS9KK2tn?=
 =?utf-8?B?QmNueEpQaHRSK2R4MkJLRVdXcDhabk5pMExTT3g0b0FDODAvVWREL01RWnE3?=
 =?utf-8?B?YXNwMjVWVlJFSEJXT082d1pveXQ2VFpHVStJRVMxVVloUnBiZHdTUmErNnpl?=
 =?utf-8?B?bEV3OUtsWm5GMDNJK0tBODQwWFZ6N1dLQytNV1hGQnh6ZWp5OWZZTUM5SGtz?=
 =?utf-8?B?WUdFY3NhT1IwOU42MEpEM05UY0hObzlYbk9tNHdPNldlSEF0NWpsbmZsN01C?=
 =?utf-8?B?K3RnTFNTKzJQbGhNZWIzeDJPMnU0RlFmdUU3UmhGb3R1SEhMSDBtZ3BRemJL?=
 =?utf-8?B?NEdJK0VUWmRObzFrbW1zK250UHF0dCtXV2JLbURwSk9DTlJNQmc4SFZ3ck4x?=
 =?utf-8?B?VlgyWkUvQjJGUVJVVDUvN1gvdmgxS2VJR0V5TzkyUTJ3WXRuK1AreUgwTEI0?=
 =?utf-8?B?NW02ZkdTU3pETGNEYlR1SVVNTHAxL3RIZE1ZTndqbUNENEJxTHVIWENXcTcw?=
 =?utf-8?B?TXJNbUlXUU5zTmJmTXVxQXk5N21zeDVJMGhDZlpLK2JjM0pTZkh2MWM4Sjk5?=
 =?utf-8?B?REJGUmJMUFM5Tk5PTUh0TXRTek55UjJnenM0TUM3MFNvUVdjdnMwRG13U2lt?=
 =?utf-8?B?V3R1YTJ5b3U1NTZLSlk3aDhUNXpWWjNkZGRuN1gvVVQwMFl1MTIvT3FOWHY5?=
 =?utf-8?B?Mmd5K3hERWtoWS9SYlY1UDhVaythOS9rOHdxb0dQYUZwT0UrQlVPclpPZlcz?=
 =?utf-8?B?TEo4Q29GNDRyZjlOcnd6SC9UQlJNYWUxSUJuekh5MGtROHRzVG80R3VDN21T?=
 =?utf-8?B?cjRCWE1vRVZoY3RvMXhteUVtejhkWi9LaFZXNWJjN25PRUMza0txbzNPK1Z4?=
 =?utf-8?B?ckg3K1h4RURCVFV1SVoyYmFJcjVqRWl6WThRbjFGT2Z5cTRrVmUxZlg2RFpy?=
 =?utf-8?B?SitmemRQYXlGeTByeHk2bkRkWHNLM3phb1BMa2VtZHlPRHFwdCszcU9Yai9h?=
 =?utf-8?B?R1U4c21DOVdzZ0N4OS93bWF3OTVNTm9oSGRLeWNUaVFNOHVzUDNISGNsaTRk?=
 =?utf-8?B?clFqUDhaNVlZMDdkWFEwWVVlV0x4Yjh1WWZMMXBRZEU0ZzQwVDJsbmlDa0Rk?=
 =?utf-8?B?RVNsQjhOeUNJZzhaR3BZc2ZwTnQ1V1NBZThsN1RYVFc2V0pRdEpnc25WWVdi?=
 =?utf-8?B?NVZsU3QyRFBpN2pKbWdOVThCdGU1QitRSUk3MlRWNS91SmZhYmsrZFVLdVVU?=
 =?utf-8?B?VlhUNWU5Y1JLWk9DSkxUM3hHZzRNcTJTa1pqN0I3MEx0bDVLcytQa3A5NXEz?=
 =?utf-8?B?dHNRbVFOK1pqNW9jbU1MM1ZNOStIVVBpQ250M0pWV253Z0ZIekxqQ1doT3RX?=
 =?utf-8?B?RE9HQlRvRVV4SzNabzlUUFhUa01PVHhqY2hieHZRTEp0SE5kVkl1SWV4T0NQ?=
 =?utf-8?B?bWJtWnhzODVnL0R5VE43Y2hjN1pCWWQ2QWVKUzU2WUlaeWc4aHFIUG5BMXZ3?=
 =?utf-8?B?VmU3cHp3RWRwYUp1cGVQWVExS1VMdWdibkwxV1NOZ2pRWk1YUGdHUWltMks3?=
 =?utf-8?B?YWMzaUpNeHNYb3NWemszczBhM0taaGNOUTcwZUJkSXRCY3hBd1M5YzB2Y2w4?=
 =?utf-8?B?NzZTNXlYekVkN2dJZWd1b1NMWGN2aHduNGN6RGhnbkxST2xrVnpIeVBoN3Jw?=
 =?utf-8?B?S1dFQWlrazJBNVVYUFNBeXFvOFJNN1Fjd1BBdnhpYldodzBITm8vQVNxZVVi?=
 =?utf-8?B?OStFaHpVN2pSUGtnZEdwVmM2dVBaeXBqb2FGM3B5d3EwczR6bG44eUM2eS9Z?=
 =?utf-8?B?T2RQTy9pTDZwOGJlMFh5N0JwTThmT2Npa2QrcXd0Zjkvc2ZWSmJqaFpQZUQ1?=
 =?utf-8?B?QWU5T0xiK28vQ2E2ejNVVXdlSy9sV2c0WmJEaUJkK3BYRTYxSW5WVlFoWitW?=
 =?utf-8?B?OVlhRmd6OTJMdWM1bmhZSklkanRKcmtLUFpRdUZ0SWMyWmZ2U3lNSmFNejZK?=
 =?utf-8?B?dGJqZTRtUGF3MWM0TXdETEZmZE1tYzdwOStxWVZnZzIvUmorcXM0dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505ad648-65d8-4316-6a79-08deedad3f9b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 20:09:08.7417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pImq7k49cmfXd2MUKhSCGXHRteIamzeZo1FP/hC+SR96aYGvnuPbHr7P23Spya/WYxmeO9tUF0s+S0cQNTUCfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4300

On 7/29/26 9:37 AM, Timur Tabi wrote:
> On Mon, 2026-07-27 at 20:31 +0900, Alexandre Courbot wrote:
...
>>> +``NSIG`` (u32) - ``num_sigs``
>>> +    Number of signatures included in the ``SIGN`` tag.  A value of 0 indicates
>>> +    unsigned firmware and that there is no ``SIGN`` tag.
>>
>> In patch 4 `booter.rs` says "Booter is always signed", which contradicts
>> this definition. We had a non-signed path in the original code; why not
>> preserve it? The current firmware files do not make use of it, but the
>> point of specifying things here is to make the code future-proof in case
>> we introduce or enable unsigned firmwares in the future; so let's make
>> the code religiously follow the spec.
> 
> Well, booter (both load and unload) always is signed.  The script even enforces that.  The
> current unsigned code in booter.rs has never been exercised, so we can't really say it's
> correct.
> 
> I can change the documentation here to not mention NSIG==0 as a possibility.  When I wrote this
> text, I hadn't noticed that NSIG is never 0.

Yes, that is what I'd recommend here, too.

> 
> We are never going to introduce unsigned booter firmware.  For one thing, Hopper and later have
> already replaced booter with fmc, so this code is already legacy.

++1, this is not ever going to change.

> 
> If it turns out that some future version of GSP-RM does add an unsigned booter, we would need to
> change the script and probably do more than just call no_patch_signature().

Very true. And IMHO it is wildly unlikely that we would end up with any
sort of unsigned booter thing. So it's best to just remove all mention of it.

...
>>> +        // To make sure the value actually is a string, ensure it's all ASCII.
>>> +        if !bytes.is_ascii() {
>>> +            return Err(EINVAL);
>>> +        }
>>
>> The spec also says that NULL characters are invalid; we should test for
>> `|| bytes.contains(&0)` as well here.
> 
> Hmmm... I wonder if I should expand the definition to exclude all characters less than ASCII 32?
> 
> I was debating is_ascii_graphic() but that also excludes blank spaces.  There is value in
> insisting that the tag is clearly printable.
> 
> Thoughts?

Agree that there is value in enforcing printable tags. We could
something like this if we want to allow spaces:

   bytes.iter().all(|b| b.is_ascii_graphic() || *b == b' ')

...but is there really-truly a need to support spaces? (I haven't checked
on that, but it surprises me at first.)


thanks,
-- 
John Hubbard

