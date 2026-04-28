Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0680632FA3C
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 08:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363303; cv=fail; b=V7oMBL39ZLNa3Ea0gjLep7nHC0xa29jLPulMJaEz3G2pmFxP8ZFh0tHoTb4o3XR8J9gbJkZlyMsMNN2K3hvWhLnptfMXiwF4is3UoeBfaDQdQaYmdtHfy2vj5oguJqa+SAu58ZuAzVt3LoXtNDpfel7VVXPuM0cbRkNsCMDM7ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363303; c=relaxed/simple;
	bh=4L3MPY44LeyEaZg3eu3yE8ZDCMv6ndf0HuILPRQWDeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MB6zO6sx34E2jO33LtihOT/9qbzUhlAOferW+Yl7I9E0PppdlxFnu4n+pFF1lvkaWbY80Lp8EhzCgAp+rwVJCY5FvWAAe/TtXuvC3Gf6b827pqC6GNY15AoiFnuDP4kwphG+j+cYE2Xnl5/O6uJ+kXB5fzM7pAJfdKFmqbSkomc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech; spf=pass smtp.mailfrom=est.tech; dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b=Z0ZoOsD+; arc=fail smtp.client-ip=52.101.83.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=est.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=est.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=est.tech header.i=@est.tech header.b="Z0ZoOsD+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFWD5dYqNg2QGcx1DKkZsefZwf+wPMBHHgD4CdrbstUyMWOPq/qSqyuZ97jUHY+0pt6xGlh6JD0zg0s4iWAFb4tSS8G51cAurj2YmL8pbFXiAvAYO03896RaqPhc6EiBW3afg8gw211QnpWrcH575vfG3J8ZXrNCyzAzBlJiySAFmnAUXORuWPopOq+5WAOgZzgP6Wz5blX2xW8v+uy4zFx4znTOHBAK4lE8Q41sUnqS0Nt0QyJUaSe+A+YuplyrB/CnmqsxDipjcUuftk2NOQHTJKR3K7Jv17JbTYLKhf/oJ9x+WqGOCvWxwHZcNeV8sKAO9WgvR3R/0bV4cKKvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYxLIO5gXXlvHzGovlklBeVKC+GLODsXcWd80oHXVxk=;
 b=XXnvL0GluhHelM4zoeAHIgapWMPlj0JJZrCIUPMZxgMBW9nAmJ+vc4LqfxwbbjzryHQX0WkBuxivKR0bPXwex3OrkW0JaDAN5M4aoGxvBij9uMeg2x4uGgln/2Pmojk0hxKf8Hsyg3Ne0Ymaa8MNoPOy7b3AwMCJeroTcmvRMS2j9Bk35qR6w/ZO20s/yY9F7yAyJK8S5UA7RcWOMyf7USNBtwqXy7GZ1UPndwhxaHHVuep4N39VCmXaCf6YFm/AYlkST6ULJOs2McMNgfRnaYobObJw0gq7eFRfWh1G1H841w3xV33DDm+/elzcRNtTWVTOgnH9aKVEQeep0MNlTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYxLIO5gXXlvHzGovlklBeVKC+GLODsXcWd80oHXVxk=;
 b=Z0ZoOsD+fAkOcL8zMLlYGCe6Yq2B2gkqDdZIrYUY7ef6XW3nWQtVNX0X3busM/KwVf29JWpBBw5P93JjSj58v7yjksjSUsskM8CMYHeJM3ttXQQtTph+8HvzwFvva0ogxoqBD41FtPLRiWkAPpmgI5dygqW8Jv05jmtsPPtDPlKWDoOSylsJnW3uwzQHr7gSPP8+XR+4EWb0SiRgcnizVINqAM4dwyyygOpqAsd8iZmGiy13iYeOeo9jSQIK19BbbZiKDtLQSkMiOil4vUHTOmdOPrqEfS2NXK7Cz+6tYwpT4QGviP1juH3jq6yU3wMH9Xceud05gAr3xSTnW+urIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by AS4P189MB2111.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:517::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 08:01:36 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::9996:4371:88cd:bc04%5]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 08:01:35 +0000
