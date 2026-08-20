Received: from out203-205-221-192.mail.qq.com (out203-205-221-192.mail.qq.com [203.205.221.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CF43AF646
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 06:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206286; cv=none; b=uj4BOO6tog5+KZhsbyuNecBfzhsr4d0VFmOvqfN+mXayjbTGwmnmqZEPvchYOKTdQq9F92aVYjfIoHYTN5KF5U1lWzVGdBCPCQ/7egr077LBNR9ixGuTns9giJImfi1LPqpWmCwfY3CPIXRm4qH+TnFqnkSFMWuDeN4LeYCOfX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206286; c=relaxed/simple;
	bh=RxQNyWcv9GGDdXv1ahayBwYyR10+9rMXRdOwLVSK2wo=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=aDK5Jr6a8xeZfQUSa+HYRWgBq5APh8n6GXjx0VaHdbjGC6wiCqCuhLOZ2fsv5IcF8PHv8AvgWfbVh1VfqwEF0x/N+wKdzs7RfqH6qU9Y7ZEGyRD+9qSjb21+UVsiEaDNB06K0QCnFI8nd5iQzPZ73LbjnpUIksyyWlX8qtOlgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Pl3moTN6; arc=none smtp.client-ip=203.205.221.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Pl3moTN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787206274; bh=tDDFVpb5nU4OHVJTKifhcGCq0cL2v97Qpp/ywaWvtm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Pl3moTN6EJ457mXhWVKxtYMtYbR4lR3do+k3S7k0/9j1MT9p0G1R4B7MGvwS0HNo4
	 31ZcKpBf3VSeDKZQoY1pXc5WkmrXLDIhHW0f+pdeRlkT2MFO8kKZ0xrP3Zy6cZ6Goy
	 wh0yXe7daKzLOLI18Tw3RIC0RykdL7WK9oCuWA4c=
Received: from lxu-ped-host.. ([111.198.231.89])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 2CB39203; Thu, 20 Aug 2026 14:11:11 +0800
X-QQ-mid: xmsmtpt1787206271to8dsduzn
Message-ID: <tencent_0B76C5676E3DA13640962637444B28743709@qq.com>
X-QQ-XMAILINFO: MqG4KXyEKpQyy3mlEP9GV8RwJBGgqgER31OD9q06MWkggXbaviYejocnRcuF92
	 RL6O0m507cVO9HOmOuOpdsaKxDTSicdKovCgCM6v/z81HNa7dgbmXNQhJwbyaI1SxogM/ONaX5dD
	 d/9l8Nv/2fEuMzrM2vTHVF7+PYflvuE3Cc8K0Xhq+xhBI4nI/+BVFZyJKhJNX087gMPjpLTIkgyP
	 3PytSq+oSHBo9sZlNFqsZyVXCFhUfV9EZl2OBScrAKnDqi6ngDXlDDBorEe3t/ImHx5J7YJ25tX0
	 BIj7FO+gY+b02FvSTZT5g7tAW+KRwZr1NmL1euW/IJBmwTZlxgclDJmswxXMAPcRvw5EIKmLPOK0
	 3lTcWopL4uPucsPdr7TFVyYq+fu8pp6nLwNb09nhPL/HyXocq+RfKIFkWABBjzvQd0MXxg/cVmT3
	 LllzVcEvncu6KXAzcIpsigUI3jz9Ax/ze+Zfo0XMsDUfaRwRZqq1udyiYUMdhKyXNjAVH0cdXRSr
	 nR90FkAXA3fGdeG0OxQ48p/km01bUVK5vTUCk0up79eQStrG1CUUI+PuOI/LJMQ162T+RRSDIcr8
	 d2K8Ef36lmDOCPVuh05653HT1AKPAXWZUk1TtXdRZwUEoKCUXWwdz/c7sg9GJqrEC+2KWSK3zat6
	 IPbbUDeKsXKptrLC+JoVSqLDANcxbYU+Gz4VjFnbTQrnwm25jbvu77tBK3X7Av2Hm2Ob1qT1DJBS
	 C1KMu7skE4W4obPPInJN5B7tllFBcldrY6cNLkpuxX7XIIfCt/i/sQ9wTLnKQ+jYskSuA0foXU8z
	 UBfuEOYVrjo28A/3b+dxycJD2ur6Gpuq1Pu6Z11xP1VQQBVq1fn8oV2KSUu42eORqR2JflpH7OtC
	 x3Zbe36JfifnyLS5Lh/xKspNuEUmvIKT8m3cZoPEoqzQI4F0l+UF95e0bFpAk/dOXOOvVnhB2YkH
	 fd+bseQbxHOLqIFURjxRtuaR0jl+rOhhnQZG9TzKWfcKhr4tijztMCZZW7oMw4n1gqYSUFq6AiyM
	 Buql7w5A0UB/8MNmiUpWSdIo9Wk88=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	rafael@kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] driver core: Do not remove the knode driver when autoprobe is disabled
Date: Thu, 20 Aug 2026 14:11:11 +0800
X-OQ-MSGID: <20260820061111.528389-2-eadavis@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
References: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the user writes 0 to /sys/bus/usb/drivers_autoprobe, the USB device
fails to undergo the probe process, and the user does not manually perform
a bind operation.

Consequently, the corresponding driver is not bound to the device; this
leads to the removal of `dev->p->knode_driver` during driver release upon
usb device disconnection, triggering [1].

Add a check for knode_driver before removing it.

[1]
Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
Call Trace:
 klist_del lib/klist.c:230 [inline]
 klist_remove+0x14c/0x2e0 lib/klist.c:249
 __device_release_driver drivers/base/dd.c:1357 [inline]
 device_release_driver_internal+0x4fb/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5415 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5961

Fixes: 94e7b1c5ff20 ("[PATCH] Add a klist to struct device_driver for the devices bound to it.")
Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
Tested-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Signed-off-by: Edward Adam Davis <eadavis@qq.com>
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223844..4154b44990b2 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
 		device_unbind_cleanup(dev);
 		device_links_driver_cleanup(dev);
 
-		klist_remove(&dev->p->knode_driver);
+		if (device_is_bound(dev))
+			klist_remove(&dev->p->knode_driver);
 		device_pm_check_callbacks(dev);
 
 		bus_notify(dev, BUS_NOTIFY_UNBOUND_DRIVER);
-- 
2.43.0

