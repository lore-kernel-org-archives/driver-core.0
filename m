Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD20377ED7
	for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787036353; cv=none; b=GbckNSnNQtErtjy72ZicBIBH//yZXCcga5rwc0gLoTLFJKhS6sQ8Pagty0xsxLQB6INwx+046CGVai/o72ZS/IZNE9wlBU/Us9+cfvcp2zRABzbKvYMh1lf34sTSiyGgfDqOFKCw/4oFeZJpG/ok9/INoakMvwMJUFmkxvJtfKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787036353; c=relaxed/simple;
	bh=SLr+JPD8H966PGr8RyYk2O8cefQBW1MdDmP/zvdAFJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9j8j75cdi3WpMGPHgmmYOxdn052Ob2MjihYr802YK2qCyCsHn8rsznxi2YVJm6SsbfRN+cOzXCDp7StC+4R5rAcVlSIG0QeUDRtPu6MeOe5afcj6BYpC7GzMIHrdqgVbxucjCYgOhSHzuVbG989YHBk4+wF2bolQ0IBjq+e+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdCHt7Z1; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdCHt7Z1"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f3ece23165so2582667a34.0
        for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 23:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787036344; x=1787641144; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6S7/HfEeviYM8kMOUgFBBnP6TBKiphaRKUEmhxWElI=;
        b=DdCHt7Z1EOefbKg44uF6VcW2tsfVx8w2L7S7+3R+hFjEL45sUnCinC2J6inAobF1CT
         PebvwKK5Fru7F/WTGMI+LJx9owwPYRR6QbwBK3gpDV8ElYY8yuNyFNeB6eGOzSruZEWT
         B4c3hm3b/LYOZHNrPAwTM4xFazt68wKrV3dje7LV1vkKiOsP69KN+3dMFikWeo72727w
         RGFruyrOvnxC5dluSkwX9bwyypwCZ9bBNZ/wJRup+sJGTZcZsNv/TLgmlgqbk7xeoir9
         C6KR2UqUoy4sG2xRwHOQqAYfvMedIgPu6ntuWDwE4x/XgwjiWLP3d73bW2akd0WBRKpH
         RqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787036344; x=1787641144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6S7/HfEeviYM8kMOUgFBBnP6TBKiphaRKUEmhxWElI=;
        b=ZRMnCzAwwsQu7RLmlb/UNjFxjrQoKs0fvPyVMmjDFGipQdd2PMDxJYLXbudgbvrbJU
         GEVd/yffuhmc6/kmYwYzHs8SgkFKivDxVx+3rL+4xUw9Uf2Jha7pMZZ70xdurnSk3dN4
         kCbfeXhOoVDBMsJMV/4HKzPCRP4gpM+8srXu3y1EbIsMHgIh+CWadlohFh30n2bs6c6+
         ih/iCvJeNXa8KFPFgtBxvfk7UnLrgskFhiGX5+hQ9yPXofOzpF/6D/LtH2xfwTcEgMPl
         O/GdEWAVPmm9bmQ6oU07U8W0xyJyE8KcFxchuVZ35O1I4cre4YSFuUaF5bLkiMhFM4ZT
         S60g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6Zrw3J3W/RHjGp7ms4l9YhBg06DtMs8Y6DPdaP3/RS7Cf+JAmqSTghAs7d2yRk8nDcxbH6fe1byqOyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWDGxnfcrD9DMcn7k/NlsjCAA1z9FszNH6dl6p0923bY/H+E7L
	U3nqCPR1Lg3uPeT+zL6Z9MzaoOl6Rh8YxaVr94DGcorqnuwkNC0l4ryA
