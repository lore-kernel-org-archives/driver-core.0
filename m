Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916A530568B;
	Tue, 21 Jul 2026 10:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631076; cv=fail; b=huL9D0sViTyNXl2bHjk1wgKxrUuw1MU6rHDXGaKs9dWwOF3U6rKleyrBl/82juXXYEVDWtZeM6r03xf786FqL2wGuvUAqvqy+sx8bXvFzz/CgImvPDpyORBsqR90VPoROqsbvaZkAmRPavWFaVwgZB/3sPmFFqC1VM1JrcOKsI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631076; c=relaxed/simple;
	bh=PB5qFosyfY7THar/EqGMjtMJ83dRkVeRFk+NN1Xw9Cc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XiZSleQOSreNE7N5x7q/nG29QIM0sVjFDUKDdMF1hbAwrHRPmdvYuUWYQ0NDriAThrQVW8kJ5rqg6YO0DW/T1Cng6V+o7A0ecklA2yDp9jjiWeiNPasXwbkS3jDUi0TkbkOjbpMvEtPKF4ncdkRbjfgKnBAUf+McKa+IUdXLsAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LtlWydLu; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LtlWydLu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+gHEVIP3dYEWXPyPwBAKI4RwLqqnzfOqgqz2h9u3eERpx0TmA4IbequaQ5Gr4jyofKrv+3Y+j6EQ1f/Pm8LVAPD75rrqcrf/9kDFhNMkUv+douSiHbn/8SJmJz1//ul8RSXEGSoYCeAi5eEH4l2jYHloQxYoy2z85abQsbRcr6t8E3nmwH5BTU1Ophen1KayMEZoaKtK8NWtHfbT7lZFEZOniqX76PTwQUeaMfcCrU2cNkNqT8CvoKCh6W5eB9abxTbg1IEfe9AJndDoW6FTz0j8wToA4G4p4VoBoy9tCJ4pRErxuDrSh7MCxAXgaHa+YWLSfgZWcfezryk8AD9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IywCCzpU+ZgjyNRa2ZiJdBI32MZ/q8BNi3v2rRRNBOk=;
 b=R+u+SEEJ9/Ix0Ijrk926AwAqWPFHAHrVbDsQmKbsRSHpGokbXg747l5RN6vqSkJin/pup0End7kAOO6a0pRUPowLkj9g6LZEhfE66793/NwILjU1SEJ1Ee+PblbLRZwlnhvLxe/N2dSYTUWH+UoPSg4A9rqk+dJ+KOCnubmeutoET6u5RR2ilDE80MZ21fZmXVAoWl0XrUOL41EV9ZD0UFWI3/bStg/KFi+wWTgN7VT7x9KUEGmnm8WOmUI7ujrj+nSXsFaB8xdzV1pLAVGC3TF+xL7PnzVuAYlHlJkaVo9yZJHsVh46FtVH373cXlyQxNV1K6kq6dFyx469hTANRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IywCCzpU+ZgjyNRa2ZiJdBI32MZ/q8BNi3v2rRRNBOk=;
 b=LtlWydLuf9stWmaTObMCA1gFxBkDlvzRgDpNVoZZVeZv+DARql0BYRODCzcbZcvkaMCNNxZosJ5QPLtvEkH4NpYEIUa885tON8HDbpiFR+0LKg6we5xQNcABTxZJqjwCLSWY7pPFZfFyZSazwNkXLCsTF88R0Y2Vwj0PsfohJRFkPhrqW+7B99x9rTZgoaJrbwXUBfWVj02scti5YwlCYY+H/BFJMnr6VIXTgTH5XOwuhQg48m48ihF2a6/1TalZu9KGGtZwmSbr5k/N28lhN15dXlmteBsimgy32Q7YFZRiuCH/45lfSHvDVwwLJuxLXZXiCrc5qz1wkwr1YBIDdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by GVXPR04MB12105.eurprd04.prod.outlook.com (2603:10a6:150:335::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 10:51:11 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 10:51:10 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	robh@kernel.org,
	saravanak@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: bartosz.golaszewski@oss.qualcomm.com,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v6 0/2] device property: add test cases for fwnode_for_each_child_node()
