Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012068.outbound.protection.outlook.com [52.101.48.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC10317169;
	Fri,  1 May 2026 17:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777657879; cv=fail; b=ffRRsFukh7X1eulLlETFeOZmAMcqzkkAo67fyCoY47VQZG9GWUcynOahZLpmHU8j853AWUKpud1KO+XQUzZbKPQ7ZxqxKJMIlaq9gSBhJOYMheEd/bTC9U+jmD4ZuJQlXr5ZnyDuGULt91RCNbAsVtxIi7B/G35KryF1LNykkr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777657879; c=relaxed/simple;
	bh=WNJS9JWm2QDlyKjVZwVytP1wctQ26+DnL/USg7XmCDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f6edbEoTdCbQN2ApHKnsOOY+V5d8vIigON/5W562DsWtL8dfQpTYkFD9GgE0KCpWtN/AOGauVGeidn9HPG8scAic3XPr1eEKyytrHtZkIvO+ThHAHx9/234cTc7I/NPbVBTIDz9cVdqSp+fQWvXnWkBLLWBmlzcJX4F3+U5Wy0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nWryic3m; arc=fail smtp.client-ip=52.101.48.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nWryic3m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdZbUjsCzHU/DVjlvlkluLCtvmdFH/lEPLrtju8/LRwU9RU21qFW44C4TctHP0fFlmRkh/EcXqViCyw2v6jtQhbFG/xmWm4i1Kxp4hRfkOnGU+DJ8y698DKWt99cSAu0K+m4xstxG/dYfzMCJWDZqz3YI9nR6oDDJh/qBTYyGu+1iZKxzbJo0SR/4dGK7j2lo2T4+ACR0dQREE10cybuus3lY7OTzaQ2/N+awKdNktmQDhjjZSO1KFICYStcG/tA3CLhmDoqI2QDRxTR99axzVX4L7OSyxNbyedxACZL1Tj8pTMduJHzORMmijC/RBLHprmUByPF7KrASoPjEhXn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDp7nbEe5X98agFsJAFCbZRO9qcA6O24B0aUmaM2yNg=;
 b=GnSDQxkA3Jm1QSI4jLqQflTLk671LGQ9QptXzEUOcQMIqDoQStl/Jl5LzxE7f0CaHN8OgfCU/1IifesaeTnSYPm4c88rqG7atxjazLYqiislTh8rl3ZiIPzoH63LWRs1W2bGGFx0TrVI3qMhY7c4Su8nV3gLNiHkSYgXjOyes/uDt1XLjjShoIqRjJYaonbZp5DT+3PD6k/Ai0mCVQqqD6yrm9RFlzTDQsx3HPWXVDN5fVz8QnVg8gHWysm2X1VlFReuFvKzALIlZRUkBh9ilF5mCb5GQqhfq8I2WXw5sid1u2ThlEFbmf6ATaMyg6K9zxEvSq/DiraUhPwD9fMQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDp7nbEe5X98agFsJAFCbZRO9qcA6O24B0aUmaM2yNg=;
 b=nWryic3mRvQ0Nso9f/w8kiiLOxNBR/EQHjynvkatjHmZFgjFIoTrd7KnxHHu9XiLLh/AAM+4Y3FBWldDdGGCEWenQde5tDEvj8FSYgv/DKXN0yZZosdCekGw/rThgdzrwpHEBKvROnPRGM09KV75AWWiNxZbpOH9HqgJomJMT89Uj7alxknY9ADOdIqASL6M7wgM5J+nu+qmS9Kpd17L1Gt8hZfb4CvMPfumvot3EboILjOXS8ytwxjd441RVIQ/VuajBhUuvM5B4xMg+8mDqqx2cfFIk7/7qThTu3CX1qVorJkTcvdAsHakKQosYkbfGf/EJWDB96ThL9vLeipatQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22; Fri, 1 May 2026 17:51:13 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 17:51:13 +0000
Date: Fri, 1 May 2026 13:51:09 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v3 3/5] rust: io: use the `bitfield!` macro in `register!`
Message-ID: <afToDUV3gNdPk-bw@yury>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com>
 <afTnQ1KCyybUE3pH@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afTnQ1KCyybUE3pH@yury>
