Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15C21F427C
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 04:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787630662; cv=none; b=KK/SSB3VTtX4jHyZw6XH/q2BjTZLLQgTvjfHJkZ4amWjhuEkCOpbL9miqWm0kV2KMqsKhrUtdxW7l+48F44BpJFA1vqBuNPADUIbn0M0jUIDb17ZOwN60devHJicvmJkfmq4HJ2rMyxyGdWfOpftYzA9+h2hCEmQmCM/DZebOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787630662; c=relaxed/simple;
	bh=SoTvn6u1nBsHaKXnWNHeQ87Z/kyy/lzwbSFW5uKNLKI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bXtblNgZOVcHCYy7O847QxL96Iqqc4HIAoGCu4M1dXwyH/zMZKY2C1I7BF0A3hG5ob4PYlNwOUC6L2E3N7WLES3vIAw8D0WiYdR6/JZwN8b4+Y7nj+RvuHZWJigFPJCm/3ZqvUwHHlOkcGL272/lMCZxZbjq7KX6aGq20PRMpeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFB85S/Q; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFB85S/Q"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a36982a875so6388588a12.0
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 21:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787630658; x=1788235458; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIz1d+M2XopEmaZu4JMwJQJno6roCNCxkVfrOrxuSFI=;
        b=SFB85S/Q2fqaIS4T7vcTRLX6LKmJcEzlAsgiaSy2dx+ojJL97JpGDM7qNoEHlkqMtZ
         HwVGERifLi9sdBHQyqEeQp648O7Y4NVoUCpTj1d0o0T0CJKRL74PEdptjVjJz4zn+DtB
         +W1MhBgf/0nbtBwRHWRTqBggK6y+5KwJZR7mozLQDC51EzTsa87nPwBzJcYwqpqFtAo6
         W18gJIa48u5Zx5Cw8k3OCdlWaGYaRt58vZ+BcjlwZQWMD+08KF19kQCpIAkIy3/95bFC
         vqCRnhA1lw8OMijZPjZ3pXg5imNtzD+v7t0zZ3RBadTFvK7qegBxbA8nDTowVqpiKKkq
         avDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787630658; x=1788235458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIz1d+M2XopEmaZu4JMwJQJno6roCNCxkVfrOrxuSFI=;
        b=EDx3aC1aBs5dJ6GFr+pDqwa+6pi8ZiIYwUDjnhxkDuH+chrlSU/y5XXYmcAuwtDrOT
         KFBRVhXMCSWMt4AEi2CQNp499mry51RbiEMqktV6J/P4u2uKykMC1dZCyQG3ufldZf98
         iCKwc4DxfBa+BEULbEo5prR+gweddqqFD9HQ6xT8LTGaRQOeWw0MDGHMbSj7Gv7UG0Hg
         hKpFhK/646umT/hO3pDnwJwIqdzH4w2lNjf1X8BQ3yjK5iZUco1pGHtP37MdnJoyvQH4
         /eJn2jJNw2RUYYQAbmNbQDYtO67bnaaVbgmcamFET14kNy2jCk7ilTSyq9haOJuCTcew
         eZHA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9NlDLtn3tSn1VHTsaR3ODQJrBzu7LZIjO90zgCN7HghQ09LBrWUOeK0VxwZSTg7vmaTuM5GJ0fAm/xw==@lists.linux.dev
X-Gm-Message-State: AFuF++nFOQ6W4zqHq5pnXvZM2sYv7TuA+gfy+wW5Ryd1dopV3NKOdSCg
	XSitK1V3zHfen9t7cgCuS50ytbdSVSaZjYNPcr5SbEZl14PXnAFUMtCh
