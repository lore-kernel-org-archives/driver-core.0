Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9DC376BE8
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 05:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205309; cv=none; b=ls5YFGNXO5Dh0cXDJxE1w3UDlsfgIzg04IprxKIzQKqKWbii4x1evD/s/I9lUp65nN9r3mFfdzadNHpIeiU+VNvegQx0hFIuvuKLrd7r77PcHPJgC+Wu0jGN8C2M0cfS07YSdDTTOrYyLibcC9W24E+kK4yDxF+GxYDl9Pmaaxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205309; c=relaxed/simple;
	bh=Y0h9lW0LDoi9blqrw5CZKAZbEFc6aWRY8BXsuOuG93E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IyUyW96uqTiaYHl9DfiovpndBzpqUoO8qEXxsrnmfUJ2t6fK0gSIZyOYNxUs/Y7uCwkuhwhj/PrDm06N6ebXB+k+briDP5l8Nt3wKfDzQ33ywkbiw6VkL6fG4aQgflnE2i92Y5N+y9fup4L1fmnIHU5qcWrxyBt2Gqb8CgtZL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5J+oQQz; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5J+oQQz"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1381685a12.2
        for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 22:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787205307; x=1787810107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpFXM9w4VzG4DesbOqhO02EsB8OGin5A3lj0s1H0hy4=;
        b=j5J+oQQzoTFbSFYuFKo1/PVMtTaS0AaJGHAZ0FiNB2wvrBFWeJr4tq1ZNNIHySL4OP
         N7DJ7dyOCvdWqmlzoOSwskGRqFgdLJrQR3Pc5fHxEfe4R7nEJzf9577qIGpyuodPxQJc
         z3feVzzk/RRZO0HS38O/dVio6TlxMBfQi4BiHJ8fCY7p8pEpyCpsYUDNDSJFrVxphfkx
         lGG9dg5fANpnohXc7DN9q2+OxLaquqCTLk6OOiwOkIltyduHrdYlby2d48zew46Kyu8G
         3i9DP+hbGE8iTFAmb5A3KeNv/RVD+tusOwWLKSR7yv3DrrI6A6Gh9BAWgH2tpOxGQxx4
         6Ymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787205307; x=1787810107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpFXM9w4VzG4DesbOqhO02EsB8OGin5A3lj0s1H0hy4=;
        b=V3HWTF465s2fr0K+P9yHg1b0ShhLJwgPeYevxNzxW1bOGfDw6Svb9zdTdjmB40VRId
         ZhbMrsDdZxmtm1yDkicm1pv6KEG7z1wrYNy2hr2VVbbO7dD9Eo42Mx1uxW4BB99hHNGK
         b2Y2c3BDh0DNMuvKVzpIYmbjlk3LsVP/sZRr5DTLGmUesizomFzzLs50TuYuofUK7rFK
         UGJHV34YaqBUaZhinmGD2p06hfc3Ofgg00+pXy9L5eQ4blkPYoNyMcU0cL93PqMUwitd
         sI0K73iQWpMpkVm+g4swRpraEIexyZma+iSoCF5KGnaVOmJMdLICXTWdhD4wKs2zONsA
         yiNw==
X-Gm-Message-State: AOJu0YwoBB8DeAwJQtgUoou7Hr3JmDQItzAsQH1bs5FUh24kKnZegrlY
	nAobSdsAQig1yteXpvZynz8ORWUbL6xrufSslDfP1z2UqHUbzaa7DOsV
X-Gm-Gg: AR+sD12JVxKxjF7TtKLPxKdzhTLXcUSViMUFOsQl19E4PPePBsMtHYx+7XJAGLiwOU4
	ypSC9IDq7T33g3ydw1qrqBL7FNbprpCklq7lIwQjNLETmH+VicJaKNrAfMwd8u7sm3SIq2mPDZH
	uVxFe9lN9Rq5s1t+LWwAcp73TtIZ+zbqwJAtx/3FOL509feFtca7xfpADqQl2p1HYlwRpSjrAHh
	6EO6cBjeHJBNyuNVAnnkEaJo6RxGYmdmMRiEqWLU+qPJiatqIMEy0uLGhixXBEX2Fzcqa8RByur
	eTWo+U23xE84IUy0FvH7oI2iSO76iroWbmBkf1bLPPqHqNVdkdZe+pkaRQS1SPxCIiZ9KAgdsTy
	fG/EQFDzC3sH5BrRWNhq09UOqiwKc5JLU8e4vsShnZGa8Or0s8WOAdw+dh1xi/gqgniBMXLzVms
	XJNDFc55MvrZRAgcQglDjIDuN+AxjFLV1TXbgUBpi1xiq5jhoxOqDwmIsX7hXF75SZiJBboL6hh
	K3wyd0OU6tHKUtmu/OaCdaM
X-Received: by 2002:a05:6a21:3382:b0:3c3:8d86:9856 with SMTP id adf61e73a8af0-3cd0128b46cmr19378726637.14.1787205307341;
        Wed, 19 Aug 2026 22:55:07 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad3d708sm11312936c88.1.2026.08.19.22.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:55:06 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Subject: [PATCH] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 13:55:02 +0800
Message-Id: <20260820055502.49963-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_driver_claim_interface() sets dev->driver directly and skips
device_bind_driver() when the interface is not yet registered, so the
device can reach teardown with dev->driver set but knode_driver never
added to the driver's klist_devices. __device_release_driver() then
unconditionally calls klist_remove() on the unattached node, which
dereferences a NULL klist pointer in klist_put() and crashes.

Guard the klist_remove() with klist_node_attached(), mirroring the
existing check in bus_remove_device() for knode_bus.

Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223..14752a5e5 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
 		device_unbind_cleanup(dev);
 		device_links_driver_cleanup(dev);
 
-		klist_remove(&dev->p->knode_driver);
+		if (klist_node_attached(&dev->p->knode_driver))
+			klist_remove(&dev->p->knode_driver);
 		device_pm_check_callbacks(dev);
 
 		bus_notify(dev, BUS_NOTIFY_UNBOUND_DRIVER);
-- 
2.34.1

