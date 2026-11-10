Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794299348;
	b=PzJCjQ4oTfAPn/CSlsWvgOBqqlg8/VJMhamHw/hWrv4KoubucmvqcWEbl7FsUx7r+lrn
	 qkwYWyYGtpeNMhohMiJz2GDNlByhtB50GTNdIv2CvOnLwFA0NzsQvBVVJ+1djtXaTi2MB
	 AwIWV+cOvAI+nplnUiPY/Mryky1T8/k4/f20oWOAyxTlas3p132cKZTdl8HUO+iOLRZ6E
	 M/FP0+i5edN2T+mnI6ob/5gL7OgXaQIqGdNgYynxcl6nv+nOGcHWqi67crLdHjW8j8zyh
	 2d+Udu2gSMj1iVYGRu5+yTZYvQY6R7SnfzVBzwEkWQPAVRZZmuKQroLt9J5UAQIXSjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299348;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=aBeDRQAMD4uZq9swHVy7BsybtX1Qdm7J3jRlCzAPOV8=;
	b=Vh8/2qtjlulNhO/6OC/Qg0xH2H7AlXMMUASpX1JZGH4vwftyZb64EyTDRH+US3tKYC0C
	 4RYqO/uPE+e+dE0MCVd8pDQ7eNRIUEyTFlWz39HQZcPfl6KoLLcOUmy2aReWts+VwFZ48
	 6pOfRT3RZxQbWR25rBHBxH2SjADNg8g6YmdPefdtHgKfplMq2WX0dX89RWgpTSIkax9nW
	 OYiLrn8E28YxD5rkhWp7E9NuHzuEDqMd5Parngt70BiTYXe5MgX3A4NWl9vz6cg97BdXe
	 m4yF2WcwOq/2BYbBfZTUV25dLS8Y1TJqxcVWM5SHpNy7e7KtvMw9/gGXszxf28mkEMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PIRONYEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.50
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C778606A321
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 08:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C778606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PIRONYEc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkNVl2BC7x3qMFxxrOmYMvG4Rq6lqOujZ+NqvKWINAMIfOkuLQkHGWwdhJHYzPc9zGh0Rnsiu6NFdLu45VdhMlqp+Co04tJmRr8WY+zLLp//mHNuvBxql1THDyLA89/yHGaXqfwE+8/FAXL/NAGPz6zqX7buz6mMT+VTtL6kGugtTbYUGxxAax05NeQBPWHwfVCQu4AXqSi4oP8LQ580qNqSDB5q5HibLvrvZkpCJqV1uqTqD1/qgdK7nWyuDp+6lfc8l1x8v5RUC4U1UX8LhZBZeZWeBt3RZznq3vKfN3mvCr6ghuh1dy8CVgzTi33o8DJ0jXMBIETZcdeLA+4/aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBeDRQAMD4uZq9swHVy7BsybtX1Qdm7J3jRlCzAPOV8=;
 b=fNbbxqcKzikykFjmG1NWQiVB6txFEdfPKhULOvA+gAv1ssC+vj8yTKvd0JMyn66iug92sTi6HoxN7r6cbBajAXktXUjgByol5+EYvRXxZS1CCjoGQI6W6ebjiJwgSH6jQzcMPPiAQgGhPUFYotp3H+F6OtVlaLiElw2/6fEX9C9tbuhUEMZAFIltm774ucaQ2tPnTH6wezRWyst9OqHIcH4GVWCgvN2TS5Ye+fjPWmzbzDIQSFB07o0ZoZc0M1RpKK3Gkcczsof6hIvhenI4+o8L8o8axI5QvzGKhcgYnwLi/faZrIJnA9g3JVjFaFgqoZyB1FOIKSWiGKYuDnF7KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBeDRQAMD4uZq9swHVy7BsybtX1Qdm7J3jRlCzAPOV8=;
 b=PIRONYEcu9IHyn1pTeQ3AOccnl3QlF7HEHqICC04LGN5TvFnQMA/hITQPV1+yoAFKgXt5NpWf1Iuoc2lLfGXuKDyR0ZUBoGNwNyOAjOMWOCiNLVQaD9PNfyZ0z5TBXe0GWMVupgPiTddkbgvuAHiwyDkoeaJNq24GoT/7VJb1dIC0O/KzZ++iUXIik0cmeb+dbfKS/qTtV3jbtVKFJk0ySBX0iuBmBXkr+PbAExaQw4+12n0FRgciZMNosrZqJlQyP7PWFZPfHRC0lRyekmAH9ckluFnwf/H/kZOD8yVptUHisFp+0BLBtG3SKJwHxlrTKlRwJ1pPPDmOMV3aWcgfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com (2603:10a6:10:1e9::23)
 by FRZPR04MB12430.eurprd04.prod.outlook.com (2603:10a6:d10:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 08:29:04 +0000
Received: from DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb]) by DBBPR04MB7883.eurprd04.prod.outlook.com
 ([fe80::3a91:cf25:36c9:c3bb%7]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 08:29:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/9] regmap: clean up and improve __regmap_init()
