Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1F3AEF4B
	for <driver-core@lists.linux.dev>; Tue,  1 Sep 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226476; cv=none; b=RbsF1M8D8lDxpE+jW+EmQiRcAqSffvtVZUkvVNc5oJG25MC+sXpvYTtcz1IfaWgSqT7RddynVMy4Xr4qQlQdSWy3BjnYKbVQM0n7JIkxcvxZuPgrWGfCakHoKB1UH4ZH4u57P+c07e7WsawF8F7F4Z4G+K7oOeIcqncXSnYwsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226476; c=relaxed/simple;
	bh=1mpcEHU+vXV7UJTachxrk+ovjYhZdLAWpZ3FoOglyek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7yj0M1tDBkUUyqo+l9HmBql9D4isH0vAgqWHgygmj7v00fI8REF31erjf8dNtH0owOwpiuurUGNno3oRz9jBBLjk+s+bUJEKG96HiZRItsJVgbczVE0pJUL6lNKyVu7IYY7Cr4othnIw1PMkTfK40ebY4G3JR7qViFl9FfAzP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CtRWQt+D; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CtRWQt+D"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbe827e3cb4so4527345a12.3
        for <driver-core@lists.linux.dev>; Mon, 31 Aug 2026 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788226474; x=1788831274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbPmurZM++0R7ryOeZy8bjoqVFB9j6Ae9S7wxXumXEQ=;
        b=CtRWQt+Dy7K+8M05sXDNqZaNOHDl4piFvw4jHHPVAvcXvw08YuBkIndpQ0JeYJzndi
         XwF+INsyukYPpjuaCLuY/otL1eHwwxlQHI0OQYYc0wUWFLSRXDQL6wPD/JKQocc77gvF
         ibbS1LNMP9rR+WFHY7VdeySA4LcGRivsRix9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226474; x=1788831274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbPmurZM++0R7ryOeZy8bjoqVFB9j6Ae9S7wxXumXEQ=;
        b=LYuaMz2EJ08Gmad/+hut5nEcEXEwy6zQOSqP7KHJPxP+/cJYv3RPR1Fx/ySryooIJf
         433YPGWE96L32Gm8+vYkVbbA0bg684ocBHa7BRQONC5pztFgc1SnjqkFXJhKUXAq/XT4
         axGObw/upi01+GfehtpzuHAcWfAcP55/KMe9Im74rMgMPUfXWe1iOtBTgWqZEnCX0wYi
         NIrlr21/nbr6Y+ltxzRM/UOEhw0hICyVpptd5qzJ+FRfQW1LLjlTwmu/wPOQA/NbiEuJ
         gCIeKLc+kb0iUbGhKgJ8+qqPcvCRjSn8yZIHYEcJ3freuswd+vDpWjuCngHmbwL9sBC7
         dVcA==
X-Forwarded-Encrypted: i=1; AHgh+RrUuW6kiYq4c328ZYU5oU1LokvKb+VHXCYwuTwr9PO/8pYmpxPABTEkt8Wl6G3BZh4ioDxGShq6aksRew==@lists.linux.dev
X-Gm-Message-State: AFuF++lyw94rUIg6/kOPRNVY3WIG4EEL/jxxTpsAQU/glEz9OD5ks8jb
	bqFUTMBQrrQVmmDcWL/EAiokI5yb1SY2lo82kaBo+jNEgI5BYOj0vN8Oy+9xK7Gn8A==
X-Gm-Gg: AR+sD132zNY3C7LNaGWwbNZjsbC1sHHiairFDs+tCy7Kz3DREzFlYg8GrvaR53gh+Ep
	hNSWRuf/2sAwMxstVoobCQof4FF0+zyTVJsfrXVXMa5wLyNP+dCn2p7YCIacME9Ghg7cZhyK2Re
	MvfMYUZSCWe1F2eKXX678D3JXWGREigfW607eUfKW13BDs9I2k6vvz+Fku1PiS3zmPd1LmiKtnG
	nASVR3nERr3b3fZvO/PtlIJu5t8xnMImDvOQF+D7zO5ZQI1NNDJdukE5x0LGG1Q3XY1u0SQK9Gz
	1hTKTfBeQkgADlU7A8ZsAhpcQIsU++lLNLEpCfcf8qqtxrHBULXMcCmUb0VSwyfku8TYFYXSApx
	S4oUfdliXACftxN4x08Da9P7/a5seX3co/pyPoVTTg2nfxTbz0JnySAaSTrnBF2DgCorw9lKPM7
	VbkUxZzbdkRobrYQAWAA1V7cU6lMGmH044Bl0d4BMwrf/BGvLQZv56XuchsHpdrE609ytz8aCl+
	4miRaVwUBA0fl1mfBMRvphg670TE6xS0YdV+Q==