Date: Tue, 28 Apr 2026 10:01:33 +0200
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	stable <stable@kernel.org>, David =?utf-8?Q?Nystr=C3=B6m?= <david.nystrom@est.tech>
Subject: Re: [PATCH] kernfs: protect of->kn access in fop_read_iter/fop_mmap
Message-ID: <bw7qeqdc7ptyhxc6bgjip2jkvcuoth6k4dzchikwlbeksgx3y6@mvyalfk52sjy>
References: <20260427133521.62793-1-ravineet.a.singh@est.tech>
 <ae-ZiHku9wRYqfyo@slm.duckdns.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae-ZiHku9wRYqfyo@slm.duckdns.org>
X-ClientProxiedBy: GVZP280CA0025.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:276::16) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|AS4P189MB2111:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b9735c-d785-46db-c4dc-08dea4fc5d9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	uY0KfLfSnro0Wj8Slb2ymB+y0lrd627wtYQJ6mmQJLcczYD5q3OrecMNv12TxWYyGIgnsRXEOozza7eu0cb9or69KBK2+nN16+lLm5XMZ8/+ZTCxEkGYngsbWEHySjo3StFFEGz2R8zgeaT4VCWN2BWCINsP4XWK3Xbxn3/6eyW6akuCHMmbQ5hu5fVuQzoc3K8zZoGOq0oXERi5FhtQtWEUBrHxEedoMIEcOb1qRW/8kNUxjXJnOPulI2/dbzlqPNknwEvKH0g50xT0XTFgvm8O0x5f0UXc63SaIHpipMgwGWZof+YJMV0uLYiJz6vICQgp5QO/NHQK27cbTXaZKX9FZU8zKKAJ+nBxtvuHHwo5YR0VZHyib8GYwz/yTZYi1X/G3CpcvgSrO7thO05IabecwWf308OBX7deWeMBttyCwyNCmxL6Y53umdM0Q4bf7Fr4lSjjW4mI0syJ6g17Qs0b2oecBHm7Ve5FLQyo+fjsjSoZEHep5qOkYD3THLp7utk3F5KOT6H1hKFVSpXYFL/en6DJzWP+fvX2lOvdPNci2jfJKgf22TioyJPakRPPEFpxgmrNz0NvWYmW6pjB1Wr7fJLryvmnBWZeZAXN7M0ZZwgvCJ0quwaiR5Nwx9lDgEShK0dqPExSDvAqUoE1ZgyqRbjnBAr4Mrv5fTh0L1SzoI1yZQM9m17cIuGdnvqOzdPZbIgS0Mq6T2hl2C+BoXxB0YWk2AobvhA3XddXM2Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/mOCwWlY3PqcPCjlB/9rjoM6f5uCO6vP/v+9PASCV+Ug2Vnh9T6UlG8uPMzl?=
 =?us-ascii?Q?nFA1tzhLULxTYGCDF6k7QZoDvf2tl3vAW0CGMhK3AFWkg5uEUq5Mz5mqZbEk?=
 =?us-ascii?Q?4yI8U5BD7LEMcf5s28pWg55Gtx1xg8RLWnZ+MMrZS7dMJ7Vh+j1eCRiqIadE?=
 =?us-ascii?Q?Q7Qqbk0+bGz2In9ILm0DRqR9BMZzJyqGK69xxASh/OysG7pUkfzpXMnyP11v?=
 =?us-ascii?Q?0jZM3woCwv0Ym+aSQhRhmVhX+IX6qb1SWTXmbH2BvytNsoNHDmP+nGzOcOOp?=
 =?us-ascii?Q?0vU88tTVzjBL/RRKsNXQBzqsXlnvjVZSHwsilKRiO7J/tnfg5j+49KOMKvQ5?=
 =?us-ascii?Q?zmVsqKH42zm8jzYxWAH1llMXkB0xzT1PMO8d1GE1cYaYIez1iUQ0aGRud9dr?=
 =?us-ascii?Q?sCZd4dvcAXexeDF3FQzvNb+R86AgX3dSD1EdcrE8Q4WcDg1XR9IjldJeESRu?=
 =?us-ascii?Q?9W8uFpU8YFg1t8sj4pKkFkyOexhsBYEpcj6HQ/FZtAq3pR8cG3BejE6APrX9?=
 =?us-ascii?Q?EmKCuNbcZNVka+GD+utob4/z+4+EsrO/iZJTeu6NeHh3RDI4XLXwehaL0C3E?=
 =?us-ascii?Q?6mjNOD7AZLlbOfTy+TVu9rsLJuiooQHL9BAdBvuifycxdfj//FvGlTmBX+e0?=
 =?us-ascii?Q?hWDT4PyC3ijEGrcq2VLkvu53u95eBNeekpUpldbGXrViEV2tWxUgEZFB+KJY?=
 =?us-ascii?Q?ngYxjdFw3zX25xxNp06lOzXy4vFSDturF/H8hhXzrE+fs7R3wtPxR6poJpb7?=
 =?us-ascii?Q?/TrpyvGVODg9SDcVFfdZRsiX8RcW8JtjN6j1ibaSgNGIiV/5mHAJQ3C22PyD?=
 =?us-ascii?Q?b9A3KGgbrXRT6R9wrqKG9QdiPGTdN4yNqUwiUWc50tJQ6n7tWFS1i7MZwwbg?=
 =?us-ascii?Q?63Yh2TOypTDpXjtxWiJWWX1wqIAQ0iA+SpuOdpVy1ZfGt/1hTN/WpLiqFP18?=
 =?us-ascii?Q?v6e4dD1x6PO9sc3YBIrHD57ytBg5t9CAUaYB6IaXGiwIz5QbK440nKc/FTbX?=
 =?us-ascii?Q?lwnnOOnlgYS2bY/0fNUU96aoJ8dyHUBglVX2cpDV7qiLKQCxdHgBHk2mlI/D?=
 =?us-ascii?Q?9On7GzZRQzLXhgY0jVjmjzmCor+1amth3gRrD3re5AnPogs7zcjnQmDM2SaN?=
 =?us-ascii?Q?1XjKl8qsCthnHASF5NpeJrHiti2pLQ4YLqTH+JsSWLHP2mzlhbB8xewzIpbk?=
 =?us-ascii?Q?ipvYY9WsjDDHL+Y9If0ZDDJVKrUm37ts94EcRN3M/5IKq9xEDm3GuC5Su+9v?=
 =?us-ascii?Q?WVVvgeCku/HlG+i5tfUBorQ4GhkmoYaOlqdtcXRSVR6n93NxYe4fvQsm2dep?=
 =?us-ascii?Q?zQz52v6SojGhof+8hFqVnDZ61Zo2Uyfe1l2xVBn925mzGI5IHvKAfIlGA4EB?=
 =?us-ascii?Q?UWv+q98el+FKgwbG4tozsXGkLXm9MZBbwLOiZLJ1ifILRkWKeRcOhC9vWARU?=
 =?us-ascii?Q?UG/iwt2lg6/b+dKIdbb+04U3DcMGTtNHmn72EoI7veXa1qv/6ZDefFTMzs77?=
 =?us-ascii?Q?lYxTYjPxZ1fr5lu5UdKR6L2POKmY2ve1I7jPjE5GAUhxFhXe5k7L/vbl0yll?=
 =?us-ascii?Q?EsoyxIpVzFtU1d86VUf/AZKVc3wYPqej+ye6HVaKTaDTdIJmx3XrPY/7svGq?=
 =?us-ascii?Q?nA6j83SYxsQ4pm5eZh2xNZMwALyPYAmnJj6ZbPjzf4jtC/1V+lWO1jcb7pdr?=
 =?us-ascii?Q?Afoypp8xe1PJa0H8Z+jLVgxDqu7SC1c8/dgzmabuofx543vy44T7Rq0xql5+?=
 =?us-ascii?Q?M6+6Ycj9kZAVMdW988IOpl2UqQAd7XgwWZzP/YckFaT9bnslnbBQ?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b9735c-d785-46db-c4dc-08dea4fc5d9c
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:01:35.1044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGb+pnTfuTRXY9YGvHUXXDuColFXAy2WQf+SJNPyLc0r2JlPBgtcM6/5AyXXjdpbJHKzSq9bJ/10A8u0rKvuI51el3sRq9Ofnz2Xw/OSVuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2111

