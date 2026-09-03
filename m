Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2034AE110;
	Thu,  3 Sep 2026 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440143; cv=none; b=ftW1xKW4FxTjgLYDDLRi+3b+ZIOJd5R0YzE/2cL6RRVSf0ebTRlSdELSIXcVQuaQCsDl5YKTegZ1Xlw6TqXjd0j4gILpamoUIQSktkpCUxfjXzSC12+VF2q3ukkwvd4lNdGxsAkg4ZpbLH9xy0wEClwDlhP/vSPS+mYYcEsU7MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440143; c=relaxed/simple;
	bh=LYuxNeEZJXD+CMeGqT5IAdAjKIZpNcF+hwAEPZXPshU=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=N2NhIflRTjhbxYDxst1BME9aGP1D+5EebSOZwah/qjlLH34jrsiK88rHkHXTusTU1De2V/XGGR0hr2Y0Bl1bsLFxlPvpxEAHsxreruOG+heKzu8NxBddVNRzwqUKhuB7enTgh/rZ4+JF3n0li2hR6zLjXPQ2b8KEKNT3Yunlz8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HFwX7ofm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HFwX7ofm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830231F000E9;
	Thu,  3 Sep 2026 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788440142;
	bh=4MFc33mvT5NHhjimj6OJncqWGkW/fZNiM1pZPWITlek=;
	h=Subject:To:Cc:From:Date;
	b=HFwX7ofmFFqAxmHf7HhP4TLF/aN2RViZJL5y74KZfTe5cLguRZOHBRwL1c5SqQoak
	 DBQjY2CTmwZtRoJvXbimgTy3CeHC9/F5B3xoOi0glclk7/Y8QvQ6i8GrYDDrZaFGO7
	 pLXk0tMufifrOknFMV/NAfsmxmpPCnfn/T40enco=
Subject: Patch "debugfs: Fix lockdown check for mmap_prepare" has been added to the 7.2-stable tree
To: andy.shevchenko@gmail.com,dakr@kernel.org,dhowells@redhat.com,disgoel@linux.ibm.com,driver-core@lists.linux.dev,gregkh@linuxfoundation.org,jlee@suse.com,ljs@kernel.org,mjg59@srcf.ucam.org,rafael@kernel.org,tglx@linutronix.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 03 Sep 2026 14:43:21 +0200
Message-ID: <2026090321-saddling-backrest-9723@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    debugfs: Fix lockdown check for mmap_prepare

to the 7.2-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     debugfs-fix-lockdown-check-for-mmap_prepare.patch
and it can be found in the queue-7.2 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From f81808de37338aac8e167f99bfae647b1b835c70 Mon Sep 17 00:00:00 2001
From: Chun-Yi Lee <jlee@suse.com>
Date: Mon, 15 Jun 2026 18:47:50 +0800
Subject: debugfs: Fix lockdown check for mmap_prepare

From: Chun-Yi Lee <jlee@suse.com>

commit f81808de37338aac8e167f99bfae647b1b835c70 upstream.

Commit 651fdda8406d ("relay: update relay to use mmap_prepare")
changed the `mmap` file operation to `mmap_prepare` for relayfs, but
the lockdown check in debugfs was not updated accordingly.

This prevents debugfs from being locked down when the kernel is in
integrity mode if a file uses `mmap_prepare` but not `mmap`.

Since the conversion to `mmap_prepare` across the kernel is not yet
complete, update the lockdown check to look for both `mmap` and
`mmap_prepare` to ensure comprehensive coverage.

Fixes: 651fdda8406d ("relay: update relay to use mmap_prepare")
Signed-off-by: Chun-Yi Lee <jlee@suse.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Tested-by: Disha Goel <disgoel@linux.ibm.com>
Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
Link: https://patch.msgid.link/20260615104750.1000-1-jlee@suse.com
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/debugfs/file.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -273,7 +273,8 @@ static int debugfs_locked_down(struct in
 	    (!real_fops ||
 	     (!real_fops->unlocked_ioctl &&
 	      !real_fops->compat_ioctl &&
-	      !real_fops->mmap)))
+	      !real_fops->mmap &&
+	      !real_fops->mmap_prepare)))
 		return 0;
 
 	if (security_locked_down(LOCKDOWN_DEBUGFS))


Patches currently in stable-queue which might be from jlee@suse.com are

queue-7.2/debugfs-fix-lockdown-check-for-mmap_prepare.patch
