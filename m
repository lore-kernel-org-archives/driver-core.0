Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BD23B8BC1
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 08:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787213286; cv=none; b=nQfKzQX++IyzZTa8TmHjiu8eKFk5rFiWtJ17i0oUqWPXuvXCBFB1Rfxnpo64ma4HUmOgqhN0kzQSCDMABrhETqk0JvHBxLWp3et93D6TGleYGM9slIx0q7SHwHIgMvLuKdRWwW7vwRfpTailPtBHaeUlLWwTWis3yayrEXQrEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787213286; c=relaxed/simple;
	bh=JrSxGhiY9YbKE0r8geHI6lykiTiWPRu/almUpFLxeiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aetBXnYKXUnyf67+0iYQXqncwWxWT1kYjBIJ22PDdqzuO/HBaU63Odk+TCuXYi8QHc9Vwv6EqvXb5UkDD4k0HJ464omulE8d4oYY1ma/S0YHkIscXbtyuv73hnxm6hLyUvrdJUITEdogab78y1mb2C7oQIS5vSCZulZnxKk+qYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qfj66mYJ; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qfj66mYJ"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca7fcfe1669so616570a12.0
        for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787213284; x=1787818084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWXb8OfrIhx+v+9x1/zpkXJrGwA1aKR+aC1z4e+KOx8=;
        b=Qfj66mYJM3KO1T2OHrLhYXbRdAG96DcIwIrHy+QHnP+NDH3I8ZU0SwqAm49xwUpc5c
         xkd9ijXw8QaRcGYjPBGMIwWG1OVZRggBhvtmqOLkSa2qY3MHyUAJIyeIsLVNy+YW7c55
         B115LIINUl2yREXsEULPFrGVzY8vyxQoR1OcSPNVEj4KYtMxp7Lqhie+NVxaOEz8E8Iu
         4d38K2HXUFJib4arA7mzTJRB0U3Xx8hRV0LUTLfZptVuRe5Oiq7YJuFzFjAXKyiWe+pK
         6nPDI4CVCHZz6MLgJxR82CwcUb9eIenpt72icQ/VuKzfThqVSxN39DkU7070lhr0GCcy
         Pciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787213284; x=1787818084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWXb8OfrIhx+v+9x1/zpkXJrGwA1aKR+aC1z4e+KOx8=;
        b=K6OwtXmuuQDp9xZ3dCInKLVotdIctPzgalwaOKvjmpYSfwGre4lbbCRfJKjZLxSuAE
         RPJSailDYiLqDe+MS0PQg2uHgHED9PdDOYqWG0CIH2PWNl3NWEVKizpB1jj04HFNwaEd
         1+zptBT/PeCXaPj5uTr/dj+guvmjED/UuxmuxQsqyQwAdXHC0Cj0//QMlrsYnm9BjPIf
         ZT4pHBpoeOeHmeJolcfLXHa8wi8bZj8T/N2IhicX1BMVHJaWvUH1X2/23e+lofK4imd2
         6sc+XMfbi/tgRFE+ACT/rPFyUH+oL/cN1qbL3CUDqPpEP2ZJnddN4gFLq1Yk6BxH4Bzs
         Enrw==
X-Gm-Message-State: AOJu0Ywc5HzCH4i1DvkJ8bndlnAOndCDGfAlj07nG1tzyvENrwbT3S5Z
	9wlah9kcufbwbH8O1cDLbpwis5YA23I3ILTiR3MATAsXs3DCU1sy12dH
X-Gm-Gg: AR+sD11K/nUA6jBgI+zmwERg58aOBvp3UIWDDtkCd3G5wm1Q6V0qLBK+FbFm1jbUT1P
	FVxoegmMNPsWPN9t0zBy3RAZPMzVfoK1HHUR8sLaTbHWN0zK1LayfuJ54CxqKwiOB9Vvbs0AmjS
	EbTlusZ8pCa5t4hbxVq8iilaq8JGJQSKC3ZGRYMV9x7dd2jwqDzYI84QfG4JnwCCbIf0afkp9L/
	9oHEjceeJkEEg1cpJFAfn7W5OKPsbwthGbuOEksp+vuOmHbtgoz3wKAc8m3Ow56tPWMPBj2tr4U
	IszJl5CAm9TKIaD6srVTYw6cQve9jwN3BqXDAsc6sne+Ss1KS876Ix/rkFAK4dJlMN/o0qcq1gh
	6f75xey2nDwhxYuzs46aPvy4WT4+ISpopy27R7iVDslnOXa8hI7IQTpK1ElVKzOh1sPFY4wFf+M
	2blBqq6G37SC9LdRhhTZFbZlQkRaD1jmlCQYSSGgYuNAxkCSd133QbyQqgtD0p1A==
X-Received: by 2002:a05:6a00:190e:b0:842:708f:39be with SMTP id d2e1a72fcca58-851d382dc95mr16866958b3a.5.1787213284160;
        Thu, 20 Aug 2026 01:08:04 -0700 (PDT)
Received: from work-hw ([223.214.148.187])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617375sm1393419b3a.36.2026.08.20.01.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:08:03 -0700 (PDT)
From: KrisPoint <krispointcsgo@gmail.com>
X-Google-Original-From: KrisPoint <KrisPointCSGO@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	KrisPoint <KrisPointCSGO@gmail.com>
Subject: [PATCH] platform: unify the platform_pm_* suspend/resume dispatch
Date: Thu, 20 Aug 2026 16:07:35 +0800
Message-ID: <20260820080735.691297-1-KrisPointCSGO@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The six platform_pm_suspend()/platform_pm_resume()/platform_pm_freeze()/
platform_pm_thaw()/platform_pm_poweroff()/platform_pm_restore() callbacks
all follow the same pattern: return early when the device has no driver,
call the matching dev_pm_ops callback when one is present, and otherwise
fall back to the legacy platform suspend/resume callbacks. This skeleton
is currently open-coded in each of the six functions, leaving about 110
lines of near-identical logic that must be kept in sync by hand.

