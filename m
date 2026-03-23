Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C139748CFC
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230884; cv=none; b=Eql157J4Pv0pKQljfHwwZJPh+BnhDoLtNZDHefT5M6ZeEA7nLC58rVvdxcJtw/nrpiDMpbdzunejCpVjwXhntnQhj8WfBJXeE77SSOEtUE+PskdJo0igZorLAk88Yhh4hCu19phv8gdp5wR53oooVb/DbIp0rn+FNX3m0t3I2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230884; c=relaxed/simple;
	bh=hPCCh7wVY1yv/Ut8yT6oomhgehBamoMfqj/l4kLk6Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pta9ucknFZFgud/vWUslpYFoH5nTU7NYC+VUGcbCTsnoAhkMyY8zjEnp7oF4A4sjVmHxSuLhBC91mWShpB46Zh2yKLOmZEEBMvRefA/+20mkEk5Yb/NPk1N+0/gUvncZCGQp2gJBDmFbiTVeuMzb8TtCSEpbpnOIwYRzlnXMGCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpzvqwnu; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpzvqwnu"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c1092cc08cso1024179eec.1
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230882; x=1774835682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X8icAi5hW5PHcS4B3NheItH86dqdd76W8IY0AZdTSQ=;
        b=dpzvqwnulyvMMi3mxCIbinunhTL8hesQ8WSxePNRZAhb2qszSPwukYIVb1yxfiEvsh
         Kh4UvWNbSul70i5cZoLJ1L0PFO9KR/PPs+heg3De6kZaLtgFsJ36t0smyVGRMDpZG+81
         2yY3VMVaMPG4yJ+IUmCsh7YKEhqx2n8A8qTGcHZKYuvJZAU2E+J9IX9GTc8vywJbEXCa
         dyf0qNrzdd9zH/YuZmhSDKUdrAMGvLmklAzXj4/Av7hq1/8Vh8p+QSVCQO9IFM+I5nrF
         RUjpiIRDLsIDRLzEZLwKc7hO4fwt6eVmQxy/6Gbxv8DeYMDBtEHN8Gfp9o6u8zSVe4fs
         dJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230882; x=1774835682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7X8icAi5hW5PHcS4B3NheItH86dqdd76W8IY0AZdTSQ=;
        b=QidpZZMay3tE+10glXjzwPHvHHGHqD+/4w54SLmL0u8q+T7drhtn4qmxEniaoL7ydA
         qNtcNopnr2pIT/C04C/rBPbkeFFXJlYOuyqG0WZEuu+pvXnad3Jp2zdYBsJCowcqNBza
         pRYs/MUCzw38lQ3Nz9uq/6efS8xtgQtb1mttGDhmR78T+5ysIpDoeDYcZXTPtCooqAJ+
         85LOJz7BSAcqt7PwyJaWDnEalLHP6u11nmpLLSz6+uVAnLZ/Q8+dSB4eo6q9K5iEFLu8
         sxfu7ztiJia4XUuQbiW3mN0eYvTw0/tpU6ww3oy3bwHnMf5OAwcsGYqX9PDJvFzw7zBf
         f8gg==
X-Forwarded-Encrypted: i=1; AJvYcCU1IfdPlk+RwRCcpgJptmjYhm1ZTnceTGIzFqslqbsn+uC+02W/O/KBzyW+ElUEa8N6zoveRURLXE6tbg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbMjq8XgTTcE3A0UjGweyt0mrERHaLHAqwyIL5NCdcDG7iY8zQ
	jobTIRQmYp8JIz/jqgD2yoHYNFD64tWupkeOeMZv+XGoIlBRvsp7xwx9
X-Gm-Gg: ATEYQzyPOYty1X//gzFbc+ec/j8X/EmUY5F5LCStmJo9A4jTvVfHK0n2Ej5lCp+gM9z
	ZQPGg6dlKtQPVQc7Yv3RwzTeExcyXoVazVnS+4MODiHsk29TOyy6VU4p7QpfWp6L9Ap5WvrkE+O
	38PjtDZDmLHczmB4uYowZxY9cPd2Juq7ifwQK43diz+XMGzQoiSPZRXxLLnRSCreUbieP07GZSD
	eOgUR86YcC0GJHseTmMRrWZtlJhyFkb0gzwhjiEUZ4LJ4YOHIXcu1P1BRdH6QUvFB54rI+KLNl5
	DRu0wHjFG8mtkX4deNfBO4cdXHRiJGn838mAskH093yUvA4mDkuUcKhFeSaAhhiR2YqrG6fYOGJ
	JvUbIuA7fMe0JsrzvnUOFfi3s5xrcPNLnM54/RkWBPeUmWc1GwgQTnWu5fxYvMiEyBYk2pWdyQx
	ewF6WX+yDZ7C+uh4gcCpNXcYj3xUjZuf95NAMXblkUpOPosIWGJUxMz5XNAAWTyb4vgKeADvWdx
	jxibH8qa/0KCZk=
X-Received: by 2002:a05:7300:e7ac:b0:2be:9d3:c8c5 with SMTP id 5a478bee46e88-2c109816b87mr4889998eec.34.1774230881836;
        Sun, 22 Mar 2026 18:54:41 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:41 -0700 (PDT)
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
Subject: [PATCH 02/10] phy: core: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:20 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-2-b72eb22a1215@gmail.com>
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
 drivers/phy/phy-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 21aaf2f76e53..57bce6b63a31 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -761,7 +761,8 @@ struct phy *of_phy_simple_xlate(struct device *dev,
 {
 	struct device *target_dev;
 
-	target_dev = class_find_device_by_of_node(&phy_class, args->np);
+	target_dev = class_find_device_by_fwnode(&phy_class,
+						 of_fwnode_handle(args->np));
 	if (!target_dev)
 		return ERR_PTR(-ENODEV);
 

-- 
2.53.0.959.g497ff81fa9-goog

