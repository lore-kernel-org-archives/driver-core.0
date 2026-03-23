Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76C62192FA
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 01:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774230880; cv=none; b=Rk+LQCPjAGWN2EeYC2zvc572ixznB89IcfkDi8fb568X/rqlzkBDhllVChez9zbOGIqEUKSqHgXcBI7bc0K4bGhfWV5nL3wx3uFN8P93QS7/igk4FmbodtdElL+IlZYK7iUoDZ7R2Omnji7F2ruFQzDlvOw5OmvyA/AToQpyBTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774230880; c=relaxed/simple;
	bh=JUqh9KjJr81PA08LAGWLpc/TnqC1KKCJHttSUso4Mis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qBQq2DX8Rr4h6JKR40DxzLSlPgNe4c33Go9/11nH/TTx/y286Zpb/0SxwghPmO7eHzAIJm4njoUTcnps+lTJeJrXlq86AnM/9qDffo27upvoJu88Nurg+iE5pDdx+yDyQsH0PwVl2Qp4lq9cA9qsYzEHHjZAM8txdFA0t3gW9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMvKRurw; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMvKRurw"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c11c43aca0so882152eec.1
        for <driver-core@lists.linux.dev>; Sun, 22 Mar 2026 18:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774230878; x=1774835678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFNqFKHYHzU+/IYMzEM9SYl6am5Pz+NCaLhPwszpQBw=;
        b=iMvKRurw6T5na8aDDg/IbThJzX0Ez7gB+ySJM2bY4k5eXE7SYy7BM8+FaVFYIUOOTk
         mKkMQrGKZeYI8dae7tMnMPWN2fyv+J4Ewy1qFqLTJ5w5NudgrnkWrPBAFuO2BAJNo1b9
         pMANauEErVLvzT8jQYePQCN27HKGcdN9rtdTA2MCD+s0sxF68U9xXLeRekGdKOt9zzPA
         VSY1KH5QTmQVkZ3cadckKfuR2FLu2I5eQl7kl9w3d1JYijYM/12GafNAp+E+UysnzeXB
         mGLHYDbjpqKQ43geGHlAfJGQxCgJLtYg3gQVu2N3qISGfmwDwOfJHvjE/efkdmbqMxXh
         J+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774230878; x=1774835678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFNqFKHYHzU+/IYMzEM9SYl6am5Pz+NCaLhPwszpQBw=;
        b=ZnUCt4xvlsJCvdXtOh/y5LOFPEUYy1AB7fX6TJuWPUON0mscB9vBN0DHPat2TWLChY
         SrOZiI3OdoSYDyzFQ52KIVywJnwavdIn/DfMfmFeQXTPJhEBJ0/7OEUb1Lc8C2X5wQRK
         aDmesNsciA6DrP8OicwvgY9Nmw10+S7k4mDUSz6XcKvrYsJNkPccmVX7rHVpUsICuxVQ
         M0CzQnj01vfaK3QWgsSWcStqDMrwkUahMyCBjn/KmoAzEo8CAdk5ZxumPkB8l75jpDpB
         /RzQbOydoXKjoiPoZ4Occj1cLIf6jUN2+XkRrF3FV0usoCXDtYtoKw0yB1uJIzsxJzcS
         YKhg==
X-Forwarded-Encrypted: i=1; AJvYcCWtPuy17aTOBX1J+EczfscQs0PURKU7XSW8GxE1efznIjaX4I/lcmEPESa1DYnCEBx3bikWRIvjvnn4KA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5E/sNFNTa3OXhOFEbcGcNURESWxlIu6hCyqOCKktIWLNJS0Ia
	8QkQaCD3yAnYgOk9HNffECXKTZO6wydj/UeOI1v1sovhMjjoJ3zkaiP9
