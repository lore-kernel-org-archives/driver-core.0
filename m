Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010039.outbound.protection.outlook.com [52.101.84.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83184915B2
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374817; cv=fail; b=L5ZCzoA18DTrfLvUxCxcB40IsMNQ098b9vCxxdIADAM1hsF2j3VPpLdeQDCNDlhqpQ5Ue8mVzStxRkv18XJhMwSNT8L4+G9wSEZhvQpqpCjmPbnNATJu3P0gKAD9zPAfY+3IYKzkglnZf46flQFdTVMc2A+vIR1z5tnfwESjLVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374817; c=relaxed/simple;
	bh=NxnswuwaTuib+QnVdDkdBDQFhRGqdhGMRrh/Im7LTSI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TRnPxsLqA2vhqiu2asNB6qx8Ud/hlBASaOKec82QlqHkqes3uRsEtMU5/GI2yQVRkBWnmSYJ0aSZshZ2crIEXXe9bEHqKrFtxHhecY0wAbhf0Q7A+S8BWH8bOQfmXUPTfICFHogJDh6w4ShJdkbYUOacGAFLizL2N8VgxJkdZBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p/+p5FDH; arc=fail smtp.client-ip=52.101.84.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p/+p5FDH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAquqAKxLCuTktmS0cFGcnJOiaU/Qf3NYMPbTFls1+67hi79H65v8wZPtJFjMXhXGlY2CG1XeKkgOdZm6PdP9Q+vz9STtCFzkXp7KHaOX7eORL04ksaF4jHChtaclITjUYql5kVLd5Mn5vdiWnE6KLukQV/gw30KjfZD8qrIY7tLwRiFPJ2aMOcf4oKXi4t4mC4XKhfe9D3UkvkY4e4Ij9VLgrtRDqHa0kP1CwcBKX8+lA95DmmWfyxRxEfxlmZVU5etbmvPfllBFQDNmJ6edoNqzvwAce5ofFrEYOV1yzAq7ONz3QBTjDM0Kw750PPP6u5OiAT/7F7nIB2zEwllCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wl4nNFECPumMB+TqvG9PR+25anRaaPbNBKM6The4Vio=;
 b=jokQRmBviMG4Pgxvywr5c/PHtdytUCNA2uOiZt5smEJnNLfUJ2SP11J/zrMmvOE71nggusrhATTjP3DKwAU9xgzGEG0DTEGDqhJziL/5HJcA6U6heV8A1KaeOcREan7jJml2SkvsBfU1JQ4CxH6/jTOZvaZNjXm7MtsdVuzkl401+UljsA1JB2VTtZ58+scCpgh4n1FWdXkolZmUlvrmHHpVQs5Wlid9CUlrjOxJiz2UJ/XjuIuYJHCe/05FrfwTS8378NEtjyJArozXa7n09hntVuh0IQULezl1ubYrYGIHwd8ujEqZqQ7JlfXDk8TF9NncwLSDKhUiJJsFWElRpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wl4nNFECPumMB+TqvG9PR+25anRaaPbNBKM6The4Vio=;
 b=p/+p5FDHWrktZsuYdDlEyhbZuH9WIXll9milhRTiGAk+Av/P6/PQSldtlhMNPS6WA9roQc11iy5P0fvvMWShaF8zRHvOU7QBzw3dBeE9v1OkqUgcFtKZllfQRwK3QO62iYCoB1hSCPkLDdsQBumlFuPAsPP6O+lEhuh+h2hNICogQbcSpvImKcjPda9RjPXlLpTyIOBp6uy93HE05U6ZO1xFvgewP0qdRJsxUesJmdE7Tt8z99qXOIU+Nb6Soj48rOddYPE35Avntfhy1a7GvpwePIdKv4h6moTSdRvPQNI5QVxWrGIE+hQS4jZmdJYFANmCNi592bxISsC/GZ5vMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM6PPF8C695F6EE.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a90) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 12:06:45 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 12:06:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/7] regmap: cleanups for regcache and regmap init paths
