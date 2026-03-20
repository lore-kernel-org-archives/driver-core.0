Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CC03CE4B5
	for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774022483; cv=none; b=rX+Yo8Ui9pzcojascDduTpzpIINFbVvrK7hVIuG+mfRRu6/fF+jQU8yDzVB6xi1e8yM9zEKKEE4EaALs6zHTLEn0JED/r8Iduzbm6ifVHemjSoMHhoPEHPinsarkQggoKBG7uioQSw5/qXIjD8hFwScwx/Uqekq3LxB7td58lGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774022483; c=relaxed/simple;
	bh=qvip7xD8lU2nv93aISHdb0Yy+GWL3ZEGT+t4OwzRpps=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WSu4rnpzMoYySI3EcMhorLZEJoUq/dr9DPnEc2AEgmP/3XFZXCRVc3Lyg2Vm9nxA3deBJmF+iTGPc6J31JACTYLVsLKgpSE8tlJpZyLB58/LxY3xrAfdk7Su74ncDLeb+a/C+wLMFjiTaY5oWTAldEDT9lTzRpR4w3+0wDlksiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ll2oF4QA; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ll2oF4QA"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c0ec884bffso640377eec.1
        for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 09:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774022482; x=1774627282; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+yNIjEjBGn9q2o52lVHe2be8XDbIZIbZnOMsnfNZO68=;
        b=Ll2oF4QAjdAW8LPPGnmUFM2VaPolqqbTCo0DeOwzyuPudKsO4StspSqXqxQdQIKLMc
         aFj+zPUKT0emm9uXgdGeDFh1z001JKMuDdKlylMvNPJywuTk1HJis3zf4NKCzRnuohZI
         oRRpn0iH9Z8KKkQVXza9r82DcI6JeDaOajs9ZZO66QtLKcIFvx6UyXyuIZ01fR/G3oAT
         YRcMr9mrpu2liqSCXkvV7f7PSsNrHddPsiWXLcX2Re/SWqHUj9sLMurkS2BqBg/lQUDI
         NZajL6iTyxl3KZPl4mpc94/X+7d/r6Alcka8wXqgPnusYLzce8kwuFBc5QpSq2CQirZP
         JLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774022482; x=1774627282;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yNIjEjBGn9q2o52lVHe2be8XDbIZIbZnOMsnfNZO68=;
        b=ae4YAZVLlgRrEggVAKCOmTOUKeSqpyHEepibSIOTrfjAS1IBfCgyRe5t3I3Pr2+sOl
         Rf1QYe/iHOuZoJ04eT9KBgiMi8ze5KmqJfWu5n8YzWMrwuLJrC7KXLlTf7mA+fqm7sWN
         Et5ibajjsesnP0I+Jvdb1QE/dhhqsw0lhvkDBp13uyQDQEuIuYkvg12hnTzdWSjMAcSp
         Kw/vqQX1Sm54QRq7nw4rjxNRewRlbcgCfcKcReFSFwdYiKgYSnea8jpfM8WAvWrEJifU
         TBtJpgElpmhF1CmH1y1gKbRbNVzuiaNDJRrbtJaPWa/eQ5x8t3heQlfAN4lWY1ax7uLW
         xG1w==
X-Forwarded-Encrypted: i=1; AJvYcCX/J82/KztX9DwKcdyEHGbRyyExy/Lkl7tuCp6yVHxh+uAtKdKCdXukiJfn5olIDZT8S50VoN2x3WZoNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwP59ybwBAyodkGZH/ChpWVx4am0HkXp/NdCOhUONr4HpX0G8vJ
	fJmCvK0f5jfDwiTackqY50piD7BeozqLANsopdYtvhZtnHLpqq/3tOnslYBmHbmN0LMIUqbKjQj
	WsjSwG42d+nOWZA==
X-Received: from dybfx32.prod.google.com ([2002:a05:7300:c3a0:b0:2c0:fdbd:f0ce])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:eab:b0:2c1:564:712a with SMTP id 5a478bee46e88-2c1097b7ab2mr1482908eec.26.1774022481485;
 Fri, 20 Mar 2026 09:01:21 -0700 (PDT)