Date: Tue, 10 Nov 2026 16:25:24 +0800
Message-Id: <20261110-regmap-improve-v1-0-3a76b6c10ec6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPTU8moC/x3MQQqAIBBG4avIrBM0MLKrRAupv5qFKSNIEN09a
 fkt3nuoQBiFJvWQoHLhdDXYTtF6huuA5q2ZetMP1hqvBUcMWXPMkiq0tw6AC6PBSi3Kgp3vfzg
 v7/sBmIR24GAAAAA=
X-Change-ID: 20261109-regmap-improve-915eee5a80ec
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To DBBPR04MB7883.eurprd04.prod.outlook.com
 (2603:10a6:10:1e9::23)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7883:EE_|FRZPR04MB12430:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b6d9c8-f4c7-496b-8bc3-08df3f04adf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|261009223027099003|10067099003|261028144727099003|5023799004|11063799006|261021135927099003|56012099006|261022075727099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|261102123227099003|261102124527099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Ioh6bRErx2lB8tVogTW0NibDo6mmto/eoduQgYX8/WHyXtCRPv4CVmbbTJwkxSv9DtI3TNr4Pv3GFH3iiT4RRYM+f+sGoQ89lqhZPSolbaQYPOdUwT5ww7gWx3Vn00CeDydIMyAYs58U2By8AzCP5i7rTdaTF2Lsed1sl34iSle1MKAXm/vqg9LTQ2T3lGaCFU+Aqp4rqjP3JB7tBd4bbbrV7/m9GXqcHJj6woF0p7YOqWahIcf9aPFmcvBTjCQ2oCUajYUxhn+PUpg6Ignuav0kJM8KhIAkDQTWz7Go75eDpYGMVcUuljrEQSWXqGWWRpc4UMj5Nye3Q2qCQTyjKHscqmc+YLgpbS1CdC5o3mCApo6rv/SefF1KIqSrwiftm+idjvW1kOq7i9kHe8d0Bi2PwO4WPoTP7xnPOWsmXV2/4ZsokVJGqYbCYpwhVsu1RMYyadQ2icNjc2XWEChqDp0nqgHfbFrrS7sFsawn1rc7ODNrxWEFVlSvM9Cu0fCjsVhni5KvBjmfw4tWHBrrEhrOt99LXnWRJoEyaj0Qq8649Jkv29DjKcBOA2XkcFGfkke6UhbOZRGANvEGUpFay4zmQdMjkVSEfFaHNEKYcMLh2CBUTHPI3USiqCfoNDFGicsqeFIVWwon1e0jML1kYzjRiefZ4a6vSonvUgminWU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7883.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(261009223027099003)(10067099003)(261028144727099003)(5023799004)(11063799006)(261021135927099003)(56012099006)(261022075727099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(261102123227099003)(261102124527099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0xxMnluNHJkeWdMaXA3R0RFTkROOG4vaTQ0amlYUUwyL2hrTTQ5dmhlREZP?=
 =?utf-8?B?QkhmSk05MlB5b2MxVEozTzRIbXlZYXMvYzNqVy80bjVybjFNb054YnM5OTNY?=
 =?utf-8?B?V3VmRU9LaC9CdWtMY204cUtLR2tOZkN0YVhmbU5iMEpHaWUzVEx0MjNIZXlt?=
 =?utf-8?B?andsbzVQVVJUaVhkbVpxNnFrLy9wdkRDZ1dsUEhsNXZpMlJ4Z3dwV245b0Q1?=
 =?utf-8?B?WnF3WE5qYmJWWE1VMW55Nm8xU29DMURRZDFRTEFBcmRGQWlVQVpQVWQzM0py?=
 =?utf-8?B?Nmw1UUxPMnM4b2hGeTM2MXhmSFBjWlVKd2VUNXlYc0JwRE1ha0dLN0JYeGx5?=
 =?utf-8?B?bmh4YkQwR3pDeWl5YnVHeGlFcCsyWk5lUllNTGtObXZ4RUJXWHBmR1lQWVVZ?=
 =?utf-8?B?Yzd0RFhzNnFUME9kcnFiVXpIR2QyUTVqZW15YncxR1lTRElmUGZhczYyWG84?=
 =?utf-8?B?eFYrUHROQmNVaGN1c051Q1N0MXIydkhyaWNZbzVzM0tQQ0RSR3c2aEZjNE9M?=
 =?utf-8?B?MEdBNCtuWGJYSnJLV1VpWXJ3Mm1yT1BRQmZNcUZFa1pCdmdENS9tb3hTakNN?=
 =?utf-8?B?ZHZIMm5Gc211R09RU2dtdG85ekRkTDhSSzdFZEoydmlROFdSZFl5RlAxMDZi?=
 =?utf-8?B?SzJuS2Zzb1dYWHJWV2xjNktNeWM5dzRhcHJCN2NNWkJ6ZHdEejRsQ1Q1WEN2?=
 =?utf-8?B?a0hTYUZqUlVxYUN6YnRhYkZ0RkM3alYya21Uc2pRMUZ2SmNrcC9wVDRWWmxZ?=
 =?utf-8?B?dUI0RmpCRXFyZTh5bkUyUzVOemNoUWlGTFRaUG5TdSt5WDZrdWlFUzNHcDFq?=
 =?utf-8?B?VlJ6RVUwQ0QvOVZqVDVzL05DK1B5ZHh6dUx6eVZHcG9KSHdYMXlXWGRLR0Nu?=
 =?utf-8?B?dmMvdStZVUJtZWZsc2lsNEluWGEzb0d6b0xzVzBKQlpkRGVHazBvSEtoRzY0?=
 =?utf-8?B?Tlp0aHJFMnhkQkNyS0wzd3RST05FeFp1a1ZXOVlXOVVSSXYrQUI1T29JQlF4?=
 =?utf-8?B?NWtZVVJTOUttb1JoSytGa2I5YnRBSk0rdCtLSTFWdTRKZHZqSDJLUjNadVVr?=
 =?utf-8?B?K1ZBZGdvMmd1ZC82b1Zjc2J3RHZaMzdTQ2UrdDI4Wjg4UWYyTlRRZDhlVkJo?=
 =?utf-8?B?R2hkZ2k5bGd6OE5LVkxicng3Ny9XR1VtOCtTdmdPb1NiOWliTk1xbFZDc21h?=
 =?utf-8?B?VnNxQ3JQME9yaWJQWlpoRWY0LzM0aE9pYks2cUVpUkoveXVOd1AxS3JHVXJP?=
 =?utf-8?B?anJyZmxaUC9YTFdwUHEyL00wRDNDaFNSSnZzWDFlREQ0bWlMc1lQZVdIc2lh?=
 =?utf-8?B?czJJM3JoQnRxZWhMbHpjbmwrS0grYzVPMk5YcVNETUpMUDNvUDNlV244QmxP?=
 =?utf-8?B?ODYwc2RSazJHUjhFYkRDeHN4aHFyS2NCRm1yWFlDSjA5U0dDeE9oZlFYZFBm?=
 =?utf-8?B?dGt4Q2hPb3cwaTZGakdmVUtPU0NYcWc1bTJiZDN3aVJ1cEN1RzNsNGRKc25Z?=
 =?utf-8?B?UXI3ekZ6L2x1MDJTY1dLSy9jdHZaT0xxYm5MaXhGMmVNd2VvUW8wMHRxYVFj?=
 =?utf-8?B?WTcvdTNkT2MvRWg0U2FVcFBDM05MelVpTnZuOGxUVDhybEM1alpaWVY1OThv?=
 =?utf-8?B?bXpyREZIMlo5UXhsSm0yRGNUdk4wc1dLdnhUbmVEM2tUVGtZSFZwcXE3aE9r?=
 =?utf-8?B?bHpiQS95SDdBWGJWZ1p5RGlTTW1WMTFHRVB3alZuV0VoU0puWS9OQlpFS0RU?=
 =?utf-8?B?ejYraWY3VlUvUFZIL0R3NVpKb2JiTmlWcGNIOWF4RWtNVnB1aTl1d3JTQXNz?=
 =?utf-8?B?ZWlFMjdncjdWM1NzK0NhVURYZ0NQajRzelZlLzZDS1N4bWxxRWpEUWhTTCtB?=
 =?utf-8?B?ZmdLaWttZzc3dHhSM3JYbWlYMmh3TkxGYTY2TTJIU1RRQWNwOENWNmFzOTBh?=
 =?utf-8?B?NXlOeUhDdERlVDVjSjk4amdnY1E5TmRTUGRHcjFlc2V0MmJkajFVMEJaeW1D?=
 =?utf-8?B?WmxrbXBGRVo5bVRpeWZNWEJaOUNiVHdBOEJHUURKKzgrZzdrNlRkMVdqWFFw?=
 =?utf-8?B?blQ3N1hlbU1PM2RZeGpiUUxaUmFVdFBrWXFtaGNmREtCbEZFNTdHZitnUEp4?=
 =?utf-8?B?Vm1hc01mR25XK0NqWnpIZGVqTUJCTUppWDVJUUc2b1lLWERlQk0vNWhwNHFv?=
 =?utf-8?B?Tnl4aGVKNnIrMFdrcWpSMTZlbU9UeDJyOEVOK0d4MUJnR0ZGd1RUU1FRb25u?=
 =?utf-8?B?VHNIb3E4ZDZ2ajN0ZWM0bTNxc2dmT3FYN1BwMmxpWEo4YkIwNzBJb293UzAy?=
 =?utf-8?B?WStHKzZUZ1FCNlh3U0EvTW1OcFRWQkVqZzBEZzRJVkpWYTdXVVVTOXRlcTVO?=
 =?utf-8?Q?Sgw8+BiWd/3ltXhFFFUPX/hN6W952DC46wCKt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b6d9c8-f4c7-496b-8bc3-08df3f04adf5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7883.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 08:29:04.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xT1hJDrKE7wRTTNM37Oku+cZssBACoAbD7mBpqgWcZgmeSbzWsxD5+e8qESkfIgTtORHr2+ppYj2c26M8UqTAiQEvIQRKfCt/E22IJMx+jhVqKnyY0RHbAAx5uraLrgj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR04MB12430

This patchset improves the __regmap_init() error handling and removes the
regmap_bus::free_on_exit. Patches 1-2 fix I2C adapter quirk handling;
patches 3-8 are cleanups with no functional change; patch 9 adds KUnit
coverage for the new bus callback.

Patch 1 fixes regmap_get_i2c_bus() so that applying an adapter read quirk
no longer drops the raw write limit advertised by the selected bus (and
vice versa). It currently starts from zero-initialised locals and
overwrites both limits of the bus copy.

Patch 2 avoids an underflow when the adapter's max_write_len quirk is not
larger than the register address size. In that case the maximum raw
payload size cannot be represented and no raw write can succeed, so the
existing limit is kept instead of being replaced with a bogus value.

Patches 3-6 are mechanical: evaluate fast_io once, and factor out
regmap_set_lock(), regmap_init_ranges() and the format selection into
helpers. The forward goto and the label-based unwinding are reduced to a
single error path.

Patch 7 drops regmap_bus::free_on_exit. Instead of kmemdup()ing the
static I2C/SPI bus to store per-device raw I/O limits, add an optional
regmap_bus::init_limits() callback. __regmap_init() invokes it before
regcache_init(), which is required because regcache_hw_init() may read
raw register defaults from the device during initialization and must
already see the effective max_raw_read limit. The static bus structures
can then be used directly and the per-device allocations disappear.

Patch 8 converts the error unwinding to the cleanup API and drops all
err_* labels. map->cache_type is now assigned just before
regcache_init() and reset to REGCACHE_NONE on failure, so the release
helper can safely call regcache_exit() on a partially initialised map.

Patch 9 adds a KUnit test which verifies that init_limits() is invoked
before regcache_init() by checking that the raw default readback is split
according to the limit installed by the callback.

Testing:
- Built drivers/base/regmap/ with W=1 on x86_64.
- regmap KUnit suite: tests pass under UML.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (9):
      regmap-i2c: keep bus raw write limit when applying read quirk
      regmap-i2c: avoid underflow when applying write length quirk
      regmap: deduplicate fast_io checks
      regmap: factor out regmap_set_lock()
      regmap: factor out regmap_init_ranges()
      regmap: factor out format initialisation into helpers
      regmap: drop regmap_bus::free_on_exit
      regmap: use cleanup API in __regmap_init()
      regmap: kunit: add test for regmap_bus::init_limits

 drivers/base/regmap/regmap-i2c.c   |  62 ++--
 drivers/base/regmap/regmap-kunit.c |  89 +++++
 drivers/base/regmap/regmap-spi.c   |  64 ++--
 drivers/base/regmap/regmap.c       | 700 +++++++++++++++++++------------------
 include/linux/regmap.h             |   7 +-
 5 files changed, 520 insertions(+), 402 deletions(-)
---
base-commit: f652a40d7240c9df35755316569afd12d7a85c57
change-id: 20261109-regmap-improve-915eee5a80ec

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

