Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1352DB78B;
	Sat, 18 Apr 2026 16:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776529349; cv=none; b=DrO7EZkuaohyMo7w9FnurZGVn4ZDSaLSW1x0y1gg3vHMWiqjiz3WyJUrJ5VH3kXAgP3Sma8ZLGIw8+UtNx1rtUwDgKWN23DsOpxLAnHJH+y7Jchxbf7naYSZdRolTIMCymXS0iQl4sSYFmFc+jdxgbNbIp5m97KWr7tDGavt4TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776529349; c=relaxed/simple;
	bh=PswHVbHtH9imVCnuyWxVZ9hWTCCTHUzCVk1/nGwP2PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H453LmXp6S5CxPGMcy4CYuacCrmzK6U0hLTcQZtvxFWf83xBuXss4NaO8ViiNPdHnZZLWbiK6G5ox7wDZ6ycHLTgwfchPkXgIdq5vKW6e7uD0jBP4XaGgZQjWvSnPZkCReFrtMI0nhyvy+vwPzToO6VF08Yqofc5xMk9JpOW6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ja7utCVG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ja7utCVG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C049AC19424;
	Sat, 18 Apr 2026 16:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776529349;
	bh=PswHVbHtH9imVCnuyWxVZ9hWTCCTHUzCVk1/nGwP2PE=;
	h=From:To:Cc:Subject:Date:From;
	b=Ja7utCVGzOqrrirFqmtbR+rRtB8vYEZ9+HAPa7W3QZoMxvBJk/1rvhUnISt9jY4B2
	 qzt6xdvwTSAXn+RrhB4aPC4h2+ws9AH+d3kMe1nlSyV0P9vhvLLiyLGJmKH7Y1JDUX
	 StaUq3E48zJZyAJPRM5zEPjdwp/t+tkFyPtEpH2NxiKEEYLKYVpnQQaVTTqw3r91CP
	 +MGkw3dVg4Fkx/58gQo02IvWyy3OxCBiP5EsKoJ/JHvMKSLNDWPNhzcmyRlT41IhAd
	 8IWsZP8fF8lkUNc+oogbVRcxH/lik8JwGtDmESQWcVQevyj48XQApzlF2dm1n5NZ0W
	 xptcElkyXRexA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	saravanak@kernel.org,
	ulf.hansson@linaro.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
Date: Sat, 18 Apr 2026 18:22:18 +0200
Message-ID: <20260418162221.1121873-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_has_sync_state() reads dev->driver twice without holding
device_lock() -- once for the NULL check and once to dereference
->sync_state. Some callers only hold device_links_write_lock, which
doesn't prevent a concurrent unbind from clearing dev->driver via
device_unbind_cleanup().

Fix it by reading dev->driver exactly once with READ_ONCE(), pairing
with the WRITE_ONCE() in device_set_driver().

Link: https://lore.kernel.org/driver-core/DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org/
Fixes: ac338acf514e ("driver core: Add dev_has_sync_state()")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 include/linux/device.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index ac972e7bead4..4c1c9cb8570a 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1018,9 +1018,12 @@ static inline void device_lock_assert(struct device *dev)
 
 static inline bool dev_has_sync_state(struct device *dev)
 {
+	struct device_driver *drv;
+
 	if (!dev)
 		return false;
-	if (dev->driver && dev->driver->sync_state)
+	drv = READ_ONCE(dev->driver);
+	if (drv && drv->sync_state)
 		return true;
 	if (dev->bus && dev->bus->sync_state)
 		return true;

base-commit: 5b484311507b5d403c1f7a45f6aa3778549e268b
-- 
2.53.0

