Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D4406269
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488525; cv=fail; b=XLb2Fu6rLRcP8Lbz2F4JpHeHOLch1odWGt/Lnij/2qeuO4e2slhkHE15pxRKSPzTeXuFQvsSqgykXaNAjMC0TTLHUgbzw9pwqvXMI0jciI9pJCQvOqzQVgLVMEsFyB5JVZPpi2OakzU49k+eeAyq4UG3GkiRh8Lu2lHDZ80YqwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488525; c=relaxed/simple;
	bh=MEww73xE6tsSAtf0vQTZBkI8DFIVSuVfcrbOPnpeDPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=APqqREqwI57jrXuqU99JKnEqoqYHWiyJ3RXbqxvFfkjsd8R5cheJITW5rYZ5NAgirhOuTaBwUAEggyFNkTbjXYAwxe11XY5cKNV+L6EokIjLB3MgnUHjP1wVToPeK3kbdojTFFUhv9D7Ib11RQi3xdbOPvClOEx8+nXWrAJUHaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z1ySL211; arc=fail smtp.client-ip=52.101.46.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z1ySL211"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msDXQ66WMHVPci4MjcGtitQ283oWDfCUq7Wj5x72FeKjbJDYZFdBzMKGBIJOuf0KKw9HmSUuqZDw7hE1ugsaDEvqiLK8FBBi+J6E0n/TBkEjbTs+LBz83+RHeu+HB+zuiDIbcHEhR1KjSswMKQWHQjyHSnxvbjduJFZ1GVp4AmcEBzXnplQg6AdRZvMKfl3jsRezuOsVjf6Y0QkHR4LI2vdZ48cYnXYt/9UJIDu0tC/xnX9t63mO/x1LyPq1anLF+gOERPtDrWMIQ6UfbBBbzXrEVK1ZAcj37iULxam/BXa7oA0K27QeNBgJoAJF6I4ZobzUaEz0NLb32IDSVYjSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7VdYid/QSljHyFcPAqgqXv2dzDepeb4AIAjIfcLG0Y=;
 b=v5IPVHQqTH0bf1rD0h3CTltCTK8PzlOTWMLSQM0Muq50uU7DQZr9oILWEBcR88fMSJbQPa0Vi9RTQnUljXMdhPx5ypJe5PIjnnYbsq1mBzg8+A7FSQNktBRsqwVwNfHjO0DzWvQL32wpQ6phDK36c/xv1QOKgvG7gXhYBWzju1Xrjj594pDZhrTE3dO7HnjmyRGeUeCptdOEybWgcbVrcc6cwdjLHb7atOSlCMAyFKT++jtZoU4Ht6bQ56rBjVz0SCUwSd+M5+/lmM3GPw7ZdJzbXyLOK92iTbqa7biifxoIlc3vpVtmzd/C5Peg5+H0T3pMtyiKzrNPE4QLOSkCTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7VdYid/QSljHyFcPAqgqXv2dzDepeb4AIAjIfcLG0Y=;
 b=Z1ySL2110/Jvsbya9Gk/gavD59at/F1492afqpEga95JizI+eSHJ0pmJuD1SNkDH/MHZKBViAN2O5N9VeJtmOuwWu3kq3Wm8bIjFERK2PSVV7/4Ay65pAig67lDTwdJRyVMkB9gTySDonbTwAR0IywjFQK8IP3qvqQKQavVZDtQ=
