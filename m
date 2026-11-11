Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794419881;
	b=cXyXcqT9pJ7sF6DlIrNOR4g0F84iAVwjK4IA3a1RzaX9wS4B3UEiO6FHPVZtLfS6esXu
	 bJDCztCyPwOHP5VWHs4WqvgezveWhiAdNTKS4GVIYRK9g9p84c7xC3Ypf1WqK0BpyV+kG
	 6TlgRPNmfSofDAqaew2O2Es8hGHMPwCJ4mRm08CZXmetWi0gOVn3zPHGlLkjE98MHnGT0
	 zcIwdVn0/DVi3vWKwjXpmkEneabWFGTyKafY2LGX4+7Hv29qWvxAJw6N/D0eGggAWeSF4
	 Rs6Wjjdg5vjqjmH9URK2noAPQSIzw+Sl6k3UCxgkPzVr2pM3JlIOERq7bXyrQgEDn5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DYSMJic3Ec41upnnSS9Qra2KPxBtVycENilo//R2qyk=;
	b=HyFxg+/8MbiIAMurwC02Tn7Gi+sFpR7qBbWJBZjBfe88hX47Xa7vCcCWpqXRPJGRUcAi
	 o9s4Fmpj9DugfH5pWkQMVYZJsROMnm2I3gzZgfFP8Exc1kYBN9WeGFYjmxUbUtutp4Fzr
	 P3NJMo0YLEB2mVmAl3VxSx4Yja1FID3RAwFDtkUlYyMzkV6yWhHONARztumRNnilrjo/7
	 DbgifHq03JlVHSHfrulpBpoy2De4rFBfXS6IVTThBu5ZizzT9fLxubnM+YB2AthvuUCkK
	 HGfJgJEhxQmkAWIshFRlEjgjYtjjcimRb52ry3N20imMaiCi26ObjFGmm0xsPS+EVmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fD73KsKA;
	dkim=pass header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pd7vyibR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.154.28
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F57E606B742;
	Wed, 11 Nov 2026 17:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F57E606B742
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=fD73KsKA;
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=pd7vyibR
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHsv7C553514;
	Wed, 11 Nov 2026 11:57:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DYSMJic3Ec41upnnSS9Qra2KPxBtVycENilo//R2q
	yk=; b=fD73KsKAEpOxRaAqHGO7AQz2g8e+E76LktoPwP0xL8dtVY8CCVjPImIJ6
	R0TO6zBKhvOgH8Hi6rzXT0TvEMRQ+Nfug1rIXQVKera4Lm82bmP3nPLNQ5AiXSpE
	RMruUWwzOsTuTn78CdEGpzK64LXYw0eSIAW/b0gHAJM+32oKccFX1a/UMXcJ/nwy
	w4r9S7yP/i6EA5cOjyP2zOtUzT5EorMlKenjic81XWLcxi8zwAyV2qnNhYMbPQui
	4SykSaDUL1sFrbnhvIIKEVcdkZD2+bo1+KiG4Rr0NUIMSdLPJBmQWAXj9/MlY6ej
	nbOqLxGNC3ashS6ANbOfY2Vn2d+4A==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsymaws-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 11:57:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+dcWgbLG/N8LrUNT2WAS0mOwygQ3Hl/vL6wgSce1lT+i7FOgirMFTxctxnGEVa/eDzL8HP8YhcZS2fPFE/BsW+3u0i1Ylvk7qxH+FSZdBkXNZNf83Q725j1IFmXJWndyXs3JO25QWeXBZBiNtkpIWgnrtxMgblQR9lehZuoSAJ0b7E1OL2MzokQfSK7Wqpp0C+2oaoWe9xU9WjgEAZ20JysjX9w67yyp7GqiNhHDfeZQgoT31VDfmPh5TWtpWSfLkDcRGB48tT0xcTPLeDdOaeatBA8EJDbZRxtP5NyvqLNpSUe+GorJgjGyYVSoNL4Q5mZ6yFQdMk5gkDbzPUubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYSMJic3Ec41upnnSS9Qra2KPxBtVycENilo//R2qyk=;
 b=A5mvCI8cr8Z9QaIorU3Tkqn4VviXZhkH75og0MoTiTxi5KufSAUHC+rhD0Vti86FSNn/RbqOkA4o6UfOhlGwVOOYus/rCEywEtvK57XwTXqk1dLz3PalMvpanplp+vbIrvahzVFlgGInmkEIJxsGHiliWZkttKmy7LgJCa8nyo/+HiUTaKwqyFtchNe2YcZJevhL+rWpxMAU8TFkTlbREfyt3qIwP++yvyG/BEhbvRLn6rpfA9Qn5b6db+vC9R/c4UJavRqzT/e1ERRnbIp0RGpKe5r/yqQRSJ8f89QXaPKjlFFyJ1r6DEAmZ8kD1XpZpBCgC9FRsBsa0VIKLrcc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYSMJic3Ec41upnnSS9Qra2KPxBtVycENilo//R2qyk=;
 b=pd7vyibRGqJwAnLOsZZH6MIZcewV62cx4tZxMr9u996birUd72jcfoRowq/BO5dQTV1jMMdxslzewglGAVjCA5ZUoxhTaY5z0ID8GpXuVS62u565L3WEeaitbJLqeKzcGwFxhd8kHqmzKS/7ZOpC7XdaFEtmLyB85PVd88I2e+o=
