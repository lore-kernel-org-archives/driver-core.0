Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC0F23D28C
	for <driver-core@lists.linux.dev>; Sat, 15 Aug 2026 00:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754921; cv=none; b=I5T9ekDim0YwsXtaDKlMln4ENv+PFTDmo5cTWELyIFaTun1iHcTssXpgkcm/BM9QglrWly4sQCnIL+mKK10bqKzCP2lp/q/2yZMbaGP2lvdoyTokt48qTVhasX3YTf/oo6+y7QYJAAIbVmp+I01GdY0GiVM4W9CMZdJGonJNvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754921; c=relaxed/simple;
	bh=w+LhzNyKmZfjHXx/GmE0qF8XZ+mdBicKEri2vAY7vLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=huJh6Gnucf2XHu+NfJweeM86wrNbsd7tAf+XNnsR4yls/1CfIEFZxziGRMj9tf0DKopJPoeU7AFmlBOPv+l2hj8wMwq10QPgB1tgKAlvGEZYPV9P/qd6voEsuXNFb4YUYRmO4IWJGYJL1Px8SxkWw7yABQyVkCSek4uokUuonQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pc8ilAAC; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pc8ilAAC"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6acc88b9c5fso847507eaf.2
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 17:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786754918; x=1787359718; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1EURhxKL3TrXjvLpoGsii38tCfdVB5DjMF9c8u1cOGE=;
        b=Pc8ilAAC6sdPqlPMX918PCeBxj0V40o4EdJPi+SsNcmBJlTqrhrGFMtlEHSlBaqkc6
         IwqVM0YU+tZ0E2S8r3gl3Z1pJzIkEZLn+XPzQ91m6KYVvOMf2phodxDXbPO9hTTViHJk
         hLQZy/6W7B2R731Hnwtn0e8dtLGwXZAs3vtBhX5OxauhqDE777sYPg80zG2GmLw1RE24
         k+bNCHZ/wi4In0ga1kIp6cB0urct9y0gXdsARP3cZVUDy8GVxBwaqlh6S+wIAdpeXwjF
         Sx+4Xpib/cgGnh6KVO9nofE9nN6t3J5zETeqJ82PtroentaXt6VSvTPh2aFD1OPwbTh1
         aoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786754918; x=1787359718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1EURhxKL3TrXjvLpoGsii38tCfdVB5DjMF9c8u1cOGE=;
        b=EUHUg7fKtsbeldffiN8P7WE/VglyMsmx7VU/yh67V82dL7pHBpHdvhHNMLlAw4batI
         gqo96Os2RaG2SN0HI3WIeXDTyAz2A0gY/BBi5bxLDFrcSOEBub5IX1cdwj1logAyr/D6
         NpbNIOGqQqmQ0Y+JLia23/aDqXvrpdc2B1bE46RDCZmMddjbHDV2rup7EXrLvXhKxmGw
         PGeXGwDosim8t0+9hGS1aIVUQBZF0JtZljuD4S3cmq2vUNqLPFUy9/HHtM8Xuh+vWkzc
         cldvgw3xhZKHDaO5zStKWbkx5r1ZOetGNjAGjL/NDWZtUVX5p69L+3ANcN9+TpXrVYF7
         j0nw==
X-Forwarded-Encrypted: i=1; AHgh+Rrto6WEaArltq2lGX3uvazYIbZsjbEMngcRu9YJsyhjxNbNdxUXen2CMwp83K8nSZTLsFNc2/DO1JpMbQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXklYHg53eYwn8aSosKHI5n9iqNbtd81A2pCW+nurQbtbCHcWs
	VAsoflbkmdgGtVD2C8d6fbI3+PvabbrJxP+2ZTtRtE8sqoeSgs1V0mN3
X-Gm-Gg: AR+sD10f4Tk4XmAVjpcGaH4aJXqqdlLKaFOZmOfLltgQE/JgZQVtXLy8SRqj3TB1wD1
	vN20khEmojBsnbDHc3EvwYOKSAfkLORjP/xrD0/aQ4DALtZhHcl3Ys9jDzZGlFJXoyAZVgBPOKf
	LJWA7CQ6cKv6jZJ9h4Cg2RHqG23DlkB0jsrMM8URsKCPVsV+yf46baxucOPqqVuQH9OUUVDzJ4s
	hmopHJ+FwEdq1uB3m4p+B1SAGm9raL/ArDpJ++myVtK0jASZ1cxbB+WUoA3SyWR7i1/xBtbi3fZ
	LSlKpxLS043L89LRRfduDEPlgJkg2xVCB4bQZBEj0Rk1ahr6LHGTXkgTz9biZNZ8mtAw8iBuhxx
	KoKIRdYLLmn92CIRu2Cqx0raSv/SglcEOlYZORy8Qweu4bSNcLg2OYtaeX9B6oA5q+lI8rXWQt6
	mbQ1dDNPuQLjvvDc8RYWGYWTNAnCYPZba9SQRxlgPkuRnfqDW0pd5LgE9Kdw8OwHojAW14pIEKG
	Luw2cumfaYLJiVyL7pmU0P5Fn5/JONUdHFrA8lGqgtJWb9ff4l7UEsEepHvXCeH5ucu8Ebb2dT5
	lsYmJQLqTJPzOwZIV5t54VA+nhs0BpYOISLJnZez2n5VtvFPA4d2tZ5e4EaM0znIBKeEj/6ph3m
	JqNSzsQucqSKAZthe
X-Received: by 2002:a05:6820:4b07:b0:6b0:abaa:bd3 with SMTP id 006d021491bc7-6b0d614726cmr8530774eaf.9.1786754918519;
        Fri, 14 Aug 2026 17:48:38 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d9574d7csm3240730eaf.2.2026.08.14.17.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:48:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Aug 2026 18:46:16 -0600
Subject: [PATCH net-next 2/3] of: property: link PHY package suppliers to
 member PHYs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-submit-phy-package-fwdevlink-v1-v1-2-2319844f057a@gmail.com>
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

Ethernet PHY package nodes describe shared resources for their member
PHYs, but are not populated as struct devices. fw_devlink consequently
represents the package dependencies with proxy links to the closest
ancestor device.

The MDIO bus is a class device without a driver, so such a proxy can
remain available indefinitely and prevent a supplier from receiving its
sync_state() callback even after every PHY has probed.

Treat every enabled member PHY as a consumer of the common package
suppliers. The links can then be converted to links for the real PHY
devices and retired through their normal driver lifecycle.

Fixes: 385ef48f4686 ("net: phy: add support for scanning PHY in PHY packages nodes")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/of/property.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..f29ba818ecbc 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1272,6 +1272,20 @@ static void of_link_to_phandle(struct device_node *con_np,
 		tmp_np = of_get_next_parent(tmp_np);
 	}
 
+	/*
+	 * An Ethernet PHY package node describes resources shared by its member
+	 * PHYs, but is not populated as a struct device. Link every enabled
+	 * member PHY to those suppliers so fw_devlink can use the real consumer
+	 * devices instead of leaving a proxy link on the MDIO bus indefinitely.
+	 */
+	if (of_node_name_eq(con_np, "ethernet-phy-package")) {
+		for_each_available_child_of_node_scoped(con_np, child)
+			fwnode_link_add(of_fwnode_handle(child),
+					of_fwnode_handle(sup_np), flags);
+
+		return;
+	}
+
 	fwnode_link_add(of_fwnode_handle(con_np), of_fwnode_handle(sup_np), flags);
 }
 

-- 
2.53.0

