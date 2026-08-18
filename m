Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED3378D8A
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036356; cv=none; b=MijOt2hs1A2w33tQK6uwEtcYOS640WNBItxZuQDf8CHWs0yrnrxgbI4gKN4znMCuhzOe2u6a/YNr8f8J+3aLgyuNGzsp6bP9KhN/AXF11K2Jh+J6abeACYqhiOjf4+ioBNXqT0g/4QkOkySoK6PCE5pzJqwIMg2X40VK+g6tqh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036356; c=relaxed/simple;
	bh=lpooMWHv82XIjDvzakLEMxHa3gXYODF/BcalyGR4G3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXJJPhXgbHY02kBnV/+He+NQ21atIcsfumtw/sLgcGCCWIl1zb9RXljN7gsTZx69UUEnhFZozJPdstLnwx1Oy3KIzrL6m2LEnVdp1wlqiGJOHa/ry3pmC4q6RRfXSJn4DPC6qfNsQfuF6rU6FYKerTWNtkWiwqa01HSUd2w7t5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Odlw4pKF; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Odlw4pKF"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso1941205a34.1
        for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787036345; x=1787641145; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R217ybDpCpG69XJL0cHI6yEG9QeM+58x/vvK44Pn+nA=;
        b=Odlw4pKFDICmYkZPswzoBkCHGf1uvxCOHzgCPpWtEl7lbBbc5mcy4CgHB/IavMadek
         2Js2vKM9xmI4hjQtGg8dbIV97PKkJNPKPzqjjZV/uZ4Fqp6ZqeRs+UINZNb5Ls5QGhbB
         U7jWEsTYmo8Pynxu31WVWxdH9+S+mRIfuyXDJYjuhiURbIVvfwxvTtCRz+QYISOD22yX
         mvKECph8IAJOsDEBeWw+Exyv4ITfuXBf+DZ/GeoQOcr/So3gjrBYmWmL6UDcj2iA9r4Y
         WlK2dJy2r5L1cOTG0bIB3SemYh63lbwj7IOQxAvoan/UEJZlsYkStZK+rj1OLYTXdwMQ
         6SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036345; x=1787641145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R217ybDpCpG69XJL0cHI6yEG9QeM+58x/vvK44Pn+nA=;
        b=CfqUsY1Z4SHKWUYlPfZyWzWfSgFLNdpygFttQfkN08xkm9ov67MogtiE+YZWuwfbk2
         Q25SkmJe3mUqmU959wLGfAx8yvLerK+msX1U2ht4veEs22ItOs1ca/XSeLwJVROKyqZB
         PA4olP5tSGtn07+OAWggeMiuXhGk4elxKJuY8tgBK9jKl4fnjt4Xasf8/k6g7e9D2cB/
         G1mqkMDkoxWjJemNVmappuprWTr7efaMuRXUDjcF28wAQQ7LLabNE+e73a6zlUtAqO4l
         UuU6d2QV7kV75iBiLw0TrupLIFrilkh0Cw9J6peahLlqhFB+D7540BtxfgP/qNfOygSR
         obBA==
X-Forwarded-Encrypted: i=1; AHgh+RoeVoOpo3LzlbSYRvaz45wciriQw17VdlV0RILwzPwBwLikCHiB8Lgp7eSp4hvWO8j4ErLuDoivg3/9Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZU9hXaZhRmQlhzz8CLkapPAnf1tthy6luZXwUCx21RWqPgttl
	LvQMng9G5owm2DKCbAA4lCakufoejfDARzbys/Q46ex8dRlf+ZWOXRF2
X-Gm-Gg: AR+sD13DY6DHXcZm1JMo+xO/m7zhl/iCbIoI93Z0p/sw6kakYXSNEhEInsl1dqTr7vW
	AeWsLM/tieNihT0rYH2FPfymLd+h3O7WGTRKtI8gg/8rHDXkPjAGJiN9R6zgERg9Wmeze09kpSx
	/C90a36aEoj1Es7Z2CUwNdbWixh1D6fim6aAvEqdI1B6V6cqfGUE4DVbYegA4rLXqhrpZHyEjC+
	IflW9hLVx6NzjS2zVAAhQeC7Aauk9hBjcgu0kheDVzTgPIQUQBmfpBk6UtY13datYWCh6PIS0/g
	a0LC91NDua5jQDYVWysAVsC37QWGsVoqcvpa/Kh4dOK8i1Tg2mD5MYaGu6gvlUMZqXp31grBfCt
	51DKkyml0zhxJl/ue5fii5Zxm/LBBSKKP+6cy8f0vYh1cO4qBoj+LxP3DJQCMgXGtwgML/HdcJi
	5gxG4urz8NN3Cw8PbsmUTjvJhh+clx+J4fFRQtM7JFSs8ZMVV0qkErugVYPUp1NxvQ10yUXQR2G
	kfYZxd1GHk+DCkYdf6CaJ9KX4qzcDrpaHcyzUahp9JQigTEHClgEcuYzeH36xN+XZKkhScXLWfa
	BBwvpHhXouqiSKcb0R3mEXtH2WhRqGeYHiu+89hGR9pOxfgxgVvaKjzP4Cs5HuHRAN777Nm8O2N
	KxSx6n9/s+JRRprbE8MAWObotb54=
