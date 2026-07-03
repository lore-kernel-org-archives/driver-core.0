Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D453C3786
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076650; cv=none; b=bTsb+wvZUE6rMrgUmyzBgm6FknV4K+lrRQGx5g5TC9GgD/ehvlxij7+ELYdVgYAtJfGsYDuvQLblvGERTqQNfjOncD52sePEQkB6ivdD0KPD7pJwEPlmdpuxT+BpaiduFmw3Q837sLmlH0Uqd1pjl2FbQre+PcwJpfOaM4D70UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076650; c=relaxed/simple;
	bh=kfKxqCT0AnFtztM5LFloMbjAp374Nxm9lZYgvpDSr08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKTi23sAEiPQINihUkNPqSXk2RrVH09eEflYPKyPGvCmNoAjP/vt6wSqrPK9LVpayv1zPIdZlQUN9BQRtuunW5UywOSnELYUEfDRVuBqYjfxPHlObS9tAZ/5DpeyURknF0VUBLkf+smVmRShWd+OHdnLpT8qUYB8125De9xFx4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CSBHREn7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CSBHREn7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c9878bbe88so10403355ad.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076647; x=1783681447; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=CSBHREn7Mg/Emw3hjg56xLWAt5r8Rw6qxJS2Syvnv9Boaq1JqcbAV2xDPfTTzrCmBu
         kiVoToz6PbEDSH4y1x4e0yViWFzjqI4iEAJWPk1x/dm9Ouk04/FubORzNe4UiHKsep3M
         6Mr78LQwu4I5pxrKFxpdTUHG6SS/im7kTcUfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076647; x=1783681447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KWC74RHfH35yZoE+4T5JHX8GhXugEkV5aHendXMIUrQ=;
        b=VQ5Twfafsm5QmLYEIIQtXizR1FpVMVo37+XrWBDB4cx3eDVkmrR4+x3atpOLOQfp2e
         GVwh4XZnqqnzavny/NmfzVPQHYMUtFLCTE55DNG6HPuE2ffP0IpJTJWe5GlGp1f/P6Fw
         Mk8wufHwNbbAAYzXDgqkNrwV6EvbS4KXgrm2JgzImL/VqJApUaL+5KZQzcJ0Xwn2H+Bh
         eP5J1DqYJ4GtOh/yTsD/kWU/Dl+ouNTxkDvgvDyRUUahgMaLDSpu+K7NJjWDoVOJj8aj
         5T8PIcYhfEWK5xuppA402+LMkiYdLQR852VmSqU6xpp01XusGDKaZI8cuksfct6IfQzq
         rrSA==
X-Forwarded-Encrypted: i=1; AHgh+RpwX5UGIJi6QXc6Ot66lqHfu9FovjuzuADt/BcWM4+i7NsopVql8FnwNeZU/seVV4T/BDyeqbU3KlW3ag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3r00TFFIQ9CCrrYlMY57zgDk2LsZmvRmupnE26dQLkIEc62QK
	tSCGzDX94fNulBsbp+q57E9n7/K6a0J+Y6KfPVruzS7awU7jVY1ug0sUh6/WhdkqJQ==
X-Gm-Gg: AfdE7cm7HiLoy8tKW7JVU2gIOJSJ20G08mXhX3UVxGcORAgtfnpWz7UXJBqTO0uareX
	VxjRfs8lVdABLHAcBnAmffOzPE5WcM3l6419oBN8XGC5Cad5DxigjIy5D9bLo3GEx5A61Ajre0f
	z5pgr86JfQZTnMRlMHq+0PW23Myv/318ZbxowxPs9VcwX705pAa8mG6gmf5ILVOdEm0VNsWtbSF
	TJAY9iJD9jx5Z1mor8el6cbrcz682wqDj9y3IvsCCF7wQjpy5Kyv7AY3Od+4WmBiLUqwurUDDMO
	TBi/wMmI2mlVnPBnPdOVhoaOtL6Pc4b3sJQjkDt5dTSW1NQ4fqFdEw9MbwFZqW8m7H6dXXF3vnP
	VIq/PyRU8pEDGWbjdONAOJ43k+4qJi2rnkzpn5R9cj/fo8dUy/B2GG505z8Rvhh8BU7Mc0PHSWD
	pT9YI05MxPnKEOoBG7dhdbNvlovJtH7WNkbCvClp3jtwn/TfVgLZjH3x0CtdZk1/08LMfkkQ==
X-Received: by 2002:a17:903:3b88:b0:2c9:d27b:af11 with SMTP id d9443c01a7336-2cacacc3ccamr39740205ad.11.1783076647262;
        Fri, 03 Jul 2026 04:04:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:06 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 07/13] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  3 Jul 2026 19:03:08 +0800
Message-ID: <20260703110317.1283411-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index da0a4cc8e15a..8ae97e8c26aa 100644
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
@@ -5452,7 +5449,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.rc0.799.gd6f94ed593-goog

