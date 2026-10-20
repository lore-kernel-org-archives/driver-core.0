Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514696;
	b=nPZa6Cg/2wFHU55EG39Nd8yZoG1Cs7TNyAiBbWd4iM/OS2PlATjzpY3dQ7pB16CDi5Th
	 cJPxxe/6BiMB7eU/SMgVGAAUpIJysdQoPA6L6hKyZEqbQ/3EqoWzA3UAtOYqJMMyMxDRv
	 oqiG46i+97oBAdzfEyHdznlpfUHeYCPnVGN0p7xROTcWsSkofzT2v3za9+VQdYGXDdkZV
	 RvuZFquH4eUMN+Gl+LAoR4+qmXdLaHQZ50v6RN0M9b/SZUvz/7yyStQWs9ip5qp4W4+JO
	 18GZ2McmWFcKcyuKL6lAcTvxlnatr8SNk3KxlXpwkcBT1EwL76fz+wBMXyANXhwvyXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514696;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:X-Scanned-By:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Transfer-Encoding:content-type;
	bh=X6w3071ZCqjCDdNtw4sB8iaju15SqVXn/f2FppvrTPM=;
	b=CLTXho2pbmN0oK4lCmEYMBASSgVIwfvr/Wfd/NYUhzdU0ZKeFBTAVp7SyBuOZu22fTGe
	 WTAcDfOlEITF7ey9hA+5iO0MXcQ/raVhgTs4/5jFKkid0T4dnWshARzHlH5KKuhr2Zvf1
	 3snwcMK0yicW2UG3n7yLIOKfUmauVahXvO8Xni3zy3bb6xgb3WIQ951K9ukHQNXimDgBR
	 oDhSEsZCn2OykuBgeLILmwNFLVMXOpftmm+ris6J40Quvc8gD/NtIdJwsRqrAhH4oyEZp
	 RThVPAv+PXN4Fa46ohNd462xlGqrN+FASRd4WLBpRaBZgEmibRCxR7p5qCjg2+zUR3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J579HYFJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC7F60A261B
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 16:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC7F60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=J579HYFJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792514694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X6w3071ZCqjCDdNtw4sB8iaju15SqVXn/f2FppvrTPM=;
	b=J579HYFJCPHKTTrrWsxcbYqdYKCVTrXiFPDx7f/V370a/89WWcNC0ME0RyFkrvoGtaXKbS
	PtXwNwYvvXVPC3ba4zxAOZnwQr+TdAM575fsC2R9tPyb9u2t2xZj5X3ETlmcShetbIAcxJ
	bcYjNq3ggSVfpGGfaUk+ZBhl1TrDMFc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-vO94PHcWMHmDBsB8lfjjVg-1; Tue,
 20 Oct 2026 16:44:48 +0000
X-MC-Unique: vO94PHcWMHmDBsB8lfjjVg-1
X-Mimecast-MFC-AGG-ID: vO94PHcWMHmDBsB8lfjjVg_1792514685
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C39AB18088B8;
	Tue, 20 Oct 2026 16:44:44 +0000 (UTC)
Received: from djeffery-thinkpadp1gen3.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E649B30001A2;
	Tue, 20 Oct 2026 16:44:40 +0000 (UTC)
From: David Jeffery <djeffery@redhat.com>
To: driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Tarun Sahu <tarunsahu@google.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Laurence Oberman <loberman@redhat.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	kexec@lists.infradead.org,
	"Ewan Milne" <emilne@redhat.com>,
	"John Meneghini" <jmeneghi@redhat.com>,
	"Lombardi, Maurizio" <mlombard@redhat.com>,
	"Bart Van Assche" <bvanassche@acm.org>,
	"John Garry" <john.g.garry@oracle.com>,
	"Jeremy Allison" <jallison@ciq.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	"Pasha Tatashin" <tatashin@google.com>,
	David Jeffery <djeffery@redhat.com>
Subject: [PATCH RESEND v22 0/9] shut down devices asynchronously
Date: Tue, 20 Oct 2026 12:44:26 -0400
Message-ID: <20261020164435.80499-1-djeffery@redhat.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Oi96Hphq3lsSlQkLNzPLTBLk2C3FEufbdAd4P2ccig8_1792514685
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

These patches are rebased against the driver-core tree's driver-core-next
branch and should also apply against recent linux-next. No issues were
found by sashiko on original posting of v22.

Would this series be more acceptable if default enablement of async
shutdown was controlled by Kconfig and either disabled by default or only
enabled on x86_64 by default?

This patchset allows the kernel to shutdown devices asynchronously and
unrelated async devices to be shut down in parallel to each other.

Only devices which explicitly enable it are shut down asynchronously. The
default is for a device to be shut down from the synchronous shutdown loop.

This can dramatically reduce system shutdown/reboot time on systems that
have multiple devices that take many seconds to shut down (like certain
NVMe drives). On one system tested, the shutdown time went from 11 minutes
without this patch to 55 seconds with the patch. And on another system from
80 seconds to 11.

Changes from V21:
- Check a device is alive before accessing its bus pointer

Changes from V20:
- Move PCI bridge async enablement to before its call to device_add
- Use srcu to prevent ensure any active device_add is completed before
  device_shutdown begins shutting down devices.

Changes from V19:
- Convert initial creation of shutdown_one_device to a code move with no
  changes or side effects
- Add a warning to device_move should some device ever mix need_parent_lock
  with device_move in the future
- Link a PCI virtual function as consumer of its associated physical
  function to ensure proper shutdown order

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


David Jeffery (7):
  driver core: warn should device_move try to move a need_parent_lock
    device
  driver core: separate function to shutdown one device
  driver core: do not always lock parent in shutdown
  driver core: async device shutdown infrastructure
  PCI: Link a virtual function to its physical function
  PCI: Enable async shutdown support
  scsi: Enable async shutdown support

Tarun Sahu (2):
  driver core: rely on put_device to free dev->p
  driver core: prevent device_add() during system shutdown

 .../admin-guide/kernel-parameters.txt         |  10 +
 drivers/base/base.h                           |   2 +
 drivers/base/core.c                           | 269 +++++++++++++++---
 drivers/pci/iov.c                             |  11 +-
 drivers/pci/probe.c                           |   2 +
 drivers/scsi/hosts.c                          |   2 +
 drivers/scsi/scsi_sysfs.c                     |   3 +
 include/linux/device.h                        |   2 +
 8 files changed, 260 insertions(+), 41 deletions(-)

-- 
2.55.0

