Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C386F32FA30
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 05:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771566920; cv=none; b=vCUOcXyC03TURlTG60dm1o0aFLJTln9fKPK9mbRw/w9kKY6ton7AMaSVfQA2a85H9vlx7CO84ukivH85R9PmPM1Ws/nmneUhn6P4sXQDLGZEv+MpMLtUibpf/NC4hIJ51Os2uOLdiaOr14bgf6jKUdh/3ntxdvxNunRTd+zNCEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771566920; c=relaxed/simple;
	bh=yUmonH/CIzK5lTEiC0IVbnht7EAF3Vi0dnZPfCMsJ2Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WCyv6lfjj/ntfbAOJt0pl6GbUFfao/NNb4bBIziPftWTREtVT5cu8aGTC7o7KajRJYwrd60d/2oG65FQRqWypn4UeW23wtD/lUdtcyUSytbec4F9XHvGHc70J0Y9vRPmCElXEm41TnZ2hmAsP6FhBfZ3gLQDOHuYb6loEU1RpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kUKXlH6V; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kUKXlH6V"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1534654a12.1
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 21:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771566918; x=1772171718; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMtE/y1E7pRM+BgrGCWh1tlQyBGUgnD2quexZvuA3I=;
        b=kUKXlH6V4rY5d5OjQ0wJqXdRiYKYCwV1SsiwyDswvX9J6CHJmYFMuzuSPb8SdyDU+j
         eSKBlAnbn4ECeL7qMvPlupC5le/HROLmWhh0LVpiGXLv4uIF7+CN6topmS5HBmRyD3gP
         lMFMFgccF+SZE0EpvEx0GLFfDbKECIe6Gi7Xc+2jk6MMplCVfHYxBECYzmizbF8LSMMD
         zn/QxTt4vbjcNsGTXrFmQkCsJVZVX39wvEjE4NpAjf6NhPIhfiMIpdd/xQMfvrmFX0v5
         XNYiWQiji+qI9nJoHcMlVMcb3lh93fKJJ1f7Ym4snZjL98H09Ab1AM896S5+eBoDt1y6
         4P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771566918; x=1772171718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZMtE/y1E7pRM+BgrGCWh1tlQyBGUgnD2quexZvuA3I=;
        b=FGOoMqg2uBKDa6KoLrSEOAO3obYTgfpq5NVlGPKxk09DNTa7/LlCONZi3Z5bilCYkh
         7GcIAuqWthLLtXofUCnBh5whaZQIc+bAJyk8zuhp4n5K5LZIiwp1QWx+09bgMq+jBeF6
         xHRyd0axe59eaQvw/9Prrp62px96bl0U9V8yV+TwJ7HqA04Thgd3vplE/CsrsUH3/rwH
         MjE8XyiN8EwFDO10awJh4uz+HRbHJQDs6RD4aCJS56JhuLI4vgx3tJ4SrzPmktxNT1so
         OrsSV5xmaIzMTw1F0ua6A7ymWlNVNglcbwYqkCSLrxzX3M49f/XxheKKclfPp3gy0JlH
         Yx8g==
X-Forwarded-Encrypted: i=1; AJvYcCXk9ZYeDfTR2KCtcPMzUpky8JxDaOpLYsEYskHMxBNYVR1I1TTfFGdQj2s0AaqSDm2v9lILPYMs6IL/tw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCma2PPUKjPXFGLe5t66xNh+kgSaGqz1qNvazMoPYsIMBWj/uA
	cdhhQY35u7xYf3Ie9yP6nltey/VUP1Y/36QNF02VANi4hvD/BFEIpFcPGOlRt9j4rcfZ1S3q07c
	+frc26GKHhd0LfGluDw==
X-Received: from pgac4.prod.google.com ([2002:a05:6a02:2944:b0:c66:4148:f3f6])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:918e:b0:38c:792:56b0 with SMTP id adf61e73a8af0-394839d9911mr18666582637.38.1771566917867;
 Thu, 19 Feb 2026 21:55:17 -0800 (PST)
Date: Thu, 19 Feb 2026 21:54:47 -0800
In-Reply-To: <20260220055449.3073-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220055449.3073-3-tjmercier@google.com>
Subject: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, amir73il@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently some kernfs files (e.g. cgroup.events, memory.events) support
inotify watches for IN_MODIFY, but unlike with regular filesystems, they
do not receive IN_DELETE_SELF or IN_IGNORED events when they are
removed. This means inotify watches persist after file deletion until
the process exits and the inotify file descriptor is cleaned up, or
until inotify_rm_watch is called manually.

This creates a problem for processes monitoring cgroups. For example, a
service monitoring memory.events for memory.high breaches needs to know
when a cgroup is removed to clean up its state. Where it's known that a
cgroup is removed when all processes die, without IN_DELETE_SELF the
service must resort to inefficient workarounds such as:
  1) Periodically scanning procfs to detect process death (wastes CPU
     and is susceptible to PID reuse).
  2) Holding a pidfd for every monitored cgroup (can exhaust file
     descriptors).

