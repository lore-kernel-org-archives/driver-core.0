Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DABA3E2ABC;
	Mon, 27 Jul 2026 08:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139622; cv=fail; b=Pa1CKuDaxS7coYpV+YTSvO5NA01usYIN+dBDn6gw4/0ytKh7F5eIA1z290xl9CW7EGQ8bgc4jCxTmTY1seXXy1t4IGPel8U3Ra8LgOM0p+5KoQ7wC6k3s4EC8p1FthpE9ugSzWMawqyGZgO+/2hnxLXWruD/y7ZAiclfp12eZ6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139622; c=relaxed/simple;
	bh=nc12pCyn1nmiRKN7tCEUPORj7x93mF9IRxGgG3oKuDY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=d9bOGEg9kKpg4Bp9UWrZjvFSfi/uhttDBTZpXxnVuXhu7Alnfk12+sAv4oPDLZPVGbXvonK09NUvEbLreAEE+sei1nvS9n7opeSbqEC2b0u2pbDLvGUa9hXypvTEMU/G2IAoyDGR8ECgGzswQ0baeGmtQNaXyDaE/dgHKW6YBLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=urqhR7H0; arc=fail smtp.client-ip=52.101.43.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="urqhR7H0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpAb+a1Jwa6DwSrqdc4frhf3O/1MDlXQ+Ro4FBS12UDwsqe6fcuZueAL/xyZKpouEGGyi4uJ3bjYpi08SB9jWV3R4HPqe3/vWUnDmgXbxW1SQEelh8xQ1FqhtN3I7gygufaiOnSmYar6YU6mp/JZ5AfLiSwcPtZzoNbk5p+o/ioTdbufGdyY9HUMO0dWjsMORXIOkHZdArSQaoj0FLV1TVb06Si6mdCSCxluZegl1vbqrpWDEmWyEvvNKy8CAHZfOjMV/+4vQouD62vRDgo4DCE4ZZDPJylEtWfuUoG0QZxBqpVV2M6KqhKgnsT7d+6uTTMd5gZNtzzDjn+Cw+Esrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc12pCyn1nmiRKN7tCEUPORj7x93mF9IRxGgG3oKuDY=;
 b=CLeStvdoNtL+K11hBjqPA7Use6rprwFkMgdyKivxUWSWUWywQ2BQwQHlzppJDs22WsvzOlrJwJL7oM7zR7oNlWkjrogqiVce4quChQ9aYjAPoUXHTMlXocxKvY72FYfdff/I0pPDkPwQuoqrxaXB705zDguEmy2UAHO3mLcoIsrl7FXuoOV5nlnPXqoSiV4jGTWlDDXJNL5wUk4hT4M5cWN2luNBGwqU2QBjN4Rt3TujxRUjTcsVMu8jUQHqPU4IS6dhFxF9V+QTbtd8m10/viHM3uhl+mdB81oxc9iEBCfsuSTZrAHj/QJAdNo8YkMfaToshFaciCc7QXyE94xWMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nc12pCyn1nmiRKN7tCEUPORj7x93mF9IRxGgG3oKuDY=;
 b=urqhR7H0JdKUQeMoS7jcdFF/+pOLW/8U9m/azBeAAnnvJHSPikBS0DrQf0C+mhdrHu1KqAUqj++PFEkUFHHyCxAUjY2SvGho5wvudvg3hqABuUwt6YuUUN/llQ482YmQptW7kLjffhXqtXqaNb3J2SGfXs6iuIGE0qhH99ZkWxmI1Fyhu8cVEdNCb45u5zRVUzmsiNnbxn4rI/MnLBxUbq6R00OFc8FlzfJwuSaat0Bo/vFphc9JPi38dT70P/CVfNZo0RMUdAo7HI4HUEfPuL6SwLPWNUBVKZwQpbg42e3JK4WslK/TVL73ILiMQwiwKNUHxO3lV7TjxToTVH66mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 08:06:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 08:06:56 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 17:06:53 +0900
