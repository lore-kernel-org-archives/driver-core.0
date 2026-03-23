Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13A226863
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230889; cv=none; b=UW+xmBi5PQAD6bTYnqg81qS1Db2F7fXShKKldgVSl7O4Jeaf/rMZuIcSBaFzW119fXLPIw2SSq0MrtktRLDBr/DmrwNYV/xqXMmBZ8X8FDm1aT2jC2CI/AB07OD9ul9CmTD/LwGvtav9K+RJAkgAJJKIDEZlp4dUUISnepbTZe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230889; c=relaxed/simple;
	bh=xYIn8ABDkpyr0YTUtgQcAiZf9GrzpDD84nxgrE/YbUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z31SE0/bZW8C/5+2QrfI02Z692mtl3YlUdngipmCTZKdFOcQtgMs1r8g+H9U6VfZP8Wv5GUM9tOlbGPeSsAvjHKfzgXr7QVVTfm9ZipnxlyCeKNuAkGw7YHJDB2+K6DedNtrMHAxkMhsUn5rlnUO+m6l/ooW+qHN1YWsjzst5Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHM7C25F; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHM7C25F"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso652888eec.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230886; x=1774835686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAxXxv6aPc5DTLbEJ2x2im/U0EJHM/Tk3mhYybeVkPQ=;
        b=UHM7C25FEWlmm8m6gIrwvrbWr0qvkklbKjYzr8NWf17xroR18ZC5sv6rytkbeKNrnb
         5z82Bope1Ln2pXT3Sl6DxBSg41S408biIlCULp/Sh70QQVOgVZzDwT9+T3im5oH/NauX
         Dt3p9WgOhywYNwksRfqJbeOWQYZOyN20KdPmpk3iA6Ddkn6pDmpT9lzSRmg8lWG5dcPF
         IJ8HBqSyuQpZFWXG27tZ6njEqJqAsWRMcrPj6hcg3lDNgL4pLwesp6wQN/A5KhPhiAU+
         KzeIRBwMXuxZ1uouFD18ePoXXsauifYhEFW45UHRjkFbYkuWlvBWQUKKkZ9foWCeZcD/
         QHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230886; x=1774835686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAxXxv6aPc5DTLbEJ2x2im/U0EJHM/Tk3mhYybeVkPQ=;
        b=J1rLU7eY7QL4XWjUK7md73qCYvXUr12MWSXauSrayOPp6D5ndGe8i5kjihz3+EuB41
         0S5vbeyj9huzcCzMrUviJe3E4cTSQ4ZTuXVPfb6/yrvFxnXZfEx2HYMg3GWswKwtrNYy
         wty/uuw2lQAaTviTxbLgeQ4JLKvK5ttKwy/WIJbY7HxaN1BM6iYUhhW3TpfjODGDm578
         OsqLpMOsHbRD77Q2O1HGUGNqCFHoN+jEgGbAnDSsGGR39G9vstLg3NKk+1LVUK494M5q
         fKqsfPtetizCgD11p2SUQKp1G4F+HZLvx2Jajr3fYkTRqMZnfDJwfF505NAOrjDscy+/
         lMXA==
X-Forwarded-Encrypted: i=1; AJvYcCVYCmOZ7kcxM1CGstfZfm+TrkPuKAWO1a80bvAE0qgsribPHlLhFpE1cPElqPvnC9ESriimFgZFbRoFNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzqBUagCzWWmfH/lnn0JGGMo/Ms4fs65DaoWuN0CmfzbxRWJkih
	cp1YrmPsLI95OWSDGcnZkK6cDLz7FAUn53RnrT47muJB/5Jk0Ktj7R1y
X-Gm-Gg: ATEYQzxsBnJREuFPvFyz6J8QwRx/BT6ErkNENCoHtDX4EIwNvi6CmYhl7zx7hH8CYvq
	0hprRP3o1Xkturi6czFyTWOQdeWQ0J3oH5/PiNnVsrkQI7VjDLGnJgoOzPk6s9hcPLYhWeBkfDe
	KU/hBHIrrxVzLr451f67h5ON47ktu087mcfYIQQo0zXu3VX/b2aYqFDj9ns0/fMEYHqMSdNp/5D
	gwsi4QoDELZt1nPlOlpCL35v5g7kB6Y4KhmV9RNJNQWwOP39dNg4ji+RXgv7uBlHHY2EZAVzsJs
	AQTTi3MtGgN+mR5xNeKM6QQqOjWBdJIMb7+WPZUZJ8jmP7zi/aAEAzpI4fQmgLnTUhwx4642bba
	7SJdn6nmZQoSvDnIP1HOihc2PbuWt/xuW3G5zbw5vGCTYSUDs0p3W9pS/j/ov5l/AXz97Y2qx8t
	viByOH9+mzTtcA8lT6ZY9RMUbF91Zci3Uecz+yOi444dBS8y66nFRIBjbbIvKND5E3sUJeI26S+
	ZQ4+wUke8u3llxHmReTQDZPGQ==
X-Received: by 2002:a05:7301:3f07:b0:2b8:30b8:58cf with SMTP id 5a478bee46e88-2c1095f867cmr4580068eec.8.1774230885998;
        Sun, 22 Mar 2026 18:54:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:45 -0700 (PDT)
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
Subject: [PATCH 04/10] regulator: of: switch to using class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:22 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-4-b72eb22a1215@gmail.com>
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
 drivers/regulator/of_regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index c0cc6cc0afd8..43ec0845c940 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -637,7 +637,7 @@ static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 {
 	struct device *dev;
 
-	dev = class_find_device_by_of_node(&regulator_class, np);
+	dev = class_find_device_by_fwnode(&regulator_class, of_fwnode_handle(np));
 
 	return dev ? dev_to_rdev(dev) : NULL;
 }

-- 
2.53.0.959.g497ff81fa9-goog

