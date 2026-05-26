Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90CF274670
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 01:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779757694; cv=fail; b=UsZRRmEXLipqeH3LsFgpGeJUPactwi6t6YTXqm2WNAC7L7SBUgfNNghaMxorMDiVourVU7J3n0kL+yLP96Lek9EEXczVw2KwhhPW8Ba0/M4383p3pU0WrchzDnxoyBl3TfIqHUpOEfgGp6JFn5BCjthsFRIE/8ple2aMYxBM5+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779757694; c=relaxed/simple;
	bh=hhCNu8OKO+nBtPS7JGygbOLkJeuq5sjJIPB1qbHqyu0=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=FPt50WCRdWhFS39wTFQUenRMaKqfl8qJXjZvvL2z8C/pNz7SYFTMWwHy0C3apfGsmXDQSqcHV7luJZ/5zjGDExoiYfFChTVqRQsW0GyvHsYovzG5B+BM+q4yy5pkCDxexr5u3ldEe5+wUZysiYnKT2tdQHGzvdy2PGZgEfFrw9w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l5WK8OWt; arc=fail smtp.client-ip=40.93.194.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l5WK8OWt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfoP3EOH74Ov3ziHxw3fti2WfFvQ2P0fhcEoqkQlyM4xVs5ed1Ab15P6qcaBM7I8VRV1pXTpV7y0X7fLjZd5lA8Xu+JbzNC7Lu5UXkMxRCq/HyPyiYPmE29Da9l7e0W3Wht3cQ4LVpIg3pChNbgL21zIxi1AKVeVWYc61CJlz0LgfxAf/IZVSiAkS5yxlZQvaQWNiDZVDXKfQ+CJBQl6knPK23i+7JGuZqVnV99KkAI9l0YzaOIxX3Tfiie6OA2RA1jpzOOGuegOXex1d6cmsjtsjIzao/RCww+PpRxzSo3LrnH34jYzbl/ssdHrYOnd8CbBvOD61ApIRBeWqAYMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhCNu8OKO+nBtPS7JGygbOLkJeuq5sjJIPB1qbHqyu0=;
 b=F3ZNf5lvzwfBixsSVnp2EwsYjGZrhMu4SRpIu6WYD7Q1ltNa62vj82FnXjU2RsFCKG9pQJ+16l3qwQibJ6urV1RXmJXMUSL+hMTyRtfMGsuUoRe/sa9v4U0uIVqgOXCrq9HrKkBdnwyJ3jS72+lAzmNJQEUEnPASBWtFYcUvoyxp0ZpsinKOQXW/EdnFhj2YAnG30KOlY9iVqGl9MIVGE4EcJW/53b37ALEaPdhyTYCAifoH2PjOEMg6GHHsjBiy0iqn8gBpGoBzBLcdwilUFNE9RI1Fq/mLDkwEbZGFy/elHO8DhCXfNfEIpl2ZImp5GlPQjtQf8P1gwNyqJL+xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhCNu8OKO+nBtPS7JGygbOLkJeuq5sjJIPB1qbHqyu0=;
 b=l5WK8OWt+aAHJPOOKG2wRnNa6jWLfKWy+5z+QF8FVzGuwmNHwf//3ggqqIutZkpPfjhWmRkGCgFmtzzt6Ym7n44/I0hozBBQvdII82jVYnBodWqyBKdhyxNGz5QPEUqx3o5x9vycyMxfMqVWQTLZB/pyCEOZTmbPbFy8CtHczD6l7CIr/4tElqA0gV8kCxunj7eZ09/T+LVhsd/Wl5bLuwEKXFYl78tK/GrvIYnu4zH2zok7MOhSIDFVfLaBkUyaCNKa2a0ZuPVbIffBknzBzU8+GKGE8NjEHKG9tqCJz4nxo1kl1PRaKah5EiuI3d6CYPESILSnHOcrEdqLftGfMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 01:08:06 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 01:08:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 10:08:01 +0900
