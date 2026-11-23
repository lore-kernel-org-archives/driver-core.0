Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795397169;
	b=pIpPluAy9acLMGluHclJMOuiUaMY1JnUs07O19oVa1ZtiBdXk/lfeRFN/5iY1mF7IMRa
	 TMsUSngkv8uyktMExpBRH+2s1w4hZUnbm/MWR7VoPt3fT6iW9T9njbrSuks3l3pMh48x3
	 PNNtv9Vf3m4nfkbiN5BR/snTapd4hIplIEGhfNHmsXQyBq1j6Jk/wQ/66ROon/b4Epv+X
	 iztWkkEbXEm0a04F44x7hFCb18+B1GhZSzGUgn6p3hRbmDYON+QbbgASE6Nt3EZ6ci5Ns
	 PSnknvqlN6w7Iiv4WSp/gGzAi+HnFNlJIyn5waUDGeE+iMmqntS2hYlzUIC2euTik1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795397169;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Cimu9nETKTzANnWKl7CZH/+vQCY817P3+er3bcrePiY=;
	b=J8zBvqmwSU4164uQihlG641q5hekymxe3hDLpYQp2icBEP8+Qvkmw9SN8f5Sr9H3KqR6
	 wMNbEM7Kj4ObT17GSs6jPPZAprnyCQgGUDzqqQigdJBsPmBY2/zp/KnamVvXLoQjkELec
	 zo85Gf20IXZFLlIL+EghCnq+f5X210dPa9+Y4XAWEqQ++rHlFZ/xJsWApc9DcULZSli7m
	 k1I54qyXdBxh+m0bj+zDQDdV3yy5O7QTkXfFfja0FZaWQRaDJIaWx917XIVic18pNftNc
	 hzK+M5zTjYjCR7W6qnHEWR38iVXFsWASl6f36cx2ENrnH/N+tBiNQPinzkl3lK9RXMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rku+s9Ue;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4BD606A31D
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 01:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rku+s9Ue
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-385d8a00598so3738254eec.1
        for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 17:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795397168; x=1796001968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cimu9nETKTzANnWKl7CZH/+vQCY817P3+er3bcrePiY=;
        b=rku+s9UeXU0vg2ingkmaEOKTy9FR0IA906L9yr483Wq3JfITJMC+s8/oVP3rWWGF59
         UPKL2Ud0+TGI0FP72uNclSC3KeXDQOB3i79hm9nH5Q4nx3Qebw/q406PvBbgdgbEhsUi
         WG2pr1+miV63vrV0CNMCfw0XG3348zTjb5VrooN6r/i3/bL9iV5W7sGJQ+W4Z8POkEdQ
         2TfGT+/4b+Y/tYFPGCdqGbT3tqxwa+erED3NXfUaT5puAdy2ru2ThbCiLgB86kDc89KT
         LwYMVYkFS61b/7r15hyZUE0Z7L582n77GzaROnOe7lZWTc2gRm3X5bUwAMjHc9Gp1tpu
         mjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795397168; x=1796001968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cimu9nETKTzANnWKl7CZH/+vQCY817P3+er3bcrePiY=;
        b=RCnWXdVzvO6NJ05XPehqmIBQSPleQjqFolSlNDFXMO8/3WB0HIARKLlEUuSp2WORZk
         J3+T7SIJuM56V198aQwZp6lzd6h1d7WIulKDYAnvbQd6OoDwMwzJy4viD8MBmIKxTPiQ
         q5382DQyA47ANMzdQVhege+7PJ5dndcuYxIWAV4sKj8n4zkoyjW7CoEupG90ti2NTtq+
         6PBT4/qH+wlYui7NwmNGIxrgJqhD9CuXVFYBCiy57zFQjk6b1rN7NcWyrHda5I0v5bC3
         CDwpuc8vmveg1+LES8aLUFZBnQclz4ErYuVqMUwKOTY8WEYdiXpPcs0tcNfYi910qI8X
         utWg==
X-Forwarded-Encrypted: i=1; AL+hErFvYnKdc5iiCYmbablxM9EWDjwNVDb3G5+rrAHvI9SIXw+emzAm7fipD6XqTC7UzVzdko/pTpPp883S3w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Ub32v2ra/FRIJji9+y9u9tSs6aFKytJ7jEtcvxIC8nv35Y9Kz
	uD+oyxNDpdsF6G74QWR3ghAScuKXq6bBLw72fQmGq8zh4iuUl3zP5vfW
