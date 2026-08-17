Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A263E9C26
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 00:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924843; cv=none; b=ANwP23oo0w6LbYfkkqEBUXY7QZ6PQxQsGHPV07JtTk2T6eKsihkI9FVxwGfwiJkiq4yRwVrMk7UXDk/2IqoprnV2Ct1G53CCf1rftEGlIzrnSoiTGBn2ghBBkFQ8gI9O44R+qorlJoyak4DbwKltkdxPAVp+2153Oo7GuIPx2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924843; c=relaxed/simple;
	bh=1LnCRgjE5GrtVilnDq6Mw+CJnt8OEZLKDembPlnG1UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cjGoX2MgUu0HoWld1+oi5KwesnmwsxE333cben93/40hP84YofeVGl2Bu6KIdO6ODuuFlRtPfM/CzANRH/m1EGupUNq3k+57s0Qwga1QazXrKlWFQ1W4W7P5vRAsLGvu831j5+u4gnP5Qhnv6gKa9AWCb7vAiSllgMbfWtUAuE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV6zakk4; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV6zakk4"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7eb4d532e65so1224304a34.0
        for <driver-core@lists.linux.dev>; Sun, 16 Aug 2026 17:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924841; x=1787529641; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=nV6zakk486FyYddjbwweyw+Cc++UYAVTTzJWs+hMgREqkbj/DovSDYEKg6oBWcGe4N
         a5q3RnU9Qd5QTdFP1yJ5sfAeKh3Sxyzxr1ftQbwYZMdNjZLpFLJ3AanwgCpbFjWlt51A
         pf5vvADG33xQeQcFZU03NlOk4tPzthKPt0JfXc8u7vtDaYRNaM3DT6a11D5IxWwpqfTp
         kuRHdpvnsovtQy4fbltzOoJVpw8d61opcFyF+YqCpLbrsCFfHWiqQ29rEepOxxYJRuuI
         KPwNP4OJ7wHNeFcfbOvqW84RyWyMLipcxClyvOaGc5o5gZjZIe4p2RdrDOWWPTgXy5YE
         q6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924841; x=1787529641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=AlxSn3iBiH08iypWvLNL7QRKOWmtNH41W6PWIRrQ60TsnSMwuMqSAwk/oUsVst0FDf
         msdKpeFl9M/L9UyPeG6cHALdgYjEd5y52Cy2WgwjkdL4yxtotC7V2x1p53Fv2V/6AXrb
         Hk6uWffrIrJsp7yjoYd5t799vM4ew/8bPZwUK9y3ehXDQhCTv40gTYrL+9wUw1TK2hoE
         Np/u/UTf2nSzQ3N3iDW0Up8PBUYMXPgRy7EPZzWhnSSzbxdNk8PzVSd7qB6H0XaOE+NM
         O6SYY2tc27866ipsebifHILQFVjnItEDWeLcQDMOl6Rl6dzmjHBB+NP8YIGoprrRs86s
         XfGw==
X-Forwarded-Encrypted: i=1; AHgh+RoIbJN9KuTO1gH1H07yA+hg6uEbjJz7tKucy7vbydtEK7PFtefv+lzpp9I/PW17+udP8R112Te94JqWzg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+1auG47j3KF2bP/7/lBC/cW+CyMoKApGrwOC4lBMHO3CujwnY
	nwIRdPj97yXM2ZN3pbUHUvNfJJh2Uj5B1SGUZ/lEZNPHmDtM3TD5QbvN
X-Gm-Gg: AR+sD12QTkP0XS0rkmX5rvSGVntlPtehc8LQDWtMScWToGliE21tM99TroZCkk2fp8s
	l+4nnGspMNJzPCfm3aheoUuhlsTk6fxXJ6kJn6PQX+vv/P7Ng+Z1uGUNKGui90YPCmicguIZvMM
	1Z0/0glPzTDK8AyUCErOCyWfAtLJB/NvVKaFh1e7BtO7gW5G9R+OXdlbT3yx1ZY4Y86fuQz4sQf
	pWTgz9L6Or3P2pX5rguJ3bgsiaLGp+5ZRz9bFXE8wEZnI5Tkgb+uxaOcsWfBGkrfoQcs6M+CaiX
	+VWx+OztGWIdqShvMmifWB9SuS97vY4Ya9zyBzYeZIcMye1aOVl+y0VV0LSK+0gXxTkNbz0MUe/
	7qrWiHgmB0GUFBcdTpKS/g1HAc5ktPm5AKzpZT2u/0Y994kd3Z6MAYU9M+dQj0ho8o6tNavTArr
	M1E4mE3+PxkMZCS491/HkFgP9PtHDuu4Ohi39Po+XaS7naR40wXWOcN03mn5gaIKJPcjqPMrZO+
	oa9I5HLifYCngDapGTk0yoCaC9uWryI/JlTAedvaDWr5UqH9BXNc1U4fuF26bCP7bg4YkIGDLy8
	O1vfbYII3tYBxLaeLF7lB/FLGPZL1IaHQx8B/Hem/SZ7iWIjVN5DH06joAdo2MMMJqyt5aEx4IC
	3RQusH7vpdJ+N6UgY
X-Received: by 2002:a05:6808:1916:b0:48f:c907:7a40 with SMTP id 5614622812f47-4b241e1499cmr17948145b6e.11.1786924840611;
        Sun, 16 Aug 2026 17:00:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:31 -0600
Subject: [PATCH net-next v2 4/4] net: mdio: release fw_devlink proxies
 after population
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-4-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

fw_devlink creates sync-state-only links from the closest existing
ancestor device to suppliers of child devices which have not been added
yet. It normally drops those proxy links when the ancestor driver
finishes probing.

An MDIO bus is a driverless class device, so successful OF population
never reaches that lifecycle point. Its proxy links can consequently
remain forever and prevent suppliers from receiving sync_state() even
after the real PHY devices have acquired and activated their own links.

Call the driver-core cleanup helper after successful OF MDIO population.
Only sync-state-only links are removed; the real PHY links continue to
enforce dependency and runtime-PM ordering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/mdio/of_mdio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..49f9b4062cf5 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -229,7 +229,7 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		goto unregister;
 
 	if (!scanphys)
-		return 0;
+		goto done;
 
 	/* auto scan for PHYs with empty reg property */
 	for_each_available_child_of_node(np, child) {
@@ -261,6 +261,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		}
 	}
 
+done:
+	device_links_drop_sync_state_only(&mdio->dev);
+
 	return 0;
 
 put_unregister:

-- 
2.53.0

