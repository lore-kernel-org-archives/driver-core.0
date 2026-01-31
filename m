Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DB3224249;
	Sat, 31 Jan 2026 01:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769823964; cv=none; b=gmCTRvAkI7SEp1RNM2EnrA6RCJAyMNZyNj6JkMYB4k8fg5O/6tKNyZx2QKLaWPJUEVsCbzRfOidmBN34QvtFFMIBUA4fddIyGSXPs1xDogLdmSOwIxoS9kzqQJoD5wtRHPzIMMHYYBGqeGrk4PSAukryQuxM7i6nQZc43S7qRJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769823964; c=relaxed/simple;
	bh=1jLYKHYGZK2YMpMFiW1IciW/WgGISoE5iU1DWo9/76U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sfveDEAHkqyiQTrEYkCcMyW78/r0koZqAhjRCH2tXQDfdNfF/dQ3hBSxk6XMKe0k0tBpgySuEcHDHvDf3Gwx9PIQI7iuBYqP2UTRUTzuuQB8T3MnEwvWA4t01wbPgr2tiytY1nIvE7PGG8KIplUMlm69ORCJhR3Cgxy1X3QPePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0BBcBdD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0BBcBdD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061CAC116D0;
	Sat, 31 Jan 2026 01:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769823964;
	bh=1jLYKHYGZK2YMpMFiW1IciW/WgGISoE5iU1DWo9/76U=;
	h=From:To:Cc:Subject:Date:From;
	b=S0BBcBdD125HZDCK4bo3Vjqj1rYM2ES1AHnpBepyHXmxpqEE8137ahGjFjAazENAC
	 zn/Bws4Wisuu6dFhOBTtNcisC3LQzjyBYqBEao7clBx6ZDdANYpoYcW+U0z1K21FBw
	 BF0JxIzuB4J2xeZPnuaIGHGWhguaBXoVj4SkruL0xty7JWXJEadGMZPcugbWMlses2
	 GKMFSjkXJXBRUxDVMgNDcvquBwd6UhIxI8qcO2bK5knTBbmMwl9IChcvSeASVKL383
	 L0uHVm4hY9k1ftptlywhS62U8QpPGLms0dJ25Pr2PDPXHHYVD0f6ICdkU8SdM5CZC3
	 NaeGUpYuKQtSQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] driver core: fix inverted "locked" suffix of driver_match_device()
Date: Sat, 31 Jan 2026 02:42:07 +0100
Message-ID: <20260131014211.12841-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the current implementation driver_match_device() expects the device
lock to be held, while driver_match_device_locked() acquires the device
lock.

By convention it should be the other way around, hence swap the name of
both functions.

Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h | 10 +++++-----
 drivers/base/bus.c  |  2 +-
 drivers/base/dd.c   |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 5bc1439d3498..8c2175820da9 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -179,19 +179,19 @@ void device_release_driver_internal(struct device *dev, const struct device_driv
 void driver_detach(const struct device_driver *drv);
 void driver_deferred_probe_del(struct device *dev);
 void device_set_deferred_probe_reason(const struct device *dev, struct va_format *vaf);
-static inline int driver_match_device(const struct device_driver *drv,
-				      struct device *dev)
+static inline int driver_match_device_locked(const struct device_driver *drv,
+					     struct device *dev)
 {
 	device_lock_assert(dev);
 
 	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
-static inline int driver_match_device_locked(const struct device_driver *drv,
-					     struct device *dev)
+static inline int driver_match_device(const struct device_driver *drv,
+				      struct device *dev)
 {
 	guard(device)(dev);
-	return driver_match_device(drv, dev);
+	return driver_match_device_locked(drv, dev);
 }
 
 static inline void dev_sync_state(struct device *dev)
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 331d750465e2..9eb7771706f0 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -263,7 +263,7 @@ static ssize_t bind_store(struct device_driver *drv, const char *buf,
 	int err = -ENODEV;
 
 	dev = bus_find_device_by_name(bus, NULL, buf);
-	if (dev && driver_match_device_locked(drv, dev)) {
+	if (dev && driver_match_device(drv, dev)) {
 		err = device_driver_attach(drv, dev);
 		if (!err) {
 			/* success */
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index ed3a07624816..0354f209529c 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -928,7 +928,7 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 	bool async_allowed;
 	int ret;
 
-	ret = driver_match_device(drv, dev);
+	ret = driver_match_device_locked(drv, dev);
 	if (ret == 0) {
 		/* no match */
 		return 0;
@@ -1180,7 +1180,7 @@ static int __driver_attach(struct device *dev, void *data)
 	 * is an error.
 	 */
 
-	ret = driver_match_device_locked(drv, dev);
+	ret = driver_match_device(drv, dev);
 	if (ret == 0) {
 		/* no match */
 		return 0;

base-commit: c71257394bc9c59ea727803f6e55e83fe63db74e
-- 
2.52.0

