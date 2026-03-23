Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012FD225788
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230904; cv=none; b=Hu8taOuKfeVT/pxKYH+kOsXYglYB8SCnnD+Ed0iV+yw5UrCkkEUkOQhBccykZ6hTaCGM1smDhHzRePgti2H0uLD2Ek58O5azl474H8vAfQ2rkZg2ygLlc432KEadwfAMGv+RpakZO+E9QfgH5dZqVFZqIPTJHdOF/EpRJ0lln5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230904; c=relaxed/simple;
	bh=I5fS+FwbEw0P5vASCqinmGTcQr2XqJ+MU7isqg4KgEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iTzkYh8PcnT6ejwDuhaSuFZUfGGNLnhBKReiA80C3IWxcra1vSWipmxIhqxiwLdRQqNPSLCuE5zJ8pjbuqoeleGT4FEdtZs50WJ/3IZCWU/b53KArl1aXlHQOPdP8EaHisVv6BqGhtZgiiHBopj5KUCP3cNe7hJPrf1ZQ/kJ+qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoQQNm+5; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoQQNm+5"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12a71ade78cso2804611c88.0
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230895; x=1774835695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfkDMRyvNYwOzv0q3wBq2OUYpD97VO+f6771zL+oLTY=;
        b=HoQQNm+5J7lH48Tob/ywe1wNEJtEoFM8nzchjzg/PHO64y2vnLKhgovLedQX8wRBGL
         3WK9soDhc4/62llc9eqJO9Sp6oXtA5tiUoSDVv6K5eDxAhx+jWqQGyLTG6vhHR0sVwUH
         uIAOy6bKX0hPyH0KQSBUQ9Yg2FrlVve3OEVfU5+eJBLkS/KVcQkLmWw7ipzjilDILWx2
         ObZvQLfqEgPOIcq3jLFITRNZMil4Xp3BfqyM/g9zyTQH/C6ipq+8zkOQ2trt+BnJbUV4
         EBvs+oeaOpPk4FCmrPdKkopcD/30N7Ip087KjXHENw48Qj11pYU2fZhvsTwiRZ9lO4LR
         MVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230895; x=1774835695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfkDMRyvNYwOzv0q3wBq2OUYpD97VO+f6771zL+oLTY=;
        b=TVLwijgC3z3rQh+TFct/382mjxxbrhPiafL+3qFkmMXmcufXoafwJcXrou602W5c1y
         hSlYFUlBtbEyaOWSrGDTL4JDXQooGw/gglrNAq4IHkJeWZ4zxAVAIZcIYI3aGnsJovGT
         DuAWMeR0oyg6qrhKBNAg65kF1YfLSv84q/GNBwdz/ZJNbE9mmiMscI/QrRCXXWFuZqdG
         3PJMy31eXL9Quq4gUXMC/AIqE+x8a8zLCQg/wKaB8P3pPPm/TsNhqzwmx32MxN4Sm1hV
         3kUJmak0lvITj39XCTLOQre+o/AYc5pGd5UA/gJW62hAjzVdCZFPxkoqjrK360K5JMnl
         tjOA==
X-Forwarded-Encrypted: i=1; AJvYcCViGMXEN/KLw7q7fqWFm/KsbiQR0ILt01YKIujkL3MBA/lxYKrAV3oXH4rpfxMNhUEJJI16N8P4Waamhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzcfc7WUt85CqGFrPVwsqJ55TY3/DG6JRGw23gYoqIqgjzI3axl
	43HmJ6CC2X7ZgUP6wks6/GKa7BmVVdV7eyEbBIccjiZuRa9rjnvI0tqT
X-Gm-Gg: ATEYQzxM1EgEbwZvqqaJuqAMt+2hH8L7T6wT6VUu7oETtAY1k6YedO7h7ATqafDeuxb
	3O+dhDip6eXqOIaVXchgE0EQGCYKzLMOwzrHor4il/AA3EkD7FXy2HLzxAuxyLIazMA8EnlTNVQ
	0E78V97k+Z9m3EoEIpFIBDATlFZYdkpP9bqwZjzXA1rnUa59Pn6FOgjI4P83oYnFCboF2qxTIGE
	MMKUhrHFrACSKHX1+PMaiweKqgW4PjtKpffUM7a3NaRZ8RdjRP3W32deit01RAC3cP0B7ZfsK9B
	3d2u/vV+87zCtFEYrKzc2ZPsKPopes8TPwYmo319eAgfpn6zxRfDNQ7EnYwS5xFK/lrPCNGeSXc
	KhLMSwG1NV9MvsYZU2mylr8SM0j+DZjpGGUt4wsJOaIPylRVjakZ9oftvg3wuSh9e6E1OoEdJXk
	zYhmgXh2+Gc3aiBlMjhdTOaLcgMtwrO8Vt6BWLrWFRKzpt0u0GWc4YOsQ8o7SiGNoL7wNDCzt1X
	TRs4cJlnxWn6WI=
X-Received: by 2002:a05:7022:3846:b0:12a:6b99:1ad4 with SMTP id a92af1059eb24-12a72684aa1mr4380934c88.11.1774230895127;
        Sun, 22 Mar 2026 18:54:55 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:54 -0700 (PDT)
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
Subject: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Date: Sun, 22 Mar 2026 18:54:25 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
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
Content-Transfer-Encoding: quoted-printable

In preparation to class_find_device_by_of_node() going away switch to=0D
using class_find_device_by_fwnode().=0D
=0D
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>=0D
---=0D
 drivers/net/phy/mdio_bus_provider.c | 4 +++-=0D
 1 file changed, 3 insertions(+), 1 deletion(-)=0D
=0D
diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus=
_provider.c=0D
index 041576eba47a..ed3cd9a37c67 100644=0D
--- a/drivers/net/phy/mdio_bus_provider.c=0D
+++ b/drivers/net/phy/mdio_bus_provider.c=0D
@@ -21,6 +21,7 @@=0D
 #include <linux/mii.h>=0D
 #include <linux/mm.h>=0D
 #include <linux/netdevice.h>=0D
+#include <linux/of.h>=0D
 #include <linux/of_device.h>=0D
 #include <linux/of_mdio.h>=0D
 #include <linux/phy.h>=0D
@@ -754,7 +755,8 @@ struct mii_bus *of_mdio_find_bus(struct device_node *md=
io_bus_np)=0D
 	if (!mdio_bus_np)=0D
 		return NULL;=0D
 =0D
-	d =3D class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);=0D
+	d =3D class_find_device_by_fwnode(&mdio_bus_class,=0D
+					of_fwnode_handle(mdio_bus_np));=0D
 	return d ? to_mii_bus(d) : NULL;=0D
 }=0D
 EXPORT_SYMBOL(of_mdio_find_bus);=0D
=0D
-- =0D
2.53.0.959.g497ff81fa9-goog=0D
=0D
