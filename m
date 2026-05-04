Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292B728F5
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 05:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872838; cv=none; b=PBYeGGeni5t0XVb35qbaSWOTIjpw6W5ppNf5hLKlemGQwAP9FPjYjeXs2nXU55lzrHSCw7B3OjLi4DfnofHFYa0p42gyql7l22c3VVvpGOfDhG4MrLSswu7m1t7/IICLycIyETzrkI/g6tUMjAON3R8JTubuDSMzoe4xv0QoRoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872838; c=relaxed/simple;
	bh=vqKSWoKvW5QRnRu+bO9tguWyf/3swh3oVBfCT9wypb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HqgSh7NA/6c7WJ75/R80/eCi/sesTH8WZ442i/tYg4xFgjN4INKiYgwnhNSBFC2OJptO9v9NVSGfJggrI1GAepbjsVK1SQODaOFSra8dL46EakVS0UE+DzLrocTIFGjO42rzQPjxpCKJArQlAAM3rSW6dS6GhKxee3MU/Kg7WZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=tXrK8HqY; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="tXrK8HqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777872835;
	bh=vqKSWoKvW5QRnRu+bO9tguWyf/3swh3oVBfCT9wypb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tXrK8HqYr9422S1s3TpHYVoVIhoetw0/lFoOebtx2yoXvliJiGverjzTT54HmFWGf
	 8LYv9Y4IAkrdmyYWxX4yBcXYzsizFjSa9xGEphCTq7sQaOo4zFTR7y+GOQhzZ/RrhY
	 ud6nBwHeEA+v+aacjzEZTItAPcO2/IiwsVDw/iHw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 04 May 2026 07:33:50 +0200
Subject: [PATCH v2 1/5] driver core: Delete DEVICE_ATTR_PREALLOC()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-sysfs-const-attr-device_attr-prep-v2-1-79d291cb3071@weissschuh.net>
References: <20260504-sysfs-const-attr-device_attr-prep-v2-0-79d291cb3071@weissschuh.net>
In-Reply-To: <20260504-sysfs-const-attr-device_attr-prep-v2-0-79d291cb3071@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777872834; l=1296;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vqKSWoKvW5QRnRu+bO9tguWyf/3swh3oVBfCT9wypb8=;
 b=VOyN8/G3bJzSQBYc6LNER6bTbbXXjUiDxoWpuE3ubjXQHvyB/Jpcf7ES0utkSjW6qtvb4Ws9b
 cfdWH93bTPLD+rYbhoGGN0aZH1ogGuDqWv0djQedMKuCVlsrOkKd63O
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This macro is unused and would create extra work during the upcoming
constification of device attributes. Remove it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/device.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 9c8fde6a3d86..06ec4e27a1e1 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -157,19 +157,6 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR(_name, _mode, _show, _store) \
 	struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
 
-/**
- * DEVICE_ATTR_PREALLOC - Define a preallocated device attribute.
- * @_name: Attribute name.
- * @_mode: File mode.
- * @_show: Show handler. Optional, but mandatory if attribute is readable.
- * @_store: Store handler. Optional, but mandatory if attribute is writable.
- *
- * Like DEVICE_ATTR(), but ``SYSFS_PREALLOC`` is set on @_mode.
- */
-#define DEVICE_ATTR_PREALLOC(_name, _mode, _show, _store) \
-	struct device_attribute dev_attr_##_name = \
-		__ATTR_PREALLOC(_name, _mode, _show, _store)
-
 /**
  * DEVICE_ATTR_RW - Define a read-write device attribute.
  * @_name: Attribute name.

-- 
2.54.0

