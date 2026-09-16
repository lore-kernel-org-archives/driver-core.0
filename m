Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F344BCB4
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545567; cv=none; b=BRMz9Pu8VDJ+0Jm6AWdQHIP5M4TsnOa4XHOBijXXJBb10TWz1BNYFYIsf3CMREm1+BexMXyeAf4HVj1/tLHD1d0TPk+oYdKNK/XZQacyo/Fo2sRHRjBHsTOWfoJu8RS2K/dKzzg7nPE8wG1+JBO/s+cF/OVGRbD8neyA5bxbtUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545567; c=relaxed/simple;
	bh=SHgJWoiUkxW7Auz32fIVCxJL51q1VUFL5lzA1MkMflA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgOLgsoxqTDynKAR+gU7kC0QiBdmHrsABzNEqWGP/HvvAsik5OEV+sLhWfEj+AEEmGhWF1dsbFVds0JtCNvaapSDBHuMSD5WKmSeJx7v76cUFoIpB4IYHJX12Xy9lAnbzV4nytZPYMAmlHqBIsO7eFw7LzdwRgOiPRzC+iCgsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q87LVoRj; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q87LVoRj"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso403302a91.2
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545545; x=1790150345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=Q87LVoRjo3syt0DwL09ddJoHk5/Xowd8aXZ3n3cdSEJ8YV7wEGOD9otE1dPAk8xLVo
         c+gUoRBOogUE3jp3SfNG7J8TezL1ITZuvHZO1UzrPuI8T4Yo+1n8bCeHHBMDbicxWBTB
         t1IMfCWxsVb6+Mj8cFc9jnH7m+7kCNfoh2dpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545545; x=1790150345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JKZMmlDJFNSMtO9huPhOVTb/TTA3LxjwLBEnHIboH44=;
        b=TUQp7qLe5ddbCzBbBW9VpOWnv72Re2LUm9NwPIwi9prlJpDYD7NtC4FHtst+MzwUYq
         1SvrYJalcaNherIOnkDBEI2UcOEvNm7TzE0pkv4roHkkus9J1CTKDloMGx2Ur5nITA5p
         0BD3unsuC29rANPmyvt4Rt5G/95JlbOB46smsPRfaT6dmG1v3rNZmS76YxRJjUjfLdqU
         70rBJZS/5mHyOAyYadKJFhFvDooDrhiYsK5+T53DmIYtGx9cZzavpPe6k4VVEJvfJV1C
         qaHgC7sOiZ9hyutwf2ctEJfNN5cTDCbwxfi+hErxah7mKnaY+/lxJAdJWKKxfxkShWPQ
         qYYg==
X-Forwarded-Encrypted: i=1; AKwUvByEGj8Nd/xKouh6HoNPrX2jRQ+8Ky/UJKCO10ukS10zDvKWV0wPxUQNdoMqIK0324A5/GOO6YzDnSNxdA==@lists.linux.dev
X-Gm-Message-State: AFuF++m91mcjRgyrzVklairTtSRXjKGj7DOe4S+NujvRszV0zOWW9hsp
	EaW/rhcPxL6o8rPtgZz2lsjc7gxrYdcwphWZgCPWbKJzOOJkIL5833P2p3c6PiTrCg==
X-Gm-Gg: AYBFou3/+gX2/5+vkHjc/v290ihLor81AKCIq3Z0ESLAdFBbgTao2hQx4HGGtB92uo1
	DDXJ3cMpYVxHa2LrM04bRNJIQyEVW8upQjgflohxtnDHqDZ+i3fTFZwsxR+/392TorqG0bwoqa4
	k0Wmqx8bsFGLXMiba8EL0s53L3iMx3JsHSFKnIBb/UWcO6r1voZlpNC0VfHzhDL5jwcVpGIPN8V
	KnN4Llv+itSkxP9EF1+mRkjSlRj80/MRp/x2a0TRs6km0B2DkJtasN+Jx6XqWxuAduyPCOeCQzU
	bmR/i+WgZx+92FF8WXJEQoP6HfNNMkZzZWDd/2Z3+Blfi1064NBCxOVS/rZoacIe/pXb0TfBMpe
	XWkY9Lalyn/dcRFv7CsGlSUssck3e7y70RDRsRe4bjP9Jyquw6TN6P1E8esJXFL8S8qRmzl+wfJ
	jWMRL06LcnJZO1ua74G/iyqEQQeGGUFNO5D90zkSyYMNZ3l+doaRsJaR7tw8sPi+ooVPMyGdN8O
	OJ6HYJDXhQO9ie+qu6Zx1xGFv2Q/fXGXU0rUvkzCSRbKeYwW9lbVNwxAg==
X-Received: by 2002:a17:90b:440c:b0:39d:fea0:c17 with SMTP id 98e67ed59e1d1-39e1e309c21mr3793724a91.8.1789545544841;
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:59:04 -0700 (PDT)
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
Subject: [PATCH v9 08/15] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 16 Sep 2026 15:57:34 +0800
Message-ID: <20260916075745.3549953-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 1a98ccfe2664..f309ceea1969 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -979,11 +979,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5461,7 +5458,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.1032.g73a4cd73de-goog

