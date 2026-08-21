Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410BA380FE0
	for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787332021; cv=none; b=dxaun7FbwiG2FuE/QQ+MwbKgretBhUHjNShKXbwh4wrBQq7Pgmb+Xg+hmwVT7SQPRKNFj4XBAacyxEBehGUBAoZIYc14kiO4/tShPT5QWZ4zHNpWOo/9wyGQJ/3DZyP7w739g7droOb1JV2PisAvCOzixAvyvyR+uQ0oygL9ur4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787332021; c=relaxed/simple;
	bh=L5QCafql6o1bFJRC238LIx9pFOSZ40WjOssoKln16BE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XZa09Qkz+kJOjsPAoJQafjefNGxlFuCj+zm+Enrc9tPykAD8XoDIgSR06Osj99Yui3uauTGrmdhtUGRTEWlwpG0NCsAGNEPRxafh4vY/NFi8duaPjYSpXs3ISHceUgON/wimb5XqoM9UiiaUj74Rgf4eP5WgX4qt0L4KUVqatW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cG0ZmELl; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mrungta.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cG0ZmELl"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1623764a91.1
        for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787332016; x=1787936816; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tUW8imgcNogSHjVHzQxzxnKDbyfi0RfaKJOMwb7PBq4=;
        b=cG0ZmELlNnIj25YkV722wi+N2xp4wWtJK7+GlV3Q5eglwd15R9ojUUs9Wsax7dDde6
         KR6SPj6ipO9WODMKtfP/udyFWTJDF2TMF9+jLTnodX5xnyARdnz1POCYv+lej8FGOXOX
         g2ixW2iNVaXWxmWkpsEMOZaiFjtxvPnCMBa0ua8yuhAOUSG0SytFwDfmOzUyXR4ZWwAe
         WgQkWNl5kaFeHu9etzx+H17XOCFjkOnzA1DpGMC73BRdHysGm/pPZW1DJ82JowrqMoLf
         5MU/E+xZ/lqoQR8lYgC8CoxA9VDvzMLdti9DteOp4Z8hFBHeDQo6CUixfRbPgsPpIdd1
         24Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787332016; x=1787936816;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUW8imgcNogSHjVHzQxzxnKDbyfi0RfaKJOMwb7PBq4=;
        b=faI1ylDqWk759phKGO+JhueTo5cjvdPV2Ggt+WNm10Q4AK/AO9VikKALfgDvgRTkFj
         hGvKWWJFScDKm5+xfbpT7fVkl7JNilus57CVmnNZQ2X4f4Z8OMLbmskq/X9nG0jQJMbz
         ESDFylBr+60UnDwQkLhqnndeT4Tg6b9doXlo02NrjhZCcR3boJq7S2h0LcVi8/uW5AFl
         1nVTd4dN6Dn9HhFSF4QmQPHPM7A8QnbbGG3g6RT3MI03sm41RRqkAdC7ALje5zI0vnAf
         VjuqXulige2m+mXKgqSC3JDq4cJw7o+SqE26LBe1Gn+mBcJ7VlnAN8M2DYwrJKJRWD1m
         dbew==
X-Forwarded-Encrypted: i=1; AHgh+RqZxfLyesG+rFwc3lYO5bsWu9fP2PUdVD3lATKP0BgROQTw/gvFBLDoOkLq1PWw3p7jR5YlZaS28gRjaw==@lists.linux.dev
X-Gm-Message-State: AFuF++mJ6/F1AmaF+8DQlwM/Cm66mrwio36Nir+YqItmH+BBST0Wxlm0
	rTPlB3AsWikb3uXvP8W3/rAMNWP8P1qvucwg04r/4zWOZGczSMkrLwUcJPUT/CW4mleZEwTcbtf
	C4LBbcc7s7w==
