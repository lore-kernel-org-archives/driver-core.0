Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751D333E345;
	Sun, 18 Oct 2026 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792306317; cv=none; b=fh8bMfMeBSpRD6jZz1cmSucTcdZThnTpvoI3LA5OA16bZYVqLzFAOJzqtPBsC0nQLhX9IBoOp0sQLsEjqFb9UQboeaZGTjHfl7CBMZN2UuG68XYLyHZpinYIUwMrqUqCOd/8lQlrbwo9rRgGGhAS6lMv7hg1cGKGXQGKFpN4YjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792306317; c=relaxed/simple;
	bh=H0wexYXO43zEs5VSiUM87cMFm2ZO5IeZJFIhaZ3SNdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpuWaKY0OD02OGV6zLdPtdafZKmkTElWL03y4aI1aaywMTqzB/iCdtD7ZSSYX+iSYzkafasGeHDIFAhiYonBQVNUfmziNNo8ezD2QKzOPzd55SMRLG5ilgAnqQnGWltJKE/uEJrp7iQK3skkSMV+kEfY2mt7UfCx7Bkm/H8aP0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h3spZ6j1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h3spZ6j1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566431F000C4;
	Sun, 18 Oct 2026 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792306315;
	bh=g62/LXFbaPp22+LDHOYzyvIdkI7S2b2p0qQR9AomuFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h3spZ6j1GB0hZOO0Fu56WBZPdQUTR2vuaCJd1cvpqIxnqyegkHBQ2yNY3SYzqVADR
	 2EQWvU2qE9ARUHPlj8qJP9/XaL8PeIdyRH9aX6K6obMvUC88h0yVpEOJ26omQnlqSx
	 LiVzyqpbWId7v2oWWiZARVUnUoTBDnul64N8zxL8=
Date: Sun, 18 Oct 2026 08:51:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver core: Don't take the device lock in
 waiting_for_supplier_show()
Message-ID: <2026101841-bubbling-glowing-6ab4@gregkh>
References: <20261018001837.797946-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018001837.797946-1-nickolai@csail.mit.edu>

On Sat, Oct 17, 2026 at 08:18:37PM -0400, Nickolai Zeldovich wrote:
> Reading a device's waiting_for_supplier attribute while the device is
> being probed hangs both the reader and the probing task for good, in
> uninterruptible sleep, if the probe succeeds. The file is world
> readable and fw_devlink, enabled by default, creates it for every
> device with a firmware node until the device is bound, so any user
> reading sysfs during a probe (udev, a tool walking /sys, a plain cat)
> can wedge it. The probing task keeps holding the device lock, so the
> module load or deferred probe work that ran the probe, and everything
> that takes that device's lock later, hangs as well. Kernels since v5.9
> are affected.
> 
> waiting_for_supplier_show() blocks in device_lock() while the read
> holds an active reference on the sysfs file. On successful probe,
> driver_bound() calls device_links_driver_bound() with the device lock
> held, which removes the file, and kernfs waits for that active
> reference to be dropped: the reader waits for the prober and the
> prober for the reader. Lockdep does not report it because dev->mutex
> is not validated.
> 
> The device lock is not needed here. The value is computed by
> fwnode_links_check_suppliers() under fwnode_link_lock, which every
> writer of the fwnode supplier list holds, and the active reference keeps
> the device from being deleted while the callback runs. Drop the device
> lock.
> 
> Reproduced on x86_64 under QEMU with an lsi53c895a SCSI controller and
> sym53c8xx built as a module: its probe resets the SCSI bus and the
> synchronous scan then waits for the settle delay (3 seconds by default),
> and a read of the PCI device's waiting_for_supplier file 1 second into
> the module load hangs. Before the change the hung task detector reports
> insmod in kernfs_drain() under device_links_driver_bound() and cat in
> waiting_for_supplier_show(), neither ever returns, and a power-off
> afterwards hangs in device_shutdown() on the same lock; after the
> change the read returns 0 and the module load completes.
> 
> Fixes: da6d647598a6 ("driver core: Add waiting_for_supplier sysfs file for devices")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
