Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012067.outbound.protection.outlook.com [52.101.48.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7422046BA
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 21:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236467; cv=fail; b=OWkyMhKOqoBllCT9uKQmoIqVoyLc+WtWkoJItZLUpq27FCfvoKJQS7VVbPTYezWy0zgFlbV2EHOXYL8GLYljSPGocBcCaJB7E2B/GwKK/8t7psBbcUbeuY9+LvFblTTp/gLs7/DHpdQZ5JXBeMtm2RrEVcvwLja3jXrCCsNuvCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236467; c=relaxed/simple;
	bh=i3Q7p/OhelvpFZy6xhITG1C9+BXQ7bidqD2RX38AgS0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=agmmyNRmrDk77+e4LslF5g8THfgaNvvDnt91lxqwryDBe/x77yS4eIMEwnBWIIGsE1EIOwGuKmRQbe42IRbV02LznhIM/TwQDyRW3SeBevY2ISrwBGQWdYS2nyg8/8oB/XhnX//cOY9zWaSNd9rvyAE0BIjKv8HM7LQq12ZHD4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sldyJOyC; arc=fail smtp.client-ip=52.101.48.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sldyJOyC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xDXomE3CEvFlOiutQ2tfc5+A9gB13RPtx89nihHAfSLxFlLVlEQ5GqeW+UQhpB+wrLDepDM1agmBlRyFWeotboBmARmkq6woA+wb3uo1mFebfH/edFE4pLBw+0flUuGPAFV+oZfte1lKR6U1JTo83AfS5ycrfT5poeDEDU083eqHTjl7ywgcB7bWwit5Ulv8OTmwkU9LHxu+cXXqdZNMVJfwjDWvVUFB5xsPy6IOCW9JanaIhumbcF+FF4xo+zKkFjZ0v4V+xSjCwpna2O7OlSAZVN/JHIRmHijAt61WEpbQl7hJLOC07y89Up7jiSSS6D1uXnqGiAbO6QtqG6/ijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3Q7p/OhelvpFZy6xhITG1C9+BXQ7bidqD2RX38AgS0=;
 b=XMvR94WvuGa32dGXlMkshDjkcFbAxGeDTDZYkSU2xosmb7MBnwnM0wvZJD+XGbjjmO+79+FbTRqBbhNCB5DclnUTUrYkhOdh9C4mE6Uk2J6Te3vvDs+wknad0+AZOx0wybr6x+4fWrSXFcDAmh9vkXEF1toXarvErjGZiq1o5V68BvczrUpcZIuZ+HQtoAt2xhyXwEaqKhL+KB//geiwI1bLdHQ3xS+IE6vm5P8QcUc7pF7KoSQxsvrtKPFRxRCVq5kGvQb5erqqnjKQRx5lXi3dH7PDgYObudard8662553XyBne7Wu05g/fg5uvlM5mm9aDc1WF23jq8xQCyjZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3Q7p/OhelvpFZy6xhITG1C9+BXQ7bidqD2RX38AgS0=;
 b=sldyJOyC5qEKLnQBRpU6k/Q9Mqul1QElWQRhR5L+rS3S5Y2+XAkRIV2yYZVEgFpIWZb8Ezj8oYvdi8Zc27rwVqTlML3plx6rgC++WaZdCtR1OftIvzfHRJN0r9gL7EH+b5Dt4lw1AlKh8W+/H7XSuuXOZzmh+Sd22jXbAZfqJuWYp5GOQcbkCGSfjLe8ZPBVwJhA/LeemnGIt+L+akUsg0Hn63z7mwLMvVfnT7ZEhXxayuI5D4HAMSYHdzkFnygQAIIiabL3WHfWVOB/TcUofCtfGcS/tGvfney9ASZJ/reHgqP+SUgyWyWPBNMNMcUbm7I42W9QIy9zNif8YQQW+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6521.namprd12.prod.outlook.com (2603:10b6:208:3bd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:14:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 21:14:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 14:14:19 -0700
Message-Id: <DK0B1DT3E77F.26OKPQ12Z70QS@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: io: document const-offset requirement for
 infallible accessors
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
References: <20260716142545.3622278-1-gary@kernel.org>
In-Reply-To: <20260716142545.3622278-1-gary@kernel.org>
X-ClientProxiedBy: BY3PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:217::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6521:EE_
X-MS-Office365-Filtering-Correlation-Id: c757fda5-ede8-401a-ae2c-08dee37f33db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	zoZCugE/1Hrr/mKeZWpxl7iqACSHqlu+gvBSKpjymOLRQyxzUUImISAmQdX3QbmmvKgOH21GDVj6H8dq6YeFPWwa/Kp6bAy44K9ttuMSATJLh+elJ2AaZE3hzfU12PGte2nw+PVtDYTUcTznXS0PksUBAkRUGeySVEWdIiipuxSgfmjj86xHGfoRVhJh4ck4DSkBBbQijAZtcp3WVmSbBJMYTFO5YxnaDfR8uAMbP1ScgXl5qP1M6Sj/P71kvV8VMkPY3MKV7smUHZOYc4tVxSdlvmkrzRu59HEHQpGPN4ki1+1GW9q35l+6pTcPDITmyaHR0v1hx7IDBlxrLRxM/Ubh3kmlhAn4d3BAUhub4t+FEs1znPSHzNe/KG8RbpHf2IOeiI/bVuKSodDolUx5etiGUQ5+mI5LZUVvy0TCqsiln4oL0G4mo3GlBHM26K8HlTamSI5v5tNDLyVwk80yuwcX5iQ3F8aOr/Z9VvTLpnczX7bzGQgMsvAtTBmVvx+fwK8+A5J3cXX1b0vYq6Nhv6dZQ/gbgxrVlCOGiAXurQ+iphutOCOlu3KvYqG7XCTWTp4wBCIsgE/Le14kkNYgZnQNEnlroZAButaeqL8uC0GPJ+Xtc5ot3uW1Y+65tFnJKJVhAe74SML8z4Qqk4fNMXNpqRROI3sh/CnkSrsr5Mo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG9sUzlrYXVvazBXcjh2VnB0SVJENzJORDFPQjVSa0lJNXFLdm5iVXFvNjdq?=
 =?utf-8?B?MGlzbEwybzZYNWl4NXZZMzk2V3BiNWtKMnlJWGROTE5MUmtNdEhmNkU1SkxX?=
 =?utf-8?B?L1gvOTlROXlTelNIL3hQeTl1VnFISUQ5REordXg1czRPSGI1aW1IaEpJUnlG?=
 =?utf-8?B?aDlTSktNUVR6Rnd2blFnbENoeXk1SVl2bldpcmR3em9FNjRlQTdYMHRmdmNF?=
 =?utf-8?B?bG5IczlSZ2g4WlpUeFRlLytzRE5YcTFKdDdSS1F2UGVDb0EwTVVPZnFHbkZj?=
 =?utf-8?B?SDFpcktNT2Q0ZGxYV3NXSlRKMUFTVi9tTjNWNjFwTTU0U3cwekZ5NHpJWDBj?=
 =?utf-8?B?OUU1VTNIbmlmZjlZNUpGcWdpaHo0bTJNajZQcTMvWTJjY1NTSmJDT2lwTTZw?=
 =?utf-8?B?bHU0K2lSVytyRFU0MWZZUWJhaE8wdjl2NDNUSkZ6ejlrdnlWWmp5VXRQaFB4?=
 =?utf-8?B?TlpBN3FWMDA1RnZEemozTkFPVjFMRGdTcDhYMVltY0hjYTBVZlN5NEM0NEYw?=
 =?utf-8?B?bTVlclEvaXdlSlBtcWV6NVRVd1UvOGUwYU1CUHJQa2kvOHF1ZWcyV0IvMUx1?=
 =?utf-8?B?ZkhrckFnVzkxZVVRWk1INVg3ck1BakJmRkJMWWtBRUl5NlVId2g2bTJGYUoy?=
 =?utf-8?B?U2lZVWFOaE03MzJlclA3eklxb2RCZXNtazl0c2g3aU9rZFBRN1dkV25zb1lI?=
 =?utf-8?B?QUUybTBTM09WY004NkkxSjNQUUF5RFpIZlRTOSs4ZjNJR3I1SnBIQlExTDZG?=
 =?utf-8?B?TkpURHJEUGNMVndjL1V3dzBTY1U1YjUwUkx5a2ptaS9RSkcrZmlVSkQ3SHp3?=
 =?utf-8?B?OVoxVWQyWURYYmQvdXhaaVE4dUJQWWhGamFOa1lrL3NyREZtTXVObjg1d1l3?=
 =?utf-8?B?cEE4cTAwK3dOMEltTHhlekdna0doeG1XeFZvMUc4aStML2w4K2RaZ1NMZFNh?=
 =?utf-8?B?eS9kbEExbXpFK0IyRDNHVU9rWFpQVllOdkd0U08wQTZBS0pRdElFU3R6VlpG?=
 =?utf-8?B?djA5TldkcUNCQXlIb2tWUDJNTFFtNWl5Um1WdzdOVFdmSzhVK0xvRHBsaDNy?=
 =?utf-8?B?OVJLaVk2YzRuK0ZqOHpBeCtIRGVybS9mQkpNMW9QcGFmL0dxcVFXYlBOY1NO?=
 =?utf-8?B?cGxrQjhteEMybERKZG1FLzdKY3E5RThrU1FBTHJUcTRwRGlhUExSNVVMaHNo?=
 =?utf-8?B?czFmY1lKaG9oUFRFcDBnZVBxTitmWDBOYW95TGlHTWdFR08zN1FoYVliMjFn?=
 =?utf-8?B?SnAxTlN5R2hxa0dNWERnbG94anpTR1VrcVJyck5tV0ZGamdqZFFiem1FRlFo?=
 =?utf-8?B?ekhHSTNxeVFpRHp6MlNpaDcxYWJFSmJvVTV2VmtEMWJBYXNOYTRhMkdoK1Zl?=
 =?utf-8?B?QUEvNW1aZTJEUk9ySHAyVEhwZW1ERmkyYjUyajlBVUgzTWVscWJZWnEzQ29h?=
 =?utf-8?B?Qk8xUWN4YVVtRDh5cUVqV1NFTVNMRlFHS1g5d0RyOTlZT1d4S3E4a0tHVGsz?=
 =?utf-8?B?K0oydnk0QmRoVTJtdzZoWjM3OHNmUFZXN0VuU3J6MWNzNWFDUWpPczEzQ3pW?=
 =?utf-8?B?cE02dXVqNHZFNmVES2FRT3BVUVBLeWNHV1Z2TW1TK2poN2VjVGEvUVpMZWNu?=
 =?utf-8?B?ejd3UXJNV2VnRmFOSUh2di9NeWp6eTNTVElaN1FhY1Vud0hKNGJzc2NKbk5n?=
 =?utf-8?B?ai9YRWxoSWR0elI5SVoxa3IvanFBMzlCV21oUnhSNDg3dmRlR1BRY29VdHlI?=
 =?utf-8?B?Mmpjbk9OMWtQbjFyUHJMNUExZWJHblRXRnpseUx6Y3UyekE4T1BuYzRmZDlv?=
 =?utf-8?B?UzFVYlloaDl2Z091U1lEdTdiUzJUUVdpcXdiSnNPNEx2bSsxcnV2c1o3bFFj?=
 =?utf-8?B?aWJvRnBiM3BrNjhlVFB0Tk5xTHBLamJ4STM1KzBpWm1jUWNWSDU2c2hFVzhD?=
 =?utf-8?B?ZzhhbW1laXRUOHFsMkM1bDZlK2YrZ0lydURCQkJ3QlVHWk9IQVF4dnRwdXdp?=
 =?utf-8?B?UXRIMWRORkRzK0lFb1h6NWRCdmJpUVQwd3lrUDhZU2lGMERoMVFXT3JwVk1D?=
 =?utf-8?B?aXJBcWt1SUhxR2puWGZOOG1iYlRyOXdBR29PMXoxOXJUUDZuMWJMa2g1NzlN?=
 =?utf-8?B?L0lua0tyQWdvYXd2VHo1NS84RWY0RllwWGJEWVVkd1JZNmhIOGoxdTZrQmJz?=
 =?utf-8?B?bnJSRVk3QkhERUExY0NWUW4vaTR4ZEMxV0llSVFZVEdRVjNxRGM4VHdtazky?=
 =?utf-8?B?SnJpMUlRT2d6NXA5OHI5NFlRNlY1c3FtTWVBUUhXaGhhM2ZoK0F0dmQzQXMy?=
 =?utf-8?B?aElUYnpyMXVOZUpmZFREM01PNjNOT2ZvTmxrY05xdzNlUjZHQ1FQUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c757fda5-ede8-401a-ae2c-08dee37f33db
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:14:20.5543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z23xzTdHNZA2UPdEt2tY/O9iNGMPGolQz19+t9Q0N1yz67vCAXEVHezfdjYNvqEI+By4RKHO4V+TFNr+3tosxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6521

On Thu Jul 16, 2026 at 7:25 AM PDT, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> Due to the usage of `build_assert!` for address validity checking, these
> accessors want constant offsets. Non-constant offsets can work but it
> depend on compiler optimization levels, so it should be avoided.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Do we want to say something similar for read/write?
