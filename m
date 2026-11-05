Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793920227;
	b=xscH5pyluN7+/bRdxZWC/SyGA4k8xRLFUOg+vJYNxs1CNbN4vZXmuGUjsz+31knp7Vbs
	 dEXokKdJcBdu646zbOmPylkGcbflMnRxK8mlZZB2RdQSH69bPK9hNPuQIILtxiR1lsx3b
	 WqUCh4oCyoSMA5BL2Knd9nuFwyshdRMGsd+xpTG3bm9Jy4FzOMC0+XnIWMNxBikjJ8W7L
	 UhzJHq2QAAhUqtZEo+8HcMZWQ3fTaXztgSWNow3cAqa7oeYpHvMWOW4H80o1o4cpxlSIq
	 pStszxzWNIg4vOoVF5ybGe9STlsvf0u986NPl0wGuCIl324V6PP6Lu2LLm81I0jWWsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793920227;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-CrossTenant-rms-persistedconsumerorg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TgATLYZblcsj1dCrnER7QGoGDoNDxeQOSNxHrZJ+4j8=;
	b=3VKFLgEoyGUwt20JdgYRqtUlxeWhnywF4B8Ll6fXW5wCA1jy2bM1GY8eKeZM9Z3D/ZvW
	 0MFf7GB7du8JB9aLyBfVCpzWr6VDM7icj9DIIlZi4rxEtHXWvHSbnt9LgMv7UznbZ24w0
	 Tp6wBwroPoaE7ODZBYDBxWzAXT+DWD+VBMsSWcAU/cBCe8nPvYi6ANQu0GAph+8pclVYL
	 y+2JO6HsVUuqBVCB3CTPVJrO3YE4pow2wcwjNd2bd4fWJ05Vj2OuE8R3unPjTquIvMr4R
	 T0miwid9ygC/MMWFD8KP7pJrBnRnH5PjOWa+9fprvKjMyGPEeL1Cf9HVRv2pONluI1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=U1wOxQbk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.18
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010018.outbound.protection.outlook.com [52.103.2.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A61606A326
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 23:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48A61606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=U1wOxQbk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3si06NKgkX4c/vjYutjpQPLQBVyXUU1/p+gdp0XwfdcCGgX/LvLs6Ngh09v1pGY5X70bYUpWwfz3zpB+wPu7/4oXuEDeRILFzrx7sNguMsre8EZbGFUNxr14YQ6wUuHGr4t1c2gZ8JoYZmmCL5aL2P8TLY3bpv2agtqVzhmz6WkGW6V19D9dCTJDpuKegLqKXd6d2vfyIDN20ugDFQfLHeEyvwfhMHpEaQZkYwYmEMhw6fLyHBjN2oqKDzi/1SwnHSygZ7JqMbAtE+Rn2CDmhdIhIPhgma6qfUTwBeAyECXX6IzJbkS8c9YNyDgOCY2CBad/2u5nuvlw7+xMGv0QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgATLYZblcsj1dCrnER7QGoGDoNDxeQOSNxHrZJ+4j8=;
 b=MJp08tpqvoX1ttCTFlOlCi6RuUbr3l/mYCNpqLDLvDy63Czuws3LssEZ35NDCJWa0HItciFz7WWwKDa6gSrhu5bwFZgvxv2WFhpQ7wUs0nmUNnYkZ9/ZSKvp8CcNNDXTvtdJFZ/02qSE/LPRjR0OntKhhsFcE5UGtJkli5pPHGDrx8l27c8Cvz5IUF5lWUsc3PCmkDQTNNgZjVyhwOBspvxxrZFxUaAPWxMxH5hFvFr7Wef7z6hUsehWL79/GYx1+lq4ANP84avf+Bc79AHyKHEVXJGSLC3juAz5XD5YTGPP1CBLe3FtpIX4/r/2XhDiztuMIqyXGe7HKBKKX6/77g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgATLYZblcsj1dCrnER7QGoGDoNDxeQOSNxHrZJ+4j8=;
 b=U1wOxQbk72oCtKZPCO9Jnr84iIC0nvUqt2VsHodqC70Rqoe0KfYhiXsC0o5BzLVhQrL/C3kZEs1xeYDiv4KcZoqUWQ/ZSo7ItbWMZuuR7L2RHdupOd7arjcjmri0YECVjAYWM4jImZ3MxMn09eJnLq/81VV0YWlIzuPp5y8+I8qkdt8IH3N4dOBZB8WEslFlyK8ZqlSFyL5OIdm+fSTZCJwc5NmQKBy1ZB7awrPYEgg7jkFazWleVhg2nPRfW+RvINkHfzc0PBB5xNqYiObFNY2rAFnzt9xvBYZfNAcm8NmiFZ9/OejyvFpSGL1KplIkbgXNv4x/6yFuq6LwNay0Lg==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by DS4PR12MB360321.namprd12.prod.outlook.com (2603:10b6:8:4bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 23:10:24 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 23:10:24 +0000
From: Victor Chernyakin <chernyakin.victor.j@outlook.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>, "dakr@kernel.org"
	<dakr@kernel.org>, "driver-core@lists.linux.dev"
	<driver-core@lists.linux.dev>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "johan@kernel.org" <johan@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peng.fan@nxp.com" <peng.fan@nxp.com>, "rafael@kernel.org"
	<rafael@kernel.org>
Subject: Re: [PATCH v1 1/1] regmap: Add REG_FIELD_GENMASK() helper macro
Thread-Topic: [PATCH v1 1/1] regmap: Add REG_FIELD_GENMASK() helper macro
Thread-Index: AQHdbRForPQ2LLIlkk+fG8sjrMGlILcfnaCAgAAllYCAAFK7GQ==
Date: Thu, 5 Nov 2026 23:10:23 +0000
Message-ID:
 <SN1PR12MB252885BD25A9343DD34D2D12A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
 <SN1PR12MB2528E9E6548816E119881537A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
 <auzCxxkUB9p6WKNC@ashevche-desk.local>
In-Reply-To: <auzCxxkUB9p6WKNC@ashevche-desk.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN1PR12MB2528:EE_|DS4PR12MB360321:EE_
x-ms-office365-filtering-correlation-id: 90e4d6a1-4485-4289-3017-08df3b91f8d2
x-microsoft-antispam:
 BCL:0;ARA:14566002|25010399006|19110799012|31061999003|4140399003|8060799015|12121999013|8062599012|24121999003|24021099003|22091999003|15080799012|51005399006|15030799006|40105399003|26121999007|102099032|3412199025|440099028;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tg80t6wmOBTeqrIwpbcBtDc1/XGSvxTk0gr9TSwrYcbrNAoQx34xE+RqfG?=
 =?iso-8859-1?Q?/ft8gOz63cY1rXt/3GX1jXwwIAXxoYu2uiyto6BP9dpXekkM+Ymcwl90ed?=
 =?iso-8859-1?Q?uVWZShhv2+8qfMBC52VVvTYUvgxGRvoyuQdvjui/k4sn1nsQtJ8NpZ1N2S?=
 =?iso-8859-1?Q?7FlTFgJytafBMruBqH+jdOJD42MxBgMHJdb4WndCPgHhnEO1UvwgZp3JXA?=
 =?iso-8859-1?Q?YTqWnd4Odxh0o6YtliMFdbYgUZmfQBgx8EPALWaeGpXobljINyGB6CKAOw?=
 =?iso-8859-1?Q?0QtIeWdlkKhZTNK7frjDDkIb7EeQQJUiiSaUF1whW59SN1753/pCmJzNkJ?=
 =?iso-8859-1?Q?8Wxaq76JM3kqfn5gL2JuKbvjS1hoIHSDslym1qrUTigi40RC1UpxIBe5WP?=
 =?iso-8859-1?Q?KQUGF39ypn7OmAcILKPO2qB4h7Avwru8ofYn2Lo1i4/WQNGpxV6gATrvGG?=
 =?iso-8859-1?Q?Aq7W+SrjLcf5TPx4YzU8urOTLNx+M1maZlk9JQsoigjo4wEViu75Vp9OaA?=
 =?iso-8859-1?Q?tb4O8J1ZUfqi4PkkibUVVa5Qcw4A9lpH5+NZ1IL3XWh5SH8f5eDpcjZ9RR?=
 =?iso-8859-1?Q?j5YZIZqZuv87KjC1o2MSiX+nz8JMoE/n1nbcT4nHyYyeGdlSX9gllvZSsV?=
 =?iso-8859-1?Q?7CBdwJ6pcqALh84yAJtVtVj7r1lgTeAfzw5+U6mjNNu5NwLkJ9ZxLfms7r?=
 =?iso-8859-1?Q?C9aCQIwGT2tTN2+FntmHmym/ZjnXeu+LIASxlncBLHJw56d4ZK5NVu/vYo?=
 =?iso-8859-1?Q?EDEURVPtFAACbBicpU1SdIQZplKSg1toqAEyv9VM0eXPscRW74SqUG2pHL?=
 =?iso-8859-1?Q?6GPUZI+PB9wSRbx0wSKY1v3QRKO5qLrEk8AsQckD9GXXkhYm/EvZQBwzwh?=
 =?iso-8859-1?Q?w/8OULo6aIqKBFpaoRkiBP3ZsgC1JtXEKwSI8Vv4SMulm4YebaR7xRWLLc?=
 =?iso-8859-1?Q?5hIEUhS69aEvjS0jwDjolmaWMHqR1SeIbnexkPN14rlVIlOvnS+PKVBOBD?=
 =?iso-8859-1?Q?SRnQQKeUQnLvm7tpmeBw5VpXmt9F943BMBXecV0Ir229zddMPMfv1O77ys?=
 =?iso-8859-1?Q?/I1DSlFXmAJ7ZVVOlMwNaysJzQeHcOjc2v7Jh7Vznq0I0J8JIz0Uv/risT?=
 =?iso-8859-1?Q?dczyC8UVTrybnpv2yB/ZNGputg3do=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7jU+W3xITmAf3e5G8TkqlR3TtpApSiaVNZvDtaOFDdXNmifJbiAIo3tQNe?=
 =?iso-8859-1?Q?24LAx4Mn9IO7K0RRqbQB2b7e72RQM1ZjQA3O7WlzCW62uKjCezA/q4DUEp?=
 =?iso-8859-1?Q?xB0hJOVWOWFlc1KfjzDie5wX5/OqwcjkBvzTBr7tH+8FVITihPMHTWSFCy?=
 =?iso-8859-1?Q?eCkCPw2hAASdgR1Hwj9cspcIztCC+w9dT8C1RmFkXo0YOpW4pWZxm+pkvV?=
 =?iso-8859-1?Q?BRfyXmN752ZJMEMHEu94Fmy4GhuEeYCT4RqGAeYj/CIbT83ML7NeeeJa4f?=
 =?iso-8859-1?Q?0W0WY9HbVKMEOOkn1uYYPTvWhTgsAHXEavjjDd6WN8dZAQ9QO3dE2Cpqwa?=
 =?iso-8859-1?Q?Yx+9R5Tr8ORDO76wr+/p18hdowpt5PKt2iFzRNqgXrOyt+f3SPy7pqgsrH?=
 =?iso-8859-1?Q?pUCLYirRmwqB8rgedCjmG17AmeRGyD+l+G9LtJx/Ilg9QPkd8RHw7gIezq?=
 =?iso-8859-1?Q?sOxOH39CYedZ3nsooyp4VAzkDHLQkAB+eBOpimZxQhshNFna7x3Ad64pfW?=
 =?iso-8859-1?Q?6mqcsgqdKXvSkTZgsML/BVCOL0E3/FfDcSjdtZEHPMzL+1seEKZnrONsaM?=
 =?iso-8859-1?Q?pEgotTkJNjwp+epXZLZ08IKOlV+J48jGQUGU1K0pLIDL0tNchd8OCY/v31?=
 =?iso-8859-1?Q?KjF+UqK+clUlEwKFWCRCPnKnvZxZ38IKxRNqndKIwFjGvnxTje6l1XucZZ?=
 =?iso-8859-1?Q?3nHiqrxyM+bVNxzrcCEZMmVcMxXGCiXM98xEMdAvHa7UbTDc6tCoVPApt6?=
 =?iso-8859-1?Q?vIvrS3YZqm6Q/W/JkvB9WCzl4/yxEsrsm9REPrgiiV1D9CS2EZd0l2sZaT?=
 =?iso-8859-1?Q?8O2rZ24Dm/OJFhYBTyRBMjZoS4hy35Ddxx/EkLoB6kJ9cjaqTBJUY1SYpy?=
 =?iso-8859-1?Q?xsLNf3gBDRWABDIZe/uS84fXKb+6wrlu7zYjIZ2WhPG+nop2YTRN0W9TS3?=
 =?iso-8859-1?Q?/DnRffQ5mTKtS+Kqs+mZ3n3RH2k595Iy8/m+cTDXxlcpwDUcnL3TVXgwj5?=
 =?iso-8859-1?Q?CCZpmSZHTlcg0sBia5dUHBP+0L4pGvSGPwQHwcdlNDe9B+PZkAE2a9mnnY?=
 =?iso-8859-1?Q?H0SOydkJ40yaJOBHxLgim33a/xjQR2t/iYZdiXqxG3x1nMGEMwB7gSxPJk?=
 =?iso-8859-1?Q?C1Vi2chA+8RO9v0+eEs147+muYN39DMTEAQ+o3duygQfFf6Sr9BZG4D/dg?=
 =?iso-8859-1?Q?l+4Vfj1tLur4VlSo7o8nKfe8DoRrdWE/f1xC1q7aYtYHvOmYBmiz+HFkPO?=
 =?iso-8859-1?Q?To1IltCAgXi1S53RSAh4bnve14a6flLZdE3jU/hUUd7bljQn1BKyPnsnbJ?=
 =?iso-8859-1?Q?McS87cz8M++kYyqiwZO027bWdQ9n62Y0LekuVPgMdLPYhCVKrA0tqpEgoT?=
 =?iso-8859-1?Q?gowPjjAjtoLrdr+JGATpBWf1W5KN8Nfw3UAv/+S6J3h/HnAn7ba4d+79DU?=
 =?iso-8859-1?Q?LSZ/VwabvsmRxkTpsQn3RAMHVqnGYgyt9Ip8YA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2528.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e4d6a1-4485-4289-3017-08df3b91f8d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 23:10:24.0069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB360321

> > + #define REG_FIELD_GENMASK(_reg_field)=A0=A0=A0=A0=A0=A0 GENMASK((_reg=
_field).msb, (_reg_field).lsb)=0A=
>=0A=
> This doesn't look good as it implies that _reg_field can be an expression=
 that=0A=