Message-Id: <DIS7FZHRAY8Z.3N65NTDL1SXWF@nvidia.com>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260526000447.350558-1-dakr@kernel.org>
In-Reply-To: <20260526000447.350558-1-dakr@kernel.org>
X-ClientProxiedBy: DU2PR04CA0202.eurprd04.prod.outlook.com
 (2603:10a6:10:28d::27) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: 2331da2e-49cd-4a96-dd2b-08debac33e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|1800799024|376014|921020|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	GZ8HWwlWsDMr+LxmgNOr1YV4Pdrc+N30UmBunPMwW8rNI4NW/h/tGhkawvEhr+Jd537wNMlVx+slpD0rDgsa/yVa1Q8gZhIS9zbqTVn4YwVw6Ccf+wxRNO8vj/+/uM2iSxam/M3sG4lNdPOjU+9b/icKfEAXEguGaxpIhy2YYnh4PfnAmL9zTSedPIqRgiICNGfoKi7U5GPd1KmxOuVGOcQOj2numlQugKhowOArlaDkEy33ien/3jv5u1OFpVl/xzuh7AYl8AcI/ys4XouF6CLhdfkkLONjf0fLST9T0K7w1xWqNevPRQb0WfHURTsKTIQuv3Emd7pwk8kPOKbpf40XQxI9KeKhdFktfsCJYwXS2q24JOmtD6VRC3Gmok+tBUV1dwoGm87PAbgljrGqAYaPm507+svSdJZZgRc9blL0Q4fHY/fjK1WDvaN/3rapzeLSH59BuE4i1lwqgcKP3ce5QBTNmtd5P1y6sU0R71YQRefDKdIWPUVQSu4ZN0ZFGEROo1v73zjz0OuSD3pWUrXzqG1/zO7lpp6S/GsdG+hX7TNG9Dnq5flCOxBg9bZHYtwPNTIn+i40xXjaW80L/nWvlXXgaIvnXQvptsMnOxLCPhUI1UVz5yVjqmbpjPdsLluqGk+bqYrew/kK0PhEqmn2HlCrPdKh+TUodCVD8jfHAhT2OXRd8DRxeAV7T43ZCBABTuh5xBcXBfnm6qXD3ImERaapjWhUaGs1cCvTvHk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(1800799024)(376014)(921020)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U24rMHIvb2l0cnNzalBLb0VMSHl2RDZvRnpvcGpWWk92K0pDWi8rd0FEcktv?=
 =?utf-8?B?aSs1cXVjRmVOeThlV1NYRVduSVE3Vk05Kzg3SEQ4aUczYU1yaWNKSmM4M0lO?=
 =?utf-8?B?OUFpd2pjRFFHYTNMcFpnVmpLTkhzdThYL2h2em9UemJzeEk4dFRMbkwzRUdh?=
 =?utf-8?B?U1FaMisxMlg4Y0oxZUxVSUU3eUNiMkkvMExOQ3VYRHh4Q3RLSkpFYjFWWXgr?=
 =?utf-8?B?UXFNTWhHcWhKd0oyQWlaQlZySFpPWVo5ayt5ZTdGdnJBN0xDbGg2QVR1bkdR?=
 =?utf-8?B?QVJkQmF4ZDNZdCsvUms5UVRwWllZUCtlVDJKOThoWUhqTHBYb1M5aGdyb3g0?=
 =?utf-8?B?TVhENWNWM24zaVQ3bnhOOVYzcld1VU5aVGkyZHpFaUlxaHZjUkdqTStJb0NC?=
 =?utf-8?B?amljQ2d4dzNiclRTaEZwQ0dSZ0VzMGVKSjJpakt5Z1VIT0Q1MEwzcmswRTV4?=
 =?utf-8?B?U25oQitLejJjZEFOdzUzUXdpYXBIeWtudmhpdUdWZXc3OGdXMkRYcTJIa2I5?=
 =?utf-8?B?eEVIQ3F4TXNzN1dMSkZNUk02eEgxZjkzMVRWdVp6aVJqa1RscTVjTmI4NXYr?=
 =?utf-8?B?ZVp5ZW43RmVrUjlTTHZmOWg5NldZd0d4YWUzVFVnNXZCWVl3RnlYcWVBeXM4?=
 =?utf-8?B?ZkprWnB2Z0tGeXRHMmtUSTdkOWFBYnlIU0p5YXpoemtyNG9nSUlKTXhNUWJG?=
 =?utf-8?B?bWZNYTJSdzNMOWJBaitpNlA1aktiWUdYTm5sdTlBUGZqaHNUNUhaRnBSWldm?=
 =?utf-8?B?dDNrc0ZpT2swT3dEaW90MVFhaldEVUZodlYweGh5d21ZblJUVjFwcHNSajVJ?=
 =?utf-8?B?dmgzbjU4NEgxOVdXMDhYRm9LTFYxdlE1TzQ5dUdBckl5NCtMRUpKK2NuNnF1?=
 =?utf-8?B?M08wVlZoL0NvOGhUVHpMWm55WUE4VzdYWmZHZHBLTVFPZWlJbS9JNlRJNGRw?=
 =?utf-8?B?emovZ2xQV1V4azh3eGRnbmlLY3NWV3FjMlQvMmdTVlNHekRna0NBQkVsTktT?=
 =?utf-8?B?dzZqMExwc21QNW5sV1FXaEtYNE54RTV6eURWZ1U1NTNQUGtPQ1l5aDhxTEUz?=
 =?utf-8?B?bHVpNWVMS3ZuMVVlZUQvRGFJSjlMVmdiUEJ2b0VaanVKT1Y1My9BQWh6MFFX?=
 =?utf-8?B?VWNjYmxFL3FCeGIyYXUzL3NTYmNzWGo3ZU5hUUxRem5YZ0VQd1VGbldYbUd5?=
 =?utf-8?B?L2FPa1ZnRThwRmYvd21KcGtaaDY3QjdYSHdCWFYrbFpIeTV1MXVRZzM2RU1B?=
 =?utf-8?B?ZUFkVU9OdmZ1citVTkZmb0ZvajdnQy9CWXF3MThvLzRHUEpvbDZCcmVncFFk?=
 =?utf-8?B?ZlQ1clR1ODNTSUxEMHBIVys2dDNUYmJVWjBSNWhVQ2NSZ1VkNXJ6SGNRVy9r?=
 =?utf-8?B?ekI5c0I5SklaWnZXRU5xaDg2dXc3aVloNmZKZmh5V2lITkF0bHpjN0xBYzBz?=
 =?utf-8?B?WFd3UEdCajNjWEc5VzBNOFZqVzU4MTBocU01OVlUdHJZalpQMy9wL284Ym10?=
 =?utf-8?B?RFR3eGpTam1Dci9sWnpqcGZpbjRJZVdaQkFiSmZwbTg5OW0yU0ppN01xQVBu?=
 =?utf-8?B?djFRVHI4VTBQeDBkL2tDZGtDRG12Qi9BOWVpeDdqbmU0c05QdTlMOCs3RlRW?=
 =?utf-8?B?Zi9zU2hjZWtxT1M4azVNUjdyYnJmSTFOZ3p6L1FsaU0veFozaVBReUV6V0Mx?=
 =?utf-8?B?RVZaU1ppS1d3SW9CalpPWWtUSTMxaHlEbXRXbVAvNjlSNWNmcCtvT0dQYU9K?=
 =?utf-8?B?ZjdYN2VxWlV1WlN1VG1MUFdHSHpHNzNrYmVEcGtRUytNcWxyQkIxbGZRM0Zv?=
 =?utf-8?B?eTVhMFptOWxnZjcrMWVyQVlNUkF2MnIwTHJuY2k5aGRPV012dmJaV2JrNTh1?=
 =?utf-8?B?RmN0NWtjdWNDWFB4cTRHdGVVNUlyY2QxcmpSQmtmSDFZOHc1dUUxVXZzSjFE?=
 =?utf-8?B?REZoclU3dlk4WHBtOW5DVFBsS3JrbGF3eDZIR3k0d3ZWOUxZQWNaL0xDRk5p?=
 =?utf-8?B?SHZWRXFGZTJodTZvdGVjRyt4a0xnamdENkFxSU93ejRUV0lwSW1rNnkzdTlS?=
 =?utf-8?B?a1J0aTVTS01VVWprQXZrQ2hGMWtVcmdqNWVKemJLMlE5cytNTVZrQlFUSzlQ?=
 =?utf-8?B?YzdLQ2R0V1NJVkFjK25GbGJoMXhkeUJBMHJGU2I1L2VnZk9FVWNWQWNHWCts?=
 =?utf-8?B?eUhiNjBRYUdoRkl1cEVuVzc3aCtmbWxQWlV3c0VtSCtGc0svN3hVc0Jaa2NI?=
 =?utf-8?B?TDN4Q2dKaWtCYVV5eFBTSXlhbE5vUlFxblE5cVJVOU9jVWVvNDVSUC9jdUxq?=
 =?utf-8?B?VVBpOFYvY1VCUlBqOGk3VUgvd25EeGVzWENRYlM0bGdQc1BLQUdXUUZyOGNN?=
 =?utf-8?Q?0WUaFqkyu1WQtRzuVOYJCW4Llyn2Q1xVvYggIFDYkbylB?=
X-MS-Exchange-AntiSpam-MessageData-1: ZnqI93qAV/DFmQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2331da2e-49cd-4a96-dd2b-08debac33e71
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 01:08:06.4614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAnLc/X818RJloc2ZWvzxN/Iy75h9/uMMp2Mk32AnjnCQt7WAVeLorNnZLnVSCTu1JJ1xDiOAjuRsfIjKVdf4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149

On Tue May 26, 2026 at 9:04 AM JST, Danilo Krummrich wrote:
> Devres::new() registers a callback with the C devres subsystem via
> devres_node_add(). If the Devres is leaked (e.g. via
> core::mem::forget(), which is safe), its Drop impl never runs, and the
> devres release callback will revoke the inner Revocable on device
> unbind, which drops T in place. If T contains non-'static references,
> those may be dangling by that point.
>
> Add a 'static bound to prevent storing types with borrowed data in
> Devres.
>
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

