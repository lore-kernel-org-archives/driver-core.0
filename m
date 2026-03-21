Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE92D8DC3
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774062522; cv=none; b=PIdt/jfspKLwCArhc8MlgSRwwOECsQ7w2f5OFBemORkTpDeKs/MNxym2yQ24X/QZwjWYJqucaXs/rMiE+btdWnVfi3lmdhbwVeveVTQXBwbGB96tv0Ourts36QyihpAOcJ9SGINPTBQ+IEbbbWcG/RS4T1/7JABwhEWEPXJaQ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774062522; c=relaxed/simple;
	bh=ncTIMNASHjpZ6B39V82ZgctoszodwVhtazh6QmPsAfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTYpyX3wZia3x7AWOhy/PP64pFl+fUYuFP4r03rvBROcrHlTAsRDNs62lNpPGt4XRvlYStLfAIXrDkuB0juS6mniqAdcT0XIbgcdlWz8isn3NACRMJMZzFT8UXPF1uEdpXIIUKFFIJN8tsGr/FAYgivjnMKbJdWCRgpMIx+0MTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ad/pWUoH; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ad/pWUoH"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso4283007eec.1
        for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 20:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774062520; x=1774667320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/+aAzcKE9DLWpX+pM5zZXoXrAxmtKIn1qCJ1uOuKGc=;
        b=ad/pWUoH01YeCeVODcZ4OvFwUx56nnpcqcuBiZV36AWRcGotyFtTFt225ymoJwaVl/
         QmZ+QIVYnkFDvInJj09UNlxU5cJh/iU3X4dmoj4foorsmFzE2vPtS5gvN0lPsWx7Ihvd
         xHsRf0B8or0YdCbZEPt2iFpwVzAadD8U8EoVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774062520; x=1774667320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q/+aAzcKE9DLWpX+pM5zZXoXrAxmtKIn1qCJ1uOuKGc=;
        b=pGqR7D3HcwmEN8qBt1/jMecwSHiUJt/yBfDrNpHnr5fijD+SyGStP9kGpwSCAmFPmC
         imk/E4VlbWewLqEj7q1UPeAaYmkCkSCsHAL8MvDE9QCZhcOC2eajdEIYQno/HI2RTF5N
         oCyNVi3X6O53M1Y5hpoBbyzt1wABh14T2kB7Tz6ivxOX4LtIjfuyZ/gqHhPAZIpHhT6m
         TXZQ0eBwRxGItUUy8m0csfK1x+dyO/OAFdz1ytkxrVqRHxOEH42Y39wcYR9AkEEPfASs
         pl2R9hMabBwd4Log5dY0NQ9lvdlK8QvnOMDmMRhNeJ8gvDfiFcHPu8Baep8N4q3kFvDP
         d7tA==
X-Forwarded-Encrypted: i=1; AJvYcCVps7h/54fayNL32fKi2K0y82Vtj+8M8eyymVSx1PnQssx1bwbPXZb6Kw8OLteXdh4A6JKFQPTCHLQ6BA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYr8zoqRmSgHkOStFbgU0saIegGWQjH0cQrnTwFrrtHpJObQo0
	EhWE4/kFXccZgN5Dw0b+tG9ncy1XT9fis7iqYcTKgD+fXI/PX55VO06HbjUWE0g9cg==
X-Gm-Gg: ATEYQzwpH6LT5TzIaRykxphyaIjbDslSAgDrcdS3L3tvuPpm9fsFf3ULQEHHZYeJrYO
	3Kn0S1PGmsUaeCbPRxbpnbQwF+lAw7gebL/jnAFnG6TA7d9lRBjFGbvu6VyWP8Z6PrfiuXkhxKR
	PBkKlCzJ5xZUatliXpO6Lix7uAybup15dlc6zm2Z4OQZWsEIBFEgCBnEIwOkgoG+z0AGThdGPOA
	tVmIrKgUaDNf1de3O0l/hv3yoztScgD6YprG19Hs3aEvsrV4qIEco72YTDEYXer0goQ7jT1EN4d
	ZKBeGLWj1YkU3DCYRt1BaBiBLv86CJHb64WzxBx6A+QTJ0hKrWjhrXro4eIHGEva0xG8LK6lOLz
	gTvq7ziouMjSXhuOrcSKrtSdiUtrOhNHEuZr0YtfOQZrufUVoxOUec/CidN9K7ij+w+NLY+Z2xD
	IrxQriEih+OhlDUQuiGG8vIsKpPVrkVMjb97+ROtXnwvjZtzZcX8HQepEgyqSbaKmlF+LuX8zG2
	ikky74=
X-Received: by 2002:a05:7300:7496:b0:2be:e92:7f33 with SMTP id 5a478bee46e88-2c1097ecb50mr3430566eec.35.1774062519477;
        Fri, 20 Mar 2026 20:08:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5b58:b8db:c8fc:9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29d28csm7236852eec.19.2026.03.20.20.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 20:08:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Kay Sievers <kay.sievers@vrfy.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] driver core: Don't link the device to the bus until we're ready to probe
Date: Fri, 20 Mar 2026 20:06:58 -0700
Message-ID: <20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The moment we link a "struct device" into the list of devices for the
bus, it's possible probe can happen. This is because another thread
can load the driver at any time and that can cause the device to
probe. This has been seen in practice with a stack crawl that looks
like this [1]:

  really_probe()
  __driver_probe_device()
  driver_probe_device()
  __driver_attach()
  bus_for_each_dev()
  driver_attach()
  bus_add_driver()
  driver_register()
  __platform_driver_register()
  init_module() [some module]
  do_one_initcall()
  do_init_module()
  load_module()
  __arm64_sys_finit_module()
  invoke_syscall()

