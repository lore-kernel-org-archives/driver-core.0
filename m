Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022102.outbound.protection.outlook.com [52.101.96.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6430F492189
	for <driver-core@lists.linux.dev>; Wed,  1 Jul 2026 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922156; cv=fail; b=hmG6K8RVjAzz1DO1ofHS9UrWOcObGyhgM8/i8ZHeXGmleVsOiUvEa2oESv947twWueSn+hUloA6qls7YXt0RtdcbuT5VyejDb0IC1ZiRcdXtg6Yvq3A1Ne3kzavkktPJXekW2+o23UPQkqnAphGU4zSptJBANf6LoL4vZy7mRqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922156; c=relaxed/simple;
	bh=wCLFtKYYE1cS0gwoCUURlcxnzy9Pt23nasiHYhb5A8w=;
	h=Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=mpRGwDtbH8y0QL09hDu0V/mwi1ELTw865MmTsXP+WL/LW+ug7dH6zmgYJzyTqaJQW0Revgksw9lzx0DUcxvtdG8yYr1pCgziGJv1PYO1Wy3SRl/Cv8263+YGflm+y3tlRrWcVMemKQAEAm+keC3fen6DZEoNCsjd51HF7etxfQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ACQ09vrw; arc=fail smtp.client-ip=52.101.96.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ACQ09vrw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GfTySTMObbCi4qNcpzqcI92z/jBA9TQiZe7B30gvmGv4XjGG9PDUoHuxsjScNfE66lhzwjBIAbhhpRGQHVpF81g6CsnTRHNBhL7GhIxV7XdYiyEYCpjxyJLocDqXjEm4jPLM92FDZJUfzTuWqpLuCOXpjeLipzxhsQiTHZ8gTNXwGLvuZGUBWQ1x6QIT6DsF2pLKgN60miM+QH5xhgHAEkrb0jKlTcWuZ8N0OnCh5ju3oBzN8P5dx3eJ64ibc1ofcHzFdbCKln24TpWwCrq6VYTxfLzsdqal6euSLXNsFbu0si0GCNpgD1KQ3Js93G1jmuRjSQWxOK1GNADeaZMLog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TitZ98O6kP1mlQla12ipMbAakFFKHkj2Mw+5lpQmOSQ=;
 b=jc197MzJA9b8zJ7AjzFq1Ptq36tH4xmqCcEJf0rIsSW82NgIRRgsmUbFp/dA/sBYVXARk1InYg68G8tvyu7Rqn6o/QAIOa6UiA1sDzGUa/WVjD7EY22qHTGx8BaBeTy9ZazarJKDx8+KkBIdIqvC5jDtkHzbai6rgbl/mMiyidaGbmucbVPl/KG35EZHP6qq6mJ0WSU8E/aSXSksNmItH/G7PSPqztOpUBavJqaG727vZL98rcLELL+ZRL+Mx2/jC+O9l5xqmOgVx/vzPV7MNXanOp1KTVsEIlH28mrS6jRiGqzPTW9OEn14knS/30fuC6xQf4Lsuuafd7exfx4vfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TitZ98O6kP1mlQla12ipMbAakFFKHkj2Mw+5lpQmOSQ=;
 b=ACQ09vrwohs3pT7o89Qwuu68/TOpyamlt76pcqcz3f2q7horeqrdmsdqfjK8jVoa2OhmHZNhYWsE0RhJuz2RtWLnLCNhPpe1/+Uf7gLLlSYwEkEVIYPVbzYwsHwIMqpS6ZneXENpTmQvnFZVBaBh4sYUYPakTx85kiogzHxI1Kw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB2005.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 16:09:10 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 16:09:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 17:09:09 +0100
Message-Id: <DJND5K90ZDE8.2C0916LQ1EKN4@garyguo.net>
Subject: Re: [PATCH] rust: io: fix example in `register!` macro
From: "Gary Guo" <gary@garyguo.net>
To: "Link Mauve" <linkmauve@linkmauve.fr>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260701160357.29031-1-linkmauve@linkmauve.fr>
In-Reply-To: <20260701160357.29031-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB2005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf17d2e-4eb1-4772-221e-08ded78b160b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|7416014|376014|366016|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	eBfYa5UZ3/E4EOieONOpS3xMhm4vB5Ge4RLm+TWKS/Ptn9HbxT+QRKM3P862VcOlbEaLvxM2hd4/filp8h2M4Dp9raOVCoXZZ7S8P4YT2INfwNAr++YrBc+wRMCul+G/YeSpfc8Vs+0EbkO+Y/bjTrqSJraD2Mgp68/ZSEQMs4wkKDelR8dTFnuh+jWOBzRAMEtkmcEi6GPcofoUUCBCJmEGJRkXlNQ4NGCVtJR8BSJctNj/kBtl9j/qPUliSsme9FpIMnB9gg+ejYp5hRBec6vH+OyeVm0x65AHHdtG6Y1MDQcDFkjlxi1NX73U1fbbzwUSjJuW8UET2HjZNW/35v0H7DHb/nxsmBHw6f8iTpNocVVW0xgG5VrpFboLDgI4ZLxKIf+IgBkWb82oTLyb1+iTvUpXbRhoZqW5lNCWz3sJg+72aLmoD49Uni1/iDgRFIEry8hezLRVdVGfGwltw56YBB7V5vajDPEowe74QThTcXk2f01g+z8MgI19jEoIZ/4a5FPTF+GTdlGTofUtg+txvNjnkh1hle5a6iS8KGGW7HhnlhCA3oyVSGbh/rPKs0bGpwVh5Oie4MHIWg/6bMc5fFU3QU5lFEDPBq4OZtXHxyEUOt96TT1O/GehRXOYpWABYM7sclO4YulLD81Uk6L2vQZoYZ+sFft7ZzEU+bjM8xgmrqYBB1V1Yqf6fBesYuLrTyGtzKCHEW5fZ+FOJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(7416014)(376014)(366016)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0RmS3RJdDl6SS9oSy9ZMDJicTVZUzNuNE9iZk5TbDZ1T09nOXNtS0x3ZElB?=
 =?utf-8?B?bHFjeXpvemtweUZBdXRhb0hPZjJXaUkrMHRMY2NDRG5PNXdROGZXbFpCRzdP?=
 =?utf-8?B?VllpQlRtc0dOVXpFYzVPcC9ybHZydk01dFNtdm82ZVhCcjdMQWxCcVhjdk1z?=
 =?utf-8?B?SjBkWTJtT3UzcW1zSzF2ZytXMGRTbElrMklqenZHSks0ZzExVWRRRVp4VmIz?=
 =?utf-8?B?bEhueGljaWhEenJNVTNscjI4TlQwSkRESkFzUU5idkpaUlordEJ1NzFYdEJq?=
 =?utf-8?B?R1grUEVZeExOOWlUY2pqNytzUjBhYmFhdGlQTXVPOStwQkY1UjFSWUQvTlg0?=
 =?utf-8?B?d1piMWhnd09NOVFsczBCSFZUS2VTNnRuNFNGblFyd0YwZ0RoN1ZCcy9SUzRH?=
 =?utf-8?B?Q25vNXF6aUJuVDdXbUx1eU4yL0hZYkRBbWl4dGhVaGtndXI1OE5hdGZOZEx6?=
 =?utf-8?B?K0ExQ2poaW5TaGNFUklIVUdnNzVCT2tnU0pHU2VERC96RUlTODRiTFpwbXVI?=
 =?utf-8?B?Z0R6cEZsRW9tQXNCZ2d6L0NtQ2lYZXhTV0g1bEJBUTArVlJqdndTQlJvSkhO?=
 =?utf-8?B?aHc5UjA3SnpHZFFINkFXMTRlSS9Ra0tIWmhwdXpIQjk5MHJLUTVWWGxKK2tO?=
 =?utf-8?B?dUE5U25GWG0yQlIrVTZkelhNTDFjSXh0clU2S21iSXZPdFhQL3BNak4vYzRH?=
 =?utf-8?B?SHFqY2VLK0N1RituU0xnVzVOWWdXaktRcE5Rc2thcDk5bUlrbzloVVFmQWxL?=
 =?utf-8?B?dk5wcTMwa1daNGNFMzVKS2hneCtNcWR2YjQvbjgzVVRYei9lc3hsM2hSbUdO?=
 =?utf-8?B?ZXpELzFnN3ZpSGxnRUg0TlZCcVdOUFNUYUp2RUNlUkhiZ3djSlRhU3VSRFFG?=
 =?utf-8?B?alRNVVBkSTNIS3FQNFE4WFZIbnlhQU1GM3pSQWhvbmF4WjZIOERLZ2NBWjBo?=
 =?utf-8?B?R3RTb25NZXJqOStTWjdyWlp2MFdnRmZWRnFjL3RYOVgrOCtOOU9vZTliazdH?=
 =?utf-8?B?WE1ZV2MzNTVyVFZyOExYMnNLS1czbjRRTmFDY1JVdlE2RjczYnlkcEU2cjNh?=
 =?utf-8?B?SytJTTNYbUp6S2k3VXBHQTgvbnlkNElKWUMwSWR3Y1VDbjJGRVdGTDNwQm55?=
 =?utf-8?B?eFNVelRPRGk3eU9Va0pQYjVMa1ZsYWpTcVVOTHFIMVZYSWM3ZVFIdG5aRHlO?=
 =?utf-8?B?QjRkeElqUFN4OGNSN3B3ZEJvWDNBR2svWk5RVWZmbUNHazM1TUVlTDcveGxF?=
 =?utf-8?B?OWNWeHd5QnhVb3JjWVlWbW5uRFFySUxsdlFVZExuaUNSWVpTTHJjMTEySjRC?=
 =?utf-8?B?MDhGYkxlZ2ZRbzN1bnNURHNRUFgwQU9vMW1zTWVySFIxOUNhSnRNSUlhQVVJ?=
 =?utf-8?B?bXNYTXUyYmJNMktqdTJMcDJhaEZLRWdZbmNaVEh6aFdLbWViQ0RzUURRaFlE?=
 =?utf-8?B?NzQvZnJqUHV0UDJ1eXNvV0JBR0JnUTlkb1NsdFFkV2dlM1F4RXlvVWsyVVBq?=
 =?utf-8?B?K21wNmdJTGNudFZLcUVQT0d2ZHZZdm5KRm9XbGpUQkZFUFA5Z0Nxa0svSkx5?=
 =?utf-8?B?OEtoQ3U5VzJveWJZbU1PaFVsNHdyWnJOVG1JRXV1SjdXM205Mnc5UkU5V0JD?=
 =?utf-8?B?bFV0NEVUa1Eyb0w0RkhxTmRrS2lDcVNmL0l0cDk1U2VGeHVzbFBrVlUzd1U4?=
 =?utf-8?B?VTVQRTJXcXo5clZBVXZWazJwZUxvMEJORnZuRDJwc2ltazNIdHMxZkp5aVhQ?=
 =?utf-8?B?cVpjQ0F3eWtlanAvSjczdjl1bWxCY0kyWFJvNVdhWTBmS3VWR1R1czFUMTZW?=
 =?utf-8?B?clZVWGhFdXg2WGgrcFF0M2ZPRTNOMFZMK1dzRjduangwWDdRbytNek9Bd05a?=
 =?utf-8?B?d1N5c0F6ZDJvRSt6RENDT0UycmROTXlCd3JId05zSVByQTZpMHllS0llMTRs?=
 =?utf-8?B?ZVFFenJFTDltSUYvWkNINW9IQW0vUXhmenExWnl6b0VTUnM2Vm95Y2ZGQlFH?=
 =?utf-8?B?ZFhOTTlreWNHUzB5QTgyRzNnOVQ1NVplUHdrdzRSNjZwbXhiTnpNL3BGOGsr?=
 =?utf-8?B?Z3RUT1VBUXFIWXNzT2NNME1sT0F0V2JJenpSekM1cUNzMi9GMjZZcnVIenQw?=
 =?utf-8?B?VmN0NGI4c3hISThEMlVna1hrOURMM21mcDAwY25VTVhoSFRzM2M5Vm1yQmw4?=
 =?utf-8?B?L1JSaGJZTDYrV2pJZFZld0UwWTZhUFpCcjJVbVI3ZU1aVk1PWGlURXpRVXRn?=
 =?utf-8?B?SUZkbWR4WHh5ZDR5Rm9HaSt3NTFSWW5Wc1c3ek9yQ1d2MHliek1MOTAyZE1O?=
 =?utf-8?B?c1RUeGpCN1IwbEZHQmFsbEVOZkd0TVJjL1o4bjdhVjlvOEgySTY4QT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf17d2e-4eb1-4772-221e-08ded78b160b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 16:09:10.4522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EK3sZiYBu553MvJBY4DHNsyemLdg/v0i2no1QJV0ifWjA+HFP46dFN5zceglErM98W9YoROxGCHR9emDiruQdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB2005

On Wed Jul 1, 2026 at 5:03 PM BST, Link Mauve wrote:
> In this example, an u32 register is split in two u8 in big-endian order,
> but the high byte is actually defined as taking nine bits instead of
> eight.
>=20
> This is completely inconsequential, as I expect most users will just
> copy the bit ranges from their datasheets, but it doesn=E2=80=99t hurt to=
 fix
> that typo.
>=20
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/io/register.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

