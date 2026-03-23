Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB1225397
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230893; cv=none; b=TPQ2LTboWCeHutW6cpNRZ4FAIJN9f469X73Qp5EAF+9CDRA3dPLt6lSqXWMp5Ve47l3cQKIdTWKVAiLZWy2rXHpzo1bUNbWnF7y3IDgTl6A12ntZi/6YVOBTCYl4Uaw8zyWszyJ4guuCfUDf717aL6vtMUch5Zmf/7wm3km4r/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230893; c=relaxed/simple;
	bh=RqL0mTRKkF4hWJurWBewRbPofeTnIMHQam2gd97mUZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TRQy1l50EBJk58/7ZtQMimj9k1QZUm8FjKsDBEt+WiSVA+nQjqIMs1N4HJjI02JTaykMsLHJNbQjthcLOkQUE/PumaXsuKk9635K2PHJjG/G1rLKmkYgny+RL46/3iMVNoGy8fGqMmXltsm6K9a8sd1kAe7icMh4QJVgiqEICp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a/JEKiGp; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a/JEKiGp"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c107ef474fso4398382eec.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230889; x=1774835689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQXLY86FxuKQON46KYMFrgiDaURA8SjvslLPqZRssqU=;
        b=a/JEKiGp8I0BAzBbDw5MS1K9LsTGQXEQneQ04ZCsZq0vPcQ9RAPtyYvdf/ehCLlfvk
         079oiNxBoWU5vn2TjOvf3QzwwLWDBFA9jmOshWcijlanB2CTRWvJA3kretE6aPTpzbXv
         JmofBa6iERrW6XXFGJBznITLYy4NogvJfKaF0UK7Sw+iJRuPQBivtM0b6HVERgm5q+JM
         pCtrWopw1Y3cgMfcGve1l+01tpiGMHUqqzFosl9+dPg7glD2F+XjG+GSQjX/hyMPwvPG
         fWfYvFox15twif8R9uKT6VEArjsiQpmoebyiWVOVGjhwxxanUHoyMIZkLE6qOZiD9ut2
         hLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230889; x=1774835689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQXLY86FxuKQON46KYMFrgiDaURA8SjvslLPqZRssqU=;
        b=l8pmufI8TUlItK+E3ZtW53C3HyiyEFrtlpSyPk8ee7B7WBPOK4uQoNzDRZDKlcUvH+
         YKI8vytUEvm9Ej9SAJ+kifgm+iT/JBJLT90GJ9/0dBG6o7Tze+lqZ36JiahYCsFSar70
         5y85oaC02osMtgWh5XsVjtoN0ndA2yMjKQV0nPM41Y0PlEpWEhEwFL/GYuSeZh7ipuIK
         dJ8nKVShlDtf/acCNxmPmszwKfx8QaJUdBLMZ6Rf4/raiEKCb+MMFOPhC2103xSZYcaG
         1m51jBBrIT6OWgc6nez8qVZJ+YJXRnizKFzIUHbiL/iJWUz92cYT+AFQ9hzPhuKU4rqh
         Ce5w==
X-Forwarded-Encrypted: i=1; AJvYcCX3TkSSFeviY5XnEete0pumG0LpQMIojeCJyBacpGfQ1IzV1Hi7FvLzm0sheTRafvNImEvfHslt4eVCzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpQWXpdO9hxX6nGerwDaOROr3QiGCaRetJMVAIt4gT7IEW2N9e
	lBOwwtOLby1meACmRpIV3SE5x1at97fziiTiskpxNJ5lM9UOFRCSx2WK
X-Gm-Gg: ATEYQzy9S+l4nJfZ/tvLf6e1w2EWtmj1iCM2ZEJ8KxfB5EFsfzFWNQfz5tKCEXnSXqi
	8EDlv6pc1hIFkUQeOmza9jD6nExb6lVWzr05qbmpp30megC0JEp4pKLVwmRcygSJ27eggsXKRJk
	+YXL9fYP/k/Hg4rc4ReLaexYE3TIszlWG2By5hVRH+2cHaSZOWtp5kdfFtR2kGJ9xR3nI7vaeyN
	B8BMdBAv+S942fUgizfGHfFez6l6h8jluwzW5iDk0CWpJrTR7/pjw1szxsSLJH6+dZbZ9Hr8mfH
	oH3NWeDtxyETy5hQfW8XBatMnwo/dA/Cf35vBuQdQ7mQC9uO0xddVjMVdeQVQhJY5AeGb9tXJDl
	cpARJgzxOiVomYkPGhN+EkhuHA8h1MnQNI3CIUlXYnnKwLDZAaFpx0Ln2qI6r94SgxKUExGCGbS
	M5Qul1OSHWNtLman160a8aV9n9hpqMbgTHoK1x4SS0eVNfBaUbqh13cvkMCSRghvhx1L1RUyzvY
	4I936yNKIHf/PM=
X-Received: by 2002:a05:7300:572a:b0:2c0:bd6f:42a3 with SMTP id 5a478bee46e88-2c10974f0d6mr5302324eec.22.1774230888985;
        Sun, 22 Mar 2026 18:54:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Moritz Fischer <mdf@kernel.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: [PATCH 05/10] leds: led-class: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:23 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-5-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: 8bit

In preparation to class_find_device_by_of_node() going away switch to
using class_find_device_by_fwnode().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index d34a19453560..8d7ec9ccb173 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -273,7 +273,7 @@ static struct led_classdev *of_led_get(struct device_node *np, int index,
 	if (!led_node)
 		return ERR_PTR(-ENOENT);
 
-	led_dev = class_find_device_by_of_node(&leds_class, led_node);
+	led_dev = class_find_device_by_fwnode(&leds_class, of_fwnode_handle(led_node));
 	of_node_put(led_node);
 
 	return led_module_get(led_dev);

-- 
2.53.0.959.g497ff81fa9-goog

