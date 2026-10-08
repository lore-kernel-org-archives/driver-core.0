Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D20F427FB2;
	Thu,  8 Oct 2026 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456640; cv=fail; b=YD9f1cn/HaUtgV4NdzcX6suBrcJEDQo9ErtDmKZt4BfprdxOxeoW3Pk+z7aO9SL2/wkOKATqiMYP07BVXsXiWPG1JevUeLQbIxjRgz9Uz3P83aF4GtmQ+vrFqt7ojTLWvS+iKjyO6VJ2sNpoapCfc34ekiLqLTfXxeOMc642eU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456640; c=relaxed/simple;
	bh=D/7KRlYcgg5E7HtN1krvGl8s7sBcryxjC+ZIajIjSBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FW/QCsO8Ym8T5QIi6Z5mhH06cjikzWmWFiE5PfVkAxpif+LbEJu5xwvOCcfX9NHsj3fiMSO5W0ryFcZQK0Al7mY/pq7J2enf1xIRFRkl0LxCd9P3buJNB4+YW7q+Xs1+IeBjAGW6HZ1by+3f0AHvVId6+547GMzUw+wIRz7mlTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=idgwcCOp; arc=fail smtp.client-ip=40.107.159.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="idgwcCOp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBxeC7xosA8U9wF38A2G8xT+DxxmY+W1DWb2A+9oCwSAFX7ZVyuJ/+ucbVAvsfDwOGKqCOBf0SWudHeL0lK9pgD5E0YTvaXhZBJfc3zXJNu//48D9ANnDUxlREo30ENLqxFDTQHiVkN5+NDx+bIxqk2JHQ5q+0TARaxVY2VmB3hsKOWw+ktcWy3mom1bQ+Vl74Ts2oZ5iSir8mVKKbjjIKYzdpzruxSRH2I2+7XB621jy5n8V//duOQ1CzkGT+YSGm9bhUzb4rpRxbHccffuzwHf3Qw9tD2KllhjG/thzywgjNePlT/JYkoYkOevtygyheF8ld1Vsh74UbIu3gTAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MeIhYu3/AGJfVVAw1V4fBUih+F1wZBNu8ihRQj5kdaM=;
 b=Ge4mDPYi2XU/EaEZ1aoDw3K1q7hUXZp5cnWaC7XEkFJKiZJgqm5sAe7kjF+wULDrkMXTtOaCUaxzOgKw7SqclCkgzE4ed1Eh+crauCaxRP3FZV34vDaXE61ZbWeOPwNnmLxCgarudnrpFMK7eKw/4MGvfmgiwzHqEiwESJ2VhBr+5BxW9V18SidrTdod1oX3peG/62Sarnv8G5m0RMWb4kxC3bhd4zX2zg+njTMWJ/pGbm2Jqq1MuKS9md8ylvjP4TrzGmQV7CHK0xsZVGovtIpnnWXq2tw5VKU0pyovzETlGjuUR0fPMWwpcH5JP8PguTzA5N4bmU+No7rKjMX2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MeIhYu3/AGJfVVAw1V4fBUih+F1wZBNu8ihRQj5kdaM=;
 b=idgwcCOpUQOuvf7RDCV3NMIsKdPhC9TLH/4U6uQ24nKu3Z8krkLjFfjIL4D1K8W54oHzYKqCzneojVHoLQzLF/mnhY0grQm8POoCRG59nWVELHAOiTIqXJPF2gbSmtkesBCc3eNiG4soZqYNYJnzhqLDHP+SLDsm/dz7YCmKXvy7tim/TNeqly1Gk8iI21RTw/NoybAUIyxG0ErVt0S92Waq+mbYGsP3en6d/rHkrWOs54nU0sfj32Ck4NnP6bo411PGpwH2SlsCaZvVaAf9/VEU6zq+dHLKn1HGspt6RWD4A2JkdFw05iN7SRDnBJ/CyNLvIxuhYTwfm6brFMfpCw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM9PR04MB7585.eurprd04.prod.outlook.com (2603:10a6:20b:280::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 10:50:35 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 10:50:35 +0000
Date: Thu, 8 Oct 2026 18:55:07 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	maple-tree@lists.infradead.org, asahi@lists.linux.dev,
	linux-mm@kvack.org
Subject: Re: [PATCH v3 2/2] regmap: Drop map lock during cache init and exit
Message-ID: <asd2iyVAnwBG7zVw@shlinux89>
References: <20261006-regcache-lifecycle-submit-v3-0-37bdd82fd47c@gmail.com>
 <20261006-regcache-lifecycle-submit-v3-2-37bdd82fd47c@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006-regcache-lifecycle-submit-v3-2-37bdd82fd47c@gmail.com>
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM9PR04MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 886cb679-2215-4d5b-b187-08df2529fb25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	kAm+rAvEWzWiIGLSGpz4CJiamH5vUpvJqGh0HEFREluevDfVYIw1WBwnAitkRapKcwC4bp2hQeYZqgX+NJJRTI9RFB9PTdOCoGv9crsVLgl1RmgqJ0vwU/zdMLRRX83Kz5kdUqA9iwi+SN6wlCClOSCi9SVt6wuOKSwLC24F+PgtcSIDF11tbRDcvjUwVQe+DMIV9OE3dFref2mtJ0AXPeymIbd+Cy2nq0q9weW+GCgb5GS5rtcslER3hRBwwQAsILogsSaCOH63Txl9jiQIj/4zFN0HQWAiFaQdG2B3Q7sav+M3QYfbPuQE8KDDRpBnwixqb01SPjOsJjINmoUCnqLAq7NxX5tenos3TU9qLzunMBz8nL8+QjLIwO50M72umNXZZqPotDH/BRac9kqtXvESTX9Dtbp6wmWEslpMJlDoLnnaiExBPiDvqhh/vJ5IkDXVAkPxwGks3bB0nInTa62qsskRw4tSpYHpa5mGv9z/lgtLwH92uBRIVtgHEQjozet4XIroxOebaAOIFmwpi1iLxsKn3q+jJvmN4XJUZyBETtPlLE3UZyl558Rujal+9Gj9U3SRuABE8rkuMVl3eNlg4gVYjaJsWK5O2JwRwvMscBwz4c9htdCT7o6sAIEgsIaSWcDLAYzggxPxpPWJJ1OczFt625QU9/uljLqRFiw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?evj4l8YpwL+1L9jmaRU06BwvyEaQRF5LI2CkTsCxVAMZgezxm4d7pF9/A343?=
 =?us-ascii?Q?JyX8uyFnXpNBm1x0EEzH0m30yMM+/5VJ9eiEugGiWlT1ihUs9VUjWiq+jsaI?=
 =?us-ascii?Q?ivZNf6imGx53s/Oa1SduRNs/cqbjyTv/+hyIkF7gVR6edmpJmQItmvmD97fJ?=
 =?us-ascii?Q?MtF3z34/wryLy8LR5fwlXmPF9JRDvovag3phaAIUL3m3+w+Y9nv0stC935KG?=
 =?us-ascii?Q?v4nBjM8K7m2j5Z+GeiUupKMgJdhc0hNGq5bOhcEO6fJCp4UQOS6T5ENOv6mZ?=
 =?us-ascii?Q?XYQKp0sQXfQ95IvNXpsyR5ua8WSE3rsPop58MlZudOWXt2a37+j9KgY0xBBZ?=
 =?us-ascii?Q?8+hM5xpftSyvstsZNcbllf4YKz6n1QronLr+s4UfA3iQmkq5Sd9zFCOBGdOS?=
 =?us-ascii?Q?UBuY4epTADY6Mtwpx3OSziTBOtx6V1FvY8wLBeBRpR2IVHv3AgZMSp18chOJ?=
 =?us-ascii?Q?sw+pSjuD3lxqK24YuE4jBM3u6AorQPok1d9+hhphRzn1wHnQrhrZKNXCZVtE?=
 =?us-ascii?Q?jvI3bSZyWI7+in1Ohnm1xL9Y2yJEKjCm4UvLkUwqgV8Txws6lviuFnsYvJed?=
 =?us-ascii?Q?XxxjcqCkauk9X8AcFuTygJMI07IsIIfG76E9VUFScJkC5y7G3lot7CJ/Bdnp?=
 =?us-ascii?Q?K6qoKI5/6gK9w7Nw3Jvy23y8AQ6XCVQVa/lc18IYoP31d1FbdBY25mB3kqPt?=
 =?us-ascii?Q?UaZCVmkMfQVTta1VLSzgIIaTNIVFi9IY+M29Y0lyPzlQob6SMofoe4o1LnYZ?=
 =?us-ascii?Q?Lbi+EN4nbiqhT5n7eeQ13I8I3WPI44NlBafDDFV5huxlmviKuEz6UPvTrp6C?=
 =?us-ascii?Q?lTqkeDE14/oK+BlYVwqYoqR4HR6+1KhlsNzrb1jOF25tzIUSiWJ5LTNxTKsV?=
 =?us-ascii?Q?0LAyN9dHPwaRl5dDfIwRPFr1EELyq1sCXMQUeNzi9X2pqghfO76Id/Vn6mL0?=
 =?us-ascii?Q?SDTha8Wv8tj5yS0/cad06RAAMuxrLAeXBacbhMWD41yHHBfB1V8uWjwQY3xc?=
 =?us-ascii?Q?KyckMhpA3OH8th0aDM8jkUAXdCXLwnrGlS6E22zjjOFp+7sjLl98To8E+6hH?=
 =?us-ascii?Q?WY3E21tnIfmYx/TDBkjXFei6FJ3hPlLVskBE6BqzAtT6nVzM1n6H1PmSiH/Q?=
 =?us-ascii?Q?U9d7Jv93XqcOlbghDma/0HmY/9cHW8UvAZHltbybWbnLEQ3nVkv7TW5AsW6Y?=
 =?us-ascii?Q?4zfcibyWVGI4jiiF8lobk8Hcis3uRluZ7D1674YQ5qc/6aST7jUCFXvA8z9M?=
 =?us-ascii?Q?ykYA2/mpKWF+HvZdYjA5joTe0k3DmKUssE/uWjWxGEf4zhW/wwaGZItH/Xyv?=
 =?us-ascii?Q?CLXTu0003evJAxntogLnD+qZVk34xJ36RucxrxGQ2YQAJT6CZouSHc/E4mFh?=
 =?us-ascii?Q?K5hTPMnwOocYt6wzPFQFzVemDD6txivBGeIDMzQWdAwUqzRQnWr8Xa59lZUZ?=
 =?us-ascii?Q?NYwW/M6A6vqyJLLyRpfE4vCPr9Jt2LS7Uf+YfDHOU17VcOBRoiA5nhp2WTbO?=
 =?us-ascii?Q?uKK3LZz3FKng3ef10L2eAfGp/AL9Akv6vW/9BmCoMluOmK91zA5n+HzMgGfY?=
 =?us-ascii?Q?WbKZJ2mv2Wy5GJsV8R9X20DFkCqkjQVmfGiTHk5MNTZTBjwxgEIyPelNHOiq?=
 =?us-ascii?Q?9TFAQHbS07gygrtyIPCLM933MEs06L482dC1rtQTSmmTzQNP701hIrNhu6PZ?=
 =?us-ascii?Q?laC0MxcAIPrVu63eylrrzBPu4NuDq/FRVv+Vwq7Dr1NVnNE/ZPQdBC7M3f6o?=
 =?us-ascii?Q?nZZawofjKeAjbJcNSU4uWWsXNKn6qLnPtf/V+xzHjLbVWPzqPN12?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 886cb679-2215-4d5b-b187-08df2529fb25
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:50:35.0494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hz/7ViEqWu3OX7YpUl+LSsb9atOZilc6CL7nrx9dzKLlFjtCbmwCH2l19MWD01+8pRqyjud1XQk1RPbwP0QstLUvfi087XDj+oWgVM9zVMX7woT8c6bzTLSbvbJfXTNx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7585

On Tue, Oct 06, 2026 at 06:03:16PM +1100, Michael Reeves wrote:
>On systems with CONFIG_PROVE_RAW_LOCK_NESTING enabled, Apple GPIO probe
>triggers an "Invalid wait context" lockdep warning.
>
>The driver uses a regmap with a raw spinlock and REGCACHE_FLAT. During
>regcache_init(), regcache_flat_init() allocates memory while holding the
>raw spinlock. The memory allocator can acquire a non-raw spinlock, which
>causes an invalid raw-to-non-raw lock nesting error. The abbreviated call
>chain is:
>
>  apple_gpio_pinctrl_probe
>    regcache_init
>      regcache_flat_init
>        __kmalloc_noprof
>          __pcs_replace_empty_main
>            refill_objects
>              _raw_spin_lock_irqsave
>
>Cache allocation occurs before the regmap is published, cache destruction
>occurs after users have stopped accessing it, and regmap_reinit_cache()
>requires callers to prevent concurrent access. Remove the outer map lock
>from cache initialization and destruction. Keep it for cache population
>and normal register access.
>
>The Maple cache still uses its internal spinlock during teardown. That
>lock can also be acquired from hard IRQ context during register access.
>Add Maple-state irqsave helpers and use them during teardown to preserve
>the lock's IRQ-safe lockdep state.
>
>Fixes: fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and freeing the cache")
>Suggested-by: Mark Brown <broonie@kernel.org>
>Suggested-by: Liam R. Howlett <liam@infradead.org>
>Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

BTW: patch [1]
     "regcache: extract locked helpers to replace open-coded lock/unlock pairs"
     has been accepted into Mark's regmap for-7.4 branch. So there will be conflicts(:

[1] https://lore.kernel.org/all/20261002-regmap-lock-2nd-v2-1-e172b0501c52@nxp.com/

Regards
Peng.
