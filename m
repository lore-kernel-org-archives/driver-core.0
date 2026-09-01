Received: from mta0.migadu.com (out-112.mta0.migadu.com [91.218.175.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396F436B901
	for <driver-core@lists.linux.dev>; Tue,  1 Sep 2026 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272786; cv=none; b=PzHlN/AT53KzZFzzsSbM+MpdKChCg2mtFJDs9QK5GM9HKOWnF1MGite9kozeDiwJy9Ejrdm43LzfdLah1NGbWRwiQgVOVQvgcKg5s8bWGz72YRioX1Mz6MbXl9eqQ/LQAjvh6ioQI0UldKlA9B0OUOQbRoapZcd5KGbOgRUseWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272786; c=relaxed/simple;
	bh=BYo7V49rEgMHWq7ZsNC+wtDhhAsiwmzghNYGwdvniXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YMmVMNKBF6H8ou0p2El73g5ghiNfxS0C1VEpZ/MGNAkMRPR3TbWh6D11ZIXB0Y4kr2KdTmYT5fCoYoYdvakBSrOGL2eheYAIR1UO/u6Ud7/vKdrSIY/hlKeLXtwpyQVxRbdLILYdihFPVusB7uvWt9iRIie1dWbrFkqiijPVjz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JvQpvZiP; arc=none smtp.client-ip=91.218.175.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JvQpvZiP"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=BYo7V49rEgMHWq7ZsNC+wtDhhAsiwmzghNYGwdvniXQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788272782; v=1; x=1788877582;
 b=JvQpvZiPq9n81+epQf8WYz3zIPppaKIylwaTeW8D+c+ahhQGt2JxXTbpuGPOh9h7kaY1FUQm
 3TFrQ3Nv5CujNeoHg8+VnHgboBpKgK4GN8pDauT4OoFEYst0Q5wQ0T/iGeM7K7iSMNjIp4lisQV
 wCByLihBxCDn51jvNNA3wmh4=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6877674021b6adc4;
	Tue, 01 Sep 2026 14:26:22 +0000
X-Mizu-Trace-ID: 6877674021b6adc4
X-Migadu-Flow: FLOW_OUT
Date: Tue, 1 Sep 2026 07:26:21 -0700
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>, 
	linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: cover kernfs dentry revalidation
Message-ID: <apbgQnHeMKDyVHPg@linux.dev>
References: <20260829022825.407836-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829022825.407836-1-shakeel.butt@linux.dev>

On Fri, Aug 28, 2026 at 07:28:25PM -0700, Shakeel Butt wrote:
> kernfs_test only exercised two xattr calls, so nothing covered the part
> of kernfs most exposed to userspace: the dentry cache.
> 
> kernfs nodes appear and disappear from kernel contexts with no VFS
> operation driving them, and removal cannot reliably unhash the cached
> dentries, so ->d_revalidate() is the correctness backstop. It had no
> test at all.
> 
> Add tests that drive kernfs from kernel context rather than through VFS
> create/unlink:
> 
>  - writing cgroup.subtree_control makes the kernel add and remove files
>    in every child cgroup, exercising both the negative-dentry revision
>    check and the deactivation check,
>  - renaming a network interface renames the sysfs node underneath an
>    already cached dentry,
>  - sysfs in a fresh network namespace must show only that namespace's
>    interfaces, covering the KERNFS_NS tagging paths,
>  - lookup hammered against concurrent mkdir/rmdir must only ever see
>    success or an errno meaning "it went away",
>  - removal-while-open, readdir duplicate detection and a
>    seekdir()/telldir() round trip over kernfs_dir_pos()'s hash cookie.
> 
> Also the other direction: walking already cached dentries must not
> invalidate them. That is not merely a lost optimisation --
> d_invalidate() calls detach_mounts(), so a revalidation that wrongly
> fails silently tears down any mount underneath the directory.
> 
> Both filesystems are needed: cgroup2 has no ->rename and is not
> namespace tagged, and sysfs cannot be mounted with a controllable set of
> children. The config fragment keeps a kernel built via kselftest-merge
> from reporting a pass while running almost nothing.
> 
> Verified the suite reacts to a broken backstop rather than passing:
> stubbing kernfs_dir_changed() to return false turns 8 of the 11 tests
> red.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>

Sashiko raised couple of issues, so I will address those and send v2.
