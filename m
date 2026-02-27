Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4356A43E9E2;
	Fri, 27 Feb 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207930; cv=fail; b=PytJ7a4Q6pHe8/Ozd3f2+qhtczda7OiwdrPo6wOxaRQSx3I09A5pqd3hOa1tnISpJpxTZsJnLFMQcouKjKAqopwabfDewFi/4TtG39A2OuL0sPxVHxNgS6MdDwAIsCARksR30p5+1TNUM79HUu6ddd2s5o7C/c69hWtur7oySn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207930; c=relaxed/simple;
	bh=KFF9usAye2tt33gnMIN51PKdPB69z1lkn8dajPOJldM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIMvo09395K22MKLaa2MJo1C3tta41wB+hPw1cKD1zxzl3W2XJWe83lMib7xuK93zYtTib3DLeFP5QVe/FeD8K3FrcPoGeab5tGUfspKM8C3D8jZxtunDf8OsGjuTKWsVtDA9TDMdwnzdYsGKOZz7W42/ruhf1GZLU05AQkbWYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=FeIS72Yl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=isxINe6B; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="FeIS72Yl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="isxINe6B"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R505IL2382702;
	Fri, 27 Feb 2026 09:58:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4smoy7DR4EhCrJ8RsP
	vdP0yHDY3z6/MTEuAaAZg8DjM=; b=FeIS72Yl9GEDfiMjjOU+1M1G1M2//Ap7Ch
	xpMcu4Rhjqnu+l6D0B0VW/CICQIqF8pJN/qPTdxVsLnLjN6fr7sUtK43V0+HkK4J
	hhk1XjLEza2XlYSmwObhhsfB38v/1Jq4sDLAHb+Ru3tOH5iZxrvOaA8VdutLFbEi
	F5XRfzpTmz3hIz+VIHQCR5sJLAO6K2pXZHuVgdU9kWhZLEWNSorh9qo3A35D1jDr
	jIJX4vl/r2fMSNVy85rxTHOB0aij272lsmjmZCSNqMCLNySsqeogkgsBVOUzTZHd
	7cUoTqMbFZzknrTZwYQYcREW2FvayEsEwrRaDL3CwDa27rs93kDg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020075.outbound.protection.outlook.com [40.93.198.75])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds1qea-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 09:58:00 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ef4Q9WEMa5YjQg0HQpZN4AbPW6JNWOKqdwq1RwEvtc0vMlCXpth3EBP/ONOzKpj3NuDow7wT6oXkCPgOYvfolVF0Byb1Ksey6LpmaIGaimljit0fZI0ODBY+ptEPVStnKcGxrUZnTKYVkr6O9bqjzullXGTOCwSFh6YRmSJCmQKt+60exr3v/00oJSTphkHCqatVEQbX9EsZPybf/IJXCJgXhNrOA/lMleWeL8Z1fyTlUOsoJfGxeb6fGM0IbZNdDVmmhdTnP29auNvsNxPkYaYRLOSa3zmbfEFGayBxhQyxpEAo4Pg7vSz9lShym8ca2MS7K7Wv7eYU0GITj/80QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4smoy7DR4EhCrJ8RsPvdP0yHDY3z6/MTEuAaAZg8DjM=;
 b=fTVsjDAnW2i7laM+NrexT/IZWOebnpo5+CjdifGXMIzuFEbWX1dDoCEbfw9W/meZKpz++WhK3uk5FWYp+PqQ2gumV8ZW4rlKyS1YBHo6bHW6rF10NfzvH3Cxtu7grmDhoTHwlF+BkByVklhKyO/gXWLq8VmoBbdNd9X1bbotgWOpcOD8tDuXB6n1b9FuePVG1qTfZvdn24gKGsYtebzjsHgF7dqFUn5hZ1dpotjp43spJ55/1UlY6+8yY6xwQbcgk5MM1eiyokroracHePmFbg4aODYiVq9MS+OedrC8S3V5zNIRzxEonowF3mnKAferLnev2gXuQOj3xKLM78yFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arndb.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4smoy7DR4EhCrJ8RsPvdP0yHDY3z6/MTEuAaAZg8DjM=;
 b=isxINe6BAy/qyd/KjoMxLY50mmQ68OX5lpdunOe0f91XRY/SRKW6N1dkkbEs4ehI4dZ4EUJsLQb05CQEk86LxlQQ8LNQI8yBhQ8EHBdaWTjbcb+2Tp0MPByG+Wki+61WM7GvKIn1cK+f4baxSgPAoIVQEQonpuAKYOwg/cYRYws=
Received: from PH1PEPF000132FA.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2b)
 by BY3PR19MB5044.namprd19.prod.outlook.com (2603:10b6:a03:369::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 15:57:58 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2a01:111:f403:f912::1) by PH1PEPF000132FA.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Fri,
 27 Feb 2026 15:57:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 15:57:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E7077406541;
	Fri, 27 Feb 2026 15:57:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BFBF282024B;
	Fri, 27 Feb 2026 15:57:55 +0000 (UTC)
Date: Fri, 27 Feb 2026 15:57:51 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kalle Niemi <kaleposti@gmail.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
        Saravana Kannan <saravanak@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Linus Walleij <linusw@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Steen Hegelund <steen.hegelund@microchip.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 07/28] driver core: fw_devlink: Introduce
 fw_devlink_set_device()
