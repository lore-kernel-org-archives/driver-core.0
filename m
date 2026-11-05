Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793893204;
	b=vX+DbNTHtlNilhEOjkemicpJ96jzi7OZImq086codGCv6iK/Aw4okHaOOafEE3HOw1UM
	 CIDXt9YvBs0Pk8AjlFNHAuLwKR/5TxOUnqKm8IPm45A+me10EY2iMiYJs/x8iJkG8VBfC
	 URfHndd8lo22TM/r+YmBL6VJ0hB/8RBJ5HLhMnl/GMYHiFCkGjiN/PlqNj9qtNT/QYF2O
	 j6O/4gwA+tvzVPmjUdDOJ1dmlsVEatecm8bU2J0FsnAYRug7xs4zitWHskM2nF/0JE5cZ
	 OEOTBLmOs585Figq/lUeWcIwEqcsGn5tD3QBzSMyx5nkrx6k9mSuk1FnUDUqu2UaFbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893204;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jmr45+w5PXRg5RpCfeXMVb7gswM3LzfwVqEPfpZ/k7Y=;
	b=G8ULoygtorl/tfVw9GeAkJ/2fvxJvR9Wyr8dpYV/9taEsc+I3yIrKNAt+9qkFhlh4mRa
	 vMjJGAuDyGGnvyzEFvwfsH8NtMMDdBsXzmkzMScy4mCy6Fi0m2y6fdDuV2kwOFjs2fcDV
	 KK0OuS98zLtlig3X4RWRWGVvqrjL8ednWpHiVGvpWNi/OQ34Df7LOI0kpRcezUbr5c+VT
	 oiPialrW5/UwckVYN9nHFoKoKKro2/0THElTYAiGPKaD7h57N1StuIVyqK+pKKnI8GG5P
	 5vB5OOu13Qe8hyE7DhqjuFoDyxRAO1+NYQErd/ieunKeJYSOIlYqfQ6CHP5A3MKlmCg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FtNXOa9w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.20.22
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010022.outbound.protection.outlook.com [52.103.20.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BE0606A330
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 15:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22BE0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=FtNXOa9w
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQ2Ciwh+nVGW+M4ieLsP41rCqgkiQn/5E9PfsJ62toeWGVvAg4ZwEIvRnNdrG1YTWsqjIC/ROdSXwz+cp9UpNuzp+avDzPSYF3gc0PiKhWSBH3UWTI5OHT58QK3jJ8sBjf5XAQ9VdHDkEHWxmxarEqdfdxdEXaCo+adD9KN4fbT/EkC2m7wpQHtAWHJsx9sISlRCRmD4oMMNCjRvRUFaeA8xINmMpKoOePtmJ0XCnnFdOx2PMByFajefR+jMVmHoSvBzYDq3SeXsdEgIwGQ7tbx5+lpHMO5/eefDb9t4K8DnBh/DJLD0vtuAyaZEZmhDxbw9TsDtPsAwBMbSPUbPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmr45+w5PXRg5RpCfeXMVb7gswM3LzfwVqEPfpZ/k7Y=;
 b=OgDVTXD0DUxcMvo2RBiuxKHuBta19mxOyGgxGNqH9H5G8eOsRgIYUvzHHop+0eKw9xVJlswZNHKIGXlKUUlmehTfYIhgUi3lJxmkdsRnYPs5cTlAEHPKgG47nikKCWtktk/womDLtB+k9mbxM+UbCsi1qSS6atL9xMoihxo9LPFxNZOCNXjYM4dZNqlPb2d2u9+SdAsGWySvFwpNNNAskRQehLwhxDb8QgRxxLQU+OBlesWHJwJtkcKdyFvTjvnSM5tTt0Xe8zMIs3O7kz8NYM5Fbt04T3eR3wytEhER0xSJcw8sJ88lBnGFlWOupl7y3Rp+SFyTLxZdkb9asGLkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmr45+w5PXRg5RpCfeXMVb7gswM3LzfwVqEPfpZ/k7Y=;
 b=FtNXOa9wX4diC+P2TSlhGdiD4e0+eKI8QfOEv+0UOcFyTTSrKSjYtG8xwSj0PSZB/02L0LYaUP4UD8sWmzh0UbJKh8i4zDOGhZ9i6BXBXufnp9Twou9x3ooeB1LRycphUFJfxZDR6tsN3Wa5bF+gzVEBZQkIB37RCwnqVWvYi1QHsTQAYWBmqUXimaV0/5BfaL225N8yyvQcQGDaKbq3ry7TOdJ8lgrCtNvh+VH///XjAnclmCLEAYGP6JxEq/ITJ3xCqM0hebU24w14sI5w0nXp91yuOjYdN5IvNfI34dYWAEkVZGGyasmkbcjCAHTQx8wx/Hsk7cFczax1q/NgFQ==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 15:40:00 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 15:40:00 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: andriy.shevchenko@linux.intel.com
Cc: broonie@kernel.org,
	chernyakin.victor.j@outlook.com,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	peng.fan@nxp.com,
	rafael@kernel.org
Subject: Re: [PATCH v1 1/1] regmap: Add REG_FIELD_GENMASK() helper macro
Date: Thu,  5 Nov 2026 09:39:45 -0600
Message-ID:
 <SN1PR12MB2528E9E6548816E119881537A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
References: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:8:2f::24) To SN1PR12MB2528.namprd12.prod.outlook.com
 (2603:10b6:802:28::33)