Received: from PH0PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:5::31)
 by CY8PR12MB7538.namprd12.prod.outlook.com (2603:10b6:930:95::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 16:08:36 +0000
Received: from MW1PEPF00016160.namprd21.prod.outlook.com
 (2603:10b6:510:5:cafe::5a) by PH0PR07CA0026.outlook.office365.com
 (2603:10b6:510:5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 16:08:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MW1PEPF00016160.mail.protection.outlook.com (10.167.249.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.0 via Frontend Transport; Tue, 15 Sep 2026 16:08:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 11:08:34 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 11:08:31 -0500
Message-ID: <e6f44689-e5e6-42c3-af55-d19c2a22575d@amd.com>
Date: Tue, 15 Sep 2026 21:38:29 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] sched/cache: Refresh LLC capacity across CPU hotplug
To: Davi Chaves Azevedo <davichazbh@gmail.com>, <peterz@infradead.org>,
	<mingo@redhat.com>
CC: Chen Yu <yu.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Valentin Schneider <vschneid@redhat.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tim Chen
	<tim.c.chen@linux.intel.com>, <chen.yu@linux.dev>,
	<driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20260911134825.420748-1-davichazbh@gmail.com>
 <20260911220229.1368887-1-davichazbh@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260911220229.1368887-1-davichazbh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00016160:EE_|CY8PR12MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af1bc23-b59b-4114-043b-08df134398c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|7416014|376014|36860700016|23010399003|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	h2wcnOZXDY43N9UQ6BiflInUr51nMCwgJYMDHmWjocJl5UKazx519MfWBouMGzjgMqiB2rLunsJyIjdBxeZUw912d/YkLR+pRhUcZJEDpAg9+ud/qmG9cOzyJiTfQSV7PDmUAVijYnz3FAJz8efgaV2lHoMB96qqPE2nZv6hQLkvh4Fhlr3aTOjBYieff68pua2CZzfD/8PbMMeeXbjxD23u9M6Dnqhkv81dXqt6uRlVWz7A0RB73jJyACI7h+kIuhkkMGjQ2xEVwkSY/pOixVEv++Av73R6iZKOvh1DwxAle3+SD1PuN6vexJimjQBkFG3n2eEKXXvR84IwMo73VxxKFZRRyE1Sr9iaKcYc3yWx+TmX30AMbCKusqgX0Fbp6MmlYVcPtQxLVeiEJG9h0QoBFxmiF0X28wWHdbi6FYbcEbHnyFqGNp2pECadGoceAYv6ElMsEbz26iYYFLJuRE02SO3G8s37U8SSNYmKvJr6L1vLu1zmCZHtFPgxei0HsanncV/LEJDNxOEmbenfjZ+lSDyoe7mwGTHy6u8pye9TSDtIjo5O2FYswA0esWxeRlK3xENt67cGqw6VFB+U9WLl/PbYcicVqB5ciqhv5j8JqjqKGYoAynZM2LvC3114jQh5HByC4ZY4ug0pVGDHzt6L9l+4Fu6qyeM4DhxTc8lBSOnQ/9kvSv5ns01Cm+5mSblW/ZisaPPLn/3dZSvyTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TqRzcpFslih6GuQ9aEcPWaf1/Bw7oAwdr+2UAe5u+BPqhdXMDz3FgcGzxCF3PDFk/xdNhgz6dUse0x6QaCC674ei6SLp+U2wsBzIup7de8imMudWUzWy85JHIiv/JZ7i4gJCkMbjuTw8g6BS0ECk9CPUia930y63jSnsmGX6vXhRzNIGwcol8nCcyoz77L85CQRvIudcaKUxVLF0BvNNBM6tYlnqK6EKOgNCz3l9956Syv23JAYKsC7FPbeFbzO2O3PVAsnl95TPoYd2HXs/FmoX+oxWIXTSo8cJ+Qn0OtQdobXuU94rxYFXmOhyVDqKS+rnqP26AFQOxWHYrN9yNwKcOzfb9FiK4qJNqPvfXNujJsNDc5XsI4arreUG99gAYbNbBmfMxx75XFeYy7hBJeLGfKQq79lnUGLtyV01xgfuM2gUQojuw0BHsZWWTiHQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 16:08:35.5395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af1bc23-b59b-4114-043b-08df134398c6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MW1PEPF00016160.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7538

Hello Davi,

On 9/12/2026 3:32 AM, Davi Chaves Azevedo wrote:
> The scheduler scales LLC capacity by the fraction of cache-sharing CPUs
> covered by a domain:
> 
>   llc_bytes = cache_size * span_weight / shared_weight
> 
> During CPU teardown, sched_cpu_deactivate() rebuilds scheduler domains
> before cacheinfo_cpu_pre_down() removes the CPU from shared_cpu_map. The
> new domains therefore use the old sharing weight. The later call to
> sched_update_llc_bytes() looks up the departing CPU's sd_llc, which has
> already been detached, and returns without correcting the surviving CPUs.
> 
> On a Ryzen 5 7535U with twelve logical CPUs sharing a 16 MiB LLC,
> offlining one SMT sibling left the remaining CPUs with:
> 
>   llc_bytes = floor(16777216 * 11 / 12) = 15379114 bytes
> 
> The correct capacity is still 16777216 bytes. On systems with active
> cache-aware scheduling, an underestimated capacity can cause
> exceed_llc_capacity() to reject aggregation for a process whose footprint
> would fit. Unchanged cpuset partitions sharing the physical cache can
> also retain stale capacity when a CPU comes online in another partition.
> 
> Pass the cache-sharing mask already retained by cacheinfo to the
> scheduler update. Refresh every surviving CPU using its own LLC domain
> so that each partition receives the correct share. This also preserves
> the correction needed as cache-sharing maps grow during boot.
> 
> Keep the existing CPU-hotplug and scheduler-domain synchronization. The
> update remains on the hotplug path; no steady-state scheduling operation
> or persistent allocation is added.
> 
> Fixes: 7030513a0877 ("sched/cache: Calculate the LLC size and store it in sched_domain")
> Signed-off-by: Davi Chaves Azevedo <davichazbh@gmail.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>

Feel free to include:

Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>

-- 
Thanks and Regards,
Prateek

