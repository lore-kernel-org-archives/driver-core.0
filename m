Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4436623741
	for <driver-core@lists.linux.dev>; Sun, 15 Mar 2026 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773593404; cv=none; b=Ivy9qFkU7svPJXm53+CXmoXfE4CuSDNEeBM/lLXRksM+7jGKZ/UHUM9s2jYGZF6sYqgzZAz6MNMW0sRxFF+ukEpR/ont8msE9ZtLLp5ew8FHrC65SpBEg225KUPFsL4kV7ov31PiCTdpg9/MxD/PZlPVtYvGOKnh4sKQf4KkGYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773593404; c=relaxed/simple;
	bh=oHRt6X+F7bpekcJPDP7wcH7Yh5wtJFBOaws5B2wE4h4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TS2jLWTeHbTZ2s15t8NBWIMArgQzFl4GEcIBB9Gb76K1vk9e9BrLexU3I8q1fX5P77s4uaSG/FNB7MyWjEef5W8Hrc/z2oubMycyj3pyk3by6Xicpd7zVnxBqsJrTMu2s+30r+uphwyHll9JkccwxxiYqju7ZJCKTHTtkBlbIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBw+4tgJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBw+4tgJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so45058705e9.1
        for <driver-core@lists.linux.dev>; Sun, 15 Mar 2026 09:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773593402; x=1774198202; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rObUljC38Hdry53z0R6PTBszYRze3OJesm0j2L/VR9g=;
        b=mBw+4tgJvqOgYiScq/uF18m8hYIm6pCW5nblA3AkYyrcqPQwiUhK3h7WJMWdRQMFG6
         ncen/Xx4IYt+QPjV4nbWzfeGNtMzJL5iEgPJb6OKVs3esudoyaeAPSe2Lf9qecoja7Md
         V6SqfD/l4oWqCrvvM6FBsk4aVE+giSKn/rbUvlXYFfSpvB9l7K6Qt6M9edAhRtjzX9R6
         KXVIYg/wtRjO/ZC8pj5qwi0O6ti9kzdG6VAKUKSAiQngPtqVwYG+TQSGKPZobUxdEqNJ
         bY+e+t4I7qhrg8OSGj7i0NvBZeJJqYOBoegOPKgOd19tU/14u0LBkXCqhudSYfuqMjNG
         s4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773593402; x=1774198202;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rObUljC38Hdry53z0R6PTBszYRze3OJesm0j2L/VR9g=;
        b=GcfbfJOhfCJAGUXq4yMEHZXKoQbCkbuAHq5pPJIH52ufuWGULrRUdE1FugflklbKIc
         wizhzK7Gc/BqfwBqp8svUjFOLFULvYR00EGk+gTViDPQhiebyL5F2vVjxHFbZ1WL8VKp
         rUBH6sXdNL5HLzAjF3t6LEgAV9l/ulQNf8zVvSOeCpnZCGiBiwJ9w5mKVYdLDiP/iqvo
         kyNKMdxBRl540KRU0nEu6/AYGAWUCmpJYun1KN1zBg0ivZaY3PEEo7BnH8/XQqVm1US0
         DgveyGqN1iRJJ+A8vl+SW9j1fdmVWHbGRkLqn331271o5mDDlPNCRPH52BcLuwX9eQOf
         dF4A==
X-Forwarded-Encrypted: i=1; AJvYcCUOw1obIE/UxJKf1+u06XbJ6M42xes9gTJNRGlddvCXeQTY2EbS+X2jtdXgJqViyr4oQGmji/hOgNVaCA==@lists.linux.dev
X-Gm-Message-State: AOJu0YztcISzL7Mpe4zdWff+sJFNBYtNKqnUPGLE72aQWjoHrCDOUkXQ
	fbHVzwfkEbxGKnI+d+prGowHmlsMAIoQBkEaZAvSwU7Tb6svEIt92+rq
