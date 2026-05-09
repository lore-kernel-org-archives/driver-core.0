Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013005.outbound.protection.outlook.com [52.101.83.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE9C33D6F9;
	Sat,  9 May 2026 11:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778325297; cv=fail; b=KlqI+HwZMWGzWOtP4mSPIoUj4kY0m35VK0VnMuv8uc2fdPmhq5fpEADJ9dnRJnKLRzQb94C7IBYLQUy8l5tBa3sozimwuCFXiIFhyjKWJkUd0Uk7Eu4Zdu5mhUxm/2WY8Bk/d+Kkqet3NQdyFm1/XSo6NaHJTJUOt0nB4lPECJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778325297; c=relaxed/simple;
	bh=il9/jmpkJGkPbnIGNLiq0f/E/NYhWuNYkon9DZV7tWE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=p1FdM0w5Cylsl77PZniflVzQWGSCZOLRGPc6uPaqaIScYvlr3hloAN32/5asgLk8NNMUT9TQXOu6AANImMM0cPCz7qsjkDt66ZyDNNZgVxs5S7YMStsbEVPpVDj6ciF9oSmEJY6HGslhsYNwancmNid9iEzeVsMfCeTJr9mXX64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LN9cSynY; arc=fail smtp.client-ip=52.101.83.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LN9cSynY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwLYoEq2QJpcF5/4xE0WUk41JKS+AwGWA9qLDrl+ivKOLYbpmLYgLj10OJUUh0iWWszjssinsqQWjHeQOYQJ2NuLMIjllaPpdIHwFFdPzAgVE1Qn8SIdp4j3uODcLREwxC9KLR/7BYxh5TdO+Ezk7P2va1mAu8SqkZoX+5by94P4BxbpVTjATpeVXTTmAOPbHrxfo+she+mdb/X1+FZ/DcjV7ZhppaB2r/o+Whys2TxbGTnSPmWEInE52sOxnyNw9aow7Mplfbni8L+piBBP2S1H/vAAxxoefDj6yE9khq4KovzdD+vicHNqISZ/TTzI9ZgEEWSjJjxPaL5e3pOy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KhiZQfSP9eJn1XrUddwci45S4jIRZljujQ2PRB0wdM=;
 b=gn6Uh6ASuR4IW/fvExOYmbsMmbzAk4BArbYb6+HAs2F/3wSVZ4irXghG5dKuZvv61hOrLzH0V8Ac1GwPqB6ZK+2DundNNbGUEdR48igZK9uAuT2Xqe9CpXkwK8F3oy4y/bE0xA4AwlnriLMYWZ3jlpE3EnEBEcqx1uG40kbS9Mq8r1CLYkJ7TPq/IsAQezjc9hUtuv1NVIVCXhp8CDurXvePPYg2ZDrJc+REfngx+GGmJqJX1yu4/iqvprPiig1yZ1glK/NHZaFuTP40V5sp/OrzCFb5Egx4Ef9YFujl+9FKuMUuEZ0xXK3AAHaKAtBQebniBexL7hC4yPIKiJYIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KhiZQfSP9eJn1XrUddwci45S4jIRZljujQ2PRB0wdM=;
 b=LN9cSynYQxb8FCic8LQC71YAxx7krC6TTiSeBYQuFgnrIHta/x2odnzHumk5ccr/DzclkyUNf/fIk83iCHpJbH3FKKUZzHU86SWOSdx9ZCro7YbvXCHUlrmbVAS3bGfbqgN+QnKzWsGFQNS2tAHH5qFJ6PoIFsd0zhR0NtqImOE+NLet8w++1J0iUudnGb71FKlZe2LVjNBZoD/HRjWAnFyjNdGD35BUW6PynJy/xqXz0/NnayRFsaZcA+AgM1CWFKlZW3/cu3jpjgkU/yrc4pvZVIJGHJxe8JbSeXfUj8WZruGDnUvB0l6o3RniZ2nRUrvdfcJM6HfVZSbdsUhKxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DU4PR04MB12082.eurprd04.prod.outlook.com (2603:10a6:10:645::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Sat, 9 May
 2026 11:14:53 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9891.008; Sat, 9 May 2026
 11:14:53 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	saravanak@google.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] driver core: avoid repeatedly printing the same 'Fixed dependency' log
Date: Sat,  9 May 2026 19:17:28 +0800
Message-Id: <20260509111728.4123331-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DU4PR04MB12082:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e2800a-01b3-42ce-e4cd-08deadbc317c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	HUEYKCw3APl66jTE1p3/iEwuc/d/lV9nMy4ni+GihWPMrS9sQmtzIxbxH1PjSXp+31noHFbF2pTjQlxko4lgaLJ7lLdVdKkZ/xwFZkfzcpA8mIMFVw8TBRLhmmSl1hkxT3Z8L8b9UyYqG34YIknzZy4YLLVuEYBj96uP9P5jesPl2RCYR6HRxGSt4GJyAv9g50ReNo237oxWiV4hsw/SGHq9rtsmGt1Jw2A0GljKdAGo7vyn8np9t9P3LsUG9dFb5IW4xLNgjO/b4rMKnmO1Pov4ffSFqqLNzHXZCIHeXhQS67w7urM4Fs+5YaFi5INbcRDucv4gTBntRTRt3Z1McW3tVgYIEWpkqB3n3KzVSPBvKdCJh2oO+cYMWfrcarze3iE3tzXUjTyftSM0n84QhkJxVExEmGNrEXnTU0yuMLPi0nRLyfVcdbSnfN209cET6RwtTNfsUisZZXGk34cQRtU+KEWoLsa+kYIIRpyhaqxw0+lYBHi7TBHYFXkT60CD6WSzJOakBM5k0nYwsNbCgql7d7K33JQ5Cfb/0Gg/o+GeIVOuGCnW6zgeXAxeKCKGiCpF6XdWf/yrT4uu8HmRdWIyQT5juQxDFnquhNkZ40ZjC/LiNOR9hbdFkp2sEHxSQhKxamAwsqT2MMlqwg3Y+Z4FuMlFIe509o1YmVwk2MPvzxZ7V/MFG+EF7EeebL25HAuHHhKVNVIrU8RvepkLzu/T0MnhBrqvwnl4ge6IX+eLTiF2fAwh6xabwcCeF/eM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2o8EWegXyuxI8dZpF1HHXJCuuyoMbkXkQMsTITEQrpOoQmt1OVNGJnz8BzSa?=
 =?us-ascii?Q?iTuLuXcuoTKv0Yg/TrLBxTiQWord9M8gv2MNv8QmZkEiFKW5Zm49NWn1tQbk?=
 =?us-ascii?Q?3e+YxkzQQG0VEsRy11qmm2WeZG2kHZVXEHa7U26yvP1DroYzQOU8qD06k5oL?=
 =?us-ascii?Q?JL4oj19Eq8Hv0UCyhezRDYcopIdmNhJHPIeKPlsEaDdek5MQ1eUXI9Q3H1I6?=
 =?us-ascii?Q?+p8qcqhzUAUsJqPKjdz7Tkj2a32AXUCfWmjb7rMpFSyGM7JB4OvXJMUnd99+?=
 =?us-ascii?Q?iGiFY7/ZSe4x9GX9FkwPIfMJdEeGaBpPoKPEhDl5+15bopVoRTFmY2oztsfS?=
 =?us-ascii?Q?dGkANsQN6fg8tjVOa0n5acqUKYtv7+I2gyZfpHCQHk+ehL58g5WPoEJeVnAT?=
 =?us-ascii?Q?xeyBj0EpBpKKiSCiBO/juidAbrNaDsF8S27Um2tCsQmEgYhh2NMu3ddRf1eT?=
 =?us-ascii?Q?x/gbOT95bBmFd6A/nxJZNRvg3FiSR3mSNAl7fDpVfxpvRJ8Dja9vT7lKwWVL?=
 =?us-ascii?Q?BHr+aoSr85bepmnS3EYq6CA26w3e5KRjaEILbN+EtwVL9pMUt33BZ9GKAPub?=
 =?us-ascii?Q?7/1BLHdY2/GJgIHjLkM7idjJ/K+F7BmAn6p0XzO4QXNaDZ4tdVHRO6QolTTB?=
 =?us-ascii?Q?tIve7LLLni6ODKUQ0oTkr1139cPUg7w2/vQDyGsmtsY2tzJjs5h2GrSmnqxN?=
 =?us-ascii?Q?LA5/cPVoO80K+AeecrQG564DxigPiLUlw9tzG5VGBCKJWnBlfBv8BaMEz5TS?=
 =?us-ascii?Q?tJ6e/cjDUhIZjmpkg8vTRiN7792gnFNS5KxF/sWnzoNZpfF/7qjVR/vUhlV3?=
 =?us-ascii?Q?+aT62zi9BFxlLf9zb1uzZ/Dzfe/kuKdgAtrRLhagIv46xIGIXYOXGLqa8MAf?=
 =?us-ascii?Q?YK8iyUbMrllTpKzLa4xt37dhKF/F7pqA1Z/kwwPvYliYsLgzO9n7hUtN19++?=
 =?us-ascii?Q?K+ruEnAmfvZmg+1AkRzE9JO4L3Tc5W773zAj54XRJs6r6odUa3WJRIcfDX+4?=
 =?us-ascii?Q?ZWMt8//NtBQ7LkLmdc9DopAL/fnguwhndpLmrYvI22tfzz1BT9x5ZtOPRZYV?=
 =?us-ascii?Q?pMpjkj6HDzAc8VncGzaTxOSazsh85r5jLHfPnHjSPyLIiObwNmdUvJpQfScB?=
 =?us-ascii?Q?oRnM8etv2d/ZA28QzBYfPei2g3fnBPebn+1gkWhiaZtpOqu/tPSvS/BAzYCa?=
 =?us-ascii?Q?7lggJE0OnRKxROHO39yXg2BVGMcy42n2jMy3OQJIj/GBeZpvzVE9KBoHtl/O?=
 =?us-ascii?Q?5i6I7Q/BbewuLVTSpgP8mqsix+y1QgteHRdlUyx+19FXBBuPmeEZAa0YqEeo?=
 =?us-ascii?Q?7fYmYQSDsXuaP00EB9sBRVamw+Hf6VVu1HhRkIluhoImumS3lB1KcsdfIjzx?=
 =?us-ascii?Q?6XYx3LWtx+x+a895AZRqmxtR/aYal2CXrCJAV9V5lycti7c+FqN9czsyceB1?=
 =?us-ascii?Q?a9WjrF2R3T/JrOBsASyTUtaODYKjM67Y0RJteq+Ge6ThN01nCMKCBtCWTbVm?=
 =?us-ascii?Q?VMZRWf2zNTamSsLipbENM51k4RfHuvNslV0J7jbfE85GxT/oty+hyuNRPXCo?=
 =?us-ascii?Q?wjwVA2JDgGINuOT/KnHd8HLKKJvWJF3BoqDeQE4RviEnn/zPRsOCRk+Yz+rX?=
 =?us-ascii?Q?ifRrhfT3FQ5qPynx5dJTa1Gke1pxFJPx0tWbW1x3Gy+GZ7wvaodWbRCcH6/N?=
 =?us-ascii?Q?/jljFD0vfNDWfut5K0NYYwWovrK5vrfee9nx36jnGZ32Jw4vxE6q784FUvmr?=
 =?us-ascii?Q?xO2GcGfaRQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e2800a-01b3-42ce-e4cd-08deadbc317c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 11:14:53.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OC+tww8SrNe0zfCR0ZIeLRpDVvayzviEjP7RLpAajWsooqs4l2AOTZSC+rkfRW6GyNAwMO+wfQK5OQhfNFnL4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12082

The "Fixed dependency cycle(s) with ..." log is printed for each cycle
finding process. In particular, the same cycle may be parsed many times
during the proxy link setup. For example, if /soc/bus@4c000000/usb@4c100000
is a devicetree structure and node usb@4c100000 is in a cycle, then for
each device registration (soc, 4c000000.bus and 4c100000.usb),
fw_devlink_create_devlink() will find the same cycle and print a log.
The repeat logs are redundant and may cause confusion for the user. Move
the pr_debug() to __fwnode_link_cycle() and avoid printing the log if it
has already been printed.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/base/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index d49420e066de..af0371d4ed83 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -127,7 +127,13 @@ static void __fwnode_link_cycle(struct fwnode_link *link)
 {
 	pr_debug("%pfwf: cycle: depends on %pfwf\n",
 		 link->consumer, link->supplier);
+
+	if (link->flags & FWLINK_FLAG_CYCLE)
+		return;
+
 	link->flags |= FWLINK_FLAG_CYCLE;
+	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
+		link->consumer, link->supplier);
 }
 
 /**
@@ -2140,8 +2146,6 @@ static int fw_devlink_create_devlink(struct device *con,
 	if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
 		__fwnode_link_cycle(link);
 		pr_debug("----- cycle: end -----\n");
-		pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
-			link->consumer, sup_handle);
 	}
 	device_links_write_unlock();
 
-- 
2.34.1

