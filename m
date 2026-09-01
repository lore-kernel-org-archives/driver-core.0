Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F138392C2E
	for <driver-core@lists.linux.dev>; Tue,  1 Sep 2026 01:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226474; cv=none; b=OhKB55LP1ma7LYLgGtQkqlk2xQmWJii1QqkD7myZ7dJV+6xx31nz8WpT511JxO0C4LUuXL1iuUglt7aUsmQasdVAAHjZjsoVgMhepC2zMo+9TaxzSeIGMFLQHJ7H9U+B3yIb71U523wkK7Qe7IsY7V4N0wEOTtp6sFoEQ4v2SeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226474; c=relaxed/simple;
	bh=MF0hTNvzTdpGvqo8emDiLI7Op/glV1Xy1dpT2XxnEE4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XhW5OTajOMj7TY4O7WN2LkIW8tluwqD8QdspOuwEXAlT6YrJ5JU+x4DglxqhH/2gIED96oRZYiAemNIpVbijC0k8YfDBVEPeMn3pko/Q3hCoBdoMjYlOv/JUkdF/6L1WPh6vnGNEiYvBoGPpInEIcs7/9rqNjEUZ7GISLD8bvyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CfHvFAy1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CfHvFAy1"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39647184c73so513203a91.1
        for <driver-core@lists.linux.dev>; Mon, 31 Aug 2026 18:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788226472; x=1788831272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9fRfnXzddhjDeOspwFwhS9N/kT3C//SscgMJBIw6do=;
        b=CfHvFAy1848VL6HCwMQXLEGBVDaCfeCzRGD5OupGXJSDLq0TAx0ajDWfFGUvf5CQsY
         V7niyLFPYFDxsU5j6tWoux3o9tn4g6i2MGYtBqJSLR/sznyPFpG8tfMCqLktXddFCxC5
         jwY3VE6PyhVOgkrIXA7BctgM1d0/bKYXxL59U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226472; x=1788831272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9fRfnXzddhjDeOspwFwhS9N/kT3C//SscgMJBIw6do=;
        b=AoaHJJFdAdBP1Xsrzgak9ZR+5wnYF0gXcwLkbncBaNDjVJW1tYQUmcQ8tUQw5xG8G8
         AdctbFX4btAcb42auE5GElNiPFE9ZWmBED2B3MTQZn1SHXXPCHF51aILSVuCtUYZa8X4
         UQP51q7myOh9khapi+PNc4KuNomvOTi4X1lVLpD/HFCeI3Cus3d35tucR9O9N4TmmUAF
         bU3bcIMaJIPe7HDH7nxANkZhOl4pvPUBZCCwbEtXDV+K1qds1OYQMPRNmDP/y9bObM5m
         XH+JpAlTN8jU4GoaLJoo2B5x93KS8OtI8232SsSrqpb8loosvioeoqZlWmhDIgZfh24q
         hAHw==
X-Forwarded-Encrypted: i=1; AKwUvBzbIkkJtSBYFm3XwuUldIAxluwGvLeSfwnhHlEk24G6+6jtoJpbglDLssRNxWc69Ypsj3hIX0DOXO8FNA==@lists.linux.dev
X-Gm-Message-State: AFuF++kvBCaQt1/AfFr9ufH+aZglaC22s3G/Mj6SXOLnJFtFJUX7Spmo
	aots0k9Dn8FIOsRm2FyHRZ8neqzWNPamHrAJRc1ec0I4IcT+FqHguTXEUpqJDCH1W+i0gBRcAXc
	yAj8=
X-Gm-Gg: AYBFou1mL/N/O5aXOHVEECsHhn7VK+7KYVEJybxDaDvFQYIZNdKcd+5SaxJ8OIUkpQG
	UN8YKgwZvdlPtiZfu6umAT2VcLqZUK1Vkra98Rq5EjSGw7agwnEZfZqCcRp/sFAmgiMMfNL6NgZ
	PgVr76xGSiQ1uncv+Dg4w7tqBOHeMmqgjZd0y5RvryuI/p7U0KcOGGZO+wTvNHPLU1NOHKDppYt
	72u0cgLbmK2WZcbKAlMP1VtX7ATbwmQaf+ar9fcpiTrwO2Jqxp3ODgGfYdRMJAEOTimAbDvH4HG
	4w7KiHRYQsavqOyFO4GGqLCYrk/0XW1KmnN0fi54P1EwWSbvnH/HjRgtK7ZiBFUW9ieyO4OPnf7
	Oqc/0JmB2typ8Ey0Uoq69gHzU/r+btLSkb/Ke/PhlTgWSLuRciNeZiE33Yav4c3DIROzvU0ZmKq
	WKz57tHYLTfknIfMCUdElPfQ44DhKBEL8ANYSbN7TshsTI/+e+7RiqdP2cGmz1ipEGk4Bh6sN5o
	SMCXt+38y0Twy7wdvertpAEz216aYE/5MJClA==
X-Received: by 2002:a17:90b:1f92:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-3990f78b130mr2150062a91.14.1788226471666;
        Mon, 31 Aug 2026 18:34:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:ab65:e5d8:860b:c20f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3286f8094dasm35514254eec.13.2026.08.31.18.34.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:34:30 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 1/2] PM: runtime: Only queue an idle check for RPM-linked suppliers
Date: Mon, 31 Aug 2026 18:23:22 -0700
Message-ID: <20260901013341.1417232-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a device RPM-suspends, it queues up an idle check for all of its
suppliers, in case that device was the last consumer, and those
suppliers are now able to suspend. Today, we do this for all suppliers,
and not only for those suppliers that are marked for use by runtime PM.
This isn't directly harmful, but it is a bit wasteful, and also may
induce unexpected suspend attempts (e.g., if a device was purposely last
touched with pm_runtime_put_noidle()).

To avoid excess idle checks, only call pm_request_idle() on linked
suppliers that opted into runtime PM.

Noticed by inspection of trace logs.

This is not expected to have a functional impact on systems that are
using device links properly, and should only be considered an
optimization.

Fixes: 5244f5e2d801 ("PM: runtime: Defer suspending suppliers")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index fab38bc98113..4d84d97f09c4 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -361,7 +361,8 @@ static void rpm_suspend_suppliers(struct device *dev)
 
 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
 				device_links_read_lock_held())
-		pm_request_idle(link->supplier);
+		if (device_link_test(link, DL_FLAG_PM_RUNTIME))
+			pm_request_idle(link->supplier);
 
 	device_links_read_unlock(idx);
 }
-- 
2.55.0.970.g62bdec98f9-goog

