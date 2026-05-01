Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB07284883;
	Fri,  1 May 2026 20:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777668094; cv=fail; b=N2oQMrAevGLxBNlaFN02nHROGYkwvB1p89SOOukk3Kcd1HooATkPG6pEUbZH9gla5G9m1vAET6ZBWu9oPC4qroXQXRokmBm6CzDzh3xRSz8r4PJBio7vJ79JgTIiiGrmHr0f2sX/uRPmBXo8dpfK3R4GJPfV/OZvPd27HfkyPGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777668094; c=relaxed/simple;
	bh=qAJWuSKR6mxgTmFIPVQsPlgaWOciWI36DjRC+pGYPt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XDK8UaFgHz+R0PPS63gScFC32jjNjqeHxsqSyudy0H4gdwkc16CbWGbU2buy8lBvwd3Uf6w6evIOx5OSAcYZtc5OP1IgrAc89Or+u75zGgyh/CD4XJm/9wTDZvIRei4B1f0Xh5U67+snmG+Q4rH5/LTU1JrckIszRXc0uq1tORs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g/Bl8iJQ; arc=fail smtp.client-ip=52.101.62.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g/Bl8iJQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkJUZ9jSci9eTlA+68sqowKRNiX2MNM3vYUCC1vntK16ZMFdRLNv5beXZPeo7hM8KDVmk95c6mvvDict92snk4YbAbQ1fYVFOZCxhqvk4ILZnglvM05e1R9dM4uorVthbzzmJmX/ve4VpdyR1OYdi1irZpTBP8bjGib9O+7qb9OL7Shd5FWUcvruFTz0H1QucVFNNUUswqWWjBV9H/ApMA3C+pRYLGI3QSdbQ6wagKvd/BOYiP7P5q9vkykpyrpPqjznEAxjcN27ahfMg/ltZciVEcDW3bhbFR17fuD922CGt1LdfTT7xIdNfgC16ey2Q7vbo1AUIi7bQAEqD3O05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6P8NZ07YhMCdle9aND3zFJTvy4qfxi2pJ1gTUyyCbA=;
 b=Nt6tlVEB79+XQ9BbhnTmXirY7P7KY7ZsxikIb5w10BlMLARSZ2By0//s2GCVr+Mpicyx+1IJMgW9lKLp8rzg0fW4jTNQ7MArq6sPTb9g5jmOAZqmBgQkarCusaO1PDPNCLlG6JyeB5hVTAPcFQpJgbY9QEXmeYstUhwyesdXJFiclQs/e8F7yrjt92UT+5MOr5ndtnITtQioLGSbkYAq30U0tCE8bgd+oteNqOe07C8xaxj9W5GPvhkcrd2QsYWwco9d/YaNNnOShq2fukqz7FR6Tm7FTT4X4gicG5438wxK3A831NbCORvAQHR4tMu11T/8bXokwj7aAsu3KaufXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6P8NZ07YhMCdle9aND3zFJTvy4qfxi2pJ1gTUyyCbA=;
 b=g/Bl8iJQEm3nKPCmaw3Bi5PiBKk+1MHFV484Gk24b1tDGyFO+cJeFQ6uxx7Ywdbm6HvdSFhl175ICdR8sYiVeE+je9lrB9Zr6wkxvnff/WLS2boWmMTF/Fe/FVYLwpKRpBNLZxAGnDnRhmJw+oa9ya054ww194Uv2E0YmOgThGy/RoxSzNaiaIeFvNsGOiVDLxJ3ihN5gPf7hI3SDfaSOqyCmG+Nomb7eGN9ZSoE6dxkqqGADnHmP5jx4R1vYwr1MbITcGkauRK9C4O9ldhQUF8TJXVtXw5UJI3QjQHcJQvKQ/ga2aHV4WJ/MePoaxjme7PyTFCw9XF+qRcXGRtwAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by PH8PR12MB7350.namprd12.prod.outlook.com (2603:10b6:510:216::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 20:41:29 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 20:41:29 +0000
Date: Fri, 1 May 2026 16:41:26 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v3 3/5] rust: io: use the `bitfield!` macro in `register!`
Message-ID: <afUP9laA5xYWBuc2@yury>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com>
 <afTnQ1KCyybUE3pH@yury>
 <DI7JQ529XI9V.QMFHCU2HMGSN@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI7JQ529XI9V.QMFHCU2HMGSN@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::28) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|PH8PR12MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cefbac5-46da-44f2-da94-08dea7c20570
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+PXHZY37JxjUs5IodNH8qQQmF88DICr7/jfMzba1EOzAArggJSySju/lg5jmzuDXas+e1QZ/H7taaxLKJ/0MZaXufLsR07+mQc0Od9Fbz2+UyubBpm0cXcaF26h+gjlbCygsfyEc5xE8GZ1uM7w8eWzf/ghHJJDsH0Ml1HsL7Kw/rc/AJHjAlrqu3U1fkaWqwALHtFeLVyX2Xohp1BP374wdCDLD9wxQmNFUYZW+IZiMJXtjhc4QeCrrL1R4GGkiRXrjWs6LX1+xdPKAMjED4ZIdQbzkTyA590a5CCOYHvXp3fPL/k0xLHfPIo2pQbUsQsotMYczIIOUygfpweDgAgpWq+pKmL7ZvmbYa3sdD/KSpVS+PnsjSSv17AzmuYtvL4lwiCRFIIvUxy8h61O3miHDrHS64pjMYNxOVpo2JkdIYHse9I+r76m+9ZGco4D2ZZ+6BpLNxtCRmSz0I3IytnzXrYXaOT3ewypkrilRlVvOvonYhgRb6JiLQXviSdlpFR99yYpLYeuuGvUQUOMPGAZHsvv6aeXkpr/raC6yMK2diGkKxO/cBKtQ3b8HDO0VJ1Ua0I45Ly4NL7GTOavVbR+fpWm1kghEhWBkBZ8yr6dkK0l32oJcNOb+Maqyofws7hMVyysqf6EGqCyuY0YybsydyCEGjV0koO0SS0NJcaWx+QnhkgimJbZACp3YMS3t
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H8BvNN/1z2xliM/sOsmaPqbKx4R3f/FUeXgHqVUuSMJ+lPtL6cpLJDXkCPeg?=
 =?us-ascii?Q?SqxgypOkxqSywuQaWr0UwyQvCHPGDVYBvEwGivZ81eKsoXsvj8QLpEe7QUqX?=
 =?us-ascii?Q?az+9Bm1d9Fg+ntoM12XRba+tcuym6WtEk7cw4hYAsxR0XizlcJa6EBoEHlip?=
 =?us-ascii?Q?f8ilBgZrGb1PZcTmeA/Dt174eHBO8WDKzAG+23e7jqW0tFaexcAlXzFYchKY?=
 =?us-ascii?Q?LIAjInVZixmmP6aC9zIqsvb9z4YOXa6R5qMFDFP+7UTK8AqaLbPEveN56f4y?=
 =?us-ascii?Q?XjqkJHNVG+UpmC8zuf57mWKMQd/Eg1W4mTP1iLu9Rj13eQuxOxgCnjzkeTXA?=
 =?us-ascii?Q?jO2DtAZHVI0gR4U7kBV4vHKyWKGhca8KxITKxJtUJ0zp8k4XbvQsP1KSLpQt?=
 =?us-ascii?Q?4BDgp0ty0xBH3VH6cUtxDIOBq/a8QBxZehx62FAD2y8s2PB7hCM7T09mviPx?=
 =?us-ascii?Q?0b4jRNGvDeNjOvjn5SwGAL9J6cQ/RCYYzM0L1dkZFd9YKqRwpiHIDq3jT6f/?=
 =?us-ascii?Q?fupjab4IiCEKGMfU5wUUOx7u1IWLbqt99bP/eDjGCpGTptjvBKcHClXsQYbY?=
 =?us-ascii?Q?0Inx+70hSt5nG4XIcK0KDzrdrQgbWn0oUSpbRj4ITUoIye18RI1CBTGtSXO7?=
 =?us-ascii?Q?Dh2ZHefcpfd1AGfUQ/MvKHq/67QIcASjCfKVii30Q50MJE7V2nrQ4G474OTs?=
 =?us-ascii?Q?RV0FmQuQFX/tiqnRkg6hCe9bmGraMc0aAZ/GaExRpdie1GOpbUIgE+ET/7/3?=
 =?us-ascii?Q?eQRkOYxmSKrWg1lomy0UFt9SEXZo0Thvq2w20dt+pi5Rn0+CsVjtOt4WCY53?=
 =?us-ascii?Q?KmvVHpE51qxZdJNjzhePVn3EKL5B+SDmJ5F4RpNA8ll7E8JSaWNLEbQ4eMeK?=
 =?us-ascii?Q?ETWrNJM5j1yIoki1rc5Giru8zUKnF0xLMaxPPzNHv2pTfY0FJhz9PAeSLfdY?=
 =?us-ascii?Q?k4rsFbP8nYRV03hDzoFGdv3U/5JwqrN0gla+i8E8NTn660t4fJ/nqvedqTj8?=
 =?us-ascii?Q?9g2dt62LsujlgRs4YgS/iKEj0VImFs7WavyKM4RElgqe1rnxDE5hJTNV8Iso?=
 =?us-ascii?Q?XtdJzii6ZR1jVZ8ppOPEVaZ5SAZRfe/KtOEvHSLqB70Rzp8c/Ko1+gDGd9sh?=
 =?us-ascii?Q?gRNVgkKTTTxO7vb4dpBoySOxWdegRE2G75FdpXB3eN4dMWGfJQQps1ubb39o?=
 =?us-ascii?Q?BMVWPRjrRrmSpAj+C74++14fQiOEQMOb5NBkHsgTwx+DB9ptCjd29mcOrkAY?=
 =?us-ascii?Q?SNYAbYOPoCTCDs2SujtCyjSa4ym7Fo+RXgDXkpq7NUwS9tN+NKwHr+ODpX6a?=
 =?us-ascii?Q?xmsJRbjzfkE5W7ALkY+XXNZDXY9nqNCcgX6y3ZokWYMp4KFabBaH3UK2amuY?=
 =?us-ascii?Q?KxTjJQGTTRSlkf5q2YVy4/cgkcNrGJmCnuh7clUlzwlFKtgIeF6YH8pTCpR6?=
 =?us-ascii?Q?9kVjlUSlW+sQJ4qBOlSHQmP7scxKcYDrL+IyHhnXJeoXltvrrheUI0DxmXfv?=
 =?us-ascii?Q?BwTla35bKeDxIPorr8vhBt4h1UN5P9T9ExwwOFTBZelJH9HeZixh8ipBFoWJ?=
 =?us-ascii?Q?kcom1WsIr66twfPsdQnJYZgvVUyBMJXtEPjxWZvaeaYgDwIfa4OCpV7mKJi3?=
 =?us-ascii?Q?ZcqJVwXiXpkTSkc5exdq93fHm1ZQ6zQBu97uxr7/WvqykKq6zp2mmmAJKsod?=
 =?us-ascii?Q?PnMe6gGpxlFr4hnLPpoLqI4yFkER3jO/ejlSVuJNT/cdW+6i3YP9T9C8k0bz?=
 =?us-ascii?Q?g2T2JXzzEo2JiecbtuDw2zxmtjVWYHLEfwIsHpkAoig9Jg4oU1yC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cefbac5-46da-44f2-da94-08dea7c20570
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 20:41:29.2495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz569EkO/AVdDLCPuhfSV3dFbenBIPDP46Lg/Czc/A37dChW7NV3rnsDUmLPrBjxgNKThrZ179EEbbRUdTMBDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7350

On Fri, May 01, 2026 at 08:19:31PM +0200, Danilo Krummrich wrote:
> On Fri May 1, 2026 at 7:47 PM CEST, Yury Norov wrote:
> > If it comes to another round, maybe split switching to a bitfields and
> > getting rid of the bitfield_core? For maintainability reasons.
> 
> I'm happy to take it as a single patch -- the deleted rules are dead code the
> moment the switch happens, and the code is local to the same macro, so the
> intermediate state doesn't seem to add any value, or structure in terms of
> touching different components etc.
> 
> Did you have anything specific in mind when you mention maintainability reasons?

I only mean that if there will be weird regression found in the new
implementation, it's better to be able to revert just a single patch
to restore the original code with no side effects.

Just a suggestion. If you're happy with this, I'm happy as well.
