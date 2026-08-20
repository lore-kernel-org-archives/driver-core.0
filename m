Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342D63AE6E5
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205930; cv=none; b=KDTZrais6gqY9UwSRcJ9vkwWzh4TkcOk+/zQoK8Rhb5PKtybszKiS5DFd9T1LEHtzTxjarO5i2AbY3acjMABXeacP340cPAilYKuK6otbXokJ17FWqwlUSWJw9REuOpcroQtC6NY44s0UHAdxK7dFdG3PoTxPPgk7n0jX722esA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205930; c=relaxed/simple;
	bh=eYK1djFVTbyqKFaZU9HtFwqYRLhPnK5ncij6Xl1RjbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qkheaK5EdY7wn1yE92hkBCGLcQV4IlUzNywJK3sLHadFuZBrAPUjAZ+SSiincJLuRZkL8OnNv2zZUQRmTdJyXXkmFOTJyRKWLw1MRHT+zGfNad3KDTRPKiw1KPfh3WKuZ8oOw5VhlcDO+63Pbd/H+B8bk8pNcYxEkq7cWi3U9yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDjuONUU; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDjuONUU"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1791068a91.3
        for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 23:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787205928; x=1787810728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2EGmjeRO6ukc1KjTPIP5eSBiXKh14r6c1DZEAoUG4O8=;
        b=iDjuONUUXHw7HPAcvHftJa6l9iMYzdwYv3+1ee9+MVsKt7VsQ+C3wDPd4x0F5eRWzB
         8TyarUlbsPGbfYvXrTADHAFKtTqlfBi17TiXvXSsqmJgOCLo4838JLBt8nFKB2aQhOft
         KHep9YeZlolxYANhqr6s9Aw+qLsbJtTt9VbeMZryOXoyF0pcGO96/I/V9Uf1e+B1Sk3b
         6KkMdRGhNtTM1ZFZa/wb7YMA1TlEKVdWcSyourkkKPXXGR0PAcLTeJ55V53LVbxiK2So
         MKKV5tijCg4/Bn7JyssxWXFMH13x3f2imo34TGp0FdiwUzd/DyfduMMfdCu+ZrBkK6U/
         3iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787205928; x=1787810728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2EGmjeRO6ukc1KjTPIP5eSBiXKh14r6c1DZEAoUG4O8=;
        b=ESVRhJvzWEAuX/E3bEkRN5COS6AHdSN9NJghmkV05a0E2/JZ559QpiGWcGNEuqaN9+
         NUTJnhp22rZ09R26q+ujb9SbFfnPG0uMU6qgN1FNXLBaHesGylB7pmGmiLp83GydUZSu
         YVvSexyZn19vCbpZh5KlUoxE0uQLLBXCqzNCJQmY5hbIrsEbpztjheSz9fxb4Q38e5NY
         f5yF08lwcm5HBHkpmVzT+uj1r4/TxZidBC/pztQJMhVOXaLFDs2yVS3sn4w8G6lwot2n
         cG5Vt0m5F5hxukWqwsMerojQKfwQC+4YebbWSJifpgsOAQzFzMZcOKJvbHJ2POTVKJsj
         Utbw==
X-Gm-Message-State: AFuF++lx1Xom2+1MLz4nctC9XFdxvy3NdttQqQcwLgBewyxtbxkpfUoa
	I2mZP26z9yfpzqVfLMYLgTA/OWXn7LR4xLyYdGki+zvoI2nvxbA5Pxbo
X-Gm-Gg: AR+sD13H4WEQadQMTrWD6jrtUCBptRMg1fDlJCnAFmNbXHIOmoguezizcnz0WKrY7iD
	AkXDKgxmsO06DJYE0dhCy653YuS4v3KfIUgloSML9URHaVAU83WnHSmFLlxuaq4sfHWDmaM/il9
	TsSBh/2z1sK9E8oT8ZI7miAdtIr8+Kl6uVVYwiFrmy9TrQp7UjNV0ieQygFNZa8+GraR631g4qB
	uqva2aNCXh8kVj475Odq8k/LgC7/6yUp9pgZFrucED5u/WVpcF0GsKLQ/iOBrZr4r7KofaOhrQx
	KZ4xIxIg1nVD+VisTbbczs8GRpxSDrU3JnZqtGicHSI/MBE69zZaTiM4C13AKW6lpNfYzAxyvDU
	TZ2TwUfqWlUMKAdlnxfRPnPukzj8PrBFfsbHTkrUzmpYSMBqZnhQI+l9vLGOmxdyPD3D56B0U7N
	WrBYmMFFkwZbudI+vcgGpL9Ll45mneUJsclIJ0ButHexkB7BmwUPR8/4+GhqSXLI/lMbVtBi1Rb
	R2bWOzlXP9h9z6oynU=
X-Received: by 2002:a17:90a:e7cb:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39580aa5106mr19132702a91.5.1787205928192;
        Wed, 19 Aug 2026 23:05:28 -0700 (PDT)
Received: from ML-GYSUBT565.ECARX.COM.CN ([101.47.164.95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm13274417eec.24.2026.08.19.23.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:05:27 -0700 (PDT)
From: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Subject: [PATCH v2] driver core: avoid klist_remove() on unattached knode_driver
Date: Thu, 20 Aug 2026 14:05:23 +0800
Message-Id: <20260820060523.55087-1-khiemtranzo532001@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260820055502.49963-1-khiemtranzo532001@gmail.com>
References: <20260820055502.49963-1-khiemtranzo532001@gmail.com>
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

Only remove the node if the device is actually bound, mirroring the
check device_is_bound() already provides for the driver core. This
matches the existing guard on knode_bus in bus_remove_device().

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

