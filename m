Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020115.outbound.protection.outlook.com [52.101.195.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449921391
	for <driver-core@lists.linux.dev>; Sun,  1 Mar 2026 13:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772370110; cv=fail; b=VStq99+5o+1BXyIwzL78IhaJeN4jWDwvKoQrsZPuTwgOuWbmjLQLU1rqs5P/Dlk1X3BBdQKkY9/mtbROXyRyRrtnhqSbLJgNkEfZz2Z18AYlwmxefMdDT9DemNUr6BjJAF8Uve3BroVbfSWAKwBi3LfL3Q7kuKxEG/URMFv33r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772370110; c=relaxed/simple;
	bh=oL/EhO0tnlaNMl5Lo7Wadt1EjL9wZ6iyXukfbRCqEyI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=n+/l/bzf4xzDWtaREaMpsZ/5z5GbLntXOAbTdsM2nAG05R4GA7q1D011THKkIKmmh2L8MBBzAzmE+e7ghu3hk0Gq3QJrwdFddE9pwxLaZaxbBN2xMXlJDB0GI41U993kwML3vqylkFYrpScSfR012CT+aKpslrhNotRuSFnIUtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=w+XYZj5S; arc=fail smtp.client-ip=52.101.195.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="w+XYZj5S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEWduESeSCuLU4bO0xFr4O3PtQAv5j+ObrL+N2bihc7ncJwdUFSVE3lyPVQe9wgvHLnM/dvcF4DIvki8QNSf/wwn6znguMG4D3iRB3S6R6v2u1f+zpybZUYFo14xYdy6wpt+AGN52rWvuViCl1mj/wc/sLybxtOgleWehlmy4oEiCl/Jyb5r6GmXgG4guT03n7B4U0SNo8HrKzGQv2Yl0TFNEXGH+KgMAMTpFq3y4DRsP3NI6RyYS2YWmNM+RtHsAQpHlQ9jgy72BpiJpAF+WxVFSwSQmttUpQl3EaXQbpqdXncksTVy3Snlz9qTLCBAdB/k2Mg76G3F5+x43jlzLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONNwAme46GLjUYiN+9RImLz5lIFPCI88it0k66lNa1g=;
 b=ZR8+Wch9fW+XiX1azo14FRbE2efcZ8qDWtY5ruxovoNSrxD8OzWyxnTkeYiAxXuFf9fkfbNb1/HLDibhkZQ1ok7+wdoIcBDNzUuGpjmLXQQL5bxBB0QGgCoSxVrn0pUtOgoXdTLp2v/tCX45KZu1j4ZxcYNsRbeB/AmZzEF0BFHQtt/XTiU+uenI4zHoQTXFZcI808lqF5yBxKsDEL0Bli0hvgyimUBePkj/1WC1rH1MweB9rpJ8BoaCZRzCSoq0T9iXNMbLnYoFazLTxQvvPN3VVjLYUB63htn4sREoq2hmKmmgPCzzbuB67X4PEGIbgQ/X7rYu8XtB9nNO2iKyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONNwAme46GLjUYiN+9RImLz5lIFPCI88it0k66lNa1g=;
 b=w+XYZj5SGX9y4BUPWwTlI/xWqA1cf+RgZFUx8YWg8QawdaHqkuSMKvOaBJXW1S2XRwKQmCjyaOHeXt9JDALJrWJeEBgphFhsSh6VGgseqb9Ayinp9AxApKxJ5sKaWpISJriFAWQhTtW2rNL9NBnb1nzDloFbuiaYQK03D3xnFhM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CW1P265MB8989.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:272::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Sun, 1 Mar
 2026 13:01:46 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.015; Sun, 1 Mar 2026
 13:01:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 13:01:45 +0000
Message-Id: <DGRGRLZTISX3.1Y2WIHMPP74R9@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Linus Torvalds" <torvalds@linux-foundation.org>, "Danilo Krummrich"
 <dakr@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
X-Mailer: aerc 0.21.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
In-Reply-To: <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CW1P265MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 50edb3eb-0e90-4160-4d3b-08de7792b153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	8QiIHNIosHAKSA4qeS+yeJXcSxWY4nC8UC3Qv6YGZyXgCkeCSzkLLCf3RSzby9oCQlq0SAIHl8m3w3o1ZLiZH1q5R7t6Ra5zOJH8cGPbO5gtn1rrKzdLwX1BRkwY3zP+AcrHj8v+QTCnrjew4wZISA1p8cWyZc0IRbcZ24dgUQOEM6oZSUFdkiihEG2zo/zfXZd73JVQ8s2SaEd6foCL+Y9jo3tQy4Ya8mUrcfN0/+OGpX+dklsB5wgqCg2h+DXUCPkPQzMzFeE+8rYdF252SPoCRM1Y253397xOKJDR0rQPnmAHyEiFCBtxY6miDzZbnYbnCHh6PboRXbiwNPbVwv0nrNoFRpDEeN6KfRxCH+ZokKDCnmppzPUvgXHIfiJgHqVtCPv1/VVd7BO6Y8xuLIF9RFRr/ijI4PavaYzLfvE/johDAisA2ANZ2rG5/QV1nrFndJY3M4n7LWtZd6vxG+cFEMmItmWt3FHVI/lgivNEv/Jfp4CTyU1htUG+/WYzgmW5X8jGHLtsndB9lTJvT/IrLx/hEK79P7zx9/SLMAXB7MRRgn3czjdCxiWRmEtaFdzxgE91EO+9TgqAEzbpK5GC0udE+Xub0gS1gBa7E4FR1XO2d4ZR5+/5mX7ZOSifiEhurJjQvO7LeYzejToghVQPfXq2/GF0cRMLKiwXLcfjXXNi42OQDo1eX608RCIv1J3ImRYKCgYQWIcZe70ty8pqrodtod2DnWx9WzsQ2ck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm5kUVZjbis4UWVNQWVrNnlheEEyRlVZTTZtY05mYm4wc3FpV0ZydyszdjNS?=
 =?utf-8?B?Mk5LQmdIbHBVMUI5eDUvR3VJR0NlanBoellJdDVNdjBTVE50MDQzNUlxWGEv?=
 =?utf-8?B?UXdodkoza0lPbHE5Y090VlRpS3Q2QnpScEE5UkJOdzFTUTB4alM0VHVLZ09k?=
 =?utf-8?B?WTd2M3ZNYnVlUlIwd05yOHlYS2ZHN3NpSWplVGQ0MVp6ZDIyaE1ZbTJYcnBu?=
 =?utf-8?B?K1FOMWgwQU9rcDZKSS9Ka0ZaUkFmWDNkY0R0amhmcXQzWHIyL2tHa2VjSUZl?=
 =?utf-8?B?dGIwVGxCQmxSRWxCRk9NYVNNR3BtREQ3TFBWT0hRaDQrQjIxSTBPYXUzUFZP?=
 =?utf-8?B?UE1YT3hQRGtoNkFheC9zWTFFZ1Y1NkpISTRhYUduSy8xSGVWelBleDI1NHpn?=
 =?utf-8?B?cW9ISjB3Y0tpVlZjZzNCZDRObzZpcHBlZ0cyQXFkb2k4Q0ZQaTRXSXQ2bGVE?=
 =?utf-8?B?dFVvdWRmUkU2V2tWU0luTG5WNmNZcnJVeEZ2b3pJNS9MZHlUVXBHem5mRHhh?=
 =?utf-8?B?Q2d5Nm1GaHljTWg0TXcxSk1QSWVzQXBsakp6L0oxd291ZlZ3c1FMY1ptWUpO?=
 =?utf-8?B?YTBGdU1yNWlQZzFCamlydkxjOExGbVF6b1JJK3I4Qm8xazI1OURtdDllbm1k?=
 =?utf-8?B?MDlNbmpidnBmK1k2WERSWVVwRmxrYW5oMk91ZjZqY2V4YWdnOTJGQVQrQnFS?=
 =?utf-8?B?bkkvUE1ZSDFuSkNMVGxoYlVaSjlEekpWRXBydkFxcVlQUkdQMFpNa2tLSW5i?=
 =?utf-8?B?YjVBTGMxQnlTRTVjbmh1M3FFOWFjQncySlZEMVFRSUZDdHMyQjE2UzRsS0pz?=
 =?utf-8?B?QVFMa2hLZi9kZ3lHeTlJL1VUb0xLenVRMGdiRlZ0Tm5obVJmaWhBTW1oR0g0?=
 =?utf-8?B?M3FFa1ZmQ3l6TlBvcHAyT2k1ZGxORDdWSVNXN3V4Qm53NVhZbEZxV0F1MWRH?=
 =?utf-8?B?MkNoTGlpUk95Y0lSVHlRNGdPeEhINk1QbVgyRlc1ZDBRT3lJWmR5S3h6am8z?=
 =?utf-8?B?ZUZRR2pKVmdwRDNBYlJja3NFOEVyZ0lKUGpKOWFFMjJ4VzVISkdteHVwbXVC?=
 =?utf-8?B?NnNIWnNwWmRweG5KTitqY0s5L251cnlYbGFSNGRoQmdiUU50aXU3dFZqUndB?=
 =?utf-8?B?N2dRVkN2ZDFpcDdSRTdoU2NkdlAxa28zQTNjODRtWHdXdEFvNFYyWUhGQ3lE?=
 =?utf-8?B?WTVOWFZ4YjltYkdPUW54KzNNY3RzNkRJRXhMRHJ5RTlRaUtWVlFwWnhNTmlJ?=
 =?utf-8?B?KzJFRGRJdTBhUVIySlJCeFp2YkpuY2FaN0FhR3hpa01lNnhaSExZZFVZYSs5?=
 =?utf-8?B?MUZ3bkdVL2s0cDJHdmE4Z1dKb2VjVFlaSVJpNHVhWi80aVhxSnBweDNJZjg4?=
 =?utf-8?B?N0pvSUNGNC9PT01ka0hXOS9lSCs3LytjZXorNDNpQlgxNXF5TGFaczNlUTNo?=
 =?utf-8?B?MnR6L1pNVXpUWHFoKzA3UWFaYUowamtFSGRJODhVSXEzcG5OTVUzdGdLTDUy?=
 =?utf-8?B?Z3dyV2NWSFlsV0g3b1Awcnl4ZW1ieFpjaEs2UENHZ2xsY2pLcEpFNXpONGFa?=
 =?utf-8?B?WjJnY29pNnRPalZuMm9sM1RzNmNMbU9YSklnQkhkRjFBb3J5NHRxZFllQnJi?=
 =?utf-8?B?VS9LU1Vtd3o0eFlpTjBaakRqU05Ec013V1Jmaml1WTlvTXZodmNvTjMyR2po?=
 =?utf-8?B?OW05SHVPL3BBd1l1bHR3S0RFRlNNbDEzSUtXOXF1TWMrLy9GTzNaWTU0TWdn?=
 =?utf-8?B?N3MwckNXQ3F3UTA1a1ZYcnNKRC9RVDBTV3ljQlJZVmhJLzhmMTFFZEJVUXFO?=
 =?utf-8?B?ZDI4SjJXaTIrU1FlcUJzdWFaS0RsV2pnS1FrSXNhMEpicXFlN0UvTDZ2WUNx?=
 =?utf-8?B?YXYxNFY4QVRYcDBCRE5jcndLNHozblZiMUFmbTBBcXNrQmJYdTRGOTc3eFJs?=
 =?utf-8?B?dVZybmRNQm9HeDZFWGFqeTRSblRhMU4yRERsNTRpcFd3bGxTM0ZhSEI1NTdI?=
 =?utf-8?B?ZU84ZE53QU5GblMySWFmMGJCcUdaK1VZRVFmNDdDamFRczE0b2trMTNIZTZs?=
 =?utf-8?B?Y0pmSWhrWjBtaGFySytmWVBtVFYrVEpLekRFbngxSVBiOWpRQUlEUFBTYjhW?=
 =?utf-8?B?cittME1yaktJdTBTTS9Za1lvVzNxY2kxV21nT012ZVVCZ1hBVE8zemtOS1o2?=
 =?utf-8?B?aFRndGZkNzgvNmkyUWMvZVVha3EyMnNLbUhqbnZYV2ZvZEc1NytQMXBGUnNl?=
 =?utf-8?B?MXNTcWVrQVpBR0RHcVM1U1ZHTDFNN2VmdlBJSkdXNUN3ZkVUdUlMVDEreDM4?=
 =?utf-8?B?UTVNM0FDbEZYZmRDaUdrNGh6R2wrZWkwKzdrT2gwZjlOaVBaR2tBUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 50edb3eb-0e90-4160-4d3b-08de7792b153
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 13:01:45.7949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5MIp7ivQqGT056BPoHCbHNJk9VHXC7NMa7qT0O3BBPrHdntZfrGDrMn0CeKWsj6wGhEXQW/uJLwuYt4R5bVOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8989

On Sun Mar 1, 2026 at 7:44 AM GMT, Linus Torvalds wrote:
> On Wed, 11 Feb 2026 at 15:04, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> Driver core changes for 7.0-rc1
>>
>> - Bus:
>>   - Ensure bus->match() is consistently called with the device lock held
>
> So I'm coming back to this, because it turns out this sounds like a
> horrible mistake in the end.
>
> You document it as being about consistent locking, but it appears this
> change is what made the "firewire oops at driver attach" turn an oops
> into just a silently dead machine.
>
> In other words, it makes fragile drivers go from "you get an oops" to
> something much worse. The oops becomes unrecoverable - with typically
> a black screen at boot - because the probe is holding a lock that then
> makes everything else come to a grinding halt when the driver fails.
>
> And yes, this obviously only happens for buggy driver and doesn't
> matter for _correct_ code, but about half of the kernel code is
> drivers, and that half of the kernel code is also the typically the
> most badly tested and often questionably implemented half.
>
> No, not all drivers a bad, but there are a lot of drivers, and some of
> them have problems.
>
> So if a driver problem causes problems for the whole machine, the
> driver core design is bad.
>
> I really think this should be re-thought. Perhaps just reverted
> outright. Instead of saying
>
>   "This inconsistency means that
>     bus match() callbacks are not guaranteed to be called with the lock
>     held"
>
> as if it's automatically a bad thing, just don't depend on the device
> match having to be called with a lock held if that lock has this
> problem.

Note that taking lock on match() fixes a real bug where data race can lead =
to
use-after-free https://bugzilla.kernel.org/show_bug.cgi?id=3D220789. It is
mentioned in the patch
https://lore.kernel.org/lkml/20260113162843.12712-1-hanguidong02@gmail.com/=
.

>
> It's not clear why anybody should *care* about the lock at driver
> attach time, when nothing else can access the device that hasn't been
> brought up yet.

We have always been taking the device lock when probing. This is needed as
obviously you don't want to have two drivers attaching to the same device a=
t the
same time. When probing oops, the device lock is never going to be unlocked
again.

However, before matching starts to take the lock, we're "fine" in a sense t=
hat,
everything else keeps working as unless a device is matched and would actua=
lly
require probing, the device lock is not touched.

Perhaps what we should do is to defend against drivers oopsing inside probe=
 and
have a mechanism so that device locks are unlocked even when probe oops. An=
other
option is to have `driver_override` protected by a different lock so match(=
)
takes that lock instead of the device lock.

Best,
Gary

>
> Put another way: the downsides seem worse than the upsides.
> "Consistency" is not an upside if it causes problems.
>
>              Linus

