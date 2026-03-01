Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2126ED35;
	Sun,  1 Mar 2026 01:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329333; cv=none; b=OA6QSIb+Y+tfu0y4W7b6Pq6Ud+L0VQtcj9sKgW3B9jlPrqcTjPakTAksde44oQA8C4Q/ftv4SToIesO0WcrVs6zye4g374GylXKxIK3XuJWUbeiWjyRRCq9vVGgNynpczsavWfUAGjQ4MkTdzAnbqBjUM5KFxLWSf9gQ392fzd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329333; c=relaxed/simple;
	bh=djY/qEnvJwAh4Mv+PxkSPSC/UKvrs/iSznQm8r1ej3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MT8xyJcijP4w6Mf865xxN0+1N5rAYfYGttZRXNWX8lULxOB24waxiJflAxpmGzhftAfc/hA4KWkDvL098H8aUjb4knDZv/N0iMGpRznUZIYX8rnxrXrFaydzi+fDs7LtXdhA3CBxfVJeuPNdIVLlTUh7p3qOfeo0KQTvm7MaScI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B3IHf9X+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B3IHf9X+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55BBC19421;
	Sun,  1 Mar 2026 01:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329333;
	bh=djY/qEnvJwAh4Mv+PxkSPSC/UKvrs/iSznQm8r1ej3o=;
	h=From:To:Cc:Subject:Date:From;
	b=B3IHf9X+zmxk6tmnCPhQ+ZvXD6nU1JxAn6D6HxoFvCRsn1oNNXGJtJCrrx/euynWH
	 ARXiHHGVzwIcBRIsJ7v05myBlzBOqCyn72hgJ1r9sPVVXvfTl5eegt4knQpbjYXBce
	 sd2aLlXZ+XjYZv8OAzKh7ZcL6czD7uHsoZ5nCx/mToXPllgudNxeZhznTMqReGrlHL
	 NE+zqP8o5cBjRcf1iJ6g6kMav2SRrt3Ummp6VzFh8I6ZxtTQbPVRVAhAy2urDlClYZ
	 q+81Qz06oKfWm9MbsgW/XaH6/kvv/pSWyyOYv4J5I1xYKZMjV38YRG/qB+48J4I9ma
	 5ydpsfz7ONMLQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hanguidong02@gmail.com
Cc: Qiu-ji Chen <chenqiuji666@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
	driver-core@lists.linux.dev
Subject: FAILED: Patch "driver core: enforce device_lock for driver_match_device()" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:42:11 -0500
Message-ID: <20260301014211.1703992-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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




