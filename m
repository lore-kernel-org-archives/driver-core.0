Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039331;
	b=aClXKC8apAhCU3FIu3phMbRaMheK3t1knQM9G80YuZlFUEoR9AgI9F7FbzE3jUJLtDH1
	 R+Lx41UZqRHjcM0WqXGWQpFhX2E3Gdr/rYz+gmM+1cV7srnodaI94awtADfgJnAHOTE+G
	 nTmWNlmK9yht/uSLZxU/pfr+GOOYYjRAapmZu7Wz6gNFdCP7SjgSd+E1PUnxsFuAuqfJ3
	 ri2TirM+gLVD47x4auL5pdRNnRuFa9qGlSG5ssrmUo924InfLhwe1HxAJKBDxpulI6LEQ
	 asTlItpVSMroOOTdgQPHn44hFnGe9qNfSGK4ra0A8pQQT5yic8RvvD8ib6Qszx2ou0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039331;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nZ5ytkX35g1s9EQOFiQQjIm0wcKB3lld13gdAmp+jNQ=;
	b=uwlUr86rwp3mCQXXqtNGw+XEqzmfsQxliN4KH7XRcdc69g+Fj6xyClY5U9912E2g35/+
	 YNJXmbTMw+fIrKv0p3GaOUWQ76eqb3KftDgGg+/RFIFCLKSRODVqc5qPCUWsNL/zgfNNU
	 UiiR1LaDK9CEjJz4uuzxMc3fUA/fM+Ygo3mzqKqld+fsJ2qd1/XnGrxhgV1LPAcP38cnZ
	 2vR5pZmGPVOJj3Vx5KFO8AWFqvEhb259ZLJ9YR66ZNLpw6Ew7+tgFsQRbNLNk8ltQYTDo
	 WtNHI7I0M/yYbAL4dQZJaf0BIaAzZ7G+jGciz0oH+LSvL+Hx80K3oswmefpimULrrbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="p/Upc6US";
	arc=none smtp.remote-ip=95.215.58.134
Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24651606A32A
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 22:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24651606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p/Upc6US
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=nzimhElu9Bgfer/tgJHLGjQyV5Usd9BXp098hzJc15Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795039328; v=1; x=1795644128;
 b=p/Upc6USUoIcyw+aeJg617Yx1thm6SXiHX2CBAX6muAgOm8H6zedvubOHbmv79y43F0AWbQ3
 C3bvjr/FE/7i0eINXwFtMr3DQyjtmLhOUz/yO64cdiD4q/WM1P3RkIgF3FQRnUd9oXZ3gdagfxa
 rVY/pkVQZAKgWjXwovFUYZcg=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a1aca7d095c427e9;
	Wed, 18 Nov 2026 22:02:08 +0000
X-Mizu-Trace-ID: a1aca7d095c427e9
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
Subject: [PATCH 2/6] kernfs: don't copy times and link count into the inode on refresh
Date: Wed, 18 Nov 2026 14:01:49 -0800
Message-ID: <20261118220154.2965621-3-shakeel.butt@linux.dev>
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

Every permission check and getattr copies a node's times, if it has
iattrs, and a directory's link count into the shared inode.  Since the
previous patch, getattr reports both from the node, and permission
checks use only the mode, owner and group.  The only other users of a
kernfs inode's times are the mmap write fault and the atime update,
which just update the inode's copy.  The inode's link count matters
only to the IN_DELETE_SELF check, which needs 0 once __kernfs_remove()
clears it.

Copy only the mode, owner and group, which also takes work off every
permission check.  Set a directory's link count when its inode is set
up.  Every caller that sets up a directory inode holds kernfs_rwsem,
and __kernfs_remove() holds it for writing while it clears the count,
so the two cannot race.  Assert that, and note in the kernfs_get_inode()
comment that it is not for directories; its one user outside kernfs,
cgroup_may_write(), gets a file.