Date: Wed, 07 Oct 2026 20:03:56 +0800
Message-Id: <20261007-regmap-lock-2nd-v3-0-0e590c4125be@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC01xmoC/3WNyw6CMBBFf4V0bc10eFhc+R/GRSkDVKUlLRIM4
 d8FTHRhXJ7knnMnFsgbCuwYTczTYIJxdoF4FzHdKFsTN+XCDAEzyGPgnupWdfzu9I2jLXmVSCF
 lqjEpM7ZYnafKjFvxfHlzeBRX0v2aWReNCb3zz+1yEOvuf30QHHgcK6kSiVWu6GTHbq9dy9b2g
 B9bAOCvjYtN4oAFpCB0il97nucXBUuc+vwAAAA=
X-Change-ID: 20260930-regmap-lock-2nd-f481885c24d6
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0241.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::15) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM6PPF8C695F6EE:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e6e258-7965-475c-4c10-08df246b74a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|19092799006|1800799024|11063799006|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	DfQrgWkteBq02cIipY32suXNe/NG0Zk2OkumzRLnWDDvaMT+9AeU8jPWrkDvk9ShkV4CZ7F2TH8E14PNcHHj2EV3blcQT7XtMxdgTyReh0i5tICknGOTPaK3yl03enUCqe1UxJHGxCuGPOzEURSjrfaNJr0lFjyou8hm6jmc0cOCpK+da2w+oQWoPggb9Zqyy4TLgzW2nBXnu24iPsdNFDVoEKKUMICceZM0i4oc6d3YHv1OFF9PkZSo8bnU3I+zWNFVpulNg1NdudM9FRw6GS6vqv0GzmdOWAb6sfPnKGl8Q+mkQiEl9brNhIFSnwHjXRGmwR2EHqNO5QRQwICBR8F1iy9gLNmHL1AwB2+RcKpKTdTFbucSyPA2khvTQnvLpSiRGm+ntT/Qwb8TaO7eNjo1qA4UPt5eEKkrGUCQqc2qCa0RPSLVL3BLfvPQtYSMAlXKaRndSt1L7c41syTxN152jL9saL/7U3gA4MOOMtqZjAbF9F1N5HTBDXFuVDb9DaPMzIM7Isg2vRxQStmqq+WBrHzaHDJrxxbzJMW5i2Oti7kFWGMUY73WOLxeAtnEGPGdx5pBP4nxME/cegBHc0iXKh/v1dMRxeol7h3Zzc8d5cbrn75Hdm7ag5X23Kc3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(19092799006)(1800799024)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFRWbWgxL2JTY3FFckxaclBGT3d2cVV1R0JvRHBuYk1KSG04MEd3TkJzYWFI?=
 =?utf-8?B?bmg0emNiNXpOd05HTEt1R2VCTmRQQ21zZlRzYjJrOFZIRjNvWXhlOU02WEhW?=
 =?utf-8?B?SGhxR3hTbTlYaCtrQ0kzMHRuY3NoY0FTQldUYk9HVXhXWEN5Z2FyOGErOU1n?=
 =?utf-8?B?UURINEp0S1pCREtOb21BVEQ2b2dBVXM3NFpLOEhTQUVBdjJOOGh3WUF5LzB0?=
 =?utf-8?B?L2NxZ1JxZStoQXF4bDFQSmQ4bUNqayt6WUFsSGV4YzFpRWEzcWVnQVloQkRH?=
 =?utf-8?B?RXVLTGgzVnRqQi9XaURZZUxtN0h0SlRYSVZtYkVxU1RGSGtpSDV4Z2RtQ2h6?=
 =?utf-8?B?VzdBM05SQ2ZvSng5TGtqK0NXQzJxVGY0UUxWd2VFQitqR0JYbWI5OTE5bVpk?=
 =?utf-8?B?TWNHbXpmQkwrcUR5ZDNFOFA5QXFLM3M2eHVjNEVzd0I3UWU2QlZoRDhLR2Rv?=
 =?utf-8?B?ZnYrZUlVUHJHbXl3cHNWSVpnZWdYcnp4a2d6dys2U2dhOXN5OGlUbTRpQXJW?=
 =?utf-8?B?QlpVcmJNRHcwZ1JGTHpLTXZiamhWQ3l2emtPTXdYRExYd1UydkhvYnQzTksx?=
 =?utf-8?B?cGxoS1Z6R3pObmNpUlZHc0x4NDR5dUtiNlpyNDd1QzRKM25qcGtrUERnQU5K?=
 =?utf-8?B?cm5FQlczY3l6UFJOcUVBQUMzOElWMTd2bGMrU1AyMXlYamlwc2xWMDBUV1RO?=
 =?utf-8?B?a1JFMXVBQVNDVDZlZDVrbldjOHFZbWt3SVJONGEzSmZHTVFnME8rZ3I4RDJL?=
 =?utf-8?B?OHFFL2tvSzhuRGlSNndYdHd5b2c5akFsbDhGeEtJYVNUMndnU3hRY0docWdF?=
 =?utf-8?B?S20xeGx3dFhCNFZjS00yY2UxTzhJakxqMUduRVhpajRSM3ZaZktGcmVLTWNZ?=
 =?utf-8?B?M0IxaitBV0kwZkNVNE9kc3U4SlFRRlZpOEZoVFJUQ2VPY2lQNk9CWDlrNDIz?=
 =?utf-8?B?ekpRRVRWSmwxaTd4KzlhL0xPdTlHK3pkS3BHdTV5U3RiM1k0VVdzZDB5SDhG?=
 =?utf-8?B?aFdtWVRhdTJ0ZitQT1A2MUt1TktFVmJBNFpXWUUybkNMdmN0TGxqUlQrZ1lC?=
 =?utf-8?B?QXpuZUZueEVsYTE5Y1B6OTUxajk1WmtwSXA5WFJSMXN2dzg1eFFHN1RVWXgw?=
 =?utf-8?B?amx4dmRxQ1EwSDlJbjlmWXdEazJxWk9uWGZtYjByMUZOOVBucG90S3RlWEt6?=
 =?utf-8?B?Mlo0YWkrRVlTYVJ1RGNoRGtEeTBUR1luYTl3U1VLZDdpTTc5SEFwSTc5QnBp?=
 =?utf-8?B?UDU0NDNweXFCemM0MGpZaTNMTWhXM1BoL2gydXRMQmpyUWlpaFM1aDJmT0RR?=
 =?utf-8?B?RS9aWHRhTURNUXBXaTVld05PTk9zVXdhdldpUUFQN2tQUklsNGZDNVdia0pl?=
 =?utf-8?B?Tk9UdlAyRVRZVVU2YmRxMlZHVFhoc0ZkUCt0OXBWbm1zcEgzOGVqK2lQMWN6?=
 =?utf-8?B?aHVQVFRFdTJFNXlCOGwzb1ozTzV2ZjZJeEFvMXVvQ2QxcytwSW9CZ0ladUNv?=
 =?utf-8?B?aDVmRmhqNEZzakpxb21XRDJkT0FRL2dCUSs4b1RJTkpVMG9HUTBiN0dGU0FF?=
 =?utf-8?B?MkhRVFRyQU13WHNCZGhyUlF4SzFQeUJpclZ5a0NwRkQ3SVpva3dKQzc0VW0w?=
 =?utf-8?B?ZTIxMmZ4QmVzSHhjcllLQ2FlMUdJSFJDR3RHZTFkYW5TWWtiMGVGSlgyb0xD?=
 =?utf-8?B?SlFIMGc0LzRSc2pYTEphTWo3aUJteFlMODhTanBwT3krNlJldUFUWWZyRjJu?=
 =?utf-8?B?R1J1ZzZLNlBsL2FWcmdTN3RaTEpKQlF1aHBINEV1TjdSTGVRZFFpaFpNOEpJ?=
 =?utf-8?B?RWRjaGc2N0VucklHOUlvS3drRUNZOG51R0dZMkw4S3JCa0d5RUZNY1RqTm13?=
 =?utf-8?B?WC9rNGRzay95V2ZKdG5Qbk01akxPdEgwZWtOWXRwbW1GNFV2RStaNit5UU84?=
 =?utf-8?B?SnZPUXR5T2UzVnpKZis4ODJvLzhSeUlTY1AxaDh3MG0rWmFCZEowbmNJakxv?=
 =?utf-8?B?NlF3RDZ5MkhVM3dwTFZRWklIM0FHNGlNVlY0aEhOaVdtYXhhaXloU1ZMZXhD?=
 =?utf-8?B?UFNYQk9hamh2UWQ0ZWZTYUEra3hYS1N2MGJDaU5xRlc1U0c4VW9WeXU2V1R2?=
 =?utf-8?B?eXBFdkRoV0tBeTdwbHZRWUJPVm9sWm9jQmdsYUk4YndDMWtkTTZUbjk3OVo0?=
 =?utf-8?B?aXRWR3daSWp3UkoxMnU5NXV6TWV5L2J0ZEFBYzlHMFRRc3ZQRmpMeGFrNUs5?=
 =?utf-8?B?QjZmTkkvZEtEQVRrYXhISDVTd0FVTXVQSVBteUU5Zmp3elROMmdueTNFUGli?=
 =?utf-8?B?elhGeW56UnB5WUJZV1lpTnc0WTdmRHQybVVFZUtUNFltVTJMdWFUZjV0SFU0?=
 =?utf-8?Q?4ZbNJhwGw6/grxHBChbITwXWBTeUSWYBeVl59?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e6e258-7965-475c-4c10-08df246b74a5
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 12:06:44.8598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sPHegbbpB9Sk75lksDs1srtAQw/YC+CAHJ6m3yAsHQSrKkHrpQEOgKzhnmUeNrZ03is6cOP4PFBTucD5OYm3RalyJ7/BLvdHTst/8zNw41snT3+gEobxUDfpN2DKg/Br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPF8C695F6EE

