Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012028.outbound.protection.outlook.com [52.101.66.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7176854739
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 06:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862755; cv=fail; b=TGg+sFWXzp/1afC6IGRKPOfbeDpaQBkgXsagYhjksosLDgnPzQVBvGH7UAy0RnzBeuCRqPgbNbsEc/aGExblx2lwuULhh8K5dM0Nr66nZioBMJx9V1/XlsNDwimmuTop5em3kQ6PyoT2IV6UXej2VuE83vmx3peo4oPu4+20qyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862755; c=relaxed/simple;
	bh=/5O+O447f72vOmzQWXeq1BW8x0krzbAg72giDjoD14A=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jaPdYec2nN61mMW7O9gGXxDVyKKk8bllOrmY0aGr8Dm1bN1jbqbaROMPofDYEc5JhNKdow9OHap781auDTddEVXFLi4LnEjMqaOL8vwvOcB59X3+0iXVRT54S7wxxwCSNW6WWuPEKf/gg1YX9vbIjBPeapwEF8/saOoVRN+9nGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ldY7BiXu; arc=fail smtp.client-ip=52.101.66.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ldY7BiXu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rg2njahBEydpk7PVs8i1DDRDqxDzAQt3CYliyErjgIHJ70trMaveS54LyH2m09rF+V7FIfFk9AZG19XqQvag5XbNaoGDUy+Z+rv1mEhFOp1iNLn/djmBkPn5xXxFtaB4nWwp5XEyK/EQXg7935nekqICcXGTDrSBRNmhH1a1JE5NMsrI/6faMIG3WaFGzhQNptRIjs+9/bG6FWceoEOEH3txwX3d5lZ31ATSTo9n+iT1lDeyY2dN8rCAqWmCdSckhLLDtW22ZzF42Mdfqb73LfrsjfvtKoVVVQTiMmB5GZLgTnFgHz51Z9Wx3QUTvMMcYi5rhNmwdzrSupMU08wWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oxCgbGVszTzJxV4VPIbN9t1ETa+Sw7cBm39v5tXpKo=;
 b=gi8WIoUrUQlzSTa3UkHxxYj7uOcTZBetJs6/EOw6zVT+oeN1Xo4Yf1NKUx659cCnk8E2ALjKpk/2gVG0Zjm184VaXgMmGCGTqlK3e9wJKscKQTcldwLuTtQ0gODubBzm7N8vQq6yTzwS25Rd0Auvzi6w3cE9P3PbFtuYAtp2joQguoAzb0mYZIOI2eFDfYLnfVyL9XAqgBQ+4geNx7b24vi9QVCnmSpgZwvcez/oLKbPMIl/9dtF9jj3KtPSslYHB79ZphzPAESszvKE1z/awfLqAqU9+TzPzsRmAarViUeEICHU91oohB2kJXNVdSHIQm1pux4y/CbeOVz4ABO8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oxCgbGVszTzJxV4VPIbN9t1ETa+Sw7cBm39v5tXpKo=;
 b=ldY7BiXu51/PrJiNmAv+KNYyyBSJYhml3+QrbmxFFf68g+mST1PSwucE7FEdjPohRPVpKu6WA+2GxaUx7+W4x7OsNL3EX1VQodQgZRWy5kz+J8zAvyMZ+XpPj/IRxz1Phkxog1n69lYrQKvJLnWVviodBSa4Pw2+vCrKAH95c6tkbel7iOCXlXubQxKQuyj0Hz5CjaEdVXVjouqj1glufm88dbDmuqS3hJ50nq1zzSgsASRK7WGEiJpw+CxABrdSzqDPfR4nfPyNs0tQP6LTKhLXKgHsSQxH2Z2iZuHUZhNdvsrqAcwVjA6K3HtQ/4ziCUjvIKzxWgUe5kJ+KRXSlQ==
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA1PR04MB11507.eurprd04.prod.outlook.com (2603:10a6:102:4e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 06:19:10 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.019; Wed, 27 May 2026
 06:19:10 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"rafael@kernel.org" <rafael@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>
CC: "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jun Li
	<jun.li@nxp.com>
Subject: About device_links_purge() warning
Thread-Topic: About device_links_purge() warning
Thread-Index: Adztn/JkRurhoGfrTyWbeVQ53s0ihQ==
Date: Wed, 27 May 2026 06:19:10 +0000
Message-ID:
 <DU2PR04MB8822AF9D63FDC335D80DABC08C082@DU2PR04MB8822.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR04MB8822:EE_|PA1PR04MB11507:EE_
x-ms-office365-filtering-correlation-id: fb7a7f5b-0f49-4caa-cf3d-08debbb7dd77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|38070700021|18002099003|6133799003|5023799004|11063799006|56012099006;
x-microsoft-antispam-message-info:
 cLV+5LLVSBqhB8I6jngRSOu4wqBxhYT0IV2eEe7e03ZpCfKMcauKa6nfYvQDLIAC8H9yCjfp9oiwyfu4m7uiBaNHo6JfB53TRl0cfiWzLbJxhy5kyBDdVjXuexYzl4Mbb4gs2eid/m8Q+MYmCcVfjhLioP5mPidjaA9DNpuaNoDXIgCHdCc2TrB5YgJrsuwULeHjKY1tS95jlYEOGMk7G/EgoUYo2laMLdk8c2XyfsGik9ubbo7WTH3Ef35NffGTm4ByFrE5AE6ix0ZUgX10KQfnHVjGBWvxmR633ca6bAAPc4mihIRiqJwowvhQ4T+7wInpeYk2H+TdoALyG9wdCGV1NgdQbG7XTOHAgBYBvS2rnhgWqimRQK1lZYMNfd5pTBEavbAdeSKwGt9fJJQX3UHndqx3a8W7SvYoC6hW8POEDXDRC5utjLDXCRECCLju3XZ3JVPKiIk9NCm78UUBpCtiLeX6pHa072WCIMpwMTGzo0PszNrU8qanEhUHBRcpdEiH2yUi1svnLFmbb9nR0/mAyrBsZADX54LmxVdoJnt0znvMRtlwcClopcj6rQ/KiblQL8rHdPQkshaYmwp9HoAmdmCYGaliaiumVxSbkMJahUWxVFzFAHoGUtreQW0q9RfxTxas5FcGLqAPb2bjmwirfwNBGQL2SjAXmVDDOG07neZC6fd4jSXpJN0w3G97sGj3bBLKbyk9BeFVz/30AkN2FGq2P1kljnhqgIATfy6huBDZYxE/Nqw+JLZj6vSf
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(38070700021)(18002099003)(6133799003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?p0KWWrFSFSA1dOwrtSgIye6LnIdQnCNrpRwmbdQw/ipAvqPMwrXqH7a+N6i2?=
 =?us-ascii?Q?FEyAiXZpYnJFOa/eObg91pVuiT1tUA/2drG5HthJ82xWI2EabwG/2h5QqOhK?=
 =?us-ascii?Q?LKbvglA/yEiFS4VTxVjLdCrWw3d823JbTv5iIi9rfuCYkoYQ1T6SiTG0iR0+?=
 =?us-ascii?Q?D+9JRNuMeg9r5F69PyQ6E7c+qR3cSsFiJCqeuEAghGDgfNIHYfUAUb1TYK+a?=
 =?us-ascii?Q?pb1xf50F8As+FSRJSOTXz4pD66P6tvspjHDQLzqSMrTR8vVib20VEYRXVmpE?=
 =?us-ascii?Q?rB3bAV+kealHT7k66DZDooKKYOmCr4aMiOagmAZwhyVWzANwAoSwXO5++J2v?=
 =?us-ascii?Q?fsV+Ng1+8251ZVwKWmE7jRNiVylYCsy6xkuXqjTNqSWNN8VckZMxwOOACYaM?=
 =?us-ascii?Q?9cD3cF3GDYP93RDK/DFgO1nNW32Oh6Mo3AxL1IxYQjB079JpVPfOva+abRlL?=
 =?us-ascii?Q?h0m0p9l+SVncqISrTxeoj67oSh1uG0u7aF+3lXHvHW7zey9lLGovr/yAdXh8?=
 =?us-ascii?Q?tYJkbj1LscbN+MF53hWh36IjHTmeJQb8BGKuz0BEzVgIoTv8OZCBUd1ugNJZ?=
 =?us-ascii?Q?hwgmYwc3pDQzxn+dvFNzswvzxLJJyWy6ensrIhBkPTLLahAzgeZ58sF7THla?=
 =?us-ascii?Q?3FnBayD2KV1/5Ic/LMdXsBEUc86cwBziWTAVMM1DJV9DqQM/VJcAfVsrWlkA?=
 =?us-ascii?Q?Yj2svfAtSg8b5Gt8vyl9T4wxg41C23JlBcQGUWQC3KMddt9XDW8iofDbFkDM?=
 =?us-ascii?Q?udJwyb5xr9HM/I+95DNleFdPl26quIgdFszESbEgn54IAjP43aGRMyAaAg8c?=
 =?us-ascii?Q?Yu7EppheSJkNsLk+6i5HMnpwGpMNmxdBf/Q3ABxDISZ1nBkTaQ30F0v0tCwO?=
 =?us-ascii?Q?k0FtCkvuxxDAsXH/0J0XdTcWe+9h7aMw8iJjUwRIA7BxYl6h4u7ubL/CVDxg?=
 =?us-ascii?Q?tGsC9zX4HkZjaUAWNh5Pa8TKJ1Nvot7n7qpQfDEAJpsmavSgn1MYvnis48XW?=
 =?us-ascii?Q?taF/uP/Y8V/cVLrjMI++uiv8nXQ0O0GjRocm3YroD5JJAUfUH95G9QjYppch?=
 =?us-ascii?Q?om/L+/w0S5QCXxoz25Z834Wtdyr2rYwhA/fTih0LuVr9jPhrj3DhhUozclii?=
 =?us-ascii?Q?A1bfvFLWy/M6M0asuKU0D7CXnm0mM+tyuFHHe5BGgAPEOMcOnmzCcuMaK5rW?=
 =?us-ascii?Q?cMDqeeAAAX0ybubdnCHvV6Ff2OSaM0ts8vs63WmgPgmL+f2IU6SdTOUhFdVc?=
 =?us-ascii?Q?uac9Ot+exR2dy2QjXCi+/BAhktIctmnkscXHu4UW60uTiiHZ+OVMbSRcA6rx?=
 =?us-ascii?Q?nk/Gu/6Gsrpmhq3EvP7/U14C+ztZc4/IvgMj83DLqnymGHJJAJqAvHBlH4gw?=
 =?us-ascii?Q?ybv97HjHXnyUhd7xiZaTvrS+dP8rrgcHifJVGlT2i2LzAuaCMSojshPBoXIh?=
 =?us-ascii?Q?soc0ttueOWpPqWQ7fPgeYH+PJ6ZRN6SolckmY1QUtnAG1VdZL1wLVvok8FCs?=
 =?us-ascii?Q?RVA6jVpXGHvfnjEGrwsGEOdAqgXhWx10GwrzWFbVxt5zohjIVtBUuz+3xCQ1?=
 =?us-ascii?Q?Mfy3nsfo4paaUAtfWcQykV7vjiHHhsvCk0fLlBevz21yki1wKLbEt7XdkXJP?=
 =?us-ascii?Q?G7IAnxInJ19rwYG7drEtws+/nscfhk+haLdSAfg3Sc3Sx6YvUdUwnOdFAVgT?=
 =?us-ascii?Q?mw6gv4oLEGx2a3GC6DT9LrigOaucxyN7iBkMUU3i/Qo4c+so?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7a7f5b-0f49-4caa-cf3d-08debbb7dd77
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 06:19:10.2046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u60ocEQlM38BvGOmoy+k+hbFLQBnOUnYXr8rs0N68scXTvhtBbYlmevaO1suqQyt4vgWPVwuJUo+vKYPrHqrXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11507

Hi,

I meet a kernel warning dump in device_del() -> device_links_purge():

    list_for_each_entry_safe_reverse(link, ln, &dev->links.consumers, s_nod=
e) {
 ->         WARN_ON(link->status !=3D DL_STATE_DORMANT &&
                    link->status !=3D DL_STATE_NONE);
            __device_link_del(&link->kref);
    }

[  128.196320] ------------[ cut here ]------------
[  128.200932] WARNING: drivers/base/core.c:1641 at device_del+0x2b0/0x398,=
 CPU#0: insmod/704
[  128.209188] Modules linked in: tcpci(+) dwc3_imx8mp(+) overlay snd_soc_f=
sl_asoc_card phy_fsl_imx8mq_usb snd_soc_imx_audmux mxc_jpeg_encdec tcpm v4l=
2_jpeg snd_soc_imx_card typec snd_soc_fsl_micfil snd_soc_wm8962 snd_soc_fsl=
_sai imx_pcm_dma flexcan can_dev snd_soc_fsl_utils pwm_fan fuse
[  128.234387] CPU: 0 UID: 0 PID: 704 Comm: insmod Not tainted 7.1.0-rc1-00=
016-g9186b1f497a9-dirty #505 PREEMPT
[  128.244281] Hardware name: NXP i.MX95 19X19 board (DT)
[  128.249403] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  128.256351] pc : device_del+0x2b0/0x398
[  128.260184] lr : device_del+0x1cc/0x398
[  128.264014] sp : ffff800082983720
[  128.267314] x29: ffff800082983750 x28: ffffbbdae88f80e0 x27: 00000000000=
00000
[  128.274438] x26: 0000000000000000 x25: ffff800082983cb0 x24: ffff000080a=
58810
[  128.281562] x23: 0000000000400100 x22: ffff00008bb65cc8 x21: ffff00008bb=
65cc0
[  128.288686] x20: ffffbbdae8ec4c40 x19: ffff00008bb65c10 x18: 00000000000=
00000
[  128.295810] x17: 3034303066316334 x16: 3a6d726f6674616c x15: 005708e68a0=
88db3
[  128.302934] x14: 00000000000001e2 x13: 0000000000000000 x12: 00000000000=
00022
[  128.310058] x11: 00000000000000c0 x10: 0000000000000b20 x9 : 00000000000=
0003c
[  128.317182] x8 : ffff800082983630 x7 : ffff000080001700 x6 : fffffdffc22=
bd380
[  128.324306] x5 : ffffbbdae6caef6c x4 : ffff00008ae7c000 x3 : ffff00008af=
4e1c0
[  128.331430] x2 : ffff00008bb65cb8 x1 : 0000000000000003 x0 : ffff0000933=
30400
[  128.338557] Call trace:
[  128.340993]  device_del+0x2b0/0x398 (P)
[  128.344823]  platform_device_del+0x2c/0xa0
[  128.348913]  platform_device_unregister+0x14/0x3c
[  128.353611]  of_platform_device_destroy+0xf0/0x100
[  128.358392]  device_for_each_child_reverse+0x70/0xc8
[  128.363352]  of_platform_depopulate+0x34/0x80
[  128.367703]  dwc3_imx8mp_probe+0x24c/0x3dc [dwc3_imx8mp]
[  128.373004]  platform_probe+0x5c/0xa4
[  128.376664]  really_probe+0x15c/0x384
[  128.380319]  __driver_probe_device+0x1a0/0x1c0
[  128.384759]  driver_probe_device+0x3c/0x11c
[  128.388936]  __driver_attach+0x74/0x1a0
[  128.392767]  bus_for_each_dev+0x7c/0xdc
[  128.396597]  driver_attach+0x24/0x30
[  128.400168]  bus_add_driver+0x138/0x2ac
[  128.403996]  driver_register+0x68/0x130
[  128.407829]  __platform_driver_register+0x20/0x2c
[  128.412527]  dwc3_imx8mp_driver_init+0x20/0x1000 [dwc3_imx8mp]
[  128.418348]  do_one_initcall+0x60/0x1d4
[  128.422181]  do_init_module+0x54/0x244
[  128.425923]  load_module+0x16c4/0x1dc0
[  128.429669]  init_module_from_file+0xd8/0xf0
[  128.433933]  __arm64_sys_finit_module+0x1b8/0x334
[  128.438631]  invoke_syscall.constprop.0+0x40/0x108
[  128.443414]  el0_svc_common.constprop.0+0x38/0xd8
[  128.448112]  do_el0_svc+0x1c/0x28
[  128.451423]  el0_svc+0x38/0x140
[  128.454558]  el0t_64_sync_handler+0xa0/0xe4
[  128.458735]  el0t_64_sync+0x198/0x19c
[  128.462395] ---[ end trace 0000000000000000 ]---

Simply speaking, this happens when a supplier device is removed while a
consumer device is probing, particularly when their modules are loaded
at the same time.

The case as below:

usb@4c010010 {
    compatible =3D "fsl,imx95-dwc3", "fsl,imx8mp-dwc3";

    usb@4c100000 {
        compatible =3D "snps,dwc3";
       =20
        port {
            usb3_data_hs: endpoint {
                remote-endpoint =3D <&typec_con_hs>; <---+ (supplier)
            };                                         |
        };                                             |
    };                                                 |
};                                                     |
                                                       |
tcpc@50 {                                              |
    compatible =3D "nxp,ptn5110", "tcpci";               |
                                                       |
    connector {                                        |
        compatible =3D "usb-c-connector";                |
                                                       |
        port {                                         |
            typec_con_hs: endpoint {                   |
                remote-endpoint =3D <&usb3_data_hs>; ----+ (consumer)
            };
        };
    };
};

Node usb@4c010010 will be populated as device 4c010010.usb.
Node usb@4c100000 will be populated as device 4c100000.usb.
Node tcpc@50 will be populated as device 6-0050.

Issue Description:

1. The system adds devices 4c010010.usb and 6-0050 when it parses the OF tr=
ee.
2. When the imx8mp-dwc3 module is loaded, device 4c010010.usb gets probed,
   then dwc3_imx8mp_probe() populates a child device 4c100000.usb.
3. When 4c100000.usb is added, it creates a device link:
   [  126.021683] i2c 6-0050: Linked as a sync state only consumer to 4c100=
000.usb
4. During the probing of device 4c010010.usb, tcpci module is loaded, devic=
e
   6-0050 gets probed, and device_links_check_suppliers() sets the above de=
vice
   linke status as DL_STATE_CONSUMER_PROBE.
5. Probing device 4c010010.usb encounters an error, then dwc3_imx8mp_probe(=
)
   depopulates the child device 4c100000.usb in the cleanup path. However,
   tcpci_probe() hasn't finished yet. The warning occurs.

The system doesn't prevent device 6-0050 from being probed because 6-0050
is a sync only consumer of 4c100000.usb.

Any ideas on how to avoid the warning?

Thanks,
Xu Yang
