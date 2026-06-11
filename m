Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012001.outbound.protection.outlook.com [52.101.66.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E03338596
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.1
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173897; cv=fail; b=gSQduYCBNsVXHHu1S/FpQ8FCcoFpEUS9pcY5ooRJezp0zZ1X/yDznH85Airl+XRX1kRDcg5wJ1NPyzTOQaSlO2iOM1MFZOTPpd0tmo4hflXWUlVPwzkOI0cmA6+4FWX/0hgTwD0fZ5fcHn5U/ZObvKlLasqGRp4DdiUYwgRiWsk=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173897; c=relaxed/simple;
	bh=lQXQ+r/cIo6VW2oG8vL0UQVcQl2+4Amm5YjkqDTi8aQ=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oaL/Kgebggie3xd1SIOdGMsIuIv3o22TvtJx8PBG1sWE22E6ltELI7tdYQxT7PVv2DTuuVfk5A+hDej961kWa5acSIo5rmTnBZKyyumVeLxp8uLmUQk1XXxAttq6XLmbqj2CBtBoDpmmtjt9jmCWN9q0/4v/czLXsqoX504oGjw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ngF+Gi7L; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ngF+Gi7L; arc=fail smtp.client-ip=52.101.66.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ngF+Gi7L";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ngF+Gi7L"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w4jaX6DQj8vl7tVG9MC6OEb5KN9uV6S5LXiPQ8k1B6TUi6r205GTgC2en6a66lJk9aArU0a0KYCYf5zKQnI5QnXBSHu0/Ejg3UeK2BBxoJrWFxx4tRDcahV8hpIB3x7YUYimesVTuxcG4bNdQ8s2c/OXCYsGGvO6uEhqho3cP6Qi2doWxjj8ChFMostyccml32oNhickr5+Kaou+gHqxZbT4lxa0S1Qz1x/e0aARhBY9c7k6/rT3k381liICf+EWbcGhnt4ITfwxRCOjg4yeozaz8/sqlyPOZLzIxvJzqU3uZ2Yy2XzHZMMC5HCLSkB7jJ5x76jkOsYEXt029KdhdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPzvYuijoSLmSvj1nN0+w/jLhJS8EC0lHm+W3NGSqQQ=;
 b=Kj8OkIPm+8pvdKh4bscM5z4LbomM2MPB+iMDXuxDaqZm586GPl929VV7/sc2nIDdo62lfoq6SOennOu4EcUHxXM2Me5L78uyxDCVGNX07rB0jf6o6ibvucm2E12AT38lb5dc4hjEIROyvHecCTJXWgkipm/COKgH5gWXWBRILIdzPBkMvH2N9gcKanuujVS1NoVqcDhXSL4cxN+azaw6x+HdAnFldlqDUfsuo3vHgmUKNtz/FwwBZ1vH53XTvlbIRNoBZuuz5l3USfChzqQO7OBAGT+Gu1QH6VSITXTODPVgwhWm4/bS6j+It8UyZdiW+KhB+td9zFbL2ZsVFPpaVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=debian.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPzvYuijoSLmSvj1nN0+w/jLhJS8EC0lHm+W3NGSqQQ=;
 b=ngF+Gi7LVTtEfG8dHQoGAVq0Uto3RQbAseS1WrWrFekM8oi4DQN0drIGAubE2KAey37oUaI84hSR4HKbbwVmQXJ6tqSioqC25BQtvNFLR1ISKBEdoIhCowgDIsq/1AHSJPj0vOrB+RI9tEqgUyaJ0+ieQ0ShXBHBav6AgpVPw9Q=
Received: from DUZP191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::11)
 by PR3PR08MB5723.eurprd08.prod.outlook.com (2603:10a6:102:89::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 10:31:30 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::2e) by DUZP191CA0071.outlook.office365.com
 (2603:10a6:10:4fa::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 10:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Thu, 11 Jun 2026 10:31:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABkcVXsVgBgPHqsct0MFGy7KoPqINS28EAZRy3aNxcw5zqTesi06nFo/NHgVYq7T69NFhqkxKtQdr2SnpxZpgPcA9SwP/G00F4RvgaHpVGD7non7cD2GSEOo6LjcQiTdOY2StJozGGGdSPGRe3q2VIpzfC25i2R/dHXhTWAOrxSXFi+Gcd8dexn/OG3n5LallIw+pIWtxrGlh6jKk5B51YDmItI4eF7xB6V/40XUUo5XLjbMuuqN4IVpHgnGuOFCi4y3XUzxh/rywkriyo9NpEi59R3/cli7q5HPFuu7sSVgX1VFoij55dxWMRRAuTgjdGYkb8BTmURqlqB/iO9aYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NPzvYuijoSLmSvj1nN0+w/jLhJS8EC0lHm+W3NGSqQQ=;
 b=HwPjot/fhxA2YOIqZ5yFqCn11cMnBBFXpob6/zgyEh0lc/YAodJb+ODHEk3nz/FrnFJhyhBz5bFxVBBhdv8usU1CUEkoUe1+vSHhw5zaE6/rbTV3siTF0bdPeSrzpxyvQDXI4tvR0kEJBBB63hO8IF3zuSfN5JqRGHvB7f8kO3xK734jk//zkkMSXydt9ULke7Axsz0PNQrYlSc0OCw6ppWt5TvocZpCTLpNxNXDcXaF2M6p1fsxw2unc/wuq3jQMLd1vsxhmdqY6CQrdvhvqz8iVsEORF9Ih8HSjFl420/rSEUGfwx+8ZByUZiv0qyMeRTIJBY3boz+UErjEKA46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPzvYuijoSLmSvj1nN0+w/jLhJS8EC0lHm+W3NGSqQQ=;
 b=ngF+Gi7LVTtEfG8dHQoGAVq0Uto3RQbAseS1WrWrFekM8oi4DQN0drIGAubE2KAey37oUaI84hSR4HKbbwVmQXJ6tqSioqC25BQtvNFLR1ISKBEdoIhCowgDIsq/1AHSJPj0vOrB+RI9tEqgUyaJ0+ieQ0ShXBHBav6AgpVPw9Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB10391.eurprd08.prod.outlook.com (2603:10a6:800:20c::6)
 by DU0PR08MB7948.eurprd08.prod.outlook.com (2603:10a6:10:3e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 10:30:26 +0000
Received: from VI0PR08MB10391.eurprd08.prod.outlook.com
 ([fe80::fa6b:9ba8:5c2f:ac91]) by VI0PR08MB10391.eurprd08.prod.outlook.com
 ([fe80::fa6b:9ba8:5c2f:ac91%3]) with mapi id 15.21.0092.017; Thu, 11 Jun 2026
 10:30:25 +0000
Message-ID: <437997dc-7ad1-43dd-9626-6cad37c5258d@arm.com>
Date: Thu, 11 Jun 2026 12:30:24 +0200
User-Agent: Mozilla Thunderbird
From: Pierre Gondois <pierre.gondois@arm.com>
Subject: Re: [PATCH] cacheinfo: don't propagate DT/ACPI error when arch
 supplies info (arm64)
To: Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
References: <20260609-cacheinfo-v1-1-35864c9a8f0c@debian.org>
Content-Language: en-US
In-Reply-To: <20260609-cacheinfo-v1-1-35864c9a8f0c@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::6) To VI0PR08MB10391.eurprd08.prod.outlook.com
 (2603:10a6:800:20c::6)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	VI0PR08MB10391:EE_|DU0PR08MB7948:EE_|DB5PEPF00014B89:EE_|PR3PR08MB5723:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc96ff5-aaa9-42c2-5c07-08dec7a499a0
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 KPDOfuI7sfrLckOFhsKnVlQOY0JecQoyA4h8LsADMjFhlZnPTnPMbg8PHgaMQRPZ5wH4QgCOvqrYWQlk6dxdkrfX32eMBdao7UVGtNMlIUtUeC+JZPz8l67iOOxIq07Go3ZoHumKVn11XPn2Do288STG9EKxMebQS4EPOdppCu1yS73hE0tdS6KicAbcSe6Ua7TrdI1VfdoNG0EOzSehLQQTXd8Hz5phYw0qLUotpSFL0TKSXcNlecLuGMXFvzfrjl17sSK+SLO+t7jK+z8I75dpEnbBMAj/XWtM5rueChWkROnFzBUudfL6xZDjihp/q7HoBmuIpde5l3VOLVvj4ud8FBsyZD81lcdqZFPTUVE+Inh7TTileMNq7/awqvK1T78prBopQbe8UR5E0HHUd+2lpyi5LBNX7cEqzr0LYtsxbP1Yv303qGHRxu/nk2FCfk0iD/mTBecjump5DH2n7y8mU/0l9gmpGc4F+ROLXjFcfKYG+z9xrylVyglpyVYYfvnMOWd6mIKOcyfJEUqqjxoaavzen608BZvUcWy1MKlaFe6BsH+m27s0D8ik/ath+wMoVkuT7uAkG/PdVfsdWW7KTVgWkLLwWIKupneGQP0fROVqhbGNDLa+J8IQOSdUIJjiiHAcdhDe62Uea1iS74/VVg+dY7koP//nLMmvqhLaHf+rDyuYijOxMFzgSUcH
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR08MB10391.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 cCgeuvzE1AIP92qceSKMubxwCSmyjzd3w7rBRxOlMmIPV/ogH3yvSNsC/+jC8EbG97Wjq76yU7BBIZNsdFFbVGEmuVfVOdLcIoERyS2P4itw+Dq+/NexXIvHlkmlgUNqqrbbBO9d4QYAIn39eHSHV533UwP3qYQ3Fy1ch//GuWMzfJHMkeh0aaF/3Hu6qxsNEFtaYdo6fIxsufOpEPB8kD4ZEpZ9fvb00FjS+C0atPuCBh4ssselHiD6khlCmQIrjDGAu5fVLT7vQeWAT+MBq+SMrrpA/+9A7A2osh736RSt0COQa4UoTo/4LxgXJo6Wx4y88WEgFpcqc3/76evZ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7948
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27a5c99e-545e-43fe-3872-08dec7a472e6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|14060799003|35042699022|82310400026|1800799024|36860700016|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r3NV1zp3td+PKhk4sUUpU4nbc0TMa7Vqsf+bAwXqh+/hP/FwSiKxpa1pFuqMmrKFdQwFSBpT/ShMNAJkSzs4I6IM7wLemSajAN78W0FRFoKNxEqqniTNVyqKqiCf7vZP2Yn6/mDoLq8kPROsL+5yh1R6R+wCMUqmz7e0SgSxazj5z/g9xS3MvbmsJ6BCNrinKfSH65fajNzjlNZmzVtQ/KFlp0OtfS6sBEJ7Ir6Yb9/nYl9Dot/at747qSdZSYrjcWm24l02FpqdcS3oewV5Tt9g4eXhQQNnxY5GyYv5W4wPQJNqnkfz7cDLewDBrbLI0XH9D5WWCuNOMC35xDu8xTaJiKUj6UcV9Vyevrfb2ZqQAA3kL+mH7onHj4eGcW+BiCbTJLTJ2CgwBxdgqH5md+uTofooF3e+xAJg+gNsfVmLf48hjEeJN2QJY4jiiclW0IXH69fpcVmHp8RLlZkgYsEzPeebzdR69DOtNOJgGTnv0L8BCqUEy/aq7VAtetrWyoJVKne/cJPjehUQMNs0DBzGPEp55m+At6v7YMbFAaQyD6ars9Y2/zWFYKyeRRs5h/Alc9rbe7thSHYJiOTWQt6lh/b1a+ufTaFfuTYkKHkK4JCVUdWDnaDOwh+jO/4PHIRDVAxBcSf6zMulxgxqSHxa/pyazE12YFH+9sYLcEhjkAaduCQKTkeAbKsOr+Xno/nws0rkRLqWnzXQvkoxL3TnGwZwFc+NEXi6Mc2MVUo=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(14060799003)(35042699022)(82310400026)(1800799024)(36860700016)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8wwYMSFbdc46R9eD+lIlaA+kXMsyqu/7Il6ieIuSFSyS+9UjnvrDwuvMYTdl4WAvHL0PFvqeIITAR/YNlGVrhjFbqXwCwaJotwwbOrK7jjcz0Ve40MuWRiH3us8a9EcVaAQfSwY3Vx5JJkW0w9IaGwu37nHwKhyu7wiBld7ExQqRn7QKOxdauHVCzG+2I9PWg93dFa4BWo2XiYIVWUY1gOuMaxj/Q/MuVfvsK8WT877mk13CQHgbZAQa+YsmqmZn/8RQ70HQ3LLqhyfycJDZ8Nkttx1OgplvjEkAKOrtCPtDH60LpXGx4HFz78+ofeOqLke0itOJ+Dhl0LLyzrGfN51jtrpYKr9RKbr4KKvJn6C76Oxqpu55cTKGtjL+lN0jzYhIoU8NZOYvidTkiarXP0fjTIBKj3X8jk5ygJf275vRkHVEauLPnP/MCsQjOMN8
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 10:31:29.8179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc96ff5-aaa9-42c2-5c07-08dec7a499a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5723

On 6/9/26 18:23, Breno Leitao wrote:
> cache_setup_properties() sets use_arch_info = true when DT/ACPI
> provide no cache nodes and the arch can derive the topology from
> CPU registers (e.g. arm64 reading CLIDR_EL1), but still returns the
> original -ENOENT. cache_shared_cpu_map_setup() bails on that error
> before the new flag can take effect, so the first CPU brought online
> always trips a misleading warning:
>
>    cacheinfo: Unable to detect cache hierarchy for CPU 0
>
> Subsequent CPUs skip cache_setup_properties() entirely because
> use_arch_info is now true, which is why only CPU0 hits it. This is
> reproducible on arm64 with the QEMU 'virt' machine, whose default DT
> has no cache nodes.
>
> Clear ret after setting use_arch_info so the caller proceeds and
> populates the shared cpu map via the arch-supplied leaves.
>
> Fixes: ef9f643a9f8b ("cacheinfo: Add use_arch[|_cache]_info field/function")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Cc; hruben@meta.com
> ---
>   drivers/base/cacheinfo.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 70701d3bc81c..4e11d36f127e 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -401,9 +401,18 @@ static int cache_setup_properties(unsigned int cpu)
>   	else if (!acpi_disabled)
>   		ret = cache_setup_acpi(cpu);
>   
> -	// Assume there is no cache information available in DT/ACPI from now.
> -	if (ret && use_arch_cache_info())
> +	/*
> +	 * If DT/ACPI lacks cache nodes but the arch can derive the topology
> +	 * from CPU registers (e.g. arm64 reading CLIDR_EL1), fall back to
> +	 * that path instead of propagating the error.  Otherwise the very
> +	 * first CPU processed trips a misleading "Unable to detect cache
> +	 * hierarchy" warning, because use_arch_info is only set after the
> +	 * first failure.
> +	 */

NIT: Maybe the comment is a bit long/verbose,
but maybe also not worth a v2

Reviewed-by: Pierre Gondois <pierre.gondois@arm.com>

> +	if (ret && use_arch_cache_info()) {
>   		use_arch_info = true;
> +		ret = 0;
> +	}
>   
>   	return ret;
>   }
>
> ---
> base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
> change-id: 20260609-cacheinfo-b2a8d27a19ce
>
> Best regards,
