Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010070.outbound.protection.outlook.com [52.101.201.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A542DA55;
	Mon,  3 Aug 2026 13:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765123; cv=fail; b=DUdhK8YtUtIFu+lgBq0A5YNFv7qHOsyFqkXnegOquRUSAgmpi4kPvA6r8gyHVD97XMSxCInZeru++XNnqzBTLAsicvvD9eYoYo8weBMVEWYqNn4twB9kgm48BaSxjQxHdUDR/CdABJNvTCBjEeL5Hv/I/j5GoPaztlD9+ZMgI9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765123; c=relaxed/simple;
	bh=PACk3u7v2y1y7l5V0qRMfHmY7OPCwJmyHqBeudsMI/E=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=CY+AtBzOdGiNGryXt0EZme/EyNSYLUaSyJFazB3waps3GUTgo93Or5AwnyS/ru9qq3e0BXUbE6oheTU69Uzu5Oan8nKisSN3DgTKs5BDRkUkxUCzjSsQGITo6Q5W4bqsHECCWzu78/kNcljBvDXETIYzTsuRV4KVLUvZonEsGU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gtLdt7gT; arc=fail smtp.client-ip=52.101.201.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gtLdt7gT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8/4vNgCQfco3AYK3QSYc+vdAUTjewy9uimkCHnjCAJn6INMgqDGc/wCns38pXwtybC+D8kdFu+rSz39yOCHs5hgICf7/uodg5huVUKHDVjYuT/R08qfMh0OVhEDQDU89biTeD8LY7+NM+PkmY6C4J/QufTohA/CjegfiX3pVKsCc+NkNZf3xaHpD25JQf7SRieZmDFAJq3p9cIYfG4c5Hpv4J3KpwU/4fUdVhEaRLAM+VuxaPeLaI26nRk6aNb904sEmg0RSdrwHGrmzoTbrToJ29zNtYbq8WPo+d8SFK5zU/zdIoMSPAz61o6lzTVfSVqqnl8FFOH7GATX8LIGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vvv6rMswwwqujWPGwe85aGkB0sTygkhbyv0j8+M+/Eo=;
 b=MHS0NV5aX7IcvTgaTnxcaWjVNDTdsbjS8ms9wo5aXvo1ycRmzyknbWrJpvJfZR/rm3aX1Nba4O/EzNinJ83vik0rCcNpaU9PGm+1uucENC5lWsjONWnr/t9R5NNB8OPboV8JY45pY+6Iw50au2qTVx8nCoUZ36kHou2VMyNZTnNESuttOPgamJEiGR7WZzURwAgRkcZi+2Y0xNEwTgIMbaBo+q9cEiDDunOxGcmC+zNZSNBOS1IcFDt6MXsp4YN0hjihoOFSDTgLajvDly0uudtka0drDz92KA3VkfrH1us2mkFVrKRu30SoqIiva+1eAX2dw+RAOI5e/qmEidBWXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vvv6rMswwwqujWPGwe85aGkB0sTygkhbyv0j8+M+/Eo=;
 b=gtLdt7gTXNPZbL7YPGxtCan9SczQcK6ourWiyXeToRk3xJaHpLfyF5MI6WuzZKlf1t0OuBa575+1Rb+2lw0h23POu9WjXRRq2rJ3sILkR6iOt1lFknS3rDgKIaFp08az3hbfnQpOgtoDIhJQOWlqXGe69ZHUPVTHiLxqjp+LOTRGJgrrsOHKkYqa7B+nM7LYdqKPKAJ2N3PyrcAB2R1GBef3jlKCk629Shjb2rfczhpncYFakIeX/l31vfvYN5GQeJuqGPS4UWCxRQa5OpdVKjbuBvFWS1HAv2kzeE45WvjJ2KQMbtRC4AsCW6IYSGtIM4Yj10hDZXQ0v10ImuY4TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LVXPR12MB999198.namprd12.prod.outlook.com (2603:10b6:408:3dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 13:51:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0270.015; Mon, 3 Aug 2026
 13:51:58 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 22:51:54 +0900
Message-Id: <DKFCWGG1VRLY.3BGUVD5H17KSZ@nvidia.com>
Subject: Re: [PATCH v7 0/8] Transition Nova Core to TLV firmware images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Gary Guo" <gary@garyguo.net>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Content-Transfer-Encoding: quoted-printable
References: <20260731201017.2580713-1-ttabi@nvidia.com>
In-Reply-To: <20260731201017.2580713-1-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0101.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LVXPR12MB999198:EE_
X-MS-Office365-Filtering-Correlation-Id: 1595ae32-a229-47eb-512a-08def16662df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|56012099006|10067099003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vYjlDHNgYAnuo7hEt9GZ1bZrGrgITw00GownYtyyi5hyNgYvdJ6LHQ/Li4XaiCDOmXCT7NOCJC/EoZeGsx18UDwFOjQNfM10okOAVMw1GJg82WggZsJem4BJv0pcHZ4E1N36yp1Ui66+ugB4V10DYQYEMOag77Y+kS0jux10EFW1iU3V8sCR1Kna87XX/3b8+sWIJlK0m4Bb6VOj9YnrEapzRowbclS1APphiESliebDxQvRMnK9r6g4crSieiMJeCEXO/AW2hzRX4Y1PUv6uhXRusAiRatAjnmLcQ+P0Mb14QHI62qmwzVYGuM/LTOpizQyBfLZtDKXpQjtGoRFN087MEy8X1Vblm5Rb/eJo9WUzCiOR6+RlNoIkUBY01gO/nJQL3RurklSAkiYDpWnQTD1FsP4oEe8Ly06ChKvprkN7J0Xza+rlIT0SehPtGRB1moWEnthouVfX4vqqdaovBEWvoNGCptF/ILlXiD6IXuLrAtJBJlW766bMUSgBA7IekLT62hg0ELIjaF5tdOW6hH3oD4ANgi2mP33MZxEA8QVNEkBD9BIJG1S5fbVljCtP5VMxDttC404dcKHP6EWDJdKQUNQzs4HB8GHTQJ7wSxUxCrS7itDaO2qQRaBxqWJ2mXBcLD7wN81rQzphSDdr0DGTszopHAfMj7SeHMKSgg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZPdlBUTXFkWVBGbFZPd243M2xRTmVZTy9Bam9FUEw2RVNxVldCelJpRWRv?=
 =?utf-8?B?SkZLRmxaZzVmd3g4UjZRMzVibm1ZRkhFL2JFRFdSTUtPcCtLb0NLN3Z2d1VC?=
 =?utf-8?B?TVB2amdUSlVvQmtGdXVaVmRZaDRmYmdTY29nTjhpTVYxRmxHSElvYnRoQURH?=
 =?utf-8?B?M1FCUzV2SFl0SStCQ3YvR1VXTUsyNUk4OFlkUnJUMThvSjBXVFl1NTRseFJj?=
 =?utf-8?B?NXN1eTZLQjZUS0NqM3V4MHhvQUljRVhHVDQvcVNheUNhU0Y3NHhWbVp6RlY3?=
 =?utf-8?B?Zk4xSGp2NlRkOERNZUFDc0Q5aytNdUxxTlVWNFdRUmcvTmFNZjRvMXNjdmQ2?=
 =?utf-8?B?cGs5cnJTZG1uYzVDczZNeUpoMGFWKzNEK2lNQUNZNXVSR0FnVCtlYWhzblI2?=
 =?utf-8?B?R0VEekRBWmprU2x4ZFZ2VURLZGFLbyt4SjZpeE9qMllLaE5obVZyaWpTbncz?=
 =?utf-8?B?UXI3VHFBQ2t5UTBnc3BlMFJVMjdNUlVYWXRzNm1hVkc5K2MvblludVhtd2lJ?=
 =?utf-8?B?WmY5NDlOc2xSWUVNQTM2ZG4xNjB1VFk3eTl4MU1Ia2FqRCtDM28zNXRGc1RF?=
 =?utf-8?B?aU02eEpIZlcyS1FadmNhcW1BOWUrVnRtTTZBcFhoUHdvU2g1Q2xwWU9hVmFn?=
 =?utf-8?B?cWpFemlqWjk4ejYrWTNHekp3VXd4R0JtcXVPU0NRdmE4NGpQZHFSYVNpbnBn?=
 =?utf-8?B?SVZOWDNvRkE2dVlpQjArR3VBVUZkNzdRT1dJUDhheUdOQUhhVFBWTHZzSkFY?=
 =?utf-8?B?M3ZBcVZ1Wk1TT3ZTTTFNM0xlcis4Vm4zb3h4SC9SMkhJV2I1azB3Qks4RTB3?=
 =?utf-8?B?Q1dBZnNwNk9jL0pNdVpWR2NIUjQ5YlVtdmV0SGc5TUZTbk9xYkF4QVN1bTh5?=
 =?utf-8?B?NU9NczdseVUzQy9lQ3hMYS9OVnRlcE9ZaTJZTGFHMXR2RUtkWjhBSjBYeTdw?=
 =?utf-8?B?UXVscGo2TENrQ1E1TGFlR2lEMUhRSDBNY2ROM2lad2hFdEloTVAwa0pGMlFI?=
 =?utf-8?B?bmVTUHRvQ0RIN3lWV25wS09vRmFDdi85WENYNHdYaG1nV3F1ajB2Wi9WV1k1?=
 =?utf-8?B?Z01LUkc3ZHhaRlE3QU4yeCtsZmlkcnpKdWpoUjR3WmdXZUJtRXRsbGlRd0NF?=
 =?utf-8?B?ajh2bnhCczF4bUUwRW9NbDgxSDlXVGZ1bEhHTkQ4RDdrWmZyM3ZzUzltREtw?=
 =?utf-8?B?dlJ6eFlkTG5vb3MvTi9XcFlDRU9xLzA3ZGFyTWdmUTZLaXp6eXBtN0hIdlRJ?=
 =?utf-8?B?bWJ4M2lPNHBqajRzdHd0UUx4UUxEVVdYNHE2NENSRkthdm5qcVNBc1RWaloy?=
 =?utf-8?B?ZTZUNkZIYTNJcUpnbU1QOWluMHpCWFVnVHB3VVdIRDZxZXhySjVNWXluYWYz?=
 =?utf-8?B?VmZyS1NjMHdSMzF0d2xPb1llcE9LY1I0NVNOR0JUVXNXNExYTUVvOFNCSHIz?=
 =?utf-8?B?ekJGL2g5Z1lOaUFnVklENG0xMnpkWXJCdnJQYVBrQ0Ruc3NQZy9ZVzN4M2Zl?=
 =?utf-8?B?SmsrSTBRL0NVdjlZNHR4SFVnQkt5aFlYSmpTUGFCV1cxRkpnYTFBandvQ1VO?=
 =?utf-8?B?Yll4K01rQ1UwQy9QZ3cxQWxFek5OaWYyaEJOeDNSVFNvQUYrWDBGUzljR2dR?=
 =?utf-8?B?NGpCMVBKZDd4ODJNOGFmS1VqRkNpcGkxNzZEZXpDSGo1Q2IxbS9Xb1l1aUpl?=
 =?utf-8?B?bmEvQ2dwTlR2dkhaUWh6MGVTeHAyS0wyR01zZ0tRc0N6Z0Y3NGVwL3R2NWw0?=
 =?utf-8?B?UzRTWkZrdFlYU2NnUVluUForYUgrcTFZaWdMNjdja0tjSUpmckovSWVrYVZG?=
 =?utf-8?B?OVRpakgvNkhEcXdTaEgyeTFwYTA1ZGsvZWRvN2hvcmVEdnVkTWlhMWM5Sy9r?=
 =?utf-8?B?OEFOeEp6UjlBU0taejVZcnhvTVhyMnRXOG8yaGh4YXNUQ2p3MWUvckI3L3RY?=
 =?utf-8?B?alhqUWtrSWIwdDZpWjl0OG9zSnl5SlhzNlN6ejN4K0dBMmEvbTk5S0RSMUVD?=
 =?utf-8?B?K053ampXYnpWVitqOUpxcTBCQVlBcWxkejd1anpNUnQvaVUzSjZ6bWh6S2Ew?=
 =?utf-8?B?YTdRWmYrS3lNYllIWUVxbWdpM1JvY25VOXhkVzduV2lDNUliM2xrM2ZrYjBJ?=
 =?utf-8?B?REJwWWowaUsrdmxNYmNxNXpjMkRaamNkVGZwWVBucHE1V3g4OE5KOUhDNXNL?=
 =?utf-8?B?eGgwOWRRWHVQRDVLMWJSR1VMMktoWGg0ekltZVBxYVVZdnd0LzRVWm00VDB0?=
 =?utf-8?B?MjhqbkJXeVVKeVlJV2lndTRsNmRHWjYvSGk5YXhhcHlJc2VlLzRUd1lXeGZK?=
 =?utf-8?B?TUNKWmRyZGNKT1ltcnZIN0RLWjdUZUx2OEZQT1N2ZEpXT3MveXEwRGJOTkpw?=
 =?utf-8?Q?KE7C/xSfa1l4SXx7wqCR/llsyr6RvcwLviI0roVpdnzUw?=
X-MS-Exchange-AntiSpam-MessageData-1: nzvJSOQfdfZO0w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1595ae32-a229-47eb-512a-08def16662df
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:51:58.3469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vzSrA3q56775VcdtkBDKwgR8PjjdTVFFsGFxjW6sH/6+FvQLHc72DQXOEXgs7koOjCyIwDDpB0ECAgNrRkWG6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR12MB999198

On Sat Aug 1, 2026 at 5:10 AM JST, Timur Tabi wrote:
> This patch set transitions nova-core to use the new "TLV" firmware image
> files, instead of the ones that Nouveau uses.
>
> A prerequisite patch "rust: error: add remaining error codes" is required
> to compile. [1]
>
> The current r570.144 images are a mix of binary headers and ELF files tha=
t
> are cumbersome to parse in Rust.  There's a significant amount of code
> that just reads in a struct, extracts some offset, and uses it to find
> another struct, only to have nova-core use just a few fields.
>
> The new format uses a sequence of tag/length/value fields that can be
> iterated over.  The script that generates the TLV files,
> extract-firmware-nova.py, does the extra work to find the specific metada=
ta
> needed by Nova and packages each one separately.
>
> The TLV versions of r570.144 can be found here:
>
> 	https://github.com/ttabi/linux-firmware-nova
>
> along with instructions on how to install them.  We are not planning on
> submitting these images to linux-firmware.  Rather, if this patchset
> is accepted upstream, I expect the small handful of people who are
> actually working on Nova to grab and install these images, which needs
> to be done only once.
>
> There are still opportunities for improvement.  For example, I would like
> to get rid of more GPU-specific code, especially the GA100 quirks.
>
> Note that there are plans to relocate these images into a different
> /lib/firmware subdirectory, to further isolate them from the images that
> Nouveau uses.
>
> [1] https://lore.kernel.org/rust-for-linux/20260629183022.2709524-1-ttabi=
@nvidia.com/

Gave the series a run on tu106, ga107 and gb203, all successfully. Each
patch also builds nicely without warnings or formatting issues.

Since this also touches core Rust parts, it is preferable that Danilo
merges it, so for the series:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Tested-by: Alexandre Courbot <acourbot@nvidia.com>

(note that [1] is also needed)

[1] https://lore.kernel.org/all/20260629183022.2709524-1-ttabi@nvidia.com/
