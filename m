Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBB3332909
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 02:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256108; cv=none; b=TDwAYiR/SkXApQCkcdU1dCRQZt1unVq/euXoftNlVepNtB4L7mN6wB9IzqL44z1gdOuLZJXtUh8MSBvVjpv2ppJ/F6akzl3oCLfZ3VS/SlaTAbpuQQeQUGc8xBJc4EmBr6tzLIlmSZzi7og3mrJfLyUCrskppHBk9k4FK/zXNz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256108; c=relaxed/simple;
	bh=MaTtIurVU/bnO1ZT5CRFSCEj/7sWYmboGDsIvXo0XIE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QlfPjKjHegH5x1Nk07vnZ9F/326nGJa38eqPDRXFziHfRILyzV0GXVKnYKILkWJhJavotMsGc1Ow2Kpi7g/AcsVXTWrx6+hK+roDz7Y2ueOWCnybIuoO/xac8HswwQ0cryX7tA3GK+CfejwDY1q0B0RVpYLf1gUQA2mGiHV1l2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Heok+nw0; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Heok+nw0"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c15fc5a1b7eso457044766b.1
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 19:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784256104; x=1784860904; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxDFoRfGjuVIhbnGliVFSK9UCSyMCMGPz0ptJpXcFDo=;
        b=Heok+nw0nHKX3kwDUu5M3ya/ToF7AZavK43XFQu3/ZVMGFq2/LAxpzC28duwy2FeRy
         1vxrU556c/cQtosC25DKp07NDertCdrSScoXzFXXHDI3QSGFQwF3RmjuxvJLZALbpv4Q
         6K+nkjwYYdwnR0Lq/feLNBecBFmvimuyzZPjtYTX4P7L/mnKYCwDQNmr30f8LpEjr2s8
         w+l4mWedOchR0OBmKWEYDvq1RLOeSg/ad7rp+WuaHRYp66GYCAIvN2M7Z5TvvMHv5nP4
         H6psAMhznRJGV35vrUtyDl66Pt9uAkuWTNyk30BBraPkfQZ5fxQwqa3NEUqtQoSyQanf
         zNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256104; x=1784860904;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxDFoRfGjuVIhbnGliVFSK9UCSyMCMGPz0ptJpXcFDo=;
        b=hmrTrgPoaQGCAhpn2eiFx8eL/EZC5dUmr8zdYOYYRh0ifGUYf+3at1OppaBEd5e8Wj
         Z7TZa6qMzq1b7xWxtsqBEWgya7t9kJ4IV7wngu7t6OHuKpdCAm6Z+6H2nRULH+V1nnVZ
         2tZIySf0QhH3foPq/JUaI0tLCIuuywHOiTOADNVxJ+J1G+U/oxyTKqxs+nnFa3kqMtRs
         3buWD/1oFzDsDPuUziwkMveX6nL5fylXLHxR3/RR1NzqXIOSe7tPod77lGmH7C+DZvNs
         IP7yikuJgvRmcDphDKCZVymd8qJ1o9/ylIAv5bLSL+T9YJi/zoCY+Cp7HEPmyX1oNK6s
         S8wg==
X-Forwarded-Encrypted: i=1; AHgh+RqVPaFeqBATgfQS2uhp1AbPIa/JddY9DxiWabe2CcJO8ZJfvBZgjLPm4zwsHCftcLxEM4/8ZgCdH1cKLA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa4vON7k+IsfsT4cQllswIoUHWMTYGokMW+V9llxB3HnjSlTte
	a7no3qixpXE3iEn4FPyIezAScx/mQpzOxS8n1fQRB/GRvtHF+3rw9XUMi88rOx+1+XMmoHcVXUo
	oPHKs7sVwupQhxSfGMA==
X-Received: from ejcev5.prod.google.com ([2002:a17:907:29c5:b0:c16:a4bc:757f])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c146:b0:c16:6dac:a015 with SMTP id a640c23a62f3a-c16b46f14b4mr17436966b.29.1784256104296;
 Thu, 16 Jul 2026 19:41:44 -0700 (PDT)
