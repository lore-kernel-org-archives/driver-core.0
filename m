Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AC140D564
	for <driver-core@lists.linux.dev>; Fri, 19 Jun 2026 00:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781827283; cv=none; b=rKumCcDj0jww2yPZDh6r8/xTWmXLJh+SPRyqWiJEycZIHCk+VQCtJTcKErZ319uWCBc7UsWwHydVrdeW7txS2IFG1c6HnxmblxihNiYSVql5aBfOR02QTA+9DdprDNjf31pygh+qDnyOl5BaeNgFB6ctNTtfXRbBwsPFSJ9lmsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781827283; c=relaxed/simple;
	bh=2FXcUMGFDRefP3xvm4+ciVao5crHkNdwJMIV1XWtenk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OAip2NdwOrj50Gtr61NgUyHkYl9P0/+C6/crk0rz+/+PyDDCRgOklV2pDpFei24dJNYGsIhBj18FUIb/zpYTphFX53N7qJBz7/5hJBbX5rBk26vVlKF1CqdAZE8Y+yEcG42CmrR/izdnn6lqxZIAcW83stbsLm85XhIfrCUAxDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org; spf=pass smtp.mailfrom=fastmail.org; dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b=K6+ahxLb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d0pNNaAM; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="K6+ahxLb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d0pNNaAM"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id 3C22C138086D;
	Thu, 18 Jun 2026 20:01:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 18 Jun 2026 20:01:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1781827280; x=1781830880; bh=gYTeIhSeBaTzmIv8TI2Cw9/TQ7RbjJ7Y
	32bFwgMVcVU=; b=K6+ahxLbVys0is/pfYXmMG1lTVAWVQxjN7GoU2KSHSygJHXK
	/H6SSckOAlm7v+bnkHTGhxQ5J6P54t5vEUE6VhH4raQZO6zM0mFDh+njwBe126ZL
	UDm8odq+IaZzlJP4KZgMyGd5ZXDIvR2w8DzGnlxrctCed3vy0rpiDzud6gjZuLjV
	sFr3bfRfWhXZ3ssFOtglVJIIIilc3chzBke/BNJJ6GkEpyntdtB4WjJ1y1tso7NP
	KKziOxxe3Oq8KL2EqPFXbP6owNQO+cwrlvjxwz/leq6kVIbOKB3hmXhTU2xcKhjz
	SPl1cekWuQL3O+u5YeE8ifcM2sbr/WFfaPF33A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781827280; x=
	1781830880; bh=gYTeIhSeBaTzmIv8TI2Cw9/TQ7RbjJ7Y32bFwgMVcVU=; b=d
	0pNNaAMpM83VNeLs4RNRDMQv6WZYTuGIH1McmJfXSCfIZGdng/LEEUleNegTk3TU
	EXafGztgn8NjorgtX3wAArM6MPm0rBtD2OiBBfM+4coWGB8xZJhKPMxlxa9WriN8
	mFfMVeS9k0/XSipBI62qbDIdX0WI1BYOGwb2cY3nbyjnaH2ocCUou3D78/XSNX7C
	OIloLmAeelIQ3gFOsEi5xTvZcb+lXNhu+K8NsaCDomRzYjdVcU8itrLlxky2A7Nn
	9NePLYQXPOIHVLHnHohDa4/Vy8JpXnp9SgnHJLoynBsmwBiw9ssyWgVelAnNnx3c
	KYv7rk2XBws1KUrmAc/8w==
X-ME-Sender: <xms:z4Y0agWCObWDmuMPfjRdhcFunitBZu3wU3qjvRvHJ5aqKa_Np6UoAA>
    <xme:z4Y0alRImJVLzRzFAzDUIePJ1GiE1SDHXXSAAaG7R3JgN2KTdWHfoHO0ogFOUqrQB
    qZz94sKE9Syrn4IdLme38GK9e6r3_se-WzWoGITAM2JrLmlIrZOP_eP>
