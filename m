Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199CD3DB629
	for <driver-core@lists.linux.dev>; Wed, 30 Sep 2026 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790761782; cv=fail; b=r+oYhj9klKu+J+0PMBHDJEoFwtIJmy6baXgNAgff/Fy0X5X+fYASUOQ1SDvDiZHF+K/u4cbJv4+Zhhf19kqApOkiIPxJP30IqBAekFFveloZ+rU+3ev4lEcglwv5R6sQUQJD5TkK2OgCShjhVl1c/x+SKhvgYqLteA7To+53q78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790761782; c=relaxed/simple;
	bh=kgmPF5ae7Y2WgdEabZcenpNlZzfCN3S+yTltNBrVLnk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=a549fBF7cRaGZaacSRmsdrNMcQkH7U/7Jt6hREkueKKlXgMM2uXrm+Xh6caeQZwuCcOcqEYlM+Ac34lVjCv1daBUnv5GHj5jMN6LpVmKDWAqOX/PVgd6rGH6eyX1q6EYEgd+vNWspUooQSsUc6HuGBrXK+MEaaUfuCj7sdPUa5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CqSNoCsy; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CqSNoCsy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3NlYVoQMHqphSaiSWlRXnUOETfoMH9hTCPjQqshRSwt/fEmFEgnC/10l6/NOpRHk2iolzbUOsIH4zS4LlPNMnLjbpVqWfSbMnSA9le3NMVjKfs02Lv3nm1bEKDgDgKYmVcoB0ENajulDe6TAzkBekuaaXvvcnfHoqxsZxe3K4WYgD0sc2tML8PV9OYGfyj+BKEaXKGrDn3HuTCgjDViabDJVp49AlfHmSv0M0MdfsCjZGZM5o/NhT/cr1vmTJQvT0glRSHbqaOfBWDUce4H7V+z6VuSan+Erj6IWQ1bwkBgjJFSqtFoziFSPLaWYgNaYnQmi5T97pWLsd9T26lKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6zGEGtnIEipBxp5nqJpL9dmuE+iXPEs4QR10ipgBrQ=;
 b=bwIG5jPnUjDDQ5wa4vJY5KZ8LQIgpeOZ8nbITJV7SBPWGyEyh+zjdGscrMJfEsW7OLfirlrcHdG+0i8JZI6HZTnvuflB3Dg4NMzi0vW/fe2vmexcuSsaOm9IEUWkAB75+YcGcYPxZG71lrWkW0avHJ0wiP5ampWae834KcMAphon92oC+KpXJfEvgNN+80OiemYmMsCLIj9Sp2GmUWyvRw9GHfRiiDxm8+NCcIU7fLrDtr4Ougf1G4QBsnp8RCeLwQzI2XXc1fgpYyfnPYUoV+bW/kfasFGJxGdFQnROSrKppKLz91gxJS5b5zK/aXVTRWeWjvK7nB+gJdQZv0sHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6zGEGtnIEipBxp5nqJpL9dmuE+iXPEs4QR10ipgBrQ=;
 b=CqSNoCsy5WTiFgJAbky/ZoLubmB+NAJ6Ya6sI0pK7oGuB0v0wiUAbLq8pzOUegr3fJrz/7B917MkU/rQvhkQc5iq0EmUXOGpWBOMVk/R3EBYn2kOLYHktc9AtDq94PeHFlHr8AbJ81fKm93P9mG/v0dzrzdCsIqbezwPNBD00b9NXwBhPU+KJExIab7a7FBzZ0KmM6NlJAP68L44qssYYIlg09JrsQlElf9qO8rsEwlhN4ydy/pY6MJ4wncdugpS1uNcpx0m7/63/yQpBzijmH2qoSkDUMwoP4xTOmpyRfNXqO3yz0UkzXbldEe+h03eb9vnQ4o6nnxcV5tbrCF2MQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9198.eurprd04.prod.outlook.com (2603:10a6:150:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Wed, 30 Sep
 2026 09:49:36 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 09:49:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/7] regmap: cleanups for regcache and regmap init paths
Date: Wed, 30 Sep 2026 17:46:54 +0800
Message-Id: <20260930-regmap-lock-2nd-v1-0-33a8a482f9ae@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI7avGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS2MD3aLU9NzEAt2c/ORsXaO8FN00EwtDCwvTZCOTFDMloK6CotS0zAq
 widGxEH5xaVJWanIJyBil2loAVdyGyXMAAAA=