This patch enables IN_DELETE_SELF and IN_IGNORED events for kernfs files
and directories by clearing inode i_nlink values during removal. This
allows VFS to make the necessary fsnotify calls so that userspace
receives the inotify events.

As a result, applications can rely on a single existing watch on a file
of interest (e.g. memory.events) to receive notifications for both
modifications and the eventual removal of the file, as well as automatic
watch descriptor cleanup, simplifying userspace logic and improving
efficiency.

There is gap in this implementation for certain file removals due their
unique nature in kernfs. Directory removals that trigger file removals
occur through vfs_rmdir, which shrinks the dcache and emits fsnotify
events after the rmdir operation; there is no issue here. However kernfs
writes to particular files (e.g. cgroup.subtree_control) can also cause
file removal, but vfs_write does not attempt to emit fsnotify events
after the write operation, even if i_nlink counts are 0. As a usecase
for monitoring this category of file removals is not known, they are
left without having IN_DELETE or IN_DELETE_SELF events generated.

Suggested-by: Jan Kara <jack@suse.cz>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/dir.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 5b6ce2351a53..41541b969fb2 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -1471,6 +1471,23 @@ void kernfs_show(struct kernfs_node *kn, bool show)
 	up_write(&root->kernfs_rwsem);
 }
 
+static void kernfs_clear_inode_nlink(struct kernfs_node *kn)
+{
+	struct kernfs_root *root = kernfs_root(kn);
+	struct kernfs_super_info *info;
+
+	lockdep_assert_held_read(&root->kernfs_supers_rwsem);
+
+	list_for_each_entry(info, &root->supers, node) {
+		struct inode *inode = ilookup(info->sb, kernfs_ino(kn));
+
+		if (inode) {
+			clear_nlink(inode);
+			iput(inode);
+		}
+	}
+}
+
 static void __kernfs_remove(struct kernfs_node *kn)
 {
 	struct kernfs_node *pos, *parent;
@@ -1479,6 +1496,7 @@ static void __kernfs_remove(struct kernfs_node *kn)
 	if (!kn)
 		return;
 
+	lockdep_assert_held_read(&kernfs_root(kn)->kernfs_supers_rwsem);
 	lockdep_assert_held_write(&kernfs_root(kn)->kernfs_rwsem);
 
 	/*
@@ -1522,9 +1540,11 @@ static void __kernfs_remove(struct kernfs_node *kn)
 			struct kernfs_iattrs *ps_iattr =
 				parent ? parent->iattr : NULL;
 
-			/* update timestamps on the parent */
 			down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
+			kernfs_clear_inode_nlink(pos);
+
+			/* update timestamps on the parent */
 			if (ps_iattr) {
 				ktime_get_real_ts64(&ps_iattr->ia_ctime);
 				ps_iattr->ia_mtime = ps_iattr->ia_ctime;
@@ -1553,9 +1573,11 @@ void kernfs_remove(struct kernfs_node *kn)
 
 	root = kernfs_root(kn);
 
+	down_read(&root->kernfs_supers_rwsem);
 	down_write(&root->kernfs_rwsem);
 	__kernfs_remove(kn);
 	up_write(&root->kernfs_rwsem);
+	up_read(&root->kernfs_supers_rwsem);
 }
 
 /**
@@ -1646,6 +1668,7 @@ bool kernfs_remove_self(struct kernfs_node *kn)
 	bool ret;
 	struct kernfs_root *root = kernfs_root(kn);
 
+	down_read(&root->kernfs_supers_rwsem);
 	down_write(&root->kernfs_rwsem);
 	kernfs_break_active_protection(kn);
 
@@ -1675,7 +1698,9 @@ bool kernfs_remove_self(struct kernfs_node *kn)
 				break;
 
 			up_write(&root->kernfs_rwsem);
+			up_read(&root->kernfs_supers_rwsem);
 			schedule();
+			down_read(&root->kernfs_supers_rwsem);
 			down_write(&root->kernfs_rwsem);
 		}
 		finish_wait(waitq, &wait);
@@ -1690,6 +1715,7 @@ bool kernfs_remove_self(struct kernfs_node *kn)
 	kernfs_unbreak_active_protection(kn);
 
 	up_write(&root->kernfs_rwsem);
+	up_read(&root->kernfs_supers_rwsem);
 	return ret;
 }
 
@@ -1716,6 +1742,7 @@ int kernfs_remove_by_name_ns(struct kernfs_node *parent, const char *name,
 	}
 
 	root = kernfs_root(parent);
+	down_read(&root->kernfs_supers_rwsem);
 	down_write(&root->kernfs_rwsem);
 
 	kn = kernfs_find_ns(parent, name, ns);
@@ -1726,6 +1753,7 @@ int kernfs_remove_by_name_ns(struct kernfs_node *parent, const char *name,
 	}
 
 	up_write(&root->kernfs_rwsem);
+	up_read(&root->kernfs_supers_rwsem);
 
 	if (kn)
 		return 0;
-- 
2.53.0.414.gf7e9f6c205-goog

