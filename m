Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0384DD6C8
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 15:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474136; cv=none; b=oE5irqYXbSlAK/zFdXlo7O924wER+wsSLGoG8g3pxjF/10HODE5IT+UKzaj9n3EEiBXAYGXN7LZeQFAYa8oW2SC0I8wxDbj0n/SimvP8C/6G3GAYllCPFKM1ayWDrOAfMN3+TSx2YTFr69R5ZJTiC2qRMWP4EtExgI83JOfX81Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474136; c=relaxed/simple;
	bh=kFYB2YE03Fr1cNJfzEYyTe0jd63mjl+q93uWX9YFs7s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PtSuQW/XpV1nZ4n77qtPw8eF2PAPilv8oQOlHBtnc0yXfLHDvwf+vMqoIobYKV7RDXDmVI6HkZ7O8byTG73xImCrqcFpCxRaIrdNMMZ/GGHWWOOKzmziMaBDuSfgo+zNdoPlzjUCj+g1KaWrre5c19XoLlByw/05hoJuAZQRekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX3uR/Kd; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX3uR/Kd"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93cbee4b010so332503785a.0
        for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791474133; x=1792078933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0u6VEga/fDhA/LHHVWZ01lUO0WQKoIfCOS1lH5jNGjs=;
        b=UX3uR/KdJWBLts0t+oftuum2Zz26ZZ2hh2ASedgkilXCldirMNLgnF+Od4j6dmdM+g
         a7K98SNt6mboi8qk4Fcif9waf4jwPpIGh2iPTO6YxYuyZ4AMgjhZ7F51IY862D/eYpMi
         Ego99ujJRReT0plWgHjjWBOS4L5ssbTNVePIivM8TQp9ji2wV+L3/VaeWbwxkQYTR2bG
         l+sfz6z56sU14s3C9/rdDoB0z725+ztIdJLQ8CCDYCGRvj4I1Gb7Pg7FL+i75izy9hw/
         D4DBWtQOe2XJu+0+mCu3F+Yy85ceEpte3RC9Gs+IaDqmL7uxEJsrFH13yX9EQzXJopGx
         /pHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791474133; x=1792078933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0u6VEga/fDhA/LHHVWZ01lUO0WQKoIfCOS1lH5jNGjs=;
        b=CuPOkONLPa07nxO2Arz8/gGzDivkKkv/qGDpUBauHU0qxb0OJqOfM2kvA6ovn62ohk
         d1/QxK7S0aiN5yZOkt/UQyYSiYTSOHKU8q8gc3mplVJ+mcoXLwH1Jx7FJWIxJIh7/+sM
         G66449Rqp5FbkuHeBksbktdg7lefdcDeF8BnmoOI9h3FO/XzOEN1zE0u3QCV8w/94Zdf
         SH8cZ53RBdrX7Ajb3uCOpj32Zw1ZPewLoSsm1UaIVwlG2Ea5wc/WJgAt9vbGRB5Nu37P
         MZg3l0bG34HoYDsKRY/eI01DoaOWRWZgROAbVapDhALigaIZtQ5yXNTIdJ44MHt+fjut
         TGSA==
X-Gm-Message-State: AFuF++nJ7bqkUL2d3f5xluIVlkBKC6vw/7dJKyXOGDbjHNaaVe4nWlnX
	q40R4VS5dx8zIlXoUHdNwMHduAEo6s/a/NDu/e0KQupfaa6PGxVjn8KD
X-Gm-Gg: AYBFou3Ja7xhJiZQxCDlhYQ1vidR/snPq+2VQk03sMwuimjgOjT4gsRcJgeWzhbzHBc
	i05GqBnEXvjiuyjW3+tNpIKQjh2dovYrBLzzh/0WTKRM/DmZmV0P0bG2cA57i4kTUb11v2MimqD
	y9B1JJnocfWBkYUB+0E80urIHLmqShplkYszATnA6NyAWFtCyQcjoJ4uSSDvhhvlwlHmZ0xW9LH
	/QIzK6hIfc0IUzeUG3w/qmuKNYDY2Y8HW8xrxxyFg15Da1EaQ6TmovsbozC9ekJpX67G9wfF7A3
	iPz7d6N95bZwCGGjDZB2dH124lZOaBtANsKFI+Z9UIfaCPTrAojszfV9KNZGp1NBclU1Y2awp58
	cd95zVD2q6PCkE5ndZeyHrCxgrCcnqRmLBeu7KrUj4KFy/0g30EN4vLTXAWsob6RIF9YeU96jq4
	qWMFgk7Q311pjahyVhMzqLNdRhslUmu5EivE4wY6TBmHa8ZHBfrqE7tjcbyBXgxFv1E++6nM3+F
	q11zhb29Ov0n1+qPSsjpJBidfuCFoYAVjC/UEkj/eIx9hxPmG9r/6UPz5ptdD7Y0dMfdVlua6D0
	Ud6eMm633OPPnQROt9yg9ebVVPxhJaemikk1RjmtMXqfyUNSZ1jFh7b9JKda3zMY39uiXSpaeYl
	lkuHLXdN+N9yu5sq6fF4piZ4eYOAQ8l5Tu+Z9Em5wzwM8rXjnANJzKeSB37qUcKEyEV7l0RT2ph
	MEwheDqYkXPGQ9XFvuQ20TiAGkPQwS
