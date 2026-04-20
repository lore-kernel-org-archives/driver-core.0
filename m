Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CD43939CE;
	Mon, 20 Apr 2026 23:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776728517; cv=none; b=Aik9UgaGg1h3Yj7pZvPtuZJ0Qpl0RB+hhtcDHT3WYnHCnTYPm31MhHRihf7m0xEkh4gA0mrgRVMtZyhi9iSmtp4FWNKkeyInv0BNv9Cotwox2Uh03Aog0++fUDL7OTXD7O4tQgJOAk3sbA9ysxaXek4ra2vxVEDI0s2nCkGUDFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776728517; c=relaxed/simple;
	bh=B0TlKMuDdiJHeCmN37i5MVT0ChCKa2sA7jCh28qSv6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYLtCL+GHcve6lmJHVwC7dTP7387c8JScjwh/iHO8knMFUXO8ok/o2ARcR023k3BMoYrRHXmyPLEqFg6BW7Aa27FI+vhqwHbIftpFGLbak3CVVvNqckXJeMx1tfDRVrLDNTbQiBi1Vd8jPG0EunlGQxfDHsfh3+3i62OdZpMtQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FUUWar8M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FUUWar8M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461F4C19425;
	Mon, 20 Apr 2026 23:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776728517;
	bh=B0TlKMuDdiJHeCmN37i5MVT0ChCKa2sA7jCh28qSv6U=;
	h=From:To:Cc:Subject:Date:From;
	b=FUUWar8MvnCZkdxH5iolg3ydGpz/U8JMdYd6M7PsFKuXKbJtwA13BrFiIysQ6csgM
	 1jk4NNUyD70dNdj7fqdHLvGpIBG/rP+UQGg3ESGFQDFgfLlNywneaePs/zmFgElyFX
	 ttNnJ9nOOZR5BUUhAXiDqA0aOf2BhIANRJ6wzTvcxqSVOM8rTNCBdizBOUlg3fUvVI
	 2rIzRzCFhXDcc5xiQ1Z94ZAnT4J839TbjnN3nqD+rSLmD0DE0ePT8mUQsU59moqYGO
	 k7AM7tRNm6xs5iLdWz24ry3lzvp1RG5oBrc571JRfdjF4idf8DpTnXsKdzBmsm0mj7
	 4Y53bYO0yAszQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] driver core: move dev_has_sync_state() to drivers/base/base.h
Date: Tue, 21 Apr 2026 01:40:44 +0200
Message-ID: <20260420234153.2898532-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All callers of dev_has_sync_state() are in drivers/base/ and any attempt
to use it outside of driver-core should require good justification, so
there is no need to have it defined in include/linux/device.h.

Thus, move it to drivers/base/base.h.

Suggested-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Link: https://lore.kernel.org/driver-core/CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Goes on top of [1].

[1] https://lore.kernel.org/driver-core/20260418162221.1121873-1-dakr@kernel.org/
---
 drivers/base/base.h    | 14 ++++++++++++++
 include/linux/device.h | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 1af95ac68b77..f3c615c9198b 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -185,6 +185,20 @@ static inline int driver_match_device(const struct device_driver *drv,
 	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
+static inline bool dev_has_sync_state(struct device *dev)
+{
+	struct device_driver *drv;
+
+	if (!dev)
+		return false;
+	drv = READ_ONCE(dev->driver);
+	if (drv && drv->sync_state)
+		return true;
+	if (dev->bus && dev->bus->sync_state)
+		return true;
+	return false;
+}
+
 static inline void dev_sync_state(struct device *dev)
 {
 	if (dev->bus->sync_state)
diff --git a/include/linux/device.h b/include/linux/device.h
index 4c1c9cb8570a..82823f807f56 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1016,20 +1016,6 @@ static inline void device_lock_assert(struct device *dev)
 	lockdep_assert_held(&dev->mutex);
 }
 
-static inline bool dev_has_sync_state(struct device *dev)
-{
-	struct device_driver *drv;
-
-	if (!dev)
-		return false;
-	drv = READ_ONCE(dev->driver);
-	if (drv && drv->sync_state)
-		return true;
-	if (dev->bus && dev->bus->sync_state)
-		return true;
-	return false;
-}
-
 static inline int dev_set_drv_sync_state(struct device *dev,
 					 void (*fn)(struct device *dev))
 {
-- 
2.53.0

