Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013056.outbound.protection.outlook.com [40.93.201.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA97B367B93;
	Thu,  2 Jul 2026 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782974372; cv=fail; b=jkfegYIhpywJSX75Gy6zGumIHjqHNltiaNkFFiBmtE4QWJQIO4KUKBMp3MmeeiqK6v5AeHK0+FGDZBr/UYS+ZhEwWKXoTBWRrToO/VU7vOV+XDrp3MgchWu0biQdcKkYMXkQjk7b/z92k2Ksf3+kY3HTSF9UaxpQD+/Sf0XeuyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782974372; c=relaxed/simple;
	bh=rAB1KOs2ZUPGg5ySudLwHPHjujEvNwYNzZSoqa5Ni8Y=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Jcf38yc084BgDOhVjQ5/+ZYzTYNuwQlc/E6NslNkFXCrVcBHNugNEQyYIfdf6rPeeEJIVRtK/uwA486eTAk7o/0LVmqeNEEBbbrschY+nEqsrKWV507zVCc61z+cxtjvaExmQ6Kf5SKkpnLnAs+u7n4OvMjwH3CLGOyGgpe6/IM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d0obQS5C; arc=fail smtp.client-ip=40.93.201.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d0obQS5C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdTr7lhsOzG7bLZFi+U4MINZ6kcenfuPu8sTfwvPjY2uiTux/k2tLEjc/hh2OUYlW5HBSBcV07R6tHPdJ34QmS/fE2g7W10JXm7dBn1kUpvcw3n7nMmaEYcH2Hq79vjanG5SKcY00q6arA8RbbutMkh3JJXDMc8cF4iaX/aJXRTGNLL+pLHXnIdYF8RqnrbWzoXuCsiJ/TJgdt15yhwLlz5fvN4eOdTvd3nsRAnX78kHaeGOi5qZKwheReiygSa+wgaLbGm+bmjhh348Rg2MYq3/HnhA931vywOhOQK3C7bYaDmnOiF1UeylloMHHfxUoCZDmnP+9zrZzpDfGc6icA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAB1KOs2ZUPGg5ySudLwHPHjujEvNwYNzZSoqa5Ni8Y=;
 b=qIMJaWjn05cqKiLHPUZN+DV2OtASSNUm1vxvaiweXDIvkkk40kvR0Rux6p1z72jcW+t8aNka4UOtsDJ8iM20zlaVwmjlVmJXIEOV33DH/jvKWFq6Av0hWDS/ynVJnq5um2REQzmH1LRQjp6452vVvbnzxPDBiygFeTE0xZ5/ZR5WsWGrwaYhU1C8Nce10DSz82K2oBgLcyXracCf3f7BE74jKbIWOnHKsosRE3LacTHoLk4RaiQaUdv2EfHSmN2HQtwlu/OZAnafhKXel3p2SIax9X/sYIJ0WJrZLwK1gtsa/gc3xfVA1Ijf1gQQ63eoiEKZ2a872/xLhjP+SPeODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAB1KOs2ZUPGg5ySudLwHPHjujEvNwYNzZSoqa5Ni8Y=;
 b=d0obQS5CzlmOIhiOHXxi/d28slOxvLITcRUFeori/ZGwBGGligZ61+HoXDLxEdNNeEVGTzW29baukwi/iZHARNHN5zJIkod6B6wXsnUc2aYt+FQL0LHhXEqemSg584yqW0WIDclmz8J59FZelUBnZwj8jEOPw6kGWV1DS+klf2D/azfzX797PZb43f1GM2jt83KGAz97hGSpCh66GKilqgARiOJq0vPSWcUGfZ1ky9fcy5CGLHsZKclk0p0Dn1oiG+EJuiUknRAcBXalavzCs0WuU/5Kaotfyi5SfRtzaBwPlECQ5gRJntccN3Ql4Dp0vZQdQ7jM9OezuQV3qgEjnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8141.namprd12.prod.outlook.com (2603:10b6:806:339::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 06:39:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 06:39:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 15:39:20 +0900
Message-Id: <DJNVNTMYSFDX.3QEP1Y0LPXLZB@nvidia.com>
Cc: <aliceryhl@google.com>, <daniel.almeida@collabora.com>,
 <ecourtney@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <deborah.brouwer@collabora.com>, <boris.brezillon@collabora.com>,
 <lyude@redhat.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 14/19] rust: drm: return ParentDevice from Device
 AsRef
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
 <20260628145406.2107056-15-dakr@kernel.org>
In-Reply-To: <20260628145406.2107056-15-dakr@kernel.org>
X-ClientProxiedBy: TYCP301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8141:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae8feae-316a-45f6-3729-08ded804a80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10070799003|4143699003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	t7cZEXONZrPyKR4t/3tpmCLMqluJjY2Wr7i24zIuJd9QRUBEKftLpcsTvJWYboke1/hn2eO9dnDRrkgKLpAweb800PAbiIkkbOm45pNox/EAc+PvLWpNYGT3d3F1nImzE1RDbk+u/tjT2r/iyl+JrKy0kbE2ncCuHKAc0UBCKmhnJ+bqmknYzCnJAkXeRKUh014Yh/H9N5eWER9K+n757YahNG6GCAvYqHrbcbQJGQbGjGq6w4jjE05xsG7PettfGqHBeqz8m+YaUjmSB8ETLPNP6VmFlHk/slznZ7Bq/WmHU/saCmk4EAXYEv7VgrSbYtCX85CkpEGHtRzltdQf0CXLiq6AqpMmPJpKE0iHdHwAVYAb+oFBCfc5IzRaByIX5HcQtdYeIKHoSlm8HsfIhDeIc1OybjwnNCPJOQvk40NC75N8bJcxrJMw3sGtPEzShgVsdOyrorCU6ytBcRmq9NU4o4u5N/7rh87eCy8X7CAuLXDsTpykmA/Ck/+iStFYw4F4i0v4ToIMWcwbaL4Hk6802TufgXkVXhIJbWHsxmhkZT4TREiczIzj0euUpJGPtuS0K5vrpaCBEkuH+wUvb/yDEFFUdf4kXmTNd+4ui1ETiNSf1U2huO+6h8VosbE51f0nXhUrT/CFulqKjX2nk/ECVxWgti6Zlpdi7jtCKas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10070799003)(4143699003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mi9uY3BkRzJjRlNPazJUU3A4dzR4S09DVUhEY0FxTkZrMmN6eVpaNk9sZDJG?=
 =?utf-8?B?dERZUkY0ZC9Ydzl6YnJKNk9ORklyU0FLVnhUeDEvdDBpc2QwaEJUMnRodmYw?=
 =?utf-8?B?NkVvUnhKRFphUmM2cFBjZW0rRHA2QTY0QjVkZmpUL2VQN0V2UFNzT1NScjF2?=
 =?utf-8?B?RFBtdWNvTUVmM203K2N6cWxES05CT0t5QVIzYzR3SytwNGZ0V1NmUnNVR3Zr?=
 =?utf-8?B?SFZOekV1cEF0ZjJwN0F1dUNQc2FTNkM5NlYzK254N1NCdFZoejB3YVJGUHhw?=
 =?utf-8?B?WHpqRUVWOHE1N3g5elhWd1lsY3NpaEdpd2RIaEZrSVUraTgzMWY3OUZSNUdk?=
 =?utf-8?B?UDdMYlRGamxyeElLVTNKV3NWaXFVd1FORXdKUHJUcHRVamFNQVplN1hYMkhQ?=
 =?utf-8?B?YUY2NWZGRDUxaU80dmtCQTNtbGppOE9ZY082dlJ4dHJrQW9FV3RYb0k2OWJB?=
 =?utf-8?B?aFlLQ04vVlRzWFc4RmZUNXNrMHdEWFE3U29vbFJxMUpscnRralhlTC9wTmd3?=
 =?utf-8?B?ZDZnSEk4a0tnU24yR1N5RDRHSGFUeXVuK0dINi9jenpmUnFkV29tSkpSeWlw?=
 =?utf-8?B?bzlid2MxVis2OWRIV2h0UWx2NTJxUTVYL1pVL2wvWm5yR2NsSEtoNENrZWlV?=
 =?utf-8?B?UFRKTVliNG0yR0JrUy9uMnZqeURRNVJGMDArbGdHYmsvUC9odXk0a25mY21W?=
 =?utf-8?B?RTkvRWUzZ2U2OGxKYlB0Q1FkMlhid3BKQXNXQTRlYURFYXF4S01XVis0djV0?=
 =?utf-8?B?bUJSVmRWK0p4UGhxTCt5T1NReTJGTnp0MSt4NllFTXk5OGVPMFYwb05uODlX?=
 =?utf-8?B?SktpZmhpdlJ6S1hobXBVTjlQZXJoQjNEZFlqa1VHcitpNVF5Vmd4Tk5zeG00?=
 =?utf-8?B?V3hzVFdpSGpUMmNpN09hdjljc0VobjlKSG56UDFlV3Q4TDZqZmc4VmQ5azIr?=
 =?utf-8?B?eDdpTGNNZ0duOU5IWnovblhsd1h2SFJ3S2RyK3VTalo4Q1VHNEhqcXowWEkv?=
 =?utf-8?B?NmlUYnpFcC9CeDJmcFNxTkFWV0pPckFGalpQVHU1S3ZhYWlTQW05ZEJhSEt5?=
 =?utf-8?B?UWRydDBwTjJ2NkF5MjV3K0EvN2tFeGJIU29iZ3NqZ014c3Fqa0JtRlFIL0NS?=
 =?utf-8?B?aTFmU3N5ZVVwQytUbjBqRkVVV1Y5ekRUTmwrcGVGcmpUR2NMMC9UYytXOUVp?=
 =?utf-8?B?NXFXL3JRZ1VaVWlOOVBodE5NcEt5dGxMVXZ4Mkk4dTVmci9DSmNSbk5ZUC9N?=
 =?utf-8?B?L2xmMGg0c000UWJMdFpLeHFTVm1uNmJ1RGt3WjB4Y1lrM1l6SVVBT3pFSTlq?=
 =?utf-8?B?QXNvcTFsRXJTRXprbWJZTVY4SEpKZE8zQkU4elRJWTlqWlJCL2dxTGkwZDJP?=
 =?utf-8?B?dEV1M20wNkhEbTJraGtSQVJDeHEraG1sWEdNL1lQMFNPZkJQT2N1R2EyZE9q?=
 =?utf-8?B?RmhKQkU3MElwa2RMVFBFb2c1WkVZL0prdUMwUG9hQXNYRXBDWjd0Y3AzKzd2?=
 =?utf-8?B?T3FEQWRNYnVRRlhCbktGS280M3I2QW9XVkFuSFJzMjRuWTBBb0NWSFhHK3M5?=
 =?utf-8?B?dlUvL2pRQWNBM0lxeUhtS3ZvV3IySE45Q2NzOTNIZ3RybEJTcTg0enFtOEFS?=
 =?utf-8?B?M2lUQXFtRkNIcWxBcGxXYlJDRVhhTzdUc1FRMFBYdUpsUXlWamZRUEhqWTgz?=
 =?utf-8?B?NjhkalM0dzdsZCtKLzdLOHp1SjVoTEJpVHpUWDNuY3lQTlF2TjBjbnExbFlZ?=
 =?utf-8?B?SnI1ekdpd3NTT21iVGpQTHZrMWw0b2Ftelk1a3hHMGh6cnZ3TmIyQ2F6RlQw?=
 =?utf-8?B?blhtZ2pmN21hRS80ZVhocDNyN0xKazVuYUlLZWhkVnlWdnVCdjEvM3VpdTFZ?=
 =?utf-8?B?YXhpTjF1cmdNLzN2cEx6UWFvcE1idlZPWmFnQmN2RVZZWUltYTBOcWFUemNa?=
 =?utf-8?B?TTdsMHBwalRsSkUxdmN6c2NGOVZFMFJsL2hwRm54Q2hBYk9YQXpPb2dZWWRj?=
 =?utf-8?B?c21SYjY2dm1IMHVRSDVad1pUVWVWZXFKNW55UlFSUU90a1dYUzBFWDFTMkY1?=
 =?utf-8?B?dzFuM1NxcFV6M3NiV3VZZkFDSGZvNU9BblFRTTZ3ZkZ2dzhjL2VDaVZBbUpz?=
 =?utf-8?B?dHdHTjQxMVluOHdqOFpVN04yUWltSWZDTTZWYnhkVXo5bnBQM3U5RkxBeUVn?=
 =?utf-8?B?WTc4ajBXTzhHV0FSanUwU2Y0TUU1K1pReUYyMDdtUkNRUzZGM1dGV3VISDRM?=
 =?utf-8?B?K0NyN0pKZTZXSDJnMmkxdFFnZVd1SktScGNrM1BPVE0yZWVZVDlsMG83WUFT?=
 =?utf-8?B?M2ZMbE5xZnFJZC9IMHdCL2tZc25tcDRvb1BCTTQyZzMwK01qVSswSWVLcTc3?=
 =?utf-8?Q?7npn5lR4dX4VppC3rO4WkMtySL0I+TIqHNIheA4BKe7ZI?=
X-MS-Exchange-AntiSpam-MessageData-1: NdX02laxAiOf3A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae8feae-316a-45f6-3729-08ded804a80d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 06:39:24.5821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +glMjlfPO+36ieSawMDF+/yEdhDiUg3WcSwjnbLrQzEgnRXJIhvufA00jxsOYFL63jN6J8ZwqeQM2xAXxfejdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8141

On Sun Jun 28, 2026 at 11:53 PM JST, Danilo Krummrich wrote:
> Change AsRef for drm::Device to return &T::ParentDevice<device::Normal>
> instead of &device::Device, and restrict it to the Normal context.
> Device<T, Registered> still gets this through Deref coercion.
>
> This provides access to the typed parent bus device rather than the raw
> base device.
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
