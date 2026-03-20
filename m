Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D203E3C9EC3
	for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 16:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022480; cv=none; b=lNnQv5lIUyActLovvjAVn2jnmt69o1WhYGnV9XLpizIow+PAU/NV1xzLZ4wroWOT/20OeBg3ZTNE7No8jeVA4jfLJ+x5CYFpVN30sxtpGeU0Q15VpnEWzbMODgNEKFBzZVnQpU0s3lLaQo42scVw1idlVEeVWDmHQyEdPeBlJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022480; c=relaxed/simple;
	bh=npCuQr8NSn+KqZ3wXFU+9qx8xDptk1bFwIoSkHgUiRI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Lk9FHOTUkYuDDGOys1hOInGxg3dxg4KRsrQm0HQGzcOr/YOf5uKetFeechSAxRqIWhKqqKABKuww7scV/XPuZX425rJye+JrKcCYICEynassOxa8Fmg8dM/uUCACwXX70rOTb5r6rcZvQnRH/ZqJtN6FCREr8CHRWdpLhakHPio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uy97ojY4; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uy97ojY4"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c0c85c38acso1121925eec.1
        for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022478; x=1774627278; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SyOziUDRkFpvVzGnSUQxGo0qW7loZJVELoAjOyVArzc=;
        b=uy97ojY4ulLPylBWtuwBkJn7iep/kjk6HXSvW6dnMzlZQ5t9eZHJA9+V4hUWF50KA7
         m2ENJrGSOTSwAafJ/WMOw+ufTg935C3eGGKGNMqSItHd8EdNXYjhOUXVZvbU5ZBqkJ8D
         wUUVP2/cUVf420a7uJ5roMHG6/Vxe8KDcpajW6S7VvkNtVJxfD6yQ+yQLEWCEP5w6U41
         TMnxutgP0MbBhNetSp1xPJgrPFObrl4rtKBoc6BRYK7Ckyuxz3ivNlk5Vzy8v7e0YgKm
         Rc9hBALFks5iwqkhOrKHIN/68WRJ1Yeph2s/vP5+ugCqktEaFTxVIIoi6KaLVNd9JN7f
         QOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022478; x=1774627278;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyOziUDRkFpvVzGnSUQxGo0qW7loZJVELoAjOyVArzc=;
        b=duWH/3Rn2WQcGP6ZZlxWKidykjLx+ne931KGhS8gkJLjrepQElmPxP0iDcC/ev0kV1
         yy9zTrde7ahf383ymcaiyxOwe1sHZmXeQR+nMP0n3H8HSHe1w1HilDHhVhOylxsdbjD1
         2y2+vHG1HvUGiuRij+6kc8bbxX9dKV6fy81Q+WEeA3VTdwzJuycHpGQY1NHnskohhF+X
         CJ5r93xNdgDx6Wl7bFTvKbi63StzAJ2dvcqKIEmkr52pzICdGs/3r288GaYy4SfuWI6G
         y4JyqygOFwhNEYCqLotZIPa2BRsseB/6CLNzFr2wV8OZESkthHfaRse+Lmn4vPeWqNf5
         6sYw==
X-Forwarded-Encrypted: i=1; AJvYcCVdNcfPJqxUeLMHZnZnSDqXlmsIQeFWC4y1CjuGcT/+dcYNBCLrohyZrLuBSQu2sKE3pMJDsLbj0blcJA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4BotgSsjXCS5+buxGwhczSDfI+N2w83SjE8KSXgTr6D3dMi/b
	Pdvdqm1/8dQeukaiLy4IeJvtJ+ThEgbhIdEflCgpoEc/7robk5GmRx7YkOlgpwyWRrnLF7p++tS
	o+5xVSCpxzYX8vQ==
X-Received: from dycpg9.prod.google.com ([2002:a05:7300:dd09:b0:2c0:f659:16d0])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:2c13:b0:2c1:23d:c732 with SMTP id 5a478bee46e88-2c1096265c1mr2153248eec.14.1774022477845;
 Fri, 20 Mar 2026 09:01:17 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:00:53 -0700
