Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.60
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793921192;
	b=utpIcvH2pwb9CJAwKM7fvxSyV/C70d79XkO/qSN/Lp+2ck4q6Lhkbnidjqk63nZIVabw
	 mpOJ+aKhx0UzUHbrMRoqxHioBA9r1fk2A3J2+reY96lIx2ICOFFC1Egr/UheHG9NOLkQE
	 X1MP0M+vP4AHgWJanUabnc3mlT8rz9OSlN6jfYKciRB9p0ZPmu27TdVo82Z6xJ/nXrbvH
	 bYjNCRgZJrtVCSP+vYg10WbXHywCa6FzHTUsB6QHmZW9uV8SV3e76ZVThSjMfM0ovcdc1
	 2CyjOAqVxfbfUdRvebMksnbHw7cBwkcq6huy6/tHPL0sZ7M0mBQcLK9VHvIVfT3jKIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793921192;
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
	bh=MHFVmhEwPJ6j05v2f9XLwor/wpqY6t6wCj12nk1MhIY=;
	b=tTmp3v4vY1gvva8g+C1b4hrvoXAG9hHlA0y789FSvEbf9CmKx39DBHULN1376f5OrbhN
	 s/rqgqhKnaPz1pPDUNxUsP87+D5uioiGexJaqnCldz0ipuihF4PVyxhR6W/CWlDSi3pfa
	 QO77zNWh5zz+FyKdIVqv4bueumcz2pjQTGIKBQvHLPXYcZSimqnxhbD2d9nN3vjKyA5s1
	 cu5ltHTJiBPBSJwvUiPJrmi7yV/9upRhxX0OHtCbzij/49+KPv9HKyUFpY/POg6Toif5A
	 lgnXEZOWdRlPvowXuEzNvhIeTPGbdNubRbukBlM4jz1vc1CrzE8iM7K3bVttk4cYFYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=eU98Blx9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.60
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012060.outbound.protection.outlook.com [52.103.2.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21AC606A31B
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 23:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A21AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=eU98Blx9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LpHWURj7hYZWUUroqEtBdgLxNQnLdR5nwi6qI9nxAvaU0y8ajIQN8CJQ4zExMOLFYCBwaEeOzXknmnnErQAloJ/JKGC09EbLLYGTRbMPHNt4snJtfLBfyblFGyQLPgyyfoWeILd5uVgyv4NFKBVKDj1LKnW1gf9QFvazTCtVZnYmkV5BptoVK5xcya39GZjPwTU65xkaPr559lZbLe7rSf2C2xucX3gIvxTR/00+pAs0XqWJt6vJxXX4NaMp/+c78LzI6YiXKkFEUGTKh+fmXhYn8DtzfxPY+AWBYtv/Q1TduaAHq54qkkUZ2AEE0+qgvSidZ30+whT4lSd/THOHfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHFVmhEwPJ6j05v2f9XLwor/wpqY6t6wCj12nk1MhIY=;
 b=tVAcTUJrnGFJnvUsSdCJM1JdyXl5IyerZKff76SeaqCb/2eQBc25C0IacUpLY1GOgjfdAV+K2DV/9g8y7fSxSjuonI6nFb6zylNgl6sy0jIFhG04JpNlzHgV0qv5bPj+rgyegDeNibKZ2hLjzOhoEq3xtZczXPTci2s7HS5KvQq4RVy2hWFT4+Rn7KO8PBaHAipGKRlljnfOs55ewPwbCLxQRyDy8yyWiX3r6icF//9Tnny6/fQPtxmX7TUHvxkV+Jy0LAxC3CPiIVYd5vPo6Avd8mx9cJI/vhHvQMCqjiKLFMtfPkx8RXR+WUqg7IkMqmf4lvehSt8hWFzsZUAsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHFVmhEwPJ6j05v2f9XLwor/wpqY6t6wCj12nk1MhIY=;
 b=eU98Blx9G2qEIhuKO4pDUKfLCsLBdugQnT7p1yiaXTNJpkilpXZamaAIYoeqlMNyYK+ycM9o/tT6aRBEp4Elyj+JGa2qW8N9YJAY6Q6Xf9vQcUgNLX2lNz+gIfWJl1e8wyz7Mfo9G0pDXr5x7o9wf+ZwhB5ya/fd3Kjq8Sf+F4iUaTOa9JDqIwtslXR3PzOdZmYNqJoUdy5fh/TIYiVjkPvLlPET7JDYk6bNc73l1yFq6uoIR8uodfA2pIolYAGXUt0vYlQkICEY66NFHirzvF1WVvM392fCTivW6A6m0rs+P++j6xDGX03WuUEPV0yz46SrX2X7PNkQUfYXrHX+fw==
Received: from SN1PR12MB2528.namprd12.prod.outlook.com (2603:10b6:802:28::33)
 by PH7PR12MB7425.namprd12.prod.outlook.com (2603:10b6:510:200::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 23:26:27 +0000
Received: from SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a]) by SN1PR12MB2528.namprd12.prod.outlook.com
 ([fe80::9875:58c0:928e:cf0a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 23:26:27 +0000
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
Thread-Index: AQHdbRForPQ2LLIlkk+fG8sjrMGlILcfnaCAgAAllYCAAFK7GYAACGpS
Date: Thu, 5 Nov 2026 23:26:27 +0000
Message-ID:
 <SN1PR12MB2528B88EA1998F9E35696325A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
References: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
 <SN1PR12MB2528E9E6548816E119881537A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
 <auzCxxkUB9p6WKNC@ashevche-desk.local>
 <SN1PR12MB252885BD25A9343DD34D2D12A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
In-Reply-To:
 <SN1PR12MB252885BD25A9343DD34D2D12A5772@SN1PR12MB2528.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN1PR12MB2528:EE_|PH7PR12MB7425:EE_
x-ms-office365-filtering-correlation-id: da1b36dc-3873-4221-4698-08df3b943704
x-microsoft-antispam:
 BCL:0;ARA:14566002|22091999003|8060799015|31061999003|19110799012|25010399006|15030799006|24121999003|8062599012|4140399003|15080799012|51005399006|24021099003|440099028|3412199025|102099032|26121999007|40105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?uYTctu5odk1bAmkhNqOwlZYeFehvSJCaRHb/EbY0I/6oJALK9y9q0NXbHv?=
 =?iso-8859-1?Q?QCQv9DleJAmNfrFCuqGUCyf2OpU3K7koLkdy1LuTk5C2Gkm8GlQWPtAvVS?=
 =?iso-8859-1?Q?NWegh3vFX30icDW5vkFpUPF7fri+sttEflU9PYlH0IkaKBUmVtLLcctyQR?=
 =?iso-8859-1?Q?kuabSg/diZ46nlzPjEZAca2Pj/GLa6QbQeMKqdeEtBOsg5DIkZ0b9vghKA?=
 =?iso-8859-1?Q?Sg9fotJlC46nn7kCVeh/TtDsrK6aN5xQIHnb5/1XffpjeOLe32mfjMlMg5?=
 =?iso-8859-1?Q?KAJXSu7WCIO0NdNQwXKzLNvWS6v7Bxx1XcnAN5wlkfViKvziIyXEpOWw58?=
 =?iso-8859-1?Q?e0nsQ2Kjp6md1mZBr8dTlWNQStjNEVFHn35YnKzTP9aaTTZTgLq8WuTU9o?=
 =?iso-8859-1?Q?ib6id5Bxz3G/ZqqffrlGryLD1ngD21KlqjeCJDKw/JyO8KcCMhLsQ09FTr?=
 =?iso-8859-1?Q?jOmY1tUnJEzdH+xQ2ob4aBPiPRtZk74JR0I/PxjuWPknIKH9Ipf9Ac9UHU?=
 =?iso-8859-1?Q?wiQBUt/CB2XTeHskYrxQ2rd0rjWPMSONoAKp0UqqLuOgxg1xop25u7PBWD?=
 =?iso-8859-1?Q?W382cvPVL4r/91GG59OYg2F5EeUxUAiCEF/H2RDBNdFxqLQhIo8X8c8Sog?=
 =?iso-8859-1?Q?IkhekdEtX+CQvIL9y92NWQG4T7Cvpz6diLUICRkapRwGNsuzcaR3UwUkgw?=
 =?iso-8859-1?Q?v5oNCNJ2yM++TocG8EER/cgWTMOeTIZC3CvAmg64GGr4RQ1fQ5svVWmpd7?=
 =?iso-8859-1?Q?nrjRY1nV1dwq1rkETqr4TsR1By7QyDrax6EsNSUSO8pA6xQYvTQpLX3Qot?=
 =?iso-8859-1?Q?tYSep2OpyvLP0BYSyemvRvdbhlF5Hkf8DEFJWbq+19bZGzWQHCggmrSiHZ?=
 =?iso-8859-1?Q?RvDFWaU6kHRwchk6hd9U/TlHGFbkN+2wsdBFbHbNEw+xochpYdGzSS6l23?=
 =?iso-8859-1?Q?raI39bjD2TGMY2Tj8D0onCEVdpQt56Wpz5JkXWQdgu36CgxMUOlrQXgM1z?=
 =?iso-8859-1?Q?iX9u/q3QV00HC3dOW03sa413ry7Y1LkR8BpyTN5ZJW/8kh2lpnEfr0k7HG?=
 =?iso-8859-1?Q?DIX7W6fZ/lhP3C6Vyj6Wk1uMQ7kKesXjP5fcLTW+clCU?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ZJMtWtMnoi6miZn72mYNcviM/YLCjkYH22XyPl33CqLpbIb0+aLsGAEHYZ?=
 =?iso-8859-1?Q?UIozv+4qEyB17AyBWnazHAetY8qugKmZPDdirbxEgAMTxKxOqwyn3p9LuV?=
 =?iso-8859-1?Q?/vGrir7O3QyYY8WeWzRG49EPEWTG3ooWnr+XqdG39OgfTDDUTXANKKxcQJ?=
 =?iso-8859-1?Q?nHxVD/5olSqoeTxRZrYs6l7lAaGjbhA03aWsOMda6eXtZ2Dxyu29q7DFkt?=
 =?iso-8859-1?Q?PwYHt8sX5o5ipWD0oA1w4AiPMHp96GnJuISRNFjLjRH1B2Bw1+mT6tXLAl?=
 =?iso-8859-1?Q?KWEzNVLpvgTsEmsttrI+NXUlKVW9qma2H2HTdcSRBimxhGNJRd1KfiNsiJ?=
 =?iso-8859-1?Q?8MYAYkf8wfK48ZKYj14ZIFqCTn0cIkbLQcfHKhgmanEZ57adF2Uq0qoJ0Z?=
 =?iso-8859-1?Q?ZVzwJOY+6NjZEgcURKSdEzyd3vvPNSCGpL5eI8/Phs57o3/FfkUt0PprQB?=
 =?iso-8859-1?Q?nBqQB3wnUZgDXE1jxwURl6t3HlxMxvs0hQ2XhVCnKezLhGCAWAdKbCREF8?=
 =?iso-8859-1?Q?NG5F02YluWo/hKUjjvlNFXIX3PRkNoRygJyMsKwnhaUF6IbU/s/BzVO01c?=
 =?iso-8859-1?Q?6yqQ+gwInnwDQbjM6dQAcLZpO3lTn1aY8zUr5U7TLhg+6NZlCUKiy9+L+N?=
 =?iso-8859-1?Q?WM39Psuw9790Xkjg/tDIcrx9VYLY9d4ltAUARCkncskPSMvsOuvR/WJXLx?=
 =?iso-8859-1?Q?KmtwnR5s86rGwUYu+njQkwT9cQ3FklD62e7pFwOIHF+5YQ1iPsruVgtdp8?=
 =?iso-8859-1?Q?n3hhpPStR2nvSfvRFq0lwoi7QmCNYQIjp4oY1uzs37qsUVA38NiCZEgX95?=
 =?iso-8859-1?Q?xVW8Nex1El0yaaKGts6xjTwBEPBFrZo3CQnEZ87fXtSDmz/LfkbQbKeA3T?=
 =?iso-8859-1?Q?nJFaDZ2OCi8oRRJ0m6Xev0kc3kSh4xLaHkVAIp9uLgelcEhLB+3h4Ikb2C?=
 =?iso-8859-1?Q?tjxaQTU0TknSe9/iEtS2hkfFPLgU4CYMVavUc/mS9bO5gE7obX5EVmWAm6?=
 =?iso-8859-1?Q?xMevlh7gKeu86Z6VIRzlbGm5bUlkeDNbRWLqVinfI3pE8ryyagipX4cz1g?=
 =?iso-8859-1?Q?ENOURTRYh98Bg5OImGsW1+s3xNzLCVoskrD25bBNAWGT1sR/Od7n38A5kz?=
 =?iso-8859-1?Q?lYxyNy3KPuBKhmV2X9VJo8AcFfOo8si+wJy8zYI/3LYcbJHok1ToKxliUf?=
 =?iso-8859-1?Q?2SbAIOs3ZpljXV1obRXyorkH9lP8Gmu0lJNrmxgTjoZoZ/Sog5zePmLXm2?=
 =?iso-8859-1?Q?AIanyPcxvGeNxRR9RDGssKD+MjbWWq96qK0esOSglGx7XTqRXzGfbOsWwx?=
 =?iso-8859-1?Q?B8sl/tKxsyds/r01Sznd317xiIP0gj3WK+dKqxwxuzL+XtV7M9UI1BrDxh?=
 =?iso-8859-1?Q?laD1+flPZOtJE+B7d6UEmlEfcAtzQDLToT9cijIV7/EliM6cnd3nz32R76?=
 =?iso-8859-1?Q?7gquFCxE7DN2jHxSSBBUsLRCFgkuTWL3tc1KGQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: da1b36dc-3873-4221-4698-08df3b943704
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 23:26:27.4067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7425

> > > + #define REG_FIELD_GENMASK(_reg_field)       GENMASK((_reg_field).ms=
b, (_reg_field).lsb)=0A=
> >=0A=
> > This doesn't look good as it implies that _reg_field can be an expressi=
on that=0A=
> > will be evaluated twice.=0A=
> >=0A=
> > > (In the patch you link to, I wrote it without parens at first too,=0A=
> > > then had to figure out why I was getting "too many arguments to macro=
"=0A=
> > > error messages)=0A=
> >=0A=
> > I have compiled it with GCC-15 and clang-22 (in both cases sparse enabl=
ed),=0A=
> > no such a problem (It's also -Werror build). Can you elaborate?=0A=
> =0A=
> In that patch we do:=0A=
> =0A=
> #define MSA311_F_SOFT_RESET_I2C	REG_FIELD(MSA311_SOFT_RESET_REG, 2, 2)=0A=
> ...=0A=
> MSA311_GENMASK(MSA311_F_SOFT_RESET_I2C)=0A=
> =0A=
> which, without extra parens, expands like so:=0A=
> =0A=
> GENMASK((struct reg_field){.lsb =3D ..., .msb =3D ...}.msb, (struct reg_f=
ield){lsb =3D ..., .msb =3D ...}.lsb)=0A=
> =0A=
> which breaks because of the commas between the designated initializers.=
=0A=
=0A=
Actually now that I think about it, the better solution would probably=0A=
be to put the parens in the REG_FIELD macro:=0A=
=0A=
#define REG_FIELD(reg, msb, lsb) ((struct reg_field){ ... })=0A=
=0A=
So I take back what I said, I think your patch is good as-is.=
