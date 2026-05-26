Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010013.outbound.protection.outlook.com [52.101.228.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672B93DA5C7
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798250; cv=fail; b=TZHpBFW095WuHAfSzchpMvwXd1FAaxJoj0YKyU0Juxa/Oem5UanauY2lHWS8d3Xu1A/+UQzNxwvaqJKfR3brMxDobnnJhsET/bWYR64zWplKLF1XLqLxdpkUcqLOC8+E9M9l6OsCk9dffLMXrtEca+GDV8WdINC1g4teuHnw7q8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798250; c=relaxed/simple;
	bh=IVr33DLc9nHW4gw8mOpiSen0xHZVykehLa1RUUbxMr0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mNiGvVx5gnOMI4CYUqdmImhq2u+TwIhT821bipRivprFJ4H5z7FszCxDx5Bdx2vME+fPIrhgIwqF3IJZbCH27cqeZPTmzL1HtT+6J5WIk1o4t1RIUpe3C5gTEpb9+23+HkpyirVEfs+8T0m5ITU6z7DxLOzW1L2D/jhr1K4wS0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IdE/IJ83; arc=fail smtp.client-ip=52.101.228.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IdE/IJ83"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrfQ1so6m33yUTF1RyH/y7sVTrwgrTJt6TdnSfdbBbw5h+Tt6yerL2/NtDrztMwJPvsa42WISs+9HF9EJKomy87SlofEEGI5IgWfnaLhL+sKzsT7tgmcuW9HEJlyYTzKBtn4/BvddRSZIy3h+X5uhR+JuVVM7Gc4uPwu2bbEKQ6So8+anXj7N249A0H8FnMHqaIGfCbEp57i1cUnLJM0MQlYP0ZE+RTKT+BZ+dY9ysPz+AmH+4bx63GPmDji8F0vE5hn1nkXREA0ptMbBl2oGUv16mDljGkoyOAVVTAMQSOKlhAhsNTSw7b1ms3auygsmALwT+yevKl8UPVYZ1FeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVr33DLc9nHW4gw8mOpiSen0xHZVykehLa1RUUbxMr0=;
 b=lElaR7EtnvK3wsqdNwxBYUFYZu+Hlvq9RLc2kXWBodtYe7Jfealr2j2Q1j5daXR1RzA0PZ2AfYFaQk59ucTKTZKn8cjNW/5aWMwcgI5rW7gU4iaV42upoewgUqyrar4yWlRoE0bWm7/nwEetWwn/R3U5WwmDZouifGhXE02LT6ISxsrWyAt5lvHR7F2uQpE31B/9dBD3reFLEcgAvRxBAy3WjbBNqmR27euFxfyblfV3HksfP+R5czU0m8XgnB1EOTKWLppFXToImEsiGl6z91ZArsvjxjf5NoDGJGH+Uu15ORG6ls/Vwho8Im4zI5CiAJiksnZoSnLFopRMKDclCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVr33DLc9nHW4gw8mOpiSen0xHZVykehLa1RUUbxMr0=;
 b=IdE/IJ83vgN9R8B6IpHTcMIWpfVG4hdh8dKDs447VG+1EX+tFES+t4WRxOK042W5S71A4VCPX9E3WPSU2Eg/rIkvZ+vvp25os6AWfoF80CIJSsw6xySXDUX7jMD64WW04heVzmhoN/AeHRyDlrHXxrOLrUvrBelerv6GFXz+8kg=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB12357.jpnprd01.prod.outlook.com (2603:1096:604:2e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 12:24:06 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%6]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:24:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rafael@kernel.org" <rafael@kernel.org>
Subject: Re: [PATCH 1/2] driver core: Fix missing jiffies conversion in
 deferred_probe_extend_timeout()
Thread-Topic: Re: [PATCH 1/2] driver core: Fix missing jiffies conversion in
 deferred_probe_extend_timeout()
Thread-Index: AdztCclSckx2y1noS/SnuWeCExvKKg==
Date: Tue, 26 May 2026 12:24:06 +0000
Message-ID:
 <TYCPR01MB11332227D5CA29721DB763359860B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB12357:EE_
x-ms-office365-filtering-correlation-id: fb74e729-50e5-4bce-b20a-08debb21ae09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|38070700021|11063799006;
x-microsoft-antispam-message-info:
 Zmkzxs7dat5N1RMUaWxeEA7nR0dSqo2yKoj4GbvYeYk2cXkl2y0mbh4ZuiikwULemO20TlwV9NSEe2mmtZgq8eWg3pHejCar4OhcMurWoWuz1577lVgu+59+A2Zv0nk7lsOaGrIZXFHTObCbC+Pgi0YL6xy1KSUUzA2Qtn3n1DOsUMT9jyVLp6pg+UcaDZv53bGsVusjrb/v2CCNGN28jjEsquYmAQBIQQKwWNt7YnaKATOD9cyozMlUvJFjCODHcqze2SBTjB9qsPuV8iqV4ZgpCgwl3LutE1F2xLeqkehFUxRmmME9pdUsij+DYDcAUmU8vlQWTGpObccncjSNpOvYqjrz/5BzzOFj3u+sIG/SEJGuzBV79Km1OcNxuIfraCGDdrfMKTRw6x7qqId9Tt1P4wmSm3QUM9CIS8hwlR+0R0fB01hloTkMq1wT3/sGI68mNqpfUI5Pdm+6MGp/GMbhGQu/x0O/1Y8fyI9jz5rS57q648whQhfgxjqQhgGLqrLoEj87EaaVU8lvKSdOmM0P8uslfJVB8DN8TRfrLajJ8aaO6SogrstnNpUT5zK+FBmGrjFu8ONKJAhuuVrqF3fVI0XsNFkTHdSg9rJz7b7+8xO57YlJvioA9oz4us6c1IVC4E2T8s+FQw+KBhOH2+0PGvEXnTi7XR+rokoPIlxySxZVCz089uR01uGPsGlV91d6cbo+/4buBlO2ZnHGU6L4Tl412murg+ydI4dmmOlNcJ4szL+DkUt1stgfoGKR
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(38070700021)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wAX2WFQxqPu8CEcZmj5TH7eB58cZf50ioA0D3I3F5Y5aWWFbx8rAVfieN8aO?=
 =?us-ascii?Q?eFAfai3sbbdN0Ndtzm+TWcKK98x88CH848X453iMPQQj2VjNog3d5aGbfLmC?=
 =?us-ascii?Q?GAgq5hoHixHmOP7NyCkRE8hVVJwNpmgD4FU1fooznjPIa5mZXFJI1pKzyuHG?=
 =?us-ascii?Q?FKhXglDg4UXFoTnm/xqMu8yxzNaLu5HhuXU7GFFsi8vG4WKnaaO6M7HfbAo8?=
 =?us-ascii?Q?KAS2LNRS/BLuefw+F0o7Ur/04THmy2GV2fKCVHin2AGOeRTyZwsUnoliMhy7?=
 =?us-ascii?Q?sDZAKexZaWcduFobvmudG4pzOA0D2tAQ6JBDlC59T42gFVOOpcx4cB82aKZ3?=
 =?us-ascii?Q?Uy3nGYa/B8UTVOERBGJNpTWaitMHHFYt96xs0EDrbx01y1p4tL2dCN0/gpkO?=
 =?us-ascii?Q?uGCYfUTs1VTffvfgHT2sdh0Mpkt9j0mmrxLJKnxunXx96Jsl17qA/IyGQL1/?=
 =?us-ascii?Q?+OR5jDHsMyQStQSSQrAQTQ108vqmWuSk93xM/G6kt8RsCXB2q4ffveLX3C2v?=
 =?us-ascii?Q?QYxCidGAGdFc3r4iZAsvyMZezIq0RKIK2UlnTZmsMQrzJXKZ3mIsixCwjQEq?=
 =?us-ascii?Q?Dd1kAcUp7IBpFyGfMJp/acKcBCZpsZvDE06OB4kj0WQu9w+QVPYquqhR1M7L?=
 =?us-ascii?Q?XNY4iqwKTbZnPG/yDdRnILQDERh9sgt++I+8tCvD4gLEQBVE3K6V6+0eGX6r?=
 =?us-ascii?Q?XBp/eIEl6tivSgbU/Rs8PCDDK6+jxJX0Qfx0rL6vUz0c7KYz6uutHAhtcLXL?=
 =?us-ascii?Q?pXYNDHTOTm8x6lo6A3itt2m+mhZXZbgV1x/nxaYRT8+qgofDgDXXp1VCg4MT?=
 =?us-ascii?Q?Ln/uQtabmqNDF8l0kqGgBSfMf7vzVQA6jNw/k63sbxTpvQIaP60u3p+F7j2z?=
 =?us-ascii?Q?mqC9cbNLkwAZxBh5CCEd2EjDZ69mpJjoW+WegpZXl/08lZjAr7I3NQQhi2SI?=
 =?us-ascii?Q?ZHeC897afqDwPFnXo6PRf6J4J6GRgBGNhzzzZX/m8WHbpPZ5pIK8gKI82uGp?=
 =?us-ascii?Q?Ma4xkF8g0oyotBdIyM9HmRhYJPW6Ka8fGbUZStc9J22d6IJb3E+eIx2qRYLc?=
 =?us-ascii?Q?St5PdxQAh3pYgJaDI2KAAD/YYjPopiYl/tofE/gW7wF/FC4S/T10d9oBX5V1?=
 =?us-ascii?Q?zlEi2sn5Eie2GBdToXh5fH2IYRoKH++7nsE/7SVmk4sLLykykqsf9dEakWW8?=
 =?us-ascii?Q?cULgcdQ4PuIPMevxQ+Z1wDL/Jrp8NPlU8kIoU/L5UxnAGH3uJZoM3Po7/U65?=
 =?us-ascii?Q?rF2Z7+37nqrN4sRA9Ot6o9LnzXcp+KvwQkdDT9QA5Xy50FmNedOXS5oP2M+B?=
 =?us-ascii?Q?SOKg2F6EBfpDnrx+lfh6s52g4hzMbX/M35KBKf8WxElD2I5Jb6jJhS84Z/NO?=
 =?us-ascii?Q?oWkTKBImC0+Jo0H45o5+JxpA64Z3H9eZI56Sl7K6AaxpMZM/LE+WkE/yi8Sz?=
 =?us-ascii?Q?xoif6yRpEJlcbMlvDPo1MwE68Zjty8RWCLLzrqUstkDIFmwlHDyUK9Rav4U4?=
 =?us-ascii?Q?WmHdoPNIRF82dveLFkkJkhRa8FSE3t8JIj/RrhTk6UG6BJT1tsZAwGjaLftz?=
 =?us-ascii?Q?8lgdPtv+nwPbQnVHFsiK7zRT2yMhpRUH4D6SoxnKPXej/Ba+ybCGYi1HjlTi?=
 =?us-ascii?Q?L3r65vZPTieKgyx1wbiS6Bo5fe8gKcUf6IC79/2pGQ9jNh3LlwLiPmZ4iAsZ?=
 =?us-ascii?Q?1OeD+WRZYTKTQNAlDg9sanAQRGdPctlLQCtPrYwdckv9swMsV6BIkMlhD2BD?=
 =?us-ascii?Q?mR6bX3Gb6Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb74e729-50e5-4bce-b20a-08debb21ae09
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 12:24:06.0925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cCKggVFITNGNwVd5uRT0wG1DEwqayB4/cvTi6X+YqnScg54nqbnbBPUtWywXXRxu/qETl6nEKWa5YHCoPYh6oxxEkbCt4akqfyTrwFCYtEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12357

Hi Danilo,

Thanks for the patch.

> From: Danilo Krummrich <dakr@kernel.org>
> Subject: [PATCH 1/2] driver core: Fix missing jiffies conversion in defer=
red_probe_extend_timeout()

> mod_delayed_work() unconditionally queues the work even when it wasn't
> previously pending, which can fire the timeout prematurely or restart it
> after it already fired. Add a delayed_work_pending() guard to restore
> the originally intended semantics.
>=20
> Premature firing calls fw_devlink_drivers_done() before all built-in
> drivers have registered, causing fw_devlink to prematurely relax device
> links for suppliers whose drivers haven't loaded yet.
>=20
> Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost d=
eferred probe work")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Fix is tested on Renesas RZ/G2L SMARC EVK platform.

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
