Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010012.outbound.protection.outlook.com [52.101.84.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5461D17BB21
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 06:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970773; cv=fail; b=KzOT3u6GByfoRZARebO+m8xaOEz5u+fi4gB7y14iefeNE0cP4QakhYxzANFgqBEQZBS3TgRABqrtFZOJ/hrLqlkRSF/dbDuZsSEgku0MnJWNsUmllfeoQcbNsV+T0f+4lZ7dlPmTuwUEUMvoFXL4Z5TqNBsNGmFOfkf2r7MYS6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970773; c=relaxed/simple;
	bh=g6/+zrvlvTL6afUuL9fzMRBEZPOyQX4QTFLCTF5qydE=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=hnMHI/8IwamVuPcE7bs0h8Y88DAz2Cr9ewbPbDA21l10RbXDw7K+DQrA/NHeYFbaxU9I0AVYIbcv0Sd9WV6b5Qhik9O+A9T9K1apVsMyGrgSO/PNpS1X59PbdLfpnVHZC54aqXU2POw7GHvw6maiWLqAUdsW9Lpz8iW6oLOqRwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YQ5lmcov; arc=fail smtp.client-ip=52.101.84.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YQ5lmcov"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGaezkwpedGpsXhfCZ1ueZLgVztBJ90pLlAw8o8qrx3/aMWXFCRU5I7ZrKHeh4e/CdY2L/tqd4Rs2f5/BeyGE4OCWe47CIotc9NRQiP4i/btVRBYjzq07SvMV0F3nk0P2LXLZYgHaH6D0/BjlXeFRxxKwzN7SyHyWOi6GFXjmfpiryPKwgQFA9gzerNuueS1+2iSzhBUAGFBlPH1ZLlJ12ZzswnP5mFOjM4Lwcb2PC8UqflET+igpQnQsbi8nKLX2ZEUO2qxDSHEGdYBsqm2C9KBn6Gt/8D+oSgItSOx/8lXPbxzIYXLKAEvbqPEyPE8GPYBfG5dm7TbFH9d3qt2yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWx7S9cGv7eP3FNR9HgV8xvP6VE/dj7mL2RkJWy/j6g=;
 b=IGGR4/qs74tTpM7FcaSOr7tY5P1l0XB+m1i5xVItbj3MVtZU9wHR3rZZtQ6XThuiKVfPzz4GATMO9o/lL0iElkgXfMjqGvzpt1QZCRBbxEgtZjE1guNzZ/u38PetZ1rtuP98xS80+EhRUb72leCKGcRfzsKWwpnt+cupt1wFyXB3qkjYudFog3+KycaPKqMKOZsJZy/LwQrDWuGyF1cr/7AE8WNZMnn4oPEkmK7bYtt/1QB/RvIK+peSnYIwz68fLjrBeMIb5uDRdRw+DxJstIq8/kIZnPr6uNLMj44sDnSO00AJRPxQnOEAWRHpsJfIrCH5xQk8MOzkeyWKnhaVvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWx7S9cGv7eP3FNR9HgV8xvP6VE/dj7mL2RkJWy/j6g=;
 b=YQ5lmcovlEALQKmp2lK/CdLuNrNPOY9s+UXut373CJzM/39Amguuvmcqm8yw+Cbf70gNLDdYRYJfJ8taAFxTJtNvVs3VXB/RJMcouEb1H/uUlO4NMNfzLsEgtm2mKPLJT7FqW+gdx+jGHB9P1JXyaRX6dEUOnwaLZIZzneauIBYfPmg1HrVNdvRv9WdKByxYdC6nJ3tCY8cbVMgk9kZHhI5wVpaPiowOrfSkfZwWcd5L2UmofUKi8HJ9cDEZoFWf4PdlxVOKLaPrNmnfKeyodTudf1ugB764TDOY4GndxI763yz/zFb6CxiJMuKfMe+aVzSOeqSL9tym/tbZS1fuqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10432.eurprd04.prod.outlook.com (2603:10a6:150:1e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 06:06:08 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 06:06:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH RFC 0/4] regmap: convert map->lock/unlock users to a scoped
 guard
Date: Mon, 21 Sep 2026 14:03:32 +0800
Message-Id: <20260921-regmap-lock-guard-v1-0-cdbd97b46074@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTIsGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyND3aLU9NzEAt2c/ORs3fTSxKIUXUtjy6SkNMuUpNTUVCWgvoKi1LT
 MCrCZ0UpBbs5KsRDB4tKkrNTkEpBpSrW1AHoAyRB6AAAA
X-Change-ID: 20260921-regmap-lock-guard-939bbf9dbeee
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10432:EE_
X-MS-Office365-Filtering-Correlation-Id: 048acee8-cf42-41f0-fe5c-08df17a66de9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	BybukTPuHL1eRzioDpsOFrBQaDG2VWFRzUAzRDMSjb+6826Tc915/kdcmc2dR8M2KrGz1mAjScvMQ8sWHSgjblVzHDpF7lhO3QrrvbGKGRfE71+6YFhaShf/Sfj6XLaao5Av9kFALNyGFt9oMUTlNRq/5gnQDxuZztwrrNdbVfV+HNUfamx4JqYbmbs6A/uk1xSI+9/FU0//RSmio0/DAAMUBzM/g753bL3Grx9mBLWRc+a3uJZE+sdzuh/DnUvjwaD8Tsb87f5eLZ9GsDgm7eNZTo8CngtPC4qF/V0TPPHrmpocklkXM4Y9u6A54+ecbMepkYnIEW8DFSCo8Bpxw3nGoflrKoVBG34Vcd+XrIekaEA9ZWhRdUXRa7qzRpX6GWGxNg7Z/GEmTCKlp61MqsGVa2LUpml75da6Xe6riDJLTBfQXM5Do7lRsDx6ZaXjznanv5VSrdvCIvEi5imyquc/mjIIZBgPunLzsiGbLnVD0KKTQmVg3+g7WTetANg6L1PaeO6m4JR1lOKAiGMQ+2YzKVxv9Gxfg5ojrDQNm1mH6egc5s8aqDSxClrB2Yq1+rL47StLxmt/ECuqk5l4UmulJJbtrwxV5/mvSzP3F+trgl6I5r8H+wRrxD2gcw3P+mVSRvtbBmpkkXNc0R8uSYbDIrv75gJS9oZciYEEQdc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm9KaUY4UEh5ZkNJbk1GQzRVdkVoYksxeW9DaVVteGVtNXhxekZBYnJhUUxH?=
 =?utf-8?B?UmhBclZDVWFzNW5uNUFRRVhaVHN0bk00Y1J2NUtyUkY0RFQ5b2lXd21VeGsx?=
 =?utf-8?B?VkkwL0FRbktpcHFjYjVQVjQ0d1hsTktzK3JMcXQ2S1JHcjZITnZqZG0vaHNa?=
 =?utf-8?B?L1YyU2xVR2krcVdzaXg5WjE2WHhiVG1qVStqaTBKZFVQekczQWhTUnJTY3d4?=
 =?utf-8?B?SS9VWjRPaFlocHltYTZ6L2k2OTN3NUxKSnk2cDJxZ1NQOUJYR3NLT1J4Znda?=
 =?utf-8?B?NnZ2NG1wNWl1QmtTRUJuQlIrSXJ5ZHJiU0k4WG0zVXYyTWtEVitxZ1FPMEhz?=
 =?utf-8?B?RUsvTGpSVUl6c0FkYkV6ZGxtTFduTUpzWEdUdFovR2JhZ3lHaTdNVGgxWkNU?=
 =?utf-8?B?Nzl5N3JZQ05nQUpKRXpadXlDTThOVVhSNmhNb1NlRVlUQkE4cVE3bVFmcVZ6?=
 =?utf-8?B?anJPQ0tnZC9UOGlhTEJrWVQvNjVqcWpHZlN5Vk95bHZIdUJmZjZ5Ris3cVFr?=
 =?utf-8?B?V0p0emFlNTZCZFU2TzU2YXNOUTBjUDkwODNOTUhvTFU3U2RRdVJ6cHg5THgy?=
 =?utf-8?B?akM0VWFXM1ZERHFEQy9BalJYTkRhRnZqZ3ZIajlnclV2d1ZmaUpEaGFqZHBl?=
 =?utf-8?B?andoekJ4eWt1Tk1lR0tVRU9xM0FDc21qZ2hVdWUrVjVmRjZSU2lRUlI0U1pz?=
 =?utf-8?B?dmVZK0FWdmFsVk54M3VBUHA1SDZhRjduY2MyTWI2cTU0SlR2YnY1cWRGMCt5?=
 =?utf-8?B?ajErTTlSWXdIOUw4SG9RckFWYkx1RGdmQmpDWFpyN015NlM1bTN1elk5MzVG?=
 =?utf-8?B?ckZyQk4zNFhhVW5teDN2a1lzbDBWVjl2Yi9Rc1Y3TmcvYXFwUGRaQ2J2V2ps?=
 =?utf-8?B?cVFaZlZqZmdyRUlTcmk3TitDckpNS2M1M216RmxqUmdIYTB2djRiZGRFaFB0?=
 =?utf-8?B?OUhya2E3TFBzcVMyUzJxOE1pUmZJZW1lS0RHZUxqOXFmTTFvZjVYVkZRR0lz?=
 =?utf-8?B?QVBxTDE5UEVZeStBWTFkM0dSdnpIdWJHbGdYcHZLWDNuZWxmSFhyNjhNNTlC?=
 =?utf-8?B?RnNLWUNyU2FmS0VlbXIrRWZLY0p2S3RkVzR3eDVRaDBtR0dmRlJ5ZGJ6N3Aw?=
 =?utf-8?B?Q1R3dmxQd3Q3aUdvNzZtdzA1VE5GV2c2OGkvT0JhSzI0RW1SN29HR0Z5VTgw?=
 =?utf-8?B?N2k4N21JZGNKTzRGd1krdzhyRDFvb2s2VlduZEFmdTdYVzhneHZMcU9GN2Jz?=
 =?utf-8?B?WEpyM1ZtWGVkUEtQM1NSSDRNdXRWdG55ci96a1UweU5UbTRjb0tSc1NzT09D?=
 =?utf-8?B?S1Rwc1hMNllFUi9sSUxYc0FlTVlPb0RwM3h4WCs3aTA4SmhLckdEN3RtdFdW?=
 =?utf-8?B?S2d5d1dLMHVhWm9sQjh3L2hzK0hrVHJ5bUpaVWU2VVBQSkdMSjJFYWJFRlBJ?=
 =?utf-8?B?YTVGN0pHd3FjbzkxRGI4SEl2VEJvbWRHaFlYdE9hbjBLNWpaUFNDc2ZVd0V6?=
 =?utf-8?B?Q0tEUjgvRzk1N0NGN0FrOHgycTBXdUtxREJFaTVvZU1SZk1uNnhWYkpqa0Y5?=
 =?utf-8?B?SkFkNW9BNjBKaE41WnRaaUQzOEdLZWo2Zk85VDRnbCtpVzN1SXduRCs0eWto?=
 =?utf-8?B?QSs4UnpnZTIrQUhVSDVGUTB3eVJtdnY0Y3Rva3N4N3J4cFNOeFVFUmJUdU9N?=
 =?utf-8?B?UGYxNkF1MUpZUTZNLythVVNIaVJIenZIZ0lud3JEUkVRUlArckxuSi9KQ1pp?=
 =?utf-8?B?TGpBRGxyWXB6WVh5MXQwTzVpdnFVZGNja1QvbHd4NStZbXpvTkZLQjVkWk5i?=
 =?utf-8?B?bHlrc0Y2d0lLc2FYcTI5bmZTY1k0eHNHbWZGaTlURXpyc1U1STN1WjlMUHVL?=
 =?utf-8?B?NjROaDVjNmRCQVU2c3Arb2hIWURObHFDMmxWSko1LzE5NlE1R3g5My9WV3pX?=
 =?utf-8?B?RW01MEdoVG9IUzFrVUF5VHdUdE9iRG9uazZOYkp4WEFkOXlVVG02K05QNFZx?=
 =?utf-8?B?YVhhcVZmNkxSMTN2Q2haZGRJcVVUMW4rbG9VelZVdzgwSDR6cy9NNjdoOCt4?=
 =?utf-8?B?Z0RTU2JaTmRESmgyb3BkZHp5VW9kWVlSOUlmNnozTVh4NXJOc08yTnU2WEpN?=
 =?utf-8?B?UkxFMUg1TlRjd2VqWXE5Yzl0UlhyTFIyZW9FN0I4d1ZkQ3dkb2ZsUkppSmV5?=
 =?utf-8?B?YU4rMWFqMVE0S2htZzVUT0JKOXNnaXdzc0pRN2lRTkcrSGRUOUhPc1I3ZldS?=
 =?utf-8?B?ZldpOWw0eWpLWXVvUm1Cb1RyR3VRSTlYVUljY2hxMnpSbzRHWTZXalY4N3ZB?=
 =?utf-8?B?VURjTnl3ZUFHaU90UjhpUXFLQ1ZRY3h5emVEYlZFRkZNZE9WRElnM1dVNGxm?=
 =?utf-8?Q?CNBgu3o8CAOrDRZF+slWJdVn1e6eDFCwzcmsL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048acee8-cf42-41f0-fe5c-08df17a66de9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 06:06:08.7996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Xudu5hu5AJHnlGubhQXjCOCjV8VZJRHdB01EkTIgZk3+WdgpgS6ijlu3H2cweLx68A4WvMSdECtGIFwZN4uyeKyETNMFiCoK9twkBwfu5JesX/xit2w/rOOk4KRpVAm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10432

The regmap lock is taken by calling the lock and unlock callbacks
directly at every call site:

	map->lock(map->lock_arg);
	...
	map->unlock(map->lock_arg);

This open-coded pattern forces every error path to unlock by hand,
which spreads goto out_unlock chains and duplicated unlock statements
throughout regmap.c and regcache.c and makes it easy to leak the lock
on a newly added return path.

Define a scoped guard for the regmap lock (DEFINE_GUARD) in internal.h
and convert all users to it. The lock and unlock callbacks are chosen
at init time (mutex, spinlock, raw spinlock, hwspinlock or none) and
return void, so an unconditional guard is sufficient. Function-scope
critical sections use guard(regmap)(); sites that must run work after
the lock is dropped - for example regmap_register_patch() and the two
regcache sync helpers calling regmap_async_complete(), and the debugfs
cache_only handler calling regcache_sync() (which takes the lock
itself) - use scoped_guard(regmap, ...) so the trailing work stays
outside the guarded region.

No functional change intended.

Tested with the regmap KUnit suite (drivers/base/regmap/regmap-kunit.c)
under ARCH=um: 551/551 tests pass, and 551/551 again with lockdep
(PROVE_LOCKING, DEBUG_LOCK_ALLOC, DEBUG_ATOMIC_SLEEP) enabled with no
splats.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      regmap: convert lock/unlock to a scoped guard
      regcache: use the regmap scoped lock guard
      regcache: rbtree: use the regmap scoped lock guard
      regmap: debugfs: use the regmap scoped lock guard

 drivers/base/regmap/internal.h        |  11 ++
 drivers/base/regmap/regcache-rbtree.c |   4 +-
 drivers/base/regmap/regcache.c        | 193 +++++++++++++++-------------------
 drivers/base/regmap/regmap-debugfs.c  |  24 ++---
 drivers/base/regmap/regmap.c          | 182 +++++++++++---------------------
 5 files changed, 167 insertions(+), 247 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260921-regmap-lock-guard-939bbf9dbeee

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