Practically speaking, in the case this happened
device_links_driver_bound() got called for the device before
"dev->fwnode->dev" was assigned. This prevented
__fw_devlink_pickup_dangling_consumers() from being called which meant
that other devices waiting on our driver's sub-nodes were stuck
deferring forever.

Fix the problem by adjusting where we link the device. Notably:
* Make sure we assign the dev->fwnode->dev before we link the device,
  since that needs to happen before a device probes.
* Make sure we link the device _before_ sending the UEVENT, as
  described in commit 2023c610dc54 ("Driver core: add new device to
  bus's list before probing").

[1] Captured on a machine running a downstream 6.6 kernel

Cc: stable@vger.kernel.org
Fixes: 2023c610dc54 ("Driver core: add new device to bus's list before probing")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This is a super tricky area of code, and I don't have a lot of
confidence that I got this exactly right. If you think I should do
something different, please yell!

Notably:
* I don't know 100% for sure what happens if probe runs at the same
  time as (or before) the call to `bus_notify(dev,
  BUS_NOTIFY_ADD_DEVICE)`. Presumably we're at least no worse off than
  we were before this patch.
* I haven't dug into whether there could be other types of race
  conditions with a driver trying to probe the device at the same time
  we call bus_probe_device().

I can try to dig into those things, but I also figured that people on
the mailing lists would know this code a whole lot better than I do.

Feel free to consider this RFC patch as a bug report and post a
totally different solution. I won't be offended! :-)

I have only done very minimal testing with this patch so far (the
system doesn't seem to blow up with this patch). I'm kicking off tests
for the weekend, but I figured I'd post this up in parallel.

 drivers/base/base.h |  1 +
 drivers/base/bus.c  | 16 ++++++++++++++--
 drivers/base/core.c | 24 ++++++++++++++++++------
 3 files changed, 33 insertions(+), 8 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 1af95ac68b77..d4933ba7b651 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -166,6 +166,7 @@ static inline void auxiliary_bus_init(void) { }
 struct kobject *virtual_device_parent(void);
 
 int bus_add_device(struct device *dev);
+void bus_link_device(struct device *dev);
 void bus_probe_device(struct device *dev);
 void bus_remove_device(struct device *dev);
 void bus_notify(struct device *dev, enum bus_notifier_event value);
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index bb61d8adbab1..573c22ebb5b7 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -510,7 +510,6 @@ EXPORT_SYMBOL_GPL(bus_for_each_drv);
  *
  * - Add device's bus attributes.
  * - Create links to device's bus.
- * - Add the device to its bus's list of devices.
  */
 int bus_add_device(struct device *dev)
 {
@@ -545,7 +544,6 @@ int bus_add_device(struct device *dev)
 	if (error)
 		goto out_subsys;
 
-	klist_add_tail(&dev->p->knode_bus, &sp->klist_devices);
 	return 0;
 
 out_subsys:
@@ -557,6 +555,20 @@ int bus_add_device(struct device *dev)
 	return error;
 }
 
+/**
+ * bus_link_device - Make a device findable in the list of devices
+ * @dev: device being linked
+ *
+ * - Add the device to its bus's list of devices.
+ */
+void bus_link_device(struct device *dev)
+{
+	struct subsys_private *sp = bus_to_subsys(dev->bus);
+
+	if (sp)
+		klist_add_tail(&dev->p->knode_bus, &sp->klist_devices);
+}
+
 /**
  * bus_probe_device - probe drivers for a new device
  * @dev: device to probe
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 791f9e444df8..6ff4725d677a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3663,12 +3663,6 @@ int device_add(struct device *dev)
 		devtmpfs_create_node(dev);
 	}
 
-	/* Notify clients of device addition.  This call must come
-	 * after dpm_sysfs_add() and before kobject_uevent().
-	 */
-	bus_notify(dev, BUS_NOTIFY_ADD_DEVICE);
-	kobject_uevent(&dev->kobj, KOBJ_ADD);
-
 	/*
 	 * Check if any of the other devices (consumers) have been waiting for
 	 * this device (supplier) to be added so that they can create a device
@@ -3680,12 +3674,30 @@ int device_add(struct device *dev)
 	 * But this also needs to happen before bus_probe_device() to make sure
 	 * waiting consumers can link to it before the driver is bound to the
 	 * device and the driver sync_state callback is called for this device.
+	 *
+	 * Because a bus may be probed the moment bus_link_device() is called,
+	 * this must happen before bus_link_device().
 	 */
 	if (dev->fwnode && !dev->fwnode->dev) {
 		dev->fwnode->dev = dev;
 		fw_devlink_link_device(dev);
 	}
 
+	/*
+	 * The moment we link the bus in, it's possible for another thread
+	 * (one registering a new driver) to notice it and start probing.
+	 * At the same time, we need to link the bus before the uevent is
+	 * sent announcing the device or user programs might try to access
+	 * the device before it has been added to the bus.
+	 */
+	bus_link_device(dev);
+
+	/* Notify clients of device addition.  This call must come
+	 * after dpm_sysfs_add() and before kobject_uevent().
+	 */
+	bus_notify(dev, BUS_NOTIFY_ADD_DEVICE);
+	kobject_uevent(&dev->kobj, KOBJ_ADD);
+
 	bus_probe_device(dev);
 
 	/*
-- 
2.53.0.959.g497ff81fa9-goog

