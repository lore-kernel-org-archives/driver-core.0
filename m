Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276E83A6B99
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880984; cv=none; b=DSB/DeejRYZOoYcYzEaKNmBkHlK14hWzdntDy+SFliqvDzOvnNABOD8rDCfxguuFEzhPswm9M6YOMysqf+uEIkSMUwB0NgNIwjN5KNilmypLQsp+E18jKRx5+gDGQtL5+xlFdB1unBD8s8ceN9SmsAODmJaZ9SYpeK30tVRth4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880984; c=relaxed/simple;
	bh=8LQZSocESOF3veZ/bfrXbhh0O+so24+/tbM7fVlpCr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oD4td+4HtaGqiFoCu+t59Xfov/JZR+S0+wgXP79b/Zfxy33jLs7HeQ2BLUOcKuiIVD9accElyfRBWS3XGXWT4q7p2QrIROuE/RZlFMj26ppoIaYBcc9xsW0UvX4qCX/zq72QY6DAemZ9onsEkY7MoQXbMKlzTwhq/a95aqHBAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V5COCXBm; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V5COCXBm"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1273349c56bso5485283c88.0
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774880980; x=1775485780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ACJ6Cr/IS11gucQGUIuPydXkCtkwKZa4TuMCqVkix8k=;
        b=V5COCXBmbFyZ9du1lJIalKISUIlraSiCMVOJ936xDdzj/mb8pO1tZ9WPf49tDRHZYM
         YBbYJrPXVmRugm89ouGXSiVhCuueb+5cueeZQZvaErQEA861c8YdfAQvoa8fDo8k5+19
         oJT3fjDK544hJX/GerDAZrP2a/NzC4QMbyG9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880980; x=1775485780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACJ6Cr/IS11gucQGUIuPydXkCtkwKZa4TuMCqVkix8k=;
        b=hhUjIBVBo4/gaA6q3hcS2OshRJi0wauJqibaqkJ74kmA09KPYdwvy2c4WthMG8lnVN
         5v4JSMQOUYNvLyTXZPan9MBY2kkPV1hVKl5ZXQVuW1BVQvfl7DObMkoBgq38VKUVkagF
         t7sjvdAUThepnSDDXjyER54KzV7e6G9AOTfFhPfJ5Kaa36lmBst4XswB/1BBXdEvEgN7
         DcbW9wdqPkaASRhj059v2GNbsY6z28pryTExxqlzlWAi4aOq6DIdj8i+hkzIr2NjzHCW
         lKbeaidVDnomtVFvlVnU3nDrgFclNyFQ3XCKV2Y9jTLfZGPvkFA0GT5JXyeLZyNx3H/l
         FLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWysiQ6Tr/lX5Lv8gQOpnQ7zozbv3SO9FUXw7lumcbVs3t9HwkQ1uJuctmRuTBqMjRgryEWioQkHJ4JBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVxyjK7hrzrvOw+1UrN/Y6t3rOByZN2TP9y7g4c9L4lGv7Iiq8
	aNGc6D1z4pIJ1Yg2jxxfBtRM5AxBciIZ4PZZEUp8ogliOrDbQbmY4pDvuXOMJuiUFg==
X-Gm-Gg: ATEYQzw0qSe9U6Ysi0/tRVy/V2KTR+OHqu/J9J/z516bkomAwvXBQnUawy2R9T+Abes
	C939m5lWYQtm1unHUfa9P8jjp5/UJ6bxBynP8e1pvyOrz4oDujRwBeotvS4Z97DF64YVYgJs3Uc
	GgXGeOzYvDbJdD93ec8B5PRpikyuy3BXc13FcdIOL2kGbD64umcFzD+zOobKjjpWYIaK8yZa78E
	4vIWSfwyr88unQJGSK7BYfmui/4G1PzW76W1UT/EEZWR56MTPKp3SXyEKC7KvMFFljM+J+hSGsd
	4kNHDhVWnM2YzjOx0xL32Mnjf2/YvUzXcCgWyDcdzX/gAb99YXwpaNbZw/IWQfnt5hy5wBjVCpq
	XsZWWrLLUgADR638kAVY0aqRyqUYCk+8MzV9B13dScwqzMPf5mg/xlhlstpKGBTc+GQKTGhCJWd
	Jvk07/naYDFcTJHDhvWrNfd62ME+lqLWeOD/0ussl9jMxrZ3GMLvqFJptFRmn1K5ni6Lkn+7MxB
	nNM5OiMDxQ=
X-Received: by 2002:a05:7022:628c:b0:128:d471:8c1 with SMTP id a92af1059eb24-12ab2890739mr6624565c88.17.1774880980067;
        Mon, 30 Mar 2026 07:29:40 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:f4ab:830d:18d1:e45b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aba581027sm10665132c88.4.2026.03.30.07.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 07:29:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] driver core: Don't let a device probe until it's ready
Date: Mon, 30 Mar 2026 07:28:41 -0700
Message-ID: <20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
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