X-Received: by 2002:a05:6a21:3944:b0:3d3:aec2:4dcb with SMTP id adf61e73a8af0-3d7b075b26bmr8592474637.23.1788226473927;
        Mon, 31 Aug 2026 18:34:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:ab65:e5d8:860b:c20f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-142e0d38207sm31017877c88.5.2026.08.31.18.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:34:33 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/2] PM: runtime: Add kunit test for supplier idle/suspend
Date: Mon, 31 Aug 2026 18:23:23 -0700
Message-ID: <20260901013341.1417232-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
In-Reply-To: <20260901013341.1417232-1-briannorris@chromium.org>
References: <20260901013341.1417232-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a unit test that covers the bugfix/optimization in the previous
patch, "PM: runtime: Only queue an idle check for RPM-linked suppliers".

This test ensures:

1) device links with DL_FLAG_PM_RUNTIME can RPM-resume/suspend properly;
   and

2) device links without DL_FLAG_PM_RUNTIME are not accidentally
   resumed/suspended along with the consumer.

Notably, without patch 1 ("PM: runtime: Only queue an idle check for
RPM-linked suppliers"), the no-RPM supplier will fail 2 of its last 3
test expectations:

  $ tools/testing/kunit/kunit.py run --kconfig_add CONFIG_PM=y 'pm_runtime*'

  ...

  ## Fails because rpm_suspend_suppliers() suspended the wrong links
  [17:01:44] # pm_runtime_supplier_suspend_test: EXPECTATION FAILED at drivers/base/power/runtime-test.c:279
  [17:01:44] Expected pm_runtime_active(norpm_supplier) to be true, but is false

  ## Fails because the no-RPM supplier is already suspended unexpectedly
  [17:01:44] # pm_runtime_supplier_suspend_test: EXPECTATION FAILED at drivers/base/power/runtime-test.c:282
  [17:01:44] Expected 0 == pm_runtime_suspend(norpm_supplier), but
  [17:01:44]     pm_runtime_suspend(norpm_supplier) == 1 (0x1)
  ...

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
In my opinion, this patch is slightly better as a proof for my patch 1
fix, rather than a proper unit test, mainly because it:

1) tests a somewhat arcane set of particular sequences and

2) lightly depends on the behavior of pm_wq.

But it should be a reliable regression test still, if it's deemed
valuable.

 drivers/base/power/runtime-test.c | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 1535ad2b0264..24865ce844fc 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -5,6 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
+#include <linux/workqueue.h>
 #include <kunit/device.h>
 #include <kunit/test.h>
 
@@ -229,6 +230,61 @@ static void pm_runtime_probe_active_test(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
 }
 
+static void pm_runtime_supplier_suspend_test(struct kunit *test)
+{
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	struct device *supplier = kunit_device_register(test, DEVICE_NAME "_supplier");
+	struct device *norpm_supplier = kunit_device_register(test, DEVICE_NAME "_norpm_supplier");
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, norpm_supplier);
+
+	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, supplier, DL_FLAG_PM_RUNTIME));
+	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, norpm_supplier, 0));
+
+	pm_runtime_enable(dev);
+	pm_runtime_enable(supplier);
+	pm_runtime_enable(norpm_supplier);
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
+
+	/*
+	 * Resume the device and RPM-linked supplier; non-RPM-linked supplier
+	 * stays suspended.
+	 */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
+
+	/* Also resume the non-RPM-linked supplier. */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(norpm_supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(norpm_supplier));
+
+	pm_runtime_put_noidle(norpm_supplier);
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(norpm_supplier));
+
+	/*
+	 * Suspend device. This should only suspend the device and its
+	 * RPM-linked supplier, not the non-RPM-linked supplier.
+	 */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
+	/* Note: supplier suspend is async, so we have to flush the queue. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(norpm_supplier));
+
+	/* Now suspend non-RPM-linked supplier. */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_suspend(norpm_supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
+}
+
 static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_depth_test),
 	KUNIT_CASE(pm_runtime_already_suspended_test),
@@ -236,6 +292,7 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_disabled_test),
 	KUNIT_CASE(pm_runtime_error_test),
 	KUNIT_CASE(pm_runtime_probe_active_test),
+	KUNIT_CASE(pm_runtime_supplier_suspend_test),
 	{}
 };
 
-- 
2.55.0.970.g62bdec98f9-goog

