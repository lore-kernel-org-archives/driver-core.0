Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24171332909
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 02:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256106; cv=none; b=DaDd7aT5tL9F2Jr6O3gYY4Cjrl0lkfVMRzEyDqnIv3QQSRlYisum2+MGWUYDJM7oM3vG+/XuVeBmOEY9Ruzwz8Yzq7vPTJbGyCbQq9PZjiRQO+lTuzeKx5J1jkHUVWCR5OsFBuHRMcYn1xDG62PGgcu+6P85QIyM/omJGf8adRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256106; c=relaxed/simple;
	bh=lJv4IRI5XiZYUh3IyUwsclAolkzA5BnMYwS9GoPeusU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aCJ31rx4PAs5I+jKlguJ6e0nbeBpMUnlPCeCGk2/qB2GedlQ0F6JxupaVQ6gxy8cIH0ppnX8d9SioYHotq8h2L/3MQ93zkL2+AKFwOgxOtlK+qPth0duEKDJMKSkYQ5qX+7VRxV4nK4d8bKNuaL5AP68HJ/33+TIs5c8C9oqNa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VjRxIK9R; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VjRxIK9R"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-69c6057f3a3so6654369a12.3
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 19:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784256102; x=1784860902; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u7CTWM7sdjLtp6WbHOEsIPC/O4fOD6uj/vimbKs1R/U=;
        b=VjRxIK9RmMK7TDLOQprj92yaBrhC4vAmPd2QnCGcsu63WYhsw55s60iKgYox5nItgy
         tRLC7xK1RA9JWqlZAC1whRkajqag6S6YqGVAzocJc+WrxcQuYbeuqVcNeoAewU2LdDgq
         6giT7VRECnRoU+6mUhr65qwXdvz2NtIys6Kp/b0GwFIAt1pyEaNaODk+4xxRooP/dQC1
         6L0WH4mtaeaasj7uXsrwJjJmrjGyNAvpLlM10hLsEGq4j42qjFlue+mWQn/iDaXYVovf
         /x819Np5dfWgkSkRXUv4pDueF+58dMeyq/MctfhHeEAvy8ZkPChZay6QAibbMFaF0V4i
         dWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256102; x=1784860902;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7CTWM7sdjLtp6WbHOEsIPC/O4fOD6uj/vimbKs1R/U=;
        b=rz/m4UyLRF+FbGjWOVvccu32sT998bSIoo7XV7TLRElgb2dAiUYH7zULfPMGffXQNE
         VbbECt0CCYkVh2B0n5SyTb44VR5mSfrJJmBI2lAMn6u3+nYzXea197mnkqi2E7g/GDHs
         x8kTdDl5KgHfqdbTxt7jti5Ubwy4vfFBxB0IXJNiUgyiQ1ev79VV5DyBi7wO8RPOukYw
         lKh9pgdwEEgfDIhFnWTXeyeifge4EjJLv+c+SpcPw+7vCX6CjwMQOOJTLapwHomVdl6j
         L1X820pV88zUjcdc+s5ObSacjPHtja8xJRzzPlnaQ2ImQBoK9MbsTz/tq5DJ1B8DLeW0
         I5zA==
X-Forwarded-Encrypted: i=1; AHgh+RoVxMbDMK+v7ceHCBGcchHItVGzoJxs+BL0stzxQjwJ4SzY6P4XXUGJYtuiAsgOnFinNC9ouOru0so86w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLthTdhqCyLoQOx5sq7v3rlLm77DXfU91+tDW3MsW565osewb1
	GjK1DYdUonFKyO4WF07bAKF/NHmGQM6iXdbddqv8KUGMy9y+wY/4rnz/J5wQauVpm3si+o+gfWX
	v5MqVUdOapt6JU9uxQQ==
X-Received: from edyn5.prod.google.com ([2002:a05:6402:6c5:b0:69c:7a06:8c86])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5288:b0:69a:f82:ccdc with SMTP id 4fb4d7f45d1cf-69e652ed727mr118048a12.19.1784256101944;
 Thu, 16 Jul 2026 19:41:41 -0700 (PDT)
Date: Thu, 16 Jul 2026 23:04:04 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716230411.2767394-1-tarunsahu@google.com>
Subject: [PATCH v19 0/7] shut down devices asynchronously
From: Tarun Sahu <tarunsahu@google.com>
To: Shuah Khan <skhan@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: bvanassche@acm.org, john.g.garry@oracle.com, mlombard@redhat.com, 
	loberman@redhat.com, mclapinski@google.com, dmatlack@google.com, 
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, jordanrichards@google.com, souravsgl@google.com, 
	stuart.w.hayes@gmail.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, emilne@redhat.com, jmeneghi@redhat.com, 
	linux-scsi@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

This is rebased on top of device-core/driver-core-next. And can also
be applied easily against linux-next/master

This patchset allows the kernel to shutdown devices asynchronously and
unrelated async devices to be shut down in parallel to each other.

Only devices which explicitly enable it are shut down asynchronously. The
default is for a device to be shut down from the synchronous shutdown loop.

