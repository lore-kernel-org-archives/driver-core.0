Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011056.outbound.protection.outlook.com [52.101.65.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073323EDE43
	for <driver-core@lists.linux.dev>; Thu, 24 Sep 2026 06:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790231607; cv=fail; b=U77Ypuv1HsfG+eMmJPVUBZN5eZlyCcPls1klmVqF3wBrr3+OGcDlRqhZjwWg1VM7og7nNCl3gG2MZVRfJ/19j2jsbNQWHrVFLuczlBnVTfA0oaSYTpYVIjG0/h3P6NZKrPmSaohy+oYZ216o5qJ61H02TPujqDsxTrA/iCwxH/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790231607; c=relaxed/simple;
	bh=FpQaLPvAOZrbdeo794O7BOc/0yyTweCW0lxPUCPOz0Y=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=a3uxT4az00Vkefe+iQ5BveuCyhICmkMmejVprKf0wAU3mu3F0oibOP2DBXNiwUjS+jgKcRZHyfHi6ES18tjd/jq1zXW6VNr9e/XSDtJ54WkZPesNvYDjYm8ja2iIaEhLbl4omUAN8SVid5AxLbOGrR13mti8c29OUAQp8leWG5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fQNbHtq5; arc=fail smtp.client-ip=52.101.65.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fQNbHtq5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kj9bvsG6sRVSrvgrwYfe0s0PUys1Px2XRT+BnRCLVn27O7skkteNPffko3SJ4hpUkoTU48gJc+UWdniKlfhCe5Ui8rrR8uSOAy9tqBy041F5X1gwaafnq7loR6l/MQ5tr/q/qmorpSX6EJfEzXaJhKVLh748RsYte4/yzwejxOzcfsLeC6BrEObB0wDUE8qr5G1PU8lgtk5e4uE1k1siUTtrarkBosVIa34XXETGPlkvYspc6DwNyQ7LWisemV4YjaXfgA4v2X2FcCMStfLXto96Ct/34UU2e5y7655V7We19FSJi3G8exj0oXqQp9jWOezTQfn8Jnxu2Fv1ZsTRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XyhP4TVFAeP7Twa/w4Otys7Mxxc2gMOuYywQZC3uvQ=;
 b=sbI94qS/heHmoMJYFzgH2SVjngRkxVof5dQjCvp3jUiS1Stt62lxwryX+daUmI5emSoP/NzREskR4Dg/BlGmX2SZeG605htCWizd6NGNfgzaOQKIVVVZblbLxLTqXTNloWaqA27Yze7aLVws7qqtHtfYNzTdyzKnA5pUOHTZkbDH8uahwpGYE106gDssYzJwbHgUiYmkxezYVWIeV7y8W6HkLHg7Fvnkw/z3hJXIkmoZUQvN5ExT4l1Z6eXqO84nO/FTReyCb242B7VVSQ376wjz2NfXLZ24F9bKsf8E6gYVVX4G4iZJREqeNjN8JxH49uVWzJJIIQsBNaldxnfMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XyhP4TVFAeP7Twa/w4Otys7Mxxc2gMOuYywQZC3uvQ=;
 b=fQNbHtq5L5wAHLhZ0NETIK2dj2yYxftNBLOJsAd9GoMSDKHGAdV+K5PrBUEfYVP6yvkQXNcC1FILrVk1InKrPImMS0CCCBaPji8d15GZ/VjZqOgcBSzGvX1v6yh+1MIRMIQWdkw+HXyZGdTzTHqdknKs2ZK2LBQ5GcZNfasne+wDm5VfI34RJff4tlqSHZ6j5HV+mdp4WAZfKwSmgeWWsHVe5w3ErO1cqyVjE1cRXw+Ez67DRD2IW07kyIqyEBd/spbOd+0Js7QnVsRMF3B1VJdGh3TzQX/ScGuRfZ63FI1WM08jRiAgWL1DvYZcNPDbXjHuEbDp3JqTiZASfC44Iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM0PR04MB6801.eurprd04.prod.outlook.com (2603:10a6:208:18d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:33:20 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 06:33:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH RFC v3 0/4] regmap: convert map->lock/unlock users to a
 scoped guard
Date: Thu, 24 Sep 2026 14:30:51 +0800
Message-Id: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJvDtGoC/32NQQ6CMBREr0K6tqZ8GkhdmZh4ALfGBW2/UBVKW
 mgwhLtbcKEL43Im895MxKMz6MkumYjDYLyxbQzZJiGqLtsKqdExE2CQMwEpdVg1ZUcfVt1pNZR
 OU5EJKa9CS0QkkescXs24Os/kdDyQy7v0g7yh6hfbMquN7617rs8hXcd/TkJKGVVaalFInrOC7
 9ux2yrbrPYA3zz84iHyTAnNIedQSP3h53l+AfMmevUHAQAA
X-Change-ID: 20260921-regmap-lock-guard-939bbf9dbeee
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM0PR04MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: 464a4a50-a5dc-44b0-87f4-08df1a05b9c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|23010399003|6133799003|10067099003|18002099003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info:
	YL2hMl9B/y/u9zvnJON9NkvwVrvr1UduQ8SF3QsybaXUixwf+zQdwTiBXOsJEOnH3D77mVSHV5nS4uYKQ/tA1PZW4nTSH2KfiwdDM6cuazbbbkf4bMaSWroEntyHwMp6i3oJRSGB7BODM5ZhPbz+LlRyws4xMs1Q+N7mALxQPvRHfLZU6e/bxTDt73js74sk9E9bXHGE72Unhjl8d2fMKoWQtKVznDUAcXRgiaSJA2CFHFjzYa/9LQUYOADs8gJw372/8Zc3Hd2uOfj+6YEuacjQAxQJVpD4ujV76UYQnV0myLcSsLpeJZ1WJX8RBNOcZ1R8ClZWtFB4kwfN/XuXZzggnJz4O7O7+hTnI7ioC3WF39Hr3O/BNICoOkBEjB5YYNZ1SAPZMO1CDApi39jX1clxTEVSjUeHrQG49ljcHl46sT4gpSPRWvYFOFiuihLo/fiGXXPh6Wv9ExMHecZpnG4M5QWIxXiyXqRtWOoneAnAaBK2Yb5i5LZmfNbOCLoygGECw3ELhsTwpSMmQUIlLjM42c2aqOpHc/LC1T2q9au0UYbeSIYFPz8M1YhReQLDE20nZaiItwPGnRddb1w3GrVef4H7Lbys3qv8c59Os7xnx3zRrlTE1JKTIhUX9fet
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(18002099003)(11063799006)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2FrSjg4cW9HM2JMaS96aEtNcWttR1k0dWQ3QXJ3WkJQNzltbEU5VjlWYmJW?=
 =?utf-8?B?eGc5TXg4d3JzczJWc0QyaWd1NnNocG5jM1ViaFd1bHBWdGZZT0FUL2ZpaEtP?=
 =?utf-8?B?cXRPMVovRUZ0dXE4TjVqalBlWVZMU3pFY2RDYnpRMzFPNVpBRmV5SnlFWFlH?=
 =?utf-8?B?ZzBIRThiNWVYNXd3Z0p3UEVpK3hlNDdRZmUwSEI0aHl5dlZBMEgrZUxRTGI5?=
 =?utf-8?B?V1BTWVBkNTJqb1RYS3dmRTI0dTJmSTFPVDBNV1NoQzR5Ni9JRzVGb0JIcFFw?=
 =?utf-8?B?SE1EL2p1c1BaUmN5WE9jYWxJS291QVI2czNHcHorMlhOdE1FcUF4a0N4Q2xm?=
 =?utf-8?B?b20wOWlPc3JIdy9FaFEzUTZybWt5WmNMSEk5aVB2WWpvaXlOTmMvWGlRVVNu?=
 =?utf-8?B?eWQxRlo0STN2cW5uN2REZ1pSdGJDM21JbjJYWlJoMkRUVVlvM2NmcFhiOVV5?=
 =?utf-8?B?OWlGNDRWNzBTNXg4cHhBVkwwWVFJQnJSSDkrSy8vcjZoenpVUWVMOEVWcnFt?=
 =?utf-8?B?UDVHNjl0NnNUaWlLejBBa25oWTRQWHRxZDRoKzRHdlNKWGdjSXRsMTVibjYv?=
 =?utf-8?B?cUJ5MHluUHlKWk01QklNVGhYQjZXTFhkQWt3ZzRXRlV0UmhMTUtORHJSRkxm?=
 =?utf-8?B?OUVpTytJUjAraVI1aDlHek1sSG8rVWQwbE9kOUJnVHo5YktNQlh3SUZMUHB2?=
 =?utf-8?B?dHA5K2xVL3ZDUVZESHdNblZEYmlUaGI0MlBwUG5TdjVHUkFrM0V3eWk2S1Zh?=
 =?utf-8?B?aVQ5cGI4MVRCd1p4QXd2OFMwbk5ZT3F0TDg0UVhYTDlTa1QzQW1oNXZlZytr?=
 =?utf-8?B?cGNqbmhJNXdDTGpUYURMY0FnTWhEMjBVMDczZnJJaXBQblU2TkloNWdYQnI2?=
 =?utf-8?B?RkRlL2ZwQnNPaWtrUW9CL3pOVW11MTJ3a29LQlJQU0k3Ykx4T241SXNZNVNo?=
 =?utf-8?B?M1VrbFRLK1dmWE5jUGl1MVJMZmZVRnJZbnlkV3pFZjh1VDg4N2luMTZUd1Zn?=
 =?utf-8?B?SDBmRlNObHVQMnk5L2JTWStjb056aGtoMnlKTmRRRFZ6emFsK2E0aURZYnNw?=
 =?utf-8?B?K29ZRzFUbmxFamlkVkU4ZHV0TkZONHpYTHROeit1bU9BM1NUWm1MRGExbXV3?=
 =?utf-8?B?MGtvZnVRYWpMOEZCQmpRMmM5NXVRZGJES3VKZk8raStwVm5vMWFxTThpV2Ry?=
 =?utf-8?B?a1IyVTd1dEJBRTNnd3pXckdaS3h2RCtrMy9IbndSN2tNUklMZlZLSmRVN2RR?=
 =?utf-8?B?QTVPZzk3UXVPdGVxQWRxNTZhcGZ2dExhUWhqM1FyZ3poQTFKT2hnLzVZeUho?=
 =?utf-8?B?eFZkQURiaTJQZEJEMEphYnd1NXlKWnEvMWxGL09VRy9zM3VlRVBEalA0U2Rn?=
 =?utf-8?B?SjdnZURWK3NDT3l6TTRkamRYRGN0dFpqSGtKWU83bXdmQVd3aDUxTkRkUng1?=
 =?utf-8?B?aDBBdi9zWW9ISmdYVHgxaU9RZC9La1ZzUHl6U1c1TTIzWktMSFFpeWdVSTR1?=
 =?utf-8?B?MkZUcHFDL0ZDTmFFOUlZMzR0UkJaN0tEUktjUVhwZTRGd1Nyb0RMVWtSVW9U?=
 =?utf-8?B?b2UxS3N0ZUs4UENNVHlMWi91dkdoeElFN1BuUm1kOHYwZzUyRnZ1d3kvaUlp?=
 =?utf-8?B?ZHBXQ3NkSDdXQnUwVEZZNUtSNXl3WlhrZWJqc1RlWFBOZm4zRnROaE90YU1E?=
 =?utf-8?B?bFFqbmhWK1ArWUtUYzB3NnFCd2hOVk11Z3NjNzROWm00VFpReS8wLzFuL0tt?=
 =?utf-8?B?Qk9VSXArNERKV3dMOElVc0FweDhzbjJjQ05RcDhwR1RVYU11azZNT2NYU1lM?=
 =?utf-8?B?UkV5TDZRd1N4Tmk3YUZhMzNmNjhZSXQ5NHY0REx1UnY4TFUzaEpuTnNabjJO?=
 =?utf-8?B?UDBYcitqeUVWT2tjeDU0RVkvRjVlcHJFS1ZidjVab3pyZWtFOVkwZ1ZQcnFE?=
 =?utf-8?B?ZGtFc0tmWFVXK2U4dVVaVm1Nekc0eVRGVjNnOSt4VXFBYVFBRS96Zkg0Z3BN?=
 =?utf-8?B?ZlZNeU1jY2FjL3c3V2JFdXVIV0ZURVgwZHZwRmJQR2lLM3Q2UWcwZnN4Rmhh?=
 =?utf-8?B?dHNsblVOVjM1Zm9UNWdvTmpoYVpLZkhwVzZLY1FvMEJOTDFMaXo4a09CcWJN?=
 =?utf-8?B?V1pacEJWa1ZRT1FXckp6VlJmeUV2aFJoMkF6RkxCM3d0aWM0Q2dtU1U5c1NP?=
 =?utf-8?B?WTB2MXVXQ0ZWVXVNTnkrd1ltNlErY2QvQnpsZkF4WWNIYTJ3Y1RjcERMem5h?=
 =?utf-8?B?Q1crQnkzU3FBVlJzSHYwTmdxYjN5ZTYzUVovSmkwWWtBZVRSTjFkcE1jaFJX?=
 =?utf-8?B?UUxKdDNvdnV4SkJtNU5pRDFsN3VqSVZxS1l5dUpNQ1dHbFAzQW5NRHJqMmEz?=
 =?utf-8?Q?MnrRR21LAdJVJa2/Ifk7VsEciI2y9uki4AmP9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 464a4a50-a5dc-44b0-87f4-08df1a05b9c7
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:33:20.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxrPWtV4+MHGAismsMOplASsqHsEQLgWBcN2DokYUWZRUxF70FlugfKFvYQsyy7pm5tRtyzTdvoPRE6w+fg0u8ljxmy3WCR3IL47v2tjTTDss+EVEYO/8B7R0dirFeW4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6801

The regmap lock is taken by calling the lock and unlock callbacks
directly at every call site:

	map->lock(map->lock_arg);
	...
	map->unlock(map->lock_arg);

The open-coded pattern forces every error path to unlock by hand,
which spreads goto out_unlock chains and duplicated unlock statements
throughout regmap.c and regcache.c and makes it easy to leak the lock
on a newly added return path.

Define a scoped guard for the regmap lock (DEFINE_GUARD) in internal.h
and convert the users to it. The lock and unlock callbacks are chosen
at init time (mutex, spinlock, raw spinlock, hwspinlock or none) and
return void, so an unconditional guard is sufficient. Function-scope
critical sections use guard(regmap)(); sites that must run work after
the lock is dropped - for example regmap_register_patch() calling
regmap_async_complete() and the debugfs cache_only handler calling
regcache_sync() (which takes the lock itself) - use
scoped_guard(regmap, ...) so the trailing work stays outside the
guarded region.

regcache_sync() and regcache_sync_region() are deliberately left
unconverted: they already use a single goto out unlock path, so a
guard would save nothing while forcing either a goto inside a
scoped_guard scope or a control-flow rewrite, neither of which is an
improvement.

This patchset removes many manual unlock statements together with the
associated goto out_unlock labels.

The series is split to keep the regcache: and regmap: changes on their
own commits and to preserve independent revertibility:

  1. define the guard and convert regmap.c
  2. convert regcache.c (except the sync helpers, see above)
  3. convert the regcache rbtree debugfs dump
  4. convert the regmap debugfs write handlers

No functional change.

Tested with the regmap KUnit suite (drivers/base/regmap/regmap-kunit.c)
under ARCH=um: 551/551 tests pass, and 551/551 again with lockdep
(PROVE_LOCKING, DEBUG_LOCK_ALLOC, DEBUG_ATOMIC_SLEEP) enabled with no
splats. Built clean with sparse (C=1) showing no lock-context
imbalance warnings.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Drop the conversions regcache_init to avoid mix goto and scoped_guard
  in one function.
- Link to v2: https://patch.msgid.link/20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com

Changes in v2:
- Drop the regcache_sync() and regcache_sync_region() conversions.
  They used a goto out unlock path that a scoped_guard cannot express
  cleanly; leaving them as map->lock()/unlock() avoids mixing goto with
  a guard scope (per Mark's review). No other functional change.
- Link to v1: https://lore.kernel.org/r/20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com

---
Peng Fan (4):
      regmap: convert lock/unlock to a scoped guard
      regcache: use the regmap scoped lock guard
      regcache: rbtree: use the regmap scoped lock guard
      regmap: debugfs: use the regmap scoped lock guard

 drivers/base/regmap/internal.h        |  11 ++
 drivers/base/regmap/regcache-rbtree.c |   4 +-
 drivers/base/regmap/regcache.c        |  28 ++----
 drivers/base/regmap/regmap-debugfs.c  |  24 ++---
 drivers/base/regmap/regmap.c          | 182 +++++++++++-----------------------
 5 files changed, 89 insertions(+), 160 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260921-regmap-lock-guard-939bbf9dbeee

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

