Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AD938945A
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 04:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804311; cv=none; b=C8K+4MO82W4Ck0ydSQtAGOW+vJKeOqdHcOPguq1D+kqCjBAExvV7rUTf+RFDERZJWHtewN6sNvE1HlPdb7hErSZUobGlnY7JP0CTMOzuXx5Np4WUcy9QC8EAynU1ncXYHXmAXipNewmFhZB43S7w44k0DUr9mviTr6KMDwkNQkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804311; c=relaxed/simple;
	bh=uSMkf3RwzjItLUAPe9EhTmetvptyKOyoUUkhMvsgRCQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PtJHTWwXKODlmr45Baf6W4iFPt9LA8Fy/kJ1UdFCspNShxGRYn7l0dsxG02n74HknRiP25iiCM82no7zA/cwKCuBadSqWw0AX4YhbLyrZqJ81CDhnTOmpdNzvPQpif+ff4GOg4YP5QyBBDEtMDUTXMaOwnCR8bQj4wSGUnaOenA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mi3qUhqa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mi3qUhqa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso2369365e9.3
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 21:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787804308; x=1788409108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSfRa8BgrZI/TGibDtUnpQi8XG0Nol/aLRpoLE1ncnY=;
        b=mi3qUhqa3TMw3HdqX657Kefr6YyNtwBT3IpQxCRvvZoSMTwXbkei0i17DNf5uOQbYj
         AnqFDNQFTDFll9NG2ZJQR3CJ6qSqH183lgzAPGa2qsRoIIPkyD2KYrpk6QRyjiywAqsN
         9PgOKZu+ptZ+/3IP8cBJd9AcbmOohNL3hXOaL1lVTpVER1TB34Lme4yzw82jzuG/RGaW
         bROLwYkhNTMOtXfAEkbdtBgjrJDdDtr4JJESY08TdBrusHsAkvcUCKCA+ogo7F/Vvgfn
         bBqVabf0wkorx+ncjsoT7LCZbob515bcXmUYoTIG9bjwoLuAmgqhVvnkdV2iQEBV8Skl
         Ftpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804308; x=1788409108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSfRa8BgrZI/TGibDtUnpQi8XG0Nol/aLRpoLE1ncnY=;
        b=s4UagJXnGtMTyBgFa/pyTaWUW4k3cWhyv04bIBGtzy9+y8Y2+HxkhM3CX+6EbHOKVK
         GM3+F5dWbkqMwgDUqp3iwoV4nDHvIeMtRp7QauKXDlLhBPUTavtcFcC2FILKMgg4RWB3
         RUexrDUo5K/SwOSztNIQuyXbbL2JpQHS3V/SatCuamJTQxEkl7KTEgx6xXzxOBAX7Wuy
         C6UvZ1ZPC5NLpD0zt8+K8aq36vNdl+BGw1Asaof8VQkeuG7SUSRPlp/VK/EfMVKQb6An
         GWtTjurZo7EEUoWHyI3W3sQxy05VKoYD8JrzycSvUtIddfHOEYaiZYXYl3CkvMuYczJe
         GGKw==
X-Forwarded-Encrypted: i=1; AHgh+RqULyHp8nFyEHBWE34DGquXqFHJJN3r5nCNwSmAOxGfs7uO/WzgPQ6qOwn/N0apKoUdXX8bv3AkFK90Nw==@lists.linux.dev
X-Gm-Message-State: AFuF++k27b4wAFkFDHaZ1s0hco3xGOws87eeOMnOAF/k+68/SABqX2kt
	M6UVFn9EQ4b5MPrR84xRYVc0Vdnv0dkxSqqwvBgl0TMmUR9mk5/hTqTm
