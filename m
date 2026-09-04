Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348DF41A50B
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511452; cv=none; b=LIpYsADjDp9SzgVMzA6rRwEhXTMvX00PaysigRt1iU5K+ChCBB+AQ072JJ0Ar+PMZcDnPiMQF1F9NIvuDZPYTp24r30hvxmYMo+XqiZo1JGd+RqjLAqfe2jiizj/G8wK6T1lU9tUBbQ1NjlLWg9N/adQrfamCWErg4dCWtxMnK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511452; c=relaxed/simple;
	bh=GKxlf1sAAAtK88H6DAU3sh0iIYsWYsT2IYOx5SXsE3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XjT1Gydm7ZxmXsIWQFepPLbUJKM84JETKcI0jmjhNryaD41dngI8116BMa7UDLZuo5ZIRVwpZGuHwNP+rwhNSkQIbQ4am3tRR/25jKOQJsJWokE1kS4e2c4BxXLIrsWn9+IfouknrJobOdJMo1xrUuVUyIw8wL6BoANM95t7JIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kizKBAqQ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kizKBAqQ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso632001a91.1
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511447; x=1789116247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=kizKBAqQ7n8LlnBo/gSvVDrQwnXPxgtjr8EW+OFxFUDf4h5JqIlRlGjx7Wk/pgzwnk
         Wz1P3xCPBS3hbzWYDiRnvtD2om6Wll663D7753ra2CVJ2woSlVfplfOwx+DtW8PahCvX
         34oY7tthR2ZUGqbZh2YGl8gDnjFOVVogSbcmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511447; x=1789116247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFmIb/8YvdtZL49BMQqQktnO00n+EPHrLzK7Dg1eMRc=;
        b=fsn7XhRgW1fBX3DMPScFCzRtWne8hYM1DguJnHYooy2XjJC8IkQrjJatB5vjTVNX/s
         nVee5nzLye96OsLBT+dCxZNR/jXbi9jh9tUaWt5Sa8hMB4yWnja1pmLj+Ojxe5jsDUz4
         UqXVo77l+djWsYC1QfjxD6pysQcTdrEgqvHoflp6N8wRq9naYzb3VQILaKMrKPld9OR3
         6W1Ap5oO8ENSMQznRIjtsz6Z3/tsPI9G11nmfE2NwVfXLMoGOUaY+fFqVHSb/zpdUTG2
         X4tGLn72fZfUWKr6b4aBBSd0+9DIlQS8eQ3L1jZ6h53oUSWdnTWKjneQOoXqgceO4myt
         4TIw==
X-Forwarded-Encrypted: i=1; AKwUvBzhCkoKAeNRVcc6uWf8igjd3K0uUV1m0PuBTCDJWU69gwN1BhzEFQm+y8zUANMAMpubdiHHwumTNVFsAg==@lists.linux.dev
X-Gm-Message-State: AFuF++mZnsRWVTNLDBgW5KRf17UqcIWEH8SR5SDkFQYzvkBrCAJ0TCDQ
	MBOX086IfdoWwjD5axc7ZJ8821nSBiXfrKaULjsD0ud9DVG78u86weaEpsVX7DnwPA==
X-Gm-Gg: AYBFou3nUme9MixV00RMibI41Hee+KtO/CYIQ/Sztof98AR831W1hrZXcvgIbYVixKJ
	cJMwBQv0f9oz8N/9ryMUhfw6zn4Cr47KQDihL7NJyZPsIPWlbnxouYiQwCPWYQ2elRzNxF3Dldi
	viNDhxNUsyb3/2M8YtySuluflxotqKK5+j3lqXYLbOmHxJ40JVtN5UCrxcGB78OlBA3l17QsAKw
	D8X5gxeEehKpgkF9LNaOFTfqjhyXzFthh8MZaIUXE4qAkPxnUHJrfEdSsjwMdd4xefXiWrPoGKR
	2Pic3E544QD1jaIKcW5VtQ41lfhO04ZUg5Tw1DbD6Gs1QmLV+ESaXjj2ct8h5P8kgxQJ2pwN21G
	dQQnZa33tVrjiJVVe5elnu1fJ3OFiC1V4eLbGH8p2q1qE434vRZ46r1ZdvVkBQMfLLO9Lbpaiw4
	ZjyEqOixUlLzuRJDWn0bQhv/kXJ1ZDPLMp0/7+oGGZxBdus+WI+gnP3Kk0keCCeICX9drkMTZF3
	Ap47bQWWUBK94MC/evqi7FTwcYeATFklB3NRVb3Lnsz
X-Received: by 2002:a17:90b:2d0b:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39b263167f7mr7127157a91.25.1788511447090;
        Fri, 04 Sep 2026 01:44:07 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:06 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v8 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Fri,  4 Sep 2026 16:41:48 +0800
Message-ID: <20260904084158.1341550-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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
index 1b891088a653..b7991eb53197 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -976,11 +976,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
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
@@ -5440,7 +5437,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.979.g7e5102b832-goog

