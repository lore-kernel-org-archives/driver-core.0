Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013019.outbound.protection.outlook.com [40.93.201.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB46F3750CF;
	Fri,  1 May 2026 22:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777673708; cv=fail; b=KY8A2s32ditlqq7EexPPSPodOk3XmKpjI1UHgp4N4k67Fb8duvzpOkFKGwnejU25Iy1dNIUyZJI8iYC0RK4WN4X8Y/x6pgAF/gE4eNj4L/RGvjToLCSVI6UbHCjS4OnGHqjJANbgabI6G02/L4JwMe64hyeERRpSdgJO8WNlGvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777673708; c=relaxed/simple;
	bh=wc+BP6v6p5nvvn7WfnSi8vEFoy7ZCk+ArBu3QQbhr6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oXD8NsxJJi2VtU+M26vkZWxbV3ZZtSR2OxMudbCD5ztFLmmYjKYYW2CEeRmxOLJ4esQ+Os4/oWOq6HMi2pQOeANKmaQN7T7bdirEdQUo+Il+e+9mSU5dUGJ32+ybrQJ/QbFTTLfJKI/uLAg+hzn3qr05sS1aO21Zlj1mz8+phmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QHNZelz6; arc=fail smtp.client-ip=40.93.201.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QHNZelz6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBrBMN+ivKHm/Fc8jDVBDk6r/RF0r3nlircyHmJfp1F7Scl53P8eqc70UKyA3OtcMcfJqlkkFeZYZkE8wQBdVPOmsprm/dYruzL9hOiDlTGKbZB1Yx9Dib/FQ96lZgmXpZypcn90WrMlyoFIX3QNQPy3/275nOOwTcAsnZHaJ/tIBE4vqVYETvcuQsy889QsybLgthPPv8Z2RuD/YPcJFuDXSLGtiNUpHOehWfdpZO25j36dJzhhXJsrqxKz5Zo+d8dXK0VLPKu4P2hucUazL8rqYncfr62qSsPMiVQrf+EKBKdwLxjaZnq9QVH2LX0yF8C0iNPDNqpZV8oAcwYFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdaTARY4rpj86yltSeL8ApyZynlCIfTnw7F0CSvq14E=;
 b=PjZMFdQZQTGc/s5OZt1c/SLhGxf/GFT+X4mmUH7vF9M/FjgD35UqsB05E989IN4ZjQjcae3gi94+BpNCftbrfhaclRoMDX457Gbz99J/QISNCpoFJ/9ONDtklJATGiFigGetCSGG5ESII++1Et69TUBCCPb19r8ZlYe0X4GGKQRn3uJ+APnGRbtNXMMYj9Hl9Uv3MLpaWEVyZhCxE7onYpAU3WXvUqis46n9oxIhRl9q7wX/y9vfjEf0RRInsm3blILCg2dnimcAOBsZ+IoTBD0sO33aKKy6nd/Wyj5EsqQDwwQI/2GQLSbUnEVI41yS+ZnUwD87Y0xB6NIYsxlQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdaTARY4rpj86yltSeL8ApyZynlCIfTnw7F0CSvq14E=;
 b=QHNZelz6feSgxQqFAk5ULpMiIONl+r4ZKalxLiuqSivu9fIRXf0N1UrsEkmJ/FYbjtm6cTD3Iop3ULSbrXZpMWlcO6MbL4Gfvq4dOZvdvMFYMjCUbv4yXjIIfYbSP9Ijjphs+d0d5rGkwR4+QqQz9PCfohvr+rUNdSLbZKoZdcrt3DR/sp/WWhZJ73QLOaxeo/yx8jn4DEXOs2W3nC1g1Itba4l3iJXNmxFEUMDpWtymp6/yQIkE3RDrR/scU0MZK4a3zYSvfXGum82SVVGjLimcPELqXaFk3OqnHt5uImiZUkWGJVZxyp8ZxyEoZhX17jGEMnwg0msbLK5c5juQSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16)
 by SA1PR12MB8888.namprd12.prod.outlook.com (2603:10b6:806:38a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Fri, 1 May
 2026 22:15:03 +0000
Received: from CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de]) by CY8PR12MB8300.namprd12.prod.outlook.com
 ([fe80::ce75:8187:3ac3:c5de%3]) with mapi id 15.20.9870.022; Fri, 1 May 2026
 22:15:02 +0000
