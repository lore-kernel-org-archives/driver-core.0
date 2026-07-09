Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013064.outbound.protection.outlook.com [40.93.201.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7BF3C10AE;
	Thu,  9 Jul 2026 21:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633783; cv=fail; b=ALbk2CZcdoZlwEuGMLRcTxVi4Sr+lzmg1T9A9imTetm+0Fk/X29y4C25BYCGxhtZAIPjYsM8cxZjhvhQQHkeSaF2KZ72f7SaBxL7JmMqfi74f1zI1vRiUMoDoumpn+6OZqL/f2t7ByNmTnwMQVd17QG1nWh8YHyO6XEe5JhtFF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633783; c=relaxed/simple;
	bh=vbIiFioNw5F2aVbHsJtJHYGh4UFdMGCIuHhTzkavsFk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MkKbUxsA4LOnMWJTCJf0bj/HpPMGPQQcbktqoPQt92QsCWBoQAzXU3cxBvDpe1wEvkOpm4NPITkjKKuXCBjGg28hplcxrJpsYOVBcXx6mzSvbpu5uEF9/U7N6sC+NnbCgCWHGDjhBVDnl6UcBR656N3Zsi/e7DuaZDh2bF6yNIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=db5AHfLN; arc=fail smtp.client-ip=40.93.201.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="db5AHfLN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9PKzWdgsNUK3KlmCm6qc7TSG6flLZX2zbqoU8rqMoqcHf9dWgJylbI3aIuHv6MhcZvw/GUqvJXVH7VFxwJxLPCQSwItA5vNNkwqTKTqu5nADU0qLnGH2MV/cog99uPqDwNA+0OqKQjQ6CCAHt6etVVQI/x9lWj/QmcFWh4m2NzkPo6MbU7tUzKaNBUlwO+iJoOdr1WVzWAQCA5yM8S8+VCWCm8tttveVsFATbbGrkBtuNjdTy6AYona0rU+oQ4dvcGO5qzGgojNGFJwibqPodAV3aq3GZl2Ph9OeLq6Sh6O4S6FflslVTn+l2X3fd/sVww0GtL5M0sKOXf1aMspCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOinqukUC5XNPARppPAOMQfgJ6PxK2Bq4su/ZBwI5gk=;
 b=jVNYolegnKHQD2zqYL0lTfzCZosXCFagwDz1j33CS/BM3Y+lyo82HXur9LRtPl+eAx+k8Isja2ZuFyk5kheOIPqqjtGsyl7VLORjanwgXXzLIxVjhDlPx7rRndDOoLpqaucbQe48LATRGJ+JMDRnDKVLmcE1fCng5niDEQD86bkYw2Xce+aKYMc3k3g1OQ51i+W7uEw9OoTONiD6cPjWFGdV1Xv6h8Xlci8x+DuGCSUPxluJBv1IZDY9cZ2NlYJjr+xAdZ1gL0TzwizUyuqB52GiyzZjtz9ZUl6eB490FsFGghtG4lwmPZOrJBxuMct6HCVfjTYKlbGrwXK4ZA8wPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOinqukUC5XNPARppPAOMQfgJ6PxK2Bq4su/ZBwI5gk=;
 b=db5AHfLNBqIzUYIBeXgsG4z56GjN+uh7c/0QuSOIdiKQljGdnm2IYUmAzDNZnlAE1OQKk9eQnif5mI82qntwqj/FrB2Vx7LpVEW1SJK235w/05fuS3ro+we4C0WNITBz1BXbViJ6hVRrjT/7VzOZTF/TSwudquFumOmNkOaKhiCQrbNy2ZLL7/ZUusLYq4kriCSwNVLmo58WYo20BxUPbBDsDD3gmbVb8ZT77EmcEoBJIRpurZiHiTWq3S7ukwkztBt3Dd1bQj3SXxkKag5rTabMLNufZazjBtwpm00bPgOUyTFDTvH6NgXQXARiR1xbpBZjAZF25bokcWNn5Ighpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 21:49:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 21:49:38 +0000
Message-ID: <4fa55816-68dd-4642-aa7b-c7e6f3d528b4@nvidia.com>
Date: Thu, 9 Jul 2026 14:49:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Zhi Wang <zhiw@nvidia.com>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-6-ttabi@nvidia.com>
 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
 <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
 <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
 <09b1d5117a38726d216074d7e3d56d4aeaae2bb1.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <09b1d5117a38726d216074d7e3d56d4aeaae2bb1.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: abaf4839-f497-431a-04e4-08dede03f928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JjDAHkFszo3I3a+lLsIRrEObFgvPY2vnX8ng/qFOuvkdUxrYHdeCMRzMsqQuzdCV5FEav/ODABQXYvDjdLJ2gSA412WsIOAuedBW+H5VNLQabz4JL0K+arjkik2kN+k8vkbH1IZFCSeGs3k9iMqI9XOgWon/l5Uf7gIMYck8KAxUiKHeQVlQU9rP65Vb19zBloNcHLsjD/AgwX/EB/UTPCMs9PZ3wc9ZRhv8aUN1/dQS9VyG9WZcG2DvNHRqmdL22Rbrc2gUq/RpNvlHaON0PhpJIrLeNOI0FwTdXM7skUGSX56kw4pNlf/qlxegSZyYSfG6F0B6WtE+mpflr8ngYaZJd8cnPTL2wEMuNKgUT89WESwQM/awpPfeQIYUBC3i+x/xFi7p4igH9LFzz2eQMF78UJIx7S3rjSHEbRwK+tBi8D5KNFrkjrE9FtgV1saoSHI9pZtx0uhvG1HgLWlJpPRWXYvB980qYRkpjGOXvfFq3IdU2pa53aRcoLFaZnn6pNUMpsGkory3ADHg4YKW5VqbIj4r9ZgvrVTFNrCpLVMXfZgqNrfgRx1MIG7roZFUtPxBCNzshX0qb08kGvyE/RuAxLpi0vPyv1ycnsItXcZCX8LIZRzjH8Pydnc4LpklpZXvTTI92XmhcGjLdrjVSvQYeQK3Lh2g4ODjmLLUJl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzdtaytDWmswQUY3cEpDdXZHZXM4dkxrMkdsVHRUeE9rK01WTzF2WEdKdmRB?=
 =?utf-8?B?UzJ5WElNYXBQTS94YVFia3lNY2xubW1iM0dPZ0tGWUlHRWZVWlRocUdwVWdq?=
 =?utf-8?B?UHd0enlrUC9oTkdnZ1FlTzFlZC9Kd0FrZHVPRXhIMUtWWG5ydUNoandTMWw5?=
 =?utf-8?B?OExRbFZOVCtEREk4SitxUXBNa3BOcDNSazh6NjFUWjgwZ3FNcnlYeEovTlNu?=
 =?utf-8?B?Sm1TSE9sU0lYSGhycG1jOGZRZWczZVl2OXhUM1YvOURic2x5WHpoYWNQMUtN?=
 =?utf-8?B?VkpJK0ExRTRwYnR0aUxzNXo2S3BxTFRzekJUVytKT0w4SS94UUV4MHR1ZnlO?=
 =?utf-8?B?dWxCK2tSTDlGRjYyb3hwSyt2cnpzM1UzWU9oUXhCcGVkeW5Yb3VTdmdRNlRm?=
 =?utf-8?B?b1puRndvY1NlM2k4UUVya25NakttRXhmZnh0SXI5czd1eTVFQlBacWNQNHhr?=
 =?utf-8?B?TnVadWRKUUoxZG9JY25JTGNVelYwVmJFb1hEcjc3WUhaZEwxMnJiWTZhQWYx?=
 =?utf-8?B?Mk9uTDgvajdIZGFBbTFwZFo5aEg2UUcwcElmV2VIeXU0WEpjWFJYbmlra1ky?=
 =?utf-8?B?Q3BxVlRDTHFubDBsbUlrSk5paWZaSVh1cDNheSt1cGwrcDZXNjJJQzErdTho?=
 =?utf-8?B?UVJrS2xNRnQxU1ZXcW80YVJyd2ZHQkZvd3pzWlhsYW45TkRuN3Y0RDl0cUZX?=
 =?utf-8?B?ZkR3U05wd2UxWkhTTDVQMzVwaGRBbDZ6blh4VXIwazhjbDZIVlhOSWNYSlFI?=
 =?utf-8?B?dnd4NDU0N0VSNTJjVmhUTTNtR29KN2phUld1cVdLazhzSTM0MlZPNmMyQzdw?=
 =?utf-8?B?R0UzTmcwRkhBb2xMNEx6cXF6MXFGM3RIbDNnT05peDFHa2Q4cWNhTENkaGhh?=
 =?utf-8?B?ekhpTytOcmlpUU1uZWNXamYwZFkzK085U09SN0FRdU4xazd4blh1ZjU1ZWFz?=
 =?utf-8?B?TXRiUnhUc0YzVzZOaWp5SU84cEFqQk1vQSsyaUFycXN4TVNQcnhaN0FBcUNO?=
 =?utf-8?B?MXFCQXQydHlhMWpCdWVpcXVlKzZwTEtBNVVuRG9HRC9PbEw3NUd6dEFVTVNx?=
 =?utf-8?B?amd1T2FtWXZqZE5qcDVPTHhVMGgvZ1ZPbFNnY1FFRmRCVXJBbmhObjFCYXlQ?=
 =?utf-8?B?VWVWL1dCQ0JqRHhFejV0U1BtR0xyQ1RXbHI3YTdyMGJuOUNzNTVoayt0YjBE?=
 =?utf-8?B?aTllTk83N3g3V1RVSWpVK2Y2c3hwdU95Z1lGb3ZwN21sYnV0Q0J3K3VLUVdW?=
 =?utf-8?B?dTZ4VCtHV2ZwdXdUelpwK2RSdTI1MXJjWnpBS0M0NjRBNlZBWjhmQTc2V1N3?=
 =?utf-8?B?dW8yMzk0dExMaTRzcFNWRzJYdGVaOURhRTFWUHA1QVN6M1orYzFtdlAwbFNJ?=
 =?utf-8?B?MFQ5U2htUUkzczhuMmZGeXlIT2N2YXI3c21YWm9VWjNRaVJSZnZUR05oMWw4?=
 =?utf-8?B?dmwyZW5CRTlkOXI5OG5reE0xbWIvRE43bE9FbkRybkkrbVdhN1hlQTlBWEIz?=
 =?utf-8?B?VGRrY2dva1FFZVNya3RNQ2txTFgxaGJXNlY2RGhTTENBSkVjS094TUV1cUlD?=
 =?utf-8?B?bHRzTXA4UlYxMUhXMC9uaXp2eUFjdUc1bGtmeW5IcjN4UUhsTVMwTkVBMjRu?=
 =?utf-8?B?WG5PZk14b1N2OFJ0Rkp4OTRLTlJhSVpOb1ZIM2NrdkNaVTN1ZnRRU3ZPQVJ5?=
 =?utf-8?B?d2xsdnd4eUtPVlFVZGNyZU5Xb0RjcEt6Z1hYRHNGdW5vSVpWek1leTF2VTM1?=
 =?utf-8?B?YUVkWUw0Y2R0MHFDYXlSK25sajlycEx5clU5aEZZRFJ4YkJxdk02ZW5YRDVJ?=
 =?utf-8?B?U0FTMDBPbUppN1ora2NpdDVCYitFMm5vdm52WHRGSHV6Q24raWh3V1ErMFpX?=
 =?utf-8?B?dDJ3My85cmJLVXlodkJVcDVORC9MbFBiQjNZOWhDYVUyU2hlWmRXZ1dHc3M4?=
 =?utf-8?B?WVZ5NEp6RXl2TU42OHJkdWdnb1BjWDFZVzZVM0RMaFk2UTdad3lhQ2RkaU9Q?=
 =?utf-8?B?dGU2bFVnNmhON2o5RmlEeXErOEdySHFzUVBKTGlzb0dUQXhPR3FFZjRVZWkx?=
 =?utf-8?B?VkpmUW5LbDVPVjB1dnh1dCt4Y21BTStMbUZHRzAycVV4OEQ1Z3ozdlY1anNx?=
 =?utf-8?B?WnFGQy8yMksweEgzYWdkNk45SlNtU2cxRDJlem1YQVhIOUZzUlpiUEVldlov?=
 =?utf-8?B?dndZWjBuTmt3Q2ZqR0NBWGxyc3RadTBTNUs4Ni9oM24yZlhnMXJCaHVURGVr?=
 =?utf-8?B?blp6a0lVT1gxRGVpV1Uyam5ta1k4cjlDSUVVOWtnOG1EWWx3S1NBMDVRRzFk?=
 =?utf-8?B?YmVvaVZER2lVSEx5MWpDN0JoNHVSOG9wTGJzMUZwU3lHYW52WG94dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abaf4839-f497-431a-04e4-08dede03f928
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:49:38.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wG0AFCaFI+h/6NEt4r3rTrNpYsexnkL7uk/vdTKF/NcCABigzNO2li3DbW19sfw3C9ovY9kxsk8mXbkNZVJmsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279

On 7/9/26 2:27 PM, Timur Tabi wrote:
> On Thu, 2026-07-09 at 11:24 +0900, Alexandre Courbot wrote:
>>>>
>>>> Also, since `dev_dbg` can be compiled out, the check performed on the
>>>> `VERS` tag existing is not guaranteed to be performed. We should
>>>> probably extract it out of the `dev_dbg` statement. This is true across
>>>> the series; which makes me think it might also benefit from a helper to
>>>> factor out the request_t.v/Tlv::new/dev_dbg common sequence.
>>>
>>> We don't care about the VERS tag if we're not going to print it out, so we probably should
>>> not
>>> extract it otherwise.
>>
>> The spec mentions that this tag is present in all TLV files, so its
>> absence means the file is invalid and should trigger an error.
> 
> If a tree falls in the woods and no one is around to hear it, does it make a sound?
> 
> I see your point, I'm just not sure I agree with it.  By that logic, we should test for VERS in
> the constructor.  My concern is that maybe one day we will have a TLV that doesn't have a VERS
> tag because it's not attached to a versioned firmware image, it's just some misc data.  
> 
> I need to think about this a little more.  What do you think about testing for VERS in the
> constructor?  We could move the dev_dbg! into the constructor, but then we'd have to pass `dev`
> as a parameter.
> 
> I'm going to post a v4 today in the meantime.

If you have a spec, then it's either a spec or it's just a waste of time.
Assuming that it's a spec, then if it says "shall have a VERS tag", then
by gosh we should fail out if that tag is missing.

Otherwise, write the spec differently.

This is not a fuzzy sort of thing.

thanks,
-- 
John Hubbard