X-Change-ID: 20260930-regmap-lock-2nd-f481885c24d6
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:4:197::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: eabe2eeb-2bf0-407d-219f-08df1ed8235a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|19092799006|10067099003|6133799003|11063799006|5023799004|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	pqH3UOR+3R3a+pYJeK4IB0/5RHW/9PpW+3wOdqLrbFHkcNYM/Onn1HYoFvdbUCH9zPoyL6rG92H2Q+dTcL5NA6xQ9+C5XXTrptumrlz9K73k4ORncDnEkAWbExFrgRReguUxUP0RJJJnksY+OmmvyrjYD6XeAC7MwSYbU5HPwfscKR7NpTL5TKIQGAoUpyrQH5a01O22UkTlEAOwmAOfg7crSH3EAe1Z+eoTAHxtrlIVJOZbdjBdIkxYxybxw/K5ds3lfNkvwcgk4H8T8VwBKPlxw+lIX/bEMgH2678mHnA9K6VDWHG66jZ+FobqilbnhbZZ0s7wqLPS3ujeONrvRBklpooPX7NjG8U0C9jqCWPYrUDzU4u+TJwG4Ck4jjZO+Wm7pI/lxadSoPBc3hjzdBErSspaW4ZMjrSxwilpcOzZo9p/fu13NBblUqVEv7wdlAVbsGRhNmRjid3KSC/fePKEjDK7bXLQBb38zEDsjPJKD4msp3Osh9MQhhAQeZbDAVagqJTAHzMzuqm1lM/nYKN2BqIc8Q+DWGoRkVM3cLCIDWGi3IfWF6Xll5XDLBALL7g4QglaCgwgy59CQp0dlnw3oGMsxzLCc2wO3nDbxXE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(19092799006)(10067099003)(6133799003)(11063799006)(5023799004)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnJYNGpTSWZzTlpENGd3MEU1Vk9rZGhQMHR1T0E5U0htMGR5Z1l3cDhmeE1p?=
 =?utf-8?B?Z2JoL1VlVFFXUVlKRVBtV04vZHdLU2F1eWtkZGR5N1J4NEE2cjNwTzBLbzEr?=
 =?utf-8?B?cFNzamxjTFgyWW1tL2ZtYXBweXp3Ym00d2VGelBLWGNTV0w0Y2UvcG9hWjUx?=
 =?utf-8?B?UjVwWVAwZkdCc2JSYXlGcC95SUVjNHRwdG5ySENGdWdLWkhHYzl3QTV5MUUy?=
 =?utf-8?B?NUhpcEZDNHNoNjByNjZxek1KaDdyV0x1cTBWdFRia1Z1Z0xnaDlEWHQzUytm?=
 =?utf-8?B?TlJvaURJQ2RlY25PbSsrc3NrTHVHOE9vZ2hYeEpnMjZ1OG5pbnhDczM2WUtI?=
 =?utf-8?B?eWFiaGFWTUM4OWpqYW5hblh0RkRRU0dIeUxFV0lOdE40SVlsRjhEYWo4cGR2?=
 =?utf-8?B?c1pLU2huMnVSQjlCaG8rVS9tS244R1FtS0Y4WVdjSnFVeWorMEdNdnlZOHo1?=
 =?utf-8?B?TERid21mZytuZktXdzNFcDZCa3lpMm9qUldyNE52N2dTUitESU9KK0Y2VnRM?=
 =?utf-8?B?Z3Y1QzNEWTlMN3J1WUxIYnZEaWdRMS8rbFc0bGY4ck5kNG9FS3BYS3hkSk1o?=
 =?utf-8?B?UW1xMVR5ZjNhazIxWjQzK3BBT3A5TkEwOGVrRDlVeCs4Y2NXUFhJOHhFUnlR?=
 =?utf-8?B?ZHpJcWRNRGJVemgva1ZYZUpZVldoUnNZdXMyVitXVGs3MWFYNkhpUnVQemlP?=
 =?utf-8?B?TTIwUW5ObS9oZVNtaTk2VzNJNGtWRVFzYzgzWTJJckgraDRZSXhsNS9BMGd2?=
 =?utf-8?B?U1V1ck8wY09ON21jYkJYV1crL01yTEF3UXkvZ0RxcStPVjAyZkNteExmbnVl?=
 =?utf-8?B?SzgvYjhZQXZ0WVRpLzFDMUwrRkNUejYwRitKN1FOQmsrODlGWlVLVTdNM2Mv?=
 =?utf-8?B?MEFMaWs5UjBYWlNEb29qL29mTDA1dGhxWmpIQ3Q1cytzTGpRanpGN1R1aXVs?=
 =?utf-8?B?Yk9wNVg0bXNvcEhPU0wrWGYyK093TXdmRHdzZVJvZnNZdVlmKzZGaS9IUHlP?=
 =?utf-8?B?c1hlM2tibjNFWjJrSElxMmdrdWZaa3dyNGpKd28yeXhwVWptWXduNEF5blFF?=
 =?utf-8?B?ODk5VFk1STh2c0JCNFdrbzAyaWhuWmtlbnZrZmJtR2lQb2R0TE1VdjVZR1RR?=
 =?utf-8?B?bnRzVjJFU1BJUWZ5OU1kUGRjTU4xR21zd3FFK0NmSit3cEhuVHhYKzRZQnJP?=
 =?utf-8?B?Qm1nWmxhMFpLSzhacnBELytzTlU5VkcrRDNtKzViY2pFdlVYaGg1bzdiUWpI?=
 =?utf-8?B?VlNYYjM5Rk5WdE02VXZnSDdXZFJ3MjJrYmZ1OVp4N0ZlWlRMWW43eFltbldm?=
 =?utf-8?B?U2N4Z2p0M2dmTUhSSzBmeDhsNEFsaXk0WG02dWtQUVMvejBIV2VndFVJcG15?=
 =?utf-8?B?WkRzU0N1R21ZdFlDT21lUG5TeEpZd0R3dHM3L2tOWXoyM1FhUitsRWtGVDdR?=
 =?utf-8?B?UDdVamVjdTM5TE8ySnBMWmN3amtacXhKdklmSjM4aGdpdXo4dFlicDB3M3VO?=
 =?utf-8?B?MEZjYjFNL3RvbWVrL1YrUW9KZHNmVksvd29iLzhrL1hXeEVRQ3NiM2dmUGJU?=
 =?utf-8?B?ZFJjRUEzSHRoTGN6c0pheEt4RllEV2luTkdjY1IxRC9MQTVXYys4dzdGVXBr?=
 =?utf-8?B?NjlXeDIybm84RzdaSHkyUEtLU1V0djNSVi9qd003dUFlN0Y1VmNJclk3bE8r?=
 =?utf-8?B?YWZUMCt5a2pKd0p1aHFhV0dVR0xhU0dMQkJmNHcvZDk0b2w3U0ltWlhPTE8r?=
 =?utf-8?B?aHJSUlgvT2JiTUNYdnRSQmtQWHNrb0R1VjhBWEM3YTZrdldTQzJyR2NIM3J2?=
 =?utf-8?B?cFZFQXNkbnBWNUdrVjN6V3J3K1FNUTJCREVQMHNCcmo4Q0FkMVh1Wk5ud3BP?=
 =?utf-8?B?cUJlWHNKc0lPQXpOZmg1cDFHeWFGc04ydTQ4V2J4VDJqNC9ZeXIvNE5sMVFs?=
 =?utf-8?B?YkpCSUQ2SjNYSG8yYURxK2V6M1dzV3V3N1BKTWJEbDhsQWRJaDRrRDRMV2JO?=
 =?utf-8?B?bzY3ZmZGQzV0ejlDbTBtQU5CZW5NWExIYksyV0dkekJvbTlGZmRteHdtclhk?=
 =?utf-8?B?ajFmWURqcTRrVGVraGNobkI0czd3c3dnaEhBYlMvOVJZemNJOGtRdGJRR0dZ?=
 =?utf-8?B?S2hoT1pXY3hLdnBhK3FkYkk1UGw2MXBiclZoaExlc1ZRNm1vSE9IRHYzWEx5?=
 =?utf-8?B?czVYU1FEUWFMQUlYUXplL2IzNmRyemRRZ0ZGMVkzbldUK1VFT0pJcXpSOXlR?=
 =?utf-8?B?MFQ4Q1FxeHdwTGd1enRtdkFWQmsvQlRJUGd5S0tEc0tHR1RDSlMxNk8xMDRL?=
 =?utf-8?B?RW81aHhXa0lwZEYyZVRpdDhZNXZ0SGF4TkhTd3czdXllVHBHSHZ1V2VWaXRx?=
 =?utf-8?Q?mPTkBnFmIXAQhTXJBkR7Yza6WZFuUKc0n7l/b?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabe2eeb-2bf0-407d-219f-08df1ed8235a
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 09:49:36.6410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yb3DpwT1B+4u9YjeumsO+r2g7TSkAJAtSe9YiUd+Z0PexANkuR35qlhfjoMaEW7LU48nz+jdlFM5pxbkgefoDyydDFD4W+27iaZSJhjAFEqnqjnFtE3mAAHY2gV2Vbgj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9198

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

