Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB043783B1
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 19:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676653; cv=none; b=A7PaDLx/C6e7jleb6xu3RuUEOzaEzAU/nsFh3wlsqSS9AFPoF3weFEeMEZ6ToZEXfonB43HvAoboWmg1CaIMHjzTSG2BmMLNObSdVKNtiYy/FvJJBxAlbSVMldNQdQj5XiT49EznB7TME/g1JXkob7chEK9PtOxcHjBd6SucZgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676653; c=relaxed/simple;
	bh=Hbu+TXaOs92MaW0sZBsTU7SFGXW+DhMU4DUSLJtYWbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ns2nOtFDlfRa/ff6bivvwT7bzfstZn6g49R9HjgkKuirjXGw5UgzJm06BMwkVeJptixrhdr1ooAKB6yVyp/vEsHgwoK+8apCwax7Q93rtzcFZ3iVkXBixw+dVDKJh4gd4zT+Dob/hVcEgkks/sAs5VffXVDOG7zB5vUMY3hYEyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XGlUgE8W; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XGlUgE8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775676649;
	bh=Hbu+TXaOs92MaW0sZBsTU7SFGXW+DhMU4DUSLJtYWbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XGlUgE8WkCUfkxr6XfIR181+ufwRBbuACP3RGScb7kqSMZBxhjO3iHeX1nm4lUJrC
	 3PapUeF9seelvZIZwsoOheBP5fTBBv+AgEFcC33NBxDXb/7CHheXsbIGCCEDkwvIUv
	 UL69xKi7gVGUEoEkDSKV5t+os1GBry/4pRL/7VpM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 21:30:47 +0200
Subject: [PATCH 1/5] driver core: Delete DEVICE_ATTR_PREALLOC()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-sysfs-const-attr-device_attr-prep-v1-1-232934f77b3c@weissschuh.net>
References: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
In-Reply-To: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775676649; l=1296;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Hbu+TXaOs92MaW0sZBsTU7SFGXW+DhMU4DUSLJtYWbY=;
 b=+s8VdIUIDNVP/4EoxKvH5UfNlDCKroQnBni/BzC9hjufFwzCgbYLCCzTqAjszxmYRQGvkTbjI
 +vb3HmPcZLiAM06UobZH2HJnQI62hGYn3jZbB7/i28yH41GS6huVSTU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

This macro is unused and would create extra work during the upcoming
constification of device attributes. Remove it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/device.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index f0d52e1a6e07..8ba3168180e5 100644
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
2.53.0

