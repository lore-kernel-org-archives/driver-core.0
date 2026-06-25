Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BF726CE1E;
	Thu, 25 Jun 2026 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782358832; cv=none; b=ZQTtAfox45Zl6Nlhmyyv3g5jR8d2TQ3wAdwyxqWxong+5BtERueWzKkHozeu5o3nuTCT4XA+z3AHoMbOCSeNIR+sSYLq20mDQr09f6J4cvM5+qa9LBR7Oz9cFgcchQAu3xfWvywlDMnX1RyUtuRpUM1eqK1sV74dAxew9PCwzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782358832; c=relaxed/simple;
	bh=JZK2xtq5F7P5rih8spGwuCKcWvj9L1Gw+m/cWxh0JBI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZqgYiECLqlhvBr+xPQZzrnJeecORT1aljNs/KZzE/Indgw85ubcn1b/xjtURprOIVsUltCe+lQVt0GmXsJ1F3rzY8s9CuUKL/GMWTM8P0uFfMzJ0CFa3LHXkOJk4hYQGLcQzOCCRYJkUPmEKS9TcD+hc7xmSnmVMpbXcWuiNpxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QyCgbFPV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QyCgbFPV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D411F000E9;
	Thu, 25 Jun 2026 03:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782358830;
	bh=g3Q4eDirsu3BpY4kvqH6rJbYy80lFPyTIC7ZlHsn9K4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QyCgbFPV3DIh8qIdxFJfyAYkJFZT8Wl7DDSBFUbWWiUJNbvmnjQV97OUG+pCLTPm3
	 oLjGcOBSh8otP0rKYT9ZQ0bF02sX27NkB70dZjgXjrU84+BHMhz04qzJuvmI13j6bt
	 nj+PMA4mz01lJ2E0qEO8Dktu/QuG3RqwXKOES0Fg=
Date: Wed, 24 Jun 2026 20:40:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: rppt@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich
 <dakr@kernel.org>, linux-mm@kvack.org, driver-core@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch_numa: remove redundant nodemask clears in
 numa_init()
Message-Id: <20260624204030.3c8baa67713b6ca1d537baba@linux-foundation.org>
In-Reply-To: <20260617163919.2544899-1-ekffu200098@gmail.com>
References: <20260617163919.2544899-1-ekffu200098@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Jun 2026 01:39:19 +0900 Sang-Heon Jeon <ekffu200098@gmail.com> wrote:

> numa_init() clears numa_nodes_parsed, node_possible_map and
> node_online_map, then calls numa_memblks_init(), which clears the same
> nodemasks. Nothing uses them in between.
> 
> These clears have been redundant since commit 767507654c22 ("arch_numa:
> switch over to numa_memblks") made numa_init() use numa_memblks_init().
> 
> No functional change.
> 
> ...
>
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -231,10 +231,6 @@ static int __init numa_init(int (*init_func)(void))
>  {
>  	int ret;
>  
> -	nodes_clear(numa_nodes_parsed);
> -	nodes_clear(node_possible_map);
> -	nodes_clear(node_online_map);
> -
>  	ret = numa_memblks_init(init_func, /* memblock_force_top_down */ false);
>  	if (ret < 0)
>  		goto out_free_distance;

hm, OK, thanks.


A couple of driveby questions:

Are the other nodes_clear() calls are needed - aren't these things
zeroed when the kernel is loaded?


Also, 

#define node_possible_map 	node_states[N_POSSIBLE]

...

nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
	[N_POSSIBLE] = NODE_MASK_ALL,

why do we carefully initialize node_possible_map at compile-time then
zero it within __init code?