This can dramatically reduce system shutdown/reboot time on systems that
have multiple devices that take many seconds to shut down (like certain
NVMe drives). On one system tested, the shutdown time went from 11 minutes
without this patch to 55 seconds with the patch. And on another system from
80 seconds to 11.

And thank you to everyone who has spent some of their valuable time
providing reviews, suggestions, criticisms, or tests on the various
iterations of this patchset.

Changes from V18:
- Fix deadlock and race condition on concurrent device_add
- Use local variable to device_shutdown for caching async_shutdown
- Added dev->p check to avoid NULL pointer deference and tell if the
  device is not registered so no need to be shutdown. This is to handle
  the cases when devices consumers list might have devices that are not
  yet registered.

Changes from V17:

Fix mangled text in kernel parameter description
Re-protect the list removal with the spinlock
  * Hold a device reference to ensure the device cannot be freed before
    attempting list removal

Changes from V16:

Drop spinlock before async subsystem call which uses GFP_KERNEL
Handle that async shutdown can widen races between device shutdown and deletion
  * __shutdown_one_device will immediately return if a device is dead
  * Set shutdown device completion to complete when marking a device dead to
      prevent waiting on a dead device
  * Only late-access a parent pointer if device is in a non-dead state to
      ensure the pointer is still valid

Changes from V15:

The async_shutdown bit field is converted to a device flags bit
Convert all patches to use the flag bit accessor macros to set or check if
  async shutdown should be used
Added documentation on the kernel parameter to control use of async shutdown

Changes from V14:

Remove unneeded use of '!!' with boolean type

Changes from V13:

Remove duplicate flagging of async shutdown on scsi hosts/targets/devices

Changes from V12:

Only acquire a parent reference if acquiring the parent's lock
device_enable_async_shutdown should return void
Minor comment and description cleanups

Changes from V11:

  * Swap the order of the first two patches
  * Rework conditional parent locking so that lock and unlock no longer use
    separate conditional checks
  * Remove an used variable
  * Comment and description text cleanups

Changes from V10:

Reworked to more closely match the design used for async suspend
  * No longer uses async subsystem cookies for synchronization
  * Minimized changes to struct device
  * Enable async shutdown for pci and scsi devices which support async suspend

Changes from V9:

Address resource and timing issues when spawning a unique async thread
for every device during shutdown:
  * Make the asynchronous threads able to shut down multiple devices,
    instead of spawning a unique thread for every device.
  * Modify core kernel async code with a custom wake function so it
    doesn't wake up a thread waiting to synchronize on a cookie until
    the cookie has reached the desired value, instead of waking up
    every waiting thread to check the cookie every time an async thread
    ends.

Changes from V8:

Deal with shutdown hangs resulting when a parent/supplier device is
  later in the devices_kset list than its children/consumers:
  * Ignore sync_state_only devlinks for shutdown dependencies
  * Ignore shutdown_after for devices that don't want async shutdown
  * Add a sanity check to revert to sync shutdown for any device that
    would otherwise wait for a child/consumer shutdown that hasn't
    already been scheduled

Changes from V7:

Do not expose driver async_shutdown_enable in sysfs.
Wrapped a long line.

Changes from V6:

Removed a sysfs attribute that allowed the async device shutdown to be
"on" (with driver opt-out), "safe" (driver opt-in), or "off"... what was
previously "safe" is now the only behavior, so drivers now only need to
have the option to enable or disable async shutdown.

Changes from V5:

Separated into multiple patches to make review easier.
Reworked some code to make it more readable
Made devices wait for consumers to shut down, not just children
  (suggested by David Jeffery)

Changes from V4:

Change code to use cookies for synchronization rather than async domains
Allow async shutdown to be disabled via sysfs, and allow driver opt-in or
  opt-out of async shutdown (when not disabled), with ability to control
  driver opt-in/opt-out via sysfs

Changes from V3:

Bug fix (used "parent" not "dev->parent" in device_shutdown)

Changes from V2:

Removed recursive functions to schedule children to be shutdown before
  parents, since existing device_shutdown loop will already do this

Changes from V1:

Rewritten using kernel async code (suggested by Lukas Wunner)

David Jeffery (5):
  driver core: separate function to shutdown one device
  driver core: do not always lock parent in shutdown
  driver core: async device shutdown infrastructure
  PCI: Enable async shutdown support
  scsi: Enable async shutdown support

Tarun Sahu (2):
  device_core: rely on put_device to free dev->p
  driver core: Prevent device_add() during system shutdown

 .../admin-guide/kernel-parameters.txt         |  10 +
 drivers/base/base.h                           |   2 +
 drivers/base/core.c                           | 265 +++++++++++++++---
 drivers/pci/probe.c                           |   2 +
 drivers/scsi/hosts.c                          |   2 +
 drivers/scsi/scsi_sysfs.c                     |   3 +
 include/linux/device.h                        |   2 +
 7 files changed, 248 insertions(+), 38 deletions(-)

-- 
2.55.0.229.g6434b31f56-goog

