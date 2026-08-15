Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6315B1E5B9A
	for <driver-core@lists.linux.dev>; Sat, 15 Aug 2026 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754919; cv=none; b=rDkXg98kfoZ1z0mIv//cK6PwSjJavthQsMrv07tqmEgX9GAJPSv/SY1s/4+vF5i9IstmRfDJa7yQQ0jcr/RlmNAcYM+qitpOxq5qHjV2TC5jd1ZvlHJ7F58F5SsZBZo37EOUDuL8/gGM3TmZshWgXO/HmO8YhcSACi37xcna8NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754919; c=relaxed/simple;
	bh=hHP58Dzogqq3qk/iH2DesTInIac5T9EHPwPG0TV9ehQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gossEKQjLSW6rLvbQ35MqLlBkjBvPhUdfMhEIK5E7iiKmbxfZLcujrl1KvXpgygNr91lcuHrucwEwRo4kG8o3jCxrsfaMOATQSdWYgTvzWrPg1LKP/2zp6+tcnzfeOTQUmvGf5CP3PTtp6LJhDGN5cpcb3V+HzKRFy15oE1eiSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaEnaQj/; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaEnaQj/"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f39cfb65cbso1187318a34.1
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 17:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786754916; x=1787359716; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qyi3VLCoapD+ocuJZoWd2FVKtPCQz8fzYPrWe0rNHc=;
        b=UaEnaQj/76gIF64WRFyQ4qkPdJUVaCvr0NCWsgMBcT5+jsMK0Oa1x9HykS5zwGOpWP
         3ZIvYERDWf1unP3tPA3iU2FDty/Egz8lg0Q5uMS/4qHQmD4jzbno38zFXCPACz01uuXC
         4ohC/ti2QYCHu/qAZvXglnKrfSG8bqOoide4cksgMcQlQl01l9g+m7hWaNA4ei5dR7DO
         8/5eBzKMZFSxDLbK63luKHScE6mbu2yonIS1DbFO9+crmqHjIAaPpMRR879yQNnpIw2Y
         rP4iHYpcxsfTkK3qZbutVYGgkCM5iPAcVIJSGZKhfkGUBU+RA23mSav5T5fcRilhuUzu
         lznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786754916; x=1787359716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5qyi3VLCoapD+ocuJZoWd2FVKtPCQz8fzYPrWe0rNHc=;
        b=irzfyyNam+lhqJB+6qBiVdFwXfUjn/Q4+r5Ss4o797/3+Wxo6MsS1g5E9LrLsceKg4
         Wj/Tf8wzRGNxKjW2ZmfzunOTT9/R10Wz4T5UMMY4VX5PpJles6yyZ2q89FqEjJejOhp1
         tO8qPZXCRJ9wMyW7r+LNS4VR32Lncp2y4Kd4X0BuDlLELiT2yR3INfBMXNpaigKz9L+H
         4kIw0iVXT8lGrgPvWwjlIGTrtVODsgTPu9unlq+tCi69UAxfQ7r1mmdXlTx6xB3otK4N
         7dasGsbH3MXf3ul0UsdWCBCyhEKNrZMmudnYqUwJCSi0cAPfaNiECDOpkfgh91AezHof
         eUtQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Q5rSGlDDoTgTaOedDoLQoeYnx3AqJNe3IibvsPFPpT8q/pTDa6w/o4I7hB2pNWaq08HeFm6f1ixgNA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEF945ejYPk5j5EQ6tagF+jh7BZu9tKiNk+1QivrZ9kcz7zsca
	V5ICg/X9n1AviBERlhZFj4WiR1X7ialAq6TU3Qik40X4XzjubXcLOjiD
