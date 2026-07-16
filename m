Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DC243F09C
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 20:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234041; cv=fail; b=halQXwE/kOWDaVJHxrbIbLv7XjGnzWRZI2+sGs6eVyi6ttRSu397m40eVnOMvMBcPf97EdTvMMpgWjoMZ6oe6jTyukIZZbnm+j10gXe3QbNlU5QEqgiZMSnguVPlqG/iNClW7NGgUWZd0xkdE1V1AeZ+m9dIJ1JGEdMLFmLx68s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234041; c=relaxed/simple;
	bh=U6Chi88N5AmziJQFQVC4FrYtzJrJUNOugjAlQLH7roM=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=UthRlQFEdablw9HwFGIEAGETMIPEUXs3dJ2xczr7YGlLM+M01PlBcW+Ov7/y+rDx5fvFsLQkAbEY5qj2sEs8lpHnFSG7EAKjRsAGMyIVw+vh7rLEOXG2i/UgjUhJvzFqv9R+NRwJVVvahQkQGpTaUK0yKHrjlvtVLTA9SfUEdTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cWjknsJ1; arc=fail smtp.client-ip=52.101.61.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cWjknsJ1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw4W2Keycsirm+J6zS+j75iAxcbIX6ya9IEdf73/Oxy6kk5ANyWIOBwmcKVP6a9S59DDhIFCgc/vkjWZgKYP8/cVIpWvxDhddxOT9RDgKfRoE7DPfSkvS+Db1NRKFnZ9vFtHH+jeRmNZUFKZwfjBA3dfeKPRASLlHpmoc/Tx+Vg8+8rl+puB3V9X18IU0tmOuCpzJtmE/GcBq/7loCSCH9hOGCMWoIfPk3iLhNG5ze+eaICpiSk6QCAGRtp3EAblbc2H4ChJNfw4ryH4BdY+BhYZFM8zwLmF2u9G2v6m3ldZHGgg8kZyxB4X9uO1hwq5e3aIGThsJJQNVKGPKOe3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMoFZi3ieRBlg67ktsj3LBxfpoC1yXBNvD0JNOEwFmo=;
 b=TUxHorIB1oVDlmyFfmBg698DBJIIysdgFrdgRGx288lXwN/KeODbopxiHjJBMISQ3JmR19221oCHcnIzPAdGviWG3yJOpde8pPdxYSxTSdJnlLBpt3JNA379hSCC+mtXbBDlUQbJZU3H9zfXgJszg2o562eyLHDQCEnHeHD+sSzu16xpo5vKAy6WMEFpFyoVBnbEFhglKW9XTCFQoGO+1+xquDRUT8Abnuk2H+F/XdM3/pdsc0hCdZ3fZz/zTeLBApeiRtwYjkOAmiH8z+MAL4Ouu7hyorogf6cUUelc6waw0/ScgFtvzN4K5Zju6DBw4sUa5T7qNU/UMpyCoJz3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMoFZi3ieRBlg67ktsj3LBxfpoC1yXBNvD0JNOEwFmo=;
 b=cWjknsJ1twoxDEO6pBwDxyoCX/BqnJkwWfU1InEyygZpB35tZQBjMcUN7LGdzlFqjCHVB9wAEX4AxVEhvtgzdWFKzPypN86C66aIdN++ls3GiwW/DFtqhCgeoVUvnJkGSUXNBRhY67J0zA6B3kB0UfrsZ/gaG8WOY8eA2dL7Ypl2shb3m2eqw9oHbiTQ/cMpv9Uf0n2fi/3fn+NRLCDzLO9hGeqzLZc9VtASdQTGsKGRRnESKbkxY2/HxmUgo7pIXTO9/1Eno8Ty+1m7eIw6XBfQCWZ4BwkbTGf2dTtFmJxuZ/ORjBw+HUmZjohGaiOako4Yhe2Wfi27hVHe64ShSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB8537.namprd12.prod.outlook.com (2603:10b6:208:453::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 20:33:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 20:33:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 13:33:53 -0700
Message-Id: <DK0A6FE3RARB.7ITJEIUVGTGP@nvidia.com>
Cc: "Gary Guo" <gary@garyguo.net>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Matthew Maurer"
 <mmaurer@google.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] samples: rust: debugfs: fix excessive stack use
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@kernel.org>
References: <20260716144144.3665719-1-gary@kernel.org>
In-Reply-To: <20260716144144.3665719-1-gary@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 73494e61-6e1b-458d-30b9-08dee3798e8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|3023799007|11063799006|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	qI/Gjj6S++KggtDm1NHmNPY/s06Yp4gbijM8aK7aDwbF7s6MFJZ9xp/lTaKaEl3mC8//lK1WCFQkU9I7+xHB1XXzvInX29u8fGvCrOu9Z3tWYoPV+dHdqT97hn8pIJr/BPQ+D/VIc15hz74kZaIIp6yOKuWT0xD0uoHK/AVUIOIVInHQApQ8neCZDQS3kUnlGUOuS6VoYbpmihjHY4x2HS8mtizhULDFudq+R57AKjoZOQlkTKKHWJLd9GvqYTjGsEHMaxTJQCDJPCuq4cB7OxNYuUKJw53xpov2/oTuQV8hhxHU+cwejLK4ds6BjYxKtsxSMw/dCfWASXb5LRypj59qgqe2q6DI4mjSxTuI6LJ4ivp22MSMilDf3sL8yqcWatVWuh6iYrVX26lEEO31vODriTyrOuK+KKPJdWR1+SFCLsMx1ggIsM8uVyGf/AyY02IrGBukUDekSI7O78xRCN2sCXdrBVJlO7Ia7IpjjmS3ZFsUHT+gK8iOV1Jdtw40XWEgJFnqnlgBr6Wlg5xWOouXXAFm04kkuUqiO7ZCMnQzbSacBG+Xw5Po/Vz/yU3WUXCXzJIElCHnprIPpHdo2FTS1EkKhqGH7umW5/ra/greqOw3dLl4DDKsDfAhLvEf3/ghV59w6SKohs+YKV+CmkY5RS1fy9TYEdSUv368pzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(3023799007)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWJPOTZnZzJDb2wzbzBFQ2NQelZsWlR4M1JUWUJxTk5Ucy9FSlM5a1c0bDhS?=
 =?utf-8?B?VWxMVktsYVNSVUVXNmFSU25BRm8rcWEvMnZROGNveTBzK1VZN2NrdjdFTStn?=
 =?utf-8?B?YmFPR3ZoUXVNaTJBTkU3WHczc1dibVRabFVGb3BlWnlRaUFTMzRzNHp6b1c2?=
 =?utf-8?B?SllNcGZQVHRwcVVIb1JnY3hGWEt4QVNzZDJtRWs1NU5ac1hWVW9uY2VyRHNr?=
 =?utf-8?B?OTIrdHM0S0owcDJkRk53VWNJRlc2VXYxckpZeVBZd0hETGxnT3p5TUNOTmhQ?=
 =?utf-8?B?eHlOMU80S09YbisvTXl5YVBqSEhrd1FYWW8vZ1hKaVN1QkVYa3lVVG5zVkRt?=
 =?utf-8?B?K1ZtTDdmZDRnMnRtc2tTRXBHL3FQeDRHVCtEM0Fjd3RqSHFpN1hzVEEzQndH?=
 =?utf-8?B?Mk9zaStyMVQ1TFRISnBQandzU0ltNmVSd2NocWVHMXU0QzNXakdYc3lUOXlm?=
 =?utf-8?B?cERyTmIyUlJ6UFRNY0xjV1pLM1VHRVF1MGF1andQSjd3ckNtWVFzUlVqUE4y?=
 =?utf-8?B?cFViNXAxM3ZWbWxMQ1NLdGdjSFNEcnphTzUwc0FXS3FIc2dqMGUyZnpHNkta?=
 =?utf-8?B?UTl3N1pVdEZnbHdydEpYZnBGVDNVL2xMOHJ3TFZXMTZjbXFNK2NJdDZFVVc2?=
 =?utf-8?B?TUFHQTJiTzZZSDBMaDZsMEZWMFVtUk9ZbFBMR25PWW9rWFlSRmR1UmxwVVFF?=
 =?utf-8?B?WmtsenNHZ3pLb254YTZyWkZEK2N5cjdVQ28vN2VVdjRYcHN5MmxYMm1UK1JK?=
 =?utf-8?B?YXc1UW1IOVBtTVByZFpZYUpQUzgzcHY4c2o2UXBHa3pQZ0tTOFNUeENQSU50?=
 =?utf-8?B?Q1VLdWUxTDFwN2Y3L3JCWUI1elZ0S3lQSGR2YXMrSVl2QzQydGEvdHVhSkJC?=
 =?utf-8?B?MUl4eCtUb1JKMHhkVXR5STFzUzl5VTZyVTBmcHlNV0VKZWNJQkI2aWVNQ3Fo?=
 =?utf-8?B?dzA5RkdEODhRM0RxSXZaemVKc0JDWElydktpMUNhLzBNYzc0UmcxUS9MT1M0?=
 =?utf-8?B?REUxWUVicFRNTmpTRnFxQ29mdXFxb2traTAvSTZvR0hTYmZSdlROcDdPSlNT?=
 =?utf-8?B?S200NW9CbytOVkFnbk9rV2dzWW9lOVgwSW9vb1hXdWtBV0NCSk95cHZ3bWpl?=
 =?utf-8?B?Q2h6RVZTdWU1Yi8yeWRXOERkMXlpdngwYjZqRWhOSC9tck5haGxmY3dHSlkz?=
 =?utf-8?B?Z0NPckZOS0VIS0RLQlVFbXlQNXlqRGk5N0NBeGxlSWgzQThnZVVGTFpGeElw?=
 =?utf-8?B?RjM1V05wZFFBTXB2MkMyL1pJMU9pMUJvaW9jY2wvSjBneTZrODljTVQwRGMy?=
 =?utf-8?B?ZDBzWEM5eGpkUGc5YzlyR2xMNmlJSmVxVFlJUUFzbzgwSXViTC9sbnViY1U0?=
 =?utf-8?B?cndvT1I0ZE8zbW82czlFUi90RW4zTzFmVW8xcVdFMzc1cmd5cG1GZDI0YWN6?=
 =?utf-8?B?K0ZwMXE4ay8wTEE1emtRbWV5eWFESHBZaFdQSTVqcUpqRmJ4YUVtWEtNVkxD?=
 =?utf-8?B?OGl5cVRXcE9mc3NtdmZUNFFuZXRXTXNtdlFIRWQ3MUhmN29sd3VNSEhydVlC?=
 =?utf-8?B?UGlPRU9oNU4xMlA0cmo1Y2tyZnlVZ042SkpGNHF4a3ExdFdMOEVwL2xOaHUz?=
 =?utf-8?B?MFVGY3BSQ3M0QW8xK0NhblloN3pBRHRaYWo3YWFqY3NDZ21RSEJyNWpEY1dp?=
 =?utf-8?B?MkFta1o5eWVndmRtbGYrY0FQSlJxakEzdGhqOUJpUmMvWGF1UW5nVDBaZ005?=
 =?utf-8?B?NEJCdFJRM1pPUGh3bXlhUXZpdkEyejZUU0xYNlhYSDZVblBqOTBTdkIyUVd4?=
 =?utf-8?B?VVlMaE1aRVo2TTRsVXNWRHZHVlVSMWxHcFVkTWloUTg4RnJ4RWt2ckhQQjdS?=
 =?utf-8?B?eTRlNG42UmpGUTVYYVNOVDdhWEZTWDJHYzJBWHVsNFNOT3pCbGRXYy9RQ0lK?=
 =?utf-8?B?cFhSRkUyZ3VxLzJISldxZjVyeTU0SUxmenl3T0wvc2M3dWZ3MTRMMUY3NnJS?=
 =?utf-8?B?M0V6QTV5R0JwZFRrY2RvRFhDMDM2OU9rRER6Z3ZiWUl4c0pOOVVEY2FtZEJ3?=
 =?utf-8?B?UjF6QUlJOXhra3l6SVgwd0M0ODR6VnBKS2FjZ3BlSy9DRER2cGIrcGJQdFBu?=
 =?utf-8?B?VVM2TGlzTmlYWVBJL0NleUdRU0swNDVFQUs2d1hHYXZvbUJnY2tvcTYwZFFa?=
 =?utf-8?B?UWpGNC8zWENER0d2TzNsVGdpeHAvODZINm53WnVGaTNMd1o5RHZINmtEMnNz?=
 =?utf-8?B?d1U2dDBvd0lGR2hLbFNNQ2M2WEhmc3Bxb0lEUUxMbXlPempvNktlelE5SzFr?=
 =?utf-8?B?d2pEbWZOQUFJbHBsR0FQS08rODEycnV4bGxhcUhteFMzUTV0Q05DUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73494e61-6e1b-458d-30b9-08dee3798e8c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 20:33:55.7194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CX3zQpsnqmo2TQuv0peTHgd1SpGImkB05mVeGuUqyMZplY6N7CjT3SrtRM1SS8qH+rF9TYzwZBS6pCqDnSim0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8537

