Received: from mta0.migadu.com (out-207.mta0.migadu.com [91.218.175.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1CA368D70
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 04:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016088; cv=none; b=hS7HI7N9lgP3aTmt70Fyj7o2WTdQEwL9COtU7K+KygURE750PkFnJV4o6YZrrnVEgAx7kEmlODp/9Nkmh2e7GeslfS7XY5Q+Mkr9gBnqzjZUAKWqdA3YPsJYvJa+i+r8vr82cbffrUYr+DyGkGRai85D6wZ2WlsgYykOD23B4NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016088; c=relaxed/simple;
	bh=7V15OWJcmmXZk9s3hgjd0010D1RdxNLIGIQBgGBHgMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rA7Vt04LZJg9JdOcdMgb94xceR4k4TNsnMGMVQR5/iveqzCA0ZCsl6hCjQLCB6MLGhOx8lSJISvRYvkQ9l8gckOiRRPY3hRE59j+G9M0XOvCBDzEx31NPyhOTGZYnVUIBsWGVsgAkAA29OIiGwG22wB1xxG7JCmat6CgRoh0MaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wZgRpdKy; arc=none smtp.client-ip=91.218.175.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wZgRpdKy"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=7V15OWJcmmXZk9s3hgjd0010D1RdxNLIGIQBgGBHgMk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789016084; v=1; x=1789620884;
 b=wZgRpdKygjfN41hhVcF21wYotEb6t2QKkDeHp4e2GKmGm27Kbh7jUk6lfPLNAkUr0XXnFzbh
 yJnnTTgua5y8QJe8v4SXabke4eH051cVjg81Z3SQiB7fKMQvF4k2/xv0+RfsTNa3n2XCF7yYu1/
 pWinON5b1iGfvoSV9LnX+IWM=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a36025855c7c4800;
	Thu, 10 Sep 2026 04:54:43 +0000
X-Mizu-Trace-ID: a36025855c7c4800
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Christian Brauner <christian@brauner.io>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Meta kernel team <kernel-team@meta.com>,
	linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kernfs: allocate the open node outside the open file mutex
Date: Wed,  9 Sep 2026 21:54:33 -0700
Message-ID: <20260910045433.489413-1-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernfs_get_open_node() allocates the kernfs_open_node while holding one
of the hashed kernfs_open_file mutexes, so opening a file nobody has open
yet can enter reclaim with that mutex held.  The mutex is shared by every
node that hashes to it, so unrelated opens, closes and xattr updates in
the same bucket wait.

It is the most contended lock in kernfs on our fleet: 2.19M waiters over
29 days, more than two hundred times the waiters on kernfs_rwsem, and the
highest median hold of any kernfs lock at 77ms.  Most of it is monitoring
daemons opening cgroup control files, and the open node is freed once the
last descriptor closes, so an open-read-close loop allocates every time.

Look at kn->attr.open before taking the mutex, and allocate then if
nothing has the file open.  Should the peek be wrong, which needs the
last descriptor to close inside the window, fall back to allocating under
the mutex as before.

Eight tasks opening and closing four cgroup files 20000 times each, with
lock_stat on the hashed mutex:

                     contentions    hold total    hold avg
   before                    198        4.19 s     8.67 us
   after                     119        2.31 s     4.78 us

and the same number of acquisitions either way.

This does not empty the bucket.  kernfs_fop_release() and
kernfs_xattr_set() still sleep under the same mutex.  It stops opens
doing it.

Assisted-by: LLM
Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/file.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 7e3800526b1e..cca9f83fc9b5 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -525,18 +525,31 @@ static int kernfs_fop_mmap(struct file *file, struct vm_area_struct *vma)
 static int kernfs_get_open_node(struct kernfs_node *kn,
 				struct kernfs_open_file *of)
 {
-	struct kernfs_open_node *on;
+	struct kernfs_open_node *on, *new_on = NULL;
 	struct mutex *mutex;
 
+	/*
+	 * Peek without the mutex: if nothing has this open, we will need a
+	 * node and can allocate before taking a mutex shared by every node
+	 * hashing to it.
+	 */
+	if (!rcu_access_pointer(kn->attr.open))
+		new_on = kzalloc_obj(*new_on);
+
 	mutex = kernfs_open_file_mutex_lock(kn);
 	on = kernfs_deref_open_node_locked(kn);
 
 	if (!on) {
 		/* not there, initialize a new one */
-		on = kzalloc_obj(*on);
+		on = new_on;
+		new_on = NULL;
 		if (!on) {
-			mutex_unlock(mutex);
-			return -ENOMEM;
+			/* the peek raced; rare, so allocate here */
+			on = kzalloc_obj(*on);
+			if (!on) {
+				mutex_unlock(mutex);
+				return -ENOMEM;
+			}
 		}
 		atomic_set(&on->event, 1);
 		init_waitqueue_head(&on->poll);
@@ -549,6 +562,7 @@ static int kernfs_get_open_node(struct kernfs_node *kn,
 		on->nr_to_release++;
 
 	mutex_unlock(mutex);
+	kfree(new_on);
 	return 0;
 }
 
-- 
2.53.0-Meta