X-Received: by 2002:a05:6830:3747:b0:7ee:37dc:59e1 with SMTP id 46e09a7af769-7f3de6bbfd5mr32618951a34.16.1787036345565;
        Mon, 17 Aug 2026 23:59:05 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41beef430sm3599463a34.5.2026.08.17.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:59:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 00:58:59 -0600
Subject: [PATCH net-next v3 3/4] net: mdio: defer supplier sync during OF
 population
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-submit-phy-package-fwdevlink-v1-v3-3-40a905ea16b6@gmail.com>
References: <20260818-submit-phy-package-fwdevlink-v1-v3-0-40a905ea16b6@gmail.com>
In-Reply-To: <20260818-submit-phy-package-fwdevlink-v1-v3-0-40a905ea16b6@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Christian Marangi <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-acpi@vger.kernel.org, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The MDIO bus class device is fully added before the OF helper creates its
PHY children. Once driverless class devices complete their managed links,
the bus proxy links are retired at the end of __mdiobus_register(), before
PHY package member links have been installed.

Pause supplier sync-state callbacks across both MDIO bus registration and
OF child population. Each member PHY acquires its real package supplier
links before the matching resume, so suppliers cannot observe the interval
between proxy retirement and member registration.

Use the existing nestable device-link deferral mechanism, export it for
modular OF MDIO code and resume it on every success and error path.

Fixes: 385ef48f4686 ("net: phy: add support for scanning PHY in PHY packages nodes")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - Replace MDIO-specific proxy-link deletion with scoped sync-state
    deferral around bus and child population
  - Put the deferral in place before enabling generic class-device proxy
    retirement so every intermediate patch remains safe
---
 drivers/base/core.c        |  2 ++
 drivers/net/mdio/of_mdio.c | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cf3f4133391d..d2f9ff65138c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1256,6 +1256,7 @@ void device_links_supplier_sync_state_pause(void)
 	defer_sync_state_count++;
 	device_links_write_unlock();
 }
+EXPORT_SYMBOL_GPL(device_links_supplier_sync_state_pause);
 
 void device_links_supplier_sync_state_resume(void)
 {
@@ -1284,6 +1285,7 @@ void device_links_supplier_sync_state_resume(void)
 
 	device_links_flush_sync_list(&sync_list, NULL);
 }
+EXPORT_SYMBOL_GPL(device_links_supplier_sync_state_resume);
 
 static int sync_state_resume_initcall(void)
 {
diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index ff540049b847..9b73fd8eed41 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -243,9 +243,10 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 	of_property_read_u32(np, "reset-post-delay-us", &mdio->reset_post_delay_us);
 
 	/* Register the MDIO bus */
+	device_links_supplier_sync_state_pause();
 	rc = __mdiobus_register(mdio, owner);
 	if (rc)
-		return rc;
+		goto resume;
 
 	/* Loop over the child nodes and register a phy_device for each phy */
 	rc = __of_mdiobus_parse_phys(mdio, np, &scanphys);
@@ -253,7 +254,7 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		goto unregister;
 
 	if (!scanphys)
-		return 0;
+		goto resume;
 
 	/* auto scan for PHYs with empty reg property */
 	for_each_available_child_of_node(np, child) {
@@ -285,12 +286,15 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		}
 	}
 
-	return 0;
+	rc = 0;
+	goto resume;
 
 put_unregister:
 	of_node_put(child);
 unregister:
 	mdiobus_unregister(mdio);
+resume:
+	device_links_supplier_sync_state_resume();
 	return rc;
 }
 EXPORT_SYMBOL(__of_mdiobus_register);

-- 
2.53.0

