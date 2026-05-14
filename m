Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930DA384244
	for <driver-core@lists.linux.dev>; Thu, 14 May 2026 09:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778752208; cv=none; b=Uk+bxS2MqFBABbfk0hoXrAVmr1V1P2mTjsicUfRlbiEaA2bH+jQSzaQS/G893FTXsC9tFt5rEbyMNoOa7ZgW+jEYrE+igkan7jHe/rjslScwBIZoP43cwXZOYxE7GQk0sX+ENr8H28JWP7L9J5iMTPkKvpPDv1fJnLJigxnV3xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778752208; c=relaxed/simple;
	bh=H9a5x6dTjsMvOh4P3qjaDWBVjbyTX8vwZnP+Mf+B9mE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HuRfbs52mLaFqc1dGgaEyvJ4aRsGlYX4TX5CzmbMWRCtkPmbciBRkHITUNimpsKsrXzzGB6J4IGyuzHNfIHQDNwAJkudKqP2UdhOF50LrvzBMB05ep5KzGdPdEHZG8qzHc8F7u+OfzFY5LhM+cwCHFIAdatqbUHKVQ0Hp2zNWA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjSwZfTr; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjSwZfTr"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12c750eaf4cso453068c88.0
        for <driver-core@lists.linux.dev>; Thu, 14 May 2026 02:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778752206; x=1779357006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jcxr2VlXAuBBncvCLrJdY2RPum93AcGr52GcloGo/uw=;
        b=rjSwZfTrejXgqDWwcazGdFtzZLQ+YbVbVMvXib3BRzjFXvUQ/wuOYzxx/BqtdcpJHm
         EgMbfPfRhcxrNg2dISM1OCIEegNRy8cOuxaZgQMjmhmKOnvZT7myTlsopQsZB2pDtU4/
         TOMnwSt9BHQprsYAhWF/osv3z8HGsgUTAJVSA4GvRi6jLlF/QfrlQnIa6Mi7reW07JoS
         Jg3UUkOwAwvuuUs2ajBu7PsVztE33kJPbnEOw1GbktNhNgofw9+8wuNRzHqn2DBMYybb
         NCZRyF+YvH7vX8lIqSuN7vKMluw17HE62gmR4aYHUS8c+PQie12U1r1CXxf1bhb/V2u4
         f2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778752206; x=1779357006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jcxr2VlXAuBBncvCLrJdY2RPum93AcGr52GcloGo/uw=;
        b=OndB8lOyG2iqUlbq9lSKDWeSck0wUKvpbJnedWo8t59dKbI0erLR6DTRK6utz9BQAT
         mV1IFMBJzf04OEGjY0stRlTOvT19YBxkVrW+08shNB0S9TgcPyIeZHMlreXSGKpDI5b5
         fQGJVwkZ3bwxTb8GMR+Zizf4XRbKEQdZlwHg7vp6MKW9aLIe1VUWvYpy+mgFgxK+amRs
         8ff8I6igshDKQ4LRXyrn7OE60u+MdcwV1GBgLjhCULi4npfdgtQu1iQaVnwxsyIIo8lc
         IS4hLX7mTxfiHt8vaRxTlC0H35vJ7Oev9B/f2IRhKGsMMVdeO4FQ6sp7qEmkbnLUene7
         gn5w==
X-Forwarded-Encrypted: i=1; AFNElJ+sHiCyNL2cSCCe96UKSHsKhL5lNgcyJjBEtfDvw1ftR/q67D0MGjBZxUdU4g7BIC5Qg4j3g3RGnavMrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YywUjdVyinwh/daNfdjiEbQtBlLcjL5R8aHdfoMf1x3JjwGQVdo
	62HtWusVuS0hqmxo4HGnMJp5JnfLiZ5OyXgMwaN+uQp7FDGNzkpzGik6
