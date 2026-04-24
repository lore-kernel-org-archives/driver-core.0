Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181A36495F;
	Fri, 24 Apr 2026 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777026269; cv=none; b=crf4YsnfOTXWKnEq8boPMRem3QDPEnEEWDmgsJIH3RxPbQmid7BUxIOpoenhKFS4jaQzi0AUdPkyPdKUR1ims7yiV1Gp/v3INXSYnOkwuKlZ5HFdFa7VwCYIE/0DlIUjgpFTaeS2tLDH/MwuOUdm7y9YiAZM1t4s9z+Dfh+Ut4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777026269; c=relaxed/simple;
	bh=h/VxFjnDrGD9gqNv7Yd9Yeb+NsZMnwdTD+ZtcJgsIwA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WjWtdtrHBu2odSqpLTWPax1AsEGPz2hp2LylpdWaZ0zqLLpUN+nXMrK5OcHTtdoc7g3OrsodKQ1XtzOCnaYjI5ft+mtEyMK2JSAlsmyoS/0ucZepauHlNqqwMJX4YysuiMXbX5l1/JA3aOhzVkjtmuP6DNBVt6AK1bO1BJMeYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=chMjp9Vb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="chMjp9Vb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB94C19425;
	Fri, 24 Apr 2026 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777026268;
	bh=h/VxFjnDrGD9gqNv7Yd9Yeb+NsZMnwdTD+ZtcJgsIwA=;
	h=From:To:Cc:Subject:Date:From;
	b=chMjp9Vbe03Kgj/768vuQP3GrC4vcnuljQXUMmUVecobMQjP1XRzDC0y7MUeJbOCE
	 ZbFD4O678U/LSXl4NwY3Sx5t9WTTBZ/ttclmiQIKI77LW2QhdyNhy/d+YKAImzCZhf
	 znjoLzALMmEp5Kn5BEBcZ4m7NjqIodIpQRriH7LErOlZSCxQSbjkR7qORjCwRnpT0U
	 PNyW6N7nOJf5yHZZHniTHlCjeUqWew0UDg+v7dRwTutgyV31w6lreBbF31SByKkhC8
	 P69x5m0nVpL7dl4ky90KYjjtzYA5Dez4e8BO9d1jRurJiHypn9SWobGj+4i0oupac3
	 24gYFrknNNVew==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGDhy-0000000AySs-2qib;
	Fri, 24 Apr 2026 12:24:26 +0200
From: Johan Hovold <johan@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] isa: switch to dynamic root device
Date: Fri, 24 Apr 2026 12:24:00 +0200
Message-ID: <20260424102400.2615677-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Driver core expects devices to be dynamically allocated and will, for
example, complain loudly if a device that lacks a release function is
ever freed.

Use root_device_register() to allocate and register the root device
instead of open coding using a static device.

Note that this also fixes a reference leak in case device_register()
fails which may be flagged by static checkers.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/base/isa.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/isa.c b/drivers/base/isa.c
index fd076cc63cb6..5887e4211f80 100644
--- a/drivers/base/isa.c
+++ b/drivers/base/isa.c
@@ -11,9 +11,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/isa.h>
 
-static struct device isa_bus = {
-	.init_name	= "isa"
-};
+static struct device *isa_bus;
 
 struct isa_dev {
 	struct device dev;
@@ -131,7 +129,7 @@ int isa_register_driver(struct isa_driver *isa_driver, unsigned int ndev)
 			break;
 		}
 
-		isa_dev->dev.parent	= &isa_bus;
+		isa_dev->dev.parent	= isa_bus;
 		isa_dev->dev.bus	= &isa_bus_type;
 
 		dev_set_name(&isa_dev->dev, "%s.%u",
@@ -169,9 +167,11 @@ static int __init isa_bus_init(void)
 
 	error = bus_register(&isa_bus_type);
 	if (!error) {
-		error = device_register(&isa_bus);
-		if (error)
+		isa_bus = root_device_register("isa");
+		if (IS_ERR(isa_bus)) {
+			error = PTR_ERR(isa_bus);
 			bus_unregister(&isa_bus_type);
+		}
 	}
 	return error;
 }
-- 
2.53.0