On Thu Jul 16, 2026 at 7:41 AM PDT, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
>
> The current implementation creates a 4K array and move it into the box.
> Klint reports that this causes excesssive stack usage:
>
> warning: stack size of `create_file_write` is 4472 bytes, exceeds the 204=
8-byte limit
>   --> samples/rust/rust_debugfs_scoped.rs:54:1
>    |
> 54 | / fn create_file_write(
> 55 | |     mod_data: &ModuleData,
> 56 | |     reader: &mut kernel::uaccess::UserSliceReader,
> 57 | | ) -> Result {
>    | |___________^
>    |
>    =3D note: the stack size is inferred from instruction `sub $0x1178,%rs=
p` at .text+2205
>
> Use pin-init to create the array in-place instead.
>
> Fixes: f656279afde1 ("samples: rust: debugfs_scoped: add example for blob=
s")
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
>  samples/rust/rust_debugfs_scoped.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/samples/rust/rust_debugfs_scoped.rs b/samples/rust/rust_debu=
gfs_scoped.rs
> index 6a575a15a2c2..33a4a0865f5b 100644
> --- a/samples/rust/rust_debugfs_scoped.rs
> +++ b/samples/rust/rust_debugfs_scoped.rs
> @@ -75,7 +75,7 @@ fn create_file_write(
>              GFP_KERNEL,
>          )?;
>      }
> -    let blob =3D KBox::pin_init(new_mutex!([0x42; SZ_4K]), GFP_KERNEL)?;
> +    let blob =3D KBox::pin_init(new_mutex!(pin_init::init_array_from_fn(=
|_| 0x42)), GFP_KERNEL)?;

Since this is a sample, do we want to specify the size explicitly as it
is arguably more readable in this case?

Regardless,

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