X-Microsoft-Original-Message-ID:
 <20261105153945.721769-1-chernyakin.victor.j@outlook.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PR12MB2528:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c37b606-2ff8-41be-8d28-08df3b530ceb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|22121099003|22091999003|5072599009|24121999003|39105399006|15080799012|8060799015|4140399003|19110799012|260925184616899003|24021099003|25010399006|440099028|3412199025|53005399003|40105399003|26121999007|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6iQmxnYuCRtplt1H7zy0FQpP2x+ni1pQYOWla8FIZviCCrmG76J3J09dfNG1?=
 =?us-ascii?Q?I1J/sUvUNRP+B6KnJfBF59RVv4r3ylbteYKtZZNDFRnFSXIpgBMG3bWhxkK8?=
 =?us-ascii?Q?Ms+ArC1fjN1IrwBHgy7L7DpaIAwu12kGYHVw15qc2QJ+/XLNQS1DBijawwq9?=
 =?us-ascii?Q?PHn26fHlIxv1cm1frH3sBJfqT6D4BO5QZR/drBfcvtLoJH0SpCmPTPJRqjYY?=
 =?us-ascii?Q?ZfSW2LlO62UBdyRBctUF/fIMKrRv43Ai4uR6bNQUVDfIoyJNc1hIkmjNZe06?=
 =?us-ascii?Q?I/6hlWxzV4xId2dkwPqETxDHSfLhB1bKkz2mFI7oi+i78EimAFh0sPvYoe4z?=
 =?us-ascii?Q?uaKrxvMEAENdH6jQzAhOgWH1/fU9BS/DMc6eoqzTjiAADRrne2IcYLNBhcSu?=
 =?us-ascii?Q?aaX6sjqBA1xclyq9gC9dMhSvgGkIH/Id1eG5ELbIwlgW/MXBLDhFYT3He6Mm?=
 =?us-ascii?Q?BHzbn4elcAzmsKtJ9Q/FXL1liEd8BC6q3Ezvto4PXAJtRa7G1Se7jFzMAnt1?=
 =?us-ascii?Q?9qeYLs3UPdt+J44WwNUpF3O2hsuFZ6KUMfSCDSugtKPgOJ2FIxDYwtVkqC9F?=
 =?us-ascii?Q?r1EDU90PeFthmW6/vEWzJiw9ehTF0yaaRTY/WoAOSM/kAdkaNbW8HmtXOtti?=
 =?us-ascii?Q?ICfVt1Zfq/sgmdGsRxEjhZwUdcfOs9YSE+Qci+nnC4OpxyJ1QqlZL8H9qG1M?=
 =?us-ascii?Q?vQ72X1n1lMChjaj1TnE/DBvxnFLomlvfTb9lyVrQ679KtKekl2pB2I6P0Vyh?=
 =?us-ascii?Q?JLQ7KWCnfFjxhitdwQRS12jYhDD1xSiVfztmOE1aVnm75DoJ/GEXugIpHWkq?=
 =?us-ascii?Q?T48TzuErfTW0328KzWcQNB/Hj8/PmUYj5C+Wz3dNTOkcrZ7PISZ4/Gkjspr5?=
 =?us-ascii?Q?mEPczcbfM1fvm4IufKRptmFmUD4XpNAoHYfAzD2Spsh/Y6YZBKQFcXKGpq3D?=
 =?us-ascii?Q?UhWqcDzAOIQRMCi/Rl0XKLbyvSQdKfc27jk8elqVAe/SDeS0sm0BA34sC5vF?=
 =?us-ascii?Q?aG1RtlYhEOkKmHI2P8QKuJIiWRjzMnNfPAAEC2hzLDB9BVkGTeEKgyzRgK4x?=
 =?us-ascii?Q?Ae0+QbKUvod5OWMKEeIKYISv/gTvuuTcCQ+42YKjIKT4kk0kvQt7mu+Y0Bcr?=
 =?us-ascii?Q?5Hm8vI2efOJr?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eut6QflMfsn6cy+Fibnq2kiDNOAJmI1Ud8xmFT8nNrvq9M1nS5SUjNaoMLhc?=
 =?us-ascii?Q?mh6SgK+1QZ/Iq2UEK67abyyA5FgMRVatmiVlS7itGE/gc5CX4OSyof8AjNmW?=
 =?us-ascii?Q?4kWp/H00DWSi5sOSlc4yRfZB0clmWZOlV/QYZRIVqb6t4uRccUotnlOCloIZ?=
 =?us-ascii?Q?zuHgJcHviXKidzS31Kkj7U9fAeCFNCgxy4q8Kp5DDhTiyHLWcZCmlr5fEJ5P?=
 =?us-ascii?Q?38afioRTBS+v8SOaTwE3JrMK7F84tzSIaPHFdpGjAaS+D00S7DPJb9pk7Bo3?=
 =?us-ascii?Q?rI3T/IHvBN4NW3vd1hDygmNHLxJO/FmrCMjayq3d20lAIH9ZKSTJaBY5WmOB?=
 =?us-ascii?Q?OxTTATYcPIylrmEMTSaZhLmhUb6WZTHWqpemJ8MlH0OwhW21NB16GrSjdh6P?=
 =?us-ascii?Q?JKhD1WGjG3EJSv6A5vjNFP+twrSdYATtC3R3I12C4VzKWzgmWZSFMxojGaB6?=
 =?us-ascii?Q?+kE1l/GHGPqc9eKDWhg8C3aozMhAqeA33S7eG+kXI8rjialGBIC6mNBut0KG?=
 =?us-ascii?Q?VpBaFJYPOouw0NvsILYQU3ycHv7b8cTna8y0mRsnmxUPCbOx8tWAvwC6FsVl?=
 =?us-ascii?Q?NKB17LAyAcRiJHYp2Ya+dkk7alJaqW6aLjpiyrvFHaSrJrZMttkWWppJPLat?=
 =?us-ascii?Q?Kx6gVWdJKUX8ECwOCfh2X4NIe970YDd5PdngXTLfNzvnkWokxaJGU/SKYAtn?=
 =?us-ascii?Q?7DHHG0wjELLQSNAD/4Vtnii45FAzWaxWfFDWcv4glnytQad71GvjAGbN72IT?=
 =?us-ascii?Q?6TRmDezoNjuOmoYZW67hnMEEG+BqPBz9WL/5yAC2dsNkUFiIAJq+zBi2IV4r?=
 =?us-ascii?Q?En3+hV6zvQfUZ7+zkR/R11lUu0kkk/j7jpMFX0TmTYh7tiJWkEb/WWTS25TU?=
 =?us-ascii?Q?N/T9fVoRQNvoVAPN/HJDukx6R7EbpFhIllWfNRI3FiqUhInyTi5K1+q3C1ZJ?=
 =?us-ascii?Q?w7VZvf5A0qVanSAFj+O7hOVAK9D872usFNgxAgSq9qlp/4ADaO05iyJtK6s8?=
 =?us-ascii?Q?OJwPZGFnTfhr5xD60AWCmveGBU/fmQuVgUduAFCMkqpHhitgNTGfK2ZyKc6E?=
 =?us-ascii?Q?SR4lSYKVxWZL6me8hHvIZVufHQcP9WZFw1g9Fx8IKyRyR5YGbRm1TeVFWBI8?=
 =?us-ascii?Q?zFLWN9u6UaYfJzN3JOLdysNA41GWlPY2ebImsysCvN4wJ63FBSmhkmtRQPA4?=
 =?us-ascii?Q?s4o3kvlXbG6zSfREOeVMiPo+8JFUMhbNugx37IdofAi/1zdZFnPjZgwfNrVE?=
 =?us-ascii?Q?NtTOQTh2gvYxJe5pRQZ0YSmKbnrzuQqindarcGomXrau//IPDtIwScFM/2zN?=
 =?us-ascii?Q?GXkflohu/ASOPXTbGQOA3iVAgEtLj4CtZY8pJypqlhoTB9R+qVsQJrnfWv/g?=
 =?us-ascii?Q?jGVn6ngFZArv8PsRzXCiQOofWA19xii/0mGA1wqPV6qUxlZt7w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c37b606-2ff8-41be-8d28-08df3b530ceb
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 15:40:00.1288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849

> #define REG_FIELD_GENMASK(_reg_field)	GENMASK(_reg_field.msb, _reg_field.lsb)

Macro parameter should have parens around it:

+ #define REG_FIELD_GENMASK(_reg_field)	GENMASK((_reg_field).msb, (_reg_field).lsb)

(In the patch you link to, I wrote it without parens at first too,
then had to figure out why I was getting "too many arguments to macro"
error messages)




BTW, I've been thinking about making reg_field store the mask directly,
by putting GENMASK(lsb, msb) in the REG_FIELD macro, but that's probably
a more involved change.