X-Gm-Gg: Acq92OEpD0eEg4sj2hZFPhyMCiM5eVHlB5X6vFS7cY6sbnj4+4WJOitQxY2BH3DwTFY
	ekRphNXxQy0dcM9BIRsAosTvGMGG+rfJ5r24f6CcVKxbYx3bq7v77ttTipMmckFn48Qw3ic8Wtb
	TdZlVNxoozEq5AWu9XXUtjBsozruTgpkmmEB50OYFtgpwhgS7nEW9/HqbIdKabY6wqRXYhXpZ6n
	VKFLO6c1nK75J4LaROuOpFCh4NT9cnzxfnniE8p4Zm6Tw2Z8RjmJwa2QSlRE0S0joOuhODdnY9E
	NojtqKTzmmLyTF3+LmVmf1T7/mrnNKln0HtmmaAdGcLiwOq/Hn2Jyod/Qcb4/bzx428+aE6kOsq
	yiObW0QSp56SCW5utuHyvXYdAbJrqwyxtcJ3fHwQaOlG/yMXxCbg1X98+xhAyxAw6Q/u84KqHgj
	s36PmkZssXHfQrfIIxlhqtLCFDY3dstE3nrPiIX30jLTcFc3pbRQ==
X-Received: by 2002:a05:7300:e425:b0:2c4:ec89:bdb with SMTP id 5a478bee46e88-30116e8ff6fmr2144564eec.2.1778752205477;
        Thu, 14 May 2026 02:50:05 -0700 (PDT)
Received: from MGG23TF6W0.corp.ebay.com ([216.113.165.51])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-30296dcb6f6sm2636852eec.17.2026.05.14.02.50.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 14 May 2026 02:50:04 -0700 (PDT)
From: Jianlin Lv <iecedge@gmail.com>
X-Google-Original-From: Jianlin Lv <jianlv@ebay.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: iecedge@gmail.com,
	jianlv@ebay.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH] driver core: Add cmdline option to force probe type
Date: Thu, 14 May 2026 17:49:55 +0800
Message-ID: <20260514094955.76305-1-jianlv@ebay.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jianlin Lv <iecedge@gmail.com>

Device drivers that use asynchronous probing can cause non-deterministic
device ordering and naming across reboots. A typical example is storage
drivers (like sd/nvme): asynchronous probing can lead to inconsistent disk
logical names after reboot. In scenarios where disk naming consistency is
critical, the probe type should be set to synchronous.

This patch introduces a driver_probe kernel parameter that overrides any
driver's hard-coded probe type settings and allows runtime control without
requiring kernel recompilation:

  driver_probe=PROBE_TYPE_SYNC,nvme,sd      # Force specific drivers sync
  driver_probe=PROBE_TYPE_ASYNC,*,usb       # Force all async except usb
  driver_probe=PROBE_TYPE_SYNC,*            # Force all drivers synchronous

The implementation replaces the limited driver_async_probe parameter with
a more flexible interface that can force either synchronous or asynchronous
probing as needed.

Signed-off-by: Jianlin Lv <iecedge@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         | 27 +++++--
 drivers/base/dd.c                             | 71 ++++++++++++++-----
 2 files changed, 74 insertions(+), 24 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4d0f545fb3ec..b43a8bd20356 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1377,12 +1377,27 @@ Kernel parameters
 			it becomes active and is searched during signature
 			verification.
 
-	driver_async_probe=  [KNL]
-			List of driver names to be probed asynchronously. *
-			matches with all driver names. If * is specified, the
-			rest of the listed driver names are those that will NOT
-			match the *.
-			Format: <driver_name1>,<driver_name2>...
+	driver_probe=   [KNL]
+			Control device driver probe types. This parameter takes
+			precedence over driver hard-coded probe_type settings.
+			Format: <probe_type>,<driver_name1>,<driver_name2>,...
+
+			<probe_type>:
+			  PROBE_TYPE_SYNC  - Force synchronous probing
+			  PROBE_TYPE_ASYNC - Force asynchronous probing
+
+			Driver name patterns:
+			  driver1,driver2  - Apply to specific drivers only
+			  *,driver1,driver2 - Apply to all drivers except listed ones
+			  * (alone)        - Apply to all drivers
+
+			Examples:
+			  driver_probe=PROBE_TYPE_SYNC,nvme,sd
+			    Force synchronous probe for nvme and sd drivers
+			  driver_probe=PROBE_TYPE_SYNC,*,graphics,usb-storage
+			    Force sync for all drivers except graphics and usb-storage
+			  driver_probe=PROBE_TYPE_ASYNC,*
+			    Force async probe for all drivers
 
 	drm.edid_firmware=[<connector>:]<file>[,[<connector>:]<file>]
 			Broken monitors, graphic adapters, KVMs and EDIDless
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 1dc1e3528043..7d8e0c932e0b 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -59,9 +59,10 @@ static atomic_t deferred_trigger_count = ATOMIC_INIT(0);
 static bool initcalls_done;
 
 /* Save the async probe drivers' name from kernel cmdline */