Received: from BN9PR03CA0897.namprd03.prod.outlook.com (2603:10b6:408:13c::32)
 by IA6PR10MB997563.namprd10.prod.outlook.com (2603:10b6:208:5e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 17:57:55 +0000
Received: from BN3PEPF00022BBD.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::78) by BN9PR03CA0897.outlook.office365.com
 (2603:10b6:408:13c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 17:57:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BBD.mail.protection.outlook.com (10.167.248.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 17:57:52 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 11:57:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 11:57:15 -0600
Received: from ula0226330.lan ([10.249.32.167])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABHvBIk193504;
	Wed, 11 Nov 2026 11:57:15 -0600
From: Andrew Davis <afd@ti.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki"
	<rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        "Andrew
 Davis" <afd@ti.com>
Subject: [PATCH 11/12] soc: versatile: realview: Use devm_soc_device_register() helper
Date: Wed, 11 Nov 2026 11:57:10 -0600
Message-ID: <20261111175711.428824-12-afd@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111175711.428824-1-afd@ti.com>
References: <20261111175711.428824-1-afd@ti.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BBD:EE_|IA6PR10MB997563:EE_
X-MS-Office365-Filtering-Correlation-Id: 504b3835-6dbe-4a35-320b-08df401d4e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|18002099003|22082099003|6133799003|56012099006|261009223027099003|261102123227099003|261021123027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	DiPP7QElV9X29XapXK1eUyBmpEsXejhbQQXZB7WXUy74Qj7ZHpkWeLqKtqj67BTNUz4ufKWYvii/OQqzwzz4XI+B9NlI3TCoFYGYnGsctNFUVXdXpW7W7eQvImAZtvyggwsHmXZspG2VNS5qR6pYnfTLGGWsNY81hDoiODiibFobwlxgRsxE2pqgS+iCu/FXZx7p0h9IXZXwVR6z8D+yJM45LfcMXZbPf6llkdUHr8Q27Ct9Lb2RqkpbylFmMlNWVoQJsQBWCuNtYFC58gPvCysED3+cmIVNhWin1pX5YVz2lGbPeHziZ/3FdYGdm3h48PGy//BYAbR02PHmM8x+TulmpKGUuRxTqNyAJvoi2yNXhp7mS2cop6/Tp8b2DMaS6P5u22smAOCfO6qfWYkpMFr1JQWMkWE71lwWaabK5PjW69Pms8tELE7Kdc1l7iK2IInp2/ATBuAq1UQNPWhqmpq9iv+O8LA3mEg0ReNw6Ul6AC7fl4VPpm1fDgbzptYhoIY0EBrTXcWspjxh6sZjxfQgLCCKiG3xsfMwmXU5wMmmiUIhZKPcvC/MBZ+/0NCgdq2d6VlD3fGckTK3yA6tt7ncvqSgfJCkRNez5dSQNhDyfMQtwhJ+HQDzg4I3kh8ZUUntLQ7olb3KlJ3z7WdNTaaMz4dKJ9htX6uqe8HN+XU8zSnzZ4iD0m1fuvVTSbX/k2++6MWBySi0NK8mSFPJEw==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006)(261009223027099003)(261102123227099003)(261021123027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	48cHn13Rn6OHQgbArSRZDEBnlAVbR06OnDDIiDu32qpGsLCDBHIA2SGKKRBCf78cdoUO8ePcVyVmp8uO+X4ctS9gdhT8jmxsO+ElIH86H8kY+CWlYUGj8E18mk4cELzN0hCMszLJVZ+DiAjtn2wn5lUzaDvOxKjMGEXKFQj5+wcWZG7ZOSumLaClOM3DbwDp1lk79gyXx77t8UM6txvuTHAavhhSz7Yj3CvRtdhNqolhRozto6JAIzgrarV1ARIeezQ+7J/D8JkSGi1428TaHviJm81kDybon8C5+m6lTTpYmfT81JyrFsxLPO+IW7xKfnJPzmIlkhzaY+E7+uuIjAHP7davcIAk0fjjTNja3WR13MlkcLJA7TdM69GPIx93jqNVmcaio3u8RyCLmBErHpPakN4M6ZuReW4/HXxKrqwx0FvP/UAYw/BoHZH0Q+BF
X-Exchange-RoutingPolicyChecked:
	Si5WtLzDfRdtx6sIxvJmFltEp42elV9KVKo0j1mJqB6wD1In/YbRJnYzeqqAa3v40XRM1Cg21EsiUBS+HBs6zXxhfZc6e502gGOc9YNQnzUMGAuSnG9WtS3x9JT3zV805HUGKWgWnFPyEvWPbtGc3Qy9+JqJJh4DTyXdyGuteQFSw/OwP7pDULfbSbluAR/Car/b0iBzTO/xE1sQJZV+Rx0tsg4H0iczMP6g8izr1OkOkSABawPDHNfZ3oiHh3vyWBfYe1Rqgf9YpgWNT0D5PTFCl0h9TapujBgLUQZfbPXPCB1CfB3pA3bsA9V0aqHEIDEkoL6pU15mf83t5PvhsQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 17:57:52.5766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 504b3835-6dbe-4a35-320b-08df401d4e9a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997563
X-Proofpoint-ORIG-GUID: W_wNFrddf5d6uFp5B3CqbWdxcLgSHueY
X-Proofpoint-GUID: W_wNFrddf5d6uFp5B3CqbWdxcLgSHueY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX9WRa33owGeAO
 adlleDxH8mHv2QnSLBAy9eZV66Clr0f+p4rHXnhpkJw4hGbBq+BzU+UNhio+uaZg5CJ84qEZiem
 bDARHQpl7RTX2kIFnd91aQYwmfFuv+wtdf4xDn+8EQvuOSAA8UDRIarMAeK7q3RoOeol+0tz7Nx
 UhjZ4UEtIm7ReUN2Za63KL7pIlMQXJkK0AZCvyjLUcTQkNcYob7z5FQP7Y28WCvfxvpNlshFPea
 tgw7m2m5r36M1ks2KJGzulNrkxq3vQ3m860dD2tpAVnE0q/Hx6fB0GHukarkHbVylNs5VkakDg1
 I6h/mcwLI0lyYVGOlBOCcQ9wI4109d/ItAKquEzOgJ/1EWKfihrLDLUMPofggUSX2vJAAV1rNBx
 pdn8AImT+AacAM2Eh8y7k+uBl7U40t2ZXBdaVqJZ0tiIPL7/s8ODxeFufMdX1/e4FGa0vQz7YCa
 fij3qTyrEO+yDM77EqQ==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af4aca6 cx=c_pps
 a=1t1hxDBgkqdAqWWjFE2LMw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=9bvxoRI6gNWU0uyUhagA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MSBTYWx0ZWRfX2MiCHoIBeB1A
 VBUk9LhB9V75Ue8hJhqYL+8FoXtYI8NQBfzP44YrgNkNx6lwgxMcrbXpekixXJ32R5iN4M5K5Pl
 GPF5Z4Q0+9VwUwVQ64M1xjRCH5Ogg40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110071

Use the device lifecycle managed register function. This helps prevent
mistakes like unregistering out of order in cleanup functions and
forgetting to unregister on error paths.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/soc/versatile/soc-realview.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/soc/versatile/soc-realview.c b/drivers/soc/versatile/soc-realview.c
index addb8eb32f0d9..a0dc37ff9b376 100644
--- a/drivers/soc/versatile/soc-realview.c
+++ b/drivers/soc/versatile/soc-realview.c
@@ -82,13 +82,6 @@ static struct attribute *realview_attrs[] = {
 
 ATTRIBUTE_GROUPS(realview);
 
-static void realview_soc_socdev_release(void *data)
-{
-	struct soc_device *soc_dev = data;
-
-	soc_device_unregister(soc_dev);
-}
-
 static int realview_soc_probe(struct platform_device *pdev)
 {
 	struct regmap *syscon_regmap;
@@ -113,15 +106,10 @@ static int realview_soc_probe(struct platform_device *pdev)
 	soc_dev_attr->machine = "RealView";
 	soc_dev_attr->family = "Versatile";
 	soc_dev_attr->custom_attr_group = realview_groups[0];
-	soc_dev = soc_device_register(soc_dev_attr);
+	soc_dev = devm_soc_device_register(&pdev->dev, soc_dev_attr);
 	if (IS_ERR(soc_dev))
 		return -ENODEV;
 
-	ret = devm_add_action_or_reset(&pdev->dev, realview_soc_socdev_release,
-				       soc_dev);
-	if (ret)
-		return ret;
-
 	ret = regmap_read(syscon_regmap, REALVIEW_SYS_ID_OFFSET,
 			  &realview_coreid);
 	if (ret)
-- 
2.43.0

