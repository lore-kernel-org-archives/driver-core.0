Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794795204;
	b=DPeeXkqYiQKMSo4jkpbY/NKBKwTgFP1uvpuBy7huf+0ssp+O6RcCUOw5dVLa0fn3+O8I
	 OjQKrqBnL+rfct7jfA+4NHYXsc/S/aVsrx4WRXJ4Q8yC345bo7beskcZtLrN75bj4Sez2
	 5dsu5k92KXhG/xXcLbJ9KZjInaTpdhGsSHji4XDF9GvdSxz3CM6RhTGejzCsC219lp1ZQ
	 bPTJEAVnKeEfrwYWWlWzd+AE5U7iC8klD3ILRZRrOGk8s4QoxG+5BVPQV5BWnNQOX5owp
	 2lwsqObMvWziJoANYcNtF5U+oPOFsarPpaUPIrTfwrlBjuY5x+s0AvEItYrcuz1AvTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795204;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=G+ee5Cd5ao4HfSaqnB178AtoplNBS58TAPe5wYN3CmA=;
	b=JyhFUBFcH4VahYbWVLVEiZahNdMIg/GXfrh+g1Ku5syLJ8T3p1zQ8GfsUnZTbwWoltQ1
	 wnLMYoolaTTwVaeOtosAVgBUd8VrW/4xp8wkkFGlb3lBfSU9gOqQ49DlIclyh+nbWYoUy
	 RNUMu286Mp9b+kj90zeNgI6vOBx6TLkTN8wcHgLTc1iu1Ha8jER8oD4XJa3mHRAhwWDze
	 0Fo4eq6mM/PUO0jTUOsBU1yAMxfvAw5ht7oa8xfL9TWo8a+5N2YVtzRQzJG7mSUgmyBiS
	 Yfy5Fi9gPt4/RE2ZHiLbcHaNbyFvR0588x/S5/ee/ZKj02c7NZH6PMvSodYHhRymitQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S9GdJCGT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.15
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012015.outbound.protection.outlook.com [52.101.43.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E102606A321
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 02:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E102606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S9GdJCGT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqxXS+byqCSNM/0MpaL3gasZRFNcLzRfHRzDwGXkziHfqusnFS5qsxqOsCDlUbr0ovgZ5bV1Yy7ZTiIEZkNMde65LD3P3yyDAlgXvCbQDifkO4K3Q609C4y4nbMsULlBm+pKYWdn+90NKKEHKQBqQRtI7XOvYD5zGYk6/ETfI3KlhT0BmoKDohHCRcT3pVpZupqd7VC6j/gVooKwWAOG2ye+lp1izBzvbmz14xUuFqDmt02+pGEkpQw4bxlceTCYnfG6ztP4fsVViKA7Etb6RumrCfAx8GEPZqI9IpSbt/nGOKxBqsxacTZI3HTn4MU3ikGRkDHvcX4BCPaSSmh+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+ee5Cd5ao4HfSaqnB178AtoplNBS58TAPe5wYN3CmA=;
 b=dF/01Tt1Fha6cWmgFmadMF82+eTNJSF2DImBfX64AZ2uujO9ZqBw5V5ecZ8faEOuNNNYg4tb0liFDhesjxgIcmazgQG5XYFWo/KyMCWP5BCIsvHUlLb6vpmlPHRA6opd5pt6VVh2inKj+jKze/rrOTheEgMZqugzbrsaNxlunN80kPC2G3YuNIxUEFjA6KAkJbdeywJzdk8wukcDPzbwUMkIvmOlYN3MMW9cK0BEVZxKtT3x1z8ZEpH7dykI0F0vsjw3Jn1VxVgJcl0Yzi9F3r2FAIMNdvSeCvy3PzX462t+GHDEq1HUejqR+KdoFcZ090Rpr6D2v2zphdh5DD171w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+ee5Cd5ao4HfSaqnB178AtoplNBS58TAPe5wYN3CmA=;
 b=S9GdJCGTbs4Mq9bSaBkLiP12iM6WXROpG/Fl8xoyfAypMCoWeBtFj1rH4PO6Jxsw2bufUEOE61T1d24fG7dc5MKeYuZevVrY+RuyBeWRpdptMT/BvseqBIAc8pIYL/7PN2JWveW7M0PLqJm2JxTzz08XclWJvESxKQwj59PkhKbgBhOsaUmb7NrjQtIYcciUaNr+nuHdW6SRIG4GkZINs6k2M3o7qQ3ejExac6xuVmyv17Eg/IOeCqyJ4JMvOxlQ4Y4EKsE/KAdNnzeYs55CxN0/GrFhIyOjue+c2q3LA6ttuLsBZema0X9L5XC2HfbHtj1M7VZ16XFYHCcUO2P3nw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DM6PR12MB4484.namprd12.prod.outlook.com (2603:10b6:5:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 02:13:17 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%4]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 02:13:17 +0000
Date: Sun, 15 Nov 2026 21:13:15 -0500
From: Yury Norov <ynorov@nvidia.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrea Righi <arighi@nvidia.com>, Ben Segall <bsegall@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@grdncc.com>,
	Mel Gorman <mgorman@suse.de>, Mete Durlu <meted@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH 6/7] virt: steal_governor: restart sampling immediately
 after CPU hotplug
