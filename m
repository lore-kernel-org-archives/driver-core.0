Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AFF2472A5
	for <driver-core@lists.linux.dev>; Tue, 10 Feb 2026 00:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683911; cv=none; b=pYMW2fSEi69zNCM1otFNL+PDrGsBt/eIekhITssPUfMJa/AfCNMOQ+rHD4Hx0czRg86qKFidPABypnzhzDheJ/cuTWxDc3qzvGCfbI3dcGqNykcrrVVMTOsmNqo5TBMkapbXnJbULzGMw7MMjfXzRq1Y6sw31WAYILbUEYsucjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683911; c=relaxed/simple;
	bh=xUZ6aO6Vonw0GmRwLJmSzeGDgxD5B5jYUwBGyhliZYQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m2mXDh4rOPEy2l4CNFB4pJJTsD2GVwn1Q7dKxvXMWcqOkET6NNX24C3KzK6d629OaQXapJTL+A2qswiaXQ1RJLLfY+7MEySJjtGZX7v4AfdpvGCD3FuG0zXswCZP95NXf0uzqzhNdoMs+AbwuPwfZg0e2X3+CLRnxDV/Hq2miFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZd7glTk; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZd7glTk"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-82444d3d73eso151284b3a.2
        for <driver-core@lists.linux.dev>; Mon, 09 Feb 2026 16:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770683909; x=1771288709; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tip76l+g47OdHjbnqUq9WcMpsS2PZvPoe5KfSjLBVzA=;
        b=wZd7glTkPfFyWR+R1WRQUAZAaTGm93LC+TRJKKGpczLtImzimE0mAU17+bFk2M+0Mq
         EiTXOXEqIBSGj5MrtGz6oAMdhszu59yqKvjnU1qTP2VjFU5w53kGbaGifovyR5q+rVK4
         v/5gkHCCYdEZrHmVa8FB8WkjCx9XZCjlM0lfH3a+T6gPqygYZ6YFr9N8oIc4bmzQdOgC
         W9aW7AZ9Qktm5GVJ9EVkWwVl5j+zfam5FFN0s9JM7AS+DBORxqHXCeXu9Bi4IeRbW+Qi
         1S/YoL8K0YB4c4GtGfpF+h8lgZtG+TrkCh9KZ2kawtkd9JdQDWVf+mgq6jLIXaXjYvbK
         4q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683909; x=1771288709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tip76l+g47OdHjbnqUq9WcMpsS2PZvPoe5KfSjLBVzA=;
        b=Eq2ETgfM1FZ0Lzy1Di8MwYBZx2EO12EhNc+1j1fdicZvl4HUVdUnH1Hg6vK9onPteh
         MSxIU2x7c6wbVkWiLjZw2lfhcX+KL2cXmoudcJFSvMW4jLWHBwGYSSDZxXH02ZD2Ntc/
         dgwqgKygaXOYAN2ucbESQX4Ojcx0vkGhUDZFs+GNJBPS2SxRJcded4rwYJUGrfE7xUrU
         is3/Q8vzZxH/0kx4wKc9VOEL1PyLzbJdwA0otCDJn44mqq+I9HngLsaxPWei2GZx2vUN
         3eXssxK211ucX688M8J6WnZPBqbBZVlaZiloPdWmeOPr48yObM362MDUjX9CPKEjqg9f
         agWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSrBuS9RoJwIwyWabkC/a+ATQRXEpmGsVxcnOVKiqVuo3oZWwgWMEWt6rGrrR0p6gyXUEu5j69tliViQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+pLSkCqOXnJfICrL29m6rk0GpoQVT718QIMz+8EiVtCht/MrI
	4V5sHMFgyrcmeyXGnhYjCQFrBCO2JU0U+KNFFCL9nHlRs1N6clZC/aLUSMwMcB6H4jEvaDXvWDD
	yRv2MxYg1Y5Cg06Y3Lg==
X-Received: from pfbls21.prod.google.com ([2002:a05:6a00:7415:b0:822:4e8c:2c9e])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3914:b0:823:9e5:855e with SMTP id d2e1a72fcca58-824413c8e09mr12457964b3a.0.1770683909153;
 Mon, 09 Feb 2026 16:38:29 -0800 (PST)
Date: Mon,  9 Feb 2026 16:37:59 -0800
In-Reply-To: <20260210003801.2834976-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260210003801.2834976-1-tjmercier@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260210003801.2834976-2-tjmercier@google.com>
Subject: [PATCH 1/3] kernfs: allow passing fsnotify event types
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
2.53.0.rc2.204.g2597b5adb4-goog