On Mon, Apr 27, 2026 at 07:14:48AM -1000, Tejun Heo wrote:
> Hello,
Hi,
thanks for the review.
>
> On Mon, Apr 27, 2026 at 03:35:21PM +0200, Ravineet Singh wrote:
> > kernfs_fop_read_iter() and kernfs_fop_mmap() dereference of->kn->flags
> > without holding an active reference on the kernfs node. If the node is
> > removed concurrently, this leads to a use-after-free:
> >
> > [  448.037888] Unable to handle kernel paging request at virtual address ffffff821d8cedf0
> > [  448.093213] Mem abort info:
> > [  448.104535]   ESR = 0x0000000096000005
> > [  448.113391]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [  448.126411]   SET = 0, FnV = 0
> > [  448.130758]   EA = 0, S1PTW = 0
> > [  448.134268]   FSC = 0x05: level 1 translation fault
> > [  448.140335] Data abort info:
> > [  448.143275]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
> > [  448.150223]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [  448.155668]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [  448.161233] swapper pgtable: 4k pages, 39-bit VAs, pgdp=00000000afab8000
> > [  448.168835] [ffffff821d8cedf0] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> > [  448.178817] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> > [  448.284717] pc : kernfs_fop_read_iter+0x1c/0x1ac
> > [  448.289416] lr : vfs_read+0x1c0/0x2a0
> > [  448.368374] Call trace:
> > [  448.370855]  kernfs_fop_read_iter+0x1c/0x1ac
> > [  448.375156]  vfs_read+0x1c0/0x2a0
> > [  448.378508]  ksys_read+0x6c/0x100
> > [  448.381901]  __arm64_sys_read+0x18/0x20
> > [  448.385768]  invoke_syscall.constprop.0+0x4c/0xe0
> > [  448.390502]  do_el0_svc+0x3c/0xb8
> > [  448.393898]  el0_svc+0x18/0x4c
> > [  448.396990]  el0t_64_sync_handler+0x118/0x124
> > [  448.401377]  el0t_64_sync+0x14c/0x150
>
> Do you have a repro for this?
No, unfortunately not, the crash was only seen once on an ARM64 platform
and we haven't been able to reproduce it since.
>
> > Use kernfs_get_active_of() to obtain an active reference that also
> > checks the released flag, consistent with other of->kn accesses in
> > fs/kernfs/file.c. These paths were not covered when
> > kernfs_get_active_of() was introduced in commit 3c9ba2777d6c8
> > ("kernfs: Fix UAF in polling when open file is released").
>
> My memory is hazy but of->kn should be valid as long as of is alive. inode
> holds the pin to its kn until inode is released and open files pin their
> inodes. Active ref is something different - it's used to implement revoke
> semantics so that the backend kernfs implementation can disconnect from
> lingering open files, but that's not what controls the object lifetimes.
>
> Thanks.
>
> --
> tejun
You're right about the lifetime model. The patch does not solve the issue, please ignore the patch.
I'll dig deeper into the actual root cause of the crash.


Thanks,
Ravineet