X-Received: from dlaj3.prod.google.com ([2002:a05:701b:2803:b0:141:56a4:67aa])
 (user=mrungta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:57e5:b0:381:11eb:d78e
 with SMTP id 98e67ed59e1d1-395c35f0a79mr14426483a91.14.1787332015547; Fri, 21
 Aug 2026 10:06:55 -0700 (PDT)
Date: Fri, 21 Aug 2026 10:06:48 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
Message-ID: <20260821170648.3097673-1-mrungta@google.com>
Subject: [PATCH] PM: sleep: Add DPM watchdog to late/early/noirq phases
From: Mayank Rungta <mrungta@google.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the DPM watchdog to wrap device_suspend_late, device_suspend_noirq,
device_resume_early, and device_resume_noirq callbacks. If a driver hangs
during these transitions, the watchdog will fire and dump a stack trace
to help identify the offending driver.

To prevent false-positive timeouts, the watchdog is set only after
waiting for subordinate (during suspend) and superior (during resume)
devices.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
Testing:
- Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel with
  DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
  backported).

 drivers/base/power/main.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 184dc4b3b938..b6778700af28 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -802,6 +802,7 @@ static void device_resume_noirq(struct device *dev, pm_message_t state, bool asy
 	const char *info = NULL;
 	bool skip_resume;
 	int error = 0;
+	DECLARE_DPM_WATCHDOG_ON_STACK(wd);
 
 	TRACE_DEVICE(dev);
 	TRACE_RESUME(0);
@@ -827,6 +828,7 @@ static void device_resume_noirq(struct device *dev, pm_message_t state, bool asy
 	if (!dpm_wait_for_superior(dev, async))
 		goto Out;
 
+	dpm_watchdog_set(&wd, dev);
 	skip_resume = dev_pm_skip_resume(dev);
 	/*
 	 * If the driver callback is skipped below or by the middle layer
@@ -871,6 +873,7 @@ static void device_resume_noirq(struct device *dev, pm_message_t state, bool asy
 	error = dpm_run_callback(callback, dev, state, info);
 
 Skip:
+	dpm_watchdog_clear(&wd);
 	dev->power.is_noirq_suspended = false;
 
 Out:
@@ -971,6 +974,7 @@ static void device_resume_early(struct device *dev, pm_message_t state, bool asy
 	pm_callback_t callback = NULL;
 	const char *info = NULL;
 	int error = 0;
+	DECLARE_DPM_WATCHDOG_ON_STACK(wd);
 
 	TRACE_DEVICE(dev);
 	TRACE_RESUME(0);
@@ -987,6 +991,7 @@ static void device_resume_early(struct device *dev, pm_message_t state, bool asy
 	if (!dpm_wait_for_superior(dev, async))
 		goto Out;
 
+	dpm_watchdog_set(&wd, dev);
 	if (dev->pm_domain) {
 		info = "early power domain ";
 		callback = pm_late_early_op(&dev->pm_domain->ops, state);
@@ -1004,7 +1009,7 @@ static void device_resume_early(struct device *dev, pm_message_t state, bool asy
 		goto Run;
 
 	if (dev_pm_skip_resume(dev))
-		goto Skip;
+		goto End;
 
 	if (dev->driver && dev->driver->pm) {
 		info = "early driver ";
@@ -1014,6 +1019,9 @@ static void device_resume_early(struct device *dev, pm_message_t state, bool asy
 Run:
 	error = dpm_run_callback(callback, dev, state, info);
 
+End:
+	dpm_watchdog_clear(&wd);
+
 Skip:
 	dev->power.is_late_suspended = false;
 	pm_runtime_enable(dev);
@@ -1508,6 +1516,7 @@ static void device_suspend_noirq(struct device *dev, pm_message_t state, bool as
 	pm_callback_t callback = NULL;
 	const char *info = NULL;
 	int error = 0;
+	DECLARE_DPM_WATCHDOG_ON_STACK(wd);
 
 	TRACE_DEVICE(dev);
 	TRACE_SUSPEND(0);
@@ -1520,6 +1529,7 @@ static void device_suspend_noirq(struct device *dev, pm_message_t state, bool as
 	if (dev->power.syscore || dev->power.direct_complete)
 		goto Complete;
 
+	dpm_watchdog_set(&wd, dev);
 	if (dev->pm_domain) {
 		info = "noirq power domain ";
 		callback = pm_noirq_op(&dev->pm_domain->ops, state);
@@ -1550,7 +1560,7 @@ static void device_suspend_noirq(struct device *dev, pm_message_t state, bool as
 		WRITE_ONCE(async_error, error);
 		dpm_save_failed_dev(dev_name(dev));
 		pm_dev_err(dev, state, async ? " async noirq" : " noirq", error);
-		goto Complete;
+		goto End;
 	}
 
 Skip:
@@ -1569,6 +1579,9 @@ static void device_suspend_noirq(struct device *dev, pm_message_t state, bool as
 	if (dev->power.must_resume)
 		dpm_superior_set_must_resume(dev);
 
+End:
+	dpm_watchdog_clear(&wd);
+
 Complete:
 	complete_all(&dev->power.completion);
 	TRACE_SUSPEND(error);
@@ -1703,6 +1716,7 @@ static void device_suspend_late(struct device *dev, pm_message_t state, bool asy
 	pm_callback_t callback = NULL;
 	const char *info = NULL;
 	int error = 0;
+	DECLARE_DPM_WATCHDOG_ON_STACK(wd);
 
 	TRACE_DEVICE(dev);
 	TRACE_SUSPEND(0);
@@ -1720,6 +1734,8 @@ static void device_suspend_late(struct device *dev, pm_message_t state, bool asy
 	if (dev->power.direct_complete)
 		goto Complete;
 
+	dpm_watchdog_set(&wd, dev);
+
 	/*
 	 * After this point, any runtime PM operations targeting the device
 	 * will fail until the corresponding pm_runtime_enable() call in
@@ -1761,13 +1777,16 @@ static void device_suspend_late(struct device *dev, pm_message_t state, bool asy
 		dpm_save_failed_dev(dev_name(dev));
 		pm_dev_err(dev, state, async ? " async late" : " late", error);
 		pm_runtime_enable(dev);
-		goto Complete;
+		goto End;
 	}
 	dpm_propagate_wakeup_to_parent(dev);
 
 Skip:
 	dev->power.is_late_suspended = true;
 
+End:
+	dpm_watchdog_clear(&wd);
+
 Complete:
 	TRACE_SUSPEND(error);
 	complete_all(&dev->power.completion);

base-commit: 77ae27fd98f3b548797c9f22c10ab5cf1c4ada53
-- 
2.55.0.766.g2966f0265a-goog