Date: Thu, 16 Jul 2026 23:04:06 +0000
In-Reply-To: <20260716230411.2767394-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260716230411.2767394-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716230411.2767394-3-tarunsahu@google.com>
Subject: [PATCH v19 2/7] driver core: Prevent device_add() during system shutdown
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
	linux-scsi@vger.kernel.org, Tarun Sahu <tarunsahu@google.com>, 
	David Jeffery <djeffery@redhat.com>
Content-Type: text/plain; charset="UTF-8"

In Async device shutdown, device_kset->list lock is released to handle
asynchronisation and hold again to get entry from device_kset->list.
Which will leave window when device_add can try to add the device to
device_kset list and temper with ongoing shutdown process. New added
device can be async type or sync type and might also introduce new
dependency which can cause device_shutdown path to deadlock. S is
waiting C to finish but C is never scheduled as it was added recently
from device_add path. And C can only be scheduled when main loops
continue to reach to C which is waiting on S.

So, When a system enters shutdown (SYSTEM_HALT, SYSTEM_POWER_OFF, or
SYSTEM_RESTART), new devices should not be allowed to be added.
Adding system_state check (system_is_shutting_down()) to avoid
device_add incase of these states of the system.

While device_add() performs an initial check of system_is_shutting_down(),
a race window exists between this initial check and kobject_add(),
during which device_shutdown() may already be scanning devices_kset->list.
If device_shutdown() passes the device after kobject_add() registers it
onto devices_kset->list, device_add() would otherwise complete device
initialization and driver matching, leaving an active device running
after system shutdown finishes.

Fix this TOCTOU race by re-checking system_is_shutting_down() under
devices_kset->list_lock right after kobject_add().

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Signed-off-by: David Jeffery <djeffery@redhat.com>
---
 drivers/base/core.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 76ba02c26aa5..78b90326addb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -47,6 +47,22 @@ static bool fw_devlink_drv_reg_done;
 static bool fw_devlink_best_effort;
 static struct workqueue_struct *device_link_wq;
 
+/**
+ * system_is_shutting_down - Check if system state is not active.
+ *
+ * When system state is not active and in shutdown state, new devices
+ * should not be allowed to be added.
+ *
+ * If system_state is SYSTEM_HALT || SYSTEM_POWER_OFF || SYSTEM_RESTART
+ * this function will return true.
+ */
+static inline bool system_is_shutting_down(void)
+{
+	return system_state == SYSTEM_HALT ||
+	       system_state == SYSTEM_POWER_OFF ||
+	       system_state == SYSTEM_RESTART;
+}
+
 /**
  * __fwnode_link_add - Create a link between two fwnode_handles.
  * @con: Consumer end of the link.
@@ -3650,6 +3666,11 @@ int device_add(struct device *dev)
 	if (!dev)
 		goto done;
 
+	if (unlikely(system_is_shutting_down())) {
+		error = -ESHUTDOWN;
+		goto done;
+	}
+
 	if (!dev->p) {
 		error = device_private_init(dev);
 		if (error)
@@ -3699,6 +3720,18 @@ int device_add(struct device *dev)
 		goto Error;
 	}
 
+	/*
+	 * Check system_state again under list_lock to prevent a TOCTOU race
+	 * where device_shutdown() runs concurrently and misses this device.
+	 */
+	spin_lock(&devices_kset->list_lock);
+	if (unlikely(system_is_shutting_down())) {
+		spin_unlock(&devices_kset->list_lock);
+		error = -ESHUTDOWN;
+		goto ShutdownError;
+	}
+	spin_unlock(&devices_kset->list_lock);
+
 	/* notify platform of device entry */
 	device_platform_notify(dev);
 
@@ -3818,6 +3851,7 @@ int device_add(struct device *dev)
  attrError:
 	device_platform_notify_remove(dev);
 	kobject_uevent(&dev->kobj, KOBJ_REMOVE);
+ ShutdownError:
 	glue_dir = get_glue_dir(dev);
 	kobject_del(&dev->kobj);
  Error:
-- 
2.55.0.229.g6434b31f56-goog