X-ME-Received: <xmr:z4Y0aikY908W2TJTZuS19ZpR7mJtkNXVUIiDbujUFpcbA98mSH6xUGDIMtE>
X-ME-Proxy-Cause: dmFkZTEaTs4yDBUktF5tVSUCrOArU63HPUL2EVdbtTiSCgXAA/nsz4HT8EYuxrV78lVhf6
    ZTm2AiNYqgnEn/IJQnoIs7GkEw39W2FwrEGmeHbbWPTOXC9OazC+JvbbcNnKmCMBFCgMkI
    oX25cBZWALpbVczX5HAtDa207d/u78rDCbF4dNNV5b9i0PCzsEyGzV5twrJuKQiP5S6qUB
    6snflgzXqBLjordHELmYo09htCEkQjR0/Ak2WzExRRX8J8e8P7SrVENVvZWpXv3QY6wP3S
    MKVBy+MPepQ+SJW2oUv2oYzNxJnURX8enxXoHkv2SRtGSZlnwCYsH+pVszY10P5DyGItQd
    ogRLWvj+1qSfbMbAn6DWyJML+8Kqiq1jVsI4ORq8QvEF9WVfXgzNWBnq4FfSFLWVnnNJkB
    c+j2P7AWvCaP+xM6c2DzslvR9QetYBPjrKDqjmBs8RTJnOOqW+WWpoL+jQV2Vo+dwytFv8
    7NMDCHF3HgubRwTvKw6ePWEqqJZXIc7ep4HjoV8oHq90DBSAD+JRSG6ZVp1tP3CZBQ9iS3
    5ADNvxWeXAE3ERQerhxsqGdAv3bo/D/QysEkGKfuCyde46p+bV4OREmUg59+2awfxaNOsM
    952vO1qW9JAJbqkM493qVMs3EUBOwPC9SN7P0vWWHveeo+iC3Y8Z9uGeniHg
X-ME-Proxy: <xmx:z4Y0aj5_AzIWIXx5Wj0rncAhlHRQrdvGjQZkmQo8q56anfWKdQMWYQ>
    <xmx:z4Y0agg90fSYVQ2Rj2tjBq0dYl3yKFveulSrvP0Niy0MIlg4UPGFxg>
    <xmx:z4Y0aoEntfuOTgt4Nqg_9t1ecAfpNSso1dSg4WI3Ffu7zEN8-VgfKQ>
    <xmx:z4Y0auR1GMocgSKvAxlFjzho3_kX_hG9XmNg0J08kBHkitqwKClJnQ>
    <xmx:0IY0asoldi7SUp6F8jx6EcI8CbzHxg0IIM_C87PzgPNu64hbrLi-TaKG>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Jun 2026 20:01:19 -0400 (EDT)
Date: Thu, 18 Jun 2026 19:01:16 -0500
From: Ian Bridges <icb@fastmail.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [RFC PATCH] firmware_loader: fix use-after-free in
 fw_load_sysfs_fallback()
Message-ID: <ajSGzHwRxkT2rVMZ@dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When a firmware request falls back to the sysfs interface,
fw_load_sysfs_fallback() registers a temporary firmware device as a child
of the requesting device and adds it with device_add(). For the
asynchronous request_firmware_nowait() path this runs from a workqueue.

request_firmware_nowait() takes a reference on the requesting device with
get_device(). That keeps its struct device allocated, but not its sysfs
directory, which device_del() tears down independently. So a device whose
driver requested firmware from its probe function can be removed, for
example by a USB disconnect, while the fallback work is still running.

When that happens, device_del() frees the requesting device's kernfs nodes.
Concurrently, device_add() reads those nodes and then takes a reference on
each with kernfs_get(). If a node is freed between the read and the
kernfs_get(), kernfs_get() runs on freed memory, a use-after-free.

Fix this by serializing the device_add() against the requesting device's
removal. device_del() sets the device's dead flag under its device lock
before it removes the directory, so take the requesting device's lock
across device_add() and return -ENODEV if the flag is already set.

Fixes: e55c8790d40f ("Driver core: convert firmware code to use struct device")
Reported-by: syzbot+3942dc5563ea8b96bbbe@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3942dc5563ea8b96bbbe
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Ian Bridges <icb@fastmail.org>
---
This patch contains a proposed fix for a crash reported by syzbot in
__kernfs_new_node().

The file names and offsets in this description are from commit
c425609d6ac4012c8bbf01ec2e10e801b1923a7b of
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

I also have a test harness that triggers the crash from an unprivileged
USB device, an emulated ueagle-atm pre-firmware device driven through
USB Raw Gadget and dummy_hcd. The test harness uses memory pressure to
artificially extend the race window. The harness was written with the
help of a coding agent (Claude Code).

I've marked this patch as an RFC because I'm relatively new to working
with the Linux kernel and this is my first attempt at work in this
subsystem. Any feedback is appreciated.

The Bug

When a driver requests firmware that the kernel cannot load directly, the
loader can fall back to a sysfs interface for userspace to supply the
image. It registers a temporary firmware device, f_dev, as a child of the
requesting device (f_dev->parent). On the asynchronous
request_firmware_nowait() path, it adds that device with device_add()
from a workqueue.