Message-ID: <aaG+/21w9S0alqTN@opensource.cirrus.com>
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-8-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227135428.783983-8-herve.codina@bootlin.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|BY3PR19MB5044:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a84375d-59de-47d1-ac25-08de7618f9c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	44INyXffaVi+95ZplBeN4f5T/CWdvCGaySy1xLucs2jKTPgD/7afTLNUMYdw5TzqLt8UKh55oqazi2B9dN+HTtOpBSAZk/GqaMrAgv69X2lvKxkPYMO9HruF9aA5YcVEYHt9QpeFPWcKVXsyHM+nzND0QOkYqE3LFUvJDBDS5RBoK3w9A8uy4JetnpIso/+UmRpbpryCz5m4jdn6TSVQYlrPYty+qU/6VF9xlAM5NtpfRVfpvbR0j3cUBL30NQ+3SHm7d0qg3A7tz2EJdOKBkb2t33fPI1G5aJmIfEg130WUEw5ka8TJY2PpI7BOBYQbLt+GLj/6zGhviU4ijNhO5zzmX71fKBGqG8r7pEDt5pX9btZozkCmAQ4apgLveaHp0mJJbcaYje9ttpy7MAWR/TqRzQzYSZ8ZNFnID3IQ1mE1hYb/XL2KJKw6BJuBbuD0QNqcflfi7vKHHwXQ7E9JNwZrvPInUvli6LN54DoZY/Lwn5kleZ0EBF9de9OjhUfEmNuY9Fl6YUTAkV7xr4iJlFsiIUgwtdpgnxx97EHggy65XiJ8V+iH87MC+ph79HS1fXsc3Aiyo+BM+BnQr6BjmAOKvCA+D1G/7T5hyMTYKio6qzIA6p21vVYO5ROrMSOnOxoa2D+hOwOVmB3wlsW7kuQlWTwwAKiyNvdxriCDxvvwd1vv6vA2KvF7a1KuoDq3FcAxU05n0UhiJOg/18TbxCq9o04hAHmBqxAAzXN/8ZPxr31QNBw6le2/uF3yqoU3nlGcRBdW6lACZirOzpriw1cZtCuGVanOnbbjponSH2Co+F/JNxVup0yss8ZmZYc/WzNS7GHohtdv7AsN51tPvw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XyhVIRhnjvl7aVvs0sEt4Z5ySyAWBgPJba54Ctgb946NTIYqErNfcbwLS0pUAiZB8EDl257R+Go6HufKlPE3QtnNBsBeM9/n/uqMhgRwi9us4WFcCLu47z/isTMltgRdR9Mj6rlO4DIbFXNPr5b5+t3KpIXXg1/DJqWvQL+v6RNWuaEBP/dO2qPRvdZ+5uNy++jA1s8kVDKxi1nMIE5ze7Vo/l1VEdbVWvAFkBgkdJODs0XsBzi+I23FuizQ/yXQY0mNVKQf4rTa7awGc0SRiNx3HK3OA+VSumWGZ52EzOszYoedZnR+AP60+t+RwdFkr9ewcaSAc3/B2/lyMCK5gtRCJglPOatrqDLUvskyaNNo+L8SUFv0UJws/3t5OYEKv+/hBL887r1F9CEEGzXao/A8lNjHXQwf3/PY9gIKVTUcMVHmPdeSo5MXzsF7kXBm
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:57:57.2211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a84375d-59de-47d1-ac25-08de7618f9c6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR19MB5044
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a1bf08 cx=c_pps
 a=ST2n4ODNysMJ8B86qD7aiQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8
 a=rSjeN_rvdOytUjbESTAA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Au7zOFr3H42n8PGQAMx0zzN3LuFx7O2j
X-Proofpoint-ORIG-GUID: Au7zOFr3H42n8PGQAMx0zzN3LuFx7O2j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE0MiBTYWx0ZWRfX7gfR3DDIJB4E
 hoDDn1hTO+ibdUVxnmbs0QE7x1eVEPtqxNYemSW8V+Pgg7zHx4IwWZ7ZoGYt61yluaC6n1bq5JV
 a7AQP86ify9+JZlIpPJD0LRlnTXVarl/geqCcOldHSB6BhqXgI7jJ08sb0SklF++OqYFxi+qTDZ
 5TCetPMxZr0skvHWHK5JZm2Fex6ertTkVw/IGNtjWAYb7kcrpkLE6J8cOdQ4k1wvXt23GiIUF0E
 hUMa34p7aHPYCE/bqbq4RB9Aso4M2iX7d8Hn1jtZDcQVF/zpBpivtHjfkJmDKDpWZQWi1d1JB30
 YDrgevu/H89Lcmd7HBSVkd7f9cRQt3V/jDtdZZ24/4ZZMDKiv9tBh+0qCojIqiquAwhEtXCl9P8
 fhf/7OegLPh5U/IgpCB1q6SLFJoECHAER/Lk8492FolIFBRki4F3MZhccwsNJXQFsLZEwSkiJDI
 wurh8nVO3WucMtzH9zw==
X-Proofpoint-Spam-Reason: safe

On Fri, Feb 27, 2026 at 02:54:04PM +0100, Herve Codina wrote:
> Setting fwnode->dev is specific to fw_devlink.
> 
> In order to avoid having a direct 'fwnode->dev = dev;' in several
> place in the kernel, introduce fw_devlink_set_device() helper to perform
> this operation.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
