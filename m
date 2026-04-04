Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5822427713
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 00:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261245; cv=none; b=i9kHj00yIjZdCch2TSpR63gy2a7alG6bxa167IwSYC8bDsApusDbV/h1rLku6KYO3jaLEu5NelWdYf2tEnLQi6nFj/zztzmWmrltioEzt0zo+CEYVax4Cecmr387+Vbu2CTjgTSOTetGaVB2QgT8LlGw2r+QvWd2PoDXXjhhFwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261245; c=relaxed/simple;
	bh=III6jfoTjxrvqqvxvqPImVr6gqYLV5UXkESYuPeEMdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QX7QychQhUaLTgEgvoEBeMgSFfDBY/NKjFCCsXfTnzZ7roWmQQry7sFmLhUb+pB+VKpTRMER4f9wR2zHwBOB9beJOKcfo5vdzyxcfZd2/VmKm2nYU83H9pnKT5ODTgB1FBu+MkDxBst3+lXF7X29M0l8DwKbhAZBNODAoOPWvVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OqYqz2a6; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OqYqz2a6"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c4db6bca03so1216147eec.1
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 17:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775261242; x=1775866042; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJEW8I+GJiIRTdX3t2bIsrL+T4N6bIAtJLVhOniwR48=;
        b=OqYqz2a6KaNHUsPNdGx/MbWa1E+QDVJMiA5hRM71sw9VxE08rEtIqp/blB3dh80RRw
         Sv+PjO9Rm74BU3cj5YDtZfz8T1/NVFCSAE+l96QBEttIQYOoPbJ6mAPCDiNm6dy8Y1k1
         MlrrKSWLZLwe/MtI0sc4R6gUzkGEoymPz6kwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261242; x=1775866042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJEW8I+GJiIRTdX3t2bIsrL+T4N6bIAtJLVhOniwR48=;
        b=r68/pzZvuvaLdU39eGetmnSX4fSwOBofHvn7HspFgjWmgqxnMGzoAKHjhayoXr2KDz
         41a43eFE2BVaPhKszpI9s6ugDe/IHTbWk+7hwJTKFHWtaMX+sZBvWAznxU8VIKaVrfYG
         cQi68T+tPxLR05J6ZOJ6mhR2F8X7Rvsvd5P5nYsQa5w++HnuWv6fX0cj4QGg0GruSz9c
         AejIHMBKVveLsdanpb7w0+D6HfzZDTx0MaE95wxE7cqvOG7CE7rfLs2QTJpciPHCM36j
         WZ1mce5Q0D1Dy3SmgI7eBRrdrNMm8ui2ca2CrEghh0sEpNMViqrSwcZdOP1S3GJVKEJY
         Xm4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVDhJBcEvMzQ5QxjUgucIO5DS5FyZJzBAwRbXUAjpHBEpAn3nBl5z3CuuV9m672IM8w59pbE4/g/n6HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGaHqM+naJli5D0vUXyMxaxqua3iwtkp6xmZNOFTFjRF8S8FCl
	kz20Jejhk+nYRKG/owTxLO7x2pLl/hkPkP30HjUgG+wl+2H22Ukx0eff1YzgiYP8EA==
X-Gm-Gg: AeBDietqDOZ2PDqKHNKQ3YouTR5WgRG5ZtMmgn6L/pNDTVjZVcs9HUrAiOrffayUv1L
	dZVl+Zra/ejYwdEPlvycDfS0Q3olW70G8t+2rOLFJZZ9sxEOf+15Add716Qvxe4abLsHtYd1T4s
	hMUNW3HYelHsh02OWs+RLattdTaMfkNLQ2hOF/FktF23G6WQOELXLqJ47iP0qndtM7cSpnaM1V2
	m7ILHDufGdbeWiHQDDzCLvZAzjs+IxgafL7vZHv8csPVeKn3a4ZClllGlITU1x0rY0AzRzYYMuL
	v6GZZLk864RuvZTMqPHu/XBDS8qU0JLOLvWzERwwjiWS6+6E91wPNjNwpfv3YMjBfAZx6OYuXKB
	llRYQjLx9Fn9RNZ8waFAW/7SJ5IlIBy4nDqe4hGbEz/7tkny3Z1yql95V0HO5w5kiMT7/E9DnQP
	FQk15FM/Js/6IZR3zqXDUz6mBir4JQDu3uKf2w69a/iEt8xe/BMkG7DBBQI0Ailae++KK2fpmed
	lnzre7l6bY=
X-Received: by 2002:a05:7301:1f01:b0:2c5:704f:7142 with SMTP id 5a478bee46e88-2cbf920f3c9mr1937248eec.2.1775261242319;
        Fri, 03 Apr 2026 17:07:22 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:a8b6:55b2:3eb6:2c0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d93bsm6520716eec.12.2026.04.03.17.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:07:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Eric Dumazet <edumazet@google.com>,
	Johan Hovold <johan@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Robin Murphy <robin.murphy@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	stable@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/9] driver core: Don't let a device probe until it's ready
Date: Fri,  3 Apr 2026 17:04:55 -0700
Message-ID: <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260404000644.522677-1-dianders@chromium.org>
References: <20260404000644.522677-1-dianders@chromium.org>
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