- Convert bus struct copies in regmap-i2c and regmap-spi from
  kmemdup() to devm_kmemdup(), letting devres handle lifetime and
  removing the free_on_exit flag from struct regmap_bus entirely.

- Simplify the early error paths in __regmap_init() by returning
  directly instead of jumping to a label that does nothing but return.

- NULL map->reg_defaults after freeing in regcache_exit() to prevent
  a potential double-free if regmap_reinit_cache() later fails during
  cache re-initialisation.

Tested with the regmap KUnit suite (drivers/base/regmap/regmap-kunit.c)
with lockdep (PROVE_LOCKING, DEBUG_LOCK_ALLOC, DEBUG_ATOMIC_SLEEP) enabled.
Built clean with sparse (C=1).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (7):
      regcache: extract locked helpers to replace open-coded lock/unlock pairs
      regcache: extract __regcache_sync() to deduplicate sync dispatch
      regcache: simplify control flow and reduce nesting
      regmap: use krealloc_array() in regmap_register_patch()
      regmap: use devm_kmemdup() for bus copies and remove free_on_exit
      regmap: return errors directly before map allocation in __regmap_init()
      regmap: fix potential double-free of map->reg_defaults on cache reinit

 drivers/base/regmap/regcache.c   | 132 +++++++++++++++++++--------------------
 drivers/base/regmap/regmap-i2c.c |   3 +-
 drivers/base/regmap/regmap-spi.c |   3 +-
 drivers/base/regmap/regmap.c     |  31 +++------
 include/linux/regmap.h           |   2 -
 5 files changed, 77 insertions(+), 94 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260930-regmap-lock-2nd-f481885c24d6

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

