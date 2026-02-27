Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8977288C08;
	Fri, 27 Feb 2026 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207930; cv=fail; b=m3a7v+Si+5IE2qlAmzYyXq95ZxzEKQJwFPCIDP1OW237FtF3ojQWtPqWDB70A2/0GiO6SqnSD9AlduqjIOeTbWxHtxGfy9gEwEy1pEUkKEWm6gTLE97fZ041B8HG+7PPgvQtj2muHX1eT2pF6sYpvxQEDr7HR5pAEh3t/mPCdto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207930; c=relaxed/simple;
	bh=9zIaW5GrNYt1FwC1JeVTx+E+Uz24gYWP4WaCfjF8L18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ujv1mdIPE9IapVeQzh6CcvilO3XJoogflcrDU7pExck0xIvhoSUCmnhkTqSuIsH4jwWu7t4pefKnMSpJH8ykYg6pocqsEk6CI2RbA4J7DXBMSZobh1/JAz9YnP59LLCF1HDXWVs14ki6JpE2xLVj0KSXj3+ZBGr5UhnqtXqP+yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TwFJQZiX; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vxEQek9D; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TwFJQZiX";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vxEQek9D"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R86SF72680887;
	Fri, 27 Feb 2026 09:58:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=h8cdWiTQowG9Wtj13i
	cgNjTqPC1+CjUUXuQxcNaliy4=; b=TwFJQZiXdXrSPjkpNm4tX3rKqMZ3mwdGCS
	gL2AnfVXSybAdkDcl4Ah9m+VcVzvv5C+9GeOgKF2Y97l+52ZCoU5IjMHcRHaOCyZ
	fEq5lmneai5V8egsjB9EVLrzDPdOSf+kloP/jplksvMiCjBPeB2ml6YEnGjJdbqd
	/0wgJcagKreB7Z5bG+eXdv6EZz6GfAAUzbRg9KcWVntb1NW+MlTBV3DyjZcKrF6Q
	bTw8UDUW/B/0aclzaaznzUDXNzyqHzE5RFvLMU1CggVXGtAC0iTKf1k2yE+6WG+M
	PxscbgdRaOt23oXsKHwWvMQX8Q4qGKmlNNf/vb3WsKXwWT/X3IsA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020119.outbound.protection.outlook.com [52.101.56.119])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cjmds1qen-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 09:58:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjxFq5Fn66yrERKBxmQfyxPlOtfmWpmTBUQEhgt8KtOQFaSH7oOClURd/6Ctq0HbV0qkD5ORvTR42AiZfHLzkc0Ae6T9gTuvdkjuzs+Gj6F0z0LY3Zy7cSui+ycU0oAhpCVOaNCYlTyMb57rhiro4DzkDdgzrGTj6smZpy9U8w5nBgcwDaKbqiC/kWaSTqOyP+fo1HBNbNoszuwIz9pSZMWQqG2Ako6BTh4XtaH3GbjM+scY/e8VVqvYbey/v9xJ4p1DlCTrGemK4/MutqeLKiAwJBkeg4ZKM9qyqawEWUZ3e3YFwRAsxWNRALnjW/iYb5apuAD6edGnlna91sDXxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8cdWiTQowG9Wtj13icgNjTqPC1+CjUUXuQxcNaliy4=;
 b=idUQKKP7KeVdKjzYGd566xv9XqiaplA6pysJff+2NzlUlcoQHGp4Id7fuJu+usN4J2LJ49MeOtAel1XSZhUCaXzmrk3IgNosuuPIPlOPr4XCachxOy87rcWB6/gIf5yfzeg3F0ATRY34KLE8+2IYdNdQapiRLuHUDHSLlKQDI+7G3dD9FiNE5fe9jYqCr1R3kYCfSTHzpxIHNRBrCPAhYdgGutfsI5McqrpOV1d5OVLqDf+zikiuG+Krqu7aDHjmGEs7p2tHzY292AOXz8blohyEU66GwpN4FKUZTgBGd27RG+cEogjvzBSKSQyGNmXJK0EO0JDmXrsH7C4bqIKucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arndb.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8cdWiTQowG9Wtj13icgNjTqPC1+CjUUXuQxcNaliy4=;
 b=vxEQek9DGGx4P6FyYB4YJmYIHMTFJAm8eHDjpWpIYWdq821anGKyNniB5tsYUw1HN56jJWWPsRqy5dN67F4PaaK8JYiHM8QxndgOrnsOJdq0er2clBjbD3DBQUpOP5YTCzS7e6X52DNNW8VetMXk0QEikYjtpzVvHffBcY12GN0=