Date: Fri, 1 May 2026 18:15:00 -0400
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
Message-ID: <afUl5EtIrdmZmg8o@yury>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-3-aa1076c3337d@nvidia.com>
 <afTnQ1KCyybUE3pH@yury>
 <DI7JQ529XI9V.QMFHCU2HMGSN@kernel.org>
 <afUP9laA5xYWBuc2@yury>
 <DI7OB6BEZJ69.VM54A4U4P68A@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI7OB6BEZJ69.VM54A4U4P68A@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To CY8PR12MB8300.namprd12.prod.outlook.com
 (2603:10b6:930:7d::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB8300:EE_|SA1PR12MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b972f5-40b6-4d78-3614-08dea7cf176a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	8GolncT8pfqzbzWhXAiblTkE91tuklEISOxMHQLRI3cAQe7TcbWtmhxTJGMYazdzyEz9/GddCa98XXAn+pq9mjjkwZk5uzSpXg4cyKq0fshaupsn8HhuL0q69WDgwdEv1r+9Hl2xHXLaWUw3jF8cW+36R0xQv3HeUEaIpeOqKi7C7F5pmtwQql0dswsTNVv96kpx5nnnw6qMzd3l+XxAScFRCE125CgANdOXjUgbqDaGwP13/fFFvxp3hBD5mhjYHMod2n762MAxoZlzKVo8JGn3NlikGBD+C5Iln5HLcag8KM6h6M1k4IMh/3Nwy2FsNX6LzgudyXMTh6kXdJ69cR9oHKqFU4OMgDKn+6KjuNzDOI/+ozHh/fBIg/0w+UnBNJBAA7dTAuwPjkdFB/7NTm7mhBzje6nyyD0JJ07VRG6cYaA0Q7v/eaDdLCCYN+chGBia31MY9Jb8Uq4j2ZC0BzqKhmiUIPgLWPOGoIZoGz9zjt85hmlxj0o95x9YBApjelacJcmA/yC87t7Nr2LkxH3NuyK1qKxGN3gaq8wQ4BUYv069F811EFout7reJ2448guqllKmqvMrp4kU2WvSNruDiZ+LpRnOOodhSuDZAn2teK4kBL5f2W/6IloQMPosBpHEfW2pJZ8MmaS76fcVCvtXpADJIzdWQDCmnNw806RZUjAQNgy1XMt2QB/2lswY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB8300.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nkoOpcRetOfro7bhYW0O+qCGyIWTyqjLz4ccH6AJ93U7swateFJmomGck7yU?=
 =?us-ascii?Q?6jZwWGfBbvQWtGJFZ+2naghHeYensGdxM9WJ8G9ayKxaEcT9LEvgOp0x2q15?=
 =?us-ascii?Q?cKSqu8CfZNSH6DPOg/RHVquwIoC5npyEgBzDsCBOJ3zIMbUwzKBYP6ltxuVE?=
 =?us-ascii?Q?OvijAcrR93KKbjsukJThC/dqtsh6FNzLxv02dUL5uneS5atAt2U+tTBEOq/8?=
 =?us-ascii?Q?FbsvPcWHaUDVJk/bkbjarEBT2R9V+yoC/w4WzeJgboKJ2qaQRz9LLDcntQCV?=
 =?us-ascii?Q?5QZ9Dn285oT4xq4ONYp5nMXC8q10y324bgR4WDLApzy2uD/ikoQOmYThPH4S?=
 =?us-ascii?Q?3pYFGjMph29QY2LxXpfXv2jWWEO2VwhOrRSVYT6c6pkvniQPnjt9/X3UYm9K?=
 =?us-ascii?Q?VEvOZTH9/QOtvUPTroKhUr1oyXCBYl3EZJVXmym1n7pyTjUbbWusZas3xhmO?=
 =?us-ascii?Q?PvCJBldxI8ObkoHY7FwIfq0y+wLF+f/1IyADiJt1Jgfb0eI8l++GLvwZkI9s?=
 =?us-ascii?Q?vP1QodcMFsYUKnvhrg6IuEHanSjGJn/WArHi9YwEAzdjO7Z5ARGKlS4JLgRX?=
 =?us-ascii?Q?ZjqWzSqG+/kXZDG4iS97uVqCqTtgkDBPK9khX3ykuCROUcOcoFXfzr8oLM1s?=
 =?us-ascii?Q?BIXC59Dn6fdTaQr9fObU6Nn42WtObO5VdezGqO9P8QKTex/mVITHywgJ1KdX?=
 =?us-ascii?Q?S2EqFzk9R5F/oCDUmKIcXWa3mDdiHypJncdwOzCBeprlc1qmNZgwyH1BeL+T?=
 =?us-ascii?Q?tnOW2yG6CyBkKZLSuSzoRCJcyVGCUJ2oTtBijm/DboilDwfoVd2i6DnMidNR?=
 =?us-ascii?Q?hbYSLgrhvP18dkCELiz3bS+PEILmvFezhhc6URn46VYu55cRhytL18g0Vd2W?=
 =?us-ascii?Q?jXWyt7q6Jd46qpz/l2dnK4+SwVwapCEPg4ZWd9+BFU9L7OPbnHcUQ3acCJ2E?=
 =?us-ascii?Q?atVO6R/7W+rnJvg0n/UlaNWVSbpZmxbU+eLCxB2STk4LmjBZViSHXEs9Z0xD?=
 =?us-ascii?Q?JHSKUsNIZUyKkicIJNOyKazl7WaoPnWT62EyysOMT34+4WEuK4JwF5hINFPH?=
 =?us-ascii?Q?iLerEoIq6QYFuCQurrLdZV5VQpJIwszZNWEWBps8Yoc7d1KflhfGNFe72DeC?=
 =?us-ascii?Q?6KM2zaRZUpr2W8YVF2qK0RSrNNt5llm6Cc7ilC0BDVvJaeu90hhL0wZmk32c?=
 =?us-ascii?Q?GNlHeuXySSDTWmtf7mRMJnpEnNOHN00BeUU62efz4EGHYgcD6m2gJRZnAQJE?=
 =?us-ascii?Q?pntqtAfi0VtS581NvyhJY5IzlydnDU/bYV1FciWkjiBuQIx6CXIdP6Ftg4Ks?=
 =?us-ascii?Q?+Du6FmlSKQVYR8ZsqixygU52jG2/AUMxQgLdCFpjSsoY1xUMVUmPQNszFoai?=
 =?us-ascii?Q?7m3c2M77ABWJEv/563tb2pUKHNC2y8nzcPuwVvr6JLBtWmlBa8LMuklVh9ol?=
 =?us-ascii?Q?mg6QJr/euvvm0vjNiU0X3bCrnc5Ght1c9v//C+wRkuXD3Cjo9jQFiuwyMXqt?=
 =?us-ascii?Q?bKzG0g6OOtlolvN16svVrKNMTJNcb/3A2eEzCFAWuWmXM1+cfDCR5WJEAT7g?=
 =?us-ascii?Q?/ugyP/lP8DDFoq0+LjIROyxZ1f0z2LYjatckpchajl7onIBcDeoOf01qmKiI?=
 =?us-ascii?Q?qvpGYTaALs7del7c2r/yni8yocCzYL+S/ztlttt+BGKEk/Yccceb8N4IqtYl?=
 =?us-ascii?Q?KcdNDgEKWD47w7FcG8eFht2OBJYfH0ZNM7Ub7hZcI2xPV1wEKYavmyMQRHgh?=
 =?us-ascii?Q?qA8maa72EzWMEtsS1Hdd5YbPL0tLyBCEzcbKXT7JnrxbIlvvd5/g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b972f5-40b6-4d78-3614-08dea7cf176a
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB8300.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 22:15:02.8205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QqI94wivK1xnAQoynnblVuzCEZY7khO3Xs8lG0EGxtQA2mZOb2HnsSq130uPyd66KTHA/TfE/uT2EwWvOG0UYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8888

On Fri, May 01, 2026 at 11:55:03PM +0200, Danilo Krummrich wrote:
> On Fri May 1, 2026 at 10:41 PM CEST, Yury Norov wrote:
> > On Fri, May 01, 2026 at 08:19:31PM +0200, Danilo Krummrich wrote:
> >> On Fri May 1, 2026 at 7:47 PM CEST, Yury Norov wrote:
> >> > If it comes to another round, maybe split switching to a bitfields and
> >> > getting rid of the bitfield_core? For maintainability reasons.
> >> 
> >> I'm happy to take it as a single patch -- the deleted rules are dead code the
> >> moment the switch happens, and the code is local to the same macro, so the
> >> intermediate state doesn't seem to add any value, or structure in terms of
> >> touching different components etc.
> >> 
> >> Did you have anything specific in mind when you mention maintainability reasons?
> >
> > I only mean that if there will be weird regression found in the new
> > implementation, it's better to be able to revert just a single patch
> > to restore the original code with no side effects.
> 
> Indeed, but by splitting it up that wouldn't be possible anymore, no?
> 
> Am I missing something?

The thing is that you most likely will not be able to revert the patch
cleanly - because the existing code evolves. The non-existing code
doesn't evolve. So unless it'is moved to another file, or something
like that, the revert is simpler.