X-Received: by 2002:a05:620a:471f:b0:93e:4f4c:b380 with SMTP id af79cd13be357-93e9b2f09fbmr1114619485a.10.1791474132642;
        Thu, 08 Oct 2026 08:42:12 -0700 (PDT)
Received: from node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us ([128.105.144.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991a014esm507954485a.27.2026.10.08.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:42:12 -0700 (PDT)
From: mosafer <mohsafer@gmail.com>
X-Google-Original-From: mosafer <mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com,
	Mohammad Mosafer <mohsafer@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] driver core: complete deferred binds when drivers_autoprobe is off
Date: Thu,  8 Oct 2026 10:41:05 -0500
Message-Id: <20261008154105.256340-1-mosafer@node0.quickhttpnode15.cloudfaas-pg0.wisc.cloudlab.us>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mohammad Mosafer <mohsafer@gmail.com>

device_add() registers a device and then runs the bus's initial probe
via bus_probe_device() -> device_initial_probe().  With
drivers_autoprobe disabled for the bus, device_initial_probe() skips
__device_attach() entirely.

That is correct for automatic *matching* against the bus's driver list,
but __device_attach() also doubles as "complete a bind that a driver
already initiated": when dev->driver has been pre-assigned outside the
normal match/probe path, its else-if branch finishes the bind by
calling device_bind_driver().

With autoprobe off, that second duty is skipped too.  USB depends on
it: usb_driver_claim_interface() pre-sets dev->driver on an interface
that is not yet registered, documenting "let the future device_add()
bind it, bypassing probe()".  Composite drivers (cdc-acm, cdc_ncm,
cdc_mbim, ...) rely on it to bind their sibling data interfaces.  If
drivers_autoprobe is written with 0 while such an interface is
between the claim and its device_add(), the interface ends up
registered, with dev->driver set and iface->condition ==
USB_INTERFACE_BOUND, but never bound: its knode_driver is never
attached to the driver's klist_devices.

Teardown then trusts those flags: usb_driver_release_interface() ->
device_release_driver() -> __device_release_driver() runs a full
release and calls klist_remove(&dev->p->knode_driver) on a
never-attached node whose knode_klist() is NULL, which klist_put()
dereferences:

  Oops: general protection fault
  KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
  klist_put <- klist_remove <- device_release_driver_internal <-
  usb_driver_release_interface <- acm_disconnect / cdc_ncm_unbind

Reproduced with syzkaller's C reproducer on a 7.3.0-rc6 tree:
instrumentation shows the doomed interface's device_add() racing an
autoprobe=0 write; the bind-completion branch never runs for it; later
teardown hits klist_remove() with a pristine node.  With this patch the
same instrumented race completes the bind inside the window (knode
attached, crash gone): 3 VMs, 5 min per run, race window hit and bind
completed 8 times, zero KLIST-REMOVE-BAD, zero Oops.

Gate the flag on what it means - automatic matching - not on the
completion of a bind the driver already requested: pass through to
__device_attach() when dev->driver is pre-set.  Other subsystems that
preset dev->driver before device_add() (w1, tegra xusb,
zynqmp-ipi-mailbox) get the same correctness back; when dev->driver is
NULL the behavior is byte-for-byte unchanged.

Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
Fixes: b8c5cec23d5c ("Driver core: udev triggered device-<>driver binding")
Cc: stable@vger.kernel.org
Signed-off-by: Mohammad Mosafer <mohsafer@gmail.com>
---
 drivers/base/dd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..98315264295e 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1149,7 +1149,17 @@ void device_initial_probe(struct device *dev)
 	if (!sp)
 		return;
 
-	if (sp->drivers_autoprobe)
+	/*
+	 * The drivers_autoprobe flag only suppresses matching the device
+	 * against the bus drivers.  If a driver has already been assigned
+	 * to the device (e.g. usb_driver_claim_interface() pre-setting
+	 * dev->driver for an unregistered interface, expecting device_add()
+	 * to complete the bind), the bind must be finished regardless of
+	 * autoprobe: otherwise the device ends up registered with
+	 * dev->driver set but never bound, and teardown oopses removing
+	 * the never-attached knode_driver from the driver klist.
+	 */
+	if (sp->drivers_autoprobe || dev->driver)
 		__device_attach(dev, true);
 
 	subsys_put(sp);
-- 
2.34.1