Received: from MN2PR22CA0024.namprd22.prod.outlook.com (2603:10b6:208:238::29)
 by BL1PR19MB5868.namprd19.prod.outlook.com (2603:10b6:208:398::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Fri, 27 Feb
 2026 15:58:18 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::1b) by MN2PR22CA0024.outlook.office365.com
 (2603:10b6:208:238::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.27 via Frontend Transport; Fri,
 27 Feb 2026 15:58:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Fri, 27 Feb 2026 15:58:17 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id B4E32406542;
	Fri, 27 Feb 2026 15:58:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8E61682024B;
	Fri, 27 Feb 2026 15:58:16 +0000 (UTC)
Date: Fri, 27 Feb 2026 15:58:15 +0000
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
Subject: Re: [PATCH v5 09/28] pinctrl: cs42l43: Use fw_devlink_set_device()
Message-ID: <aaG/F3JKIpsefS5f@opensource.cirrus.com>
References: <20260227135428.783983-1-herve.codina@bootlin.com>
 <20260227135428.783983-10-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227135428.783983-10-herve.codina@bootlin.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|BL1PR19MB5868:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d52c8b1-238f-4dcf-3395-08de761905dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7416014|54012099003;
X-Microsoft-Antispam-Message-Info:
	8y0jWkKNvVIor004Zsoteu1erbRBpQkGCu6jMsuZPHmMS0lw/6zkskqadEgGK2+fqABEGHbzkcehYFFHV1l8uzuLOzSst3RSqtIgAMdZOI0gBEJJotu8LRbqOXA9rMY6x2r7pWcKLENqVEBkgUCpx9pfwr5lI65HwpQQQQyuGblC7Iq9OBG9rBbj3h9557HxB36A+jL938uaefQrNgamuOFLMWl6SLccK6Kn6DC5GjRLCvF9K7Zhxge7kqORv77DzImW/BoOVgQDW5qzj6Qq1AzPi0gCWwr706ulEyJ7kQOxeljnaThM8ggVVSrRQk77yPSGyQaPnXb0ZEpS/0abIrPmfhMEQ1Tvza9eiFm5SyQ5CF57xkD/Kifbt6xh9aazrkqGMNPafiQWHPrCxs97hLq5D2tmw+gelco+BY+ZCz7i0Bsw8dQQblcCkZpGrcRVWLiXeeOMOhvdJSbivWsGhI+r2lZfWHxEPCwl/X3IKy1gYacU3oTP7QW1275BUyvDlY7c2uiSJ9ejuAdd5Hk+9YAunWAu69oWY2P2Mx1/Ge01WfWeuax3J30SbXI1URBFFe4PSsOKukka0wgt1lS9fYBY2p1Rx+iZZUo6iTlhrgiRd3beD140zSvKrfv7kRX4zzLzPsrewgA7OG2Yi49DyEXUAconSjpTDRHTVuA4DKTzFPTf12T4Ur7wLQBb2i/4J3kHzMOZXYDE+aksCE4Bctn0DLOgAOaYIpUBBgTpFVe7sbbY2yYzv9YvJefPqMC6YwQzi8SXHuITasEyZfSqlYZ4AwoQMadblIZMY4FtY7KQYoq/2GoLx+EX9TzyzyuQwWsQClhpGSB+iOVDfZXQPg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7416014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MZvtBbeIVqNMiPuNmnBW4a/auuUBV5WfT1+t0Zsk+omAUpQicW/4AWR2v2273uTiY9mkufdbxmGImoczgPiDSr9ngmbLwRh80mdW4fXuRWDnKcAsGAlKhuFkoZv3SFdwithqaEP/WF7SKZnBkJwzQPElrpCYeVM0p9DZvQOgIgivkcYNmXvGaEBFh2OBAXDQnaihHy0TENi4f6/Fp5zOcdeYg/Ubnh5a3ldGsDVDBMbwg7dGfw5Bul/SA+7bXTqpJdoPI5eUP1LwfdSjvuOYZw48lFkIKLwJWCPdOb9prrlcve3cEo99kIH+4Bsc6QKJH0UvrpElqkzqSqZf9lW3cE9gm2oF5CwZEhn1GlwqH4Y7eZs2wwfB83Vmt8vSOMsvUK+XrMt1gOd1fLKPoB8BNf64dWNt7kC7Hjf5txTkfya2owHaUw6N8WsbOdZlizzU
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:58:17.5883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d52c8b1-238f-4dcf-3395-08de761905dc
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5868
X-Authority-Analysis: v=2.4 cv=dO2rWeZb c=1 sm=1 tr=0 ts=69a1bf1e cx=c_pps
 a=TIEeaaXQjm2sgGsZDBwmrA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=nQlXo20cr35tWbDzT6YA:9
 a=CjuIK1q_8ugA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: zYe7XIg6w3YawjKktpJyL9GGIiTC7bhg
X-Proofpoint-ORIG-GUID: zYe7XIg6w3YawjKktpJyL9GGIiTC7bhg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE0MiBTYWx0ZWRfX6fznqKRs8tYd
 9QfFlWUB25985Uk7uNBIVSmaNVIgVx1p7h15sUyX91vBgw3HtALkGn7r7ZGXGPSjOwwrZgPXdZN
 gc5wC04q0w3/CjLDWOLWpm/r11YBc1quzdjCLCl2TtKlc/7GNNEjop7GB1wpBOxvII/qlZiFzCO
 x+K/mgAWPFrxfRh45LXXrA9MmdBmRSQRzph1qMXxRcNNTfqeJvRegGgNxVNaRupkrSeoT4nvcw1
 e7IfxrTpmFdsNVwHT4qHZtwmIwjQUZnYHqLbWCvL9GQI/wvFpNQsGRY4BVAFJi8+UwDvSKFFwJD
 wn8K2GyFb3OE9tXDCTQXcDYCXxAaJuFe30zJ1dZl4TAQNmfrLrO9ypH8JTcc9whwmAMN7bm2saC
 jQxRQ3+kxpOB4ZLL7lrL0ga267bn4HnsU9XyvVOritV+yiy6VfPr3wXSRaUW0shqn0sEMzhSmHh
 L39rPYvsdvPeCRgPNgg==
X-Proofpoint-Spam-Reason: safe

On Fri, Feb 27, 2026 at 02:54:06PM +0100, Herve Codina wrote:
> The code set directly fwnode->dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