X-Gm-Gg: AR+sD10s/V5jwVbl7kQNvgzqaCYtFzBv1+gtcH8vUbk1R2U68UTtnKW7sIflddOll5Z
	A3orkDBKJLi0lPhZqk/AU97CmWRpb936QtfYZVP8zs8g4LQnbiYvKBVo/vbKRSrdp89Z4ZgpZUo
	yBOIzzwu6fbbQENl8N1n0hJFazAcDH0+3FHpXBbB2+sYaRQV+EWBUgHReY57pXT6yXT55Pm5Rhx
	fhxzi/RBGIZrowptK+jeRvx2BV7llZ30WsbIcNxJcwVgYWny815nFlmu+RC3hdS1ydkvyWmsUx2
	wL/jIx7Xb7e3oCDCdvbLUFmhqTdLbzSPxJcJGbaQ0GMWp5BT78rf2V8LnL52AQN99OIpLYqw8vk
	QcTRXL7oOTX1rBQhTvEordZzq4u2TvN0o9ty9ZbAZRnCpLEgn0q1QpdvxbWbt4VLHeAwlwBG5pO
	e8G88Ax0UNHCbfBJv9m8tRsA8KfcmHx5mVAWF/lluWEOPdBY08bclfePFc6k/YB2yIe7aS0XF89
	h3OQIyWE6925VS2c3oRXvFzMvHWaMZ7MQU2vnihgRHbD1a3RoFeEWC9HVOpSLLapn/AetZAN6X0
	9rtYhdm8NtWXvgUTJhhAtBXNuPkI6xKPErUnlYB5oBbcsohioAOFrhnBrgLuoO8wrDNBNh/5xK+
	ohaWofMaWOr6wwIXy
X-Received: by 2002:a05:6830:358e:b0:7d9:f50f:9691 with SMTP id 46e09a7af769-7f3de007b61mr31144874a34.0.1787036344096;
        Mon, 17 Aug 2026 23:59:04 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f41beef430sm3599463a34.5.2026.08.17.23.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:59:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 00:58:58 -0600
Subject: [PATCH net-next v3 2/4] net: mdio: link PHY package suppliers to
 member PHYs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-submit-phy-package-fwdevlink-v1-v3-2-40a905ea16b6@gmail.com>
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

Ethernet PHY package nodes describe resources shared by their member
PHYs, but a package node is not instantiated as a device. Its
firmware-node supplier links therefore cannot become normal device links
for the PHY members without help from the MDIO layer.

When registering an OF-backed PHY whose parent is an
ethernet-phy-package node, copy the package supplier links onto the
member's firmware node before the PHY device is added. The ordinary
fw_devlink path then creates managed links after the PHY device has been
initialized for link registration and before its driver can probe.

Apply this to both ordinary OF discovery and the exported registration
path for a pre-created PHY device. Leave the package links intact so
every member, including one registered later, can acquire the same
dependencies. This preserves probe, unbind and runtime-PM ordering
without adding PHY-package policy to generic firmware parsing.

Fixes: 385ef48f4686 ("net: phy: add support for scanning PHY in PHY packages nodes")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes v2 -> v3:
  - Move PHY-package handling out of generic OF property parsing and into
    OF MDIO registration, as suggested by Saravana Kannan
  - Copy package supplier links before device_add() so the normal
    fw_devlink path creates real member links at the correct stage
  - Cover both normal OF discovery and pre-created PHY registration
---
 drivers/net/mdio/of_mdio.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..ff540049b847 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/fwnode.h>
 #include <linux/fwnode_mdio.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -34,9 +35,26 @@ static int of_get_phy_id(struct device_node *device, u32 *phy_id)
 	return fwnode_get_phy_id(of_fwnode_handle(device), phy_id);
 }
 
+static int of_mdiobus_link_phy_package(struct device_node *child)
+{
+	struct device_node *package __free(device_node) = of_get_parent(child);
+
+	if (!package || !of_node_name_eq(package, "ethernet-phy-package"))
+		return 0;
+
+	return fw_devlink_copy_suppliers(of_fwnode_handle(child),
+					 of_fwnode_handle(package));
+}
+
 int of_mdiobus_phy_device_register(struct mii_bus *mdio, struct phy_device *phy,
 				   struct device_node *child, u32 addr)
 {
+	int ret;
+
+	ret = of_mdiobus_link_phy_package(child);
+	if (ret)
+		return ret;
+
 	return fwnode_mdiobus_phy_device_register(mdio, phy,
 						  of_fwnode_handle(child),
 						  addr);
@@ -46,6 +64,12 @@ EXPORT_SYMBOL(of_mdiobus_phy_device_register);
 static int of_mdiobus_register_phy(struct mii_bus *mdio,
 				    struct device_node *child, u32 addr)
 {
+	int ret;
+
+	ret = of_mdiobus_link_phy_package(child);
+	if (ret)
+		return ret;
+
 	return fwnode_mdiobus_register_phy(mdio, of_fwnode_handle(child), addr);
 }
 

-- 
2.53.0