X-Gm-Gg: AR+sD12TVX55dzpQ8LRy0xqiES8cUUnnhUVsil4S6aOLFQuPhV6phdmcxd54OsSPw6D
	lJvEv+hGwMAqDM/ki8eg9g+WIVMTYrNHV6ZdKoxxVlWhOMis3KQpCSF5Q1DvSrcskrUD8NuApxc
	EO7itJULttHe2Ue9EnCHmcogEfKiVX1qNPSrHNNHoVK3777gSA6DzpRK7Z6xTyiR17iYxa0Ko+T
	Y72pzzpYWHPuHfj/pJmopEb69munpDF58IXvFiqNIf4jwO2twIih6drIZhyBbJLvAGeba5b3r2J
	buyQc8En4hw/XoU02K/7i/l7bDS5PQxzEUNky8bKASy41wrnlUm8jfoLz03UMVzHxx538iYB+r5
	2MgxcY/IKxCVxQWzlE/QmzZu+/kg6haK1/8De+wReve2M3AoNsbz+RNEVI4UQtC1IMj/RsquUXk
	WjanZS8/Mr049fDsr7RGawJBoECbgNpyLZPiQoqGWgws87TAnwVGnY54qlZzWK5gHKGJ5xgfswr
	O/AURaxmJLHJjF3zBUETZQfXuu9zKmxF5dxy2E+XZBBvS14mGdsHe6SJRo8qz1KqIYgeV9Jqqrh
	6OSMFIirzEHMCviwX+sQ0HnaJ3YfwVeUCyvY3x8WA01R5TRzgKWmufb3aYkPhxlqBMjozc2Q5md
	5Si6/HKGLbVokIYdd
X-Received: by 2002:a05:6820:4def:b0:6ae:4d57:a5fe with SMTP id 006d021491bc7-6b0d6a8e814mr8699779eaf.20.1786754916100;
        Fri, 14 Aug 2026 17:48:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d9574d7csm3240730eaf.2.2026.08.14.17.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:48:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next 0/3] of: mdio: fix fw_devlink for Ethernet PHY
 packages
Date: Fri, 14 Aug 2026 18:46:14 -0600
Message-Id: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ6CMBREr0L+2p8AKoJXMS5qmcoXLU1bK4Zwd
 6suX2by3kIBXhDoWCzkkSTIZDNUm4L0oOwVLH1mqsu6Kdtqx+F5eUhkN7zZKT2q/DCvHukuduR
 U8aFRrelgsN92lC3Ow8j8K5zIIrLFHOn8X7LsBh2/AVrXDxRpqZqNAAAA
X-Change-ID: 20260814-submit-phy-package-fwdevlink-v1-76a8f9efe539
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

Ethernet PHY package nodes describe resources shared by their member
PHYs, but the package node is a container rather than a struct device.
fw_devlink therefore represents those dependencies with temporary
sync-state-only links from the closest existing ancestor device to each
supplier.

For OF MDIO, that ancestor is the MDIO bus class device. The bus is
driverless, so its proxy links never reach the usual driver-bound
cleanup. They can remain after all member PHYs have probed and
indefinitely prevent suppliers from receiving sync_state().

Fix both parts of the lifecycle. First, factor the sync-state-only
cleanup already performed by device_links_driver_bound() and expose it
to frameworks which populate children below driverless devices. Next,
treat each enabled member PHY as a consumer of suppliers referenced by
its package node. Finally, call the cleanup helper after successful OF
MDIO population. The real links from each member PHY retain dependency
and runtime-PM ordering.

This was found while validating an X-Powers AC300 package whose input
clock is supplied by PWM. Before the fix, the PWM driver reported that
sync_state() was pending due to stmmac-0 even after the PHY had probed.

The complete fix was tested on an Allwinner H616 board with an X-Powers
AC300 PHY package. All five real supplier links targeted the member PHY,
and no proxy link remained on the driverless MDIO bus. The PWM supplier
reached state_synced while continuing to generate the PHY clock. The PHY
negotiated a 100 Mbps full-duplex link, 8 MiB was transferred in each
direction, and 100 consecutive pings completed without loss.

Validation completed with:

  - arm64 defconfig object builds of driver core, OF property and OF MDIO
    with W=1;
  - strict per-patch checkpatch checks; and
  - the H616/AC300 hardware test described above.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      driver core: factor sync-state-only link cleanup
      of: property: link PHY package suppliers to member PHYs
      net: mdio: release fw_devlink proxies after population

 drivers/base/core.c        | 74 +++++++++++++++++++++++++++++++++++-----------
 drivers/net/mdio/of_mdio.c |  5 +++-
 drivers/of/property.c      | 14 +++++++++
 include/linux/device.h     |  1 +
 4 files changed, 76 insertions(+), 18 deletions(-)
---
base-commit: 3da8c3c8b8fa99505624b65ef590482f48e766b6
change-id: 20260814-submit-phy-package-fwdevlink-v1-76a8f9efe539

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