Message-ID: <avpmu_Cfr8THqhHO@yury>
References: <20261113184257.621707-1-ynorov@nvidia.com>
 <20261113184257.621707-7-ynorov@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113184257.621707-7-ynorov@nvidia.com>
X-ClientProxiedBy: BN0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:408:e6::15) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DM6PR12MB4484:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c12693e-b9bf-4bad-8194-08df43872d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|7416014|10067099003|56012099006|11063799006|4143699003|261022075727099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AjlwU1co4x+RPLhQpLpRvA5KxazPeKpOoDqfpvN9ogkWbQiuZTwvx2C1DdAYgtlCe4ycNvw6+cZg11NCFzJkqI2PU5ivykncdqHO5YLSS3hDNidzP1ByrPfISGJLMvYMP+v6PdPhJ+namZvM4LLJDHbJZJOEzIyNDU/z7PLAgZlsDz/4XkgnLTORHyXsHvce3FXU660sbGf8uTEa7sITPHUn06JUeA/PhD+rpTAWGTX7eGjxzdyc6Ge2sX6RIrdHyKxs8y1KCLZldXOoRWBoBdJuylNLCeU0otuESJHxWOq0+N26Hd5cIwdEUujI7TOxTkJNAZNd2LR3pm7tr+sBtYWTfANwsWIQe66Fu/IPLLq5yJZmxJIPZ0KO5iJKp2GVOMfoKz9r6SDYkpfP+UfRFrymnzqs3N2RABmYTghYWxwLN46SdJ/1p9msTvBdpTCUG1QRG5XBuF7M3AVKnEBCNCEvI/aY3U+bRBuZQCFfr2JMjnVPrwXyT1oW4GQF4iqqJaCk75JCyYx39ohC2SOFTMpZAzzbsrDDlDIMQXNupLBYNgyFSzifBp15XrO2ypSNJ0OUpCDSlJshj7UucnxXsKF2d94TXZlcOlxx9rZeyM9bbNqrH7lz68R2lBty1tYuFLMYMDQkMe3NgqYo0NWVAOqmmLOcXrfZIMiVc5ykC14=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(7416014)(10067099003)(56012099006)(11063799006)(4143699003)(261022075727099003)(261021123027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+VB+Hre3yYTVo6BsM51U1lWs/BDSupWDl3iKU1uzFFRf0DMyMuTWMZQp5IIf?=
 =?us-ascii?Q?BJnKmJy+UxxgPz0c5pc3pe1EJInBPYPwe9yldAjqcWPOXUUkYZZCQZcoXh9q?=
 =?us-ascii?Q?ZqsapAznYDgtzpCh8/6tfVuXDJQbnX69nMnX8pi5QsG3ZD31y6RwUAn5Rwoi?=
 =?us-ascii?Q?0/U4MZVKqxR/PxmehTyoVFeM6CGFmWDXIwC8n4fllr+Ei5wCQV9mtuGeG2Z+?=
 =?us-ascii?Q?mBnpFA55+gbnmK/Zlfoui797wYvb1ORcgrY4EzOFzNi5uhooG0j81kjJEFJX?=
 =?us-ascii?Q?EKH6In+thUOnPEaS668OS42K6PoUiOd7krnmHwP/ov6/4EDfQm7p0xqcLXRS?=
 =?us-ascii?Q?Ct6EiR2B8qA3V22sIwunAg1FPZ09L8oFKxNf8J/JxJ8KOA36IBMP+RJdmjEM?=
 =?us-ascii?Q?FrQVmygnyGF9v81px8CNLoIVN/zPGNGS3kvAKeEuBHiaI0BpQsI3ibitLHU2?=
 =?us-ascii?Q?OADhyA2lbkWowkBGaj+Wl8J/o9cFMjyFF8xo6dLfIbGyynnD+LxW7S+bYDvw?=
 =?us-ascii?Q?hJqy1IZAu0bUX+/RixpiTXE0RpiXpz54lvA3psDifefK5pzpPLahw+ZFXf91?=
 =?us-ascii?Q?u9dAVX+JPRP58zT0GEHAvDHKrjevbllWMvW0n0lzLnmulzYto+vHWIiJ1DZp?=
 =?us-ascii?Q?qZgaWUb/reQimG4VEHiSNkuXtbRaLw8Ua2pS3RLrOl6WjODnhWFSieuT2P9+?=
 =?us-ascii?Q?dJMfUlifrUbFOtp1iEMOrNGrLIT2KCiKQgEEgnG709s3/OdWDPvpljOOUn1X?=
 =?us-ascii?Q?ThiJfHgLyy51mCydJMsuFsf5Kx5x2GddCeQWMZgRvmOmXXvcU2fygQ0SPjla?=
 =?us-ascii?Q?gc/Y/63bcIL+3XzaHGm0Wja6aiVOrLyxLCOTGRWd0XIg4wMS+FgB413jSHnT?=
 =?us-ascii?Q?6gomYVr4D4vPllCtRsP+lfAsPTpXkRUOb593BfSPun0f62yiUKJR6Fde32A1?=
 =?us-ascii?Q?+dQjymj6Q6M6Vhbew9IVi4s5QDOLf+h8uESYSe1zSqPqJI0j6ZVc6LexHzVr?=
 =?us-ascii?Q?IIvsVa4faAqDBHgp9xrph82IwCVrn/55mhW9bGGye0u8Nswchw0+CKLaKDK/?=
 =?us-ascii?Q?C1NSpCRPHJl8hdJEh2Putjrwad/h3lTtINqBuPAO+pjPYuMfOIgZn2KVxKo1?=
 =?us-ascii?Q?Ji4odGldR/OHAEXkD/8hrDE2rKJSCB90PXzBE70DpKPIU3ZODLtCCeu8ddy6?=
 =?us-ascii?Q?xHnWGROqIxhUN7dnSpl/FUnNxprr0jhju8kontCKQoYkbOzy7iIhBYbZrckD?=
 =?us-ascii?Q?tKJJqoo0Hxa41DoQvOafFhtq5eaAju4FK5YVt3kqOysWTvvXcuL9tWyR02bT?=
 =?us-ascii?Q?pU1InbiUAjurk/Q4bfmjTlA7nZM7lSZb6DobXB5CuIExSG47inZfYQUg0PiU?=
 =?us-ascii?Q?5cwWezy8gqPkM7qqZrLN/zeOT9wvolIoTUDifUThAtFxrew0WsXLBY+t7tdf?=
 =?us-ascii?Q?h+j/1s4NMNgb5IqLz6zEt0RyNDVeWn5Sspyoe624sycUlGtvjTQIyAzFKmN4?=
 =?us-ascii?Q?cnpmxwJQkQMkqIpbmFzZb0S7iWRhQFwU6AR92YrLzemK3dEl3rkaxOMj/+eO?=
 =?us-ascii?Q?dmhzOJftbW5rX+4ZwE1a4I2P1RNtjYsAWd/bCng2IzH57y6WhelezPeVoDeJ?=
 =?us-ascii?Q?Njszty0tkMaJLrwBsbl3/sBJMVdpQbfEogRWgaSktiEHmVoPYgOrareu2fRJ?=
 =?us-ascii?Q?98fOvbSgms8txL8aird3+BGgxRWkjHf66H27U2KHjbVfo7ME2fFtaqe5d69s?=
 =?us-ascii?Q?YNIXJwNZAeo0ndIL13T5bAboXN2m2cX3yE2Lkp8GAD7DhtCBeTp0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c12693e-b9bf-4bad-8194-08df43872d52
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 02:13:17.3133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3k95F17Qxl/++0COSY99TTHH+mT8fu1AQThUE9wX8/A43nvZoIlcL8TFhPFZcSM0K2zrPTQ7Ng2TGMOyElMPCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4484

>  static void steal_governor_loop(struct work_struct *work)
>  {
>  	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
> @@ -233,6 +243,11 @@ static void steal_governor_loop(struct work_struct *work)
>  	sg_ctx.steal = curr_steal;
>  	sg_ctx.time = now;
>  
> +	if (sg_ctx.sample_invalidated) {
> +		sg_ctx.sample_invalidated = false;
> +		goto requeue_work;
> +	}
> +
>  	/*
>  	 * steal_ratio = (delta_steal * 100*100)/(delta_ns * num_cpus())
>  	 * To avoid possible overflow, divide the denominator early.
> @@ -254,11 +269,14 @@ static void steal_governor_loop(struct work_struct *work)
>  		return;
>  	}
>  
> -	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
> +requeue_work:
> +	mod_delayed_work(system_wq, &sg_ctx.work, sg_ctx.delay);

Sashiko has correctly pointed it should be system_percpu_wq. 

>  }