X-Gm-Gg: ATEYQzxT6HJpYnW0/uSiNzvWC09eFQqcBEEKeG+XK3KAWwnSkLw9b7CVdSi6mic7uN/
	8fbysVBnFSW9zvbhaPrdvGW5mJ9LHfM9ude828NeOPsr+0Ik9xEjTw1u+KzlpwVM9gFnZI9pho3
	DAmBzmMCplMNPCLU58WUuKVpmZGZlfM+jBhM/cXwEmWmIf45CkADlhstWyKQIKYyswZDcK4rv9p
	qTqIPEVa7fYVFbRnCP7hjXQR/UM9oJyyEhWzMOKm3amkR8/HHkyNbgzWyeAdLK/R7ckbKqMmnXz
	KgVnbSw/FcxP3tF1mFv+KrbI0TAAw3oppc/CNqfwgIz+9YeDHdno8N0qxIPver8/xmVF3WF1j4f
	uPZ8bxglZJnrkNEzG9uXyXDqx/XKZB1SC1LLh5QDpat9MfessmKMy1bBw18uEWTP65jCMaoxS+9
	PLOgDVqEgGq52jquPG7uOuiRgyxOiI/Y58z/knThGSujdPw93JCzENdr7kRo2Rg9+5c1lP4FZOI
	5aRFpnirdBBmKMMpcJYrLpWN6CVicFbfmAbxgIpEvgjEncbxOLgxLvHf1NZakEOfw==
X-Received: by 2002:a05:600c:3550:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-4855670c971mr182570875e9.29.1773593401569;
        Sun, 15 Mar 2026 09:50:01 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f19:c400:5d7d:7d8b:dc1a:ae45? (p200300ea8f19c4005d7d7d8bdc1aae45.dip0.t-ipconnect.de. [2003:ea:8f19:c400:5d7d:7d8b:dc1a:ae45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm13284167f8f.0.2026.03.15.09.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 09:50:01 -0700 (PDT)
Message-ID: <9cdf83e9-470d-45da-8efe-ace0decf0204@gmail.com>
Date: Sun, 15 Mar 2026 17:50:00 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/2] net: phy: remove Kconfig symbol MDIO_BUS
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 driver-core@lists.linux.dev
References: <bc63cf87-3dba-4ab6-9c84-caa7357c3273@gmail.com>
Content-Language: en-US
In-Reply-To: <bc63cf87-3dba-4ab6-9c84-caa7357c3273@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

After usage of config symbol MDIO_BUS has been removed from REGMAP_MIO
as last user, the symbol can be removed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/Kconfig  | 6 ------
 drivers/net/phy/Makefile | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 7b73332a13d..b5ee338b620 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -3,11 +3,6 @@
 # PHY Layer Configuration
 #
 
-config MDIO_BUS
-	tristate "MDIO bus consumer layer"
-	help
-	  MDIO bus consumer layer
-
 config PHYLINK
 	tristate
 	select PHYLIB
@@ -19,7 +14,6 @@ config PHYLINK
 
 menuconfig PHYLIB
 	tristate "PHY Device support and infrastructure"
-	select MDIO_BUS
 	help
 	  Ethernet controllers are usually attached to PHY
 	  devices.  This option provides infrastructure for
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 8d262b4e2be..05e4878af27 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -15,7 +15,7 @@ libphy-$(CONFIG_SWPHY)		+= swphy.o
 libphy-$(CONFIG_LED_TRIGGER_PHY)	+= phy_led_triggers.o
 libphy-$(CONFIG_OPEN_ALLIANCE_HELPERS) += open_alliance_helpers.o
 
-obj-$(CONFIG_MDIO_BUS)		+= mdio_bus.o
+obj-$(CONFIG_PHYLIB)		+= mdio_bus.o
 obj-$(CONFIG_PHYLINK)		+= phylink.o
 obj-$(CONFIG_PHYLIB)		+= libphy.o
 obj-$(CONFIG_PHYLIB)		+= mdio_devres.o
-- 
2.53.0


