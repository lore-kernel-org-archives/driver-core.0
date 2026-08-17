Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692E13E49C7
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924842; cv=none; b=crlkJKKmB6Vucd8uB5Yf6BsPofYQ7HsepVqucklNMPEWVPogi19KrUgK0lozRDY1n+CFs9B5ooc5UI345FomF90vhSOOvzvG1RzWT2LJIOgO4poy4oS9ZCKxZA+6K9ejKiHRCWMymvBMJBcXkEp3GgwS6ckL3QsXHr+hTQwkKks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924842; c=relaxed/simple;
	bh=LS22LcmEJj8e3kqN7yGg2uzjNvP+oUDHt1HXDKQHKRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFDiQFAPLRBoXvu39Je4jA4/fIJ0o04EbIXPRqz4Bt5yfWBTo+S3j7phY7sSJajI9xI3CY+4SkxMp1RExwF2ANKWoBYCauVLalorhIpJY226DQmNnJkg2fDyhyo4krcVsp8KUGzLFNM2S8oPDhHzdrSiXhMrxkkGUjOaTqZRta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJnxbGMZ; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJnxbGMZ"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-495c49f8eccso1687235b6e.3
        for <driver-core@lists.linux.dev>; Sun, 16 Aug 2026 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924839; x=1787529639; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhr9mz2HpwDudTQs8av6vCMLVNHxqCHiSdPs5GamCT4=;
        b=NJnxbGMZukrDJtloyi2+UvC5Sp5xENOv3C3VEHJ8pSQkTewhfNqJLTkPmcgngbpICC
         FJQwEFBG0ruPql/eAhcO8JBkzeSytiX6twmA1CJTKGvT+6G8T1aia0HGo8UtfkxLgEA7
         F/fAeMsYdJqsxSADL2y7jS4n77Bk8Epj2tL6w814SsrqvmXy2qeAD4YIf1/DnbuGhaBI
         DG6ujj+gGlrjSddO05dT2MtjR1xRZT7tLir19XScgJjY3LKzVNsvGYjxxL7Dk8kFH6cx
         QPdH2V6bdq5uNU9fAvc/JMY+9LFX5ICncmvNN5mW5deCUtSI7zjbmsoW114oKtKhhtiD
         ZbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924839; x=1787529639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhr9mz2HpwDudTQs8av6vCMLVNHxqCHiSdPs5GamCT4=;
        b=Ia5Xt/7Cx+Kkg5X5Xwq/2i7/Ca+oPW6g7VKQ1WOC0QdkFms1VJTQ0z3RdAzlXS1E2h
         GTndGRBCJnXkvyrH1wdpyj6g+eN389sLR5MigO3poi0CgPUCuEwX/AD+s2t3u5bPBuwR
         X6ybVIznCdvFGu9eaeIR8xqro3chs5fy7OMVMHqZvAe5VQHDrYSR9MsiWAqiTxLC9dXk
         /j1yLnboapV+jcFVtzzcdu9Gceij4ieD7aC+OGCd2ImbQoM3EwSFSD4vvp5On1tGOlGX
         BxukAEmx22pnu7YQrlY4Fa71zlUdha9s1YagkxIslRPOEPNWZJqYwkOdFiZRsFFcDQvr
         bnYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrIg86FIvsGUuiH6NMcemUmQ7oz5dMZQjtAyOi43bBoKCHEyMOdU6Z1JhcTKK1VT8iaFUsa/qvY189hNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWvFtC8WTpwdss8v46Jza9lOodj04QqlsjjJIdjZiMvyj2O9gd
	6R9xVDMOmUqW6BH6zx5ZYJEmO6Mln3BsNadZi6vGi4o7ZmMMhgpzQEVB0F27Iw==
X-Gm-Gg: AR+sD13Qp80kRjkSIV7yGZheErytSYLGFHXlShtw79YZ/h3ABIZKwQ33IpGnVZnpj3R
	O5f7nWF9sXuaCFZZVjoBDm4mKnCg3LeYANuJu9b9QTF//iSphFmqIGr3J5IcUFLw23tG1G6Q/C1
	mYil9nQrSRbJXOXr66d8S30KKOSpyusfRZ4ih2mQ7WwV/sFOKvlvtB9Id5Zb0xya0Dhx4Q+g23x
	QojYcllUlnKD3ld/6JQMd1zuMxtQM0xDxvREMH1Z1BrHfimYftF5lOv9RLNzFE1dfnWlbqfbrBg
	HyOmXI40KqdOo8mvbQuYJfTYu4ZLLeNFo2mU9P1uUSf6paTOvW33MCLpi4ijRthCNCQFJ2yBQ5+
	PP8EQ1HCDTfa/Z17skjc+4BvYc9b8JqSRl7nSBGcX1ufl8dhFSHdFah3p0Ps8BPyk1sk8aje3Mn
	aB6pZOVP4E/l75bMNw55qmVd7UEKAGQgw3qZXFP33RqSsIQk8ND/kTd7R3cjOThyDOhHujBpUCn
	o5jGb4yi8EeC+pucXJl/bArjUywGdDEwy7cA41RosVUEGZBrE80BvbLAmBf3NQdiCFiKs3FGB7G
	XsYx/0d9Yl6zQJWWjkz/C0pr5ouhx3IKG6hLX9lAlzbfbxputAcAHivdTHyJSjyY1AYHsX2L0it
	QsUOFpRt1td8wctsn
X-Received: by 2002:a05:6808:1486:b0:48c:4c00:596a with SMTP id 5614622812f47-4b2414ef9ebmr23059139b6e.5.1786924839124;
        Sun, 16 Aug 2026 17:00:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:30 -0600
Subject: [PATCH net-next v2 3/4] of: property: link PHY package suppliers
 to member PHYs
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-3-23e55dd59fad@gmail.com>
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
index 38c0c7dc428a..d59bcb1f29de 100644
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

