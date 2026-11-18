Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039332;
	b=xLExOWB4O1q2C+gu1nMwwMALGuYBw1Wjomb1HwYhcPNn2H8GoLxZk8EexU6i1Wj07XeZ
	 ux4fUOsX5D/37VjaqQEkBY6NdyKZVn3AFSN2VyqRERgnSSKH1C3KQbCVOidBSk1cNncLN
	 juG4Gb/d1QGDGXdGEN8SX8am6/gI6TGQPxRd0yIiTdc5J2oPnXKt8zpb+licOwfw3vurS
	 toEaAJJpbZeySIDpnWG0w9NLqmzagp2ep5CDTcHp1m2eFIPP1Hv26MmmJZDfJV8WIfZLg
	 bYE6v8aB1Efn4+T2cwd6gaxX+8v8zloDVtFllv+wAmlW3iHPG0KT+SmgmAYid0kdLlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039332;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dT+16QCKVUPqp0UStAvJ2vgJeGorOW5arlzmqLVg2Tw=;
	b=fEfDauIQuPEntNQbvoQ7SOkcQeaRWOfCqiSndBmjkFmVXtM3ClPRDGb0pRW5baN4FQx4
	 KwdxBraqz2lSDtbEGe8bYq4q00Uu958KCEI48BNYnf2beD9X29ZUuFXP9aey6FdJf+SfF
	 yG1E/Hl0Vt5H8RxWHQmQ5YbXwU+8/ldJena+jYlQolNHrjccAU67qmBAVP4G45YfMyrz4
	 CeykRHGuSYhre8OeNF7M1+7gp6eG5m08TPvVa++ThcPEdcKzR1ZLPOxL8exNQqWwVPvkv
	 VLOU9ETfCBT8UQdfqO/BxKAMZHUoICRfCLy76R0aTKvH5CKFtlgafFl7vYGmpPpKqfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LYwyLhwV;
	arc=none smtp.remote-ip=91.218.175.128
Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C628C60A2600
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 22:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C628C60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LYwyLhwV
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=NqZxqYeAW80SolC6a4fCLBS6+wXkHZDcQ5yUBliVMS4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795039329; v=1; x=1795644129;
 b=LYwyLhwVLwEM4rHUtxuGCCYreM1e5WcsPYwEIO6D9NjJvgx4XeN2CkaCJv+Mgz8nVgd9wafT
 pgWHSa/ztBv1fEi+TugNK0vGMoOj1l/Iz1il2AlmbSnuHcGR7i1CxUmXhkBWRTwdZ0KAfVD+eia
 7OOUTyzIEErtmxaLMMR4KqY0=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a3cd887a4ede3af4;
	Wed, 18 Nov 2026 22:02:09 +0000
X-Mizu-Trace-ID: a3cd887a4ede3af4
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
Subject: [PATCH 3/6] kernfs: don't take kernfs_iattr_rwsem for the directory counters
Date: Wed, 18 Nov 2026 14:01:50 -0800
Message-ID: <20261118220154.2965621-4-shakeel.butt@linux.dev>
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

kernfs_link_sibling() and kernfs_unlink_sibling() take
kernfs_iattr_rwsem for writing to update the parent's dir.subdirs and
dir.rev.  Every permission check and getattr takes the lock for
reading, so under load the writer waits, while it holds kernfs_rwsem
and, for cgroups, cgroup_mutex.

Both writers hold kernfs_rwsem for writing, which is enough.  Commit
0559f63057f9 ("kernfs: fix missing kernfs_iattr_rwsem locking") added
the lock to keep the link count stable for getattr, which now reads it
from the node; the refresh no longer copies it.  The other readers,
kernfs_dir_changed(), kernfs_set_rev(), kobject_has_children() and
resctrl, never took the lock.  A racing stat() sees the old or the new
link count.  While a subdirectory is renamed within the directory, it
can also see one less, as it could before.

Drop the lock, mark the accesses, and assert that kernfs_rwsem is held.

kernfs_iattr_rwsem write acquisitions (lock_stat), before -> after:

  5 dummy netdevs created and removed     1850 -> 1110
  100 cgroup mkdirs and 100 rmdirs        7500 -> 4500

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c   | 12 ++++++------
 fs/kernfs/inode.c |  3 ++-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index fb1dcf35d900..ef23eac684c6 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -387,6 +387,8 @@ static int kernfs_link_sibling(struct kernfs_node *kn)
 	struct kernfs_node *kn_parent;
 	struct rb_node **node;
 
+	lockdep_assert_held_write(&kernfs_root(kn)->kernfs_rwsem);
+
 	kn_parent = kernfs_parent(kn);
 	node = &kn_parent->dir.children.rb_node;
 
@@ -410,11 +412,9 @@ static int kernfs_link_sibling(struct kernfs_node *kn)
 	rb_insert_color(&kn->rb, &kn_parent->dir.children);
 
 	/* successfully added, account subdir number */
-	down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 	if (kernfs_type(kn) == KERNFS_DIR)
-		kn_parent->dir.subdirs++;
+		WRITE_ONCE(kn_parent->dir.subdirs, kn_parent->dir.subdirs + 1);
 	kernfs_inc_rev(kn_parent);
-	up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
 	return 0;
 }
@@ -436,15 +436,15 @@ static bool kernfs_unlink_sibling(struct kernfs_node *kn)
 {
 	struct kernfs_node *kn_parent;
 
+	lockdep_assert_held_write(&kernfs_root(kn)->kernfs_rwsem);
+
 	if (RB_EMPTY_NODE(&kn->rb))
 		return false;
 
 	kn_parent = kernfs_parent(kn);
-	down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 	if (kernfs_type(kn) == KERNFS_DIR)
-		kn_parent->dir.subdirs--;
+		WRITE_ONCE(kn_parent->dir.subdirs, kn_parent->dir.subdirs - 1);
 	kernfs_inc_rev(kn_parent);
-	up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
 	rb_erase(&kn->rb, &kn_parent->dir.children);
 	RB_CLEAR_NODE(&kn->rb);
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 2d8da8b4e7da..2f463c0354a5 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -167,7 +167,8 @@ static bool kernfs_dir_nlink(struct kernfs_node *kn, unsigned int *nlink)
 {
 	if (kernfs_type(kn) != KERNFS_DIR)
 		return false;
-	*nlink = (kn->flags & KERNFS_REMOVING) ? 0 : kn->dir.subdirs + 2;
+	*nlink = (kn->flags & KERNFS_REMOVING) ? 0 :
+		 READ_ONCE(kn->dir.subdirs) + 2;
 	return true;
 }
 
-- 
2.53.1-Meta