X-Gm-Gg: AR+sD12HA2ta/PM6qBrbAFQoZ2XeeDI5vDuEKW1e699fRVZyRh95o7D9tDc9RKfl4Ys
	sz7PO77vpm1UC5kzF6C4ShOh60z154GFCRju6LJf9V64ppZAfZRREVSmZqOBTk0i0JJMmFJs/q4
	dbLZ6+BG+r7k4iGwt4gkJOQ/3tJdvUKTuCqNeyOrFFQ48Tc8cQvq7mtwTFnUHfUcIklIwrSa1x+
	a+KTLy6pS/dn9g6tHPnDbrqh4QB+5046nuOWJrYgGW3l6CgYT9sQ0GMq2rNrM37UbnEj89MePZs
	ofZp9pc4i3buiLilB2aGMIspSg7o2UgqTxORKmjYtvkPYXOweddRgeYfHu3IrnhvLmSNIqDPoPR
	AWar/qtOC+K69jhaQ+tFABRlwR/BtsjHjngFOg8NYZ0ye6xQ8dN1O0V6tutHWeft0r+h8QiUN4m
	gBDrPwo+49OEismKu+C8IJ0x7VYnSPmW2bhoR+L7+P/9FjkY19TdRXSm3J/8zHr/QYXvQ3+tDgo
	hqJ5eptnxZ+Mu4JXN4pLGawui8pjqN4xuR1Z2SOVOQsWDl6nvjwUBxQXMMUgZmOM5HakpD+WwdX
	Btd/HvnrcsaLwXcf7gdm52aUZXtnmUVvBIXOcH1GR0RwG5dtRwlTcQGn8vPEZsYdABHL
X-Received: by 2002:a05:6402:e09:b0:6a1:f95b:8cff with SMTP id 4fb4d7f45d1cf-6a42f14d945mr36628081a12.1.1787630657941;
        Mon, 24 Aug 2026 21:04:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-af54-b201-7419-a557-62e9-4d13.310.pool.telefonica.de. [2a02:3100:af54:b201:7419:a557:62e9:4d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00108asm17474345a12.2.2026.08.24.21.04.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 21:04:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] klist: avoid accesses after waking klist_remove()
Date: Tue, 25 Aug 2026 06:04:08 +0200
Message-Id: <20260825040408.59225-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

klist_release() publishes waiter->woken before its final accesses to the
stack waiter and node. klist_remove() can then return, allowing the waiter
to go out of scope and its caller to free or reuse the node.

Clear n_klist and take a task reference before publishing woken. Use
release/acquire accesses for that publication and wake the referenced task.

The task reference keeps the waiter task alive if it returns and exits
before wake_up_process(). wake_up_process() provides the full barrier
required by the sleep/wakeup protocol, so remove the explicit mb().

Fixes: 8b0c250be489 ("[PATCH] add klist_node_attached() to determine if a node is on a list or not.")
Fixes: 210272a28465 ("driver core: Remove completion from struct klist_node")
Reported-by: syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9cb1ac7fce4944ba9165
Tested-by: syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/klist.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/klist.c b/lib/klist.c
index 332a4fbf18ff..7242f4cc1c1b 100644
--- a/lib/klist.c
+++ b/lib/klist.c
@@ -36,6 +36,7 @@
 #include <linux/klist.h>
 #include <linux/export.h>
 #include <linux/sched.h>
+#include <linux/sched/task.h>
 
 /*
  * Use the lowest bit of n_klist to mark deleted nodes and exclude
@@ -187,18 +188,23 @@ static void klist_release(struct kref *kref)
 
 	WARN_ON(!knode_dead(n));
 	list_del(&n->n_node);
+	knode_set_klist(n, NULL);
 	spin_lock(&klist_remove_lock);
 	list_for_each_entry_safe(waiter, tmp, &klist_remove_waiters, list) {
+		struct task_struct *p;
+
 		if (waiter->node != n)
 			continue;
 
+		p = waiter->process;
+		get_task_struct(p);
 		list_del(&waiter->list);
-		waiter->woken = 1;
-		mb();
-		wake_up_process(waiter->process);
+		/* Publish only after the final waiter and n accesses */
+		smp_store_release(&waiter->woken, 1);
+		wake_up_process(p);
+		put_task_struct(p);
 	}
 	spin_unlock(&klist_remove_lock);
-	knode_set_klist(n, NULL);
 }
 
 static int klist_dec_and_del(struct klist_node *n)
@@ -250,7 +256,8 @@ void klist_remove(struct klist_node *n)
 
 	for (;;) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
-		if (waiter.woken)
+		/* Pairs with the release store in klist_release() */
+		if (smp_load_acquire(&waiter.woken))
 			break;
 		schedule();
 	}
-- 
2.39.5 (Apple Git-154)