Instead of adding another flag to the bitfields already in "struct
device", instead add a new "flags" field and use that. This allows us
to freely change the bit from different thread without holding the
device lock and without worrying about corrupting nearby bits.

[1] Captured on a machine running a downstream 6.6 kernel
[2] https://cs.android.com/android/platform/superproject/main/+/main:system/core/libmodprobe/libmodprobe.cpp?q=LoadModulesParallel

Cc: stable@vger.kernel.org
Fixes: 2023c610dc54 ("Driver core: add new device to bus's list before probing")
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
v1: https://lore.kernel.org/r/20260320200656.RFC.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid
v2: https://lore.kernel.org/r/20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid
v3: https://lore.kernel.org/r/20260403005005.30424-1-dianders@chromium.org/

As of v2 this feels like a very safe change. It doesn't change the
ordering of any steps of probe and it _just_ prevents the early probe
from happening.

I ran tests where I turned the printout "Device not ready_to_probe" on
and I could see the printout happening, evidence of the race occurring
from other printouts, and things successfully being resolved.

I kept Alan and Rafael's Reviewed-by tags in v3 even though I changed
the implementation to use "flags" as per Danilo's request. This didn't
seem like a major enough change to remove tags, but please shout if
you'd like your tag removed.

Changes in v4:
- Use accessor functions for flags

Changes in v3:
- Use a new "flags" bitfield
- Add missing \n in probe error message

Changes in v2:
- Instead of adjusting the ordering, use "ready_to_probe" flag

 drivers/base/core.c    | 13 +++++++++++++
 drivers/base/dd.c      | 12 ++++++++++++
 include/linux/device.h | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 09b98f02f559..f07745659de3 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3688,6 +3688,19 @@ int device_add(struct device *dev)
 		fw_devlink_link_device(dev);
 	}
 
+	/*
+	 * The moment the device was linked into the bus's "klist_devices" in
+	 * bus_add_device() then it's possible that probe could have been
+	 * attempted in a different thread via userspace loading a driver
+	 * matching the device. "ready_to_prove" being unset would have
+	 * blocked those attempts. Now that all of the above initialization has
+	 * happened, unblock probe. If probe happens through another thread
+	 * after this point but before bus_probe_device() runs then it's fine.
+	 * bus_probe_device() -> device_initial_probe() -> __device_attach()
+	 * will notice (under device_lock) that the device is already bound.
+	 */
+	dev_set_ready_to_probe(dev);
+
 	bus_probe_device(dev);
 
 	/*
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 37c7e54e0e4c..8ec93128ea98 100644
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
+	if (!dev_ready_to_probe(dev))
+		return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready to probe\n");
+
 	dev->can_match = true;
 	dev_dbg(dev, "bus: '%s': %s: matched device with driver %s\n",
 		drv->bus->name, __func__, drv->name);
diff --git a/include/linux/device.h b/include/linux/device.h
index e65d564f01cd..5eb0b22958e4 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -458,6 +458,21 @@ struct device_physical_location {
 	bool lid;
 };
 
+/**
+ * enum struct_device_flags - Flags in struct device
+ *
+ * Each flag should have a set of accessor functions created via
+ * __create_dev_flag_accessors() for each access.
+ *
+ * @DEV_FLAG_READY_TO_PROBE: If set then device_add() has finished enough
+ *		initialization that probe could be called.
+ */
+enum struct_device_flags {
+	DEV_FLAG_READY_TO_PROBE = 0,
+
+	DEV_FLAG_COUNT
+};
+
 /**
  * struct device - The basic device structure
  * @parent:	The device's "parent" device, the device to which it is attached.
@@ -553,6 +568,7 @@ struct device_physical_location {
  * @dma_skip_sync: DMA sync operations can be skipped for coherent buffers.
  * @dma_iommu: Device is using default IOMMU implementation for DMA and
  *		doesn't rely on dma_ops structure.
+ * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
  * instance of struct device. The device structure contains the information
@@ -675,8 +691,34 @@ struct device {
 #ifdef CONFIG_IOMMU_DMA
 	bool			dma_iommu:1;
 #endif
+
+	DECLARE_BITMAP(flags, DEV_FLAG_COUNT);
 };
 
+#define __create_dev_flag_accessors(accessor_name, flag_name) \
+static inline bool dev_##accessor_name(const struct device *dev) \
+{ \
+	return test_bit(flag_name, dev->flags); \
+} \
+static inline void dev_set_##accessor_name(struct device *dev) \
+{ \
+	set_bit(flag_name, dev->flags); \
+} \
+static inline void dev_clear_##accessor_name(struct device *dev) \
+{ \
+	clear_bit(flag_name, dev->flags); \
+} \
+static inline void dev_assign_##accessor_name(struct device *dev, bool value) \
+{ \
+	assign_bit(flag_name, dev->flags, value); \
+} \
+static inline bool dev_test_and_set_##accessor_name(struct device *dev) \
+{ \
+	return test_and_set_bit(flag_name, dev->flags); \
+}
+
+__create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);
+
 /**
  * struct device_link - Device link representation.
  * @supplier: The device on the supplier end of the link.
-- 
2.53.0.1213.gd9a14994de-goog