X-Gm-Gg: AR+sD13izayfZ0yMY+zEy80+LkjTmqJDhd/QuMz0+A4dDy9hzk11XRN7br2EPW5Rm54
	OQIg9LFzCpR0fgX7fURvcDVz1b7FszB8xf6K5jlH0O9KkPQL1F/w2uBDT8HMENwMfLTQbrgPerr
	i9Slc0GqK7fgxRort6CAuNuoZNeEk+IZA8DMFkBk7fKa+ybQiFVUWrRnfCIItnrkRKbXDfbZYow
	n2/BGHrD7Df67lsck/9bVTmsC28Fd05tLQj9wQvs4Bofg4313LCLHdbwcx5AkcZUiq4mbtaYm5f
	y3q4XFSnVnB5KpFiSB/yAFZ5ciU/Km7iF/o5uAwrk6tiMEZfYB/TJXrZaYpmdJ+SRhIePy8Yi4R
	Ade0a5yChG0PRQmCgAsZqbpIY0XtnstzKpO+0KE5wtFcKSWCIskyJoYlUcYoiOR5Dt3v+tKwkSi
	EvA2M2dlgmq1Gv+zq6FSwTbV/GLcMyARM9etZNBCjfQygmsQOceGILqv6wMySAWxqPc7tszw4xp
	Y+tVOWsBpwuoaQY2qzKHc2CywOw7g5WpBHPNeDFx6GGlDf/8t32sxakIPF+Zp7esaqJum1zVLnu
	TJs4Ktg7TjrqbmEHikD3PKW9OA==
X-Received: by 2002:a05:600c:6088:b0:499:a277:e8b5 with SMTP id 5b1f17b1804b1-499dc6f3248mr130645735e9.3.1787804307537;
        Wed, 26 Aug 2026 21:18:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm44613445e9.2.2026.08.26.21.18.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 26 Aug 2026 21:18:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] klist: avoid accesses after waking klist_remove()
Date: Thu, 27 Aug 2026 06:17:08 +0200
Message-Id: <20260827041708.31682-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

klist_remove() waits until a node is unreferenced so that its caller can
free the containing object.  klist_release() currently publishes
waiter->woken and wakes the waiter before its final accesses to the waiter
and node.  klist_remove() can then return, allowing its stack waiter and
the containing object to be freed or reused while klist_release() is still
running.  In particular, bus_remove_driver() can free drv->p while
__device_attach() walks the same bus klist with bus_for_each_drv().

On an arm64 Cortex-A72 system, an unpatched 7.2.0-rc3 kernel with
CONFIG_PREEMPT_RT=y and CONFIG_KASAN=y reproduced the bug through the
in-tree I2C/at24 path.  KASAN reported a use-after-free in
klist_dec_and_del() reached from klist_next()/bus_for_each_drv() while
at24 was being unregistered.

Clear n_klist and take a task reference before publishing woken.  Use
release/acquire accesses for that publication and wake the referenced task.
The task reference keeps the waiter task alive if it returns and exits
before wake_up_process().

Fixes: 8b0c250be489 ("[PATCH] add klist_node_attached() to determine if a node is on a list or not.")
Fixes: 210272a28465 ("driver core: Remove completion from struct klist_node")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2:
- Explain the use-after-free and document an in-tree driver path; drop the
  syzbot tags (Greg).
- Keep the mb(); removing it was NAKed before:
  https://lore.kernel.org/r/20220614144443.6566-1-wuchi.zero@gmail.com/
- Add an arm64 Cortex-A72 PREEMPT_RT + KASAN reproduction through the
  in-tree I2C/at24 driver path; the first run hit KASAN after 32 module
  unregisters and 397 device operations.

Link to v1:
  https://lore.kernel.org/r/20260825040408.59225-1-kmehltretter@gmail.com/

 lib/klist.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/lib/klist.c b/lib/klist.c
index 332a4fbf18ff0..f133740b1c2cb 100644
--- a/lib/klist.c
+++ b/lib/klist.c
@@ -36,6 +36,7 @@
 #include <linux/klist.h>
 #include <linux/export.h>
 #include <linux/sched.h>
+#include <linux/sched/task.h>
 
 /*
  * Use the lowest bit of n_klist to mark deleted nodes and exclude
@@ -187,18 +188,24 @@ static void klist_release(struct kref *kref)
 
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
+		/* Publish only after the final waiter and n accesses */
+		smp_store_release(&waiter->woken, 1);
 		mb();
-		wake_up_process(waiter->process);
+		wake_up_process(p);
+		put_task_struct(p);
 	}
 	spin_unlock(&klist_remove_lock);
-	knode_set_klist(n, NULL);
 }
 
 static int klist_dec_and_del(struct klist_node *n)
@@ -250,7 +257,8 @@ void klist_remove(struct klist_node *n)
 
 	for (;;) {
 		set_current_state(TASK_UNINTERRUPTIBLE);
-		if (waiter.woken)
+		/* Pairs with the release store in klist_release() */
+		if (smp_load_acquire(&waiter.woken))
 			break;
 		schedule();
 	}
-- 
2.53.0
