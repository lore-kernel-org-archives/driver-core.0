Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15E640802B
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 09:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591102; cv=none; b=BTf6NeWVBzt8euAXfyue4oDPA1bSOXroqcZfAr4USaYJBze0dhepDl856FUv1cEzT9KMQOqIe/kIi1darPN/vzsRWY4qsL+NAKLjptZaF4uXG4ntt8WTKeGOQdnYUuzdGMoCCdK3YaYNn7EoVZt3KGtskh0oRrAFpJvzSgZoRYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591102; c=relaxed/simple;
	bh=7Id8aIDDawUTH+Vp/qv7geyMCxiyF2kG5OxwY8VhiPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhXJRW9zRmn3WhPLag+xMwL8Jliul/dMh1onbcWCNPOSGT1FnfR5sfrBw65nZ12ncsPRu+7pfDJ19gtnueXP+6Ju98mK/Fi2VD1uNZo7OtDmh9vyyY+my8p3jgx39gbc+Ulogg+auoIt4HpG1Cqf9C65zxZnoo1XTeXJ2HFNjEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f/6ss9SJ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f/6ss9SJ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacd69a9c0so20496665ad.1
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 02:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591099; x=1784195899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3NOayELjm3/+NeKg/MUGc6Z0GBz34hjktNSI4aLdsWw=;
        b=f/6ss9SJxoEMJVg7j3RAquVsrPynwxYg+g2z4ZwNKXQWmHPIFsXr9hUqDoKFigdF7J
         4njrvDZqpMKwxikSnQtm0zLsYnttJETyQtJ+MOL2TNr/4W4t54gZ9Bufn85KhFrs0liD
         A5PM8rjaejU0pie88Op79aXhGc+m1pHj+AtXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591099; x=1784195899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3NOayELjm3/+NeKg/MUGc6Z0GBz34hjktNSI4aLdsWw=;
        b=o2mUfNDGT1ukng0IHhB3ytmoxsX9eth6mpm0+jkD3wnkJTftv+rZiSEax3Qrkr3ak/
         QjlGRgmRzFWkDeImLySCr3WZ8TYzZE1fcFU841/Jg8Rr9uP8PUl+MZvY5YOAOd2w2kre
         y8H9j7bWtmnHfEozrC6LG1fGTGJ9M0G5YdF5DudvWKraR3paK0WTxYDSV89sZSjVviGe
         O0z90wgKBTb+uFpwlIr5si4bHTpMN0IWwaGufK0ruQO2BpQH68sS8xf01zQj4clqCTip
         LWmxKSk95kMHvELKJG/noTd7NMpAnvmuEr0ejvSrHIqVGyyWBjVvYce+ttYWW26OKXXo
         5Igw==
X-Forwarded-Encrypted: i=1; AHgh+RoqUl8hCkAZO67thRBEKSRZZ1f66g242P5dRGTrSSE9O2wn6zLspIKl4YkkcQUKQtibcqS9Ydj/4qPT3g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yywnd60h//2bZYS9qXlROukYD9KS9ZOSVd47epCtjKBOw/HmiKR
	dN3M/6z3DLKuQZ+6KMRUGt8TBu9xnaZ/oRv7r60mrhyvUZHfFwN210Dv5b6dZIIehQ==
X-Gm-Gg: AfdE7cmxx7bdbWn/+U8rADCIjmMlNeyk0tWaFtkeirsOJHm3RbWZpxbXU0IrbmWknsU
	9jfZGd1cIOxtuSY92midt/ts6ydTNPZ0wnoMFk3cDEcIJ5+QoADnFp+7eSQhtV3f1Yb7ZFzy1EL
	IW/8VE8/N2OVFOlkogVinm15KblHaiekGOSOgsGASq7T4Epiizr598zcgkD0qJYOKMALfS8+AKE
	ws6x+xgYbk45PZnjT13Lmni1wNHXjC0iEMdorhZZOt3+7gB7vrQYWdXoN38IY96rqbgFh0dkobT
	SPb1jnKuqnEZbZ01BOxlGRL1B2iKN8YBmXuaJVrpPQGW3MkY+d+Fmm9NP9mgN6+9iX/XOZW3HMB
	m64PMzViKhzMWmfHhOxBVRAkGj6h7HZmkFKW54FlMrJ8sy75YDbnJxgSwQU7q1YzBNvD90bYhgw
	p+CP4yyf2qa/R9lSkcPUuMKGgZwX8Blf3q2qu70Axtf8fXNZm2GX8UqWQHI2DVcR6Q01SaYWXY0
	NPNOsu7
X-Received: by 2002:a17:903:1247:b0:2ca:eea:eb5c with SMTP id d9443c01a7336-2ccea373170mr66966485ad.18.1783591098706;
        Thu, 09 Jul 2026 02:58:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 08/14] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Thu,  9 Jul 2026 17:57:13 +0800
Message-ID: <20260709095726.704448-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index c7fa73673582..369280a217cc 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -975,11 +975,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5436,7 +5433,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog

