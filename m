Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D501E539775
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 11:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075609; cv=fail; b=WWgoP/bDbbHaiVpmMdQcKulm58Z3pRw8lU2EqCCLL9HANuWp5MZ9iQHIrchHeMxzM8TDza1p8zOLxbigljfSKejKPXmhjjTbU1EaQoQBVDQLyRqTF3N113EDlx5uaBUzAjqbZvr9P2ast2kSrkUJx4TuPuPxRsqKGs7Ij4DLWrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075609; c=relaxed/simple;
	bh=8Jl2KERq+RMoctyv8kmQaKOzUFRZPUuLPTwvnru69JU=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Z2Nr5bq8fHtCvQ+WBs0JEY1fvOYqj6vYUjZjEEe83MzpLAxlFXTknSAjw3Bh4NSIBSCE5dibvGk7WlS4Ffnd8jnBs2LVOm2ajGu4nAlzhFeTPJtKdtbiCSQcaPNFRO/iyWMJbob1xWuvmxp0Q8AypUizl7bG7f1KVE3MqCigMKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=C0S4qO0X; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="C0S4qO0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUlm9brVstV1aWMQUJz021lsF4s1nmBR0Xni1du6rvgcept9aX8jsA3WqXm6DyYEcW8j120ZBUoefi0eOgTu30Lirh5oQWKnnykLerqFQyKjmHi4BwLbXlIf08GXOjI0IpYDxW5J10wwUA3wJZBCuvH4ZIWPWticCfBf8PMBoznlhPFVmKfsf6n4KO6kEOXpqJ1lI98DAshuODNGbUWSxZI2+F52pjwU6/ut+htGk8GBCYhXhb5KUhBht5x9JZHULa5Yz4OVuqGNzMpgVzcQJ8GoQqqjUFUjm7GAx9i4hGJSiwuaWVAjUs1+oOoGKhcYxwdGpIvfLd0fpqVZcsbyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfhucDTmPHghANMs8RgqbMDkxmzmLOb8q8YtICdrCHI=;
 b=ct6QXMOnfTYUl7xOt1oZF9gWAv3jp2hhWQs32tpd4ItM0huKa1rMBoHs0+M8rwvslBuY/vjSlpkMA48MOKQ5PgU03Rqota4ztGwJ5E0IPasBTpFZTCY039f2PwU026sSnus8wPTYbywFWfa/e8NgNzPZYs5VfB4rnZ3uxXUS3ULrbkS3aoIMHTuB5DisBNz7MZfPgO26MfebV/roJUbAteSmxTpoi67waILx+4bQp7HZ95IDlKJkpjLUrsHbuvYMqGCjZQCVKgP8gZX0ckErkkfi5oV88yaG9otCQG9idA/IkDVXQ5L47+4GqGBZLfCrZnmyNU1ND/yzfqzfk+lR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfhucDTmPHghANMs8RgqbMDkxmzmLOb8q8YtICdrCHI=;
 b=C0S4qO0XNR51Tp5ducSSQklZayBeNZxF0++pEGGa1zDQXMkQqgaejv6YBsUMPIazKnBe3SSWuE+26hDrAuo21H+HKLFu6gX2X03hkJZwUgeRmUhjNHoi7j07VK6Lmi4tfCfOnCkwxb+sCtiwyhfZIZQPyJdVxXD0K73hdnnq8m/Y9fLv1e1f1SkUubXqY5TCsEN3aXcHTQVLv2bydsIaNCCc72GceZF8yZzH/nOPnQqvSfHx36FnkNHatW3dFkzoYZTjMqS/d6W+3Vho6AEjQtROoQSlJKtPXRzYMF88uqmtd9bpGCmLrsXfwPcNcVactTX28i7wIHBhfTtNsmttEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11191.eurprd04.prod.outlook.com (2603:10a6:150:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 11:13:23 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 11:13:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH RFC v2 0/4] regmap: convert map->lock/unlock users to a
 scoped guard
Date: Tue, 22 Sep 2026 19:10:54 +0800
Message-Id: <20260922-regmap-lock-guard-v2-0-0c9d426427bd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5ismoC/32Nyw6CMBREf4XctdeUSiB1ZWLiB7g1LPq4QFUoa
 YFgCP9uwb3LmZw5s0AgbynAOVnA02SDdV0M/JCAbmRXE1oTM3DGcyZ4ip7qVvb4dvqF9Si9QXE
 SSlXCKCKCuOs9VXbenQ+4365Q/sowqifpYbNtWGPD4Pxnf57SHf5zMqXIUBtlRKGynBXZpZv7o
 3YtlOu6fgHpZDdcxwAAAA==
