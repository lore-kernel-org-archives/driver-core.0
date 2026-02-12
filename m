Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7313235DD0F
	for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 21:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933514; cv=none; b=WMHT+XT/DUToJn4fvv19F9CSEMZof+Yerq0+T0GJIBzWCDv7tMei/jgHkFCJxmtLgpcJh5fSVAfrAuzz2Xplftt1L+kNYqSm5uncIOOXwzUfpmbqN1XHeLV0DOiq3qEl33Z8f5mPRCVjCkGp/5gZbhw6Sj23UaYaHg44WG+1c3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933514; c=relaxed/simple;
	bh=cddz7yiNNtZcRMbECFzY2RrBpOd+pdNNI+Dx9a521G0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HGDMLTZiw8HhR/+yIEE+u1BHr0GA+jHH4g+U5nvoY7G5bm9FuaJIL4VGa3Dn3gieZns6OzCYfegN4OsQGpb6tmF+DPGSfTXk9uUNoFiEsb28dPrHY2iy/6bATwnrNCupat0amWf0V3g0uO7VowRhN2h3NzHUU2QE+pHu7i8fGm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yevqgTHH; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yevqgTHH"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3562171b56dso249774a91.2
        for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 13:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770933511; x=1771538311; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F9QIJ7/JNUJlnhiwP3aDc1NcdR+8wgC780wGHRVk+o8=;
        b=yevqgTHHHkJcurdfyD/b1zcwk+OeI2JuCXLrjDJAiPIdqPMIH54DJ0v3CnK66KjVeP
         vGIttAM3IXFUJLqBouKkSec43oN3vAoqLxumcdcTsN3JtA+NUMX0ame+yfr9f0xVDAGW
         1N5ZJFeF95XEs1zu7SSAF+mxRLYQB7/C0LBqB48T2dmt5a89nWttS4pqymMCmjE3TDnb
         tPOz3/L1PMVgSlbp02taPij4M1/VSwQ4EhwepONxzu1suVLrFWw9kkzVKF5gNO/B2Jvn
         F0Ve2I05jtBgQnbFtrkeHvComm01zF5a3aXt50RSoB7nukRVCCGdIDjh7c/dQaksMNIC
         W3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770933511; x=1771538311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F9QIJ7/JNUJlnhiwP3aDc1NcdR+8wgC780wGHRVk+o8=;
        b=YJYjdpaDvPvZ2oJTun4W+mdJ6HilO3IAJ38D8M0WHcyzmZu6Y1GV91cdZ3Q6Urrv8C
         bIbJm1nizmTV9iA/nDdBKpa4LNudHEUKTUxZrMm2MwgoMFOfRPBk3dt5oOVL07Xd+Inm
         aSpIojm7TgrotZKN5FKeHczEPerk+s/BBQHiYjDAKZyTPQzavxRiIIKRt0gzZxuf702M
         G2iRGG5rHq8DeWEI3+EUGInWq4s8MU0263E6CdmiDWcqeMsitAJnV13SUCAUCwOXI6gW
         r86grJyt3TVdmrRgI2YGb3VyfRStHDDfznQ6Tfjp7VsgAoDsMickgRI/xysSBUUwGQW3
         zb+w==
X-Forwarded-Encrypted: i=1; AJvYcCWkufHTNNkeLoFiK+GOUZcYgEswl8eRUbV0PN+G0VSI8J6+je3nZY9dQgEOajdhB1ThyYMxKN0xV07E8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCPHOfY+NdRceTEqUi0tqthhPwiCzq+T4lnro8qeQ2uOxnq36k
	agzIOuTJ3RfbjJKwE+ML6VE276bDp60a614lLI08syx5Y01317xPcRENlJ+XLwUR+xt2QvVPbkL
	2gvwIdpgOE8dG8r7Bag==
X-Received: from pjob16.prod.google.com ([2002:a17:90a:8c90:b0:34b:e29d:f74c])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2d90:b0:356:22ef:57b9 with SMTP id 98e67ed59e1d1-356a7641a8emr399373a91.3.1770933510727;
 Thu, 12 Feb 2026 13:58:30 -0800 (PST)
Date: Thu, 12 Feb 2026 13:58:12 -0800
In-Reply-To: <20260212215814.629709-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260212215814.629709-2-tjmercier@google.com>
Subject: [PATCH v2 1/3] kernfs: allow passing fsnotify event types
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

The kernfs_notify function is hardcoded to only issue FS_MODIFY events
since that is the only current use case. Allow for supporting other
events by adding a notify_event field to kernfs_elem_attr. The
limitation of only one queued event per kernfs_node continues to exist
as a consequence of the design of the kernfs_notify_list. The new
notify_event field is protected by the same kernfs_notify_lock as the
existing notify_next field.

Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/file.c       | 8 ++++++--
 include/linux/kernfs.h | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 9adf36e6364b..e978284ff983 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -914,6 +914,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 	struct kernfs_node *kn;
 	struct kernfs_super_info *info;
 	struct kernfs_root *root;
+	u32 notify_event;
 repeat:
 	/* pop one off the notify_list */
 	spin_lock_irq(&kernfs_notify_lock);
@@ -924,6 +925,8 @@ static void kernfs_notify_workfn(struct work_struct *work)
 	}
 	kernfs_notify_list = kn->attr.notify_next;
 	kn->attr.notify_next = NULL;
+	notify_event = kn->attr.notify_event;
+	kn->attr.notify_event = 0;
 	spin_unlock_irq(&kernfs_notify_lock);
 
 	root = kernfs_root(kn);
@@ -954,7 +957,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 		if (parent) {
 			p_inode = ilookup(info->sb, kernfs_ino(parent));
 			if (p_inode) {
-				fsnotify(FS_MODIFY | FS_EVENT_ON_CHILD,
+				fsnotify(notify_event | FS_EVENT_ON_CHILD,
 					 inode, FSNOTIFY_EVENT_INODE,
 					 p_inode, &name, inode, 0);
 				iput(p_inode);
@@ -964,7 +967,7 @@ static void kernfs_notify_workfn(struct work_struct *work)
 		}
 
 		if (!p_inode)
-			fsnotify_inode(inode, FS_MODIFY);
+			fsnotify_inode(inode, notify_event);
 
 		iput(inode);
 	}
@@ -1005,6 +1008,7 @@ void kernfs_notify(struct kernfs_node *kn)
 	if (!kn->attr.notify_next) {
 		kernfs_get(kn);
 		kn->attr.notify_next = kernfs_notify_list;
+		kn->attr.notify_event = FS_MODIFY;
 		kernfs_notify_list = kn;
 		schedule_work(&kernfs_notify_work);
 	}
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index b5a5f32fdfd1..1762b32c1a8e 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -181,6 +181,7 @@ struct kernfs_elem_attr {
 	struct kernfs_open_node __rcu	*open;
 	loff_t			size;
 	struct kernfs_node	*notify_next;	/* for kernfs_notify() */
+	u32			notify_event;   /* for kernfs_notify() */
 };
 
 /*
-- 
2.53.0.273.g2a3d683680-goog

