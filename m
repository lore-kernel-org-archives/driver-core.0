Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E073B3BF5
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374313; cv=fail; b=DS8TxWkBAuhU9hnoqwoGg5jOLqScafDworTdMkBj1jUzPDdqPJE62sj21kzi9SIy+TF5cs9ilXsf37cGTgaB7CqaceMQIO9VtGmJ2SG9OEOC6LIhzhwdsIc4jvZ7a1XISzOMsUhighjDCRs5CJGXd3vjQI9I0RvLBO+FPITPbuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374313; c=relaxed/simple;
	bh=SEQ/HQV+EM74N4G9UZq41uuUi7qUnVQo4+rE4ktseBw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XiFF9fohV1Y2mybH2VMSfEEHW2rY8ZgNwtos+8f+CymuDelekADDhMtw0Mk0NOzNQObIhZ4AdcSGxqTqt7AN4ZnvECuL44ISdtgnJ2/42P8WHhERAE0rzE8QhDEYCA939tsqgRjDX8Sdq2/oVbLKfoxcKZGdI4K2KgqQj6+QYok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kUroVlij; arc=fail smtp.client-ip=52.101.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kUroVlij"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eltKtNvMpLaRSAWfpvRAIFDnVYxxtpPAq3xp3tg81huLKwdiLvGcGksppPKRciDxouL1vqbxsEX58WWdYsTsSpCPvgO9Fwv7MX59NiBqAvxjl68EMtx7iv+A+dVPZfeobyGAznNrIHdek/n1yqiLVcj5jjNzp6U3fbP0bcc9v1XyUxwK18wjL/p/NXv/Y8dWSIlEPtUGBbB4eiSRqyszyz0UlwC0MptZUVwSZauY5HRQkyefeYRFmlTZkm2y40Aj3B/EFrdA355HRKDWBJqFDEcS2CAevyiEoXKk6qV2rzZx1INrDfbr0023VQYYEKBiZwXfSmzqU3+AJamZd0yWKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4stL18ENl4kyyi2YttVLKcerQObHDaOXVMZuzixTDQ=;
 b=QzsfYClKm4sE6Me4Scaxaqf6aUuADQex8idLn5dLIDeRfa0kbZ90lNN9WfA/sv8hTg07I/CpRrYe2kopevzP+oPXqAGX84X+9OKYD4P/PUPkEdpfzyOWTQQqM/kWum10q8JPP1kzaLZLIUS3LkZnMreJnLgObkfbPgQM9Zxy/T4Iw7aEeUPRDsgV4cdagScLcssVtGjqdDdwQYFDyvP8YDAxL39FbmZVWf3J8szmdIW9oVVexos8lMguKEeA6nmL2t6TH4pvC0+KrOwGHJ7SbhUkZdN3OLEOc2JYXfgSS36vrMXAN2lH5RjFmILvCdsMF79PbUEstea3HR7fpykkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4stL18ENl4kyyi2YttVLKcerQObHDaOXVMZuzixTDQ=;
 b=kUroVlijmTlswgY0i6BVZJIdfI+SeXWeMWT/Ojt/JYUaDm4CvpH8rf2fjoOxUiBgE3dc+QJ/hipVrN4msepyK6L7Ze/DGGKyuGWEhlHDHNP1NGYdrZtoSdFGeMksGQxEJZYCu43KIpiDIEsMm2o+RNB+69gUWR5s1GVKrXhqHuxp8WMT3dInnk8jtnIfgiYSEUEpeRjVz6Bh62aq9f5fvVQzqp1uSC/zUdlPUKDMxhUNp8UylB8JFAlfHZLJ0mh8YC5MUy9w68xa5hB6QFYkYaDXnNaptQ8EDglAM5cCnlKsimMEP4ztrfh7WjraO+ZYwcK/glFsJ35aDOIraJz4iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:04:58 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 15:04:57 +0000
