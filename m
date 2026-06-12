Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D4B40D56A;
	Fri, 12 Jun 2026 07:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249313; cv=none; b=RoGlfY30oJs5v8NqbnKfI6BfYL5SCZnHm+F0NLFzH38fEllySV/GzfzWBPoV+4x2cPSEStwaXlIyIA9divVTk0Xaqt4lU9A/ZpsmmtxCWSU3xStcJlMTgkvorhSXnl0/y0mdTahW3OwMz0gFiDTrNRSm8vBDCF+O7/pb1qhSXHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249313; c=relaxed/simple;
	bh=o7qZP2vx3M95oaBDb6M9Wzw2EisUcZVGZbc96o0BNCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A/jWs6rRMUQzmYIhNLjACtYjjaU99rJlzpkKKmcJ6rtM8uaee4OTfqGcubQMLkUSIdXcCa40xu6vnHQgUctLoWI2XCF68GiJwCgbfnUF4hNSFu0ueEOy/glwgVNRTd36T/C6mbcCrsmNPkUot6ZMKRWjB8/91H7Hh23BS6HspPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzw6qBbT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzw6qBbT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D85E1F000E9;
	Fri, 12 Jun 2026 07:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781249312;
	bh=b7oDK4EJiTHE2+y6zx/6xRp73OFGick2UKNL1I7BedM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kzw6qBbT5+HezJfNCzkEfG0fwxJU5tIfF35fx+vput7hhrDI4Sg4IlAZDvIOssHF/
	 jmT9DE8TXNasABWnBrXnZL7YXzezdWbbp3hqbX78wHkYwlODLA/cOAfcfwF1MO+k+6
	 L74lMywdFTJosyeRpEYHSNbVHeWrlCS6fKGDNYCiYrlmsdz3akPw1JscLg8zpPhYJB
	 1KwKN0YdTinRl4TQIAA1rVkZ89Wm9+/4q9Ll4lAPwXHQt6rcYmlPsMs53heHwqPgR5
	 omh6ihywLhJ+nvA010lssTz3EsgrZOSYwomrBAHsPgaJZLB1ygut6gjwBaQKbhyFLf
	 FW+5xPuIrUTIw==
Date: Fri, 12 Jun 2026 08:28:29 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Chun-Yi Lee <joeyli.kernel@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Chun-Yi Lee <jlee@suse.com>, 
	David Howells <dhowells@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Matthew Garrett <matthewgarrett@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: Fix lockdown check for mmap_prepare
Message-ID: <aiusZLu4x-9UCrDH@lucifer>
References: <20260612055455.16894-1-jlee@suse.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612055455.16894-1-jlee@suse.com>

-cc wrong email

(Please make sure to use my correct email address - ljs@kernel.org -
 I usually do not see emails sent to the incorrect one)

+From: Chun-Yi Lee <jlee@suse.com>

(You're sending from a different email address so you need to explicitly
add a From: xxx tag to match the S-o-b at the top of the message)


On Fri, Jun 12, 2026 at 01:54:55PM +0800, Chun-Yi Lee wrote:
> Commit 651fdda8406d ("relay: update relay to use mmap_prepare")
> changed the `mmap` file operation to `mmap_prepare` for relayfs, but
> the lockdown check in debugfs was not updated accordingly.
>
> This prevents debugfs from being locked down when the kernel is in
> integrity mode if a file uses `mmap_prepare` but not `mmap`.
>
> Update the lockdown check to look for `mmap_prepare` instead of `mmap`
> to fix this.
>
> Fixes: 651fdda8406d ("relay: update relay to use mmap_prepare")

You need to explicitly add:

Cc: stable@vger.kernel.org

As we will want this backported.

> Signed-off-by: Chun-Yi Lee <jlee@suse.com>

I think the idea is correct, but needs tweaking to cover _both_ mmap and
mmap_prepare, until the mmap_prepare conversion is complete, see below.

> Cc: David Howells <dhowells@redhat.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Rafael J. Wysocki <rafael@kernel.org>
> Cc: Matthew Garrett <matthewgarrett@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: driver-core@lists.linux.dev
> Cc: linux-kernel@vger.kernel.org
> ---
>  fs/debugfs/file.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
> index edd6aafbfbaa..d5e187895dd8 100644
> --- a/fs/debugfs/file.c
> +++ b/fs/debugfs/file.c
> @@ -273,7 +273,7 @@ static int debugfs_locked_down(struct inode *inode,
>  	    (!real_fops ||
>  	     (!real_fops->unlocked_ioctl &&
>  	      !real_fops->compat_ioctl &&
> -	      !real_fops->mmap)))
> +	      !real_fops->mmap_prepare)))

This is not only applicable to relayfs.

So while we both have mmap and mmap_prepare, this should be:

-	      !real_fops->mmap)))
+	      !real_fops->mmap &&
+	      !real_fops->mmap_prepare)))


>  		return 0;
>
>  	if (security_locked_down(LOCKDOWN_DEBUGFS))
> --
> 2.43.0
>

Thanks, Lorenzo
