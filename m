Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B413612E8
	for <driver-core@lists.linux.dev>; Thu, 14 May 2026 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778778917; cv=none; b=c+DWk2WCUcvhsjFx7EIjtqVVIn2ONyPbrKggjl11e32A10nwllPPtqDx9Oo/QC0BIqriEmBaT2V+g9RckiTLA55KuxWpUphXiF2wc/NYznUy7qqdtoblhmQGQ2NXc3Va+5ZbRKrIC0SOANya4CnYdBlL019zNGlzb8hBl5G+kbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778778917; c=relaxed/simple;
	bh=ivj++8EEc8JlI2w+Z2OFdOY8bVnTMVXsBXlbHYT0bAw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bvGHtI5RMCmRaefxHes6BIw1mmlDDAhCdTpwoh1YU+Tt0w11u/mggmlxpd7EIanr/k59sYiOh5GqMGyrW0HCIXuigyIU7s7jKXpdUz+y6B6a8Ukp2BGDoR5XdPc4tXwShhk51Ne6Q/IoPnCJWnKBLUpPHaDePSe3tXqv8pdsOCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btsE32n9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btsE32n9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48e69e60063so6997335e9.1
        for <driver-core@lists.linux.dev>; Thu, 14 May 2026 10:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778778913; x=1779383713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SacI+DuUhjcebVDrBlp90eiFYi0OuIGxxQMFGnDHmH4=;
        b=btsE32n9NxgKiOZJAoeNND3LdYGggBSJgLPUKsIoAuASlQXZ8ehYvNX8Hn8nBWSqoM
         08l8sYB1tYhHfy1CeWr/0uO5TrKly0+CESrf2mNh6iIZjVewGwTSHSDMu25TAny+Xl3E
         uyVyUS0dOh4PQCp2fkVhChc4PsF6KKN0U1F/KExw9gVFX4tcMtIFEVQTAsFpT0wRMCuP
         UPcVB6N/dhc+EwgOkah6dcwI/N4M13M3DrJe0VofOYNgLiItZpCw8ymb9krl7RPgcnHq
         POjMyEv2ZFq/Grlz+Vbae9xz/ESuJKusYpQMXfjxg7CKaso2iuFqmSXWQeT6Tl6HIdsf
         lOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778778913; x=1779383713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SacI+DuUhjcebVDrBlp90eiFYi0OuIGxxQMFGnDHmH4=;
        b=ghfk0+vNWiPGXk6kLXCxy+SCvJIYtTvZ+jyK2c5NuZBG59uzQ+TZ9pAEtCRNGVQnTz
         4tg6G0YOtej8+uomqb7x51zcsDfrrXQxV0V5lGk+Lt2uLfurJA0ZrUQ/R6tWKhfkJifW
         4bejjFdGAJqC3j0TF6JedzGYdtF4uGR7IxRofBGhzckbaHzLye5lbNGigN2pIW2sGskA
         6My+HBvAYD9l0MJrnQkO+Q3QPK9osLyOGrRxc3Exd+S0EKFFmC3OETgM63FB0O499bki
         eVx7hxORxBjATY0NcVS64J+Vij3OgZOmfklV4b/ob+HGSHH8lFXfF3gR5AAq7ON8Iq/7
         gbZg==
X-Forwarded-Encrypted: i=1; AFNElJ+zWrEsjG+UW3TlfPsPg2uTK/TA0RGZ1WRfGXYELfuCL/C00qg17rhD7fnPLP1TNfhJPAOZpQYf+AssiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwAo1dUWqe3EGGLInI/ZA2l/32Envgxa3l0zBQU2QRnD6HhAMEu
	0vtDRpLlPINSE58SVa9ojUmBfdQT3rDPFkzHLppIHieMI7xvdSFGw39r
X-Gm-Gg: Acq92OFJLEckXSKrjiQEhlnr4rcBl13r0DhAsoiH0Wl0YiOMeDn1+vkG8Su6+0xcxsy
	YufeDSqBZIAqe6f8XGt0wHc1QADWX88neN0oNSRnQEbucUt7nnoWE+bdwPZOLDt+Vwh5QQH+ipM
	r3k9wwPZIIsZ/sucU5wJRD9WhW3Lw+Q6gpReeJld6ZBsA3MneGdSp67jtfOo1nzuTauylgVH9NY
	Pu52YWC+6smMDDehqEbkxGneWvAzOgpGDal3PdoLyfMyaQU/NmshSTSA/sjeLp9rTqFyJlCOSYx
	5FAPIrGES43m3C1MhV4IT7udrFEEaNekzHNAuCw3Bu5IwTqIxpLjaYgb/DSV8NlZeFqTwX7Vfc8
	mK0+47ZjQ6dd8Vh1F5/Rwu30+/Tx3KpNWwGdTxBX1Y1O1UPCSFToCFumcLcjT0ChTLESl+9PmUX
	wTuaX73eQhjGauliyqIXduo/fvOGr69UO/tQm/hwED04HK
X-Received: by 2002:a05:600c:4504:b0:48a:5664:f44a with SMTP id 5b1f17b1804b1-48fe5fd16f6mr2252655e9.2.1778778913036;
        Thu, 14 May 2026 10:15:13 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c90b27sm6314265e9.8.2026.05.14.10.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:15:12 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: djrscally@gmail.com,
	heikki.krogerus@linux.intel.com,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH] device property: fix fwnode reference leak in fwnode_graph_get_endpoint_by_id()
Date: Thu, 14 May 2026 22:14:55 +0500
Message-Id: <20260514171455.27271-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When called with FWNODE_GRAPH_ENDPOINT_NEXT, the function walks every
endpoint under the requested port and, for any endpoint whose ID is
greater than or equal to the requested one, may store a fwnode
reference in best_ep via fwnode_handle_get(). If a later iteration
finds an exact-ID match, the function returns that endpoint directly
without dropping the reference held by best_ep, leaking it.

Drop the saved candidate before returning the exact-match endpoint.

This affects callers that use FWNODE_GRAPH_ENDPOINT_NEXT to ask for
the next endpoint with ID >= the requested one (used by a number of
media drivers, e.g. imx7/8, sun6i CSI, omap3isp, xilinx-csi2,
stm32-csi). Each leak retains a fwnode reference until reboot/unbind.

Fixes: 0fcc2bdc8aff ("device property: Add fwnode_graph_get_endpoint_by_id()")
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/base/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8e0148a37..e08eadd66 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1277,8 +1277,10 @@ fwnode_graph_get_endpoint_by_id(const struct fwnode_handle *fwnode,
 		if (fwnode_ep.port != port)
 			continue;
 
-		if (fwnode_ep.id == endpoint)
+		if (fwnode_ep.id == endpoint) {
+			fwnode_handle_put(best_ep);
 			return ep;
+		}
 
 		if (!endpoint_next)
 			continue;
-- 
2.43.0