-#define ASYNC_DRV_NAMES_MAX_LEN	256
-static char async_probe_drv_names[ASYNC_DRV_NAMES_MAX_LEN];
-static bool async_probe_default;
+#define DRIVER_PROBE_NAMES_MAX_LEN 256
+static char driver_probe_names[DRIVER_PROBE_NAMES_MAX_LEN];
+static enum probe_type driver_probe_default = PROBE_DEFAULT_STRATEGY;
+static bool driver_probe_wildcard;
 
 /*
  * In some cases, like suspend to RAM or hibernation, It might be reasonable
@@ -914,30 +915,67 @@ static int driver_probe_device(const struct device_driver *drv, struct device *d
 	return ret;
 }
 
-static inline bool cmdline_requested_async_probing(const char *drv_name)
+static int __init save_driver_probe_options(char *buf)
 {
-	bool async_drv;
+	if (strlen(buf) >= DRIVER_PROBE_NAMES_MAX_LEN)
+		pr_warn("Too long list of driver names for 'driver_probe'!\n");
+
+	strscpy(driver_probe_names, buf, DRIVER_PROBE_NAMES_MAX_LEN);
+
+	if (parse_option_str(driver_probe_names, "PROBE_TYPE_SYNC"))
+		driver_probe_default = PROBE_FORCE_SYNCHRONOUS;
+	else if (parse_option_str(driver_probe_names, "PROBE_TYPE_ASYNC"))
+		driver_probe_default = PROBE_PREFER_ASYNCHRONOUS;
+	else {
+		pr_warn("driver_probe: invalid type\n");
+		return 1;
+	}
 
-	async_drv = parse_option_str(async_probe_drv_names, drv_name);
+	driver_probe_wildcard = parse_option_str(driver_probe_names, "*");
+	pr_info("driver_probe: %s mode, list=\"%s\"\n",
+		driver_probe_wildcard ? "wildcard" : "specific",
+		driver_probe_names);
 
-	return (async_probe_default != async_drv);
+	return 1;
 }
+__setup("driver_probe=", save_driver_probe_options);
 
-/* The option format is "driver_async_probe=drv_name1,drv_name2,..." */
-static int __init save_async_options(char *buf)
+static int driver_probe_type_override(const char *drv_name)
 {
-	if (strlen(buf) >= ASYNC_DRV_NAMES_MAX_LEN)
-		pr_warn("Too long list of driver names for 'driver_async_probe'!\n");
+	bool driver_listed;
 
-	strscpy(async_probe_drv_names, buf, ASYNC_DRV_NAMES_MAX_LEN);
-	async_probe_default = parse_option_str(async_probe_drv_names, "*");
+	if (driver_probe_default == PROBE_DEFAULT_STRATEGY)
+		return -1;
 
-	return 1;
+	driver_listed = parse_option_str(driver_probe_names, drv_name);
+
+	if (driver_probe_wildcard) {
+		/* Wildcard mode: apply default to all, exceptions get opposite */
+		if (driver_listed)
+			return (driver_probe_default == PROBE_PREFER_ASYNCHRONOUS) ? 0 : 1;
+		else
+			return (driver_probe_default == PROBE_PREFER_ASYNCHRONOUS) ? 1 : 0;
+	} else {
+		/* Specific mode: only listed drivers get the specified type */
+		if (driver_listed)
+			return (driver_probe_default == PROBE_PREFER_ASYNCHRONOUS) ? 1 : 0;
+		else
+			return -1;  /* Not listed - no override */
+	}
 }
-__setup("driver_async_probe=", save_async_options);
 
 static bool driver_allows_async_probing(const struct device_driver *drv)
 {
+	int probe_override;
+
+	/* Check driver_probe parameter first (highest priority) */
+	probe_override = driver_probe_type_override(drv->name);
+	if (probe_override >= 0) {
+		pr_info("driver_probe override: %s -> %s\n",
+			drv->name, probe_override ? "async" : "sync");
+		return probe_override;
+	}
+
 	switch (drv->probe_type) {
 	case PROBE_PREFER_ASYNCHRONOUS:
 		return true;
@@ -946,9 +984,6 @@ static bool driver_allows_async_probing(const struct device_driver *drv)
 		return false;
 
 	default:
-		if (cmdline_requested_async_probing(drv->name))
-			return true;
-
 		if (module_requested_async_probing(drv->owner))
 			return true;
 
-- 
2.43.0

