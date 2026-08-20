Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CD435C1B0
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787215563; cv=none; b=hhIPPoNWIM/xqRfzcc7cxCDTcuMdYuHErEtMj4dj9V5k5/b9WU878/S7o8V+lIDIbMjt1USlpCOcmsZeQGoe6GWTWEoj2zMs7xcr+KW6G3tMxx9eh3VL4diQu9WXb+C3G6vH9SWqtJ7phs0MVwN0OZy1DYeGoknjdw+V+LvgBvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787215563; c=relaxed/simple;
	bh=HahRdRZ7rEXECKhD0wf0GCLX8sapc833UetJWo8hm5Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gAYiBfSfu8phKBGhGlnW5bX0Yf8Mxo7VVOEo2zn2i86S8tatoZXjlKWl0dJo16P7knOZU4rygotBQxPbnbuPfD7cU7KtCPuvpmetzureB59GK5/jestoZspfVNyryK+4G4Sl4S6wTkCYyz2m2Q3zDB8ktI6gsAGRhIiE006/TaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdJ5JqGb; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdJ5JqGb"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf52d15d88so15125965ad.2
        for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787215562; x=1787820362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UIptc2Pyic8RLfsRCuTURjR3M5LHBGZIonYSyw9G1vs=;
        b=NdJ5JqGbAdRjarEvYSt43PBcF8TJxmYVZ8RaRdxTcK9yRVLQ8rxkvpyW8qzUD+5eTB
         x39VNWblq7PyyORU13PB+iPn/TJhwNPe0wSxA8du/yE7Ce+PygYCeV1niBicNQV3Ne2k
         NJ2zYLmKtJb8/RZYVqlWX7/7WZlwUH1YkjthPpEF77V6XEyJAtLjTmG8Zgwt9O5eiNO7
         r23pWZ7LI7oGWXI6GH6Til+7dvI+O+koMqJb/S3tL3GMljvIIhBpq7J24PTIt7svoyc4
         yBe6d3oMPnhaL4Y7zbGiLrJwPG+A6W8SLaEGXJxpm4q9KYam/09RedJMEDM2LYV1AOT/
         F6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215562; x=1787820362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UIptc2Pyic8RLfsRCuTURjR3M5LHBGZIonYSyw9G1vs=;
        b=p5q8IxS0KB3+AOPUQ38wnSd1ZKK8YNb/jfz3LUiU4NqymG4IkhedkhgzHYzuyzJrch
         bCtdRDBfjTzI3HEPJqlUQJW4LRKF2ahphOKuoXrfPvpB6b6eiWhdtFK4HP/N9P90xvd/
         y9y7vLACGrxc4Z3Sj2EQXcOPgD9RIqklAzBUOdYywFQA1R+YAThdxN82J0HUScp8D1dH
         kUvwDJ3En5Syo5Rhf+6HktSeCdBdddCHcecOWx4S/GSXa8nQIbbuGjPMApI5xT7oIwLV
         lUdPTxymkcBE1hQur89j6fuxrPaaX/6texoBvrSbPlVNrXqBzuD75Yu1KpR2QpCXXlQJ
         LY9A==
X-Forwarded-Encrypted: i=1; AHgh+RoMYfYXAyHpsl7V0wZHvpR9I6pbImxq19FYN6bws4Hg0lSX8IB19JarXQm1UKw8BRyo0E5wC7kKSJKixw==@lists.linux.dev
X-Gm-Message-State: AFuF++mIuNz/bQDr9QKjE6qeq/z7msISzduf5eGXNbT3GfNomiBFtfOb
	c2PUkcrY+guq7oRdv6LHC9yovG1nMNRH/rwUYb0pTfjx9nrXkYFkTjy+
X-Gm-Gg: AR+sD13qj6mlbEqCBXWIhI+hy4GWR9j5mwu78c4u9dyscaho8KFWQIyQ5ecvHVLnQ0J
	mGMl3dnILdali9oHvpMRXioJg3TnEfEYLto0Sh7C8oteX1rONkzTK8y3oDaZZv0oaJFwxDJ5LY2
	VjJcBHriqFxyk85BqZjGfwI2SmzXNLFpXKYbNfNlPHZRPqgG6UCpuH6n0vrfDUag133uxrkgcr3
	GYLDPDaN5AJP3l0Eli6oHezNd4lRwgRjzhMXvYHWLA3TWXIsUNeE3Ufuwk8bUtzBLoNrNN1ehSu
	Hk3EQBocttEIwGpEslooxrL3V5EU2TVMFj65tFefHtXdFR4jr2ItdRKN088hy5C19IbxLLFyHYf
	nwuc4dTNN5jiVzjhMSP6Ed8ZR4nCo6i+go2EYjo6j5bZZrmIigfDVCbMM3k2bZBtEW+Q5g5P8EM
	8RTHpI+EsBoLcxRqXm8IBVoEMhB2ZaQXRJ2LdCUf6a3XMz0ilWjg/JSMzrWHA7P+jVZCFhZgHlw
	yI0n3yZg9ikFXta5IrUAQMM
X-Received: by 2002:a17:902:d4c6:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2d5fd5b0008mr184056225ad.3.1787215561696;
        Thu, 20 Aug 2026 01:46:01 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf173b02sm14731169eec.27.2026.08.20.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:46:01 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH v4] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 16:45:57 +0800
Message-Id: <20260820084557.129908-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026082042-coma-moody-5b4e@gregkh>
References: <2026082042-coma-moody-5b4e@gregkh>
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

Only remove the node if the device is actually bound. Use
device_is_bound() rather than klist_node_attached() directly: the
latter is a raw klist API and does not NULL-check dev->p, while
device_is_bound() is the standard bound-state check used throughout
driver core (driver_bound(), __device_attach()).

Fixes: 94e7b1c5ff20 ("[PATCH] Add a klist to struct device_driver for the devices bound to it.")
Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
Cc: stable@vger.kernel.org
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
---
Changes in v4:
- add a changelog below the --- line, as required by submitting-patches.rst
- add Cc: stable@vger.kernel.org, Fixes: points to a released kernel

Changes in v3:
- document in the commit message why device_is_bound() is used instead
  of klist_node_attached()
- add Fixes: tag

Changes in v2:
- use device_is_bound() instead of klist_node_attached() as the bound
  check, per review
---
 drivers/base/dd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 60c005223..4154b4499 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
 		device_unbind_cleanup(dev);
 		device_links_driver_cleanup(dev);
 
-		klist_remove(&dev->p->knode_driver);
+		if (device_is_bound(dev))
+			klist_remove(&dev->p->knode_driver);
 		device_pm_check_callbacks(dev);
 
 		bus_notify(dev, BUS_NOTIFY_UNBOUND_DRIVER);
-- 
2.34.1

