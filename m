Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9952641FC
	for <driver-core@lists.linux.dev>; Sat, 15 Aug 2026 00:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754922; cv=none; b=bM0pX2kBWomrwbandexgIFH0iR4lV6c2M+UWEMC3/zCHj+pirmGZ1Gv3dsJRWXjOgb3/ILZ1SryNFy6Py4wMvsNO1yijONB5HuSU9jrhZ4hAa9snLNLPQVyaX//JRmunKoGNuTXtwbJkEpp0o6+j1yg3FLDZTQNDW8S7WdLcriQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754922; c=relaxed/simple;
	bh=1LnCRgjE5GrtVilnDq6Mw+CJnt8OEZLKDembPlnG1UE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSvI99viecoJCDTE6h5YPvzSl/jeKNt1Eq0KmvCnICzZxMMOwdkb0sXYYT9fAANFR+/1T+5wvO+HdrQns1YKePgoH4rZCsiWLo+6epiUrnOXcJ3JR3LdFrXfIFhFKiNFNWlunLlv6N6QmAcIQ/I7yi+ynRV7+fMQLZO1bOvcYww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFdSlszg; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFdSlszg"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1631562a34.3
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 17:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786754919; x=1787359719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=qFdSlszgGwAl5Sm16WS7/gaFzkqB83DNTULei/IqHW8n77YoNgRLPDBCq0HCb5PuVM
         TeGH0nkYn7zQ7GCEXuQ2XWYmZ3zIAegfj4CzL0/Mh0bJKILU5J1n6kGGwI3BN55kMZq7
         dGAJejmp0CHclrDkuK5hd6bO4sbW/5MnmfYroFgmR1nqXOaRwiEaLdIkVP6IPUbbmYjm
         CpOA/kuVX/So9MqqRW5Dh8QOOSHo5hJBFpr/LT7xgIQ5IBiv+bpiwDB4v7g5NeUcApvV
         v/oc6vrupVklTsEeIw44Ndn0JO4mkW0WNu57suaYmVaduAHc3luffytll/qd7k7M1PNX
         e0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786754919; x=1787359719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbg4qcFK/mBxoYXCkGvYYK5TXUGZpjr2DCvrJZaXNS8=;
        b=ClkkK59p33DFuN+wr1n2dBwBDmhBdkZRwtTT8u7xqKlERTTFG1cxfbkkUT2j6GsCr0
         0J6Fr2AG2ehaJ7rVTHgKtAk+ugH9GJiTuwH9WxoCcsWwqYGcYOTpAZWKV/KVbNhKb2Pd
         PVY45fWSq9nJEqOh7FgD7baqSHal/jUb+FyJg42cnwqJ9d9QLVbS1K31+7qO75WH2f4h
         Hw3VNzozFg0hYzrrRUgAZpfLxltP8ISSFvj/IfOtQ3NguAV+MsWxvSjKeD0c0CkYE9u0
         mM06KbEs/xOzMPMRXBnjRmIjgeAaybZZQ2JG7rPvAYBFmRVkZ9zjAaCelOKjqYGH6QT9
         hqwA==
X-Forwarded-Encrypted: i=1; AHgh+Rqx9mmOL9AWDI8GaTFLOgThBhERymDpFFgg39B27usqN7yXeQ7p5+8+SxI5N9KZzUxcFNef90a2NijdZw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv54baFyUf7REPhVGpOKsyjkDMOzJ2X4ivqDurNdXOrvuLlFfm
	sz0GtGlYIqOmmTDWASt3wqHiVhFtZjkNiz+EarGMgG6E57nFrqYH8Kqt
X-Gm-Gg: AR+sD11TQEzmUvXWf6nmMcSccT7BhRA71whpr736SXKJyFRiNNe59zXP5AFlyW7k3Hs
	8RnRVda8geLcA/PF4f97hgfADasSsb/+uK1fGMh09kjL9S178vaoEKyCgvKUXdJvca3acS81mm/
	94b/vFipqXhfb04TgAWoooYTrh1VmJczsQ5AoB5e8BRmYOKMDXJWuhN5YIUX19QWEEz6xQ0bBDv
	7w6iXXxixzXdQo5sd+TulHZ7K2hMSOevh0vDUi+cuYBmewiwaDY0M0od5ewvlovv5h9JlECDOO3
	PT84rdA5vaggIxaw576O/JvvGJ6Q5oBvZvtcgbLudrdNI4HXmX6uF3iJYAw+hFgS4kTKeIxthDN
	Gy03Qwo2rMNuSWNtSAgvp8aIYL1zfbGRAB2b0GD0Yft3nv+Eg2j65wZ3txS0V7Gu75cCyTRta5C
	UBrznLRyHDcnfT35Vqm5qYVQy3B/HUMHEQ2JI1NwzpeTfBqSzvbL5SoFb+zWAKtZ/rUgEuGt4ho
	x04wRsvAdrmeprzg+pBPcgJAwz/OZ1i2sN+l9a6x/6CkGpyx7CMIjNgeciSFNWr8/LttvyxfvPt
	Wu9yYwYYxdDW+s67e0P1a0u/A57nj1X5oIzOBFvPsWVMO6FktvSgvJsLKhKPTIanwitY8IQPa9f
	aBmq8YObujYOZXHonsQ==
X-Received: by 2002:a05:6820:2916:b0:6ac:9729:6710 with SMTP id 006d021491bc7-6b0d6a8e9b9mr8697804eaf.18.1786754919602;
        Fri, 14 Aug 2026 17:48:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d9574d7csm3240730eaf.2.2026.08.14.17.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:48:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Aug 2026 18:46:17 -0600
Subject: [PATCH net-next 3/3] net: mdio: release fw_devlink proxies after
 population
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-submit-phy-package-fwdevlink-v1-v1-3-2319844f057a@gmail.com>
References: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
In-Reply-To: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 netdev@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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

