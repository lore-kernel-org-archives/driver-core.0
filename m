Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010049.outbound.protection.outlook.com [52.101.84.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81A5493D3D
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 13:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946844; cv=fail; b=RpxZmxztLd6Yc+yfSdy0gWoOU6Shup+F1iB4bgDHTWWa8nnzAxQl1lW9bkX6pfTlRg12OXpjtOHn/TUjTmXjniP8HAtwgukZMMAW9JGk9b/nCdXLqD2KFffZTP75LeoM7+oTENtXLTBQGed1gGyetsekopGTwMLJr4YdTfiX0Bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946844; c=relaxed/simple;
	bh=GHD3RjIWgB7lKcWnZ1SNG8EhjsxqgPT8Nck77QS1HtA=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=iPeJNzBGAVocIQx6GZ9YrnjYWspe1jL5xE4Yn6unUYC9Mg0RSh1EE5mJgAAcYX3R3J1uPHlaxoXsK5Yz3zPBSOTVhm9kNVVVCDbcaxox8SqDnxpPUTBwLPv9zySR3SvTfB7Ihfn40cDHv4gip0SM1telYpmvs6V8ysu0eneoqJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pOsltobp; arc=fail smtp.client-ip=52.101.84.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pOsltobp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jOOw3IcuKxEADrhXhtByEtC7l+R5E2PbojDM5csY4urVq/iqUZ/+clzEKcEl9h2/JPYL7lu1UjWszQFgcgx646NuROGtO7rvwXlXmEuYNQ8D2dioIrwwd5iy7CrLYyM9ywWZ9Am8NlLMcTs0Y6YuFqmx630AhmJ3ekrMBjT+POE7cQQvvBOMen+WGtYMOpZ3ka5ECJU0ZLmkUGeHFc3pZ+nY03OdH+JER49H7G/RrenhVe9oBLgZGb9x6rylao4PnmrgBZcsixNvpVE0x2AdEd6mwwzRhYmsDjQis/60EOi+JFXVtj3tbegDiWOSH0odcFB5ukrNANANyLzUa5pAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTky5wXYyye4BSJQ3Ivu5IBfI1SVnewKH1LHGuL6K9c=;
 b=wLHpl6R/Bugv8tL/rgsns8fgPn3VKugtqcGMa2lK6oKqEfYpL7HKHUd4X/ZqzQ4EHhPvWUsThmHiUw0Ch4Wsri+rFqtGyL0c4kYIBffPi6vwiz5TYFxL1VZACGMMIQ75tyCWpLN8LkRvXx/1egS8DeS83iSprh6fGIB+xOBbKQ0n4ZAS/DIcXKQCh28Isk5pqyNRnFMK/mfDBijhs2Ja1kWk2ByP0MMwxnxriGf26lSx6VRYSULV4vog00FcwQhap7uPHNKxXpLLESCa34qUSCrAKFYud25yksK976CYvxn29PE6rw1KteDRyc+gn7GoIBCGHiPV70k0TcUVsrO/tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTky5wXYyye4BSJQ3Ivu5IBfI1SVnewKH1LHGuL6K9c=;
 b=pOsltobpji0S5KZdliEf4/1AGyBCCaoPLIaJNeagUPnpU2sU7pt8kBftp1pPS+OXqbCXgdJw1AeDw0nmuIU7Gb4wbxq32dY/0yYwU2jr1h6kOk27r07XCnDelBlYQGxoKupzFKP5UB3AADJ1pWc+uRKmWvaxtEesc7SXXSwZvV89K8cUTYqrYpEvPsGX5G+g2s67DEgiBHozvdShxIOHtGiDrmj2UVGfz+F/zXXDaoHkqxGgLM7qM5osYC/XPk7QuDoOgeVLF52i27Ebg8mdn938n4DqGFGAVHlTjMCw8+WsnmxnkjoB5XJatIsgcPAt0mKXfV4bjpC4RJcxSETvBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA1PR04MB10207.eurprd04.prod.outlook.com (2603:10a6:102:463::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:13:58 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Fri, 2 Oct 2026
 13:13:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/7] regmap: cleanups for regcache and regmap init paths
Date: Fri, 02 Oct 2026 21:11:16 +0800
Message-Id: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHStv2oC/3WNwQ6CMBAFf4Xs2TWlICme+A/DobYLVKUlLTYY0
 n8X8OxxknnzVgjkDQW4Zit4iiYYZzfgpwzUIG1PaPTGwBmvWF0w9NSPcsKXU0/kVmNXilyIi+K
 lrmBbTZ46sxzFW/vj8L4/SM17ZjcGE2bnP8dlzHfvfz3myLAopJCl4F0tqbHLdFZuhDal9AUdG
 p0wvgAAAA==
X-Change-ID: 20260930-regmap-lock-2nd-f481885c24d6
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA1PR04MB10207:EE_
X-MS-Office365-Filtering-Correlation-Id: 3120647b-070d-4e6c-a9b1-08df208704e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|23010399003|18002099003|6133799003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1089P6XbMflezoJug/uxPW/v9W+7CxtIyXPQwbJgsp8oTfxjWZaCWZwUbfA9YXtYx3jGuLKVAvKGEIcFdW8sqw0VZZeaBNVHzHEBkmBHkheGIe941692DJoASqbfD8n3CgYcLid+29AwcPGNQvrfAxrZ98toIPjsgj1o1shEG14rHabjmJkCJOVd3lIJ0+xoYgDyOchbpmTs1xPR78uPnfn8zcj92pGHBmuo5QO3ctAwkSSV7BJ9eevpD9glXD8hJ6z6uocKylylrEqB3W9VvFiNfumfePLt+kxPOjXpcQkOwIMknRPGLkaN2geV7WrADMtEm5LSoEeiuKj90o3lnQR2Sv/Y8O2/NS9BsB3/ZkWbF2bHzUhVXE66Z5dfdSMRv5ILhpVgm1dm43beEMTNU7KrCh1wk7LupJjRZ+QqrZFKlQE/TxfjNvv4+4SYQrVXsmoPRG3bWOVb4NanpywwK0Tu2PXWU+Z+KtDLnG4JE3uRi3B1G6Ka7mjng5kMw8vB8Xh0kwNxzQbl2VHaxUiFFxNU3TiDc0udpTwPRny6M10YSvG2aVUGiW5hUBP5oclzZh3bAMAnRVR067aSKa3Ttrqv3yOucUpe+HgLv7j7T1+w2qnn1GqxFC9EZe/Vk5S1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(23010399003)(18002099003)(6133799003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?endSa1FiMUV3LzhFeDBhWkpDcXk3UG9vWXRTazQ2b0UrbGl4cjdtQmtJOS9i?=
 =?utf-8?B?OU1IUkJZWENVL0R0M3RmME14cHhEdG1LdzR1YmdFeXVra3FiQ0lmRXIrSlpU?=
 =?utf-8?B?WU9aa29pRXROL0h6SW55SzNXTzhWZGtZZmI2dUdjbkpHL1Q1czhKWThaT3Yz?=
 =?utf-8?B?Q1hIaVBSdGZ2cW0rbnYrSTVqYWk1YVYwNnpsL1YzVWxjUnhrNXlCalhFR2dT?=
 =?utf-8?B?TFo4MFdtOU5tNTRnV2JpUzcybnFGcUREY3ZwN2RjOEdlWlhyN3ZDcEFiRTN5?=
 =?utf-8?B?WldyNk1aZlR4L0pabFpTWHVvSThZdkFpNUhmbkxzN3RKYmxBL2tURkdDM2pj?=
 =?utf-8?B?andqSHRSdjQxeUNEY3VyUGRwRDBJMGFSd1FPODNtRUgxZUNuSG8zcVVnbEpT?=
 =?utf-8?B?L3FKcHFOYy8yVE5pcUJ0NnhnWmNEbVBzVDdLVW9EMjB0NE93R0FpMjhVU2Jv?=
 =?utf-8?B?YnpoQ3ptU1A2RFZpbERoRUIvMTBGb2dsTjFRaDNieHQxM3p6VzNPWUdSUDB0?=
 =?utf-8?B?Z2h6Z1JYTnRjTWVhbzdsNitsSTZ1SkhwVzF2aUVEQ2MrazNvSnNwQW5nSzNh?=
 =?utf-8?B?UElmdmZwSEUyZEhBTVI0c3NRanFtNWFVQzNxS0xzcXRRNk9Nb2NNVENEODYx?=
 =?utf-8?B?WFVsMjMyQWI0eklTdW5WZXVZNFlMREpTZURrQUJCSDBFNlA5cnd2QWNMZnZX?=
 =?utf-8?B?dXlkUDZXSFpNazRkeC9lT3R1NzF4YmM3NnJGaDh1ZWh2NFRsZm55L3VPcWU1?=
 =?utf-8?B?ZFViRWlRVGFKZkVsREJpRitmV2hIZzRqYkFZc1BSYThUbDRxZS9UOFBTMVlI?=
 =?utf-8?B?NzlnajVtZGM0S0U5TVNVRC9yUEtSTUVDSEp0eURPUTRWSGNXY0U3Q2k5R1Bn?=
 =?utf-8?B?T0NhOUR6UjN6amE2bUZFcFVQVzZONm1qNVJ2aFQ4anpOelY0MlRqdnk5ZUZP?=
 =?utf-8?B?dHAzclEyMzM2ZTNVTUhmckZZcmhrK2lQaGNEdGROaUdvbU1KaGRLalozVFBC?=
 =?utf-8?B?Y2RmSm9ZckxaemdVQ2dQRkRvNGVlSGZUaFdGcWwvQ0l3VEZrNzFTeC9aOGN2?=
 =?utf-8?B?QjdpeWo1cjRVQWVucFNra3VzOGppVXRVdkoxcGs4ZDV5bTdpYWVETkRnVmVj?=
 =?utf-8?B?ZEVtMnFZa29jeVJVdHhIeG9ub0RvVTZBM2FlRDlhYmQ5bTNFTk1FUWNVR0VC?=
 =?utf-8?B?M3ZNbGVSNkd0ZFcxQm5sdnkzMmFtdEMwV29ERHZoR0JjUXNYMFdJbHlMSGw1?=
 =?utf-8?B?N2hUazBxUGtwb0o1YkxhNDF2My9WeDBkTG5ENDQ3YWMxbTJjczVXenlyTXlo?=
 =?utf-8?B?K2JFSUV3MXl4aUx2SlRBN1EvZ09VOWtsdkN2VzJEMmtQZnNkUlorZUxmRTVx?=
 =?utf-8?B?ckZNWkZSd0lIaUU0T3Rlamp3cE9YeW9UMys3azI0aGpodkpLWTdnM1dnK01W?=
 =?utf-8?B?RjJVRGdFVmN3YS94VDh6aEF0N3h1TVk3bTFaQ1grbHR3Q01OUWJaSDYzVWti?=
 =?utf-8?B?Qys2ZnVRbGM5TXFoZ08veGlucTZ5MWhjRmlDUUhkdGVyMkM0RzIzVVViTGZw?=
 =?utf-8?B?emlnd0ZtWE1QaEpDSGVhakRobEtmdEJ0Vks1bEFPNzAweWNCUWExZlVKbzRK?=
 =?utf-8?B?RU9SR0dKUVFKcktRME82YnE3L3cvR1NKRW00WFdDOXNQNjVoYlAwMUV6OExJ?=
 =?utf-8?B?ZmtLTXBQVmUwRlJTcXZVZVZjSEpCSzV2REwvMWlMVE1DblduZ25LenlZSTN4?=
 =?utf-8?B?NGtialRzYTVXV0ZNcGROMjZFc1dmUU9rV3dNS3lGNTVMZGpmSzJLRWhYeElX?=
 =?utf-8?B?RDYrZEtWMUNoS3V0MXFEZW94YzdacDIxdG1JZGt3SkRKNGg1RkcyeFd5aXdH?=
 =?utf-8?B?M0RkQ1hMQitiWkVPc2draTM4ditTL25TRmJhOXZZTjk5YjF3a1huVG85d2hP?=
 =?utf-8?B?NVhSdlhqNmQ0bTYxa2s2ZDcyZTdNckFzVUhCMlphdXJUemZ4eXI3Vmx0VVhJ?=
 =?utf-8?B?ZE4yYURqVHpYY1NYRkJaWjVhQWRxVVg0bzQraHF3RXkzc0VQeXRxMCtmWm5k?=
 =?utf-8?B?WU9NNklOU0ZiY2JZYUZuQlFKa3pNY2N6eXdJWWRZUSt1UkFLMWIvc2h4RnEy?=
 =?utf-8?B?cms4S0NGVDJESjM1MHV2Wk4renQ1RzRIU3p0SDVNZnlHZEpSQ1RvUkJLQnND?=
 =?utf-8?B?R1JJWjhneENreGQ4bGF6Y3NOQ3JrOGhGVlk1K0RGTmNzRkdQSjF2a2s2aWFl?=
 =?utf-8?B?TElVWjlHa0lWMmhQVHMwNkx4eFIzZldySGxMYjY5ZlRkc3hyVllacUNGTGVF?=
 =?utf-8?B?eVdKMFVaYVVQUlpoRmxpRU9EK2tLaTlCZytRcVNxVE5qdzcrRkV5dXRTdjFp?=
 =?utf-8?Q?qmrGgMWDU31aqB2eR310fEFyP9ZKggWz+PzPA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3120647b-070d-4e6c-a9b1-08df208704e9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:13:58.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rLYhGCnfduE+1oDDOGQuXdgV56CO46fAOWnQIkesbCdSTnAD9GQnKSaehBz94/5fXpAYBP/h1nTCosFYhmkmDv6+haPox/2PbBjlug5Ewv9QykhCw55Yq0oPnXu3nur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10207

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
 drivers/base/regmap/regmap-debugfs.c |  74 +++++++++-----------
 drivers/base/regmap/regmap.c         |  15 ++--
 3 files changed, 103 insertions(+), 118 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260930-regmap-lock-2nd-f481885c24d6

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