Add a common platform_pm_dispatch() helper that implements the shared
logic, driven by the dev_pm_ops callback, the legacy callback and the
pm message to pass, and turn the six callbacks into thin wrappers around
it. A platform_legacy_resume_state() adapter is added so the legacy
callbacks share a single signature.

No functional change intended.

Signed-off-by: KrisPoint <KrisPointCSGO@gmail.com>
---
 drivers/base/platform.c | 109 ++++++++++++++--------------------------
 1 file changed, 38 insertions(+), 71 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 66f9ec73d..f02b44937 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1248,44 +1248,47 @@ static int platform_legacy_resume(struct device *dev)
 	return ret;
 }
 
-#endif /* CONFIG_PM_SLEEP */
-
-#ifdef CONFIG_SUSPEND
+static int platform_legacy_resume_state(struct device *dev, pm_message_t state)
+{
+	return platform_legacy_resume(dev);
+}
 
-int platform_pm_suspend(struct device *dev)
+static int platform_pm_dispatch(struct device *dev,
+				int (*pm_op)(struct device *),
+				int (*legacy_op)(struct device *, pm_message_t),
+				pm_message_t legacy_state)
 {
 	const struct device_driver *drv = dev->driver;
-	int ret = 0;
 
 	if (!drv)
 		return 0;
 
-	if (drv->pm) {
-		if (drv->pm->suspend)
-			ret = drv->pm->suspend(dev);
-	} else {
-		ret = platform_legacy_suspend(dev, PMSG_SUSPEND);
-	}
+	if (drv->pm)
+		return pm_op ? pm_op(dev) : 0;
 
-	return ret;
+	return legacy_op(dev, legacy_state);
 }
 
-int platform_pm_resume(struct device *dev)
+#endif /* CONFIG_PM_SLEEP */
+
+#ifdef CONFIG_SUSPEND
+
+int platform_pm_suspend(struct device *dev)
 {
 	const struct device_driver *drv = dev->driver;
-	int ret = 0;
 
-	if (!drv)
-		return 0;
+	return platform_pm_dispatch(dev,
+				    drv && drv->pm ? drv->pm->suspend : NULL,
+				    platform_legacy_suspend, PMSG_SUSPEND);
+}
 
-	if (drv->pm) {
-		if (drv->pm->resume)
-			ret = drv->pm->resume(dev);
-	} else {
-		ret = platform_legacy_resume(dev);
-	}
+int platform_pm_resume(struct device *dev)
+{
+	const struct device_driver *drv = dev->driver;
 
-	return ret;
+	return platform_pm_dispatch(dev,
+				    drv && drv->pm ? drv->pm->resume : NULL,
+				    platform_legacy_resume_state, PMSG_RESUME);
 }
 
 #endif /* CONFIG_SUSPEND */
@@ -1295,73 +1298,37 @@ int platform_pm_resume(struct device *dev)
 int platform_pm_freeze(struct device *dev)
 {
 	const struct device_driver *drv = dev->driver;
-	int ret = 0;
-
-	if (!drv)
-		return 0;
-
-	if (drv->pm) {
-		if (drv->pm->freeze)
-			ret = drv->pm->freeze(dev);
-	} else {
-		ret = platform_legacy_suspend(dev, PMSG_FREEZE);
-	}
 
-	return ret;
+	return platform_pm_dispatch(dev,
+				    drv && drv->pm ? drv->pm->freeze : NULL,
+				    platform_legacy_suspend, PMSG_FREEZE);
 }
 
 int platform_pm_thaw(struct device *dev)
 {
 	const struct device_driver *drv = dev->driver;
-	int ret = 0;
 
-	if (!drv)
-		return 0;
-
-	if (drv->pm) {
-		if (drv->pm->thaw)
-			ret = drv->pm->thaw(dev);
-	} else {
-		ret = platform_legacy_resume(dev);
-	}
-
-	return ret;
+	return platform_pm_dispatch(dev,
+				    drv && drv->pm ? drv->pm->thaw : NULL,
+				    platform_legacy_resume_state, PMSG_RESUME);
 }
 
 int platform_pm_poweroff(struct device *dev)
 {
 	const struct device_driver *drv = dev->driver;
-	int ret = 0;
 
-	if (!drv)
-		return 0;
-
-	if (drv->pm) {
-		if (drv->pm->poweroff)
-			ret = drv->pm->poweroff(dev);
-	} else {
-		ret = platform_legacy_suspend(dev, PMSG_HIBERNATE);
-	}
-
-	return ret;
+	return platform_pm_dispatch(dev,
+				    drv && drv->pm ? drv->pm->poweroff : NULL,
+				    platform_legacy_suspend, PMSG_HIBERNATE);
 }
 
 int platform_pm_restore(struct device *dev)
 {
 	const struct device_driver *drv = dev->driver;
-	int ret = 0;
 
-	if (!drv)
-		return 0;
-
-	if (drv->pm) {
-		if (drv->pm->restore)
-			ret = drv->pm->restore(dev);
-	} else {
-		ret = platform_legacy_resume(dev);
-	}
-
-	return ret;
+	return platform_pm_dispatch(dev,
+				    drv && drv->pm ? drv->pm->restore : NULL,
+				    platform_legacy_resume_state, PMSG_RESUME);
 }
 
 #endif /* CONFIG_HIBERNATE_CALLBACKS */
-- 
2.53.0

