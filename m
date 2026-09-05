Received: from mta1.migadu.com (out-82.mta1.migadu.com [95.215.58.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6E05474E
	for <driver-core@lists.linux.dev>; Sat,  5 Sep 2026 19:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635803; cv=none; b=MXw5Lk66OepviQEh1odGUuQ1q5J734NhAAQPyKhh9o/XEHW+Uq48h4FXWSLsGzb4q1r8YzOXZttBeUhV4yHtyPyoQK9T/loJrSW3jDTYg9GnwwBY654Glo67xtO+PYsYHhDLXONwCIC5YQXfUWOdhnyiYCxjZGhBLnApyPyeKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635803; c=relaxed/simple;
	bh=B7GMcmolD2T4Q/YoXp324L2Yk7TLtKzhIO850KXzPmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mlPV0+xmE4ySNikLxEreL50AdKrvkekYgZ1NGscIGxKwV2vvyb5XEtDDlrKHy/bA70oz2t8Adl9CuYJBY+LxAW1HLU5vuzMMyHZpm+ffn8GQS0Y2Q39uKtrNNwASIH1ViedyHqNAOyR2kCCIo73Cooy8JP9XsVLZayb82iaLz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Z1btD1VS; arc=none smtp.client-ip=95.215.58.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Z1btD1VS"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=B7GMcmolD2T4Q/YoXp324L2Yk7TLtKzhIO850KXzPmo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788635800; v=1; x=1789240600;
 b=Z1btD1VSkIcyATo5dTpvZO5bWxhKYGYQxcEgjnkyD1lkQ87UZ+UVSQTmEEnWQLt/0S0O8tMJ
 Kt613VwwjPxDf1pNkLWeipv7FNiw8Qp5p2qxMO+14edtZdIwylmlG3L3vEuSK5nQaPTKP2iCJrZ
 YflB+vcUulW8B/V2gKgTiWwI=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 52e3934d4d77491d;
	Sat, 05 Sep 2026 19:16:40 +0000
X-Mizu-Trace-ID: 52e3934d4d77491d
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Meta kernel team <kernel-team@meta.com>,
	linux-kselftest@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] kernfs: fix up the unlocked attribute reads on the creation paths
Date: Sat,  5 Sep 2026 12:16:13 -0700
Message-ID: <20260905191613.3143937-5-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260905191613.3143937-1-shakeel.butt@linux.dev>
References: <20260905191613.3143937-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two creation paths read a live node's attributes without holding
kernfs_iattr_rwsem, which kernfs_iop_setattr() takes for writing.  They
need different fixes.

kernfs_create_link() copies the target's ia_uid and then its ia_gid into
the new link.  A chown of the target between the two reads leaves the
link with the old uid and the new gid, an owner the target never had.
Read both under the rwsem.

kernfs_new_node() reads the parent's mode and ia_gid for S_ISGID
inheritance.  Either value is fine there: the node does not exist yet,
so nothing orders a racing chmod or chown against the creation.  Taking
the rwsem would only pick between two answers that are both right.  Mark
the reads with READ_ONCE() instead.

The pointer that leads to them is already fine: __kernfs_iattrs()
publishes kernfs_node::iattr with try_cmpxchg(), and both sides read it
with READ_ONCE(), like the rest of fs/kernfs.

The Fixes tag is for the symlink half.  kernfs_create_link() has read
the pair unlocked since it started copying the target's owner; only the
name of the lock its writer takes has changed.  The READ_ONCE() markings
are not a fix.

Fixes: 488dee96bb62 ("kernfs: allow creating kernfs objects with arbitrary uid/gid")
Acked-by: Tejun Heo <tj@kernel.org>
Assisted-by: LLM
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c     | 12 +++++++++---
 fs/kernfs/symlink.c | 17 ++++++++++++++---
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 214c97130a8a..07abf59f0264 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -736,13 +736,19 @@ struct kernfs_node *kernfs_new_node(struct kernfs_node *parent,
 {
 	struct kernfs_node *kn;
 
-	if (parent->mode & S_ISGID) {
+	/*
+	 * The mode and the gid below are read unlocked on purpose: they feed
+	 * a node that does not exist yet, so nothing orders a racing chmod or
+	 * chown against this creation.
+	 */
+	if (READ_ONCE(parent->mode) & S_ISGID) {
 		/* this code block imitates inode_init_owner() for
 		 * kernfs
 		 */
+		struct kernfs_iattrs *attrs = READ_ONCE(parent->iattr);
 
-		if (parent->iattr)
-			gid = parent->iattr->ia_gid;
+		if (attrs)
+			gid = READ_ONCE(attrs->ia_gid);
 
 		if (flags & KERNFS_DIR)
 			mode |= S_ISGID;
diff --git a/fs/kernfs/symlink.c b/fs/kernfs/symlink.c
index 90e2b3221b83..3e53105d3abf 100644
--- a/fs/kernfs/symlink.c
+++ b/fs/kernfs/symlink.c
@@ -31,9 +31,20 @@ struct kernfs_node *kernfs_create_link(struct kernfs_node *parent,
 	kuid_t uid = GLOBAL_ROOT_UID;
 	kgid_t gid = GLOBAL_ROOT_GID;
 
-	if (target->iattr) {
-		uid = target->iattr->ia_uid;
-		gid = target->iattr->ia_gid;
+	/*
+	 * A symlink takes its owner from its target, so both fields have to
+	 * come from the same moment: read them under kernfs_iattr_rwsem, or
+	 * a chown of the target racing this could leave the link with the
+	 * old uid and the new gid.  The section ends before kernfs_add_one()
+	 * takes kernfs_rwsem.
+	 */
+	scoped_guard(rwsem_read, &kernfs_root(target)->kernfs_iattr_rwsem) {
+		struct kernfs_iattrs *attrs = READ_ONCE(target->iattr);
+
+		if (attrs) {
+			uid = attrs->ia_uid;
+			gid = attrs->ia_gid;
+		}
 	}
 
 	kn = kernfs_new_node(parent, name, S_IFLNK|0777, uid, gid, KERNFS_LINK);
-- 
2.53.0-Meta