X-Gm-Gg: ATEYQzxM1czp/8GaBiK3d2K1oAfUSmJWc9q8ob8AZsdKaGS+DqR++3iKqo39OfhT7XY
	zkvvhQDwqIe5RhcyMCSxXGJPvBiwYUGhMsQ0DaXThDaYi6RC+iFTas7LNtWycej5y8rhr39zqX6
	5P5Q0HvjabRlgRnTzbOLnYHEJHKedRYZOWy/JqnODN0XV+yCNZYit6P4AD4V0OEL0sk1Jur2rEr
	Pg+CV1cw5s98O+W1aaLq43VPp3ReRxlmN2WQxtV+MfYdGqjkQAuo9eymKCiD53KExc6w9shUu0t
	3qhhpEP1ZLCkcmplz5K6k5AWN2Rg/W9T3uTPt6llvVoWu7hJkcew2Q2x9J/gsHMUwnK0yiSIRYr
	8YvgzMteGZe1KrgxLgSw4kKXNIRGVogblGU/tOkRD6571tg98aIgOsHpdQVe7gF9fGeBm00PgKc
	FoyDqvUdcsJXtOgkmbMuUnEG22dluFeAhV2Rk4CEBEarVAugPZ1g/EbIPtoUBFXMjXib7oxa3Zs
	XkWwiDB0684+gI=
X-Received: by 2002:a05:7300:571e:b0:2ba:a1a6:c73 with SMTP id 5a478bee46e88-2c10974ccb6mr3875035eec.6.1774230877711;
        Sun, 22 Mar 2026 18:54:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b2cf068sm10976952eec.22.2026.03.22.18.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 18:54:37 -0700 (PDT)
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
Subject: [PATCH 00/10] Remove class_find_device_by_of_node in favor of
 finding by firmware node
Date: Sun, 22 Mar 2026 18:54:18 -0700
Message-ID: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260220-remove-device-find-by-of-node-077784fa109c
X-Mailer: b4 0.15-dev-a6826
Content-Transfer-Encoding: quoted-printable

Firmware nodes are generalization of OF device nodes and generic APIs=0D
should offer only fwnode variants instead of providing firmware-specific=0D
handlers.=0D
=0D
This series switches all users of class_find_device_by_of_node() to=0D
class_find_device_by_fwnode() and removes the OF variant.=0D
=0D
I believe this can be applied through individual subsystems and then the=0D
last patch can go into the driver core.=0D
=0D
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>=0D
---=0D
Dmitry Torokhov (10):=0D
      net: wan: framer: switch to using class_find_device_by_fwnode()=0D
      phy: core: switch to using class_find_device_by_fwnode()=0D
      spi: switch to using class_find_device_by_fwnode()=0D
      regulator: of: switch to using class_find_device_by_fwnode()=0D
      leds: led-class: switch to using class_find_device_by_fwnode()=0D
      mux: switch to using class_find_device_by_fwnode()=0D
      net: phy: switch to using class_find_device_by_fwnode()=0D
      fpga: bridge: switch to using class_find_device_by_fwnode()=0D
      fpga: manager: switch to using class_find_device_by_fwnode()=0D
      driver core: class: remove class_find_device_by_of_node()=0D
=0D
 drivers/fpga/fpga-bridge.c           |  4 +++-=0D
 drivers/fpga/fpga-mgr.c              |  3 ++-=0D
 drivers/leds/led-class.c             |  2 +-=0D
 drivers/mux/core.c                   |  2 +-=0D
 drivers/net/phy/mdio_bus_provider.c  |  4 +++-=0D
 drivers/net/wan/framer/framer-core.c |  2 +-=0D
 drivers/phy/phy-core.c               |  3 ++-=0D
 drivers/regulator/of_regulator.c     |  2 +-=0D
 drivers/spi/spi.c                    |  6 ++++--=0D
 include/linux/device/class.h         | 12 ------------=0D
 10 files changed, 18 insertions(+), 22 deletions(-)=0D
---=0D
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e=0D
change-id: 20260220-remove-device-find-by-of-node-077784fa109c=0D
=0D
Thanks.=0D
=0D
-- =0D
Dmitry=0D
=0D