> will be evaluated twice.=0A=
>=0A=
> > (In the patch you link to, I wrote it without parens at first too,=0A=
> > then had to figure out why I was getting "too many arguments to macro"=
=0A=
> > error messages)=0A=
>=0A=
> I have compiled it with GCC-15 and clang-22 (in both cases sparse enabled=
),=0A=
> no such a problem (It's also -Werror build). Can you elaborate?=0A=
=0A=
In that patch we do:=0A=
=0A=
#define MSA311_F_SOFT_RESET_I2C	REG_FIELD(MSA311_SOFT_RESET_REG, 2, 2)=0A=
...=0A=
MSA311_GENMASK(MSA311_F_SOFT_RESET_I2C)=0A=
=0A=
which, without extra parens, expands like so:=0A=
=0A=
GENMASK((struct reg_field){.lsb =3D ..., .msb =3D ...}.msb, (struct reg_fie=
ld){lsb =3D ..., .msb =3D ...}.lsb)=0A=
=0A=
which breaks because of the commas between the designated initializers.=0A=
=0A=
> > BTW, I've been thinking about making reg_field store the mask directly,=
=0A=
> > by putting GENMASK(lsb, msb) in the REG_FIELD macro, but that's probabl=
y=0A=
> > a more involved change.=0A=
>=0A=
> But it's already there as you see in the regmap core. What you want is to=
 make=0A=
> it at the beginning. Not sure if it's feasible and needed change.=0A=
=0A=
If all the places where reg_field is used want a mask and not an msb+lsb pa=
ir=0A=
(I'm not certain that's the case, would have to check), I do think it would=
 be a small=0A=
but worthwhile improvement to store it directly.=0A=