In-Reply-To: <20260320160055.4114055-1-wusamuel@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260320160055.4114055-1-wusamuel@google.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320160055.4114055-2-wusamuel@google.com>
Subject: [PATCH v1 1/2] PM: wakeup: Add kfuncs to lock/unlock wakeup_sources
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>
Cc: andrii@kernel.org, memxor@gmail.com, bpf@vger.kernel.org, 
	Samuel Wu <wusamuel@google.com>, kernel-team@android.com, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add kfuncs to lock/unlock for safe traversal of wakeup sources.

Currently, a traversal of wakeup sources require going through
/sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to
query sysfs is inefficient, as there can be hundreds of wakeup_sources,
with each wakeup source also having multiple attributes. debugfs is
unstable and insecure.

Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
traverse the wakeup sources list. A new structure, bpf_ws_lock, acts as
an opaque wrapper for the SRCU index. The head address of wakeup_sources
can be safely resolved through BPF helper functions or variable
attributes.

Doing the traversal in BPF is significantly more performant, and has an
output in a format that the user specifies; this solves all the
drawbacks of current interfaces.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 drivers/base/power/wakeup.c | 63 +++++++++++++++++++++++++++++++++++--
 1 file changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index b8e48a023bf0..7fc12ce125bc 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -1168,11 +1168,70 @@ static const struct file_operations wakeup_sources_stats_fops = {
 	.release = seq_release_private,
 };
 
-static int __init wakeup_sources_debugfs_init(void)
+#ifdef CONFIG_BPF_SYSCALL
+#include <linux/btf.h>
+
+struct bpf_ws_lock { };
+
+__bpf_kfunc_start_defs();
+
+/**
+ * bpf_wakeup_sources_read_lock - Acquire the SRCU lock for wakeup sources
+ *
+ * The underlying SRCU lock returns an integer index. However, the BPF verifier
+ * requires a pointer (PTR_TO_BTF_ID) to strictly track the state of acquired
+ * resources using KF_ACQUIRE and KF_RELEASE semantics. We use an opaque
+ * structure pointer (struct bpf_ws_lock *) to satisfy the verifier while
+ * safely encoding the integer index within the pointer address itself.
+ *
+ * Return: An opaque pointer encoding the SRCU lock index + 1 (to avoid NULL).
+ */
+__bpf_kfunc struct bpf_ws_lock *bpf_wakeup_sources_read_lock(void)
+{
+	return (struct bpf_ws_lock *)(long)(wakeup_sources_read_lock() + 1);
+}
+
+/**
+ * bpf_wakeup_sources_read_unlock - Release the SRCU lock for wakeup sources
+ * @lock: The opaque pointer returned by bpf_wakeup_sources_read_lock()
+ *
+ * The BPF verifier guarantees that @lock is a valid, unreleased pointer from
+ * the acquire function. We decode the pointer back into the integer SRCU index
+ * by subtracting 1 and release the lock.
+ */
+__bpf_kfunc void bpf_wakeup_sources_read_unlock(struct bpf_ws_lock *lock)
+{
+	wakeup_sources_read_unlock((int)(long)lock - 1);
+}
+
+__bpf_kfunc_end_defs();
+
+BTF_KFUNCS_START(wakeup_source_kfunc_ids)
+BTF_ID_FLAGS(func, bpf_wakeup_sources_read_lock, KF_ACQUIRE)
+BTF_ID_FLAGS(func, bpf_wakeup_sources_read_unlock, KF_RELEASE)
+BTF_KFUNCS_END(wakeup_source_kfunc_ids)
+
+static const struct btf_kfunc_id_set wakeup_source_kfunc_set = {
+	.owner = THIS_MODULE,
+	.set   = &wakeup_source_kfunc_ids,
+};
+
+static void __init wakeup_sources_bpf_init(void)
+{
+	if (register_btf_kfunc_id_set(BPF_PROG_TYPE_SYSCALL, &wakeup_source_kfunc_set))
+		pm_pr_dbg("Wakeup: failed to register BTF kfuncs\n");
+}
+#else
+static inline void wakeup_sources_bpf_init(void) {}
+#endif /* CONFIG_BPF_SYSCALL */
+
+static int __init wakeup_sources_init(void)
 {
 	debugfs_create_file("wakeup_sources", 0444, NULL, NULL,
 			    &wakeup_sources_stats_fops);
+	wakeup_sources_bpf_init();
+
 	return 0;
 }
 
-postcore_initcall(wakeup_sources_debugfs_init);
+postcore_initcall(wakeup_sources_init);
-- 
2.53.0.959.g497ff81fa9-goog

