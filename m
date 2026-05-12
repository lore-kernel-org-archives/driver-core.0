Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B3E3D1ABA
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603970; cv=none; b=JLqh1KudFHgCo8GatiJhqDmTWYNmLESBSddTK9Gv76vjglnqzZqpn1WaRRnfzqLjKs47aRywMj41FnlnzEjr/vHjRNatHEuP8losITLTGYON1QuPVKSUY61WzK6E0Am6z0wVqhRZBn09GenKfFnPMwRBANXkMgw4o2DrBwKybo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603970; c=relaxed/simple;
	bh=vqKSWoKvW5QRnRu+bO9tguWyf/3swh3oVBfCT9wypb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nlCajaqEwBMMRZeSWzKuCN5hiLICfB7CR/uljKYRRe7s3mFy4yFUkujKLnRXgeS7h3WwgmxZoureMN4b/I0/Duv2X0SUWrBrB6Gh3imcSaT0aZhtcF70QVqo95FOLvX5L4vn4yybJaKtfIdbBoZp7RTtZBMYUAWEFh2OqJ24l2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fPUz1Kzf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fPUz1Kzf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778603956;
	bh=vqKSWoKvW5QRnRu+bO9tguWyf/3swh3oVBfCT9wypb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fPUz1Kzfeh6Zwq2WuMmi/P8FrWF62c6gCNko29LHYn6giymcRBVMWadCzXRm2X6Vy
	 LNZyrqk7B7bXcCyt7eYZUdY9zVEa6yWURo4bf5bJXrwUaTZMQmTEWVC7E72p7WqkxI
	 t5zsyLWSL0cMhwkJYs8u0SWk+M4Wva/23CRKm14w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 May 2026 18:39:11 +0200
Subject: [PATCH v3 1/5] driver core: Delete DEVICE_ATTR_PREALLOC()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-sysfs-const-attr-device_attr-prep-v3-1-cb7c17b34d52@weissschuh.net>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
In-Reply-To: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778603956; l=1296;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vqKSWoKvW5QRnRu+bO9tguWyf/3swh3oVBfCT9wypb8=;
 b=gu/REruyP7/wOXLhV04RqczWgg62iirHTzFcP5uZtjP/Z84JdokDPsoJKAXIOal8zKgwNwblG
 pK1ntZ6lcA9BqMDM9N7/JSYarg1a3BwIkttIQGAMoJcfVHNVjuNvdEG
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