Date: Fri, 20 Mar 2026 09:00:54 -0700
In-Reply-To: <20260320160055.4114055-1-wusamuel@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260320160055.4114055-1-wusamuel@google.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Message-ID: <20260320160055.4114055-3-wusamuel@google.com>
Subject: [PATCH v1 2/2] PM: Add config flag to gate sysfs wakeup_sources
From: Samuel Wu <wusamuel@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>
Cc: andrii@kernel.org, memxor@gmail.com, bpf@vger.kernel.org, 
	Samuel Wu <wusamuel@google.com>, kernel-team@android.com, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add a config flag that gates the creation of
/sys/class/wakeup_sources/*. This has the benefit of eliminating the
work needed to create the nodes and corresponding attributes; and
between kernfs, dentry, and malloc, there are some memory savings
depending on the number of wakeup sources.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 drivers/base/power/Makefile |  3 ++-
 drivers/base/power/power.h  | 14 ++++++++++++++
 kernel/power/Kconfig        | 13 +++++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/Makefile b/drivers/base/power/Makefile
index 2989e42d0161..5933dadc0dd9 100644
--- a/drivers/base/power/Makefile
+++ b/drivers/base/power/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_PM)	+= sysfs.o generic_ops.o common.o qos.o runtime.o wakeirq.o
-obj-$(CONFIG_PM_SLEEP)	+= main.o wakeup.o wakeup_stats.o
+obj-$(CONFIG_PM_SLEEP)	+= main.o wakeup.o
+obj-$(CONFIG_PM_WAKEUP_STATS_SYSFS)	+= wakeup_stats.o
 obj-$(CONFIG_PM_TRACE_RTC)	+= trace.o
 obj-$(CONFIG_HAVE_CLK)	+= clock_ops.o
 obj-$(CONFIG_PM_QOS_KUNIT_TEST) += qos-test.o
diff --git a/drivers/base/power/power.h b/drivers/base/power/power.h
index 922ed457db19..364ca5512b4f 100644
--- a/drivers/base/power/power.h
+++ b/drivers/base/power/power.h
@@ -125,11 +125,25 @@ static inline bool device_pm_initialized(struct device *dev)
 }
 
 /* drivers/base/power/wakeup_stats.c */
+#ifdef CONFIG_PM_WAKEUP_STATS_SYSFS
 extern int wakeup_source_sysfs_add(struct device *parent,
 				   struct wakeup_source *ws);
 extern void wakeup_source_sysfs_remove(struct wakeup_source *ws);
 
 extern int pm_wakeup_source_sysfs_add(struct device *parent);
+#else /* !CONFIG_PM_WAKEUP_STATS_SYSFS */
+static inline int wakeup_source_sysfs_add(struct device *parent,
+					  struct wakeup_source *ws)
+{
+	return 0;
+}
+static inline void wakeup_source_sysfs_remove(struct wakeup_source *ws) {}
+
+static inline int pm_wakeup_source_sysfs_add(struct device *parent)
+{
+	return 0;
+}
+#endif /* !CONFIG_PM_WAKEUP_STATS_SYSFS */
 
 #else /* !CONFIG_PM_SLEEP */
 
diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 05337f437cca..6945083ab053 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -202,6 +202,19 @@ config PM_WAKELOCKS_GC
 	depends on PM_WAKELOCKS
 	default y
 
+config PM_WAKEUP_STATS_SYSFS
+	bool "Sysfs wakeup statistics"
+	depends on PM_SLEEP
+	default y
+	help
+	  Enable this for wakeup statistics in sysfs under /sys/class/wakeup/
+
+	  Disabling this option eliminates the work of creating the wakeup
+	  sources and each of their attributes in sysfs. Depending on the
+	  number of wakeup sources, this can also have a non-negligible memory
+	  impact. Regardless of this config option's value, wakeup statistics
+	  are still available via debugfs and BPF.
+
 config PM_QOS_CPU_SYSTEM_WAKEUP
 	bool "User space interface for CPU system wakeup QoS"
 	depends on CPU_IDLE
-- 
2.53.0.959.g497ff81fa9-goog

