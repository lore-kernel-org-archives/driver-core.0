Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.141
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039337;
	b=VVQILaS3R+bXLgMm4ahKjkuPWd4izXAng6mCd86Fi118xMXg0lsdyY7VkAXx4YFCd23+
	 rPaVHPh05O0fcijbw/5VgAN8xCvlClVZ4PsWjkmL1r5kwWMDWdLGR91ZmM52GRa69kZQw
	 c2qVNPIXWG5ch9mhgaEdIibCbJj5mE/i5q/4dcVYxurNZiEx0IJN4EZ8pGqtK6lxQ07yC
	 JC7oUOV+U4nLEZk27VSbCoS933+mwZ0338yY5EGfQiFGSy3cE/wtghtpUcddce7N3mCAP
	 /gDmoGg2qOzyE5YdXHMsL8n79lf/a35k5slVXZbroyjjs3rzalv22e4l0L7ihVOIlDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039337;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yo1xabyV53whMmg+uxEow2PfMUc1Q6vU1aHwVTSuikI=;
	b=CaPbyLB2YwXr8YwaCBq7QY21tBazlGsFsxtudmUgfYCnBHulQUaPy1k7FZrjaeKaLmFj
	 oFt6z/qZRdM3iU5bNy5CoXKa1OvnYZ7Xa3VuTPJp+r9yKMFzL+N5O6WyDUxScL6/oQv6D
	 IVF1fmxcqIsJNdPH06iCAI0ntcGj4VpbqaoD+oLfAwXAkCk1XYUZRIvS4NkMobj/vAT/b
	 tXwBT6DrtnP46ik6NyqIUqlSapZwf5F0lHis5lzijbcn4s4GxFz3DcYt1QB8vdOVHNnsm
	 ltiS1AUPNMZOVHeeEg/Pk12FQGqRn+rAKrzP+85pBrPzsSCvzBmGk+Ij6jA3sskCznw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DKZQsHKv;
	arc=none smtp.remote-ip=91.218.175.141
Received: from mta0.migadu.com (out-141.mta0.migadu.com [91.218.175.141])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D860A262E
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 22:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB0D860A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DKZQsHKv
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=9J/3TDko6vY0D7TedDlj7aNBGBfEkr+tAX65XefiW4Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795039334; v=1; x=1795644134;
 b=DKZQsHKvJrNcmzNjbFo+q0AGD17JeC4sM4S4eHzyo9d1inA50W/Yb8VDs9JIFUGkfZJ8nAFp
 I4K3/RYb8jug7b8Rfvphv/pFnXmUSa1qFv+CBpJTMmPMhJ+a01w0LZCltH3BjJMx2EWWQqrDczy
 QR37j/1/ZiUU5ZHMsLVmM3So=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b9bcccd00ec84c2f;
	Wed, 18 Nov 2026 22:02:14 +0000
X-Mizu-Trace-ID: b9bcccd00ec84c2f
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Christian Brauner <brauner@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Ian Kent <raven@themaw.net>,
	"T . J . Mercier" <tjmercier@google.com>,
	Meta kernel team <kernel-team@meta.com>,
	linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] kernfs: don't take kernfs_iattr_rwsem in __kernfs_remove()
Date: Wed, 18 Nov 2026 14:01:53 -0800
Message-ID: <20261118220154.2965621-7-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261118220154.2965621-1-shakeel.butt@linux.dev>
References: <20261118220154.2965621-1-shakeel.butt@linux.dev>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__kernfs_remove() takes kernfs_iattr_rwsem for writing around
kernfs_clear_inode_nlink() for every removed node.  A cgroup rmdir
removes the directory and all its files, so it takes the lock once per
file, each time behind the readers.  Our lock monitor saw rmdirs wait
in __kernfs_remove() for several seconds.

Commit eea5d2bb34ba ("kernfs: Send IN_DELETE_SELF and IN_IGNORED")
clears i_nlink inside this section, so a refresh in progress could not
set a removed directory's i_nlink again, the race described in commit
507d8ce13f5b ("kernfs: Don't set_nlink for directories being removed").
The refresh no longer sets i_nlink.  Only inode setup does, under
kernfs_rwsem, which __kernfs_remove() holds for writing.

A racing fstat() of a file can read its i_nlink while it is cleared,
and sees 1 or 0, as on other filesystems.  A directory reports its link
count from the node.

Drop the lock.  rmdir no longer takes kernfs_iattr_rwsem for writing.

kernfs_iattr_rwsem write acquisitions (lock_stat), before -> after:

  5 dummy netdevs created and removed      370 ->    0
  100 cgroup mkdirs and 100 rmdirs        1500 ->    0

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 8686219b826f..c1402a461405 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1625,9 +1625,7 @@ static void __kernfs_remove(struct kernfs_node *kn)
 		 * to decide who's responsible for cleanups.
 		 */
 		if (!parent || kernfs_unlink_sibling(pos)) {
-			down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 			kernfs_clear_inode_nlink(pos);
-			up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
 			if (parent)
 				kernfs_dir_update_times(parent);
-- 
2.53.1-Meta