X-ClientProxiedBy: BYAPR21CA0021.namprd21.prod.outlook.com
 (2603:10b6:a03:114::31) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bee8d0-36b9-4644-157e-08dea7aa3c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	tHAZPzb1+8mgy3RsGt1wCnlrHWHkBJKWUkldLG95jvsPON8JOudDpIAWjJoD+GKOtFXh2lrn936xtndkSVGXIbQ/v1SWIkA6SRK3DkHhs1JRKK3WTI3booeax3RM+JRCa1Aa5JbMV59GQdilnR5dDxk9KLWAyncXZN/IuVJmgRHcLSM4BTmbHXji6aJ1PrIMkT9Pf6voIKSVcD9vn0IBwLtKvsN4CThLnCVNkGT1Sropi415wtjZyaLpZzOFXEutT94t1CmbM6RgGtQdrF10LDvXW4XfA5FKEBqTfhNOmUf9D1SduXulii2/gWycPoqP9F8XxrIm3TIvBhQto2pYttu9hA1nNadJXvnlG9kRb4vt+wMCTPhv/cmcUkUWn7rFqI/qqc7elEzJK3KfE1lPU7fpJi9tZy5HMpXdLJRqorUP0sNIoiFo2wQ90TbTgRI96pHxytRvQ8pu6hDklINHeBV9n3mc23jYZJidrTPRfegMAbNoYFGwrNpAuziSFV9KvP4eZFepQNUse22WPhxTznVFqE/V0SWCAkEmcrNKO/n51b1Gkyf76wsUWBHUq/jPf5X3TZ+CXPWZe6BPsB7QMkzfFI23inzb5R22wNFOEJB304ZcM+T3gu4/ceWB9NeaE2Dg5HMkL1j65H2CX5+gKk0moXXtJ2Z2rBA/MeNy3cKJCn4pIdk64KbotFyhdjvg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gHD6mf6I1n1H8n/rfLZyXI+urr4Cled1VEPVpJ9CDriCH/kXy5/uEA3uKA8X?=
 =?us-ascii?Q?gE6ddOezUQUWsrTSqjzhHiJlV1Cfs8zLg833RFXqQQmUo0zrz9KP6W0NeXyp?=
 =?us-ascii?Q?UYXFX9dUFUsCMT0bi2wwDcnHJbQSvx2K7jTenzONETHZYQLOUl1c6OQofHb9?=
 =?us-ascii?Q?0BjRyMYw7EMRJ4+mPc03Bzx3j5Jmqho3qsfEZHe06GvI5p0O7Sel7N9pN+pr?=
 =?us-ascii?Q?YKa5hDaPPlb+B1gqOHBoQcVSRFjma6WnPWai40RK1tVi7kM9F68arq8fHHzS?=
 =?us-ascii?Q?BOztqZQuNnDz2EGHxkCgVns8tt7M2ScVjKNihhyaYrdFldDmJYTMPRsLjsYm?=
 =?us-ascii?Q?WYpkSdjPzAR7blicyYF0CrDotWzdu+6l+8o1pHZcFBlAVAo/iY58UiyMAdjo?=
 =?us-ascii?Q?VhH4H79tgaRr8Vtgl/f8yD1MKEttFSxrd7q/Mvo+x6qe9Gu1uFlvmtAin4qX?=
 =?us-ascii?Q?HDCLf2qHPoqH+zHu77Jas8TuEaeGpTkMSEtRi5BOq3d6bGrScZPhSOldwE68?=
 =?us-ascii?Q?wb+hBQ2GLTUjY2kNJTZXY8sabPtw9l4mZBpIIJJVn8Q/1AzBJNnMDvJ7k0+D?=
 =?us-ascii?Q?roko9v8Oi8T9YbnZYjvvVZrwZa7y8XLF+YDWo9ChMfgLd7j5GAAJ1NcIrADw?=
 =?us-ascii?Q?1zOLLaRRqk9BdX11lKFOYCOug3HRPlVN1D622+zRIkEkEUyDMjuaxEVjKQjd?=
 =?us-ascii?Q?6bCe5Y/XRESz20Q3uuwwXGLUMWZmLmHwXjNLs78LoNfpVmZyXsAPZIX5V/Aa?=
 =?us-ascii?Q?wtlzC2sZFl5xR49QizCggFDYqrucTey9yY8q3bKK4QPR/PtKJH3BpPuLdN2h?=
 =?us-ascii?Q?aAYf4ipzeGazfqoDwgc/5Dn/iLTYVYhbg2eTUw4nrZOef8ldAuJX/wclq2MS?=
 =?us-ascii?Q?0ul2nFoIAmkOlRTe8jVJGsG3ybBxCQT/EUkxIcFRgUA3qUxGePFTA5B5rxXg?=
 =?us-ascii?Q?kh97Qc5uGy4QzCEzGWzzxGAtdE6UghBOMv3yH4QeV7XtFoDxrBMxaBCwFLHn?=
 =?us-ascii?Q?DCZuQrSOLHqJsvZblj9Hf4lUGk+A4UeiN1evofUxF6O+9BDP+E0mWZkUCdp4?=
 =?us-ascii?Q?IllLTETkIlbtpkv6GBjNdjoJfrdLL0bNLvOGEbFe1mct+aBJj+AjNzVrEFvR?=
 =?us-ascii?Q?U/nxsYHr+gB7iRnHxOvkzTKLratudF7NFuvpuRvMdGgF++BGNqMPK9scOHQY?=
 =?us-ascii?Q?cJXnyUghcmoBP7YBaZS4Xz78qip7jPmoQqgVbiGIiTCp22QSHPOy5QOaIc4+?=
 =?us-ascii?Q?Dx9Vlrk/UvsJ0ix1zaJLJNf384BW4x7U0krFWTrkPYOoXmRYzAJETUWEK8j8?=
 =?us-ascii?Q?MMUoQ7tVx86kVXFCo8HLay9kNzzNo2w7pXSUnuyBGYe05d9bcdXVijShAUMu?=
 =?us-ascii?Q?DXo3Tsl67dbbxKs4HGjB328p5At8xVz6JzgOOd/UUTivWi8lOIYAcj7zT9gm?=
 =?us-ascii?Q?OA6I8vZGxDqZ8XqAzDiOGmoWJLw6fN94WE5/XLVgUvPWTaMRqvzHpxYoJaPm?=
 =?us-ascii?Q?jnN+y01RQ+C4a40CgZrOMIiTxDjmWa2StfMfF6lRqcEjIDd1IKlkcCbPUA22?=
 =?us-ascii?Q?dPvmdjyUEiVd37UvuXy2kw9eMxs7otBt4Hsm5NUYFmqkRPGE9oYwUC1fBOi5?=
 =?us-ascii?Q?e50TrP5PH6yanb4BFcv7S4VDckREeMgfjvU9BHgrHpXfWzk+cDO/LIvAtjip?=
 =?us-ascii?Q?4p3JJX675MCSTDsQhbSXnlpgQVX1hK2I7Kf4DgUfkgrRVzuJdPN3Iq0iHVcs?=
 =?us-ascii?Q?8P9p3dQtAwGDqrhQc7WSpEMu235HSizzNEUBio/raB3NkCPVJYJY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bee8d0-36b9-4644-157e-08dea7aa3c17
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 17:51:12.9682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9ox9sLQ5An2Mej5tm3zfsTftz7wYIE5SFBAMvaRAH8OfHvur+77ubAVXYa3nHAJTbHcQINoQpU1cGIfTCdUkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069

On Fri, May 01, 2026 at 01:47:47PM -0400, Yury Norov wrote:
> On Fri, May 01, 2026 at 03:03:20PM +0900, Alexandre Courbot wrote:
> > Replace the local bitfield rules by the equivalent invocation of the
> > `bitfield!` macro.
> > 
> > No functional change should be introduced as the `bitfield!` macro has
> > been extracted from the rules of `register!`.
> > 
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> 
> Acked-by: Yury Norov <yury.norov@gmail.com>
> 
> If it comes to another round, maybe split switching to a bitfields and
> getting rid of the bitfield_core? For maintainability reasons.

Moreover, you do the same for the other piece of bitfields in #4 and 5.