Following up the previous regmap guard lock patchset [1].

[1] https://lore.kernel.org/all/179062150526.139547.3870545428656485907.b4-ty@b4/#r

This is the 2nd batch to do more cleanup.

This series tidies up locking, error handling, and resource management
across the regmap core and regcache.

- Extract regcache_locked_op() and regcache_locked_exit() helpers to
  replace open-coded lock/unlock pairs in regcache_init() and
  regcache_exit(), avoiding the cleanup.h-vs-goto concern that
  prevented the earlier scoped lock guard conversion.

- Extract __regcache_sync() to deduplicate the sync dispatch logic
  shared between regcache_sync() and regcache_sync_region().

- Flatten control flow in regcache_init(), regcache_lookup_reg(), and
  regcache_sync_block() by using early returns, moving guards into
  helpers, and merging redundant sanity checks.

- Switch regmap_register_patch() from krealloc() to krealloc_array()
  for overflow-safe element-count arithmetic.

- NULL map->reg_defaults after freeing in regcache_exit() to prevent
  a potential double-free if regmap_reinit_cache() later fails during
  cache re-initialisation.

Tested with the regmap KUnit suite (drivers/base/regmap/regmap-kunit.c)
with lockdep (PROVE_LOCKING, DEBUG_LOCK_ALLOC, DEBUG_ATOMIC_SLEEP) enabled.
Built clean with sparse (C=1).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Avoid using goto in a function that use scoped_guard per Sashiko
  reported for patch 7.
