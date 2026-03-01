Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF52D6407;
	Sun,  1 Mar 2026 01:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329825; cv=none; b=Vxbv1gm4LS0tIcJSDHgRsKR80wQDiyt/WjZ3mkXb23IyZEFBOZOH19WsQEQaoNNClfe3bQ1e3+fd0XR9UdmbyhCLx9qqORFZ2tkeTCHtdV7NLxm7DEAq6kp75DYQ3REzKGQQ8QcDrpeto93S9m85F+qPGtTBSWhGkRzPphHRC8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329825; c=relaxed/simple;
	bh=p/24TmXKNNhsZhJdjj6N18LxqVhetbyXN10wAcAU5Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f0LWBP3XO0HYUkCXexC2vc/n7Tnq4gJcgj9CClx2GOYgcnb3dscplkMoMpTGOSyhsRj3bHpCTg4uTShxhJN6lEzJJOW+szMOSQpjwrxdblHH2Io4BkpvlSmdgxPdIpCX/lWuyUx700tGvgVgqBRFm/M99QZF5ida+qFWN3O5HJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQkoB+9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQkoB+9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10A5C19421;
	Sun,  1 Mar 2026 01:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329825;
	bh=p/24TmXKNNhsZhJdjj6N18LxqVhetbyXN10wAcAU5Bk=;
	h=From:To:Cc:Subject:Date:From;
	b=OQkoB+9cQ+UjJp8UtzE0cVjgzpceeD8rPi4m6LQC8W64n6foRxxO2nIFhsbErwMEH
	 sk+Ux4hDiEKLPE6CREcGJvbs04ChNiI1nD9a0pQnS7zsZwt+p6OZi0dAp8OmDMEvM6
	 B8XeQakSybp0+GVtv0yojicVPcIaKCWrrJTuIjI/2xY4GFRxTyCQnjLrfg3jJ2M5tv
	 6X4klpVPGpR7r2DWCarbMuDAMfqJyCMa16AWxkzx91HMsY3S2xf7X2BtBKV765MLaS
	 pyi50R5MjTpoZGeSg/8efRAxKta6b1Ntz7T2kKJQlJRqAcKgwGPG/DdvG1J4iq16l0
	 Xid4Df1w9a6+Q==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hanguidong02@gmail.com
Cc: Qiu-ji Chen <chenqiuji666@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	driver-core@lists.linux.dev
Subject: FAILED: Patch "driver core: enforce device_lock for driver_match_device()" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:50:23 -0500
Message-ID: <20260301015023.1716361-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From dc23806a7c47ec5f1293aba407fb69519f976ee0 Mon Sep 17 00:00:00 2001
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 14 Jan 2026 00:28:43 +0800
Subject: [PATCH] driver core: enforce device_lock for driver_match_device()

Currently, driver_match_device() is called from three sites. One site
(__device_attach_driver) holds device_lock(dev), but the other two
(bind_store and __driver_attach) do not. This inconsistency means that
bus match() callbacks are not guaranteed to be called with the lock
held.

Fix this by introducing driver_match_device_locked(), which guarantees
holding the device lock using a scoped guard. Replace the unlocked calls
in bind_store() and __driver_attach() with this new helper. Also add a
lock assertion to driver_match_device() to enforce this guarantee.

This consistency also fixes a known race condition. The driver_override
implementation relies on the device_lock, so the missing lock led to the
use-after-free (UAF) reported in Bugzilla for buses using this field.

Stress testing the two newly locked paths for 24 hours with
CONFIG_PROVE_LOCKING and CONFIG_LOCKDEP enabled showed no UAF recurrence
and no lockdep warnings.

Cc: stable@vger.kernel.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Suggested-by: Qiu-ji Chen <chenqiuji666@gmail.com>
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
Fixes: 49b420a13ff9 ("driver core: check bus->match without holding device lock")
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Link: https://patch.msgid.link/20260113162843.12712-1-hanguidong02@gmail.com
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h | 9 +++++++++
 drivers/base/bus.c  | 2 +-
 drivers/base/dd.c   | 2 +-
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 430cbefbc97ff..677320881af15 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -182,9 +182,18 @@ void device_set_deferred_probe_reason(const struct device *dev, struct va_format
 static inline int driver_match_device(const struct device_driver *drv,
 				      struct device *dev)
 {
+	device_lock_assert(dev);
+
 	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
+static inline int driver_match_device_locked(const struct device_driver *drv,
+					     struct device *dev)
+{
+	guard(device)(dev);
+	return driver_match_device(drv, dev);
+}
+
 static inline void dev_sync_state(struct device *dev)
 {
 	if (dev->bus->sync_state)
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index 9eb7771706f01..331d750465e2f 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -263,7 +263,7 @@ static ssize_t bind_store(struct device_driver *drv, const char *buf,
 	int err = -ENODEV;
 
 	dev = bus_find_device_by_name(bus, NULL, buf);
-	if (dev && driver_match_device(drv, dev)) {
+	if (dev && driver_match_device_locked(drv, dev)) {
 		err = device_driver_attach(drv, dev);
 		if (!err) {
 			/* success */
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index bea8da5f8a3a9..ed3a076248169 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1180,7 +1180,7 @@ static int __driver_attach(struct device *dev, void *data)
 	 * is an error.
 	 */
 
-	ret = driver_match_device(drv, dev);
+	ret = driver_match_device_locked(drv, dev);
 	if (ret == 0) {
 		/* no match */
 		return 0;
-- 
2.51.0




