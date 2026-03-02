Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA41AF0BB;
	Mon,  2 Mar 2026 00:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772411154; cv=none; b=rVf9x4hcpGcCd1WyzjBdTxqQF65PTFgNEK+l5+ruWvPOSaAahhYU8zAnIvRH3cD61GS7M83WCAcWQoqccvLjCk8m4VbNqa6aWYbhb8+8OQp4Wt8EdG0dn0do86CmjZ7br7erz2BjWYxnpQEm5ugfKM4AN9Mi+qXpJqKMH8Y1Jh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772411154; c=relaxed/simple;
	bh=TDEhXd11cR51GDP0QqDHnYdZQkIkfYsepv1jnvN8yKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LdRG/+2atgQcEs4MWx7rj0K341guUQr7KrtfKTGeIGL90jdduXN27G+8X9wAXUuOCVUGqMKV/uUHQ+VXTfbBl1+ssHIRcyxFtvu4xggmMCU4xIN38/l+inRv8bFpu9LoACRRV09wxDG8Bp/+oEcrN/2pP1XhRXiuIpbGDdp1hEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mc7M68oh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mc7M68oh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10549C116C6;
	Mon,  2 Mar 2026 00:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772411153;
	bh=TDEhXd11cR51GDP0QqDHnYdZQkIkfYsepv1jnvN8yKE=;
	h=From:To:Cc:Subject:Date:From;
	b=mc7M68oh9125f0Tqq+X2U0Dl/TazQZOteUIeiovyU/EZcTVmY1tA6nm2/owzFyiav
	 4kte5LszaihOEpfwQ+2IrEKv3kPvZ2H4lu97EZbVV0/778SnPxh7rZQoJqZO9G2CR1
	 wFRt/twpzim7HCxsXl4hSPqV9j8iqokpczavK6fugKS02rqD5AdM3IYCVQ7wYevEjL
	 FAupt4pltPSTWrvV7GpS0CN9eyA5tcGVdNVNbcnPv45I75tx8zB9IH9FF5pQ6VOp4j
	 Ub4Q4othyYl1sDyp0SB5z7GuD442XwSvMmW4IiPwGOzpcb1M91H05mNKsKEuTtHUVR
	 CI3yujqklqX7Q==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] Revert "driver core: enforce device_lock for driver_match_device()"
Date: Mon,  2 Mar 2026 01:25:44 +0100
Message-ID: <20260302002545.19389-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit dc23806a7c47 ("driver core: enforce device_lock for
driver_match_device()") and commit 289b14592cef ("driver core: fix
inverted "locked" suffix of driver_match_device()").

While technically correct, there is a major downside to this approach:

When a device is already present in the system and a driver is
registered on the same bus, we iterate over all devices registered on
this bus to see if one of them matches. If we come across an already
bound one where the corresponding driver crashed while holding the
device lock (e.g. in probe()) we can't make any progress anymore.

However, drivers are typically the least tested code in the kernel and
hence it is a case that is likely to happen regularly. Besides hurting
developer ergonomics, it potentially decreases chances of shutting
things down cleanly and obtaining logs in production environments as
well. [1]

This came up in the context of a firewire bug, which only in combination
with the reverted commit, caused the machine to hang. [2]

Thus, revert commit dc23806a7c47 ("driver core: enforce device_lock for
driver_match_device()") and add a brief note clarifying that an
implementer of struct bus_type must not expect match() to be called with
the device lock held.

Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
Link: https://lore.kernel.org/all/67f655bb-4d81-4609-b008-68d200255dd2@davidgow.net/ [2]
Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Closes: https://lore.kernel.org/driver-core/CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h        | 11 +----------
 drivers/base/dd.c          |  2 +-
 include/linux/device/bus.h |  2 ++
 3 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 79d031d2d845..1af95ac68b77 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -179,19 +179,10 @@ void device_release_driver_internal(struct device *dev, const struct device_driv
 void driver_detach(const struct device_driver *drv);
 void driver_deferred_probe_del(struct device *dev);
 void device_set_deferred_probe_reason(const struct device *dev, struct va_format *vaf);
-static inline int driver_match_device_locked(const struct device_driver *drv,
-					     struct device *dev)
-{
-	device_lock_assert(dev);
-
-	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
-}
-
 static inline int driver_match_device(const struct device_driver *drv,
 				      struct device *dev)
 {
-	guard(device)(dev);
-	return driver_match_device_locked(drv, dev);
+	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
 static inline void dev_sync_state(struct device *dev)
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 0354f209529c..bea8da5f8a3a 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -928,7 +928,7 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 	bool async_allowed;
 	int ret;
 
-	ret = driver_match_device_locked(drv, dev);
+	ret = driver_match_device(drv, dev);
 	if (ret == 0) {
 		/* no match */
 		return 0;
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 99c3c83ea520..63de5f053c33 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -35,6 +35,8 @@ struct fwnode_handle;
  *		otherwise. It may also return error code if determining that
  *		the driver supports the device is not possible. In case of
  *		-EPROBE_DEFER it will queue the device for deferred probing.
+ *		Note: This callback may be invoked with or without the device
+ *		lock held.
  * @uevent:	Called when a device is added, removed, or a few other things
  *		that generate uevents to add the environment variables.
  * @probe:	Called when a new device or driver add to this bus, and callback

base-commit: 78437ab3b769f80526416570f60173c89858dd84
-- 
2.53.0

