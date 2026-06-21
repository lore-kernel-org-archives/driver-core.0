Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B18221D96
	for <driver-core@lists.linux.dev>; Sun, 21 Jun 2026 07:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782028388; cv=none; b=Sz7fX7nqPL3F2hjwAZuhigeQ6pVRH89ycpeYCGCTE1SQ/SShvXjfuA7SkOxeG+UkdCvZBNr0ifc8ulnQTvq3R8yjjOs0jWg1FF9CEOC+I1uUENCVhVHUd4+MJ6Waz60gBxq9KDf+QeN6O5eF34P1xToFx9gAoHEbF5WBJo3MVHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782028388; c=relaxed/simple;
	bh=Yjfr8i9peH+dLilQmqc/8O59n1ccGOSP2xDSVFxsrtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kb8mKkyZnBciHh+DyG8SHA+5E0jPic35Ic+SDUF42kkeVN3+5kvStDfQthQcgnDMn3PyP1ZV0qbM+gVu89orscdXN17gGA6vTxuSGfY8/YgW5Ub2iGh0pwx9Uze/R9fWN14aWvTyNzGV5E/hf/UIhJs1vO+XcRo54JmlsEml1ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FNuR70qa; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FNuR70qa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782028384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/Z7kxgVsh++vUkQMJdEVHcvhtbTdNwrwXFde18Hfa0A=;
	b=FNuR70qaIEWK7jqcVorLr4bOnC4bTNryiR2YFyKdfaQPaQPj0FdZDi3pt0aU5ExoQtjrfP
	3rc61XFVNxgfOetlkAJFgRgCS2XTo9HAOwIPoVpkJEePuVLI/2TZih9SfPbBUYUClWPKpy
	DDtr5Ivrd0mNgxcrTwl2tNKjnV/wA6M=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	rdunlap@infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Subject: [PATCH] driver core: fix path of /sys/module in comment
Date: Sun, 21 Jun 2026 15:52:39 +0800
Message-ID: <20260621075239.11330-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The comment wrongly references to /sys/modules directory instead of
/sys/module. Fix it.

Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
---
 drivers/base/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/module.c b/drivers/base/module.c
index 218aaa096455..6789dca485ab 100644
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -42,7 +42,7 @@ int module_add_driver(struct module *mod, const struct device_driver *drv)
 	if (mod)
 		mk = &mod->mkobj;
 	else if (drv->mod_name) {
-		/* Lookup or create built-in module entry in /sys/modules */
+		/* Lookup or create built-in module entry in /sys/module */
 		mk = lookup_or_create_module_kobject(drv->mod_name);
 		if (mk) {
 			/* remember our module structure */
-- 
2.53.0