X-Gm-Gg: AZFdTZcmUWrvr1CJEuo4H0sYa279uJlP+Y947zSHjkp8yBMtb8b2+DsNQWGLElGx9d6
	so5EXrEAv2bn6hzIPrlxQTRP4K5aZANtFkbFN0wJlXY+Jzui+uB3sEvUB9XcnVuAVeAF7wPtRn2
	3rZv4Hne11O7e+vlZHQZWeJ2NBNLLP3FdwW3wSzgFqDUX8OhSGIFFOEWtp1nkvCCJm0mLN84tYs
	D2lvBZGuq5snJIBDFQCDdXEzUnhPENbPU7VRwGf9rEQ/yiE/s50OoKC55zkOK+T3y16qMKKDAFI
	JxpNAhq47LkSwMc9tJd4a2AZIOP8CD6Gl7K1l75DSQj9R+wnFzAfPDZTNdkr6+8dTHyHn90dOcg
	kYiuVK56lvoafHnc0ztzA9Ih0I2US70D4ELzA58Cyj4qMbPAd+AF3pGyWvhfzpr5gJXbPmGT5L8
	VILD5YU5r3rVcuNdYe5CUNraFalGLYRw54l6zbRAv3J+C77cA9FHCUuw7RSZ/CAOVLZNwNHOz7m
	S21nRXY2HFP4M5f2upuR1huQT5aBIm4EwsfNvM8f0kgA3AH/8/ulpUZXIZjSRQy7LFGUrh7YUZH
	HFlZtC03om8kcxxYkioAokNux5fDLO7roB5s1X1P3nDhiQ1ulxHSvLTLHwoVVBkn2Ml6joJ/YMu
	wrlZmFLTraolYuTR9jw==
X-Received: by 2002:a05:693c:42d1:b0:386:b0ea:327d with SMTP id 5a478bee46e88-386b0ea3549mr1277906eec.5.1795397168161;
        Sun, 22 Nov 2026 17:26:08 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm26992160eec.13.2026.11.22.17.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:26:07 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
Date: Sun, 22 Nov 2026 17:26:04 -0800
Message-ID: <20261123012604.3882115-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a device driver is being removed, bus_remove_driver() removes the
driver from the bus klist before detaching it from bound devices. If
dev_driver_uevent() runs concurrently on another CPU, it may acquire the
bus klist lock after the driver has been removed from the list, read the
still-valid driver pointer from the device, and access the driver's name
while bus_remove_driver() proceeds to free the driver structure.

To close this race window, acquire and immediately release the bus
drivers klist lock after all devices have been detached. This ensures
that any in-flight uevent generation that observed the driver pointer
before device detachment completed finishes reading the driver name
before the driver structure is destroyed.

Fixes: 18daa52418e7 ("driver core: fix potential NULL pointer dereference in dev_uevent()")
Assisted-by: LLM
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2:
- Updated the comment above dev_driver_uevent() in drivers/base/core.c
  to explain the new synchronization with bus_remove_driver(), per
  Danilo Krummrich's suggestion.

Extremely unlikely to hit so I would not worry about backporting to
stable.

 drivers/base/bus.c  | 9 +++++++++
 drivers/base/core.c | 9 ++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 396097fdb316..e7616d0ca854 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -849,6 +849,15 @@ void bus_remove_driver(struct device_driver *drv)
 	driver_remove_file(drv, &driver_attr_uevent);
 	klist_remove(&drv->p->knode_bus);
 	driver_detach(drv);
+
+	/*
+	 * Ensure that any concurrent dev_driver_uevent() that observed
+	 * dev->driver before driver_detach() cleared it, finishes
+	 * accessing drv->name.
+	 */
+	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
+	}
+
 	module_remove_driver(drv);
 	kobject_put(&drv->p->kobj);
 
diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..cc6a1016c251 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2705,9 +2705,12 @@ static const char *dev_uevent_name(const struct kobject *kobj)
  * risky as driver pointer is transitioning to NULL, so READ_ONCE() should
  * be used to make sure we are dealing with the same pointer, and to
  * ensure that driver structure is not going to disappear from under us
- * we take bus' drivers klist lock. The assumption that only registered
- * driver can be bound to a device, and to unregister a driver bus code
- * will take the same lock.
+ * we take the bus' drivers klist lock. During driver unregistration,
+ * bus_remove_driver() acquires and releases this lock after detaching
+ * all devices and clearing their driver pointers. This waits for readers
+ * that observed the old pointer to finish accessing the driver name
+ * before the driver can be freed. Readers acquiring the lock afterward
+ * cannot observe the removed driver.
  */
 static void dev_driver_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
-- 
2.56.1.750.gf70dc682cf-goog