- Link to v2: https://patch.msgid.link/20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com

Changes in v2:
- Drop patches:
  [PATCH 5/7] regmap: use devm_kmemdup() for bus copies and remove free_on_exit
  [PATCH 6/7] regmap: return errors directly before map allocation in __regmap_init()
  sashiko reports a potential UAF issue regarding patch 5, so drop it.
  Patch 6 depends on patch 5, so also drop patch 6
- Add two new patches to do some cleanup to debugfs
  Patch v2 6/7 and 7/7
- Link to v1: https://patch.msgid.link/20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com

---
Peng Fan (7):
      regcache: extract locked helpers to replace open-coded lock/unlock pairs
      regcache: extract __regcache_sync() to deduplicate sync dispatch
      regcache: simplify control flow and reduce nesting
      regmap: use krealloc_array() in regmap_register_patch()
      regmap: fix potential double-free of map->reg_defaults on cache reinit
      regmap: debugfs: Use __free(kfree) in regmap_name_read_file()
      regmap: debugfs: Use guard to simplify code

 drivers/base/regmap/regcache.c       | 132 +++++++++++++++++------------------
 drivers/base/regmap/regmap-debugfs.c |  94 ++++++++++---------------
 drivers/base/regmap/regmap.c         |  15 ++--
 3 files changed, 109 insertions(+), 132 deletions(-)
---
base-commit: eba5eda580744bd20104eddb0a7b623026b1c49f
change-id: 20260930-regmap-lock-2nd-f481885c24d6

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

