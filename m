Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013026.outbound.protection.outlook.com [40.93.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB00039479C;
	Tue,  8 Sep 2026 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788853919; cv=fail; b=jH2+2gwLr3Ov0m+bUKzBeog+Gthwjy3rmFMD5/PrHY1VVBV1MqT9vMv6FuhMOAFcTSJE+qAQsOVfykknhKb2ULhWrNXYumzMQ7eCSr+3XoIwx8/BFSWJ3ptM3QBrqt1JX0p4xOFeH8Q5aAgMapXR+FimXmEAY1jIQSfSKlwo+GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788853919; c=relaxed/simple;
	bh=HimOV5egXRGG0pix8ktdWIJFwIeFyuGSpFgPpdqDW7M=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=oQ2AJuT7AZbWoCA1XXwZY15tmPF1SbQ9M4rm/tFsprTrdEh9fFymJNx4L1jaHZFeReWB0xQKtCOM/MjN7UbgUuSk1k6XBPMNo6Ls4nuN9AFfqLG120yddwJZfndp7NrM2CtbWkk4WwQWpbaIxUpjPQ8EON5kK/geXGhvDzZMH2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zq6W5RE6; arc=fail smtp.client-ip=40.93.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zq6W5RE6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2kvYzqXWPGJqBdLRUQJjT58uGvoizofJoA1suX13PywyrYUe65rMuAvsNI+lEiYpjNvbddLs6Y5aSVIcKkbZxMrCcWrCLMMzbS6POBzQZ90iRrXhXJ0IQ4uMYYN1ISDXjm1KOosuu/iZIFf3nJgWWmBvvquswIpOTusN7eGY8A6eKvgld3zfZ6oEF4EzEOZAXVoI3G9fyfWnXqU+fdJXmFd5/xu/3FTpZyAIlUTYapEJYPCBgSScM/hRZ5/JvVKJFs7MzuiHbFLfWRJWOcvrCEylsDyJ83Pa2x6lT6lNATV5ZuAIuAamM8Dn9jZNjkrGcdCCccKKfFRg/akMgrUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPApNo2KbfAhvT2e6KsDA3nbzBCHPhKUHyU6cOuC1AI=;
 b=vAbo+30CZFh0LT1YvZ9zd7qFqilhC2LGO5cyN2CRmBcul1uLmub15Q3KTrp1yRZXZkfSebTTgPKGKPyJpI310HnHqAffDcWL9rNLjA8Z/UY+lrHI3cTNSSFM3uSWqlleaBWP1It4mY970EH39Mml5zNwS8/rhTA3pRpskgDoU0aPGMwu40KchUjnsBJkyyK3Y3eGOAYFHnTU1Vr4+Chj56+JxUGiQCpxRvMFGq5U0FjpDFm1SSP2kRocsTuISxCOhi9MnYuyS7bi+kvV1IEtIjPR9fApCXIlXMFR/2ZpRbYYlf5RynXC38PyEPlPsKFr2L3V0xHVQwQrARKeGPlpRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPApNo2KbfAhvT2e6KsDA3nbzBCHPhKUHyU6cOuC1AI=;
 b=Zq6W5RE6OpKHluzFtj8kDVb6Yp5wTF/J1sOcpeT3MOtLUyOYK1YHGTfD18pIIDqVIIu3ULM1n9TMv/s0NxA6FKwDdXfAVCQhOh4lz8IXU6/kdTA5CocRiZkrmGBAz3Ts4X61QWbhbPdSNwrupVClMs8j14h+pKqMwAA3/YBzLKwCvX2KAvF68XNLZhuXBrfyOzH773nRD2f9X6vHXm8wTivVbH4/HmclOVoIQVh4yWSI87P2DjHRdJo5PpoBRvMJZQiEIcrtJDqltRlAJhpsquxjL65r3LqQCC3imeT59kx3ZDngXOIZNOElmzRWp0NUPl288wvySjSttmGXPO20yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:51:55 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:51:55 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Tue, 08 Sep 2026 16:51:48 +0900
Subject: [PATCH] rust: pci: add resource_flags accessor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDQAxA4atI1gZGWyp6FXExPxmbIiqJI4J49
 47t8lu8d4KSMCl0xQlCOysvc0ZVFuDfdh4JOWRDbeqXaU2Dq2cU0iWJJ4yTHRVdY0Nw1rjHM0I
 OV6HIx2/aD39rch/y232C6/oCE4vBv3YAAAA=
X-Change-ID: 20260907-pci-resource-flags-b7addba0b34f
To: Danilo Krummrich <dakr@kernel.org>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::14) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|LV5PR12MB9754:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3ef9a0-f691-4dcc-fd4b-08df0d7e0d76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|7416014|376014|10067099003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	DMG+ZRKD0Qes8P704mrWHTA39p9GUZ6TDK/Qz4BWOit8vRZr4GV5LamSHYduBfU31fiOZNrhh4RRHjg6mI4HkJJKd/d/1Nh8vynwGHK/nGPp9mDNK8iTgZol0TgtBX/fDiWGMYHa5VMbaVUXS8s2ZvuJdSYHTem528R80gZ3tjqVNPSM7hgB1CDhICEwJyPoPVQqCdiHEorTjrCvqmDSrwTzCZbd2f1lTn0de6sGX+ULGwFWhGB4uCcRJTStetcZ8D+gRHujjF2xzInSJj54aFZcvgzT4aF1/8dfbXODciicXt0YVvSYZoEhKBzxgHhFIqL7xmFEldwdXafYDAF94PBB9vCRZcU9/MzYh7CeODm6sIuPi6jRPZ8CBWM/lZe5wcAKJxoXB4tRJDv8ZjF45axnzMtkjCnyxu9U2kD4oHrptFOPh3cbiHa1QSc5+8Brw0L3xjRy1LsffoaYwtnFvJcjgbrIsWRi+gbcgaraCEQTNQTXnwITZOjymAlJ6tsl9REUwym05qkazAIMUGX4Yn4VtvMXLW9fhESNRRfhC8ySJNALnofqnc0+exQINMNanxhc+o+PI93qHAgA6a2BZQkpV1RGbTHxG/TmmUhr6RULGtWSDWcH0941/rsKyxWCCKUuNt84toaCc/sWgMqnh22L14RVCq26NaAVDoIwZSQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(7416014)(376014)(10067099003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVlMaUpPN3NnSDgxbzVZME9pT3l5MlZidFZwOU5zaEp6NHljTDdZU3ZGSXl6?=
 =?utf-8?B?R0xTMGZTL0FZQmE1RGtjV2xpU1FsNlZlYzQvR1QreGxLSXlNbHpjMXk0N3p4?=
 =?utf-8?B?cXN3MjJzZFA3S1NZbW5ZYzlZOVFOYysxZ3d2bzVOKzRTdVUvQ0lmU0psSytx?=
 =?utf-8?B?WFlyNlhBZVVMMjNRNXhBMFA1RXZnOGxnVzhjdXdVTlVhVzE3dXcvakxBcXJl?=
 =?utf-8?B?RnN4QlFQdFdycFVFWVIrVFZ5TXVLcXFRWjRKQ3JVU1hxSUJlYTZQNUY0ZVIy?=
 =?utf-8?B?Q2dBWkhSUHpsaUYyaGY2dUZGaE1QY0xYaVh1aTdtcVVQRHpPYTBTMEd3SVFq?=
 =?utf-8?B?M3B4YTdxdWs4N2tqK0Erek9uSHFsS1RScE9uZU9uNGtVZVQ1NFhSSnNaN3Q5?=
 =?utf-8?B?eVFVVzg2QXZzSkZvd1d2a243dExLZklRUFF3MEJwMEFaejgyZzE2N0pyMHZp?=
 =?utf-8?B?ZWl1akExakhzakt4ajIyVE5YNEVsNHpTMWpkTk1wTElzZmRvR1pBeFZzZm55?=
 =?utf-8?B?UlZPbkppNDRZdGx2dDJHeE9LMUc0bFJNMFFyV0VMSHpMZzl6S0M3cWxYOEU2?=
 =?utf-8?B?eWtPb1M3aDM2ZU5JaVM0SnFDRTRXc1JRNHBkclJ1YlhrcFIxTlBOTFlaWFYw?=
 =?utf-8?B?MzFoUWFsanRsb3lUSEdRclJmMlRnMzE5VXl1Wk4zUC81cm9TTm9WbDQzMm5W?=
 =?utf-8?B?SDNsWm16S093c0Q4bDlFRnJ3dERqb04xcWgzdENsSVJMMlA3aVIwNU5ZemZI?=
 =?utf-8?B?WjBGMzhXNHg0dkF4OUdBd3pmbGxLSzRlOXNxOWdmRFJ0MUIvK29wdHdGMTA1?=
 =?utf-8?B?WjJKOGhGeWFCWnpELytwWVE1Z0l3UjhWdUdvU1ZtUU9XZGhqRjQvMzUxRmg1?=
 =?utf-8?B?ekp2c3pCOGg2YTFzZ3Z2RkdJejMyTk1lVytRT1dkRi9Gc3Iyc1dkaVNqMU1G?=
 =?utf-8?B?WUxzdytBRnRqeGh4VmxSTUw4eVJOVWtmbGNJTnU1bjhUSVRJdmczSysrR0ZX?=
 =?utf-8?B?ejlMSTdCU2RxWDNJMGhIbnBmaSsyYzN3K2FHOXNEZkxPMHdlelV5NFVKejdj?=
 =?utf-8?B?T2FCYSttdnJrUTYvdjlrUFFlNlNEOEFjSmpNQWRtajkzeVFqRXo0eEo4N1Bh?=
 =?utf-8?B?VHFEMWRvZXZtOTZqak5XM0t0OFNXdXVSbXFmZ0t2bEw3ZFpkRis4NVpncHR1?=
 =?utf-8?B?WVk5c281eVdHYVF5UTBQQXpwcEluYzBJbHBQdUZFdmhqVVp3dGc0VU5nRUg0?=
 =?utf-8?B?ME5zMUdUQ2Y3ZUphOW1qbnhHWWg0Y0ZScXVpK2luU21QQWNLZG0vTnNCaDZR?=
 =?utf-8?B?dFhsd2xDTm5rY1M3bXNhUDFVRmUydEJQOTR3YlhvMmZVVUpTWmZSTW9kZGxF?=
 =?utf-8?B?eGNQUHVqNmY2WVRsVWJTRVZCU2lzNjFoWk54RXluWmxrb0VFekF4MTA2TUZ1?=
 =?utf-8?B?bVFTeVdicHpwVGlZS1poR2FYdzRPOElMUWZTS1UvelVnTG5vSEFtWC80WkJU?=
 =?utf-8?B?RXRUZnpwdDMxN0pXWWdWVkVvTFl3bi94U2JhbUk2Mk04YkhnTFUxV3FwV2hK?=
 =?utf-8?B?aXFpVzhxcnN0ekJTV0piSXo0UFFBOEV4V2JvVk5nRDBvSE1ZUzRrcVlueWRi?=
 =?utf-8?B?VHE2Y2o2WlB4bndacmwwS0ZaVUpuZStmb1NndUFrWUVRek5hNktUK0JpcVVu?=
 =?utf-8?B?ckZWREZ4SFN3dDhwbVBRdDV0ZHdNTE9YeUwyOGJWOGRTZitGaDk2MklxWHhj?=
 =?utf-8?B?MmRQMmJVZVhKTEw0QkhnWVJmZ0o3SGtocTZPM1Y3ZU9Sbzk2a3N0WTljZmdK?=
 =?utf-8?B?YnpBZ29YUmpvTmJkRDkrdUIxdE5xQ1U1NGxqS3BGaDExUGdLcWhjREJUZVpD?=
 =?utf-8?B?SDlhWTZXT3F1Y2gzNy8rUEdjbWw1ZDNBM0ZqNW1lWWhXRWZoSExOeXRKZHQ2?=
 =?utf-8?B?QlFCL2QxYnVlM1hqU3BGTTcybFFBSWU3bGZhaXVOZG1pWGIzTzJNMElGb3J1?=
 =?utf-8?B?NEFielZsM210MER2SVVvYmpHVGlwdDhtc2FTbHpqeHd6R29VZ09XY0lrN3F1?=
 =?utf-8?B?NUFVZVpwVWdKczQ3MVdzSnRwdDQ3b0lZRWdJZ0lhYkpRZmlEdnJkSW5WcFcz?=
 =?utf-8?B?a2pqVWo4YkZMTTc3UWdVemdTNlU3RUpVd3QveEF5R0hTS05HcjUxejBtUFhY?=
 =?utf-8?B?dTFiaEJUQWUxNkNtU25iYStMQ0dZTFRNcm9YcmhHYU1ManMxZ0dPeW9sZDN5?=
 =?utf-8?B?MEswb1RLUzZLbW1UajhGcEo4SjUyaHAvN0VIRVk5dlFrRmlpbjBTN3VJYTdm?=
 =?utf-8?B?UVBUSlUxMk5nUlFGbm1lZU00bWVGWnVZYXdreTcxMk94Z3lNTEFWNUszN2Zs?=
 =?utf-8?Q?HSfk4BzQvoLenIBMP7yAa9ygOXxTpM5cyfdCGzuYxE2+z?=
X-MS-Exchange-AntiSpam-MessageData-1: RHm4wEnHBwC2BA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3ef9a0-f691-4dcc-fd4b-08df0d7e0d76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:51:55.4240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OA6XqlZCFQa1h6ofczy78/pKUX/rv/s5b/tRLTTVWuZ8nat/e21mDsKRYDGYQ4ouDHwAxe01RmZfPRxfBCnnBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9754

From: Joel Fernandes <joelagnelf@nvidia.com>

Add a `Device::resource_flags()` method to the PCI Rust abstraction,
wrapping the C-side static inline `pci_resource_flags()`.

The flags returned correspond to the `IORESOURCE` bitmask carried by a
PCI BAR's `struct resource`.

The immediate motivation is BAR layout discovery on NVIDIA GPUs: a
64-bit BAR consumes two consecutive Linux PCI resource slots (the lower
32 bits at index N and the upper 32 bits at index N+1, with the latter
having no flags or size of its own).

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
This is patch 1 of Joel's nova-core mm prerequisites series [1],
reposted with no code changes. The rest of that series was folded into
the PRAMIN series [2], which is now in drm-rust-next and didn't carry
this patch. The upcoming nova-core memory management changes still need
resource_flags().

This is based on drm-rust-next.

[1] https://lore.kernel.org/all/20260518180342.2387845-2-joelagnelf@nvidia.com/
[2] https://lore.kernel.org/all/20260827-pramin-split-v3-0-24b24d7afc52@nvidia.com/
---
 rust/helpers/pci.c         |  6 ++++++
 rust/kernel/io/resource.rs |  8 ++++++++
 rust/kernel/pci.rs         | 14 ++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/rust/helpers/pci.c b/rust/helpers/pci.c
index a714cc2bfb7a..3686e405160d 100644
--- a/rust/helpers/pci.c
+++ b/rust/helpers/pci.c
@@ -19,6 +19,12 @@ __rust_helper resource_size_t rust_helper_pci_resource_len(struct pci_dev *pdev,
 	return pci_resource_len(pdev, bar);
 }
 
+__rust_helper unsigned long rust_helper_pci_resource_flags(const struct pci_dev *pdev,
+							   int bar)
+{
+	return pci_resource_flags(pdev, bar);
+}
+
 __rust_helper bool rust_helper_dev_is_pci(const struct device *dev)
 {
 	return dev_is_pci(dev);
diff --git a/rust/kernel/io/resource.rs b/rust/kernel/io/resource.rs
index 17b0c174cfc5..0d3b34f83334 100644
--- a/rust/kernel/io/resource.rs
+++ b/rust/kernel/io/resource.rs
@@ -226,10 +226,18 @@ impl Flags {
     /// Resource represents a memory region that must be ioremaped using `ioremap_np`.
     pub const IORESOURCE_MEM_NONPOSTED: Flags = Flags::new(bindings::IORESOURCE_MEM_NONPOSTED);
 
+    /// Memory region uses a 64-bit address (consumes two consecutive PCI resource slots).
+    pub const IORESOURCE_MEM_64: Flags = Flags::new(bindings::IORESOURCE_MEM_64);
+
     // Always inline to optimize out error path of `build_assert`.
     #[inline(always)]
     const fn new(value: u32) -> Self {
         build_assert!(value as u64 <= c_ulong::MAX as u64);
         Flags(value as c_ulong)
     }
+
+    /// Wrap a raw `c_ulong` value returned by a C API into [`Flags`].
+    pub(crate) const fn from_raw(value: c_ulong) -> Self {
+        Flags(value)
+    }
 }
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 3ec897709e89..19a219847c17 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -17,6 +17,7 @@
         from_result,
         to_result, //
     },
+    io::resource,
     prelude::*,
     str::CStr,
     types::Opaque,
@@ -439,6 +440,19 @@ pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_len(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns the resource flags (`IORESOURCE_*`) of the given PCI BAR.
+    pub fn resource_flags(&self, bar: u32) -> Result<resource::Flags> {
+        if !Bar::index_is_valid(bar) {
+            return Err(EINVAL);
+        }
+
+        // SAFETY:
+        // - `bar` is a valid bar number, as guaranteed by the above call to `Bar::index_is_valid`,
+        // - by its type invariant `self.as_raw` is always a valid pointer to a `struct pci_dev`.
+        let raw = unsafe { bindings::pci_resource_flags(self.as_raw(), bar.try_into()?) };
+        Ok(resource::Flags::from_raw(raw))
+    }
+
     /// Returns the PCI class as a `Class` struct.
     #[inline]
     pub fn pci_class(&self) -> Class {

---
base-commit: e6a2c988ed96a5a3af51ed97ecba980521bf2fc0
change-id: 20260907-pci-resource-flags-b7addba0b34f

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