Message-ID: <02e5d090-ec8e-4f73-a298-3439e2a9ba37@nvidia.com>
Date: Mon, 10 Aug 2026 20:34:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: topology: add source check in
 arch_cpu_idle_enter()
To: seanwang1 <seanwang1@lenovo.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>,
 Beata Michalska <beata.michalska@arm.com>, Xuewen Yan
 <xuewen.yan@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Yunhui Cui <cuiyunhui@bytedance.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
References: <20260810102006.9986-1-seanwang1@lenovo.com>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <20260810102006.9986-1-seanwang1@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN5P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:263::14) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: a04335b6-92d7-4b67-5b21-08def6f0be1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	HKg2K/FnbK9V5mYIeKOX6b3DWHitH7eheWdEd7Yg1nNe5YJyUm1Gc43S9zocr/dNDwdBKfElMtdrdolzlPgDLCocoOLaIIYWQiLCdOajxWgE8pSHIcUaRFW0pFBqH08WseKDN0N22Yeap7CsRYEDe1avtr/OV/pEO7xMfmEvMeEF1Nrhk8fI/KOlI1Ofl98GNelsxbmv0hu1gGlHJXLEV0nCaVBdLipu33tMRp9s4yZ+xkn/7yO35uqUHG8gQ7OhlQVqVnIq0z3/L35PQOzFzzSe/cjF9zFxxfnIQowNhcDGXOotlaPvdGrhuZRpsUCvcUD3z5JUdfa5EmRgZabA5R8fDSx+L5PieckAsFAbV7Xfvy3vYPuUXmScPXQ+9k5Zil7POjtbhIOIzQWUUttflwFigRcDQHQpFAjqN0XFk8BJIXZ9tTATMmOy009TmJDJ+daXzdITIFT3g00kZwgGHsIew5ETnHrFYQVQuexmC2zUvQGY6Avb42RYl5U5FRDZYoP7LdzbVfgkEqNFX5AI00VjZKf6ZWo+YzStXchzhRDEQGIvddXsji9Wo6qp06GU97YnJukAy5xYQ4/Hqqpv0YZTpXorBxlYzDmO2OLI5xy3QpnwXO3WNUsWX/F2gDPT3lcuhIu9sg52sUO7elhkhrZeVt6SLECYLNQmt0WQBX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dCtxWkt4NjlwNWNoQjZMNnRSL3ZEbTg4RE9yOUNmK3NhN2Vvc3NpZU9CVVRB?=
 =?utf-8?B?UWYwcGVSd05HRzlJbFBtRjhOaC9nbjUwNDdQMlY4TFpVQ1VaYmhrQWQ0NTho?=
 =?utf-8?B?dWpOYy9aaEJXT3RHaGRxNmpEWWFLazAzcDgzRG5xU0xES2lFclBNeEUvWVRu?=
 =?utf-8?B?UWJ2bzNoekVGMUhCaTR3aHhuU3FRY2R1T0E2MnVRZExpMmwvYXNsT0ptTGZm?=
 =?utf-8?B?OWp1bjZrQUVobDBsdkhudVM3UHdhcjVTcTl5ZXhlYmkrRlRuRDJKVXhOV2lU?=
 =?utf-8?B?UXNoNkhqSE8vUlZaeTRSVGFnZERSVGpCM3RHbFFrSzBYaG1KMkNMU20zQXU5?=
 =?utf-8?B?cHN4M1BibEJoY2JVYklRSzkzYUp6anRGVjZjbzBQbk95VjBobVpFbEhhc0hK?=
 =?utf-8?B?c2UzR0N3LzByTlhPL3ZBb2N3TkNLbk9OeFNWajJxVVZySGgrVG9IM3hHTTFB?=
 =?utf-8?B?RTBMRHFEcERzMHBZcERrTGM3ekpoaUl1WTlzeDdPYUlabU82VmxhUlpVY201?=
 =?utf-8?B?WXpLa0xRckovb1VGL2ZJY0kweDVrbk1ibFpHdEhJNVRLQTlCbWpYS2JaS1lt?=
 =?utf-8?B?a0tDV2RYZWJ5anhoQnpWVVF0Wkc1QkpaY0FRbTRXVVphZ2xzYWJZTEtHMkF3?=
 =?utf-8?B?OWkyTENvanY3TitKaFNzSUVGVGU3L3BCcGtBUWpFMnRqVmdIbFhzY1ZueDRD?=
 =?utf-8?B?K3YyclBwY3dCTWQ1RXVoY2trWHR6bVdjNVd1SmhwMzRkaGRQaDltTEdYcEo4?=
 =?utf-8?B?WXlDNXVGSDF2K2RJelJLdkhubmxGN3dXMWtwbS9XZ1U3OHZIbmR4K2RGQnFX?=
 =?utf-8?B?YTl1NGFNaWtrWFV6YVFVejQza0k3emppNEVtSkpNRkxrVkxYOG1jZTFGRXo4?=
 =?utf-8?B?RzlBcko5TXdSNDZ3bHBadTl1d0V5UUYwU2tyeS82dUZ4NG9RU3R1cXlYMGRV?=
 =?utf-8?B?aDZjbXVnZXlRaXYyTXhnMjJGZzdHbjJiSlNOdzVpSnpXT3JvM2YvYzUwWU9M?=
 =?utf-8?B?OXltQWx4U1dyRFNpU3NVYlpqVGFVTkk3MUZhZCt3VjVoSDlhOWxPV0c3VS9R?=
 =?utf-8?B?aXI2YVl3aDgrQmtxSGsvNTBuWmptZmZWSXFmay91ZFltTDhKN1M3YVZDcGYz?=
 =?utf-8?B?Z0ViK3ZEbW9vVVBITHpVNWJVcm5FcXo2MzJGd29Dd2p5MER2cEJieUxHM2Yv?=
 =?utf-8?B?K1hMQmRhYzdQWXdWM1l1U2UzTzMreGx3TE5CaVp1V3VUNExLZndlU28wZ2Jk?=
 =?utf-8?B?Zkhqck4zdXYrRjJ6YytyS2dDdS9UcFFsN1pFVnVORi9jeVVscVdCWGlDckM2?=
 =?utf-8?B?UGZ1a3RwdHBpVEtvdVd2eFdPMkxYbGpsQTdCV0pDNnZja2lyVE01bW9qWXBH?=
 =?utf-8?B?cUNCY2twV3gvWDVYV3E1M0NwOUpUb2VVS05OSDE1WHJXcVNaNDEyb3A0QWds?=
 =?utf-8?B?Q3F1WjdDMVcwN2lIQlRiWmIzcFllWnRxSUlPUEx0YS9wUHducUtzT0RCQWdU?=
 =?utf-8?B?MzRRaDU3RkRZWGM2N0FNSGs1V2tnWWVNTXlvREdOMlA1bXpEY2VTQzBqRjVk?=
 =?utf-8?B?OXNldWdyRWV3aTVNQkhvdjh2QzJaOWMrL1BFOGhLeG5IV2JBMVkvWE1lQUF4?=
 =?utf-8?B?QXo3K3FsSnRrYTcwcXU4eXcwRHNLbUJ0OTZPaTBscFozbFBNaW9ZVWtLR1lr?=
 =?utf-8?B?cG80VUR2MlorNWp2L3pkdjJEU0dLTEJWcDhUUy9WTzc2QkhHeUxrMDJuVXBE?=
 =?utf-8?B?eTMyOVU5UjJYcVQ1TjdFZUxJUWZpZTFialpEUUkrdFl2ZG5EVE5yQWJscVBj?=
 =?utf-8?B?bmdMTDFoOUtpaXp0SDdQaHNlTHhJekVCTkxFcUFpc2RDS0lTR1g0ZTFuV0tn?=
 =?utf-8?B?SUlHRVFld1hIT3EyQkcwMmIxbDZqVG1EYWpEemFlTFhmSnBYdUlhb3psVml0?=
 =?utf-8?B?dFduTm1sTGdCbHhCTXlLbVRyc2NqejBYWVp0U08xMTdGN2dFYjZYbkZIaEhx?=
 =?utf-8?B?Vm9nMjBaaHZZODlMM2k4MmVvV1RydzBJWDgwUGM5SkdpeDB1bVlvTzVDQ0Q2?=
 =?utf-8?B?c0kzYzdqOGNqREQ5UGlHZHNuOEVCY3NIZ0FXT2Z1RXprblpzNW44WDBZQnJB?=
 =?utf-8?B?ZlRMVWVXNU1ZMVRHa05oaUpQWVpnSVk1VGdMTDI4eVY0azBVOEhvd3Fkd3FQ?=
 =?utf-8?B?cWV2T3VWeUJPRnpXeFk5cTYxOSt5OW1ZZ1RSWmJkMXJUbnFCZXU5UFZlNE9Z?=
 =?utf-8?B?Q3dhQjU0bHFLOE5tRDlGcFIxbUlVUGgwS0hPOGZHQVNXUndNTkVITjY5V0xY?=
 =?utf-8?Q?Lta5+n/c4xLoZelNUW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04335b6-92d7-4b67-5b21-08def6f0be1a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:04:57.8409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01DxtTN9RIfai/FNxyCw9KuV3Zmg648th1ZsNgFdfxczMs7xLuVL+3eEIPiUqZDA/1HhsBt8VVAboqI6wTF0yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124


