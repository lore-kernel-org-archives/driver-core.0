Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010048.outbound.protection.outlook.com [52.101.85.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451713E5A21;
	Mon,  6 Jul 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783319532; cv=fail; b=J9yKDDTg2MpXjtXFYrK8ZPv3Ml7+B9pQCXT82seIvJoLNZFtp9xfEPWg1CLN/0WgRiitPXnXCgUcBChxhySWZ0bYT8Wx1rX5zyf9Ec1Rr3CXabY0RN/UMStzdHv+dQEVQHYuaF1LNLHli5whU2T6JTBpkEJwrFoHmgCAQHIAUTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783319532; c=relaxed/simple;
	bh=elPY51l6lG9q5KvmyaY7KPYGW1uyBwa0JcNLjOLTjO0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IFAN0Nn9AA5JQB6xXZoAKgOSM+/Ru/XJckbpYc5CCf9r8olW+xYOOWoKSIDGkM4ZcVbv9weu+ZNGQ9T/VDKtXOwzilGzzLvtDiHhc1AiSevhawAk3U/ZQjJEHVF4X6SiUw+qkw/gGb3qogcVBmnS9Z3WHauyLG/5pTUjCNjcZks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AFC5XQxt; arc=fail smtp.client-ip=52.101.85.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AFC5XQxt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DspLlvfLR8X/OjBappdqQNRScG0QB3LzAzjZdaqELAIkuakGou1d1G/bgFLnhQyScFVB6m4+a0aiiDVJu9P/tiV9VYRYQZGKQ2MxWZai0MEjUUJqjdK/jNe81+8nWIRU4Jo6mnjy9t4UltRHOkJGhjlott1iAoOZZYyDr8s0hsbJ9kWloaQpQroxgbu4gxgcNKBtNS1mp3yMLiN0tlhm60nM6sDl9eZm0w9qHWl+dMgm1ULVLNYgKuCJsiSLI2dg/2bcm2l0I+uoSFGMP1BsDMxiBnZg53x+/52tUX7z0E+7jqPeaL2OtULAe0KwftiOf2Emjz1SzIbXOoK1KdQenQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96Z9kKN6AbK5GXzyT1I7DoXB0vcBdoKTAVO4FFnZLYE=;
 b=uqs5jPu2y9RKJLOM8TPeoqyDZZX75k4helSp7TyTbFwgVah0VRzfsU8sbBJxYjwKfUn7cpUNM8w6WktVKwkwk0IFYSF+GMujUFQx/iddvpI1s+DceHmAASDYRJS0kC2CWCvZlD0kcXGltbRhRSVT9/eGADhYEeYuB5uHKPvaRplnyKR4M1bJYbbV6M9RQAf6tQttAh2lAOZ/z35n5YnnYgrmvWw0pmGPx6tMfoODplhEnh5DAx58ZB2CsZv9E4gCoXHyjV+6OkeRl9nP/eJCKl+a/1WqvmtS+G1nE2lPVbWp5DETKUIYF4D3E8kwBfEMF+mg+nzTenpHdI53Pzi62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96Z9kKN6AbK5GXzyT1I7DoXB0vcBdoKTAVO4FFnZLYE=;
 b=AFC5XQxtmBrLWj272Fnel29r7kHkfm664Yxb/YA4ry3SLWZBCA8MsvXdwHZ3OmcszAADTl//gJ8I0J/k2hnvMlKBcLO0ukEslvkbiQ5/4iUHuMQ383vGsX2tE350aG6ECcpTQgVXeyH0NNDmQu4yppN1rChttL+kkeMEClsHkaxcS1oQWGREWB0pBUiDeCJ59ALstj/3ejvcFIUpcvV3nTCGPkYaKAPsoAeXgujoImaT5B4VIVblUwFCZdGVOBlBtOteCZWKXmc9Hw4I06tKddVZohkphiP+O7gGo3+PWZEV3b4PeeFP1DKOT3W4EiW+XMhdpbnBFrMb6H3rk1+ZVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Mon, 6 Jul
 2026 06:31:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 06:31:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 15:31:29 +0900
Message-Id: <DJR9ZZLA72BK.G14HXKV5E8LP@nvidia.com>
Cc: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
Subject: Re: [PATCH v3 3/7] gpu: nova-core: transition booter_load to TLV
 images
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-4-ttabi@nvidia.com>
In-Reply-To: <20260702192712.3450652-4-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: 0916f0d0-6781-4baa-e612-08dedb28381a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|18002099003|22082099003|3023799007|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	l8rNDL93VazeeRYJTFtaZ6mSh+R2gxGZcRniKiuXJQRZHG4PxkO6RohCzniCJNQzyF9QI9ZjjKeB7w5mn6ImxWauXpr/GPOlf5ROMu7pgGazqtkA5lywUCCpq29toALYhkYmHYddZETK8bqmJRyikUfwG2Sd6uXdjzcuK/Q2fFMpwJ9drLdr0F/85DI0n7PKuGVbHwixCqNb/Y3rJ4H91wieFRWDzeJmsMpXtF+H4Mk5pXf275lCSXxfJPI+Lr81vuUmJGZHlPCXCmkHu2U+XHEx7KG19oe9HurOy7Vnr3QnFiDrgSt1CTRb60HizZhddq+2WzHjh9gK78YJmacSR7T6iMpUz7JQRlrqTJAJwpKMZ6/K9LR1fmHvoDuMFBKEQVoo/YA7jq8gGOueFkg0o5vDNFq1U8pPxbcJsc2K4T4CK9a3+yqfG/HTqyZu4H0v1h28wE29QPFVrnE40lbz3IGJ+Qls4npbKPENV5qTqaF05ISsOERDWyKGuVZTv+Nlwgl4E4bXCGC5hN3bqO8Yz0c9zUhNDA+2y7f/QksL5dSXYsjUhsltD8/jm28tSFIaxB2vFeMyOjsvO/VXXE9t4uqdrgrlZfoGreIbol7Cn6Xr3X9ZTEgSVTrjokA3eElZ5ORO5twc0JQVr6iLOu5u6K2Znl9SGadNDRVRDaSZcZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0Z0Tmh4MVlHdjIwc0ljamVnV0pVQ0NPSVRwZEtkL3hrWVZpL2o5bGp4UzVt?=
 =?utf-8?B?VWxLM3BFVVhuN0RxRXVhaVJQdFhrbDRYV3V1VFVjVmFxV1VSZjJiN1RZV3Aw?=
 =?utf-8?B?a3J4dlN1bUVFeWVkQ0l1RitEVkNxS1dhMk1Md3piUDRIaWhBWkwremJFRktR?=
 =?utf-8?B?ZXB3K1Vmdzg4UlBpTVo2VHpMaVFFMGI3aHU2cjU2eWc4d21ndkpYaVRxcU9F?=
 =?utf-8?B?NnRNRFROenZsa3NhTmR2RFU1azQrSVY3MGxQb0t0NlRKK09ZYUpIeU94d2dn?=
 =?utf-8?B?cVFIZVV4SkliV0EybmMrOXJSVjJWTU0yNG1PM1J1UnRlL01tQVAvU1ZIR0V5?=
 =?utf-8?B?RGRuT0JNcnZXN0IvOUNzUVgxTFNmNlhwUDdXZXFhdkdWcjROc1lNMjN6YStW?=
 =?utf-8?B?MTFRNEVWTTRxbmthYkFvcWY2TWY5YmV4N1JHT0NHZmQ2QTRqRC9DMEZjU2h2?=
 =?utf-8?B?aHY3eFlxTzgxRTRnemVOMHBvbWpTK1N3ellZUXpqTm1QYVNCT3J1MUs3UUhq?=
 =?utf-8?B?eUw3RUVVaXpXWUx2WVk3eUJUZEFibEYyOU90b0FZY0NjQlk4YjJHSFVwdDRL?=
 =?utf-8?B?R3ZFZ0RGWVNsL1VlcUNJeS9HVUFhcURycDkwdXFJcmNmcWJLcHB6WDVWK3lt?=
 =?utf-8?B?SGNMcklXOFc5ZjhhejBBYTBNS0haNEhpSG1HV3lHVmN6NGFjcDVtTWt6TFRz?=
 =?utf-8?B?c1I2YlI2M0d1WXZaWDZrZk4vQ3lpaVFiTFZJZWtRckQ3MHJmUThFU1o1VDZE?=
 =?utf-8?B?ZXFpcm8vZVowZkRPdlZ0ck9MNThOTlhBVGJWOWI2N2hiclpkVWZNNk9MSGVp?=
 =?utf-8?B?cVlJekw2UHBseWJENXpaNzNPWVVCTGEyQjcrUy9WMWkyZlV6SWx4aWNCTUUv?=
 =?utf-8?B?cWh6V1o2RjgxdklqSzZwcS9CMEd2aWo5c1U2RVJlU29OZWg1VHNQUlZEZjY5?=
 =?utf-8?B?ZjJzaS9qZFo4S09sRGVWTE12NnZIZk4xeXlwY2xJSnVPdkt2SEF4NTJwczNr?=
 =?utf-8?B?K0ROYXZYdFFUK01nVGh0YWllY1M0Y3d0cUkvTHljWjZrUEJmSGR0VGVkVTRZ?=
 =?utf-8?B?ZlhLc1U3dVozblJuOG9yKzhETVdLVUpWNFY1MzlsU3EyRVJ2eHJiOUt2dTVE?=
 =?utf-8?B?Y2hWb2RwdzdJeU9UTHgvT3Byd2lrdEszdGx1eS9HMU51NDFqVi81K1ZFWG9D?=
 =?utf-8?B?OTZPb2lRZG1hVG0wRHJHYW5ZcitVZ1RMQ0d2T25tbTVwdVJjRW0wYU9qN3dB?=
 =?utf-8?B?c1l6Smk0d2ZadU1TSUNmQ3hDVkpBRHJDQXhBblZnOGhKaEhHNzRkaithUnFq?=
 =?utf-8?B?TUt3TGhrRU5ObG5vRFpnVzNqU1lsNnFtdDhZWFpIUU51d2p2QnExSWRDbjJF?=
 =?utf-8?B?SGNweVJ6YVZ0VkkySWlFbU5pNFAzbDBCTnVXNTduSWgyTnYzOGJKTkZRVHF3?=
 =?utf-8?B?VktJeUZic0VYZytlY2ZxWlBXQzViMTZyRGM3cXB3RGpwTkQvSjZUVVFzUmlx?=
 =?utf-8?B?SmlaM0NUWkZvODR3YVFNVU95Z2N1VlZ2SXdKZzRPMWtxbXpnQmI5QUgwSWhF?=
 =?utf-8?B?SkZDZTFaNWVJajNLK0RjcU8rZ3RLektXSVdPcHBuSnVSSjFLSnMyU2hobTEx?=
 =?utf-8?B?NTVJeitCVmdzQ1Njb3ltQVJGMnlwemZSMFBLaEFtY2VDUEtsampiSTBXazhF?=
 =?utf-8?B?dUdKYVBEOEhNYmFlaXBRZGhlRW9YY0FVcm9GeXRTYW5UeU5Fc3pjWFdKRm1k?=
 =?utf-8?B?bC9WdWZFMi9WdEdHSDJVS3JGeHVEM1RDREo0MEcvaUJtNHpjeUc4eEdKajQx?=
 =?utf-8?B?cHlhZVVabGExdGRIdm55UjYzb2x1VGg4ZVZWR1RUZ0FFVVFpK3NEMUl3M2d1?=
 =?utf-8?B?amNsRG1XbUtxeXozUjFCWk9lOWVOd1pIQUJMYzgyTzBWU1pGMmRUVHJMRHlw?=
 =?utf-8?B?dDN0R0pDUnZLdUhZZlhnK3I2SGJILzdpNWJZS09JWVM1azZmMVBaTVpVNFlw?=
 =?utf-8?B?RWJ3c3FqeGJrV1hKOXVSZUFlVWNlcUVlTmVDTDg5V3FCUk5ES1JsVjh1c05k?=
 =?utf-8?B?SFN6NWZac3EwUTdNQjRHeC82MEwzdnlEbG9LeTRma1l2UStmVHVieGk1U3do?=
 =?utf-8?B?cDFuNFc5NkUrbDZ6Wk8rRWlya2l5L2lMVmRiWVQ1T0M0ZW9SOFBBUE9xeUJi?=
 =?utf-8?B?MUxhT2pybC9RUWRoL0VLVUFiNkdUc2hkdm40bnZQSHYxbW9JQ2NTUkhHNlZW?=
 =?utf-8?B?OVZDWllyRzVhNllnRTVIRkU2bGkyMGt3REVmOXVWa1hFN3lZUlFNRjVkSU84?=
 =?utf-8?B?WVE1N3NzRllFR0RsVGtjcXRvNDkxU2ZHQ2Jzb1ZnK01xbXFjbXFrdWFoRWdR?=
 =?utf-8?Q?6YhLLiWXGhJ4YJMBjDa5GtxhjRKmJu9gMhZ9hqdrqsAha?=
X-MS-Exchange-AntiSpam-MessageData-1: zJmJ3Py4EGsrRA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0916f0d0-6781-4baa-e612-08dedb28381a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 06:31:32.0984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxHes4DBFRIQDPO4enn7uBRTvb1Ad/x25cZVIQgrq2+6L/sj+1cfV00TKS+JXk7xa4RLtoeswZPxp0xUBNpq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

On Fri Jul 3, 2026 at 4:27 AM JST, Timur Tabi wrote:
<...>
>  /// Signature for Booter firmware. Their size is encoded into the header=
 and not known a compile
>  /// time, so we just wrap a byte slices on which we can implement [`Firm=
wareSignature`].
>  struct BooterSignature<'a>(&'a [u8]);
> @@ -291,85 +85,91 @@ pub(crate) fn new(
>          dev: &device::Device<device::Bound>,
>          kind: BooterKind,
>          chipset: Chipset,
> -        ver: &str,
>          falcon: &Falcon<'_, <Self as FalconFirmware>::Target>,
>      ) -> Result<Self> {
>          let fw_name =3D match kind {
>              BooterKind::Loader =3D> "booter_load",
>              BooterKind::Unloader =3D> "booter_unload",
>          };
> -        let fw =3D super::request_firmware(dev, chipset, fw_name, ver)?;
> -        let bin_fw =3D BinFirmware::new(&fw)?;
> -
> -        // The binary firmware embeds a Heavy-Secured firmware.
> -        let hs_fw =3D HsFirmwareV2::new(&bin_fw)?;
> -
> -        // The Heavy-Secured firmware embeds a firmware load descriptor.
> -        let load_hdr =3D HsLoadHeaderV2::new(&hs_fw)?;
> -
> -        // Offset in `ucode` where to patch the signature.
> -        let patch_loc =3D hs_fw.patch_location()?;
> +        let fw =3D request_tlv(dev, chipset, fw_name)?;
> +        let tlv =3D Tlv::new(fw.data())?;
> +        dev_dbg!(
> +            dev,
> +            "loaded {} firmware v{}\n",
> +            fw_name,
> +            tlv.get_string(b"VERS")?
> +        );
> +
> +        let os_data_offset =3D tlv.get_u32(b"DAOF")?;
> +        let os_data_size =3D tlv.get_u32(b"DASZ")?;
> +        let os_code_offset =3D tlv.get_u32(b"CDOF")?;
> +        let os_code_size =3D tlv.get_u32(b"CDSZ")?;
> +        let patch_loc =3D tlv.get_u32(b"PLOC")?;
> +        let fuse_version =3D tlv.get_u32(b"FUSE")?;
> +        let engine_id =3D tlv.get_u32(b"ENID")?;
> +        let ucode_id =3D tlv.get_u32(b"UCID")?;
> +        let app0_code_offset =3D tlv.get_u32(b"A0CO")?;
> +        let app0_code_size =3D tlv.get_u32(b"A0CS")?;
> +        let num_sigs =3D tlv.get_u32(b"NSIG")?;
> +        let sig_bytes =3D tlv.get_bytes(b"SIGN")?;
> +
> +        // Booter is always signed

The `.rst` file mentions the non-signed case though - we should
reconcile the spec and the code one way or the other.

> +        if !(1..=3D15).contains(&num_sigs) || sig_bytes.len() % num_sigs=
 as usize !=3D 0 {

s/as usize/into_safe_cast.

> +            dev_err!(dev, "invalid signature count {}\n", num_sigs);
> +            return Err(EINVAL);
> +        }
> =20
> -        let sig_params =3D HsSignatureParams::new(&hs_fw)?;
>          let brom_params =3D FalconBromParams {
> -            // `load_hdr.os_data_offset` is an absolute index, but `pkc_=
data_offset` is from the
> +            // `os_data_offset` is an absolute index, but `pkc_data_offs=
et` is from the
>              // signature patch location.
> -            pkc_data_offset: patch_loc
> -                .checked_sub(load_hdr.os_data_offset)
> -                .ok_or(EINVAL)?,
> -            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map=
_err(|_| EINVAL)?,
> -            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINV=
AL)?,
> +            pkc_data_offset: patch_loc.checked_sub(os_data_offset).ok_or=
(EINVAL)?,
> +            engine_id_mask: u16::try_from(engine_id).map_err(|_| EINVAL)=
?,
> +            ucode_id: u8::try_from(ucode_id).map_err(|_| EINVAL)?,
>          };
> -        let app0 =3D HsLoadHeaderV2App::new(&hs_fw, 0)?;
> =20
> -        // Object containing the firmware microcode to be signature-patc=
hed.
> -        let ucode =3D bin_fw
> -            .data()
> -            .ok_or(EINVAL)
> +        let ucode =3D tlv
> +            .get_bytes(b"BLOB")
>              .and_then(FirmwareObject::<Self, _>::new_booter)?;
> =20
> -        let ucode_signed =3D {
> -            let mut signatures =3D hs_fw.signatures_iter()?.peekable();
> -
> -            if signatures.peek().is_none() {
> -                // If there are no signatures, then the firmware is unsi=
gned.
> -                ucode.no_patch_signature()
> -            } else {
> -                // Obtain the version from the fuse register, and extrac=
t the corresponding
> -                // signature.
> -                let reg_fuse_version =3D falcon
> -                    .signature_reg_fuse_version(brom_params.engine_id_ma=
sk, brom_params.ucode_id)?;
> -
> -                // `0` means the last signature should be used.
> -                const FUSE_VERSION_USE_LAST_SIG: u32 =3D 0;
> -                let signature =3D match reg_fuse_version {
> -                    FUSE_VERSION_USE_LAST_SIG =3D> signatures.last(),
> -                    // Otherwise hardware fuse version needs to be subtr=
acted to obtain the index.
> -                    reg_fuse_version =3D> {
> -                        let Some(idx) =3D sig_params.fuse_ver.checked_su=
b(reg_fuse_version) else {
> -                            dev_err!(dev, "invalid fuse version for Boot=
er firmware\n");
> -                            return Err(EINVAL);
> -                        };
> -                        signatures.nth(idx.into_safe_cast())
> -                    }
> -                }
> -                .ok_or(EINVAL)?;
> -
> -                ucode.patch_signature(&signature, patch_loc.into_safe_ca=
st())?
> -            }
> +        // Obtain the version from the fuse register, and extract the co=
rresponding
> +        // signature.
> +        let reg_fuse_version =3D
> +            falcon.signature_reg_fuse_version(brom_params.engine_id_mask=
, brom_params.ucode_id)?;
> +
> +        const FUSE_VERSION_USE_LAST_SIG: u32 =3D 0;
> +        let index =3D match reg_fuse_version {
> +            // `0` means the last signature should be used.
> +            FUSE_VERSION_USE_LAST_SIG =3D> num_sigs - 1,
> +            // Otherwise, hardware fuse version needs to be subtracted t=
o obtain the index.
> +            _ =3D> fuse_version.checked_sub(reg_fuse_version).ok_or(EINV=
AL)?,
>          };
> =20
> +        // The size of one signature
> +        let sig_size =3D sig_bytes
> +            .len()
> +            .checked_div(num_sigs.into_safe_cast())
> +            .ok_or(EINVAL)?;
> +
> +        // Extract the nth signature
> +        let sig_chunk =3D sig_bytes
> +            .chunks_exact(sig_size)

As Sashiko pointed out, this will panic if `sig_size =3D=3D 0`, so we need
to check that - and whether an unsigned Booter is valid at all.

> +            .nth(index as usize)

s/as_usize/into_safe_cast.

> +            .ok_or(EINVAL)?;
> +
> +        let signature =3D BooterSignature(sig_chunk);
> +        let ucode_signed =3D ucode.patch_signature(&signature, patch_loc=
.into_safe_cast())?;
> +
>          // There are two versions of Booter, one for Turing/GA100, and a=
nother for
>          // GA102+.  The extraction of the IMEM sections differs between =
the two
>          // versions.  Unfortunately, the file names are the same, and th=
e headers
>          // don't indicate the versions.  The only way to differentiate i=
s by the Chipset.
>          let (imem_sec_dst_start, imem_ns_load_target) =3D if chipset <=
=3D Chipset::GA100 {
>              (
> -                app0.offset,
> +                app0_code_offset,
>                  Some(FalconDmaLoadTarget {
>                      src_start: 0,
> -                    dst_start: load_hdr.os_code_offset,
> -                    len: load_hdr.os_code_size,
> +                    dst_start: os_code_offset,
> +                    len: os_code_size,
>                  }),
>              )
>          } else {
> @@ -378,15 +178,15 @@ pub(crate) fn new(
> =20
>          Ok(Self {
>              imem_sec_load_target: FalconDmaLoadTarget {
> -                src_start: app0.offset,
> +                src_start: app0_code_offset,
>                  dst_start: imem_sec_dst_start,
> -                len: app0.len,
> +                len: app0_code_size,
>              },
>              imem_ns_load_target,
>              dmem_load_target: FalconDmaLoadTarget {
> -                src_start: load_hdr.os_data_offset,
> +                src_start: os_data_offset,
>                  dst_start: 0,
> -                len: load_hdr.os_data_size,
> +                len: os_data_size,
>              },
>              brom_params,
>              ucode: ucode_signed,
> diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-cor=
e/firmware/tlv.rs
> index 56e0d5cab580..68b12637ff2c 100644
> --- a/drivers/gpu/nova-core/firmware/tlv.rs
> +++ b/drivers/gpu/nova-core/firmware/tlv.rs
> @@ -11,7 +11,6 @@
>  use crate::gpu;
> =20
>  /// Requests the GPU firmware TLV `name` suitable for `chipset`.
> -#[expect(dead_code)]
>  pub(crate) fn request_tlv(
>      dev: &device::Device,
>      chipset: gpu::Chipset,
> @@ -117,6 +116,9 @@ fn next(&mut self) -> Option<Self::Item> {
>  /// be exactly partitionable into blocks (no trailing partial header or =
slack). After
>  /// that, [`TlvIter`] only signals end-of-stream via [`None`], not parse=
 failure.
>  ///
> +/// Although the spec forbids duplicate tags, neither the constructor no=
r the iterator
> +/// enforces this restriction.  Instead, duplicate tags are simply ignor=
ed.
> +///

This chunk should probably be in patch 2.

>  /// # Invariants
>  ///
>  /// `data` is a validated TLV payload (the bytes *after* the `NVFW` magi=
c): it is the exact
> @@ -129,7 +131,6 @@ pub(crate) struct Tlv<'a> {
>      data: &'a [u8],
>  }
> =20
> -#[expect(dead_code)]
>  impl<'a> Tlv<'a> {
>      const MAGIC: &'static [u8; 4] =3D b"NVFW";
> =20
> @@ -161,6 +162,7 @@ pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
>              else {
>                  return Err(EINVAL);
>              };
> +

Same here.