As a result of the above, it was seen that device_links_driver_bound()
could be called for the device before "dev->fwnode->dev" was
assigned. This prevented __fw_devlink_pickup_dangling_consumers() from
being called which meant that other devices waiting on our driver's
sub-nodes were stuck deferring forever.

It's believed that this problem is showing up suddenly for two
reasons:
1. Android has recently (last ~1 year) implemented an optimization to
   the order it loads modules [2]. When devices opt-in to this faster
   loading, modules are loaded one-after-the-other very quickly. This
   is unlike how other distributions do it. The reproduction of this
   problem has only been seen on devices that opt-in to Android's
   "parallel module loading".
2. Android devices typically opt-in to fw_devlink, and the most
   noticeable issue is the NULL "dev->fwnode->dev" in
   device_links_driver_bound(). fw_devlink is somewhat new code and
   also not in use by all Linux devices.

Even though the specific symptom where "dev->fwnode->dev" wasn't
assigned could be fixed by moving that assignment higher in
device_add(), other parts of device_add() (like the call to
device_pm_add()) are also important to run before probe. Only moving
the "dev->fwnode->dev" assignment would likely fix the current
symptoms but lead to difficult-to-debug problems in the future.

Fix the problem by preventing probe until device_add() has run far
enough that the device is ready to probe. If somehow we end up trying
to probe before we're allowed, __driver_probe_device() will return
-EPROBE_DEFER which will make certain the device is noticed.

In the race condition that was seen with Android's faster module
loading, we will temporarily add the device to the deferred list and
then take it off immediately when device_add() probes the device.

[1] Captured on a machine running a downstream 6.6 kernel
[2] https://cs.android.com/android/platform/superproject/main/+/main:system/core/libmodprobe/libmodprobe.cpp?q=LoadModulesParallel

Cc: stable@vger.kernel.org
Fixes: 2023c610dc54 ("Driver core: add new device to bus's list before probing")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
v1: https://lore.kernel.org/r/20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid

This v2 feels like a very safe change. It doesn't change the ordering
of any steps of probe and it _just_ prevents the early probe from
happening.

I ran tests where I turned the printout "Device not ready_to_probe" on
and I could see the printout happening, evidence of the race occurring
from other printouts, and things successfully being resolved.

Changes in v2:
- Instead of adjusting the ordering, use "ready_to_probe" flag

 drivers/base/core.c    | 15 +++++++++++++++
 drivers/base/dd.c      | 12 ++++++++++++
 include/linux/device.h |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 09b98f02f559..4caa3fd1ecdb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3688,6 +3688,21 @@ int device_add(struct device *dev)
 		fw_devlink_link_device(dev);
 	}
 
+	/*
+	 * The moment the device was linked into the bus's "klist_devices" in
+	 * bus_add_device() then it's possible that probe could have been
+	 * attempted in a different thread via userspace loading a driver
+	 * matching the device. "ready_to_probe" being false would have blocked
+	 * those attempts. Now that all of the above initialization has
+	 * happened, unblock probe. If probe happens through another thread
+	 * after this point but before bus_probe_device() runs then it's fine.
+	 * bus_probe_device() -> device_initial_probe() -> __device_attach()
+	 * will notice (under device_lock) that the device is already bound.
+	 */
+	device_lock(dev);
+	dev->ready_to_probe = true;
+	device_unlock(dev);
+
 	bus_probe_device(dev);
 
 	/*
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 37c7e54e0e4c..a1762254828f 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -848,6 +848,18 @@ static int __driver_probe_device(const struct device_driver *drv, struct device
 	if (dev->driver)
 		return -EBUSY;
 
+	/*
+	 * In device_add(), the "struct device" gets linked into the subsystem's
+	 * list of devices and broadcast to userspace (via uevent) before we're
+	 * quite ready to probe. Those open pathways to driver probe before
+	 * we've finished enough of device_add() to reliably support probe.
+	 * Detect this and tell other pathways to try again later. device_add()
+	 * itself will also try to probe immediately after setting
+	 * "ready_to_probe".
+	 */
+	if (!dev->ready_to_probe)
+		return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready_to_probe");
+
 	dev->can_match = true;
 	dev_dbg(dev, "bus: '%s': %s: matched device with driver %s\n",
 		drv->bus->name, __func__, drv->name);
diff --git a/include/linux/device.h b/include/linux/device.h
index e65d564f01cd..e2f83384b627 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -553,6 +553,8 @@ struct device_physical_location {
  * @dma_skip_sync: DMA sync operations can be skipped for coherent buffers.
  * @dma_iommu: Device is using default IOMMU implementation for DMA and
  *		doesn't rely on dma_ops structure.
+ * @ready_to_probe: If set to %true then device_add() has finished enough
+ *		initialization that probe could be called.
  *
  * At the lowest level, every device in a Linux system is represented by an
  * instance of struct device. The device structure contains the information
@@ -675,6 +677,7 @@ struct device {
 #ifdef CONFIG_IOMMU_DMA
 	bool			dma_iommu:1;
 #endif
+	bool			ready_to_probe:1;
 };
 
 /**
-- 
2.53.0.1018.g2bb0e51243-goog