On 10/08/26 15:50, seanwang1 wrote:
> External email: Use caution opening links or attachments
>
>
> arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
> arch_freq_scale when a CPU enters idle. This bypasses the sft_data
> pointer check that topology_clear_scale_freq_source() relies on.
>
> As a result, even after calling topology_clear_scale_freq_source()
> with SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling,
> the arch_freq_scale value can still be modified by AMU counters when
> the CPU goes idle through the arch_cpu_idle_enter() path.
>
> Add topology_scale_freq_source() helper to check whether a specific
> frequency scaling source is currently registered for a CPU. Use it
> in arch_cpu_idle_enter() to verify that AMU is the active source
> before calling amu_scale_freq_tick().
>
> This ensures that topology_clear_scale_freq_source() properly
> disables AMU updates in both the tick path (already handled by
> topology_scale_freq_tick()) and the idle path.
>
> Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Sean Wang <seanwang1@lenovo.com>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
>   arch/arm64/kernel/topology.c  |  3 +++
>   drivers/base/arch_topology.c  | 14 ++++++++++++++
>   include/linux/arch_topology.h |  1 +
>   3 files changed, 18 insertions(+)
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb..cae5da68d5ec 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -173,6 +173,9 @@ void arch_cpu_idle_enter(void)
>          if (!amu_fie_cpu_supported(cpu))
>                  return;
>
> +       if (!topology_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
> +               return;
> +
>          /* Kick in AMU update but only if one has not happened already */
>          if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
>              time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))

How about moving it into the condition below, so we only take the RCU
read side when an update is due rather than on every idle entry?

     if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)) &&
         topology_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
         amu_scale_freq_tick();

> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..dfc2574a5588 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -127,6 +127,20 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
>   }
>   EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
>
> +bool topology_scale_freq_source(enum scale_freq_source source, unsigned int cpu)

%s/topology_scale_freq_source/topology_is_scale_freq_source/ ?


> +{
> +       struct scale_freq_data *sfd;
> +       bool ret;
> +
> +       rcu_read_lock_sched();
> +       sfd = rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
> +       ret = (sfd && sfd->source == source);
> +       rcu_read_unlock_sched();
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(topology_scale_freq_source);
> +

Do we need to export it?

Thanks,
Sumit
....


