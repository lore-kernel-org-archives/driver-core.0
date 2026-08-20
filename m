Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A3F3C7DF5
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211946; cv=none; b=PhbH//Fs83mF/RwZqAD4uR98s/+uLFQpN6g4RjEG/DdPvD5JJwnrL26bKuQO0yLFFT9TJ3xyy+ueInAQ6M0bPWOouj2O5SH3DmIa9OMd5kIj94SV1QFW9Gi5q+2J6CNCIa0amMFYfsGRzdxV6rfvb/skfVWB+S0biJztWxcJqVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211946; c=relaxed/simple;
	bh=Mi6gMMTrdKEbNJ15AQPXdegSQJ+6Xj0ZZ+yiyd1qRJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DBSRKXfw18TFJsZnJ4LbqzW3S99OU73j32YHiNB5JevS2hw+8MI+oNN7641CWdJ2ei0NKOcEUUutSVf+DPIPbAtmtT0kxMLdncW3XJKq3RgzuU9R7+VvRu/o20DBpHC5mCSn5hpM+POMs++aHsh25ngHMfCaixYMvnBwXv+Q1dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDiUQcoD; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDiUQcoD"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1964600a91.0
        for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787211944; x=1787816744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFG3aPxSt6p7E5MMT2TB/oV3PiYeyY1S0Plz/2+PJGY=;
        b=kDiUQcoDw64L0Q+4PrL0DBzpj/j4SEvMbaQQoG0Jy7DlOB93+gfK96N2fMUW1DhYe3
         sR5D0r1/BFNqfktjq23nAPChhwW2Wf7o8jLsxeE2V5l8QPmWMQG1rmuhWe10tSELSfU3
         8J2pYb/P2qlGHQmtw9qjKXsuu9xId6dK7fwyAGd93+JC+XOV2km8AXn8Geqy3zNBX2XB
         GNlRJWmsZPQtVaV8wq1OyhQOcZlNOhD6NVKfwrGpyHkzhcYMX+uZULeiRHX/n3m4ZRCZ
         3fBU4zCTTzwg2fQ/brF129d7jH5RMYj/hxfwD1MkWBoXUFWNJROMMS4xbEYUi3hezTsG
         Dxxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787211944; x=1787816744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HFG3aPxSt6p7E5MMT2TB/oV3PiYeyY1S0Plz/2+PJGY=;
        b=ZtKTNLrOJNfyPj58lF8V/udysjda3+4H/Fob+il3AHDWimvp1siVq9GSwrk3f91rhe
         QF5K08rc/lcDym0ttGQghO0jLD1cXNKT6rNyQmTyzb1e6TjBIG5yGP3wNqn4xbb0f9lN
         k+L+CVuXHfpb/ZC38zR+lg6mgFB/1nHgcJSgGDF4C6kR1DUsKBh2JdRP5jwfsaPI+Vp4
         3pdRyhzM96j4SLpxlTvx3TfebxNkaiJ4+JixsIX6vQNiWdxCJTfXUzbk4dTsOATR2tUg
         Zth+rx+a5+H9x4OuGwmuyV37X0L7IINs1JP6IuqC05mEHyyOSdadjHlabHxBEWBWffne
         C65g==
X-Forwarded-Encrypted: i=1; AHgh+Ro1IlsNw8BuTpENnK09nIMKCZ3osLTP9ntkMx3wfh65VYxhC++0qVkIoCMQ8Cxx2H/nV6ZiHJ5PRpiHvA==@lists.linux.dev
X-Gm-Message-State: AFuF++kV3+L0GChdZjXqd655j/QNWThqkhxA7i6K2EZbO5xbBiSf/RG4
	IsYVwtLMZkOIbBnhqaUKzBCfKRjXkqez0wqA8knnC8fG9PiiTVQbBKjI2JFtTmmB
X-Gm-Gg: AR+sD1072028JTx2i0mXvH4NltqKsbK0P90fMvf5GDx2i+mz5qWTsqVsra4l1rQVjuD
	9Jio0xy3QGZGc4lMOF1ROVqgsfDmUtMxnvktUrRsPJmP84vd83Nf8sNXqXG5mcfiFNRlQ7kqFkB
	xhsqG3H6Ad4BxomFvVm7YaYhJ2ruf/hvVxx09grSXa5WGIm/DByZOF8cgzwA06OL9154OPljveA
	KHKichmCM0jjehQTVL4DJSb1qlybpSOgy9ot5shRo2yE7o76O3nHrSkXUsIlQB5xp5HRnwcxfdP
	yRreUl2y8hGCUqURA9bjhL8cw6cw9MoLr4HGCmzOzVyyupneprmh+JETdcoc2zrBTJQ6vxoI0AD
	BjurRZMNVXRSbjfPXFUX+4A0+XgFWpggwScSxF9H02S4mYrLSwR4++WUKDpVjbnRqjlLQJaFGic
	HkmZIIXW/PYP7acZ2xxVDVU9bO2kR1SynV5e9t1aKtZIpEJvraLloj0a1YD/74mNLtUg51iyUaB
	WKA8zetU811T+UkWiW/bJK4
X-Received: by 2002:a17:90a:da90:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-39580a91ae0mr21482680a91.1.1787211943660;
        Thu, 20 Aug 2026 00:45:43 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad69638sm12848089c88.7.2026.08.20.00.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 00:45:43 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Subject: [PATCH v3] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 15:45:38 +0800
Message-Id: <20260820074538.102158-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026082048-malformed-finite-4e61@gregkh>
References: <2026082048-malformed-finite-4e61@gregkh>
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
Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
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