getattr fell back to the inode's link count for a directory being
removed.  That count is no longer kept up to date, so report 0 instead:
KERNFS_REMOVING is never cleared, and lookups already fail.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/inode.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 3616161a56cb..2d8da8b4e7da 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -157,27 +157,23 @@ static inline void set_inode_attr(struct inode *inode,
 {
 	inode->i_uid = attrs->ia_uid;
 	inode->i_gid = attrs->ia_gid;
-	inode_set_atime_to_ts(inode, attrs->ia_atime);
-	inode_set_mtime_to_ts(inode, attrs->ia_mtime);
-	inode_set_ctime_to_ts(inode, attrs->ia_ctime);
 }
 
 /*
- * Get the link count of a directory: its subdirectories plus two.
- * Return false for other nodes and for a directory being removed.
+ * Get a directory's link count: its subdirectories plus two, or 0 once
+ * its removal has started.  Return false for other nodes.
  */
 static bool kernfs_dir_nlink(struct kernfs_node *kn, unsigned int *nlink)
 {
-	if (kernfs_type(kn) != KERNFS_DIR || (kn->flags & KERNFS_REMOVING))
+	if (kernfs_type(kn) != KERNFS_DIR)
 		return false;
-	*nlink = kn->dir.subdirs + 2;
+	*nlink = (kn->flags & KERNFS_REMOVING) ? 0 : kn->dir.subdirs + 2;
 	return true;
 }
 
 static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
 {
 	struct kernfs_iattrs *attrs;
-	unsigned int nlink;
 
 	inode->i_mode = kn->mode;
 	attrs = kernfs_iattrs_noalloc(kn);
@@ -187,9 +183,6 @@ static void kernfs_refresh_inode(struct kernfs_node *kn, struct inode *inode)
 		 * persistent copy in kernfs_node.
 		 */
 		set_inode_attr(inode, attrs);
-
-	if (kernfs_dir_nlink(kn, &nlink))
-		set_nlink(inode, nlink);
 }
 
 int kernfs_iop_getattr(const struct mnt_idmap *idmap,
@@ -207,8 +200,8 @@ int kernfs_iop_getattr(const struct mnt_idmap *idmap,
 	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
 
 	/*
-	 * Other refreshes may store older times or link counts in the
-	 * inode at the same time.  Report the values from the node.
+	 * The inode's times and link count are not kept up to date.
+	 * Report them from the node.
 	 */
 	attrs = kernfs_iattrs_noalloc(kn);
 	if (attrs) {
@@ -225,6 +218,8 @@ int kernfs_iop_getattr(const struct mnt_idmap *idmap,
 
 static void kernfs_init_inode(struct kernfs_node *kn, struct inode *inode)
 {
+	unsigned int nlink;
+
 	kernfs_get(kn);
 	inode->i_private = kn;
 	inode->i_mapping->a_ops = &ram_aops;
@@ -238,6 +233,14 @@ static void kernfs_init_inode(struct kernfs_node *kn, struct inode *inode)
 	/* initialize inode according to type */
 	switch (kernfs_type(kn)) {
 	case KERNFS_DIR:
+		/*
+		 * The link count is set only here; getattr reports it from
+		 * the node.  Holding kernfs_rwsem keeps this from racing
+		 * with __kernfs_remove() clearing it.
+		 */
+		lockdep_assert_held(&kernfs_root(kn)->kernfs_rwsem);
+		if (kernfs_dir_nlink(kn, &nlink))
+			set_nlink(inode, nlink);
 		inode->i_op = &kernfs_dir_iops;
 		inode->i_fop = &kernfs_dir_fops;
 		if (kn->flags & KERNFS_EMPTY_DIR)
@@ -267,7 +270,8 @@ static void kernfs_init_inode(struct kernfs_node *kn, struct inode *inode)
  *	locked.
  *
  *	Locking:
- *	Kernel thread context (may sleep).
+ *	Kernel thread context (may sleep).  Not for directories: kernfs
+ *	sets up their inodes itself, with kernfs_rwsem held.
  *
  *	Return:
  *	Pointer to allocated inode on success, %NULL on failure.
-- 
2.53.1-Meta

