Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223823EC822;
	Fri, 31 Jul 2026 11:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496458; cv=none; b=oc+/kDYu6PkZROx/VqQJFY4E+72uUFzG85eMOsMRD9nVjPlLiI/sHlT3a6xi8/XXtBxWoO3KTuFv+XLP5CahdVVieB+9ctGImyqh0fW0C3uIO3a3yB+tJuLyVMmIJVsIBLOIlaF5H7uQWCkJkQqtauNUrHR8xaC+2HiT0NKhH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496458; c=relaxed/simple;
	bh=dnYuN4dmqju/+L/DgqWsokRMhv0QKkt6O7izcsaujDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbYORYLjdMBPW3D9tNcoHi9Q439EaBh1ssFMKKyaX9QKmwcqW5lrlu2SDpwxCBaaVWPccFuykQD+uUxtyCwOSt7nT5+uFjCZLXcPi7FKqRd3XSK1ikOjdrCFi/ThhtadZkfO0NQK+UtMZ6afAFKI5sqat4aRj4agoLBRFDeJAA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LvVWi64W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LvVWi64W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F27D11F000E9;
	Fri, 31 Jul 2026 11:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785496455;
	bh=hyNegqK3RMsh7JaaXuElKtcTwJNevhLPi5pGxj52UTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LvVWi64WMe7PuPiEw6EkpYm+srFjZU/CkO07QgAXpPKT3TBfgdcUzrDidLo/if0iM
	 x7zMVbFMa3VrDT7yWeXMytbI5EZ1UvArUOLmPOjM4db8dSaKVa68hqqacdERfbXg+m
	 FPELKrme6NjMbvRbVeloGRH7YoYSqhcDd7NMo6UM=
Date: Fri, 31 Jul 2026 13:14:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kevin Mitchell <kevmitch@arista.com>
Cc: Tejun Heo <tj@kernel.org>, Chengming Zhou <zhouchengming@bytedance.com>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kernfs: fix race to increment for nr_mmapped in
 kernfs_fop_mmap()
Message-ID: <2026073146-condiment-liberty-4b05@gregkh>
References: <20260731010914.233067-2-kevmitch@arista.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731010914.233067-2-kevmitch@arista.com>

On Thu, Jul 30, 2026 at 06:09:12PM -0700, Kevin Mitchell wrote:
> Counts of files to be released (nr_to_release) and mmapped (nr_mmapped)
> files were added to kernfs_open_node in commit bdb2fd7fc56e ("kernfs:
> Skip kernfs_drain_open_files() more aggressively") to optimize
> kernfs_drain_open_files(). A WARN_ON_ONCE sanity check was also added in
> kernfs_drain_open_files() to ensure that these counters were brought to
> zero once all files had been drained.
> 
> Modifications to these counters were protected by kernfs_open_file_mutex
> everywhere except for in kernfs_fop_mmap(). This caused a race condition
> where some nr_mmapped increments could get overwritten even while the
> correct number of kernfs_open_files with mmapped == true were present in
> the kernfs_open_node's files list. Consequently, the iteration in
> kernfs_drain_open_files() would underflow nr_mmapped and the WARNING
> would fire.
> 
> To fix this, acquire kernfs_open_file_mutex around nr_mmapped updates in
> kernfs_fop_mmap.
> 
> The nesting of->mutex -> kernfs_open_file_mutex is safe as
> kernfs_open_file_mutex is acquired last avoiding the possible cycles
> highlighted in commit f83f3c515654 ("kernfs: fix locking around
> kernfs_ops->release() callback").
> 
> Fixes: bdb2fd7fc56e ("kernfs: Skip kernfs_drain_open_files() more aggressively")
> Signed-off-by: Kevin Mitchell <kevmitch@arista.com>
> ---
> Changes in v2:
> - Rework the approach to use kernfs_open_file_mutex_lock instead of
>   atomics based on feedback from Greg KH.
> - Link to v1: https://lore.kernel.org/all/20251119191758.612694-2-kevmitch@arista.com
> 
>  fs/kernfs/file.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> index 8e0e90c93372..6f63eb6be1cd 100644
> --- a/fs/kernfs/file.c
> +++ b/fs/kernfs/file.c
> @@ -495,8 +495,12 @@ static int kernfs_fop_mmap(struct file *file, struct vm_area_struct *vma)
>  
>  	rc = 0;
>  	if (!of->mmapped) {
> -		of->mmapped = true;
> +		struct mutex *mutex = kernfs_open_file_mutex_lock(of->kn);
> +
>  		of_on(of)->nr_mmapped++;
> +		mutex_unlock(mutex)
> +;

That line looks very odd, didn't checkpatch catch it?

