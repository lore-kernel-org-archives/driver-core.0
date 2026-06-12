Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638A282F06;
	Fri, 12 Jun 2026 08:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781252137; cv=none; b=gazNRce9aZBfGj2cv2MsusPiOMcpaWWpMg4jFUzUZnoxfzG+TFtKSXp5NQGmMorQF5P3T8dzxEfE3wQDGuzJwRxcGChTyqtxtnNOsVdUMep2mz4GIGwrAAGwXskH4FeJvP8ReppwgviNCraBO6gZbPaUEqiRrUOWbNEXOFtgj/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781252137; c=relaxed/simple;
	bh=txacFz19kwLVHoY6DcYpTmE+bU0p/pFnfimIFoHdn2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evqNNwYBMuSZuPib9ItztbzEJrRTWjAG6DHj6tu9Z96itsROiTLJMIUGzGEY3xM3rKqJzAtU+YqH4rL4xO3iaWlYPvA2z4HvmKgnlO8/8w/6Zar/wRefBNMWMASCYczxoicsD38TOft6mp7XNq7Tz4mDhAlWvDfOWtHcEQvdBbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lZBN+O4B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lZBN+O4B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7921F000E9;
	Fri, 12 Jun 2026 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781252135;
	bh=Suu2/wUQ8g5tqTLK/sddx8TzX9CKR2nq3CT+BD9M5fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lZBN+O4BnAU9DUyCfiGOrpyG2ERpctWKfbrDmOyerONNba3DwPIhRQ76UDVWPLKLp
	 VsBgDKVsamLo4SMVGyfa3CVUYd6C+IV2QeTHl6FpQr1HbGN93riVXUK4C/6hVxuQV8
	 ubouj+ZMzOEyLnSIe6NlZgZY7zL+laY4BctTAn58=
Date: Fri, 12 Jun 2026 10:14:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yohei Kojima <yk@y-koj.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: warn if file creation failed due to
 uninitialized debugfs
Message-ID: <2026061240-cheddar-recolor-63d6@gregkh>
References: <6d1dc775f7d5e754d734907514534054f682bac5.1781171918.git.yk@y-koj.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d1dc775f7d5e754d734907514534054f682bac5.1781171918.git.yk@y-koj.net>

On Thu, Jun 11, 2026 at 10:50:16PM +0900, Yohei Kojima wrote:
> Improve debugfs_start_creating() to warn if it was used before debugfs
> initialization. It silently returned ERR_PTR(-ENOENT) before, but it is
> hard to find the cause of failure especially if it was called by
> debugfs_create_dir(), because the document of the function says:
> 
> > NOTE: it's expected that most callers should _ignore_ the errors returned
> > by this function. Other debugfs functions handle the fact that the "dentry"
> > passed to them could be an error and they don't crash in that case.
> > Drivers should generally work fine even if debugfs fails to init anyway.
> 
> Signed-off-by: Yohei Kojima <yk@y-koj.net>
> ---
> I tested my patch on my x86_64 qemu/kvm environment with the following
> code (I appended this to the end of fs/debugfs/inode.c, but it should
> run anywhere in the kernel):
> 
> static int __init try_making_debugfs_early(void)
> {
>        struct dentry *dentry;
>        dentry = debugfs_create_dir("early_debugfs", NULL);
>        WARN_ON(!IS_ERR(dentry));
>        WARN_ON(PTR_ERR(dentry) != -ENOENT);
> 
>        return 0;
> }
> early_initcall(try_making_debugfs_early);
> 
> static int __init try_making_debugfs_pure(void)
> {
>        struct dentry *dentry;
>        dentry = debugfs_create_dir("pure_debugfs", NULL);
>        WARN_ON(!IS_ERR(dentry));
>        WARN_ON(PTR_ERR(dentry) != -ENOENT);
> 
>        return 0;
> }
> pure_initcall(try_making_debugfs_pure);
> 
> static u64 postcore_u64 = 0x0123456789abcdef;
> 
> static int __init try_making_debugfs_postcore(void)
> {
>        struct dentry *dentry;
>        dentry = debugfs_create_dir("postcore_debugfs", NULL);
>        WARN_ON(IS_ERR(dentry));
>        debugfs_create_u64("u64_value", 0400, dentry, &postcore_u64);
> 
>        pr_info("Successfully created a directory and a file in debugfs!");
> 
>        return 0;
> }
> postcore_initcall(try_making_debugfs_postcore);
> 
> 
> And it warned as expected if it was too early, and succeeded if it was
> called after debugfs initialization:
> 
> [    0.114434] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
> [    0.114434] debugfs: Unable to create file 'early_debugfs', debugfs is not initialized yet
> [    0.114434] NMI watchdog: Perf NMI watchdog permanently disabled
> [    0.114434] smp: Bringing up secondary CPUs ...
> [    0.114636] smpboot: x86: Booting SMP configuration:
> [    0.114910] .... node  #0, CPUs:      #1 #2 #3
> [    0.115139] smp: Brought up 1 node, 4 CPUs
> [    0.115139] smpboot: Total of 4 processors activated (27351.00 BogoMIPS)
> [    0.115466] node 0 deferred pages initialised in 4ms
> [    0.117793] Memory: 3939444K/4193784K available (19486K kernel code, 3500K rwdata, 8176K rodata, 4664K init, 4548K bss, 248632K reserved, 0K cma-reserved)
> [    0.118647] devtmpfs: initialized
> [    0.118647] x86/mm: Memory block size: 128MB
> [    0.118647] debugfs: Unable to create file 'pure_debugfs', debugfs is not initialized yet
> [    0.118837] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
> [    0.121105] posixtimers hash table entries: 2048 (order: 3, 32768 bytes, linear)
> [    0.121508] futex hash table entries: 1024 (65536 bytes on 1 NUMA nodes, total 64 KiB, linear).
> [    0.122058] PM: RTC time: 13:28:19, date: 2026-06-11
> [    0.122613] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.122989] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
> [    0.123373] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.123793] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.124222] audit: initializing netlink subsys (disabled)
> [    0.124461] audit: type=2000 audit(1781184499.707:1): state=initialized audit_enabled=0 res=1
> [    0.124461] debugfs: Successfully created a directory and a file in debugfs!
> [    0.124926] thermal_sys: Registered thermal governor 'fair_share'
> 
> Thanks,
> Yohei
> ---
>  fs/debugfs/inode.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
> index 4598142355b9..e054e62919ec 100644
> --- a/fs/debugfs/inode.c
> +++ b/fs/debugfs/inode.c
> @@ -368,8 +368,11 @@ static struct dentry *debugfs_start_creating(const char *name,
>  	if (!debugfs_enabled)
>  		return ERR_PTR(-EPERM);
>  
> -	if (!debugfs_initialized())
> +	if (!debugfs_initialized()) {
> +		pr_err("Unable to create file '%s', debugfs is not initialized yet\n",
> +		       name);
>  		return ERR_PTR(-ENOENT);
> +	}

While I understand your frustration when adding new code to the kernel
that would trigger this, does it actually fail on a normal boot today?
If not, is this really needed?

thanks,

greg k-h