request_firmware_nowait() takes a reference on the requesting device with
get_device() and holds it for the duration of the work. A device's sysfs
directory is a kernfs node, held in its kobject's sd field. device_add()
creates it and device_del() removes it, independently of the reference
count. So get_device() keeps the struct device allocated but not that
directory, and the requesting device can be removed while the work runs.
For example, a USB device whose driver requested firmware from its probe
function can be disconnected.

The work and the requester's removal run on different threads. They
interleave to trigger the bug as follows:

1. A driver calls request_firmware_nowait() from its probe function. The
   loader takes get_device() on the device and schedules the work on the
   events workqueue.

2. Probe returns. The device is now free to be removed at any time, for
   example a USB disconnect. The reference keeps only the struct device
   allocated, not its sysfs directory.

3. The work runs, fails the direct load, and enters the sysfs fallback in
   fw_load_sysfs_fallback() (fallback.c:75). f_dev->parent already points
   at the requesting device.

4. fw_load_sysfs_fallback() calls device_add(f_dev). Building f_dev's
   directory reaches sysfs_create_dir_ns(), which reads the requesting
   device's directory node from kobj->parent->sd.

5. Concurrently the requesting device is removed. device_del() runs
   kobject_del() to remove the directory. sysfs_remove_dir() first clears
   the requesting device's kobj->sd, the pointer step 4 just read, then
   kernfs_remove() frees the node through call_rcu() (fs/kernfs/dir.c:618).

6. device_add() takes a reference on that node, now freed, with kernfs_get()
   in __kernfs_new_node() (fs/kernfs/dir.c:704). kernfs_get() reads the
   node's count (kn->count, fs/kernfs/dir.c:560) on freed memory.

The read in step 4 had to happen before step 5 cleared the pointer. A read
afterward gets NULL and returns -ENOENT, so the window is between the read
in step 4 and the kernfs_get() in step 6. device_add() reads the parent
tree at more than one point, so the fault is not tied to a single caller.

The Proposed Fix

device_del() takes device_lock(dev) and calls kill_device()
(drivers/base/core.c:3884) to set dev->p->dead, then unlocks and removes the
directory later, outside that lock. So fw_load_sysfs_fallback() takes the
requesting device's lock across device_add() and checks that flag. If it is
set, the requester is already going away and device_add() is skipped,
returning -ENODEV. Otherwise the lock is held across device_add(), which
blocks the requester's device_del() at the same device_lock(), before it can
mark the device dead or free the directory, and keeps the requesting
device's sysfs tree alive for the duration.

The fix was verified with the test harness mentioned above.

As a side note, the comment above cleanup_glue_dir() in drivers/base/core.c
documents a similar race.

The Fixes tag is e55c8790d40f. The race is two paths touching the requesting
device's kobj->sd with no lock between them. device_del() has always cleared
that field and freed the node during teardown. This commit added the second
path. By setting f_dev->parent to the requesting device and calling
device_register(), it made device_add() read the same kobj->sd and take a
reference on the node with kernfs_get(). The earlier class_device placed the
fallback under the firmware class and never touched the requester's node, so
device_del() was the only accessor and there was nothing to race. The
asynchronous request_firmware_nowait() path and the get_device() lifetime
were already in place, so this commit, the one that added a second accessor
with no lock against the first, is where the race was introduced.

 drivers/base/firmware_loader/fallback.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index 3ef0b312ae71..997ee8d360f7 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -8,6 +8,7 @@
 #include <linux/sysctl.h>
 #include <linux/module.h>
 
+#include "../base.h"
 #include "fallback.h"
 #include "firmware.h"
 
@@ -75,6 +76,7 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
 {
 	int retval = 0;
 	struct device *f_dev = &fw_sysfs->dev;
+	struct device *parent = f_dev->parent;
 	struct fw_priv *fw_priv = fw_sysfs->fw_priv;
 
 	/* fall back on userspace loading */
@@ -83,7 +85,23 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
 
 	dev_set_uevent_suppress(f_dev, true);
 
+	/*
+	 * The fallback device is added as a child of the requesting device,
+	 * which can be removed concurrently. Hold the requester's lock across
+	 * device_add() to serialize against its removal, and skip the add if
+	 * the requester is already dead.
+	 */
+	if (parent) {
+		device_lock(parent);
+		if (parent->p->dead) {
+			device_unlock(parent);
+			retval = -ENODEV;
+			goto err_put_dev;
+		}
+	}
 	retval = device_add(f_dev);
+	if (parent)
+		device_unlock(parent);
 	if (retval) {
 		dev_err(f_dev, "%s: device_register failed\n", __func__);
 		goto err_put_dev;
-- 
2.47.3

