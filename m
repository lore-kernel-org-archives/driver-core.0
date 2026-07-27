Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011032.outbound.protection.outlook.com [52.101.62.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9923E1692;
	Mon, 27 Jul 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785148710; cv=fail; b=HM7WglmObtdI8YrNygBwuaMb5sYCTzAGkJMDDfw00dliTt6b+IDc6B5AlKFp8zpvzIfAqz8Ga+5Bx1UXEYjxjcarapLL/7pDPULH8vu1JummuDdcp8kBM0LLYlUkMoKumc05wknL6qwa9ev4Mkg9SQA7z5cFPZunwIcK9fPeVFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785148710; c=relaxed/simple;
	bh=Nj4YJQLsMqp0FrilRix+WemGK+qYI3MXmDdyfmRxZCI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=u+oI3no5k0s/zhS7u5oJndxYGogey0DDz82Dvt5N0NES3KF6AOumxnTGdchpMmSdGtoynsV3JhSf+21TfKJHzhxHAzZpWvQFbIsSfKcqg1fDLwfb2MM9rc+1iBobvugCxM5KRRIAOEvlmSuR7u4QqRHEuHRc0eXI7+kLolTwPO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HPiyv5r5; arc=fail smtp.client-ip=52.101.62.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HPiyv5r5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3BB8r51yboj+aAmkJ/QI02jyffCqPpoWRHNu/0SZHCsbspJk2a/wIsT2N/wuG1/y7+015ZnktblAXlS1nCH0kzHQ0JQMWFO4C4UUx83P63gK1PiM42Efkx3GIAN4+WwP9xxROZTmLejumHYianzkHXQpyPdFizmYOoJNsXoplo8392DrEAG8U+AFNph/o57eCOnB0HUBcpwuag0//XjPaPozXksc5S1iFuAQFmco0PQYam3o8wvaFhJpLYP546pPH6nt5zG2hePCX8usLNUUIU9M337QjjNJdc9U+k4sRcBbT3pb2OtPPBTYGIyPJwRtQSDh8+pM4XV3C8BOTbSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xzTPZKZm3g/WXzJC8Pu6yz9yEImXlIv4FHpZNeLt1Qg=;
 b=bd+WKCcwj9d30THodM586rPeBftOttDuiitLFL+jT+oV5FcPNugMFWf2pKqSLK7UHlXURUAcpaco0zkD49nc6xhQWLplL8vgVLg8+xptd1kPP1QRt7bYRzG1CzHkUQYuujLFGKc1B0PXy3S0JLYLBdKwaGYwze5dF9eOLKelmCfP7mI/5IqJw2qyED/gu8KxOtkc/8V3yOh4s5eJ+lNUSFPRCsyVESrnC9xnryH24LkPN/jw0KB4H+JbpOdRD0Qe+mepn9vRI/8Y3hQXvNReQishkCdNZJTzOEU24ynnU4GY9eiP/BU7xRcRIFCzSZqAYpOQJR/Azah1PEaqKwuwIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xzTPZKZm3g/WXzJC8Pu6yz9yEImXlIv4FHpZNeLt1Qg=;
 b=HPiyv5r5wOfK419JdGncGT2Cnv92iH+PQSmKf6wjFtYi+WU8FzT/909v2VF1ywTYFfTVHkgRl+4UK+Dl5ZJF79lbqbQoITQAapy+upbyUUvGysAb/Rggvxv0gtvqw8TxjJks8JzPDFhzlBFRqiKpkhxq6hXY0q8pnWXB/oxinsZHQ7xrfyPGpTSOHsklo6PRNMbVCpt0s+RTo58arAGIhvJ54VOhOQ86WElQxtoP4Oo9dpOxF0iWzWZEKjZ5+WKw1SDsnQj0k+srP8zCUYC5N8zpXBxeeoGP3pMrn6x6Y76Ti4lRlWS2XAct2PefBwnSAvFvizkhd/0vqXruoSuFHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6575.namprd12.prod.outlook.com (2603:10b6:930:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 10:38:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 10:38:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 19:38:19 +0900
Message-Id: <DK9AEF6E0TY2.1ABWKC641NF1P@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v5 2/8] rust: firmware: add request_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-3-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-3-ttabi@nvidia.com>
X-ClientProxiedBy: OS0P286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6575:EE_
X-MS-Office365-Filtering-Correlation-Id: 535f7cfb-c6ca-44a1-698f-08deebcb2f23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h4tgCqyJ4DFXK1+Ty2HtrEwyBosdl5o7DOWEwkkuWSbGXPMeF59vrdIa5+n/ch7fu7Ht0FKWOVTOrXzO98sfjJRRdR+vkKV35hUQYkq451S3xInHsj1p0jO6AXErpqpYmYTZgak4n5XQcSsNtzBRVOOwD9l7MXSFi3P0xAswZ1+iLDwQSsweRIsC9b6uE/bD1grurbpLqb+797hJXDNrd4KwRvysMoWw2B1FNW/36vSXPZ3hj/KYlyoez/ABw9adOybW6SiN3K33rU+LEEwBTTPKbDpJYibvHNzGH8lsAznWmm2rY7UlSorro+OViAap+rJq8yIGYHrwvG2EX4vxzM9Q2/3NeiIKixcVRw1uMdgRKgIceg+U+R+0a/lZW9ZmlMGf9O+usn1IclTapslkv99l4bmKl343hvaRxkn2mCY6dDbb6r6jmW6tNEPuCEGiwImXRfyX/YXiJgGLe3zBXt3hXnoIUPHieR2gurcYdLXORN519piOwBv4lmTQgK9nNrKBvUONqEI8fDU5bDYo9Ye8CzYdLMzRXHUH2iFz4EM9gMsvb8XEPyT2WoYk3szbFFHMC8kH7uX7KxG14r+O3IlIN/pCo5TXkHd/cJ3EkeBv8xTrrcPyisNZ5/jnHcbmsqAFki70oDoV0Nnyh4Qo8ZQQc9Lyo+t/hzef8rqH9L4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFljL2xaQmZESXNLcDhaV3Ayc05HbzR4c0JGTGpGaWRLSUQwVmxrQnorVnZ2?=
 =?utf-8?B?eUFlMTBUcU9jRFAvYVZQUHV0dzF3ck0rbWNWSy9xSy9YbHlSMGx6di8vUnc2?=
 =?utf-8?B?OTdwK3RFYVZEUEpuMEZSOU9CZittenlOMVlReDVTNjRraFBJRFZxZTNEUXFD?=
 =?utf-8?B?Q2xpUVovZi9GenFHTUNxemFCMWkyWFY4YWdxRGlvZlA0VGRQVzVuV2hqbms5?=
 =?utf-8?B?azhiTDZERUl5ZDFTRVN0TmxRSGhhM1lMcWVjMDlhdzNxTnF1UzVjU3NMblZ4?=
 =?utf-8?B?VXVQOThOblBXR01yNFM0eXZtV1YxL2l3aFZrNzM4SU1NVU4velUwZkRKZUZI?=
 =?utf-8?B?MmplWGFuQnBQdkd4ZjlHeU1tdTdnT2NQck92VjdRRkd6VHdRVjdJK25Cc0RC?=
 =?utf-8?B?anhSSWE4d2J3dzFFYnJUdGphTmpiQ21LcndIMFhmTCtQYUluSW83dk5GRzJB?=
 =?utf-8?B?UlJzRkZFV2ZKZkhkQUg1UUxadXcrWW0rTm53ZHpVSkNGSjkrRkZkVkVDREhl?=
 =?utf-8?B?REtxbkFsVlJqNy9ia2VIdE0vSGJkK215OXQraXdqeEhMZ0pMcFVBR1lRZkk1?=
 =?utf-8?B?Y3RldU9nVzZxSmR1RjBpdDEwaXgvbFJMaXZRZ1o3MWZ4Y0lRVHVlMWp3MGlj?=
 =?utf-8?B?eXdJd01ZeG1McG03REswVnNSSGlXbERTQkdYUkZSMzJxVnluZzFEUGJvQnpx?=
 =?utf-8?B?VCtBTlFEUlZ3SmNJNVZFcWxXMWVaaWZ4YjV4YkwrR2xXenR0dEgxMEdBSTVC?=
 =?utf-8?B?V2NIVXdlcXpicHA4TFo4cXVQcmNBZWMvZkxiYy9QanVXeGxXcXlXTTlCWkJv?=
 =?utf-8?B?UnVVbkRPdE5RR0R2ZE8zbG5mWkpPNkJUMHR2NWphV3p5d09wYWovUXd0dkRx?=
 =?utf-8?B?TnZINFZ0ZHZJZGd4eXh0Z1Nsd2JWekVxSFEzT3dXeDdiOTlEbzhLOEZXMmFW?=
 =?utf-8?B?eFFzSTBXanl4Z283enpXdHZ4VzZUZ05XZmdMQ2NybU1WVjd0MUI5azJvcXZl?=
 =?utf-8?B?RFQzd1AreXNORHlub2VRUllOQnZKMncrVHR3K2h4TDRUb1orK2JYa2UzVGl4?=
 =?utf-8?B?ZU80S3dXRDduQlNQRTl1R1ZPdVYreW8xZmp0Ly9MaWxFRFFqOWR0UXFGeHF0?=
 =?utf-8?B?QmxBZ0lqbzJoMy9ncit1blY1Z1FSeGgvcXJSSC9ZWi96Nm9qVTBsTy9KczMy?=
 =?utf-8?B?RmloMDkva2V3MzZ2S1UwU1BwUHVXeFBOaTdHamI4azJNU01TUksxUkhkNkZC?=
 =?utf-8?B?cXJUWStOYjNaQjVvcGZSbTREdk9QeVh1QUtGdlZ6TDRwSkxBZktHY0hiWDZC?=
 =?utf-8?B?eDhDTkF3RUxlOWViT3ppa2VNWlFwM3BKbW1PWEVQSGQ0YXVPTks3QXl0dTNB?=
 =?utf-8?B?aHU3VDdTbkZ6d1B3RnBxZWJkQmJPeUd1SkZVcFI5V0tjWkZZRms0QUI1VVhX?=
 =?utf-8?B?dEtNdWZUSFZaVFRvSEN5T0s1S0JQK3ZCUzVOQTFZNGdhWmZFdDd3eW5KMDBN?=
 =?utf-8?B?K293cXNNY3BTaTRLZ2hQek5xYVVDOXBqb0FtdjI4RUVwbk1mL0xMZk9PTktI?=
 =?utf-8?B?UXBjYWNoc0t3Z01mQTB1a3IvMm54UTArZ1UwQmptQTk0V1J4STVVY3UzV3NV?=
 =?utf-8?B?SnVuVzVydkVTTW1sSFZIOUp2U0phMkFjN3dJZVZsT3JGSDBKZkNjVXdkK3c3?=
 =?utf-8?B?Z2xndEUrY1JZRVEwQmdTM29HY3ZRM3hwVnRIRFBCSit5UkJLRjlFcW02bVZK?=
 =?utf-8?B?MXFEZ05uTnhBN1JuOUppekpuQ05GalZRbE1Ecm5TOTdJbnJwdjNpTFV0alI5?=
 =?utf-8?B?S1F4aFA0OS9pNGtnSDZOVUJLQ1pWaUZvZEU0dmNkNURjNUtzZmVzRThmQjg3?=
 =?utf-8?B?UWd1Rjkzb016Yyt4RitKMVR0cWxtc2lGQzdnVTRrY294cytDdDRLV0VvRS9k?=
 =?utf-8?B?UGdKdDd3RGNJUlUvd0RGbDZIZXFuREFQSW9wekZUQWJ6dUUzNS8xQllBZ1hl?=
 =?utf-8?B?Wm9LTm9VV0ljTm9wL0xHdEg0aHFpUitlaG8wYm1GNUEvZEVUcFZjUGpIczIx?=
 =?utf-8?B?eWpFNDVFclkvVEJsS094dko2NkZQaWdXU3lhblJHUHVYNlJOWC9SeXIwaTVG?=
 =?utf-8?B?eFYvRzhuMVlXTVdyWWpmemlCL0s1TlZTVHVtd05kSXhuYThwR0NUN3J4cHBj?=
 =?utf-8?B?a0J4TVd0OE1sVHJqQ2U3NE5YcEdZYmpFT1IraTZkRS84TFVUbUNkVklnYjNO?=
 =?utf-8?B?dXZydXZkOXE1TDdQYmZHVFlMQXJGZDN6a2d1Z0hsN2FXNDRlcldaais4RUxP?=
 =?utf-8?B?b0NqVUpCVEpXM1VBWmxBenJ2Mnl1ZlUwVmtGT0F3TGpnU2p1U2lJeFA2Wjdn?=
 =?utf-8?Q?h/awClq+VpQfXY9uVOOvhwLOCFI9XUghKjj851GqElBwX?=
X-MS-Exchange-AntiSpam-MessageData-1: E9LCx+jES0pZVQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 535f7cfb-c6ca-44a1-698f-08deebcb2f23
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 10:38:23.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkNOGMdMYYt++qJGi0QlH1q/HOfX0DPawymBNfv9B/ae2KkJw8bOnPE0ggQ58okalzd/BmfLrXVFArVFhxC83Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6575

On Sat Jul 11, 2026 at 8:04 AM JST, Timur Tabi wrote:
> Add request_into_buf(), a Rust wrapper around the
> request_firmware_into_buf() function. This variant loads the firmware
> image directly into a caller-provided buffer rather than a
> kernel-allocated one.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/firmware.rs | 49 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..84b499ca822f 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -7,13 +7,14 @@
>  use crate::{
>      bindings,
>      device::Device,
> -    error::Error,
> -    error::Result,
> +    error::to_result,
>      ffi,
>      str::{CStr, CStrExt as _},
>  };
>  use core::ptr::NonNull;
> =20
> +use kernel::prelude::*;

Also this should be moved to the `crate` import block above.