Message-Id: <DK976GZX46TW.2LCDS396N4EVS@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v5 8/8] gpu: nova-core: update firmware module info for
 TLV images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-9-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-9-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f52458-6707-4d71-1af9-08deebb606cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LNNhWUdppPZxFP8s2ReuWwGYRrnbqIXeqXWnxmrGn5jDF8UIJNDrRpHor6wjLgXuCMIwurJ45LPgP23G1ZdncBZT2TwZbsTGVMRL1sWzI6B5sTuTvKs34a6CiTq03fmCZgZ2YH2Lk95p7uN/15eK2I5zGKshQGB0I/toe0pr4KHqetHKlfAGugPlcn0vKCXJlb/G3ubuv0/gG73frs5lWxtVp28ONhT0p2juw9wP4LHiZb1pOp8EVq1Ebhl0uD16vzk9I+4dYSYxuAIBaN90Q3z06HWGqIs6ZtherOCoUfSo6W3IBFUj92eJmvNk1GlxsGEBPqbxJBF4K2Wlioyjc/9XddyrSFdBIwnHb48o/3fJOvukNjrtjh7rsfgVxt/3XEzHRn4SsnAXhUk3Nyowo3KI8ukoVE1QIIVG7hkDI1Pxtauw3HsnbrpgxLusOEmyJ8Wm9h4k49dGVnuQ5dZiVrk4FaFrTu/ZuielvF9PAJ/x8+XwHNG3Ns9c4nnC8WOyU8FOQ2XK3XqbH4t3lE92aBcxUUb7hyQJgS4f8JxeLW6XHmbw8Mq/0TnADpVftw5MjwWfOeY36w6Tuiy0gqgUWVC3y7lmXdc0VwgiOUzubbaSNsIlZ6HoB/36dISLvDMocQKokl2vEb6RVSNdUJfOjtg1dyN4Xztyb+0r/SkOH1U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xTaUFUMWNDaGgyTG84cGhVVTdDREZHRGY4VndnZFg4cDdtaEpzODFpbE8w?=
 =?utf-8?B?OW9NRWs5R2tjY1JSUkU5ZUVIY1pvTEx3dU43VzJ3UDRqVlpHMzJQZm5HWEFy?=
 =?utf-8?B?cEZMZ3JZL09UQ2ZmeDlySThJWS9qSUJzSG9JQUltRjlaclh0SWxRRm9QNXhE?=
 =?utf-8?B?YngwWmx2bnR3czJ2QVE4SStJc3BjdDgwZkhJYmc2T0ZESGJqZ1VSeWhwc2g1?=
 =?utf-8?B?WmQvc2RrSmtNa0k2V1VxUUZVeVRJTXJUQTJDeXlJdFM1eWRJU1JkSHVOdTZY?=
 =?utf-8?B?N3F6OWQ0bGdpWUJ1TnlxelllTFBuaUVpaFE5MEl6cWF2dzB6WVVLWVJSeEZj?=
 =?utf-8?B?NTVoWG80MDlJbFRxSUZ5VzBkU2Z6UXdrOGRMYlRkYVBVazQreVRMUnkycHlk?=
 =?utf-8?B?ZFBQWFlFOVNVV3d5UTlvR0hjWlNPUXRlb290RDRnbTFZRXBxa2V6Y1YxT2Qx?=
 =?utf-8?B?TVQ0SUtTNDJ3Tm8xRzZxMkVNQm9ZbUdNeWZYTlhaSC9ZMGtHczBHMW9Hbi9Q?=
 =?utf-8?B?L3o4WEM0ak5sQ0lIeXNaMWVzTk5ZYkNIZDBmWnZqS3prTXJ2a0xjbEpId3JJ?=
 =?utf-8?B?blV0cWFmVXB1K3RqZ2IraFV6cFVSZHNqSmNGMGNwbUZVWlBlaXF3VlBIRDcw?=
 =?utf-8?B?UGFoK3lHWFFXZUJFdSs5WVhmdi96OWxwcnZua0hKcjRoclZSQjJwWk5oZ1Vr?=
 =?utf-8?B?YXlPdHUzdUxJbmdyd0llSzdhbUxlVFkrOTc1UkYrQzh1KzE2eXBCVm8yVGhr?=
 =?utf-8?B?WHRCdUNTa0VtRGQ0L2xSZVNnOW82WWg1eWFNSnVVY0JQRTUxc0E0bStwdVBD?=
 =?utf-8?B?dHorR09iS2Q5Tm5GMWFLVDlLbUVtMDV4MG04QmFIYmpGWU9ieTFVU1ZXalJw?=
 =?utf-8?B?MXhwQSttaU1MaytNVjI1Y2hlTUxlRzhIUEU3L2hrTHdhbDJidm02aVlpQXZr?=
 =?utf-8?B?Tlk3dGJ0NmI4ZVNJRFVaa09sQWZMVU5tVFp3Ykw5QWNnOTlUcy9kb1ZqMlpi?=
 =?utf-8?B?KzdrRjdPejgxK3ZHN2Foa0xlaVFSOUpLalpRL1IzaXd6N2RJNGRzMTg0TjF0?=
 =?utf-8?B?VG9FRDBwZThFZXd4L1JMT2RyNEFPU0dSMGZBMjIveE9HUzAzNEJaaGMrbzJQ?=
 =?utf-8?B?akxLWkNYbGRzS05TUUxuQjFiNkFRSTcvRGtvS3AySUp5dFhJaGMxNDdrY0xX?=
 =?utf-8?B?UzRlWmFLWmZBcE4rWlR4czZaSm9PZUxIZmJRWWh1ajZjWkRpQjVuK0xLVzdO?=
 =?utf-8?B?WGZzL05CTitEZm1iR0Z1MFkzdEY3NStZVGdPUll4ZW96OVVWQWNOcU9PMk13?=
 =?utf-8?B?emQrSyt3NFRabnVuQXVQQjREbjNtYnp6dC9Rc2E3UXE5OHA3YlRSWVF6dUxS?=
 =?utf-8?B?YkxpS0RHdG9JYkpPdkFzT3N3c0M5RTBMaE03WGR1cmlNT25NNXVBTStHYldi?=
 =?utf-8?B?bGQ3QTEzVDl2MWd6SGNTM3BHTlRuN1hxaTArVHpBc2RQcE9LditVRkFZYjNz?=
 =?utf-8?B?M1hOZGQrQ0NQZHVJOU9VMHJsdit5UmxVcCswU0V4UmliYjNIWmk1cVF4dzVo?=
 =?utf-8?B?Y2I3U2U1TURXaDJRQzM3SVlpTHh3dVhoQmZEOWw3cnNqaHVicE9pbFFRYXFY?=
 =?utf-8?B?dWorRjl1Q0kycWZrT0cxTnhGd3Z4VHc2ZEJzT2pzaThrTlZqMFppTi8xeC92?=
 =?utf-8?B?Lzh5YlJ5SE1OUE9hNDNYNE9ZYUI1Q1Y1NWxkMXVTcEtCYzArN0tJZnVYOTFH?=
 =?utf-8?B?b0VvbGhjSnlSWVRSYllBVHVUVktEazNYVlpaQTYvRlkxN1pjR2xZT3BvTWZ3?=
 =?utf-8?B?Q0JuKzloRUljNnA4S1JCSllPeDdtY2c0RVRhV0J2dEdzZEt0U2gwYVZ6ZXk5?=
 =?utf-8?B?REoweFp0bDBUMG9CQTQrUDRRUG56dVhxVVRKa1dyUW85ODJyWkVqSTdxbHMv?=
 =?utf-8?B?MkdoYkdNMUI3VytVd2RZVjUvTjlpazJ5c1BqajF0ZnoxOThQVFJJYi9ROTZM?=
 =?utf-8?B?ZWxPNGxoZ3J5cUg0a1JMVnVsMUY1Y3ZXOUUySUpJejBTZE1iRzUrREF4NFZs?=
 =?utf-8?B?ZWVONXBJL0xlQUx2Z21KOEdPNTZRSkRmRnB1TTFwZnZKNFBrRENtZUsvT3Zh?=
 =?utf-8?B?ZjhScjVQOFI1WHR5YW5wRFgwRWhod0E2UE5KajZ4dFBlYUdDc0lBaFE4L3Nl?=
 =?utf-8?B?eG1aSEI0TUVTci9rcm94NlN4SkUrLzAxeVJDMHRvbThUSnpzdloveEV2ZUNO?=
 =?utf-8?B?eGtuSVBTaG50aXZPbElVNCtWdnZISmxTNytTOElHZW83aFI1SjgyY1NPa2lp?=
 =?utf-8?B?WVhlYTRlUU5aT1RlUURxZU5oNUtQNXlScG1VMVZ6Q3F3a2tsVkI3T2s4cTd0?=
 =?utf-8?Q?8/ixpS1Rgig/RBbS4lpjmbnEZDM8ql83/+6v1tsYeBP8h?=
X-MS-Exchange-AntiSpam-MessageData-1: xMv+hBetOUDRsQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f52458-6707-4d71-1af9-08deebb606cf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:06:56.6711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: icMwWO3vM6w8khhuOr8Ka0c74LxQ9d8wG/d9DMq/iuUyR+RYM7E2fzRgoVGd8nfHviy6befoQpPlUlcDLdb3KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172

On Sat Jul 11, 2026 at 8:04 AM JST, Timur Tabi wrote:
> Now that nova-core loads the TLV firmware images, update the firmware
> module info to specify those files.
>
> Also remove FIRMWARE_VERSION as it is no longer used.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Doing this in one go creates a potential bisectability issue: there are
points in the history where the firmware entries do not reflect the
actual firmware files used.

Can you fold this patch gradually into the respective patches (4-7) to
avoid this?

Also, preemptively: note that the latest drm-rust-next introduces a
helper `boot_firmware_files` function to get a list of files relevant to
a given chipset. This list will have to be updated to include the `.tlv`
suffix.