X-Change-ID: 20260921-regmap-lock-guard-939bbf9dbeee
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2P153CA0008.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::19) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11191:EE_
X-MS-Office365-Filtering-Correlation-Id: 1121d227-1bdc-4520-14d6-08df189a8427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|6133799003|5023799004|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Hhu14nlpoBNTpvUKb/1cUoheLRsfi4N/R3b5gp/7KAT0q9/LmehXt50SSjbRTUFnXFqEnJpJByVuJ+iUBIGumFrrgfAyIjrnBLPDcExLZWMUpQz+xRsCtnNqyzWfNZFLJnhV3gracECWnksyjnmjyAc2P8O+0WDO/YRBi+opvqcq9+mdfJAKeFo9A1S5HY/+mVlTthTLUyj7QYToR/CUzeVsZxKQ9J8A7sTEBHI+EYcFgqpX1kKH56RUoUDeEM8F73y/iCzzMQfvCKlRnvD2od7i1eg9ulZOJipzIjAHfaon/IhSMEaL20pNLYyrhEiVgWfZbw0Eldo8OpA8+MsKiG98QdBI1SerwfQ1h2hwfUHVmxnaSVYsRKRWxR0A+rY4jiSQIzmhmjyo/MiwVuUCAB9+3Y65xo7HBGx4DZXbINEscOEPvb7D4as2O1rHmBy9Nftuw/ZHSzfC2dIKTkIA+cJZoOX8M/mBfDg+0+TG6lqNoWwlR+J7p1NkGLUMXp8TvC3LN6Fe+j6qkmpv1vckSyrnmou4SOFtCJpgTZoBfsaDdSwc35UzU2VaAHgG1km8yIxi+79ai+6k3da5FICy/BNdNb56LeFZihptGwPuPfY1VAp4ps+LZKNVhPw7o9SJy5JAKb0AGI62rCb/weqVO/Uzy2WjYP+vJ8sNFvGj984=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(5023799004)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVNiSE1ESEYrb2FqQk5tUXI4VmVaUnphZzFEUHlqdUlDZVhJMDRlampTaHhH?=
 =?utf-8?B?WnpZVzA2QTN6UXpuTWZhTHZsMDVUVXk4eU13RlRENGFaWVlqMkdER051MERM?=
 =?utf-8?B?dDQwdCt1ejRJUnRjcUdxTCt3SDBCUVhJNFNsY2l6R0xBcFVzNUZrdDFSYUk1?=
 =?utf-8?B?RXd3bUd2dnIyaU5vMElQQ2FqZzE1MXV0Z2MyZkJycUhZVHJqcDZmbXJJWkg1?=
 =?utf-8?B?MmxLUVVaUDZNODh3L1lkcys3R1RlUUFPcDdzRkpBOW8xQkpYUVBVN0ttcUpN?=
 =?utf-8?B?eW9PYVYyRWxvTU9YQ2ZnQkJLcjQ3bFNtUUxnZXU1MUYrWHdNMSsrYTF4ZDhB?=
 =?utf-8?B?Z3ZPbmZ3RWMxL2E2WUpMaFB5N1F6UG9Rd09XOTQwY2tQZmZHZnZCWVMzSURl?=
 =?utf-8?B?MFRnZk04VGRHaW1kS1d4S1V2a215U3N4RmJCMjdQeTIwNTc0enBRREJsOWxF?=
 =?utf-8?B?ZklGaklONERWODVvOEpzWll4Q2lSWnVaTm5EUXVLbTU0YXROclQrTFpnNE1Q?=
 =?utf-8?B?dUx2dUF1RjEycXZmcFhScW9CelVvR1p3WXgyMGJWV0hlbFIrdGhiU3NMQ0dH?=
 =?utf-8?B?SzFiMllUMXNUVVU0QXhpOXRiRU4zSmkyYjNtSXdPYWYwZk9MdDJkMjVOWS9h?=
 =?utf-8?B?UnpKTmNzSWZDelgxU25ZL1dMVG9taVBGVWRwOW9OQitOZkpac3ZDOGZ0VW90?=
 =?utf-8?B?cVZsQXNIU29RbVBqTVhCcStmaDF6YUJFT1ozWGhYdU9CeUJ5UXJTMmdkK2tW?=
 =?utf-8?B?WStJNGp5WHBTcnB1SEt0R2dCSGJ5enZOZ2FrMW9aSnBFaU1udGxrNUM4NEx6?=
 =?utf-8?B?ckhiMDA5VDBYTjVIYTErUHlUU2JCazV2bGRFd1J0dVJxODh0ZTBpWC96a1Iv?=
 =?utf-8?B?aTJlcC93MjlMUGpzU05SR3VreXFrbHhjSHY2VDNlanFVb1pvbmpCVVVOM1hG?=
 =?utf-8?B?VVQvaWlNb0cyZDJIZW5lTTNaNWtaeWNzaUV2NzkvQVlOU0E3RFlHMy8rZWlL?=
 =?utf-8?B?Z3VDYU9YNGhranhqcWRmUkNOUGtmT0crUmR0VFl6RTI5Y2ZseG82VHZkN0dm?=
 =?utf-8?B?amo5dGhiUHREUG1aSml3ZzNjU2lKc0ZTZDl4VTJtZEM3VElMdVNvVEZ3cE9X?=
 =?utf-8?B?ZW1US20xS1NLUjExNDY5S0RFcUtjZ0RjeW0wanRYMHN3Zys4ZEw4b3dmYkwz?=
 =?utf-8?B?ZHJURk16a1V1d2pQc2N4NTZLaE8wTHNnY3JqUEE1R3JFbFY3a3g2TWEwQkZJ?=
 =?utf-8?B?TENxVWpKaEFpaE4zdmRQWEJJR1daQXdpS2FjdzEzNDczK0x3YjRKVUhjQmFH?=
 =?utf-8?B?TmNmN2JBU1RZMmE4OThINmlOVXRIZEhmYnd2VTZlOGphRHNseWhUZnpJSXBz?=
 =?utf-8?B?K2ZnUDBTZHROeGgxZWdKWkRwNFB6cmtQSTRTaXd3VlVmNkdrL3BlNVhzNit6?=
 =?utf-8?B?aTNVR3N3dGx1ZVJYZnhXY3JjSmJ4cVdRSWJuNnB2TEtpaEhwRmx3WkNGOGQ4?=
 =?utf-8?B?ZlN4SmNTazlOelRTeXQwS0tnQXpJSHUyS21QKzR1THRtWmdMQjk1RjZFWSs2?=
 =?utf-8?B?YlJoYUFOTkpick1hYjNUUWRIQ2pXUEorNHdUZjdhY0JyWEJtQWpiQUtNd0cz?=
 =?utf-8?B?eGc2WktxeXMzU09nbDNabFJZeCsvelQ2MitMMWR4TmIvbG5mSkF4dzg2MHda?=
 =?utf-8?B?MW16MEVpaHZ3bEVuRWJ5dERBa3pMdG8vVnZoQTNuN2tGQ1lscjZJcS9KMTJS?=
 =?utf-8?B?VG1oNnRiRlBnbzRDTW9jd1RhZ3NHVzVYdyttRXBlL2MwdVZmVnNUSzR2dGJQ?=
 =?utf-8?B?R3R2cTlUM1pOaXlEeWY2c1VlVzRNdWJoaXFpMTNTalM3bm9JVXNaVHBmSlBY?=
 =?utf-8?B?OUo5ay91c0VBZHNMMTc4TndNTFZscGtVSTFKdjlrYUdac0pNZTRRTXdRaW9U?=
 =?utf-8?B?cEM3VWdmZmFqUjBwUFh1Z1MvWFdSRlNBYU56OVI4aitVbWZucTlnU0FWVk9U?=
 =?utf-8?B?L00yOHdvZHF4d0hTaE4wMjFEVXZJODljdUd1Y2tncHNBY0Yzek9oam94cUlk?=
 =?utf-8?B?dlRMa1dFclBjZEUvb1hqWFYzZ2VVcDI5K3J4ZjVxcmJCOFQyaVZ1NmFCZncx?=
 =?utf-8?B?ZU5rZHQwWUZmcjRoaHpoeXFwRGNOdWRVMFBBRlQvRGVYWnNFNXVmSmI2aWZV?=
 =?utf-8?B?RmkvWWRkZVR5eHJ4WklQSzJHbHhRYUl0eHlwVHJWZTZ1SHh2QjYxS0ZFUE5Z?=
 =?utf-8?B?VFc3OHpBam5WUFdpcGdXSHh6SkJYWURkaUFOakVrUlVLZXltL3ZXVWFYSEh5?=
 =?utf-8?B?T3Fjc3FDVE1SV0d6VkY1TUlCNkF2WS9jZlRpa1FIN0hEbTZLNk9rdkNWNU1I?=
 =?utf-8?Q?Tj+SfiBj0V+hfOlWyCLDg77cxQfJgrIXr5Mal?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1121d227-1bdc-4520-14d6-08df189a8427
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:13:23.5639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsthFgOX0BEBfN82yNOGvy5ScCrqF1T5hYOsHj788XUQ1JoXZ1i7CJ6DFyww4LEsbzhpvkRgbYYHASxjHjjikCJlZ0diwhPb4CenSaIIBITAk38oqW8RZiII6aMMt4qK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11191

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
 drivers/base/regmap/regcache.c        |  43 +++-----
 drivers/base/regmap/regmap-debugfs.c  |  24 ++---
 drivers/base/regmap/regmap.c          | 182 +++++++++++-----------------------
 5 files changed, 95 insertions(+), 169 deletions(-)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260921-regmap-lock-guard-939bbf9dbeee

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