Date: Tue, 21 Jul 2026 18:54:46 +0800
Message-Id: <20260721105448.2109894-1-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::10) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|GVXPR04MB12105:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b136f1a-9a3d-4a65-6b4c-08dee715f9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|7416014|376014|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MEINvDbvObw93neekRQTf9qTVh6/goVtILE8nGd3YUxWUepwoynknbltZ8iiZsV8eLN6R8GtyaJ2W4h7Gb7WBA2vtI13mpDwzHDTarLfVp+nruB/09v0G8fOQi8hSx7pAc9xsMryv2gtnJVTZ5GV421Z8yN6SbgsN6sJ5LIZS1+faF22tKjK/3BGwuNwzyRqcwH7vhVJBpzwOyeKL/1qSU52j/5rvHV713yA4jthDIfW0sUMB91Vjd06lAp2oUmCkjuGY+xEs6aijrAsygolAQxAqPb8hCBCBFPrVkobIIadZcqUjFWalPoqX/n9RRwojU9FRz6rmHXOTQX1uUe334x7d6R+KyPRMUMk5N8YWYvzHgapCDixkn2xDPmhvbO4HvvLNkAxKav7PP4vUJcrwCPMSSVpyaSKt5lAcUS+x9j8y4GOa3wvGbPH1hcdP3HObtuP5/br30SHStkWkSR3GoB206tIN1JayIPy4wXl4SPQ/clstALn1UYjN55js++eOVd6RGz+U4M56HVYX03HkSutiZd1Q9iEcR6hHqPpkw8weVD1bDxKg+Il2y2d0FzimZIqVmgPCqEWQPJ7amTOxjjBxLf1ZdWBeLKl3+pkobxylVDc9iWJW7Aw0L/2dX7cFDiLNCTwLVNV9GZgT3majffL0boHmBxCBap35b8CtXM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(7416014)(376014)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fIXLfr1kIMGTiAXj1a/DeUIL1ZZ0WRt8SQmgNnP9cEqAZLnr2+vYGgRbxBk1?=
 =?us-ascii?Q?WgvORvCPGszoVb2IuaED9BftmIfHqHXkmqvUQUotEoSPEUirNVCVLLqkEiLL?=
 =?us-ascii?Q?8XxCuJ3+3i2Pex77/gE3Dho1YasMKeC2QeJeB/x/Y26aQHmkri6XWdURWixf?=
 =?us-ascii?Q?KCCGb121ABjoE4grUrhZwoOP576XC182aQaUZTRERaOHMgWFliNuEe9GyMX2?=
 =?us-ascii?Q?Kv78hrKFQIpHLGdO6UD2LQ9LoWd/MDFBjXAK7gNDFvf255juiWLj1M8ZE79l?=
 =?us-ascii?Q?h7g01IX/6g5WqWC++N6Qfv1EKuRHVCoYBuP6a4iAjVHcW7XcHZvZ6+9NOrTC?=
 =?us-ascii?Q?LpI/hfXifnu15Vx18kT1lMLiSTzyLvXRleSon+ACBsyUukUeBe142ltemJBG?=
 =?us-ascii?Q?YS6VYKj/jcz+VjYoCECjs8J2gSvd64g4ZYpihuutLb8C42+TAfN9OwyYkK/Y?=
 =?us-ascii?Q?h++2TvTCGqoNepKkIyGrO6MkAWsd88yhwXlLazuhMYOHcfZKgkq3nnl8Mud5?=
 =?us-ascii?Q?9g/cy8t1tC6r8LZo8jBv2NRAdgEctQT8inC4FVO+iFSL3lD1risGAI2fep9M?=
 =?us-ascii?Q?zetPrKboDzjCnGOrHfcPn+lTFyZHpTBJMM5FGlp8wvl2Uwu43+hlI+xrY/i2?=
 =?us-ascii?Q?W37xleJDE8HnvW1baqpegGzgVDc6YWBgXxA+KfuWEnUL/TcI6CRelDIUo2is?=
 =?us-ascii?Q?xv/JF8z7FmgVa1rf427msS5E5TyjYDkujvo5/Np53AgxmULAHBGWpPf6mDTw?=
 =?us-ascii?Q?UxYyQNp9LvD9IOztsPCYVymJUSBZ3/TLtnuT9OTucYTryso5aHO1Nb09ITVA?=
 =?us-ascii?Q?pSVFCMdeg9EgqdhZQHnqX68OVSsgVCm8jKoSrFOu6dc4S1yHWGkSccLZPJ3f?=
 =?us-ascii?Q?wnUtnDq4p5D4ZFOxovW1TIZFj0f5khBxc8I5uM9IPIEtI9b4VoOlryYCe3R6?=
 =?us-ascii?Q?BphsokOPAXLV7Da9zr+MVAYIhfaevPrScOtXtxGPi3kBhilj2av/bsFQRp8S?=
 =?us-ascii?Q?4U60n1ngY857WORukFgTFieY6viAqRTIxlx10Bmam91wvzGyySfpglobqNE+?=
 =?us-ascii?Q?oXve3NA56DtENQ5JkYAiPYWm8xqm0+rfPv2P7xPTzIAyCgXr6i1R7er/V9c7?=
 =?us-ascii?Q?wkOjij9QtxG43p8l02Q43Z4Y2zPo1e3TCNJCJPtF/xMfbm2juhvT/N7EYalZ?=
 =?us-ascii?Q?EkH93lzl+RxEG9zbTIaxMAa4CDWaz8SSNJHQzVQlKHgRlXdR+HmtrjhU15Ve?=
 =?us-ascii?Q?lR7ZZVFk5uUToh2cGIvY1HCuqxO1rt3jaRVmooJiP1DBJ7u63RH0WafV8V/Y?=
 =?us-ascii?Q?saaw3UH6Wfpk1Q35R3j3pUMIKpCIDQbAx4JqtNWE4xv24z33LP3BaJw6UJAI?=
 =?us-ascii?Q?43tr1/bTMt0KMORKuKhxqQohJmRxp+8ZXKL2u3iWB702E/7hDg1S75jFNClK?=
 =?us-ascii?Q?wt1QbYwQDk/MsWPCTDTKSzjUEvwfFhVn1bkQ3Vg+oS+Krl6m8ldm2NLsHwWU?=
 =?us-ascii?Q?8NR2QUHQLw5/g1L8fu+4lhKIeG+zBS0pMhpuo/tp5aEQ2P4dhtXn5T46vV5N?=
 =?us-ascii?Q?XCBLg3TCv5r8bH2DfDxfSeqQRsxaAqRhSe/XlErkp9NafBmNOkqBvc6ugSVn?=
 =?us-ascii?Q?JiIVsKSYsBPvlcM18FlHWUnoAZZoA6H6cGaw4eX9XV39ye3Wr+E9xB60xwlz?=
 =?us-ascii?Q?wgZxYf4sbsxOS7z1pC7pUhEIaJ1rJ/cWAsxs35OCRgvwlDeEqZl7Cg25wwqn?=
 =?us-ascii?Q?5dvZYD7w4vvtTz0bgkbgDa09bE1bepOvzoZ3V/h2NIsw1Ud9AG0K?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b136f1a-9a3d-4a65-6b4c-08dee715f9f5
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 10:51:10.8963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fanq0vEkQQfkdGgo4hRdA9R8C5uTH2oGxeuYkmXF5Kvt6HHk+5TLebKxsvrvum2YjI+JldVSrIep5J3LLKi87NMxPAJHspCcCj2tnauVvqsDNfyYMBEkXwId3Jdh633G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12105

From: Xu Yang <xu.yang_2@nxp.com>

This patchset will fix lkp reported issue when adding test cases for
fwnode_for_each_child_node().

  ERROR: modpost: "of_node_ktype"
    [drivers/base/test/property-entry-test.ko] undefined!

Xu Yang (2):
  of: kobj: export of_node_ktype for use by modules
  device property: add test cases for fwnode_for_each_child_node()

 drivers/base/test/Kconfig               |   1 +
 drivers/base/test/property-entry-test.c | 137 ++++++++++++++++++++++++
 drivers/of/kobj.c                       |   2 +
 3 files changed, 140 insertions(+)

-- 
2.34.1

